
include                 UTIL.INC
include                 ..\..\INCLUDE\consts.inc

                        public  createkey
                        public  createkeyV
                        public  openkey
                        public  openkeyV
                        public  queryvalueex
                        public  setvalueex
                        public  closekey
                        public  is_key

                        public  gettime
                        public  getwindir
                        public  uniquefname

                        p386
                        model   flat
                        locals  __
                        jumps

                        .data

reg_key                 db      'Software\Microsoft\Windows\CurrentVersion\'
uniq1                   db      8 dup ('?')
                        db      0

temp_hKey               dd      ?

fname                   db      260 dup (?)

                        .code

is_ring0:               push    eax
                        mov     eax, cs
                        cmp     eax, 28h
                        pop     eax
                        retn

gettime:                call    is_ring0
                        je      __r0
__r3:                   callW   GetTickCount
                        retn
__r0:                   VMMcall Get_System_Time
                        retn

openkey:                push    dword ptr [esp+12]
                        push    dword ptr [esp+8]+4
                        push    dword ptr [esp+4]+8
                        call    is_ring0
                        je      __r0
__r3:                   callW   RegOpenKeyA
                        jmp     __exit
__r0:                   VMMcall _RegOpenKey
__exit:                 retn    3*4

createkey:              push    dword ptr [esp+12]
                        push    dword ptr [esp+8]+4
                        push    dword ptr [esp+4]+8
                        call    is_ring0
                        je      __r0
__r3:                   callW   RegCreateKeyA
                        jmp     __exit
__r0:                   VMMcall _RegCreateKey
__exit:                 retn    3*4

queryvalueex:           push    dword ptr [esp+24]
                        push    dword ptr [esp+20]+4
                        push    dword ptr [esp+16]+8
                        push    dword ptr [esp+12]+12
                        push    dword ptr [esp+8]+16
                        push    dword ptr [esp+4]+20
                        call    is_ring0
                        je      __r0
__r3:                   callW   RegQueryValueExA
                        jmp     __exit
__r0:                   VMMcall _RegQueryValueEx
__exit:                 retn    6*4

setvalueex:             push    dword ptr [esp+24]
                        push    dword ptr [esp+20]+4
                        push    dword ptr [esp+16]+8
                        push    dword ptr [esp+12]+12
                        push    dword ptr [esp+8]+16
                        push    dword ptr [esp+4]+20
                        call    is_ring0
                        je      __r0
__r3:                   callW   RegSetValueExA
                        jmp     __exit
__r0:                   VMMcall _RegSetValueEx
__exit:                 retn    6*4

closekey:               push    dword ptr [esp+4]
                        call    is_ring0
                        je      __r0
__r3:                   callW   RegCloseKey
                        jmp     __exit
__r0:                   VMMcall _RegCloseKey
__exit:                 retn    4


; input:  pointer to memory buffer (260 bytes)
; output: buffer filled with %windir%, EAX points to ending 0

getwindir:              pusha

                        mov     edi, [esp+32+4]
                        cld

                        call    is_ring0
                        jz      __ring0

__ring3:                push    260
                        push    edi
                        callW   GetWindowsDirectoryA
                        add     edi, eax
                        jmp     __slash

__ring0:                VMMcall Get_Config_Directory

                        mov     esi, edx
__1:                    lodsb
                        stosb
                        or      al, al
                        jnz     __1
                        dec     edi

__slash:                cmp     byte ptr [edi-1], '\'
                        jne     __skipslash
                        dec     edi
__skipslash:
                        mov     [esp].popa_eax, edi

                        xor     eax, eax
                        stosb

                        popa
                        retn    4

sub1:                   push    dword ptr [esp+4]+4     ; unique id
                        push    size uniq1
                        push    offset uniq1
                        callW   uniquestr
                        add     esp, 3*4

                        pop     eax

                        push    dword ptr [esp+8]     ; offset hKey
                        push    offset reg_key
                        push    HKEY_LOCAL_MACHINE

                        jmp     eax

createkeyV:             call    sub1
                        call    createkey
                        retn    8

openkeyV:               call    sub1
                        call    openkey
                        retn    8

is_key:                 push    offset temp_hKey
                        push    dword ptr [esp+8]+4
                        push    dword ptr [esp+4]+8
                        call    openkey
                        or      eax, eax
                        je      __succ

                        xor     eax, eax
                        retn    8

__succ:                 push    temp_hKey
                        call    closekey

                        mov     eax, 1
                        retn    8

uniquefname:            pusha

                        push    dword ptr [esp+32]+4    ; fnameptr
                        call    getwindir
                        xchg    edi, eax

                        mov     al, '\'
                        stosb

                        push    dword ptr [esp+32]+8    ; uniqueID
                        push    8
                        push    edi
                        callW   uniquestr
                        add     esp, 3*4

                        mov     byte ptr [eax], 0

                        popa
                        retn    8

                        end
