{ utility to convert destr.com to pascal text }

  uses dos;  
  var
    F: file of byte;
    t: text;
    I: integer;
    x: byte;

begin
  Assign(F, 'destr.com');
  Assign(T, 'lines.pas');
  Reset(F);
  Rewrite(T);
  For i := 0 to FileSize(F)-1 do begin
    Read(F, x);
    WriteLn(T, 'StartCode[', i, '] := ', x, ';');
  end;
  Close(F);  Close(T);
end.