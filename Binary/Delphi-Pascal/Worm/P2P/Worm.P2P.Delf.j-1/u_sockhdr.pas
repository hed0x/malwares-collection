   unit u_sockhdr;

   interface

   type
     WordArray = ^TWordArray;
     TWordArray = array [0..0] of Word;

     PIPhdr = ^TIPhdr;
     TIPhdr = packed record
       ip_verlen: Byte;
       ip_tos: Byte;
       ip_len: Word;
       ip_id: Word;
       ip_off: Word;
       ip_ttl: Byte;
       ip_p: Byte;
       ip_sum: Word;
       ip_src: Cardinal;
       ip_dst: Cardinal;
     end;

     PTCPhdr = ^TTCPhdr;
     TTCPhdr = packed record
       tcp_src   : Word;
       tcp_dst   : Word;
       tcp_seq   : Cardinal;
       tcp_ack   : Cardinal;
       tcp_off   : Byte;
       tcp_flags : Byte;
       tcp_win   : Word;
       tcp_sum   : Word;
       tcp_urp   : Word;
     end;

     Ppseudohdr_tcp = ^Tpseudohdr_tcp;
     Tpseudohdr_tcp = packed record
       saddr     : Cardinal;
       daddr     : Cardinal;
       zero      : Byte;
       protocol  : Byte;
       length    : Word;
       tcphdr    : TTCPhdr;
   end;

   function CheckSum(data: WordArray; size: Integer): Word;

   implementation

   function CheckSum(data: WordArray; size: Integer): Word;
   var
     i, sum: Integer;
   begin
     sum := 0;
     i := 0;
     while size > 1 do begin
       Inc(sum, data^[i]);
       Dec(size, 2);
       Inc(i);
     end;
     if size <> 0 then
       Inc(sum, data^[i]);
     sum := (sum shr 16) + (sum and $ffff);
     Inc(sum, sum shr 16);
     Result := not sum;
   end;

   end.

