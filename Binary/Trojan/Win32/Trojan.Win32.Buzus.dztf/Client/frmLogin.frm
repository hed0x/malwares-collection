VERSION 5.00
Begin VB.Form frmLogin 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Rainerstoff - Login System"
   ClientHeight    =   3900
   ClientLeft      =   45
   ClientTop       =   390
   ClientWidth     =   3930
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmLogin.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3900
   ScaleWidth      =   3930
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox txtSave 
      Height          =   285
      Left            =   120
      TabIndex        =   3
      Top             =   120
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.Timer Timer3 
      Enabled         =   0   'False
      Left            =   3360
      Top             =   240
   End
   Begin VB.Timer Timer2 
      Interval        =   300
      Left            =   4320
      Top             =   4320
   End
   Begin VB.PictureBox Picture2 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   360
      ScaleHeight     =   255
      ScaleWidth      =   3255
      TabIndex        =   13
      Top             =   3240
      Width           =   3255
   End
   Begin VB.Timer Timer1 
      Interval        =   100
      Left            =   5400
      Top             =   4440
   End
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   285
      Index           =   0
      Left            =   5280
      Picture         =   "frmLogin.frx":7706D
      ScaleHeight     =   285
      ScaleWidth      =   3300
      TabIndex        =   12
      Top             =   600
      Visible         =   0   'False
      Width           =   3300
   End
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   285
      Index           =   1
      Left            =   5280
      Picture         =   "frmLogin.frx":77647
      ScaleHeight     =   285
      ScaleWidth      =   3300
      TabIndex        =   11
      Top             =   960
      Visible         =   0   'False
      Width           =   3300
   End
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   285
      Index           =   2
      Left            =   5280
      Picture         =   "frmLogin.frx":77C36
      ScaleHeight     =   285
      ScaleWidth      =   3300
      TabIndex        =   10
      Top             =   1320
      Visible         =   0   'False
      Width           =   3300
   End
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   285
      Index           =   3
      Left            =   5280
      Picture         =   "frmLogin.frx":78218
      ScaleHeight     =   285
      ScaleWidth      =   3300
      TabIndex        =   9
      Top             =   1680
      Visible         =   0   'False
      Width           =   3300
   End
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   285
      Index           =   4
      Left            =   5280
      Picture         =   "frmLogin.frx":787F9
      ScaleHeight     =   285
      ScaleWidth      =   3300
      TabIndex        =   8
      Top             =   2040
      Visible         =   0   'False
      Width           =   3300
   End
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   285
      Index           =   5
      Left            =   5280
      Picture         =   "frmLogin.frx":78DD3
      ScaleHeight     =   285
      ScaleWidth      =   3300
      TabIndex        =   7
      Top             =   2400
      Visible         =   0   'False
      Width           =   3300
   End
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   285
      Index           =   6
      Left            =   5280
      Picture         =   "frmLogin.frx":793BB
      ScaleHeight     =   285
      ScaleWidth      =   3300
      TabIndex        =   6
      Top             =   2760
      Visible         =   0   'False
      Width           =   3300
   End
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   285
      Index           =   7
      Left            =   5280
      Picture         =   "frmLogin.frx":799A3
      ScaleHeight     =   285
      ScaleWidth      =   3300
      TabIndex        =   5
      Top             =   3120
      Visible         =   0   'False
      Width           =   3300
   End
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   285
      Index           =   8
      Left            =   5280
      Picture         =   "frmLogin.frx":79F8B
      ScaleHeight     =   285
      ScaleWidth      =   3300
      TabIndex        =   4
      Top             =   3480
      Visible         =   0   'False
      Width           =   3300
   End
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   285
      Index           =   9
      Left            =   5280
      Picture         =   "frmLogin.frx":7A569
      ScaleHeight     =   285
      ScaleWidth      =   3300
      TabIndex        =   0
      Top             =   3840
      Visible         =   0   'False
      Width           =   3300
   End
   Begin prjCryptox.xFrame xFrame1 
      Height          =   1935
      Left            =   360
      TabIndex        =   14
      Top             =   840
      Width           =   3255
      _ExtentX        =   5741
      _ExtentY        =   3413
      BackColor       =   15000804
      BorderColor     =   12632256
      ButtonColor     =   8283750
      ButtonHighlightColor=   12298664
      ColorScheme     =   3
      Caption         =   "Login"
      Enabled         =   -1  'True
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      FontBold        =   -1  'True
      ForeColor       =   8283750
      FontItalic      =   0   'False
      FontSize        =   8.25
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      GradientBottom  =   15920108
      HeaderGradientBottom=   14606046
      HeaderGradientTop=   16448250
      Begin prjCryptox.wxpText txtPass 
         Height          =   285
         Left            =   1200
         TabIndex        =   2
         Top             =   960
         Width           =   1815
         _ExtentX        =   3201
         _ExtentY        =   503
         Text            =   ""
         PasswordChar    =   "*"
         BorderColor     =   12632256
         BackColor       =   -2147483643
         BackColor       =   -2147483643
         ForeColor       =   8421504
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Alignment       =   2
      End
      Begin prjCryptox.Check chkSave 
         Height          =   255
         Left            =   120
         TabIndex        =   19
         Top             =   1560
         Width           =   1815
         _ExtentX        =   2355
         _ExtentY        =   450
         Caption         =   "Save Account"
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   8421504
         Caption         =   "Save Account"
         BackColor       =   15000804
         ForeColor       =   8421504
      End
      Begin prjCryptox.jcbutton cmdLogin 
         Height          =   345
         Left            =   2040
         TabIndex        =   17
         TabStop         =   0   'False
         Top             =   1440
         Width           =   975
         _ExtentX        =   1085
         _ExtentY        =   609
         ButtonStyle     =   3
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         BackColor       =   14935011
         Caption         =   "Login"
         ForeColorHover  =   4210752
         PictureEffectOnOver=   0
         PictureEffectOnDown=   0
         CaptionEffects  =   2
         UseMaskColor    =   0   'False
         TooltipType     =   1
         TooltipIcon     =   1
         TooltipTitle    =   "ef"
         TooltipBackColor=   0
         ColorScheme     =   2
      End
      Begin prjCryptox.wxpText txtUser 
         Height          =   285
         Left            =   1200
         TabIndex        =   1
         Top             =   600
         Width           =   1815
         _ExtentX        =   3201
         _ExtentY        =   503
         Text            =   ""
         BorderColor     =   12632256
         BackColor       =   -2147483643
         BackColor       =   -2147483643
         ForeColor       =   8421504
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Alignment       =   2
      End
      Begin VB.Label lblPass 
         BackStyle       =   0  'Transparent
         Caption         =   "Password"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00808080&
         Height          =   255
         Left            =   240
         TabIndex        =   16
         Top             =   1080
         Width           =   855
      End
      Begin VB.Label lblUser 
         BackStyle       =   0  'Transparent
         Caption         =   "Username"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00808080&
         Height          =   255
         Left            =   240
         TabIndex        =   15
         Top             =   600
         Width           =   855
      End
   End
   Begin VB.Label lblConnecting 
      BackStyle       =   0  'Transparent
      Caption         =   "Connecting..."
      ForeColor       =   &H00808080&
      Height          =   255
      Left            =   120
      TabIndex        =   18
      Top             =   3000
      Width           =   3735
   End
   Begin VB.Shape Shape1 
      BackStyle       =   1  'Opaque
      BorderStyle     =   0  'Transparent
      Height          =   615
      Left            =   0
      Top             =   3000
      Width           =   4935
   End
   Begin VB.Image Image1 
      Height          =   6795
      Left            =   -360
      Picture         =   "frmLogin.frx":7AB46
      Top             =   0
      Width           =   5220
   End
End
Attribute VB_Name = "frmLogin"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim x, y As Integer

Private Sub Form_Terminate()
On Error Resume Next
Unload frmEULA
Unload SplashForm
Unload frmMain
Unload Me
End
End Sub

Public Function DeleteIt()
DeleteKey "HKCU\Software\Hack Hound\Rainerstoff\User"
DeleteKey "HKCU\Software\Hack Hound\Rainerstoff\Password"
DeleteKey "HKCU\Software\Hack Hound\Rainerstoff\Automatically"
txtUser.Text = vbNullString
txtPass.Text = vbNullString
End Function

Public Function SaveIt()
CreateKey "HKCU\Software\Hack Hound\Rainerstoff\User", txtUser.Text
CreateKey "HKCU\Software\Hack Hound\Rainerstoff\Password", txtPass.Text
CreateKey "HKCU\Software\Hack Hound\Rainerstoff\Automatically", "1"
End Function

Private Sub chkSave_Click()

On Error Resume Next

If chkSave.Value = Checked Then
Call SaveIt
Else
Call DeleteIt
End If

End Sub

Private Sub cmdLogin_Click()
On Error Resume Next

If txtPass.Text = "" Then
MsgBox "Please choose a user and pass.", vbOKOnly, "Rainerstoff - Login System"
Exit Sub
End If

If Check("http://www.hackhound.org/Rainerstoff/Keys.txt", txtUser.Text, txtPass.Text) = True Then
'Do here.
Else
MsgBox "You have entered an incorrect user/password!", vbInformation, "Rainerstoff"
End If

End Sub

Private Sub Form_Load()
On Error Resume Next

Dim Auto As String
Auto = ReadKey("HKCU\Software\Hack Hound\Rainerstoff\Automatically")
If Auto = "1" Then
chkSave.Value = Checked
txtUser.Text = ReadKey("HKCU\Software\Hack Hound\Rainerstoff\User")
txtPass.Text = ReadKey("HKCU\Software\Hack Hound\Rainerstoff\Password")
End If

End Sub

Private Sub Timer1_Timer()

If x = 10 Then
x = 0
End If

Picture2.Picture = Picture1(x).Picture
Picture2.Refresh
x = x + 1

End Sub

Private Sub Timer2_Timer()

If y = 10 Then
y = 0
End If
Select Case y + 2
    Case 2
    lblConnecting.Caption = "Connecting."
    Case 4
    lblConnecting.Caption = "Veryfying that server is legit.."
    Case 6
    lblConnecting.Caption = "Attempting to authenticate..."
    Case 8
    lblConnecting.Caption = "Loading Client into memory!..."
    Case 10
    lblConnecting.Caption = "Success!"
    frmMain.Show
    Unload frmLogin
    Unload SplashForm
End Select
y = y + 1

End Sub
