VERSION 5.00
Begin VB.Form FrmUtility01 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Encryption Utility"
   ClientHeight    =   3255
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5775
   Icon            =   "FrmUtility01.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3255
   ScaleWidth      =   5775
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.PictureBox Picture1 
      Height          =   255
      Left            =   120
      ScaleHeight     =   195
      ScaleWidth      =   5475
      TabIndex        =   4
      TabStop         =   0   'False
      Top             =   2400
      Width           =   5535
      Begin VB.Label PgrLabel 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "0%"
         Height          =   195
         Left            =   2520
         TabIndex        =   5
         Top             =   0
         Width           =   210
      End
      Begin VB.Image Image1 
         Height          =   240
         Left            =   0
         Picture         =   "FrmUtility01.frx":030A
         Top             =   0
         Width           =   7275
      End
   End
   Begin VB.CommandButton CmdCrypt 
      Caption         =   "Encrypt / Decrypt"
      Height          =   375
      Left            =   2760
      TabIndex        =   1
      Top             =   2760
      Width           =   1575
   End
   Begin VB.CommandButton OKCmd 
      Caption         =   "E&xit"
      Height          =   375
      Left            =   4440
      TabIndex        =   2
      Top             =   2760
      Width           =   1215
   End
   Begin VB.TextBox CryptText 
      Height          =   1815
      Left            =   120
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   0
      Top             =   480
      Width           =   5535
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Enter here what you want to Encrypt / Decrypt:"
      Height          =   195
      Left            =   120
      TabIndex        =   3
      Top             =   120
      Width           =   3345
   End
End
Attribute VB_Name = "FrmUtility01"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub CmdCrypt_Click()
    CryptText.Text = Converter(CryptText.Text)
End Sub

Private Function FindOppAsc(Value As Integer) As Integer
    If Value <> 128 Then
        FindOppAsc = 255 - Value
    Else
        FindOppAsc = Value
    End If
End Function

Private Function Converter(xString As String) As String
    On Error GoTo FinaliseError
    For cCode = 1 To Len(xString)
        conv = conv + (100 / Len(xString))
        PgrLabel.Caption = CLng(conv) & "%"
        Image1.Width = (Picture1.Width / Len(xString)) * conv * (Len(xString) / 100)
        Converter = Converter + Chr(FindOppAsc(Asc(Mid(xString, CInt(cCode), 1))))
    Next cCode
    Form_Load
    Exit Function
FinaliseError:
    MsgBox "Error, the string that was meant be be coded / decoded was too long.", vbCritical, "Error"
End Function

Private Sub Form_Load()
    Image1.Width = 0
End Sub

Private Sub OKCmd_Click()
    Unload Me
End Sub
