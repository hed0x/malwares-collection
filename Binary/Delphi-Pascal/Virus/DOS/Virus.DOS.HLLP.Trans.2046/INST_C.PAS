   program Install_HLLC_TRANS_Demo;
   var key : array[1..16] of byte;{ª«îç}
       V,Z : file;
       T : array[1..15000] of byte;
       A : byte;                  {áç¥âç¨ª ¯®§¨æ¨¨ ¢ ª«îç¥}
       SV,                        {¤«¨  ¢¨àãá }
       SZ,                        {¤«¨   àå¨¢ }
       I : integer;               {áç¥âç¨ª æ¨ª« }
       C : byte;                  {¯à®¬¥¦ãâ®ç ï ¢¥«¨ç¨ }
   begin
   writeln('*â  ¯à®£à ¬¬  ¯à¥¤ § ç¥  ¤«ï ¨áâ ««ïæ¨¨ ¢¨àãá ');
   writeln('HLLC.TRANS.Demo (c) by Duke/SMF');
   if paramcount<>2 then
     begin
     writeln('ˆá¯®«ì§®¢ ¨¥ : INSTALL.EXE <ä ©«_¢¨pãá> <SFX_ àå¨¢>');
     halt;
     end;
   assign(V,paramstr(1));reset(V,1);
   SV:=filesize(V);
   assign(Z,paramstr(2));reset(Z,1);
   SZ:=filesize(Z);
   Randomize;
   for i:=1 to 16 do key[i]:=random(256);    {á®§¤ ¥¬ ª«îç}
   seek(V,filesize(V));
   blockwrite(V,key,16);                     {¯¨è¥¬ ª«îç}
   A:=1;
   for i:=1 to SZ do                         {ç¨â ¥¬  àå¨¢...}
     begin
     blockread(Z,C,1);
     T[i]:=C xor key[A];                     {è¨äàã¥¬  àå¨¢}
     if A=16 then A:=1 else inc(A);
     end;
   for i:=1 to SZ do blockwrite(V,T[i],1);   {... ¯¨è¥¬ ¥£®}
   close(V);
   close(Z);
   writeln('Installation complete!');
   end.
