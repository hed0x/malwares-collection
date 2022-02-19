
;                          example of using KME-32
;                          ~~~~~~~~~~~~~~~~~~~~~~~
; This program generates big multilayer decryptor in memory and executes it.
; Decrypted code executes INT3

; EXPERT1-mode: standard decryptor w/o jmps
; EXPERT2-mode: 1-reg no-cmd decryptor w/o jmps (maximal compression)

MAX_SIZE                equ     1048576*8       ; max decryptor size: 8 MB

include                 ..\..\KME32\kme32.int   ; KME interface stuff

callW                   macro   procname        ; to call windows api
                        extrn   procname:PROC
                        call    procname
                        endm

                        p386
                        model   flat

                        .data

buf1_size               dd      dropper_size    ; buffer with decryptor
buf1_entry              dd      0
buf1                    db      MAX_SIZE dup (?)

buf2_size               dd      ?               ; temporary buffer
buf2_entry              dd      ?
buf2                    db      MAX_SIZE dup (?)

                        org     buf1
dropper_start:          int 3                   ; code to be executed
                        rept    5000-3          ; when decrypted
                        nop
                        endm
                        jmp     ebp
dropper_size            equ     $-dropper_start

                        .code

start:
                        nop
cycle:
                        call    write_size      ; write decryptor size

IFDEF                   EXPERT1
                        push    FLAG_NOJMPS             ; flags
                        push    CMD_ALL                 ; cmd mask
                        push    REG_ALL-REG_EBP         ; reg mask
ELSE
IFDEF                   EXPERT2
                        push    FLAG_NOJMPS+FLAG_NOLOGIC; flags
                        push    CMD_ALL                 ; cmd mask
                        push    REG_EAX                 ; reg mask
ELSE
.err TASM parameter /DEXPERT1 or /DEXPERT2 should be specified
ENDIF
ENDIF

                        push    12345678h       ; randseed
                        push    -1              ; jmps if rnd(X)==0
                                                ; //unused 'coz FLAG_NOJMPS
                        push    offset buf2_entry ; [output eip]
                        push    offset buf2_size  ; [output size]
                        push    0CCh            ; output filler
                        push    MAX_SIZE        ; output/max size
                        push    offset buf2     ; output buffer
                        push    buf1_entry      ; input eip
                        push    buf1_size       ; input size
                        push    offset buf1     ; input buffer

                        extrn   kme_main:PROC
                        call    kme_main

                        jc      cycle_exit      ; exit cycle when buffer full

                        mov     eax, buf2_entry ; copy buf1 <-- buf2
                        mov     buf1_entry, eax
                        mov     ecx, buf2_size  ;
                        mov     buf1_size, ecx
                        lea     esi, buf2       ;
                        lea     edi, buf1
                        cld
                        rep     movsb

                        jmp     cycle           ; next layer
cycle_exit:

extrn                   ExitProcess:PROC        ; EBP = @ExitProcess
                        lea     ebp, ExitProcess

                        int 3

                        mov     eax, buf1_entry ; jmp to decryptor
                        add     eax, offset buf1
                        jmp     eax

                        ; subroutine to dump BUF1_SIZE variable to console

write_size              proc    pascal
                        local   msg:BYTE:256
                        local   msg_size:DWORD
                        pusha
                        lea     esi, msg
                        mov     edi, esi
                        mov     eax, ' >--'
                        stosd
                        mov     eax, buf1_size
                        call    @@decnum
                        mov     ax, 0A0Dh
                        stosw
                        sub     edi, esi
                        push    -11
                        callW   GetStdHandle
                        push    0
                        push    esp
                        push    edi
                        push    esi
                        push    eax
                        callW   WriteConsoleA
                        popa
                        ret
@@decnum:               xor     edx, edx
                        mov     ebx, 10
                        div     ebx
                        push    edx
                        or      eax, eax
                        jz      @@1
                        call    @@decnum
@@1:                    pop     eax
                        add     al, '0'
                        stosb
                        retn
                        endp

                        end     start
