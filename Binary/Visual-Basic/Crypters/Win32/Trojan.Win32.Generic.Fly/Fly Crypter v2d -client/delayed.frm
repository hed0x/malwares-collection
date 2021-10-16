VERSION 5.00
Begin VB.Form delayed 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Delayed Execution"
   ClientHeight    =   765
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   3540
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   765
   ScaleWidth      =   3540
   StartUpPosition =   3  'Windows Default
   Begin MSI.cmd cmd1 
      Height          =   255
      Left            =   2880
      TabIndex        =   4
      Top             =   480
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
      MICON           =   "delayed.frx":0000
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
      Caption         =   "Seconds"
      Height          =   255
      Left            =   720
      TabIndex        =   3
      Top             =   120
      Width           =   975
   End
   Begin VB.OptionButton Option2 
      Caption         =   "Minutes"
      Height          =   255
      Left            =   1800
      TabIndex        =   2
      Top             =   120
      Width           =   855
   End
   Begin VB.OptionButton Option1 
      Caption         =   "Hours"
      Height          =   255
      Left            =   2760
      TabIndex        =   1
      Top             =   120
      Width           =   735
   End
   Begin MSI.wxpText delay 
      Height          =   285
      Left            =   120
      TabIndex        =   0
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
   Begin VB.Label Label1 
      Caption         =   "After file run sleep your custom time"
      Height          =   255
      Left            =   120
      TabIndex        =   5
      Top             =   480
      Width           =   2655
   End
End
Attribute VB_Name = "delayed"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmd1_Click()
  Me.Hide
End Sub
Private Sub Form_Load()
  Option2.Value = True
End Sub
