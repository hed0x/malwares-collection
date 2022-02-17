
; ---------------------------------------------------------------------------

c_mov                   equ     8Bh
c_add                   equ     03h    ; c0
c_sub                   equ     2Bh    ; e8
c_xor                   equ     33h    ; f0
c_cmp                   equ     3Bh    ; f8

esp4                    equ     <[esp+4]>
esp8                    equ     <[esp+8]>
esp12                   equ     <[esp+12]>

b0                      equ     <byte ptr 0>
b4                      equ     <byte ptr 4>

d0                      equ     <dword ptr 0>
d4                      equ     <dword ptr 4>
d8                      equ     <dword ptr 8>
d12                     equ     <dword ptr 12>

call1                   macro   p, x1
                        push    x1
                        call    p
                        endm

call2                   macro   p, x1, x2
                        push    x1
                        push    x2
                        call    p
                        endm

call3                   macro   p, x1, x2, x3
                        push    x1
                        push    x2
                        push    x3
                        call    p
                        endm

; ---------------------------------------------------------------------------

engine                  proc    c

                        arg     user_param
                        arg     bufptr
                        arg     outbufsizeptr
                        arg     regfree
                        arg     user_fixup
                        arg     user_trash
                        arg     user_random
                        arg     x0
                        arg     x1
                        arg     x2
                        arg     x3

                        pusha

                        mov     edi, bufptr

                        mov     eax, x1
                        mov     x1, c_mov
                        or      eax, eax
                        jz      __ok
                        mov     x1, c_add
                        dec     eax
                        jz      __ok
                        mov     x1, c_sub
                        dec     eax
                        jz      __ok
                        mov     x1, c_xor
                        dec     eax
                        jz      __ok
                        mov     x1, c_cmp
                        dec     eax
                        jnz     metaerror
__ok:
                        mov     eax, x0

                        push    x1
                        push    x2
                        push    x3
                        call    dispatch

                        sub     edi, bufptr
                        mov     eax, outbufsizeptr
                        mov     [eax], edi

                        popa
                        ret
                        endp

dispatch:               or      eax, eax
                        je      _cmd_v_c
                        dec     eax
                        je      _cmd_v_v
                        dec     eax
                        je      _cmd_v_memv
                        dec     eax
                        je      _cmd_memv_v

                        dec     eax
                        je      _cmd_r_r
                        dec     eax
                        je      _cmd_r_c
                        dec     eax
                        je      _cmd_r_memr
                        dec     eax
                        je      _cmd_memr_r
                        dec     eax
                        je      _cmd_r_v
                        dec     eax
                        je      _cmd_v_r

metaerror:              int 3
                        retn

endcmd:                 cmp     user_trash, 0
                        je      __skip_trash
                        pusha
                        push    regfree
                        push    edi
                        push    user_param
                        call    user_trash
                        add     esp, 12
                        mov     [esp+0*4], eax  ; popa.edi <-- eax
                        popa
__skip_trash:
                        retn

; ---------------------------------------------------------------------------

;endcmd:                <-- called after each instruction. YOU must define it

; ---------------------------------------------------------------------------

call_random:            pusha
                        push    eax
                        push    user_param
                        call    user_random
                        add     esp, 8
                        mov     [esp+7*4], eax
                        popa
                        or      eax, eax
                        retn

rnd2:                   mov     eax, 2
                        jmp     call_random

rnd3:                   mov     eax, 3
                        jmp     call_random

rnd8:                   mov     eax, 8
                        jmp     call_random

rnd256:                 mov     eax, 256
                        jmp     call_random

rnd_dword:              push    eax
                        call    rnd256
                        mov     [esp+0], al
                        call    rnd256
                        mov     [esp+1], al
                        call    rnd256
                        mov     [esp+2], al
                        call    rnd256
                        mov     [esp+3], al
                        pop     eax
                        retn

; ---------------------------------------------------------------------------

reg_alloc:              cmp     regfree, 0
                        jz      metaerror
__cycle:                call    rnd8
                        btr     regfree, eax
                        jnc     __cycle
                        retn

reg_free:               mov     eax, esp4
                        bts     regfree, eax
                        jc      metaerror
                        retn     4

reg_xchg:               cmp     regfree, 0
                        je      __exit
                        call    rnd3
                        jnz     __exit
                        call    reg_alloc
                        push    ecx
                        xchg    ecx, eax
                        call3   _cmd_r_r, c_mov, ecx, esp4.d12
                        call1   reg_free, esp4.d4
                        mov     esp4.d4, ecx
                        pop     ecx
__exit:                 retn

; ---------------------------------------------------------------------------

                        r1      = ebx
                        r2      = esi

r1_alloc:               call    reg_alloc
                        xchg    r1, eax
                        retn

r2_alloc:               call    reg_alloc
                        xchg    r2, eax
                        retn

r1_free:                push    r1
                        call    reg_free
                        retn

r2_free:                push    r2
                        call    reg_free
                        retn

r1_xchg:                push    r1
                        call    reg_xchg
                        pop     r1
                        retn

r2_xchg:                push    r2
                        call    reg_xchg
                        pop     r2
                        retn

; ---------------------------------------------------------------------------

_cmd_r_r:               mov     al, esp12             ; cmd r, r
                        cmp     al, c_mov
                        je      __mov
__r00:                  call    rnd2
                        jz      __b
__a:                    mov     al, esp12
                        stosb
                        mov     al, esp8
                        shl     al, 3
                        or      al, esp4
                        or      al, 0C0h
                        stosb
                        call    endcmd
                        retn    12
__b:                    mov     al, esp12
                        xor     al, 2
                        stosb
                        mov     al, esp4
                        shl     al, 3
                        or      al, esp8
                        or      al, 0C0h
                        stosb
                        call    endcmd
                        retn    12
__mov:                  call    rnd2
                        jz      __r00
__r01:                  mov     al, 50h               ; push r1
                        or      al, esp4
                        stosb
                        call    endcmd
                        mov     al, 58h               ; pop r2
                        or      al, esp8
                        stosb
                        call    endcmd
                        retn    12
; ---------------------------------------------------------------------------

; LEA may be used here
mov_r_offsv:
                        call    rnd3
                        jz      __pushpop
                        dec     eax
                        jz      __lea

__mov:                  mov     al, 0B8h                ; mov r, c
                        or      al, esp8
                        stosb
__x1:                   mov     eax, esp4
                        stosd

                        call    do_fixup

                        call    endcmd
                        retn    8

__lea:                  movzx   eax, byte ptr esp8
                        shl     eax, 3+8
                        or      ax, 058Dh
                        stosw
                        jmp     __x1

__pushpop:
                        mov     al, 68h
                        stosb
                        mov     eax, esp4
                        stosd

                        call    do_fixup

                        call    endcmd

                        mov     al, 58h         ; pop r32
                        or      al, esp8
                        stosb

                        call    endcmd

                        retn    8

do_fixup:               cmp     user_fixup, 0
                        jz      __exit

                        sub     edi, 4
                        pusha
                        push    eax
                        push    edi
                        push    user_param
                        call    user_fixup
                        add     esp, 12
                        mov     [esp+0*4], eax  ; pop.edi <-- eax
                        popa

__exit:                 retn

; ---------------------------------------------------------------------------

_cmd_r_c:               mov     al, esp12
                        cmp     al, c_mov
                        je      __mov_r_c
__notmov:               mov     al, 81h
                        stosb
                        mov     al, esp12
                        cmp     al, c_xor
                        mov     ah, 0F0h
                        je      __stosb
                        cmp     al, c_add
                        mov     ah, 0C0h
                        je      __stosb
                        cmp     al, c_sub
                        mov     ah, 0E8h
                        je      __stosb
                        cmp     al, c_cmp
                        mov     ah, 0F8h
                        je      __stosb
__stosb:                mov     al, ah
                        or      al, esp8
                        stosb
                        mov     eax, esp4
                        stosd
                        call    endcmd
                        retn    12
__mov_r_c:              mov     eax, 5
                        call    call_random
                        jz      __mov           ; 0
                        dec     eax
                        jz      __mov_add       ; 1
                        dec     eax
                        jz      __mov_sub       ; 2
                        dec     eax
                        jz      __mov_xor       ; 3
                        ; 4
__pushpop:              mov     al, 68h                 ; push c
                        stosb
                        mov     eax, esp4
                        stosd
                        call    endcmd
                        mov     al, 58h                 ; pop r
                        or      al, esp8
                        stosb
                        call    endcmd
                        retn    12
__mov:                  mov     al, 0B8h                ; mov r, c
                        or      al, esp8
                        stosb
                        mov     eax, esp4
                        stosd
                        call    endcmd
                        retn    12

__mov_add:              call    rnd_dword
                        push    eax
                        sub     eax, esp4+4     ;FIXED!
                        neg     eax
                        call3   _cmd_r_c, c_mov, esp8.d4+4, eax
                        pop     eax
                        call3   _cmd_r_c, c_add, esp8.d4, eax
                        retn    12

__mov_sub:              call    rnd_dword
                        push    eax
                        add     eax, esp4+4
                        call3   _cmd_r_c, c_mov, esp8.d4+4, eax
                        pop     eax
                        call3   _cmd_r_c, c_sub, esp8.d4, eax
                        retn    12

__mov_xor:              call    rnd_dword
                        push    eax
                        xor     eax, esp4+4
                        call3   _cmd_r_c, c_mov, esp8.d4+4, eax
                        pop     eax
                        call3   _cmd_r_c, c_xor, esp8.d4, eax
                        retn    12

; ---------------------------------------------------------------------------

_cmd_r_memr:            mov     al, esp12            ; cmd x1, [x2]
                        cmp     al, c_mov
                        je      __mov
__r01:                  mov     al, esp12
                        stosb
                        mov     al, esp8
                        shl     al, 3
                        or      al, esp4
                        stosb
                        call    endcmd
                        retn    12
__mov:                  call    rnd2
                        jz      __r01
__r00:                  mov     al, 0FFh                ; push [x2]
                        stosb
                        mov     al, 30h
                        or      al, esp4
                        stosb
                        call    endcmd
                        mov     al, 58h                 ; pop x1
                        or      al, esp8
                        stosb
                        call    endcmd
                        retn    12

; ---------------------------------------------------------------------------

_cmd_memr_r:            mov     al, esp12            ; cmd [x1], x2
                        cmp     al, c_mov
                        je      __mov
__r01:                  mov     al, esp12
                        xor     al, 2
                        stosb
                        mov     al, esp4
                        shl     al, 3
                        or      al, esp8
                        stosb
                        call    endcmd
                        retn    12
__mov:                  call    rnd2
                        jz      __r01
                        mov     al, 50h                 ; push x2
                        or      al, esp4
                        stosb
                        call    endcmd
                        mov     al, 8Fh                 ; pop [x1]
                        stosb
                        xor     al, al
                        or      al, esp8
                        stosb
                        call    endcmd
                        retn    12

; ---------------------------------------------------------------------------

_cmd_r_v:               call    rnd2
                        jz      __r01

__r00:                  mov     al, esp12            ; cmd r, [v]
                        cmp     al, c_mov
                        je      __mov
__r0000:                mov     al, esp12
                        stosb
                        mov     eax, esp8
                        shl     al, 3
                        or      al, 5
                        stosb
                        mov     eax, esp4
                        stosd
                        call    do_fixup             ; +
                        call    endcmd
                        retn    12
__mov:                  call    rnd2
                        jz      __r0000
__r0001:                mov     ax, 35FFh       ; push [v]
                        stosw
                        mov     eax, esp4
                        stosd
                        call    do_fixup             ; +
                        call    endcmd
                        mov     al, 58h         ; pop r
                        or      al, esp8
                        stosb
                        call    endcmd
                        retn    12

__r01:                  cmp     regfree,0
                        je      __r00

                        push    r1
                        call    r1_alloc
                        call2   mov_r_offsv, r1, esp4.d8; mov r1, offset v
                        call    r1_xchg
                        call3   _cmd_r_memr, esp12.d4, esp8.d8, r1   ; cmd r, [r1]
                        call    r1_free
                        pop     r1
                        retn    12

; ---------------------------------------------------------------------------

_cmd_v_r:               call    rnd2
                        jz      __r01

__r00:                  mov     al, esp12            ; cmd [v], r
                        cmp     al, c_mov
                        je      __mov
__r0000:                mov     al, esp12
                        xor     al, 2
                        stosb
                        mov     eax, esp4
                        shl     al, 3
                        or      al, 5
                        stosb
                        mov     eax, esp8
                        stosd
                        call    do_fixup             ; +
                        call    endcmd
                        retn    12
__mov:                  call    rnd2
                        jz      __r0000
__r0001:                mov     al, 50h               ; push r
                        or      al, esp4
                        stosb
                        call    endcmd
                        mov     ax, 058Fh             ; pop [v]
                        stosw
                        mov     eax, esp8
                        stosd
                        call    do_fixup             ; +
                        call    endcmd
                        retn    12

__r01:                  cmp     regfree,0
                        je      __r00

                        push    r1
                        call    r1_alloc
                        call2   mov_r_offsv, r1, esp8.d8; mov r1, offset v
                        call    r1_xchg
                        call3   _cmd_memr_r, esp12.d4, r1, esp4.d12 ; cmd [r1], r
                        call    r1_free
                        pop     r1
                        retn    12

; ---------------------------------------------------------------------------

_cmd_v_c:               call    rnd2
                        jz      __r01

__r00:                  mov     al, esp12         ; cmd [v], c
                        cmp     al, c_mov
                        jne     __1
                        mov     ax, 05C7h
                        stosw
                        jmp     __2
__1:                    mov     al, 81h
                        stosb
                        mov     al, esp12
                        add     al, 2
                        stosb
__2:                    mov     eax, esp8
                        stosd
                        call    do_fixup             ; +
                        mov     eax, esp4
                        stosd
                        call    endcmd
                        retn    12

__r01:                  cmp     regfree, 0
                        je      __r00

                        push    r1
                        call    r1_alloc
                        call3   _cmd_r_c, c_mov, r1, esp4.d12 ; mov r, c
                        call    r1_xchg
                        call3   _cmd_v_r, esp12.d4, esp8.d8, r1  ; cmd v, r
                        call    r1_free
                        pop     r1
                        retn    12

; ---------------------------------------------------------------------------

_cmd_v_v:               call    rnd3
                        jz      __r01
                        dec     eax
                        jz      __r02

__r00:                  push    r2
                        call1   alloc_r2_v, esp4.d4          ; mov r2, v2
                        call3   _cmd_v_r, esp12.d4, esp8.d8, r2 ; cmd v1, r2
                        call    r2_free
                        pop     r2
                        retn    12

__r02:                  push    r1 r2
                        call2   alloc_r1_v_cmp, esp8.d8, esp12.d12 ; [mov r1, v1]
                        call1   alloc_r2_v, esp4.d8            ; mov r2, v2
                        call3   _cmd_r_r, esp12.d0+8, r1, r2     ; cmd r1, r2
                        call    r2_free
                        jmp     _cmd_v_v_l1

__r01:                  push    r1 r2
                        call2   alloc_r1_v_cmp, esp8.d0+8, esp12.d4+8 ; [mov r1, v1]
                        call3   _cmd_r_v, esp12.d0+8, r1, esp4.d8+8; cmd r1,v2
_cmd_v_v_l1:            cmp     esp12.b0+8, c_cmp
                        je      __skip
                        call    r1_xchg
                        call3   _cmd_v_r, c_mov, esp8.d4+8, r1   ; mov v1,r1
__skip:                 call    r1_free
                        pop     r2 r1
                        retn    12

; ---------------------------------------------------------------------------

_cmd_v_memv:            push    r1 r2
                        call2   alloc_r1_v_cmp, esp8.d8, esp12.d12 ; [mov r1, v1]
                        call1   alloc_r2_v, esp4.d8            ; mov r2, v2
                        call3   _cmd_r_memr, esp12.d0+8, r1, r2; cmd r1, [r2]
                        call    r2_free
                        jmp     _cmd_v_v_l1

; ---------------------------------------------------------------------------

_cmd_memv_v:            push    r1 r2
                        call1   alloc_r1_v, esp8.d8               ; mov r1, v1
                        call1   alloc_r2_v, esp4.d8               ; mov r2, v2
                        call3   _cmd_memr_r, esp12.d0+8, r1, r2; cmd [r1], r2
                        call    r1_free
                        call    r2_free
                        pop     r2 r1
                        retn    12

; ---------------------------------------------------------------------------

alloc_r1_v_cmp:         call    r1_alloc
                        cmp     esp4.b0, c_mov
                        je      __skip
                        call3   _cmd_r_v, c_mov, r1, esp8.d8; mov r1, v
                        call    r1_xchg
__skip:                 retn    8

alloc_r1_v:             call    r1_alloc
                        call3   _cmd_r_v, c_mov, r1, esp4.d8; mov r1, v
                        call    r1_xchg
                        retn    4

alloc_r2_v:             call    r2_alloc
                        call3   _cmd_r_v, c_mov, r2, esp4.d8; mov r2, v
                        call    r2_xchg
                        retn    4

; ---------------------------------------------------------------------------


