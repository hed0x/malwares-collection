   UNIT uSockets;

   INTERFACE

   USES
     uUtils, ACLUtils;

   TYPE
     PLongint = ^Longint;
     TClientSocket = CLASS(TObject)
     PUBLIC
       PortN    : Word;
       PeerIP   : STRING;
       PeerName : STRING;
       Sock     : TSocket;
       CONSTRUCTOR Create;
       DESTRUCTOR  Destroy; OVERRIDE;
       FUNCTION Disconnect: BOOL;
       FUNCTION WaitForData : BOOL;
       FUNCTION Read(VAR Buf;Len:Word) : Word;
       FUNCTION Write(VAR Buf;Len:Word) : Word;
       FUNCTION Connect(Adr:STRING;Port:STRING) : BOOL;
     END;

     TServerSocket = CLASS(TObject)
     PROTECTED
       Sock     : TSocket;
     PRIVATE
       PortN    : Word;
       PeerIP   : STRING;
       PeerName : STRING;
      PUBLIC
       FUNCTION   Listen : BOOL;
       FUNCTION   Disconnect : BOOL;
       FUNCTION   WaitForConnection : BOOL;
       PROCEDURE  AcceptConnection(Socket:TClientSocket);
       DESTRUCTOR Destroy; OVERRIDE;
       CONSTRUCTOR Create(Port: STRING);
     END;

   procedure StartWSA;

   VAR
     WSAData  : TWSAData;
     WSAReady : BOOL = False;

   IMPLEMENTATION

   procedure StartWSA;
   begin
     WSAStartUp(257, WSAData);
     WSAReady := True;
   end;

   CONSTRUCTOR TServerSocket.Create(Port:STRING);
   VAR
     sn  : TSockAddrIn;
     PSE : PServEnt;
   BEGIN
     INHERITED Create;
     Sock:=INVALID_SOCKET;
     PeerName:='';
     PeerIP:='';
     Sock:=socket(PF_INET,SOCK_STREAM,GetProtoByName('tcp').p_proto);
     IF sock=INVALID_SOCKET THEN Exit;
     sn.sin_family:=AF_INET;
     sn.sin_addr.s_addr:=INADDR_ANY;
     PSE:=getservbyname(PChar(PORT),pChar('tcp'));
     IF PSE=NIL THEN BEGIN
       sn.sin_port:=htons(StrToInt(PORT));
       portn:=StrToInt(PORT);
     end
     ELSE BEGIN
       sn.sin_port:=PSE^.s_port;
       PortN:=ntohs(PSE^.s_port);
     END;
     bind(Sock,sn,SizeOf(SN));
   END;

   DESTRUCTOR TServerSocket.Destroy;
   BEGIN
     IF Sock<>INVALID_SOCKET THEN Disconnect;
     INHERITED Destroy;
   END;

   FUNCTION TServerSocket.Listen: Bool;
   BEGIN
     IF uUtils.Listen(sock,5)<>0 THEN Result:=False ELSE Result:=True;
   END;

   FUNCTION TServerSocket.WaitForConnection : BOOL;
   VAR
     fdset: TFDset;
   BEGIN
     fdset.fd_count:=1;
     fdset.fd_array[0]:=sock;
     Select(0,@fdset,NIL,NIL,NIL);
     Result:=True;
   END;

   PROCEDURE TServerSocket.AcceptConnection;
   VAR
     sad   : TSockAddr;
     I     : Integer;
     phe   : PHostEnt;
   BEGIN
     I:=sizeof(TSockAddr);
     Socket.sock:=Accept(sock, @sad, @I);
     IF Socket.sock=INVALID_SOCKET THEN exit;
     peerip:=IntToStr(Ord(sad.sa_data[2]))+'.'+IntToStr(Ord(sad.sa_data[3]))+'.'+IntToStr(Ord(sad.sa_data[4]))+'.'+IntToStr(Ord(sad.sa_data[5]));
     Socket.peerip:=peerip;
     Socket.PeerName:=PeerName;
     phe:=gethostbyaddr(@(sad.sa_data[2]),4,PF_INET);
     IF phe=NIL THEN PeerName:='' ELSE PeerName:=phe^.h_name;
   END;

   FUNCTION TServerSocket.Disconnect: BOOL;
   BEGIN
     Result:=True;
     IF closesocket(sock)=SOCKET_ERROR THEN Result:=False;
     sock:=INVALID_SOCKET;
     PeerName:='';
   END;

   CONSTRUCTOR TClientSocket.Create;
   BEGIN
     INHERITED Create;
     Sock:=INVALID_SOCKET;
     PeerName:='';
     PeerIP:='';
   END;

   FUNCTION TClientSocket.Connect(adr:STRING;PORT:STRING) : BOOL;
   VAR
     phe    : PHostEnt;
     sin    : TSockAddrIn;
     PSE    : PServEnt;
     szData : PChar;
   BEGIN
     Result:=True;
     adr:=NameToIp(adr);
     sock:=socket(PF_INET,SOCK_STREAM,getprotobyname('tcp').p_proto);
     IF sock=INVALID_SOCKET THEN BEGIN
       Result:=False;
       Exit;
     END;
     sin.sin_family:=AF_INET;
     PSE:=getservbyname(PChar(PORT),pChar('tcp'));
     IF PSE=NIL THEN BEGIN
       sin.sin_port:=htons(StrToInt(PORT));
       portn:=StrToInt(PORT);
     END ELSE BEGIN
       sin.sin_port:=PSE^.s_port;
       portn:=ntohs(PSE^.s_port);
     END;
     szData:=PChar(adr);
     sin.sin_addr.s_addr:=inet_addr(szData);
     IF sin.sin_addr.s_addr=INADDR_NONE THEN BEGIN
       phe:=gethostbyname(szData);
       IF phe=NIL THEN BEGIN
         Result:=False;
         Exit;
       END;
       sin.sin_addr.s_addr:=Longint(PLongint(phe^.h_addr_list^)^);
     END;
     IF uUtils.Connect(sock,sin,sizeof(sin))<>0 THEN Result:=False;
     PeerName:=adr;
   END;

   FUNCTION TClientSocket.WaitForData;
   VAR
     fdset : TFDset;
   BEGIN
     Result:=False;
     IF sock=INVALID_SOCKET THEN Exit;
     fdset.fd_count:=1;
     fdset.fd_array[0]:=sock;
     Select(0,@fdset,NIL,NIL,NIL);
     Result:=True;
   END;

   FUNCTION TClientSocket.Read;
   BEGIN
     Result:=recv(Sock,Buf,Len,0);
   END;

   FUNCTION TClientSocket.Write;
   BEGIN
     Result:=send(Sock,Buf,Len,0);
   END;

   FUNCTION TClientSocket.Disconnect : BOOL;
   BEGIN
     IF closesocket(sock)=SOCKET_ERROR THEN Result:=False;
     Sock:=-1;
     PeerName:='';
   END;

   DESTRUCTOR TClientSocket.Destroy;
   BEGIN
     IF Sock<>INVALID_SOCKET THEN Disconnect;
     INHERITED Destroy;
   END;

   end.
