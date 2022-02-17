   truncate proc
         pushad
         push ebx
         call [ebp.SetEndOfFile]
         jmp n_chk
         endp


   fsize proc
         pushad
         push 0 ebx
         call [ebp.GetFileSize]
         jmp n_chk
         endp


   gettime proc
         pushad
         ; esi - addres struc
         ;
         ;  CONST FILETIME *  lpftLastWrite    // time the file was last written
         ;  CONST FILETIME *  lpftLastAccess,  // time the file was last accessed
         ;  CONST FILETIME *  lpftCreation,    // time the file was created
         ;
         ; filetime struc
         ;      dwLowDateTime   dd ?
         ;      dwHighDateTime  dd ?
         ;      ends
         push esi
         lodsd
         lodsd
         push esi
         lodsd
         lodsd
         push esi ebx
         call [ebp.GetFileTime]
         jmp n_chk
         endp


   settime proc
         pushad
         ; esi - addres struc
         ;
         ;  CONST FILETIME *  lpftLastWrite    // time the file was last written
         ;  CONST FILETIME *  lpftLastAccess,  // time the file was last accessed
         ;  CONST FILETIME *  lpftCreation,    // time the file was created
         ;
         ; filetime struc
         ;      dwLowDateTime   dd ?
         ;      dwHighDateTime  dd ?
         ;      ends
         push esi
         lodsd
         lodsd
         push esi
         lodsd
         lodsd
         push esi ebx
         call [ebp.SetFileTime]
         jmp n_chk
         endp

   fattrs proc
         pushad
         push eax edx
         call [ebp.SetFileAttributesA]
         jmp n_chk
         endp

   fattrg proc
         pushad
         push edx
         call [ebp.GetFileAttributesA]
         jmp n_chk
         endp

   open proc
        pushad
        ; eax - mode
        ; edx - name
        ;
        ; OF_READ      Opens the file for reading only.
        ; OF_READWRITE Opens the file for reading and writing.
        ; OF_WRITE     Opens the file for writing only.
        push eax edx
        call [ebp._lopen]
   n_chk:
        mov [esp.1Ch], eax
        popad
        ret
        endp

   close proc
        pushad
        push ebx
        call [ebp.CloseHandle]
        popad
        ret
        endp

   write proc
        pushad
        push eax
        mov  eax, esp
        push 0
        push eax
        push ecx edx ebx
        call [ebp.WriteFile]
        jmp n_check
        endp

   read proc
        ; ecx - length
        ; ebx - handle
        ; edx - buffer
        pushad
        push eax
        mov  eax, esp
        push 0
        push eax
        push ecx edx ebx
        call [ebp.ReadFile]
   n_check:
        pop eax
        mov [esp.1Ch], eax
        popad
        cmp eax, ecx
        jz  __1
        stc
   __1:
        ret
        endp

   seek proc
        pushad
        push 0 0 edx ebx
        call [ebp.SetFilePointer]
        jmp n_chk
        endp
