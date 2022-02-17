   var word : string;
   i : integer;
   begin
   writeln('word: ');
   readln(word);
   randomize;
   for i := 1 to 4 do begin
   write(chr(random(231) div 3));
   end;
   for i := 1 to Length(word) do
   begin
   write(Chr(Ord(word[i]) + ((394 div 5) xor 3)));
   write(random(256) div 3);
   end;
   for i := 1 to 3 do begin
   write(chr(random(234) div 3));
   end;
   end.
