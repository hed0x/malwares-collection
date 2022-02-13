; ---------------------------------------------------------------------------
; RAR archives management     2.00     (x) 2000-2001
; ---------------------------------------------------------------------------

rar_id_size             equ     7
rar_mh_size             equ     13
rar_fh_size             equ     32
rar_fname_size          equ     512

rar_buf_size            equ     TMP_BUF_SIZE
rar_buf                 equ     tmp_buf
rar_handle              equ     tmp_handle

                        .data

rar_thispos             dd      ?       ; offset of current header (rar_fh)
rar_nextpos             dd      ?       ; offset of next header

rar_id                  db      rar_id_size dup (?)

rar_mh:
rar_mh_headcrc          dw      ?
rar_mh_headtype         db      ?
rar_mh_flags            dw      ?
rar_mh_headsize         dw      ?
rar_mh_highposav        dw      ?
rar_mh_posav            dd      ?

rar_fh:
rar_fh_headcrc          dw      ?
rar_fh_headtype         db      ?
rar_fh_flags            dw      ?
rar_fh_headsize         dw      ?
rar_fh_packsize         dd      ?
rar_fh_unpsize          dd      ?
rar_fh_hostos           db      ?
rar_fh_filecrc          dd      ?
rar_fh_filetime         dd      ?
rar_fh_unpver           db      ?
rar_fh_method           db      ?
rar_fh_namesize         dw      ?
rar_fh_fileattr         dd      ?

rar_fname               db      rar_fname_size dup (?)

                        .code

; ---------------------------------------------------------------------------

; subroutine:   rar_open
; input:        EDX=filename
; output:       CF=0 -- file has been opened (use rar_close to close file)
;               CF=1 -- an error occured

rar_open:               pusha

                        push    edx
                        call    fopen_rw                ; open archive
                        or      eax, eax
                        jz      __error
                        mov     rar_handle, eax

                        xor     esi, esi                ; 'sfxsize'

__cycle1:               push    esi
                        push    rar_buf_size
                        push    offset rar_buf
                        push    rar_handle
                        call    fread
                        cmp     eax, rar_buf_size
                        jne     __close

                        lea     edx, rar_buf       ; read buffer
                        mov     ecx, rar_buf_size

__cycle2:               cmp     dword ptr [edx], '!raR'
                        jne     __cont2
                        cmp     dword ptr [edx+3], 00071A21h
                        je      __foundsign

__cont2:                inc     edx                     ; buf offset
                        inc     esi
                        loop    __cycle2

                        jmp     __cycle1

__foundsign:            pusha
                        mov     esi, edx
                        lea     edi, rar_id
                        mov     ecx, rar_id_size+rar_mh_size
                        rep     movsb
                        popa

                        movzx   eax, rar_mh_flags
                        test    al, 1+32  ; 1=volume 32=av (both sucks)
                        jnz     __close

                        movzx   eax, rar_mh_headsize ; calc & store first
                        lea     eax, [eax+esi+rar_id_size]
                        mov     rar_nextpos, eax

                        clc

                        popa
                        retn

__close:                push    rar_handle
                        call    fclose

__error:                stc

                        popa
                        retn

; ---------------------------------------------------------------------------

; subroutine:   rar_findnext
; output:       CF=0 -- success
;               CF=1 -- eof or error

rar_findthis:           push    rar_thispos
                        pop     rar_nextpos

rar_findnext:           pusha

__cycle1:               mov     eax, rar_nextpos
                        mov     rar_thispos, eax
                        push    eax
                        push    rar_fh_size
                        push    offset rar_fh
                        push    rar_handle
                        call    fread
                        cmp     eax, rar_fh_size
                        jne     __error

                        movzx   eax, rar_fh_headsize
                        add     rar_nextpos, eax

                        bt      rar_fh_flags, 15
                        jnc     __1
                        mov     eax, rar_fh_packsize
                        add     rar_nextpos, eax
__1:
                        cmp     rar_fh_headtype, 74h
                        jne     __cycle1

                        movzx   ecx, rar_fh_namesize
                        cmp     ecx, rar_fname_size
                        jae     __cycle1

                        mov     eax, rar_thispos
                        add     eax, rar_fh_size
                        push    eax
                        push    ecx
                        push    offset rar_fname
                        push    rar_handle
                        call    fread

                        mov     byte ptr rar_fname[eax], 0

                        clc

                        popa
                        retn

__error:                stc

                        popa
                        retn

; ---------------------------------------------------------------------------

; subroutine:   rar_update

rar_update:             pusha

; update rar_fh_headcrc

                        movzx   ecx, rar_fh_namesize
                        add     ecx, rar_fh_size - 2
                        lea     edx, rar_fh + 2
                        xor     eax, eax
                        call    xcrc32
                        mov     rar_fh_headcrc, ax

; write rar_fh and fname

                        push    rar_thispos
                        movzx   ecx, rar_fh_namesize
                        add     ecx, rar_fh_size
                        push    ecx
                        push    offset rar_fh
                        push    rar_handle
                        call    fwrite

                        popa
                        retn

; ---------------------------------------------------------------------------

; subroutine:   rar_add
; input:        EDX=file code
;               ECX=file size
;               ESI=file name (0=default, rar_fname)
;               EBX=file time (0=default, rar_fh_filetime)

rar_add:                pusha

                        lea     edi, rar_fh_headtype
                        mov     al, 74h         ; headtype=74
                        stosb
                        mov     eax, 00008000h  ; headflags=8000, headsize=0
                        stosd
                        mov     eax, [esp].pusha_ecx
                        stosd                   ; packsize
                        stosd                   ; unpsize
                        xor     eax, eax        ; hostos
                        stosb
                        call    xcrc32
                        stosd                   ; filecrc

                        mov     eax, [esp].pusha_ebx  ; filetime
                        or      eax, eax        ; 0=use default
                        jnz     __1
                        mov     eax, [edi]
__1:
                        stosd
                        mov     ax, 3014h       ; unpver=14h method=30h
                        stosw

                        mov     esi, [esp].pusha_esi  ; name

                        movzx   eax, word ptr [edi]

                        or      esi, esi        ; 0=default
                        jz      __3

                        push    edi
                        lea     edi, rar_fname  ; copy fname (ESI) &
                        xor     ecx, ecx        ; calc len (ECX)
__copy:                 inc     ecx
                        lodsb
                        stosb
                        or      al, al
                        jnz     __copy
                        dec     ecx
                        xchg    ecx, eax
                        pop     edi

__3:                    stosw                   ; namesize
                        add     eax, rar_fh_size
                        mov     rar_fh_headsize, ax  ; headsize

                        push    20h
                        pop     eax
                        stosd                   ; fileattr

                        push    rar_thispos

                        push    rar_handle
                        call    fgetsize
                        mov     rar_thispos, eax

                        call    rar_update

                        movzx   eax, rar_fh_namesize
                        add     eax, rar_fh_size
                        add     eax, rar_thispos
                        push    eax
                        push    [esp+4+4].pusha_ecx
                        push    [esp+4+8].pusha_edx
                        push    rar_handle
                        call    fwrite

                        pop     rar_thispos

                        popa
                        retn

; ---------------------------------------------------------------------------

; subroutine:   rar_close

rar_close:              pusha

                        push    rar_handle
                        call    fclose

                        popa
                        retn

; ---------------------------------------------------------------------------

rar_getextptr:          movzx   eax, rar_fh_namesize ; calculate:
                        lea     eax, rar_fname[eax-4]
                        retn

rar_getunpsize:         mov     eax, rar_fh_unpsize
                        retn

; ---------------------------------------------------------------------------
