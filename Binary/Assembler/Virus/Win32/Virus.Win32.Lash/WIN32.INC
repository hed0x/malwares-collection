; win32.inc
; Androgyne's include file

UNICODE=0

; _________
;   EQUs
; ¯¯¯¯¯¯¯¯¯

; General EQUs

NULL                                equ 0
FALSE                               equ 0
TRUE                                equ 1
MAX_PATH                            equ 260
INVALID_HANDLE_VALUE                equ -1
STANDARD_RIGHTS_REQUIRED            equ 000F0000h

; MessageBoxA EQUs

MB_OK                               equ 00000000h
MB_OKCANCEL                         equ 00000001h
MB_ABORTRETRYIGNORE                 equ 00000002h
MB_YESNOCANCEL                      equ 00000003h
MB_YESNO                            equ 00000004h
MB_RETRYCANCEL                      equ 00000005h
MB_ICONHAND                         equ 00000010h
MB_ICONSTOP                         equ MB_ICONHAND
MB_ICONQUESTION                     equ 00000020h
MB_ICONEXCLAMATION                  equ 00000030h
MB_ICONASTERISK                     equ 00000040h
MB_ICONINFORMATION                  equ MB_ICONASTERISK
MB_DEFBUTTON1                       equ 00000000h
MB_DEFBUTTON2                       equ 00000100h
MB_DEFBUTTON3                       equ 00000200h
MB_APPLMODAL                        equ 00000000h
MB_SYSTEMMODAL                      equ 00001000h
MB_TASKMODAL                        equ 00002000h
MB_NOFOCUS                          equ 00008000h
MB_SETFOREGROUND                    equ 00010000h
MB_DEFAULT_DESKTOP_ONLY             equ 00020000h


IDOK                                equ 00000001h
IDCANCEL                            equ 00000002h
IDABORT                             equ 00000003h
IDRETRY                             equ 00000004h
IDIGNORE                            equ 00000005h
IDYES                               equ 00000006h
IDNO                                equ 00000007h

; ShowWindow EQUs

SW_HIDE                             equ 0
SW_SHOWNORMAL                       equ 1
SW_SHOWMINIMIZED                    equ 2
SW_SHOWMAXIMIZED                    equ 3
SW_SHOWNOACTIVATE                   equ 4
SW_SHOW                             equ 5
SW_MINIMIZE                         equ 6
SW_SHOWMINNOACTIVE                  equ 7
SW_SHOWNA                           equ 8
SW_RESTORE                          equ 9
SW_SHOWDEFAULT                      equ 10

; File Attributes EQUs

FILE_ATTRIBUTE_READONLY             equ 00000001h
FILE_ATTRIBUTE_HIDDEN               equ 00000002h
FILE_ATTRIBUTE_SYSTEM               equ 00000004h
FILE_ATTRIBUTE_DIRECTORY            equ 00000010h
FILE_ATTRIBUTE_ARCHIVE              equ 00000020h
FILE_ATTRIBUTE_NORMAL               equ 00000080h
FILE_ATTRIBUTE_TEMPORARY            equ 00000100h
FILE_ATTRIBUTE_ATOMIC_WRITE         equ 00000200h
FILE_ATTRIBUTE_XACTION_WRITE        equ 00000400h
FILE_ATTRIBUTE_COMPRESSED           equ 00000800h
FILE_ATTRIBUTE_HAS_EMBEDDING        equ 00001000h

; File Flags EQUs

FILE_FLAG_POSIX_SEMANTICS           equ 01000000h
FILE_FLAG_BACKUP_SEMANTICS          equ 02000000h
FILE_FLAG_DELETE_ON_CLOSE           equ 04000000h
FILE_FLAG_SEQUENTIAL_SCAN           equ 08000000h
FILE_FLAG_RANDOM_ACCESS             equ 10000000h
FILE_FLAG_NO_BUFFERING              equ 20000000h
FILE_FLAG_OVERLAPPED                equ 40000000h
FILE_FLAG_WRITE_THROUGH             equ 80000000h

; Access EQUs

GENERIC_READ                        equ 80000000h
GENERIC_WRITE                       equ 40000000h

; Share EQUs

FILE_SHARE_READ                     equ 00000001h
FILE_SHARE_WRITE                    equ 00000002h

; Create EQUs

CREATE_NEW                          equ 1
CREATE_ALWAYS                       equ 2
OPEN_EXISTING                       equ 3
OPEN_ALWAYS                         equ 4
TRUNCATE_EXISTING                   equ 5

; Mapping EQUs

SECTION_QUERY                       equ  00000001h
SECTION_MAP_WRITE                   equ  00000002h
SECTION_MAP_READ                    equ  00000004h
SECTION_MAP_EXECUTE                 equ  00000008h
SECTION_EXTEND_SIZE                 equ  00000010h
SECTION_ALL_ACCESS                  equ  STANDARD_RIGHTS_REQUIRED or \
                                         SECTION_QUERY or \
                                         SECTION_MAP_WRITE or \
                                         SECTION_MAP_READ or \
                                         SECTION_MAP_EXECUTE or \
                                         SECTION_EXTEND_SIZE

FILE_MAP_COPY                       equ  SECTION_QUERY
FILE_MAP_WRITE                      equ  SECTION_MAP_WRITE
FILE_MAP_READ                       equ  SECTION_MAP_READ
FILE_MAP_ALL_ACCESS                 equ  SECTION_ALL_ACCESS

PAGE_NOACCESS                       equ 00000001h
PAGE_READONLY                       equ 00000002h
PAGE_READWRITE                      equ 00000004h
PAGE_WRITECOPY                      equ 00000008h
PAGE_EXECUTE                        equ 00000010h
PAGE_EXECUTE_READ                   equ 00000020h
PAGE_EXECUTE_READWRITE              equ 00000040h
PAGE_EXECUTE_WRITECOPY              equ 00000080h
PAGE_GUARD                          equ 00000100h
PAGE_NOCACHE                        equ 00000200h

MEM_COMMIT                          equ 00001000h
MEM_RESERVE                         equ 00002000h
MEM_DECOMMIT                        equ 00004000h
MEM_RELEASE                         equ 00008000h
MEM_FREE                            equ 00010000h
MEM_PRIVATE                         equ 00020000h
MEM_MAPPED                          equ 00040000h
MEM_TOP_DOWN                        equ 00100000h

SEC_FILE                            equ 00800000h
SEC_IMAGE                           equ 01000000h
SEC_RESERVE                         equ 04000000h
SEC_COMMIT                          equ 08000000h
SEC_NOCACHE                         equ 10000000h
MEM_IMAGE                           equ SEC_IMAGE

; Code Page EQUs

CP_ACP                              equ 0           ; ANSI code page
CP_OEMCP                            equ 1           ; OEM  code page
CP_MACCP                            equ 2           ; MAC  code page

; Window Message EQUs

WM_NULL                             equ 0000h
WM_CREATE                           equ 0001h
WM_DESTROY                          equ 0002h
WM_MOVE                             equ 0003h
WM_SIZE                             equ 0005h
WM_ACTIVATE                         equ 0006h
WM_SETFOCUS                         equ 0007h
WM_KILLFOCUS                        equ 0008h
WM_ENABLE                           equ 000Ah
WM_SETREDRAW                        equ 000Bh
WM_SETTEXT                          equ 000Ch
WM_GETTEXT                          equ 000Dh
WM_GETTEXTLENGTH                    equ 000Eh
WM_PAINT                            equ 000Fh
WM_CLOSE                            equ 0010h
WM_QUERYENDSESSION                  equ 0011h
WM_QUIT                             equ 0012h
WM_QUERYOPEN                        equ 0013h
WM_ERASEBKGND                       equ 0014h
WM_SYSCOLORCHANGE                   equ 0015h
WM_ENDSESSION                       equ 0016h
WM_SHOWWINDOW                       equ 0018h
WM_WININICHANGE                     equ 001Ah
WM_SETTINGCHANGE                    equ WM_WININICHANGE
WM_DEVMODECHANGE                    equ 001Bh
WM_ACTIVATEAPP                      equ 001Ch
WM_FONTCHANGE                       equ 001Dh
WM_TIMECHANGE                       equ 001Eh
WM_CANCELMODE                       equ 001Fh
WM_SETCURSOR                        equ 0020h
WM_MOUSEACTIVATE                    equ 0021h
WM_CHILDACTIVATE                    equ 0022h
WM_QUEUESYNC                        equ 0023h
WM_GETMINMAXINFO                    equ 0024h
WM_PAINTICON                        equ 0026h
WM_ICONERASEBKGND                   equ 0027h
WM_NEXTDLGCTL                       equ 0028h
WM_SPOOLERSTATUS                    equ 002Ah
WM_DRAWITEM                         equ 002Bh
WM_MEASUREITEM                      equ 002Ch
WM_DELETEITEM                       equ 002Dh
WM_VKEYTOITEM                       equ 002Eh
WM_CHARTOITEM                       equ 002Fh
WM_SETFONT                          equ 0030h
WM_GETFONT                          equ 0031h
WM_SETHOTKEY                        equ 0032h
WM_GETHOTKEY                        equ 0033h
WM_QUERYDRAGICON                    equ 0037h
WM_COMPAREITEM                      equ 0039h
WM_COMPACTING                       equ 0041h
WM_COMMNOTIFY                       equ 0044h       ;no longer suported
WM_WINDOWPOSCHANGING                equ 0046h
WM_WINDOWPOSCHANGED                 equ 0047h
WM_POWER                            equ 0048h
WM_COPYDATA                         equ 004Ah
WM_CANCELJOURNAL                    equ 004Bh
WM_NOTIFY                           equ 004Eh
WM_INPUTLANGCHANGEREQUEST           equ 0050h
WM_INPUTLANGCHANGE                  equ 0051h
WM_TCARD                            equ 0052h
WM_HELP                             equ 0053h
WM_USERCHANGED                      equ 0054h
WM_NOTIFYFORMAT                     equ 0055h
WM_CONTEXTMENU                      equ 007Bh
WM_STYLECHANGING                    equ 007Ch
WM_STYLECHANGED                     equ 007Dh
WM_DISPLAYCHANGE                    equ 007Eh
WM_GETICON                          equ 007Fh
WM_SETICON                          equ 0080h
WM_NCCREATE                         equ 0081h
WM_NCDESTROY                        equ 0082h
WM_NCCALCSIZE                       equ 0083h
WM_NCHITTEST                        equ 0084h
WM_NCPAINT                          equ 0085h
WM_NCACTIVATE                       equ 0086h
WM_GETDLGCODE                       equ 0087h
WM_NCMOUSEMOVE                      equ 00A0h
WM_NCLBUTTONDOWN                    equ 00A1h
WM_NCLBUTTONUP                      equ 00A2h
WM_NCLBUTTONDBLCLK                  equ 00A3h
WM_NCRBUTTONDOWN                    equ 00A4h
WM_NCRBUTTONUP                      equ 00A5h
WM_NCRBUTTONDBLCLK                  equ 00A6h
WM_NCMBUTTONDOWN                    equ 00A7h
WM_NCMBUTTONUP                      equ 00A8h
WM_NCMBUTTONDBLCLK                  equ 00A9h
WM_KEYFIRST                         equ 0100h
WM_KEYDOWN                          equ 0100h
WM_KEYUP                            equ 0101h
WM_CHAR                             equ 0102h
WM_DEADCHAR                         equ 0103h
WM_SYSKEYDOWN                       equ 0104h
WM_SYSKEYUP                         equ 0105h
WM_SYSCHAR                          equ 0106h
WM_SYSDEADCHAR                      equ 0107h
WM_KEYLAST                          equ 0108h
WM_IME_STARTCOMPOSITION             equ 010Dh
WM_IME_ENDCOMPOSITION               equ 010Eh
WM_IME_COMPOSITION                  equ 010Fh
WM_IME_KEYLAST                      equ 010Fh
WM_INITDIALOG                       equ 0110h
WM_COMMAND                          equ 0111h
WM_SYSCOMMAND                       equ 0112h
WM_TIMER                            equ 0113h
WM_HSCROLL                          equ 0114h
WM_VSCROLL                          equ 0115h
WM_INITMENU                         equ 0116h
WM_INITMENUPOPUP                    equ 0117h
WM_MENUSELECT                       equ 011Fh
WM_MENUCHAR                         equ 0120h
WM_ENTERIDLE                        equ 0121h
WM_CTLCOLORMSGBOX                   equ 0132h
WM_CTLCOLOREDIT                     equ 0133h
WM_CTLCOLORLISTBOX                  equ 0134h
WM_CTLCOLORBTN                      equ 0135h
WM_CTLCOLORDLG                      equ 0136h
WM_CTLCOLORSCROLLBAR                equ 0137h
WM_CTLCOLORSTATIC                   equ 0138h
WM_MOUSEFIRST                       equ 0200h
WM_MOUSEMOVE                        equ 0200h
WM_LBUTTONDOWN                      equ 0201h
WM_LBUTTONUP                        equ 0202h
WM_LBUTTONDBLCLK                    equ 0203h
WM_RBUTTONDOWN                      equ 0204h
WM_RBUTTONUP                        equ 0205h
WM_RBUTTONDBLCLK                    equ 0206h
WM_MBUTTONDOWN                      equ 0207h
WM_MBUTTONUP                        equ 0208h
WM_MBUTTONDBLCLK                    equ 0209h
WM_MOUSELAST                        equ 0209h
WM_PARENTNOTIFY                     equ 0210h
WM_ENTERMENULOOP                    equ 0211h
WM_EXITMENULOOP                     equ 0212h
WM_NEXTMENU                         equ 0213h
WM_SIZING                           equ 0214h
WM_CAPTURECHANGED                   equ 0215h
WM_MOVING                           equ 0216h
WM_POWERBROADCAST                   equ 0218h
WM_DEVICECHANGE                     equ 0219h
WM_MDICREATE                        equ 0220h
WM_MDIDESTROY                       equ 0221h
WM_MDIACTIVATE                      equ 0222h
WM_MDIRESTORE                       equ 0223h
WM_MDINEXT                          equ 0224h
WM_MDIMAXIMIZE                      equ 0225h
WM_MDITILE                          equ 0226h
WM_MDICASCADE                       equ 0227h
WM_MDIICONARRANGE                   equ 0228h
WM_MDIGETACTIVE                     equ 0229h
WM_MDISETMENU                       equ 0230h
WM_ENTERSIZEMOVE                    equ 0231h
WM_EXITSIZEMOVE                     equ 0232h
WM_DROPFILES                        equ 0233h
WM_MDIREFRESHMENU                   equ 0234h
WM_IME_SETCONTEXT                   equ 0281h
WM_IME_NOTIFY                       equ 0282h
WM_IME_CONTROL                      equ 0283h
WM_IME_COMPOSITIONFULL              equ 0284h
WM_IME_SELECT                       equ 0285h
WM_IME_CHAR                         equ 0286h
WM_IME_KEYDOWN                      equ 0290h
WM_IME_KEYUP                        equ 0291h
WM_CUT                              equ 0300h
WM_COPY                             equ 0301h
WM_PASTE                            equ 0302h
WM_CLEAR                            equ 0303h
WM_UNDO                             equ 0304h
WM_RENDERFORMAT                     equ 0305h
WM_RENDERALLFORMATS                 equ 0306h
WM_DESTROYCLIPBOARD                 equ 0307h
WM_DRAWCLIPBOARD                    equ 0308h
WM_PAINTCLIPBOARD                   equ 0309h
WM_VSCROLLCLIPBOARD                 equ 030Ah
WM_SIZECLIPBOARD                    equ 030Bh
WM_ASKCBFORMATNAME                  equ 030Ch
WM_CHANGECBCHAIN                    equ 030Dh
WM_HSCROLLCLIPBOARD                 equ 030Eh
WM_QUERYNEWPALETTE                  equ 030Fh
WM_PALETTEISCHANGING                equ 0310h
WM_PALETTECHANGED                   equ 0311h
WM_HOTKEY                           equ 0312h
WM_PRINT                            equ 0317h
WM_PRINTCLIENT                      equ 0318h
WM_HANDHELDFIRST                    equ 0358h
WM_HANDHELDLAST                     equ 035Fh
WM_AFXFIRST                         equ 0360h
WM_AFXLAST                          equ 037Fh
WM_PENWINFIRST                      equ 0380h
WM_PENWINLAST                       equ 038Fh
WM_DDE_FIRST                        equ 03E0h
WM_DDE_INITIATE                     equ WM_DDE_FIRST
WM_DDE_TERMINATE                    equ WM_DDE_FIRST+1
WM_DDE_ADVISE                       equ WM_DDE_FIRST+2
WM_DDE_UNADVISE                     equ WM_DDE_FIRST+3
WM_DDE_ACK                          equ WM_DDE_FIRST+4
WM_DDE_DATA                         equ WM_DDE_FIRST+5
WM_DDE_REQUEST                      equ WM_DDE_FIRST+6
WM_DDE_POKE                         equ WM_DDE_FIRST+7
WM_DDE_EXECUTE                      equ WM_DDE_FIRST+8
WM_DDE_LAST                         equ 03E8h
WM_USER                             equ 0400h
WM_APP                              equ 8000h


; Button control messages

BM_GETCHECK                         equ 00F0h
BM_SETCHECK                         equ 00F1h
BM_GETSTATE                         equ 00F2h
BM_SETSTATE                         equ 00F3h
BM_SETSTYLE                         equ 00F4h
BM_CLICK                            equ 00F5h
BM_GETIMAGE                         equ 00F6h
BM_SETIMAGE                         equ 00F7h

; Button control notification

BN_CLICKED                          equ 0000h
BN_PAINT                            equ 0001h
BN_HILITE                           equ 0002h
BN_UNHILITE                         equ 0003h
BN_DISABLE                          equ 0004h
BN_DOUBLECLICKED                    equ 0005h
BN_SETFOCUS                         equ 0006h
BN_KILLFOCUS                        equ 0007h
BN_PUSHED                           equ BN_HILITE
BN_UNPUSHED                         equ BN_UNHILITE
BN_DBLCLK                           equ BN_DOUBLECLICKED

; Button control styles

BS_PUSHBUTTON                       equ 0000h
BS_DEFPUSHBUTTON                    equ 0001h
BS_CHECKBOX                         equ 0002h
BS_AUTOCHECKBOX                     equ 0003h
BS_RADIOBUTTON                      equ 0004h
BS_3STATE                           equ 0005h
BS_AUTO3STATE                       equ 0006h
BS_GROUPBOX                         equ 0007h
BS_USERBUTTON                       equ 0008h
BS_AUTORADIOBUTTON                  equ 0009h
BS_OWNERDRAW                        equ 000Bh
BS_LEFTTEXT                         equ 0020h
BS_TEXT                             equ 0000h
BS_ICON                             equ 0040h
BS_BITMAP                           equ 0080h
BS_LEFT                             equ 0100h
BS_RIGHT                            equ 0200h
BS_CENTER                           equ 0300h
BS_TOP                              equ 0400h
BS_BOTTOM                           equ 0800h
BS_VCENTER                          equ 0C00h
BS_PUSHLIKE                         equ 1000h
BS_MULTILINE                        equ 2000h
BS_NOTIFY                           equ 4000h
BS_FLAT                             equ 8000h
BS_RIGHTBUTTON                      equ BS_LEFTTEXT

; Combo box messages

CB_GETEDITSEL                       equ 0140h
CB_LIMITTEXT                        equ 0141h
CB_SETEDITSEL                       equ 0142h
CB_ADDSTRING                        equ 0143h
CB_DELETESTRING                     equ 0144h
CB_DIR                              equ 0145h
CB_GETCOUNT                         equ 0146h
CB_GETCURSEL                        equ 0147h
CB_GETLBTEXT                        equ 0148h
CB_GETLBTEXTLEN                     equ 0149h
CB_INSERTSTRING                     equ 014Ah
CB_RESETCONTENT                     equ 014Bh
CB_FINDSTRING                       equ 014Ch
CB_SELECTSTRING                     equ 014Dh
CB_SETCURSEL                        equ 014Eh
CB_SHOWDROPDOWN                     equ 014Fh
CB_GETITEMDATA                      equ 0150h
CB_SETITEMDATA                      equ 0151h
CB_GETDROPPEDCONTROLRECT            equ 0152h
CB_SETITEMHEIGHT                    equ 0153h
CB_GETITEMHEIGHT                    equ 0154h
CB_SETEXTENDEDUI                    equ 0155h
CB_GETEXTENDEDUI                    equ 0156h
CB_GETDROPPEDSTATE                  equ 0157h
CB_FINDSTRINGEXACT                  equ 0158h
CB_SETLOCALE                        equ 0159h
CB_GETLOCALE                        equ 015Ah
CB_GETTOPINDEX                      equ 015Bh
CB_SETTOPINDEX                      equ 015Ch
CB_GETHORIZONTALEXTENT              equ 015Dh
CB_SETHORIZONTALEXTENT              equ 015Eh
CB_GETDROPPEDWIDTH                  equ 015Fh
CB_SETDROPPEDWIDTH                  equ 0160h
CB_INITSTORAGE                      equ 0161h
CB_MSGMAX                           equ 0162h

; combo box return values

CB_OKAY                             equ  0
CB_ERR                              equ -1
CB_ERRSPACE                         equ -2

; combo box notification codes

CBN_ERRSPACE                        equ -1
CBN_SELCHANGE                       equ  1
CBN_DBLCLK                          equ  2
CBN_SETFOCUS                        equ  3
CBN_KILLFOCUS                       equ  4
CBN_EDITCHANGE                      equ  5
CBN_EDITUPDATE                      equ  6
CBN_DROPDOWN                        equ  7
CBN_CLOSEUP                         equ  8
CBN_SELENDOK                        equ  9
CBN_SELENDCANCEL                    equ 10

; combo box styles

CBS_SIMPLE                          equ 0001h
CBS_DROPDOWN                        equ 0002h
CBS_DROPDOWNLIST                    equ 0003h
CBS_OWNERDRAWFIXED                  equ 0010h
CBS_OWNERDRAWVARIABLE               equ 0020h
CBS_AUTOHSCROLL                     equ 0040h
CBS_OEMCONVERT                      equ 0080h
CBS_SORT                            equ 0100h
CBS_HASSTRINGS                      equ 0200h
CBS_NOINTEGRALHEIGHT                equ 0400h
CBS_DISABLENOSCROLL                 equ 0800h
CBS_UPPERCASE                       equ 2000h
CBS_LOWERCASE                       equ 4000h

; edit control messages

EM_GETSEL                           equ 00B0h
EM_SETSEL                           equ 00B1h
EM_GETRECT                          equ 00B2h
EM_SETRECT                          equ 00B3h
EM_SETRECTNP                        equ 00B4h
EM_SCROLL                           equ 00B5h
EM_LINESCROLL                       equ 00B6h
EM_SCROLLCARET                      equ 00B7h
EM_GETMODIFY                        equ 00B8h
EM_SETMODIFY                        equ 00B9h
EM_GETLINECOUNT                     equ 00BAh
EM_LINEINDEX                        equ 00BBh
EM_SETHANDLE                        equ 00BCh
EM_GETHANDLE                        equ 00BDh
EM_GETTHUMB                         equ 00BEh
EM_LINELENGTH                       equ 00C1h
EM_REPLACESEL                       equ 00C2h
EM_GETLINE                          equ 00C4h
EM_LIMITTEXT                        equ 00C5h
EM_CANUNDO                          equ 00C6h
EM_UNDO                             equ 00C7h
EM_FMTLINES                         equ 00C8h
EM_LINEFROMCHAR                     equ 00C9h
EM_SETTABSTOPS                      equ 00CBh
EM_SETPASSWORDCHAR                  equ 00CCh
EM_EMPTYUNDOBUFFER                  equ 00CDh
EM_GETFIRSTVISIBLELINE              equ 00CEh
EM_SETREADONLY                      equ 00CFh
EM_SETWORDBREAKPROC                 equ 00D0h
EM_GETWORDBREAKPROC                 equ 00D1h
EM_GETPASSWORDCHAR                  equ 00D2h
EM_SETMARGINS                       equ 00D3h
EM_GETMARGINS                       equ 00D4h
EM_GETLIMITTEXT                     equ 00D5h
EM_POSFROMCHAR                      equ 00D6h
EM_CHARFROMPOS                      equ 00D7h
EM_SETLIMITTEXT                     equ EM_LIMITTEXT

; edit control notifications

EN_SETFOCUS                         equ 0100h
EN_KILLFOCUS                        equ 0200h
EN_CHANGE                           equ 0300h
EN_UPDATE                           equ 0400h
EN_ERRSPACE                         equ 0500h
EN_MAXTEXT                          equ 0501h
EN_HSCROLL                          equ 0601h
EN_VSCROLL                          equ 0602h

; listbox messages

LB_ADDSTRING                        equ 0180h
LB_INSERTSTRING                     equ 0181h
LB_DELETESTRING                     equ 0182h
LB_SELITEMRANGEEX                   equ 0183h
LB_RESETCONTENT                     equ 0184h
LB_SETSEL                           equ 0185h
LB_SETCURSEL                        equ 0186h
LB_GETSEL                           equ 0187h
LB_GETCURSEL                        equ 0188h
LB_GETTEXT                          equ 0189h
LB_GETTEXTLEN                       equ 018Ah
LB_GETCOUNT                         equ 018Bh
LB_SELECTSTRING                     equ 018Ch
LB_DIR                              equ 018Dh
LB_GETTOPINDEX                      equ 018Eh
LB_FINDSTRING                       equ 018Fh
LB_GETSELCOUNT                      equ 0190h
LB_GETSELITEMS                      equ 0191h
LB_SETTABSTOPS                      equ 0192h
LB_GETHORIZONTALEXTENT              equ 0193h
LB_SETHORIZONTALEXTENT              equ 0194h
LB_SETCOLUMNWIDTH                   equ 0195h
LB_ADDFILE                          equ 0196h
LB_SETTOPINDEX                      equ 0197h
LB_GETITEMRECT                      equ 0198h
LB_GETITEMDATA                      equ 0199h
LB_SETITEMDATA                      equ 019Ah
LB_SELITEMRANGE                     equ 019Bh
LB_SETANCHORINDEX                   equ 019Ch
LB_GETANCHORINDEX                   equ 019Dh
LB_SETCARETINDEX                    equ 019Eh
LB_GETCARETINDEX                    equ 019Fh
LB_SETITEMHEIGHT                    equ 01A0h
LB_GETITEMHEIGHT                    equ 01A1h
LB_FINDSTRINGEXACT                  equ 01A2h
LB_SETLOCALE                        equ 01A5h
LB_GETLOCALE                        equ 01A6h
LB_SETCOUNT                         equ 01A7h
LB_INITSTORAGE                      equ 01A8h
LB_ITEMFROMPOINT                    equ 01A9h
LB_MSGMAX                           equ 01B0h

; listbox return values

LB_OKAY                             equ  0
LB_ERR                              equ -1
LB_ERRSPACE                         equ -2

; listbox notification codes

LBN_ERRSPACE                        equ -2
LBN_SELCHANGE                       equ  1
LBN_DBLCLK                          equ  2
LBN_SELCANCEL                       equ  3
LBN_SETFOCUS                        equ  4
LBN_KILLFOCUS                       equ  5

; listbox styles

LBS_NOTIFY                          equ 00000001h
LBS_SORT                            equ 00000002h
LBS_NOREDRAW                        equ 00000004h
LBS_MULTIPLESEL                     equ 00000008h
LBS_OWNERDRAWFIXED                  equ 00000010h
LBS_OWNERDRAWVARIABLE               equ 00000020h
LBS_HASSTRINGS                      equ 00000040h
LBS_USETABSTOPS                     equ 00000080h
LBS_NOINTEGRALHEIGHT                equ 00000100h
LBS_MULTICOLUMN                     equ 00000200h
LBS_WANTKEYBOARDINPUT               equ 00000400h
LBS_EXTENDEDSEL                     equ 00000800h
LBS_DISABLENOSCROLL                 equ 00001000h
LBS_NODATA                          equ 00002000h
LBS_NOSEL                           equ 00004000h
LBS_STANDARD                        equ 00A00003h

; scroll bar constants

SB_HORZ                             equ 0
SB_VERT                             equ 1
SB_CTL                              equ 2
SB_BOTH                             equ 3

; scroll bar commands

SB_LINEUP                           equ 0
SB_LINELEFT                         equ 0
SB_LINEDOWN                         equ 1
SB_LINERIGHT                        equ 1
SB_PAGEUP                           equ 2
SB_PAGELEFT                         equ 2
SB_PAGEDOWN                         equ 3
SB_PAGERIGHT                        equ 3
SB_THUMBPOSITION                    equ 4
SB_THUMBTRACK                       equ 5
SB_TOP                              equ 6
SB_LEFT                             equ 6
SB_BOTTOM                           equ 7
SB_RIGHT                            equ 7
SB_ENDSCROLL                        equ 8

; status bar messages

SB_SETTEXTA                         equ WM_USER+01
SB_GETTEXTA                         equ WM_USER+02
SB_GETTEXTLENGTHA                   equ WM_USER+03
SB_SETPARTS                         equ WM_USER+04
SB_GETPARTS                         equ WM_USER+06
SB_GETBORDERS                       equ WM_USER+07
SB_SETMINHEIGHT                     equ WM_USER+08
SB_SIMPLE                           equ WM_USER+09
SB_GETRECT                          equ WM_USER+10
SB_SETTEXTW                         equ WM_USER+11
SB_GETTEXTLENGTHW                   equ WM_USER+12
SB_GETTEXTW                         equ WM_USER+13

                if  UNICODE
SB_GETTEXT                          equ SB_GETTEXTW
SB_SETTEXT                          equ SB_SETTEXTW
SB_GETTEXTLENGTH                    equ SB_GETTEXTLENGTHW
                else
SB_GETTEXT                          equ SB_GETTEXTA
SB_SETTEXT                          equ SB_SETTEXTA
SB_GETTEXTLENGTH                    equ SB_GETTEXTLENGTHA
                endif

; scroll bar messages

SBM_SETPOS                          equ 00E0h
SBM_GETPOS                          equ 00E1h
SBM_SETRANGE                        equ 00E2h
SBM_GETRANGE                        equ 00E3h
SBM_ENABLE_ARROWS                   equ 00E4h
SBM_SETRANGEREDRAW                  equ 00E6h
SBM_SETSCROLLINFO                   equ 00E9h
SBM_GETSCROLLINFO                   equ 00EAh

; scroll bar styles

SBS_HORZ                            equ 0000h
SBS_VERT                            equ 0001h
SBS_TOPALIGN                        equ 0002h
SBS_LEFTALIGN                       equ 0002h
SBS_BOTTOMALIGN                     equ 0004h
SBS_RIGHTALIGN                      equ 0004h
SBS_SIZEBOXTOPLEFTALIGN             equ 0002h
SBS_SIZEBOXBOTTOMRIGHTALIGN         equ 0004h
SBS_SIZEBOX                         equ 0008h
SBS_SIZEGRIP                        equ 0010h

; status bar types

SBT_DEFAULT                         equ 0000h
SBT_NOBORDERS                       equ 0100h
SBT_POPOUT                          equ 0200h
SBT_RTLREADING                      equ 0400h
SBT_OWNERDRAW                       equ 1000h








; ____________
;   STRUCTs
; ¯¯¯¯¯¯¯¯¯¯¯¯

; Useful structures

FILETIME                            struct
  dwLowDateTime                     dd ?
  dwHighDateTime                    dd ?
ends


WIN32_FIND_DATA                     struct
  dwFileAttributes                  dd ?
  ftCreationTime                    FILETIME <>
  ftLastAccessTime                  FILETIME <>
  ftLastWriteTime                   FILETIME <>
  nFileSizeHigh                     dd ?
  nFileSizeLow                      dd ?
  dwReserved0                       dd ?
  dwReserved1                       dd ?
  cFileName                         db MAX_PATH dup(?)
  cAlternate                        db 14h dup(?)
ends


SECURITY_ATTRIBUTES                 struct
  nLength                           dd 10
  lpSecurityDescriptor              dd NULL
  bInheritHandle                    dw TRUE
ends

SIZEOF_SECURITY_ATTRIBUTES          equ SIZE SECURITY_ATTRIBUTES


; ___________
;   Formats
; ¯¯¯¯¯¯¯¯¯¯¯


; Image Format

IMAGE_DOS_SIGNATURE                 equ 5A4Dh       ;'MZ'
IMAGE_OS2_SIGNATURE                 equ 454Eh       ;'NE'
IMAGE_OS2_SIGNATURE_LE              equ 454Ch       ;'LE'
IMAGE_NT_SIGNATURE                  equ 00004550h   ;'PE',0,0

IMAGE_DOS_HEADER                    struct
  MZ_magic                          dw ?            ; Magic number
  MZ_cblp                           dw ?            ; Bytes on last page of file
  MZ_cp                             dw ?            ; Pages in file
  MZ_crlc                           dw ?            ; Relocations
  MZ_cparhdr                        dw ?            ; Size of header in paragraphs
  MZ_minalloc                       dw ?            ; Minimum extra paragraphs needed
  MZ_maxalloc                       dw ?            ; Maximum extra paragraphs needed
  MZ_ss                             dw ?            ; Initial (relative) SS value
  MZ_sp                             dw ?            ; Initial SP value
  MZ_csum                           dw ?            ; Checksum
  MZ_ip                             dw ?            ; Initial IP value
  MZ_cs                             dw ?            ; Initial (relative) CS value
  MZ_lfarlc                         dw ?            ; File address of relocation table
  MZ_ovno                           dw ?            ; Ov erlay number
  MZ_res                            dw 4 dup (?)    ; Reserved words
  MZ_oemid                          dw ?            ; OEM identifier (for e_oeminfo)
  MZ_oeminfo                        dw ?            ; OEM information; e_oemid specific
  MZ_res2                           dw 10 dup (?)   ; Reserved words
  MZ_lfanew                         dd ?            ; File address of new exe header
ends

IMAGE_SIZEOF_DOS_HEADER             equ SIZE IMAGE_DOS_HEADER


IMAGE_OS2_HEADER                    struct
  NE_magic                          dw ?            ; Magic number
  NE_ver                            db ?            ; Version number
  NE_rev                            db ?            ; Revision number
  NE_enttab                         dw ?            ; Offset of Entry Table
  NE_cbenttab                       dw ?            ; Number of bytes in Entry Table
  NE_crc                            dd ?            ; Checksum of whole file
  NE_flags                          dw ?            ; Flag word
  NE_autodata                       dw ?            ; Automatic data segment number
  NE_heap                           dw ?            ; Initial heap allocation
  NE_stack                          dw ?            ; Initial stack allocation
  NE_csip                           dd ?            ; Initial CS:IP setting
  NE_sssp                           dd ?            ; Initial SS:SP setting
  NE_cseg                           dw ?            ; Count of file segments
  NE_cmod                           dw ?            ; Entries in Module Reference Table
  NE_cbnrestab                      dw ?            ; Size of non-resident name table
  NE_segtab                         dw ?            ; Offset of Segment Table
  NE_rsrctab                        dw ?            ; Offset of Resource Table
  NE_restab                         dw ?            ; Offset of resident name table
  NE_modtab                         dw ?            ; Offset of Module Reference Table
  NE_imptab                         dw ?            ; Offset of Imported Names Table
  NE_nrestab                        dd ?            ; Offset of Non-resident Names Table
  NE_cmovent                        dw ?            ; Count of movable entries
  NE_align                          dw ?            ; Segment alignment shift count
  NE_cres                           dw ?            ; Count of resource segments
  NE_exetyp                         db ?            ; Target Operating system
  NE_flagsothers                    db ?            ; Other .EXE flags
  NE_pretthunks                     dw ?            ; offset to return thunks
  NE_psegrefbytes                   dw ?            ; offset to segment ref. bytes
  NE_swaparea                       dw ?            ; Minimum code swap area size
  NE_expver                         dw ?            ; Expected Windows version number
ends

; File Header Format

IMAGE_FILE_HEADER                   struct
  FH_Machine                        dw ?            ; Machine type
  FH_NumberOfSections               dw ?            ; Number of sections
  FH_TimeDateStamp                  dd ?            ; Date and Time
  FH_PointerToSymbolTable           dd byte ptr ?   ; Pointer to Symbols
  FH_NumberOfSymbols                dd ?            ; Number of Symbols
  FH_SizeOfOptionalHeader           dw ?            ; Size of Optional Header
  FH_Characteristics                dw ?            ; File characteristics
ends

IMAGE_SIZEOF_FILE_HEADER            equ 20


IMAGE_FILE_RELOCS_STRIPPED          equ 0001h       ; Relocation info stripped from file
IMAGE_FILE_EXECUTABLE_IMAGE         equ 0002h       ; File is executable  (i.e. no unresolved external references)
IMAGE_FILE_LINE_NUMS_STRIPPED       equ 0004h       ; Line numbers stripped from file
IMAGE_FILE_LOCAL_SYMS_STRIPPED      equ 0008h       ; Local symbols stripped from file
IMAGE_FILE_MINIMAL_OBJECT           equ 0010h       ; Reserved
IMAGE_FILE_UPDATE_OBJECT            equ 0020h       ; Reserved
IMAGE_FILE_16BIT_MACHINE            equ 0040h       ; 16 bit word machine
IMAGE_FILE_BYTES_REVERSED_LO        equ 0080h       ; Bytes of machine word are reversed
IMAGE_FILE_32BIT_MACHINE            equ 0100h       ; 32 bit word machine
IMAGE_FILE_DEBUG_STRIPPED           equ 0200h       ; Debugging info stripped from file in .DBG file
IMAGE_FILE_PATCH                    equ 0400h       ; Reserved
IMAGE_FILE_SYSTEM                   equ 1000h       ; System File
IMAGE_FILE_DLL                      equ 2000h       ; File is a DLL
IMAGE_FILE_BYTES_REVERSED_HI        equ 8000h       ; Bytes of machine word are reversed

IMAGE_FILE_MACHINE_UNKNOWN          equ 0
IMAGE_FILE_MACHINE_I386             equ 14Ch        ; Intel 386
IMAGE_FILE_MACHINE_R3000            equ 162h        ; MIPS L-endian, 0160h B-endian
IMAGE_FILE_MACHINE_R4000            equ 166h        ; MIPS L-endian
IMAGE_FILE_MACHINE_R10000           equ 168h        ; MIPS L-endian
IMAGE_FILE_MACHINE_ALPHA            equ 184h        ; Alpha_AXP
IMAGE_FILE_MACHINE_POWERPC          equ 1F0h        ; IBM PowerPC L-Endian

; Directory Format

IMAGE_DATA_DIRECTORY                struct
  DD_VirtualAddress                 dd byte ptr ?
  DD_Size                           dd ?
ends

IMAGE_NUMBEROF_DIRECTORY_ENTRIES    equ 16

IMAGE_DIRECTORY_ENTRIES             struct
  DE_Export                         IMAGE_DATA_DIRECTORY <>
  DE_Import                         IMAGE_DATA_DIRECTORY <>
  DE_Resource                       IMAGE_DATA_DIRECTORY <>
  DE_Exception                      IMAGE_DATA_DIRECTORY <>
  DE_Security                       IMAGE_DATA_DIRECTORY <>
  DE_BaseReloc                      IMAGE_DATA_DIRECTORY <>
  DE_Debug                          IMAGE_DATA_DIRECTORY <>
  DE_Copyright                      IMAGE_DATA_DIRECTORY <>
  DE_GlobalPtr                      IMAGE_DATA_DIRECTORY <>
  DE_TLS                            IMAGE_DATA_DIRECTORY <>
  DE_LoadConfig                     IMAGE_DATA_DIRECTORY <>
  DE_BoundImport                    IMAGE_DATA_DIRECTORY <>
  DE_IAT                            IMAGE_DATA_DIRECTORY <>
ends

; Optional Header Format

IMAGE_OPTIONAL_HEADER               struct
 ; Standard fields:
  OH_Magic                          dw ?            ; Magic word
  OH_MajorLinkerVersion             db ?            ; Major Linker version
  OH_MinorLinkerVersion             db ?            ; Minor Linker version
  OH_SizeOfCode                     dd ?            ; Size of code section
  OH_SizeOfInitializedData          dd ?            ; Initialized Data
  OH_SizeOfUninitializedData        dd ?            ; Uninitialized Data
  OH_AddressOfEntryPoint            dd byte ptr ?   ; Initial EIP
  OH_BaseOfCode                     dd byte ptr ?   ; Code Virtual Address
  OH_BaseOfData                     dd byte ptr ?   ; Data Virtual Address
 ; NT additional fields:
  OH_ImageBase                      dd byte ptr ?   ; Base of image
  OH_SectionAlignment               dd ?            ; Section Alignment
  OH_FileAlignment                  dd ?            ; File Alignment
  OH_MajorOperatingSystemVersion    dw ?            ; Major OS
  OH_MinorOperatingSystemVersion    dw ?            ; Minor OS
  OH_MajorImageVersion              dw ?            ; Major Image version
  OH_MinorImageVersion              dw ?            ; Minor Image version
  OH_MajorSubsystemVersion          dw ?            ; Major Subsys version
  OH_MinorSubsystemVersion          dw ?            ; Minor Subsys version
  OH_Win32VersionValue              dd ?            ; win32 version
  OH_SizeOfImage                    dd ?            ; Size of image
  OH_SizeOfHeaders                  dd ?            ; Size of Header
  OH_CheckSum                       dd ?            ; unused
  OH_Subsystem                      dw ?            ; Subsystem
  OH_DllCharacteristics             dw ?            ; DLL characteristic
  OH_SizeOfStackReserve             dd ?            ; Stack reserve
  OH_SizeOfStackCommit              dd ?            ; Stack commit
  OH_SizeOfHeapReserve              dd ?            ; Heap reserve
  OH_SizeOfHeapCommit               dd ?            ; Heap commit
  OH_LoaderFlags                    dd ?            ; Loader flags
  OH_NumberOfRvaAndSizes            dd ?            ; Number of directories
                                    union           ; directory entries
  OH_DataDirectory                    IMAGE_DATA_DIRECTORY IMAGE_NUMBEROF_DIRECTORY_ENTRIES dup (?)
  OH_DirectoryEntries                 IMAGE_DIRECTORY_ENTRIES ?
                                    ends
ends

IMAGE_SIZEOF_STD_OPTIONAL_HEADER    equ 28
IMAGE_SIZEOF_NT_OPTIONAL_HEADER     equ size IMAGE_OPTIONAL_HEADER  ; 224

IMAGE_NT_HEADERS                    struct
  NT_Signature                      dd ?
  NT_FileHeader                     IMAGE_FILE_HEADER <>
  NT_OptionalHeader                 IMAGE_OPTIONAL_HEADER <>
ends

; Subsystem values

IMAGE_SUBSYSTEM_UNKNOWN             equ 0           ; Unknown subsystem
IMAGE_SUBSYSTEM_NATIVE              equ 1           ; Image doesn't require a subsystem
IMAGE_SUBSYSTEM_WINDOWS_GUI         equ 2           ; Image runs in the Windows GUI subsystem
IMAGE_SUBSYSTEM_WINDOWS_CUI         equ 3           ; Image runs in the Windows character subsystem
IMAGE_SUBSYSTEM_OS2_CUI             equ 5           ; Image runs in the OS/2 character subsystem
IMAGE_SUBSYSTEM_POSIX_CUI           equ 7           ; Image run  in the Posix character subsystem

; Dll Characteristics

IMAGE_LIBRARY_PROCESS_INIT          equ 1           ; Dll has a process initialization routine
IMAGE_LIBRARY_PROCESS_TERM          equ 2           ; Dll has a thread termination routine
IMAGE_LIBRARY_THREAD_INIT           equ 4           ; Dll has a thread initialization routine
IMAGE_LIBRARY_THREAD_TERM           equ 8           ; Dll has a thread termination routine

; Loader Flags

IMAGE_LOADER_FLAGS_BREAK_ON_LOAD    equ 00000001h
IMAGE_LOADER_FLAGS_DEBUG_ON_LOAD    equ 00000002h

; Directory Entries

IMAGE_DIRECTORY_ENTRY_EXPORT        equ 0           ; Export Directory
IMAGE_DIRECTORY_ENTRY_IMPORT        equ 1           ; Import Directory
IMAGE_DIRECTORY_ENTRY_RESOURCE      equ 2           ; Resource Directory
IMAGE_DIRECTORY_ENTRY_EXCEPTION     equ 3           ; Exception Directory
IMAGE_DIRECTORY_ENTRY_SECURITY      equ 4           ; Security Directory
IMAGE_DIRECTORY_ENTRY_BASERELOC     equ 5           ; Base Relocation Table
IMAGE_DIRECTORY_ENTRY_DEBUG         equ 6           ; Debug Directory
IMAGE_DIRECTORY_ENTRY_COPYRIGHT     equ 7           ; Description String
IMAGE_DIRECTORY_ENTRY_GLOBALPTR     equ 8           ; Machine Value (MIPS GP)
IMAGE_DIRECTORY_ENTRY_TLS           equ 9           ; TLS Directory
IMAGE_DIRECTORY_ENTRY_LOAD_CONFIG   equ 10          ; Load Configuration Directory
IMAGE_DIRECTORY_ENTRY_BOUND_IMPORT  equ 11          ; Bound Import Directory in headers
IMAGE_DIRECTORY_ENTRY_IAT           equ 12          ; Import Address Table

; Section header format

IMAGE_SIZEOF_SHORT_NAME             equ 8

IMAGE_SECTION_HEADER                struct
  SH_Name                           db IMAGE_SIZEOF_SHORT_NAME dup (?)
                                    union
  SH_PhysicalAddress                  dd byte ptr ?
  SH_VirtualSize                      dd ?
                                    ends
  SH_VirtualAddress                 dd byte ptr ?
  SH_SizeOfRawData                  dd ?
  SH_PointerToRawData               dd byte ptr ?
  SH_PointerToRelocations           dd byte ptr ?
  SH_PointerToLinenumbers           dd byte ptr ?
  SH_NumberOfRelocations            dw ?
  SH_NumberOfLinenumbers            dw ?
  SH_Characteristics                dd ?
ends

IMAGE_SIZEOF_SECTION_HEADER         equ size IMAGE_SECTION_HEADER   ; 40

IMAGE_SCN_TYPE_REGULAR              equ 00000000h   ; Reserved
IMAGE_SCN_TYPE_DUMMY                equ 00000001h   ; Reserved
IMAGE_SCN_TYPE_NO_LOAD              equ 00000002h   ; Reserved
IMAGE_SCN_TYPE_GROUPED              equ 00000004h   ; Reserved. Used for 16-bit offset code
IMAGE_SCN_TYPE_NO_PAD               equ 00000008h   ; Reserved
IMAGE_SCN_TYPE_COPY                 equ 00000010h   ; Reserved

IMAGE_SCN_CNT_CODE                  equ 00000020h   ; Section contains code.
IMAGE_SCN_CNT_INITIALIZED_DATA      equ 00000040h   ; Section contains initialized data.
IMAGE_SCN_CNT_UNINITIALIZED_DATA    equ 00000080h   ; Section contains uninitialized data.

IMAGE_SCN_LNK_OTHER                 equ 00000100h   ; Reserved.
IMAGE_SCN_LNK_INFO                  equ 00000200h   ; Section contains comments or some other type of information.
IMAGE_SCN_LNK_OVERLAY               equ 00000400h   ; Reserved. Section contains an overlay.
IMAGE_SCN_LNK_REMOVE                equ 00000800h   ; Section contents will not become part of image.
IMAGE_SCN_LNK_COMDAT                equ 00001000h   ; Section contents comdat.

IMAGE_SCN_MEM_FARDATA               equ 00008000h
IMAGE_SCN_MEM_PURGEABLE             equ 00020000h
IMAGE_SCN_MEM_16BIT                 equ 00020000h
IMAGE_SCN_MEM_LOCKED                equ 00040000h
IMAGE_SCN_MEM_PRELOAD               equ 00080000h

IMAGE_SCN_ALIGN_1BYTES              equ 00100000h
IMAGE_SCN_ALIGN_2BYTES              equ 00200000h
IMAGE_SCN_ALIGN_4BYTES              equ 00300000h
IMAGE_SCN_ALIGN_8BYTES              equ 00400000h
IMAGE_SCN_ALIGN_16BYTES             equ 00500000h   ; Default alignment if no others are specified.
IMAGE_SCN_ALIGN_32BYTES             equ 00600000h
IMAGE_SCN_ALIGN_64BYTES             equ 00700000h

IMAGE_SCN_LNK_NRELOC_OVFL           equ 01000000h   ; Section contains extended relocations.
IMAGE_SCN_MEM_DISCARDABLE           equ 02000000h   ; Section can be discarded.
IMAGE_SCN_MEM_NOT_CACHED            equ 04000000h   ; Section is not cachable.
IMAGE_SCN_MEM_NOT_PAGED             equ 08000000h   ; Section is not pageable.
IMAGE_SCN_MEM_SHARED                equ 10000000h   ; Section is shareable.
IMAGE_SCN_MEM_EXECUTE               equ 20000000h   ; Section is executable.
IMAGE_SCN_MEM_READ                  equ 40000000h   ; Section is readable.
IMAGE_SCN_MEM_WRITE                 equ 80000000h   ; Section is writeable.


; Based Relocation Format

IMAGE_RELOCATION_DATA               record {
  RD_RelocType                      :4
  RD_RelocOffset                    :12
}

IMAGE_BASE_RELOCATION               struct
  BR_VirtualAddress                 dd ?
  BR_SizeOfBlock                    dd ?
; BR_TypeOffset                     IMAGE_RELOCATION_DATA 1 DUP (?) ; Array of zero or more relocations (type + RVAs)
ends

IMAGE_SIZEOF_BASE_RELOCATION        equ size  IMAGE_BASE_RELOCATION   ; 8

; Based Relocations Types

IMAGE_REL_BASED_ABSOLUTE            equ 0
IMAGE_REL_BASED_HIGH                equ 1
IMAGE_REL_BASED_LOW                 equ 2
IMAGE_REL_BASED_HIGHLOW             equ 3
IMAGE_REL_BASED_HIGHADJ             equ 4
IMAGE_REL_BASED_MIPS_JMPADDR        equ 5
IMAGE_REL_BASED_I860_BRADDR         equ 6
IMAGE_REL_BASED_I860_SPLIT          equ 7


; Export Format

IMAGE_EXPORT_DIRECTORY              struct
  ED_Characteristics                dd ?
  ED_TimeDateStamp                  dd ?
  ED_MajorVersion                   dw ?
  ED_MinorVersion                   dw ?
  ED_Name                           dd byte ptr ?   ; Ptr to name of exported DLL
                                    union
  ED_Base                             dd ?
  ED_BaseOrdinal                      dd ?
                                    ends
  ED_NumberOfFunctions              dd ?
                                    union
  ED_NumberOfNames                    dd ?
  ED_NumberOfOrdinals                 dd ?
                                    ends
  ED_AddressOfFunctions             dd dword ptr ?  ; Ptr to array of function addresses
  ED_AddressOfNames                 dd dword ptr ?  ; Ptr to array of (function) name addresses
                                    union
  ED_AddressOfNameOrdinals            dd word ptr ? ; Ptr to array of ordinals
  ED_AddressOfOrdinals                dd word ptr ? ;
                                    ends
ends

IMAGE_SIZEOF_EXPORT_DIRECTORY       equ size IMAGE_EXPORT_DIRECTORY


; Import Format

IMAGE_IMPORT_BY_NAME                struct
  IBN_Hint                          dw ?
  IBN_Name                          db 1 DUP (?)    ; ASCIIZ function name (variable size)
ends

IMAGE_THUNK_DATA                    struct
                                    union
  TD_AddressOfData                    dd IMAGE_IMPORT_BY_NAME ptr ? ; Ptr to IMAGE_IMPORT_BY_NAME structure
  TD_Ordinal                          dd ?                          ; Ordinal ORed with IMAGE_ORDINAL_FLAG
  TD_Function                         dd byte ptr ? ; CODE PTR, Ptr to function (i.e. Function address after program load)
  TD_ForwarderString                  dd byte ptr ? ; Ptr to a forwarded API function.
                                    ends
ends

IMAGE_ORDINAL_FLAG                  equ 80000000h

IMAGE_IMPORT_DESCRIPTOR             struct
                                    union
  ID_Characteristics                  dd ?                      ; 0 for terminating null import descriptor
  ID_OriginalFirstThunk               dd IMAGE_THUNK_DATA ptr ? ; RVA to original unbound IAT
                                    ends
  ID_TimeDateStamp                  dd ?
  ID_ForwarderChain                 dd ?                        ; -1 if no forwarders
  ID_Name                           dd byte ptr ?               ; RVA to name of imported DLL
  ID_FirstThunk                     dd IMAGE_THUNK_DATA ptr ?   ; RVA to IAT (if bound this IAT has actual addresses)
ends

; TimeDateStamp
; 0 if not bound,
; -1 if bound, and real date\time stamp
;    in IMAGE_DIRECTORY_ENTRY_BOUND_IMPORT (new BIND)
; O.W. date/time stamp of DLL bound to (old BIND)

IMAGE_SIZEOF_IMPORT_DESCRIPTOR      equ size IMAGE_IMPORT_DESCRIPTOR

; EOF