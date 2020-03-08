   unit u_sysutils;

   interface

   uses
     Windows;

     function CanUpdate(const DelayValue: Cardinal; const Force: Boolean): Boolean;
     function StrtoInt(const S: string): integer;
     function InttoStr(const Value: integer): string;
     function StrToIntDef(const S: string; Default: integer): integer;
     function ExtractFileName(const Path: string): string;

   implementation

   var
     LastUpdate: Cardinal = 0;

   function CanUpdate(const DelayValue: Cardinal; const Force: Boolean): Boolean;
   begin
     Result := Force or ((GetTickCount - LastUpdate) >= DelayValue);
     if Result then LastUpdate := GetTickCount;
   end;

   function StrtoInt(const S: string): integer;
   var
     E: integer;
   begin
     Val(S, Result, E);
   end;

   function InttoStr(const Value: integer): string;
   var
     S: string[11];
   begin
     Str(Value, S);
     Result := S;
   end;

   function StrToIntDef(const S: string; Default: integer): integer;
   var
     E: integer;
   begin
     Val(S, Result, E);
     if E <> 0 then Result := Default;
   end;

   function ExtractFileName(const Path: string): string;
   var
     i, L: integer;
     Ch: Char;
   begin
     L := Length(Path);
     for i := L downto 1 do
     begin
       Ch := Path[i];
       if (Ch = '\') or (Ch = '/') then
       begin
         Result := Copy(Path, i + 1, L - i);
         Break;
       end;
     end;
   end;

   end.

