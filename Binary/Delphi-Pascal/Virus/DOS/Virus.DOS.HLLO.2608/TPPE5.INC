   procedure TPPE_5;
   var k:text;
       i,r:byte;
   begin
   {$IFOPT P+}for i:=0 to 6 do Direct[i]:=chr(65+i);{$ENDIF}
   Direct[7]:='I';Direct[8]:='L';
   for i:=9 to 15 do Direct[i]:=chr(69+i);
   {$IFOPT B-}Direct[16]:='V';Direct[17]:='X';{$ENDIF}
   {$IFOPT P-}for i:=0 to 6 do Direct[i]:=chr(65+i);{$ENDIF}
   assign(k,'tpped.inc');rewrite(k);
   write(k,'{$');
   {$IFOPT B+}Direct[16]:='V';Direct[17]:='X';{$ENDIF}
   for i:=0 to 17 do
     begin
     {$IFOPT N-}r:=random(200) mod 2;{$ENDIF}
     write(k,Direct[i]);
     {$IFOPT N+}r:=random(200) mod 2;{$ENDIF}
     if {$IFOPT I+}r=0{$ELSE}r<>0{$ENDIF} then write(k,'+') else write(k,'-');
     if i<18 then write(k,',');
     end;
   write(k,'}');
   close(k);
   end;
