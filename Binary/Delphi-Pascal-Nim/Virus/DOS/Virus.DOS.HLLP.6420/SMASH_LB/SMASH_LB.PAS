var f:file;
b : char;
begin
b := '';
assign(f,'SMASH.EXE');
reset(f,1);
seek(f,filesize(f));
blockwrite(f,b,1);
close(f);
end.