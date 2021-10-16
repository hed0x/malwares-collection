VERSION 5.00
Begin VB.Form FrmConvertLoader 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Please wait..."
   ClientHeight    =   2055
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4575
   ControlBox      =   0   'False
   Icon            =   "FrmConvertLoader.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2055
   ScaleWidth      =   4575
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame Frame1 
      Height          =   1815
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   4335
      Begin VB.CommandButton OKCmd 
         Caption         =   "&OK"
         Default         =   -1  'True
         Enabled         =   0   'False
         Height          =   375
         Left            =   3000
         TabIndex        =   2
         Top             =   1320
         Width           =   1215
      End
      Begin CyberCrypt.ctlProgress ProgressBar 
         Height          =   255
         Left            =   120
         TabIndex        =   4
         TabStop         =   0   'False
         Top             =   1440
         Width           =   2775
         _ExtentX        =   4895
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
      Begin VB.Label lblPr 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Processing files..."
         Height          =   195
         Left            =   120
         TabIndex        =   3
         Top             =   960
         Width           =   1230
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Please wait while CyberCrypt converts the old archive into a newer version and update data which is stored inside the file."
         Height          =   585
         Left            =   120
         TabIndex        =   1
         Top             =   240
         Width           =   4140
         WordWrap        =   -1  'True
      End
   End
End
Attribute VB_Name = "FrmConvertLoader"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub OKCmd_Click()
    frmMain.Visible = True
    frmMain.StatusBar.Panels.Item(2).Picture = frmMain.Lights.ListImages.Item(2).Picture
    frmMain.StatusBar.Panels.Item(3).Picture = frmMain.Lights.ListImages.Item(1).Picture
    Unload Me
    frmMain.CyTOpen ArchName
End Sub
