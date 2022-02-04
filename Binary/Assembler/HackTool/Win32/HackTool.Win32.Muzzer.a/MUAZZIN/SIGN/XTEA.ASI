;Tiny Encryption Algorithm - extended version (XTEA)
;by David Wheeler and Roger Needham


DELTA  EQU 9E3779B9h
ROUNDS EQU 32


TEA_Encrypt PROC
       pushad
       xchg edi, esi                    ;edi=key
       mov ebp, esi                     ;ebp=plaintext
       mov ebx, [ebp+0]
       mov esi, [ebp+4]
       xor ecx, ecx
  @@loop:
       mov eax, esi
       shl eax, 4
       mov edx, esi
       shr edx, 5
       xor eax, edx                     ;z®4 ^ z¯5
       mov edx, esi
       xor edx, ecx
       add eax, edx                     ;z ^ sum
       mov edx, ecx
       and edx, 3
       add eax, [edi+edx*4]             ;k[sum&3]
       add ebx, eax                     ;y
       add ecx, DELTA                   ;+DELTA
       mov edx, ebx
       shl edx, 4
       mov eax, ebx
       shr eax, 5                       ;y®4 ^ y¯5
       xor edx, eax
       mov eax, ebx
       xor eax, ecx
       add edx, eax                     ;y ^ sum
       mov eax, ecx
       shr eax, 0Bh
       and eax, 3
       add edx, [edi+eax*4]             ;k[sum¯11&3]
       add esi, edx
       cmp ecx, 0C6EF3720h              ;DELTA*ROUNDS
       jnz @@loop
       mov [ebp+0], ebx
       mov [ebp+4], esi
       popad
       ret
TEA_Encrypt ENDP


TEA_Decrypt PROC
       pushad
       xchg edi, esi                    ;edi=key
       mov ebp, esi                     ;ebp=ciphertext
       mov ebx, [ebp+0]
       mov esi, [ebp+4]
       mov ecx, -957401312
  @@loop:
       mov edx, ebx
       shl edx, 4
       mov eax, ebx
       shr eax, 5
       xor edx, eax
       mov eax, ebx
       xor eax, ecx
       add edx, eax
       mov eax, ecx
       shr eax, 0Bh
       and eax, 3
       add edx, [edi+eax*4]
       sub esi, edx
       add ecx, -DELTA
       mov eax, esi
       shl eax, 4
       mov edx, esi
       shr edx, 5
       xor eax, edx
       mov edx, esi
       xor edx, ecx
       add eax, edx
       mov edx, ecx
       and edx, 3
       add eax, [edi+edx*4]
       sub ebx, eax
       test ecx, ecx
       jnz @@loop
       mov [ebp+0], ebx
       mov [ebp+4], esi
       popad
       ret
TEA_Decrypt ENDP

