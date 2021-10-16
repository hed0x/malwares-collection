VERSION 5.00
Begin VB.Form FrmErrors 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Errors"
   ClientHeight    =   3990
   ClientLeft      =   45
   ClientTop       =   450
   ClientWidth     =   7245
   ControlBox      =   0   'False
   Icon            =   "FrmErrors.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3990
   ScaleWidth      =   7245
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox ErrorMessages 
      Height          =   3255
      Left            =   120
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   0
      Top             =   120
      Width           =   6975
   End
   Begin VB.CommandButton OKCmd 
      Caption         =   "&Close"
      Default         =   -1  'True
      Height          =   375
      Left            =   6000
      TabIndex        =   1
      Top             =   3480
      Width           =   1095
   End
End
Attribute VB_Name = "FrmErrors"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()

    frmMain.StatusBar.Panels.Item(1).Text = "CyberCrypt Found errors, Loading Log..."

End Sub

Private Sub OKCmd_Click()
    
    ErrorMessages.Text = ""
    
    GetListData
    
    Unload Me
    
End Sub
