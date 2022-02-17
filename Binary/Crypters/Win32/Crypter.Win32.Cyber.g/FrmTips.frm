VERSION 5.00
Begin VB.Form FrmTips 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "CyberCrypt Tip of the Day"
   ClientHeight    =   3225
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5040
   Icon            =   "FrmTips.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3225
   ScaleWidth      =   5040
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton NextTip 
      Caption         =   "&Next Tip"
      Height          =   375
      Left            =   2640
      TabIndex        =   1
      Top             =   2760
      Width           =   1095
   End
   Begin VB.CheckBox TipChk 
      Caption         =   "Show tips at startup"
      Height          =   255
      Left            =   120
      MaskColor       =   &H8000000F&
      TabIndex        =   0
      Top             =   2760
      Value           =   1  'Checked
      Width           =   1695
   End
   Begin VB.CommandButton CloseCmd 
      Caption         =   "&Close"
      Default         =   -1  'True
      Height          =   375
      Left            =   3840
      TabIndex        =   2
      Top             =   2760
      Width           =   1095
   End
   Begin VB.PictureBox TipBack 
      Height          =   2505
      Left            =   120
      Picture         =   "FrmTips.frx":030A
      ScaleHeight     =   2445
      ScaleWidth      =   4740
      TabIndex        =   3
      TabStop         =   0   'False
      Top             =   120
      Width           =   4800
      Begin VB.Label lblTip 
         BackStyle       =   0  'Transparent
         Caption         =   "<Tip>"
         ForeColor       =   &H00000000&
         Height          =   1815
         Left            =   1320
         TabIndex        =   5
         Top             =   480
         Width           =   3255
         WordWrap        =   -1  'True
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Did you know..."
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   18
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   435
         Left            =   1200
         TabIndex        =   4
         Top             =   0
         Width           =   2430
      End
      Begin VB.Line Line1 
         BorderColor     =   &H00000000&
         X1              =   1200
         X2              =   4800
         Y1              =   360
         Y2              =   360
      End
   End
End
Attribute VB_Name = "FrmTips"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim LoadResult As String
Dim lLength As Integer

Private Sub CloseCmd_Click()
    Unload Me
End Sub

Private Sub Form_Unload(Cancel As Integer)
    WritePrivateProfileString "TipSettings", "Report", CStr(TipChk.Value), App.Path & "\Settings.ini"
End Sub

Private Sub Form_Load()
    
    If FileExist(App.Path & "\Settings.ini") = False Then LoadTip lblTip: Exit Sub
        
    LoadResult = String(100, "*")
    lLength = Len(LoadResult)
    
    GetPrivateProfileString "TipSettings", "Report", vbNullString, LoadResult, lLength, App.Path & "\Settings.ini"
    LoadResult = Mid(LoadResult, 1, InStr(1, LoadResult, Chr$(0)) - 1)
    If LoadResult = "0" Then
        TipChk.Value = Unchecked
        If LoadProg = True Then LoadTip lblTip: Exit Sub
        Unload Me
        Exit Sub
    End If
       
    LoadTip lblTip
    
End Sub

Private Sub NextTip_Click()
    LoadTip lblTip
End Sub
