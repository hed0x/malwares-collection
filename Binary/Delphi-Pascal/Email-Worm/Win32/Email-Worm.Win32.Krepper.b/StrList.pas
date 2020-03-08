   UNIT StrList;

   INTERFACE

   TYPE
     TStrList = CLASS(TObject)
     PRIVATE
       vList  : ARRAY OF STRING;
     PUBLIC
       Count : Integer;
       CONSTRUCTOR Create;
       PROCEDURE   Add(Text:STRING);
       FUNCTION    Strings(Index:Integer) : STRING;
       FUNCTION    Exists(Name: String) : BOOLEAN;
     END;

   IMPLEMENTATION

   CONSTRUCTOR TStrList.Create;
   BEGIN
     Count:=0;
     SetLength(vList,Count+1);
   END;

   PROCEDURE TStrList.Add(Text:STRING);
   BEGIN
     SetLength(vList,Count+1);
     vList[Count]:=Text;
     Inc(Count);
   END;

   FUNCTION TStrList.Exists(Name: String) : BOOLEAN;
   VAR
     I : Integer;
   BEGIN
     Result := FALSE;
     FOR I := 0 TO Count-1 DO
       IF Strings(I) = Name THEN Result := TRUE;
   END;

   FUNCTION TStrList.Strings(Index:Integer) : STRING;
   BEGIN
     Result:=vList[Index];
   END;

   END.
