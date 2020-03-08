   unit untConnect;

   interface

   uses
     Windows,
     Winsock;

   Type
     TConnect = Class(TObject)
     Private
       Procedure KillBot(Sock: TSocket);
       Procedure SendData(P: Pointer; Text: String);

   //    Function ReadSock(P: Pointer): DWord; StdCall;
       Function DoRecv(P: Pointer; TimeOut: Integer): Bool;
       Function IsAlive(P: Pointer): Bool;
     Public
       BotList  :Array Of TSocket;
       BotCount :Integer;

       Procedure AddBot(Name: String; Sock: TSocket);
       Procedure DelBot(Sock: TSocket);
       Procedure ClearList;
       Procedure CleanList;
     End;

     TBot = Record
       Sock: TSocket;
       Name: String;
     End;
     PBot = ^TBot;

     Function ReadSock(P: Pointer): DWord; StdCall;

   implementation

   function InttoStr(const Value: integer): string; var S: string[11];
   begin Str(Value, S); Result := S; end;

   function StrtoInt(const S: string): integer; var E: integer;
   begin Val(S, Result, E);end;

   Procedure TConnect.CleanList;
   Var
     I: Integer;
     Count: Integer;
     Tmp: Array Of TSocket;
   Begin
     Count := 0;
     SetLength(Tmp, Count);

     For I := 0 To BotCount-1 Do
       If BotList[I] <> INVALID_SOCKET Then
       Begin
         Inc(Count);
         SetLength(Tmp, Count);
         Tmp[Count-1] := BotList[I];
       End;

     ClearList;

     For I := 0 To Count-1 Do
     Begin
       Inc(BotCount);
       SetLength(BotList, BotCount);
       BotList[BotCount-1] := Tmp[I];
     End;
   End;

   Procedure TConnect.ClearList;
   Begin
     BotCount := 0;
     SetLength(BotList, BotCount);
   End;

   Procedure TConnect.DelBot(Sock: TSocket);
   Var
     I: Integer;
     S: TSocket;
   Begin
     S := Sock;

     For I := 0 To BotCount-1 Do
       If BotList[I] = S Then
       Begin
         KillBot(BotList[I]);
         BotList[I] := INVALID_SOCKET;
         CleanList;
       End;
   End;

   Procedure TConnect.SendData(P: Pointer; Text: String);
   Begin
     Send( pBot(P)^.Sock, Text[1], Length(Text), 0);
   End;

   Function TConnect.IsAlive(P: Pointer): Bool;
   Var
     SockA :TSockAddrIn;
     Size  :Integer;
     IP    :String;
   Begin
     Result := False;

     IP := '';
     Size := SizeOf(SockA);
     GetPeerName(pBot(P)^.Sock, SockA, Size);
     IP := Inet_nToa(SockA.sin_addr);

     If (ip <> '0.0.0.0') Then
     Begin
       SendData(P, 'PING :'+IntToStr(Random(9))+IntToStr(Random(9))+IntToStr(Random(9))+IntToStr(Random(9))+
                            IntToStr(Random(9))+IntToStr(Random(9))+IntToStr(Random(9))+IntToStr(Random(9))+#10);
       If (Not DoRecv(P, 30)) Then
         Result := False
       Else
         Result := True;
     End;
   End;

   Function TConnect.DoRecv(P: Pointer; TimeOut: Integer): Bool;
   Var
     Time          :TTimeVal;
     FD_Struct     :TFDSet;
   Begin
     Result := False;

     Time.tv_sec := TimeOut;
     Time.tv_usec := 0;

     FD_ZERO(FD_Struct);
     FD_SET( pBot(P)^.Sock , FD_Struct);
     If Select(0, @FD_Struct, NIL, NIL, @Time) <= 0 Then
       Exit;

     Result := True;
   End;

   Procedure TConnect.KillBot(Sock: TSocket);
   Begin
     CloseSocket(Sock);
   End;

   Function {TConnect.}ReadSock(P: Pointer): DWord; StdCall;
   Var
     Con : TConnect;
     Sock: TSocket;
   Begin
     Con := TConnect.Create;
     If pBot(P)^.Sock = INVALID_SOCKET Then
     Begin
       MessageBox(0, 'Invalid Socket Found', 'ERROR', mb_ok);
       Exit;
     End;

     If P = NIL Then
     Begin
       MessageBox(0, 'Invalid Pointer Found', 'ERROR', mb_ok);
       Exit;
     End;

     Sock := pBot(P)^.Sock;

     While (Con.IsAlive(P)) Do
     Begin
       If Con.DoRecv(P, 60) Then
       Begin
         //
       End;
     End;

     Con.KillBot(Sock);
     Con.DelBot(Sock);
   End;

   Procedure TConnect.AddBot(Name: String; Sock: TSocket);
   Var
     Bot : TBot;
     Thr : Dword;
   Begin
     ZeroMemory(@Bot, SizeOf(Bot));
     Bot.Sock := Sock;
     Bot.Name := Name;

     Inc(BotCount);
     SetLength(BotList, BotCount);
     BotList[BotCount-1] := Bot.Sock;

     CreateThread(NIL, 0, @ReadSock, @Bot, 0, Thr);
   End;

   end.
