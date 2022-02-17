
; input:  EDX=buffer, ECX=size, EBX=offs, ESI=wantcrc16, EDI=wantcrc32

_buffer                 equ       5*4
_size                   equ       6*4
_offs                   equ       4*4
_wantcrc16              equ       1*4
_wantcrc32              equ       0*4

fuckcrc48:              pusha
                        mov     ecx, ebx
                        xor     eax, eax
                        pusha
                        call    xcrc16
                        mov     [esp], eax
                        popa
                        call    xcrc32
                        xchg    esi, eax
                        mov     [esp+_buffer], edx
                        mov     ebp, [esp+_size]
                        sub     ebp, [esp+_offs]
.l1:                    dec     ebp
                        cmp     ebp, 6
                        jb      .l2
                        push    edx
                        push    ecx
                        mov     edx, esp
                        inc     ecx
                        call    rcrc16
                        pop     ecx
                        pop     edx
                        xor     al, [edx+ebp]
                        jmp     .l1
.l2:                    mov     [esp+_wantcrc16], eax
                        mov     ebp, edx
                        push    edx
                        lea     edx, [esp+4+_wantcrc32]
                        mov     cl, 4
                        xor     eax, eax
                        call    rcrc32
                        pop     edx
                        sub     ecx, 6
                        add     ecx, [esp+_size]
                        sub     ecx, [esp+_offs]
                        sub     edx, ecx
                        call    rcrc32
                        mov     [esp+_wantcrc32], eax
                        dec     ecx
                        mov     [ebp], ecx
                        inc     ecx
.l3:                    inc     dword [ebp]
                        mov     edx, ebp
                        mov     cl, 2
                        mov     eax, esi
                        call    xcrc32
                        xor     eax, [esp+_wantcrc32]
                        mov     [edx], eax
                        mov     edx, ebp
                        mov     cl, 6
                        mov     eax, edi
                        call    xcrc16
                        cmp     ax, [esp+_wantcrc16]
                        jne     .l3
                        popa
                        ret
