#ifndef ANGIE_INCLUDED
#define ANGIE_INCLUDED

#ifdef DEBUG
    BOOL
    InjectAngieToProcess(
        IN ULONG dwPid,
        IN PWSTR szImageName
        );
#else
    BOOL
    InjectAngieToProcess(
        IN ULONG dwPid
        );
#endif

VOID
InitAngieImage(VOID);

#endif
