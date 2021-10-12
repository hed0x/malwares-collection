   procedure FindDir(Dir:string);
   var N:searchrec;
   begin
   M:=M+1;
   {$IFOPT B-}if M=K then P:=Dir;{$ENDIF}
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
   {$IFOPT B+}if M=K then P:=Dir;{$ENDIF}
   end;
