procedure TPPE_Mutation;
begin
{$IFOPT B+}Junk3:=not False;{$ENDIF}
Dummy:=0;
{$IFOPT F-}Junk1:='(';{$ENDIF}
TPPE_2;
{$IFOPT D+}TPPE_3;{$ENDIF}
{$IFOPT N-}Junk2:=25 mod 4;{$ENDIF}
TPPE_5;
{$IFOPT S+}Junk1:=chr(ord('z'));{$ENDIF}
{$IFOPT D-}TPPE_3;{$ENDIF}
TPPE_6;
{$IFOPT P+}Junk2:=10 xor 5;{$ENDIF}
end;