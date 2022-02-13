
_uniquestr:
uniquestr:              pusha
                        cld

                        call    uniqueid
                        xchg    ebp, eax
                        xor     ebp, [esp+32+12] ; id

                        mov     edi, [esp+32+4] ; buf
                        mov     ecx, [esp+32+8] ; size

__re:                   imul    ebp, 214013
                        add     ebp, 2531011

                        mov     eax, ebp
                        shr     eax, 15

                        cmp     al, 'a'
                        jb      __re
                        cmp     al, 'z'
                        ja      __re

                        stosb
                        loop    __re

                        mov     [esp].popa_eax, edi

                        popa
                        retn

uniqueid:               pusha

                        sub     esp, 260
                        mov     edi, esp

                        sub     esp, size ff_struc+2  ; 2==make DWORD-align
                        mov     esi, esp

                        mov     eax, cs
                        cmp     eax, 28h
                        jne     __r3
__r0:
                        int 3

                        pusha

                        VMMcall Get_Config_Directory
                        mov     esi, edx
__cpy:                  lodsb
                        stosb
                        or      al, al
                        jnz     __cpy
                        dec     edi
                        dec     edi     ; \
                        stosb           ; al=0

                        popa
                        pusha

                        mov     eax, R0_FINDFIRSTFILE
                        mov     cx, 1+2+4+32 + 16
                        mov     edx, esi
                        mov     esi, edi
                        VxDcall IFSMGR, Ring0_FileIO
                        xchg    ebx, eax

                        mov     eax, R0_FINDCLOSEFILE
                        VxDcall IFSMGR, Ring0_FileIO

                        popa

                        jmp     __ok
__r3:
                        push    260
                        push    edi
                        callX   GetWindowsDirectoryA

                        push    esi
                        push    edi
                        callX   FindFirstFileA
                        push    eax
                        callX   FindClose
__ok:
                        mov     eax, [esi].ff_time_create.dword ptr 0
                        xor     eax, [esi].ff_time_create.dword ptr 4
                        jnz     __succ

                        mov     eax, [esi].ff_time_lastwrite.dword ptr 0
                        xor     eax, [esi].ff_time_lastwrite.dword ptr 4
__succ:
                        add     esp, size ff_struc+2 + 260

                        mov     [esp].popa_eax, eax
                        popa
                        retn
