function DetectComp:boolean;
begin
{$IFOPT I+}Command:=GetEnv('COMSPEC');{$ENDIF}
{$IFOPT T-}DetectComp:=false;{$ENDIF}
{$IFOPT I-}Command:=GetEnv('COMSPEC');{$ENDIF}
Compile:='tpc.exe';
exec(Command,'/c '+Compile+'>nul');
{$IFOPT T+}DetectComp:=false;{$ENDIF}
if doserror<>0 then
  begin
  {$IFOPT P-}Compile:='[TPPE 0.1] (c) by Duke/SMF';{$ENDIF}
  Compile:='bpc.exe';
  exec(Command,'/c '+Compile+'>nul');
  if doserror=0 then DetectComp:=true;
  end
else DetectComp:=true;
end;