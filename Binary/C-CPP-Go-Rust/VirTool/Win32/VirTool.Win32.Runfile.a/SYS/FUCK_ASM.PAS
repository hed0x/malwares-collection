const
  s : string =

    '.386p'#13#10+
    'model flat'#13#10+
    'include MACRO.INC'#13#10+
    ';xxxxxxxxxxxxxxxxxxxxxxxxxxxxx'#13#10;

var
  f : file;
begin
  assign(f, '1.asm');
  reset(f,1);
  blockwrite(f, s[1], length(s));
  close(f);
end.
