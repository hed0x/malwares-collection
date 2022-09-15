#include "ntapi.h"

#define NTDLL_SYSCALL_WOW64(n, xpwow, vwow, w7wow, w8wow, w81wow, w10wow, w11wow, w12wow, w13wow, w14wow, w15wow, w16wow)

DWORD NtapiSyscallsNamesHash[] = {
    0x6B372C05, // NtClose
    0xCA67B978, // NtAllocateVirtualMemory
    0xB51CC567, // NtFreeVirtualMemory
    0x43E32F32, // NtWriteVirtualMemory
    0x24F8DD09, // NtFlushInstructionCache
    0xED0594DA, // NtCreateThreadEx
    0x5EA49A38, // NtOpenProcess
    0x7A43974A, // NtQuerySystemInformation
    0xEA2DDA8A, // NtQueryInformationProcess
    0xF67464E4, // NtWriteFile
    0xA9E25A1D, // NtReadFile
    0xA9C5B599, // NtCreateFile
    0x117BE69E  // NtQueryDirectoryFile
};

FARPROC NtapiSyscallsAddressStorage[] = {
    (PVOID)RTLP_LCG_NATIVE, // NtClose
    (PVOID)RTLP_LCG_NATIVE, // NtAllocateVirtualMemory
    (PVOID)RTLP_LCG_NATIVE, // NtFreeVirtualMemory
    (PVOID)RTLP_LCG_NATIVE, // NtWriteVirtualMemory
    (PVOID)RTLP_LCG_NATIVE, // NtFlushInstructionCache
    (PVOID)RTLP_LCG_NATIVE, // NtCreateThreadEx
    (PVOID)RTLP_LCG_NATIVE, // NtOpenProcess
    (PVOID)RTLP_LCG_NATIVE, // NtQuerySystemInformation
    (PVOID)RTLP_LCG_NATIVE, // NtQueryInformationProcess
    (PVOID)RTLP_LCG_NATIVE, // NtWriteFile
    (PVOID)RTLP_LCG_NATIVE, // NtReadFile
    (PVOID)RTLP_LCG_NATIVE, // NtCreateFile
    (PVOID)RTLP_LCG_NATIVE  // NtQueryDirectoryFile
};

CONST ULONG NtapiSyscallsOffset[] = {
    #define NTDLL_SYSCALL(n, xp, v, w7, w8, w81, w10, w11, w12, w13, w14, w15, w16) w7,
    #include "rawsyscalls.h"
    #undef NTDLL_SYSCALL

    #define NTDLL_SYSCALL(n, xp, v, w7, w8, w81, w10, w11, w12, w13, w14, w15, w16) w8,
    #include "rawsyscalls.h"
    #undef NTDLL_SYSCALL

    #define NTDLL_SYSCALL(n, xp, v, w7, w8, w81, w10, w11, w12, w13, w14, w15, w16) w81,
    #include "rawsyscalls.h"
    #undef NTDLL_SYSCALL

    #define NTDLL_SYSCALL(n, xp, v, w7, w8, w81, w10, w11, w12, w13, w14, w15, w16) w10,
    #include "rawsyscalls.h"
    #undef NTDLL_SYSCALL

    #define NTDLL_SYSCALL(n, xp, v, w7, w8, w81, w10, w11, w12, w13, w14, w15, w16) w11,
    #include "rawsyscalls.h"
    #undef NTDLL_SYSCALL

    #define NTDLL_SYSCALL(n, xp, v, w7, w8, w81, w10, w11, w12, w13, w14, w15, w16) w12,
    #include "rawsyscalls.h"
    #undef NTDLL_SYSCALL

    #define NTDLL_SYSCALL(n, xp, v, w7, w8, w81, w10, w11, w12, w13, w14, w15, w16) w13,
    #include "rawsyscalls.h"
    #undef NTDLL_SYSCALL

    #define NTDLL_SYSCALL(n, xp, v, w7, w8, w81, w10, w11, w12, w13, w14, w15, w16) w14,
    #include "rawsyscalls.h"
    #undef NTDLL_SYSCALL

    #define NTDLL_SYSCALL(n, xp, v, w7, w8, w81, w10, w11, w12, w13, w14, w15, w16) w15,
    #include "rawsyscalls.h"
    #undef NTDLL_SYSCALL

    #define NTDLL_SYSCALL(n, xp, v, w7, w8, w81, w10, w11, w12, w13, w14, w15, w16) w16,
    #include "rawsyscalls.h"
    #undef NTDLL_SYSCALL
};

#ifndef __INTELLISENSE__
    C_ASSERT(sizeof(NtapiSyscallsNamesHash)      == sizeof(*NtapiSyscallsNamesHash)      * NtapiSyscallsFunctionsCount      );
    C_ASSERT(sizeof(NtapiSyscallsAddressStorage) == sizeof(*NtapiSyscallsAddressStorage) * NtapiSyscallsFunctionsCount      );
    C_ASSERT(sizeof(NtapiSyscallsOffset)         == sizeof(*NtapiSyscallsOffset)         * NtapiSyscallsFunctionsCount  * 10);
#endif
