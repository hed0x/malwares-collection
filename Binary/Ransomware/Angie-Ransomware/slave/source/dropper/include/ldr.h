#ifndef LDR_INCLUDED
#define LDR_INCLUDED

typedef struct _PROCESSESFILTER {
    HANDLE ServicePid;
    HANDLE ExplorerPid;
    QWORD  qwExplorerStartTime;
} PROCESSESFILTER, *PPROCESSESFILTER;

BOOL
LdrLoadNtapi(VOID);

BOOL
LdrQueryAllFixedVolumesBitmask(
    OUT PDWORD dwVolumes
    );

BOOL
LdrQueryAllProcesses(
    OUT PSYSTEM_PROCESS_INFORMATION* ProcessesList
    );

BOOL
LdrCreateOptimalProcessFilter(
    IN  PSYSTEM_PROCESS_INFORMATION ProcessesList,
    OUT PPROCESSESFILTER Filter
    );

#endif
