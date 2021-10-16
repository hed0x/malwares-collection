VERSION 5.00
Begin VB.Form FrmSplash 
   AutoRedraw      =   -1  'True
   BorderStyle     =   1  'Fixed Single
   ClientHeight    =   4290
   ClientLeft      =   15
   ClientTop       =   15
   ClientWidth     =   5745
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   Icon            =   "FrmSplash.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "FrmSplash.frx":030A
   ScaleHeight     =   4290
   ScaleWidth      =   5745
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.Timer Timer 
      Interval        =   3000
      Left            =   0
      Top             =   0
   End
   Begin VB.Label lblProgress 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Please wait while CyberCrypt loads..."
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   2400
      TabIndex        =   0
      Top             =   3000
      Width           =   3150
   End
End
Attribute VB_Name = "FrmSplash"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
    If App.PrevInstance = True And Command = "" Then
        Timer.Enabled = False
        frmMain.Show
    End If
End Sub

Private Sub Timer_Timer()
    Timer.Enabled = False
    If App.PrevInstance = False Then LoadTip FrmTips.lblTip: LoadTips
    frmMain.Show
End Sub
