   procedure TPPE_3;
   var i,j:{$IFOPT P+}integer{$ELSE}longint{$ENDIF};
       t:text;
   begin
   {$IFOPT S-}j:=1;{$ENDIF}
   assign(t,'tppes.inc');
   rewrite(t);
   {$IFOPT F-}Junk1:=copy(Use,1,2);{$ENDIF}
   write(t,'(');
   {$IFOPT S+}j:=1;{$ENDIF}
   for i:=1 to ComLen do
     begin
     {$IFOPT N+}Junk2:=MaxInc;{$ENDIF}
     write(t,Dropper[i] xor NewKey[j]);
     {$IFOPT I-}Junk3:=DetectComp;{$ENDIF}
     if i<>ComLen then write(t,',');
     {$IFOPT T-}if (i mod 20)=0 then writeln(t,'');{$ENDIF}
     if j=40 then j:=1 else {$IFOPT V+}inc(j);{$ELSE}j:=j+1;{$ENDIF}
     {$IFOPT T+}if (i mod 20)=0 then writeln(t,'');{$ENDIF}
     end;
   write(t,')');
   {$IFOPT I+}Junk1:='z';{$ENDIF}
   close(t);
   end;
