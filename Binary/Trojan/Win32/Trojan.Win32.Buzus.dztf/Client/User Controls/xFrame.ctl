VERSION 5.00
Begin VB.UserControl xFrame 
   ClientHeight    =   495
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   1920
   ControlContainer=   -1  'True
   ScaleHeight     =   495
   ScaleWidth      =   1920
   ToolboxBitmap   =   "xFrame.ctx":0000
End
Attribute VB_Name = "xFrame"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
    '****************************************************************
    ' Project:      Creates an Ownerdrawn Frame control
    ' Programmer:   Alexander Mungall
    ' UserControl:  xFrame
    ' Email:        goober_mpc@hotmail.com
    '----------------------------------------------------------------
    ' xFrame Copyright© Alexander Mungall, All Rights Reserved
    ' Feel free to use this code for personal use in anyway you see
    ' fit, but please give credit where credit is due...
    ' It's all I ask.
    '****************************************************************
    Option Explicit
    
    ' Booleans
    Private bDisplayPicture As Boolean
    Private bEnableGradient As Boolean
    Private bExpanded As Boolean
    Private bFontBold As Boolean
    Private bFontItalic As Boolean
    Private bFontStrikeThru As Boolean
    Private bFontUnderline As Boolean
    Private bFrameButton As Boolean
    Private bFrameButtonPin As Boolean
    Private bPaintHeader As Boolean
    Private bPinned As Boolean
    Private bMouseOver As Boolean
    Private bMouseOverButtonPin As Boolean
    Private bVerifyEnabledGradient As Boolean
    
    ' Controls
    Private imgFramePic As Image
    Private WithEvents picHeader As PictureBox
Attribute picHeader.VB_VarHelpID = -1
    Private WithEvents tmrMouseMove As Timer
Attribute tmrMouseMove.VB_VarHelpID = -1
    
    ' Doubles
    Private dFontSize As Double
    
    ' Enums
    Public Enum xFrameStyles
        xpDefault = 0
        xpBlue = 1
        xpOliveGreen = 2
        xpSilver = 3
    End Enum
    Private m_ColorSchemes As xFrameStyles
    
    ' Events
    Event Click()
    Event DblClick()
    Event MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    Event MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    Event MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)

    ' Integers
    Private iNumControls As Integer
    
    ' Longs
    Private Col As Long
    Private lBottomR As Long
    Private lBottomG As Long
    Private lBottomB As Long
    Private lTopR As Long
    Private lTopG As Long
    Private lTopB As Long
    Private lUserControlOrigHeight As Long
    Private m_ArrowColor As Long
    Private m_ArrowHighlightedColor As Long
    Private m_ArrowOverColor As Long
    Private m_ButtonColour As Long
    Private m_BorderColor As Long
    Private m_CaptionColor As Long
    Private m_GradientBottom As Long
    Private m_GradientTop As Long
    Private m_HeaderGradientBottom As Long
    Private m_HeaderGradientTop As Long
    
    ' Strings
    Private sFrameCaption As String
    
    ' Types
    Private Type POINTAPI
        X As Long
        Y As Long
    End Type
    
    ' Functions
    Private Declare Function WindowFromPointXY Lib "user32" Alias "WindowFromPoint" (ByVal xPoint As Long, ByVal yPoint As Long) As Long
    Private Declare Function GetCursorPos Lib "user32" (lpPoint As POINTAPI) As Long
    
    '****************************************************************
    ' Gradient Code: Written by Mark Gordon (msg555)
    '----------------------------------------------------------------
    ' Copyright© Mark Gordon, All Rights Reserved
    '----------------------------------------------------------------
    Private Declare Function CreateBitmap Lib "gdi32.dll" (ByVal nWidth As Long, ByVal nHeight As Long, ByVal nPlanes As Long, ByVal nBitCount As Long, ByRef lpBits As Any) As Long
    Private Declare Function GetDIBits Lib "gdi32" (ByVal hdc As Long, ByVal hBitmap As Long, ByVal nStartScan As Long, ByVal nNumScans As Long, lpBits As Any, lpBI As BITMAPINFO, ByVal wUsage As Long) As Long
    Private Declare Function SetDIBits Lib "gdi32" (ByVal hdc As Long, ByVal hBitmap As Long, ByVal nStartScan As Long, ByVal nNumScans As Long, lpBits As Any, lpBI As BITMAPINFO, ByVal wUsage As Long) As Long
    
    Private Const DIB_RGB_COLORS = 0&
    Private Const BI_RGB = 0&
    
    Private Type BITMAPINFOHEADER '40 bytes
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
    
    Private Type BITMAPINFO
      bmiHeader As BITMAPINFOHEADER
      bmiColors As RGBQUAD
    End Type
    
    Private Declare Function OleCreatePictureIndirect Lib "olepro32.dll" (lpPictDesc As PictDesc, riid As Guid, ByVal fPictureOwnsHandle As Long, iPic As StdPicture) As Long
    Private Type PictDesc
        cbSizeofStruct As Long
        picType As Long
        hImage As Long
        xExt As Long
        yExt As Long
    End Type
    Private Type Guid
        Data1 As Long
        Data2 As Integer
        Data3 As Integer
        Data4(0 To 7) As Byte
    End Type
    
    Private Enum Blends
        RGBBlend = 0
        HSLBlend = 1
    End Enum

Private Function CreateGradient(Width As Long, Height As Long, LeftToRight As Boolean, LeftTopColor As Long, RightBottomColor As Long, BlendType As Blends) As StdPicture
    Dim hBmp As Long, Bits() As Byte
    Dim RS As Byte, GS As Byte, BS As Byte 'Start RGB
    Dim RE As Byte, GE As Byte, BE As Byte 'End RGB
    Dim HS As Single, SS As Single, LS As Single 'Start HSL
    Dim HE As Single, SE As Single, LE As Single 'End HSL
    Dim Rc As Byte, GC As Byte, BC As Byte 'Current iteration RGB
    Dim X As Long, Y As Long
    ReDim Bits(0 To 3, 0 To Width - 1, 0 To Height - 1)
    
    RgbCol LeftTopColor, RS, GS, BS
    RgbCol RightBottomColor, RE, GE, BE
    
    If BlendType = RGBBlend Then
        If LeftToRight Then
            For X = 0 To Width - 1
                Rc = (1& * RS - RE) * ((Width - 1 - X) / (Width - 1)) + RE
                GC = (1& * GS - GE) * ((Width - 1 - X) / (Width - 1)) + GE
                BC = (1& * BS - BE) * ((Width - 1 - X) / (Width - 1)) + BE
                For Y = 0 To Height - 1
                    Bits(2, X, Y) = Rc
                    Bits(1, X, Y) = GC
                    Bits(0, X, Y) = BC
                Next
            Next
        Else
            For Y = 0 To Height - 1
                Rc = (1& * RS - RE) * ((Height - 1 - Y) / (Height - 1)) + RE
                GC = (1& * GS - GE) * ((Height - 1 - Y) / (Height - 1)) + GE
                BC = (1& * BS - BE) * ((Height - 1 - Y) / (Height - 1)) + BE
                For X = 0 To Width - 1
                    Bits(2, X, Y) = Rc
                    Bits(1, X, Y) = GC
                    Bits(0, X, Y) = BC
                Next
            Next
        End If
    ElseIf BlendType = HSLBlend Then
        RGBToHSL RS, GS, BS, HS, SS, LS
        RGBToHSL RE, GE, BE, HE, SE, LE
        If LeftToRight Then
            For X = 0 To Width - 1
                HSLToRGB (1& * HS - HE) * ((Width - 1 - X) / (Width - 1)) + HE, _
                        (1& * SS - SE) * ((Width - 1 - X) / (Width - 1)) + SE, _
                        (1& * LS - LE) * ((Width - 1 - X) / (Width - 1)) + LE, _
                        Rc, GC, BC
                For Y = 0 To Height - 1
                    Bits(2, X, Y) = Rc
                    Bits(1, X, Y) = GC
                    Bits(0, X, Y) = BC
                Next
            Next
        Else
            For Y = 0 To Height - 1
                HSLToRGB (1& * HS - HE) * ((Height - 1 - Y) / (Height - 1)) + HE, _
                        (1& * SS - SE) * ((Height - 1 - Y) / (Height - 1)) + SE, _
                        (1& * LS - LE) * ((Height - 1 - Y) / (Height - 1)) + LE, _
                        Rc, GC, BC
                For X = 0 To Width - 1
                    Bits(2, X, Y) = Rc
                    Bits(1, X, Y) = GC
                    Bits(0, X, Y) = BC
                Next
            Next
        End If
    End If

    Dim BI As BITMAPINFO
    With BI.bmiHeader
        .biSize = Len(BI.bmiHeader)
        .biWidth = Width
        .biHeight = -Height
        .biPlanes = 1
        .biBitCount = 32
        .biCompression = BI_RGB
        .biSizeImage = ((((.biWidth * .biBitCount) + 31) \ 32) * 4) * Abs(.biHeight)
    End With
    hBmp = CreateBitmap(Width, Height, 1&, 32&, ByVal 0)
    SetDIBits 0&, hBmp, 0, Abs(BI.bmiHeader.biHeight), Bits(0, 0, 0), BI, DIB_RGB_COLORS

    Dim IGuid As Guid, PicDst As PictDesc
    With IGuid
        .Data1 = &H7BF80980
        .Data2 = &HBF32
        .Data3 = &H101A
        .Data4(0) = &H8B
        .Data4(1) = &HBB
        .Data4(2) = &H0
        .Data4(3) = &HAA
        .Data4(4) = &H0
        .Data4(5) = &H30
        .Data4(6) = &HC
        .Data4(7) = &HAB
    End With
    With PicDst
        .cbSizeofStruct = Len(PicDst)
        .hImage = hBmp
        .picType = vbPicTypeBitmap
    End With
    OleCreatePictureIndirect PicDst, IGuid, True, CreateGradient
End Function

'Helper Functions
Private Sub RgbCol(Col As Long, ByRef R As Byte, ByRef G As Byte, ByRef B As Byte)
    R = Col And &HFF&
    G = (Col And &HFF00&) \ &H100&
    B = (Col And &HFF0000) \ &H10000
End Sub

Private Sub RGBToHSL(ByVal R As Byte, ByVal G As Byte, ByVal B As Byte, H As Single, S As Single, L As Single)
    'http://www.vbAccelerator.com
    Dim Max As Single
    Dim Min As Single
    Dim delta As Single
    Dim rR As Single, rG As Single, rB As Single

    rR = R / 255: rG = G / 255: rB = B / 255

    '{Given: rgb each in [0,1].
    ' Desired: h in [0,360] and s in [0,1], except if s=0, then h=UNDEFINED.}
    Max = Maximum(rR, rG, rB)
    Min = Minimum(rR, rG, rB)
    L = (Max + Min) / 2    '{This is the lightness}
    '{Next calculate saturation}
    If Max = Min Then
        'begin {Acrhomatic case}
        S = 0
        H = 0
        'end {Acrhomatic case}
    Else
        'begin {Chromatic case}
             '{First calculate the saturation.}
        If L <= 0.5 Then
            S = (Max - Min) / (Max + Min)
        Else
            S = (Max - Min) / (2 - Max - Min)
        End If
        
        '{Next calculate the hue.}
        delta = Max - Min
        If rR = Max Then
            H = (rG - rB) / delta    '{Resulting color is between yellow and magenta}
        ElseIf rG = Max Then
            H = 2 + (rB - rR) / delta '{Resulting color is between cyan and yellow}
        ElseIf rB = Max Then
            H = 4 + (rR - rG) / delta '{Resulting color is between magenta and cyan}
        End If
        'Debug.Print h
        'h = h * 60
        'If h < 0# Then
        '     h = h + 360            '{Make degrees be nonnegative}
        'End If
    'end {Chromatic Case}
    End If
'end {RGB_to_HLS}
End Sub

Private Sub HSLToRGB(ByVal H As Single, ByVal S As Single, ByVal L As Single, R As Byte, G As Byte, B As Byte)
    'http://www.vbAccelerator.com
    Dim rR As Single, rG As Single, rB As Single
    Dim Min As Single, Max As Single
    
    If S = 0 Then
        ' Achromatic case:
        rR = L: rG = L: rB = L
    Else
        ' Chromatic case:
        ' delta = Max-Min
        If L <= 0.5 Then
            'S = (Max - Min) / (Max + Min)
            ' Get Min value:
            Min = L * (1 - S)
        Else
            'S = (Max - Min) / (2 - Max - Min)
            ' Get Min value:
            Min = L - S * (1 - L)
        End If
        ' Get the Max value:
        Max = 2 * L - Min
       
        ' Now depending on sector we can evaluate the h,l,s:
        If (H < 1) Then
            rR = Max
            If (H < 0) Then
                rG = Min
                rB = rG - H * (Max - Min)
            Else
                rB = Min
                rG = H * (Max - Min) + rB
            End If
        ElseIf (H < 3) Then
            rG = Max
            If (H < 2) Then
                rB = Min
                rR = rB - (H - 2) * (Max - Min)
            Else
                rR = Min
                rB = (H - 2) * (Max - Min) + rR
            End If
        Else
            rB = Max
            If (H < 4) Then
                rR = Min
                rG = rR - (H - 4) * (Max - Min)
            Else
                rG = Min
                rR = (H - 4) * (Max - Min) + rG
            End If
        End If
    End If
    R = rR * 255: G = rG * 255: B = rB * 255
End Sub

Private Function Maximum(rR As Single, rG As Single, rB As Single) As Single
     'http://www.vbAccelerator.com
    If (rR > rG) Then
        If (rR > rB) Then
            Maximum = rR
        Else
            Maximum = rB
        End If
    Else
        If (rB > rG) Then
            Maximum = rB
        Else
            Maximum = rG
        End If
    End If
End Function

Private Function Minimum(rR As Single, rG As Single, rB As Single) As Single
     'http://www.vbAccelerator.com
    If (rR < rG) Then
        If (rR < rB) Then
            Minimum = rR
        Else
            Minimum = rB
        End If
    Else
        If (rB < rG) Then
            Minimum = rB
        Else
            Minimum = rG
        End If
    End If
End Function
    
' Get and Set all the properties with this control
Public Property Get BackColor() As OLE_COLOR
    BackColor = UserControl.BackColor
End Property

Public Property Let BackColor(ByVal New_BackColor As OLE_COLOR)
    UserControl.BackColor = New_BackColor
    PropertyChanged "BackColor"
    Call UserControl_Paint
End Property

Public Property Get BorderColor() As OLE_COLOR
    BorderColor = m_BorderColor
End Property

Public Property Let BorderColor(ByVal New_BorderColor As OLE_COLOR)
    m_BorderColor = New_BorderColor
    PropertyChanged "BorderColor"
    Call UserControl_Paint
End Property

Public Property Get Button() As Boolean
    Button = bFrameButton
End Property

Public Property Let Button(ByVal new_Button As Boolean)
    bFrameButton = new_Button
    PropertyChanged "Button"
    Call UserControl_Paint
End Property

Public Property Get ButtonColor() As OLE_COLOR
    ButtonColor = m_ArrowColor
End Property

Public Property Let ButtonColor(ByVal New_ButtonColor As OLE_COLOR)
    m_ArrowColor = New_ButtonColor
    PropertyChanged "ButtonColor"
    Call UserControl_Paint
End Property

Public Property Get ButtonHighlightColor() As OLE_COLOR
    ButtonHighlightColor = m_ArrowHighlightedColor
End Property

Public Property Let ButtonHighlightColor(ByVal New_ButtonHighlightColor As OLE_COLOR)
    m_ArrowHighlightedColor = New_ButtonHighlightColor
    PropertyChanged "ButtonHighlightColor"
    Call UserControl_Paint
End Property

Public Property Get ButtonPin() As Boolean
    ButtonPin = bFrameButtonPin
End Property

Public Property Let ButtonPin(ByVal New_ButtonPin As Boolean)
    bFrameButtonPin = New_ButtonPin
    PropertyChanged "ButtonPin"
    Call UserControl_Paint
End Property

Public Property Get Caption() As String
    Caption = sFrameCaption
End Property

Public Property Let Caption(ByVal New_TheCaption As String)
    sFrameCaption = New_TheCaption
    PropertyChanged "Caption"
    Call UserControl_Paint
End Property

Public Property Get ColorScheme() As xFrameStyles
    ColorScheme = m_ColorSchemes
End Property

Public Property Let ColorScheme(val As xFrameStyles)
    ' Determine which color scheme has been selected
    m_ColorSchemes = val

    ' Set the colour scheme
    Call SelectColorScheme

    If bEnableGradient = True Then
        bVerifyEnabledGradient = False
        Set UserControl.Picture = Nothing
    End If

    ' Repaint the control
    Call UserControl_Paint
End Property

Public Property Get DisplayPicture() As Boolean
    DisplayPicture = bDisplayPicture
End Property

Public Property Let DisplayPicture(ByVal new_DisplayPicture As Boolean)
    bDisplayPicture = new_DisplayPicture
    PropertyChanged "DisplayPicture"
    Call UserControl_Resize
End Property

Public Property Get Enabled() As Boolean
    Enabled = UserControl.Enabled
End Property

Public Property Let Enabled(ByVal new_enabled As Boolean)
    UserControl.Enabled() = new_enabled
    PropertyChanged "Enabled"
    
    ' Set the Enabled state of all controls within the Frame
    Dim UserCtrl As Object
    For Each UserCtrl In UserControl.ContainedControls
        UserCtrl.Enabled = new_enabled
    Next

    ' Set the colour scheme
    Call SelectColorScheme
    
    If bEnableGradient = True Then
        bVerifyEnabledGradient = False
        Set UserControl.Picture = Nothing
    End If
    
    Call UserControl_Paint
End Property

Public Property Get EnableGradient() As Boolean
    EnableGradient = bEnableGradient
End Property

Public Property Let EnableGradient(ByVal New_EnableGradient As Boolean)
    bEnableGradient = New_EnableGradient
    PropertyChanged "EnableGradient"
    
    If bEnableGradient = False Then
        bVerifyEnabledGradient = False
        Set UserControl.Picture = Nothing
    End If
    
    ' Set the colour scheme
    Call SelectColorScheme
    Call UserControl_Paint
End Property

Public Property Get Expanded() As Boolean
    Expanded = bExpanded
End Property

Public Property Let Expanded(ByVal New_Expanded As Boolean)
    bExpanded = New_Expanded
    PropertyChanged "Expanded"
    
    If bPinned = False Then
        If bExpanded = False Then 'lUserControlOrigHeight = UserControl.Height Then
            UserControl.Height = 315
        Else
            UserControl.Height = lUserControlOrigHeight
        End If
    End If
    bPaintHeader = False
    Call picHeader_Paint
End Property

Public Property Get Font() As Font
    Set Font = picHeader.Font
End Property

Public Property Set Font(ByVal New_Font As Font)
    Set picHeader.Font = New_Font
    bFontBold = picHeader.FontBold
    bFontItalic = picHeader.FontItalic
    dFontSize = picHeader.FontSize
    bFontStrikeThru = picHeader.FontStrikethru
    bFontUnderline = picHeader.FontUnderline
    Call UserControl_Resize
    PropertyChanged "Font"
End Property

Public Property Get ForeColor() As OLE_COLOR
    ForeColor = picHeader.ForeColor
End Property

Public Property Let ForeColor(ByVal New_ForeColor As OLE_COLOR)
    picHeader.ForeColor() = New_ForeColor
    m_CaptionColor = New_ForeColor
    PropertyChanged "ForeColor"
End Property

Public Property Get FramePinned() As Boolean
    FramePinned = bPinned
End Property

Public Property Let FramePinned(ByVal New_FramePinned As Boolean)
    bPinned = New_FramePinned
    PropertyChanged "FramePinned"
    Call UserControl_Paint
End Property

Public Property Get GradientBottom() As OLE_COLOR
   GradientBottom = m_GradientBottom
End Property

Public Property Let GradientBottom(ByVal New_GradientBottom As OLE_COLOR)
    m_GradientBottom = New_GradientBottom
    PropertyChanged "GradientBottom"

    If bEnableGradient = True Then
        bVerifyEnabledGradient = False
        Set UserControl.Picture = Nothing
    End If

    ' Repaint the control
    Call UserControl_Paint
End Property

Public Property Get GradientTop() As OLE_COLOR
   GradientTop = m_GradientTop
End Property

Public Property Let GradientTop(ByVal New_GradientTop As OLE_COLOR)
    m_GradientTop = New_GradientTop
    PropertyChanged "GradientTop"

    If bEnableGradient = True Then
        bVerifyEnabledGradient = False
        Set UserControl.Picture = Nothing
    End If

    ' Repaint the control
    Call UserControl_Paint
End Property

Public Property Get HeaderGradientBottom() As OLE_COLOR
   HeaderGradientBottom = m_HeaderGradientBottom
End Property

Public Property Let HeaderGradientBottom(ByVal New_HeaderGradientBottom As OLE_COLOR)
    m_HeaderGradientBottom = New_HeaderGradientBottom
    PropertyChanged "HeaderGradientBottom"
    bPaintHeader = False
    picHeader.Cls
    picHeader_Paint
End Property

Public Property Get HeaderGradientTop() As OLE_COLOR
    HeaderGradientTop = m_HeaderGradientTop
End Property

Public Property Let HeaderGradientTop(ByVal New_HeaderGradientTop As OLE_COLOR)
    m_HeaderGradientTop = New_HeaderGradientTop
    PropertyChanged "HeaderGradientTop"
    bPaintHeader = False
    picHeader.Cls
    picHeader_Paint
End Property

Public Property Get Picture() As Picture
    Set Picture = imgFramePic.Picture
End Property

Public Property Set Picture(ByVal New_Picture As Picture)
    Set imgFramePic.Picture = New_Picture
    PropertyChanged "Picture"
    bDisplayPicture = True
    Call UserControl_Resize
    bPaintHeader = False
    Call picHeader_Paint
End Property

Private Sub picHeader_Click()
    If bMouseOver = True And bFrameButton = True Then
        If bPinned = False Then
            If lUserControlOrigHeight = UserControl.Height Then
                UserControl.Height = 315
                bExpanded = False
            Else
                UserControl.Height = lUserControlOrigHeight
                bExpanded = True
            End If
        End If
        bPaintHeader = False
        Call picHeader_Paint
    ElseIf bMouseOverButtonPin = True And bFrameButtonPin = True Then
        If bPinned = False Then
            bPinned = True
        Else
            bPinned = False
        End If
    End If
    
    PropertyChanged "Expanded"
    
    ' Invokes the Click Event
    RaiseEvent Click
End Sub

Private Sub picHeader_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If bMouseOver Then
        If X < (picHeader.Width - 450) Or X > (picHeader.Width - 300) Then
            Exit Sub
        End If
    End If
    If bFrameButton = True Then
        If X < (picHeader.Width - 450) Or X > (picHeader.Width - 300) Then
            bMouseOver = True
            bMouseOverButtonPin = False
        Else
            bMouseOver = False
            bMouseOverButtonPin = True
        End If
    Else
        bMouseOver = False
        bMouseOverButtonPin = True
    End If
    tmrMouseMove.Enabled = True
    bPaintHeader = False
    Call picHeader_Paint
End Sub

Private Sub picHeader_Paint()
    ' Paints the Frame header and label
    If bPaintHeader = False Then
        ' Set the Frame header bottom colour
        Col = m_HeaderGradientBottom
        lBottomR = (Col And &HFF&)
        lBottomG = (Col And &HFF00&) / &H100
        lBottomB = (Col And &HFF0000) / &H10000
        
        ' Set the Frame header top colour
        Col = m_HeaderGradientTop
        lTopR = (Col And &HFF&)
        lTopG = (Col And &HFF00&) / &H100
        lTopB = (Col And &HFF0000) / &H10000
        
        ' Clear the Header for drawing and apply the gradient colour
        picHeader.Cls
        Set picHeader.Picture = CreateGradient(picHeader.Width / Screen.TwipsPerPixelX, picHeader.Height / Screen.TwipsPerPixelY, False, RGB(lTopR, lTopG, lTopB), RGB(lBottomR, lBottomG, lBottomB), RGBBlend)

        ' Display the Text and Icon
        picHeader.FontBold = bFontBold
        picHeader.FontItalic = bFontItalic
        If dFontSize = 0 Then
            dFontSize = 8
        Else
            picHeader.FontSize = dFontSize
        End If
        picHeader.FontStrikethru = bFontStrikeThru
        picHeader.FontUnderline = bFontUnderline
        If bDisplayPicture = False Then
            picHeader.CurrentX = 75
        Else
            picHeader.CurrentX = imgFramePic.Width + 75
            picHeader.ScaleMode = 1
            picHeader.PaintPicture imgFramePic.Picture, 15, 15, imgFramePic.Width, imgFramePic.Height
        End If
        picHeader.CurrentY = (picHeader.Height - picHeader.TextHeight(sFrameCaption)) / 2
        picHeader.ForeColor = m_CaptionColor
        picHeader.Print sFrameCaption

        ' Draw the Pin Button if the user has selected this option
        If bFrameButtonPin = True Then
            If bMouseOverButtonPin = False Then
                m_ButtonColour = m_ArrowColor
            Else
                m_ButtonColour = m_ArrowOverColor
            End If
            
            If bFrameButton = True Then
                If bPinned = False Then
                    picHeader.Line (picHeader.Width - 435, 135)-(picHeader.Width - 390, 135), m_ButtonColour
                    picHeader.Line (picHeader.Width - 390, 90)-(picHeader.Width - 390, 195), m_ButtonColour
                    picHeader.Line (picHeader.Width - 390, 105)-(picHeader.Width - 315, 105), m_ButtonColour
                    picHeader.Line (picHeader.Width - 390, 155)-(picHeader.Width - 315, 155), m_ButtonColour
                    picHeader.Line (picHeader.Width - 390, 170)-(picHeader.Width - 315, 170), m_ButtonColour
                    picHeader.Line (picHeader.Width - 315, 105)-(picHeader.Width - 315, 180), m_ButtonColour
                Else
                    picHeader.Line (picHeader.Width - 390, 75)-(picHeader.Width - 330, 75), m_ButtonColour
                    picHeader.Line (picHeader.Width - 390, 75)-(picHeader.Width - 390, 150), m_ButtonColour
                    picHeader.Line (picHeader.Width - 345, 75)-(picHeader.Width - 345, 150), m_ButtonColour
                    picHeader.Line (picHeader.Width - 330, 75)-(picHeader.Width - 330, 150), m_ButtonColour
                    picHeader.Line (picHeader.Width - 415, 150)-(picHeader.Width - 280, 150), m_ButtonColour
                    picHeader.Line (picHeader.Width - 360, 150)-(picHeader.Width - 360, 210), m_ButtonColour
                End If
            Else
                If bPinned = False Then
                    picHeader.Line (picHeader.Width - 255, 135)-(picHeader.Width - 210, 135), m_ButtonColour
                    picHeader.Line (picHeader.Width - 210, 90)-(picHeader.Width - 210, 195), m_ButtonColour
                    picHeader.Line (picHeader.Width - 210, 105)-(picHeader.Width - 135, 105), m_ButtonColour
                    picHeader.Line (picHeader.Width - 210, 155)-(picHeader.Width - 135, 155), m_ButtonColour
                    picHeader.Line (picHeader.Width - 210, 170)-(picHeader.Width - 135, 170), m_ButtonColour
                    picHeader.Line (picHeader.Width - 135, 105)-(picHeader.Width - 135, 180), m_ButtonColour
                Else
                    picHeader.Line (picHeader.Width - 210, 75)-(picHeader.Width - 150, 75), m_ButtonColour
                    picHeader.Line (picHeader.Width - 210, 75)-(picHeader.Width - 210, 150), m_ButtonColour
                    picHeader.Line (picHeader.Width - 165, 75)-(picHeader.Width - 165, 150), m_ButtonColour
                    picHeader.Line (picHeader.Width - 150, 75)-(picHeader.Width - 150, 150), m_ButtonColour
                    picHeader.Line (picHeader.Width - 235, 150)-(picHeader.Width - 100, 150), m_ButtonColour
                    picHeader.Line (picHeader.Width - 180, 150)-(picHeader.Width - 180, 210), m_ButtonColour
                End If
            End If
        End If
        
        ' Draw the button if the user has selected this option
        If bFrameButton = True Then
            Dim i As Integer
            Dim iHorizontal1 As Integer
            Dim iHorizontal2 As Integer
            Dim iVertical As Integer
            
            If bMouseOver = False Then
                m_ButtonColour = m_ArrowColor
            Else
                m_ButtonColour = m_ArrowOverColor
            End If
            
            If lUserControlOrigHeight = UserControl.Height Then
                iHorizontal1 = 195
                iHorizontal2 = 180
                iVertical = 75
                For i = 1 To 2
                    ' 1st Line of Arrow
                    picHeader.Line (picHeader.Width - iHorizontal1, iVertical)-(picHeader.Width - (iHorizontal1 - 15), iVertical), m_ButtonColour
                    iVertical = iVertical + 15
                    
                    ' 2nd Line of Arrow
                    picHeader.Line (picHeader.Width - (iHorizontal1 + 15), iVertical)-(picHeader.Width - (iHorizontal1 - 30), iVertical), m_ButtonColour
                    iVertical = iVertical + 15
                    
                    ' 3rd Line of Arrow
                    picHeader.Line (picHeader.Width - (iHorizontal1 + 30), iVertical)-(picHeader.Width - iHorizontal1, iVertical), m_ButtonColour
                    picHeader.Line (picHeader.Width - iHorizontal2, iVertical)-(picHeader.Width - (iHorizontal2 - 30), iVertical), m_ButtonColour
                    iVertical = iVertical + 15
                    
                    ' 4th Line of Arrow
                    picHeader.Line (picHeader.Width - (iHorizontal1 + 45), iVertical)-(picHeader.Width - (iHorizontal1 + 15), iVertical), m_ButtonColour
                    picHeader.Line (picHeader.Width - (iHorizontal2 - 15), iVertical)-(picHeader.Width - (iHorizontal2 - 45), iVertical), m_ButtonColour
                    iVertical = iVertical + 15
                Next
            Else
                iHorizontal1 = 195 '210
                iHorizontal2 = 180 '195
                iVertical = 75
                For i = 1 To 2
                    ' 1st Line of Arrow
                    picHeader.Line (picHeader.Width - (iHorizontal1 + 45), iVertical)-(picHeader.Width - (iHorizontal1 + 15), iVertical), m_ButtonColour
                    picHeader.Line (picHeader.Width - (iHorizontal2 - 15), iVertical)-(picHeader.Width - (iHorizontal2 - 45), iVertical), m_ButtonColour
                    iVertical = iVertical + 15
                
                    ' 2nd Line of Arrow
                    picHeader.Line (picHeader.Width - (iHorizontal1 + 30), iVertical)-(picHeader.Width - iHorizontal1, iVertical), m_ButtonColour
                    picHeader.Line (picHeader.Width - iHorizontal2, iVertical)-(picHeader.Width - (iHorizontal2 - 30), iVertical), m_ButtonColour
                    iVertical = iVertical + 15
                    
                    ' 3rd Line of Arrow
                    picHeader.Line (picHeader.Width - (iHorizontal1 + 15), iVertical)-(picHeader.Width - (iHorizontal1 - 30), iVertical), m_ButtonColour
                    iVertical = iVertical + 15
                    
                    ' 4th Line of Arrow
                    picHeader.Line (picHeader.Width - iHorizontal1, iVertical)-(picHeader.Width - (iHorizontal1 - 15), iVertical), m_ButtonColour
                    iVertical = iVertical + 15
                Next
            End If
        End If
            
        ' Draw a line at the bottom of the Frame header
        picHeader.Line (0, picHeader.Height - 30)-(picHeader.Width, picHeader.Height - 30), UserControl.BackColor 'UserControl.Ambient.BackColor
        picHeader.ZOrder 0
        
        ' Set the Frame header caption colour
        picHeader.ForeColor = m_CaptionColor
        bPaintHeader = True
    End If
End Sub

Private Sub SelectColorScheme()
    If UserControl.Enabled = False Then
        m_ArrowColor = &H759797
        m_ArrowHighlightedColor = &HCFCFCF
        m_BorderColor = &H80A7BF
        m_CaptionColor = &H759797
        m_GradientBottom = &HF8FAFA
        m_GradientTop = &HFFFFFF
        m_HeaderGradientBottom = &H90ABAB
        m_HeaderGradientTop = &HE0E7E7
    Else
        Select Case m_ColorSchemes
            Case xpDefault
                m_ArrowColor = &H0&
                m_ArrowHighlightedColor = &HAFAFAF
                m_BorderColor = &HCFCFCF
                m_CaptionColor = &H0&
                m_GradientBottom = &HEFEFEF
                m_GradientTop = &HFFFFFF
                m_HeaderGradientBottom = &HCFCFCF
                m_HeaderGradientTop = &HF8F8F8
            Case xpBlue
                m_ArrowColor = &HBB6132
                m_ArrowHighlightedColor = &HFFFFFF
                m_BorderColor = &HCF9365
                m_CaptionColor = &HFFFFFF
                m_GradientBottom = &HEBC2A5
                m_GradientTop = &HFFFFFF
                m_HeaderGradientBottom = &HC06E40
                m_HeaderGradientTop = &HF8E9DE
            Case xpOliveGreen
                m_ArrowColor = &H447864
                m_ArrowHighlightedColor = &H74AA9B
                m_BorderColor = &H74AA9B
                m_CaptionColor = &H447864
                m_GradientBottom = &HE3EFEC
                m_GradientTop = &HFFFFFF
                m_HeaderGradientBottom = &H79B1A2
                m_HeaderGradientTop = &HE3EFEC
            Case xpSilver
                m_ArrowColor = &H7E6666
                m_ArrowHighlightedColor = &HBBA9A8
                m_BorderColor = &HBBA9A8
                m_CaptionColor = &H7E6666
                m_GradientBottom = &HF2EBEC
                m_GradientTop = &HFFFFFF
                m_HeaderGradientBottom = &HD7C3C6
                m_HeaderGradientTop = &HF5F0F0
        End Select
    End If
    m_ArrowOverColor = m_ArrowColor
End Sub

Private Sub tmrMouseMove_Timer()
    Dim pt As POINTAPI

    ' See where the cursor is.
    GetCursorPos pt
    
    ' Translate into window coordinates.
    If WindowFromPointXY(pt.X, pt.Y) <> picHeader.hWnd Then
        If m_ArrowOverColor <> m_ArrowColor Then
            m_ArrowOverColor = m_ArrowColor
            bPaintHeader = False
            Call picHeader_Paint
        End If
    Else
        If m_ArrowOverColor <> m_ArrowHighlightedColor Then
            m_ArrowOverColor = m_ArrowHighlightedColor
            bPaintHeader = False
            Call picHeader_Paint
        End If
    End If
End Sub

Private Sub UserControlsCreate()
    If iNumControls = 0 Then
        ' Create the controls only once
        iNumControls = 1
        
        ' Add the Frame Header picturebox
        Set picHeader = UserControl.Controls.Add("VB.PictureBox", "picHeader")
        picHeader.AutoRedraw = True
        picHeader.BorderStyle = 0
        picHeader.Visible = True
        
        ' Add the Frame Timer
        Set tmrMouseMove = UserControl.Controls.Add("VB.Timer", "tmrMouseMove")
        tmrMouseMove.Enabled = False
        tmrMouseMove.Interval = 10
               
        ' Add the Frame Header Image
        Set imgFramePic = Controls.Add("VB.Image", "imgFramePic", picHeader)
        Set imgFramePic.Picture = Nothing
        imgFramePic.Visible = False
    End If
End Sub

Private Sub UserControl_Click()
    ' Invokes the Click Event
    RaiseEvent Click
End Sub

Private Sub UserControl_DblClick()
    ' Invokes the Double Click Event
    RaiseEvent DblClick
End Sub

Private Sub UserControl_InitProperties()
    ' Initialise the default values
    bDisplayPicture = False
    bEnableGradient = False
    bExpanded = True
    bFontBold = False
    bFontItalic = False
    bFontStrikeThru = False
    bFontUnderline = False
    bFrameButton = False
    bFrameButtonPin = False
    bPaintHeader = False
    bPinned = False
    bMouseOver = False
    bMouseOverButtonPin = False
    bVerifyEnabledGradient = False
    dFontSize = 8
    iNumControls = 0

    Call UserControlsCreate
    
    ' Default Colour Scheme is Blue
    m_ColorSchemes = 1
    m_ArrowColor = &HBB6132
    m_ArrowHighlightedColor = &HFFFFFF
    m_ArrowOverColor = m_ArrowColor
    m_BorderColor = &HCF9365
    m_CaptionColor = &HFFFFFF
    m_GradientBottom = &HEBC2A5
    m_GradientTop = &HFFFFFF
    m_HeaderGradientBottom = &HC06E40
    m_HeaderGradientTop = &HF8E9DE
    sFrameCaption = UserControl.Extender.Name
    picHeader.ForeColor = m_CaptionColor
    picHeader.FontSize = dFontSize
End Sub

Private Sub UserControl_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    ' Invokes the MouseDown Event
    RaiseEvent MouseDown(Button, Shift, X, Y)
End Sub

Private Sub UserControl_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    ' Invokes the MouseMove Event
    RaiseEvent MouseMove(Button, Shift, X, Y)
End Sub

Private Sub UserControl_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    ' Invokes the MouseUp Event
    RaiseEvent MouseUp(Button, Shift, X, Y)
End Sub

Private Sub UserControl_Paint()
    ' Clear the Frame body for drawing
    UserControl.Cls
    
    ' Check to see if the user has enabled the gradient frame body colour
    If bEnableGradient = True And bVerifyEnabledGradient = False Then
        bVerifyEnabledGradient = True
        
        ' Set the Frame header bottom colour
        Col = m_GradientBottom
        lBottomR = (Col And &HFF&)
        lBottomG = (Col And &HFF00&) / &H100
        lBottomB = (Col And &HFF0000) / &H10000
        
        ' Set the Frame header top colour
        Col = m_GradientTop
        lTopR = (Col And &HFF&)
        lTopG = (Col And &HFF00&) / &H100
        lTopB = (Col And &HFF0000) / &H10000
        
        Set UserControl.Picture = CreateGradient(UserControl.Width / Screen.TwipsPerPixelX, UserControl.Height / Screen.TwipsPerPixelY, False, RGB(lTopR, lTopG, lTopB), RGB(lBottomR, lBottomG, lBottomB), RGBBlend)
    End If
    
    ' Frame Border Line drawing
    ' 1st Line is Top Border
    ' 2nd Line is Bottom Border
    ' 3rd Line is Left Border
    ' 4th Line is Right Border
    UserControl.Line (0, 0)-(UserControl.Width, 0), m_BorderColor
    UserControl.Line (0, UserControl.Height - 15)-(UserControl.Width, UserControl.Height - 15), m_BorderColor
    UserControl.Line (0, 0)-(0, UserControl.Height), m_BorderColor
    UserControl.Line (UserControl.Width - 15, 0)-(UserControl.Width - 15, UserControl.Height), m_BorderColor
    
    ' Paints the Frame header and label
    bPaintHeader = False
    Call picHeader_Paint
End Sub

Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
    On Error Resume Next
    Call UserControlsCreate

    ' Load saved properties
    m_ColorSchemes = PropBag.ReadProperty("ColorScheme", 1)
    Call SelectColorScheme
    UserControl.BackColor = PropBag.ReadProperty("BackColor", vbButtonFace)
    m_BorderColor = PropBag.ReadProperty("BorderColor", &HCF9365)
    bFrameButton = PropBag.ReadProperty("Button", False)
    m_ArrowColor = PropBag.ReadProperty("ButtonColor", &HBB6132)
    m_ArrowHighlightedColor = PropBag.ReadProperty("ButtonHighlightColor", &HFFFFFF)
    bFrameButtonPin = PropBag.ReadProperty("ButtonPin", False)
    m_ColorSchemes = PropBag.ReadProperty("ColorScheme", 1)
    sFrameCaption = PropBag.ReadProperty("Caption", UserControl.Extender.Name)
    bDisplayPicture = PropBag.ReadProperty("DisplayPicture", False)
    UserControl.Enabled = PropBag.ReadProperty("Enabled", False)
    If UserControl.Enabled = False Then
        Call SelectColorScheme
    End If
    bEnableGradient = PropBag.ReadProperty("EnableGradient", False)
    bExpanded = PropBag.ReadProperty("Expanded", True)
    picHeader.Font = PropBag.ReadProperty("Font", Ambient.Font)
    bFontBold = PropBag.ReadProperty("FontBold", Ambient.Font)
    bFontItalic = PropBag.ReadProperty("FontItalic", Ambient.Font)
    dFontSize = PropBag.ReadProperty("FontSize", Ambient.Font)
    bFontStrikeThru = PropBag.ReadProperty("FontStrikeThru", Ambient.Font)
    bFontUnderline = PropBag.ReadProperty("FontUnderline", Ambient.Font)
    m_CaptionColor = PropBag.ReadProperty("ForeColor", &HFFFFFF)
    bPinned = PropBag.ReadProperty("FramePinned", False)
    m_GradientBottom = PropBag.ReadProperty("GradientBottom", &HEBC2A5)
    m_GradientTop = PropBag.ReadProperty("GradientTop", &HFFFFFF)
    m_HeaderGradientBottom = PropBag.ReadProperty("HeaderGradientBottom", &HC27345)
    m_HeaderGradientTop = PropBag.ReadProperty("HeaderGradientTop", &HF8E9DE)
    imgFramePic.Picture = PropBag.ReadProperty("Picture", Nothing)
    Call UserControl_Resize
End Sub

Private Sub UserControl_Resize()
    Call UserControlsCreate
    ' Position the Frame header
    picHeader.Move 15, 15, UserControl.Width - 30, 300
    picHeader.ZOrder 0

    bPaintHeader = False
    Call picHeader_Paint
    bPaintHeader = True

    ' Paints the Frame
    If bEnableGradient = True Then
        bVerifyEnabledGradient = False
    End If
    
    If UserControl.Height <> 315 Then lUserControlOrigHeight = UserControl.Height
End Sub

Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
    ' Save properties
    Call PropBag.WriteProperty("BackColor", UserControl.BackColor, vbButtonFace)
    Call PropBag.WriteProperty("BorderColor", m_BorderColor, &HCF9365)
    Call PropBag.WriteProperty("Button", bFrameButton, False)
    Call PropBag.WriteProperty("ButtonColor", m_ArrowColor, &HBB6132)
    Call PropBag.WriteProperty("ButtonHighlightColor", m_ArrowHighlightedColor, &HFFFFFF)
    Call PropBag.WriteProperty("ButtonPin", bFrameButtonPin, False)
    Call PropBag.WriteProperty("ColorScheme", m_ColorSchemes, 1)
    Call PropBag.WriteProperty("Caption", sFrameCaption, UserControl.Extender.Name)
    Call PropBag.WriteProperty("DisplayPicture", bDisplayPicture, False)
    Call PropBag.WriteProperty("Enabled", UserControl.Enabled, False)
    Call PropBag.WriteProperty("EnableGradient", bEnableGradient, False)
    Call PropBag.WriteProperty("Expanded", bExpanded, True)
    Call PropBag.WriteProperty("Font", picHeader.Font, Ambient.Font)
    Call PropBag.WriteProperty("FontBold", picHeader.FontBold, Ambient.Font)
    Call PropBag.WriteProperty("ForeColor", m_CaptionColor, &HFFFFFF)
    Call PropBag.WriteProperty("FontItalic", picHeader.FontItalic, Ambient.Font)
    Call PropBag.WriteProperty("FontSize", picHeader.FontSize, Ambient.Font)
    Call PropBag.WriteProperty("FontStrikethru", picHeader.FontStrikethru, Ambient.Font)
    Call PropBag.WriteProperty("FontUnderline", picHeader.FontUnderline, Ambient.Font)
    Call PropBag.WriteProperty("FramePinned", bPinned, False)
    Call PropBag.WriteProperty("GradientBottom", m_GradientBottom, &HEBC2A5)
    Call PropBag.WriteProperty("GradientTop", m_GradientTop, &HFFFFFF)
    Call PropBag.WriteProperty("HeaderGradientBottom", m_HeaderGradientBottom, &HC27345)
    Call PropBag.WriteProperty("HeaderGradientTop", m_HeaderGradientTop, &HF8E9DE)
    Call PropBag.WriteProperty("Picture", imgFramePic.Picture, Nothing)
End Sub
