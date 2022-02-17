VERSION 5.00
Begin VB.Form frmMsg 
   BackColor       =   &H00404040&
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "                Mensaje Fake"
   ClientHeight    =   6120
   ClientLeft      =   5760
   ClientTop       =   2910
   ClientWidth     =   2910
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6120
   ScaleWidth      =   2910
   ShowInTaskbar   =   0   'False
   Begin VB.Frame Frame2 
      BackColor       =   &H00404040&
      Caption         =   "Configuración"
      ForeColor       =   &H00FFFFFF&
      Height          =   3735
      Left            =   120
      TabIndex        =   8
      Top             =   2280
      Width           =   2655
      Begin VB.TextBox Text8 
         Appearance      =   0  'Flat
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   120
         TabIndex        =   10
         Top             =   600
         Width           =   1455
      End
      Begin VB.TextBox Text7 
         Appearance      =   0  'Flat
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1815
         Left            =   120
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   9
         Top             =   1320
         Width           =   2295
      End
      Begin Proyecto1.Button cmdTest 
         Height          =   375
         Left            =   120
         TabIndex        =   11
         Top             =   3240
         Width           =   1095
         _ExtentX        =   1931
         _ExtentY        =   661
         ButtonStyle     =   7
         PictureAlignment=   1
         BackColor       =   14211288
         BackColorPressed=   15715986
         BackColorHover  =   16243621
         BorderColor     =   9408398
         BorderColorPressed=   6045981
         BorderColorHover=   11632444
         Caption         =   "    Testear"
         Picture         =   "frmMsg.frx":0000
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
      Begin Proyecto1.Button cmdSave 
         Height          =   375
         Left            =   1320
         TabIndex        =   14
         Top             =   3240
         Width           =   1095
         _ExtentX        =   1931
         _ExtentY        =   661
         ButtonStyle     =   7
         PictureAlignment=   1
         BackColor       =   14211288
         BackColorPressed=   15715986
         BackColorHover  =   16243621
         BorderColor     =   9408398
         BorderColorPressed=   6045981
         BorderColorHover=   11632444
         Caption         =   "     Guardar"
         Picture         =   "frmMsg.frx":059A
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
      Begin VB.Label Label9 
         AutoSize        =   -1  'True
         BackColor       =   &H00404040&
         Caption         =   "Título:"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   240
         Left            =   120
         TabIndex        =   13
         Top             =   360
         Width           =   555
      End
      Begin VB.Label Label8 
         AutoSize        =   -1  'True
         BackColor       =   &H00404040&
         Caption         =   "Contenido:"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   240
         Left            =   120
         TabIndex        =   12
         Top             =   1080
         Width           =   930
      End
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00404040&
      Caption         =   "Icono"
      ForeColor       =   &H00FFFFFF&
      Height          =   1215
      Left            =   120
      TabIndex        =   1
      Top             =   840
      Width           =   2655
      Begin VB.OptionButton optQuest 
         BackColor       =   &H00404040&
         Height          =   195
         Left            =   2160
         TabIndex        =   7
         Top             =   840
         Width           =   195
      End
      Begin VB.PictureBox Picture4 
         AutoSize        =   -1  'True
         BackColor       =   &H00404040&
         BorderStyle     =   0  'None
         Height          =   525
         Left            =   2040
         Picture         =   "frmMsg.frx":0B34
         ScaleHeight     =   525
         ScaleWidth      =   525
         TabIndex        =   6
         Top             =   240
         Width           =   525
      End
      Begin VB.OptionButton optWarning 
         BackColor       =   &H00404040&
         Height          =   195
         Left            =   1200
         TabIndex        =   5
         Top             =   840
         Width           =   195
      End
      Begin VB.PictureBox Picture3 
         AutoSize        =   -1  'True
         BackColor       =   &H00404040&
         BorderStyle     =   0  'None
         Height          =   525
         Left            =   1080
         Picture         =   "frmMsg.frx":1205
         ScaleHeight     =   525
         ScaleWidth      =   525
         TabIndex        =   4
         Top             =   240
         Width           =   525
      End
      Begin VB.OptionButton optError 
         BackColor       =   &H00404040&
         Height          =   195
         Left            =   240
         TabIndex        =   3
         Top             =   840
         Width           =   195
      End
      Begin VB.PictureBox Picture2 
         AutoSize        =   -1  'True
         BackColor       =   &H00404040&
         BorderStyle     =   0  'None
         Height          =   525
         Left            =   120
         Picture         =   "frmMsg.frx":18F4
         ScaleHeight     =   525
         ScaleWidth      =   525
         TabIndex        =   2
         Top             =   240
         Width           =   525
      End
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackColor       =   &H00404040&
      Caption         =   "Mensaje Fake"
      BeginProperty Font 
         Name            =   "Segoe Print"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   645
      Left            =   240
      TabIndex        =   0
      Top             =   120
      Width           =   2385
   End
End
Attribute VB_Name = "frmMsg"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdSave_Click()
    Me.Hide
End Sub

Private Sub cmdTest_Click()
If Text8 = "" Or Text7 = "" Then Exit Sub
Dim tag As Long
If optQuest.Value = True Then tag = 32
If optWarning.Value = True Then tag = 64
If optError.Value = True Then tag = 16
    MsgBox Text7, tag, Text8
End Sub
