VERSION 5.00
Begin VB.Form sSize 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Fake Size Adder"
   ClientHeight    =   780
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   2325
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   780
   ScaleWidth      =   2325
   StartUpPosition =   3  'Windows Default
   Begin MSI.wxpText t 
      Height          =   285
      Left            =   120
      TabIndex        =   4
      Top             =   120
      Width           =   1095
      _ExtentX        =   1931
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
   Begin MSI.cmd cmd1 
      Height          =   255
      Left            =   1200
      TabIndex        =   2
      Top             =   480
      Width           =   1095
      _ExtentX        =   1931
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
      MICON           =   "sSize.frx":0000
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   0   'False
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin VB.OptionButton Option1 
      Caption         =   "Kb"
      Height          =   315
      Left            =   1200
      TabIndex        =   1
      Top             =   120
      Width           =   495
   End
   Begin VB.OptionButton Option2 
      Caption         =   "Mb"
      Height          =   255
      Left            =   1800
      TabIndex        =   0
      Top             =   120
      Width           =   615
   End
   Begin VB.Label Label1 
      Caption         =   "Add fake size "
      Height          =   255
      Left            =   120
      TabIndex        =   3
      Top             =   480
      Width           =   1215
   End
End
Attribute VB_Name = "sSize"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmd1_Click()
  MsgBox "If you use this with EOF data this will crash crypted file!", vbInformation, "Fly Crypter v2"
  Me.Hide
End Sub
Private Sub Form_Load()
  Option1.Value = True
End Sub
