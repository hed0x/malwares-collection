
include                 MEMORY.INC
include                 ..\..\INCLUDE\consts.inc

                        public  malloc
                        public  mfree

                        p386
                        model   flat
                        locals  __
                        jumps

                        .data

                        dd      ?

                        .code

; ---------------------------------------------------------------------------

is_ring0:               mov     eax, cs
                        cmp     eax, 28h        ; w9x: ring0 code selector
                        retn

; ---------------------------------------------------------------------------

malloc:                 call    is_ring0
                        je      malloc_r0

malloc_r3:              push    dword ptr [esp+4]
                        push    40h               ; GPTR+ZEROFILL
                        callW   GlobalAlloc

                        retn    4

malloc_r0:              mov     ecx, [esp+4]
                        add     ecx, 4095
                        shr     ecx, 12          ; EDI = # of pages

                        push    ecx

                        push    PAGEFIXED + PAGEZEROINIT
                        xor     eax, eax
                        push    eax     ; PhysAddr
                        push    eax     ; maxPhys
                        push    eax     ; minPhys
                        push    eax     ; Align
                        push    eax     ; handle of VM (==0 if PG_SYS)
                        push    PG_SYS  ; flags
                        push    ecx     ; nPages
                        VMMcall PageAllocate
                        add     esp, 8*4

                        pop     ecx
                        push    eax

                        ; make pages not accessible from ring-3
                        push    PC_STATIC                  ; OR_MASK
                        push    not (PC_WRITEABLE+PC_USER) ; AND_MASK
                        push    ecx
                        shr     eax, 12
                        push    eax
                        VMMcall PageModifyPermissions
                        add     esp, 4*4

                        pop     eax

                        retn    4

; ---------------------------------------------------------------------------

mfree:                  mov     ecx, [esp+4]
                        jecxz   rt

                        call    is_ring0
                        je      mfree_r0

mfree_r3:               push    ecx
                        callW   GlobalFree

rt:                     retn    4

mfree_r0:               push    0
                        push    ecx
                        VMMcall PageFree
                        add     esp, 8

                        retn    4

; ---------------------------------------------------------------------------

                        end
