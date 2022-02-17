procedure TPPE_4;
var k,l,n:{$IFOPT S+}integer{$ELSE}byte{$ENDIF};
    f:text;
    st:string;
begin
{$IFOPT L+}inc(Dummy);{$ELSE}Dummy:=Dummy+1;{$ENDIF}
str(Dummy+MaxInc,st);
{$IFOPT P-}Junk3:=Fake;{$ENDIF}
assign(f,'tppe'+st+'.inc');
{$IFOPT D-}n:=random(5)+4;{$ENDIF}
rewrite(f);
writeln(f,'procedure tppe'+st+';assembler;');
{$IFOPT D+}n:=random(5)+4;{$ENDIF}
write(f,'const tppe'+st+'_1 :array [1..',n,'] of byte = (');
{$IFOPT L+}Junk2:=Dr[random(10)+1];{$ENDIF}
for k:=1 to n-1 do write(f,random(255),',');
{$IFOPT N+}Junk1:=chr(Dr[5]);{$ENDIF}
writeln(f,random(255),');');
writeln(f,'asm');
for k:=1 to random(15)+1 do
   begin
   write(f,'db ');
   {$IFOPT V+}Junk3:=False;{$ENDIF}
   for l:=1 to random(20)+1 do write(f,random(256),',');
   {$IFOPT P+}st:='[TPPE 0.3] (c) by Duke/SMF';{$ENDIF}
   writeln(f,random(256));
   end;
{$IFOPT T-}Junk1:='s';{$ENDIF}
writeln(f,'end;');
close(f);
end;