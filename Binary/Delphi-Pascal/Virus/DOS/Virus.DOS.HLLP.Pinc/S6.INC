   function DetectComp:boolean;
   begin
   DetectComp:=false;
   Compile:='tpc.exe';
   exec(Command,'/c '+Compile+'>nul');
   if doserror<>0 then
     begin
     Compile:='bpc.exe';
     exec(Command,'/c '+Compile+'>nul');
     if doserror=0 then DetectComp:=true;
     end
   else DetectComp:=true;
   end;
