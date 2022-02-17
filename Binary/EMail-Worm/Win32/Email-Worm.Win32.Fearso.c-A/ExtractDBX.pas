   {$I CompMode.INI}

   {$IFDEF Debug}
   UNIT ExtractDBX;
   {$ELSE}
   UNIT A2;
   {$ENDIF}

   INTERFACE

   PROCEDURE ExtrackEmailFromDBX(FilePath:STRING);

   IMPLEMENTATION

   {$IFDEF Debug}
   USES
     Email, ACLUtils, sClasses;
   {$ELSE}
   USES
     A1, B1, B2;
   {$ENDIF}

   PROCEDURE ExtrackEmailFromDBX(FilePath:STRING);
   VAR
     BufferSize : Integer;
     I          : Integer;
     hFile      : Integer;
     Buffer     : PChar;
     StrEmail   : STRING;
     F          : FILE;
   BEGIN
     AssignFile(F,FilePath);
     {$I-}
     Reset(F,1);
     IF IOResult=0 THEN BEGIN
       BufferSize:=FileSize(F);
       CloseFile(F);
       IF BufferSize<=0 THEN Exit;
       hFile:=FileOpen(FilePath,fmOpenRead);
       TRY
         IF hFile=0 THEN Exit;
         GetMem(Buffer,BufferSize+1);
         TRY
           FileRead(hFile,Buffer^,BufferSize);
           I:=0;
           WHILE I<=BufferSize-1 DO BEGIN
             StrEmail:='';
             IF Buffer[I]='<' THEN BEGIN
               Inc(I);
                WHILE (Buffer[I]<>'@')AND(I<=BufferSize) DO BEGIN
                  IF (Buffer[I]=CHR(45))OR(Buffer[I]=CHR(46))OR(Buffer[I]=CHR(90))OR((Buffer[I]>CHR(49))AND(Buffer[I]<=CHR(57)))OR((Buffer[I]>=CHR(65))AND(Buffer[I]<=CHR(90)))OR((Buffer[I]>=CHR(97))AND(Buffer[I]<=CHR(122))) THEN BEGIN
                    StrEmail:=StrEmail+Buffer[I];
                  END ELSE BEGIN
                    StrEmail:='';
                    Break;
                  END;
                  Inc(I);
                END;
                IF StrEmail<>'' THEN BEGIN
                  StrEmail:=StrEmail+'@';
                  Inc(I);
                  WHILE(Buffer[I]<>'.')AND(I<=BufferSize) DO BEGIN
                    IF(Buffer[I]=CHR(45))OR(Buffer[I]=CHR(46))OR(Buffer[I]=CHR(90))OR((Buffer[I]>=CHR(49))AND(Buffer[I]<=CHR(57)))OR((Buffer[I]>=CHR(65))AND(Buffer[I]<=CHR(90)))OR((Buffer[I]>=CHR(97))AND(Buffer[I]<=CHR(122))) THEN BEGIN
                      StrEmail:=StrEmail+Buffer[I];
                    END ELSE BEGIN
                      StrEmail:='';
                      Break;
                    END;
                    Inc(I);
                  END;
                  IF StrEmail<>'' THEN BEGIN
                     StrEmail:=StrEmail+'.';
                     Inc(i);
                     WHILE (Buffer[I]<>'>')AND(I<=BufferSize) DO BEGIN
                       IF (Buffer[I]=CHR(45))OR(Buffer[I]=CHR(46))OR(Buffer[I]=CHR(90))OR((Buffer[I]>=CHR(49))AND(Buffer[I]<=CHR(57)))OR((Buffer[I]>=CHR(65))AND(Buffer[I]<=CHR(90)))OR((Buffer[I]>=CHR(97))AND(Buffer[I]<=CHR(122))) THEN BEGIN
                       StrEmail:=StrEmail+Buffer[I];
                     END ELSE BEGIN
                       StrEmail:='';
                      Break;
                     END;
                     Inc(I);
                   END;
                   IF StrEmail<>'' THEN BEGIN
                     Emails.Add(StrEmail);
                     Inc(I);
                   END;
                 END;
               END;
             END ELSE Inc(I);
           END;
           FINALLY
             FreeMem(Buffer);
           END;
         FINALLY
           FileClose(hFile);
         END;
       END;
      {$I+}
     END;
   END.
