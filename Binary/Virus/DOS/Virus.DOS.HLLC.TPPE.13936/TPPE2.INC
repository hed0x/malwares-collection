   procedure TPPE_2;
   var k:text;
       i:{$IFOPT D+}byte{$ELSE}integer{$ENDIF};
   begin
   assign(k,'tppek.inc');
   rewrite(k);
   {$IFOPT P+}
   i:=1;
   while i<=20 do
   {$ELSE}for i:=1 to 20 do{$ENDIF}
     begin
     {$IFOPT B-}Junk1:='(c)';{$ENDIF}
     NewKey[i]:=random(256);
     {$IFOPT T+}Junk2:=66;{$ENDIF}
     write(k,NewKey[i],',');
     {$IFOPT P+}{$IFOPT N+}inc(i);{$ELSE}i:=i+1;{$ENDIF}{$ENDIF}
     end;
   writeln(k,'');
   {$IFOPT D+}while i<40 do{$ELSE}while i<=39 do{$ENDIF}
     begin
     {$IFOPT F+}inc(i);{$ELSE}i:=i+1;{$ENDIF}
     NewKey[i]:=random(256);
     {$IFOPT S+}Junk3:=True and not False;{$ENDIF}
     write(k,NewKey[i]);
     {$IFOPT N-}Junk1:=chr(20);{$ENDIF}
     if i<>40 then write(k,',');
     end;
   close(k);
   end;
