VERSION 5.00
Begin VB.Form frmInput 
   BorderStyle     =   1  'Fest Einfach
   Caption         =   "Azazel"
   ClientHeight    =   1485
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   5310
   Icon            =   "Form3.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1485
   ScaleWidth      =   5310
   StartUpPosition =   2  'Bildschirmmitte
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   120
      TabIndex        =   0
      Top             =   1080
      Width           =   3855
   End
   Begin Azazel.chameleonButton chameleonButton2 
      Height          =   255
      Left            =   4080
      TabIndex        =   2
      Top             =   600
      Width           =   1095
      _ExtentX        =   1931
      _ExtentY        =   450
      BTYPE           =   3
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
      BCOL            =   16118515
      BCOLO           =   16118515
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   1
      MICON           =   "Form3.frx":08CA
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   0   'False
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Azazel.chameleonButton chameleonButton1 
      Default         =   -1  'True
      Height          =   255
      Left            =   4080
      TabIndex        =   1
      Top             =   240
      Width           =   1095
      _ExtentX        =   1931
      _ExtentY        =   450
      BTYPE           =   3
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
      BCOL            =   16118515
      BCOLO           =   16118515
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   1
      MICON           =   "Form3.frx":08E6
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   0   'False
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin VB.Label Label1 
      Caption         =   "Enter your custom:"
      Height          =   615
      Left            =   120
      TabIndex        =   3
      Top             =   240
      Width           =   3735
   End
End
Attribute VB_Name = "frmInput"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub chameleonButton1_Click()
    Text1Output = Text1.Text
    Unload Me
End Sub

Private Sub chameleonButton2_Click()
    Text1Output = "usercancel"
    Unload Me
End Sub

