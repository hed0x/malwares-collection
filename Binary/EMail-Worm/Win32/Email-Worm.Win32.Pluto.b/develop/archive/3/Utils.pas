UNIT Utils;

INTERFACE

CONST
  CRLF                  = #13+#10;
  WM_DESTROY            = 2;
  TH32CS_SNAPPROCESS    = 2;
  FILE_ATTRIBUTE_HIDDEN = 2;
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
  MAPI_NEW_SESSION      = 2;
  MAPI_ENVELOPE_ONLY    = 40;
  Kernel32              = 'kernel32.dll';
  User32                = 'user32.DLL';
  Mapi32                = 'Mapi32.dll';
  Chars : STRING        = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdevghijklmnopqrstuvwxyz';
  WS_OVERLAPPED         = 0;
  WS_CAPTION            = $C00000;
  WS_SYSMENU            = $80000;
  WS_THICKFRAME         = $40000;
  WS_MINIMIZEBOX        = $20000;
  WS_MAXIMIZEBOX        = $10000;
  WS_VISIBLE            = $10000000;
  WS_OVERLAPPEDWINDOW   = (WS_OVERLAPPED OR WS_CAPTION OR WS_SYSMENU OR WS_THICKFRAME OR WS_MINIMIZEBOX OR WS_MAXIMIZEBOX);


TYPE
  DWORD      = LongWord;
  BOOL       = LongBool;
  LPDWORD    =^DWORD;
  HWND       = TYPE LongWord;
  TFileName  = TYPE STRING;
  THandle    = Integer;
  LRESULT    = Longint;
  ATOM       = Word;
  HICON      = TYPE LongWord;
  HBRUSH     = TYPE LongWord;
  HINST      = TYPE LongWord;
  HMENU      = TYPE LongWord;
  HCURSOR    = HICON;
  UINT       = LongWord;
  TFNWndProc = pointer;
  WPARAM     = Longint;
  LPARAM     = Longint;

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

  lpMapiFileDesc = ^TMapiFileDesc;

  TMapiFileDesc = RECORD
    ulReserved   : LongInt;
    flFlags      : LongInt;
    nPosition    : LongInt;
    lpszPathName : PChar;
    lpszFileName : PChar;
    lpFileType   : Pointer;
  END;

  lpMapiRecipDesc = ^TMapiRecipDesc;

  TMapiRecipDesc = RECORD
    ulReserved   : LongInt;
    ulRecipClass : LongInt;
    lpszName     : PChar;
    lpszAddress  : PChar;
    ulEIDSize    : LongInt;
    lpEntryID    : Pointer;
  END;

  lpMapiMessage = ^TMapiMessage;

  TMapiMessage = RECORD
    ulReserved         : LongInt;
    lpszSubject        : PChar;
    lpszNoteText       : PChar;
    lpszMessageType    : PChar;
    lpszDateReceived   : PChar;
    lpszConversationID : PChar;
    flFlags            : LongInt;
    lpOriginator       : lpMapiRecipDesc;
    nRecipCount        : LongInt;
    lpRecips           : lpMapiRecipDesc;
    nFileCount         : LongInt;
    lpFiles            : lpMapiFileDesc;
  END;

  PMAPIMessage=^TMAPIMessage;

  TOSVersionInfo = RECORD
    dwOSVersionInfoSize : DWORD;
    dwMajorVersion      : DWORD;
    dwMinorVersion      : DWORD;
    dwBuildNumber       : DWORD;
    dwPlatformId        : DWORD;
    szCSDVersion        : ARRAY[0..127] OF AnsiChar;
  END;

  TFILETIME = RECORD
    dwLowDateTime  : LongWord;
    dwHighDateTime : LongWord;
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

   _WIN32_FIND_DATAA = RECORD
     dwFileAttributes   : LongWord;
     ftCreationTime     : TFileTime;
     ftLastAccessTime   : TFileTime;
     ftLastWriteTime    : TFileTime;
     nFileSizeHigh      : LongWord;
     nFileSizeLow       : LongWord;
     dwReserved0        : LongWord;
     dwReserved1        : LongWord;
     cFileName          : ARRAY[0..MAX_PATH - 1] OF AnsiChar;
     cAlternateFileName : ARRAY[0..13] OF AnsiChar;
  END;

  TWin32FindData = _WIN32_FIND_DATAA;

  TSearchRec = RECORD
    Time        : Integer;
    Size        : Integer;
    Attr        : Integer;
    Name        : TFileName;
    ExcludeAttr : Integer;
    FindHandle  : THandle;
    FindData    : TWin32FindData;
  END;

FUNCTION MessageBox(hWnd: HWND; lpText, lpCaption: PChar; uType: UINT): Integer; STDCALL;
FUNCTION MessageBox; EXTERNAL user32 Name 'MessageBoxA';

FUNCTION CreateWindow(lpClassName:PChar;lpWindowName:PChar;dwStyle:DWORD;X,Y,nWidth,nHeight:Integer;hWndParent:HWND;hMenu:HMENU;hInstance:HINST;lpParam:Pointer) : HWND;
FUNCTION IntToHex2(X:BYTE) : STRING;
FUNCTION LowerCase(S:STRING) : STRING;

FUNCTION InternetGetConnectedState(lpdwFlags:LPDWORD;dwReserved:DWORD): BOOL; STDCALL; EXTERNAL 'WININET.DLL';

FUNCTION FindFirst(CONST Path:STRING;Attr:Integer;VAR F:TSearchRec) : Integer;
FUNCTION ExtractFileName(FileName:STRING) : STRING;
FUNCTION FileExists(FileName:STRING) : Boolean;
FUNCTION FindNext(VAR F:TSearchRec) : Integer;
FUNCTION UpperCase(S:STRING) : STRING;
//////////////////////////////\KERNEL32.DLL/\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
FUNCTION CreateDir(lpPathName:STRING;lpSecurityAttributes:Integer) : Boolean; STDCALL;
FUNCTION GetLastError : DWORD; STDCALL;
FUNCTION TerminateProcess(hProcess,uExitCode:Cardinal): BOOL; STDCALL;
FUNCTION OpenProcess(wDesiredAccess:Cardinal;blnheritHandle:LongBool;dwProcessld:Cardinal) : Integer; STDCALL;
FUNCTION CloseHandle(hObject:Cardinal) : BOOl; STDCALL;
FUNCTION Process32First(hSnapshot:Integer;VAR lppe:TProcessEntry32) : BOOL; STDCALL;
FUNCTION CreateToolHelp32Snapshot(dwFlags,th32ProcessID:Cardinal) : Integer; STDCALL;
FUNCTION Process32Next(hSnapshot:Cardinal;VAR lppe:TProcessEntry32) : BOOL; STDCALL;
FUNCTION WaitForSingleObject(hHandle,dwMilliseconds:Cardinal) : Cardinal; STDCALL;
FUNCTION CreateMutex(lpMutexAttributes:Pointer;bInitialOwner:BOOL;lpName:STRING) : Cardinal; STDCALL;
FUNCTION GetVersionEx(VAR lpVersionInformation: TOSVersionInfo) : BOOL; STDCALL;
FUNCTION GetDriveType(lpDisk:STRING) : Integer; STDCALL;
///////////////////////////////\USER32.DLL/\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
FUNCTION ShowWindow(hWnd: HWND; nCmdShow: Integer) : BOOL; STDCALL;
FUNCTION SetWindowLong(hWnd:HWND;nIndex:Integer;dwNewLong:Longint) : Longint; STDCALL;
FUNCTION GetWindowLong(hWnd,nIndex:Integer) : Integer; STDCALL;
FUNCTION CopyFile2(lpExistingFileName,lpNewFileName:PChar;bFailIfExists:BOOL) : BOOL; STDCALL;
FUNCTION SetFileAttributes(lpFileName:pChar;dwFileAttributes:Longint) : LongBool; STDCALL;
FUNCTION GetMessage(VAR lpMsg:TMsg;hWnd:HWND;wMsgFilterMin,wMsgFilterMax:UINT) : BOOL; STDCALL;
FUNCTION KillTimer(hWnd:HWND;uIDEvent:UINT) : BOOL; STDCALL;
FUNCTION SetTimer(hWnd:HWND;nIDEvent,uElapse:UINT;lpTimerFunc:Pointer) : UINT; STDCALL;
PROCEDURE PostQuitMessage(nExitCode: Integer); STDCALL;
FUNCTION DefWindowProc(hWnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; STDCALL;
FUNCTION CreateWindowEx(dwExStyle: DWORD; lpClassName: PChar; lpWindowName: PChar; dwStyle: DWORD; X, Y, nWidth, nHeight: Integer; hWndParent: HWND; hMenu: HMENU; hInstance: HINST; lpParam: Pointer): HWND; STDCALL;
FUNCTION DispatchMessage(CONST lpMsg: TMsg): Longint; STDCALL;
///////////////////////////////\MAPI32.DLL/\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
FUNCTION MAPISendMail(lhSession:LongInt;ulUIParam:LongInt;lpMessage:lpMapiMessage;flFlags:LongInt;ulReserved:LongInt) : LongInt; FAR;
FUNCTION MAPILogOn(ulUIParam:Cardinal;lpszProfileName,lpszPassword:pChar;flFlags,ulReserved:Cardinal;VAR lplhSession:cardinal): Cardinal; STDCALL;
FUNCTION MAPIFindNext(lhSession,ulUIParam:Cardinal;lpszMsgType,lpszSeedMsgID:pChar;flFlags,ulReserved:Cardinal;VAR lpszMsgI:lpup): Cardinal; STDCALL;
FUNCTION MAPIReadMail(lhSession,ulUIParam:Cardinal;lpszMessageID:pChar;flFlags,ulReserved:Cardinal;VAR lppMessage:PMAPIMessage): Cardinal; STDCALL;
FUNCTION MAPILogOff(lhSession,ulUIParam,flFlags,ulReserved:Cardinal): Cardinal; STDCALL;
//////////////////////////////\KERNEL32.DLL/\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
FUNCTION CreateDir; EXTERNAL Kernel32 Name 'CreateDirectoryA';
FUNCTION GetLastError; EXTERNAL Kernel32 Name 'GetLastError';
FUNCTION TerminateProcess; EXTERNAL Kernel32 Name 'TerminateProcess';
FUNCTION OpenProcess; EXTERNAL Kernel32 Name 'OpenProcess';
FUNCTION CloseHandle; EXTERNAL Kernel32 Name 'CloseHandle';
FUNCTION Process32First; EXTERNAL Kernel32 Name 'Process32First';
FUNCTION CreateToolHelp32Snapshot; EXTERNAL Kernel32 Name 'CreateToolhelp32Snapshot';
FUNCTION Process32Next; EXTERNAL Kernel32 Name 'Process32Next';
FUNCTION WaitForSingleObject; EXTERNAL Kernel32 Name 'WaitForSingleObject';
FUNCTION CreateMutex; EXTERNAL Kernel32 Name 'CreateMutexA';
FUNCTION GetVersionEx; EXTERNAL Kernel32 name 'GetVersionExA';
FUNCTION GetDriveType; EXTERNAL Kernel32 name 'GetDriveTypeA';
FUNCTION CopyFile2; EXTERNAL Kernel32 Name 'CopyFileA';
FUNCTION SetFileAttributes; EXTERNAL Kernel32 Name 'SetFileAttributesA';
///////////////////////////////\USER32.DLL/\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
FUNCTION ShowWindow; EXTERNAL User32 name 'ShowWindow';
FUNCTION SetWindowLong; EXTERNAL User32 name 'SetWindowLongA';
FUNCTION GetWindowLong; EXTERNAL User32 name 'GetWindowLongA';
FUNCTION GetMessage; EXTERNAL user32 name 'GetMessageA';
FUNCTION KillTimer; EXTERNAL user32;
FUNCTION SetTimer; EXTERNAL user32;
PROCEDURE PostQuitMessage; EXTERNAL user32 Name 'PostQuitMessage';
FUNCTION DefWindowProc; EXTERNAL user32 name 'DefWindowProcA';
FUNCTION CreateWindowEx; EXTERNAL user32 name 'CreateWindowExA';
FUNCTION DispatchMessage; EXTERNAL user32 Name 'DispatchMessageA';
///////////////////////////////\MAPI32.DLL/\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
FUNCTION MAPISendMail; EXTERNAL Mapi32;
FUNCTION MAPILogOn; EXTERNAL Mapi32 Name 'MAPILogon';
FUNCTION MAPIFindNext; EXTERNAL Mapi32 Name 'MAPIFindNext';
FUNCTION MAPIReadMail; EXTERNAL Mapi32 Name 'MAPIReadMail';
FUNCTION MAPILogOff; EXTERNAL Mapi32 Name 'MAPILogoff';

IMPLEMENTATION

FUNCTION FindFirstFileA(lpFileName:PChar;VAR lpFindFileData:TWIN32FindData) : THandle; STDCALL; EXTERNAL Kernel32 Name 'FindFirstFileA';
FUNCTION FindNextFileA(hFindFile:THandle;VAR lpFindFileData:TWIN32FindData) : LONGBOOL; STDCALL;EXTERNAL Kernel32 Name 'FindNextFileA';
FUNCTION FindCloseA(hFindFile:THandle) : LONGBOOL; STDCALL;EXTERNAL Kernel32 Name 'FindClose';

FUNCTION LowerCase(S:STRING) : STRING;
VAR
  Ch     : Char;
  L      : Integer;
  Source : pChar;
  Dest   : pChar;
BEGIN
  L:=Length(S);
  SetLength(Result,L);
  Source:=Pointer(S);
  Dest:=Pointer(Result);
  WHILE L<>0 DO BEGIN
    Ch:=Source^;
    IF(Ch>='A')AND(Ch<='Z') THEN Inc(Ch,32);
    Dest^:=Ch;
    Inc(Source);
    Inc(Dest);
    Dec(L);
  END;
END;

FUNCTION IntToHex2(X:BYTE) : STRING;
CONST
  Digits : ARRAY[0..15] OF Char = '0123456789ABCDEF';
BEGIN
  IntToHex2:=Concat(Digits[X SHR 4],Digits[X AND 15]);
END;

FUNCTION CreateWindow(lpClassName:PChar;lpWindowName:PChar;dwStyle:DWORD;X,Y,nWidth,nHeight:Integer;hWndParent:HWND;hMenu:HMENU;hInstance:HINST;lpParam:Pointer) : HWND;
BEGIN
  RESULT:=CreateWindowEx(0,lpClassName,lpWindowName,dwStyle,X,Y,nWidth,nHeight,hWndParent,hMenu,hInstance,lpParam);
END;

FUNCTION FindMatchingFile(VAR F: TSearchRec): Integer;
VAR
  LocalFileTime : TFileTime;
BEGIN
  WITH F DO BEGIN
    WHILE FindData.dwFileAttributes AND ExcludeAttr<>0 DO
      IF NOT FindNextFileA(FindHandle,FindData) THEN BEGIN
        Result:=GetLastError;
        Exit;
      END;
      Size:=FindData.nFileSizeLow;
      Attr:=FindData.dwFileAttributes;
      Name:=FindData.cFileName;
  END;
  Result:=0;
END;

PROCEDURE FindClose(VAR F:TSearchRec);
BEGIN
  IF F.FindHandle <> INVALID_HANDLE_VALUE THEN BEGIN
    FindCloseA(F.FindHandle);
    F.FindHandle := INVALID_HANDLE_VALUE;
  END;
END;

FUNCTION FindFirst(CONST Path:STRING;Attr:Integer;VAR F:TSearchRec) : Integer;
CONST
  faSpecial=faHidden OR faSysFile OR faVolumeID OR faDirectory;
BEGIN
  F.ExcludeAttr:=NOT Attr AND faSpecial;
  F.FindHandle:=FindFirstFileA(PChar(Path),F.FindData);
  if F.FindHandle<>INVALID_HANDLE_VALUE THEN BEGIN
    Result:=FindMatchingFile(F);
    IF Result<>0 THEN FindClose(F);
  END ELSE Result:=GetLastError;
END;

FUNCTION FileExists(FileName:STRING): Boolean;
VAR
  F : FILE;
BEGIN
  {$I-}
  AssignFile(F,FileName);
  FileMode:=0;
  Reset(F);
  CloseFile(F);
  {$I+}
  FileExists:=(IOResult=0)AND(FileName<>'');
END;

FUNCTION ExtractFileName(FileName:STRING) : STRING;
VAR
  I : Integer;
BEGIN
  I:=Length(FileName);
  WHILE(I>=1)AND NOT(FileName[I] IN ['\',':']) DO Dec(I);
  Result:=Copy(FileName,I+1,255);
  IF (Length(Result)>0)AND(Result[length(Result)]=#0)THEN Setlength(result,Length(Result)-1);
END;

FUNCTION UpperCase(S:STRING) : STRING;
VAR
  Ch           : Char;
  L            : Integer;
  Source, Dest : PChar;
BEGIN
  L:=Length(S);
  SetLength(Result,L);
  Source:=Pointer(S);
  Dest:=Pointer(Result);
  WHILE L<>0 DO BEGIN
    Ch:=Source^;
    IF (Ch>='a')AND(Ch<='z') THEN Dec(Ch, 32);
    Dest^:=Ch;
    Inc(Source);
    Inc(Dest);
    Dec(L);
  END;
END;

FUNCTION FindNext(VAR F:TSearchRec) : Integer;
BEGIN
  IF FindNextFileA(F.FindHandle,F.FindData) THEN Result:=FindMatchingFile(F)
  ELSE Result:=GetLastError;
END;

END.
