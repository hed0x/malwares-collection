
; ---------------------------------------------------------------------------

; fopen   (EDX=fname)  : CF=1  EAX=error  CF=0 EAX=handle
; fcreate (EDX=fname)  : CF=1  EAX=error  CF=0 EAX=handle
; fclose  (EBX=handle) : CF=1  EAX=error  CF=0
; fseek   (EBX=handle,
;          EDX=newpos) : CF=1  EAX=error  CF=0 EAX=new pos
; ftrunc  (EBX=handle) : CF=1  EAX=error  CF=0
; fsetattr(EDX=fname,
;          ECX=fattr)  : CF=1  EAX=error  CF=0

; ---------------------------------------------------------------------------

fcheckerror:            call    get_base_ebp
                        call    GetLastError[ebp]
                        or      eax, eax
                        jz      __1  ; CF=0
                        mov     [esp].pushad_eax+4, eax
                        stc
__1:                    ret

; ---------------------------------------------------------------------------

fopen:                  pusha
                        ;;
                        push    0
                        push    FILE_ATTRIBUTE_NORMAL
                        push    OPEN_EXISTING
                        push    0
                        push    FILE_SHARE_READ
                        push    GENERIC_READ + GENERIC_WRITE
                        push    edx
                        call    get_base_ebp
                        call    CreateFileA[ebp]
                        ;;
                        mov     [esp].pushad_eax, eax
                        call    fcheckerror
                        popa
                        ret

; ---------------------------------------------------------------------------

fcreate:                pusha
                        ;;
                        push    0
                        push    FILE_ATTRIBUTE_NORMAL
                        push    CREATE_ALWAYS
                        push    0
                        push    FILE_SHARE_READ
                        push    GENERIC_READ + GENERIC_WRITE
                        push    edx
                        call    get_base_ebp
                        call    CreateFileA[ebp]
                        ;;
                        mov     [esp].pushad_eax, eax
                        or      eax, eax
                        clc
                        jnz     __1
                        call    fcheckerror
__1:                    popa
                        ret

; ---------------------------------------------------------------------------

fclose:                 pusha
                        ;;
                        push    ebx
                        call    get_base_ebp
                        call    CloseHandle[ebp]
                        ;;
                        call    fcheckerror
                        popa
                        ret

fseek:                  pusha
                        ;;
                        push    FILE_BEGIN
                        push    0
                        push    edx
                        push    ebx
                        call    get_base_ebp
                        call    SetFilePointer[ebp]
                        ;;
                        mov     [esp].pushad_eax, eax
                        call    fcheckerror
                        popa
                        ret

; ---------------------------------------------------------------------------

ftrunc:                 pusha
                        ;;
                        push    ebx
                        call    get_base_ebp
                        call    SetEndOfFile[ebp]
                        ;;
                        call    fcheckerror
                        popa
                        ret

; ---------------------------------------------------------------------------

fsetattr:               pusha
                        ;;
                        push    ecx
                        push    edx
                        call    get_base_ebp
                        call    SetFileAttributesA[ebp]
                        ;;
                        call    fcheckerror
                        popa
                        ret

; ---------------------------------------------------------------------------
