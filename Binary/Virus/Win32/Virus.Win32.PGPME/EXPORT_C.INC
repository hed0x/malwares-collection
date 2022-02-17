
; ---------------------------------------------------------------------------

; subroutine:           export_getprocaddress
; input:                ebx = library VA
;                       esi = asciiz function name VA
; output:               zf=0, eax = function VA
;                       zf=1  (not found)
; registers modified:   df=1

; ---------------------------------------------------------------------------

; subroutine:           export_findlibrary
; input:                ebx = any address inside of library
; output:               ebx = library imagebase
; registers modified:   zf=1
; comments:             will cause gpf if invalid input parameter

; ---------------------------------------------------------------------------

export_libraryalign     equ     65536           ; should be power of 2

; ---------------------------------------------------------------------------

export_findlibrary:

                if      export_libraryalign eq 65536
                        xor     bx, bx
                else
                        and     ebx, not (export_libraryalign - 1)
                endif

__cycle:                cmp     [ebx].mz_id, 'ZM'
                        je      __found

                        sub     ebx, export_libraryalign

                        jmp     __cycle
__found:
                        ret

; ---------------------------------------------------------------------------

export_getprocaddress:  pusha

                        mov     eax, [ebx].mz_neptr
                        mov     edx, [eax+ebx].pe_exportrva
                        add     edx, ebx

                        xor     ecx, ecx

__cycle:                mov     edi, [edx].export_nametablerva
                        add     edi, ebx

                        mov     edi, [edi+ecx*4]
                        add     edi, ebx

                        pusha
                        call    string_strlen
                        inc     ecx                             ; 0
                        cld
                        rep     cmpsb
                        popa

                        je      __found

                        inc     ecx
                        cmp     ecx, [edx].export_numofnames
                        jb      __cycle                         ; zr

                        popa
                        ret

__found:                mov     edi, [edx].export_ordinaltablerva
                        add     edi, ebx

                        movzx   eax, word ptr [edi+ecx*2]

                        inc     eax                             ; hmm...
                        sub     eax, [edx].export_ordinalbase   ;

                        mov     edi, [edx].export_addresstablerva
                        add     edi, ebx

                        mov     eax, [edi+eax*4]
                        add     eax, ebx                        ; nz

                        mov     [esp].pushad_eax, eax

                        popa
                        ret

; ---------------------------------------------------------------------------
