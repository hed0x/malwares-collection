VERSION 5.00
Begin VB.UserControl CandyButton 
   Appearance      =   0  '2D
   AutoRedraw      =   -1  'True
   BackColor       =   &H00FFFFFF&
   ClientHeight    =   1335
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   1830
   ClipBehavior    =   0  'Keine
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   ScaleHeight     =   89
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   122
End
Attribute VB_Name = "CandyButton"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

'-Selfsub declarations----------------------------------------------------------------------------
Private Enum eMsgWhen                                                       'When to callback
  MSG_BEFORE = 1                                                            'Callback before the original WndProc
  MSG_AFTER = 2                                                             'Callback after the original WndProc
  MSG_BEFORE_AFTER = MSG_BEFORE Or MSG_AFTER                                'Callback before and after the original WndProc
End Enum

Private Const ALL_MESSAGES  As Long = -1                                    'All messages callback
Private Const MSG_ENTRIES   As Long = 32                                    'Number of msg table entries
Private Const WNDPROC_OFF   As Long = &H38                                  'Thunk offset to the WndProc execution address
Private Const GWL_WNDPROC   As Long = -4                                    'SetWindowsLong WndProc index
Private Const IDX_SHUTDOWN  As Long = 1                                     'Thunk data index of the shutdown flag
Private Const IDX_HWND      As Long = 2                                     'Thunk data index of the subclassed hWnd
Private Const IDX_WNDPROC   As Long = 9                                     'Thunk data index of the original WndProc
Private Const IDX_BTABLE    As Long = 11                                    'Thunk data index of the Before table
Private Const IDX_ATABLE    As Long = 12                                    'Thunk data index of the After table
Private Const IDX_PARM_USER As Long = 13                                    'Thunk data index of the User-defined callback parameter data index

Private z_ScMem             As Long                                         'Thunk base address
Private z_Sc(64)            As Long                                         'Thunk machine-code initialised here
Private z_Funk              As Collection                                   'hWnd/thunk-address collection

Private Declare Function CallWindowProcA Lib "user32" (ByVal lpPrevWndFunc As Long, ByVal hwnd As Long, ByVal Msg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Private Declare Function GetCurrentProcessId Lib "kernel32" () As Long
Private Declare Function GetModuleHandleA Lib "kernel32" (ByVal lpModuleName As String) As Long
Private Declare Function GetProcAddress Lib "kernel32" (ByVal hModule As Long, ByVal lpProcName As String) As Long
Private Declare Function GetWindowThreadProcessId Lib "user32" (ByVal hwnd As Long, lpdwProcessId As Long) As Long
Private Declare Function IsBadCodePtr Lib "kernel32" (ByVal lpfn As Long) As Long
Private Declare Function IsWindow Lib "user32" (ByVal hwnd As Long) As Long
Private Declare Function SetWindowLongA Lib "user32" (ByVal hwnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Private Declare Function VirtualAlloc Lib "kernel32" (ByVal lpAddress As Long, ByVal dwSize As Long, ByVal flAllocationType As Long, ByVal flProtect As Long) As Long
Private Declare Function VirtualFree Lib "kernel32" (ByVal lpAddress As Long, ByVal dwSize As Long, ByVal dwFreeType As Long) As Long
Private Declare Sub RtlMoveMemory Lib "kernel32" (ByVal Destination As Long, ByVal Source As Long, ByVal Length As Long)
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Public Event Status(ByVal sStatus As String)

Private Const WM_MOUSEMOVE    As Long = &H200
Private Const WM_MOUSELEAVE   As Long = &H2A3
Private Const WM_MOVING       As Long = &H216
Private Const WM_SIZING       As Long = &H214
Private Const WM_EXITSIZEMOVE As Long = &H232
Private Const WM_PAINT = &HF

Private Enum TRACKMOUSEEVENT_FLAGS
  TME_HOVER = &H1&
  TME_LEAVE = &H2&
  TME_QUERY = &H40000000
  TME_CANCEL = &H80000000
End Enum

Private Type TRACKMOUSEEVENT_STRUCT
  cbSize                      As Long
  dwFlags                     As TRACKMOUSEEVENT_FLAGS
  hwndTrack                   As Long
  dwHoverTime                 As Long
End Type

Private bTrack                As Boolean
Private bTrackUser32          As Boolean
Private IsHover               As Boolean
Private bMoving               As Boolean

Public Event Click()
Attribute Click.VB_MemberFlags = "200"
Public Event DblClick()
Public Event MouseEnter()
Public Event MouseLeave()
Public Event MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
Public Event MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
Public Event MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)

Private Declare Function FreeLibrary Lib "kernel32" (ByVal hLibModule As Long) As Long
Private Declare Function LoadLibraryA Lib "kernel32" (ByVal lpLibFileName As String) As Long
Private Declare Function TrackMouseEvent Lib "user32" (lpEventTrack As TRACKMOUSEEVENT_STRUCT) As Long
Private Declare Function TrackMouseEventComCtl Lib "Comctl32" Alias "_TrackMouseEvent" (lpEventTrack As TRACKMOUSEEVENT_STRUCT) As Long

'-Candy Button declarations----------------------------------------------------------------------------
Public Enum eAlignment
    PIC_TOP
    PIC_BOTTOM
    PIC_LEFT
    PIC_RIGHT
End Enum

Public Enum eStyle
    XP_Button
    XP_ToolBarButton
    Crystal
    Mac
    Mac_Variation
    WMP
    Plastic
    Iceblock
End Enum

Public Enum eColorScheme
    Custom
    Aqua
    WMP10
    DeepBlue
    DeepRed
    DeepGreen
    DeepYellow
End Enum

Public Enum eState
    eNormal
    ePressed
    eFocus
    eHover
    eChecked
End Enum

Private Type tCrystalParam
    Ref_MixColorFrom As Long
    Ref_Intensity As Long
    Ref_Left As Long
    Ref_Top As Long
    Ref_Radius As Long
    Ref_Height As Long
    Ref_Width As Long
    RadialGXPercent As Long
    RadialGYPercent As Long
    RadialGOffsetX As Long
    RadialGOffsetY As Long
    RadialGIntensity As Long
End Type

Private Type BITMAPINFOHEADER    '40 bytes
   biSize As Long
   biWidth As Long
   biHeight As Long
   biPlanes As Integer
   biBitCount As Integer
   biCompression As Long
   biSizeImage As Long
   biXPelsPerMeter As Long
   biYPelsPerMeter As Long
   biClrUsed As Long
   biClrImportant As Long
End Type

Private Type RGBQUAD
   rgbBlue As Byte
   rgbGreen As Byte
   rgbRed As Byte
   rgbReserved As Byte
End Type

Private Type BITMAP    '24 bytes
  bmType As Long
  bmWidth As Long
  bmHeight As Long
  bmWidthBytes As Long
  bmPlanes As Integer
  bmBitsPixel As Integer
  bmBits As Long
End Type

Private Type BITMAPINFO
  bmiHeader As BITMAPINFOHEADER
  bmiColors As RGBQUAD
End Type

Private Const BI_RGB = 0&
Private Const DIB_RGB_COLORS = 0&

Private m_PictureAlignment                      As eAlignment
Private m_Style                                 As eStyle
Private m_Checked                               As Boolean
Private m_hasFocus                              As Boolean
Private m_Caption                               As String
Private m_StdPicture                            As StdPicture
Private m_Font                                  As StdFont
Private m_ColorButtonHover                      As OLE_COLOR
Private m_ColorButtonUp                         As OLE_COLOR
Private m_ColorButtonDown                       As OLE_COLOR
Private m_ColorBright                           As OLE_COLOR
Private m_ForeColor                             As OLE_COLOR
Private m_DisplayHand                           As Boolean
Private CornerRadius                            As Long
Private m_BorderBrightness                      As Long
Private m_ColorScheme                           As eColorScheme
Private m_bHighLited                            As Boolean
Private m_bIconHighLite                         As Boolean
Private m_lIconHighLiteColor                    As OLE_COLOR
Private m_bCaptionHighLite                      As Boolean
Private m_lCaptionHighLiteColor                 As OLE_COLOR
Private m_bEnabled                              As Boolean
Private m_InitCompleted                         As Boolean
Private hButtonRegion                              As Long

Private Const m_def_ForeColor                   As Long = vbBlack
Private Const m_def_PictureAlignment            As Byte = 0
Private Const DST_TEXT                          As Long = &H1
Private Const DST_PREFIXTEXT                    As Long = &H2
Private Const DST_COMPLEX                       As Long = &H0
Private Const DST_ICON                          As Long = &H3
Private Const DST_BITMAP                        As Long = &H4
Private Const DSS_NORMAL                        As Long = &H0
Private Const DSS_UNION                         As Long = &H10
Private Const DSS_DISABLED                      As Long = &H20
Private Const DSS_MONO                          As Long = &H80
Private Const DSS_RIGHT                         As Long = &H8000
Private Const RGN_XOR = 3
Private Const MK_LBUTTON = &H1

Private Type POINTAPI
    X As Long
    Y As Long
End Type

Private Type RECT
        Left As Long
        Top As Long
        Right As Long
        Bottom As Long
End Type

Private Declare Function SetWindowRgn Lib "user32" (ByVal hwnd As Long, ByVal hRgn As Long, ByVal bRedraw As Boolean) As Long
Private Declare Function CombineRgn Lib "gdi32" (ByVal hDestRgn As Long, ByVal hSrcRgn1 As Long, ByVal hSrcRgn2 As Long, ByVal nCombineMode As Long) As Long
Private Declare Function CreateRectRgn Lib "gdi32" (ByVal X1 As Long, ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long) As Long
Private Declare Function CreateRoundRectRgn Lib "gdi32" (ByVal X1 As Long, ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long, ByVal X3 As Long, ByVal Y3 As Long) As Long
Private Declare Function DrawState Lib "user32" Alias "DrawStateA" (ByVal hdc As Long, ByVal hBrush As Long, ByVal lpDrawStateProc As Long, ByVal lParam As Long, ByVal wParam As Long, ByVal X As Long, ByVal Y As Long, ByVal cX As Long, ByVal cY As Long, ByVal fuFlags As Long) As Long
Private Declare Function DrawStateText Lib "user32" Alias "DrawStateA" (ByVal hdc As Long, ByVal hBrush As Long, ByVal lpDrawStateProc As Long, ByVal lParam As String, ByVal wParam As Long, ByVal n1 As Long, ByVal n2 As Long, ByVal n3 As Long, ByVal n4 As Long, ByVal un As Long) As Long
Private Declare Function CreateSolidBrush Lib "gdi32" (ByVal crColor As Long) As Long
Private Declare Function SetPixelV Lib "gdi32" (ByVal hdc As Long, ByVal X As Long, ByVal Y As Long, ByVal crColor As Long) As Long
Private Declare Function TranslateColor Lib "olepro32.dll" Alias "OleTranslateColor" (ByVal clr As OLE_COLOR, ByVal palet As Long, Col As Long) As Long
Private Declare Function PtInRegion Lib "gdi32" (ByVal hRgn As Long, ByVal X As Long, ByVal Y As Long) As Long
Private Declare Function DeleteObject Lib "gdi32" (ByVal hObject As Long) As Long
Private Declare Function InflateRect Lib "user32" (lpRect As RECT, ByVal X As Long, ByVal Y As Long) As Long
Private Declare Function Ellipse Lib "gdi32" (ByVal hdc As Long, ByVal X1 As Long, ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long) As Long
Private Declare Function SetRect Lib "user32" (lpRect As RECT, ByVal X1 As Long, ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long) As Long
Private Declare Function IsRectEmpty Lib "user32" (lpRect As RECT) As Long
Private Declare Function SelectObject Lib "gdi32" (ByVal hdc As Long, ByVal hObject As Long) As Long
Private Declare Function CreatePen Lib "gdi32" (ByVal nPenStyle As Long, ByVal nWidth As Long, ByVal crColor As Long) As Long
Private Declare Function FillRect Lib "user32" (ByVal hdc As Long, lpRect As RECT, ByVal hBrush As Long) As Long


Public Property Let DisplayHand(newValue As Boolean)
    m_DisplayHand = newValue
End Property

Public Property Get DisplayHand() As Boolean
    DisplayHand = m_DisplayHand
End Property

'Description: Enable or disable the control
Public Property Let Enabled(bEnabled As Boolean)
On Error GoTo Handler
    m_bEnabled = bEnabled
    PropertyChanged "Enabled"
    '/*** added
    DrawButton (eNormal)
Handler:
End Property

Public Property Get Enabled() As Boolean
On Error GoTo Handler
    Enabled = m_bEnabled
    Refresh
    Exit Property
Handler:
End Property

Public Property Let ColorScheme(newValue As eColorScheme)
    Select Case newValue
        Case Aqua
            ColorButtonUp = &HD06720
            ColorButtonHover = &HE99950
            ColorButtonDown = &HA06710
            ColorBright = &HFFEDB0
        Case WMP10
            ColorButtonUp = &HD09060
            ColorButtonHover = &HE06000
            ColorButtonDown = &HA98050
            ColorBright = &HFFFAFA
        Case DeepBlue
            ColorButtonUp = &H800000
            ColorButtonHover = &HA00000
            ColorButtonDown = &HF00000
            ColorBright = &HFF0000
        Case DeepRed
            ColorButtonUp = &H80&
            ColorButtonHover = &HA0&
            ColorButtonDown = &HF0&
            ColorBright = &HFF&
        Case DeepGreen
            ColorButtonUp = &H8000&
            ColorButtonHover = &HA000&
            ColorButtonDown = &HC000&
            ColorBright = &HFF00&
        Case DeepYellow
            ColorButtonUp = &H8080&
            ColorButtonHover = &HA0A0&
            ColorButtonDown = &HC0C0&
            ColorBright = &HFFFF&
    End Select
    m_ColorScheme = newValue
    PropertyChanged "m_ColorScheme"
    DrawButton (eNormal)
End Property

Public Property Get ColorScheme() As eColorScheme
    ColorScheme = m_ColorScheme
End Property

Public Property Let BorderBrightness(newValue As Long)
    m_BorderBrightness = SetBound(newValue, -100, 100)
    PropertyChanged "m_BorderBrightness"
    DrawButton (eNormal)
End Property

Public Property Get BorderBrightness() As Long
    BorderBrightness = m_BorderBrightness
End Property

'/*** enable icon mouse over highliting
Public Property Get IconHighLite() As Boolean
    IconHighLite = m_bIconHighLite
End Property

Public Property Let IconHighLite(PropVal As Boolean)
    m_bIconHighLite = PropVal
    PropertyChanged "IconHighLite"
End Property

'/*** enable icon mouse over highliting
Public Property Get IconHighLiteColor() As OLE_COLOR
    IconHighLiteColor = m_lIconHighLiteColor
End Property

Public Property Let IconHighLiteColor(PropVal As OLE_COLOR)
    m_lIconHighLiteColor = PropVal
    PropertyChanged "IconHighLiteColor"
End Property

'/*** enable caption mouse over highliting
Public Property Get CaptionHighLite() As Boolean
    CaptionHighLite = m_bCaptionHighLite
End Property

Public Property Let CaptionHighLite(PropVal As Boolean)
    m_bCaptionHighLite = PropVal
    PropertyChanged "CaptionHighLite"
End Property

Public Property Get CaptionHighLiteColor() As OLE_COLOR
    CaptionHighLiteColor = m_lCaptionHighLiteColor
End Property

Public Property Let CaptionHighLiteColor(PropVal As OLE_COLOR)
    m_lCaptionHighLiteColor = PropVal
    PropertyChanged "CaptionHighLiteColor"
End Property

Public Property Let ColorBright(newValue As OLE_COLOR)
    m_ColorBright = newValue
    If m_ColorScheme <> Custom Then m_ColorScheme = Custom:  PropertyChanged "m_ColorScheme"
    PropertyChanged "m_ColorBright"
    DrawButton (eNormal)
End Property

Public Property Get ColorBright() As OLE_COLOR
    ColorBright = m_ColorBright
End Property

Public Property Let ColorButtonDown(newValue As OLE_COLOR)
    m_ColorButtonDown = newValue
    If m_ColorScheme <> Custom Then m_ColorScheme = Custom:  PropertyChanged "m_ColorScheme"
    PropertyChanged "m_ColorButtonDown"
    DrawButton (eNormal)
End Property

Public Property Get ColorButtonDown() As OLE_COLOR
    ColorButtonDown = m_ColorButtonDown
End Property

Public Property Let ColorButtonUp(newValue As OLE_COLOR)
    m_ColorButtonUp = newValue
    If m_ColorScheme <> Custom Then m_ColorScheme = Custom:  PropertyChanged "m_ColorScheme"
    PropertyChanged "m_ColorButtonUp"
    DrawButton (eNormal)
End Property

Public Property Get ColorButtonUp() As OLE_COLOR
    ColorButtonUp = m_ColorButtonUp
End Property

Public Property Let ColorButtonHover(newValue As OLE_COLOR)
    m_ColorButtonHover = newValue
    If m_ColorScheme <> Custom Then m_ColorScheme = Custom:  PropertyChanged "m_ColorScheme"
    PropertyChanged "m_ColorButtonHover"
    DrawButton (eNormal)
End Property

Public Property Get ColorButtonHover() As OLE_COLOR
    ColorButtonHover = m_ColorButtonHover
End Property

Public Property Let ForeColor(ByVal NewForeColor As OLE_COLOR)
     m_ForeColor = NewForeColor
     UserControl.ForeColor = m_ForeColor
     PropertyChanged "ForeColor"
     DrawButton (eNormal)
End Property

Public Property Get ForeColor() As OLE_COLOR
     ForeColor = m_ForeColor
End Property

Public Property Set Picture(value As StdPicture)
    Set m_StdPicture = value
    PropertyChanged "Picture"
    DrawButton (eNormal)
End Property

Public Property Get Picture() As StdPicture
    Set Picture = m_StdPicture
End Property

Public Property Let Checked(value As Boolean)
    m_Checked = value
    If value Then
        DrawButton (eChecked)
    Else
        If IsHover Then
            DrawButton (eHover)
        Else
            DrawButton (eNormal)
        End If
    End If
    PropertyChanged "Checked"
End Property

Public Property Get Checked() As Boolean
    Checked = m_Checked
End Property

Public Property Let Style(eVal As eStyle)
    If eVal <> m_Style Then
        m_Style = eVal
        PropertyChanged "Style"
        Init_Style
        DrawButton (eNormal)
    End If
End Property

Public Property Get Style() As eStyle
    Style = m_Style
End Property

Public Property Let PictureAlignment(eVal As eAlignment)
    If eVal <> m_PictureAlignment Then
        m_PictureAlignment = eVal
        PropertyChanged "PictureAlignment"
        DrawButton (eNormal)
    End If
End Property

Public Property Get PictureAlignment() As eAlignment
    PictureAlignment = m_PictureAlignment
End Property

Public Property Let Caption(ByVal New_Caption As String)
    m_Caption = New_Caption
    PropertyChanged "Caption"
    DrawButton (eNormal)
End Property

Public Property Get Caption() As String
    Caption = m_Caption
End Property

Public Property Set Font(ByVal NewFont As StdFont)
     Set UserControl.Font = NewFont
     PropertyChanged "Font"
     DrawButton (eNormal)
End Property

Public Property Get Font() As StdFont
     Set Font = UserControl.Font
End Property

Private Sub UserControl_Initialize()
    m_Style = Style
End Sub

Private Sub UserControl_InitProperties()
    If Not Ambient.UserMode Then
        m_bEnabled = True
        m_ColorButtonHover = &HFFC090
        m_ColorButtonUp = &HE99950
        m_ColorBright = &HFFEDB0
        m_ColorButtonDown = &HE99950
        m_Caption = UserControl.Name
        UserControl.Picture = LoadPicture("")
    End If
    m_Caption = Extender.Name
    m_InitCompleted = True
End Sub

Private Sub UserControl_KeyDown(KeyCode As Integer, Shift As Integer)
    If Not m_bEnabled Then Exit Sub
    If KeyCode = vbKeyReturn Then UserControl_MouseDown 1, 0, 0, 0
End Sub

Private Sub UserControl_KeyUp(KeyCode As Integer, Shift As Integer)
    If Not m_bEnabled Then Exit Sub
    If KeyCode = vbKeyReturn Then
        UserControl_MouseUp 1, 0, 0, 0
        RaiseEvent Click
    End If
End Sub

Private Sub UserControl_Click()
    If Not m_bEnabled Then Exit Sub
    RaiseEvent Click
End Sub

Private Sub UserControl_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Not m_bEnabled Then Exit Sub
    m_hasFocus = True
    DrawButton (ePressed)
    RaiseEvent MouseDown(Button, Shift, X, Y)
End Sub

Private Sub UserControl_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Not m_bEnabled Then Exit Sub
    RaiseEvent MouseMove(Button, Shift, X, Y)
    If Button = 1 And (X < 0 Or X > ScaleWidth Or _
        Y < 0 Or Y > ScaleHeight) Then
        IsHover = False
        DrawButton (eNormal)
    End If
End Sub

Private Sub UserControl_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Not m_bEnabled Then Exit Sub
    If Not m_Checked Then
        If IsHover Then
            DrawButton (eHover)
        Else
            If m_hasFocus Then DrawButton (eFocus)
        End If
    End If
    RaiseEvent MouseUp(Button, Shift, X, Y)
End Sub

Private Sub UserControl_DblClick()
    If Not m_bEnabled Then Exit Sub
    DrawButton (ePressed)
    RaiseEvent DblClick
End Sub

Private Sub UserControl_EnterFocus()
    m_hasFocus = True
    If Not m_bEnabled Then Exit Sub
    If Not m_Checked And Not IsHover Then DrawButton (eFocus)
End Sub

Private Sub UserControl_ExitFocus()
    m_hasFocus = False
    If Not m_bEnabled Then Exit Sub
    If Not m_Checked Then DrawButton (eNormal)
End Sub

Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
    With PropBag
        .WriteProperty "Enabled", m_bEnabled, True
        .WriteProperty "Font", UserControl.Font, Ambient.Font
        .WriteProperty "Caption", m_Caption, UserControl.Name
        .WriteProperty "IconHighLite", m_bIconHighLite, False
        .WriteProperty "IconHighLiteColor", m_lIconHighLiteColor, &HFF00&
        .WriteProperty "CaptionHighLite", m_bCaptionHighLite, False
        .WriteProperty "CaptionHighLiteColor", m_lCaptionHighLiteColor, &HFF00&
        .WriteProperty "ForeColor", m_ForeColor, m_def_ForeColor
        .WriteProperty "Picture", m_StdPicture, Nothing
        .WriteProperty "PictureAlignment", m_PictureAlignment, m_def_PictureAlignment
        .WriteProperty "Style", m_Style, 0
        .WriteProperty "Checked", m_Checked
        .WriteProperty "ColorButtonHover", m_ColorButtonHover
        .WriteProperty "ColorButtonUp", m_ColorButtonUp
        .WriteProperty "ColorButtonDown", m_ColorButtonDown
        .WriteProperty "BorderBrightness", m_BorderBrightness
        .WriteProperty "ColorBright", m_ColorBright
        .WriteProperty "DisplayHand", m_DisplayHand
        .WriteProperty "ColorScheme", m_ColorScheme
    End With
End Sub

Private Sub UserControl_Resize()
    Init_Style
    DrawButton (eNormal)
End Sub

Private Sub UserControl_Show()
    Init_Style
    DrawButton (eNormal)
End Sub

Private Sub DrawButton(vState As eState)
    If m_Checked Then vState = eChecked
    If m_InitCompleted Then
        UserControl.Picture = LoadPicture("")
        Select Case m_Style
            Case XP_Button
                DrawXPButton vState
            Case Crystal, Mac, WMP, Mac_Variation, Iceblock
                DrawCrystalButton vState
            Case Plastic
                DrawPlasticButton vState
            Case XP_ToolBarButton
                DrawXPToolbarButton vState
        End Select
        DrawIconWCaption vState
    End If
End Sub

Public Sub DrawIconWCaption(vState As eState)
    Dim pW As Long, pH As Long, lW As Long, lH As Long
    Dim StartX As Long, StartY As Long, lBrush As Long, lFlags As Long
    Dim lTemp As Long, XCoord As Long, YCoord As Long
    
    If Not m_StdPicture Is Nothing Then
        pW = ScaleX(m_StdPicture.Width, vbHimetric, vbPixels)
        pH = ScaleY(m_StdPicture.Height, vbHimetric, vbPixels)
    End If
    
    If LenB(m_Caption) Then
        lW = TextWidth(m_Caption)
        lH = TextHeight(m_Caption)
    End If
    
    Select Case m_PictureAlignment
        Case Is = PIC_TOP
            StartX = ((ScaleWidth - pW) \ 2) + 1
            StartY = (ScaleHeight - (pH + lH)) \ 2 + 1
            XCoord = Abs(ScaleWidth \ 2 - lW \ 2)
            YCoord = Abs(ScaleHeight \ 2 + pH \ 2 - lH \ 2)
        Case Is = PIC_BOTTOM
            StartX = (ScaleWidth - pW) \ 2
            StartY = (ScaleHeight - (pH - lH)) \ 2 + 1
            XCoord = Abs(ScaleWidth \ 2 - lW \ 2)
            YCoord = Abs(ScaleHeight \ 2 - (pH + lH) \ 2)
        Case Is = PIC_LEFT
            If CornerRadius Then StartX = CornerRadius Else StartX = 8
            StartY = (ScaleHeight - pH) \ 2 + 1
            XCoord = Abs(ScaleWidth \ 2 - lW \ 2)
            YCoord = Abs(ScaleHeight \ 2 - lH \ 2)
        Case Is = PIC_RIGHT
            If CornerRadius Then StartX = ScaleWidth - CornerRadius - pW Else StartX = ScaleWidth - 8 - pW
            StartY = (ScaleHeight - pH) \ 2 + 1
            XCoord = Abs(ScaleWidth \ 2 - lW \ 2)
            YCoord = Abs(ScaleHeight \ 2 - lH \ 2)
    End Select
    If vState = ePressed Then
        StartX = StartX + 1: XCoord = XCoord + 1
        StartY = StartY + 1: YCoord = YCoord + 1
    End If
    If m_bEnabled Then lFlags = DST_PREFIXTEXT Or DSS_NORMAL Else lFlags = DST_PREFIXTEXT Or DSS_DISABLED
    
    If vState = eHover And m_bCaptionHighLite Then
        lTemp = UserControl.ForeColor
        UserControl.ForeColor = m_lCaptionHighLiteColor
    End If
    If LenB(m_Caption) Then Call DrawStateText(hdc, 0&, 0&, m_Caption, Len(m_Caption), _
               XCoord, YCoord, 0&, 0&, lFlags)
    'Return the old forecolor state
    If vState = eHover And m_bCaptionHighLite Then UserControl.ForeColor = lTemp
    
    If Not m_StdPicture Is Nothing Then
        If m_StdPicture.Type = vbPicTypeBitmap Then
            lFlags = DST_BITMAP
        ElseIf m_StdPicture.Type = vbPicTypeIcon Then
            lFlags = DST_ICON
        End If
        If Not m_bEnabled Then
            lFlags = lFlags Or DSS_DISABLED 'Draw disabled
        ElseIf vState = eHover And m_bIconHighLite Then
            lBrush = CreateSolidBrush(m_lIconHighLiteColor)
            lFlags = lFlags Or DSS_MONO 'Draw highlighted
        End If
        With m_StdPicture
            DrawState hdc, lBrush, 0, .Handle, 0, CLng(StartX), _
                    CLng(StartY), .Width, .Height, lFlags
        End With
        'm_StdPicture.Render Usercontrol.hDC, CLng(StartX), CLng(StartY), CLng(pW), CLng(pH), _
                    0, m_StdPicture.Height, m_StdPicture.Width, -m_StdPicture.Height, ByVal 0&
        If vState = eHover And m_bIconHighLite Then DeleteObject lBrush
    End If
    
    UserControl.Refresh
End Sub

Private Function DrawXPToolbarButton(vState As eState)
Dim i As Long
Dim r1 As Long, g1 As Long, b1 As Long
Dim r2 As Long, g2 As Long, b2 As Long
Dim uH As Long, uW As Long
    uH = ScaleHeight - 1
    uW = ScaleWidth - 1
    On Error Resume Next
        Line (0, 0)-(uW, uH), Parent.BackColor, BF
    On Error GoTo 0
    If vState = ePressed Then
        r1 = 220: g1 = 218: b1 = 209
        r2 = 231: g2 = 230: b2 = 224
        For i = 0 To 3
            Line (0, 1 + i)-(uW, 1 + i), RGB(r2 * (i / 3) + r1 - (r1 * (i / 3)), g2 * (i / 3) + g1 - (g1 * (i / 3)), b2 * (i / 3) + b1 - (b1 * (i / 3)))
        Next
        r1 = 231: g1 = 230: b1 = 224
        r2 = 225: g2 = 224: b2 = 216
        For i = 4 To uH - 4
            Line (0, i)-(uW, i), RGB(r2 * (i / (uH - 6)) + r1 - (r1 * (i / (uH - 6))), g2 * (i / (uH - 6)) + g1 - (g1 * (i / (uH - 6))), b2 * (i / (uH - 6)) + b1 - (b1 * (i / (uH - 6))))
        Next
        r1 = 225: g1 = 224: b1 = 216
        r2 = 235: g2 = 234: b2 = 229
        For i = 0 To 3
            Line (0, uH - 4 + i)-(uW, uH - 4 + i), RGB(r2 * (i / 3) + r1 - (r1 * (i / 3)), g2 * (i / 3) + g1 - (g1 * (i / 3)), b2 * (i / 3) + b1 - (b1 * (i / 3)))
        Next
        PSet (1, 0), RGB(215, 215, 204): PSet (0, 1), RGB(215, 215, 204)
        Line (0, 2)-(2, 0), RGB(179, 179, 168) '7617536
        Line (2, 0)-(uW - 2, 0), RGB(157, 157, 146)
        PSet (uW - 1, 0), RGB(215, 215, 204): PSet (uW, 1), RGB(215, 215, 204)
        Line (uW - 2, 0)-(uW, 2), RGB(179, 179, 168) '7617536
        Line (uW, 2)-(uW, uH - 2), RGB(157, 157, 146)
        PSet (uW, uH - 1), RGB(215, 215, 204): PSet (uW - 1, uH), RGB(215, 215, 204)
        Line (uW, uH - 2)-(uW - 2, uH), RGB(179, 179, 168) ' 7617536
        Line (uW - 2, uH)-(2, uH), RGB(157, 157, 146)
        PSet (1, uH), RGB(215, 215, 204): PSet (0, uH - 1), RGB(215, 215, 204)
        Line (2, uH)-(0, uH - 2), RGB(179, 179, 168) '7617536
        Line (0, uH - 2)-(0, 2), RGB(157, 157, 146)
    ElseIf vState = eHover Then
        r1 = 254: g1 = 254: b1 = 253
        r2 = 252: g2 = 252: b2 = 249
        For i = 0 To 3
            Line (0, 1 + i)-(uW, 1 + i), RGB(r2 * (i / 3) + r1 - (r1 * (i / 3)), g2 * (i / 3) + g1 - (g1 * (i / 3)), b2 * (i / 3) + b1 - (b1 * (i / 3)))
        Next
        r1 = 252: g1 = 252: b1 = 249
        r2 = 238: g2 = 237: b2 = 229
        For i = 4 To uH - 4
            Line (0, i)-(uW, i), RGB(r2 * (i / (uH - 6)) + r1 - (r1 * (i / (uH - 6))), g2 * (i / (uH - 6)) + g1 - (g1 * (i / (uH - 6))), b2 * (i / (uH - 6)) + b1 - (b1 * (i / (uH - 6))))
        Next
        r1 = 238: g1 = 237: b1 = 229
        r2 = 215: g2 = 210: b2 = 198
        For i = 0 To 3
            Line (0, uH - 4 + i)-(uW, uH - 4 + i), RGB(r2 * (i / 3) + r1 - (r1 * (i / 3)), g2 * (i / 3) + g1 - (g1 * (i / 3)), b2 * (i / 3) + b1 - (b1 * (i / 3)))
        Next
        
        PSet (1, 0), RGB(232, 232, 221): PSet (0, 1), RGB(232, 232, 221)
        Line (0, 2)-(2, 0), RGB(216, 216, 205) '7617536
        Line (2, 0)-(uW - 2, 0), RGB(206, 206, 195)
        PSet (uW - 1, 0), RGB(232, 232, 221): PSet (uW, 1), RGB(232, 232, 221)
        Line (uW - 2, 0)-(uW, 2), RGB(216, 216, 205) '7617536
        Line (uW, 2)-(uW, uH - 2), RGB(206, 206, 195)
        PSet (uW, uH - 1), RGB(232, 232, 221): PSet (uW - 1, uH), RGB(232, 232, 221)
        Line (uW, uH - 2)-(uW - 2, uH), RGB(216, 216, 205) ' 7617536
        Line (uW - 2, uH)-(2, uH), RGB(206, 206, 195)
        PSet (1, uH), RGB(232, 232, 221): PSet (0, uH - 1), RGB(232, 232, 221)
        Line (2, uH)-(0, uH - 2), RGB(216, 216, 205) '7617536
        Line (0, uH - 2)-(0, 2), RGB(206, 206, 195)
    ElseIf vState = eChecked Then
        Line (1, 1)-(uW - 1, uH - 1), vbWhite, BF
        PSet (1, 0), RGB(203, 213, 214): PSet (0, 1), RGB(203, 213, 214)
        Line (0, 2)-(2, 0), RGB(152, 175, 190) '7617536
        Line (2, 0)-(uW - 2, 0), RGB(122, 152, 175)
        PSet (uW - 1, 0), RGB(203, 213, 214): PSet (uW, 1), RGB(203, 213, 214)
        Line (uW - 2, 0)-(uW, 2), RGB(152, 175, 190) '7617536
        Line (uW, 2)-(uW, uH - 2), RGB(122, 152, 175)
        PSet (uW, uH - 1), RGB(203, 213, 214): PSet (uW - 1, uH), RGB(203, 213, 214)
        Line (uW, uH - 2)-(uW - 2, uH), RGB(152, 175, 190) ' 7617536
        Line (uW - 2, uH)-(2, uH), RGB(122, 152, 175)
        PSet (1, uH), RGB(203, 213, 214): PSet (0, uH - 1), RGB(203, 213, 214)
        Line (2, uH)-(0, uH - 2), RGB(152, 175, 190) '7617536
        Line (0, uH - 2)-(0, 2), RGB(122, 152, 175)
    End If
End Function

Private Function DrawXPButton(vState As eState)
Dim i As Long
Dim r1 As Long, g1 As Long, b1 As Long
Dim r2 As Long, g2 As Long, b2 As Long
Dim uH As Long, uW As Long
    uH = ScaleHeight - 1
    uW = ScaleWidth - 1
    On Error Resume Next
        Line (0, 0)-(uW, uH), Parent.BackColor, BF
    On Error GoTo 0
    If vState = ePressed Then
        r1 = 209: g1 = 204: b1 = 193
        r2 = 229: g2 = 228: b2 = 221
        For i = 0 To 3
            Line (0, 1 + i)-(uW, 1 + i), RGB(r2 * (i / 3) + r1 - (r1 * (i / 3)), g2 * (i / 3) + g1 - (g1 * (i / 3)), b2 * (i / 3) + b1 - (b1 * (i / 3)))
        Next
        r1 = 229: g1 = 228: b1 = 221
        r2 = 226: g2 = 226: b2 = 218
        For i = 4 To uH - 4
            Line (0, i)-(uW, i), RGB(r2 * (i / (uH - 6)) + r1 - (r1 * (i / (uH - 6))), g2 * (i / (uH - 6)) + g1 - (g1 * (i / (uH - 6))), b2 * (i / (uH - 6)) + b1 - (b1 * (i / (uH - 6))))
        Next
        r1 = 226: g1 = 226: b1 = 218
        r2 = 242: g2 = 241: b2 = 238
        For i = 0 To 4
            Line (0, uH - 4 + i)-(uW, uH - 4 + i), RGB(r2 * (i / 3) + r1 - (r1 * (i / 3)), g2 * (i / 3) + g1 - (g1 * (i / 3)), b2 * (i / 3) + b1 - (b1 * (i / 3)))
        Next
    Else
        r1 = 236: g1 = 235: b1 = 230
        r2 = 214: g2 = 208: b2 = 197
        For i = 0 To uH - 3
            Line (1, i)-(uW, i), RGB(r1 * (i / (uH - 3)) + 255 - (255 * (i / (uH - 3))), g1 * (i / (uH - 3)) + 255 - (255 * (i / (uH - 3))), b1 * (i / (uH - 3)) + 255 - (255 * (i / (uH - 3))))
        Next
    
        For i = 0 To 3
            Line (0, uH - 4 + i)-(uW, uH - 4 + i), RGB(r2 * (i / 3) + r1 - (r1 * (i / 3)), g2 * (i / 3) + g1 - (g1 * (i / 3)), b2 * (i / 3) + b1 - (b1 * (i / 3)))
        Next
    End If
    
    Select Case vState
        Case Is = eFocus
            Line (0, 1)-(uW, 1), RGB(206, 231, 255)
            Line (0, 2)-(uW, 2), RGB(188, 212, 246)
            r1 = 188: g1 = 212: b1 = 246
            r2 = 137: g2 = 173: b2 = 228
            For i = 3 To uH - 3
                Line (0, i)-(3, i), RGB(r2 * (i / uH) + r1 - (r1 * (i / uH)), g2 * (i / uH) + g1 - (g1 * (i / uH)), b2 * (i / uH) + b1 - (b1 * (i / uH)))
                Line (uW - 2, i)-(uW, i), RGB(r2 * (i / uH) + r1 - (r1 * (i / uH)), g2 * (i / uH) + g1 - (g1 * (i / uH)), b2 * (i / uH) + b1 - (b1 * (i / uH)))
            Next
            Line (0, uH - 2)-(uW, uH - 2), RGB(137, 173, 228)
            Line (0, uH - 1)-(uW, uH - 1), RGB(105, 130, 238)
        Case Is = eHover
            Line (0, 1)-(uW, 1), RGB(255, 240, 202)
            Line (0, 2)-(uW, 2), RGB(253, 216, 137)
            r1 = 253: g1 = 216: b1 = 137
            r2 = 248: g2 = 178: b2 = 48
            For i = 3 To uH - 3
                Line (0, i)-(3, i), RGB(r2 * (i / uH) + r1 - (r1 * (i / uH)), g2 * (i / uH) + g1 - (g1 * (i / uH)), b2 * (i / uH) + b1 - (b1 * (i / uH)))
                Line (uW - 2, i)-(uW, i), RGB(r2 * (i / uH) + r1 - (r1 * (i / uH)), g2 * (i / uH) + g1 - (g1 * (i / uH)), b2 * (i / uH) + b1 - (b1 * (i / uH)))
            Next
            Line (0, uH - 2)-(uW, uH - 2), RGB(248, 178, 48)
            Line (0, uH - 1)-(uW, uH - 1), RGB(229, 151, 0)
    End Select
    
    PSet (0, 1), RGB(122, 149, 168): PSet (1, 0), RGB(122, 149, 168)
    Line (0, 2)-(2, 0), RGB(37, 87, 131) '7617536
    Line (2, 0)-(uW - 2, 0), 7617536
    PSet (uW - 1, 0), RGB(122, 149, 168): PSet (uW, 1), RGB(122, 149, 168)
    Line (uW - 2, 0)-(uW, 2), RGB(37, 87, 131)  '7617536
    Line (uW, 2)-(uW, uH - 2), 7617536
    PSet (uW, uH - 1), RGB(122, 149, 168): PSet (uW - 1, uH), RGB(122, 149, 168)
    Line (uW, uH - 2)-(uW - 2, uH), RGB(37, 87, 131) ' 7617536
    Line (uW - 2, uH)-(2, uH), 7617536
    PSet (1, uH), RGB(122, 149, 168): PSet (0, uH - 1), RGB(122, 149, 168)
    Line (2, uH)-(0, uH - 2), RGB(37, 87, 131)  '7617536
    Line (0, uH - 2)-(0, 2), 7617536
End Function

Private Function DrawCrystalButton(vState As eState)
    Dim CrystalParam As tCrystalParam
    If m_Style = Mac Then 'Mac
        'CrystalParam.Ref_MixColorFrom = 0 '20
        CrystalParam.Ref_Intensity = 70 '50
        CrystalParam.Ref_Left = (CornerRadius \ 3)
        'CrystalParam.Ref_Top = 0
        CrystalParam.Ref_Height = 12 'CornerRadius - 2
        CrystalParam.Ref_Width = ScaleWidth + 2 * CornerRadius
        CrystalParam.Ref_Radius = 10 'CornerRadius \ 2
        CrystalParam.RadialGXPercent = 200
        CrystalParam.RadialGYPercent = 100 - (7 * 100 \ ScaleHeight)
        If CrystalParam.RadialGYPercent > 80 Then CrystalParam.RadialGYPercent = 80
        CrystalParam.RadialGOffsetX = ScaleWidth / 2
        CrystalParam.RadialGOffsetY = ScaleHeight
        CrystalParam.RadialGIntensity = 130
    ElseIf m_Style = WMP Then 'WMP
        CrystalParam.Ref_Intensity = 40
        CrystalParam.Ref_Left = -CornerRadius \ 2 - 1
        CrystalParam.Ref_Top = -CornerRadius
        CrystalParam.Ref_Height = (CornerRadius) + 1
        CrystalParam.Ref_Width = ScaleWidth + 2 * CornerRadius
        CrystalParam.Ref_Radius = CornerRadius
        CrystalParam.RadialGXPercent = 60
        CrystalParam.RadialGYPercent = 60
        CrystalParam.RadialGOffsetX = ScaleWidth / 2
        CrystalParam.RadialGOffsetY = ScaleHeight
        CrystalParam.RadialGIntensity = 130
    ElseIf m_Style = Mac_Variation Then
        CrystalParam.Ref_Intensity = 70
        CrystalParam.Ref_Left = (CornerRadius \ 3) - 1
        CrystalParam.Ref_Height = CornerRadius
        CrystalParam.Ref_Width = ScaleWidth + 2 * CornerRadius
        'CrystalParam.Ref_Top = 0
        CrystalParam.Ref_Radius = (CornerRadius \ 2)
        CrystalParam.RadialGXPercent = 200
        CrystalParam.RadialGYPercent = 70
        CrystalParam.RadialGOffsetX = ScaleWidth / 2
        CrystalParam.RadialGOffsetY = ScaleHeight
        CrystalParam.RadialGIntensity = 130
    ElseIf m_Style = Crystal Then
        CrystalParam.Ref_Intensity = 50
        CrystalParam.Ref_Left = CornerRadius \ 2
        CrystalParam.Ref_Height = CornerRadius * 1.1
        CrystalParam.Ref_Width = ScaleWidth + 2 * CornerRadius
        CrystalParam.Ref_Top = 1
        CrystalParam.Ref_Radius = CornerRadius \ 2
        CrystalParam.RadialGXPercent = 300
        CrystalParam.RadialGYPercent = 60
        CrystalParam.RadialGOffsetX = ScaleWidth / 2
        CrystalParam.RadialGOffsetY = ScaleHeight
        CrystalParam.RadialGIntensity = 120
    ElseIf m_Style = Iceblock Then
        CrystalParam.Ref_Intensity = 50
        CrystalParam.Ref_Left = CornerRadius / 2
        CrystalParam.Ref_Top = 2
        CrystalParam.Ref_Height = CornerRadius + 1
        CrystalParam.Ref_Width = ScaleWidth - CornerRadius
        CrystalParam.Ref_Radius = CornerRadius / 2
        CrystalParam.RadialGXPercent = 60
        CrystalParam.RadialGYPercent = 60
        CrystalParam.RadialGOffsetX = ScaleWidth / 2
        CrystalParam.RadialGOffsetY = ScaleHeight / 2
        CrystalParam.RadialGIntensity = 100
    End If
    Select Case vState
        Case eHover
            DrawCrystal ScaleWidth, ScaleHeight, m_ColorButtonHover, CrystalParam
        Case ePressed, eChecked
            DrawCrystal ScaleWidth, ScaleHeight, ColorButtonDown, CrystalParam
        Case eNormal, eFocus
            DrawCrystal ScaleWidth, ScaleHeight, m_ColorButtonUp, CrystalParam
    End Select
End Function

Private Sub DrawCrystal(lWidth As Long, lHeight As Long, ByVal Color As Long, CrystalParam As tCrystalParam)
Dim i As Long, J As Long, ptColor As Long, ColorBright As Long
Dim RGXPercent As Single, RGYPercent As Single, RadialGradient As Long
Dim hHlRgn As Long, Bordercolor As Long, nBrush As Long, ClientRct As RECT
    
    If CornerRadius < 1 Then CornerRadius = 1
    ColorBright = m_ColorBright
    'In Disabled state Color = 11583680 (light gray)
    'and ColorBright = vbWhite
    If Not m_bEnabled Then Color = 11583680: ColorBright = vbWhite
    
    RGYPercent = (100 - CrystalParam.RadialGYPercent) / (lHeight * 2)
    RGXPercent = (100 - CrystalParam.RadialGXPercent) / lWidth
    
    If m_BorderBrightness >= 0 Then
        Bordercolor = BlendColors(Color, vbWhite, m_BorderBrightness)
    Else
        Bordercolor = BlendColors(Color, vbBlack, -m_BorderBrightness)
    End If
    'Create Highlite region (hHlRgn), we will use PtInRegion to
    'check if we are inside the highlite Rounded rectangle
    'you could simply use IsInRoundRect(i ,j ,CrystalParam.Ref_Left, CrystalParam.Ref_Top, CrystalParam.Ref_Width, CrystalParam.Ref_Height, CrystalParam.Ref_Radius * 2, CrystalParam.Ref_Radius * 2)
    'instead of PtInRegion and remove these lines, but will be slower.
    hHlRgn = CreateRoundRectRgn(CrystalParam.Ref_Left, CrystalParam.Ref_Top, CrystalParam.Ref_Width, CrystalParam.Ref_Height, CrystalParam.Ref_Radius * 2, CrystalParam.Ref_Radius * 2)
    'Paint the Background Color
    SetRect ClientRct, 0, 0, lWidth, lHeight
    nBrush = CreateSolidBrush(Color)
    FillRect hdc, ClientRct, nBrush
    DeleteObject nBrush
    'Draw a radial Gradient
    DrawElipse hdc, CrystalParam, lWidth, lHeight, Color, ColorBright
    For J = 0 To lHeight
        For i = 0 To lWidth \ 2
            If PtInRegion(hButtonRegion, i, J) Then
                'We are inside the button
                If PtInRegion(hHlRgn, i, J) Then
                    ptColor = BlendColors(vbWhite, Color, CrystalParam.Ref_MixColorFrom + J * CrystalParam.Ref_Intensity \ CornerRadius)
                    Line (i, J)-(lWidth - i + 1, J), ptColor
                    i = 0: J = J + 1
                End If
            Else
                'this draw a thin border
                SetPixelV hdc, i, J, Bordercolor
                SetPixelV hdc, lWidth - i, J, Bordercolor
            End If
        Next i
    Next J
    DeleteObject hHlRgn
End Sub

Private Sub DrawElipse(lhDC As Long, CrystalParam As tCrystalParam, lWidth, lHeight, FromColor As Long, ToColor As Long)
Dim oldBrush As Long, newBrush As Long, newPen As Long, oldPen As Long
Dim incX As Single, incY As Single, RadX As Long, RadY As Long
Dim klr As Long, rc As RECT
    klr = 1
    RadX = CrystalParam.RadialGXPercent * lWidth / 100
    RadY = CrystalParam.RadialGYPercent * lHeight / 100
    SetRect rc, CrystalParam.RadialGOffsetX - RadX, CrystalParam.RadialGOffsetY - RadY, _
                CrystalParam.RadialGOffsetX + RadX, CrystalParam.RadialGOffsetY + RadY
    incX = 1: incY = 1
    If RadX > RadY Then
        incX = (RadX / RadY)
    Else
        incY = (RadY / RadX)
    End If
    newBrush = CreateSolidBrush(FromColor)
    oldBrush = SelectObject(lhDC, newBrush)
    newPen = CreatePen(5, 0, FromColor)
    oldPen = SelectObject(lhDC, newPen)
    Do Until Not IsRectEmpty(rc) = 0
        Ellipse lhDC, rc.Left, rc.Top, rc.Right, rc.Bottom
        InflateRect rc, -incX, -incY
        klr = klr + 1
        newBrush = CreateSolidBrush(BlendColors(FromColor, ToColor, klr * CrystalParam.RadialGIntensity / RadY))
        DeleteObject SelectObject(lhDC, newBrush)
    Loop
    DeleteObject SelectObject(lhDC, oldBrush)
    DeleteObject SelectObject(lhDC, oldPen)
End Sub

Private Function DrawPlasticButton(vState As eState)
    Select Case vState
        Case eHover
            DrawPlastic 0, 0, ScaleWidth - 1, ScaleHeight - 1, m_ColorButtonHover
        Case ePressed, eChecked
            DrawPlastic 0, 0, ScaleWidth - 1, ScaleHeight - 1, ColorButtonDown
        Case eNormal, eFocus
            DrawPlastic 0, 0, ScaleWidth - 1, ScaleHeight - 1, m_ColorButtonUp
    End Select
End Function

Private Sub DrawPlastic(X As Long, Y As Long, lWidth As Long, lHeight As Long, Color As Long)
Dim i As Long, J As Long, HighlightColor As Long, ShadowColor As Long
Dim ptColor As Long, LinearGPercent As Long
    ShadowColor = BlendColors(vbBlack, Color, 50)
    
    For J = 0 To lHeight
        If J < CornerRadius Then
            HighlightColor = BlendColors(vbWhite, Color, J * 30 \ CornerRadius)
        End If
        LinearGPercent = Abs((2 * J - lHeight) * 100 \ lHeight)
        For i = 0 To lWidth \ 2
            If IsInRoundRect(i, J, 1, 1, lWidth - 2, lHeight - 2, CornerRadius) Then
                'Drawing the button properly
                If IsInRoundRect(i, J, 4, 2, lWidth - CornerRadius, 2 * CornerRadius - 1, 2 * CornerRadius \ 3) _
                And Not IsInRoundRect(i, J, 4, CornerRadius \ 2, lWidth - CornerRadius, 2 * CornerRadius - 1, 2 * CornerRadius \ 3) Then
                    ptColor = HighlightColor 'draw reflected highlight
                Else
                    ptColor = BlendColors(Color, m_ColorBright, LinearGPercent)
                End If
                SetPixelV hdc, i, J, ptColor
                SetPixelV hdc, lWidth - i, J, ptColor
            ElseIf IsInRoundRect(i, J, 0, 0, lWidth, lHeight, CornerRadius) Then
                'this draw a thin border
                SetPixelV hdc, i, J, ShadowColor
                SetPixelV hdc, lWidth - i, J, ShadowColor
            End If
        Next i
    Next J
End Sub

'/----------------------------------------------------------------------------------/
'/                                                                                  /
'/ Init_Style                                                                       /
'/ -------------------                                                              /
'/ Description:                                                                     /
'/                                                                                  /
'/ Init_Style will create the window region according to the button style           /
'/ and will be responsible of storing the same region (but without the border)      /
'/ in hButtonRegion. This will be used later to determine if a point                /
'/ is inside the button region.                                                     /
'/----------------------------------------------------------------------------------/
Private Sub Init_Style()
Dim lCornerRad As Long
    'Remove the older Region
    If hButtonRegion Then DeleteObject hButtonRegion
    Select Case m_Style
        Case Crystal, WMP, Mac_Variation
            lCornerRad = SetBound(ScaleHeight \ 2 + 1, 1, ScaleWidth \ 2)
        Case Mac
            lCornerRad = 12
        Case Iceblock
            lCornerRad = SetBound(ScaleHeight \ 4 + 1, 1, ScaleWidth \ 4)
        Case Plastic
            lCornerRad = SetBound(ScaleHeight \ 3, 1, ScaleWidth \ 3)
    End Select

    If m_Style = Crystal Or m_Style = WMP Or m_Style = Mac Or _
        m_Style = Mac_Variation Or m_Style = Plastic Or m_Style = Iceblock Then
        hButtonRegion = CreateRoundedRegion(0, 0, ScaleWidth, ScaleHeight, lCornerRad)
        
        'Set the Button Region
        Call SetWindowRgn(hwnd, hButtonRegion, True)
        DeleteObject hButtonRegion
        'Store the region but exclude the border
        hButtonRegion = CreateRoundedRegion(1, 1, ScaleWidth - 2, ScaleHeight - 2, lCornerRad)
    Else
        Call SetWindowRgn(hwnd, 0, True)
    End If
End Sub

'/----------------------------------------------------------------------------------/
'/                                                                                  /
'/ CreateRoundedRegion                                                              /
'/ -------------------                                                              /
'/ Description:                                                                     /
'/                                                                                  /
'/ CreateRoundedRegion returns a rounded region based on a given Width, Height      /
'/ and a CornerRadius. We will use this function instead of normal CreateRoundRect  /
'/ because this will give us a better rounded rectangle for our purposes.           /
'/----------------------------------------------------------------------------------/
Private Function CreateRoundedRegion(X As Long, Y As Long, lWidth As Long, lHeight As Long, Radius As Long) As Long
Dim i As Long, J As Long, i2 As Long, j2 As Long, i3 As Long, j3 As Long
Dim hRgn As Long
    CornerRadius = Radius
    If CornerRadius < 1 Then CornerRadius = 1
    '/* Create initial region
    hRgn = CreateRectRgn(0, 0, X + lWidth, Y + lHeight)
    For J = 0 To Y + lHeight
        For i = 0 To (X + lWidth) \ 2
            If Not IsInRoundRect(i, J, X, Y, lWidth, lHeight, CornerRadius) Then
                '/* substract the pixels outside of the rounded rectangle
                '/* (it doesn't exclude the border)
                If Not J = j2 Then
                    '*** If 2 * i2 <> Width Then i2 = i2 + 1
                    ExcludePixelsFromRegion hRgn, X + lWidth - i2, j2, lWidth - i, J
                    If Not 2 * i2 = X + lWidth Then
                        i2 = i2 + 1
                    End If
                    ExcludePixelsFromRegion hRgn, i, J, i2, j2
                End If
                i2 = i
                j2 = J
            End If
        Next i
    Next J
    CreateRoundedRegion = hRgn
End Function

Private Sub ExcludePixelsFromRegion(hRgn As Long, X1 As Long, Y1 As Long, X2 As Long, Y2 As Long)
    Dim hRgnTemp As Long
    hRgnTemp = CreateRectRgn(X1, Y1, X2, Y2)
    CombineRgn hRgn, hRgn, hRgnTemp, RGN_XOR
    DeleteObject hRgnTemp
End Sub

Private Function IsInRoundRect(i As Long, J As Long, X As Long, Y As Long, lWidth As Long, lHeight As Long, Radius As Long) As Boolean
Dim offX As Long, offY As Long
    offX = i - X
    offY = J - Y
    If offY > Radius And offY + Radius < lHeight And offX > Radius And offX + Radius < lWidth Then
        '/* This is to catch early most cases
        IsInRoundRect = True
    ElseIf offX < Radius And offY <= Radius Then
        If IsInCircle(offX - Radius, offY, Radius) Then IsInRoundRect = True
    ElseIf offX + Radius > lWidth And offY <= Radius Then
        If IsInCircle(offX - lWidth + Radius, offY, Radius) Then IsInRoundRect = True
    ElseIf offX < Radius And offY + Radius >= lHeight Then
        If IsInCircle(offX - Radius, offY - lHeight + Radius * 2, Radius) Then IsInRoundRect = True
    ElseIf offX + Radius > lWidth And offY + Radius >= lHeight Then
        If IsInCircle(offX - lWidth + Radius, offY - lHeight + Radius * 2, Radius) Then IsInRoundRect = True
    Else
        If offX > 0 And offX < lWidth And offY > 0 And offY < lHeight Then IsInRoundRect = True
    End If
End Function

Private Function IsInCircle(ByRef X As Long, ByRef Y As Long, ByRef r As Long) As Boolean
Dim lResult As Long
    '/* this detect a circunference centered on y=-r and x=0
    lResult = (r * r) - (X * X)
    If lResult >= 0 Then
        lResult = Sqr(lResult)
        If Abs(Y - r) < lResult Then IsInCircle = True
    End If
End Function

Public Function BlendColors(ByRef Color1 As Long, ByRef Color2 As Long, ByRef Percentage As Long) As Long
Dim r(2) As Long, g(2) As Long, b(2) As Long
    
    Percentage = SetBound(Percentage, 0, 100)
    
    GetRGB r(0), g(0), b(0), Color1
    GetRGB r(1), g(1), b(1), Color2
    
    r(2) = r(0) + (r(1) - r(0)) * Percentage \ 100
    g(2) = g(0) + (g(1) - g(0)) * Percentage \ 100
    b(2) = b(0) + (b(1) - b(0)) * Percentage \ 100
    
    BlendColors = RGB(r(2), g(2), b(2))
End Function

Private Function SetBound(ByRef Num As Long, ByRef MinNum As Long, ByRef MaxNum As Long) As Long
    If Num < MinNum Then
        SetBound = MinNum
    ElseIf Num > MaxNum Then
        SetBound = MaxNum
    Else
        SetBound = Num
    End If
End Function

Public Sub GetRGB(r As Long, g As Long, b As Long, Color As Long)
Dim TempValue As Long
    TranslateColor Color, 0, TempValue
    r = TempValue And &HFF&
    g = (TempValue And &HFF00&) \ &H100&
    b = (TempValue And &HFF0000) \ &H10000
End Sub

Private Function HiWord(lDWord As Long) As Integer
  HiWord = (lDWord And &HFFFF0000) \ &H10000
End Function

Private Function LoWord(lDWord As Long) As Integer
  If lDWord And &H8000& Then
    LoWord = lDWord Or &HFFFF0000
  Else
    LoWord = lDWord And &HFFFF&
  End If
End Function
'Read the properties from the property bag - also, a good place to start the subclassing (if we're running)
Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
  Dim w As Long
  Dim h As Long
  Dim s As String
  
    With PropBag
        m_bEnabled = .ReadProperty("Enabled", True)
        Set UserControl.Font = .ReadProperty("Font", Ambient.Font)
        m_Caption = .ReadProperty("Caption", UserControl.Name)
        m_bCaptionHighLite = .ReadProperty("CaptionHighLite", False)
        m_lCaptionHighLiteColor = .ReadProperty("CaptionHighLiteColor", &HFF00&)
        m_bIconHighLite = .ReadProperty("IconHighLite", False)
        m_lIconHighLiteColor = .ReadProperty("IconHighLiteColor", &HFF00&)
        m_ForeColor = .ReadProperty("ForeColor", m_def_ForeColor)
        Set m_StdPicture = .ReadProperty("Picture", Nothing)
        m_PictureAlignment = .ReadProperty("PictureAlignment", m_def_PictureAlignment)
        m_Style = .ReadProperty("Style", 0)
        m_Checked = .ReadProperty("Checked", m_Checked)
        m_ColorButtonHover = .ReadProperty("ColorButtonHover", &HFFC090)
        m_ColorButtonUp = .ReadProperty("ColorButtonUp", &HE99950)
        m_ColorButtonDown = .ReadProperty("ColorButtonDown", &HE99950)
        m_ColorBright = .ReadProperty("ColorBright", &HFFEDB0)
        m_BorderBrightness = .ReadProperty("BorderBrightness", 0)
        m_DisplayHand = .ReadProperty("DisplayHand", False)
        m_ColorScheme = .ReadProperty("ColorScheme", 0)
    End With
    If m_DisplayHand Then UserControl.MousePointer = vbCustom Else UserControl.MousePointer = vbArrow
    UserControl.ForeColor = m_ForeColor
    
  If Ambient.UserMode Then                                                              'If we're not in design mode
    bTrack = True
    bTrackUser32 = IsFunctionExported("TrackMouseEvent", "User32")
  
    If Not bTrackUser32 Then
      If Not IsFunctionExported("_TrackMouseEvent", "Comctl32") Then
        bTrack = False
      End If
    End If
  
    If bTrack Then
      'OS supports mouse leave, so let's subclass for it
      With UserControl
        'Subclass the UserControl
        sc_Subclass .hwnd
        sc_AddMsg .hwnd, WM_PAINT, MSG_BEFORE
        sc_AddMsg .hwnd, WM_MOUSEMOVE
        sc_AddMsg .hwnd, WM_MOUSELEAVE
      End With
    End If
  End If
  m_InitCompleted = True
End Sub

'The control is terminating - a good place to stop the subclasser
Private Sub UserControl_Terminate()
  sc_Terminate                                                              'Terminate all subclassing
  If hButtonRegion Then DeleteObject hButtonRegion
End Sub

'Determine if the passed function is supported
Private Function IsFunctionExported(ByVal sFunction As String, ByVal sModule As String) As Boolean
  Dim hMod        As Long
  Dim bLibLoaded  As Boolean

  hMod = GetModuleHandleA(sModule)

  If hMod = 0 Then
    hMod = LoadLibraryA(sModule)
    If hMod Then
      bLibLoaded = True
    End If
  End If

  If hMod Then
    If GetProcAddress(hMod, sFunction) Then
      IsFunctionExported = True
    End If
  End If

  If bLibLoaded Then
    FreeLibrary hMod
  End If
End Function

'Track the mouse leaving the indicated window
Private Sub TrackMouseLeave(ByVal lng_hWnd As Long)
  Dim tme As TRACKMOUSEEVENT_STRUCT
  
  If bTrack Then
    With tme
      .cbSize = Len(tme)
      .dwFlags = TME_LEAVE
      .hwndTrack = lng_hWnd
    End With

    If bTrackUser32 Then
      TrackMouseEvent tme
    Else
      TrackMouseEventComCtl tme
    End If
  End If
End Sub

'-SelfSub code------------------------------------------------------------------------------------
Private Function sc_Subclass(ByVal lng_hWnd As Long, _
                    Optional ByVal lParamUser As Long = 0, _
                    Optional ByVal nOrdinal As Long = 1, _
                    Optional ByVal oCallback As Object = Nothing, _
                    Optional ByVal bIdeSafety As Boolean = True) As Boolean 'Subclass the specified window handle
'*************************************************************************************************
'* lng_hWnd   - Handle of the window to subclass
'* lParamUser - Optional, user-defined callback parameter
'* nOrdinal   - Optional, ordinal index of the callback procedure. 1 = last private method, 2 = second last private method, etc.
'* oCallback  - Optional, the object that will receive the callback. If undefined, callbacks are sent to this object's instance
'* bIdeSafety - Optional, enable/disable IDE safety measures. NB: you should really only disable IDE safety in a UserControl for design-time subclassing
'*************************************************************************************************
Const CODE_LEN      As Long = 260                                           'Thunk length in bytes
Const MEM_LEN       As Long = CODE_LEN + (8 * (MSG_ENTRIES + 1))            'Bytes to allocate per thunk, data + code + msg tables
Const PAGE_RWX      As Long = &H40&                                         'Allocate executable memory
Const MEM_COMMIT    As Long = &H1000&                                       'Commit allocated memory
Const MEM_RELEASE   As Long = &H8000&                                       'Release allocated memory flag
Const IDX_EBMODE    As Long = 3                                             'Thunk data index of the EbMode function address
Const IDX_CWP       As Long = 4                                             'Thunk data index of the CallWindowProc function address
Const IDX_SWL       As Long = 5                                             'Thunk data index of the SetWindowsLong function address
Const IDX_FREE      As Long = 6                                             'Thunk data index of the VirtualFree function address
Const IDX_BADPTR    As Long = 7                                             'Thunk data index of the IsBadCodePtr function address
Const IDX_OWNER     As Long = 8                                             'Thunk data index of the Owner object's vTable address
Const IDX_CALLBACK  As Long = 10                                            'Thunk data index of the callback method address
Const IDX_EBX       As Long = 16                                            'Thunk code patch index of the thunk data
Const SUB_NAME      As String = "sc_Subclass"                               'This routine's name
  Dim nAddr         As Long
  Dim nID           As Long
  Dim nMyID         As Long
  
  If IsWindow(lng_hWnd) = 0 Then                                            'Ensure the window handle is valid
    zError SUB_NAME, "Invalid window handle"
    Exit Function
  End If

  nMyID = GetCurrentProcessId                                               'Get this process's ID
  GetWindowThreadProcessId lng_hWnd, nID                                    'Get the process ID associated with the window handle
  If nID <> nMyID Then                                                      'Ensure that the window handle doesn't belong to another process
    zError SUB_NAME, "Window handle belongs to another process"
    Exit Function
  End If
  
  If oCallback Is Nothing Then                                              'If the user hasn't specified the callback owner
    Set oCallback = Me                                                      'Then it is me
  End If
  
  nAddr = zAddressOf(oCallback, nOrdinal)                                   'Get the address of the specified ordinal method
  If nAddr = 0 Then                                                         'Ensure that we've found the ordinal method
    zError SUB_NAME, "Callback method not found"
    Exit Function
  End If
    
  If z_Funk Is Nothing Then                                                 'If this is the first time through, do the one-time initialization
    Set z_Funk = New Collection                                             'Create the hWnd/thunk-address collection
    z_Sc(14) = &HD231C031: z_Sc(15) = &HBBE58960: z_Sc(17) = &H4339F631: z_Sc(18) = &H4A21750C: z_Sc(19) = &HE82C7B8B: z_Sc(20) = &H74&: z_Sc(21) = &H75147539: z_Sc(22) = &H21E80F: z_Sc(23) = &HD2310000: z_Sc(24) = &HE8307B8B: z_Sc(25) = &H60&: z_Sc(26) = &H10C261: z_Sc(27) = &H830C53FF: z_Sc(28) = &HD77401F8: z_Sc(29) = &H2874C085: z_Sc(30) = &H2E8&: z_Sc(31) = &HFFE9EB00: z_Sc(32) = &H75FF3075: z_Sc(33) = &H2875FF2C: z_Sc(34) = &HFF2475FF: z_Sc(35) = &H3FF2473: z_Sc(36) = &H891053FF: z_Sc(37) = &HBFF1C45: z_Sc(38) = &H73396775: z_Sc(39) = &H58627404
    z_Sc(40) = &H6A2473FF: z_Sc(41) = &H873FFFC: z_Sc(42) = &H891453FF: z_Sc(43) = &H7589285D: z_Sc(44) = &H3045C72C: z_Sc(45) = &H8000&: z_Sc(46) = &H8920458B: z_Sc(47) = &H4589145D: z_Sc(48) = &HC4836124: z_Sc(49) = &H1862FF04: z_Sc(50) = &H35E30F8B: z_Sc(51) = &HA78C985: z_Sc(52) = &H8B04C783: z_Sc(53) = &HAFF22845: z_Sc(54) = &H73FF2775: z_Sc(55) = &H1C53FF28: z_Sc(56) = &H438D1F75: z_Sc(57) = &H144D8D34: z_Sc(58) = &H1C458D50: z_Sc(59) = &HFF3075FF: z_Sc(60) = &H75FF2C75: z_Sc(61) = &H873FF28: z_Sc(62) = &HFF525150: z_Sc(63) = &H53FF2073: z_Sc(64) = &HC328&

    z_Sc(IDX_CWP) = zFnAddr("user32", "CallWindowProcA")                    'Store CallWindowProc function address in the thunk data
    z_Sc(IDX_SWL) = zFnAddr("user32", "SetWindowLongA")                     'Store the SetWindowLong function address in the thunk data
    z_Sc(IDX_FREE) = zFnAddr("kernel32", "VirtualFree")                     'Store the VirtualFree function address in the thunk data
    z_Sc(IDX_BADPTR) = zFnAddr("kernel32", "IsBadCodePtr")                  'Store the IsBadCodePtr function address in the thunk data
  End If
  
  z_ScMem = VirtualAlloc(0, MEM_LEN, MEM_COMMIT, PAGE_RWX)                  'Allocate executable memory

  If z_ScMem <> 0 Then                                                      'Ensure the allocation succeeded
    On Error GoTo CatchDoubleSub                                            'Catch double subclassing
      z_Funk.Add z_ScMem, "h" & lng_hWnd                                    'Add the hWnd/thunk-address to the collection
    On Error GoTo 0
  
    If bIdeSafety Then                                                      'If the user wants IDE protection
      z_Sc(IDX_EBMODE) = zFnAddr("vba6", "EbMode")                          'Store the EbMode function address in the thunk data
    End If
    
    z_Sc(IDX_EBX) = z_ScMem                                                 'Patch the thunk data address
    z_Sc(IDX_HWND) = lng_hWnd                                               'Store the window handle in the thunk data
    z_Sc(IDX_BTABLE) = z_ScMem + CODE_LEN                                   'Store the address of the before table in the thunk data
    z_Sc(IDX_ATABLE) = z_ScMem + CODE_LEN + ((MSG_ENTRIES + 1) * 4)         'Store the address of the after table in the thunk data
    z_Sc(IDX_OWNER) = ObjPtr(oCallback)                                     'Store the callback owner's object address in the thunk data
    z_Sc(IDX_CALLBACK) = nAddr                                              'Store the callback address in the thunk data
    z_Sc(IDX_PARM_USER) = lParamUser                                        'Store the lParamUser callback parameter in the thunk data
    
    nAddr = SetWindowLongA(lng_hWnd, GWL_WNDPROC, z_ScMem + WNDPROC_OFF)    'Set the new WndProc, return the address of the original WndProc
    If nAddr = 0 Then                                                       'Ensure the new WndProc was set correctly
      zError SUB_NAME, "SetWindowLong failed, error #" & Err.LastDllError
      GoTo ReleaseMemory
    End If
        
    z_Sc(IDX_WNDPROC) = nAddr                                               'Store the original WndProc address in the thunk data
    RtlMoveMemory z_ScMem, VarPtr(z_Sc(0)), CODE_LEN                        'Copy the thunk code/data to the allocated memory
    sc_Subclass = True                                                      'Indicate success
  Else
    zError SUB_NAME, "VirtualAlloc failed, error: " & Err.LastDllError
  End If
  
  Exit Function                                                             'Exit sc_Subclass

CatchDoubleSub:
  zError SUB_NAME, "Window handle is already subclassed"
  
ReleaseMemory:
  VirtualFree z_ScMem, 0, MEM_RELEASE                                       'sc_Subclass has failed after memory allocation, so release the memory
End Function

'Terminate all subclassing
Private Sub sc_Terminate()
  Dim i As Long

  If Not (z_Funk Is Nothing) Then                                           'Ensure that subclassing has been started
    With z_Funk
      For i = .Count To 1 Step -1                                           'Loop through the collection of window handles in reverse order
        z_ScMem = .Item(i)                                                  'Get the thunk address
        If IsBadCodePtr(z_ScMem) = 0 Then                                   'Ensure that the thunk hasn't already released its memory
          sc_UnSubclass zData(IDX_HWND)                                     'UnSubclass
        End If
      Next i                                                                'Next member of the collection
    End With
    Set z_Funk = Nothing                                                    'Destroy the hWnd/thunk-address collection
  End If
End Sub

'UnSubclass the specified window handle
Private Sub sc_UnSubclass(ByVal lng_hWnd As Long)
  If z_Funk Is Nothing Then                                                 'Ensure that subclassing has been started
    zError "sc_UnSubclass", "Window handle isn't subclassed"
  Else
    If IsBadCodePtr(zMap_hWnd(lng_hWnd)) = 0 Then                           'Ensure that the thunk hasn't already released its memory
      zData(IDX_SHUTDOWN) = -1                                              'Set the shutdown indicator
      zDelMsg ALL_MESSAGES, IDX_BTABLE                                      'Delete all before messages
      zDelMsg ALL_MESSAGES, IDX_ATABLE                                      'Delete all after messages
    End If
    z_Funk.Remove "h" & lng_hWnd                                            'Remove the specified window handle from the collection
  End If
End Sub

'Add the message value to the window handle's specified callback table
Private Sub sc_AddMsg(ByVal lng_hWnd As Long, ByVal uMsg As Long, Optional ByVal When As eMsgWhen = eMsgWhen.MSG_AFTER)
  If IsBadCodePtr(zMap_hWnd(lng_hWnd)) = 0 Then                             'Ensure that the thunk hasn't already released its memory
    If When And MSG_BEFORE Then                                             'If the message is to be added to the before original WndProc table...
      zAddMsg uMsg, IDX_BTABLE                                              'Add the message to the before table
    End If
    If When And MSG_AFTER Then                                              'If message is to be added to the after original WndProc table...
      zAddMsg uMsg, IDX_ATABLE                                              'Add the message to the after table
    End If
  End If
End Sub

'Delete the message value from the window handle's specified callback table
Private Sub sc_DelMsg(ByVal lng_hWnd As Long, ByVal uMsg As Long, Optional ByVal When As eMsgWhen = eMsgWhen.MSG_AFTER)
  If IsBadCodePtr(zMap_hWnd(lng_hWnd)) = 0 Then                             'Ensure that the thunk hasn't already released its memory
    If When And MSG_BEFORE Then                                             'If the message is to be deleted from the before original WndProc table...
      zDelMsg uMsg, IDX_BTABLE                                              'Delete the message from the before table
    End If
    If When And MSG_AFTER Then                                              'If the message is to be deleted from the after original WndProc table...
      zDelMsg uMsg, IDX_ATABLE                                              'Delete the message from the after table
    End If
  End If
End Sub

'Call the original WndProc
Private Function sc_CallOrigWndProc(ByVal lng_hWnd As Long, ByVal uMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
  If IsBadCodePtr(zMap_hWnd(lng_hWnd)) = 0 Then                             'Ensure that the thunk hasn't already released its memory
    sc_CallOrigWndProc = _
        CallWindowProcA(zData(IDX_WNDPROC), lng_hWnd, uMsg, wParam, lParam) 'Call the original WndProc of the passed window handle parameter
  End If
End Function

'Get the subclasser lParamUser callback parameter
Private Property Get sc_lParamUser(ByVal lng_hWnd As Long) As Long
  If IsBadCodePtr(zMap_hWnd(lng_hWnd)) = 0 Then                             'Ensure that the thunk hasn't already released its memory
    sc_lParamUser = zData(IDX_PARM_USER)                                    'Get the lParamUser callback parameter
  End If
End Property

'Let the subclasser lParamUser callback parameter
Private Property Let sc_lParamUser(ByVal lng_hWnd As Long, ByVal newValue As Long)
  If IsBadCodePtr(zMap_hWnd(lng_hWnd)) = 0 Then                             'Ensure that the thunk hasn't already released its memory
    zData(IDX_PARM_USER) = newValue                                         'Set the lParamUser callback parameter
  End If
End Property

'-The following routines are exclusively for the sc_ subclass routines----------------------------

'Add the message to the specified table of the window handle
Private Sub zAddMsg(ByVal uMsg As Long, ByVal nTable As Long)
  Dim nCount As Long                                                        'Table entry count
  Dim nBase  As Long                                                        'Remember z_ScMem
  Dim i      As Long                                                        'Loop index

  nBase = z_ScMem                                                            'Remember z_ScMem so that we can restore its value on exit
  z_ScMem = zData(nTable)                                                    'Map zData() to the specified table

  If uMsg = ALL_MESSAGES Then                                               'If ALL_MESSAGES are being added to the table...
    nCount = ALL_MESSAGES                                                   'Set the table entry count to ALL_MESSAGES
  Else
    nCount = zData(0)                                                       'Get the current table entry count
    If nCount >= MSG_ENTRIES Then                                           'Check for message table overflow
      zError "zAddMsg", "Message table overflow. Either increase the value of Const MSG_ENTRIES or use ALL_MESSAGES instead of specific message values"
      GoTo Bail
    End If

    For i = 1 To nCount                                                     'Loop through the table entries
      If zData(i) = 0 Then                                                  'If the element is free...
        zData(i) = uMsg                                                     'Use this element
        GoTo Bail                                                           'Bail
      ElseIf zData(i) = uMsg Then                                           'If the message is already in the table...
        GoTo Bail                                                           'Bail
      End If
    Next i                                                                  'Next message table entry

    nCount = i                                                              'On drop through: i = nCount + 1, the new table entry count
    zData(nCount) = uMsg                                                    'Store the message in the appended table entry
  End If

  zData(0) = nCount                                                         'Store the new table entry count
Bail:
  z_ScMem = nBase                                                           'Restore the value of z_ScMem
End Sub

'Delete the message from the specified table of the window handle
Private Sub zDelMsg(ByVal uMsg As Long, ByVal nTable As Long)
  Dim nCount As Long                                                        'Table entry count
  Dim nBase  As Long                                                        'Remember z_ScMem
  Dim i      As Long                                                        'Loop index

  nBase = z_ScMem                                                           'Remember z_ScMem so that we can restore its value on exit
  z_ScMem = zData(nTable)                                                   'Map zData() to the specified table

  If uMsg = ALL_MESSAGES Then                                               'If ALL_MESSAGES are being deleted from the table...
    zData(0) = 0                                                            'Zero the table entry count
  Else
    nCount = zData(0)                                                       'Get the table entry count
    
    For i = 1 To nCount                                                     'Loop through the table entries
      If zData(i) = uMsg Then                                               'If the message is found...
        zData(i) = 0                                                        'Null the msg value -- also frees the element for re-use
        GoTo Bail                                                           'Bail
      End If
    Next i                                                                  'Next message table entry
    
    zError "zDelMsg", "Message &H" & Hex$(uMsg) & " not found in table"
  End If
  
Bail:
  z_ScMem = nBase                                                           'Restore the value of z_ScMem
End Sub

'Error handler
Private Sub zError(ByVal sRoutine As String, ByVal sMsg As String)
  App.LogEvent TypeName(Me) & "." & sRoutine & ": " & sMsg, vbLogEventTypeError
  MsgBox sMsg & ".", vbExclamation + vbApplicationModal, "Error in " & TypeName(Me) & "." & sRoutine
End Sub

'Return the address of the specified DLL/procedure
Private Function zFnAddr(ByVal sDLL As String, ByVal sProc As String) As Long
  zFnAddr = GetProcAddress(GetModuleHandleA(sDLL), sProc)                   'Get the specified procedure address
  Debug.Assert zFnAddr                                                      'In the IDE, validate that the procedure address was located
End Function

'Map zData() to the thunk address for the specified window handle
Private Function zMap_hWnd(ByVal lng_hWnd As Long) As Long
  If z_Funk Is Nothing Then                                                 'Ensure that subclassing has been started
    zError "zMap_hWnd", "Subclassing hasn't been started"
  Else
    On Error GoTo Catch                                                     'Catch unsubclassed window handles
    z_ScMem = z_Funk("h" & lng_hWnd)                                        'Get the thunk address
    zMap_hWnd = z_ScMem
  End If
  
  Exit Function                                                             'Exit returning the thunk address

Catch:
  zError "zMap_hWnd", "Window handle isn't subclassed"
End Function

'Return the address of the specified ordinal method on the oCallback object, 1 = last private method, 2 = second last private method, etc
Private Function zAddressOf(ByVal oCallback As Object, ByVal nOrdinal As Long) As Long
  Dim bSub  As Byte                                                         'Value we expect to find pointed at by a vTable method entry
  Dim bVal  As Byte
  Dim nAddr As Long                                                         'Address of the vTable
  Dim i     As Long                                                         'Loop index
  Dim J     As Long                                                         'Loop limit
  
  RtlMoveMemory VarPtr(nAddr), ObjPtr(oCallback), 4                         'Get the address of the callback object's instance
  If Not zProbe(nAddr + &H1C, i, bSub) Then                                 'Probe for a Class method
    If Not zProbe(nAddr + &H6F8, i, bSub) Then                              'Probe for a Form method
      If Not zProbe(nAddr + &H7A4, i, bSub) Then                            'Probe for a UserControl method
        Exit Function                                                       'Bail...
      End If
    End If
  End If
  
  i = i + 4                                                                 'Bump to the next entry
  J = i + 1024                                                              'Set a reasonable limit, scan 256 vTable entries
  Do While i < J
    RtlMoveMemory VarPtr(nAddr), i, 4                                       'Get the address stored in this vTable entry
    
    If IsBadCodePtr(nAddr) Then                                             'Is the entry an invalid code address?
      RtlMoveMemory VarPtr(zAddressOf), i - (nOrdinal * 4), 4               'Return the specified vTable entry address
      Exit Do                                                               'Bad method signature, quit loop
    End If

    RtlMoveMemory VarPtr(bVal), nAddr, 1                                    'Get the byte pointed to by the vTable entry
    If bVal <> bSub Then                                                    'If the byte doesn't match the expected value...
      RtlMoveMemory VarPtr(zAddressOf), i - (nOrdinal * 4), 4               'Return the specified vTable entry address
      Exit Do                                                               'Bad method signature, quit loop
    End If
    
    i = i + 4                                                             'Next vTable entry
  Loop
End Function

'Probe at the specified start address for a method signature
Private Function zProbe(ByVal nStart As Long, ByRef nMethod As Long, ByRef bSub As Byte) As Boolean
  Dim bVal    As Byte
  Dim nAddr   As Long
  Dim nLimit  As Long
  Dim nEntry  As Long
  
  nAddr = nStart                                                            'Start address
  nLimit = nAddr + 32                                                       'Probe eight entries
  Do While nAddr < nLimit                                                   'While we've not reached our probe depth
    RtlMoveMemory VarPtr(nEntry), nAddr, 4                                  'Get the vTable entry
    
    If nEntry <> 0 Then                                                     'If not an implemented interface
      RtlMoveMemory VarPtr(bVal), nEntry, 1                                 'Get the value pointed at by the vTable entry
      If bVal = &H33 Or bVal = &HE9 Then                                    'Check for a native or pcode method signature
        nMethod = nAddr                                                     'Store the vTable entry
        bSub = bVal                                                         'Store the found method signature
        zProbe = True                                                       'Indicate success
        Exit Function                                                       'Return
      End If
    End If
    
    nAddr = nAddr + 4                                                       'Next vTable entry
  Loop
End Function

Private Property Get zData(ByVal nIndex As Long) As Long
  RtlMoveMemory VarPtr(zData), z_ScMem + (nIndex * 4), 4
End Property

Private Property Let zData(ByVal nIndex As Long, ByVal nValue As Long)
  RtlMoveMemory z_ScMem + (nIndex * 4), VarPtr(nValue), 4
End Property

'-Subclass callback, usually ordinal #1, the last method in this source file----------------------
Private Sub zWndProc1(ByVal bBefore As Boolean, _
                      ByRef bHandled As Boolean, _
                      ByRef lReturn As Long, _
                      ByVal lng_hWnd As Long, _
                      ByVal uMsg As Long, _
                      ByVal wParam As Long, _
                      ByVal lParam As Long, _
                      ByRef lParamUser As Long)
'*************************************************************************************************
'* bBefore    - Indicates whether the callback is before or after the original WndProc. Usually
'*              you will know unless the callback for the uMsg value is specified as
'*              MSG_BEFORE_AFTER (both before and after the original WndProc).
'* bHandled   - In a before original WndProc callback, setting bHandled to True will prevent the
'*              message being passed to the original WndProc and (if set to do so) the after
'*              original WndProc callback.
'* lReturn    - WndProc return value. Set as per the MSDN documentation for the message value,
'*              and/or, in an after the original WndProc callback, act on the return value as set
'*              by the original WndProc.
'* lng_hWnd   - Window handle.
'* uMsg       - Message value.
'* wParam     - Message related data.
'* lParam     - Message related data.
'* lParamUser - User-defined callback parameter
'*************************************************************************************************
Dim X As Long, Y As Long
  Select Case uMsg
    Case WM_PAINT
        Init_Style
    Case WM_MOUSEMOVE
        If wParam <> MK_LBUTTON And Not IsHover Then
            X = LoWord(lParam)
            Y = HiWord(lParam)
            If X > 0 And X < ScaleWidth And Y > 0 And Y < ScaleHeight Then
                IsHover = True
                TrackMouseLeave lng_hWnd
                RaiseEvent MouseEnter
                DrawButton (eHover)
            End If
        End If
  Case WM_MOUSELEAVE
        IsHover = False
        RaiseEvent MouseLeave
        If Not m_Checked Then If m_hasFocus Then DrawButton (eFocus) Else DrawButton (eNormal)
  End Select
End Sub
