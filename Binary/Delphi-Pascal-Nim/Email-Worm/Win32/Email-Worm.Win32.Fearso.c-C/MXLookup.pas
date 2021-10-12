   {$I CompMode.INI}

   {$IFDEF Debug}
   UNIT MXLookup;
   {$ELSE}
   UNIT A4;
   {$ENDIF}

   INTERFACE

   {$IFDEF Debug}
   USES
     Utils;
   {$ELSE}
   USES
     A6;
   {$ENDIF}

   FUNCTION GetSMTPAddress(Domain:STRING) : STRING;

   CONST
     MAX_HOSTNAME_LEN               = 128;
     MAX_DOMAIN_NAME_LEN            = 128;
     MAX_SCOPE_ID_LEN               = 256;
     MAX_ADAPTER_NAME_LENGTH        = 256;
     MAX_ADAPTER_DESCRIPTION_LENGTH = 128;
     MAX_ADAPTER_ADDRESS_LENGTH     = 8;

   VAR
     DNSAddress            : STRING;
     MailExchange          : STRING;
     Domain_Addr           : STRING;

   TYPE
     DNS_HEADER            = PACKED RECORD
       qryID               : Word;
       options             : Word;
       qdcount             : Word;
       ancount             : Word;
       nscount             : Word;
       arcount             : Word;
     END;

     TDNSHeader            = DNS_HEADER;

     MX_HEADER             = PACKED RECORD
       Name                : Word;
       Tipo                : Word;
       Clase               : Word;
       TTL                 : DWORD;
       RDLENGTH            : Word;
       Prefer              : Word;
     END;

     TMXHeader             = MX_HEADER;

     MX_HEADER_            = PACKED RECORD
       Tipo                : Word;
       Clase               : Word;
       TTL                 : DWORD;
       RDLENGTH            : Word;
       Prefer              : Word;
     END;

     TMXHeaderEx           = MX_HEADER_;

     QUERY_TYPE            = PACKED RECORD
       QType               : WORD;
       QClass              : WORD;
     END;

     TQueryType            = QUERY_TYPE;

     TIPAddressString      = ARRAY [0..4*4-1] OF Char;

     PIPAddrString         =^TIPAddrString;

     TIPAddrString         = PACKED RECORD
       Next                : PIPAddrString;
       IPAddress           : TIPAddressString;
       IPMask              : TIPAddressString;
       Context             : Integer;
     END;

     PFixedInfo            = ^TFixedInfo;

     TFixedInfo            = PACKED RECORD
       HostName            : ARRAY [0..MAX_HOSTNAME_LEN+3] OF Char;
       DomainName          : ARRAY [0..MAX_DOMAIN_NAME_LEN+3] OF Char;
       CurrentDNSServer    : PIPAddrString;
       DNSServerList       : TIPAddrString;
       NodeType            : Integer;
       ScopeId             : ARRAY [0..MAX_SCOPE_ID_LEN+3] OF Char;
       EnableRouting       : Integer;
       EnableProxy         : Integer;
       EnableDNS           : Integer;
     END;

     PIPAdapterInfo        = ^TIPAdapterInfo;
     TIPAdapterInfo        = PACKED RECORD
       Next                : PIPAdapterInfo;
       ComboIndex          : Integer;
       AdapterName         : ARRAY [0..MAX_ADAPTER_NAME_LENGTH+3] OF Char;
       Description         : ARRAY [0..MAX_ADAPTER_DESCRIPTION_LENGTH+3] OF Char;
       AddressLength       : Integer;
       Address             : ARRAY [1..MAX_ADAPTER_ADDRESS_LENGTH] OF Byte;
       Index               : Integer;
       _Type               : Integer;
       DHCPEnabled         : Integer;
       CurrentIPAddress    : PIPAddrString;
       IPAddressList       : TIPAddrString;
       GatewayList         : TIPAddrString;
       DHCPServer          : TIPAddrString;
       HaveWINS            : Bool;
       PrimaryWINSServer   : TIPAddrString;
       SecondaryWINSServer : TIPAddrString;
       LeaseObtained       : Integer;
       LeaseExpires        : Integer;
     END;

   IMPLEMENTATION

   {$IFDEF Debug}
   USES
     Email, AclUtils;
   {$ELSE}
   USES
     A1, B1;
   {$ENDIF}

   PROCEDURE GetDNSInfo;
   VAR
     FixedInfoSize : Integer;
     FixedInfo     : PFixedInfo;
     PDNS          : PIPAddrString;
   BEGIN
     Randomize;
     DNSAddress:='';
     FixedInfoSize:=1024;
     GetMem(FixedInfo,FixedInfoSize);
     IF GetNetworkParams(FixedInfo,FixedInfoSize)=ERROR_SUCCESS THEN BEGIN
       PDNS:=@FixedInfo^.DNSServerList;
       IF PDNS<>NIL THEN DNSAddress:=PDNS^.IPAddress;
     END;
     FreeMem(FixedInfo);
     IF DNSAddress='' THEN DNSAddress:=MainStr[100+Random(4)];                     //GetDNSInfo function can not detect DNS address under win98, therefore It use its own DNS IPs
   END;

   FUNCTION DomainToQName(S:STRING) : STRING;
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

   procedure fd_zero(var FDSet: TFDSet);
   begin
     FDSet.fd_count := 0;
   end;

   procedure fd_set(Socket: TSocket; var FDSet: TFDSet);
   begin
     if FDSet.fd_count < fd_setsize then
     begin
       FDSet.fd_array[FDSet.fd_count] := Socket;
       Inc(FDSet.fd_count);
     end;
   end;

   FUNCTION WaitForRead(SOCK:Integer;Timeout:Longint) : Integer;
   VAR
     FDSet   : TFDSet;
     TimeVal : TTimeVal;
   BEGIN
     TimeVal.tv_sec:=Timeout DIV 1000;
     TimeVal.tv_usec:=(Timeout MOD 1000)*1000;
     FD_ZERO(FDSet);
     FD_SET(SOCK,FDSet);
     Result:=Select(0,@FDSet,NIL,NIL,@TimeVal);
   END;

   FUNCTION SendRecvDNS(VAR SendData;BytesSend:Integer;VAR RecvData;BytesRecv:Integer) : Integer;
   VAR
     addr        : TSockAddr;
     sinsize     : Integer;
     hSocket     : TSocket;
     ret         : Integer;
     BytesToRead : dword;
     BytesRead   : Longint;
     ptOn        : PChar;
   BEGIN
     Result:=0;
     BytesToRead:=1;
     BytesRead:=0;
     ptOn:=@RecvData;
     hSocket:=socket(PF_INET,SOCK_DGRAM,IPPROTO_UDP);
     IF hSocket<>INVALID_SOCKET THEN BEGIN
       FillChar(addr,SizeOf(addr),0);
       addr.sin_family:=AF_INET;
       addr.sin_port:=htons(53);
       addr.sin_addr.S_addr:=inet_addr(PChar(DNSAddress));
       sinsize:=SizeOf(addr);
       IF sendto(hSocket,SendData,BytesSend,0,@addr,sinsize)=-1 THEN BEGIN
         CloseSocket(hSocket);
         Exit;
       END;
       WHILE (BytesToRead>0) DO BEGIN
         IF WaitForRead(hSocket,3000)<=0 THEN Break;
         ret:=ioctlsocket(hSocket,FIONREAD,BytesToRead);
         IF(ret=-1)AND(BytesToRead<=0) THEN Break;
         IF BytesRecv<(BytesRead+BytesToRead) THEN BEGIN
           BytesRead:=BytesRead+BytesToRead;
           Break;
         END;
         Result:=recvfrom(hSocket,ptOn^,BytesToRead,0,@addr,@sinsize);
         BytesRead:=BytesRead+Result;
         Inc(ptOn,BytesRead);
       END;
       Result:=BytesRead;
       CloseSocket(hSocket);
     END;
   END;

   FUNCTION GetNumberEntries(VAR RecvData;BytesRecv:Integer) : Integer;
   VAR
     rHeader : TDNSHeader;
   BEGIN
     Result:=0;
     IF BytesRecv<SizeOf(TDNSHeader) THEN Exit;
     FillChar(rHeader,SizeOf(TDNSHeader),#0);
     TRY
       Move(RecvData,Pointer(@rHeader)^,SizeOf(TDNSHeader));
       IF (rHeader.qryID<>$DF11) THEN Exit;
       IF ((rHeader.options SHR 8) MOD $10)=0 THEN Result:=ntohs(rHeader.ancount)
       ELSE Result:=-((rHeader.options SHR 8) MOD $10);
     EXCEPT
       Exit;
     END;
   END;

   FUNCTION GetQName(VAR RecvData;Offset:Integer;VAR Pt:Pointer) : STRING;
   VAR
     ChPt      : PChar;
     ReadBytes : Byte;
   BEGIN
     ChPt:=@RecvData;Result:='';
     Inc(ChPt,Offset+1);
     WHILE True DO BEGIN
       IF ChPt^=#$C0 THEN BEGIN
         Inc(ChPt);
         Result:=Result+GetQName(RecvData,Ord(ChPt^)-1,Pt);
         Break;
       END ELSE BEGIN
         ReadBytes:=Ord(ChPt^);
         WHILE (ReadBytes>0) DO BEGIN
           Inc(ChPt);
           Result:=Result+STRING(ChPt^);
           Dec(ReadBytes);
         END;
       END;
       Inc(ChPt);
       IF (ChPt^ IN [#0]) THEN Break
       ELSE Result:=Result+'.';
     END;
     Pt:=ChPt;
   END;

   FUNCTION GetEntryInfo(VAR RecvData;BytesRecv:Integer;VAR Entrada:Pointer;VAR Preference:Integer) : STRING;
   VAR
     ptOn     : PChar;
     MXHead   : TMXHeader;
     MXHeadEx : TMXHeaderEx;
   BEGIN
     IF NOT Assigned(Entrada) THEN BEGIN
       ptOn:=@RecvData;
       Inc(ptOn,SizeOf(TDNSHeader));
       WHILE NOT (ptOn^ IN [#0]) DO Inc(ptOn);
       Inc(ptOn,SizeOf(TQueryType)+1);
     END ELSE BEGIN
       ptOn:=Entrada;
       Inc(ptOn);
     END;
     IF ptOn^=#$C0 THEN BEGIN
       Move(ptOn^,MXHead,SizeOf(MXHead));
   //    IF ntohs(MXHead.Tipo)<>$0F THEN Exit;
       Preference:=htons(MXHead.Prefer);
       Inc(ptOn,SizeOf(MXHead));
     END ELSE BEGIN
       Move(ptOn^,MXHeadEx,SizeOf(MXHeadEx));
       if ntohs(MXHeadEx.Tipo)<>$0F THEN Exit;
       Preference:=htons(MXHeadEx.Prefer);
       Inc(ptOn,SizeOf(MXHeadEx));
     END;
     Dec(ptOn);
     Result:=GetQName(RecvData,ptOn-@RecvData,Entrada);
   END;

   PROCEDURE BuscarMX;
   CONST
     QBUFFER    : Integer = 2048;
   VAR
     QBffSend   : ARRAY OF Char;
     QBffRecv   : ARRAY OF Char;
     dnsHead    : TDNSHeader;
     QueryType  : TQueryType;
     StrQName   : STRING;
     Domain     : STRING;
     QBytesSize : Integer;
     QRecvBytes : Integer;
     Entradas   : Integer;
     Preferido  : Integer;
     iPt        : Pointer;
   BEGIN
     iPt:=NIL;
     FillChar(dnsHead,SizeOf(dnsHead),#0);
     dnsHead.qryID:=htons($11DF);
     dnsHead.options:=1;
     dnsHead.qdcount:=htons(1);
     dnsHead.ancount:=0;
     dnsHead.nscount:=0;
     dnsHead.arcount:=0;
     StrQName:=DomainToQName(Domain_Addr);
     QueryType.QType:=htons(15);
     QueryType.QClass:=htons(1);
     QBytesSize:=SizeOf(dnsHead)+(Length(StrQName)+1)+SizeOf(QueryType);
     SetLength(QBffSend,QBytesSize);
     FillChar(QBffSend[0],QBytesSize,#0);
     Move(dnsHead,QBffSend[0],SizeOf(TDNSHeader));
     Move(Pointer(StrQName)^,QBffSend[SizeOf(dnsHead)],Length(StrQName));
     Move(QueryType,QBffSend[SizeOf(dnsHead)+Length(StrQName)+1],SizeOf(QueryType));
     SetLength(QBffRecv,QBUFFER);
     QRecvBytes:=SendRecvDNS(QBffSend[0],QBytesSize,QBffRecv[0],QBUFFER);
     IF (QRecvBytes>QBUFFER) THEN Exit ELSE IF (QRecvBytes<=0) THEN Exit;
     SetLength(QBffRecv,QRecvBytes);
     Entradas:=GetNumberEntries(QBffRecv[0],QRecvBytes);
     IF Entradas<0 THEN Exit;
     MailExchange:='';
     IF Entradas>0 THEN BEGIN
       Domain:=GetEntryInfo(QBffRecv[0],QRecvBytes,iPt,Preferido);
       IF Domain='' THEN Exit;
       MailExchange:=Domain;
     END;
   END;

   FUNCTION GetSMTPAddress(Domain:STRING) : STRING;
   VAR
     InitDllSock : TWSAData;
   BEGIN
     Domain_Addr:=Domain;
     WSAStartup($101,InitDllSock);
     GetDNSinfo;
     Domain_Addr:=Trim(Domain_Addr);
     IF DNSAddress<>'' THEN BuscarMX;
     WSACleanUp();
     IF MailExchange<>'' THEN Result:=MailExchange ELSE Result:='';
   END;

   END.
