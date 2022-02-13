
C_MULTIKEYSIZE          equ     1024    ; max length of key\key\key string
C_SINGLEKEYSIZE         equ     256     ; max length of single key
C_VALUENAMESIZE         equ     256     ; max length of value name
C_VALUESIZE             equ     512     ; max length of value

include                 REGSCAN.INC
include                 ..\..\INCLUDE\consts.inc
include                 ..\..\INCLUDE\s2c.inc
include                 ..\FILEIO\fileio.inc
include                 ..\MAIN\main.inc
include                 ..\PLAN\plan.inc

                        extern  Event:PROC

                        public  HandleEvent

                        p386
                        model   flat
                        locals  __
                        jumps

                        .data

regscan_complete        db      0

                        .code

HandleEvent:            cmp     dword ptr [esp+4], EV_MAIN_IDLE
                        je      __do_regscan

__return_0:             xor     eax, eax
                        retn

__do_regscan:           cmp     regscan_complete, 0
                        jne     __return_0
                        inc     regscan_complete

                        pusha
                        cld
                        sub     esp, C_MULTIKEYSIZE

                        mov     ebx, 80000000h
                        mov     edi, esp
                        mov     word ptr [edi], '0'
__cycle:                call    scankey
                        inc     byte ptr [edi]
                        inc     ebx
                        cmp     bl, 6
                        jbe     __cycle

                        add     esp, C_MULTIKEYSIZE
                        popa

                        mov     eax, 1  ; handled
                        retn

; input: EBX=hKey
;        EDI=keyname

scankey:                pusha

                        xor     eax, eax
                        dec     eax
                        dec     edi
__scan0:                inc     edi
                        inc     eax
                        cmp     byte ptr [edi], 0
                        jne     __scan0
                        cmp     eax, C_MULTIKEYSIZE-C_SINGLEKEYSIZE-1
                        jae     __quit
                        mov     al, '\'
                        stosb

                        xor     esi, esi        ; subkey index

__cycle:                push    C_SINGLEKEYSIZE ; cbName
                        push    edi             ; lpName
                        push    esi             ; dwIndex
                        push    ebx             ; hKey
                        callW   RegEnumKeyA
                        or      eax, eax
                        jnz     __exit

;                       mov     edx, [esp].pusha_edi
;                       call    dump_asciiz_edx
;                       call    dump_crlf

                        push    eax
                        push    esp             ; phkResult
                        push    edi             ; lpSubKey
                        push    ebx             ; hKey
                        callW   RegOpenKeyA
                        or      eax, eax
                        pop     eax             ; EAX<--hKey
                        jnz     __skip

                        xchg    edi, [esp].pusha_edi
                        xchg    ebx, eax
                        call    scanvalue       ; scan current key's values
                        call    scankey         ; recursivly scan subkeys
                        xchg    ebx, eax
                        xchg    edi, [esp].pusha_edi

                        push    eax             ; hKey
                        callW   RegCloseKey

__skip:                 inc     esi             ; subkey index
                        jmp     __cycle

__exit:                 mov     byte ptr [edi-1], 0

__quit:                 popa
                        retn

; input: EBX=hKey
;        EDI=keyname

scanvalue:              pusha
                        sub     esp, C_VALUENAMESIZE
                        mov     edi, esp        ; EDI = ValueName
                        sub     esp, C_VALUESIZE

                        xor     esi, esi        ; value index

__cycle:                push    C_VALUESIZE     ; Value length
                        mov     ecx, esp
                        push    C_VALUENAMESIZE ; ValueName length
                        mov     edx, esp
                        push    0               ; Type
                        mov     eax, esp

                        push    ecx             ; lpcbData
                        lea     ecx, [esp+16]
                        push    ecx             ; lpData
                        push    eax             ; lpType
                        push    0               ; lpReserved
                        push    edx             ; lpcbValueName
                        push    edi             ; lpValueName
                        push    esi             ; dwIndex
                        push    ebx             ; hKey
                        callW   RegEnumValueA
                        or      eax, eax
                        pop     eax             ; Type
                        pop     edx             ; ValueName length
                        pop     ecx             ; Value length
                        jnz     __exit

                        cmp     eax, REG_SZ     ; Type
                        jne     __skip
;                       or      edx, edx        ; ValueName length
;                       jz      __skip
                        or      ecx, ecx        ; Value length
                        jz      __skip

                        mov     edx, [esp+C_VALUENAMESIZE+C_VALUESIZE].pusha_edi
                        mov     ecx, esp
                        call    checkfname

__skip:                 inc     esi             ; value index
                        jmp     __cycle

__exit:                 add     esp, C_VALUENAMESIZE+C_VALUESIZE
                        popa
                        retn

; input: EBX=hKey
;        EDX=keyname
;        EDI=valuename (may be zero-length)
;        ECX=value     (may be zero-length)

checkfname:             pusha

                        cmp     word ptr [ecx+1], '\:'
                        jne     __exit

                        mov     eax, ecx
                        dec     eax
__scan0:                inc     eax
                        cmp     byte ptr [eax], 0
                        jne     __scan0
                        cmp     byte ptr [eax-4], '.' ; EXT length = 3-byte ?
                        jne     __exit

                        push    ecx
                        push    EV_REGSCAN_GOT_FILENAME
                        call    Event
                        add     esp, 8

__exit:                 popa
                        retn

                        end
