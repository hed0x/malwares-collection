
; advanced FileIO library  4.xx  (c) 1998, 1999 Z0MBiE

; fopen   (EDX=fname)  : CF=1/EAX=error  CF=0/EAX=handle
; fclose  (EBX=handle) : CF=1/EAX=error  CF=0
; fgetsize(EBX=handle) : CF=1/EAX=error  CF=0/EAX=filesize
; fseek   (EBX=handle,
;          EDX=newpos) : CF=1/EAX=error  CF=0/EAX=new pos
; ftrunc  (EBX=handle) : CF=1/EAX=error  CF=0
; fsetattr(EDX=fname,
;          ECX=fattr)  : CF=1/EAX=error  CF=0
; fcreate (EDX=fname)  : CF=1/EAX=error  CF=0/EAX=handle
; fread   (EBX=handle,
;          EDX=buffer,
;          ECX=size)   : CF=1/EAX=error  CF=0/EAX=bytesread
; fwrite (EBX,EDX,ECX) : CF=1/EAX=error  CF=0/EAX=byteswritten

callW                   macro   procname
                        extrn   procname:PROC
                        call    procname
                        endm

pushad_eax              equ     (dword ptr 7*4)

FILE_BEGIN              equ     0
OPEN_EXISTING           equ     3
CREATE_ALWAYS           equ     2
GENERIC_READ            equ     080000000h
GENERIC_WRITE           equ     040000000h
FILE_SHARE_READ         equ     000000001h
FILE_SHARE_WRITE        equ     000000002h
FILE_ATTRIBUTE_NORMAL   equ     000000080h

fcheckerror:            callW   GetLastError
                        or      eax, eax     ; make CF=0
                        jz      fcheckerror_@@1
                        mov     [esp].pushad_eax+4, eax
                        stc
fcheckerror_@@1:        ret

fopen:                  pusha
                        ;;
                        push    0
                        push    FILE_ATTRIBUTE_NORMAL
                        push    OPEN_EXISTING
                        push    0
                        push    FILE_SHARE_READ
                        push    GENERIC_READ + GENERIC_WRITE
                        push    edx
                        callW   CreateFileA
                        ;;
                        mov     [esp].pushad_eax, eax
                        call    fcheckerror
                        popa
                        ret

fcreate:                pusha
                        ;;
                        push    0
                        push    FILE_ATTRIBUTE_NORMAL
                        push    CREATE_ALWAYS
                        push    0
                        push    FILE_SHARE_READ
                        push    GENERIC_READ + GENERIC_WRITE
                        push    edx
                        callW   CreateFileA
                        ;;
                        mov     [esp].pushad_eax, eax
                        or      eax, eax
                        clc
                        jnz     fcreate_@@1
                        call    fcheckerror
fcreate_@@1:            popa
                        ret

fclose:                 pusha
                        ;;
                        push    ebx
                        callW   CloseHandle
                        ;;
                        call    fcheckerror
                        popa
                        ret

fgetsize:               pusha
                        ;;
                        push    0
                        push    ebx
                        callW   GetFileSize
                        ;;
                        mov     [esp].pushad_eax, eax
                        call    fcheckerror
                        popa
                        ret

fseek:                  pusha
                        ;;
                        push    FILE_BEGIN
                        push    0
                        push    edx
                        push    ebx
                        callW   SetFilePointer
                        ;;
                        mov     [esp].pushad_eax, eax
                        call    fcheckerror
                        popa
                        ret

ftrunc:                 pusha
                        ;;
                        push    ebx
                        callW   SetEndOfFile
                        ;;
                        call    fcheckerror
                        popa
                        ret

fsetattr:               pusha
                        ;;
                        push    ecx
                        push    edx
                        callW   SetFileAttributesA
                        ;;
                        call    fcheckerror
                        popa
                        ret

fread:                  pusha
                        ;;
                        push    0
                        lea     eax, [esp].pushad_eax + 4
                        push    eax               ; bytesread
                        push    ecx
                        push    edx
                        push    ebx
                        callW   ReadFile
                        ;;
                        call    fcheckerror
                        popa
                        ret

fwrite:                 pusha
                        ;;
                        push    0
                        lea     eax, [esp].pushad_eax + 4
                        push    eax               ; byteswritten
                        push    ecx
                        push    edx
                        push    ebx
                        callW   WriteFile
                        ;;
                        call    fcheckerror
                        popa
                        ret

