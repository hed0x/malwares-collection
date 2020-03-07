   uDec:   lodsd
       push    eax
       add eax,edi
       mov [xLen][ebp],eax

       mov [Cnt][ebp],32
       lodsd
       mov     [xCode][ebp],eax
   Unpack: Call    GetOne
       cmp al,1
       jz  BlockPack
       Call    GetByte
       stosb
       jmp SkipBlock
   BlockPack:
       mov ecx,LenBit
       Call    GetBits
       push    eax
       mov ecx,WinBit
       Call    GetBits
       mov ebx,edi
       sub ebx,eax
       pop ecx
       xchg    esi,ebx
   rep movsb
       xchg    esi,ebx
   SkipBlock:
       cmp edi,[xLen][ebp]
       jbe Unpack
       pop ecx
       jmp DeDone

   xLen    dd  ?
   xTbl    dd  ?
   xCode   dd      ?

   GetBits proc
       push    ebx
       xor eax,eax
   GetIt:  shl [xCode][ebp],1
       jnc gNoBit
       mov ebx,1
       dec ecx
       shl ebx,cl
       inc ecx
       or  eax,ebx
   gNoBit: dec [Cnt][ebp]
       jnz xNotZero
           push    eax
       lodsd
           mov     [xCode][ebp],eax
           pop     eax
       mov [Cnt][ebp],32
   xNotZero:
       loop    GetIt
       pop ebx
       ret
   GetBits endp

   GetOne  proc
       mov ecx,1
       Call    GetBits
       ret
   GetOne  endp

   GetByte proc
       mov ecx,8
       Call    GetBits
       ret
   GetByte endp

   DeDone:
