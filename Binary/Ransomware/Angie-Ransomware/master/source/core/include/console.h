#ifndef CONSOLE_INCLUDED
#define CONSOLE_INCLUDED

VOID
DECLSPEC_NOINLINE
CDECL
ConsolePrint(
    IN PCSTR szFormat,
    IN ...
    );

VOID
InitConsole(VOID);

#endif
