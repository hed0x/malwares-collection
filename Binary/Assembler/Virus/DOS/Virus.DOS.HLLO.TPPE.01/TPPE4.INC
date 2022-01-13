procedure TPPE_4;
var k,l,n:byte;
    f:text;
    st:string;
begin
{$IFOPT L+}inc(Dummy);{$ELSE}Dummy:=Dummy+1;{$ENDIF}
str(Dummy+MaxInc,st);
assign(f,'tppe'+st+'.inc');
{$IFOPT D-}n:=random(5)+4;{$ENDIF}
rewrite(f);
writeln(f,'procedure tppe'+st+';assembler;');
{$IFOPT D+}n:=random(5)+4;{$ENDIF}
write(f,'const tppe'+st+'_1 :array [1..',n,'] of byte = (');
for k:=1 to n-1 do write(f,random(255),',');
writeln(f,random(255),');');
writeln(f,'asm');
for k:=1 to random(15)+1 do
   begin
   write(f,'db ');
   for l:=1 to random(20)+1 do write(f,random(256),',');
   {$IFOPT P+}st:='[TPPE 0.1] (c) by Duke/SMF';{$ENDIF}
   writeln(f,random(256));
   end;
writeln(f,'end;');
close(f);
end;