uses dos, mylib;

var
  max, n : word;
  f : file;
  r : searchrec;
  mx : word;
  buf : array[1..8192] of byte;
  i : integer;
begin
  max := 0;
  assign(output, 'stamms.inc');
  rewrite(output);
  n := 0;
  findfirst('*.com', anyfile, r);
  while doserror = 0 do
  begin
    inc(n);
    assign(f, r.name);
    reset(f,1);
    blockread(f, buf, sizeof(buf), mx);
    close(f);

    i := 0;
    repeat inc(i); until buf[i] <> 0;
    writeln('stamm_',n,':');
    writeln('                DW ',hexword(i-1),'H');
    if i+1 > max then max := i+1;
    writeln('                DB 0',hexbyte(buf[i]),'H');
    repeat inc(i); until buf[i] <> 0;
    writeln('                DW ',hexword(i-1),'H');
    if i+4 > max then max := i+4;
    writeln('                DD 0',hexbyte(buf[i+3]),
                             hexbyte(buf[i+2]),
                             hexbyte(buf[i+1]),
                             hexbyte(buf[i+0]),'H');

    inc(i, 3);
    repeat inc(i); until buf[i] <> 0;
    writeln('                DW ',hexword(i-1),'H');
    if i+1 > max then max := i+1;
    writeln('                DB 0',hexbyte(buf[i]),'H');
    repeat inc(i); until buf[i] <> 0;
    if i+4 > max then max := i+4;
    writeln('                DW ',hexword(i-1),'H');
    writeln('                DD 0',hexbyte(buf[i+3]),
                             hexbyte(buf[i+2]),
                             hexbyte(buf[i+1]),
                             hexbyte(buf[i+0]),'H');

    inc(i, 4);


    findnext(r);
  end;
  writeln;
  writeln('stamms_num      equ     ',n);
  writeln('stamms_max_ip   equ     ',max);
  close(output);
end.
