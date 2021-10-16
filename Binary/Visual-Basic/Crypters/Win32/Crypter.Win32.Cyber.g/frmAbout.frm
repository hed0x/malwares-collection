VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmAbout 
   AutoRedraw      =   -1  'True
   BorderStyle     =   1  'Fixed Single
   Caption         =   "About this Version of CyberCrypt"
   ClientHeight    =   4185
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5775
   Icon            =   "frmAbout.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4185
   ScaleWidth      =   5775
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton OK 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   375
      Left            =   4680
      TabIndex        =   2
      Top             =   3720
      Width           =   975
   End
   Begin VB.PictureBox BackPic01 
      BorderStyle     =   0  'None
      Height          =   2775
      Left            =   240
      ScaleHeight     =   2775
      ScaleWidth      =   5295
      TabIndex        =   4
      TabStop         =   0   'False
      Top             =   720
      Width           =   5295
      Begin VB.Frame Frame2 
         Height          =   1095
         Left            =   120
         TabIndex        =   10
         Top             =   0
         Width           =   5055
         Begin VB.Image Image1 
            Height          =   480
            Left            =   120
            Picture         =   "frmAbout.frx":030A
            Top             =   240
            Width           =   480
         End
         Begin VB.Label Label2 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   $"frmAbout.frx":0614
            Height          =   780
            Left            =   1080
            TabIndex        =   11
            Top             =   240
            Width           =   3885
            WordWrap        =   -1  'True
         End
      End
      Begin VB.Frame Frame1 
         Caption         =   "Registration information"
         Height          =   1455
         Left            =   120
         TabIndex        =   5
         Top             =   1200
         Width           =   5055
         Begin VB.Label Label1 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Licensed to:"
            Height          =   195
            Left            =   120
            TabIndex        =   9
            Top             =   360
            Width           =   870
         End
         Begin VB.Label UserName 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            ForeColor       =   &H00FF0000&
            Height          =   195
            Left            =   240
            TabIndex        =   8
            Top             =   600
            Width           =   45
         End
         Begin VB.Label Label3 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "This program is being run on:"
            Height          =   195
            Left            =   120
            TabIndex        =   7
            Top             =   840
            Width           =   2040
         End
         Begin VB.Label OsLabel 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            ForeColor       =   &H00FF0000&
            Height          =   195
            Left            =   240
            TabIndex        =   6
            Top             =   1080
            Width           =   45
         End
      End
   End
   Begin VB.PictureBox BackPic02 
      BorderStyle     =   0  'None
      Height          =   2775
      Left            =   240
      ScaleHeight     =   2775
      ScaleWidth      =   5295
      TabIndex        =   3
      TabStop         =   0   'False
      Top             =   720
      Visible         =   0   'False
      Width           =   5295
      Begin VB.TextBox AboutText 
         ForeColor       =   &H00000000&
         Height          =   2520
         Left            =   120
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         ScrollBars      =   3  'Both
         TabIndex        =   1
         Text            =   "frmAbout.frx":06D3
         Top             =   120
         Width           =   5055
      End
   End
   Begin MSComctlLib.TabStrip TabStrip1 
      Height          =   3375
      Left            =   120
      TabIndex        =   0
      Top             =   240
      Width           =   5535
      _ExtentX        =   9763
      _ExtentY        =   5953
      _Version        =   393216
      BeginProperty Tabs {1EFB6598-857C-11D1-B16A-00C0F0283628} 
         NumTabs         =   2
         BeginProperty Tab1 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "About"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab2 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Whats new?"
            ImageVarType    =   2
         EndProperty
      EndProperty
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
End
Attribute VB_Name = "frmAbout"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
    On Error Resume Next
    'The following two lines loads the user and windows OS into the program versions
    UserName.Caption = GetStringValue("HKEY_LOCAL_MACHINE\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION", "RegisteredOwner") & " - " & GetStringValue("HKEY_LOCAL_MACHINE\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION", "VersionNumber")
    OsLabel.Caption = GetStringValue("HKEY_LOCAL_MACHINE\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION", "ProductName") & " - " & GetStringValue("HKEY_LOCAL_MACHINE\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION", "ProductId")
End Sub

Private Sub OK_Click()
    Unload Me
End Sub

Private Sub TabStrip1_Click()
    If TabStrip1.SelectedItem.Caption = "About" Then
        BackPic02.Visible = False
        BackPic01.Visible = True
    ElseIf TabStrip1.SelectedItem.Caption = "Whats new?" Then
        BackPic01.Visible = False
        BackPic02.Visible = True
    End If
End Sub

Private Sub TabStrip1_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If TabStrip1.SelectedItem.Caption = "About" Then
        BackPic02.Visible = False
        BackPic01.Visible = True
    ElseIf TabStrip1.SelectedItem.Caption = "Whats new?" Then
        BackPic01.Visible = False
        BackPic02.Visible = True
    End If
End Sub
