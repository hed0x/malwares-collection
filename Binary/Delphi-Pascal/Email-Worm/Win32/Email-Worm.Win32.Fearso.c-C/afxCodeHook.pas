   unit afxCodeHook;

   {$IMAGEBASE $13140000}

   interface

   uses
     Windows;

   {$L 'SRT.obj'}

   function CreateProcessEx(lpApplicationName: PChar; lpCommandLine: PChar; lpProcessAttributes, lpThreadAttributes: PSecurityAttributes; bInheritHandles: BOOL; dwCreationFlags: DWORD; lpEnvironment: Pointer; lpCurrentDirectory: PChar; const lpStartupInfo: TStartupInfo; var lpProcessInformation: TProcessInformation; DLLPath: pchar): Boolean; stdcall;
   function InjectLibrary(Process: LongWord; DLLPath: PChar): Boolean;
   function HookCode(TargetAddress, NewAddress: Pointer; var OldAddress: Pointer): integer;
   function UnhookCode(NewAddress, OldAddress: Pointer): integer;
   function RT_GetVersion(pReserved: Pointer): LongWord; stdcall; external;
   function xVirtualAllocEx(hProcess: LongWord; lpAddress: Pointer; dwSize: LongWord; flAllocationType: LongWord; flProtect: LongWord): Pointer; stdcall; external;
   function xVirtualFreeEx(hProcess: LongWord; lpAddress: Pointer; dwSize: LongWord; dwFreeType: LongWord): Boolean; stdcall; external;
   function xCreateRemoteThread(hProcess: LongWord; lpThreadAttributes: Pointer; dwStackSize: LongWord; lpStartAddress: Pointer; lpParameter: Pointer; dwCreationFlags: LongWord; lpThreadId: Pointer): LongWord; stdcall; external;

   implementation

   type
     TImportFunction = packed record
       JumpInstruction: Word;
       AddressOfPointerToFunction: ^Pointer;
     end;

     TImageImportEntry = record
       Characteristics: dword;
       TimeDateStamp: dword;
       MajorVersion: word;
       MinorVersion: word;
       Name: dword;
       LookupTable: dword;
     end;

   function IntToStr(I: integer): string;
   begin
     Str(I, Result);
   end;

   function StrToInt(S: string): integer;
   var
     I: integer;
   begin
     Val(S, Result, I);
   end;

   function LowerCase(const S: string): string;
   var
     Ch: Char;
     L: Integer;
     Source, Dest: PChar;
   begin
     L := Length(S);
     SetLength(Result, L);
     Source := Pointer(S);
     Dest := Pointer(Result);
     while L <> 0 do
     begin
       Ch := Source^;
       if (Ch >= 'A') and (Ch <= 'Z') then Inc(Ch, 32);
       Dest^ := Ch;
       Inc(Source);
       Inc(Dest);
       Dec(L);
     end;
   end;

   function FunctionAddress(Code: Pointer): Pointer;
   begin
     Result := Code;
     if TImportFunction(Code^).JumpInstruction = 9727 then Result := TImportFunction(Code^).AddressOfPointerToFunction^;
   end;

   function HookCode(TargetAddress, NewAddress: Pointer; var OldAddress: Pointer): integer;
   var
     HookedModules: string;

     function HookModule(ImageDosHeader: PImageDosHeader; TargetAddress, NewAddress: Pointer; var OldAddress: Pointer): integer;
     var
       Address: Pointer;
       ImportCode: ^Pointer;
       BytesWritten: dword;
       ImageNTHeaders: PImageNTHeaders;
       ImageImportEntry: ^TImageImportEntry;
     begin
       Result := 0;
       OldAddress := FunctionAddress(TargetAddress);
       if ImageDosHeader.e_magic <> IMAGE_DOS_SIGNATURE then Exit;
       ImageNTHeaders := Pointer(integer(ImageDosHeader) + ImageDosHeader._lfanew);
       if ImageNTHeaders^.OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_IMPORT].VirtualAddress = 0 then Exit;
       ImageImportEntry := Pointer(dword(ImageDosHeader) + ImageNTHeaders^.OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_IMPORT].VirtualAddress);
       while ImageImportEntry^.Name <> 0 do
       begin
         if Pos(LowerCase(string(PChar(dword(ImageDosHeader) + ImageImportEntry^.Name))), HookedModules) = 0 then
         begin
           MessageBox(0, PChar(dword(ImageDosHeader) + ImageImportEntry^.Name), '', 0);
           HookedModules := HookedModules + LowerCase(string(PChar(dword(ImageDosHeader) + ImageImportEntry^.Name)));
           HookModule(Pointer(GetModuleHandle(PChar(dword(ImageDosHeader) + ImageImportEntry^.Name))), TargetAddress, NewAddress, OldAddress);
         end;
         ImportCode := Pointer(dword(ImageDosHeader) + ImageImportEntry.LookupTable);
         while ImportCode^ <> nil do
         begin
           Address := FunctionAddress(ImportCode^);
           if Address = OldAddress then
           begin
             WriteProcessMemory(GetCurrentProcess, ImportCode, @NewAddress, SizeOf(dword), BytesWritten);
           end;
           Inc(ImportCode);
         end;
         Inc(ImageImportEntry);
       end;
     end;

   begin
     Result := HookModule(Pointer(GetModuleHandle(nil)), TargetAddress, NewAddress, OldAddress);
   end;

   function UnhookCode(NewAddress, OldAddress: Pointer): integer;
   begin
     Result := HookCode(NewAddress, OldAddress, NewAddress);
   end;

   function CreateProcessEx(lpApplicationName: PChar; lpCommandLine: PChar; lpProcessAttributes, lpThreadAttributes: PSecurityAttributes; bInheritHandles: BOOL; dwCreationFlags: DWORD; lpEnvironment: Pointer; lpCurrentDirectory: PChar; const lpStartupInfo: TStartupInfo; var lpProcessInformation: TProcessInformation; DLLPath: pchar): Boolean; stdcall;
   var
     Parameters: Pointer;
     BytesWritten, Thread, ThreadID: dword;
   begin
     Result := False;
     if not CreateProcess(lpApplicationName, lpCommandLine, lpProcessAttributes, lpThreadAttributes, bInheritHandles, dwCreationFlags or CREATE_SUSPENDED, lpEnvironment, lpCurrentDirectory, lpStartupInfo, lpProcessInformation) then Exit;
     Parameters := xVirtualAllocEx(lpProcessInformation.hProcess, nil, 4096, MEM_COMMIT, PAGE_READWRITE);
     if Parameters = nil then Exit;
     WriteProcessMemory(lpProcessInformation.hProcess, Parameters, Pointer(DLLPath), 4096, BytesWritten);
     Thread := xCreateRemoteThread(lpProcessInformation.hProcess, nil, 0, GetProcAddress(GetModuleHandle('KERNEL32.DLL'), 'LoadLibraryA'), Parameters, 0, @ThreadId);
     WaitForSingleObject(Thread, INFINITE);
     xVirtualFreeEx(lpProcessInformation.hProcess, Parameters, 0, MEM_RELEASE);
     if Thread = 0 then Exit;
     CloseHandle(Thread);
     if ((dwCreationFlags and CREATE_SUSPENDED) = 0) then
     begin
       ResumeThread(lpProcessInformation.hThread);
     end;
     Result := True;
   end;

   function InjectLibrary(Process: LongWord; DLLPath: PChar): Boolean;
   var
     Parameters: Pointer;
     BytesWritten, Thread, ThreadID: dword;
   begin
     Result := False;
     Parameters := xVirtualAllocEx(Process, nil, 4096, MEM_COMMIT, PAGE_READWRITE);
     if Parameters = nil then Exit;
     WriteProcessMemory(Process, Parameters, Pointer(DLLPath), 4096, BytesWritten);
     Thread := xCreateRemoteThread(Process, nil, 0, GetProcAddress(GetModuleHandle('KERNEL32.DLL'), 'LoadLibraryA'), Parameters, 0, @ThreadId);
     WaitForSingleObject(Thread, INFINITE);
     xVirtualFreeEx(Process, Parameters, 0, MEM_RELEASE);
     if Thread = 0 then Exit;
     CloseHandle(Thread);
     Result := True;
   end;

   End.
