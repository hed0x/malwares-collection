   uses dos;
   var
     t:text;
     s:string;
     j,build:integer;
     first:boolean;
     year,month,day,dw,hour,min,sec,sec100:word;
   function n2(n:integer):string;
     begin
       n2:=chr((n div 10) mod 10 + $30)+
           chr((n div  1) mod 10 + $30);
     end;
   begin
     build:=0;
     assign(t,'build.dat');
   {$i-}
     reset(t);
   {$i+}
     if ioresult=0 then begin
       while not eof(t) do
       begin
         readln(t,s);
         if (s<>'') and (s[1]='#') then
           val(copy(s,4,4),build,j);
       end;
       close(t);
       append(t);
     end else begin
       rewrite(t);
       writeln(t,'; GENERATED FILE. DO NOT EDIT!');
       writeln(t,';--nnnn--dd/mm/yyyy--hh:mm:ss---');
     end;
     inc(build);
     writeln('current build: ',build);
     getdate(year,month,day,dw);
     gettime(hour,min,sec,sec100);
     writeln(t,'#  ',
               (build div 1000) mod 10,
               (build div  100) mod 10,
               (build div   10) mod 10,
               (build div    1) mod 10,
               '  ',
               n2(day),'/',n2(month),'/',year:4,
               '  ',
               n2(hour),':',n2(min),':',n2(sec));
     close(t);
   end.
