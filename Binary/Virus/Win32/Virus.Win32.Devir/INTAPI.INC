   ; Prog API interceptor.

   mybase  dd  ?
   pehdr   dd  ?
   xxpos   dd  ?
   xopos   dd  ?
   nfind   dd  ?
   nfindl  dd  ?

   InitIntercept   proc
       lea edi,[InitIntercept][ebp]
       mov ax,'ZM'
   xfndk:  dec edi
       cmp [edi],ax
       jnz xfndk
   xmz:    mov ebx,[edi][3Ch]
       cmp ebx,4000h
       jae xfndk
       lea ebx,[ebx][edi]
       cmp 4 ptr [ebx],'EP'
       jnz xfndk
       mov [mybase][ebp],edi
       mov [pehdr][ebp],ebx
       ret
   InitIntercept   endp

   Intercept   proc            ; ESi - Name of function,
                       ; EDX - Len of function name

                       ; Returns: Old Funct. Addr in EAX
                       ;      Offset to replace in EDi
       mov [nfind][ebp],esi
       mov [nfindl][ebp],edx

       mov eax,[mybase][ebp]
       mov ebx,[pehdr][ebp]
       mov edx,[ebx][80h]
       add edx,eax
       mov [xxpos][ebp],eax
       mov [xopos][ebp],edx

   nlib:   mov eax,[xxpos][ebp]
       mov edx,[xopos][ebp]
       add [xopos][ebp],14h

       mov ebx,[edx][10h]
       add ebx,eax

       mov esi,[edx]
       or  esi,esi
       jz  alldone
       add esi,eax
       xchg    eax,edx
       xor ecx,ecx
   xFindIt:
       lodsd
       push    eax
       and eax,80000000h
       or  eax,eax
       pop eax
       jnz nimp
       or  eax,eax
       jz  nlib
       push    esi ecx
       add eax,edx
       xchg    eax,esi
       mov edi,[nfind][ebp]
       mov ecx,[nfindl][ebp]
       add esi,2
   rep cmpsb
       pop ecx esi
       jz  ItsItx
   nimp:   inc ecx
       jmp xFindIt
   ItsItx: lea edi,[ecx*4][ebx]
       mov eax,4 ptr [edi]
       ret
   alldone:
       xor eax,eax
       ret
   Intercept   endp
