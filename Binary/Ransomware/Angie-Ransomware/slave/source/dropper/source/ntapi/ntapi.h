#ifndef __NTAPI_NTAPI__
#define __NTAPI_NTAPI__

#define NtapiSyscallsFunctionsCount 13

extern DWORD NtapiSyscallsNamesHash[];
extern FARPROC NtapiSyscallsAddressStorage[];
extern CONST ULONG NtapiSyscallsOffset[];

#endif
