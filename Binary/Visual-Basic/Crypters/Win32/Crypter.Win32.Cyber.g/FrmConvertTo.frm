VERSION 5.00
Begin VB.Form FrmConvertTo 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Convert archive type into (Select one)"
   ClientHeight    =   5175
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5385
   ControlBox      =   0   'False
   Icon            =   "FrmConvertTo.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5175
   ScaleWidth      =   5385
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame Frame2 
      Caption         =   "Please select an archive type to convert current archive into"
      Height          =   3375
      Left            =   240
      TabIndex        =   5
      Top             =   1560
      Width           =   4935
      Begin VB.CommandButton OKCmd 
         Caption         =   "OK"
         Default         =   -1  'True
         Enabled         =   0   'False
         Height          =   375
         Left            =   3720
         TabIndex        =   1
         Top             =   2880
         Width           =   975
      End
      Begin VB.PictureBox SelObJ 
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         Height          =   1575
         Left            =   240
         ScaleHeight     =   1515
         ScaleWidth      =   4395
         TabIndex        =   6
         TabStop         =   0   'False
         Top             =   1200
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
         Caption         =   $"FrmConvertTo.frx":030A
         ForeColor       =   &H80000008&
         Height          =   585
         Left            =   240
         TabIndex        =   7
         Top             =   480
         Width           =   4530
         WordWrap        =   -1  'True
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Current archive type"
      Height          =   1215
      Left            =   240
      TabIndex        =   2
      Top             =   240
      Width           =   4935
      Begin VB.TextBox ArchiveType 
         Appearance      =   0  'Flat
         BackColor       =   &H8000000F&
         ForeColor       =   &H80000012&
         Height          =   285
         Left            =   2520
         Locked          =   -1  'True
         TabIndex        =   0
         Top             =   720
         Width           =   2295
      End
      Begin VB.PictureBox PictImage 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BorderStyle     =   0  'None
         Height          =   615
         Left            =   240
         ScaleHeight     =   615
         ScaleWidth      =   615
         TabIndex        =   3
         TabStop         =   0   'False
         Top             =   360
         Width           =   615
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Current archive type:"
         Height          =   195
         Left            =   960
         TabIndex        =   4
         Top             =   720
         Width           =   1470
      End
   End
End
Attribute VB_Name = "FrmConvertTo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()

    If CompressionAgentA = False And EncryptionAgentA = False And SwapAgentA = False Then PictImage.Picture = frmMain.ImageList.ListImages.Item(8).Picture: ArchiveType.Text = "Non-Compression archive"
    If CompressionAgentA = True Then PictImage.Picture = frmMain.ImageList.ListImages.Item(9).Picture: ArchiveType.Text = "Compression archive"
    If EncryptionAgentA = True Then PictImage.Picture = frmMain.ImageList.ListImages.Item(13).Picture: ArchiveType.Text = "Algorithm encryption archive"
    If SwapAgentA = True Then PictImage.Picture = frmMain.ImageList.ListImages.Item(14).Picture: ArchiveType.Text = "Swap archive"

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

End Sub

Private Sub OKCmd_Click()
    
    For M = 0 To PicImage.Count - 1
        If PicImage.Item(M).BorderStyle = 1 Then
            Select Case M
                Case 0:  CompressionAgentA = False: EncryptionAgentA = False: SwapAgentA = False
                Case 1: CompressionAgentA = True: EncryptionAgentA = False: SwapAgentA = False
                Case 2: EncryptionAgentA = True: CompressionAgentA = False: SwapAgentA = False
                Case 3: SwapAgentA = True: EncryptionAgentA = False: CompressionAgentA = False
               End Select
            Exit For
        End If
    Next M
    
    Unload Me
    
End Sub

Private Sub PicImage_Click(Index As Integer)
    For M = 0 To PicImage.Count - 1
        PicImage.Item(M).BorderStyle = 0
    Next M
    PicImage.Item(Index).BorderStyle = 1
    If Index = 0 Then Me.Caption = "Convert archive type into (Non-Compression archive)"
    If Index = 1 Then Me.Caption = "Convert archive type into (Compression archive)"
    If Index = 2 Then Me.Caption = "Convert archive type into (Algorithm encryption archive)"
    If Index = 3 Then Me.Caption = "Convert archive type into (Swap archive)"
    OKCmd.Enabled = True
End Sub
