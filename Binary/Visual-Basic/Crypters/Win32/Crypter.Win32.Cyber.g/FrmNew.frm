VERSION 5.00
Begin VB.Form FrmNew 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "New archive type (Select one)"
   ClientHeight    =   2880
   ClientLeft      =   45
   ClientTop       =   450
   ClientWidth     =   4680
   ControlBox      =   0   'False
   Icon            =   "FrmNew.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2880
   ScaleWidth      =   4680
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton OKCmd 
      Caption         =   "OK"
      Default         =   -1  'True
      Enabled         =   0   'False
      Height          =   375
      Left            =   3600
      TabIndex        =   1
      Top             =   2400
      Width           =   975
   End
   Begin VB.PictureBox SelObJ 
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      Height          =   1575
      Left            =   120
      ScaleHeight     =   1515
      ScaleWidth      =   4395
      TabIndex        =   0
      TabStop         =   0   'False
      Top             =   120
      Width           =   4455
      Begin VB.Image PicImage 
         Appearance      =   0  'Flat
         Enabled         =   0   'False
         Height          =   615
         Index           =   11
         Left            =   3720
         Top             =   840
         Width           =   615
      End
      Begin VB.Image PicImage 
         Appearance      =   0  'Flat
         Enabled         =   0   'False
         Height          =   615
         Index           =   10
         Left            =   3000
         Top             =   840
         Width           =   615
      End
      Begin VB.Image PicImage 
         Appearance      =   0  'Flat
         Enabled         =   0   'False
         Height          =   615
         Index           =   9
         Left            =   2280
         Top             =   840
         Width           =   615
      End
      Begin VB.Image PicImage 
         Appearance      =   0  'Flat
         Enabled         =   0   'False
         Height          =   615
         Index           =   8
         Left            =   1560
         Top             =   840
         Width           =   615
      End
      Begin VB.Image PicImage 
         Appearance      =   0  'Flat
         Enabled         =   0   'False
         Height          =   615
         Index           =   7
         Left            =   840
         Top             =   840
         Width           =   615
      End
      Begin VB.Image PicImage 
         Appearance      =   0  'Flat
         Enabled         =   0   'False
         Height          =   615
         Index           =   6
         Left            =   120
         Top             =   840
         Width           =   615
      End
      Begin VB.Image PicImage 
         Appearance      =   0  'Flat
         Enabled         =   0   'False
         Height          =   615
         Index           =   5
         Left            =   3720
         Top             =   120
         Width           =   615
      End
      Begin VB.Image PicImage 
         Appearance      =   0  'Flat
         Enabled         =   0   'False
         Height          =   615
         Index           =   4
         Left            =   3000
         Top             =   120
         Width           =   615
      End
      Begin VB.Image PicImage 
         Appearance      =   0  'Flat
         Enabled         =   0   'False
         Height          =   615
         Index           =   3
         Left            =   2280
         Top             =   120
         Width           =   615
      End
      Begin VB.Image PicImage 
         Appearance      =   0  'Flat
         Enabled         =   0   'False
         Height          =   615
         Index           =   2
         Left            =   1560
         Top             =   120
         Width           =   615
      End
      Begin VB.Image PicImage 
         Appearance      =   0  'Flat
         Enabled         =   0   'False
         Height          =   615
         Index           =   1
         Left            =   840
         Top             =   120
         Width           =   615
      End
      Begin VB.Image PicImage 
         Appearance      =   0  'Flat
         Enabled         =   0   'False
         Height          =   615
         Index           =   0
         Left            =   120
         Top             =   120
         Width           =   615
      End
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      Caption         =   "Select one of the archive types above to see what the type does in the form caption, then select OK."
      ForeColor       =   &H80000008&
      Height          =   390
      Left            =   120
      TabIndex        =   2
      Top             =   1800
      Width           =   4365
      WordWrap        =   -1  'True
   End
End
Attribute VB_Name = "FrmNew"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()

    PicImage.Item(0).Picture = frmMain.ImageList.ListImages.Item(8).Picture
    PicImage.Item(1).Picture = frmMain.ImageList.ListImages.Item(9).Picture
    PicImage.Item(2).Picture = frmMain.ImageList.ListImages.Item(13).Picture
    PicImage.Item(3).Picture = frmMain.ImageList.ListImages.Item(14).Picture

    PicImage.Item(0).ToolTipText = "CyberCrypt Non-Compression archive"
    PicImage.Item(1).ToolTipText = "CyberCrypt Compression archive"
    PicImage.Item(2).ToolTipText = "CyberCrypt Algorithm encryption archive"
    PicImage.Item(3).ToolTipText = "CyberCrypt Swap archive"
    
    PicImage.Item(0).Enabled = True
    PicImage.Item(1).Enabled = True
    PicImage.Item(2).Enabled = True
    PicImage.Item(3).Enabled = True
    
    ChkNewResult = 0
    
    PicImage_Click 0

End Sub

Private Sub OKCmd_Click()
    
    For M = 0 To PicImage.Count - 1
        If PicImage.Item(M).BorderStyle = 1 Then ChkNewResult = M: Exit For
    Next M
    
    Unload Me
    
End Sub

Private Sub PicImage_Click(Index As Integer)
    For M = 0 To PicImage.Count - 1
        PicImage.Item(M).BorderStyle = 0
    Next M
    PicImage.Item(Index).BorderStyle = 1
    If Index = 0 Then Me.Caption = "New archive type (Non-Compression archive)"
    If Index = 1 Then Me.Caption = "New archive type (Compression archive)"
    If Index = 2 Then Me.Caption = "New archive type (Algorithm encryption archive)"
    If Index = 3 Then Me.Caption = "New archive type (Swap archive)"
    OKCmd.Enabled = True
End Sub
