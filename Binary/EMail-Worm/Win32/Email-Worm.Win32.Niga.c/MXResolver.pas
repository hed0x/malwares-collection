   UNIT MXResolver;

   INTERFACE

   USES
     StrList, Windows, WinSock;

   TYPE
     TMXResolver = CLASS(TObject)
     PRIVATE
       DNSAddress  : STRING;
       Domain_Addr : STRING;
       PROCEDURE Resolve;
       PROCEDURE GetDNSInfo;
       FUNCTION  DomainToQName(S:STRING) : STRING;
       FUNCTION  WaitForRead(SOCK:Integer;Timeout:Longint) : Integer;
       FUNCTION  GetNumberEntries(VAR RecvData;BytesRecv:Integer) : Integer;
       FUNCTION  GetQName(VAR RecvData;Offset:Integer;VAR Pt:Pointer) : STRING;
       FUNCTION  SendRecvDNS(VAR SendData;BytesSend:Integer;VAR RecvData;BytesRecv:Integer) : Integer;
       FUNCTION  GetEntryInfo(VAR RecvData;BytesRecv:Integer;VAR Entrada:Pointer;VAR Preference:Integer) : STRING;
     PUBLIC
       ListOfSMTPServers : TStrList;
       CONSTRUCTOR Create(Domain:STRING);
   END;

   IMPLEMENTATION

   TYPE
     TDNSHeader            = PACKED RECORD
       qryID               : WORD;
       options             : WORD;
       qdcount             : WORD;
       ancount             : WORD;
       nscount             : WORD;
       arcount             : WORD;
     END;

     TQueryType            = PACKED RECORD
       QType               : WORD;
       QClass              : WORD;
     END;

     TIPAddressString      = ARRAY [0..15] OF Char;

     PIPAddrString         =^TIPAddrString;

     TIPAddrString         = PACKED RECORD
       Next                : PIPAddrString;
       IPAddress           : TIPAddressString;
       IPMask              : TIPAddressString;
       Context             : Integer;
     END;

     PFixedInfo            = ^TFixedInfo;

     TFixedInfo            = PACKED RECORD
       HostName            : ARRAY [0..131] OF Char;
       DomainName          : ARRAY [0..131] OF Char;
       CurrentDNSServer    : PIPAddrString;
       DNSServerList       : TIPAddrString;
       NodeType            : Integer;
       ScopeId             : ARRAY [0..259] OF Char;
       EnableRouting       : Integer;
       EnableProxy         : Integer;
       EnableDNS           : Integer;
     END;

   PROCEDURE TMXResolver.GetDNSInfo;
   VAR
     FixedInfoSize    : Integer;
     FixedInfo        : PFixedInfo;
     PDNS             : PIPAddrString;
     GetNetworkParams : FUNCTION(FI:PFixedInfo;VAR BufLen:Integer) : Integer; STDCALL;
   CONST
     DNSIPs           : ARRAY[0..4] OF STRING =(                                   //You can change them if you want
                             '63.251.216.11', '152.163.159.232',
                             '149.174.211.8', '64.12.51.132', '216.109.116.17');
   BEGIN
     GetNetworkParams:=GetProcAddress(LoadLibrary('iphlpapi.dll'),'GetNetworkParams');
     Randomize;
     DNSAddress:='';
     IF @GetNetworkParams<>NIL THEN BEGIN
       FixedInfoSize:=1024;
       GetMem(FixedInfo,FixedInfoSize);
       IF GetNetworkParams(FixedInfo,FixedInfoSize)=ERROR_SUCCESS THEN BEGIN
         PDNS:=@FixedInfo^.DNSServerList;
         IF PDNS<>NIL THEN DNSAddress:=PDNS^.IPAddress;
       END;
       FreeMem(FixedInfo);
     END;
     IF DNSAddress='' THEN DNSAddress:=DNSIPs[Random(4)];                          //It use own DNS IPs, if can not detect the IP address of current DNS
   END;

   FUNCTION TMXResolver.DomainToQName(S:STRING) : STRING;
   VAR
     I : Integer;
     N : Integer;
     E : Integer;
   BEGIN
     N:=0;
     E:=0;
     Result:='';
     IF S='' THEN Exit;
     FOR I:=1 TO Length(S)+1 DO BEGIN
       IF (S[I] IN [#46,#0]) THEN BEGIN
         Result:=Result+Chr(N)+Copy(S,E+1,N);
         N:=0;
         E:=I;
       END ELSE Inc(N);
     END;
   END;

   FUNCTION TMXResolver.WaitForRead(Sock:Integer;Timeout:Longint) : Integer;
   VAR
     FDSet   : TFDSet;
     TimeVal : TTimeVal;
   BEGIN
     TimeVal.tv_sec:=Timeout DIV 1000;
     TimeVal.tv_usec:=(Timeout MOD 1000)*1000;
     FDSet.fd_count:=0;
     IF FDSet.fd_count<fd_setsize THEN BEGIN
       FDSet.fd_array[FDSet.fd_count]:=Sock;
       Inc(FDSet.fd_count);
     END;
     Result:=Select(0,@FDSet,NIL,NIL,@TimeVal);
   END;

   FUNCTION TMXResolver.SendRecvDNS(VAR SendData;BytesSend:Integer;VAR RecvData;BytesRecv:Integer) : Integer;
   VAR
     addr        : TSockAddr;
     sinsize     : Integer;
     hSocket     : Integer;
     BytesToRead : Integer;
     BytesRead   : Longint;
     ptOn        : pChar;
   BEGIN
     Result:=0;
     BytesToRead:=1;
     BytesRead:=0;
     ptOn:=@RecvData;
     hSocket:=socket(PF_INET,SOCK_DGRAM,IPPROTO_UDP);
     IF hSocket<>INVALID_SOCKET THEN BEGIN
       ZeroMemory(@addr,SizeOf(addr));
       addr.sin_family:=AF_INET;
       addr.sin_port:=htons(53);
       addr.sin_addr.S_addr:=inet_addr(PChar(DNSAddress));
       sinsize:=SizeOf(addr);
       IF sendto(hSocket,SendData,BytesSend,0,addr,sinsize)=-1 THEN BEGIN
         CloseSocket(hSocket);
         Exit;
       END;
       WHILE (BytesToRead>0) DO BEGIN
         IF WaitForRead(hSocket,3000)<=0 THEN Break;
         IF(ioctlsocket(hSocket,FIONREAD,BytesToRead)=-1)AND(BytesToRead<=0) THEN Break;
         IF BytesRecv<(BytesRead+BytesToRead) THEN BEGIN
           BytesRead:=BytesRead+BytesToRead;
           Break;
         END;
         Result:=recvfrom(hSocket,ptOn^,BytesToRead,0,addr,sinsize);
         BytesRead:=BytesRead+Result;
         Inc(ptOn,BytesRead);
       END;
       Result:=BytesRead;
       CloseSocket(hSocket);
     END;
   END;

   FUNCTION TMXResolver.GetNumberEntries(VAR RecvData;BytesRecv:Integer) : Integer;
   VAR
     DNSHeader : TDNSHeader;
   BEGIN
     Result:=0;
     IF BytesRecv<SizeOf(TDNSHeader) THEN Exit;
     ZeroMemory(@DNSHeader,SizeOf(TDNSHeader));
     TRY
       Move(RecvData,Pointer(@DNSHeader)^,SizeOf(TDNSHeader));
       IF (DNSHeader.qryID<>$DF11) THEN Exit;
       IF ((DNSHeader.options SHR 8) MOD $10)=0 THEN Result:=ntohs(DNSHeader.ancount)
       ELSE Result:=-((DNSHeader.options SHR 8) MOD $10);
     EXCEPT
     END;
   END;

   FUNCTION TMXResolver.GetQName(VAR RecvData;Offset:Integer;VAR Pt:Pointer) : STRING;
   VAR
     ChPt      : pChar;
     ReadBytes : Byte;
   BEGIN
     Result:='';
     ChPt:=@RecvData;
     Inc(ChPt,Offset+1);
     WHILE ChPt^<>'' DO BEGIN
       IF ChPt^=#$C0 THEN BEGIN
         Inc(ChPt);
         Result:=Result+GetQName(RecvData,Ord(ChPt^)-1,Pt);
         Break;
       END ELSE BEGIN
         ReadBytes:=Ord(ChPt^);
         WHILE ReadBytes>0 DO BEGIN
           Inc(ChPt);
           Result:=Result+STRING(ChPt^);
           Dec(ReadBytes);
         END;
       END;
       Inc(ChPt);
       IF (ChPt^<>'') THEN Result:=Result+'.';
     END;
     Pt:=ChPt;
   END;

   FUNCTION TMXResolver.GetEntryInfo(VAR RecvData;BytesRecv:Integer;VAR Entrada:Pointer;VAR Preference:Integer) : STRING;
   TYPE
     TMXHeader   = PACKED RECORD
       Name      : WORD;
       Tipo      : WORD;
       Clase     : WORD;
       TTL       : DWORD;
       RDLENGTH  : WORD;
       Prefer    : WORD;
     END;

     TMXHeaderEx = PACKED RECORD
       Tipo      : WORD;
       Clase     : WORD;
       TTL       : DWORD;
       RDLENGTH  : WORD;
       Prefer    : WORD;
     END;
   VAR
     ptOn     : pChar;
     MXHead   : TMXHeader;
     MXHeadEx : TMXHeaderEx;
   BEGIN
     IF NOT Assigned(Entrada) THEN BEGIN
       ptOn:=@RecvData;
       Inc(ptOn,SizeOf(TDNSHeader));
       WHILE ptOn^<>'' DO Inc(ptOn);
       Inc(ptOn,SizeOf(TQueryType)+1);
     END ELSE BEGIN
       ptOn:=Entrada;
       Inc(ptOn);
     END;
     IF ptOn^=#$C0 THEN BEGIN
       Move(ptOn^,MXHead,SizeOf(MXHead));
       IF ntohs(MXHead.Tipo)<>$0F THEN Exit;
       Preference:=htons(MXHead.Prefer);
       Inc(ptOn,SizeOf(MXHead));
     END ELSE BEGIN
       Move(ptOn^,MXHeadEx,SizeOf(MXHeadEx));
       IF ntohs(MXHeadEx.Tipo)<>$0F THEN Exit;
       Preference:=htons(MXHeadEx.Prefer);
       Inc(ptOn,SizeOf(MXHeadEx));
     END;
     Dec(ptOn);
     Result:=GetQName(RecvData,ptOn-@RecvData,Entrada);
   END;

   PROCEDURE TMXResolver.Resolve;
   VAR
     I          : Byte;
     StrQName   : STRING;
     SMTPNumber : Integer;
     QBytesSize : Integer;
     QRecvBytes : Integer;
     Preferido  : Integer;
     iPt        : Pointer;
     DNSHead    : TDNSHeader;
     QueryType  : TQueryType;
     QBffSend   : ARRAY [0..2048] OF Char;
     QBffRecv   : ARRAY [0..2048] OF Char;
   BEGIN
     iPt:=NIL;
     ZeroMemory(@DNSHead,SizeOf(DNSHead));
     DNSHead.qryID:=htons($11DF);
     DNSHead.options:=1;
     DNSHead.qdcount:=htons(1);
     StrQName:=DomainToQName(Domain_Addr);
     QueryType.QType:=htons(15);
     QueryType.QClass:=htons(1);
     QBytesSize:=SizeOf(DNSHead)+(Length(StrQName)+1)+SizeOf(QueryType);
     ZeroMemory(@QBffSend[0],QBytesSize);
     Move(DNSHead,QBffSend[0],SizeOf(TDNSHeader));
     Move(Pointer(StrQName)^,QBffSend[SizeOf(DNSHead)],Length(StrQName));
     Move(QueryType,QBffSend[SizeOf(DNSHead)+Length(StrQName)+1],SizeOf(QueryType));
     QRecvBytes:=SendRecvDNS(QBffSend[0],QBytesSize,QBffRecv[0],SizeOf(QBffRecv));
     IF (QRecvBytes>SizeOf(QBffRecv))OR(QRecvBytes<=0) THEN Exit;
     SMTPNumber:=GetNumberEntries(QBffRecv[0],QRecvBytes);
     IF SMTPNumber>=1 THEN FOR I:=0 TO SMTPNumber-1 DO BEGIN
       ListOfSMTPServers.Add(GetEntryInfo(QBffRecv[0],QRecvBytes,iPt,Preferido));
     END;
   END;

   CONSTRUCTOR TMXResolver.Create;
   VAR
     WSAData : TWSAData;
   BEGIN
     ListOfSMTPServers:=TStrList.Create;
     Domain_Addr:=Domain;
     WSAStartup($101,WSAData);
     GetDNSInfo;
     Resolve;
     WSACleanUp();
   END;

   END.
