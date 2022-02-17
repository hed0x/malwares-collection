   program GenerateINC;
   const hp=$39b-1;
         tp=$201b;
   var f:file;
       g:text;
       z:byte;
       ch:char;
       i:integer;
   begin
   assign(f,'zyx.tpu');reset(f,1);
   assign(g,'head.inc');rewrite(g);
   z:=0;
   write(g,'(');
   for i:=0 to hp do
     begin
     blockread(f,ch,1);
     write(g,ord(ch));
     if i<> hp then write(g,',');
     z:=z+1;
     if z=20 then begin writeln(g,'');z:=0;end;
     end;
   write(g,')');
   close(g);
   assign(g,'tail.inc');rewrite(g);
   seek(f,tp);
   z:=0;
   write(g,'(');
   while not eof(f) do
     begin
     blockread(f,ch,1);
     write(g,ord(ch));
     if not eof(f) then write(g,',');
     z:=z+1;
     if z=20 then begin writeln(g,'');z:=0;end;
     end;
   write(g,')');
   close(g);
   close(f);
   end.
