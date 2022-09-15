#ifndef LDR_INCLUDED
#define LDR_INCLUDED

HMODULE
LdrGetModule(
    IN DWORD dwModuleNameHash
    );

ULONG
LdrGetProcAddressEx(
    IN  HMODULE hModule,
    IN  ULONG   dwProcCount,
    IN  PDWORD  dwNameSumsList,
    OUT PVOID   ProcessList
    );

BOOL
LdrLoadNtapi(VOID);

BOOL
LdrLoadWsapi(VOID);

#endif
