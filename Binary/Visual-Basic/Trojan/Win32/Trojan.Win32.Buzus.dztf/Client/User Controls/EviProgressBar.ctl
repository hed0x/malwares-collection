VERSION 5.00
Begin VB.UserControl EviProgressBar 
   ClientHeight    =   1215
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   2535
   PropertyPages   =   "EviProgressBar.ctx":0000
   ScaleHeight     =   1215
   ScaleWidth      =   2535
   ToolboxBitmap   =   "EviProgressBar.ctx":001D
End
Attribute VB_Name = "EviProgressBar"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "PropPageWizardRun" ,"Yes"
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'                       Evi Collection Control XP                      '
'                          By Evi Indra Effendi                        '
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Option Explicit

Private Declare Function BitBlt Lib "gdi32" (ByVal hDestDC As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal dwRop As Long) As Long
Private Declare Function CreateCompatibleBitmap Lib "gdi32" (ByVal hdc As Long, ByVal nWidth As Long, ByVal nHeight As Long) As Long
Private Declare Function CreateCompatibleDC Lib "gdi32" (ByVal hdc As Long) As Long
Private Declare Function CreatePatternBrush Lib "gdi32" (ByVal hBitmap As Long) As Long
Private Declare Function CreateHatchBrush Lib "gdi32" (ByVal fnStyle As Integer, ByVal COLORREF As Long) As Long
Private Declare Function CreateDC Lib "gdi32" Alias "CreateDCA" (ByVal lpDriverName As String, ByVal lpDeviceName As String, ByVal lpOutput As String, lpInitData As Any) As Long
Private Declare Function CreateSolidBrush Lib "gdi32" (ByVal crColor As Long) As Long
Private Declare Function CreatePen Lib "gdi32" (ByVal nPenStyle As Long, ByVal nWidth As Long, ByVal crColor As Long) As Long
Private Declare Function SelectObject Lib "gdi32" (ByVal hdc As Long, ByVal hObject As Long) As Long
Private Declare Function DeleteObject Lib "gdi32" (ByVal hObject As Long) As Long
Private Declare Function DeleteDC Lib "gdi32" (ByVal hdc As Long) As Long
Private Declare Function DrawText Lib "user32" Alias "DrawTextA" (ByVal hdc As Long, ByVal lpStr As String, ByVal nCount As Long, lpRect As RECT, ByVal wFormat As Long) As Long
Private Declare Function DrawEdge Lib "user32" (ByVal hdc As Long, qrc As RECT, ByVal edge As Long, ByVal grfFlags As Long) As Long
Private Declare Function FillRect Lib "user32" (ByVal hdc As Long, lpRect As RECT, ByVal hBrush As Long) As Long
Private Declare Function FrameRect Lib "user32" (ByVal hdc As Long, lpRect As RECT, ByVal hBrush As Long) As Long
Private Declare Function GetClientRect Lib "user32" (ByVal hWnd As Long, lpRect As RECT) As Long
Private Declare Function GetSysColor Lib "user32" (ByVal nIndex As Long) As Long
Private Declare Function LineTo Lib "gdi32" (ByVal hdc As Long, ByVal X As Long, ByVal Y As Long) As Long
Private Declare Function MoveToEx Lib "gdi32" (ByVal hdc As Long, ByVal X As Long, ByVal Y As Long, lpPoint As POINTAPI) As Long
Private Declare Function PatBlt Lib "gdi32" (ByVal hdc As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal dwRop As Long) As Long
Private Declare Function SetPixelV Lib "gdi32" (ByVal hdc As Long, ByVal X As Long, ByVal Y As Long, ByVal crColor As Long) As Long
Private Declare Function SetTextColor Lib "gdi32" (ByVal hdc As Long, ByVal crColor As Long) As Long
Private Declare Function SetBkColor Lib "gdi32" (ByVal hdc As Long, ByVal crColor As Long) As Long
Private Declare Function SetBkMode Lib "gdi32" (ByVal hdc As Long, ByVal nBkMode As Long) As Long

Enum StyleENum
    eviStandardProgressBar = 0
    eviSmoothProgressBar = 1
    eviSearchProgressBar = 2
    eviOfficeXPProgressBar = 3
    eviPastelProgressBar = 4
    eviJavaProgressBar = 5
    eviMediaPlayerProgressBar = 6
    eviCustomBrushProgressBar = 7
    eviPictureProgressBar = 8
    eviMetallicProgressBar = 9
End Enum
Private Type RECT
    Left      As Long
    Top       As Long
    Right     As Long
    Bottom    As Long
End Type
Private Type POINTAPI
    X As Long
    Y As Long
End Type

Const DT_SINGLELINE   As Long = &H20
Const DT_CALCRECT     As Long = &H400
Const BF_BOTTOM = &H8
Const BF_LEFT = &H1
Const BF_RIGHT = &H4
Const BF_TOP = &H2
Const BF_RECT = (BF_LEFT Or BF_TOP Or BF_RIGHT Or BF_BOTTOM)
Enum BrushStyle
 HS_HORIZONTAL = 0
 HS_VERTICAL = 1
 HS_FDIAGONAL = 2
 HS_BDIAGONAL = 3
 HS_CROSS = 4
 HS_DIAGCROSS = 5
 HS_SOLID = 6
End Enum
Enum PositionEnum
    eviHorizontalPosition = 0
    eviVerticalPosition = 1
End Enum
Private m_Color       As OLE_COLOR
Private m_Color2      As OLE_COLOR
Private m_hDC         As Long
Private m_hWnd        As Long
Private m_Max         As Long
Private m_Min         As Long
Private m_Value       As Long
Private m_Value2      As Long
Private m_MetalValue As Boolean
Private m_ShowText    As Boolean
Private m_Scrolling   As StyleENum
Private m_Orientation As PositionEnum
Private m_Brush       As BrushStyle
Private m_Picture     As StdPicture
Private m_MemDC    As Boolean
Private m_ThDC     As Long
Private m_hBmp     As Long
Private m_hBmpOld  As Long
Private iFnt       As IFont
Private m_fnt      As IFont
Private hFntOld    As Long
Private m_lWidth   As Long
Private m_lHeight  As Long
Private fPercent   As Double
Private TR         As RECT
Private TBR        As RECT
Private TSR        As RECT
Private AT         As RECT
Private lSegmentWidth   As Long
Private lSegmentSpacing As Long

Public Sub DrawingControlProgressBar()
On Error GoTo Error
    If m_Value > 100 Then m_Value = 100
    GetClientRect m_hWnd, TR
    DrawFillRectangle TR, IIf(m_Scrolling = 6, &H0, vbWhite), m_hDC
    If m_Scrolling = 9 Then
        DrawMetalProgressbar
    ElseIf m_Scrolling = 3 Then
        DrawOfficeXPProgressbar
    ElseIf m_Scrolling = 4 Then
        DrawPastelProgressbar
    ElseIf m_Scrolling = 5 Then
        DrawJavTProgressbar
    ElseIf m_Scrolling = 6 Then
        DrawMediaProgressbar
    ElseIf m_Scrolling = 7 Then
        DrawCustomBrushProgressbar
    ElseIf m_Scrolling = 8 Then
        DrawPictureProgressbar
    Else
        CalcBarSize
        PBarDraw
        If m_Scrolling = 0 Then DrawDivisions
        pDrawBorder
    End If
    DrawTexto
    If m_MemDC Then
        With UserControl
            pDraw .hdc, 0, 0, .ScaleWidth, .ScaleHeight, .ScaleLeft, .ScaleTop
        End With
    End If
Error:
End Sub

Private Sub DrawOfficeXPProgressbar()
On Error GoTo Error
    DrawRectangle TR, ShiftColorXP(m_Color, 100), m_hDC
    With TBR
        .Left = 1
        .Top = 1
        .Bottom = TR.Bottom - 1
        .Right = TR.Left + (TR.Right - TR.Left) * (m_Value / 100)
    End With
    DrawFillRectangle TBR, ShiftColorXP(m_Color, 180), m_hDC
Error:
End Sub

Private Sub DrawJavTProgressbar()
On Error GoTo Error
    DrawRectangle TR, ShiftColorXP(m_Color, 10), m_hDC
    TBR.Right = TR.Left + (TR.Right - TR.Left) * (m_Value / 101)
    DrawGradient m_Color, ShiftColorXP(m_Color, 100), 2, 2, TR.Right - 2, TR.Bottom - 5, m_hDC ', True
    DrawGradient ShiftColorXP(m_Color, 250), m_Color, 3, 3, TBR.Right, TR.Bottom - 6, m_hDC  ', True
    DrawLine TBR.Right, 2, TBR.Right, TR.Bottom - 2, m_hDC, ShiftColorXP(m_Color, 25)
Error:
End Sub

Private Sub DrawPictureProgressbar()
    Dim Brush      As Long
    Dim origBrush  As Long
    On Error GoTo Error
    DrawEdge m_hDC, TR, 2, BF_RECT
    If Nothing Is m_Picture Then Exit Sub
    Brush = CreatePatternBrush(m_Picture.Handle)
    origBrush = SelectObject(m_hDC, Brush)
    TBR.Right = TR.Left + (TR.Right - TR.Left) * (m_Value / 101)
    PatBlt m_hDC, 2, 2, TBR.Right, TR.Bottom - 4, vbPatCopy
    SelectObject m_hDC, origBrush
    DeleteObject Brush
Error:
End Sub

Private Sub DrawPastelProgressbar()
    DrawEdge m_hDC, TR, 6, BF_RECT
    DrawGradient ShiftColorXP(m_Color, 140), ShiftColorXP(m_Color, 200), 2, 2, TR.Left + (TR.Right - TR.Left - 4) * (m_Value / 100), TR.Bottom - 3, m_hDC, True
End Sub

Private Sub DrawMetalProgressbar()
    TBR.Right = TR.Left + (TR.Right - TR.Left - 4) * (m_Value / 100)
    DrawGradient vbWhite, &HC0C0C0, 2, 2, TR.Right - 3, (TR.Bottom - 3) / 2, m_hDC
    DrawGradient BlendColor(&HC0C0C0, &H0, 255), &HC0C0C0, 2, (TR.Bottom - 3) / 2, TR.Right - 3, (TR.Bottom - 3) / 2, m_hDC
    If m_MetalValue = True Then
        TBR.Right = TR.Left + (TR.Right - TR.Left - 4) * (m_Value2 / 100)
        DrawGradient ShiftColorXP(m_Color2, 170), m_Color2, 2, (TR.Bottom - 3) / 2 + 2, TBR.Right, (TR.Bottom - 3) / 2 + 2, m_hDC
        TBR.Right = TR.Left + (TR.Right - TR.Left - 4) * (m_Value / 100)
        DrawGradient ShiftColorXP(m_Color, 150), BlendColor(m_Color, &H0, 200), 2, 2, TBR.Right, (TR.Bottom - 3) / 2 - 1, m_hDC
    Else
        DrawGradient ShiftColorXP(m_Color, 150), BlendColor(m_Color, &H0, 180), 2, 2, TBR.Right, (TR.Bottom - 3) / 2, m_hDC
        DrawGradient BlendColor(m_Color, &H0, 190), m_Color, 2, (TR.Bottom - 3) / 2, TBR.Right, (TR.Bottom - 3) / 2, m_hDC
    End If
    TR.Left = TR.Left + 3
    pDrawBorder
End Sub

Private Sub DrawCustomBrushProgressbar()
    Dim hBrush As Long
    DrawEdge m_hDC, TR, 9, BF_RECT
    With TBR
        .Left = 2
        .Top = 2
        .Bottom = TR.Bottom - 2
        .Right = TR.Left + (TR.Right - TR.Left) * (m_Value / 101)
    End With
    hBrush = CreateHatchBrush(m_Brush, GetLngColor(Color))
    SetBkColor m_hDC, ShiftColorXP(m_Color, 140)
    FillRect m_hDC, TBR, hBrush
    DeleteObject hBrush
End Sub

Private Sub DrawMediaProgressbar()
    DrawRectangle TR, BlendColor(m_Color, &H0, 200), m_hDC
    DrawGradient &H0&, ShiftColorXP(GetLngColor(BlendColor(m_Color, &H0, 100)), 10), 2, 2, TR.Left + (TR.Right - TR.Left - 5) * (m_Value / 100), TR.Bottom - 2, m_hDC, True
End Sub

Private Sub CalcBarSize()
    lSegmentWidth = IIf(m_Scrolling = 0, 6, 0)
    lSegmentSpacing = 2
    TR.Left = TR.Left + 3
    LSet TBR = TR
    fPercent = m_Value / 98
    If fPercent < 0# Then fPercent = 0#
    If m_Orientation = 0 Then
        TBR.Right = TR.Left + (TR.Right - TR.Left) * fPercent
        TBR.Right = TBR.Right - ((TBR.Right - TBR.Left) Mod (lSegmentWidth + lSegmentSpacing))
        If TBR.Right < TR.Left Then
            TBR.Right = TR.Left
        End If
    Else
        fPercent = 1# - fPercent
        TBR.Top = TR.Top + (TR.Bottom - TR.Top) * fPercent
        TBR.Top = TBR.Top - ((TBR.Top - TBR.Bottom) Mod (lSegmentWidth + lSegmentSpacing))
        If TBR.Top > TR.Bottom Then TBR.Top = TR.Bottom
    End If
End Sub

Private Sub DrawDivisions()
    Dim I As Long
    Dim hBR As Long
    hBR = CreateSolidBrush(vbWhite)
    LSet TSR = TR
    If m_Orientation = 0 Then
        For I = TBR.Left + lSegmentWidth To TBR.Right Step lSegmentWidth + lSegmentSpacing
            TSR.Left = I + 1
            TSR.Right = I + 1 + lSegmentSpacing
            FillRect m_hDC, TSR, hBR
        Next I
    Else
        For I = TBR.Bottom To TBR.Top + lSegmentWidth Step -(lSegmentWidth + lSegmentSpacing)
            TSR.Top = I - 2
            TSR.Bottom = I - 2 + lSegmentSpacing
            FillRect m_hDC, TSR, hBR
        Next I
    End If
    DeleteObject hBR
End Sub

Private Sub pDrawBorder()
    Dim RTemp As RECT
    TR.Left = TR.Left - 3
    Let RTemp = TR
    DrawLine 2, 1, TR.Right - 2, 1, m_hDC, &HBEBEBE
    DrawLine 2, TR.Bottom - 2, TR.Right - 2, TR.Bottom - 2, m_hDC, &HEFEFEF
    DrawLine 1, 2, 1, TR.Bottom - 2, m_hDC, &HBEBEBE
    DrawLine 2, 2, 2, TR.Bottom - 2, m_hDC, &HEFEFEF
    DrawLine 2, 2, TR.Right - 2, 2, m_hDC, &HEFEFEF
    DrawLine TR.Right - 2, 2, TR.Right - 2, TR.Bottom - 2, m_hDC, &HEFEFEF
    DrawRectangle TR, GetLngColor(&H686868), m_hDC
    Call SetPixelV(m_hDC, 0, 0, GetLngColor(vbWhite))
    Call SetPixelV(m_hDC, 0, 1, GetLngColor(&HA6ABAC))
    Call SetPixelV(m_hDC, 0, 2, GetLngColor(&H7D7E7F))
    Call SetPixelV(m_hDC, 1, 0, GetLngColor(&HA7ABAC))
    Call SetPixelV(m_hDC, 1, 1, GetLngColor(&H777777))
    Call SetPixelV(m_hDC, 2, 0, GetLngColor(&H7D7E7F))
    Call SetPixelV(m_hDC, 2, 2, GetLngColor(&HBEBEBE))
    Call SetPixelV(m_hDC, 0, TR.Bottom - 1, GetLngColor(vbWhite))
    Call SetPixelV(m_hDC, 1, TR.Bottom - 1, GetLngColor(&HA6ABAC))
    Call SetPixelV(m_hDC, 2, TR.Bottom - 1, GetLngColor(&H7D7E7F))
    Call SetPixelV(m_hDC, 0, TR.Bottom - 3, GetLngColor(&H7D7E7F))
    Call SetPixelV(m_hDC, 0, TR.Bottom - 2, GetLngColor(&HA7ABAC))
    Call SetPixelV(m_hDC, 1, TR.Bottom - 2, GetLngColor(&H777777))
    Call SetPixelV(m_hDC, TR.Right - 1, 0, GetLngColor(vbWhite))
    Call SetPixelV(m_hDC, TR.Right - 1, 1, GetLngColor(&HBEBEBE))
    Call SetPixelV(m_hDC, TR.Right - 1, 2, GetLngColor(&H7D7E7F))
    Call SetPixelV(m_hDC, TR.Right - 2, 2, GetLngColor(&HBEBEBE))
    Call SetPixelV(m_hDC, TR.Right - 2, 1, GetLngColor(&H686868))
    Call SetPixelV(m_hDC, TR.Right - 1, TR.Bottom - 1, GetLngColor(vbWhite))
    Call SetPixelV(m_hDC, TR.Right - 1, TR.Bottom - 2, GetLngColor(&HBEBEBE))
    Call SetPixelV(m_hDC, TR.Right - 1, TR.Bottom - 3, GetLngColor(&H7D7E7F))
    Call SetPixelV(m_hDC, TR.Right - 2, TR.Bottom - 2, GetLngColor(&H777777))
    Call SetPixelV(m_hDC, TR.Right - 2, TR.Bottom - 1, GetLngColor(&HBEBEBE))
    Call SetPixelV(m_hDC, TR.Right - 3, TR.Bottom - 1, GetLngColor(&H7D7E7F))
End Sub

Private Sub PBarDraw()
    Dim TempRect As RECT
    Dim ITemp    As Long
    If m_Orientation = 0 Then
        If TBR.Right <= 14 Then TBR.Right = 12
        TempRect.Left = 4
        TempRect.Right = IIf(TBR.Right + 4 > TR.Right, TBR.Right - 4, TBR.Right)
        TempRect.Top = 8
        TempRect.Bottom = TR.Bottom - 8
        If m_Scrolling = 2 Then
            GoSub HorizontalSearch
        Else
            DrawGradient ShiftColorXP(m_Color, 150), m_Color, 4, 3, TempRect.Right, 6, m_hDC
            DrawFillRectangle TempRect, m_Color, m_hDC
            DrawGradient m_Color, ShiftColorXP(m_Color, 150), 4, TempRect.Bottom - 2, TempRect.Right, 6, m_hDC
        End If
    Else
        TempRect.Left = 9
        TempRect.Right = TR.Right - 8
        TempRect.Top = TBR.Top
        TempRect.Bottom = TR.Bottom
        If m_Scrolling = 2 Then
            GoSub VerticalSearch
        Else
            DrawGradient ShiftColorXP(m_Color, 150), m_Color, 4, TBR.Top, 4, TR.Bottom, m_hDC, True
            DrawFillRectangle TempRect, m_Color, m_hDC
            DrawGradient m_Color, ShiftColorXP(m_Color, 150), TR.Right - 8, TBR.Top, 4, TR.Bottom, m_hDC, True
        End If
    End If
    Exit Sub
HorizontalSearch:
    For ITemp = 0 To 2
        With TempRect
            .Left = TBR.Right + ((lSegmentSpacing + 10) * (ITemp)) - (45 * ((100 - m_Value) / 100))
            .Right = .Left + 10
            .Top = 8
            .Bottom = TR.Bottom - 8
            DrawGradient ShiftColorXP(m_Color, 220 - (40 * ITemp)), ShiftColorXP(m_Color, 200 - (40 * ITemp)), .Left, 3, 9, TR.Bottom - 2, m_hDC, True
        End With
    Next ITemp
    Return
VerticalSearch:
    For ITemp = 0 To 2
        With TempRect
            .Left = 8
            .Right = TR.Right - 8
            .Top = TBR.Top + ((lSegmentSpacing + 10) * ITemp)
            .Bottom = .Top + 10
            DrawGradient ShiftColorXP(m_Color, 220 - (40 * ITemp)), ShiftColorXP(m_Color, 200 - (40 * ITemp)), TR.Right - 2, .Top, 2, 9, m_hDC
        End With
    Next ITemp
    Return
End Sub

Private Function DrawTexto()
    Dim ThisText As String
    Dim isAlpha  As Boolean
    If (m_Scrolling = 6 Or m_Scrolling = 9) Then isAlpha = True
    If m_Scrolling = 2 Then
        ThisText = "Searching.."
    Else
        ThisText = Round(m_Value) & " %"
    End If
    If (m_ShowText) Then
        Set iFnt = Font
        hFntOld = SelectObject(m_hDC, iFnt.hFont)
        SetBkMode m_hDC, 1
        SetTextColor m_hDC, GetLngColor(IIf(m_Scrolling = 6, &HC0C0C0, vbBlack))
        CalculateAlphaTextRect ThisText
        If ((TR.Right * (m_Value / 100)) <= AT.Right) Or Not isAlpha Then
            DrawText m_hDC, ThisText, Len(ThisText), AT, DT_SINGLELINE
        End If
        SelectObject m_hDC, hFntOld
        If isAlpha Then DrawAlphaText ThisText
    End If
End Function

Private Sub CalculateAlphaTextRect(ByVal ThisText As String)
    DrawText m_hDC, ThisText, Len(ThisText), AT, DT_CALCRECT
    AT.Left = (TR.Right / 2) - ((AT.Right - AT.Left) / 2)
    AT.Top = (TR.Bottom / 2) - ((AT.Bottom - AT.Top) / 2)
End Sub

Private Sub DrawAlphaText(ByVal ThisText As String)
    Set iFnt = Font
    hFntOld = SelectObject(m_hDC, iFnt.hFont)
    SetBkMode m_hDC, 1
    If (TR.Right * (m_Value / 100)) >= AT.Left Then
        SetTextColor m_hDC, GetLngColor(IIf(m_Scrolling = 6, ShiftColorXP(m_Color, 80), vbWhite))
        AT.Left = (TR.Right / 2) - ((AT.Right - AT.Left) / 2)
        AT.Right = (TR.Right * (m_Value / 100))
        DrawText m_hDC, ThisText, Len(ThisText), AT, DT_SINGLELINE
    End If
    SelectObject m_hDC, hFntOld
End Sub

Private Function GetLngColor(Color As Long) As Long
    If (Color And &H80000000) Then
        GetLngColor = GetSysColor(Color And &H7FFFFFFF)
    Else
        GetLngColor = Color
    End If
End Function

Private Sub DrawRectangle(ByRef bRect As RECT, ByVal Color As Long, ByVal hdc As Long)
    Dim hBrush As Long
    hBrush = CreateSolidBrush(Color)
    FrameRect hdc, bRect, hBrush
    DeleteObject hBrush
End Sub

Public Sub DrawLine( _
           ByVal X As Long, _
           ByVal Y As Long, _
           ByVal Width As Long, _
           ByVal Height As Long, _
           ByVal cHdc As Long, _
           ByVal Color As Long)
    Dim Pen1    As Long
    Dim Pen2    As Long
    Dim POS     As POINTAPI
    Pen1 = CreatePen(0, 1, GetLngColor(Color))
    Pen2 = SelectObject(cHdc, Pen1)
    MoveToEx cHdc, X, Y, POS
    LineTo cHdc, Width, Height
    SelectObject cHdc, Pen2
    DeleteObject Pen2
    DeleteObject Pen1
End Sub

Private Function ShiftColorXP(ByVal MyColor As Long, ByVal Base As Long) As Long
    Dim R As Long, G As Long, b As Long, Delta As Long
    R = (MyColor And &HFF)
    G = ((MyColor \ &H100) Mod &H100)
    b = ((MyColor \ &H10000) Mod &H100)
    Delta = &HFF - Base
    b = Base + b * Delta \ &HFF
    G = Base + G * Delta \ &HFF
    R = Base + R * Delta \ &HFF
    If R > 255 Then R = 255
    If G > 255 Then G = 255
    If b > 255 Then b = 255
    ShiftColorXP = R + 256& * G + 65536 * b
End Function

Public Sub DrawGradient(lEndColor As Long, lStartcolor As Long, ByVal X As Long, ByVal Y As Long, ByVal X2 As Long, ByVal Y2 As Long, ByVal hdc As Long, Optional bH As Boolean)
    On Error Resume Next
    Dim sR As Single, sG As Single, sB As Single
    Dim eR As Single, eG As Single, eB As Single
    Dim ni As Long
    lEndColor = GetLngColor(lEndColor)
    lStartcolor = GetLngColor(lStartcolor)
    sR = (lStartcolor And &HFF)
    sG = (lStartcolor \ &H100) And &HFF
    sB = (lStartcolor And &HFF0000) / &H10000
    eR = (lEndColor And &HFF)
    eG = (lEndColor \ &H100) And &HFF
    eB = (lEndColor And &HFF0000) / &H10000
    sR = (sR - eR) / IIf(bH, X2, Y2)
    sG = (sG - eG) / IIf(bH, X2, Y2)
    sB = (sB - eB) / IIf(bH, X2, Y2)
    For ni = 0 To IIf(bH, X2, Y2)
        If bH Then
            DrawLine X + ni, Y, X + ni, Y2, hdc, RGB(eR + (ni * sR), eG + (ni * sG), eB + (ni * sB))
        Else
            DrawLine X, Y + ni, X2, Y + ni, hdc, RGB(eR + (ni * sR), eG + (ni * sG), eB + (ni * sB))
        End If
    Next ni
End Sub

Private Function BlendColor(ByVal oColorFrom As OLE_COLOR, ByVal oColorTo As OLE_COLOR, Optional ByVal Alpha As Long = 128) As Long
    Dim lCFrom As Long
    Dim lCTo As Long
    Dim lSrcR As Long
    Dim lSrcG As Long
    Dim lSrcB As Long
    Dim lDstR As Long
    Dim lDstG As Long
    Dim lDstB As Long
    lCFrom = GetLngColor(oColorFrom)
    lCTo = GetLngColor(oColorTo)
    lSrcR = lCFrom And &HFF
    lSrcG = (lCFrom And &HFF00&) \ &H100&
    lSrcB = (lCFrom And &HFF0000) \ &H10000
    lDstR = lCTo And &HFF
    lDstG = (lCTo And &HFF00&) \ &H100&
    lDstB = (lCTo And &HFF0000) \ &H10000
    BlendColor = RGB( _
        ((lSrcR * Alpha) / 255) + ((lDstR * (255 - Alpha)) / 255), _
        ((lSrcG * Alpha) / 255) + ((lDstG * (255 - Alpha)) / 255), _
        ((lSrcB * Alpha) / 255) + ((lDstB * (255 - Alpha)) / 255) _
        )
End Function

Private Sub DrawFillRectangle(ByRef hRect As RECT, ByVal Color As Long, ByVal MyHdc As Long)
    Dim hBrush As Long
    hBrush = CreateSolidBrush(GetLngColor(Color))
    FillRect MyHdc, hRect, hBrush
    DeleteObject hBrush
End Sub

Private Function ThDC(Width As Long, Height As Long) As Long
    If m_ThDC = 0 Then
        If (Width + Height) > 0 Then pCreate Width, Height
    Else
        If Width > m_lWidth Or Height > m_lHeight Then pCreate Width, Height
    End If
    ThDC = m_ThDC
End Function

Private Sub pCreate(ByVal Width As Long, ByVal Height As Long)
    Dim lhDCC As Long
    pDestroy
    lhDCC = CreateDC("DISPLAY", "", "", ByVal 0&)
    If lhDCC Then
        m_ThDC = CreateCompatibleDC(lhDCC)
        If m_ThDC Then
            m_hBmp = CreateCompatibleBitmap(lhDCC, Width, Height)
            If m_hBmp Then
                m_hBmpOld = SelectObject(m_ThDC, m_hBmp)
                If m_hBmpOld Then
                    m_lWidth = Width
                    m_lHeight = Height
                    DeleteDC lhDCC
                    Exit Sub
                End If
            End If
        End If
        DeleteDC lhDCC
        pDestroy
    End If
End Sub

Public Sub pDraw( _
      ByVal hdc As Long, _
      Optional ByVal xSrc As Long = 0, Optional ByVal ySrc As Long = 0, _
      Optional ByVal WidthSrc As Long = 0, Optional ByVal HeightSrc As Long = 0, _
      Optional ByVal xDst As Long = 0, Optional ByVal yDst As Long = 0 _
   )
    If WidthSrc <= 0 Then WidthSrc = m_lWidth
    If HeightSrc <= 0 Then HeightSrc = m_lHeight
    BitBlt hdc, xDst, yDst, WidthSrc, HeightSrc, m_ThDC, xSrc, ySrc, vbSrcCopy
End Sub

Private Sub pDestroy()
    If m_hBmpOld Then
        SelectObject m_ThDC, m_hBmpOld
        m_hBmpOld = 0
    End If
    If m_hBmp Then
        DeleteObject m_hBmp
        m_hBmp = 0
    End If
    If m_ThDC Then
        DeleteDC m_ThDC
        m_ThDC = 0
    End If
    m_lWidth = 0
    m_lHeight = 0
End Sub

Private Sub UserControl_Initialize()
    Dim fnt As StdFont
    Set fnt = New StdFont
    Set Font = fnt
    With UserControl
        .BackColor = vbWhite
        .ScaleMode = vbPixels
    End With
    hdc = UserControl.hdc
    hWnd = UserControl.hWnd
    m_Max = 100
    m_Min = 0
    m_Value = 0
    m_Orientation = 0
    m_Scrolling = 0
    m_Color = GetLngColor(vbHighlight)
    DrawingControlProgressBar
End Sub

Private Sub UserControl_Paint()
    DrawingControlProgressBar
End Sub

Private Sub UserControl_Resize()
    hdc = UserControl.hdc
End Sub

Private Sub UserControl_Terminate()
    pDestroy
End Sub

Public Property Let BrushStyle(ByVal Style As BrushStyle)
    m_Brush = Style
    PropertyChanged "BrushStyle"
End Property

Public Property Let MetalValue(ByVal NewValue As Boolean)
    m_MetalValue = NewValue
    PropertyChanged "MetalValue"
    DrawingControlProgressBar
End Property

Public Property Get MetalValue() As Boolean
    MetalValue = m_MetalValue
End Property

Public Property Get Color() As OLE_COLOR
    Color = m_Color
End Property

Public Property Let Color(ByVal lColor As OLE_COLOR)
    m_Color = GetLngColor(lColor)
    DrawingControlProgressBar
End Property

Public Property Get Color2() As OLE_COLOR
    Color2 = m_Color2
End Property

Public Property Let Color2(ByVal lColor2 As OLE_COLOR)
    m_Color2 = GetLngColor(lColor2)
    DrawingControlProgressBar
End Property

Public Property Get Font() As IFont
    Set Font = m_fnt
End Property

Public Property Set Font(ByRef fnt As IFont)
    Set m_fnt = fnt
End Property

Public Property Let Font(ByRef fnt As IFont)
    Set m_fnt = fnt
End Property

Public Property Get hWnd() As Long
    hWnd = m_hWnd
End Property

Public Property Let hWnd(ByVal chWnd As Long)
    m_hWnd = chWnd
End Property

Public Property Get hdc() As Long
    hdc = m_hDC
End Property

Public Property Let hdc(ByVal cHdc As Long)
    m_hDC = ThDC(UserControl.ScaleWidth, UserControl.ScaleHeight)
    If m_hDC = 0 Then
        m_hDC = UserControl.hdc
    Else
        m_MemDC = True
    End If
End Property

Public Property Get Image() As StdPicture
    If Nothing Is m_Picture Then Exit Property
    Set Image = m_Picture
End Property

Public Property Set Image(ByVal Handle As StdPicture)
    Set m_Picture = Handle
    PropertyChanged "Image"
    DrawingControlProgressBar
End Property

Public Property Get Min() As Long
    Min = m_Min
End Property

Public Property Let Min(ByVal cMin As Long)
    m_Min = cMin
    PropertyChanged "Min"
End Property

Public Property Get Max() As Long
    Max = m_Max
End Property

Public Property Let Max(ByVal cMax As Long)
    m_Max = cMax
    PropertyChanged "Max"
End Property

Public Property Get Orientation() As PositionEnum
    Orientation = m_Orientation
End Property

Public Property Let Orientation(ByVal PositionEnum As PositionEnum)
    m_Orientation = PositionEnum
    PropertyChanged "Orientation"
    DrawingControlProgressBar
End Property

Public Property Get Style() As StyleENum
    Style = m_Scrolling
End Property

Public Property Let Style(ByVal lScrolling As StyleENum)
    m_Scrolling = lScrolling
    PropertyChanged "Style"
    DrawingControlProgressBar
End Property

Public Property Get ShowText() As Boolean
    ShowText = m_ShowText
End Property

Public Property Let ShowText(ByVal bShowText As Boolean)
    m_ShowText = bShowText
    PropertyChanged "ShowText"
    DrawingControlProgressBar
End Property

Public Property Get Value() As Long
    Value = ((m_Value / 100) * m_Max) / IIf(m_Min > 0, m_Min, 1)
End Property

Public Property Let Value(ByVal cValue As Long)
    m_Value = ((cValue * 100) / m_Max) + m_Min
    DrawingControlProgressBar
End Property

Public Property Get Value2() As Long
    Value2 = ((m_Value2 / 100) * m_Max) / IIf(m_Min > 0, m_Min, 1)
End Property

Public Property Let Value2(ByVal cValue2 As Long)
    m_Value2 = ((cValue2 * 100) / m_Max) + m_Min
    DrawingControlProgressBar
End Property

Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
    Call PropBag.WriteProperty("Font", Font, Font)
    Call PropBag.WriteProperty("BrushStyle", m_Brush, 4)
    Call PropBag.WriteProperty("Color", m_Color, vbHighlight)
    Call PropBag.WriteProperty("Image", m_Picture, Nothing)
    Call PropBag.WriteProperty("Max", m_Max, 100)
    Call PropBag.WriteProperty("Min", m_Min, 0)
    Call PropBag.WriteProperty("Orientation", m_Orientation, 0)
    Call PropBag.WriteProperty("Style", m_Scrolling, 0)
    Call PropBag.WriteProperty("ShowText", m_ShowText, False)
    Call PropBag.WriteProperty("Value", m_Value, 0)
    Call PropBag.WriteProperty("Value2", m_Value2, 0)
    Call PropBag.WriteProperty("Color2", m_Color2, 0)
    Call PropBag.WriteProperty("MetalValue", m_MetalValue, 0)
 End Sub

Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
    Set Font = PropBag.ReadProperty("Font", Font)
    m_Brush = PropBag.ReadProperty("BrushStyle", 4)
    Color = PropBag.ReadProperty("Color", vbHighlight)
    Color2 = PropBag.ReadProperty("Color2", vbHighlight)
    Set m_Picture = PropBag.ReadProperty("Image", Nothing)
    Max = PropBag.ReadProperty("Max", 100)
    Min = PropBag.ReadProperty("Min", 0)
    Orientation = PropBag.ReadProperty("Orientation", 0)
    Style = PropBag.ReadProperty("Style", 0)
    ShowText = PropBag.ReadProperty("ShowText", False)
    Value = PropBag.ReadProperty("Value", 0)
    Value2 = PropBag.ReadProperty("Value2", 0)
    m_MetalValue = PropBag.ReadProperty("MetalValue", 0)
End Sub
