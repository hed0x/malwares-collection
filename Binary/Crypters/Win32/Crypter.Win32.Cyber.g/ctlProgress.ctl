VERSION 5.00
Begin VB.UserControl ctlProgress 
   ClientHeight    =   300
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   300
   ScaleWidth      =   4800
   Begin VB.PictureBox picProgress 
      AutoRedraw      =   -1  'True
      ClipControls    =   0   'False
      FillStyle       =   0  'Solid
      Height          =   255
      Left            =   0
      ScaleHeight     =   195
      ScaleWidth      =   4695
      TabIndex        =   0
      Top             =   0
      Width           =   4755
   End
End
Attribute VB_Name = "ctlProgress"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
Dim lMaxValue As Long
Dim lMinValue As Long
Dim lValue As Long
Dim sCaption As String
Dim nCaptionStyle As Integer
Dim oFillColor As OLE_COLOR

Public Enum eBorderStyle
    eBor_None = 0
    eBor_FixedSingle
End Enum

Public Enum eCaptionStyle
    eCap_None = 0
    eCap_CaptionOnly
    eCap_PercentOnly
    eCap_CaptionPercent
End Enum

Public Enum eAppearance
    eApp_Flat = 0
    eApp_3D
End Enum

Public Property Let Appearance(nValue As eAppearance)
    picProgress.Appearance = nValue
    PropertyChanged
End Property

Public Property Get Appearance() As eAppearance
    Appearance = picProgress.Appearance
End Property

Public Property Let Caption(nValue As String)
    sCaption = Trim(nValue)
    PropertyChanged
End Property

Public Property Get Caption() As String
    Caption = sCaption
End Property

Public Property Let Max(nValue As Long)
    lMaxValue = nValue
    PropertyChanged
End Property

Public Property Get Max() As Long
    Max = lMaxValue
End Property

Public Property Let Min(nValue As Long)
    lMinValue = nValue
    PropertyChanged
End Property

Public Property Get Min() As Long
    Min = lMinValue
End Property

Public Property Let Enabled(nValue As Boolean)
    picProgress.Enabled = nValue
    PropertyChanged
End Property

Public Property Get Enabled() As Boolean
    Enabled = picProgress.Enabled
End Property

Public Property Let BorderStyle(nValue As eBorderStyle)
    picProgress.BorderStyle = nValue
    PropertyChanged
End Property

Public Property Get BorderStyle() As eBorderStyle
    BorderStyle = picProgress.BorderStyle
End Property

Public Property Let CaptionStyle(nValue As eCaptionStyle)
    nCaptionStyle = nValue
    PropertyChanged
End Property

Public Property Get CaptionStyle() As eCaptionStyle
    CaptionStyle = nCaptionStyle
End Property

Public Property Get CaptionFont() As Font
    Set CaptionFont = UserControl.Font
End Property

Public Property Set CaptionFont(ByVal NewFont As Font)
    Set UserControl.Font = NewFont
    SyncLabelFonts
    PropertyChanged
End Property

Private Sub SyncLabelFonts()
    Dim objCtl As Object
    For Each objCtl In Controls
        Set objCtl.Font = UserControl.Font
    Next
End Sub

Public Property Let FillColor(nValue As OLE_COLOR)
    oFillColor = nValue
    PropertyChanged
End Property

Public Property Get FillColor() As OLE_COLOR
    FillColor = oFillColor
End Property

Public Property Let ForeColor(nValue As OLE_COLOR)
    picProgress.ForeColor = nValue
    PropertyChanged
End Property

Public Property Get ForeColor() As OLE_COLOR
    ForeColor = picProgress.ForeColor
End Property

Public Property Let BackColor(nValue As OLE_COLOR)
    picProgress.BackColor = nValue
    PropertyChanged
End Property

Public Property Get BackColor() As OLE_COLOR
    BackColor = picProgress.BackColor
End Property

Public Property Let Value(nValue As Long)
    lValue = nValue
    Call ChangeValue(nValue)
End Property

Public Property Get Value() As Long
    Value = lValue
End Property

Private Sub Picture(Obj As PictureBox)
    UserControl.Picture = Obj.Picture
End Sub

Private Sub GetPicture(Obj As PictureBox)
    Obj.Picture = UserControl.Picture
End Sub

Public Sub Refresh()
    picProgress.Refresh
End Sub

Private Sub UserControl_InitProperties()
    Max = 100
    Min = 0
    BackColor = UserControl.BackColor
    FillColor = vbBlue
    CaptionStyle = eCap_PercentOnly
    SyncLabelFonts
End Sub

Private Sub UserControl_Resize()
    picProgress.Width = UserControl.Width
    picProgress.Height = UserControl.Height
End Sub

Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
    On Error Resume Next
    picProgress.Appearance = PropBag.ReadProperty("Appearance", picProgress.Appearance)
    picProgress.ForeColor = PropBag.ReadProperty("ForeColor", picProgress.ForeColor)
    picProgress.BackColor = PropBag.ReadProperty("BackColor", picProgress.BackColor)
    oFillColor = PropBag.ReadProperty("FillColor", oFillColor)
    BorderStyle = PropBag.ReadProperty("BorderStyle", 1)
    CaptionStyle = PropBag.ReadProperty("CaptionStyle", 3)
    Enabled = PropBag.ReadProperty("Enabled", True)
    Caption = PropBag.ReadProperty("Caption", "")
    Max = PropBag.ReadProperty("Max", 100)
    Min = PropBag.ReadProperty("Min", 0)
    Set CaptionFont = PropBag.ReadProperty("CaptionFont")
End Sub

Private Sub ChangeValue(nValue As Long)

    On Error Resume Next

    Dim NewCaption As String

    If nValue > lMaxValue Then
        nValue = lMaxValue
    ElseIf nValue < lMinValue Then
        nValue = lMinValue
    End If
    
    picProgress.Cls
    If CaptionStyle <> eCap_None Then
        If CaptionStyle <> eCap_CaptionOnly Then
            If Caption = "" Or CaptionStyle = eCap_PercentOnly Then
                NewCaption = Format(Str((nValue - Min) / (Max - Min)) * 100, "0") + "%"
            Else
                NewCaption = Caption & " " & Format(Str((nValue - Min) / (Max - Min)) * 100, "0") + "%"
            End If
        Else
            NewCaption = Caption
        End If
    End If
    
    picProgress.ScaleWidth = Max - Min
    picProgress.DrawMode = 10
    
    picProgress.CurrentX = (picProgress.ScaleWidth / 2 - picProgress.TextWidth(NewCaption) / 2)
    picProgress.CurrentY = (picProgress.ScaleHeight - picProgress.TextHeight(NewCaption)) / 2
    picProgress.Print NewCaption
    picProgress.Line (0, 0)-((nValue - Min), picProgress.Width), FillColor, BF
End Sub

Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
    Call PropBag.WriteProperty("Appearance", picProgress.Appearance)
    Call PropBag.WriteProperty("ForeColor", picProgress.ForeColor)
    Call PropBag.WriteProperty("BackColor", picProgress.BackColor)
    Call PropBag.WriteProperty("FillColor", oFillColor)
    Call PropBag.WriteProperty("Font", Font, Ambient.Font)
    Call PropBag.WriteProperty("BorderStyle", BorderStyle, 1)
    Call PropBag.WriteProperty("CaptionStyle", CaptionStyle, 3)
    Call PropBag.WriteProperty("Enabled", Enabled, True)
    Call PropBag.WriteProperty("Caption", Caption)
    Call PropBag.WriteProperty("Min", Min, 0)
    Call PropBag.WriteProperty("CaptionFont", CaptionFont)
End Sub
