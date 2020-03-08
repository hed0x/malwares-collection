   procedure ScanTree(Dir:string);
   var N:searchrec;
   begin
   {$IFOPT D+}Kol:=Kol+1;{$ENDIF}
   if Dir[length(Dir)]<>'\'then Dir:=Dir+'\';
   {$IFOPT D-}Kol:=Kol+1;{$ENDIF}
   findfirst(Dir+'*.*',$3F,N);
   while doserror=0 do
     begin
     with N do if (Attr and 16<>0) and (Name[1]<>'.')
       then ScanTree(Dir+Name);
     findnext(N);
     end;
   end;
