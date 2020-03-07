   get_proc proc
       push ebp
       ; in:
       ; eax - CRC32
       ; ebx - DLL offset
       ; dl  - first char
       ; out:
       ; eax       - API address
       ; [ecx+ebx] - offset API address in table
       ; ebx       - offset DLL
       mov edi, [ebx+3Ch]
       mov edi, [edi+78h+ebx]
       mov ecx, [edi+18h+ebx]
       mov esi, [edi+20h+ebx]
   __1:
       mov ebp, [esi+ebx]
       add ebp, ebx
       cmp 1 ptr [ebp], dl
       jnz __2
       push ebx ecx
       ; use ebx, ecx
       ; ebp - offset to name'z
       xor ebx, ebx
       dec ebx
   __5:
       xor bl, 1 ptr [ebp]
       inc ebp
       mov cl, 7
   __3:
       shr ebx, 1
       jnc __4
       xor ebx, CRC32_init
   __4:
       dec cl
       jns __3
       cmp  1 ptr [ebp], 0
       jnz __5
       cmp eax, ebx
       pop ecx ebx
       jz __6
   __2:
       add esi, 4
       loop __1
   __6:
       sub ecx, [edi+18h+ebx]
       neg ecx
       add ecx, ecx
       add ecx, [edi+24h+ebx]
       add ecx, ebx
       movzx ecx, 2 ptr [ecx]
       shl ecx, 2
       add ecx, [edi+1Ch+ebx]
       mov eax, [ecx+ebx]
       add eax, ebx
       pop ebp
       ret
       endp

   import proc
       mov ebx, [ebp.k32]
       CRC32_eax GetModuleHandleA
       mov dl, 'G'
       call get_proc
       mov [ebp.GetModuleHandleA], eax
       CRC32_eax LoadLibraryA
       mov dl, 'L'
       call get_proc
       mov [ebp.LoadLibraryA], eax
       lea esi, [ebp.import_table]
   __1:
       push esi
       call [ebp.GetModuleHandleA]
       test eax, eax
       jnz  __2
       ; if library not load ...
       push esi
       call [ebp.LoadLibraryA]
   __2:
       xchg eax, ebx
   __3:
       lodsb
       test al, al
       jnz __3
   __4:
       lodsd
       test eax, eax
       jz   __5
       mov dl, [esi]
       inc esi
       push esi
       call get_proc
       pop edi
       stosd
       mov esi, edi
       jmp __4
   __5:
       cmp [esi], eax
       jnz __1
       ret
       endp

   GetModuleHandleA   dd 0
   LoadLibraryA       dd 0
   k32                dd 0BFF70000h
