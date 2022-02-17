   ;***************************************************************
   ;*         aPLib v0.22b  -  the smaller the better :)          *
   ;*               WASM & TASM assembler depacker                *
   ;*                                                             *
   ;*   Copyright (c) 1998-99 by  - Jibz -  All Rights Reserved   *
   ;***************************************************************

   _aP_depack_asm:

   push   ebp
   mov    ebp, esp
   pushad
   push   ebp
   mov    esi, [ebp + 8]     ; C calling convention
   mov    edi, [ebp + 12]
   cld
   mov    dl, 80h

   literal:

   movsb

   nexttag:

   call   getbit
   jnc    literal

   xor    ecx, ecx
   call   getbit
   jnc    codepair
   xor    eax, eax
   call   getbit
   jnc    shortmatch
   mov    al, 10h

   getmorebits:

   call   getbit
   adc    al, al
   jnc    getmorebits
   jnz    domatch_with_inc
   stosb
   jmp    short nexttag

   codepair:

   call   getgamma_no_ecx
   dec    ecx
   loop   normalcodepair
   mov    eax,ebp
   call   getgamma
   jmp    short domatch

   shortmatch:

   lodsb
   shr    eax, 1
   jz     donedepacking
   adc    ecx, 2
   mov    ebp, eax
   jmp    short domatch

   normalcodepair:

   xchg   eax, ecx
   dec    eax
   shl    eax, 8
   lodsb
   mov    ebp, eax
   call   getgamma
   cmp    eax, 32000
   jae    domatch_with_2inc
   cmp    eax, 1280
   jae    domatch_with_inc
   cmp    eax, 7fh
   ja     domatch

   domatch_with_2inc:

   inc    ecx

   domatch_with_inc:

   inc    ecx

   domatch:

   push   esi
   mov    esi, edi
   sub    esi, eax
   rep    movsb
   pop    esi
   jmp    short nexttag

   getbit:

   add     dl, dl
   jnz     stillbitsleft
   mov     dl, [esi]
   inc     esi
   adc     dl, dl

   stillbitsleft:

   ret

   getgamma:

   xor    ecx, ecx

   getgamma_no_ecx:

   inc    ecx

   getgammaloop:

   call   getbit
   adc    ecx, ecx
   call   getbit
   jc     getgammaloop
   ret

   donedepacking:

   pop    ebp
   sub    edi, [ebp + 12]
   mov    [ebp - 4], edi     ; return unpacked length in eax

   popad
   pop    ebp
   ret    (4*2)
