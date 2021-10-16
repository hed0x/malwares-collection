VERSION 5.00
Begin VB.Form delay 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Delayed Execution"
   ClientHeight    =   795
   ClientLeft      =   8415
   ClientTop       =   6315
   ClientWidth     =   3480
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   795
   ScaleWidth      =   3480
   Begin MSI.cmd cmd1 
      Height          =   255
      Left            =   2640
      TabIndex        =   4
      Top             =   480
      Width           =   735
      _ExtentX        =   1296
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
      MICON           =   "delay.frx":0000
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   0   'False
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin MSI.wxpText delayed 
      Height          =   285
      Left            =   120
      TabIndex        =   3
      Top             =   120
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   503
      Text            =   ""
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
   Begin VB.OptionButton Option3 
      Caption         =   "Hours"
      Height          =   255
      Left            =   2640
      TabIndex        =   2
      Top             =   120
      Width           =   735
   End
   Begin VB.OptionButton Option2 
      Caption         =   "Minutes"
      Height          =   255
      Left            =   1680
      TabIndex        =   1
      Top             =   120
      Width           =   855
   End
   Begin VB.OptionButton Option1 
      Caption         =   "Seconds"
      Height          =   255
      Left            =   720
      TabIndex        =   0
      Top             =   120
      Width           =   975
   End
   Begin VB.Label Label1 
      Caption         =   "Execute file after your custom time"
      Height          =   255
      Left            =   120
      TabIndex        =   5
      Top             =   480
      Width           =   2535
   End
End
Attribute VB_Name = "delay"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmd1_Click()
  Me.Hide
End Sub
Private Sub Form_Load()
  Option1.Enabled = True
End Sub
Private Sub Form_Unload(cancel As Integer)
  Form1.delayedexec.Checked = 0
End Sub
