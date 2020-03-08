   {$I CompMode.INI}

   {$IFDEF Debug}
   unit Sockets;
   {$ELSE}
   UNIT A10;
   {$ENDIF}

   interface

   {$IFDEF Debug}
   USES Email, Utils, ACLUtils;
   {$ELSE}
   USES A1, A6, B1;
   {$ENDIF}

   type
     PLongint = ^Longint;
     TClientSocket = class(TObject)
     private
     protected
     public
       portn: Word;
       peerip: string;
       peername: string;
       sock: tSocket;
       constructor Create;
       destructor Destroy;override;
       function Connect(adr: string; PORT: string): Boolean;
       function WaitForData: boolean;
       function WaitForDataTime(A:Word):integer;
       function Disconnect: Boolean;
       function read (var Buf; len: Word): Word;
       function write (var Buf; len: Word): Word;
     end;

     TServerSocket = class(TObject)
     protected
       sock: tSocket;
     private
       portn: Word;
       peerip: string;
       peername: string;
     public
       property FPeerIP: string read peerip;
       property FPeerName: string read peername;
       constructor Create(PORT: string);
       destructor Destroy;override;
       function Listen: Boolean;
       function WaitForConnection: boolean;
       procedure AcceptConnection(Socket: TClientSocket);
       function Disconnect: Boolean;
     end;

   procedure StartWSA;

   var
     WSAReady: Boolean = False;
     WSAData: TWSAData;

   implementation

   procedure StartWSA;
   begin
     WSAStartUp(257, WSAData);
     WSAReady := True;
   end;

   constructor TServerSocket.Create(PORT: string);
   var
     sn : TSockAddrIn;
     PSE: PServEnt;
   begin
     inherited Create;
     sock := INVALID_SOCKET;
     peername := '';
     peerip := '';
     sock := socket(PF_INET, SOCK_STREAM, getprotobyname('tcp').p_proto);
     if sock = INVALID_SOCKET then Exit;
     sn.sin_family := AF_INET;
     sn.sin_addr.s_addr := INADDR_ANY;
     PSE := getservbyname(PChar(PORT), PChar('tcp'));
     if PSE = nil then begin
       sn.sin_port := htons(StrToInt(PORT));
       portn := StrToInt(PORT);
     end
     else begin
       sn.sin_port := PSE^.s_port;
       portn := ntohs(PSE^.s_port);
     end;
     bind(sock, sn, sizeof(sn));
   end;

   destructor TServerSocket.Destroy;
   begin
     if sock <> INVALID_SOCKET then Disconnect;
     inherited Destroy;
   end;

   function TServerSocket.Listen: Boolean;
   begin
     {$IFDEF Debug}
     IF Email.Listen(sock,5)<>0 THEN Result:=False;
     {$ELSE}
     IF A1.Listen(sock,5)<>0 THEN Result:=False;
     {$ENDIF}
   end;

   Function TServerSocket.WaitForConnection: boolean;
   var
     fdset: TFDset;
   begin
     fdset.fd_count := 1;
     fdset.fd_array[0] := sock;
     Select(0,@fdset,0,0,0);
     Result := True;
   end;

   procedure TServerSocket.AcceptConnection;
   var
     sad    : TSockAddr;
     I      : Integer;
     phe    : PHostEnt;
     TmpCs  : TClientSocket;
   begin
     I := sizeof(TSockAddr);
     Socket.sock := Accept(sock, @sad, @I);
     if Socket.sock = INVALID_SOCKET then exit;
     peerip := IntToStr(Ord(sad.sa_data[2])) + '.' + IntToStr(Ord(sad.sa_data[3])) + '.' +
     IntToStr(Ord(sad.sa_data[4])) + '.' + IntToStr(Ord(sad.sa_data[5]));
     Socket.peerip := peerip;
     Socket.peername := peername;
     phe := gethostbyaddr(@(sad.sa_data[2]), 4, PF_INET);
     if phe = nil then peername := '' else peername := phe^.h_name;
   end;

   function TServerSocket.Disconnect: Boolean;
   begin
     if closesocket(sock) = SOCKET_ERROR then Result := False;
     sock := INVALID_SOCKET;
     peername := '';
   end;

   constructor TClientSocket.Create;
   begin
     inherited Create;
     sock := INVALID_SOCKET;
     peername := '';
     peerip := '';
   end;

   function TClientSocket.Connect(adr: string; PORT: string): Boolean;
   var phe: PHostEnt;
     sin   : TSockAddrIn;
     PSE   : PServEnt;
     szData: PChar;
   begin
     Result := True;
     adr:=NameToIp(adr);
     sock := socket(PF_INET, SOCK_STREAM, getprotobyname('tcp').p_proto);
     if sock = INVALID_SOCKET then begin result:=false;exit;end;
     sin.sin_family := AF_INET;
     PSE := getservbyname(PChar(PORT), PChar('tcp'));
     if PSE = nil then begin
       sin.sin_port := htons(StrToInt(PORT));
       portn := StrToInt(PORT);
     end
     else begin
       sin.sin_port := PSE^.s_port;
       portn := ntohs(PSE^.s_port);
     end;
     szData := PChar(adr);
     sin.sin_addr.s_addr := inet_addr(szData);
     if sin.sin_addr.s_addr = INADDR_NONE then begin
       phe := gethostbyname(szData);
       if phe = nil then result:=false;exit;
       sin.sin_addr.s_addr := Longint(PLongint(phe^.h_addr_list^)^);
     end;
     {$IFDEF Debug}
     IF Email.Connect(sock, sin, sizeof(sin)) <> 0 then Result := False;
     {$ELSE}
     IF A1.Connect(sock, sin, sizeof(sin)) <> 0 then Result := False;
     {$ENDIF}
     peername := adr;
   end;

   function TClientSocket.WaitForData;
   var
     fdset: TFDset;
   begin
     if sock = INVALID_SOCKET then begin
       Result := False;
       Exit;
     end;
     fdset.fd_count := 1;
     fdset.fd_array[0] := sock;
     Select(0, @fdset, nil, nil, nil);
     Result := True;
   end;

   function TClientSocket.WaitForDataTime(A:Word):integer;
   var
     fdset: TFDset;
     TM: TTimeVal;
     Res: Integer;
   begin
     TM.tv_sec := A;
     TM.tv_usec := A;
     fdset.fd_count := 1;
     fdset.fd_array[0] := sock;
     Res := Select(0, @fdset, nil, nil, @TM);
     if Res = 0 then result := 0 else if Res = SOCKET_ERROR then result := 0 else result := res;
   end;

   function TClientSocket.read;
   begin
     Result := recv(sock, Buf, len, 0);
   end;

   function TClientSocket.write;
   begin
     Result := send(sock, Buf, len, 0);
   end;

   function TClientSocket.Disconnect: Boolean;
   begin
     if closesocket(sock) = SOCKET_ERROR then Result := False;
     sock := -1;
     peername := '';
   end;

   destructor TClientSocket.Destroy;
   begin
     if sock <> INVALID_SOCKET then Disconnect;
     inherited Destroy;
   end;

   end.
