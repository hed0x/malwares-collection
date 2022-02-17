VERSION 5.00
Begin VB.Form custom 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Custom stub adder"
   ClientHeight    =   1545
   ClientLeft      =   7890
   ClientTop       =   6795
   ClientWidth     =   4485
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1545
   ScaleWidth      =   4485
   Begin VB.TextBox l1 
      BackColor       =   &H8000000F&
      Height          =   285
      Left            =   840
      TabIndex        =   12
      Top             =   840
      Width           =   2655
   End
   Begin VB.TextBox l2 
      BackColor       =   &H8000000F&
      Height          =   285
      Left            =   840
      TabIndex        =   11
      Top             =   1200
      Width           =   2655
   End
   Begin VB.OptionButton Option7 
      Caption         =   "AES"
      Height          =   255
      Left            =   2400
      TabIndex        =   10
      Top             =   120
      Width           =   615
   End
   Begin VB.Frame Frame1 
      BorderStyle     =   0  'None
      Height          =   255
      Left            =   1440
      TabIndex        =   6
      Top             =   480
      Width           =   3015
      Begin VB.OptionButton Option6 
         Caption         =   "3(hard)"
         Height          =   255
         Left            =   2160
         TabIndex        =   9
         Top             =   0
         Width           =   855
      End
      Begin VB.OptionButton Option5 
         Caption         =   "2(medium)"
         Height          =   255
         Left            =   960
         TabIndex        =   8
         Top             =   0
         Width           =   1095
      End
      Begin VB.OptionButton Option4 
         Caption         =   "1(slow)"
         Height          =   255
         Left            =   0
         TabIndex        =   7
         Top             =   0
         Width           =   975
      End
   End
   Begin MSI.cmd cmd1 
      Height          =   255
      Left            =   3600
      TabIndex        =   3
      Top             =   1200
      Width           =   855
      _ExtentX        =   1508
      _ExtentY        =   450
      BTYPE           =   14
      TX              =   "Ok"
      ENAB            =   -1  'True
      BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   13160660
      BCOLO           =   13160660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   1
      MICON           =   "custom.frx":0000
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   0   'False
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin VB.OptionButton Option3 
      Caption         =   "Xor"
      Height          =   255
      Left            =   3840
      TabIndex        =   2
      Top             =   120
      Width           =   615
   End
   Begin VB.OptionButton Option2 
      Caption         =   "Rc4"
      Height          =   255
      Left            =   3120
      TabIndex        =   1
      Top             =   120
      Width           =   615
   End
   Begin VB.OptionButton Option1 
      Caption         =   "Blowfish"
      Height          =   255
      Left            =   1440
      TabIndex        =   0
      Top             =   120
      Width           =   975
   End
   Begin MSI.cmd cmd2 
      Height          =   255
      Left            =   3600
      TabIndex        =   15
      Top             =   840
      Width           =   855
      _ExtentX        =   1508
      _ExtentY        =   450
      BTYPE           =   14
      TX              =   "Cancel"
      ENAB            =   -1  'True
      BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   13160660
      BCOLO           =   13160660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   1
      MICON           =   "custom.frx":001C
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   0   'False
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin VB.Label Label6 
      Caption         =   "Limiter 1"
      Height          =   255
      Left            =   120
      TabIndex        =   14
      Top             =   840
      Width           =   735
   End
   Begin VB.Label Label7 
      Caption         =   "Limiter 2"
      Height          =   255
      Left            =   120
      TabIndex        =   13
      Top             =   1200
      Width           =   735
   End
   Begin VB.Label Label2 
      Caption         =   "Stub encryption"
      Height          =   255
      Left            =   120
      TabIndex        =   5
      Top             =   120
      Width           =   1215
   End
   Begin VB.Label Label1 
      Caption         =   "Passwords level"
      Height          =   255
      Left            =   120
      TabIndex        =   4
      Top             =   480
      Width           =   1215
   End
End
Attribute VB_Name = "custom"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmd1_Click()
  If l1.Text = "" Then MsgBox "Please put limiter 1 !", 16, "Fly Crypter": Exit Sub
  If l2.Text = "" Then MsgBox "Please put limiter 2 !", 16, "Fly Crypter": Exit Sub
  Me.Hide
End Sub
Private Sub cmd2_Click()
  Form1.custstub.Checked = False
  Unload custom
End Sub
Private Sub Form_Load()
  Option1.Value = 1
  Option4.Value = 1
End Sub
