;Abreast Davies-Meyer hash using XTEA

;void WINAPI tea_hash(ptr data2hash, dword size, ptr result)
; *1§ 128 bits of result are the staring seed
; *2§ 128 bits of result are the returned hash

tea_hash:
       pushad
       sub esp, 40
;esp    = Gi-1
;esp+8  = Mi
;esp+16 = Hi-1
;esp+24 = tmp1
;esp+32 = tmp2
       mov esi, [esp+(8*4)+12+40]       ;128 rnd bits (Ig,Ih)
       lea edi, [esi+16]
       movsd
       movsd                            ;make G0
       movsd
       movsd                            ;make H0
       mov ebp, [esp+(8*4)+12+40]
       mov ecx, [esp+(8*4)+8+40]
       mov edx, [esp+(8*4)+4+40]
       shr ecx, 3                       ;number of 64b blocks
  @@hash_loop:
       lea esi, [ebp+16]                ;esi=Gi,Hi
       lodsd                            ;32b of Gi-1
       mov [esp], eax
       not eax
       mov [esp+24], eax
       lodsd                            ;the other 32b of Gi-1
       mov [esp+4], eax
       not eax
       mov [esp+28], eax                ;set tmp1 to !Gi-1
       lodsd                            ;32b of Hi-1
       mov [esp+16], eax
       mov [esp+32], eax
       lodsd                            ;the other 32b of Hi-1
       mov [esp+20], eax
       mov [esp+36], eax                ;set tmp2 to Hi-1
       mov eax, [edx]
       mov [esp+8], eax
       mov eax, [edx+4]
       mov [esp+12], eax                ;copy 64b of msg
       add edx, 8
       lea esi, [esp+8]
       lea edi, [esp+24]
       call TEA_Encrypt                 ;encrypt !Gi-1 by key Mi,Hi-1
       mov eax, [edi]
       xor [ebp+16], eax
       mov eax, [edi+4]
       xor [ebp+20], eax                ;xor Gi
       mov esi, esp
       lea edi, [esp+32]
       call TEA_Encrypt                 ;encrypt Hi-1 by key Gi-1,Mi
       mov eax, [edi]
       xor [ebp+24], eax
       mov eax, [edi+4]
       xor [ebp+28], eax                ;xor Hi
       loop @@hash_loop
       add esp, 40
       popad
       ret 3*4

