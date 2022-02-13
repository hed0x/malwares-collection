
include                 ..\..\INCLUDE\consts.inc

                        p386
                        model   flat
                        locals  __
                        jumps

                        .data

xz                      db      'xz',0
rd                      db      'RefreshDesktop',0

desktopbmp              db      '\desktop.bmp',0

msg0                    db      'þ CLEANER executed',13,10,0

msg1x                   db      'þ registry key removed: '
reg_keyx                db      'Software\Microsoft\Windows\CurrentVersion\'
uni1                    db      8 dup ('?')
                        db      0

msg1y                   db      'þ registry key removed: '
reg_keyy                db      'Software\Microsoft\Windows\CurrentVersion\'
uni2                    db      8 dup ('?')
                        db      0

msg1z                   db      'þ registry key removed: '
reg_keyz                db      'Software\Microsoft\Windows\CurrentVersion\'
uni3                    db      8 dup ('?')
                        db      0

msg1A                   db      'þ registry key removed: '
reg_keyA                db      'Software\Microsoft\Windows\CurrentVersion\'
uniA                    db      8 dup ('?')
                        db      0

msg1B                   db      'þ registry key removed: '
reg_keyB                db      'Software\Microsoft\Windows\CurrentVersion\'
uniB                    db      8 dup ('?')
                        db      0



msg2                    db      'þ global atom removed: '
global_atom             db      8 dup ('?'),0

msg3                    db      'þ warning: EXPLORER_MUTEX is active: '
explorer_mutex          db      8 dup ('?'),0

container               db      '\'
pluginswp               db      8 dup ('?')
                        db      0
signatures              db      '\'
mistfallsig             db      8 dup ('?')
                        db      0

msg4                    db      'þ external container removed: '
filename1               db      260 dup (?)

msg5                    db      'þ signature base removed: '
filename2               db      260 dup (?)

                        .code
start:
                        lea     edx, msg0
                        call    dump_asciiz_edx

                        call    init

                        push    offset reg_keyx
                        push    HKEY_LOCAL_MACHINE
                        callW   RegDeleteKeyA
                        or      eax, eax
                        jnz     __skip1x
                        lea     edx, msg1x
                        call    dump_asciiz_edx
                        call    dump_crlf
__skip1x:
                        ;;

                        push    offset reg_keyy
                        push    HKEY_LOCAL_MACHINE
                        callW   RegDeleteKeyA
                        or      eax, eax
                        jnz     __skip1y
                        lea     edx, msg1y
                        call    dump_asciiz_edx
                        call    dump_crlf
__skip1y:
                        ;;

                        push    offset reg_keyz
                        push    HKEY_LOCAL_MACHINE
                        callW   RegDeleteKeyA
                        or      eax, eax
                        jnz     __skip1z
                        lea     edx, msg1z
                        call    dump_asciiz_edx
                        call    dump_crlf
__skip1z:

                        push    offset reg_keyA
                        push    HKEY_LOCAL_MACHINE
                        callW   RegDeleteKeyA
                        or      eax, eax
                        jnz     __skip1A
                        lea     edx, msg1A
                        call    dump_asciiz_edx
                        call    dump_crlf
__skip1A:

                        push    offset reg_keyB
                        push    HKEY_LOCAL_MACHINE
                        callW   RegDeleteKeyA
                        or      eax, eax
                        jnz     __skip1B
                        lea     edx, msg1B
                        call    dump_asciiz_edx
                        call    dump_crlf
__skip1B:



                        push    offset explorer_mutex
                        push    0
                        push    0
                        callW   OpenMutexA
                        or      eax, eax
                        jz      __skip3

                        push    eax
                        callW   CloseHandle

                        lea     edx, msg3
                        call    dump_asciiz_edx
                        call    dump_crlf

__skip3:
                        ;;

                        push    260
                        push    offset filename1
                        callW   GetWindowsDirectoryA

                        push    offset container
                        push    offset filename1
                        callW   lstrcat

                        push    offset filename1
                        callW   DeleteFileA

                        or      eax, eax
                        jz     __skip4

                        lea     edx, msg4
                        call    dump_asciiz_edx
                        call    dump_crlf
__skip4:


                        push    260
                        push    offset filename2
                        callW   GetWindowsDirectoryA

                        push    offset signatures
                        push    offset filename2
                        callW   lstrcat

                        push    offset filename2
                        callW   DeleteFileA

                        or      eax, eax
                        jz     __skip5

                        lea     edx, msg5
                        call    dump_asciiz_edx
                        call    dump_crlf
__skip5:

                        push    1               ; SPIF_SENDCHANGE
                        push    offset xz       ; param
                        push    0               ; param
                        push    20              ; action=SPI_SETDESKWALLPAPER
                        callW   SystemParametersInfoA

                        push    offset rd
                        push    14h
                        push    1Ah
                        push    0FFFFh ;HWND_BROADCAST
                        callW   SendMessageA

                        push    260
                        push    offset filename1
                        callW   GetWindowsDirectoryA

                        push    offset desktopbmp
                        push    offset filename1
                        callW   lstrcat

                        push    offset filename1
                        callW   DeleteFileA

                        ;;

                        push    offset global_atom
                        callW   GlobalFindAtomA
                        movzx   eax, ax         ; !!!
                        or      eax, eax
                        jz      __skip2
                        xchg    ebx, eax

                        lea     edx, msg2
                        call    dump_asciiz_edx
                        call    dump_crlf

                        mov     esi,1000        ; for fucken winNT

__retry:                push    ebx
                        callW   GlobalDeleteAtom
                        movzx   eax, ax          ;!!!

                        dec     esi
                        jz      __skip2
                        or      eax, eax
                        jz      __retry
__skip2:
                        ;;

                        push    -1
                        callW   ExitProcess

include                 ..\..\INCLUDE\console.inc

init:
                        push    0A85CF86Dh      ; crc32('ldrwin32')
                        push    8
                        push    offset pluginswp
                        call    uniquestr
                        add     esp, 3*4

                        push    98444A80h       ; crc32('sigman')
                        push    8
                        push    offset mistfallsig
                        call    uniquestr
                        add     esp, 3*4

                        push    0DD5A5B7Dh      ; crc32('plan')
                        push    size uni1
                        push    offset uni1
                        call    uniquestr
                        add     esp, 3*4

                        push    0D16FBE0Bh      ; crc32('killer')
                        push    size uni2
                        push    offset uni2
                        call    uniquestr
                        add     esp, 3*4

                        push    026971DBAh      ; crc32('dpgn1')
                        push    size uni3
                        push    offset uni3
                        call    uniquestr
                        add     esp, 3*4

                        push    0DD5A5B7Dh+1    ; crc32('plan')
                        push    8
                        push    offset global_atom
                        call    uniquestr
                        add     esp, 3*4

                        push    0DD5A5B7Dh+2    ; crc32('plan')
                        push    8
                        push    offset explorer_mutex
                        call    uniquestr
                        add     esp, 3*4

                        push    44248DBEh       ; crc32('install3')
                        push    8
                        push    offset uniA
                        call    uniquestr
                        add     esp, 3*4

                        push    44248DBEh+1      ; crc32('install3')
                        push    8
                        push    offset uniB
                        call    uniquestr
                        add     esp, 3*4

                        retn

callX                   equ     callW
include                 ..\..\PLUGIN\LDRWIN32\unique.inc

                        end     start
