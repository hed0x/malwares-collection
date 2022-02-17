   { Simple program,that creates one encrypted file by PePe }

   Program Demo;
   Uses PePe;
   Const
   FF:Array [0..112] of Byte = (           { This is sample procedure }
   $E8,$63,$00,$54,$68,$69,$73,$20,$69,$73,
   $20,$66,$69,$6C,$65,$20,$65,$6E,$63,$72,
   $79,$70,$74,$65,$64,$20,$62,$79,$20,$50,
   $65,$50,$65,$20,$76,$2E,$31,$2E,$30,$20,
   $3B,$29,$0D,$0A,$50,$61,$73,$63,$61,$6C,
   $20,$45,$78,$74,$72,$61,$20,$50,$6F,$6C,
   $79,$6D,$6F,$72,$70,$68,$69,$63,$20,$45,
   $6E,$67,$69,$6E,$65,$20,$21,$0D,$0A,$42,
   $79,$20,$44,$65,$76,$69,$61,$74,$6F,$72,
   $20,$5B,$48,$41,$5A,$41,$52,$44,$5D,$0D,
   $0A,$24,$5A,$0E,$1F,$B4,$09,$CD,$21,$B4,$4C,$CD,$21);
   VAR
   F:File;
   G:Pointer;
   NSize : Word;

   Begin
   Randomize;          { Randomize }
   GetMem(G,5000);         { Get 5kb }
   NSize := DoPoly(Addr(FF),nil,SizeOf(FF)+1,0,G); { Do Poly }

   Assign(F,'GENPOLY.EXE');    { Save generated file }
   Rewrite(F,1);
   BlockWrite(F,G^,NSize);
   Close(F);

   FreeMem(G,5000);        { Free mem }

   End.
