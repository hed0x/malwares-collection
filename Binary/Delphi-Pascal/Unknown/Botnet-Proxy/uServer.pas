   unit uServer;

   interface

   Uses
     Windows, Winsock;

   Type
     TServer = Class(TObject)
     Private
       CurrentInt        : Integer; {Should be 0 at start}
       ActiveConnections : Integer; {Should be 0 at start}
       Connections       : Array[0..90000] Of Integer;
       FDSocket          : Array[0..90000] Of TSocket;
     Public
       ;
     End;

   implementation

   Procedure TServer.Listen;
   Var
     SockAddrIn: TSockAddrIn;
   Begin
     Repeat
       If FDSocket[CurrentInt] > 0 Then
         Inc(CurrentInt,1);
     Until (CurrentInt = 90000) Or (FDSocket[CurrentInt] = 0);

     FDSocket[CurrentInt] := Socket(PF_INET, SOCK_STREAM, IPPROTO_TCP);
     SockAddrIn.sin_family := AF_INET;
     SockAddrIn.sin_addr.S_addr := INADDR_ANY;
     SockAddrIn.sin_port := hTons(6667);
     Bind(FDSocket[CurrentInt], SockAddrIn, SizeOf(SockAddrIn));
     Winsock.listen(FDSocket[CurrentInt], 5);
   End;



   end.
