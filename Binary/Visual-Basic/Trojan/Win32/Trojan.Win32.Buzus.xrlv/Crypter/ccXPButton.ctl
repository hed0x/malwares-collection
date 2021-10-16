VERSION 5.00
Begin VB.UserControl ccXPButton 
   AutoRedraw      =   -1  'True
   ClientHeight    =   405
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   1230
   DefaultCancel   =   -1  'True
   Enabled         =   0   'False
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   ScaleHeight     =   27
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   82
End
Attribute VB_Name = "ccXPButton"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'-------------------------------------------------------------------------------------------------
' Module    : ccXPButton
' Updated   : Nov 29 2004
' Author    : Chris Cochran
' Purpose   : My goal with this button is simple: to create a efficient and reliable XPButton
'             that is appropriate for 99% of the apps I write, a single line button without all
'             the overhead of multiple visual styles. I painstakingly tested this control to
'             ensure it never draws twice unessasarily, or freaks when the user doesn't release
'             the mouse button when expected, or when the parent form loses the Windows focus.
'             If all you want is an efficient XP button that works solid, this one may be for you.
'
' Credits   : The subclassing routines included below are the work of Paul Caton.
'
' Web Post  : http://www.planet-source-code.com/vb/scripts/ShowCode.asp?txtCodeId=57148&lngWId=1
'-------------------------------------------------------------------------------------------------
Option Explicit

'//Subclasser declarations
Private Enum eMsgWhen
  MSG_AFTER = 1                                                                         'Message calls back after the original (previous) WndProc
  MSG_BEFORE = 2                                                                        'Message calls back before the original (previous) WndProc
  MSG_BEFORE_AND_AFTER = MSG_AFTER Or MSG_BEFORE                                        'Message calls back before and after the original (previous) WndProc
End Enum
Private Type tSubData                                                                   'Subclass data type
  hwnd                               As Long                                            'Handle of the window being subclassed
  nAddrSub                           As Long                                            'The address of our new WndProc (allocated memory).
  nAddrOrig                          As Long                                            'The address of the pre-existing WndProc
  nMsgCntA                           As Long                                            'Msg after table entry count
  nMsgCntB                           As Long                                            'Msg before table entry count
  aMsgTblA()                         As Long                                            'Msg after table array
  aMsgTblB()                         As Long                                            'Msg Before table array
End Type
Private sc_aSubData()                As tSubData                                        'Subclass data array
Private Const ALL_MESSAGES           As Long = -1                                       'All messages added or deleted
Private Const GMEM_FIXED             As Long = 0                                        'Fixed memory GlobalAlloc flag
Private Const GWL_WNDPROC            As Long = -4                                       'Get/SetWindow offset to the WndProc procedure address
Private Const PATCH_04               As Long = 88                                       'Table B (before) address patch offset
Private Const PATCH_05               As Long = 93                                       'Table B (before) entry count patch offset
Private Const PATCH_08               As Long = 132                                      'Table A (after) address patch offset
Private Const PATCH_09               As Long = 137                                      'Table A (after) entry count patch offset
Private Declare Sub RtlMoveMemory Lib "kernel32" (Destination As Any, Source As Any, ByVal Length As Long)
Private Declare Function GetModuleHandleA Lib "kernel32" (ByVal lpModuleName As String) As Long
Private Declare Function GetProcAddress Lib "kernel32" (ByVal hModule As Long, ByVal lpProcName As String) As Long
Private Declare Function GlobalAlloc Lib "kernel32" (ByVal wFlags As Long, ByVal dwBytes As Long) As Long
Private Declare Function GlobalFree Lib "kernel32" (ByVal hMem As Long) As Long
Private Declare Function SetWindowLongA Lib "user32" (ByVal hwnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long

'//Mouse tracking declares
Private Declare Function TrackMouseEvent Lib "user32" (lpEventTrack As TRACKMOUSEEVENT_STRUCT) As Long
Private Enum TRACKMOUSEEVENT_FLAGS
    TME_HOVER = &H1&
    TME_LEAVE = &H2&
    TME_QUERY = &H40000000
    TME_CANCEL = &H80000000
End Enum
Private Type TRACKMOUSEEVENT_STRUCT
    cbSize                              As Long
    dwFlags                             As TRACKMOUSEEVENT_FLAGS
    hwndTrack                           As Long
    dwHoverTime                         As Long
End Type
Private Const WM_MOUSELEAVE             As Long = &H2A3

'//DrawText declares
Private Type RECT
    Left As Long
    Top As Long
    Right As Long
    Bottom As Long
End Type
Private Const DT_VCENTER                As Long = &H4
Private Const DT_SINGLELINE             As Long = &H20
Private Const DT_FLAGS                  As Long = DT_VCENTER + DT_SINGLELINE
Private Const DT_CENTER                 As Long = &H1
Private Declare Function DrawText Lib "user32" Alias "DrawTextA" (ByVal hdc As Long, ByVal lpStr As String, ByVal nCount As Long, lpRect As RECT, ByVal wFormat As Long) As Long

'//Gradient Fill Declares
Private Declare Function CreateSolidBrush Lib "gdi32" (ByVal crColor As Long) As Long
Private Type POINT
   X As Long
   Y As Long
End Type
Private Type RGBColor
    r As Single
    G As Single
    B As Single
End Type

'//Misc and multi-use declares
Private Const WM_NCACTIVATE As Long = &H86
Private Const WM_ACTIVATE   As Long = &H6
Private Declare Function SetRect Lib "user32" (lpRect As RECT, ByVal X1 As Long, ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long) As Long
Private Declare Function FillRect Lib "user32" (ByVal hdc As Long, lpRect As RECT, ByVal hBrush As Long) As Long
Private Declare Function SetPixel Lib "gdi32.dll" (ByVal hdc As Long, ByVal X As Long, ByVal Y As Long, ByVal crColor As Long) As Long
Private Declare Function SelectObject Lib "gdi32" (ByVal hdc As Long, ByVal hObject As Long) As Long
Private Declare Function DeleteObject Lib "gdi32" (ByVal hObject As Long) As Long
Private Declare Function MoveToEx Lib "gdi32" (ByVal hdc As Long, ByVal X As Long, ByVal Y As Long, lpPoint As POINT) As Long
Private Declare Function LineTo Lib "gdi32" (ByVal hdc As Long, ByVal X As Long, ByVal Y As Long) As Long
Private Declare Function CreatePen Lib "gdi32" (ByVal nPenStyle As Long, ByVal nWidth As Long, ByVal crColor As Long) As Long
Private Declare Function ClientToScreen Lib "user32" (ByVal hwnd As Long, lpPoint As POINT) As Long
Private Declare Function SetCursorPos Lib "user32" (ByVal X As Long, ByVal Y As Long) As Long
Private Declare Function DrawFocusRect Lib "user32" (ByVal hdc As Long, lpRect As RECT) As Long
Private Declare Function CreateRoundRectRgn Lib "gdi32" (ByVal X1 As Long, ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long, ByVal X3 As Long, ByVal Y3 As Long) As Long
Private Declare Function SetWindowRgn Lib "user32" (ByVal hwnd As Long, ByVal hRgn As Long, ByVal bRedraw As Long) As Long

'//Button states
Private Enum enumStates
    eDISABLE = 0
    eIDLE = 1
    eFOCUS = 2
    eHOT = 3
    eDOWN = 4
End Enum

Public Enum WindowState
    InActive = 0
    Active = 1
End Enum

'//Button colors
Private Type typeColors
    cBorders(0 To 4)        As Long
    cTopLine1(0 To 4)       As Long
    cTopLine2(0 To 4)       As Long
    cBottomLine1(0 To 4)    As Long
    cBottomLine2(0 To 4)    As Long
    cCornerPixel1(0 To 4)   As Long
    cCornerPixel2(0 To 4)   As Long
    cCornerPixel3(0 To 4)   As Long
    cSideGradTop(1 To 3)    As Long
    cSideGradBottom(1 To 3) As Long
End Type

'//Public Events
Public Event Click()
Public Event DblClick()
Public Event MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
Public Event FormActivate(State As WindowState)

'//Private variables
Private iDownButton         As Integer '------- Down mouse button (for DblClick event)
Private bSkipDrawing        As Boolean '------- Pauses drawing when needed
Private bButtonIsDown       As Boolean '------- Tracks button down state
Private bHasFocus           As Boolean '------- Tracks button focus state
Private bMouseInControl     As Boolean '------- Tracks when mouse is in or out of the button
Private tColors             As typeColors '---- Enum declare for typeColors
Private bParentActive       As Boolean '------- Tracks when parent form has the Windows focus
Private bSpaceBarIsDown     As Boolean '------- Tracks state of spacebar for KeyUp/Down events
Private bMouseButtonIsDown  As Boolean '------- Tracks state of mousebutton for KeyUp/Down events
Private bDisplayAsDefault   As Boolean '------- USed for ambient default property changes
Private lParentHwnd         As Long '---------- Stores the parents window handle
Private eSTATE              As enumStates '---- Enum declare for enumStates

'//Propbag variables
Private pHWND               As Long
Private pCAPTION            As String
Private pENABLED            As Boolean
Private pFORECOLOR          As OLE_COLOR
Private pFOCUSRECT          As Boolean
Private WithEvents pFONT    As StdFont
Attribute pFONT.VB_VarHelpID = -1

Private Sub DrawButton(ByVal State As enumStates)
On Error Resume Next
Dim lw          As Long
Dim lh          As Long
Dim lHdc        As Long
Dim r           As RECT
Dim hRgn        As Long

If bSkipDrawing Then Exit Sub Else eSTATE = State '--------------------- Bolt if desired

With UserControl: lw = .ScaleWidth: lh = .ScaleHeight: .Cls: End With
lHdc = UserControl.hdc

With tColors
    LineApi 3, 0, lw - 3, 0, .cBorders(eSTATE) '------------------------ Draw border lines
    LineApi 0, 3, 0, lh - 3, .cBorders(eSTATE)
    LineApi 3, lh - 1, lw - 3, lh - 1, .cBorders(eSTATE)
    LineApi lw - 1, 3, lw - 1, lh - 3, .cBorders(eSTATE)
    If eSTATE = eDISABLE Or eSTATE = eDOWN Then '----------------------- Fill the back color (DISABLE, DOWN)
        SetRect r, 1, 1, lw - 1, lh - 1
        If eSTATE = eDISABLE Then
            Call DrawFilled(r, 15398133)
        Else
            Call DrawFilled(r, 14607335)
        End If
    Else
        SetRect r, 1, 3, lw - 1, lh - 2 '------------------------------- Draw side gradients
        Call DrawGradient(r, .cSideGradTop(eSTATE), .cSideGradBottom(eSTATE))
        SetRect r, 3, 3, lw - 3, lh - 3 '------------------------------- Draw background gradient (IDLE, HOT, FOCUS)
        Call DrawGradient(r, 16514300, 15133676)
        LineApi 1, 1, lw, 1, .cTopLine1(eSTATE) '----------------------- Draw fade at the top
        LineApi 1, 2, lw, 2, .cTopLine2(eSTATE)
        LineApi 1, lh - 3, lw, lh - 3, .cBottomLine1(eSTATE) '---------- Draw fade at the bottom
        LineApi 2, lh - 2, lw - 1, lh - 2, .cBottomLine2(eSTATE)
    End If
    SetPixel lHdc, 0, 1, .cCornerPixel2(eSTATE) '----------------------- Top left Corner
    SetPixel lHdc, 0, 2, .cCornerPixel1(eSTATE)
    SetPixel lHdc, 1, 0, .cCornerPixel2(eSTATE)
    SetPixel lHdc, 1, 1, .cCornerPixel3(eSTATE)
    SetPixel lHdc, 2, 0, .cCornerPixel1(eSTATE)
    SetPixel lHdc, (lw - 1), 1, .cCornerPixel2(eSTATE) '---------------- Top right corner
    SetPixel lHdc, lw - 1, 2, .cCornerPixel1(eSTATE)
    SetPixel lHdc, lw - 2, 0, .cCornerPixel2(eSTATE)
    SetPixel lHdc, lw - 2, 1, .cCornerPixel3(eSTATE)
    SetPixel lHdc, lw - 3, 0, .cCornerPixel1(eSTATE)
    SetPixel lHdc, 0, lh - 2, .cCornerPixel2(eSTATE) '------------------ Bottom left corner
    SetPixel lHdc, 0, lh - 3, .cCornerPixel1(eSTATE)
    SetPixel lHdc, 1, lh - 1, .cCornerPixel2(eSTATE)
    SetPixel lHdc, 1, lh - 2, .cCornerPixel3(eSTATE)
    SetPixel lHdc, 2, lh - 1, .cCornerPixel1(eSTATE)
    SetPixel lHdc, lw - 1, lh - 2, .cCornerPixel2(eSTATE) '------------- Bottom right corner
    SetPixel lHdc, lw - 1, lh - 3, .cCornerPixel1(eSTATE)
    SetPixel lHdc, lw - 2, lh - 1, .cCornerPixel2(eSTATE)
    SetPixel lHdc, lw - 2, lh - 2, .cCornerPixel3(eSTATE)
    SetPixel lHdc, lw - 3, lh - 1, .cCornerPixel1(eSTATE)
    hRgn = CreateRoundRectRgn(0, 0, lw + 1, lh + 1, 3, 3) '------------- Clip extreme corner pixels
    Call SetWindowRgn(UserControl.hwnd, hRgn, True)
    DeleteObject hRgn
End With
bSkipDrawing = True '--------------------------------------------------- Draw caption
SetRect r, 3, 3, lw - 3, lh - 3
UserControl.ForeColor = IIf(pENABLED, pFORECOLOR, 9609633)
Call DrawText(lHdc, pCAPTION, -1, r, DT_FLAGS + DT_CENTER)
If bHasFocus And pFOCUSRECT And (eSTATE > 1) Then '--------------------- Draw focus rect
    UserControl.ForeColor = 0
    Call DrawFocusRect(lHdc, r)
End If
bSkipDrawing = False

End Sub

Private Sub DrawGradient(r As RECT, ByVal StartColor As Long, ByVal EndColor As Long)
Dim s       As RGBColor '--- Start RGB colors
Dim e       As RGBColor '--- End RBG colors
Dim i       As RGBColor '--- Increment RGB colors
Dim X       As Long
Dim lSteps  As Long
Dim lHdc    As Long
    lHdc = UserControl.hdc
    lSteps = r.Bottom - r.Top
    s.r = (StartColor And &HFF)
    s.G = (StartColor \ &H100) And &HFF
    s.B = (StartColor And &HFF0000) / &H10000
    e.r = (EndColor And &HFF)
    e.G = (EndColor \ &H100) And &HFF
    e.B = (EndColor And &HFF0000) / &H10000
    With i
        .r = (s.r - e.r) / lSteps
        .G = (s.G - e.G) / lSteps
        .B = (s.B - e.B) / lSteps
        For X = 0 To lSteps
            Call LineApi(r.Left, (lSteps - X) + r.Top, r.Right, (lSteps - X) + r.Top, RGB(e.r + (X * .r), e.G + (X * .G), e.B + (X * .B)))
        Next X
    End With
End Sub

Private Sub DrawFilled(tR As RECT, ByVal cBackColor As Long)
Dim hBrush As Long
    hBrush = CreateSolidBrush(cBackColor) '----------------- Fill with solid brush
    FillRect UserControl.hdc, tR, hBrush
    DeleteObject hBrush
End Sub

Private Sub LineApi(ByVal X1 As Long, ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long, ByVal Color As Long)
Dim pt      As POINT
Dim hPen    As Long
Dim hPenOld As Long
Dim lHdc    As Long
    lHdc = UserControl.hdc
    hPen = CreatePen(0, 1, Color)
    hPenOld = SelectObject(lHdc, hPen)
    MoveToEx lHdc, X1, Y1, pt
    LineTo lHdc, X2, Y2
    SelectObject lHdc, hPenOld
    DeleteObject hPen
End Sub

Private Sub FillColorScheme()
    With tColors
        .cBorders(0) = 12240841 '--------- Store Disabled Colors
        .cTopLine1(0) = 15726583
        .cTopLine2(0) = 15726583
        .cCornerPixel1(0) = 9220548
        .cCornerPixel2(0) = 12437454
        .cCornerPixel3(0) = 9220548
        .cBorders(1) = 7617536 '---------- Store Idle Colors
        .cTopLine1(1) = 16777215
        .cTopLine2(1) = 16711422
        .cBottomLine1(1) = 14082018
        .cBottomLine2(1) = 12964054
        .cCornerPixel1(1) = 8672545
        .cCornerPixel2(1) = 11376251
        .cCornerPixel3(1) = 10845522
        .cSideGradTop(1) = 16514300
        .cSideGradBottom(1) = 15133676
        .cBorders(2) = 7617536 '---------- Store Focus Colors
        .cTopLine1(2) = 16771022
        .cTopLine2(2) = 16242621
        .cBottomLine1(2) = 15183500
        .cBottomLine2(2) = 15696491
        .cCornerPixel1(2) = 8672545
        .cCornerPixel2(2) = 11376251
        .cCornerPixel3(2) = 10845522
        .cSideGradTop(2) = 16241597
        .cSideGradBottom(2) = 15183500
        .cBorders(3) = 7617536 '---------- Store Hot Colors
        .cTopLine1(3) = 13562879
        .cTopLine2(3) = 9231359
        .cBottomLine1(3) = 3257087
        .cBottomLine2(3) = 38630
        .cCornerPixel1(3) = 8672545
        .cCornerPixel2(3) = 11376251
        .cCornerPixel3(3) = 10845522
        .cSideGradTop(3) = 10280929
        .cSideGradBottom(3) = 3192575
        .cBorders(4) = 7617536 '---------- Store Down Colors.
        .cTopLine1(4) = 14607335
        .cTopLine2(4) = 14607335
        .cBottomLine1(4) = 13289407
        .cCornerPixel1(4) = 8672545
        .cCornerPixel2(4) = 11376251
        .cCornerPixel3(4) = 10845522
    End With
End Sub

Private Function GetAccessKey() As String
'//Extracts and returns the AccessKey appropriate for passed caption
'..Function provided by LiTe Templer (Guenter Wirth)
Dim lPos    As Long
Dim lLen    As Long
Dim lSearch As Long
Dim sChr    As String
    lLen = Len(pCAPTION)
    If lLen = 0 Then Exit Function
    lPos = 1
    Do While lPos + 1 < lLen
        lSearch = InStr(lPos, pCAPTION, "&")
        If lSearch = 0 Or lSearch = lLen Then Exit Do
        sChr = LCase$(Mid$(pCAPTION, lSearch + 1, 1))
        If sChr = "&" Then
            lPos = lSearch + 2
        Else
            GetAccessKey = sChr
            Exit Do
        End If
    Loop
End Function

Private Sub TrackMouseLeave(ByVal lng_hWnd As Long)
On Error GoTo Errs
Dim tme As TRACKMOUSEEVENT_STRUCT
    With tme
        .cbSize = Len(tme)
        .dwFlags = TME_LEAVE
        .hwndTrack = lng_hWnd
    End With
    Call TrackMouseEvent(tme) '---- Track the mouse leaving the indicated window via subclassing
Errs:
End Sub

'Subclass handler - MUST be the first Public routine in this file. That includes public properties also
Public Sub zSubclass_Proc(ByVal bBefore As Boolean, ByRef bHandled As Boolean, ByRef lReturn As Long, ByRef lng_hWnd As Long, ByRef uMsg As Long, ByRef wParam As Long, ByRef lParam As Long)
    Select Case uMsg
        Case WM_MOUSELEAVE
            bMouseInControl = False
            If bSpaceBarIsDown Then Exit Sub
            If eSTATE <> eDISABLE Then
                If bHasFocus Or bDisplayAsDefault Then
                    If eSTATE = eDOWN Then
                        If bButtonIsDown Then
                            Call DrawButton(eFOCUS)
                        Else
                            If eSTATE <> eIDLE Then Call DrawButton(eIDLE)
                        End If
                    Else
                        If eSTATE <> eFOCUS Then
                            If bParentActive Then Call DrawButton(eFOCUS)
                        End If
                    End If
                Else
                    If eSTATE <> eIDLE Then Call DrawButton(eIDLE)
                End If
            End If
            
        Case WM_NCACTIVATE, WM_ACTIVATE
            If wParam Then  '----------------------------------- Activated
                bParentActive = True
                If pENABLED Then
                    If bMouseInControl Then
                        If eSTATE <> eHOT Then Call DrawButton(eHOT)
                    Else
                        If (bHasFocus Or bDisplayAsDefault) Then Call DrawButton(eFOCUS)
                    End If
                End If
                RaiseEvent FormActivate(Active)
            Else            '----------------------------------- Deactivated
                bParentActive = False
                bButtonIsDown = False
                bMouseButtonIsDown = False
                bSpaceBarIsDown = False
                If pENABLED Then If eSTATE <> eIDLE Then Call DrawButton(eIDLE)
                RaiseEvent FormActivate(InActive)
            End If
    End Select
End Sub

Public Sub SnapMouseTo()
On Error Resume Next
Dim pt As POINT
    With UserControl
        '//Get screen coordinates of button
        Call ClientToScreen(.hwnd, pt)
        '//Move mouse to center of button
        Call SetCursorPos(pt.X + .ScaleX(.ScaleWidth / 2, .ScaleMode, vbPixels), _
            pt.Y + .ScaleY(.ScaleHeight / 2, .ScaleMode, vbPixels))
    End With
End Sub

Private Sub UserControl_AccessKeyPress(KeyAscii As Integer)
    If pENABLED Then
        If bSpaceBarIsDown Then
            bSpaceBarIsDown = False
            bButtonIsDown = False
            If bMouseInControl Then
                If eSTATE <> eHOT Then Call DrawButton(eHOT)
            Else
                Call DrawButton(eFOCUS)
            End If
        Else
            DoEvents '------------------ Process "GotFocus" before Click event
            RaiseEvent Click
        End If
    End If
End Sub

Private Sub UserControl_AmbientChanged(PropertyName As String)
    bDisplayAsDefault = Ambient.DisplayAsDefault
    If Not pENABLED Or bMouseInControl Then Exit Sub
    If PropertyName = "DisplayAsDefault" Then
        If bDisplayAsDefault Then
            Call DrawButton(eFOCUS)
        Else
            If eSTATE <> eIDLE Then Call DrawButton(eIDLE)
        End If
    End If
End Sub

Private Sub UserControl_Initialize()
    bSkipDrawing = 1
    Call FillColorScheme '-------------- Assign color variables for all states
    Set pFONT = UserControl.Font
    pHWND = UserControl.hwnd
End Sub

Private Sub UserControl_InitProperties()
Dim s   As String
Dim c   As Control
    s = "|" '---------------------------- Try to assume new buttons caption
    For Each c In Parent.Controls       ' This saves me time on most forms :-)
        If TypeOf c Is ccXPButton Then s = s & c.Caption & "|"
    Next c
    If InStr(1, s, "|&OK|") = 0 Then
        Caption = "&OK"
    ElseIf InStr(1, s, "|&Cancel|") = 0 Then
        Caption = "&Cancel"
    ElseIf InStr(1, s, "|&Apply|") = 0 Then
        Caption = "&Apply"
    Else
        Caption = Extender.Name
    End If
    ForeColor = &H0
    Enabled = True
    FocusRect = True
End Sub

Private Sub UserControl_KeyUp(KeyCode As Integer, Shift As Integer)
    If KeyCode = 32 And Not bMouseButtonIsDown Then '---------- Spacebar
        If bMouseInControl Then
            If eSTATE <> eHOT Then Call DrawButton(eHOT)
        Else
            Call DrawButton(eFOCUS)
        End If
        If bButtonIsDown Then RaiseEvent Click
        bSpaceBarIsDown = False
        bButtonIsDown = False
    End If
End Sub

Private Sub UserControl_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    With UserControl
        If X > .ScaleWidth Or X < 0 Or Y > .ScaleHeight Or Y < 0 Then
            bMouseInControl = False
        Else
            bMouseInControl = True
            Call TrackMouseLeave(pHWND)
        End If
    End With
    If Not bParentActive Or bSpaceBarIsDown Then Exit Sub
    If bMouseInControl Then
        If bButtonIsDown Then
            If eSTATE <> eDOWN Then Call DrawButton(eDOWN)
        Else
            If eSTATE <> eHOT Then Call DrawButton(eHOT)
        End If
    Else
        If bHasFocus Then
            If eSTATE <> eFOCUS Then Call DrawButton(eFOCUS)
        Else
            If eSTATE <> eIDLE Then Call DrawButton(eIDLE)
        End If
    End If
    RaiseEvent MouseMove(Button, Shift, X, Y)
End Sub

Private Sub UserControl_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    iDownButton = Button '-------- Remember button pressed for DblClick event
    If Button = 1 Then
        bHasFocus = True
        bButtonIsDown = True
        bMouseButtonIsDown = True
        If eSTATE <> eDOWN Then DrawButton (eDOWN)
    End If
End Sub

Private Sub UserControl_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Button = 1 Then
        If bParentActive Then
            If bMouseInControl Then
                If eSTATE <> eHOT Then Call DrawButton(eHOT)
            Else
                If bHasFocus Then Call DrawButton(eFOCUS)
            End If
            If bMouseInControl And bHasFocus And bButtonIsDown Then RaiseEvent Click
        End If
        bButtonIsDown = False
        bMouseButtonIsDown = False
    End If
End Sub

Private Sub UserControl_DblClick()
    If iDownButton = 1 Then '------- Only react to left mouse button
        Call DrawButton(eDOWN)
        RaiseEvent DblClick
    End If
End Sub

Private Sub UserControl_KeyDown(KeyCode As Integer, Shift As Integer)
    Select Case KeyCode
        Case 13 '------------------- Enter key
            RaiseEvent Click
        Case 37, 38 '--------------- Left Arrow and Up keys
            SendKeys "+{TAB}"
        Case 39, 40 '--------------- Right Arrow and Down keys
            SendKeys "{TAB}"
        Case 32 '------------------- Spacebar
            If Not bMouseButtonIsDown Then
                bSpaceBarIsDown = True
                bButtonIsDown = True
                If eSTATE <> eDOWN Then Call DrawButton(eDOWN)
            End If
    End Select
End Sub

Private Sub UserControl_GotFocus()
    bHasFocus = True
    If bMouseInControl Then
        If eSTATE <> eHOT And eSTATE <> eDOWN Then Call DrawButton(eHOT)
    Else
        If Not bButtonIsDown Then Call DrawButton(eFOCUS)
    End If
End Sub

Private Sub UserControl_LostFocus()
    bHasFocus = False
    bButtonIsDown = False
    bSpaceBarIsDown = False
    If pENABLED Then
        If Not bParentActive Then
            If eSTATE <> eIDLE Then Call DrawButton(eIDLE)
        ElseIf bMouseInControl Then
            If eSTATE <> eHOT Then Call DrawButton(eHOT)
        Else
            If bDisplayAsDefault Then
                Call DrawButton(eFOCUS)
            Else
                If eSTATE <> eIDLE Then Call DrawButton(eIDLE)
            End If
        End If
    End If
End Sub

Private Sub UserControl_Resize()
    With UserControl
        If .Height < 100 Then bSkipDrawing = True: .Height = 100
        If .Width < 100 Then bSkipDrawing = True: .Width = 100
    End With
    If Not bSkipDrawing Then Call DrawButton(eSTATE)
End Sub

Private Sub UserControl_Terminate()
On Error GoTo Errs
    Set pFONT = Nothing
    If Ambient.UserMode Then
        Call Subclass_Stop(pHWND)
        Call Subclass_Stop(lParentHwnd)
    End If
Errs:
End Sub

Public Property Get hwnd() As Long
    hwnd = pHWND
End Property

Public Property Let Caption(ByVal newValue As String)
    pCAPTION = newValue
    UserControl.AccessKeys = GetAccessKey '---------- Set AccessKey property if desired
    Call DrawButton(eSTATE)
    UserControl.PropertyChanged "Caption"
End Property

Public Property Get Caption() As String
Attribute Caption.VB_UserMemId = -518
    Caption = pCAPTION
End Property

Public Property Let Enabled(ByVal newValue As Boolean)
    pENABLED = newValue
    UserControl.Enabled = pENABLED
    bSkipDrawing = 0
    If bMouseInControl And pENABLED Then
        Call DrawButton(eHOT)
    Else
        If bDisplayAsDefault And newValue Then
            Call DrawButton(eFOCUS)
        Else
            If eSTATE <> Abs(newValue) Then Call DrawButton(Abs(newValue))
        End If
    End If
    UserControl.PropertyChanged "Enabled"
End Property

Public Property Get Enabled() As Boolean
    Enabled = pENABLED
End Property

Public Property Get Font() As StdFont
    Set Font = pFONT
End Property

Public Property Set Font(newValue As StdFont)
    Set pFONT = newValue
    Call pFONT_FontChanged("")
End Property

Private Sub pFONT_FontChanged(ByVal PropertyName As String)
    Set UserControl.Font = pFONT
    Call DrawButton(eSTATE)
    UserControl.PropertyChanged "Font"
End Sub

Public Property Let ForeColor(newValue As OLE_COLOR)
    pFORECOLOR = newValue
    UserControl.ForeColor = pFORECOLOR
    Call DrawButton(eSTATE)
    UserControl.PropertyChanged "ForeColor"
End Property

Public Property Get ForeColor() As OLE_COLOR
    ForeColor = pFORECOLOR
End Property

Public Property Let FocusRect(newValue As Boolean)
Attribute FocusRect.VB_Description = "Displays a rect inside button border when the control has the focus."
    pFOCUSRECT = newValue
    If bHasFocus Then Call DrawButton(eSTATE)
    UserControl.PropertyChanged "FocusRect"
End Property

Public Property Get FocusRect() As Boolean
    FocusRect = pFOCUSRECT
End Property

Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
    lParentHwnd = UserControl.Parent.hwnd
    With PropBag
        Caption = .ReadProperty("Caption", "&OK")
        ForeColor = .ReadProperty("ForeColor", 0)
        Set Font = .ReadProperty("Font", pFONT)
        FocusRect = .ReadProperty("FocusRect", True)
        Enabled = .ReadProperty("Enabled", True) '--- Keep as last read property for bSkipDrawing variable during initialize
    End With
    If Ambient.UserMode Then
        Call Subclass_Start(pHWND)
        Call Subclass_AddMsg(pHWND, WM_MOUSELEAVE, MSG_AFTER)
        Call Subclass_Start(lParentHwnd)
        If UserControl.Parent.MDIChild Then
            Call Subclass_AddMsg(lParentHwnd, WM_NCACTIVATE, MSG_AFTER)
        Else
            Call Subclass_AddMsg(lParentHwnd, WM_ACTIVATE, MSG_AFTER)
        End If
    End If
    bSkipDrawing = False: Call DrawButton(eSTATE)
End Sub

Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
    With PropBag
        .WriteProperty "Caption", pCAPTION, "&OK"
        .WriteProperty "Enabled", pENABLED, True
        .WriteProperty "ForeColor", pFORECOLOR, 0
        .WriteProperty "Font", pFONT, "Verdana"
        .WriteProperty "FocusRect", pFOCUSRECT, True
    End With
End Sub

'========================================================================================
'Start Subclass code - The programmer may call any of the following Subclass_??? routines


'Add a message to the table of those that will invoke a callback. You should Subclass_Start first and then add the messages
Private Sub Subclass_AddMsg(ByVal lng_hWnd As Long, ByVal uMsg As Long, Optional ByVal When As eMsgWhen = MSG_AFTER)
On Error GoTo Errs
'Parameters:
  'lng_hWnd  - The handle of the window for which the uMsg is to be added to the callback table
  'uMsg      - The message number that will invoke a callback. NB Can also be ALL_MESSAGES, ie all messages will callback
  'When      - Whether the msg is to callback before, after or both with respect to the the default (previous) handler
  With sc_aSubData(zIdx(lng_hWnd))
    If When And eMsgWhen.MSG_BEFORE Then
      Call zAddMsg(uMsg, .aMsgTblB, .nMsgCntB, eMsgWhen.MSG_BEFORE, .nAddrSub)
    End If
    If When And eMsgWhen.MSG_AFTER Then
      Call zAddMsg(uMsg, .aMsgTblA, .nMsgCntA, eMsgWhen.MSG_AFTER, .nAddrSub)
    End If
  End With
Errs:
End Sub


'Return whether we're running in the IDE.
Private Function Subclass_InIDE() As Boolean
  Debug.Assert zSetTrue(Subclass_InIDE)
End Function

'Start subclassing the passed window handle
Private Function Subclass_Start(ByVal lng_hWnd As Long) As Long
On Error GoTo Errs
'Parameters:
  'lng_hWnd  - The handle of the window to be subclassed
'Returns;
  'The sc_aSubData() index
  Const CODE_LEN              As Long = 202                                             'Length of the machine code in bytes
  Const FUNC_CWP              As String = "CallWindowProcA"                             'We use CallWindowProc to call the original WndProc
  Const FUNC_EBM              As String = "EbMode"                                      'VBA's EbMode function allows the machine code thunk to know if the IDE has stopped or is on a breakpoint
  Const FUNC_SWL              As String = "SetWindowLongA"                              'SetWindowLongA allows the cSubclasser machine code thunk to unsubclass the subclasser itself if it detects via the EbMode function that the IDE has stopped
  Const MOD_USER              As String = "user32"                                      'Location of the SetWindowLongA & CallWindowProc functions
  Const MOD_VBA5              As String = "vba5"                                        'Location of the EbMode function if running VB5
  Const MOD_VBA6              As String = "vba6"                                        'Location of the EbMode function if running VB6
  Const PATCH_01              As Long = 18                                              'Code buffer offset to the location of the relative address to EbMode
  Const PATCH_02              As Long = 68                                              'Address of the previous WndProc
  Const PATCH_03              As Long = 78                                              'Relative address of SetWindowsLong
  Const PATCH_06              As Long = 116                                             'Address of the previous WndProc
  Const PATCH_07              As Long = 121                                             'Relative address of CallWindowProc
  Const PATCH_0A              As Long = 186                                             'Address of the owner object
  Static aBuf(1 To CODE_LEN)  As Byte                                                   'Static code buffer byte array
  Static pCWP                 As Long                                                   'Address of the CallWindowsProc
  Static pEbMode              As Long                                                   'Address of the EbMode IDE break/stop/running function
  Static pSWL                 As Long                                                   'Address of the SetWindowsLong function
  Dim i                       As Long                                                   'Loop index
  Dim j                       As Long                                                   'Loop index
  Dim nSubIdx                 As Long                                                   'Subclass data index
  Dim sHex                    As String                                                 'Hex code string
  
'If it's the first time through here..
  If aBuf(1) = 0 Then
  
'The hex pair machine code representation.
    sHex = "5589E583C4F85731C08945FC8945F8EB0EE80000000083F802742185C07424E830000000837DF800750AE838000000E84D00" & _
           "00005F8B45FCC9C21000E826000000EBF168000000006AFCFF7508E800000000EBE031D24ABF00000000B900000000E82D00" & _
           "0000C3FF7514FF7510FF750CFF75086800000000E8000000008945FCC331D2BF00000000B900000000E801000000C3E33209" & _
           "C978078B450CF2AF75278D4514508D4510508D450C508D4508508D45FC508D45F85052B800000000508B00FF90A4070000C3"

'Convert the string from hex pairs to bytes and store in the static machine code buffer
    i = 1
    Do While j < CODE_LEN
      j = j + 1
      aBuf(j) = Val("&H" & Mid$(sHex, i, 2))                                            'Convert a pair of hex characters to an eight-bit value and store in the static code buffer array
      i = i + 2
    Loop                                                                                'Next pair of hex characters
    
'Get API function addresses
    If Subclass_InIDE Then                                                              'If we're running in the VB IDE
      aBuf(16) = &H90                                                                   'Patch the code buffer to enable the IDE state code
      aBuf(17) = &H90                                                                   'Patch the code buffer to enable the IDE state code
      pEbMode = zAddrFunc(MOD_VBA6, FUNC_EBM)                                           'Get the address of EbMode in vba6.dll
      If pEbMode = 0 Then                                                               'Found?
        pEbMode = zAddrFunc(MOD_VBA5, FUNC_EBM)                                         'VB5 perhaps
      End If
    End If
    
    pCWP = zAddrFunc(MOD_USER, FUNC_CWP)                                                'Get the address of the CallWindowsProc function
    pSWL = zAddrFunc(MOD_USER, FUNC_SWL)                                                'Get the address of the SetWindowLongA function
    ReDim sc_aSubData(0 To 0) As tSubData                                               'Create the first sc_aSubData element
  Else
    nSubIdx = zIdx(lng_hWnd, True)
    If nSubIdx = -1 Then                                                                'If an sc_aSubData element isn't being re-cycled
      nSubIdx = UBound(sc_aSubData()) + 1                                               'Calculate the next element
      ReDim Preserve sc_aSubData(0 To nSubIdx) As tSubData                              'Create a new sc_aSubData element
    End If
    
    Subclass_Start = nSubIdx
  End If

  With sc_aSubData(nSubIdx)
    .hwnd = lng_hWnd                                                                    'Store the hWnd
    .nAddrSub = GlobalAlloc(GMEM_FIXED, CODE_LEN)                                       'Allocate memory for the machine code WndProc
    .nAddrOrig = SetWindowLongA(.hwnd, GWL_WNDPROC, .nAddrSub)                          'Set our WndProc in place
    Call RtlMoveMemory(ByVal .nAddrSub, aBuf(1), CODE_LEN)                              'Copy the machine code from the static byte array to the code array in sc_aSubData
    Call zPatchRel(.nAddrSub, PATCH_01, pEbMode)                                        'Patch the relative address to the VBA EbMode api function, whether we need to not.. hardly worth testing
    Call zPatchVal(.nAddrSub, PATCH_02, .nAddrOrig)                                     'Original WndProc address for CallWindowProc, call the original WndProc
    Call zPatchRel(.nAddrSub, PATCH_03, pSWL)                                           'Patch the relative address of the SetWindowLongA api function
    Call zPatchVal(.nAddrSub, PATCH_06, .nAddrOrig)                                     'Original WndProc address for SetWindowLongA, unsubclass on IDE stop
    Call zPatchRel(.nAddrSub, PATCH_07, pCWP)                                           'Patch the relative address of the CallWindowProc api function
    Call zPatchVal(.nAddrSub, PATCH_0A, ObjPtr(Me))                                     'Patch the address of this object instance into the static machine code buffer
  End With
Errs:
End Function

'Stop subclassing the passed window handle
Private Sub Subclass_Stop(ByVal lng_hWnd As Long)
On Error GoTo Errs
'Parameters:
  'lng_hWnd  - The handle of the window to stop being subclassed
  With sc_aSubData(zIdx(lng_hWnd))
    Call SetWindowLongA(.hwnd, GWL_WNDPROC, .nAddrOrig)                                 'Restore the original WndProc
    Call zPatchVal(.nAddrSub, PATCH_05, 0)                                              'Patch the Table B entry count to ensure no further 'before' callbacks
    Call zPatchVal(.nAddrSub, PATCH_09, 0)                                              'Patch the Table A entry count to ensure no further 'after' callbacks
    Call GlobalFree(.nAddrSub)                                                          'Release the machine code memory
    .hwnd = 0                                                                           'Mark the sc_aSubData element as available for re-use
    .nMsgCntB = 0                                                                       'Clear the before table
    .nMsgCntA = 0                                                                       'Clear the after table
    Erase .aMsgTblB                                                                     'Erase the before table
    Erase .aMsgTblA                                                                     'Erase the after table
  End With
Errs:
End Sub

'=======================================================================================================
'These z??? routines are exclusively called by the Subclass_??? routines.

'Worker sub for Subclass_AddMsg
Private Sub zAddMsg(ByVal uMsg As Long, ByRef aMsgTbl() As Long, ByRef nMsgCnt As Long, ByVal When As eMsgWhen, ByVal nAddr As Long)
On Error GoTo Errs
  Dim nEntry  As Long                                                                   'Message table entry index
  Dim nOff1   As Long                                                                   'Machine code buffer offset 1
  Dim nOff2   As Long                                                                   'Machine code buffer offset 2
  
  If uMsg = ALL_MESSAGES Then                                                           'If all messages
    nMsgCnt = ALL_MESSAGES                                                              'Indicates that all messages will callback
  Else                                                                                  'Else a specific message number
    Do While nEntry < nMsgCnt                                                           'For each existing entry. NB will skip if nMsgCnt = 0
      nEntry = nEntry + 1
      
      If aMsgTbl(nEntry) = 0 Then                                                       'This msg table slot is a deleted entry
        aMsgTbl(nEntry) = uMsg                                                          'Re-use this entry
        Exit Sub                                                                        'Bail
      ElseIf aMsgTbl(nEntry) = uMsg Then                                                'The msg is already in the table!
        Exit Sub                                                                        'Bail
      End If
    Loop                                                                                'Next entry

    nMsgCnt = nMsgCnt + 1                                                               'New slot required, bump the table entry count
    ReDim Preserve aMsgTbl(1 To nMsgCnt) As Long                                        'Bump the size of the table.
    aMsgTbl(nMsgCnt) = uMsg                                                             'Store the message number in the table
  End If

  If When = eMsgWhen.MSG_BEFORE Then                                                    'If before
    nOff1 = PATCH_04                                                                    'Offset to the Before table
    nOff2 = PATCH_05                                                                    'Offset to the Before table entry count
  Else                                                                                  'Else after
    nOff1 = PATCH_08                                                                    'Offset to the After table
    nOff2 = PATCH_09                                                                    'Offset to the After table entry count
  End If

  If uMsg <> ALL_MESSAGES Then
    Call zPatchVal(nAddr, nOff1, VarPtr(aMsgTbl(1)))                                    'Address of the msg table, has to be re-patched because Redim Preserve will move it in memory.
  End If
  Call zPatchVal(nAddr, nOff2, nMsgCnt)                                                 'Patch the appropriate table entry count
Errs:
End Sub

'Return the memory address of the passed function in the passed dll
Private Function zAddrFunc(ByVal sDLL As String, ByVal sProc As String) As Long
  zAddrFunc = GetProcAddress(GetModuleHandleA(sDLL), sProc)
  Debug.Assert zAddrFunc                                                                'You may wish to comment out this line if you're using vb5 else the EbMode GetProcAddress will stop here everytime because we look for vba6.dll first
End Function

'Get the sc_aSubData() array index of the passed hWnd
Private Function zIdx(ByVal lng_hWnd As Long, Optional ByVal bAdd As Boolean = False) As Long
On Error GoTo Errs
'Get the upper bound of sc_aSubData() - If you get an error here, you're probably Subclass_AddMsg-ing before Subclass_Start
  zIdx = UBound(sc_aSubData)
  Do While zIdx >= 0                                                                    'Iterate through the existing sc_aSubData() elements
    With sc_aSubData(zIdx)
      If .hwnd = lng_hWnd Then                                                          'If the hWnd of this element is the one we're looking for
        If Not bAdd Then                                                                'If we're searching not adding
          Exit Function                                                                 'Found
        End If
      ElseIf .hwnd = 0 Then                                                             'If this an element marked for reuse.
        If bAdd Then                                                                    'If we're adding
          Exit Function                                                                 'Re-use it
        End If
      End If
    End With
    zIdx = zIdx - 1                                                                     'Decrement the index
  Loop
  
'  If Not bAdd Then
'    Debug.Assert False                                                                  'hWnd not found, programmer error
'  End If
Errs:

'If we exit here, we're returning -1, no freed elements were found
End Function

'Patch the machine code buffer at the indicated offset with the relative address to the target address.
Private Sub zPatchRel(ByVal nAddr As Long, ByVal nOffset As Long, ByVal nTargetAddr As Long)
  Call RtlMoveMemory(ByVal nAddr + nOffset, nTargetAddr - nAddr - nOffset - 4, 4)
End Sub

'Patch the machine code buffer at the indicated offset with the passed value
Private Sub zPatchVal(ByVal nAddr As Long, ByVal nOffset As Long, ByVal nValue As Long)
  Call RtlMoveMemory(ByVal nAddr + nOffset, nValue, 4)
End Sub

'Worker function for Subclass_InIDE
Private Function zSetTrue(ByRef bValue As Boolean) As Boolean
  zSetTrue = True
  bValue = True
End Function

'END Subclassing Code===================================================================================
