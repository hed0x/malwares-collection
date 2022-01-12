
;                          example of using KME-32
;                          ~~~~~~~~~~~~~~~~~~~~~~~
;
; this program used to test KME-32, it will generate some PE EXE files
; with polymorphic decryptor in the CODE section.
;
; nnnn.EXE              "standard" files
; Xnnn.EXE              "special" files, demonstating some abilities of KME

include                 ..\..\KME32\kme32.int ; KME interface stuff

NUM_OF_FILES            equ     5           ; number of nnnn.EXEs to generate

callW                   macro   procname        ; to call windows api
                        extrn   procname:PROC
                        call    procname
                        endm

                        p386
                        model   flat

                        .data

msg_writing             db      'writing ',0            ; messages
msg_ok                  db      ' - ok',13,10,0         ;
msg_failed              db      ' *** FAILED ***',13,10,0

sampledir               db      'SAMPLES',0             ; output directory
filename                db      'SAMPLES\0000.EXE',0    ; current file
filename_1stdigit       equ     $-9
filename_ndigit         equ     4

include                 exehdr.inc                      ; dropper header
include                 dropper.inc                     ; dropper code

                        ; KME output:
buf_size                dd      ?                       ; buffer size
buf_entry               dd      ?                       ; buffer entry (rel)
buf                     db      execode_size dup (?)    ; buffer (poly decr)

                        .code

start:
                        ; create output directory

                        push    0
                        push    offset sampledir
                        callW   CreateDirectoryA

                        ; generate some "standart" files

                        mov     ecx, NUM_OF_FILES
main_cycle:             push    ecx                     ; main cycle

                        mov     ebx, 0                  ; flags
                        mov     ecx, CMD_ALL            ; command mask
                        mov     edx, REG_ALL-REG_EBP    ; register mask
                        mov     esi, 10                 ; jmp if rnd(X)==0
                        mov     edi, 0                  ; filler
                        call    gen_1_file

                        pop     ecx
                        loop    main_cycle

                        ; generate some "special" files

                        lea     edi, filename_1stdigit
                        mov     al, 'X'
                        stosb
                        mov     ecx, filename_ndigit-1
                        mov     al, '0'
                        rep     stosb

                        ; X001.EXE -- disable JMPs
                        mov     ebx, FLAG_DEBUG+FLAG_NOJMPS
                        mov     ecx, CMD_IMUL+CMD_SHLD+CMD_SHRD+CMD_BSWAP+CMD_XADD
                        mov     edx, REG_ALL-REG_EBP
                        mov     esi, -1             ; unused 'coz FLAG_NOJMPS
                        mov     edi, 0CCh
                        call    gen_1_file

                        ; X002.EXE -- only regs ECX/EDX and commands SUB/DEC
                        mov     ebx, FLAG_DEBUG+FLAG_NOJMPS+FLAG_NOSHORT
                        mov     ecx, CMD_SUB+CMD_DEC
                        mov     edx, REG_ECX+REG_EDX
                        mov     esi, -1
                        mov     edi, 0CCh
                        call    gen_1_file

                        ; X003.EXE -- only EAX and XOR, maximal compression
                        mov     ebx, FLAG_DEBUG+FLAG_NOJMPS+FLAG_NOLOGIC
                        mov     ecx, CMD_XOR
                        mov     edx, REG_EAX
                        mov     esi, -1
                        mov     edi, 0CCh
                        call    gen_1_file

                        ; X004.EXE -- JMP after each command
                        mov     ebx, FLAG_DEBUG+FLAG_EIP0
                        mov     ecx, CMD_ALL
                        mov     edx, REG_ALL-REG_EBP
                        mov     esi, 0                  ; jmp after each cmd
                        mov     edi, 0CCh
                        call    gen_1_file

                        push    -1                      ; exit
                        callW   ExitProcess

                        ; following procedure calls all the stuff we need
                        ; to generate 1 file

gen_1_file:             pusha
                        call    inc_filename    ; increase number of file
                        lea     edi, msg_writing; message
                        call    write_msg       ; ...
                        lea     edi, filename   ; ...
                        call    write_msg       ; ...
                        popa
                        call    call_kme        ; generate decryptor
                        jc      gen_err
                        call    write_file      ; write file
                        lea     edi, msg_ok     ; ok message
                        call    write_msg       ; ...
                        ret
gen_err:                lea     edi, msg_failed ; fault message
                        call    write_msg       ; ...
                        ret

                        ; subroutine to write message (in EDI)

write_msg:              pusha
                        push    -11             ; STD_OUTPUT_HANDLE
                        callW   GetStdHandle
                        xchg    ebx, eax
                        mov     edx, edi
                        xor     ecx, ecx
                        dec     ecx
                        xor     eax, eax
                        cld
                        repnz   scasb
                        neg     ecx
                        dec     ecx
                        dec     ecx
                        call    fwrite
                        popa
                        ret

                        ; subroutine to increase file number (NNNN.EXE)

inc_filename:           lea     esi, filename_1stdigit+filename_ndigit-1
inc_1:                  inc     byte ptr [esi]
                        cmp     byte ptr [esi], '9'
                        jbe     inc_2
                        mov     byte ptr [esi], '0'
                        dec     esi
                        cmp     esi, offset filename_1stdigit
                        jb      inc_filename
                        jmp     inc_1
inc_2:                  ret

                        ; subroutine to write file (NNNN.EXE)

write_file:             lea     edx, filename
                        call    fcreate
                        xchg    ebx, eax
                        lea     edx, exehdr
                        mov     ecx, exehdr_size
                        call    fwrite
                        lea     edx, buf
                        mov     ecx, execode_size
                        call    fwrite
                        call    fclose
                        ret

                        ; call kme_main & calc new eip

call_kme:               push    ebx                     ; flags
                        push    ecx                     ; cmd mask
                        push    edx                     ; reg mask
                        callW   GetTickCount
                        push    eax                     ; randseed
                        push    esi                     ; jmps if rnd(X)==0
                        push    offset buf_entry        ; [output eip]
                        push    offset buf_size         ; [output size]
                        push    edi                     ; output filler
                        push    execode_size            ; output/max size
                        push    offset buf              ; output buffer
                        push    dropper_entry-dropper_start ; input eip
                        push    dropper_size            ; input size
                        push    offset dropper_start    ; input buffer

                        extrn   kme_main:PROC
                        call    kme_main

                        mov     eax, buf_entry          ; set new eip
                        lea     eax, [eax + execode_rva] ; to keep flags (cf)
                        mov     exehdr.dword ptr exeeip_offs, eax
                        ret

include                 fileio.inc                      ; file io subroutines

                        end     start
