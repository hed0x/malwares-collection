;*************************************************************************
; Testcode for fooling debuggers AND disassemblers
;
;       16.05.94        ROSE, Ralph Roth, Finkenweg 24, D 78658 Zimmern
;       01.05.95        Soft-ICE HardBOOT command
;
; Needs MASM 6.00++ to assemble!
;
;*************************************************************************

IFDEF SMALL
.model  small, dos, c
ELSE
.model  tiny
ENDIF
.code
.286
include rose.inc

;; #### ( Main ) ##########################################################

org     100h
.startup

        mov     ah, 9                   ; print
        mov     dx, offset helloworld   ; msg
        int     21h                     ; via DOS

        @Screw_SICE                     ; hehe, 01.05.95


;-----kills td, debug, sourcer and disasm

        mov     cx,09EBh
        mov     ax,0FE05h               ;-\
        jmp     $-2                     ;  >--this should look familiar to you
        add     ah,03Bh                 ;-/
        jmp     $-10                    ; TD runs into a hlt instruction!

        mov     cx,09EBh
        mov     ax,0FE05h               ;-\
        jmp     $-2                     ;  >--this should look familiar to you
        add     ah,03Bh                 ;-/
        jmp     $-10                    ; TD runs into a hlt instruction!

                                        ; rest of code

bypass_this:

ifdef   wmsg
        pushf
        pop     ax
        and     ax,0100h                ; code debugged?
        jz      ear_lobber

        mov     ah, 9                   ; print
        mov     dx, offset sukk_debug   ; msg
        int     21h                     ; via DOS
        cli
        hlt                             ; quit
endif

ifdef   pentium
ear_lobber:                             ; play with the prefetch...
        mov     ah, 9                   ; print text
        mov     di, offset ear_lobe-2
        mov     word ptr cs:[di], offset sukk_debug
        mov     dx, offset mytext
ear_lobe:
        int     21h
endif

        .exit   0

.data
mytext  byte    'No Debugger detected!', 13, 10, '$'

sukk_debug byte 0Ah, 0Dh, 09h
        byte    "FUCK: Don't use a debugger you lamer!", 07h, 0Ah, 0Dh, '$'

helloworld byte 'Testprogram to determine (and to fool) the use of a debugger.'
        byte    13, 10
        byte    "þ (C)opyr. 1991-96 by ROSE, Ralph Roth þ rar@fh-albsig.de þ"
        byte    13, 10, 13, 10, '$'
.stack

end
