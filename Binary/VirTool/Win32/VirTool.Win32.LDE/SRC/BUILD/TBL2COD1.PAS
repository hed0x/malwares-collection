
const
   infile =  '..\flagtabl.dat';
   outfile1 = 'dump1.txt';
   outfile2 = 'flagtbl1.inc';

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
n1,n2,mm,z,m,l,i,j:integer;
a:array[1..512] of string[64];
b:array[1..100] of string[64];
c,d,n,p1,p0:array[1..100] of integer;

max:word;
buf:array[1..1024] of byte;
_tl,_tc,_c,_l:longint;

function findmin(nor:integer):integer;
var k,mink:integer;
begin
 mink:=-1;
 for k:=1 to mm do
   if k<>nor then
   if n[k]=0 then
   if (mink=-1) or (c[k]<c[mink]) then mink:=k;
 findmin:=mink;
end;


procedure writetree(lab:string;w:integer);
  procedure proc1;
    begin
      if p1[w]<=m then begin
        writeln(o,lab,'1:');
        writeln(o,'mov     eax, ',b[p1[w]]); inc(z,5);
        writeln(o,'retn'); inc(z);
      end else begin
        writetree(lab+'1',p1[w]);
      end;
    end;
  procedure proc0;
    begin
      if p0[w]<=m then begin
        writeln(o,lab,'0:');
        writeln(o,'mov     eax, ',b[p0[w]]); inc(z,5);
        writeln(o,'retn'); inc(z);
      end else begin
        writetree(lab+'0',p0[w]);
      end;
    end;
begin
  writeln(o,lab,':');
  writeln(o,'call    @@getbit'); inc(z,5);

  case random(2) of
    0: begin
         writeln(o,'jnc     ',lab,'0'); inc(z,2);
         proc1;
         proc0;
       end;{case 0}
    1: begin
         writeln(o,'jc      ',lab,'1'); inc(z,2);
         proc0;
         proc1;
       end;{case 1}
  end; {case}
end;

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
writeln('- building tree');
fillchar(n,sizeof(n),0);
fillchar(p1,sizeof(p1),0);
fillchar(p0,sizeof(p0),0);
mm:=m;
repeat
n1:=findmin(-1);
if (n1=-1) then break;
n2:=findmin(n1);
if (n2=-1) then break;
inc(mm);
c[mm]:=c[n1]+c[n2];
d[n1]:=1;
d[n2]:=0;
n[n1]:=mm;
n[n2]:=mm;
p1[mm]:=n1;
p0[mm]:=n2;
until false;
if c[mm]<>512 then
begin
  writeln('***ERROR***: error building tree');
  halt;
end;
writeln('(',mm,' nodes)');
n[mm]:=-1;

writeln('- dump');
assign(o,outfile1);
rewrite(o);
for i := 1 to m do
begin
  write(o,i:2,'. ',b[i]:20,'  ',c[i]:5,'  ');
  j:=i;
  s:='';
  repeat
    s:=chr(d[j]+$30)+s;
    j:=n[j];
  until n[j]=-1;
  writeln(o,s);
end;
close(o);

writeln('- packing');
max:=0;
_c:=0;
_l:=0;
for i := 1 to 512 do
begin
  for j:=1 to m do
    if a[i]=b[j] then
      break;
  _tc:=0;
  _tl:=0;
  repeat
    _tc:=(_tc shl 1) or d[j];
    inc(_tl);
    j:=n[j];
  until n[j]=-1;
  _c:=_c or (_tc shl _l);
  inc(_l,_tl);
  while (_l>=8) or (i=512) do
  begin
    inc(max);
    buf[max]:=_c and 255;
    _c := _c shr 8;
    dec(_l,8);
    if (_l<=0)and(i=512) then break;
  end;
end;
while max mod 4<>0 do begin inc(max); buf[max]:=0; end;
writeln('(',max,' bytes)');

writeln('- converting');
assign(o,outfile2);
rewrite(o);
writeln(o,'; GENERATED FILE. DO NOT EDIT');
writeln(o,'; ----- begin of FLAGTBL1.INC -----');
writeln(o,'@@buildflagtbl:');
writeln(o,'xor     eax, eax'); z:=2;
for i := max div 4 downto 1 do
begin
  s:='0'+hexbyte(buf[i*4-0])+
         hexbyte(buf[i*4-1])+
         hexbyte(buf[i*4-2])+
         hexbyte(buf[i*4-3])+'h';
  if s='000000000h' then s:='eax';
  writeln(o,'push    ',s);
  if s='eax' then inc(z) else inc(z,5);
end;

writeln(o,'mov     ecx, 512'); inc(z,5);
writeln(o,'xor     ebx, ebx'); inc(z,2);
writeln(o,'@@cycle:');
writeln(o,'call    @@tree');  inc(z,5);
writeln(o,'stosd'); inc(z);
writeln(o,'loop    @@cycle'); inc(z,2);
writeln(o,'retn'); inc(z);
writeln(o,'@@getbit:');
writeln(o,'or      ebx, ebx'); inc(z,2);
writeln(o,'jnz     @@skip');
writeln(o,'pop     eax'); inc(z);
writeln(o,'pop     esi'); inc(z);
writeln(o,'pop     edx'); inc(z);
writeln(o,'push    esi'); inc(z);
writeln(o,'push    eax'); inc(z);
writeln(o,'mov     bl, 32'); inc(z,2);
writeln(o,'@@skip:');
writeln(o,'dec     ebx'); inc(z);
writeln(o,'shr     edx, 1'); inc(z,2);
writeln(o,'retn'); inc(z);

writetree('@@tree',mm);

writeln(o,'; ----- end of FLAGTBL1.INC -----');
close(o);
writeln('(~',z,' bytes)');
writeln('- done');
end.
