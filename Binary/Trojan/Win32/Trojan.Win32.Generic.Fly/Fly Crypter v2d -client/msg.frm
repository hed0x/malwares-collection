VERSION 5.00
Begin VB.Form msg 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Fly Crypter -Fake Message"
   ClientHeight    =   1590
   ClientLeft      =   7635
   ClientTop       =   4650
   ClientWidth     =   3315
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1590
   ScaleWidth      =   3315
   Begin VB.ComboBox Combo2 
      BackColor       =   &H8000000F&
      Height          =   315
      ItemData        =   "msg.frx":0000
      Left            =   720
      List            =   "msg.frx":0016
      TabIndex        =   9
      Text            =   "Ok"
      Top             =   1200
      Width           =   1815
   End
   Begin VB.ComboBox Combo1 
      BackColor       =   &H80000000&
      Height          =   315
      ItemData        =   "msg.frx":0062
      Left            =   720
      List            =   "msg.frx":0075
      TabIndex        =   8
      Text            =   "Critical"
      Top             =   840
      Width           =   1815
   End
   Begin MSI.cmd cmd2 
      Height          =   255
      Left            =   2640
      TabIndex        =   7
      Top             =   1200
      Width           =   615
      _ExtentX        =   1085
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
      MICON           =   "msg.frx":00AD
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   0   'False
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin MSI.cmd cmd1 
      Height          =   255
      Left            =   2640
      TabIndex        =   6
      Top             =   840
      Width           =   615
      _ExtentX        =   1085
      _ExtentY        =   450
      BTYPE           =   14
      TX              =   "Test"
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
      MICON           =   "msg.frx":00C9
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   0   'False
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin MSI.wxpText b 
      Height          =   285
      Left            =   600
      TabIndex        =   5
      Top             =   480
      Width           =   2655
      _ExtentX        =   4683
      _ExtentY        =   503
      Text            =   "You got owned !"
      BackColor       =   -2147483633
      BackColor       =   -2147483633
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin MSI.wxpText t 
      Height          =   285
      Left            =   600
      TabIndex        =   4
      Top             =   120
      Width           =   2655
      _ExtentX        =   4683
      _ExtentY        =   503
      Text            =   "Fly Crypter"
      BackColor       =   -2147483633
      BackColor       =   -2147483633
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.Label Label4 
      Caption         =   "Buttons"
      Height          =   255
      Left            =   120
      TabIndex        =   3
      Top             =   1200
      Width           =   615
   End
   Begin VB.Label Label3 
      Caption         =   "Type"
      Height          =   255
      Left            =   120
      TabIndex        =   2
      Top             =   840
      Width           =   495
   End
   Begin VB.Label Label2 
      Caption         =   "Body"
      Height          =   255
      Left            =   120
      TabIndex        =   1
      Top             =   480
      Width           =   495
   End
   Begin VB.Label Label1 
      Caption         =   "Title"
      Height          =   255
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   375
   End
End
Attribute VB_Name = "msg"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmd1_Click()
  Dim mType       As String
  If msg.Combo2.Text = "Ok" Then mType = 0
  If msg.Combo2.Text = "Ok,Cancel" Then mType = 1
  If msg.Combo2.Text = "Retry,Cancel" Then mType = 5
  If msg.Combo2.Text = "Yes,No" Then mType = 4
  If msg.Combo2.Text = "Yes,No,Cancel" Then mType = 3
  If msg.Combo2.Text = "Abort,Retry,Ignore" Then mType = 2
  If msg.Combo1.Text = "None" Then mType = mType + 0
  If msg.Combo1.Text = "Critical" Then mType = mType + 16
  If msg.Combo1.Text = "Question" Then mType = mType + 32
  If msg.Combo1.Text = "Exclamation" Then mType = mType + 48
  If msg.Combo1.Text = "Information" Then mType = mType + 64
  MsgBox b.Text, mType, t.Text
End Sub
Private Sub cmd2_Click()
  If t.Text = "" Or b.Text = "" Then
  Form1.fkmsg.Checked = False
  Unload Me
  End If
  Me.Hide
End Sub
Private Sub Combo1_Change()
  Combo1.Text = "Critical"
End Sub
Private Sub Combo2_Change()
  Combo2.Text = "Ok"
End Sub
Private Sub Form_Unload(cancel As Integer)
  Form1.fkmsg.Checked = 0
End Sub
