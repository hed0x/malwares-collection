; ---------------------------------------------------------------------------
; ZIP archives management     2.00     (x) 2000-2001
; ---------------------------------------------------------------------------

zip_ecd_size            equ     22
zip_cd_size             equ     46
zip_fh_size             equ     30
zip_fname_size          equ     512

zip_buf_size            equ     TMP_BUF_SIZE
zip_buf                 equ     tmp_buf
zip_handle              equ     tmp_handle

                        .data

zip_thispos             dd      ?       ; offset of current zip_cd
zip_nextpos             dd      ?       ; offset of next zip_cd offset
zip_ecdoffs             dd      ?       ; ecd offset / @zip_cd[last+1]

zip_ecd:
zip_ecd_id              dd      ? ; end of central dir signature
zip_ecd_thisdiskn       dw      ? ; number of this disk
zip_ecd_ecdstartdiskn   dw      ? ; number of the disk with the start of the central directory
zip_ecd_thisdiskecdn    dw      ? ; total number of entries in the central dir on this disk
zip_ecd_totalecdn       dw      ? ; total number of entries in the central dir
zip_ecd_cdsize          dd      ? ; size of the central directory
zip_ecd_cdoffs          dd      ? ; offset of start of central directory with respect to the starting disk number
zip_ecd_commentsize     dw      ? ; zipfile comment length
zip_ecd_comment         label   byte  ; zipfile comment (variable size)

zip_cd:
zip_cd_id               dd      ?     ;central file header signature   4 bytes  (0x02014b50)
zip_cd_ver_madeby       dw      ?     ;version made by                 2 bytes
zip_cd_ver_toextract    dw      ?     ;version needed to extract       2 bytes
zip_cd_flags            dw      ?     ;general purpose bit flag        2 bytes
zip_cd_compmethod       dw      ?     ;compression method              2 bytes
zip_cd_datetime         dd      ?     ;last mod file time/date         4 bytes
zip_cd_crc32            dd      ?     ;crc-32                          4 bytes
zip_cd_compsize         dd      ?     ;compressed size                 4 bytes
zip_cd_uncompsize       dd      ?     ;uncompressed size               4 bytes
zip_cd_namesize         dw      ?     ;filename length                 2 bytes
zip_cd_extrasize        dw      ?     ;extra field length              2 bytes
zip_cd_commentsize      dw      ?     ;file comment length             2 bytes
zip_cd_startdiskn       dw      ?     ;disk number start               2 bytes
zip_cd_int_fileattr     dw      ?     ;internal file attributes        2 bytes
zip_cd_fileattr         dd      ?     ;external file attributes        4 bytes
zip_cd_fh_offs          dd      ?     ;relative offset of local header 4 bytes
; filename (variable size)
; extra field (variable size)
; file comment (variable size)

zip_fh:
zip_fh_id               dd      ?     ;local file header signature     4 bytes  (0x04034b50)
zip_fh_ver_toextract    dw      ?     ;version needed to extract       2 bytes
zip_fh_flags            dw      ?     ;general purpose bit flag        2 bytes
zip_fh_compmethod       dw      ?     ;compression method              2 bytes
zip_fh_datetime         dd      ?     ;last mod file time/date         4 bytes
zip_fh_crc32            dd      ?     ;crc-32                          4 bytes
zip_fh_compsize         dd      ?     ;compressed size                 4 bytes
zip_fh_uncompsize       dd      ?     ;uncompressed size               4 bytes
zip_fh_namesize         dw      ?     ;filename length                 2 bytes
zip_fh_extrasize        dw      ?     ;extra field length              2 bytes
; filename (variable size)
; extra field (variable size)

zip_fname               db      zip_fname_size dup (?)

                        .code

; ---------------------------------------------------------------------------

; subroutine:   zip_open
; input:        EDX=filename
; output:       CF=0 -- file has been opened (use zip_close to close file)
;               CF=1 -- an error occured

zip_open:               pusha

                        push    edx
                        call    fopen_rw                ; open archive
                        or      eax, eax
                        jz      __error
                        mov     zip_handle, eax

                        push    zip_handle
                        call    fgetsize                ; get initial offs
                        xchg    esi, eax

__cycle1:               sub     esi, zip_buf_size - zip_ecd_size + 1
                        sbb     eax, eax
                        not     eax
                        and     esi, eax

                        push    esi
                        push    zip_buf_size
                        push    offset zip_buf
                        push    zip_handle
                        call    fread              ; read zip_ecd
                        or      eax, eax
                        jz      __close

                        sub     eax, zip_ecd_size - 1
                        add     esi, eax

__cycle2:               dec     eax
                        jl      __exitcycle2
                        dec     esi
                        ; end-of-central-dir-id ?
                        cmp     dword ptr zip_buf[eax], 06054B50h
                        jne     __cycle2

                        mov     zip_ecdoffs, esi

                        push    esi
                        push    zip_ecd_size
                        push    offset zip_ecd
                        push    zip_handle
                        call    fread

                        mov     ax, zip_ecd_thisdiskecdn ; multi vol.?
                        cmp     ax, zip_ecd_totalecdn
                        jne     __close

                        mov     eax, zip_ecd_cdoffs  ; nextpos
                        mov     zip_nextpos, eax

                        clc

                        popa
                        retn

__exitcycle2:           or      esi, esi
                        jnz     __cycle1

__close:                push    zip_handle
                        call    fclose

__error:                stc

                        popa
                        retn

; ---------------------------------------------------------------------------

; subroutine:   zip_findnext
; output:       CF=0 -- success
;               CF=1 -- eof or error

zip_findthis:           push    zip_thispos
                        pop     zip_nextpos

zip_findnext:           pusha

__cycle1:               mov     esi, zip_nextpos
                        cmp     esi, zip_ecdoffs       ; eof?
                        je      __error
                        mov     zip_thispos, esi

                        push    esi
                        push    zip_cd_size
                        push    offset zip_cd
                        push    zip_handle
                        call    fread
                        cmp     eax, zip_cd_size
                        jne     __error
                        add     esi, eax

                        mov     eax, zip_cd_id       ; check entry id
                        cmp     eax, 02014b50h
                        jne     __error

                        movzx   ecx, zip_cd_namesize
                        cmp     ecx, zip_fname_size       ; too big name?
                        jae     __cycle1
                        movzx   eax, zip_cd_extrasize
                        movzx   edx, zip_cd_commentsize
                        add     eax, edx
                        lea     eax, [eax+ecx+zip_cd_size]
                        add     zip_nextpos, eax     ; update nextpos

                        push    esi
                        push    ecx
                        push    offset zip_fname
                        push    zip_handle
                        call    fread           ; read filename

                        mov     byte ptr zip_fname[eax], 0 ; make asciiz

                        push    zip_cd_fh_offs
                        push    zip_fh_size
                        push    offset zip_fh
                        push    zip_handle
                        call    fread

                        clc

                        popa
                        retn

__error:                stc

                        popa
                        retn

; ---------------------------------------------------------------------------

; subroutine:   zip_update

zip_update:             pusha

                        mov     esi, zip_thispos
                        call    zip_write_cd_name

                        mov     esi, zip_cd_fh_offs
                        call    zip_write_fh_name

                        popa
                        retn

; ---------------------------------------------------------------------------

zip_write_cd_name:      push    esi
                        push    zip_cd_size
                        push    offset zip_cd
                        push    zip_handle
                        call    fwrite
                        add     esi, zip_cd_size

                        push    esi
                        movzx   ecx, zip_cd_namesize
                        add     esi, ecx
                        push    ecx
                        push    offset zip_fname
                        push    zip_handle
                        call    fwrite

                        retn

zip_write_fh_name:      push    esi
                        movzx   ecx, zip_fh_namesize
                        add     ecx, zip_fh_size
                        push    ecx
                        add     esi, ecx
                        push    offset zip_fh
                        push    zip_handle
                        call    fwrite

                        retn

; ---------------------------------------------------------------------------

; subroutine:   zip_add
; input:        EDX=file code
;               ECX=file size
;               ESI=file name (0=default--zip_fname)
;               EBX=file time (0=default--zip_fh_datetime)

zip_add:                pusha

; calc data checksum
                        pusha
                        xor     eax, eax
                        call    xcrc32
                        mov     [esp].popa_edx, eax
                        popa                    ; edx = crc

; prepare headers
                        lea     edi, zip_fh_ver_toextract
                        call    zip_add_fillentryz

                        lea     edi, zip_cd_ver_toextract
                        call    zip_add_fillentryz

                        xor     eax, eax
                        stosd                   ; commentsize=0, startdiskn=0
                        stosw                   ; int_fileattr
                        push    20h
                        pop     eax
                        stosd                   ; fileattr

                        or      esi, esi        ; filename: 0=default
                        jz      __2

                        lea     edi, zip_fname ; copy fname, calc length
                        xor     ebx, ebx
                        dec     ebx
__1:                    inc     ebx
                        lodsb
                        stosb
                        or      al, al
                        jnz     __1

                        mov     zip_fh_namesize, bx
                        mov     zip_cd_namesize, bx
__2:

; insert some shit into file

;;
                        mov     esi, zip_ecd_cdoffs
                        mov     zip_cd_fh_offs, esi

                        movzx   edi, zip_fh_namesize
                        add     edi, zip_fh_size
                        add     edi, [esp].pusha_ecx

                        call    zip_add_insert
;;
                        call    zip_write_fh_name

                        push    esi
                        push    [esp+4].pusha_ecx
                        push    [esp+8].pusha_edx
                        push    zip_handle
                        call    fwrite

                        add     zip_ecdoffs, edi
                        add     zip_ecd_cdoffs, edi

                        add     zip_thispos, edi
                        add     zip_nextpos, edi

;;

                        mov     esi, zip_ecdoffs

                        movzx   edi, zip_cd_namesize
                        add     edi, zip_cd_size

                        call    zip_add_insert
;;

                        add     zip_ecd_cdsize, edi
                        add     zip_ecdoffs, edi
                        inc     zip_ecd_thisdiskecdn
                        inc     zip_ecd_totalecdn

                        call    zip_write_cd_name

                        push    esi
                        push    zip_ecd_size
                        push    offset zip_ecd
                        push    zip_handle
                        call    fwrite

                        popa
                        retn

; ---------------------------------------------------------------------------

zip_add_fillentryz:     scasw                   ; vertoextract

                        xor     eax, eax
                        stosd                   ; flags=0  compmethod=0

                        or      ebx, ebx        ; datetime: 0=default
                        jnz     __1
                        mov     ebx, [edi]
__1:
                        mov     eax, ebx
                        stosd                   ; datetime

                        mov     eax, edx
                        stosd                   ; crc32

                        mov     eax, ecx
                        stosd                   ; compsize
                        stosd                   ; uncompsize

                        scasw                   ; namesize

                        xor     eax, eax
                        stosw                   ; extrasize

                        retn

; ---------------------------------------------------------------------------

; input: ESI=file offset
;        EDI=size of block

; file map: <--->ESI
; before:   abcdefghijklm
; after:    abcde<--EDI-->fghijklm

zip_add_insert:         pusha

                        push    zip_handle
                        call    fgetsize
                        xchg    edx, eax

__cycle:                mov     ecx, edx
                        sub     ecx, esi
                        jz      __exit

                        cmp     ecx, zip_buf_size
                        jbe     __1
                        mov     ecx, zip_buf_size
__1:
                        sub     edx, ecx
                        call    zip_add_moveblock

                        jmp     __cycle

__exit:                 popa
                        retn

; ---------------------------------------------------------------------------

; input: EDX=offset of the block
;        ECX=block size (not more than zip_buf_size)
;        EDI=displacement

zip_add_moveblock:      pusha

                        add     edi, edx

                        push    edx
                        push    ecx
                        push    offset zip_buf
                        push    zip_handle
                        call    fread

                        push    edi
                        push    [esp+4].pusha_ecx
                        push    offset zip_buf
                        push    zip_handle
                        call    fwrite

                        popa
                        retn

; ---------------------------------------------------------------------------

; subroutine:   zip_close

zip_close:              pusha

                        push    zip_handle
                        call    fclose

                        popa
                        retn

; ---------------------------------------------------------------------------

zip_getextptr:          movzx   eax, zip_fh_namesize
                        lea     eax, zip_fname[eax-4]
                        retn

zip_getunpsize:         mov     eax, zip_fh_uncompsize
                        retn

; ---------------------------------------------------------------------------
