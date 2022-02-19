
include                 FILEIO.INC
include                 ..\..\INCLUDE\consts.inc

                        extern  gettime:PROC

                        public  fcreate
                        public  fopen_ro
                        public  fopen_rw
                        public  fclose
                        public  fread
                        public  fwrite
                        public  fgetattr
                        public  fsetattr
                        public  fgetsize
                        public  fdelete
                        public  frename

                        public  findfirst
                        public  findnext
                        public  findclose

                        public  fgettimev
                        public  fsettimev

                        p386
                        model   flat
                        locals  __
                        jumps

                        .data

need_settime            db      ?
filetime                dq      ?

                        .code

; ---------------------------------------------------------------------------

is_ring0:               mov     eax, cs
                        cmp     eax, 28h        ; w9x: ring0 code selector
                        retn

; ---------------------------------------------------------------------------

r0_fileio:              VxDcall IFSMGR, Ring0_FileIO
                        retn

; ---------------------------------------------------------------------------

fcreate:                call    is_ring0
                        je      fcreate_r0

fcreate_r3:             mov     ecx, CREATE_ALWAYS
                        mov     edx, GENERIC_READ + GENERIC_WRITE
                        jmp     x1

fopen_ro:               call    is_ring0
                        je      fopen_ro_r0

fopen_ro_r3:            mov     ecx, OPEN_EXISTING
                        mov     edx, GENERIC_READ
                        jmp     x1

fopen_rw:               call    is_ring0
                        je      fopen_rw_r0

fopen_rw_r3:            mov     ecx, OPEN_EXISTING
                        mov     edx, GENERIC_READ + GENERIC_WRITE

x1:                     push    0
                        push    FILE_ATTRIBUTE_NORMAL
                        push    ecx
                        push    0
                        push    FILE_SHARE_READ + FILE_SHARE_WRITE
                        push    edx
                        push    dword ptr [esp+4] + 6*4
                        callW   CreateFileA

                        inc     eax
                        jz      short $+3
                        dec     eax

                        retn    4

; ---------------------------------------------------------------------------

fcreate_r0:             pusha
                        push    12h             ; not exists==create, exists==replace/open
                        jmp     r0_x4

fopen_rw_r0:            pusha
                        push    01h             ; not exists==fail, exists==open
r0_x4:                  mov     ebx, 2042h      ; no i24, denynone, r/w
                        jmp     r0_x5

fopen_ro_r0:            pusha
                        push    01h             ; not exists==fail, exists==open
                        mov     ebx, 2044h      ; no i24, denynone, r/o

r0_x5:                  pop     edx
                        push    32              ; archive
                        pop     ecx
                        mov     eax, R0_OPENCREATFILE

                        mov     esi, [esp+4]+32

                        call    r0_fileio

                        jnc     short $+4
                        xor     eax, eax

                        mov     [esp].popa_eax, eax
                        popa

                        retn    4

; ---------------------------------------------------------------------------

fclose:                 call    is_ring0
                        je      fclose_r0

fclose_r3:              push    dword ptr [esp+4]
                        callW   CloseHandle
                        retn    4

fclose_r0:              push    ebx
                        mov     eax, R0_CLOSEFILE
                        mov     ebx, [esp+4]+4
                        call    r0_fileio
                        pop     ebx
                        retn    4

; ---------------------------------------------------------------------------

extern                  ReadFile:PROC
extern                  WriteFile:PROC

fread:                  call    is_ring0
                        je      fread_r0

fread_r3:               pusha

                        push    FILE_BEGIN
                        push    0
                        push    dword ptr [esp+16] + 2*4+32
                        push    dword ptr [esp+4]  + 3*4+32
                        callW   SetFilePointer

                        push    0
                        lea     eax, [esp+4].popa_eax
                        push    eax               ; bytesread
                        push    dword ptr [esp+12]+ 2*4+32
                        push    dword ptr [esp+8] + 3*4+32
                        push    dword ptr [esp+4] + 4*4+32
                        callW   ReadFile

                        popa
                        retn    4*4

fwrite:                 call    is_ring0
                        je      fwrite_r0

fwrite_r3:              pusha

                        push    FILE_BEGIN
                        push    0
                        push    dword ptr [esp+16] + 2*4+32
                        push    dword ptr [esp+4]  + 3*4+32
                        callW   SetFilePointer

                        push    0
                        lea     eax, [esp+4].popa_eax
                        push    eax               ; byteswritten
                        push    dword ptr [esp+12]+ 2*4+32
                        push    dword ptr [esp+8] + 3*4+32
                        push    dword ptr [esp+4] + 4*4+32
                        call    WriteFile

                        popa
                        retn    4*4

; ---------------------------------------------------------------------------

fread_r0:               pusha

                        mov     eax, R0_READFILE
                        mov     ebx, [esp+4] +32
                        mov     esi, [esp+8] +32
                        mov     ecx, [esp+12] +32
                        mov     edx, [esp+16] +32
                        call    r0_fileio

                        jnc     short $+2+2
                        xor     ecx, ecx

                        mov     [esp].popa_eax, ecx
                        popa
                        retn    4*4

fwrite_r0:              pusha

                        mov     eax, R0_WRITEFILE
                        mov     ebx, [esp+4] +32
                        mov     esi, [esp+8] +32
                        mov     ecx, [esp+12] +32
                        mov     edx, [esp+16] +32
                        call    r0_fileio

                        jnc     short $+2+2
                        xor     ecx, ecx

                        mov     [esp].popa_eax, ecx
                        popa
                        retn    4*4

; ---------------------------------------------------------------------------

fgetattr:               call    is_ring0
                        je      fgetattr_r0

fgetattr_r3:            push    dword ptr [esp+4]
                        callW   GetFileAttributesA
                        retn    4

fgetattr_r0:            push    esi
                        mov     eax, R0_FILEATTRIBUTES+GET_ATTRIBUTES
                        mov     esi, [esp+4]+4
                        call    r0_fileio

                        movzx   eax, cx

                        jnc     short $+2+2+1
                        xor     eax, eax
                        dec     eax

                        pop     esi
                        retn    4

; ---------------------------------------------------------------------------

fsetattr:               call    is_ring0
                        je      fsetattr_r0

fsetattr_r3:            push    dword ptr [esp+8]
                        push    dword ptr [esp+4] + 4
                        callW   SetFileAttributesA
                        retn    8

fsetattr_r0:            push    esi
                        mov     eax, R0_FILEATTRIBUTES+SET_ATTRIBUTES
                        mov     esi, [esp+4]+4
                        mov     ecx, [esp+8]+4
                        call    r0_fileio

                        jnc     short $+2+2
                        xor     eax, eax

                        pop     esi
                        retn    8

; ---------------------------------------------------------------------------

fgetsize:               call    is_ring0
                        je      fgetsize_r0

fgetsize_r3:            push    0
                        push    dword ptr [esp+4] + 4
                        callW   GetFileSize
                        retn    4

fgetsize_r0:            pusha
                        mov     eax, R0_GETFILESIZE
                        mov     ebx, [esp+4]+32
                        call    r0_fileio
                        mov     [esp].popa_eax, eax
                        popa
                        retn    4

; ---------------------------------------------------------------------------

fdelete:                call    is_ring0
                        je      fdelete_r0

fdelete_r3:             push    dword ptr [esp+4]
                        callW   DeleteFileA

                        retn    4

fdelete_r0:             push    esi
                        mov     eax, R0_DELETEFILE
                        mov     ecx, 1+2+4+32 ; hidden/system/readonly/archive
                        mov     esi, [esp+4]+4
                        call    r0_fileio

                        jnc     short $+2+2
                        xor     eax, eax

                        pop     esi

                        retn    4

; ---------------------------------------------------------------------------

frename:                call    is_ring0
                        je      frename_r0

frename_r3:             push    dword ptr [esp+8]
                        push    dword ptr [esp+4]+4
                        callW   MoveFileA
                        retn    8

frename_r0:             push    esi
                        mov     eax, R0_RENAMEFILE
                        mov     esi, [esp+4]+4
                        mov     edx, [esp+8]+4
                        call    r0_fileio

                        jnc     short $+2+2
                        xor     eax, eax

                        pop     esi
                        retn    8

; ---------------------------------------------------------------------------

findfirst:              call    is_ring0
                        je      findfirst_r0

findfirst_r3:           push    dword ptr [esp+8]
                        push    dword ptr [esp+4] +4
                        callW   FindFirstFileA

                        inc     eax
                        jz      short $+3
                        dec     eax

                        retn    8

findfirst_r0:           push    esi
                        mov     eax, R0_FINDFIRSTFILE
                        mov     cx, 1+2+4+32 + 16
                        mov     esi, [esp+4]+4
                        mov     edx, [esp+8]+4
                        call    r0_fileio

                        jnc     short $+4
                        xor     eax, eax

                        pop     esi
                        retn    8

; ---------------------------------------------------------------------------

findnext:               call    is_ring0
                        je      findnext_r0

findnext_r3:            push    dword ptr [esp+8]
                        push    dword ptr [esp+4] +4
                        callW   FindNextFileA
                        retn    8

findnext_r0:            push    ebx

                        mov     eax, R0_FINDNEXTFILE
                        mov     ebx, [esp+4]+4
                        mov     edx, [esp+8]+4
                        call    r0_fileio

                        jnc     short $+4
                        xor     eax, eax

                        pop     ebx
                        retn    8

; ---------------------------------------------------------------------------

findclose:              call    is_ring0
                        je      findclose_r0

findclose_r3:           push    dword ptr [esp+4]
                        callW   FindClose
                        retn    4

findclose_r0:           push    ebx
                        mov     eax, R0_FINDCLOSEFILE
                        mov     ebx, [esp+4]+4
                        call    r0_fileio
                        pop     ebx
                        retn    4

; ---------------------------------------------------------------------------

fgettimev:              mov     need_settime, 0
                        call    is_ring0
                        je      __exit
                        mov     need_settime, 1

                        push    offset filetime
                        push    offset 0
                        push    offset 0
                        push    dword ptr [esp+4]+12
                        callW   GetFileTime

__exit:                 retn    4

fsettimev:              call    is_ring0
                        je      __exit
                        cmp     need_settime, 0
                        je      __exit

                        add     dword ptr filetime+0, 01312D00h ; +2 sec
                        adc     dword ptr filetime+4, 0

                        push    offset filetime
                        push    offset 0
                        push    offset 0
                        push    dword ptr [esp+4]+12
                        callW   SetFileTime

__exit:                 retn    4

; ---------------------------------------------------------------------------

                        end
