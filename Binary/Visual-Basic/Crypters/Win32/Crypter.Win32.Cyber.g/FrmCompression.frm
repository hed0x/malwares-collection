VERSION 5.00
Begin VB.Form FrmCompression 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Compression"
   ClientHeight    =   3630
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4830
   Icon            =   "FrmCompression.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3630
   ScaleWidth      =   4830
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton OKCmd 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   375
      Left            =   3600
      TabIndex        =   6
      Top             =   3120
      Width           =   975
   End
   Begin VB.Frame Frame1 
      Caption         =   "Compression options"
      Height          =   2655
      Left            =   240
      TabIndex        =   7
      Top             =   240
      Width           =   4335
      Begin VB.OptionButton CmOpt01 
         Caption         =   "No compression"
         Height          =   375
         Index           =   5
         Left            =   120
         TabIndex        =   5
         Top             =   2160
         Width           =   4095
      End
      Begin VB.OptionButton CmOpt01 
         Caption         =   "Low compression (Fastest)"
         Height          =   375
         Index           =   4
         Left            =   120
         TabIndex        =   4
         Top             =   1800
         Width           =   4095
      End
      Begin VB.OptionButton CmOpt01 
         Caption         =   "Light compression (Fast)"
         Height          =   375
         Index           =   3
         Left            =   120
         TabIndex        =   3
         Top             =   1440
         Width           =   4095
      End
      Begin VB.OptionButton CmOpt01 
         Caption         =   "Medium compression (Normal)"
         Height          =   375
         Index           =   2
         Left            =   120
         TabIndex        =   2
         Top             =   1080
         Value           =   -1  'True
         Width           =   4095
      End
      Begin VB.OptionButton CmOpt01 
         Caption         =   "High compression (Slow)"
         Height          =   375
         Index           =   1
         Left            =   120
         TabIndex        =   1
         Top             =   720
         Width           =   4095
      End
      Begin VB.OptionButton CmOpt01 
         Caption         =   "Highest compression (Slowest)"
         Height          =   375
         Index           =   0
         Left            =   120
         TabIndex        =   0
         Top             =   360
         Width           =   4095
      End
   End
End
Attribute VB_Name = "FrmCompression"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
    If CompressionLevel = 9 Then CmOpt01.Item(0).Value = True
    If CompressionLevel = 6 Then CmOpt01.Item(1).Value = True
    If CompressionLevel = -1 Then CmOpt01.Item(2).Value = True
    If CompressionLevel = 3 Then CmOpt01.Item(3).Value = True
    If CompressionLevel = 1 Then CmOpt01.Item(4).Value = True
    If CompressionLevel = 0 Then CmOpt01.Item(5).Value = True
End Sub

Private Sub OKCmd_Click()
    For M = 0 To CmOpt01.Count - 1
        If CmOpt01.Item(M).Value = True Then
            WritePrivateProfileString "Compression", "Level", CStr(ChkCompressLvl(CInt(M))), App.Path & "\Settings.ini"
            Exit For
        End If
    Next M
    Unload Me
End Sub
