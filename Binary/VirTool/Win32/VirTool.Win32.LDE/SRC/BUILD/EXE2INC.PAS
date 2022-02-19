
const
  infile = 'ldrbin.exe';
  outfile = 'LDE32BIN.INC';

const
  hexchar:array[0..15] of char = '0123456789ABCDEF';
function hexbyte(b:byte):string;
begin
  hexbyte:=hexchar[b shr 4]+hexchar[b and 15];
end;
function hexword(w:word):string;
begin
  hexword:=hexbyte(hi(w))+hexbyte(lo(w));
end;

var
f:file;
t:text;
buf:array[1..32768] of byte;
max:word;
a,b,c,d:word;

function findid(s:string;x:integer):word;
var i,j:word;
begin
  for i:=1 to max-length(s) do
  begin
    for j:=1 to length(s) do
      if buf[i+j-1]<> ord(s[j]) then
        break;
    if j=length(s) then
    begin
      if x=1 then i:=i+length(s) else i := i-1;
      writeln('id found: ',s,' at 0x',hexword(i));
      findid := i;
      exit;
    end;
  end;
  writeln('***ERROR***: id not found: ',s);
  halt;
end;

procedure hexdump(x,y:word);
var
i:word;
begin
for i := x to y do
begin
  if (i-x) mod 8=0 then write(t,'db ');
  write(t,'0',hexbyte(buf[i]),'h');
  if ((i-x) mod 8 < 7) and (i<y) then write(t,',') else writeln(t);
end;
end;

begin
writeln('- reading file');
assign(f,infile);
reset(f,1);
if ioresult<>0 then
begin
  writeln('***ERROR***: file not found');
  halt;
end;
blockread(f,buf,sizeof(buf),max);
close(f);
writeln('- searching id`s');
a:=findid('[disasm_init:]',1);
b:=findid('[disasm_init_end:]',2);
c:=findid('[disasm_main:]',1);
d:=findid('[disasm_main_end:]',2);
writeln('- writing .inc');
assign(t,outfile);
rewrite(t);
writeln(t,'; LDE32BIN.INC -- Length-Disassembler Engine //32-bit');
writeln(t,'; generated file. do not edit');
writeln(t,'disasm_init:');
hexdump(a,b);
writeln(t,'disasm_main:');
hexdump(c,d);
close(t);
writeln('- done');
end.