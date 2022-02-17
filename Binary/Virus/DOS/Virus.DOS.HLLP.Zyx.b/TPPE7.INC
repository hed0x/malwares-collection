procedure TPPE_Mutation;
begin
Dummy:=0;
{$IFOPT N+}AntiTrace;{$ENDIF}
TPPE_2;
{$IFOPT D+}TPPE_3;{$ENDIF}
TPPE_5;
{$IFOPT D-}TPPE_3;{$ENDIF}
TPPE_6;
end;