
comment $

                  Lord Julus presents the Win32 help series

ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
ÚÄ¿                                                                       ÚÄ¿
³ ³             This  is my transformation of the original WINUSER.H      ³ ³
³ ³     file  from the Microsoft Windows SDK(C) for Windows  NT  5.0      ³ ³
³ ³     beta 2 and Windows 98, released on in Sept. 1998.                 ³ ³
³ ³     This  file  was   transformed  by  me  from  the original  C      ³ ³
³ ³     definition  into assembly language. You can use this file to      ³ ³
³ ³     quicken  up  writting your win32 programs in assembler.  You      ³ ³
³ ³     can use these files as you wish, as they are freeware.            ³ ³
³ ³                                                                       ³ ³
³ ³             However,  if  you find any mistake inside this file,      ³ ³
³ ³     it  is  probably due to the fact that I merely could see the      ³ ³
³ ³     monitor  while  converting  the  files. So, if you do notice      ³ ³
³ ³     something, please notify me on my e-mail address at:              ³ ³
³ ³                                                                       ³ ³
³ ³                   lordjulus@geocities.com                             ³ ³
³ ³                                                                       ³ ³
³ ³             Also, if you find any other useful stuff that can be      ³ ³
³ ³     included here, do not hesitate to tell me.                        ³ ³
³ ³                                                                       ³ ³
³ ³     Good luck,                                                        ³ ³
³ ³                                ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿              ³ ³
³ ³                                ³  Lord Julus (c) 1999  ³              ³ ³
³ ³                                ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ              ³ ³
³ ³                                                                       ³ ³
ÀÄÙ                                                                       ÀÄÙ
ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

        $

; Predefined Resource Types

RESOURCE_CONNECTED      EQU 00000001h
RESOURCE_GLOBALNET      EQU 00000002h
RESOURCE_REMEMBERED     EQU 00000003h
RESOURCE_RECENT         EQU 00000004h
RESOURCE_CONTEXT        EQU 00000005h

RESOURCETYPE_ANY        EQU 00000000h
RESOURCETYPE_DISK       EQU 00000001h
RESOURCETYPE_PRINT      EQU 00000002h
RESOURCETYPE_RESERVED   EQU 00000008h
RESOURCETYPE_UNKNOWN    EQU 0FFFFFFFFh

RESOURCEUSAGE_CONNECTABLE   EQU 00000001h
RESOURCEUSAGE_CONTAINER     EQU 00000002h
RESOURCEUSAGE_NOLOCALDEVICE EQU 00000004h
RESOURCEUSAGE_SIBLING       EQU 00000008h
RESOURCEUSAGE_ATTACHED      EQU 00000010h
RESOURCEUSAGE_ALL           EQU RESOURCEUSAGE_CONNECTABLE OR\
                                RESOURCEUSAGE_CONTAINER OR\
                                RESOURCEUSAGE_ATTACHED
RESOURCEUSAGE_RESERVED      EQU 80000000h

RESOURCEDISPLAYTYPE_GENERIC        EQU 00000000h
RESOURCEDISPLAYTYPE_DOMAIN         EQU 00000001h
RESOURCEDISPLAYTYPE_SERVER         EQU 00000002h
RESOURCEDISPLAYTYPE_SHARE          EQU 00000003h
RESOURCEDISPLAYTYPE_FILE           EQU 00000004h
RESOURCEDISPLAYTYPE_GROUP          EQU 00000005h
RESOURCEDISPLAYTYPE_NETWORK        EQU 00000006h
RESOURCEDISPLAYTYPE_ROOT           EQU 00000007h
RESOURCEDISPLAYTYPE_SHAREADMIN     EQU 00000008h
RESOURCEDISPLAYTYPE_DIRECTORY      EQU 00000009h
RESOURCEDISPLAYTYPE_TREE           EQU 0000000Ah
RESOURCEDISPLAYTYPE_NDSCONTAINER   EQU 0000000Bh

NETRESOURCEA STRUC
    dwScope        DD 0
    dwType         DD 0
    dwDisplayType  DD 0
    dwUsage        DD 0
    lpLocalName    DD 0
    lpRemoteName   DD 0
    lpComment      DD 0
    lpProvider     DD 0
NETRESOURCEA ENDS

;---


 RT_CURSOR           EQU 1
 RT_BITMAP           EQU 2
 RT_ICON             EQU 3
 RT_MENU             EQU 4
 RT_DIALOG           EQU 5
 RT_STRING           EQU 6
 RT_FONTDIR          EQU 7
 RT_FONT             EQU 8
 RT_ACCELERATOR      EQU 9
 RT_RCDATA           EQU 10
 RT_MESSAGETABLE     EQU 11
 DIFFERENCE          EQU 11
 RT_GROUP_CURSOR     EQU RT_CURSOR + DIFFERENCE
 RT_GROUP_ICON       EQU RT_ICON + DIFFERENCE
 RT_VERSION          EQU 16
 RT_DLGINCLUDE       EQU 17
 RT_PLUGPLAY         EQU 19
 RT_VXD              EQU 20
 RT_ANICURSOR        EQU 21
 RT_ANIICON          EQU 22
 RT_HTML             EQU 23

; Scroll Bar Constants

 SB_HORZ             EQU 0
 SB_VERT             EQU 1
 SB_CTL              EQU 2
 SB_BOTH             EQU 3
 SB_LINEUP           EQU 0
 SB_LINELEFT         EQU 0
 SB_LINEDOWN         EQU 1
 SB_LINERIGHT        EQU 1
 SB_PAGEUP           EQU 2
 SB_PAGELEFT         EQU 2
 SB_PAGEDOWN         EQU 3
 SB_PAGERIGHT        EQU 3
 SB_THUMBPOSITION    EQU 4
 SB_THUMBTRACK       EQU 5
 SB_TOP              EQU 6
 SB_LEFT             EQU 6
 SB_BOTTOM           EQU 7
 SB_RIGHT            EQU 7
 SB_ENDSCROLL        EQU 8

; ShowWindow() Commands

 SW_HIDE             EQU 0
 SW_SHOWNORMAL       EQU 1
 SW_NORMAL           EQU 1
 SW_SHOWMINIMIZED    EQU 2
 SW_SHOWMAXIMIZED    EQU 3
 SW_MAXIMIZE         EQU 3
 SW_SHOWNOACTIVATE   EQU 4
 SW_SHOW             EQU 5
 SW_MINIMIZE         EQU 6
 SW_SHOWMINNOACTIVE  EQU 7
 SW_SHOWNA           EQU 8
 SW_RESTORE          EQU 9
 SW_SHOWDEFAULT      EQU 10
 SW_FORCEMINIMIZE    EQU 11
 SW_MAX              EQU 11

; Old ShowWindow() Commands

 HIDE_WINDOW         EQU 0
 SHOW_OPENWINDOW     EQU 1
 SHOW_ICONWINDOW     EQU 2
 SHOW_FULLSCREEN     EQU 3
 SHOW_OPENNOACTIVATE EQU 4

; Identifiers for the WM_SHOWWINDOW message

 SW_PARENTCLOSING    EQU 1
 SW_OTHERZOOM        EQU 2
 SW_PARENTOPENING    EQU 3
 SW_OTHERUNZOOM      EQU 4

; AnimateWindow() Commands

 AW_HOR_POSITIVE             EQU 00000001h
 AW_HOR_NEGATIVE             EQU 00000002h
 AW_VER_POSITIVE             EQU 00000004h
 AW_VER_NEGATIVE             EQU 00000008h
 AW_CENTER                   EQU 00000010h
 AW_HIDE                     EQU 00010000h
 AW_ACTIVATE                 EQU 00020000h
 AW_SLIDE                    EQU 00040000h
 AW_BLEND                    EQU 00080000h

; WM_KEYUP/DOWN/CHAR HIWORD(lParam) flags

 KF_EXTENDED         EQU 0100h
 KF_DLGMODE          EQU 0800h
 KF_MENUMODE         EQU 1000h
 KF_ALTDOWN          EQU 2000h
 KF_REPEAT           EQU 4000h
 KF_UP               EQU 8000h

; Virtual Keys, Standard Set

 VK_LBUTTON        EQU 01h
 VK_RBUTTON        EQU 02h
 VK_CANCEL         EQU 03h
 VK_MBUTTON        EQU 04h
 VK_BACK           EQU 08h
 VK_TAB            EQU 09h
 VK_CLEAR          EQU 0Ch
 VK_RETURN         EQU 0Dh
 VK_SHIFT          EQU 10h
 VK_CONTROL        EQU 11h
 VK_MENU           EQU 12h
 VK_PAUSE          EQU 13h
 VK_CAPITAL        EQU 14h
 VK_KANA           EQU 15h
 VK_HANGEUL        EQU 15h
 VK_HANGUL         EQU 15h
 VK_JUNJA          EQU 17h
 VK_FINAL          EQU 18h
 VK_HANJA          EQU 19h
 VK_KANJI          EQU 19h
 VK_ESCAPE         EQU 1Bh
 VK_CONVERT        EQU 1Ch
 VK_NONCONVERT     EQU 1Dh
 VK_ACCEPT         EQU 1Eh
 VK_MODECHANGE     EQU 1Fh
 VK_SPACE          EQU 20h
 VK_PRIOR          EQU 21h
 VK_NEXT           EQU 22h
 VK_END            EQU 23h
 VK_HOME           EQU 24h
 VK_LEFT           EQU 25h
 VK_UP             EQU 26h
 VK_RIGHT          EQU 27h
 VK_DOWN           EQU 28h
 VK_SELECT         EQU 29h
 VK_PRINT          EQU 2Ah
 VK_EXECUTE        EQU 2Bh
 VK_SNAPSHOT       EQU 2Ch
 VK_INSERT         EQU 2Dh
 VK_DELETE         EQU 2Eh
 VK_HELP           EQU 2Fh
 VK_0              EQU '0'
 VK_1              EQU '1'
 VK_2              EQU '2'
 VK_3              EQU '3'
 VK_4              EQU '4'
 VK_5              EQU '5'
 VK_6              EQU '6'
 VK_7              EQU '7'
 VK_8              EQU '8'
 VK_9              EQU '9'
 VK_A              EQU 'A'
 VK_B              EQU 'B'
 VK_C              EQU 'C'
 VK_D              EQU 'D'
 VK_E              EQU 'E'
 VK_F              EQU 'F'
 VK_G              EQU 'G'
 VK_H              EQU 'H'
 VK_I              EQU 'I'
 VK_J              EQU 'J'
 VK_K              EQU 'K'
 VK_L              EQU 'L'
 VK_M              EQU 'M'
 VK_N              EQU 'N'
 VK_O              EQU 'O'
 VK_P              EQU 'P'
 VK_Q              EQU 'Q'
 VK_R              EQU 'R'
 VK_S              EQU 'S'
 VK_T              EQU 'T'
 VK_U              EQU 'U'
 VK_V              EQU 'V'
 VK_W              EQU 'W'
 VK_X              EQU 'X'
 VK_Y              EQU 'Y'
 VK_Z              EQU 'Z'
 VK_LWIN           EQU 5Bh
 VK_RWIN           EQU 5Ch
 VK_APPS           EQU 5Dh
 VK_NUMPAD0        EQU 60h
 VK_NUMPAD1        EQU 61h
 VK_NUMPAD2        EQU 62h
 VK_NUMPAD3        EQU 63h
 VK_NUMPAD4        EQU 64h
 VK_NUMPAD5        EQU 65h
 VK_NUMPAD6        EQU 66h
 VK_NUMPAD7        EQU 67h
 VK_NUMPAD8        EQU 68h
 VK_NUMPAD9        EQU 69h
 VK_MULTIPLY       EQU 6Ah
 VK_ADD            EQU 6Bh
 VK_SEPARATOR      EQU 6Ch
 VK_SUBTRACT       EQU 6Dh
 VK_DECIMAL        EQU 6Eh
 VK_DIVIDE         EQU 6Fh
 VK_F1             EQU 70h
 VK_F2             EQU 71h
 VK_F3             EQU 72h
 VK_F4             EQU 73h
 VK_F5             EQU 74h
 VK_F6             EQU 75h
 VK_F7             EQU 76h
 VK_F8             EQU 77h
 VK_F9             EQU 78h
 VK_F10            EQU 79h
 VK_F11            EQU 7Ah
 VK_F12            EQU 7Bh
 VK_F13            EQU 7Ch
 VK_F14            EQU 7Dh
 VK_F15            EQU 7Eh
 VK_F16            EQU 7Fh
 VK_F17            EQU 80h
 VK_F18            EQU 81h
 VK_F19            EQU 82h
 VK_F20            EQU 83h
 VK_F21            EQU 84h
 VK_F22            EQU 85h
 VK_F23            EQU 86h
 VK_F24            EQU 87h
 VK_NUMLOCK        EQU 90h
 VK_SCROLL         EQU 91h
 VK_LSHIFT         EQU A0h
 VK_RSHIFT         EQU A1h
 VK_LCONTROL       EQU A2h
 VK_RCONTROL       EQU A3h
 VK_LMENU          EQU A4h
 VK_RMENU          EQU A5h
 VK_ATTN           EQU F6h
 VK_CRSEL          EQU F7h
 VK_EXSEL          EQU F8h
 VK_EREOF          EQU F9h
 VK_PLAY           EQU FAh
 VK_ZOOM           EQU FBh
 VK_NONAME         EQU FCh
 VK_PA1            EQU FDh
 VK_OEM_CLEAR      EQU FEh

; SetWindowsHook() codes

 WH_MIN              EQU -1
 WH_MSGFILTER        EQU -1
 WH_JOURNALRECORD    EQU 0
 WH_JOURNALPLAYBACK  EQU 1
 WH_KEYBOARD         EQU 2
 WH_GETMESSAGE       EQU 3
 WH_CALLWNDPROC      EQU 4
 WH_CBT              EQU 5
 WH_SYSMSGFILTER     EQU 6
 WH_MOUSE            EQU 7
 WH_HARDWARE         EQU 8
 WH_DEBUG            EQU 9
 WH_SHELL            EQU 10
 WH_FOREGROUNDIDLE   EQU 11
 WH_CALLWNDPROCRET   EQU 12
 WH_KEYBOARD_LL      EQU 13
 WH_MOUSE_LL         EQU 14
 WH_MAX              EQU 14

 WH_MINHOOK          EQU WH_MIN
 WH_MAXHOOK          EQU WH_MAX

; Hook Codes

 HC_ACTION           EQU 0
 HC_GETNEXT          EQU 1
 HC_SKIP             EQU 2
 HC_NOREMOVE         EQU 3
 HC_NOREM            EQU HC_NOREMOVE
 HC_SYSMODALON       EQU 4
 HC_SYSMODALOFF      EQU 5

; CBT Hook Codes

 HCBT_MOVESIZE       EQU 0
 HCBT_MINMAX         EQU 1
 HCBT_QS             EQU 2
 HCBT_CREATEWND      EQU 3
 HCBT_DESTROYWND     EQU 4
 HCBT_ACTIVATE       EQU 5
 HCBT_CLICKSKIPPED   EQU 6
 HCBT_KEYSKIPPED     EQU 7
 HCBT_SYSCOMMAND     EQU 8
 HCBT_SETFOCUS       EQU 9

; WH_MSGFILTER Filter Proc Codes

 MSGF_DIALOGBOX      EQU 0
 MSGF_MESSAGEBOX     EQU 1
 MSGF_MENU           EQU 2
 MSGF_SCROLLBAR      EQU 5
 MSGF_NEXTWINDOW     EQU 6
 MSGF_MAX            EQU 8                       ; unused
 MSGF_USER           EQU 4096

; Shell support

 HSHELL_WINDOWCREATED        EQU 1
 HSHELL_WINDOWDESTROYED      EQU 2
 HSHELL_ACTIVATESHELLWINDOW  EQU 3
 HSHELL_WINDOWACTIVATED      EQU 4
 HSHELL_GETMINRECT           EQU 5
 HSHELL_REDRAW               EQU 6
 HSHELL_TASKMAN              EQU 7
 HSHELL_LANGUAGE             EQU 8
 HSHELL_ACCESSIBILITYSTATE   EQU 11
 ACCESS_STICKYKEYS           EQU 0001h
 ACCESS_FILTERKEYS           EQU 0002h
 ACCESS_MOUSEKEYS            EQU 0003h

; Low level hook flags

 LLKHF_EXTENDED       EQU KF_EXTENDED shr 8
 LLKHF_INJECTED       EQU 00000010h
 LLKHF_ALTDOWN        EQU KF_ALTDOWN shr 8
 LLKHF_UP             EQU KF_UP shr 8
 LLMHF_INJECTED       EQU 00000001h

; Keyboard Layout API

 HKL_PREV            EQU 0
 HKL_NEXT            EQU 1

 KLF_ACTIVATE        EQU 00000001h
 KLF_SUBSTITUTE_OK   EQU 00000002h
 KLF_REORDER         EQU 00000008h
 KLF_REPLACELANG     EQU 00000010h
 KLF_NOTELLSHELL     EQU 00000080h
 KLF_SETFORPROCESS   EQU 00000100h

; Size of KeyboardLayoutName (number of characters), including nul terminator

 KL_NAMELENGTH       EQU 9

; Values for resolution parameter of GetMouseMovePoints

 GMMP_USE_DISPLAY_POINTS          EQU 1
 GMMP_USE_HIGH_RESOLUTION_POINTS  EQU 2

; Desktop-specific access flags

 DESKTOP_READOBJECTS         EQU 0001h
 DESKTOP_CREATEWINDOW        EQU 0002h
 DESKTOP_CREATEMENU          EQU 0004h
 DESKTOP_HOOKCONTROL         EQU 0008h
 DESKTOP_JOURNALRECORD       EQU 0010h
 DESKTOP_JOURNALPLAYBACK     EQU 0020h
 DESKTOP_ENUMERATE           EQU 0040h
 DESKTOP_WRITEOBJECTS        EQU 0080h
 DESKTOP_SWITCHDESKTOP       EQU 0100h

; Desktop-specific control flags

 DF_ALLOWOTHERACCOUNTHOOK    EQU 0001

; Windowstation-specific access flags

 WINSTA_ENUMDESKTOPS         EQU 0001h
 WINSTA_READATTRIBUTES       EQU 0002h
 WINSTA_ACCESSCLIPBOARD      EQU 0004h
 WINSTA_CREATEDESKTOP        EQU 0008h
 WINSTA_WRITEATTRIBUTES      EQU 0010h
 WINSTA_ACCESSGLOBALATOMS    EQU 0020h
 WINSTA_EXITWINDOWS          EQU 0040h
 WINSTA_ENUMERATE            EQU 0100h
 WINSTA_READSCREEN           EQU 0200h

; Windowstation-specific attribute flags

 WSF_VISIBLE                 EQU 0001h

; Window field offsets for GetWindowLong()

 GWL_WNDPROC         EQU -4
 GWL_HINSTANCE       EQU -6
 GWL_HWNDPARENT      EQU -8
 GWL_STYLE           EQU -16
 GWL_EXSTYLE         EQU -20
 GWL_USERDATA        EQU -21
 GWL_ID              EQU -12

; Class field offsets for GetClassLong()

 GCL_MENUNAME        EQU -8
 GCL_HBRBACKGROUND   EQU -10
 GCL_HCURSOR         EQU -12
 GCL_HICON           EQU -14
 GCL_HMODULE         EQU -16
 GCL_CBWNDEXTRA      EQU -18
 GCL_CBCLSEXTRA      EQU -20
 GCL_WNDPROC         EQU -24
 GCL_STYLE           EQU -26
 GCW_ATOM            EQU -32
 GCL_HICONSM         EQU -34

; WM_ACTIVATE state values

 WA_INACTIVE     EQU 0
 WA_ACTIVE       EQU 1
 WA_CLICKACTIVE  EQU 2

; Window Messages

 WM_NULL                         EQU 0000h
 WM_CREATE                       EQU 0001h
 WM_DESTROY                      EQU 0002h
 WM_MOVE                         EQU 0003h
 WM_SIZE                         EQU 0005h
 WM_ACTIVATE                     EQU 0006h
 WM_SETFOCUS                     EQU 0007h
 WM_KILLFOCUS                    EQU 0008h
 WM_ENABLE                       EQU 000Ah
 WM_SETREDRAW                    EQU 000Bh
 WM_SETTEXT                      EQU 000Ch
 WM_GETTEXT                      EQU 000Dh
 WM_GETTEXTLENGTH                EQU 000Eh
 WM_PAINT                        EQU 000Fh
 WM_CLOSE                        EQU 0010h
 WM_QUERYENDSESSION              EQU 0011h
 WM_QUERYOPEN                    EQU 0013h
 WM_ENDSESSION                   EQU 0016h
 WM_QUIT                         EQU 0012h
 WM_ERASEBKGND                   EQU 0014h
 WM_SYSCOLORCHANGE               EQU 0015h
 WM_SHOWWINDOW                   EQU 0018h
 WM_WININICHANGE                 EQU 001Ah
 WM_SETTINGCHANGE                EQU WM_WININICHANGE
 WM_DEVMODECHANGE                EQU 001Bh
 WM_ACTIVATEAPP                  EQU 001Ch
 WM_FONTCHANGE                   EQU 001Dh
 WM_TIMECHANGE                   EQU 001Eh
 WM_CANCELMODE                   EQU 001Fh
 WM_SETCURSOR                    EQU 0020h
 WM_MOUSEACTIVATE                EQU 0021h
 WM_CHILDACTIVATE                EQU 0022h
 WM_QUEUESYNC                    EQU 0023h
 WM_GETMINMAXINFO                EQU 0024h
 WM_PAINTICON                    EQU 0026h
 WM_ICONERASEBKGND               EQU 0027h
 WM_NEXTDLGCTL                   EQU 0028h
 WM_SPOOLERSTATUS                EQU 002Ah
 WM_DRAWITEM                     EQU 002Bh
 WM_MEASUREITEM                  EQU 002Ch
 WM_DELETEITEM                   EQU 002Dh
 WM_VKEYTOITEM                   EQU 002Eh
 WM_CHARTOITEM                   EQU 002Fh
 WM_SETFONT                      EQU 0030h
 WM_GETFONT                      EQU 0031h
 WM_SETHOTKEY                    EQU 0032h
 WM_GETHOTKEY                    EQU 0033h
 WM_QUERYDRAGICON                EQU 0037h
 WM_COMPAREITEM                  EQU 0039h
 WM_GETOBJECT                    EQU 003Dh
 WM_COMPACTING                   EQU 0041h
 WM_WINDOWPOSCHANGING            EQU 0046h
 WM_WINDOWPOSCHANGED             EQU 0047h
 WM_POWER                        EQU 0048h
 WM_COPYDATA                     EQU 004Ah
 WM_CANCELJOURNAL                EQU 004Bh
 WM_NOTIFY                       EQU 004Eh
 WM_INPUTLANGCHANGEREQUEST       EQU 0050h
 WM_INPUTLANGCHANGE              EQU 0051h
 WM_TCARD                        EQU 0052h
 WM_HELP                         EQU 0053h
 WM_USERCHANGED                  EQU 0054h
 WM_NOTIFYFORMAT                 EQU 0055h
 WM_CONTEXTMENU                  EQU 007Bh
 WM_STYLECHANGING                EQU 007Ch
 WM_STYLECHANGED                 EQU 007Dh
 WM_DISPLAYCHANGE                EQU 007Eh
 WM_GETICON                      EQU 007Fh
 WM_SETICON                      EQU 0080h
 WM_NCCREATE                     EQU 0081h
 WM_NCDESTROY                    EQU 0082h
 WM_NCCALCSIZE                   EQU 0083h
 WM_NCHITTEST                    EQU 0084h
 WM_NCPAINT                      EQU 0085h
 WM_NCACTIVATE                   EQU 0086h
 WM_GETDLGCODE                   EQU 0087h
 WM_SYNCPAINT                    EQU 0088h
 WM_NCMOUSEMOVE                  EQU 00A0h
 WM_NCLBUTTONDOWN                EQU 00A1h
 WM_NCLBUTTONUP                  EQU 00A2h
 WM_NCLBUTTONDBLCLK              EQU 00A3h
 WM_NCRBUTTONDOWN                EQU 00A4h
 WM_NCRBUTTONUP                  EQU 00A5h
 WM_NCRBUTTONDBLCLK              EQU 00A6h
 WM_NCMBUTTONDOWN                EQU 00A7h
 WM_NCMBUTTONUP                  EQU 00A8h
 WM_NCMBUTTONDBLCLK              EQU 00A9h
 WM_KEYFIRST                     EQU 0100h
 WM_KEYDOWN                      EQU 0100h
 WM_KEYUP                        EQU 0101h
 WM_CHAR                         EQU 0102h
 WM_DEADCHAR                     EQU 0103h
 WM_SYSKEYDOWN                   EQU 0104h
 WM_SYSKEYUP                     EQU 0105h
 WM_SYSCHAR                      EQU 0106h
 WM_SYSDEADCHAR                  EQU 0107h
 WM_KEYLAST                      EQU 0108h
 WM_IME_STARTCOMPOSITION         EQU 010Dh
 WM_IME_ENDCOMPOSITION           EQU 010Eh
 WM_IME_COMPOSITION              EQU 010Fh
 WM_IME_KEYLAST                  EQU 010Fh
 WM_INITDIALOG                   EQU 0110h
 WM_COMMAND                      EQU 0111h
 WM_SYSCOMMAND                   EQU 0112h
 WM_TIMER                        EQU 0113h
 WM_HSCROLL                      EQU 0114h
 WM_VSCROLL                      EQU 0115h
 WM_INITMENU                     EQU 0116h
 WM_INITMENUPOPUP                EQU 0117h
 WM_MENUSELECT                   EQU 011Fh
 WM_MENUCHAR                     EQU 0120h
 WM_ENTERIDLE                    EQU 0121h
 WM_MENURBUTTONUP                EQU 0122h
 WM_MENUDRAG                     EQU 0123h
 WM_MENUGETOBJECT                EQU 0124h
 WM_UNINITMENUPOPUP              EQU 0125h
 WM_MENUCOMMAND                  EQU 0126h
 WM_KEYBOARDCUES                 EQU 0127h
 WM_CTLCOLORMSGBOX               EQU 0132h
 WM_CTLCOLOREDIT                 EQU 0133h
 WM_CTLCOLORLISTBOX              EQU 0134h
 WM_CTLCOLORBTN                  EQU 0135h
 WM_CTLCOLORDLG                  EQU 0136h
 WM_CTLCOLORSCROLLBAR            EQU 0137h
 WM_CTLCOLORSTATIC               EQU 0138h
 WM_MOUSEFIRST                   EQU 0200h
 WM_MOUSEMOVE                    EQU 0200h
 WM_LBUTTONDOWN                  EQU 0201h
 WM_LBUTTONUP                    EQU 0202h
 WM_LBUTTONDBLCLK                EQU 0203h
 WM_RBUTTONDOWN                  EQU 0204h
 WM_RBUTTONUP                    EQU 0205h
 WM_RBUTTONDBLCLK                EQU 0206h
 WM_MBUTTONDOWN                  EQU 0207h
 WM_MBUTTONUP                    EQU 0208h
 WM_MBUTTONDBLCLK                EQU 0209h
 WM_MOUSEWHEEL                   EQU 020Ah
 WM_MOUSELAST                    EQU 0209h
 WM_PARENTNOTIFY                 EQU 0210h
 WM_ENTERMENULOOP                EQU 0211h
 WM_EXITMENULOOP                 EQU 0212h
 WM_NEXTMENU                     EQU 0213h
 WM_SIZING                       EQU 0214h
 WM_CAPTURECHANGED               EQU 0215h
 WM_MOVING                       EQU 0216h
 WM_POWERBROADCAST               EQU 0218h
 WM_DEVICECHANGE                 EQU 0219h
 WM_MDICREATE                    EQU 0220h
 WM_MDIDESTROY                   EQU 0221h
 WM_MDIACTIVATE                  EQU 0222h
 WM_MDIRESTORE                   EQU 0223h
 WM_MDINEXT                      EQU 0224h
 WM_MDIMAXIMIZE                  EQU 0225h
 WM_MDITILE                      EQU 0226h
 WM_MDICASCADE                   EQU 0227h
 WM_MDIICONARRANGE               EQU 0228h
 WM_MDIGETACTIVE                 EQU 0229h
 WM_MDISETMENU                   EQU 0230h
 WM_ENTERSIZEMOVE                EQU 0231h
 WM_EXITSIZEMOVE                 EQU 0232h
 WM_DROPFILES                    EQU 0233h
 WM_MDIREFRESHMENU               EQU 0234h
 WM_IME_SETCONTEXT               EQU 0281h
 WM_IME_NOTIFY                   EQU 0282h
 WM_IME_CONTROL                  EQU 0283h
 WM_IME_COMPOSITIONFULL          EQU 0284h
 WM_IME_SELECT                   EQU 0285h
 WM_IME_CHAR                     EQU 0286h
 WM_IME_REQUEST                  EQU 0288h
 WM_IME_KEYDOWN                  EQU 0290h
 WM_IME_KEYUP                    EQU 0291h
 WM_MOUSEHOVER                   EQU 02A1h
 WM_MOUSELEAVE                   EQU 02A3h
 WM_NCMOUSEHOVER                 EQU 02A0h
 WM_NCMOUSELEAVE                 EQU 02A2h
 WM_CUT                          EQU 0300h
 WM_COPY                         EQU 0301h
 WM_PASTE                        EQU 0302h
 WM_CLEAR                        EQU 0303h
 WM_UNDO                         EQU 0304h
 WM_RENDERFORMAT                 EQU 0305h
 WM_RENDERALLFORMATS             EQU 0306h
 WM_DESTROYCLIPBOARD             EQU 0307h
 WM_DRAWCLIPBOARD                EQU 0308h
 WM_PAINTCLIPBOARD               EQU 0309h
 WM_VSCROLLCLIPBOARD             EQU 030Ah
 WM_SIZECLIPBOARD                EQU 030Bh
 WM_ASKCBFORMATNAME              EQU 030Ch
 WM_CHANGECBCHAIN                EQU 030Dh
 WM_HSCROLLCLIPBOARD             EQU 030Eh
 WM_QUERYNEWPALETTE              EQU 030Fh
 WM_PALETTEISCHANGING            EQU 0310h
 WM_PALETTECHANGED               EQU 0311h
 WM_HOTKEY                       EQU 0312h
 WM_PRINT                        EQU 0317h
 WM_PRINTCLIENT                  EQU 0318h
 WM_HANDHELDFIRST                EQU 0358h
 WM_HANDHELDLAST                 EQU 035Fh
 WM_AFXFIRST                     EQU 0360h
 WM_AFXLAST                      EQU 037Fh
 WM_PENWINFIRST                  EQU 0380h
 WM_PENWINLAST                   EQU 038Fh
 WM_APP                          EQU 8000h
 WM_USER                         EQU 0400h

; Windows Message Size

 WMSZ_LEFT           EQU 1
 WMSZ_RIGHT          EQU 2
 WMSZ_TOP            EQU 3
 WMSZ_TOPLEFT        EQU 4
 WMSZ_TOPRIGHT       EQU 5
 WMSZ_BOTTOM         EQU 6
 WMSZ_BOTTOMLEFT     EQU 7
 WMSZ_BOTTOMRIGHT    EQU 8

; wParam for WM_POWER window message and DRV_POWER driver notification

 PWR_OK              EQU 1
 PWR_FAIL            EQU -1
 PWR_SUSPENDREQUEST  EQU 1
 PWR_SUSPENDRESUME   EQU 2
 PWR_CRITICALRESUME  EQU 3

 NFR_ANSI            EQU 1
 NFR_UNICODE         EQU 2
 NF_QUERY            EQU 3
 NF_REQUERY          EQU 4

; LOWORD(wParam) in WM_KEYBOARDCUES

 KC_SHOW     EQU 1
 KC_HIDE     EQU 2
 KC_QUERY    EQU 3

; HIWORD(wParam) in WM_KEYBOARDCUES

 KCF_FOCUS   EQU 1
 KCF_ACCEL   EQU 2

 WHEEL_DELTA                     EQU 120        ;Value for rolling one detent
;WHEEL_PAGESCROLL                EQU (UINT_MAX) ;Scroll one page

; Advanced Power Management

 PBT_APMQUERYSUSPEND             EQU 0000h
 PBT_APMQUERYSTANDBY             EQU 0001h
 PBT_APMQUERYSUSPENDFAILED       EQU 0002h
 PBT_APMQUERYSTANDBYFAILED       EQU 0003h
 PBT_APMSUSPEND                  EQU 0004h
 PBT_APMSTANDBY                  EQU 0005h
 PBT_APMRESUMECRITICAL           EQU 0006h
 PBT_APMRESUMESUSPEND            EQU 0007h
 PBT_APMRESUMESTANDBY            EQU 0008h
 PBT_APMBATTERYLOW               EQU 0009h
 PBT_APMPOWERSTATUSCHANGE        EQU 000Ah
 PBT_APMOEMEVENT                 EQU 000Bh
 PBT_APMRESUMEAUTOMATIC          EQU 0012h

 PBTF_APMRESUMEFROMFAILURE       EQU 00000001

;MOUSEHOOKSTRUCT STRUC
;                pt           POINT <?>
;                mh_hwnd      DD ?
;                wHitTestCode DD ?
;                dwExtraInfo  DD ?
;MOUSEHOOKSTRUCT ENDS

; WM_NCHITTEST and MOUSEHOOKSTRUCT Mouse Position Codes

 HTERROR             EQU -2
 HTTRANSPARENT       EQU -1
 HTNOWHERE           EQU 0
 HTCLIENT            EQU 1
 HTCAPTION           EQU 2
 HTSYSMENU           EQU 3
 HTGROWBOX           EQU 4
 HTSIZE              EQU HTGROWBOX
 HTMENU              EQU 5
 HTHSCROLL           EQU 6
 HTVSCROLL           EQU 7
 HTMINBUTTON         EQU 8
 HTMAXBUTTON         EQU 9
 HTLEFT              EQU 10
 HTRIGHT             EQU 11
 HTTOP               EQU 12
 HTTOPLEFT           EQU 13
 HTTOPRIGHT          EQU 14
 HTBOTTOM            EQU 15
 HTBOTTOMLEFT        EQU 16
 HTBOTTOMRIGHT       EQU 17
 HTBORDER            EQU 18
 HTREDUCE            EQU HTMINBUTTON
 HTZOOM              EQU HTMAXBUTTON
 HTSIZEFIRST         EQU HTLEFT
 HTSIZELAST          EQU HTBOTTOMRIGHT
 HTOBJECT            EQU 19
 HTCLOSE             EQU 20
 HTHELP              EQU 21

; SendMessageTimeout values

 SMTO_NORMAL             EQU 0000h
 SMTO_BLOCK              EQU 0001h
 SMTO_ABORTIFHUNG        EQU 0002h
 SMTO_NOTIMEOUTIFNOTHUNG EQU 0008h

; WM_MOUSEACTIVATE Return Codes

 MA_ACTIVATE         EQU 1
 MA_ACTIVATEANDEAT   EQU 2
 MA_NOACTIVATE       EQU 3
 MA_NOACTIVATEANDEAT EQU 4

; WM_SETICON / WM_GETICON Type Codes

 ICON_SMALL          EQU 0
 ICON_BIG            EQU 1

; WM_SIZE message wParam values

 SIZE_RESTORED       EQU 0
 SIZE_MINIMIZED      EQU 1
 SIZE_MAXIMIZED      EQU 2
 SIZE_MAXSHOW        EQU 3
 SIZE_MAXHIDE        EQU 4

; WM_NCCALCSIZE "window valid rect" return values

 WVR_ALIGNTOP        EQU 0010h
 WVR_ALIGNLEFT       EQU 0020h
 WVR_ALIGNBOTTOM     EQU 0040h
 WVR_ALIGNRIGHT      EQU 0080h
 WVR_HREDRAW         EQU 0100h
 WVR_VREDRAW         EQU 0200h
 WVR_REDRAW          EQU (WVR_HREDRAW OR WVR_VREDRAW)
 WVR_VALIDRECTS      EQU 0400h

; Key State Masks for Mouse Messages

 MK_LBUTTON      EQU 0001h
 MK_RBUTTON      EQU 0002h
 MK_SHIFT        EQU 0004h
 MK_CONTROL      EQU 0008h
 MK_MBUTTON      EQU 0010h

 TME_HOVER       EQU 00000001h
 TME_LEAVE       EQU 00000002h
 TME_NONCLIENT   EQU 00000010h
 TME_QUERY       EQU 40000000h
 TME_CANCEL      EQU 80000000h

 HOVER_DEFAULT   EQU 0FFFFFFFFh

; Window styles

 WS_OVERLAPPED       EQU 00000000h
 WS_POPUP            EQU 80000000h
 WS_CHILD            EQU 40000000h
 WS_MINIMIZE         EQU 20000000h
 WS_VISIBLE          EQU 10000000h
 WS_DISABLED         EQU 08000000h
 WS_CLIPSIBLINGS     EQU 04000000h
 WS_CLIPCHILDREN     EQU 02000000h
 WS_MAXIMIZE         EQU 01000000h
 WS_CAPTION          EQU 00C00000h ;!!!!WS_BORDER OR WS_DLGFRAME
 WS_BORDER           EQU 00800000h
 WS_DLGFRAME         EQU 00400000h
 WS_VSCROLL          EQU 00200000h
 WS_HSCROLL          EQU 00100000h
 WS_SYSMENU          EQU 00080000h
 WS_THICKFRAME       EQU 00040000h
 WS_GROUP            EQU 00020000h
 WS_TABSTOP          EQU 00010000h
 WS_MINIMIZEBOX      EQU 00020000h
 WS_MAXIMIZEBOX      EQU 00010000h
 WS_TILED            EQU WS_OVERLAPPED
 WS_ICONIC           EQU WS_MINIMIZE
 WS_SIZEBOX          EQU WS_THICKFRAME
 WS_TILEDWINDOW      EQU WS_OVERLAPPEDWINDOW

 WS_OVERLAPPEDWINDOW EQU (WS_OVERLAPPED     OR \
                          WS_CAPTION        OR \
                          WS_SYSMENU        OR \
                          WS_THICKFRAME     OR \
                          WS_MINIMIZEBOX    OR \
                          WS_MAXIMIZEBOX)

 WS_POPUPWINDOW      EQU (WS_POPUP          OR \
                          WS_BORDER         OR \
                          WS_SYSMENU)

 WS_CHILDWINDOW      EQU WS_CHILD

; Extended Window Styles

 WS_EX_DLGMODALFRAME     EQU 00000001h
 WS_EX_NOPARENTNOTIFY    EQU 00000004h
 WS_EX_TOPMOST           EQU 00000008h
 WS_EX_ACCEPTFILES       EQU 00000010h
 WS_EX_TRANSPARENT       EQU 00000020h
 WS_EX_MDICHILD          EQU 00000040h
 WS_EX_TOOLWINDOW        EQU 00000080h
 WS_EX_WINDOWEDGE        EQU 00000100h
 WS_EX_CLIENTEDGE        EQU 00000200h
 WS_EX_CONTEXTHELP       EQU 00000400h
 WS_EX_RIGHT             EQU 00001000h
 WS_EX_LEFT              EQU 00000000h
 WS_EX_RTLREADING        EQU 00002000h
 WS_EX_LTRREADING        EQU 00000000h
 WS_EX_LEFTSCROLLBAR     EQU 00004000h
 WS_EX_RIGHTSCROLLBAR    EQU 00000000h
 WS_EX_CONTROLPARENT     EQU 00010000h
 WS_EX_STATICEDGE        EQU 00020000h
 WS_EX_APPWINDOW         EQU 00040000h
 WS_EX_OVERLAPPEDWINDOW  EQU (WS_EX_WINDOWEDGE OR WS_EX_CLIENTEDGE)
 WS_EX_PALETTEWINDOW     EQU (WS_EX_WINDOWEDGE OR WS_EX_TOOLWINDOW OR WS_EX_TOPMOST)
 WS_EX_LAYERED           EQU 00080000h
 WS_EX_NOINHERITLAYOUT   EQU 00100000h ; Disable inheritence of mirroring by children
 WS_EX_LAYOUTRTL         EQU 00400000h ; Right to left mirroring
 WS_EX_NOACTIVATE        EQU 08000000h
 ; Extended Window Styles (low words)
 WS_EX_DLGMODALFRAME  = 0001
 WS_EX_DRAGOBJECT     = 0002
 WS_EX_NOPARENTNOTIFY = 0004
 WS_EX_TOPMOST        = 0008

; Class styles

 CS_VREDRAW          EQU 0001h
 CS_HREDRAW          EQU 0002h
 CS_DBLCLKS          EQU 0008h
 CS_OWNDC            EQU 0020h
 CS_CLASSDC          EQU 0040h
 CS_PARENTDC         EQU 0080h
 CS_NOCLOSE          EQU 0200h
 CS_SAVEBITS         EQU 0800h
 CS_BYTEALIGNCLIENT  EQU 1000h
 CS_BYTEALIGNWINDOW  EQU 2000h
 CS_GLOBALCLASS      EQU 4000h
 CW_USEDEFAULT       EQU 8000h
 CS_IME              EQU 00010000h

;WM_PRINT flags

 PRF_CHECKVISIBLE    EQU 00000001h
 PRF_NONCLIENT       EQU 00000002h
 PRF_CLIENT          EQU 00000004h
 PRF_ERASEBKGND      EQU 00000008h
 PRF_CHILDREN        EQU 00000010h
 PRF_OWNED           EQU 00000020h

; 3D border styles

 BDR_RAISEDOUTER EQU 0001h
 BDR_SUNKENOUTER EQU 0002h
 BDR_RAISEDINNER EQU 0004h
 BDR_SUNKENINNER EQU 0008h
 BDR_OUTER       EQU (BDR_RAISEDOUTER OR BDR_SUNKENOUTER)
 BDR_INNER       EQU (BDR_RAISEDINNER OR BDR_SUNKENINNER)
 BDR_RAISED      EQU (BDR_RAISEDOUTER OR BDR_RAISEDINNER)
 BDR_SUNKEN      EQU (BDR_SUNKENOUTER OR BDR_SUNKENINNER)
 EDGE_RAISED     EQU (BDR_RAISEDOUTER OR BDR_RAISEDINNER)
 EDGE_SUNKEN     EQU (BDR_SUNKENOUTER OR BDR_SUNKENINNER)
 EDGE_ETCHED     EQU (BDR_SUNKENOUTER OR BDR_RAISEDINNER)
 EDGE_BUMP       EQU (BDR_RAISEDOUTER OR BDR_SUNKENINNER)

; Border flags

 BF_LEFT         EQU 0001h
 BF_TOP          EQU 0002h
 BF_RIGHT        EQU 0004h
 BF_BOTTOM       EQU 0008h
 BF_TOPLEFT      EQU (BF_TOP OR BF_LEFT)
 BF_TOPRIGHT     EQU (BF_TOP OR BF_RIGHT)
 BF_BOTTOMLEFT   EQU (BF_BOTTOM OR BF_LEFT)
 BF_BOTTOMRIGHT  EQU (BF_BOTTOM OR BF_RIGHT)
 BF_RECT         EQU (BF_LEFT OR BF_TOP OR BF_RIGHT OR BF_BOTTOM)
 BF_DIAGONAL     EQU 0010

; For diagonal lines, the BF_RECT flags specify the end point of the
; vector bounded by the rectangle parameter.

 BF_DIAGONAL_ENDTOPRIGHT     EQU (BF_DIAGONAL OR BF_TOP OR BF_RIGHT)
 BF_DIAGONAL_ENDTOPLEFT      EQU (BF_DIAGONAL OR BF_TOP OR BF_LEFT)
 BF_DIAGONAL_ENDBOTTOMLEFT   EQU (BF_DIAGONAL OR BF_BOTTOM OR BF_LEFT)
 BF_DIAGONAL_ENDBOTTOMRIGHT  EQU (BF_DIAGONAL OR BF_BOTTOM OR BF_RIGHT)

 BF_MIDDLE       EQU 0800h ;Fill in the middle
 BF_SOFT         EQU 1000h ;For softer buttons
 BF_ADJUST       EQU 2000h ;Calculate the space left over
 BF_FLAT         EQU 4000h ;For flat rather than 3D borders
 BF_MONO         EQU 8000h ;For monochrome borders

; flags for DrawFrameControl

 DFC_CAPTION             EQU 1
 DFC_MENU                EQU 2
 DFC_SCROLL              EQU 3
 DFC_BUTTON              EQU 4
 DFC_POPUPMENU           EQU 5
 DFCS_CAPTIONCLOSE       EQU 0000h
 DFCS_CAPTIONMIN         EQU 0001h
 DFCS_CAPTIONMAX         EQU 0002h
 DFCS_CAPTIONRESTORE     EQU 0003h
 DFCS_CAPTIONHELP        EQU 0004h
 DFCS_MENUARROW          EQU 0000h
 DFCS_MENUCHECK          EQU 0001h
 DFCS_MENUBULLET         EQU 0002h
 DFCS_MENUARROWRIGHT     EQU 0004h
 DFCS_SCROLLUP           EQU 0000h
 DFCS_SCROLLDOWN         EQU 0001h
 DFCS_SCROLLLEFT         EQU 0002h
 DFCS_SCROLLRIGHT        EQU 0003h
 DFCS_SCROLLCOMBOBOX     EQU 0005h
 DFCS_SCROLLSIZEGRIP     EQU 0008h
 DFCS_SCROLLSIZEGRIPRIGHT EQU 0010h
 DFCS_BUTTONCHECK        EQU 0000h
 DFCS_BUTTONRADIOIMAGE   EQU 0001h
 DFCS_BUTTONRADIOMASK    EQU 0002h
 DFCS_BUTTONRADIO        EQU 0004h
 DFCS_BUTTON3STATE       EQU 0008h
 DFCS_BUTTONPUSH         EQU 0010h
 DFCS_INACTIVE           EQU 0100h
 DFCS_PUSHED             EQU 0200h
 DFCS_CHECKED            EQU 0400h
 DFCS_TRANSPARENT        EQU 0800h
 DFCS_HOT                EQU 1000h
 DFCS_ADJUSTRECT         EQU 2000h
 DFCS_FLAT               EQU 4000h
 DFCS_MONO               EQU 8000h

; flags for DrawCaption

 DC_ACTIVE           EQU 0001h
 DC_SMALLCAP         EQU 0002h
 DC_ICON             EQU 0004h
 DC_TEXT             EQU 0008h
 DC_INBUTTON         EQU 0010h
 DC_GRADIENT         EQU 0020h
 IDANI_OPEN          EQU 1

; Predefined Clipboard Formats

 CF_TEXT             EQU 1
 CF_BITMAP           EQU 2
 CF_METAFILEPICT     EQU 3
 CF_SYLK             EQU 4
 CF_DIF              EQU 5
 CF_TIFF             EQU 6
 CF_OEMTEXT          EQU 7
 CF_DIB              EQU 8
 CF_PALETTE          EQU 9
 CF_PENDATA          EQU 10
 CF_RIFF             EQU 11
 CF_WAVE             EQU 12
 CF_UNICODETEXT      EQU 13
 CF_ENHMETAFILE      EQU 14
 CF_HDROP            EQU 15
 CF_LOCALE           EQU 16
 CF_DIBV5            EQU 17
 CF_MAX              EQU 18
 CF_OWNERDISPLAY     EQU 0080h
 CF_DSPTEXT          EQU 0081h
 CF_DSPBITMAP        EQU 0082h
 CF_DSPMETAFILEPICT  EQU 0083h
 CF_DSPENHMETAFILE   EQU 008Eh
 CF_PRIVATEFIRST     EQU 0200h
 CF_PRIVATELAST      EQU 02FFh
 CF_GDIOBJFIRST      EQU 0300h
 CF_GDIOBJLAST       EQU 03FFh

; Defines for the fVirt field of the Accelerator table structure.

 FVIRTKEY  EQU TRUE
 FNOINVERT EQU 02h
 FSHIFT    EQU 04h
 FCONTROL  EQU 08h
 FALT      EQU 10h

; Owner draw control types

 ODT_MENU        EQU 1
 ODT_LISTBOX     EQU 2
 ODT_COMBOBOX    EQU 3
 ODT_BUTTON      EQU 4
 ODT_STATIC      EQU 5

; Owner draw actions

 ODA_DRAWENTIRE  EQU 0001h
 ODA_SELECT      EQU 0002h
 ODA_FOCUS       EQU 0004h

; Owner draw state

 ODS_SELECTED        EQU 0001h
 ODS_GRAYED          EQU 0002h
 ODS_DISABLED        EQU 0004h
 ODS_CHECKED         EQU 0008h
 ODS_FOCUS           EQU 0010h
 ODS_DEFAULT         EQU 0020h
 ODS_COMBOBOXEDIT    EQU 1000h
 ODS_HOTLIGHT        EQU 0040h
 ODS_INACTIVE        EQU 0080h
 ODS_NOACCEL         EQU 0100h
 ODS_NOFOCUSRECT     EQU 0200h

; PeekMessage() Options

 PM_NOREMOVE         EQU 0000h
 PM_REMOVE           EQU 0001h
 PM_NOYIELD          EQU 0002h
 PM_QS_INPUT         EQU QS_INPUT shl 16
 PM_QS_POSTMESSAGE   EQU (QS_POSTMESSAGE OR QS_HOTKEY OR QS_TIMER) shl 16
 PM_QS_PAINT         EQU QS_PAINT shl 16
 PM_QS_SENDMESSAGE   EQU QS_SENDMESSAGE shl 16

 MOD_ALT             EQU 0001h
 MOD_CONTROL         EQU 0002h
 MOD_SHIFT           EQU 0004h
 MOD_WIN             EQU 0008h

 IDHOT_SNAPWINDOW    EQU (-1)     SHIFT-PRINTSCRN
 IDHOT_SNAPDESKTOP   EQU (-2)     PRINTSCRN

; End Windows Flags

 ENDSESSION_LOGOFF   EQU 80000000h
 EWX_LOGOFF          EQU 0
 EWX_SHUTDOWN        EQU 00000001h
 EWX_REBOOT          EQU 00000002h
 EWX_FORCE           EQU 00000004h
 EWX_POWEROFF        EQU 00000008h
 EWX_FORCEIFHUNG     EQU 00000010h

;Broadcast Special Message Recipient list

 BSM_ALLCOMPONENTS       EQU 00000000h
 BSM_VXDS                EQU 00000001h
 BSM_NETDRIVER           EQU 00000002h
 BSM_INSTALLABLEDRIVERS  EQU 00000004h
 BSM_APPLICATIONS        EQU 00000008h
 BSM_ALLDESKTOPS         EQU 00000010h

;Broadcast Special Message Flags

 BSF_QUERY               EQU 00000001h
 BSF_IGNORECURRENTTASK   EQU 00000002h
 BSF_FLUSHDISK           EQU 00000004h
 BSF_NOHANG              EQU 00000008h
 BSF_POSTMESSAGE         EQU 00000010h
 BSF_FORCEIFHUNG         EQU 00000020h
 BSF_NOTIMEOUTIFNOTHUNG  EQU 00000040h
 BSF_ALLOWSFW            EQU 00000080h

 BROADCAST_QUERY_DENY    EQU 424D5144h  ; Return this value to deny a query.

; RegisterDeviceNotification

 DEVICE_NOTIFY_WINDOW_HANDLE     EQU 00000000h
 DEVICE_NOTIFY_SERVICE_HANDLE    EQU 00000001h

; InSendMessageEx return value

 ISMEX_NOSEND      EQU 00000000h
 ISMEX_SEND        EQU 00000001h
 ISMEX_NOTIFY      EQU 00000002h
 ISMEX_CALLBACK    EQU 00000004h
 ISMEX_REPLIED     EQU 00000008h

 FLASHW_STOP         EQU 0
 FLASHW_CAPTION      EQU 00000001h
 FLASHW_TRAY         EQU 00000002h
 FLASHW_ALL          EQU (FLASHW_CAPTION OR FLASHW_TRAY)
 FLASHW_TIMER        EQU 00000004h
 FLASHW_TIMERNOFG    EQU 0000000Ch

; SetWindowPos Flags

 SWP_NOSIZE          EQU 0001h
 SWP_NOMOVE          EQU 0002h
 SWP_NOZORDER        EQU 0004h
 SWP_NOREDRAW        EQU 0008h
 SWP_NOACTIVATE      EQU 0010h
 SWP_FRAMECHANGED    EQU 0020h ;  The frame changed: send WM_NCCALCSIZE
 SWP_SHOWWINDOW      EQU 0040h
 SWP_HIDEWINDOW      EQU 0080h
 SWP_NOCOPYBITS      EQU 0100h
 SWP_NOOWNERZORDER   EQU 0200h ;  Don't do owner Z ordering
 SWP_NOSENDCHANGING  EQU 0400h ;   Don't send WM_WINDOWPOSCHANGING
 SWP_DRAWFRAME       EQU SWP_FRAMECHANGED
 SWP_NOREPOSITION    EQU SWP_NOOWNERZORDER
 SWP_DEFERERASE      EQU 2000h
 SWP_ASYNCWINDOWPOS  EQU 4000h

 HWND_TOP        EQU  0
 HWND_BOTTOM     EQU  1
 HWND_TOPMOST    EQU -1
 HWND_NOTOPMOST  EQU -2

; Mouse event flags

 MOUSEEVENTF_MOVE        EQU 0001h;  mouse move
 MOUSEEVENTF_LEFTDOWN    EQU 0002h;  left button down
 MOUSEEVENTF_LEFTUP      EQU 0004h;  left button up
 MOUSEEVENTF_RIGHTDOWN   EQU 0008h;  right button down
 MOUSEEVENTF_RIGHTUP     EQU 0010h;  right button up
 MOUSEEVENTF_MIDDLEDOWN  EQU 0020h;  middle button down
 MOUSEEVENTF_MIDDLEUP    EQU 0040h;  middle button up
 MOUSEEVENTF_WHEEL       EQU 0800h;  wheel button rolled
 MOUSEEVENTF_VIRTUALDESK EQU 4000h;  map to entire virtual desktop
 MOUSEEVENTF_ABSOLUTE    EQU 8000h;  absolute move

 INPUT_MOUSE     EQU 0
 INPUT_KEYBOARD  EQU 1
 INPUT_HARDWARE  EQU 2

 MWMO_WAITALL        EQU 0001h
 MWMO_ALERTABLE      EQU 0002h
 MWMO_INPUTAVAILABLE EQU 0004h

;       TBBUTTON

TBBUTTON struc
    iBitmap UINT ?
    idCommand UINT ?
    fsState UCHAR ?
    fsStyle UCHAR ?
    bReserved db 2 dup(?)
    dwData ULONG ?
    iString UINT ?
TBBUTTON ends


; Queue status flags for GetQueueStatus() and MsgWaitForMultipleObjects()

 QS_KEY              EQU 0001h
 QS_MOUSEMOVE        EQU 0002h
 QS_MOUSEBUTTON      EQU 0004h
 QS_POSTMESSAGE      EQU 0008h
 QS_TIMER            EQU 0010h
 QS_PAINT            EQU 0020h
 QS_SENDMESSAGE      EQU 0040h
 QS_HOTKEY           EQU 0080h
 QS_ALLPOSTMESSAGE   EQU 0100h
 QS_MOUSE            EQU (QS_MOUSEMOVE     OR \
                          QS_MOUSEBUTTON)

 QS_INPUT            EQU (QS_MOUSE         OR \
                          QS_KEY)

 QS_ALLEVENTS        EQU (QS_INPUT         OR \
                          QS_POSTMESSAGE   OR \
                          QS_TIMER         OR \
                          QS_PAINT         OR \
                          QS_HOTKEY)

 QS_ALLINPUT         EQU (QS_INPUT         OR \
                          QS_POSTMESSAGE   OR \
                          QS_TIMER         OR \
                          QS_PAINT         OR \
                          QS_HOTKEY        OR \
                          QS_SENDMESSAGE)

; GetSystemMetrics() codes

 SM_CXSCREEN             EQU 0
 SM_CYSCREEN             EQU 1
 SM_CXVSCROLL            EQU 2
 SM_CYHSCROLL            EQU 3
 SM_CYCAPTION            EQU 4
 SM_CXBORDER             EQU 5
 SM_CYBORDER             EQU 6
 SM_CXDLGFRAME           EQU 7
 SM_CYDLGFRAME           EQU 8
 SM_CYVTHUMB             EQU 9
 SM_CXHTHUMB             EQU 10
 SM_CXICON               EQU 11
 SM_CYICON               EQU 12
 SM_CXCURSOR             EQU 13
 SM_CYCURSOR             EQU 14
 SM_CYMENU               EQU 15
 SM_CXFULLSCREEN         EQU 16
 SM_CYFULLSCREEN         EQU 17
 SM_CYKANJIWINDOW        EQU 18
 SM_MOUSEPRESENT         EQU 19
 SM_CYVSCROLL            EQU 20
 SM_CXHSCROLL            EQU 21
 SM_DEBUG                EQU 22
 SM_SWAPBUTTON           EQU 23
 SM_RESERVED1            EQU 24
 SM_RESERVED2            EQU 25
 SM_RESERVED3            EQU 26
 SM_RESERVED4            EQU 27
 SM_CXMIN                EQU 28
 SM_CYMIN                EQU 29
 SM_CXSIZE               EQU 30
 SM_CYSIZE               EQU 31
 SM_CXFRAME              EQU 32
 SM_CYFRAME              EQU 33
 SM_CXMINTRACK           EQU 34
 SM_CYMINTRACK           EQU 35
 SM_CXDOUBLECLK          EQU 36
 SM_CYDOUBLECLK          EQU 37
 SM_CXICONSPACING        EQU 38
 SM_CYICONSPACING        EQU 39
 SM_MENUDROPALIGNMENT    EQU 40
 SM_PENWINDOWS           EQU 41
 SM_DBCSENABLED          EQU 42
 SM_CMOUSEBUTTONS        EQU 43
 SM_CXFIXEDFRAME         EQU SM_CXDLGFRAME   ;win40 name change
 SM_CYFIXEDFRAME         EQU SM_CYDLGFRAME   ;win40 name change
 SM_CXSIZEFRAME          EQU SM_CXFRAME      ;win40 name change
 SM_CYSIZEFRAME          EQU SM_CYFRAME      ;win40 name change
 SM_SECURE               EQU 44
 SM_CXEDGE               EQU 45
 SM_CYEDGE               EQU 46
 SM_CXMINSPACING         EQU 47
 SM_CYMINSPACING         EQU 48
 SM_CXSMICON             EQU 49
 SM_CYSMICON             EQU 50
 SM_CYSMCAPTION          EQU 51
 SM_CXSMSIZE             EQU 52
 SM_CYSMSIZE             EQU 53
 SM_CXMENUSIZE           EQU 54
 SM_CYMENUSIZE           EQU 55
 SM_ARRANGE              EQU 56
 SM_CXMINIMIZED          EQU 57
 SM_CYMINIMIZED          EQU 58
 SM_CXMAXTRACK           EQU 59
 SM_CYMAXTRACK           EQU 60
 SM_CXMAXIMIZED          EQU 61
 SM_CYMAXIMIZED          EQU 62
 SM_NETWORK              EQU 63
 SM_CLEANBOOT            EQU 67
 SM_CXDRAG               EQU 68
 SM_CYDRAG               EQU 69
 SM_SHOWSOUNDS           EQU 70
 SM_CXMENUCHECK          EQU 71 ;   Use instead of GetMenuCheckMarkDimensions()!
 SM_CYMENUCHECK          EQU 72
 SM_SLOWMACHINE          EQU 73
 SM_MIDEASTENABLED       EQU 74
 SM_MOUSEWHEELPRESENT    EQU 75
 SM_XVIRTUALSCREEN       EQU 76
 SM_YVIRTUALSCREEN       EQU 77
 SM_CXVIRTUALSCREEN      EQU 78
 SM_CYVIRTUALSCREEN      EQU 79
 SM_CMONITORS            EQU 80
 SM_SAMEDISPLAYFORMAT    EQU 81
 SM_CMETRICS             EQU 76
 SM_REMOTESESSION        EQU 1000

; return codes for WM_MENUCHAR

 MNC_IGNORE  EQU 0
 MNC_CLOSE   EQU 1
 MNC_EXECUTE EQU 2
 MNC_SELECT  EQU 3

 MNS_NOCHECK         EQU 80000000h
 MNS_MODELESS        EQU 40000000h
 MNS_DRAGDROP        EQU 20000000h
 MNS_AUTODISMISS     EQU 10000000h
 MNS_NOTIFYBYPOS     EQU 08000000h
 MNS_CHECKORBMP      EQU 04000000h

 MIM_MAXHEIGHT               EQU 00000001h
 MIM_BACKGROUND              EQU 00000002h
 MIM_HELPID                  EQU 00000004h
 MIM_MENUDATA                EQU 00000008h
 MIM_STYLE                   EQU 00000010h
 MIM_APPLYTOSUBMENUS         EQU 80000000h

; WM_MENUDRAG return values.

 MND_CONTINUE       EQU 0
 MND_ENDMENU        EQU 1

; WM_MENUGETOBJECT return values

 MNGO_NOINTERFACE     EQU 00000000h
 MNGO_NOERROR         EQU 00000001h

 MIIM_STATE       EQU 00000001h
 MIIM_ID          EQU 00000002h
 MIIM_SUBMENU     EQU 00000004h
 MIIM_CHECKMARKS  EQU 00000008h
 MIIM_TYPE        EQU 00000010h
 MIIM_DATA        EQU 00000020h
 MIIM_STRING      EQU 00000040h
 MIIM_BITMAP      EQU 00000080h
 MIIM_FTYPE       EQU 00000100h

 HBMMENU_CALLBACK            EQU -1
 HBMMENU_SYSTEM              EQU 1
 HBMMENU_MBAR_RESTORE        EQU 2
 HBMMENU_MBAR_MINIMIZE       EQU 3
 HBMMENU_MBAR_CLOSE          EQU 5
 HBMMENU_MBAR_CLOSE_D        EQU 6
 HBMMENU_MBAR_MINIMIZE_D     EQU 7
 HBMMENU_POPUP_CLOSE         EQU 8
 HBMMENU_POPUP_RESTORE       EQU 9
 HBMMENU_POPUP_MAXIMIZE      EQU 10
 HBMMENU_POPUP_MINIMIZE      EQU 11

 GMDI_USEDISABLED    EQU 0001h
 GMDI_GOINTOPOPUPS   EQU 0002h

; Flags for TrackPopupMenu

 TPM_LEFTBUTTON      EQU 0000h
 TPM_RIGHTBUTTON     EQU 0002h
 TPM_LEFTALIGN       EQU 0000h
 TPM_CENTERALIGN     EQU 0004h
 TPM_RIGHTALIGN      EQU 0008h
 TPM_TOPALIGN        EQU 0000h
 TPM_VCENTERALIGN    EQU 0010h
 TPM_BOTTOMALIGN     EQU 0020h
 TPM_HORIZONTAL      EQU 0000h;       Horz alignment matters more
 TPM_VERTICAL        EQU 0040h;       Vert alignment matters more
 TPM_NONOTIFY        EQU 0080h;       Don't send any notification msgs
 TPM_RETURNCMD       EQU 0100h
 TPM_RECURSE         EQU 0001h
 TPM_HORPOSANIMATION EQU 0400h
 TPM_HORNEGANIMATION EQU 0800h
 TPM_VERPOSANIMATION EQU 1000h
 TPM_VERNEGANIMATION EQU 2000h
 TPM_NOANIMATION     EQU 4000h

; DrawText() Format Flags

 DT_TOP                      EQU 00000000h
 DT_LEFT                     EQU 00000000h
 DT_CENTER                   EQU 00000001h
 DT_RIGHT                    EQU 00000002h
 DT_VCENTER                  EQU 00000004h
 DT_BOTTOM                   EQU 00000008h
 DT_WORDBREAK                EQU 00000010h
 DT_SINGLELINE               EQU 00000020h
 DT_EXPANDTABS               EQU 00000040h
 DT_TABSTOP                  EQU 00000080h
 DT_NOCLIP                   EQU 00000100h
 DT_EXTERNALLEADING          EQU 00000200h
 DT_CALCRECT                 EQU 00000400h
 DT_NOPREFIX                 EQU 00000800h
 DT_INTERNAL                 EQU 00001000h
 DT_EDITCONTROL              EQU 00002000h
 DT_PATH_ELLIPSIS            EQU 00004000h
 DT_END_ELLIPSIS             EQU 00008000h
 DT_MODIFYSTRING             EQU 00010000h
 DT_RTLREADING               EQU 00020000h
 DT_WORD_ELLIPSIS            EQU 00040000h
 DT_NOFULLWIDTHCHARBREAK     EQU 00080000h
 DT_HIDEPREFIX               EQU 00100000h
 DT_PREFIXONLY               EQU 00200000h

; Monolithic state-drawing routine
; Image type

 DST_COMPLEX     EQU 0000h
 DST_TEXT        EQU 0001h
 DST_PREFIXTEXT  EQU 0002h
 DST_ICON        EQU 0003h
 DST_BITMAP      EQU 0004h

; State type

 DSS_NORMAL      EQU 0000h
 DSS_UNION       EQU 0010h;   Gray string appearance
 DSS_DISABLED    EQU 0020h
 DSS_MONO        EQU 0080h
 DSS_HIDEPREFIX  EQU 0200h
 DSS_PREFIXONLY  EQU 0400h
 DSS_RIGHT       EQU 8000h

; GetDCEx() flags

 DCX_WINDOW           EQU 00000001h
 DCX_CACHE            EQU 00000002h
 DCX_NORESETATTRS     EQU 00000004h
 DCX_CLIPCHILDREN     EQU 00000008h
 DCX_CLIPSIBLINGS     EQU 00000010h
 DCX_PARENTCLIP       EQU 00000020h
 DCX_EXCLUDERGN       EQU 00000040h
 DCX_INTERSECTRGN     EQU 00000080h
 DCX_EXCLUDEUPDATE    EQU 00000100h
 DCX_INTERSECTUPDATE  EQU 00000200h
 DCX_LOCKWINDOWUPDATE EQU 00000400h
 DCX_VALIDATE         EQU 00200000h

; RedrawWindow() flags

 RDW_INVALIDATE          EQU 0001h
 RDW_INTERNALPAINT       EQU 0002h
 RDW_ERASE               EQU 0004h
 RDW_VALIDATE            EQU 0008h
 RDW_NOINTERNALPAINT     EQU 0010h
 RDW_NOERASE             EQU 0020h
 RDW_NOCHILDREN          EQU 0040h
 RDW_ALLCHILDREN         EQU 0080h
 RDW_UPDATENOW           EQU 0100h
 RDW_ERASENOW            EQU 0200h
 RDW_FRAME               EQU 0400h
 RDW_NOFRAME             EQU 0800h

; EnableScrollBar() flags

 ESB_ENABLE_BOTH     EQU 0000h
 ESB_DISABLE_BOTH    EQU 0003h
 ESB_DISABLE_LEFT    EQU 0001h
 ESB_DISABLE_RIGHT   EQU 0002h
 ESB_DISABLE_UP      EQU 0001h
 ESB_DISABLE_DOWN    EQU 0002h
 ESB_DISABLE_LTUP    EQU ESB_DISABLE_LEFT
 ESB_DISABLE_RTDN    EQU ESB_DISABLE_RIGHT

; MessageBox() Flags

 MB_OK                       EQU 00000000h
 MB_OKCANCEL                 EQU 00000001h
 MB_ABORTRETRYIGNORE         EQU 00000002h
 MB_YESNOCANCEL              EQU 00000003h
 MB_YESNO                    EQU 00000004h
 MB_RETRYCANCEL              EQU 00000005h
 MB_ICONHAND                 EQU 00000010h
 MB_ICONQUESTION             EQU 00000020h
 MB_ICONEXCLAMATION          EQU 00000030h
 MB_ICONASTERISK             EQU 00000040h
 MB_USERICON                 EQU 00000080h
 MB_ICONWARNING              EQU MB_ICONEXCLAMATION
 MB_ICONERROR                EQU MB_ICONHAND
 MB_ICONINFORMATION          EQU MB_ICONASTERISK
 MB_ICONSTOP                 EQU MB_ICONHAND
 MB_DEFBUTTON1               EQU 00000000h
 MB_DEFBUTTON2               EQU 00000100h
 MB_DEFBUTTON3               EQU 00000200h
 MB_DEFBUTTON4               EQU 00000300h
 MB_APPLMODAL                EQU 00000000h
 MB_SYSTEMMODAL              EQU 00001000h
 MB_TASKMODAL                EQU 00002000h
 MB_HELP                     EQU 00004000h
 MB_NOFOCUS                  EQU 00008000h
 MB_SETFOREGROUND            EQU 00010000h
 MB_DEFAULT_DESKTOP_ONLY     EQU 00020000h
 MB_TOPMOST                  EQU 00040000h
 MB_RIGHT                    EQU 00080000h
 MB_RTLREADING               EQU 00100000h
 MB_TYPEMASK                 EQU 0000000Fh
 MB_ICONMASK                 EQU 000000F0h
 MB_DEFMASK                  EQU 00000F00h
 MB_MODEMASK                 EQU 00003000h
 MB_MISCMASK                 EQU 0000C000h

 CWP_ALL             EQU 0000h
 CWP_SKIPINVISIBLE   EQU 0001h
 CWP_SKIPDISABLED    EQU 0002h
 CWP_SKIPTRANSPARENT EQU 0004h

; Shell definitions

 NIM_ADD      EQU   00000000h
 NIM_MODIFY   EQU   00000001h
 NIM_DELETE   EQU   00000002h
 NIM_SETFOCUS EQU   00000003h

 NIF_MESSAGE  EQU   00000001h
 NIF_ICON     EQU   00000002h
 NIF_TIP      EQU   00000004h
 NIF_STATE    EQU   00000008h

 NIS_HIDDEN     EQU 00000001h
 NIS_SHAREDICON EQU 00000002h

NOTIFYICONDATA  STRUC
                cbSize DD SIZE NOTIFYICONDATA
                hWnd   DD 0
                uID    DD 0
                uNIFlags DD 0
                uCallbackMessage DD 0
                hIcon  DD 0
                szTip  DB 64 DUP(0)
NOTIFYICONDATA  ENDS


; Color Types

 CTLCOLOR_MSGBOX         EQU 0
 CTLCOLOR_EDIT           EQU 1
 CTLCOLOR_LISTBOX        EQU 2
 CTLCOLOR_BTN            EQU 3
 CTLCOLOR_DLG            EQU 4
 CTLCOLOR_SCROLLBAR      EQU 5
 CTLCOLOR_STATIC         EQU 6
 CTLCOLOR_MAX            EQU 7
 COLOR_SCROLLBAR         EQU 0
 COLOR_BACKGROUND        EQU 1
 COLOR_ACTIVECAPTION     EQU 2
 COLOR_INACTIVECAPTION   EQU 3
 COLOR_MENU              EQU 4
 COLOR_WINDOW            EQU 5
 COLOR_WINDOWFRAME       EQU 6
 COLOR_MENUTEXT          EQU 7
 COLOR_WINDOWTEXT        EQU 8
 COLOR_CAPTIONTEXT       EQU 9
 COLOR_ACTIVEBORDER      EQU 10
 COLOR_INACTIVEBORDER    EQU 11
 COLOR_APPWORKSPACE      EQU 12
 COLOR_HIGHLIGHT         EQU 13
 COLOR_HIGHLIGHTTEXT     EQU 14
 COLOR_BTNFACE           EQU 15
 COLOR_BTNSHADOW         EQU 16
 COLOR_GRAYTEXT          EQU 17
 COLOR_BTNTEXT           EQU 18
 COLOR_INACTIVECAPTIONTEXT EQU 19
 COLOR_BTNHIGHLIGHT      EQU 20
 COLOR_3DDKSHADOW        EQU 21
 COLOR_3DLIGHT           EQU 22
 COLOR_INFOTEXT          EQU 23
 COLOR_INFOBK            EQU 24
 COLOR_HOTLIGHT          EQU 26
 COLOR_GRADIENTACTIVECAPTION EQU 27
 COLOR_GRADIENTINACTIVECAPTION EQU 28
 COLOR_DESKTOP           EQU COLOR_BACKGROUND
 COLOR_3DFACE            EQU COLOR_BTNFACE
 COLOR_3DSHADOW          EQU COLOR_BTNSHADOW
 COLOR_3DHIGHLIGHT       EQU COLOR_BTNHIGHLIGHT
 COLOR_3DHILIGHT         EQU COLOR_BTNHIGHLIGHT
 COLOR_BTNHILIGHT        EQU COLOR_BTNHIGHLIGHT

; GetWindow() Constants

 GW_HWNDFIRST        EQU 0
 GW_HWNDLAST         EQU 1
 GW_HWNDNEXT         EQU 2
 GW_HWNDPREV         EQU 3
 GW_OWNER            EQU 4
 GW_CHILD            EQU 5
 GW_MAX              EQU 5
 GW_ENABLEDPOPUP     EQU 6

; Menu flags for Add/Check/EnableMenuItem()

 MF_INSERT           EQU 00000000h
 MF_CHANGE           EQU 00000080h
 MF_APPEND           EQU 00000100h
 MF_DELETE           EQU 00000200h
 MF_REMOVE           EQU 00001000h
 MF_BYCOMMAND        EQU 00000000h
 MF_BYPOSITION       EQU 00000400h
 MF_SEPARATOR        EQU 00000800h
 MF_ENABLED          EQU 00000000h
 MF_GRAYED           EQU 00000001h
 MF_DISABLED         EQU 00000002h
 MF_UNCHECKED        EQU 00000000h
 MF_CHECKED          EQU 00000008h
 MF_USECHECKBITMAPS  EQU 00000200h
 MF_STRING           EQU 00000000h
 MF_BITMAP           EQU 00000004h
 MF_OWNERDRAW        EQU 00000100h
 MF_POPUP            EQU 00000010h
 MF_MENUBARBREAK     EQU 00000020h
 MF_MENUBREAK        EQU 00000040h
 MF_UNHILITE         EQU 00000000h
 MF_HILITE           EQU 00000080h
 MF_DEFAULT          EQU 00001000h
 MF_SYSMENU          EQU 00002000h
 MF_HELP             EQU 00004000h
 MF_RIGHTJUSTIFY     EQU 00004000h
 MF_MOUSESELECT      EQU 00008000h

 MFT_STRING          EQU MF_STRING
 MFT_BITMAP          EQU MF_BITMAP
 MFT_MENUBARBREAK    EQU MF_MENUBARBREAK
 MFT_MENUBREAK       EQU MF_MENUBREAK
 MFT_OWNERDRAW       EQU MF_OWNERDRAW
 MFT_RADIOCHECK      EQU 00000200h
 MFT_SEPARATOR       EQU MF_SEPARATOR
 MFT_RIGHTORDER      EQU 00002000h
 MFT_RIGHTJUSTIFY    EQU MF_RIGHTJUSTIFY

; Menu flags for Add/Check/EnableMenuItem()

 MFS_GRAYED          EQU 00000003h
 MFS_DISABLED        EQU MFS_GRAYED
 MFS_CHECKED         EQU MF_CHECKED
 MFS_HILITE          EQU MF_HILITE
 MFS_ENABLED         EQU MF_ENABLED
 MFS_UNCHECKED       EQU MF_UNCHECKED
 MFS_UNHILITE        EQU MF_UNHILITE
 MFS_DEFAULT         EQU MF_DEFAULT

; System Menu Command Values

 SC_SIZE         EQU 0F000h
 SC_MOVE         EQU 0F010h
 SC_MINIMIZE     EQU 0F020h
 SC_MAXIMIZE     EQU 0F030h
 SC_NEXTWINDOW   EQU 0F040h
 SC_PREVWINDOW   EQU 0F050h
 SC_CLOSE        EQU 0F060h
 SC_VSCROLL      EQU 0F070h
 SC_HSCROLL      EQU 0F080h
 SC_MOUSEMENU    EQU 0F090h
 SC_KEYMENU      EQU 0F100h
 SC_ARRANGE      EQU 0F110h
 SC_RESTORE      EQU 0F120h
 SC_TASKLIST     EQU 0F130h
 SC_SCREENSAVE   EQU 0F140h
 SC_HOTKEY       EQU 0F150h
 SC_DEFAULT      EQU 0F160h
 SC_MONITORPOWER EQU 0F170h
 SC_CONTEXTHELP  EQU 0F180h
 SC_SEPARATOR    EQU 0F00Fh
 SC_ICON         EQU SC_MINIMIZE
 SC_ZOOM         EQU SC_MAXIMIZE

; Standard Cursor IDs

 IDC_ARROW           EQU 32512
 IDC_IBEAM           EQU 32513
 IDC_WAIT            EQU 32514
 IDC_CROSS           EQU 32515
 IDC_UPARROW         EQU 32516
 IDC_SIZE            EQU 32640  ;  OBSOLETE: use IDC_SIZEALL
 IDC_ICON            EQU 32641  ;  OBSOLETE: use IDC_ARROW
 IDC_SIZENWSE        EQU 32642
 IDC_SIZENESW        EQU 32643
 IDC_SIZEWE          EQU 32644
 IDC_SIZENS          EQU 32645
 IDC_SIZEALL         EQU 32646
 IDC_NO              EQU 32648 ; not in win3.1
 IDC_HAND            EQU 32649
 IDC_APPSTARTING     EQU 32650 ; not in win3.1
 IDC_HELP            EQU 32651

 IMAGE_BITMAP        EQU 0
 IMAGE_ICON          EQU 1
 IMAGE_CURSOR        EQU 2
 IMAGE_ENHMETAFILE   EQU 3

 LR_DEFAULTCOLOR     EQU 0000h
 LR_MONOCHROME       EQU 0001h
 LR_COLOR            EQU 0002h
 LR_COPYRETURNORG    EQU 0004h
 LR_COPYDELETEORG    EQU 0008h
 LR_LOADFROMFILE     EQU 0010h
 LR_LOADTRANSPARENT  EQU 0020h
 LR_DEFAULTSIZE      EQU 0040h
 LR_VGACOLOR         EQU 0080h
 LR_LOADMAP3DCOLORS  EQU 1000h
 LR_CREATEDIBSECTION EQU 2000h
 LR_COPYFROMRESOURCE EQU 4000h
 LR_SHARED           EQU 8000h

; OEM Resource Ordinal Numbers

 OBM_CLOSE           EQU 32754
 OBM_UPARROW         EQU 32753
 OBM_DNARROW         EQU 32752
 OBM_RGARROW         EQU 32751
 OBM_LFARROW         EQU 32750
 OBM_REDUCE          EQU 32749
 OBM_ZOOM            EQU 32748
 OBM_RESTORE         EQU 32747
 OBM_REDUCED         EQU 32746
 OBM_ZOOMD           EQU 32745
 OBM_RESTORED        EQU 32744
 OBM_UPARROWD        EQU 32743
 OBM_DNARROWD        EQU 32742
 OBM_RGARROWD        EQU 32741
 OBM_LFARROWD        EQU 32740
 OBM_MNARROW         EQU 32739
 OBM_COMBO           EQU 32738
 OBM_UPARROWI        EQU 32737
 OBM_DNARROWI        EQU 32736
 OBM_RGARROWI        EQU 32735
 OBM_LFARROWI        EQU 32734
 OBM_OLD_CLOSE       EQU 32767
 OBM_SIZE            EQU 32766
 OBM_OLD_UPARROW     EQU 32765
 OBM_OLD_DNARROW     EQU 32764
 OBM_OLD_RGARROW     EQU 32763
 OBM_OLD_LFARROW     EQU 32762
 OBM_BTSIZE          EQU 32761
 OBM_CHECK           EQU 32760
 OBM_CHECKBOXES      EQU 32759
 OBM_BTNCORNERS      EQU 32758
 OBM_OLD_REDUCE      EQU 32757
 OBM_OLD_ZOOM        EQU 32756
 OBM_OLD_RESTORE     EQU 32755

 OCR_NORMAL          EQU 32512
 OCR_IBEAM           EQU 32513
 OCR_WAIT            EQU 32514
 OCR_CROSS           EQU 32515
 OCR_UP              EQU 32516
 OCR_SIZE            EQU 32640 ;   OBSOLETE: use OCR_SIZEALL
 OCR_ICON            EQU 32641 ;   OBSOLETE: use OCR_NORMAL
 OCR_SIZENWSE        EQU 32642
 OCR_SIZENESW        EQU 32643
 OCR_SIZEWE          EQU 32644
 OCR_SIZENS          EQU 32645
 OCR_SIZEALL         EQU 32646
 OCR_ICOCUR          EQU 32647 ;   OBSOLETE: use OIC_WINLOGO
 OCR_NO              EQU 32648
 OCR_HAND            EQU 32649
 OCR_APPSTARTING     EQU 32650
 OIC_SAMPLE          EQU 32512
 OIC_HAND            EQU 32513
 OIC_QUES            EQU 32514
 OIC_BANG            EQU 32515
 OIC_NOTE            EQU 32516
 OIC_WINLOGO         EQU 32517
 OIC_WARNING         EQU OIC_BANG
 OIC_ERROR           EQU OIC_HAND
 OIC_INFORMATION     EQU OIC_NOTE

 ORD_LANGDRIVER    EQU 1     ; The ordinal number for the entry point of

; Standard Icon IDs

 IDI_APPLICATION     EQU 32512
 IDI_HAND            EQU 32513
 IDI_QUESTION        EQU 32514
 IDI_EXCLAMATION     EQU 32515
 IDI_ASTERISK        EQU 32516
 IDI_WINLOGO         EQU 32517
 IDI_WARNING         EQU IDI_EXCLAMATION
 IDI_ERROR           EQU IDI_HAND
 IDI_INFORMATION     EQU IDI_ASTERISK

; Dialog Box Command IDs

 IDOK                EQU 1
 IDCANCEL            EQU 2
 IDABORT             EQU 3
 IDRETRY             EQU 4
 IDIGNORE            EQU 5
 IDYES               EQU 6
 IDNO                EQU 7
 IDCLOSE             EQU 8
 IDHELP              EQU 9

; Edit Control Styles

 ES_LEFT             EQU 0000h
 ES_CENTER           EQU 0001h
 ES_RIGHT            EQU 0002h
 ES_MULTILINE        EQU 0004h
 ES_UPPERCASE        EQU 0008h
 ES_LOWERCASE        EQU 0010h
 ES_PASSWORD         EQU 0020h
 ES_AUTOVSCROLL      EQU 0040h
 ES_AUTOHSCROLL      EQU 0080h
 ES_NOHIDESEL        EQU 0100h
 ES_OEMCONVERT       EQU 0400h
 ES_READONLY         EQU 0800h
 ES_WANTRETURN       EQU 1000h
 ES_NUMBER           EQU 2000h

; Edit Control Notification Codes

 EN_SETFOCUS         EQU 0100h
 EN_KILLFOCUS        EQU 0200h
 EN_CHANGE           EQU 0300h
 EN_UPDATE           EQU 0400h
 EN_ERRSPACE         EQU 0500h
 EN_MAXTEXT          EQU 0501h
 EN_HSCROLL          EQU 0601h
 EN_VSCROLL          EQU 0602h
 EN_ALIGN_LTR_EC     EQU 0700h
 EN_ALIGN_RTL_EC     EQU 0701h
 EC_LEFTMARGIN       EQU 0001h
 EC_RIGHTMARGIN      EQU 0002h
 EC_USEFONTINFO      EQU 0ffffh

; Edit Control Messages

 EM_GETSEL               EQU 00B0h
 EM_SETSEL               EQU 00B1h
 EM_GETRECT              EQU 00B2h
 EM_SETRECT              EQU 00B3h
 EM_SETRECTNP            EQU 00B4h
 EM_SCROLL               EQU 00B5h
 EM_LINESCROLL           EQU 00B6h
 EM_SCROLLCARET          EQU 00B7h
 EM_GETMODIFY            EQU 00B8h
 EM_SETMODIFY            EQU 00B9h
 EM_GETLINECOUNT         EQU 00BAh
 EM_LINEINDEX            EQU 00BBh
 EM_SETHANDLE            EQU 00BCh
 EM_GETHANDLE            EQU 00BDh
 EM_GETTHUMB             EQU 00BEh
 EM_LINELENGTH           EQU 00C1h
 EM_REPLACESEL           EQU 00C2h
 EM_GETLINE              EQU 00C4h
 EM_LIMITTEXT            EQU 00C5h
 EM_CANUNDO              EQU 00C6h
 EM_UNDO                 EQU 00C7h
 EM_FMTLINES             EQU 00C8h
 EM_LINEFROMCHAR         EQU 00C9h
 EM_SETTABSTOPS          EQU 00CBh
 EM_SETPASSWORDCHAR      EQU 00CCh
 EM_EMPTYUNDOBUFFER      EQU 00CDh
 EM_GETFIRSTVISIBLELINE  EQU 00CEh
 EM_SETREADONLY          EQU 00CFh
 EM_SETWORDBREAKPROC     EQU 00D0h
 EM_GETWORDBREAKPROC     EQU 00D1h
 EM_GETPASSWORDCHAR      EQU 00D2h
 EM_SETMARGINS           EQU 00D3h
 EM_GETMARGINS           EQU 00D4h
 EM_SETLIMITTEXT         EQU EM_LIMITTEXT    ;win40 Name change
 EM_GETLIMITTEXT         EQU 00D5h
 EM_POSFROMCHAR          EQU 00D6h
 EM_CHARFROMPOS          EQU 00D7h

; EDITWORDBREAKPROC code values

 WB_LEFT            EQU 0
 WB_RIGHT           EQU 1
 WB_ISDELIMITER     EQU 2

; Button Control Styles

 BS_PUSHBUTTON       EQU 00000000h
 BS_DEFPUSHBUTTON    EQU 00000001h
 BS_CHECKBOX         EQU 00000002h
 BS_AUTOCHECKBOX     EQU 00000003h
 BS_RADIOBUTTON      EQU 00000004h
 BS_3STATE           EQU 00000005h
 BS_AUTO3STATE       EQU 00000006h
 BS_GROUPBOX         EQU 00000007h
 BS_USERBUTTON       EQU 00000008h
 BS_AUTORADIOBUTTON  EQU 00000009h
 BS_OWNERDRAW        EQU 0000000Bh
 BS_LEFTTEXT         EQU 00000020h
 BS_TEXT             EQU 00000000h
 BS_ICON             EQU 00000040h
 BS_BITMAP           EQU 00000080h
 BS_LEFT             EQU 00000100h
 BS_RIGHT            EQU 00000200h
 BS_CENTER           EQU 00000300h
 BS_TOP              EQU 00000400h
 BS_BOTTOM           EQU 00000800h
 BS_VCENTER          EQU 00000C00h
 BS_PUSHLIKE         EQU 00001000h
 BS_MULTILINE        EQU 00002000h
 BS_NOTIFY           EQU 00004000h
 BS_FLAT             EQU 00008000h
 BS_RIGHTBUTTON      EQU BS_LEFTTEXT

; User Button Notification Codes

 BN_CLICKED          EQU 0
 BN_PAINT            EQU 1
 BN_HILITE           EQU 2
 BN_UNHILITE         EQU 3
 BN_DISABLE          EQU 4
 BN_DOUBLECLICKED    EQU 5
 BN_PUSHED           EQU BN_HILITE
 BN_UNPUSHED         EQU BN_UNHILITE
 BN_DBLCLK           EQU BN_DOUBLECLICKED
 BN_SETFOCUS         EQU 6
 BN_KILLFOCUS        EQU 7

; Button Control Messages

 BM_GETCHECK        EQU 00F0h
 BM_SETCHECK        EQU 00F1h
 BM_GETSTATE        EQU 00F2h
 BM_SETSTATE        EQU 00F3h
 BM_SETSTYLE        EQU 00F4h
 BM_CLICK           EQU 00F5h
 BM_GETIMAGE        EQU 00F6h
 BM_SETIMAGE        EQU 00F7h
 BST_UNCHECKED      EQU 0000h
 BST_CHECKED        EQU 0001h
 BST_INDETERMINATE  EQU 0002h
 BST_PUSHED         EQU 0004h
 BST_FOCUS          EQU 0008h

; Static Control Constants

 SS_LEFT             EQU 00000000h
 SS_CENTER           EQU 00000001h
 SS_RIGHT            EQU 00000002h
 SS_ICON             EQU 00000003h
 SS_BLACKRECT        EQU 00000004h
 SS_GRAYRECT         EQU 00000005h
 SS_WHITERECT        EQU 00000006h
 SS_BLACKFRAME       EQU 00000007h
 SS_GRAYFRAME        EQU 00000008h
 SS_WHITEFRAME       EQU 00000009h
 SS_USERITEM         EQU 0000000Ah
 SS_SIMPLE           EQU 0000000Bh
 SS_LEFTNOWORDWRAP   EQU 0000000Ch
 SS_OWNERDRAW        EQU 0000000Dh
 SS_BITMAP           EQU 0000000Eh
 SS_ENHMETAFILE      EQU 0000000Fh
 SS_ETCHEDHORZ       EQU 00000010h
 SS_ETCHEDVERT       EQU 00000011h
 SS_ETCHEDFRAME      EQU 00000012h
 SS_TYPEMASK         EQU 0000001Fh
 SS_NOPREFIX         EQU 00000080h ;   Don't do "&" character translation
 SS_NOTIFY           EQU 00000100h
 SS_CENTERIMAGE      EQU 00000200h
 SS_RIGHTJUST        EQU 00000400h
 SS_REALSIZEIMAGE    EQU 00000800h
 SS_SUNKEN           EQU 00001000h
 SS_ENDELLIPSIS      EQU 00004000h
 SS_PATHELLIPSIS     EQU 00008000h
 SS_WORDELLIPSIS     EQU 0000C000h
 SS_ELLIPSISMASK     EQU 0000C000h

; Static Control Mesages

 STM_SETICON         EQU 0170h
 STM_GETICON         EQU 0171h
 STM_SETIMAGE        EQU 0172h
 STM_GETIMAGE        EQU 0173h
 STN_CLICKED         EQU 0
 STN_DBLCLK          EQU 1
 STN_ENABLE          EQU 2
 STN_DISABLE         EQU 3
 STM_MSGMAX          EQU 0174h

; DlgDirList, DlgDirListComboBox flags values

 DDL_READWRITE       EQU 0000h
 DDL_READONLY        EQU 0001h
 DDL_HIDDEN          EQU 0002h
 DDL_SYSTEM          EQU 0004h
 DDL_DIRECTORY       EQU 0010h
 DDL_ARCHIVE         EQU 0020h
 DDL_POSTMSGS        EQU 2000h
 DDL_DRIVES          EQU 4000h
 DDL_EXCLUSIVE       EQU 8000h

; Dialog Styles

 DS_ABSALIGN         EQU 01h
 DS_SYSMODAL         EQU 02h
 DS_LOCALEDIT        EQU 20h     ;Edit items get Local storage.
 DS_SETFONT          EQU 40h     ;User specified font for Dlg controls
 DS_MODALFRAME       EQU 80h     ;Can be combined with WS_CAPTION
 DS_NOIDLEMSG        EQU 100h    ;WM_ENTERIDLE message will not be sent
 DS_SETFOREGROUND    EQU 200h    ;not in win3.1
 DS_3DLOOK           EQU 0004h
 DS_FIXEDSYS         EQU 0008h
 DS_NOFAILCREATE     EQU 0010h
 DS_CONTROL          EQU 0400h
 DS_CENTER           EQU 0800h
 DS_CENTERMOUSE      EQU 1000h
 DS_CONTEXTHELP      EQU 2000h

 DM_GETDEFID         EQU WM_USER+0
 DM_SETDEFID         EQU WM_USER+1
 DM_REPOSITION       EQU WM_USER+2

 DC_HASDEFID         EQU 534Bh

; Dialog Codes

 DLGC_WANTARROWS     EQU 0001h   ;    Control wants arrow keys
 DLGC_WANTTAB        EQU 0002h   ;    Control wants tab keys
 DLGC_WANTALLKEYS    EQU 0004h   ;    Control wants all keys
 DLGC_WANTMESSAGE    EQU 0004h   ;    Pass message to control
 DLGC_HASSETSEL      EQU 0008h   ;    Understands EM_SETSEL message
 DLGC_DEFPUSHBUTTON  EQU 0010h   ;    Default pushbutton
 DLGC_UNDEFPUSHBUTTON EQU 0020h  ;    Non-default pushbutton
 DLGC_RADIOBUTTON    EQU 0040h   ;    Radio button
 DLGC_WANTCHARS      EQU 0080h   ;    Want WM_CHAR messages
 DLGC_STATIC         EQU 0100h   ;     Static item: don't include
 DLGC_BUTTON         EQU 2000h   ;    Button item: can be checked

; Listbox Return Values

 LB_OKAY             EQU 0
 LB_ERR              EQU -1
 LB_ERRSPACE         EQU -2

; Listbox Notification Codes

 LBN_ERRSPACE        EQU -2
 LBN_SELCHANGE       EQU 1
 LBN_DBLCLK          EQU 2
 LBN_SELCANCEL       EQU 3
 LBN_SETFOCUS        EQU 4
 LBN_KILLFOCUS       EQU 5

; Listbox messages

 LB_ADDSTRING            EQU 0180h
 LB_INSERTSTRING         EQU 0181h
 LB_DELETESTRING         EQU 0182h
 LB_SELITEMRANGEEX       EQU 0183h
 LB_RESETCONTENT         EQU 0184h
 LB_SETSEL               EQU 0185h
 LB_SETCURSEL            EQU 0186h
 LB_GETSEL               EQU 0187h
 LB_GETCURSEL            EQU 0188h
 LB_GETTEXT              EQU 0189h
 LB_GETTEXTLEN           EQU 018Ah
 LB_GETCOUNT             EQU 018Bh
 LB_SELECTSTRING         EQU 018Ch
 LB_DIR                  EQU 018Dh
 LB_GETTOPINDEX          EQU 018Eh
 LB_FINDSTRING           EQU 018Fh
 LB_GETSELCOUNT          EQU 0190h
 LB_GETSELITEMS          EQU 0191h
 LB_SETTABSTOPS          EQU 0192h
 LB_GETHORIZONTALEXTENT  EQU 0193h
 LB_SETHORIZONTALEXTENT  EQU 0194h
 LB_SETCOLUMNWIDTH       EQU 0195h
 LB_ADDFILE              EQU 0196h
 LB_SETTOPINDEX          EQU 0197h
 LB_GETITEMRECT          EQU 0198h
 LB_GETITEMDATA          EQU 0199h
 LB_SETITEMDATA          EQU 019Ah
 LB_SELITEMRANGE         EQU 019Bh
 LB_SETANCHORINDEX       EQU 019Ch
 LB_GETANCHORINDEX       EQU 019Dh
 LB_SETCARETINDEX        EQU 019Eh
 LB_GETCARETINDEX        EQU 019Fh
 LB_SETITEMHEIGHT        EQU 01A0h
 LB_GETITEMHEIGHT        EQU 01A1h
 LB_FINDSTRINGEXACT      EQU 01A2h
 LB_SETLOCALE            EQU 01A5h
 LB_GETLOCALE            EQU 01A6h
 LB_SETCOUNT             EQU 01A7h
 LB_INITSTORAGE          EQU 01A8h
 LB_ITEMFROMPOINT        EQU 01A9h
 LB_MULTIPLEADDSTRING    EQU 01B1h
 LB_MSGMAX               EQU 01B0h

; Listbox Styles

 LBS_NOTIFY            EQU 0001h
 LBS_SORT              EQU 0002h
 LBS_NOREDRAW          EQU 0004h
 LBS_MULTIPLESEL       EQU 0008h
 LBS_OWNERDRAWFIXED    EQU 0010h
 LBS_OWNERDRAWVARIABLE EQU 0020h
 LBS_HASSTRINGS        EQU 0040h
 LBS_USETABSTOPS       EQU 0080h
 LBS_NOINTEGRALHEIGHT  EQU 0100h
 LBS_MULTICOLUMN       EQU 0200h
 LBS_WANTKEYBOARDINPUT EQU 0400h
 LBS_EXTENDEDSEL       EQU 0800h
 LBS_DISABLENOSCROLL   EQU 1000h
 LBS_NODATA            EQU 2000h
 LBS_NOSEL             EQU 4000h
 LBS_STANDARD          EQU (LBS_NOTIFY OR LBS_SORT OR WS_VSCROLL OR WS_BORDER)

; Combo Box return Values

 CB_OKAY             EQU 0
 CB_ERR              EQU -1
 CB_ERRSPACE         EQU -2

; Combo Box Notification Codes

 CBN_ERRSPACE        EQU -1
 CBN_SELCHANGE       EQU 1
 CBN_DBLCLK          EQU 2
 CBN_SETFOCUS        EQU 3
 CBN_KILLFOCUS       EQU 4
 CBN_EDITCHANGE      EQU 5
 CBN_EDITUPDATE      EQU 6
 CBN_DROPDOWN        EQU 7
 CBN_CLOSEUP         EQU 8
 CBN_SELENDOK        EQU 9
 CBN_SELENDCANCEL    EQU 10

; Combo Box styles

 CBS_SIMPLE            EQU 0001h
 CBS_DROPDOWN          EQU 0002h
 CBS_DROPDOWNLIST      EQU 0003h
 CBS_OWNERDRAWFIXED    EQU 0010h
 CBS_OWNERDRAWVARIABLE EQU 0020h
 CBS_AUTOHSCROLL       EQU 0040h
 CBS_OEMCONVERT        EQU 0080h
 CBS_SORT              EQU 0100h
 CBS_HASSTRINGS        EQU 0200h
 CBS_NOINTEGRALHEIGHT  EQU 0400h
 CBS_DISABLENOSCROLL   EQU 0800h
 CBS_UPPERCASE         EQU 2000h
 CBS_LOWERCASE         EQU 4000h

;====== COMMON CONTROL STYLES =====

CCS_TOP            =     00000001h
CCS_NOMOVEY        =     00000002h
CCS_BOTTOM         =     00000003h
CCS_NORESIZE       =     00000004h
CCS_NOPARENTALIGN  =     00000008h
CCS_ADJUSTABLE     =     00000020h
CCS_NODIVIDER      =     00000040h


; Combo Box messages

 CB_GETEDITSEL               EQU 0140h
 CB_LIMITTEXT                EQU 0141h
 CB_SETEDITSEL               EQU 0142h
 CB_ADDSTRING                EQU 0143h
 CB_DELETESTRING             EQU 0144h
 CB_DIR                      EQU 0145h
 CB_GETCOUNT                 EQU 0146h
 CB_GETCURSEL                EQU 0147h
 CB_GETLBTEXT                EQU 0148h
 CB_GETLBTEXTLEN             EQU 0149h
 CB_INSERTSTRING             EQU 014Ah
 CB_RESETCONTENT             EQU 014Bh
 CB_FINDSTRING               EQU 014Ch
 CB_SELECTSTRING             EQU 014Dh
 CB_SETCURSEL                EQU 014Eh
 CB_SHOWDROPDOWN             EQU 014Fh
 CB_GETITEMDATA              EQU 0150h
 CB_SETITEMDATA              EQU 0151h
 CB_GETDROPPEDCONTROLRECT    EQU 0152h
 CB_SETITEMHEIGHT            EQU 0153h
 CB_GETITEMHEIGHT            EQU 0154h
 CB_SETEXTENDEDUI            EQU 0155h
 CB_GETEXTENDEDUI            EQU 0156h
 CB_GETDROPPEDSTATE          EQU 0157h
 CB_FINDSTRINGEXACT          EQU 0158h
 CB_SETLOCALE                EQU 0159h
 CB_GETLOCALE                EQU 015Ah
 CB_GETTOPINDEX              EQU 015bh
 CB_SETTOPINDEX              EQU 015ch
 CB_GETHORIZONTALEXTENT      EQU 015dh
 CB_SETHORIZONTALEXTENT      EQU 015eh
 CB_GETDROPPEDWIDTH          EQU 015fh
 CB_SETDROPPEDWIDTH          EQU 0160h
 CB_INITSTORAGE              EQU 0161h
 CB_MULTIPLEADDSTRING        EQU 0163h
 CB_MSGMAX                   EQU 0162h

 SB_SETPARTS     equ WM_USER+4
 SB_SETTEXT      equ WM_USER+1

 TBSTATE_CHECKED       =  01h
 TBSTATE_PRESSED       =  02h
 TBSTATE_ENABLED       =  04h
 TBSTATE_HIDDEN        =  08h
 TBSTATE_INDETERMINATE =  10h
 TBSTATE_WRAP          =  20h

 TBSTYLE_BUTTON        =  00h
 TBSTYLE_SEP           =  01h
 TBSTYLE_CHECK         =  02h
 TBSTYLE_GROUP         =  04h
 TBSTYLE_CHECKGROUP    =  TBSTYLE_GROUP+TBSTYLE_CHECK

 TBSTYLE_TOOLTIPS      =  0100h
 TBSTYLE_WRAPABLE      =  0200h
 TBSTYLE_ALTDRAG       =  0400h

 TB_ENABLEBUTTON       =  (WM_USER + 1)
 TB_CHECKBUTTON        =  (WM_USER + 2)
 TB_PRESSBUTTON        =  (WM_USER + 3)
 TB_HIDEBUTTON         =  (WM_USER + 4)
 TB_INDETERMINATE      =  (WM_USER + 5)
 TB_ISBUTTONENABLED    =  (WM_USER + 9)
 TB_ISBUTTONCHECKED    =  (WM_USER + 10)
 TB_ISBUTTONPRESSED    =  (WM_USER + 11)
 TB_ISBUTTONHIDDEN     =  (WM_USER + 12)
 TB_ISBUTTONINDETERMINATE = (WM_USER + 13)
 TB_SETSTATE           =  (WM_USER + 17)
 TB_GETSTATE           =  (WM_USER + 18)
 TB_ADDBITMAP          =  (WM_USER + 19)
 TB_SAVERESTOREA       =  (WM_USER + 26)
 TB_SAVERESTOREW       =  (WM_USER + 76)
 TB_CUSTOMIZE          =  (WM_USER + 27)
 TB_ADDSTRINGA         =  (WM_USER + 28)
 TB_ADDSTRINGW         =  (WM_USER + 77)
 TB_GETITEMRECT        =  (WM_USER + 29)
 TB_BUTTONSTRUCTSIZE   =  (WM_USER + 30)
 TB_SETBUTTONSIZE      =  (WM_USER + 31)
 TB_SETBITMAPSIZE      =  (WM_USER + 32)
 TB_AUTOSIZE           =  (WM_USER + 33)
 TB_GETTOOLTIPS        =  (WM_USER + 35)
 TB_SETTOOLTIPS        =  (WM_USER + 36)
 TB_SETPARENT          =  (WM_USER + 37)
 TB_SETROWS            =  (WM_USER + 39)
 TB_GETROWS            =  (WM_USER + 40)
 TB_SETCMDID           =  (WM_USER + 42)
 TB_CHANGEBITMAP       =  (WM_USER + 43)
 TB_GETBITMAP          =  (WM_USER + 44)
 TB_GETBUTTONTEXTA     =  (WM_USER + 45)
 TB_GETBUTTONTEXTW     =  (WM_USER + 75)
 TB_REPLACEBITMAP      =  (WM_USER + 46)

; Scroll Bar Styles

 SBS_HORZ                    EQU 0000h
 SBS_VERT                    EQU 0001h
 SBS_TOPALIGN                EQU 0002h
 SBS_LEFTALIGN               EQU 0002h
 SBS_BOTTOMALIGN             EQU 0004h
 SBS_RIGHTALIGN              EQU 0004h
 SBS_SIZEBOXTOPLEFTALIGN     EQU 0002h
 SBS_SIZEBOXBOTTOMRIGHTALIGN EQU 0004h
 SBS_SIZEBOX                 EQU 0008h
 SBS_SIZEGRIP                EQU 0010h

; Scroll bar messages

 SBM_SETPOS                  EQU 00E0h
 SBM_GETPOS                  EQU 00E1h
 SBM_SETRANGE                EQU 00E2h
 SBM_SETRANGEREDRAW          EQU 00E6h
 SBM_GETRANGE                EQU 00E3h
 SBM_ENABLE_ARROWS           EQU 00E4h
 SBM_SETSCROLLINFO           EQU 00E9h
 SBM_GETSCROLLINFO           EQU 00EAh

 SIF_RANGE           EQU 0001h
 SIF_PAGE            EQU 0002h
 SIF_POS             EQU 0004h
 SIF_DISABLENOSCROLL EQU 0008h
 SIF_TRACKPOS        EQU 0010h
 SIF_ALL             EQU (SIF_RANGE OR SIF_PAGE OR SIF_POS OR SIF_TRACKPOS)

; Parameter for SystemParametersInfo()

 SPI_GETBEEP                 EQU 1
 SPI_SETBEEP                 EQU 2
 SPI_GETMOUSE                EQU 3
 SPI_SETMOUSE                EQU 4
 SPI_GETBORDER               EQU 5
 SPI_SETBORDER               EQU 6
 SPI_GETKEYBOARDSPEED       EQU 10
 SPI_SETKEYBOARDSPEED       EQU 11
 SPI_LANGDRIVER             EQU 12
 SPI_ICONHORIZONTALSPACING  EQU 13
 SPI_GETSCREENSAVETIMEOUT   EQU 14
 SPI_SETSCREENSAVETIMEOUT   EQU 15
 SPI_GETSCREENSAVEACTIVE    EQU 16
 SPI_SETSCREENSAVEACTIVE    EQU 17
 SPI_GETGRIDGRANULARITY     EQU 18
 SPI_SETGRIDGRANULARITY     EQU 19
 SPI_SETDESKWALLPAPER       EQU 20
 SPI_SETDESKPATTERN         EQU 21
 SPI_GETKEYBOARDDELAY       EQU 22
 SPI_SETKEYBOARDDELAY       EQU 23
 SPI_ICONVERTICALSPACING    EQU 24
 SPI_GETICONTITLEWRAP       EQU 25
 SPI_SETICONTITLEWRAP       EQU 26
 SPI_GETMENUDROPALIGNMENT   EQU 27
 SPI_SETMENUDROPALIGNMENT   EQU 28
 SPI_SETDOUBLECLKWIDTH      EQU 29
 SPI_SETDOUBLECLKHEIGHT     EQU 30
 SPI_GETICONTITLELOGFONT    EQU 31
 SPI_SETDOUBLECLICKTIME     EQU 32
 SPI_SETMOUSEBUTTONSWAP     EQU 33
 SPI_SETICONTITLELOGFONT    EQU 34
 SPI_GETFASTTASKSWITCH      EQU 35
 SPI_SETFASTTASKSWITCH      EQU 36
 SPI_SETDRAGFULLWINDOWS     EQU 37
 SPI_GETDRAGFULLWINDOWS     EQU 38
 SPI_GETNONCLIENTMETRICS    EQU 41
 SPI_SETNONCLIENTMETRICS    EQU 42
 SPI_GETMINIMIZEDMETRICS    EQU 43
 SPI_SETMINIMIZEDMETRICS    EQU 44
 SPI_GETICONMETRICS         EQU 45
 SPI_SETICONMETRICS         EQU 46
 SPI_SETWORKAREA            EQU 47
 SPI_GETWORKAREA            EQU 48
 SPI_SETPENWINDOWS          EQU 49
 SPI_GETHIGHCONTRAST        EQU 66
 SPI_SETHIGHCONTRAST        EQU 67
 SPI_GETKEYBOARDPREF        EQU 68
 SPI_SETKEYBOARDPREF        EQU 69
 SPI_GETSCREENREADER        EQU 70
 SPI_SETSCREENREADER        EQU 71
 SPI_GETANIMATION           EQU 72
 SPI_SETANIMATION           EQU 73
 SPI_GETFONTSMOOTHING       EQU 74
 SPI_SETFONTSMOOTHING       EQU 75
 SPI_SETDRAGWIDTH           EQU 76
 SPI_SETDRAGHEIGHT          EQU 77
 SPI_SETHANDHELD            EQU 78
 SPI_GETLOWPOWERTIMEOUT     EQU 79
 SPI_GETPOWEROFFTIMEOUT     EQU 80
 SPI_SETLOWPOWERTIMEOUT     EQU 81
 SPI_SETPOWEROFFTIMEOUT     EQU 82
 SPI_GETLOWPOWERACTIVE      EQU 83
 SPI_GETPOWEROFFACTIVE      EQU 84
 SPI_SETLOWPOWERACTIVE      EQU 85
 SPI_SETPOWEROFFACTIVE      EQU 86
 SPI_SETCURSORS             EQU 87
 SPI_SETICONS               EQU 88
 SPI_GETDEFAULTINPUTLANG    EQU 89
 SPI_SETDEFAULTINPUTLANG    EQU 90
 SPI_SETLANGTOGGLE          EQU 91
 SPI_GETWINDOWSEXTENSION    EQU 92
 SPI_SETMOUSETRAILS         EQU 93
 SPI_GETMOUSETRAILS         EQU 94
 SPI_SETSCREENSAVERRUNNING  EQU 97
 SPI_SCREENSAVERRUNNING     EQU SPI_SETSCREENSAVERRUNNING
 SPI_GETFILTERKEYS          EQU 50
 SPI_SETFILTERKEYS          EQU 51
 SPI_GETTOGGLEKEYS          EQU 52
 SPI_SETTOGGLEKEYS          EQU 53
 SPI_GETMOUSEKEYS           EQU 54
 SPI_SETMOUSEKEYS           EQU 55
 SPI_GETSHOWSOUNDS          EQU 56
 SPI_SETSHOWSOUNDS          EQU 57
 SPI_GETSTICKYKEYS          EQU 58
 SPI_SETSTICKYKEYS          EQU 59
 SPI_GETACCESSTIMEOUT       EQU 60
 SPI_SETACCESSTIMEOUT       EQU 61
 SPI_GETSERIALKEYS          EQU 62
 SPI_SETSERIALKEYS          EQU 63
 SPI_GETSOUNDSENTRY         EQU 64
 SPI_SETSOUNDSENTRY         EQU 65
 SPI_GETSNAPTODEFBUTTON     EQU 95
 SPI_SETSNAPTODEFBUTTON     EQU 96
 SPI_GETMOUSEHOVERWIDTH     EQU 98
 SPI_SETMOUSEHOVERWIDTH     EQU 99
 SPI_GETMOUSEHOVERHEIGHT   EQU 100
 SPI_SETMOUSEHOVERHEIGHT   EQU 101
 SPI_GETMOUSEHOVERTIME     EQU 102
 SPI_SETMOUSEHOVERTIME     EQU 103
 SPI_GETWHEELSCROLLLINES   EQU 104
 SPI_SETWHEELSCROLLLINES   EQU 105
 SPI_GETMENUSHOWDELAY      EQU 106
 SPI_SETMENUSHOWDELAY      EQU 107
 SPI_GETSHOWIMEUI          EQU 110
 SPI_SETSHOWIMEUI          EQU 111
 SPI_GETMOUSESPEED         EQU 112
 SPI_SETMOUSESPEED         EQU 113
 SPI_GETSCREENSAVERRUNNING EQU 114
 SPI_GETACTIVEWINDOWTRACKING         EQU 1000h
 SPI_SETACTIVEWINDOWTRACKING         EQU 1001h
 SPI_GETMENUANIMATION                EQU 1002h
 SPI_SETMENUANIMATION                EQU 1003h
 SPI_GETCOMBOBOXANIMATION            EQU 1004h
 SPI_SETCOMBOBOXANIMATION            EQU 1005h
 SPI_GETLISTBOXSMOOTHSCROLLING       EQU 1006h
 SPI_SETLISTBOXSMOOTHSCROLLING       EQU 1007h
 SPI_GETGRADIENTCAPTIONS             EQU 1008h
 SPI_SETGRADIENTCAPTIONS             EQU 1009h
 SPI_GETKEYBOARDCUES                 EQU 100Ah
 SPI_SETKEYBOARDCUES                 EQU 100Bh
 SPI_GETMENUUNDERLINES               EQU SPI_GETKEYBOARDCUES
 SPI_SETMENUUNDERLINES               EQU SPI_SETKEYBOARDCUES
 SPI_GETACTIVEWNDTRKZORDER           EQU 100Ch
 SPI_SETACTIVEWNDTRKZORDER           EQU 100Dh
 SPI_GETHOTTRACKING                  EQU 100Eh
 SPI_SETHOTTRACKING                  EQU 100Fh
 SPI_GETMENUFADE                     EQU 1012h
 SPI_SETMENUFADE                     EQU 1013h
 SPI_GETSELECTIONFADE                EQU 1014h
 SPI_SETSELECTIONFADE                EQU 1015h
 SPI_GETTOOLTIPANIMATION             EQU 1016h
 SPI_SETTOOLTIPANIMATION             EQU 1017h
 SPI_GETTOOLTIPFADE                  EQU 1018h
 SPI_SETTOOLTIPFADE                  EQU 1019h
 SPI_GETCURSORSHADOW                 EQU 101Ah
 SPI_SETCURSORSHADOW                 EQU 101Bh
 SPI_GETUIEFFECTS                    EQU 103Eh
 SPI_SETUIEFFECTS                    EQU 103Fh
 SPI_GETFOREGROUNDLOCKTIMEOUT        EQU 2000h
 SPI_SETFOREGROUNDLOCKTIMEOUT        EQU 2001h
 SPI_GETACTIVEWNDTRKTIMEOUT          EQU 2002h
 SPI_SETACTIVEWNDTRKTIMEOUT          EQU 2003h
 SPI_GETFOREGROUNDFLASHCOUNT         EQU 2004h
 SPI_SETFOREGROUNDFLASHCOUNT         EQU 2005h
 SPI_GETCARETWIDTH                   EQU 2006h
 SPI_SETCARETWIDTH                   EQU 2007h

 ARW_BOTTOMLEFT              EQU 0000h
 ARW_BOTTOMRIGHT             EQU 0001h
 ARW_TOPLEFT                 EQU 0002h
 ARW_TOPRIGHT                EQU 0003h
 ARW_STARTMASK               EQU 0003h
 ARW_STARTRIGHT              EQU 0001h
 ARW_STARTTOP                EQU 0002h
 ARW_LEFT                    EQU 0000h
 ARW_RIGHT                   EQU 0000h
 ARW_UP                      EQU 0004h
 ARW_DOWN                    EQU 0004h
 ARW_HIDE                    EQU 0008h

; flags for SERIALKEYS dwFlags field

 SERKF_SERIALKEYSON  EQU 00000001h
 SERKF_AVAILABLE     EQU 00000002h
 SERKF_INDICATOR     EQU 00000004h

;       NMHDR

NMHDR struc
    hwndFrom UINT ?
    idFrom UINT ?
    code UINT ?
NMHDR ends

;       TOOLTIPTEXT

TOOLTIPTEXT struc
    hdr NMHDR <?>
    lpszText ULONG ?
    szText db 80 dup(?)
    hinst ULONG ?
    uFlags UINT ?
TOOLTIPTEXT ends

TTN_NEEDTEXT equ 0FFFFFDF8h

; flags for HIGHCONTRAST dwFlags field

 HCF_HIGHCONTRASTON  EQU 00000001h
 HCF_AVAILABLE       EQU 00000002h
 HCF_HOTKEYACTIVE    EQU 00000004h
 HCF_CONFIRMHOTKEY   EQU 00000008h
 HCF_HOTKEYSOUND     EQU 00000010h
 HCF_INDICATOR       EQU 00000020h
 HCF_HOTKEYAVAILABLE EQU 00000040h

; Flags for ChangeDisplaySettings

 CDS_UPDATEREGISTRY  EQU 00000001h
 CDS_TEST            EQU 00000002h
 CDS_FULLSCREEN      EQU 00000004h
 CDS_GLOBAL          EQU 00000008h
 CDS_SET_PRIMARY     EQU 00000010h
 CDS_RESET           EQU 40000000h
 CDS_NORESET         EQU 10000000h

; Return values for ChangeDisplaySettings

 DISP_CHANGE_SUCCESSFUL       EQU 0
 DISP_CHANGE_RESTART          EQU 1
 DISP_CHANGE_FAILED          EQU -1
 DISP_CHANGE_BADMODE         EQU -2
 DISP_CHANGE_NOTUPDATED      EQU -3
 DISP_CHANGE_BADFLAGS        EQU -4
 DISP_CHANGE_BADPARAM        EQU -5

; dwFlags for SetWinEventHook

 WINEVENT_OUTOFCONTEXT   EQU 0000h  ; Events are ASYNC
 WINEVENT_SKIPOWNTHREAD  EQU 0001h  ; Don't call back for events on installer's thread
 WINEVENT_SKIPOWNPROCESS EQU 0002h  ; Don't call back for events on installer's process
 WINEVENT_INCONTEXT      EQU 0004h  ; Events are SYNC, this causes your dll to be injected into every process

; Reserved IDs for system objects

 OBJID_WINDOW        EQU 000000000h
 OBJID_SYSMENU       EQU 0FFFFFFFFh
 OBJID_TITLEBAR      EQU 0FFFFFFFEh
 OBJID_MENU          EQU 0FFFFFFFDh
 OBJID_CLIENT        EQU 0FFFFFFFCh
 OBJID_VSCROLL       EQU 0FFFFFFFBh
 OBJID_HSCROLL       EQU 0FFFFFFFAh
 OBJID_SIZEGRIP      EQU 0FFFFFFF9h
 OBJID_CARET         EQU 0FFFFFFF8h
 OBJID_CURSOR        EQU 0FFFFFFF7h
 OBJID_ALERT         EQU 0FFFFFFF6h
 OBJID_SOUND         EQU 0FFFFFFF5h

; EVENT DEFINITION

 EVENT_MIN           EQU 00000001h
 EVENT_MAX           EQU 7FFFFFFFh

 EVENT_OBJECT_NAMECHANGE             EQU 800Ch  ; hwnd + ID + idChild is item w/ name change
 EVENT_OBJECT_DESCRIPTIONCHANGE      EQU 800Dh  ; hwnd + ID + idChild is item w/ desc change
 EVENT_OBJECT_VALUECHANGE            EQU 800Eh  ; hwnd + ID + idChild is item w/ value change
 EVENT_OBJECT_PARENTCHANGE           EQU 800Fh  ; hwnd + ID + idChild is item w/ new parent
 EVENT_OBJECT_HELPCHANGE             EQU 8010h  ; hwnd + ID + idChild is item w/ help change
 EVENT_OBJECT_DEFACTIONCHANGE        EQU 8011h  ; hwnd + ID + idChild is item w/ def action change
 EVENT_OBJECT_ACCELERATORCHANGE      EQU 8012h  ; hwnd + ID + idChild is item w/ keybd accel change

; System Sounds (idChild of system SOUND notification)

 SOUND_SYSTEM_STARTUP            EQU 1
 SOUND_SYSTEM_SHUTDOWN           EQU 2
 SOUND_SYSTEM_BEEP               EQU 3
 SOUND_SYSTEM_ERROR              EQU 4
 SOUND_SYSTEM_QUESTION           EQU 5
 SOUND_SYSTEM_WARNING            EQU 6
 SOUND_SYSTEM_INFORMATION        EQU 7
 SOUND_SYSTEM_MAXIMIZE           EQU 8
 SOUND_SYSTEM_MINIMIZE           EQU 9
 SOUND_SYSTEM_RESTOREUP          EQU 10
 SOUND_SYSTEM_RESTOREDOWN        EQU 11
 SOUND_SYSTEM_APPSTART           EQU 12
 SOUND_SYSTEM_FAULT              EQU 13
 SOUND_SYSTEM_APPEND             EQU 14
 SOUND_SYSTEM_MENUCOMMAND        EQU 15
 SOUND_SYSTEM_MENUPOPUP          EQU 16
 CSOUND_SYSTEM                   EQU 16

; System Alerts (indexChild of system ALERT notification)

 ALERT_SYSTEM_INFORMATIONAL      EQU 1       ; MB_INFORMATION
 ALERT_SYSTEM_WARNING            EQU 2       ; MB_WARNING
 ALERT_SYSTEM_ERROR              EQU 3       ; MB_ERROR
 ALERT_SYSTEM_QUERY              EQU 4       ; MB_QUESTION
 ALERT_SYSTEM_CRITICAL           EQU 5       ; HardSysErrBox
 CALERT_SYSTEM                   EQU 6

 GUI_CARETBLINKING   EQU 00000001h
 GUI_INMOVESIZE      EQU 00000002h
 GUI_INMENUMODE      EQU 00000004h
 GUI_SYSTEMMENUMODE  EQU 00000008h
 GUI_POPUPMENUMODE   EQU 00000010h

 STATE_SYSTEM_UNAVAILABLE        EQU 00000001h  ; Disabled
 STATE_SYSTEM_SELECTED           EQU 00000002h
 STATE_SYSTEM_FOCUSED            EQU 00000004h
 STATE_SYSTEM_PRESSED            EQU 00000008h
 STATE_SYSTEM_CHECKED            EQU 00000010h
 STATE_SYSTEM_MIXED              EQU 00000020h  ; 3-state checkbox or toolbar button
 STATE_SYSTEM_INDETERMINATE      EQU STATE_SYSTEM_MIXED
 STATE_SYSTEM_READONLY           EQU 00000040h
 STATE_SYSTEM_HOTTRACKED         EQU 00000080h
 STATE_SYSTEM_DEFAULT            EQU 00000100h
 STATE_SYSTEM_EXPANDED           EQU 00000200h
 STATE_SYSTEM_COLLAPSED          EQU 00000400h
 STATE_SYSTEM_BUSY               EQU 00000800h
 STATE_SYSTEM_FLOATING           EQU 00001000h  ; Children "owned" not "contained" by parent
 STATE_SYSTEM_MARQUEED           EQU 00002000h
 STATE_SYSTEM_ANIMATED           EQU 00004000h
 STATE_SYSTEM_INVISIBLE          EQU 00008000h
 STATE_SYSTEM_OFFSCREEN          EQU 00010000h
 STATE_SYSTEM_SIZEABLE           EQU 00020000h
 STATE_SYSTEM_MOVEABLE           EQU 00040000h
 STATE_SYSTEM_SELFVOICING        EQU 00080000h
 STATE_SYSTEM_FOCUSABLE          EQU 00100000h
 STATE_SYSTEM_SELECTABLE         EQU 00200000h
 STATE_SYSTEM_LINKED             EQU 00400000h
 STATE_SYSTEM_TRAVERSED          EQU 00800000h
 STATE_SYSTEM_MULTISELECTABLE    EQU 01000000h  ; Supports multiple selection
 STATE_SYSTEM_EXTSELECTABLE      EQU 02000000h  ; Supports extended selection
 STATE_SYSTEM_ALERT_LOW          EQU 04000000h  ; This information is of low priority
 STATE_SYSTEM_ALERT_MEDIUM       EQU 08000000h  ; This information is of medium priority
 STATE_SYSTEM_ALERT_HIGH         EQU 10000000h  ; This information is of high priority
 STATE_SYSTEM_REDUNDANT          EQU 20000000h  ; this child object's data is also represented by it's parent
 STATE_SYSTEM_ONLY_REDUNDANT     EQU 40000000h  ; this object has children, but they are all redundant
 STATE_SYSTEM_VALID              EQU 7FFFFFFFh

 CCHILDREN_TITLEBAR              EQU 5
 CCHILDREN_SCROLLBAR             EQU 5

 CURSOR_SHOWING                  EQU 00000001h

; Commands to pass to WinHelp()

 HELP_CONTEXT     = 0001h
 HELP_QUIT        = 0002h
 HELP_INDEX       = 0003h
 HELP_CONTENTS    = 0003h
 HELP_HELPONHELP  = 0004h
 HELP_SETINDEX    = 0005h
 HELP_SETCONTENTS = 0005h
 HELP_CONTEXTPOPUP = 0008h
 HELP_FORCEFILE   = 0009h
 HELP_KEY         = 0101h
 HELP_COMMAND     = 0102h
 HELP_PARTIALKEY  = 0105h
 HELP_MULTIKEY    = 0201h
 HELP_SETWINPOS   = 0203h
 HELP_CONTEXTMENU = 000ah
 HELP_FINDER      = 000bh
 HELP_WM_HELP     = 000ch
 HELP_SETPOPUP_POS = 000dh

 HELP_TCARD             = 8000h
 HELP_TCARD_DATA        = 0010h
 HELP_TCARD_OTHER_CALLER  = 0011h

 IDH_NO_HELP                =     28440
 IDH_MISSING_CONTEXT        =     28441
 IDH_GENERIC_HELP_BUTTON    =     28442
 IDH_OK                     =     28443
 IDH_CANCEL                 =     28444
 IDH_HELP                   =     28445

OSVERSIONINFOA          STRUCT
    dwOSVersionInfoSize DD ?
    dwMajorVersion      DD ?
    dwMinorVersion      DD ?
    dwBuildNumber       DD ?
    dwPlatformId        DD ?
    szCSDVersion        DB 128 DUP(?)
OSVERSIONINFOA          ENDS


;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´           END OF FILE            ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

;                             wasn't it obvious ? ;-)
