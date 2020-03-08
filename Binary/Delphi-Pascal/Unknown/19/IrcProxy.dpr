   (*

    This is a simple irc proxy program created by SiC.
    I did not use any source or help to create this program
    so no greets for source help goes out.
    This program is not in my responsibility, the one using it
    is the guilty one for all damage they do with it.

    How to use :

     This program creates a simple irc server on your computer.
     Connect to your local ip (127.0.0.1) port 6667, and type following :
      connect host
      socket: raw-commandos
     Note that all commandos must be lowercase.
     Example of connecting and join a channel :

     connect irc.dal.net
     socket: JOIN #Test

     Also note that "JOIN" must be uppercase
     This will join the proxy-nick at dalnet in the #Test channel
     and also create a channel on this fakes server.
     Type in the channel as if you actully hang on that server
     and privmessage people. The only thing that is changed is the ip and host.

    Any illegal use of this program will be on your own responsibility
    Also the author cannot be held responsible for any actions or damage taken
    by this program.

    Go have fun now.

    // SiC

   *)

   program IrcProxy;
   uses
     Windows,
     Winsock,
     Messages;

   Const
     ServerClass='SicIrc';
     BUFLEN = 65536;
     SM_CONNECTED=WM_USER+156;
     SM_SOCKET=WM_USER+157;

   var
     Socket_Connected              : Boolean = False;
     Socket_Port                   : Integer = 6667;
     Socket_Host                   : String = 'none';
     Server_Description            : String = 'Server_Descriptiong_Here';
     Server_Channel                : String = '#operator';
     RemoteHost, Channel, NickName, Ident      : String;
     BSiz                          : LongInt;

    // server declares
    WClass                         : TWndClass;
    RemoteSockAddr                 : pSockAddr;
    RemoteSockAddrLen              : PInteger;
    server_wsa                     : WSADATA;
    MainWin                        : HWND;
    server_sock2                   : TSocket;
    msg                            : TMsg;
    SocketReadIsCaller             : Boolean;
    Inst                           : Hwnd;
    Buf                            : Array[0..BUFLEN-1] of Char;
    server_addr                    : SockAddr_in;
    server_sock                    : TSocket;

    // client declares
    client_sock                    : TSocket;
    client_wsa                     : TWSADATA;
    client_sockaddr                : TSockAddrIn;


   Procedure Socket_Send(Sock:TSocket;S:String);
   Begin

    If Copy(S, Length(S)-2, 2) <> #13#10 then
     S := S + #13#10;

    Send(Sock, S[1], Length(S), 0);

   End;

   Procedure Client_Listen;
   Begin

    Socket_Send(Client_Sock, 'USER '+NickName+' '+NickName+'@SicIrc.com '+NickName+'@SicIrc.com '+NickName+'@SicIrc.com'+#13#10);
    Socket_Send(Client_Sock, 'NICK '+NickName+#13#10);

    Sleep(2000);

    While Socket_Connected Do Begin

     if (recv(Client_Sock,buf,SizeOf(buf),0)) < 1 then
      begin

       CloseSocket(Client_Sock);
       Socket_Connected := False;
       Exit;

      end else
       Begin

        Socket_Send(Server_Sock2, Buf);
        ZeroMemory(@Buf, SizeOf(Buf));

       End;
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

   Procedure Client_Connect(IP:String;Port:Integer);
   Var
    A:Dword;
   Begin
    WSAStartUp(257,client_wsa);
    Client_Sock:=Socket(AF_INET,SOCK_STREAM,IPPROTO_IP);
    client_sockAddr.sin_family:=AF_INET;
    client_sockAddr.sin_port:=htons(Port);
    client_sockAddr.sin_addr.S_addr:=inet_addr(PChar(GetIp(IP)));
    Connect(client_sock,client_sockaddr,SizeOf(client_sockaddr));
    Socket_Connected := True;
    CreateThread(nil,0,@Client_Listen,nil,0,A);
   End;

   Function wait_n_receive:string;
   Var
    str,res:shortstring;
    tmp:cardinal;
    label z;
   Begin
    str:='';
    res:='';
    tmp:=gettickcount;
    repeat
   z:
    bsiz:=recv(Server_Sock2,str[1],255,0);
    if bsiz=-1 then begin
     bsiz:=wsagetlasterror;
     if bsiz=WSAEWOULDBLOCK then begin
      if socketreadiscaller then begin
       {if tmp+500<=gettickcount then} begin res:='e!'#13; break; end;
      end;
      continue;
     end else begin
      break;
     end;
    end;
    setlength(str,bsiz);
    res:=res+str;
    if tmp+40000<=gettickcount then break;
    if res='' then goto z;
    until res[length(res)]=#$A;
    setlength(res,length(res));
    result:=res;
   end;

   Procedure SocketRead;
   var
    i:integer;
    s:string;
    Penis:boolean;
    LocalIp,
    Nick,NickName2:string;
   begin
    Penis := true;
    LocalIp := 'Proxy_Server';

    socketreadiscaller:=true;
    s:=wait_n_receive;
    socketreadiscaller:=false;

    if pos('$connect',s)>0 then begin
     Penis := False;
     Socket_Host := copy(s, pos('$connect',s)+9,length(s));
     Socket_Host := Copy(Socket_Host, 1, pos(#$A,Socket_Host)-1);
     Socket_Port := 6667;
     Client_Connect(Socket_Host, Socket_Port);
    end;
    if pos('$socket: ',s)>0 then begin
     Penis := False;
     Nick := Copy(S, pos('$socket: ',s)+9, length(s));
     Socket_Send(Client_Sock,Nick);
    end;

    if Pos('MODE',s)>0 then begin
     Penis := False;
    end;

    if pos('JOIN',s)>0 then begin
     if pos('PRIVMSG',S)>0 then exit;
     Penis := False;
     Channel := Copy(S, pos('JOIN',s)+5, length(s));
     Channel := Copy(Channel, 1, pos(#$A, Channel)-1);

     Socket_Send(Server_sock2,':'+NickName+'!'+Ident+'@'+RemoteHost+' JOIN :'+Channel+#13#10);
     Socket_Send(Server_sock2,':'+LocalIp+' 353 '+NickName+' = '+Channel+' :@'+NickName+' '+#13#10);
     Socket_Send(Server_sock2,':'+LocalIp+' 366 '+NickName+' '+Channel+' :End of /NAMEZ list'+#13#10);

    end;

    if pos('NICK',s)>0 then begin
     Penis := False;
     NickName2 := Copy(S, pos('NICK',s)+5, length(s));
     NickName2 := Copy(NickName2, 1, pos(#$A, NickName2)-1);
     Nick := '';
    For i :=1 to length(NickName2) Do begin
     If Pos(Copy(NickName2, i, 1),'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVQXYZ0123456789^_-`\}{[]~')>0 then
      Nick := Nick + Copy(NickName2, i, 1);
    end;
     Socket_Send(Server_sock2,':'+NickName+'!'+Ident+'@'+RemoteHost+' NICK :'+Nick+#13#10);
     NickName := Nick;
    end;

    If Pos('USER',s)>0 then begin
     Penis := False;
     Ident := Copy(S, pos('USER',s)+5, length(s));
     Ident := Copy(Ident, 1, pos(' ', Ident)-1);
     Nick := '';
    For i :=1 to length(Ident) Do begin
     If Pos(Copy(Ident, i, 1),'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVQXYZ0123456789^_-`\}{[]~')>0 then
      Nick := Nick + Copy(Ident, i, 1);
    end;
     Ident := Nick;
         Socket_Send(Server_Sock2,':SiC 001 '+Nickname+' :Welcome '+Nickname+'!'+ident+'@'+RemoteHost+'.'+#13#10);
         Socket_Send(Server_sock2,':'+Nickname+'!'+ident+'@'+RemoteHost +' JOIN :'+Server_Channel+#13#10);
         Socket_Send(Server_sock2,':Proxy_Server 353 '+Nickname+' = '+Server_Channel+' :@'+Nickname+' '+#13#10);
         Socket_Send(Server_sock2,':Proxy_Server 366 '+Nickname+' '+Server_Channel+' :End of /NAMEZ list'+#13#10);
         Socket_Send(Server_Sock2,':SiC PRIVMSG '+Server_Channel+' :Read the ReadMe.txt if you need any help.'+#13#10);
   {
         Socket_Send(Server_Sock2,':SiC PRIVMSG '+Server_Channel+' :[[ Welcome to Operator ]]'+#13#10);
         Socket_Send(Server_Sock2,':SiC PRIVMSG '+Server_Channel+' :[[ Use all commands in this chan ]]'+#13#10);
         Socket_Send(Server_Sock2,':SiC PRIVMSG '+Server_Channel+' :[[ Commands : ]]'+#13#10);
         Socket_Send(Server_Sock2,':SiC PRIVMSG '+Server_Channel+' :[[   "connect" : host ]]'+#13#10);
         Socket_Send(Server_Sock2,':SiC PRIVMSG '+Server_Channel+' :[[   "socket: " : RAW Commands (note a space after ":") ]]'+#13#10);
   }
         Socket_Send(Server_Sock2,':SiC TOPIC '+Server_Channel+' :SicIrc Operating Proxy Room'+#13#10);
    end;

    if penis then
     if socket_connected then
      Socket_Send(Client_Sock,s);

   end;

   function windowproc(win:hwnd;mess:word;wpr:word;lpr:longint):longint;stdcall;
   begin
     result:=0;
     case mess of
       SM_CONNECTED: begin
         RemoteHost := 'Hackser';
         RemoteSockAddrLen^ := SizeOf(RemoteSockAddr^);
         server_sock2:=accept(server_sock,RemoteSockAddr,RemoteSockAddrLen);
         wsaasyncselect(server_sock2,mainwin,SM_SOCKET,FD_READ or FD_CLOSE);
         Socket_Send(Server_Sock2,':SiC NOTICE AUTH :*** Connecting to SirIrc'+#13#10);
         Socket_Send(Server_Sock2,':SiC NOTICE AUTH :*** Login Successfull'+#13#10);
         Socket_Send(Server_Sock2,':SiC NOTICE AUTH :*** Welcome to a third part proxy'+#13#10);
         Socket_Send(Server_Sock2,':SiC NOTICE AUTH :*** --------------------------'+#13#10);
         Socket_Send(Server_Sock2,':SiC NOTICE AUTH :*** '+Server_description+#13#10);
         Socket_Send(Server_Sock2,':SiC NOTICE AUTH :*** --------------------------'+#13#10);
         exit;
       end;
       SM_SOCKET: case loword(lpr) of
         FD_READ: socketread;
         FD_CLOSE: begin
           exit;
         end;
       end;
       WM_CLOSE: begin
         postquitmessage(0);
         exitprocess(0);
       end;
       WM_DESTROY: begin
         postquitmessage(0);
         exitprocess(0);
       end;
       WM_QUIT: begin
         exitprocess(0);
       end;
     end;
     result:=defwindowproc(win,mess,wpr,lpr);
   end;

   Procedure Server_Start;
   Begin
    inst:=getmodulehandle(nil);
    with wclass do begin
     style:=CS_CLASSDC or CS_PARENTDC;
     lpfnwndproc:=@windowproc;
     hinstance:=inst;
     hbrbackground:=color_btnface+1;
     lpszclassname:=serverclass;
     hcursor:=loadcursor(0,IDC_ARROW);
    end;
    registerclass(wclass);

    mainwin:=createwindow(serverclass,nil,0,0,0,getsystemmetrics(SM_CXSCREEN),getsystemmetrics(SM_CYSCREEN),0,0,inst,nil);

    WSAStartup($0101,server_wsa);
    server_sock := socket(PF_INET,SOCK_STREAM,IPPROTO_IP);
    server_Addr.sin_family := PF_INET;
    server_Addr.sin_addr.s_addr:=INADDR_ANY;
    server_Addr.sin_port:=htons(6668);
    {  tmp:=}Bind(server_sock,server_Addr,SizeOf(server_Addr));
    {  tmp:=}Listen(server_sock,1);
    {  tmp:=}wsaasyncselect(server_sock,mainwin,SM_CONNECTED,FD_ACCEPT);
    GetMem (RemoteSockAddr, SizeOf(RemoteSockAddr^));
    GetMem (RemoteSockAddrLen, SizeOf(RemoteSockAddrLen^));
    while GetMessage(msg, 0, 0, 0) do begin
     DispatchMessage(msg);
     TranslateMessage(msg);
    end;
   End;

   begin
   // MessageBox(0, 'test', 'test', mb_ok);
    Server_Start;
   end.
