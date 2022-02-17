   ;
   ;JQENCODE.ASM - Supertiny/fast Compression/Encryption library - Compressor
   ;(c) 1998 by Jacky Qwerty/29A.
   ;

   .386p

   include jqcoding.inc

   _text           segment byte use32 public 'CODE'
                   assume cs:_text, ds:_text, ss:_text

   ;unsigned long
   ;__stdcall
   ;jq_encode(void          *out,          /* output stream ptr */
   ;          const void    *in,           /* input stream ptr */
   ;          unsigned long  in_len,       /* input stream length */
   ;          void          *mem64k);      /* work mem ptr */

   jq_encode       proc
                   sub     edx, edx
                   xchg    eax, edx
                   pushad
                   mov     ebp, esp
                   and     ecx, eax
                   mov     edi, [_mem64k + ebp]
                   cld
                   mov     ch, (SizeOf_Mem / 4) / 256
                   push    edi
                   rep     stosd
                   sub     edx, invalid_state
                   mov     esi, [_in + ebp]
                   .if     zero?
                     dec     edx
                   .endif
                   push    ecx
                   sub     ax, 0AEB6h
                   mov     edi, [_out + ebp]
                   pop     ebx
                   stosw
                   xchg    eax, edx
                   pop     ebp
                   stosd
                   push    edi
                   xchg    eax, edx
                   push    esp
                   .repeat
                     test    cl, 7
                     lodsb
                     .if     zero?
                       xchg    edx, [esp]
                       adc     ah, dl
                       pop     edx
                       xchg    edi, [esp]
                       ror     edx, 1
                       mov     [edi], ah
                       .if     !carry?
                         xor     edx, mask0 xor mask1
                       .endif
                       pop     edi
                       mov     ah, 0FFh
                       push    edi
                       xor     edx, mask1
                       inc     edi
                       push    edx
                     .endif
                     _mem64k equ <ebp>
                     cmp     al, [_mem64k + ebx]
                     .if     !zero?
                       ror     edx, 1
                       mov     [_mem64k + ebx], al
                       .if     carry?
                         xor     edx, mask0 xor mask1
                       .endif
                       mov     bh, al
                       xor     edx, mask0
                       adc     al, dl
                       stosb
                       mov     al, bh
                       stc
                     .endif
                     inc     ecx
                     mov     bh, bl
                     rcl     ah, 1
                     cmp     ecx, [_in_len + (2 * _Pushed) + esp]
                     mov     bl, al
                   .until  !carry?
                   ror     ah, cl
                   pop     ebx
                   add     ah, bl
                   pop     esi
                   mov     ebp, esp
                   sub     edi, [_out + ebp]
                   mov     [_Pushad._edx + ebp], edx
                   xchg    [esi], ah
                   add     [_Pushad._eax + ebp], edi
                   popad
                   ret     (_Args * _Pushed)
   jq_encode       endp
                   public  jq_encode

   _text           ends

                   end
