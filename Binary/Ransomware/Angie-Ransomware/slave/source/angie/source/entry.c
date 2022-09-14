
VOID
DECLSPEC_DLLEXPORT
AngieEntry(VOID)
{
    #if SCFG_ANGIE_INITIAL_BREAK_ON_DBG == ON
        if (RtlpGetPeb()->BeingDebugged) {
            __asm {
                int3
            };
        }
    #endif

    #ifdef DEBUG
        UNICODE_STRING DebugName = CONST_UNICODE_STRING(SCFG_DLOG_ANGIE_THREAD0);

        $DLogInitialize(&DebugName, TRUE);
    #endif


    /* Its hard to find out who is doing what where */
    $DLOG1(DLG_FLT_WARNING, "Host PID : %lu", (ULONG)RtlpGetTeb()->ClientId.UniqueProcess);
    $DLOG1(DLG_FLT_WARNING, "Host Path: %ls", RtlpGetUserProcessParameters()->ImagePathName.Buffer);

    $DLOG1(DLG_FLT_WARNING, "Exiting host %lu", (ULONG)RtlpGetTeb()->ClientId.UniqueProcess);
}
