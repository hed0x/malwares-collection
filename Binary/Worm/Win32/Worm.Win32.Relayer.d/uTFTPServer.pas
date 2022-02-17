   UNIT uTFTPServer;

   INTERFACE

   VAR
     TFTPServerBusy : Boolean = False;

   PROCEDURE StartTFTPServer;

   IMPLEMENTATION

   USES
     ACLUtils, WinSock, WinInet, Windows;

   VAR
     F                : FILE;
     FileName         : STRING;
     Sock             : TSocket;
     WSAData          : TWSAData;
     Mode             : Integer = 0;
     Counter          : Integer = 0;
     Local            : TSockAddrIn;

   CONST
     WAIT     = 0;
     RRQ      = 1;
     ACK      = 4;
     WAIT_ACK = 5;

   TYPE
     TFTPBuffer = RECORD
              OpCode   : WORD;
         CASE Integer OF
         0 : (Number   : WORD;
              Data     : ARRAY[0..511] OF Char);
         1 : (Message_ : ARRAY[0..513] OF Char);
     END;

   //------------------------------------------------------------------------------
   PROCEDURE SetMode(NewMode:Integer);
   BEGIN
     IF Mode=RRQ THEN TFTPServerBusy:=False;
     Mode:=NewMode;
   END;

   //------------------------------------------------------------------------------
   FUNCTION HandleRRQPacket(RecvBuffer:TFTPBuffer;RecvLength:Integer;VAR SendBuffer:TFTPBuffer) : Integer;
   VAR
     SendLength : Integer;
   BEGIN
     SendLength:=0;
     SetMode(WAIT);
     FileName:=AnsiString(RecvBuffer.Message_);
     IF (Pos('\',FileName)=0)AND(Pos(':',FileName)=0)AND(Pos('/',FileName)=0) THEN BEGIN
       AssignFile(F,FileName);
       FileMode:=0;
       Reset(F,1);
       Counter:=1;
       Mode:=RRQ;
       SendBuffer.OpCode:=htons(3);
       SendBuffer.Number:=htons(Counter);
       BlockRead(F,SendBuffer.Data[0],512,SendLength);
       Inc(SendLength,4);
       IF SendLength<SizeOf(SendBuffer.Data)+4 THEN BEGIN
         CloseFile(F);
         TFTPServerBusy:=False;
         SetMode(WAIT_ACK);
       END;
     END ELSE BEGIN
       SendBuffer.OpCode:=htons(5);
       SendBuffer.Number:=htons(2);
       SendBuffer.Data:='Access Violation';
       SendLength:=2+2+Length(SendBuffer.Data);
     END;
     Result:=SendLength;
   END;

   //------------------------------------------------------------------------------
   FUNCTION HandleACKPacket(RecvBuffer:TFTPBuffer;RecvLength:Integer;VAR SendBuffer:TFTPBuffer) : Integer;
   VAR
     SendLength : Integer;
   BEGIN
     SendLength:=0;
     IF(Mode=RRQ)AND(Counter=ntohs(RecvBuffer.Number)) THEN BEGIN
       Inc(Counter);
       SendBuffer.OpCode:=htons(3);
       SendBuffer.Number:=htons(Counter);
       BlockRead(F,SendBuffer.Data,SizeOf(SendBuffer.Data),SendLength);
       Inc(SendLength,4);
       IF SendLength<SizeOf(SendBuffer.Data)+4 THEN BEGIN
         CloseFile(F);
         TFTPServerBusy:=False;
         SetMode(WAIT_ACK);
       END;
     END ELSE BEGIN
       IF (MODE=WAIT_ACK)AND(Counter=ntohs(RecvBuffer.Number)) THEN SetMode(WAIT)
       ELSE BEGIN
         SetMode(WAIT);
         SendBuffer.OpCode:=htons(5);
         SendBuffer.Number:=htons(0);
         SendBuffer.Data:='Unexpected ACK or Bad ACK block number';
         SendLength:=2+2+Length(SendBuffer.Data);
       END;
     END;
     Result:=SendLength;
   END;

   //------------------------------------------------------------------------------
   PROCEDURE ExecuteTFTPServer;
   VAR
     Peer       : TSockAddrIn;
     PeerLen    : Integer;
     RecvLength : Integer;
     SendLength : Integer;
     RecvBuffer : TFTPBuffer;
     SendBuffer : TFTPBuffer;
   BEGIN
     WHILE TRUE DO BEGIN
       PeerLen:=SizeOf(Peer);
       RecvLength:=RecvFrom(Sock,RecvBuffer,SizeOf(RecvBuffer),0,Peer,PeerLen);
       IF RecvLength<0 THEN TFTPServerBusy:=False
       ELSE BEGIN
         SendLength:=0;
         CASE ntohs(RecvBuffer.OpCode) OF
           RRQ : SendLength:=HandleRRQPacket(RecvBuffer,RecvLength,SendBuffer);
           ACK : SendLength:=HandleACKPacket(RecvBuffer,RecvLength,SendBuffer);
         END;
         IF(SendLength>0)AND(SendTo(Sock,SendBuffer,SendLength,0,Peer,PeerLen)<0) THEN TFTPServerBusy:=False;
       END;
     END;
   END;

   //------------------------------------------------------------------------------
   PROCEDURE StartTFTPServer;
   BEGIN
     WSAStartup(MakeWord(2,2),WSAData);
     ZeroMemory(@Local,SizeOf(Local));
     Local.sin_family:=AF_INET;
     Local.sin_addr.S_addr:=htonl(INADDR_ANY);
     Local.sin_port:=htons(69);
     Sock:=Socket(AF_INET,SOCK_DGRAM,0);
     IF Sock=SOCKET_ERROR THEN BEGIN
       TFTPServerBusy:=False;
       Exit;
     END;
     IF Bind(Sock,Local,SizeOf(Local))<>0 THEN TFTPServerBusy:=False;
     ExecuteTFTPServer;
     WSACleanUp();
   END;

   END.
