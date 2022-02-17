   {$I CompMode.INI}

   {$IFDEF Debug}
   unit strlist;
   {$ELSE}
   UNIT A12;
   {$ENDIF}
   interface

   type
     TStrList = Class(TObject)
     private
       vList: Array of String;
       ListLn: Integer;
     public
       constructor Create;
       procedure Add(Text: String);
       function Strings(Index: Integer): String;
    //   procedure Clear;
       function Count: Integer;
     end;

   implementation

   constructor TStrList.Create;
   begin
     ListLn := 0;
     SetLength(vList, ListLn + 1);
   end;

   procedure TStrList.Add(Text: String);
   begin
     SetLength(vList, ListLn + 1);
     vList[Listln] := Text;
     Inc(Listln);
   end;

   {procedure TStrList.Clear;
   var
     i: Integer;
   begin
     For i := 0 to ListLn-1 do
       vList[i] := '';
     Listln := 0;
   end; }

   function TStrList.Strings(Index: Integer): String;
   begin
     Result := vList[Index];
   end;

   function TStrList.Count: Integer;
   begin
     Result := ListLn;
   end;

   end.
