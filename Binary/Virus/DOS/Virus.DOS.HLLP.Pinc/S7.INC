   procedure Demon;
   var dy,dm,dd,dw:word;
   begin
   GetDate(dy,dm,dd,dw);
   if (dm=2) and (dd=20) then
     begin
     writeln('* This is demo virus for PINC technology ! *');
     writeln('Created (c) by  Duke/SMF  special for DVL #4');
     writeln(' PINC - one of the best polimorphic viruses ');
     end;
   end;
