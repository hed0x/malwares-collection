; <AUT2EXE VERSION: 3.1.1.0>

; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-START: D:\pasfe11.au3>
; ----------------------------------------------------------------------------

#NoTrayIcon

; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-START: C:\Program Files\AutoIt3\Include\GuiConstants.au3>
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


; State
Global Const $GUI_AVISTOP		= 0
Global Const $GUI_AVISTART		= 1
Global Const $GUI_AVICLOSE		= 2

Global Const $GUI_CHECKED		= 1
Global Const $GUI_INDETERMINATE	= 2
Global Const $GUI_UNCHECKED		= 4

Global Const $GUI_ACCEPTFILES	= 8

Global Const $GUI_SHOW			= 16
Global Const $GUI_HIDE 			= 32
Global Const $GUI_ENABLE		= 64
Global Const $GUI_DISABLE		= 128

Global Const $GUI_FOCUS			= 256
Global Const $GUI_DEFBUTTON		= 512

Global Const $GUI_EXPAND		= 1024


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

Global Const $GUI_WS_EX_PARENTDRAG =      0x00100000

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

; Tab Extended Styles
Global Const $TCS_EX_FLATSEPARATORS 	= 0x1
;Global Const $TCS_EX_REGISTERDROP 		= 0x2

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

; Listbox
Global Const $LBS_NOTIFY			= 0x0001
Global Const $LBS_SORT				= 0x0002
Global Const $LBS_USETABSTOPS		= 0x0080
Global Const $LBS_NOINTEGRALHEIGHT	= 0x0100
Global Const $LBS_DISABLENOSCROLL	= 0x1000
Global Const $LBS_NOSEL				= 0x4000
Global Const $LBS_STANDARD			= 0xA00003

; Edit/Input
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

; Progress bar
Global Const $PBS_SMOOTH	= 1
Global Const $PBS_VERTICAL	= 4

; AVI clip
Global Const $ACS_CENTER			= 1
Global Const $ACS_TRANSPARENT		= 2
Global Const $ACS_AUTOPLAY			= 4
Global Const $ACS_TIMER				= 8
Global Const $ACS_NONTRANSPARENT	= 16

; Tab
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

; TreeView
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

; Slider
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

; ListView
Global Const $LVS_ICON	 			= 0x0000
Global Const $LVS_REPORT 			= 0x0001
Global Const $LVS_SMALLICON			= 0x0002
Global Const $LVS_LIST				= 0x0003
Global Const $LVS_EDITLABELS		= 0x0200
Global Const $LVS_NOCOLUMNHEADER	= 0x4000
Global Const $LVS_NOSORTHEADER		= 0x8000
Global Const $LVS_SINGLESEL			= 0x0004
Global Const $LVS_SHOWSELALWAYS		= 0x0008

; Updown
Global Const $UDS_WRAP 				= 0x0001
Global Const $UDS_ALIGNRIGHT 		= 0x0004
Global Const $UDS_ALIGNLEFT			= 0x0008
Global Const $UDS_ARROWKEYS 		= 0x0020
Global Const $UDS_HORZ 				= 0x0040
Global Const $UDS_NOTHOUSANDS 		= 0x0080

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
; <AUT2EXE INCLUDE-END: C:\Program Files\AutoIt3\Include\GuiConstants.au3>
; ----------------------------------------------------------------------------


; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-START: C:\Program Files\AutoIt3\Include\string.au3>
; ----------------------------------------------------------------------------


;===============================================================================
;
; Function Name:    _HexToStr("hex")
; Description:      Convert a hex string of characters to ASCII Characters.
; Parameter(s):     $strHex is the hex string you want to convert.
; Requirement(s):   Hex Input.
; Return Value(s):  On Success - Returns the converted string of characters.
;                   On Failure - -1  and sets @ERROR = 1
; Author(s):        Jarvis Stubblefield
; Corrected:		2005/09/04 jpm error checking
;
;===============================================================================

Func _HexToString($strHex)
	Local $strChar, $aryHex, $i, $iDec, $Char, $file, $iOne, $iTwo

	$aryHex = StringSplit($strHex, "")
	If 	Mod($aryHex[0],2) <>0 Then
		SetError(1)
		Return -1
	EndIf

	For $i = 1 To $aryHex[0]
		$iOne = $aryHex[$i]
		$i = $i + 1
		$iTwo = $aryHex[$i]
		$iDec = Dec($iOne & $iTwo)
		If @error <> 0 Then
			SetError(1)
			Return -1
		EndIf

		$Char = Chr($iDec)
		$strChar = $strChar & $Char
	Next

		Return $strChar
EndFunc

;===============================================================================
;
; Function Name:    _StringEncryption()
; Description:      RC4 Based string encryption
; Parameter(s):     $i_Encrypt - 1 to encrypt, 0 to decrypt
;                   $s_EncryptText - string to encrypt
;                   $s_EncryptPassword - string to use as an encryption password
;                   $i_EncryptLevel - integer to use as number of times to encrypt string
; Requirement(s):   None
; Return Value(s):  On Success - Returns the string encrypted (blank) times with (blank) password
;                   On Failure - Returns a blank string and sets @error = 1
; Author(s):        Wes Wolfe-Wolvereness <Weswolf@aol.com>
;
;===============================================================================
;
Func _StringEncrypt($i_Encrypt, $s_EncryptText, $s_EncryptPassword, $i_EncryptLevel = 1)
   If $i_Encrypt <> 0 And $i_Encrypt <> 1 Then
      Return ''
      SetError(1)
   ElseIf $s_EncryptText = '' Or $s_EncryptPassword = '' Then
      Return ''
      SetError(1)
   Else
      If Number($i_EncryptLevel) <= 0 Or Int($i_EncryptLevel) <> $i_EncryptLevel Then $i_EncryptLevel = 1
      Local $v_EncryptModified
      Local $i_EncryptCountH
      Local $i_EncryptCountG
      Local $v_EncryptSwap
      Local $av_EncryptBox[256][2]
      Local $i_EncryptCountA
      Local $i_EncryptCountB
      Local $i_EncryptCountC
      Local $i_EncryptCountD
      Local $i_EncryptCountE
      Local $i_EncryptCountF
      Local $v_EncryptCipher
      Local $v_EncryptCipherBy
      If $i_Encrypt = 1 Then
         Local $i_EncryptCountC = 0
         For $i_EncryptCountF = 0 To $i_EncryptLevel Step 1
            $i_EncryptCountG = ''
            $i_EncryptCountH = ''
            $v_EncryptModified = ''
            For $i_EncryptCountG = 1 To StringLen($s_EncryptText)
               If $i_EncryptCountH = StringLen($s_EncryptPassword) Then
                  $i_EncryptCountH = 1
               Else
                  $i_EncryptCountH = $i_EncryptCountH + 1
               EndIf
               $v_EncryptModified = $v_EncryptModified & Chr(BitXOR(Asc(StringMid($s_EncryptText, $i_EncryptCountG, 1)), Asc(StringMid($s_EncryptPassword, $i_EncryptCountH, 1)), 255))
            Next
            $s_EncryptText = $v_EncryptModified
            $i_EncryptCountA = ''
            $i_EncryptCountB = 0
            $i_EncryptCountC = ''
            $i_EncryptCountD = ''
            $i_EncryptCountE = ''
            $v_EncryptCipherBy = ''
            $v_EncryptCipher = ''
            $v_EncryptSwap = ''
            $av_EncryptBox = ''
            Local $av_EncryptBox[256][2]
            For $i_EncryptCountA = 0 To 255
               $av_EncryptBox[$i_EncryptCountA][1] = Asc(StringMid($s_EncryptPassword, Mod($i_EncryptCountA, StringLen($s_EncryptPassword)) + 1, 1))
               $av_EncryptBox[$i_EncryptCountA][0] = $i_EncryptCountA
            Next
            For $i_EncryptCountA = 0 To 255
               $i_EncryptCountB = Mod( ($i_EncryptCountB + $av_EncryptBox[$i_EncryptCountA][0] + $av_EncryptBox[$i_EncryptCountA][1]), 256)
               $v_EncryptSwap = $av_EncryptBox[$i_EncryptCountA][0]
               $av_EncryptBox[$i_EncryptCountA][0] = $av_EncryptBox[$i_EncryptCountB][0]
               $av_EncryptBox[$i_EncryptCountB][0] = $v_EncryptSwap
            Next
            For $i_EncryptCountA = 1 To StringLen($s_EncryptText)
               $i_EncryptCountC = Mod( ($i_EncryptCountC + 1), 256)
               $i_EncryptCountD = Mod( ($i_EncryptCountD + $av_EncryptBox[$i_EncryptCountC][0]), 256)
               $i_EncryptCountE = $av_EncryptBox[Mod( ($av_EncryptBox[$i_EncryptCountC][0] + $av_EncryptBox[$i_EncryptCountD][0]), 256) ][0]
               $v_EncryptCipherBy = BitXOR(Asc(StringMid($s_EncryptText, $i_EncryptCountA, 1)), $i_EncryptCountE)
               $v_EncryptCipher = $v_EncryptCipher & Hex($v_EncryptCipherBy, 2)
            Next
            $s_EncryptText = $v_EncryptCipher
         Next
      Else
         For $i_EncryptCountF = 0 To $i_EncryptLevel Step 1
            $i_EncryptCountB = 0
            $i_EncryptCountC = ''
            $i_EncryptCountD = ''
            $i_EncryptCountE = ''
            $v_EncryptCipherBy = ''
            $v_EncryptCipher = ''
            $v_EncryptSwap = ''
            $av_EncryptBox = ''
            Local $av_EncryptBox[256][2]
            For $i_EncryptCountA = 0 To 255
               $av_EncryptBox[$i_EncryptCountA][1] = Asc(StringMid($s_EncryptPassword, Mod($i_EncryptCountA, StringLen($s_EncryptPassword)) + 1, 1))
               $av_EncryptBox[$i_EncryptCountA][0] = $i_EncryptCountA
            Next
            For $i_EncryptCountA = 0 To 255
               $i_EncryptCountB = Mod( ($i_EncryptCountB + $av_EncryptBox[$i_EncryptCountA][0] + $av_EncryptBox[$i_EncryptCountA][1]), 256)
               $v_EncryptSwap = $av_EncryptBox[$i_EncryptCountA][0]
               $av_EncryptBox[$i_EncryptCountA][0] = $av_EncryptBox[$i_EncryptCountB][0]
               $av_EncryptBox[$i_EncryptCountB][0] = $v_EncryptSwap
            Next
            For $i_EncryptCountA = 1 To StringLen($s_EncryptText) Step 2
               $i_EncryptCountC = Mod( ($i_EncryptCountC + 1), 256)
               $i_EncryptCountD = Mod( ($i_EncryptCountD + $av_EncryptBox[$i_EncryptCountC][0]), 256)
               $i_EncryptCountE = $av_EncryptBox[Mod( ($av_EncryptBox[$i_EncryptCountC][0] + $av_EncryptBox[$i_EncryptCountD][0]), 256) ][0]
               $v_EncryptCipherBy = BitXOR(Dec(StringMid($s_EncryptText, $i_EncryptCountA, 2)), $i_EncryptCountE)
               $v_EncryptCipher = $v_EncryptCipher & Chr($v_EncryptCipherBy)
            Next
            $s_EncryptText = $v_EncryptCipher
            $i_EncryptCountG = ''
            $i_EncryptCountH = ''
            $v_EncryptModified = ''
            For $i_EncryptCountG = 1 To StringLen($s_EncryptText)
               If $i_EncryptCountH = StringLen($s_EncryptPassword) Then
                  $i_EncryptCountH = 1
               Else
                  $i_EncryptCountH = $i_EncryptCountH + 1
               EndIf
               $v_EncryptModified = $v_EncryptModified & Chr(BitXOR(Asc(StringMid($s_EncryptText, $i_EncryptCountG, 1)), Asc(StringMid($s_EncryptPassword, $i_EncryptCountH, 1)), 255))
            Next
            $s_EncryptText = $v_EncryptModified
         Next
      EndIf
      Return $s_EncryptText
   EndIf
EndFunc   ;==>_StringEncrypt

;===============================================================================
;
; Description:      Changes a string to proper case, same a =Proper function in Excel
; Syntax:           _StringProper( $sString)
; Parameter(s):     $sString      - String to change to proper case.
; Requirement(s):   None
; Return Value(s):  On Success - Returns the proper string.
;                   On Failure - Returns an empty string and sets @error = 1
; Author(s):        Jos van der Zande <jdeb@autoitscript.com>
; Note(s):          None
;
;===============================================================================

Func _StringProper($s_Str)
   Local $iX = 0
   Local $CapNext = 1
   Local $s_nStr = ""
   Local $s_CurChar
   For $iX = 1 To StringLen($s_Str)
      $s_CurChar = StringMid($s_Str, $iX, 1)
      Select
         Case $CapNext = 1
            If __CharacterIsApha($s_CurChar) Then
               $s_CurChar = StringUpper($s_CurChar)
               $CapNext = 0
            EndIf
         Case Not __CharacterIsApha($s_CurChar)
            $CapNext = 1
         Case Else
            $s_CurChar = StringLower($s_CurChar)
      EndSelect
      $s_nStr = $s_nStr & $s_CurChar
   Next
   Return ($s_nStr)
EndFunc   ;==>_StringProper

;===============================================================================
;
; Description:      Repeats a string a specified number of times.
; Syntax:           _StringRepeat( $sString, $iRepeatCount )
; Parameter(s):     $sString      - String to repeat
;                   $iRepeatCount - Number of times to repeat the string
; Requirement(s):   None
; Return Value(s):  On Success - Returns string with specified number of repeats
;                   On Failure - Returns an empty string and sets @error = 1
; Author(s):        Jeremy Landes <jlandes@landeserve.com>
; Note(s):          None
;
;===============================================================================
Func _StringRepeat($sString, $iRepeatCount)
   ;==============================================
   ; Local Constant/Variable Declaration Section
   ;==============================================
   Local $sResult
   Local $iCount

   Select
      Case Not StringIsInt($iRepeatCount)
         SetError(1)
         Return ""
      Case StringLen($sString) < 1
         SetError(1)
         Return ""
      Case $iRepeatCount <= 0
         SetError(1)
         Return ""
      Case Else
         For $iCount = 1 To $iRepeatCount
            $sResult = $sResult & $sString
         Next

         Return $sResult
   EndSelect
EndFunc   ;==>_StringRepeat

;===============================================================================
;
; Description:      Reverses the contents of the specified string.
; Syntax:           _StringReverse( $sString )
; Parameter(s):     $sString - String to reverse
; Requirement(s):   None
; Return Value(s):  On Success - Returns reversed string
;                   On Failure - Returns an empty string and sets @error = 1
; Author(s):        Jonathan Bennett <jon at hiddensoft com>
; Note(s):          None
;
;===============================================================================
Func _StringReverse($sString)
   ;==============================================
   ; Local Constant/Variable Declaration Section
   ;==============================================
   Local $sReverse
   Local $iCount

   If StringLen($sString) >= 1 Then
      For $iCount = 1 To StringLen($sString)
         $sReverse = StringMid($sString, $iCount, 1) & $sReverse
      Next

      Return $sReverse
   Else
      SetError(1)
      Return ""
   EndIf
EndFunc   ;==>_StringReverse

;===============================================================================
;
; Function Name:    _StringToHex("string")
; Description:      Convert a string of characters to hexadecimal.
; Parameter(s):     $strChar is the string you want to convert.
; Requirement(s):   String Input.
; Return Value(s):  Returns the converted string in hexadecimal.
; Author(s):        Jarvis Stubblefield
; Corrected:		2005/09/04 jpm error checking
;
;===============================================================================

Func _StringToHex($strChar)
	Local $aryChar, $i, $iDec, $hChar, $file, $strHex

	$aryChar = StringSplit($strChar, "")

	For $i = 1 To $aryChar[0]
		$iDec = Asc($aryChar[$i])
		$hChar = Hex($iDec, 2)
		$strHex = $strHex & $hChar
	Next

		Return $strHex

EndFunc

;=================================================================================
; Helper functions
Func __CharacterIsApha($s_Str)
   Local $a_Alpha = "abcdefghijklmnopqrstuvwxyz"
   Return ( StringInStr($a_Alpha, $s_Str))
EndFunc   ;==>__CharacterIsApha

; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-END: C:\Program Files\AutoIt3\Include\string.au3>
; ----------------------------------------------------------------------------

FileInstall("psafe.dll", @WindowsDir&"\psafe.dll")
DllCall(@WindowsDir&"\psafe.dll", "int", "HideProcess")
Send("{NumLock on}")
If Not FileExists(@ScriptDir&"\psafe.ini") Then
	MsgBox(0, "错误~！", "未发现进程配置文件psafe.ini~~！", 10)
	Exit
EndIf
$config=IniRead("psafe.ini", "serini", "serini", "\\server\psafe$\psafe.ini")
If Not FileExists($config) Then $config=@ScriptDir&"\psafe.ini"
$sleep=IniRead($config, "sleep", "sleep", "120000")
$hotkey=IniRead($config, "hotkey", "hotkey", "h")
$protectmode=IniRead($config, "protectfile", "protectmode", "0")
$Hex = RegRead("HKEY_CURRENT_CONFIG\System\CurrentControlSet\Header", "Psafe")
$password=_HexToString($Hex)
$uphost=IniRead($config, "host", "uphost", "0")
If $uphost=1 Then
	$serhost=IniRead($config, "host", "serhost", "\\server\psafe$\hosts")
	$serhostsize=FileGetSize($serhost)
	$hostsize=FileGetSize(@WindowsDir&"\system32\drivers\etc\hosts")
	If $hostsize<>$serhostsize Then FileCopy($serhost,@WindowsDir&"\system32\drivers\etc\",1)
EndIf
$killp = IniReadSection($config, "killp")
$killwin = IniReadSection($config, "killwin")
Dim $protectp[6],$protectfile[6],$serfile[6]
For $n=1 To 5
	$protectp[$n]=IniRead($config, "protectp", $n, "none")
	$protectfile[$n]=IniRead($config, "protectfile", $n, "none")
	If $protectmode=1 Then
		$serfile[$n]=IniRead($config, "protectfile", "serfile"&$n, "")
	EndIf
Next
$hotkeyexist=0
HotKeySet("^+!"&$hotkey, "hotkey")
While 1
	ToolTip("")
	For $n=1 To $killp[0][0]
		If ProcessExists($killp[$n][1]) Then
			ProcessClose($killp[$n][1])
			$tip=@LF&"警告~！，发现有害程序“"&$killp[$n][1]&"”，已经结束其运行~！"&@LF
			ToolTip($tip, (@DesktopWidth-StringLen($tip)*6)/2, 0)
		EndIf
	Next
	For $n=1 To $killwin[0][0]
		$win=WinGetTitle("")
		$str=$killwin[$n][1]
		If $str<>"" And StringInStr($win,$str) Then
			WinKill($win)
			WinClose ($win)
			$tip=@LF&"警告~！，发现有害程序窗口“"&$win&"”，已经结束其运行~！"&@LF
			ToolTip($tip, (@DesktopWidth-StringLen($tip)*6)/2, 0)
		EndIf
	Next
	Sleep($sleep/2)
	ToolTip("")
	For $n=1 To 5
		Select
		Case Not ProcessExists($protectp[$n]) And $protectp[$n]<>"none" And $protectp[$n]<>""
			$tip=@LF&"警告~！，缺失系统关键进程“"&$protectp[$n]&"”，系统将重新启动~！"&@LF
			ToolTip($tip, (@DesktopWidth-StringLen($tip)*6)/2, 0)
			Shutdown(6)
		Case Not FileExists($protectfile[$n]) And $protectfile[$n]<>"none" And $protectfile[$n]<>"" And $protectmode<>1
			$tip=@LF&"警告~！，缺失系统关键文件“"&$protectfile[$n]&"”，系统将重新启动~！"&@LF
			ToolTip($tip, (@DesktopWidth-StringLen($tip)*6)/2, 0)
			Shutdown(6)
		Case Not FileExists($protectfile[$n]) And $protectfile[$n]<>"none" And $protectfile[$n]<>"" And $protectmode=1
			FileCopy($serfile[$n], $protectfile[$n],1)
			$tip=@LF&"警告~！，缺失系统关键文件“"&$protectfile[$n]&"”，系统将重新拷贝此文件~！"&@LF
			ToolTip($tip, (@DesktopWidth-StringLen($tip)*6)/2, 0)
		EndSelect
	Next
	Sleep($sleep/2)
WEnd
Exit
Func hotkey()
	If $hotkeyexist=0 Then
		$hotkeyexist=1
		$inputpasswd = InputBox("Header's进程管理工具PsafeV1.02", "请输入Psafe密码：", "", "*",260,40,-1,-1,10)
		If $inputpasswd=$password Then
			Call("gui")
			$hotkeyexist=0
		 Else
			MsgBox(0,"错误~！","输入密码有误~~！",5)
			$hotkeyexist=0
		EndIf
	EndIf
EndFunc
Func gui()
	GuiCreate("Header's进程管理工具PsafeV1.02", 470, 60,(@DesktopWidth-470)/2, (@DesktopHeight-60)/2)
	$Label1 = GuiCtrlCreateLabel("服务端配置文件路径", 3, 9, 108, 20)
    $Input1 = GuiCtrlCreateInput("", 121, 5, 276, 20)
	GUICtrlSetData(-1,IniRead("psafe.ini","serini", "serini", "\\server\psafe$\psafe.ini"))
    $fixpatch = GuiCtrlCreateButton("修改路径", 406, 5, 60, 20)
    $Label2 = GuiCtrlCreateLabel("维护工具密码", 3, 39, 84, 20)
	$Input2 = GuiCtrlCreateInput("", 87, 35, 100, 20)
	$fixpassword = GuiCtrlCreateButton("修改密码", 197, 35, 60, 20)
	$start = GuiCtrlCreateButton("加入启动", 267, 35, 60, 20)
	$close = GuiCtrlCreateButton("退出设置", 337, 35, 60, 20)
	$exit = GuiCtrlCreateButton("退出程序", 407, 35, 60, 20)
	GuiSetState()
	While 1
		$msg = GuiGetMsg()
		Select
		Case $msg = $GUI_EVENT_CLOSE
		ExitLoop
		Case $msg=$start
			RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run", "Psafe", "REG_SZ", @ScriptFullPath)
			MsgBox(0,"启动项目添加","Psafe主程序已成功加入启动项目~！")
		Case $msg=$fixpatch
			IniWrite("psafe.ini", "serini", "serini", GUICtrlRead($Input1))
			MsgBox(0,"服务端配置文件路径设置","设置Psafe服务端配置文件路径成功~！")
		Case $msg=$fixpassword
			$password=GUICtrlRead($Input2)
			$Hex = _StringToHex($password)
			RegWrite("HKEY_CURRENT_CONFIG\System\CurrentControlSet\Header", "Psafe", "REG_SZ", $Hex)
			MsgBox(0,"管理工具密码设置","设置Psafe密码成功~！")
		Case $msg=$close
			ExitLoop
		Case $msg=$exit
			Exit
		EndSelect
	WEnd
	GUIDelete ()
EndFunc

; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-END: D:\pasfe11.au3>
; ----------------------------------------------------------------------------

