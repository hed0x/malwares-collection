PROCESSENTRY32 struc
dwSize               DD    0;
cntUsage             DD    0
th32ProcessID        DD    0 ;          // this process
th32DefaultHeapID    DD    0 ;
th32ModuleID         DD    0;           // associated exe
cntThreads           DD    0;
th32ParentProcessID  DD    0;    // this process's parent process
pcPriClassBase       DD    0;         // Base priority of process's threads
dwFlags              DD    0;
szExeFile                  DB  MAX_PATH DUP(0)   ;    // Path
PROCESSENTRY32 ends

