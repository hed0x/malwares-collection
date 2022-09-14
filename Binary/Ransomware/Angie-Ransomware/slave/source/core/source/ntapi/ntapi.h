#ifndef NTAPI_NTAPI_INCLUDED
#define NTAPI_NTAPI_INCLUDED

#define NtapiSyscallsFunctionsCount 9

extern CONST VOLATILE DWORD NtapiSyscallsNamesHashXorKey;
extern DWORD NtapiSyscallsNamesHash[];
extern FARPROC NtapiSyscallsAddressStorage[];
extern CONST ULONG NtapiSyscallsOffsetX86[];
extern CONST ULONG NtapiSyscallsOffsetWow64[];

#endif
