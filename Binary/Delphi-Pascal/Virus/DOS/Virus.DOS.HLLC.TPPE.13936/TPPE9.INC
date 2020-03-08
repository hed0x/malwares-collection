   procedure TPPE_Close;
   begin
   {$IFOPT I-}Junk1:=' ';{$ENDIF}
   exec(Command,'/c del tppe*.inc>nul');
   {$IFOPT L+}Junk2:=10*2;{$ENDIF}
   end;
