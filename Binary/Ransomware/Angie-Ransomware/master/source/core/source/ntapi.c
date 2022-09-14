#include <ntapi.h>

ULONG
(CDECL * fnVsnprintf)(
    OUT PVOID  Buffer,
    IN  SIZE_T BufferMaxSize,
    IN  PCSTR  szFormat,
    IN  PVOID  Arguments
);

BOOL
InitNtapi(VOID)
{
    HANDLE hNtdll = GetModuleHandleW(L"ntdll.dll");
    fnVsnprintf = (PVOID)GetProcAddress(hNtdll, "_vsnprintf");

    return TRUE;
}
