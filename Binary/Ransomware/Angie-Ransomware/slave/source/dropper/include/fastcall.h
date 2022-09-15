#ifndef FASTCALL_INCLUDED
#define FASTCALL_INCLUDED

#define FASTCALLSTUB  \
    DECLSPEC_NAKED    \
    DECLSPEC_NOINLINE \
    NTAPI

#ifdef _X86_
    VOID
    FASTCALLSTUB
    KiFastSystemCall(VOID);
#endif

#endif
