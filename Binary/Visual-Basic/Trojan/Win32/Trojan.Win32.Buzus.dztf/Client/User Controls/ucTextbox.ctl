VERSION 5.00
Begin VB.UserControl ucTextbox 
   ClientHeight    =   600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4470
   ScaleHeight     =   600
   ScaleWidth      =   4470
   Begin VB.TextBox Text1 
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   1275
      TabIndex        =   2
      Text            =   "Text1"
      Top             =   75
      Width           =   2940
   End
   Begin VB.Image Image1 
      Height          =   240
      Left            =   1050
      Picture         =   "ucTextbox.ctx":0000
      Top             =   60
      Width           =   240
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   195
      Left            =   30
      TabIndex        =   1
      Top             =   75
      Width           =   1065
   End
   Begin VB.Shape Shape1 
      FillColor       =   &H00FFFFFF&
      FillStyle       =   0  'Solid
      Height          =   345
      Left            =   0
      Shape           =   4  'Rounded Rectangle
      Top             =   0
      Width           =   4335
   End
   Begin VB.Label Label2 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "ucTextbox"
      ForeColor       =   &H80000008&
      Height          =   225
      Left            =   120
      TabIndex        =   0
      Top             =   45
      Visible         =   0   'False
      Width           =   780
   End
End
Attribute VB_Name = "ucTextbox"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Const m_def_Caption = "ucTextbox"
Const m_def_BorderColor = vbBlack
Const m_def_TextBackColor = vbWhite
Const m_def_CaptionColor = vbBlack
Const m_def_Text = ""
Const m_def_MaxLength = 0

Dim m_Caption As String
Dim m_BorderColor As OLE_COLOR
Dim m_TextBackColor As OLE_COLOR
Dim m_CaptionColor As OLE_COLOR
Dim m_Text As String
Dim m_MaxLength As Integer

Private Sub Text1_Change()
   Text = Text1.Text
End Sub

Private Sub Text1_GotFocus()
   Dim TxtLen As Integer
   'put carot at end of text
   TxtLen = Len(Text1.Text)
   Text1.SelStart = TxtLen
End Sub

Private Sub UserControl_Initialize()
   m_Caption = m_def_Caption
   m_BorderColor = m_def_BorderColor
   m_TextBackColor = m_def_TextBackColor
   m_CaptionColor = m_def_CaptionColor
   m_Text = m_def_Text
   m_MaxLength = m_def_MaxLength
End Sub

Private Sub UserControl_InitProperties()
   Caption = Extender.Name
   BorderColor = m_BorderColor
   TextBackColor = m_TextBackColor
   CaptionColor = m_CaptionColor
   Text = m_Text
   MaxLength = m_MaxLength
End Sub

Private Sub UserControl_Resize()
   Label2.Caption = "  " & Caption & "   "  'presizes label1 width
   'position and size all the components
   Text1.Top = 80
   Label1.Left = 20
   Image1.Top = Label1.Top
   Label1.Width = Label2.Width
   Shape1.Width = UserControl.Width
   Label1.Caption = Label2.Caption
   Text1.Left = Label1.Width + 100
   Image1.Left = Label1.Width - 150
   Text1.Width = UserControl.Width - Label1.Width - 160
   Text1.Height = Shape1.Height - 100
   UserControl.Height = Shape1.Height
End Sub

Public Property Get Caption() As String
   Caption = m_Caption
End Property

Public Property Let Caption(NewCaption As String)
   m_Caption = NewCaption
   Label2.Caption = m_Caption
   PropertyChanged "Caption"
   UserControl_Resize
End Property

Public Property Get BorderColor() As OLE_COLOR
   BorderColor = m_BorderColor
End Property

Public Property Get CaptionColor() As OLE_COLOR
   CaptionColor = m_CaptionColor
End Property

Public Property Let CaptionColor(NewCaptionColor As OLE_COLOR)
   m_CaptionColor = NewCaptionColor
   Label1.ForeColor = m_CaptionColor
   Text1.ForeColor = m_CaptionColor
   PropertyChanged "CaptionColor"
   UserControl_Resize
End Property

Public Property Let BorderColor(NewBorderColor As OLE_COLOR)
   m_BorderColor = NewBorderColor
   Shape1.BorderColor = BorderColor
   PropertyChanged "BorderColor"
   UserControl_Resize
End Property

Public Property Get Text() As String
   Text = m_Text
End Property

Public Property Let Text(NewText As String)
   m_Text = NewText
   Text1.Text = m_Text
   PropertyChanged "Text"
End Property

Public Property Get TextBackColor() As OLE_COLOR
   TextBackColor = m_TextBackColor
End Property

Public Property Let TextBackColor(NewTextBackColor As OLE_COLOR)
   m_TextBackColor = NewTextBackColor
   Text1.BackColor = m_TextBackColor
   Shape1.FillColor = m_TextBackColor
   Label1.BackColor = m_TextBackColor
   PropertyChanged "TextBackColor"
   UserControl_Resize
End Property

Public Property Get MaxLength() As Integer
   MaxLength = m_MaxLength
End Property

Public Property Let MaxLength(NewMaxLength As Integer)
   m_MaxLength = NewMaxLength
   Text1.MaxLength = m_MaxLength
   PropertyChanged "MaxLength"
End Property

Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
   Caption = PropBag.ReadProperty("Caption", m_def_Caption)
   BorderColor = PropBag.ReadProperty("BorderColor", m_def_BorderColor)
   TextBackColor = PropBag.ReadProperty("TextBackColor", m_def_TextBackColor)
   CaptionColor = PropBag.ReadProperty("CaptionColor", m_def_CaptionColor)
   Text = PropBag.ReadProperty("Text", m_def_Text)
   MaxLength = PropBag.ReadProperty("MaxLength", m_def_MaxLength)
End Sub

Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
   With PropBag
   Call .WriteProperty("Caption", m_Caption, m_def_Caption)
   Call .WriteProperty("BorderColor", m_BorderColor, m_def_BorderColor)
   Call .WriteProperty("TextBackColor", m_TextBackColor, m_def_TextBackColor)
   Call .WriteProperty("CaptionColor", m_CaptionColor, m_def_CaptionColor)
   Call .WriteProperty("Text", m_Text, m_def_Text)
   Call .WriteProperty("MaxLength", m_MaxLength, m_def_MaxLength)
   End With
End Sub
