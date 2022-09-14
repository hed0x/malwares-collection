#include <config.h>
#include <fastcall.h>

#ifdef _X86_
    VOID
    FASTCALLSTUB
    KiFastSystemCall(VOID)
    {
        __asm {
            mov edx, esp
            sysenter
            ret
        };
    }
#endif
