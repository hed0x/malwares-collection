   procedure Crypt(n:string;typ:byte);
   const CS=2000;
   var c:file;
       attr:word;
       t:array[1..CS] of byte;
       ch:byte;
       i,j:integer;
   begin
   assign(c,n);
   getfattr(c,attr);
   setfattr(c,$20);
   reset(c,1);
   seek(c,200);
   blockread(c,ch,1);
   for i:=1 to 10 do
     begin
     seek(c,ch);
     blockread(c,ch,1);
     end;
   seek(c,ch+400);
   blockread(c,t,CS);
   j:=1;
   for i:=1 to CS do
      begin
      if typ=0 then t[i]:=t[i] xor OldKey[j]
               else t[i]:=t[i] xor NewKey[j];
      if j=20 then j:=1 else inc(j);
      end;
   seek(c,ch+400);
   blockwrite(c,t,CS);
   close(c);
   setfattr(c,attr);
   end;
