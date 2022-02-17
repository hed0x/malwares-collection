   VERSION 5.00
   Begin VB.Form frmPayload
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      ClientHeight    =   12960
      ClientLeft      =   -195
      ClientTop       =   -195
      ClientWidth     =   17280
      LinkTopic       =   "Form1"
      ScaleHeight     =   12960
      ScaleWidth      =   17280
      ShowInTaskbar   =   0   'False
      Begin VB.Label Label2
         BackColor       =   &H00000000&
         Caption         =   "Jos CeNzurA"
         BeginProperty Font
            Name            =   "Arial"
            Size            =   72
            Charset         =   238
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   1695
         Left            =   1320
         TabIndex        =   2
         Top             =   4920
         Width           =   10335
      End
      Begin VB.Label Label1
         BackColor       =   &H00000000&
         Caption         =   "D.C.A."
         BeginProperty Font
            Name            =   "Arial"
            Size            =   72
            Charset         =   238
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H0080FFFF&
         Height          =   1695
         Left            =   3360
         TabIndex        =   1
         Top             =   2040
         Width           =   4455
      End
      Begin VB.Label lblTitle
         BackColor       =   &H00000000&
         Caption         =   "Freedom Manifesto anti Pilif"
         BeginProperty Font
            Name            =   "Arial"
            Size            =   20.25
            Charset         =   238
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   495
         Left            =   2760
         TabIndex        =   0
         Top             =   480
         Width           =   5775
      End
   End
   Attribute VB_Name = "frmPayload"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = False
   '================================================
   '|  Pilif ... [JOS CeNzurA]!                    |
   '|  Rott_En | Dark Coderz Alliance              |
   '|  Manifesto for the human right of expression |
   '|  No more censore!                            |
   '================================================
   Private Sub Form_Load()

   frmPayload.Height = Screen.Height
   frmPayload.Width = Screen.Width
   frmPayload.Top = 0
   frmPayload.Left = 0

   lblTitle.Top = frmPayload.Height / 6
   lblTitle.Left = frmPayload.Width / 3

   Label1.Top = frmPayload.Height / 4
   Label1.Left = frmPayload.Width / 2.7

   Label2.Top = frmPayload.Height / 2
   Label2.Left = frmPayload.Width / 4.6

   DoEvents
   End Sub

   Private Sub Form_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
       MsgBox "Feel how it is to have your basic rights taken away!"
       Unload Me
   End Sub

   '================================================
   '|  Pilif ... [JOS CeNzurA]!                    |
   '|  Rott_En | Dark Coderz Alliance              |
   '|  Manifesto for the human right of expression |
   '|  No more censore!                            |
   '================================================
