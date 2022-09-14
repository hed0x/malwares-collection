#ifndef NTAPI_INCLUDED
#define NTAPI_INCLUDED

extern
ULONG
(CDECL * fnVsnprintf)(
    OUT PVOID  Buffer,
    IN  SIZE_T BufferMaxSize,
    IN  PCSTR  szFormat,
    IN  PVOID  Arguments
);

BOOL
InitNtapi(VOID);

#endif
