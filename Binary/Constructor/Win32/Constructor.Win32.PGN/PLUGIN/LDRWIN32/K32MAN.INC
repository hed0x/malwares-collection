
calchash                macro   procname
                        hash = 0
                        irpc    c, <procname>
                        hash = ((hash shl 7) and 0FFFFFFFFh) or (hash shr (32-7))
                        hash = hash xor "&c"
                        endm
                        endm

callX                   macro   procname
                        calchash procname
                        push    hash
                        call    k32man_get_proc_address
                        call    eax
                        endm


; input:  [ESP+4]=name csum
; output: ZF=1, EAX=0 (function not found)
;         ZF=0, EAX=function va

k32man_get_proc_address_ex:
                        pusha
                        jmp     k32man_x1

k32man_get_proc_address:pusha
                        call    get_kernel_base

k32man_x1:              call    get_export_base
                        jecxz   __return_0

                        xor     esi, esi        ; current index
__search_cycle:         lea     edx, [esi*4+ebx]
                        add     edx, [ecx].ex_namepointersrva
                        mov     edx, [edx]      ; name va
                        add     edx, ebx        ; +imagebase

                        cmp     dword ptr [esp+4+32], 0
                        je      __cmpname

                        xor     eax, eax        ; calculate hash
__calc_hash:            rol     eax, 7
                        xor     al, [edx]
                        inc     edx
                        cmp     byte ptr [edx], 0
                        jne     __calc_hash

                        cmp     eax, [esp+4+32]     ; compare hashs
                        je      __name_found

__name_not_match:       inc     esi             ; index++
                        cmp     esi, [ecx].ex_numofnamepointers
                        jb      __search_cycle

__return_0:             xor     eax, eax        ; return 0
                        jmp     __return

__name_found:           mov     edx, [ecx].ex_ordinaltablerva
                        add     edx, ebx        ; +imagebase
                        movzx   edx, word ptr [edx+esi*2]; edx=current ordinal
;                       sub     edx, [ecx].ex_ordinalbase  ; -ordinal base
                        mov     eax, [ecx].ex_addresstablerva
                        add     eax, ebx        ; +imagebase
                        mov     eax, [eax+edx*4]; eax=current address
                        add     eax, ebx        ; +imagebase

__return:               mov     [esp].popa_eax, eax  ; popa.eax

                        popa
                        clc
                        retn    4

__cmpname:              mov     edi, [esp+32+8]   ; 2nd arg: ptr to name
__cmpname_cycle:        mov     al, [edi]
                        inc     edi
                        or      al, al
                        jz      __name_found
                        cmp     al, [edx]
                        jne     __name_not_match
                        inc     edx
                        jmp     __cmpname_cycle

; output: CF=0 -- EBX=kernel base
;         CF=1 -- EBX unmodified

get_kernel_base:        pusha

                        call    __seh_init
                        mov     esp, [esp+8]
__not_found:            stc
                        jmp     __seh_exit
__seh_init:             push    dword ptr fs:[0]
                        mov     fs:[0], esp

                        call    get_any_dll_addr
                        call    find_base

                        mov     edx, [ebx+3Ch]          ; PE header
                        mov     edx, [ebx+edx+80h]      ; ImportTableRVA
                        or      edx, edx
                        jz      __exit
__cycle:                add     edx, 20
                        mov     ecx, [ebx+edx-20+0Ch]
                        jecxz   __exit
                        call    cmp_kernel32
                        jne     __cycle

                        mov     ecx, [ebx+edx-20+10h]   ; AddressTableRVA
                        jecxz   __exit
                        mov     ebx, [ebx+ecx]          ; kernel's proc addr
                        call    find_base
__exit:
                        mov     ecx, [ebx+3Ch]          ; PE header
                        mov     ecx, [ebx+ecx+78h]      ; export table rva
                        jecxz   __not_found
                        mov     ecx, [ebx+ecx+0Ch]      ; NameRVA
                        jecxz   __not_found
                        call    cmp_kernel32
                        jne     __not_found

                        mov     [esp+8].popa_ebx, ebx
                        clc

__seh_exit:             pop     dword ptr fs:[0]
                        pop     eax

                        popa
                        retn

cmp_kernel32:           mov     eax, [ebx+ecx]
                        xor     eax, [ebx+ecx+4]
                        cmp     eax, 'NREK' xor '23LE'
                        retn

get_any_dll_addr:       mov     eax, fs:[0]
__cycle:                cmp     dword ptr [eax], -1
                        mov     ebx, [eax+4]
                        mov     eax, [eax]
                        jnz     __cycle
                        ret

PROG_ALIGN              equ     65536

find_base:              and     ebx, not (PROG_ALIGN-1)
                        add     ebx, PROG_ALIGN
__cycle:                sub     ebx, PROG_ALIGN
                        mov     ax, [ebx].mz_id
                        neg     ax
                        cmp     ax, -'ZM'
                        jne     __cycle
                        ret

get_export_base:        xor     ecx, ecx
                        mov     ax, [ebx].mz_id
                        neg     ax
                        cmp     ax, -'ZM'
                        jne     __ok
                        mov     ecx, [ebx].mz_neptr     ; ECX=export va
__ok:                   mov     ecx, [ecx+ebx].pe_exportrva
                        jecxz   __exit
                        add     ecx, ebx
__exit:                 retn
