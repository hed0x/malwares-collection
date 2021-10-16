VERSION 5.00
Begin VB.Form frmEULA 
   Caption         =   "End User License Agreement"
   ClientHeight    =   3210
   ClientLeft      =   120
   ClientTop       =   420
   ClientWidth     =   6975
   LinkTopic       =   "Form1"
   ScaleHeight     =   3210
   ScaleWidth      =   6975
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox txtRetrieveKey 
      Height          =   285
      Left            =   6000
      TabIndex        =   4
      Top             =   3240
      Visible         =   0   'False
      Width           =   1095
   End
   Begin VB.TextBox txtOption 
      Height          =   285
      Left            =   6600
      TabIndex        =   3
      Text            =   "1"
      Top             =   2880
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.CommandButton cmdDISAGREE 
      Caption         =   "I Disagree"
      Height          =   255
      Left            =   1440
      TabIndex        =   2
      Top             =   2880
      Width           =   1215
   End
   Begin VB.CommandButton cmdAGREE 
      Caption         =   "I Agree"
      Height          =   255
      Left            =   120
      TabIndex        =   1
      Top             =   2880
      Width           =   1215
   End
   Begin VB.TextBox txtEULA 
      Appearance      =   0  'Flat
      BorderStyle     =   0  'None
      Height          =   2655
      Left            =   120
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Text            =   "frmEULA.frx":0000
      Top             =   120
      Width           =   6735
   End
End
Attribute VB_Name = "frmEULA"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdAGREE_Click()

CreateKey "HKCU\Software\Hack Hound\Rainerstoff", txtOption.Text
frmEULA.Hide
Unload frmEULA
SplashForm.Show

End Sub
Private Sub cmdDISAGREE_Click()

On Error Resume Next
DeleteKey "HKCU\Software\Hack Hound\"
Unload Me
End

End Sub

Private Sub Form_Load()

On Error Resume Next
txtRetrieveKey.Text = ReadKey("HKCU\Software\Hack Hound\Rainerstoff")
If txtRetrieveKey.Text = "1" Then
Unload frmEULA
SplashForm.Show
Else
frmEULA.Show
End If

End Sub

