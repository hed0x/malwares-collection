VERSION 5.00
Begin VB.Form eof 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Fly Crypter -EOF data saver"
   ClientHeight    =   1485
   ClientLeft      =   6930
   ClientTop       =   6150
   ClientWidth     =   3765
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   OLEDropMode     =   1  'Manual
   ScaleHeight     =   1485
   ScaleWidth      =   3765
   Begin MSI.cmd cmd2 
      Height          =   255
      Left            =   3360
      TabIndex        =   5
      Top             =   840
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   450
      BTYPE           =   14
      TX              =   "..."
      ENAB            =   -1  'True
      BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   13160660
      BCOLO           =   13160660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   1
      MICON           =   "eof.frx":0000
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   0   'False
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin MSI.cmd cmd1 
      Height          =   255
      Left            =   3360
      TabIndex        =   4
      Top             =   120
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   450
      BTYPE           =   14
      TX              =   "..."
      ENAB            =   -1  'True
      BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   13160660
      BCOLO           =   13160660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   1
      MICON           =   "eof.frx":001C
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   0   'False
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin MSI.wxpText feof 
      Height          =   285
      Left            =   1200
      TabIndex        =   2
      Top             =   120
      Width           =   2055
      _ExtentX        =   3625
      _ExtentY        =   503
      Text            =   "Select your file with eof ..."
      BackColor       =   -2147483633
      BackColor       =   -2147483633
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin MSI.wxpText cfl 
      Height          =   285
      Left            =   1200
      TabIndex        =   3
      Top             =   840
      Width           =   2055
      _ExtentX        =   3625
      _ExtentY        =   503
      Text            =   "Select your crypted file ..."
      BackColor       =   -2147483633
      BackColor       =   -2147483633
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin MSI.cmd cmd3 
      Height          =   255
      Left            =   120
      TabIndex        =   6
      Top             =   1200
      Width           =   3615
      _ExtentX        =   6376
      _ExtentY        =   450
      BTYPE           =   14
      TX              =   "Save EOF"
      ENAB            =   -1  'True
      BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   13160660
      BCOLO           =   13160660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   1
      MICON           =   "eof.frx":0038
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   0   'False
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin MSI.wxpText ed 
      Height          =   285
      Left            =   1200
      TabIndex        =   8
      Top             =   480
      Width           =   2535
      _ExtentX        =   4471
      _ExtentY        =   503
      Text            =   ""
      BackColor       =   -2147483633
      BackColor       =   -2147483633
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.Label Label3 
      Caption         =   "Eof data"
      DragMode        =   1  'Automatic
      Height          =   255
      Left            =   120
      OLEDropMode     =   1  'Manual
      TabIndex        =   7
      Top             =   480
      Width           =   855
   End
   Begin VB.Label Label1 
      Caption         =   "Crypted file"
      DragMode        =   1  'Automatic
      Height          =   255
      Left            =   120
      OLEDropMode     =   1  'Manual
      TabIndex        =   1
      Top             =   840
      Width           =   855
   End
   Begin VB.Label Label2 
      Caption         =   "File with eof"
      Height          =   255
      Left            =   120
      OLEDropMode     =   1  'Manual
      TabIndex        =   0
      Top             =   120
      Width           =   975
   End
End
Attribute VB_Name = "eof"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim fl       As String
Private Sub cmd1_Click()
  Dim lEd       As String
  fl = ""
  fl = GetFileName(fl, "PE files(*.exe)|*.exe", "Select your file with eof data", True)
  If Not fl <> "" Then Exit Sub
  feof.Text = fl
  lEd = rEOF(feof.Text)
  If lEd = "" Then
  ed.Text = "No eof data"
  cmd3.Enabled = False
  Else
  ed.Text = lEd
  cmd3.Enabled = True
  End If
End Sub
Private Sub cmd2_Click()
  fl = ""
  fl = GetFileName(fl, "PE files(*.exe)|*.exe", "Select your crypted file", True)
  If Not fl <> "" Then Exit Sub
  cfl.Text = fl
End Sub
Private Sub cmd3_Click()
  If Dir(cfl.Text) = "" Then Exit Sub
  sEOF feof.Text, cfl.Text
End Sub
Private Sub Form_Load()
  cmd3.Enabled = False
End Sub
Public Function rEOF(sInput As String) As String
  On Error GoTo err:
  Dim sB As String
  Dim n As Integer
  Dim sFB As String, sEh As String, sChar As String
  Dim lFF As Long, lPos As Long, lPos2 As Long, lCount As Long
  If Dir(sInput) = "" Then GoTo err
  lFF = FreeFile
  Open sInput For Binary As #lFF
  sFB = Space(LOF(lFF))
  Get #lFF, , sFB
  Close #lFF
  For n = 1 To 30
  sB = sB & Chr(0)
  Next
  lPos = InStr(1, StrReverse(sFB), sB)
  sEh = (Mid$(StrReverse(sFB), 1, lPos - 1))
  rEOF = StrReverse(sEh)
  Exit Function
err: rEOF = vbNullString
End Function
Public Function sEOF(sInput As String, sOut As String) As Long
  On Error Resume Next
  Dim sBuf As String
  Dim I As Integer
  Dim iFile As Long, lPos As Long, lPos2 As Long, lCount As Long
  Dim sFB As String, sEh As String, sChar As String, lsEOF As String, FB As String
  If Dir(sInput) = "" Then Exit Function
  If Dir(sOut) = "" Then Exit Function
  iFile = FreeFile
  Open sInput For Binary As #iFile
  sFB = Space(LOF(iFile))
  Get #iFile, , sFB
  Close #iFile
  For I = 1 To 30
  sBuf = sBuf & Chr(0)
  Next
  lPos = InStr(1, StrReverse(sFB), sBuf)
  sEh = (Mid$(StrReverse(sFB), 1, lPos - 1))
  lsEOF = StrReverse(sEh)
  Open sOut For Binary As #iFile
  FB = Space(LOF(iFile))
  Get #iFile, , FB
  Close #iFile
  Open sOut For Binary As #iFile
  Put #iFile, , FB & lsEOF
  Close #iFile
  MsgBox "EOF Data Saved!", vbInformation, "EOF Data Saver (c)hackhound.org"
End Function
Private Sub Form_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
  On Error Resume Next
  feof.Text = Data.Files(1)
  If rEOF(Data.Files(1)) = "" Then
  ed.Text = "No eof data"
  cmd3.Enabled = False
  Else
  ed.Text = rEOF(Data.Files(1))
  cmd3.Enabled = True
  End If
End Sub
Private Sub Label1_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
  On Error Resume Next
  feof.Text = Data.Files(1)
  If rEOF(Data.Files(1)) = "" Then
  ed.Text = "No eof data"
  cmd3.Enabled = False
  Else
  ed.Text = rEOF(Data.Files(1))
  cmd3.Enabled = True
  End If
End Sub
Private Sub Label2_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
  On Error Resume Next
  feof.Text = Data.Files(1)
  If rEOF(Data.Files(1)) = "" Then
  ed.Text = "No eof data"
  cmd3.Enabled = False
  Else
  ed.Text = rEOF(Data.Files(1))
  cmd3.Enabled = True
  End If
End Sub
Private Sub Label3_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
  On Error Resume Next
  feof.Text = Data.Files(1)
  If rEOF(Data.Files(1)) = "" Then
  ed.Text = "No eof data"
  cmd3.Enabled = False
  Else
  ed.Text = rEOF(Data.Files(1))
  cmd3.Enabled = True
  End If
End Sub
