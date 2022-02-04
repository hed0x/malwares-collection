;
; IO control codes for driver and client...
;

.CONST

; Defining I/O Control Codes
IO_USER_FUNC_CODE_BASE         EQU (0800h)

METHOD_BUFFERED                EQU (000h)
METHOD_IN_DIRECT               EQU (001h)
METHOD_OUT_DIRECT              EQU (002h)
METHOD_NEITHER                 EQU (003h)

; our user defined IO control codes
IOC_PROVIDE1                           EQU (IO_USER_FUNC_CODE_BASE + 0100h) or METHOD_BUFFERED
IOC_PROVIDE2                           EQU (IO_USER_FUNC_CODE_BASE + 0200h) or METHOD_BUFFERED
IOC_PROVIDE3                           EQU (IO_USER_FUNC_CODE_BASE + 0300h) or METHOD_BUFFERED
IOC_PROVIDE4                           EQU (IO_USER_FUNC_CODE_BASE + 0400h) or METHOD_BUFFERED

IOC_HOOK                               EQU (IO_USER_FUNC_CODE_BASE + 01000h) or METHOD_BUFFERED
IOC_UNHOOK                             EQU (IO_USER_FUNC_CODE_BASE + 01100h) or METHOD_BUFFERED