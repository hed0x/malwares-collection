   const
     a : boolean = false;
   var
     i,o : text;
     s,q,t : string;

   procedure change_1(a,b : string);
     var
       p : integer;
     begin
       if paramstr(1) <> a then exit;

       p := pos(a,s);
       delete(s,p,length(a));
       insert(b,s,p);

     end;

   procedure change(a,b : string);
     var
       p : integer;
     begin

       p := pos(a,s);
       while p <> 0 do
       begin
         delete(s,p,length(a));
         insert(b,s,p);
         p := pos(a,s);
       end;

     end;

   begin
     writeln('Processing 1.ASM...');
     assign(i, '1.asm');
     reset(i);
     assign(o, '_temp_.$$$');
     rewrite(o);
     writeln(o, 'locals __');
     writeln(o, 'jumps');
     while not eof(i) do
     begin
       readln(i,s);

       move(s, mem[prefixseg:$80], 128);


       if paramcount = 3 then
       if copy(paramstr(1),1,1) = 'j' then
       if paramstr(2) = 'short' then
         s := paramstr(1) + ' '+ paramstr(3);


       if paramcount = 2 then
       begin
         if (paramstr(1) = ';') and (paramstr(2) = 'asm' ) then a := true;
         if (paramstr(1) = ';') and (paramstr(2) = 'end;') then a := false;
       end;

       if a then
       begin
         change('unsigned char','byte');   { change it back... suxxx! }
         change('unsigned int', 'word');
         change('unsigned long','dword');
       end;

       if paramstr(1) <> ';' then
         writeln(o,s);

     end;
     close(o);
     close(i);
     erase(i);
     rename(o,'1.asm');
     writeln('Done.');
   end.
