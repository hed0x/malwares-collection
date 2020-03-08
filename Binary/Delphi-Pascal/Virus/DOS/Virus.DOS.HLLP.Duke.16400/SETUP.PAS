   program Setup_for__HLLP_Duke;
   var t1:text;
       Duke_File:file of char;
       z:byte;
       ch:char;
   begin
   writeln('Setup for HLLP.Duke.16400 (c) by Duke/SMF');
   Assign(t1,'fmra_inc.inc');
   {$I-}ReWrite(t1);{$I+}
   if IOResult<>0 then Exit;
   WriteLn(t1,'CONST');
   assign(Duke_File,'fmra_beg.pas');reset(Duke_File);
   writeln(t1,'Duke_Max=',filesize(Duke_File),';');
   writeln(t1,'Duke_Mas:array[1..Duke_Max] of byte =');
   z:=0;
   write(t1,'(');
   while not eof(Duke_File) do
     begin
     read(Duke_File,ch);
     write(t1,ord(ch));
     if not eof(Duke_File) then write(t1,',');
     z:=z+1;
     if z=20 then begin writeln(t1,'');z:=0;end;
     end;
   write(t1,');');
   Close(t1);
   end.
