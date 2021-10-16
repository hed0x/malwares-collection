VERSION 5.00
Begin VB.Form frmBusy 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "CyberCrypt processing please wait..."
   ClientHeight    =   1830
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5160
   ControlBox      =   0   'False
   Icon            =   "frmBusy.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   MousePointer    =   11  'Hourglass
   ScaleHeight     =   1830
   ScaleWidth      =   5160
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin CyberCrypt.ctlProgress prgFile 
      Height          =   255
      Left            =   120
      TabIndex        =   2
      TabStop         =   0   'False
      Top             =   1440
      Width           =   4935
      _ExtentX        =   8705
      _ExtentY        =   450
      Appearance      =   1
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      FillColor       =   16711680
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "Complete"
      BeginProperty CaptionFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.Image ViewPic2 
      Height          =   480
      Left            =   4320
      Picture         =   "frmBusy.frx":030A
      Top             =   360
      Width           =   480
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Processing Please wait..."
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Left            =   1080
      TabIndex        =   1
      Top             =   480
      Width           =   3135
   End
   Begin VB.Label lblFile 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Height          =   435
      Left            =   0
      TabIndex        =   0
      Top             =   960
      Width           =   5115
      WordWrap        =   -1  'True
   End
   Begin VB.Image ViewPic1 
      Height          =   480
      Left            =   360
      Picture         =   "frmBusy.frx":0BD4
      Top             =   360
      Width           =   480
   End
End
Attribute VB_Name = "frmBusy"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
    frmMain.StatusBar.Panels.Item(2).Picture = frmMain.Lights.ListImages.Item(1).Picture
    frmMain.StatusBar.Panels.Item(3).Picture = frmMain.Lights.ListImages.Item(4).Picture
End Sub

Private Sub Form_Unload(Cancel As Integer)
    frmMain.ZOrder
End Sub
