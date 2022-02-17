VERSION 5.00
Begin VB.Form section 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "PE section"
   ClientHeight    =   1500
   ClientLeft      =   8280
   ClientTop       =   4005
   ClientWidth     =   2355
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1500
   ScaleWidth      =   2355
   Begin MSI.cmd cmd1 
      Height          =   255
      Left            =   1440
      TabIndex        =   4
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
      MICON           =   "section.frx":0000
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   0   'False
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin MSI.wxpText sname 
      Height          =   285
      Left            =   720
      TabIndex        =   2
      Top             =   120
      Width           =   1575
      _ExtentX        =   2778
      _ExtentY        =   503
      Text            =   ".bunnnn"
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
   Begin MSI.wxpText size 
      Height          =   285
      Left            =   720
      TabIndex        =   3
      Top             =   480
      Width           =   1575
      _ExtentX        =   2778
      _ExtentY        =   503
      Text            =   "500"
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
   Begin MSI.wxpText ch 
      Height          =   285
      Left            =   1200
      TabIndex        =   5
      Top             =   840
      Width           =   1095
      _ExtentX        =   1931
      _ExtentY        =   503
      Text            =   "&H60000020"
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
   Begin VB.Label Label3 
      Caption         =   "Characteristics"
      Height          =   255
      Left            =   120
      TabIndex        =   6
      Top             =   840
      Width           =   1095
   End
   Begin VB.Label Label2 
      Caption         =   "Size"
      Height          =   255
      Left            =   120
      TabIndex        =   1
      Top             =   480
      Width           =   495
   End
   Begin VB.Label Label1 
      Caption         =   "Name"
      Height          =   255
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   615
   End
End
Attribute VB_Name = "section"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmd1_Click()
  If sname.Text = "" Then
  sname.Text = "." & lRan(RandomNumber)
  End If
  If size.Text = "" Then
  size.Text = RandomNumber & RandomNumber
  End If
  If Left(sname.Text, 1) <> "." Then
  sname.Text = "." & sname.Text
  End If
  Me.Hide
End Sub
Private Sub Form_Unload(cancel As Integer)
  Form1.psec.Checked = 0
End Sub
