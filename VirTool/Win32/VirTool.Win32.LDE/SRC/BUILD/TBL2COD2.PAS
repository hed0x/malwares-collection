
const
  infile  = '..\flagtabl.dat';
  outfile1  = 'dump2.txt';
  outfile2 = 'flagtbl2.inc';
  
const
  reg_count = 5;
  reg_name : array[1..reg_count] of string[16] =
    ('eax','ebx','edx','esi','ebp');

const
  hexchar:array[0..15] of char = '0123456789ABCDEF';
function hexbyte(b:byte):string;
begin
  hexbyte:=hexchar[b shr 4]+hexchar[b and 15];
end;

label c1,c2;
var
t,o:text;
s:string;
k,z,m,l,i,j:integer;
a:array[1..512] of string[64];
b:array[1..100] of string[64];
c:array[1..100] of integer;


begin
writeln('- loading file');
assign(t,infile);
reset(t);
if ioresult<>0 then
begin
writeln('***ERROR***: file not found');
halt;
end;
l:=0;
while not eof(t) do
begin
inc(l);
readln(t,s);
if s='begin' then goto c1;
end;
begin
  writeln('***ERROR***: begin-mark not found');
  halt;
end;
c1:
for i := 1 to 512 do
begin
  j:=(i-1) and 255;
  if eof(t) then
  begin
    writeln('***ERROR***: end of file at line ',l+1);
    halt;
  end;
  inc(l);
  readln(t,s);
  if copy(s,1,8)<>hexchar[j shr 4]+hexchar[j and 15]+'      ' then
  begin
    writeln('***ERROR***: error in hex id in line ',l,' ("'+s+'")');
    halt;
  end;
  delete(s,1,8);
  while (s<>'') and (s[length(s)] in [#32,#9]) do dec(s[0]);
  while (s<>'') and (s[1] in [#32,#9]) do delete(s,1,1);
  if s='' then
  begin
    writeln('***ERROR***: error in line ',l);
    halt;
  end;
  a[i]:=s;
end;
inc(l);
readln(t,s);
if s<>'end' then
begin
  writeln('***ERROR***: end-mark not found at line ',l);
  halt;
end;
close(t);
writeln('- building alphabet');
m:=0;
fillchar(c,sizeof(c),0);
for i := 1 to 512 do
begin
  for j:=1 to m do
    if b[j]=a[i] then goto c2;
  inc(m);
  b[m]:=a[i];
  j:=m;
c2:
  inc(c[j]);
end;
for i := 1 to m do
for j := i+1 to m do
  if c[j]>c[i] then
  begin
    l:=c[i];
    c[i]:=c[j];
    c[j]:=l;
    s:=b[i];
    b[i]:=b[j];
    b[j]:=s;
  end;
writeln('- dump');
assign(o,outfile1);
rewrite(o);
for i := 1 to m do
begin
  write(o,i:2,'. ',b[i]:20,'  ',c[i]:5);
  if i<=reg_count then write(o,'   ',reg_name[i]);
  writeln(o);
end;
close(o);
writeln('- converting');
assign(o,outfile2);
rewrite(o);
writeln(o,'; GENERATED FILE. DO NOT EDIT');
writeln(o,'; ----- begin of FLAGTBL2.INC -----');
writeln(o,'@@buildflagtbl:'); z:=0;
writeln(o,'push    ebp'); inc(z);
writeln(o,'xchg    esp, edi'); inc(z,2);
writeln(o,'add     esp, 512*4'); inc(z,6);
writeln(o,'xor     ecx, ecx'); inc(z,2);

for i := 1 to reg_count do
begin
  writeln(o,'mov     ',reg_name[i],', ',b[i]); inc(z,5);
end;

for i := 1 to 256 do
begin
  s:=a[i];
  a[i]:=a[512+1-i];
  a[512+1-i]:=s;
end;

i:=1;
repeat
  k:=1;
  while (i<512) and (a[i]=a[i+1]) do begin inc(i); inc(k); end;
  { k dup i }

  for j := 1 to m do
    if a[i]=b[j] then break;

  if k<=4 then begin

    for k := 1 to k do
    begin

      if j<=reg_count then begin
        writeln(o,'push    ',reg_name[j]); inc(z);
      end else begin
        writeln(o,'push    ',a[i]); inc(z,5);
      end;

    end;

  end else begin

      writeln(o,'mov     cl, ',k); inc(z,2);
      if j<=reg_count then begin
        writeln(o,'push    ',reg_name[j]); inc(z);
        writeln(o,'loop    $-1'); inc(z,2);
      end else begin
        writeln(o,'push    ',a[i]); inc(z,5);
        writeln(o,'loop    $-5'); inc(z,2);
      end;

  end;

  inc(i);
until i>512;

writeln(o,'xchg    esp, edi'); inc(z,2);
writeln(o,'pop     ebp'); inc(z);
writeln(o,'retn'); inc(z);


writeln(o,'; ----- end of FLAGTBL2.INC -----');
close(o);
writeln('(~',z,' bytes)');
writeln('- done');
end.
