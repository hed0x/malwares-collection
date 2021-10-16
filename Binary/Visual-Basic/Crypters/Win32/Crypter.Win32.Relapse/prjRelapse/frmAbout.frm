VERSION 5.00
Begin VB.Form frmAbout 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "&_About_&"
   ClientHeight    =   2760
   ClientLeft      =   2340
   ClientTop       =   1935
   ClientWidth     =   5895
   ClipControls    =   0   'False
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1905.001
   ScaleMode       =   0  'User
   ScaleWidth      =   5535.71
   ShowInTaskbar   =   0   'False
   Begin prjRelapse.SCommandButton SCommandButton1 
      Height          =   255
      Left            =   4800
      TabIndex        =   7
      Top             =   2400
      Width           =   855
      _ExtentX        =   1508
      _ExtentY        =   450
      Caption         =   "Exit"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      StyleButton     =   1
   End
   Begin prjRelapse.jcFrames jcFrames1 
      Height          =   1695
      Left            =   120
      Top             =   0
      Width           =   5655
      _ExtentX        =   9975
      _ExtentY        =   2990
      FrameColor      =   12829635
      Style           =   0
      Caption         =   "Information"
      TextColor       =   13579779
      Alignment       =   0
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ColorFrom       =   0
      ColorTo         =   0
      Begin VB.Label Label8 
         Caption         =   "Label8"
         Height          =   255
         Left            =   2040
         TabIndex        =   10
         Top             =   1320
         Width           =   1935
      End
      Begin VB.Label Label7 
         Caption         =   "skyweb07 For Write EOF"
         Height          =   255
         Left            =   1800
         TabIndex        =   9
         Top             =   1080
         Width           =   2175
      End
      Begin VB.Label Label6 
         Caption         =   "Slayer616 for Avira Bypass"
         Height          =   255
         Left            =   1560
         TabIndex        =   8
         Top             =   840
         Width           =   1935
      End
      Begin VB.Label Label5 
         Caption         =   "gfx by Shotta Blaze24"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   1320
         TabIndex        =   6
         Top             =   600
         Width           =   2175
      End
      Begin VB.Label Label4 
         Alignment       =   2  'Center
         Caption         =   "Extra Credit:"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   5
         Top             =   600
         Width           =   1095
      End
      Begin VB.Label Label3 
         Caption         =   "Coded By: The Plague"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   3600
         TabIndex        =   4
         Top             =   240
         Width           =   1935
      End
      Begin VB.Line Line4 
         X1              =   3480
         X2              =   5640
         Y1              =   600
         Y2              =   600
      End
      Begin VB.Line Line3 
         X1              =   0
         X2              =   3480
         Y1              =   480
         Y2              =   480
      End
      Begin VB.Line Line2 
         X1              =   3480
         X2              =   3480
         Y1              =   120
         Y2              =   600
      End
      Begin VB.Label Label2 
         Caption         =   "Public Version"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   2040
         TabIndex        =   3
         Top             =   240
         Width           =   1335
      End
      Begin VB.Label Label1 
         Caption         =   "This Version Is Private For:"
         Height          =   255
         Left            =   120
         TabIndex        =   2
         Top             =   240
         Width           =   1935
      End
   End
   Begin VB.PictureBox picIcon 
      AutoSize        =   -1  'True
      ClipControls    =   0   'False
      Height          =   540
      Left            =   120
      Picture         =   "frmAbout.frx":0000
      ScaleHeight     =   337.12
      ScaleMode       =   0  'User
      ScaleWidth      =   337.12
      TabIndex        =   0
      Top             =   1920
      Width           =   540
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00808080&
      BorderStyle     =   6  'Inside Solid
      Index           =   1
      X1              =   112.686
      X2              =   5296.251
      Y1              =   1242.392
      Y2              =   1242.392
   End
   Begin VB.Label lblDisclaimer 
      Caption         =   $"frmAbout.frx":030A
      ForeColor       =   &H00000000&
      Height          =   705
      Left            =   840
      TabIndex        =   1
      Top             =   1920
      Width           =   4815
   End
End
Attribute VB_Name = "frmAbout"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub SCommandButton1_Click()
Unload frmAbout
End Sub
