
; input: ECX
; output:EDX

malloc:                 pusha

                        mov     eax, cs
                        cmp     eax, 28h
                        je      __r0

__r3:                   push    ecx
                        push    40h
                        callX   GlobalAlloc

                        jmp     __exit

__r0:                   add     ecx, 4095
                        shr     ecx, 12          ; EDI = # of pages
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

__exit:                 mov     [esp].popa_edx, eax

                        popa
                        retn

; input: EDX

mfree:                  pusha

                        or      edx, edx
                        jz      __exit

                        mov     eax, cs
                        cmp     eax, 28h
                        je      __r0

__r3:                   push    edx
                        callX   GlobalFree

                        jmp     __exit

__r0:                   push    0
                        push    edx
                        VMMcall PageFree
                        add     esp, 8

__exit:                 popa
                        retn
