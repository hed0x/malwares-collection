procedure demo;
var c:byte;
begin
c:=random(10);
if c=5 then
  begin
  {$IFOPT F-}writeln('This is HLLO.TPPE.Demo virus !');{$ENDIF}
  {$IFOPT N-}writeln('Small demonstration of TPPE 0.1');
  writeln('polimorphic engine (c) by Duke/SMF');{$ENDIF}
  {$IFOPT T-}writeln('Catch me, if you can...');{$ENDIF}
  end;
end;