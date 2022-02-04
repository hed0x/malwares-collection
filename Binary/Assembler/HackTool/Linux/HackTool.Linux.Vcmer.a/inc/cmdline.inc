
; command line parsing

; int cmdline2args(char *cmdline, char *args);

cmdline2args:

       pushad

       cld
       xor     ecx, ecx

       mov     esi, [esp+((8*4)+4)]
       mov     edi, [esp+((8*4)+8)]

.preparse:
       xor     eax, eax
       inc     ecx
.parse:
       lodsb
       cmp     al,'"'
       jz      .setbrkchr
       cmp     al, 09h
       jz      .chkbrkchr
       cmp     al, 20h
       jz      .chkbrkchr

.save: stosb
       cmp     al, 00h
       jnz     .parse
.exit:
       mov     [esp+(7*4)], ecx
       popad
       ret 8

.chkbrkchr:
       cmp     ah, '"'
       jz      .save
       cmp     byte [esi], 09h
       jz      .parse
       cmp     byte [esi], 20h
       jz      .parse

       mov     al, 00h
       stosb

       cmp     [esi], al
       jz      .exit
       jnz     .preparse

.setbrkchr:
       add     ah, al
       jmp     .parse

; char* getargx(int argc, char *args);

getargx:
      xor      eax, eax
      pushad

      mov      ecx, [esp+((8*4)+4)]
      jecxz    .exit
      mov      esi, [esp+((8*4)+8)]
.loop:
      mov      [esp+(7*4)], esi
.slp: lodsb
      or       al, al
      jnz      .slp

      dec      ecx
      jnz      .loop
.exit:
      popad
      ret 8
