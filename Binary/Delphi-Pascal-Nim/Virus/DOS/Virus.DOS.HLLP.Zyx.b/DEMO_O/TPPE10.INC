procedure TPPE_Close;
begin
exec(Command,'/c del tppe*.inc>nul');
end;