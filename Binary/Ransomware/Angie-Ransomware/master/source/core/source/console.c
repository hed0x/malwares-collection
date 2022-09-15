#include <ntapi.h>
#include <console.h>

HANDLE ConsoleHandle;
PVOID  Buffer;

VOID
DECLSPEC_NOINLINE
CDECL
ConsolePrint(
    IN PCSTR szFormat,
    IN ...
    )
{
    ULONG cbBuffer = fnVsnprintf(
        Buffer,
        PAGE_SIZE,
        szFormat,
        (PVOID)((PULONG_PTR)&szFormat + 1)
    );

    if (cbBuffer) {
        WriteFile(ConsoleHandle, Buffer, cbBuffer, &cbBuffer, NULL);
    }
}

VOID
InitConsole(VOID)
{
    ConsoleHandle = GetStdHandle(STD_OUTPUT_HANDLE);

    if (IS_NULL(Buffer = VirtualAlloc(NULL, PAGE_SIZE, MEM_COMMIT | MEM_RESERVE, PAGE_READWRITE))) {
        FatalAppExitW(0, L"Not enough memory for console buffer!");
    }
}
