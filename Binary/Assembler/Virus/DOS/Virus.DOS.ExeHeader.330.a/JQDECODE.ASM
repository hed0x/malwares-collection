   ;
   ;JQDECODE.ASM - Supertiny/fast Compression/Encryption library - Decompressor
   ;(c) 1998 by Jacky Qwerty/29A.
   ;

   .386p

   include jqcoding.inc

   _text           segment byte use32 public 'CODE'
                   assume cs:_text, ds:_text, ss:_text

   ;unsigned long
   ;__stdcall
   ;jq_decode(void          *out,          /* output stream ptr */
   ;          const void    *in,           /* input stream ptr */
   ;          unsigned long  in_len,       /* input stream length */
   ;          void          *mem64k);      /* work mem ptr */

   jq_decode       proc
                   sub     eax, eax
                   pushad
                   mov     ebp, esp
                   and     ecx, eax
                   mov     edi, [_mem64k + ebp]
                   cld
                   mov     ch, (SizeOf_Mem / 4) / 256
                   push    edi
                   rep     stosd
                   mov     esi, [_in + ebp]
                   xchg    ebx, eax
                   add     ecx, [_in_len + ebp]
                   lodsw
                   mov     edi, [_out + ebp]
                   add     ecx,-6
                   pop     ebp
                   lodsd
                   xchg    edx, eax
                   .repeat
                     test    byte ptr [_Pushad._eax + esp], 7
                     .if     zero?
                       ror     edx, 1
                       jecxz   L0_jq_decode
                       .if     carry?
                         xor     edx, mask0 xor mask1
                       .endif
                       lodsb
                       dec     ecx
                       xor     edx, mask0
                       sbb     al, dl
                       mov     ah, al
                     .endif
                     shl     ah, 1
                     inc     byte ptr [_Pushad._eax + esp]
                     .if     carry?
                       ror     edx, 1
                       jecxz   L0_jq_decode
                       .if     !carry?
                         xor     edx, mask0 xor mask1
                       .endif
                       lodsb
                       dec     ecx
                       xor     edx, mask1
                       sbb     al, dl
                       _mem64k equ <ebp>
                       mov     [_mem64k + ebx], al
                     .endif
                     mov     al, [_mem64k + ebx]
                     mov     bh, bl
                     stosb
                     mov     bl, al
                   .until  0
                   dec     edx
                   push    ecx
                 L0_jq_decode:
                   sub     edi, [_out + esp]
                   mov     [_Pushad._eax + esp], edi
                   popad
                   ret     (_Args * _Pushed)
   jq_decode       endp
                   public  jq_decode

   _text           ends

                   end
