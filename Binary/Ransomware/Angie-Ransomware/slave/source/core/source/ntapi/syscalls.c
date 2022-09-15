#include "ntapi.h"

#define NTDLL_SYSCALL_WOW64(n, xpwow, vwow, w7wow, w8wow, w81wow, w10wow, w11wow, w12wow, w13wow, w14wow, w15wow, w16wow)

enum {
    XOR_KEY = RTLP_LCG_DWORD,
};

CONST VOLATILE DWORD NtapiSyscallsNamesHashXorKey = XOR_KEY;

DWORD NtapiSyscallsNamesHash[] = {
    0xCA67B978 ^ XOR_KEY, // NtAllocateVirtualMemory
    0xB51CC567 ^ XOR_KEY, // NtFreeVirtualMemory
    0xED0594DA ^ XOR_KEY, // NtCreateThreadEx
    0x6B372C05 ^ XOR_KEY, // NtClose
    0xB06BF858 ^ XOR_KEY, // NtCreateMutant
    0x13677D9C ^ XOR_KEY, // NtOpenMutant
    0xD856E554 ^ XOR_KEY, // NtDelayExecution
    0x8A0578BA ^ XOR_KEY, // NtOpenKey
    0x86FBB801 ^ XOR_KEY  // NtQueryValueKey
};

FARPROC NtapiSyscallsAddressStorage[] = {
    (PVOID)RTLP_LCG_NATIVE, // NtAllocateVirtualMemory
    (PVOID)RTLP_LCG_NATIVE, // NtFreeVirtualMemory
    (PVOID)RTLP_LCG_NATIVE, // NtCreateThreadEx
    (PVOID)RTLP_LCG_NATIVE, // NtClose
    (PVOID)RTLP_LCG_NATIVE, // NtCreateMutant
    (PVOID)RTLP_LCG_NATIVE, // NtOpenMutant
    (PVOID)RTLP_LCG_NATIVE, // NtDelayExecution
    (PVOID)RTLP_LCG_NATIVE, // NtOpenKey
    (PVOID)RTLP_LCG_NATIVE  // NtQueryValueKey
};

CONST ULONG NtapiSyscallsOffsetX86[] = {
    #define NTDLL_SYSCALL_X86(n, w2K, xpx86, w2k3, vx86, w7x86, w8x86, w81x86, w10x86, w11x86, w12x86, w13x86, w14x86, w15x86, w16x86) w7x86,
    #include "rawsyscalls.h"
    #undef NTDLL_SYSCALL_X86

    #define NTDLL_SYSCALL_X86(n, w2K, xpx86, w2k3, vx86, w7x86, w8x86, w81x86, w10x86, w11x86, w12x86, w13x86, w14x86, w15x86, w16x86) w8x86,
    #include "rawsyscalls.h"
    #undef NTDLL_SYSCALL_X86

    #define NTDLL_SYSCALL_X86(n, w2K, xpx86, w2k3, vx86, w7x86, w8x86, w81x86, w10x86, w11x86, w12x86, w13x86, w14x86, w15x86, w16x86) w81x86,
    #include "rawsyscalls.h"
    #undef NTDLL_SYSCALL_X86

    #define NTDLL_SYSCALL_X86(n, w2K, xpx86, w2k3, vx86, w7x86, w8x86, w81x86, w10x86, w11x86, w12x86, w13x86, w14x86, w15x86, w16x86) w10x86,
    #include "rawsyscalls.h"
    #undef NTDLL_SYSCALL_X86

    #define NTDLL_SYSCALL_X86(n, w2K, xpx86, w2k3, vx86, w7x86, w8x86, w81x86, w10x86, w11x86, w12x86, w13x86, w14x86, w15x86, w16x86) w11x86,
    #include "rawsyscalls.h"
    #undef NTDLL_SYSCALL_X86

    #define NTDLL_SYSCALL_X86(n, w2K, xpx86, w2k3, vx86, w7x86, w8x86, w81x86, w10x86, w11x86, w12x86, w13x86, w14x86, w15x86, w16x86) w12x86,
    #include "rawsyscalls.h"
    #undef NTDLL_SYSCALL_X86

    #define NTDLL_SYSCALL_X86(n, w2K, xpx86, w2k3, vx86, w7x86, w8x86, w81x86, w10x86, w11x86, w12x86, w13x86, w14x86, w15x86, w16x86) w13x86,
    #include "rawsyscalls.h"
    #undef NTDLL_SYSCALL_X86

    #define NTDLL_SYSCALL_X86(n, w2K, xpx86, w2k3, vx86, w7x86, w8x86, w81x86, w10x86, w11x86, w12x86, w13x86, w14x86, w15x86, w16x86) w14x86,
    #include "rawsyscalls.h"
    #undef NTDLL_SYSCALL_X86

    #define NTDLL_SYSCALL_X86(n, w2K, xpx86, w2k3, vx86, w7x86, w8x86, w81x86, w10x86, w11x86, w12x86, w13x86, w14x86, w15x86, w16x86) w15x86,
    #include "rawsyscalls.h"
    #undef NTDLL_SYSCALL_X86

    #define NTDLL_SYSCALL_X86(n, w2K, xpx86, w2k3, vx86, w7x86, w8x86, w81x86, w10x86, w11x86, w12x86, w13x86, w14x86, w15x86, w16x86) w16x86,
    #include "rawsyscalls.h"
    #undef NTDLL_SYSCALL_X86
};

#undef  NTDLL_SYSCALL_WOW64
#define NTDLL_SYSCALL_X86(n, w2K, xpx86, w2k3, vx86, w7x86, w8x86, w81x86, w10x86, w11x86, w12x86, w13x86, w14x86, w15x86, w16x86)

CONST ULONG NtapiSyscallsOffsetWow64[] = {
    #define NTDLL_SYSCALL_WOW64(n, xpwow, vwow, w7wow, w8wow, w81wow, w10wow, w11wow, w12wow, w13wow, w14wow, w15wow, w16wow) w7wow,
    #include "rawsyscalls.h"
    #undef NTDLL_SYSCALL_WOW64

    #define NTDLL_SYSCALL_WOW64(n, xpwow, vwow, w7wow, w8wow, w81wow, w10wow, w11wow, w12wow, w13wow, w14wow, w15wow, w16wow) w8wow,
    #include "rawsyscalls.h"
    #undef NTDLL_SYSCALL_WOW64

    #define NTDLL_SYSCALL_WOW64(n, xpwow, vwow, w7wow, w8wow, w81wow, w10wow, w11wow, w12wow, w13wow, w14wow, w15wow, w16wow) w81wow,
    #include "rawsyscalls.h"
    #undef NTDLL_SYSCALL_WOW64

    #define NTDLL_SYSCALL_WOW64(n, xpwow, vwow, w7wow, w8wow, w81wow, w10wow, w11wow, w12wow, w13wow, w14wow, w15wow, w16wow) w10wow,
    #include "rawsyscalls.h"
    #undef NTDLL_SYSCALL_WOW64

    #define NTDLL_SYSCALL_WOW64(n, xpwow, vwow, w7wow, w8wow, w81wow, w10wow, w11wow, w12wow, w13wow, w14wow, w15wow, w16wow) w11wow,
    #include "rawsyscalls.h"
    #undef NTDLL_SYSCALL_WOW64

    #define NTDLL_SYSCALL_WOW64(n, xpwow, vwow, w7wow, w8wow, w81wow, w10wow, w11wow, w12wow, w13wow, w14wow, w15wow, w16wow) w12wow,
    #include "rawsyscalls.h"
    #undef NTDLL_SYSCALL_WOW64

    #define NTDLL_SYSCALL_WOW64(n, xpwow, vwow, w7wow, w8wow, w81wow, w10wow, w11wow, w12wow, w13wow, w14wow, w15wow, w16wow) w13wow,
    #include "rawsyscalls.h"
    #undef NTDLL_SYSCALL_WOW64

    #define NTDLL_SYSCALL_WOW64(n, xpwow, vwow, w7wow, w8wow, w81wow, w10wow, w11wow, w12wow, w13wow, w14wow, w15wow, w16wow) w14wow,
    #include "rawsyscalls.h"
    #undef NTDLL_SYSCALL_WOW64

    #define NTDLL_SYSCALL_WOW64(n, xpwow, vwow, w7wow, w8wow, w81wow, w10wow, w11wow, w12wow, w13wow, w14wow, w15wow, w16wow) w15wow,
    #include "rawsyscalls.h"
    #undef NTDLL_SYSCALL_WOW64

    #define NTDLL_SYSCALL_WOW64(n, xpwow, vwow, w7wow, w8wow, w81wow, w10wow, w11wow, w12wow, w13wow, w14wow, w15wow, w16wow) w16wow,
    #include "rawsyscalls.h"
    #undef NTDLL_SYSCALL_WOW64
};

#ifndef __INTELLISENSE__
    C_ASSERT(sizeof(NtapiSyscallsNamesHash)      == sizeof(*NtapiSyscallsNamesHash     ) * NtapiSyscallsFunctionsCount      );
    C_ASSERT(sizeof(NtapiSyscallsAddressStorage) == sizeof(*NtapiSyscallsAddressStorage) * NtapiSyscallsFunctionsCount      );
    C_ASSERT(sizeof(NtapiSyscallsOffsetX86)      == sizeof(*NtapiSyscallsOffsetX86     ) * NtapiSyscallsFunctionsCount  * 10);
    C_ASSERT(sizeof(NtapiSyscallsOffsetWow64)    == sizeof(*NtapiSyscallsOffsetWow64   ) * NtapiSyscallsFunctionsCount  * 10);
#endif
