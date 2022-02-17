var word : string;
i : byte;
begin
writeln;
readln(word);
delete(word,1,4);
delete(word,length(word)-2,3);
for i := 1 to length(word) div 2 do begin
write(Chr(Ord(word[i]) - ((394 div 5) xor 3)));
delete(word,i+1,1);
end;
end.