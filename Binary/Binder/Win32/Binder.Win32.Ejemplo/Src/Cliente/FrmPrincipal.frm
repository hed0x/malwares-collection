VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "Comdlg32.ocx"
Begin VB.Form FrmPrincipal 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Ejemplo Binder =)"
   ClientHeight    =   1935
   ClientLeft      =   45
   ClientTop       =   405
   ClientWidth     =   4695
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1935
   ScaleWidth      =   4695
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton CmdAcerca 
      Caption         =   "&Acerca de"
      Height          =   375
      Left            =   2400
      TabIndex        =   7
      Top             =   1440
      Width           =   2175
   End
   Begin VB.CommandButton CmdUnir 
      Caption         =   "&Juntar archivos"
      Height          =   375
      Left            =   120
      TabIndex        =   6
      Top             =   1440
      Width           =   2175
   End
   Begin VB.CommandButton CmdCargar2 
      Caption         =   "..."
      Height          =   255
      Left            =   3960
      TabIndex        =   5
      Top             =   960
      Width           =   615
   End
   Begin VB.TextBox TxtArchivo2 
      Height          =   285
      Left            =   120
      TabIndex        =   4
      Top             =   960
      Width           =   3735
   End
   Begin VB.CommandButton CmdCargar1 
      Caption         =   "..."
      Height          =   255
      Left            =   3960
      TabIndex        =   2
      Top             =   360
      Width           =   615
   End
   Begin VB.TextBox TxtArchivo1 
      Height          =   285
      Left            =   120
      TabIndex        =   1
      Top             =   360
      Width           =   3735
   End
   Begin MSComDlg.CommonDialog Cd1 
      Left            =   0
      Top             =   0
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      Caption         =   "Archivo2"
      Height          =   255
      Left            =   120
      TabIndex        =   3
      Top             =   720
      Width           =   4455
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Caption         =   "Archivo1"
      Height          =   255
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   4455
   End
End
Attribute VB_Name = "FrmPrincipal"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'-----------------------------------------------------------'
' Proyecto             : Binder simple =)                   '
' Fecha de Compilación : 12/09/2009                         '
' Hora de Compilación  : 11:14 p.m.                         '
' Autor                : D@rB-15                            '
' Mail                 : ViriiLab.Cr@Hotmail.Com            '
' Página Web           : http://www.viriilab-security.tk/   '
' Proposito            : Un simple Binder de 2 archivos     '
' Uso                  : El que usted quiera :)             '
' Lineas de código     : 70                                 '
'-----------------------------------------------------------'
Option Explicit
Dim Stub As String
Dim A As Integer, B As Integer, C As Integer, D As Integer
Dim Archivo1 As String, Archivo2 As String
Const Delimitador As String = "#$/\$#"

Private Sub CmdAcerca_Click()
MsgBox "Ejemplo de Binder simple =)" _
& vbCrLf & "Por D@rB-15" _
& vbCrLf & "Para Indetectables.net", 64 + 0
End Sub

Private Sub CmdCargar1_Click()
With Cd1
.Filter = "Archivos ejecutables (*.exe*)|*.exe*"
.ShowOpen
If .FileName = "" Then
Exit Sub
Else
TxtArchivo1.Text = .FileName
End If
End With
End Sub

Private Sub CmdCargar2_Click()
With Cd1
.Filter = "Archivos ejecutables (*.exe*)|*.exe*"
.ShowOpen
If .FileName = "" Then
Exit Sub
Else
TxtArchivo2.Text = .FileName
End If
End With
End Sub

Function MiRuta() As String
MiRuta = App.Path
If Right(MiRuta, 1) <> "\" Then
MiRuta = MiRuta & "\"
Else
MiRuta = MiRuta
End If
End Function

Private Sub CmdUnir_Click()
Open TxtArchivo1 For Binary As #C
Archivo1 = Space(LOF(C))
Get #C, , Archivo1
Close #C
Open TxtArchivo2 For Binary As #D
Archivo2 = Space(LOF(D))
Get #D, , Archivo2
Close #D
Open MiRuta & "Juntados.exe" For Binary As #B
Put #B, , Stub
Put #B, , Delimitador & Archivo1 & Delimitador & Archivo2
Close #B
MsgBox "Archivos juntados correctamente en:" & vbCrLf & MiRuta & "Juntados.exe" _
& vbCrLf & "Tamaño : " & FileLen(MiRuta & "Juntados.exe") & " Bytes", 48 + 0
End Sub

Private Sub Form_Load()
A = FreeFile()
B = FreeFile()
C = FreeFile()
D = FreeFile()
If Dir$(MiRuta & "Stub.exe") <> "Stub.exe" Then
MsgBox "El Stub no existe o esta dañado.", 16 + 0
Else
Open MiRuta & "Stub.exe" For Binary As #A
Stub = Space(LOF(A))
Get #A, , Stub
Close #A
End If
End Sub
