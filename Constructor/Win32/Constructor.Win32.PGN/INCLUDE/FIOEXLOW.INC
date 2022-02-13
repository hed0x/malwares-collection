
fzeroerror:             pusha
                        push    0
                        callW   SetLastError
                        popa
                        retn

fcheckerror:            callW   GetLastError
                        or      eax, eax
                        jz      maplib1  ; CF=0
                        mov     [esp+4].popa_eax, eax
                        stc
maplib1:                retn

fcreate:                pusha
                        call    fzeroerror
                        push    0
                        push    FILE_ATTRIBUTE_NORMAL
                        push    CREATE_ALWAYS
                        jmp     maplib9

fopen_ro:               pusha
                        call    fzeroerror
                        push    0
                        push    FILE_ATTRIBUTE_NORMAL
                        push    OPEN_EXISTING
                        push    0
                        push    FILE_SHARE_READ + FILE_SHARE_WRITE
                        push    GENERIC_READ
                        jmp     maplib10

fopen_rw:               pusha
                        call    fzeroerror
                        push    0
                        push    FILE_ATTRIBUTE_NORMAL
                        push    OPEN_EXISTING
maplib9:                push    0
                        push    FILE_SHARE_READ + FILE_SHARE_WRITE
                        push    GENERIC_READ + GENERIC_WRITE
maplib10:               push    edx
                        callW   CreateFileA
                        cmp     eax, -1
                        je      maplib3
                        clc
                        mov     [esp].popa_eax, eax
                        popa
exit_r3io:              retn

fclose:                 pusha
                        call    fzeroerror
                        push    ebx
                        callW   CloseHandle
maplib3:                call    fcheckerror
                        popa
                        jmp     exit_r3io

fseekend:               pusha
                        call    fzeroerror
                        push    FILE_END
                        xor     edx, edx
                        jmp     maplib6

fseek:                  pusha
                        call    fzeroerror
                        push    FILE_BEGIN
maplib6:                push    0
                        push    edx
                        push    ebx
                        callW   SetFilePointer
maplib2:                mov     [esp].popa_eax, eax
                        jmp     maplib3

fread:                  pusha
                        call    maplib7
                        callW   ReadFile
                        jmp     maplib3

fwrite:                 pusha
                        call    maplib7
                        callW   WriteFile
                        jmp     maplib3

maplib7:                pop     esi
                        call    fzeroerror
                        push    0
                        lea     eax, [esp+4].popa_eax
                        push    eax               ; byteswritten
                        push    ecx
                        push    edx
                        push    ebx
                        jmp     esi

fsetattr:               pusha
                        call    fzeroerror
                        push    ecx
                        push    edx
                        callW   SetFileAttributesA
                        jmp     maplib3

fgetattr:               pusha
                        call    fzeroerror
                        push    edx
                        callW   GetFileAttributesA
                        mov     [esp].popa_ecx, eax     ; popa.ecx
                        jmp     maplib3

fgetsize:               pusha
                        call    fzeroerror
                        push    0
                        push    ebx
                        callW   GetFileSize
                        jmp     maplib2
