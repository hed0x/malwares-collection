VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form FrmQuickViewOpt 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "QuickView"
   ClientHeight    =   3360
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4815
   ControlBox      =   0   'False
   Icon            =   "FrmQuickViewOpt.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3360
   ScaleWidth      =   4815
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton OKCmd 
      Caption         =   "&Close"
      Default         =   -1  'True
      Height          =   375
      Left            =   3720
      TabIndex        =   8
      Top             =   2880
      Width           =   975
   End
   Begin VB.PictureBox BackBoard01 
      BorderStyle     =   0  'None
      Height          =   1935
      Left            =   240
      ScaleHeight     =   1935
      ScaleWidth      =   4335
      TabIndex        =   11
      TabStop         =   0   'False
      Top             =   720
      Width           =   4335
      Begin VB.TextBox Qpath 
         Appearance      =   0  'Flat
         ForeColor       =   &H80000012&
         Height          =   285
         Left            =   1320
         Locked          =   -1  'True
         TabIndex        =   1
         Top             =   120
         Width           =   2415
      End
      Begin VB.CommandButton QBrowse 
         Caption         =   "..."
         Height          =   375
         Left            =   3840
         TabIndex        =   2
         Top             =   120
         Width           =   375
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         Caption         =   $"FrmQuickViewOpt.frx":030A
         Height          =   975
         Left            =   120
         TabIndex        =   13
         Top             =   720
         Width           =   4095
         WordWrap        =   -1  'True
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "QuickView path:"
         Height          =   195
         Left            =   120
         TabIndex        =   12
         Top             =   120
         Width           =   1170
      End
   End
   Begin VB.PictureBox BackBoard02 
      BorderStyle     =   0  'None
      Height          =   1935
      Left            =   240
      ScaleHeight     =   1935
      ScaleWidth      =   4335
      TabIndex        =   9
      TabStop         =   0   'False
      Top             =   720
      Visible         =   0   'False
      Width           =   4335
      Begin VB.Frame Frame1 
         Caption         =   "Options"
         Height          =   1815
         Left            =   120
         TabIndex        =   10
         Top             =   0
         Width           =   4095
         Begin VB.OptionButton Opt01 
            Caption         =   "Extract and QuickView in working folder"
            Height          =   375
            Left            =   120
            TabIndex        =   3
            Top             =   360
            Value           =   -1  'True
            Width           =   3855
         End
         Begin VB.CheckBox QAlert 
            Caption         =   "Alert before QuickViewing file"
            Height          =   375
            Left            =   120
            TabIndex        =   7
            Top             =   1320
            Width           =   3855
         End
         Begin VB.CommandButton WBrowse 
            Caption         =   "..."
            Enabled         =   0   'False
            Height          =   375
            Left            =   3480
            TabIndex        =   6
            Top             =   840
            Width           =   375
         End
         Begin VB.TextBox WorkingFolder 
            Appearance      =   0  'Flat
            Enabled         =   0   'False
            ForeColor       =   &H80000012&
            Height          =   285
            Left            =   1200
            Locked          =   -1  'True
            TabIndex        =   5
            Top             =   840
            Width           =   2175
         End
         Begin VB.OptionButton Opt02 
            Caption         =   "Other..."
            Height          =   375
            Left            =   120
            TabIndex        =   4
            Top             =   720
            Width           =   975
         End
      End
   End
   Begin MSComctlLib.TabStrip TabMenu 
      Height          =   2535
      Left            =   120
      TabIndex        =   0
      Top             =   240
      Width           =   4575
      _ExtentX        =   8070
      _ExtentY        =   4471
      _Version        =   393216
      BeginProperty Tabs {1EFB6598-857C-11D1-B16A-00C0F0283628} 
         NumTabs         =   2
         BeginProperty Tab1 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "QuickView"
            Key             =   "Menu01"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab2 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Options..."
            Key             =   "Menu02"
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
Attribute VB_Name = "FrmQuickViewOpt"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
    Qpath.Text = QuickViewPath
    WorkingFolder.Text = QViewDirectory
    If QViewDirectory = "" Then WorkingFolder.Text = TempRootS
    If QViewON = True Then Opt02.Value = True Else Opt01.Value = True
    If QViewAlert = True Then QAlert.Value = Checked Else QAlert.Value = Unchecked
End Sub

Private Sub OKCmd_Click()
    WritePrivateProfileString "QuickView", "QViewOpt", CStr(Opt02.Value), App.Path & "\Settings.ini"
    WritePrivateProfileString "QuickView", "QViewAlert", CStr(QAlert.Value), App.Path & "\Settings.ini"
    WritePrivateProfileString "QuickView", "QuickView", CStr(Qpath.Text), App.Path & "\Settings.ini"
    WritePrivateProfileString "QuickView", "QViewOther", CStr(WorkingFolder.Text), App.Path & "\Settings.ini"
    If Opt02.Value = True Then QViewON = True Else QViewON = False
    If QAlert.Value = Checked Then QViewAlert = True Else QViewAlert = False
    QuickViewPath = Qpath.Text
    QViewDirectory = WorkingFolder.Text
    Unload Me
End Sub

Private Sub Opt01_Click()
    WorkingFolder.Enabled = False
    WBrowse.Enabled = False
End Sub

Private Sub Opt02_Click()
    WorkingFolder.Enabled = True
    WBrowse.Enabled = True
End Sub

Private Sub QBrowse_Click()
    
    On Error GoTo FinaliseError
    
    frmMain.Dlg.flags = &H400 + &H4 + &H8 + &H2 + &H800
    frmMain.Dlg.DialogTitle = "Open QuickView aplication"
    frmMain.Dlg.Filter = "Programs|*.exe|All files (*.*)|*.*"
    frmMain.Dlg.DefaultExt = ".exe"
    frmMain.Dlg.ShowOpen
    If frmMain.Dlg.FileName = "" Then Exit Sub
    Qpath.Text = frmMain.Dlg.FileName
    Exit Sub
    
FinaliseError:
    If Err = 32755 Then
        Exit Sub
            Else
        MessageBox "An unknown error occured!", OKOnly, Critical
    End If
    
End Sub

Private Sub TabMenu_Click()
    If TabMenu.SelectedItem.Caption = "QuickView" Then
        BackBoard02.Visible = False
        BackBoard01.Visible = True
    ElseIf TabMenu.SelectedItem.Caption = "Options..." Then
        BackBoard01.Visible = False
        BackBoard02.Visible = True
    End If
End Sub

Private Sub TabMenu_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If TabMenu.SelectedItem.Caption = "QuickView" Then
        BackBoard02.Visible = False
        BackBoard01.Visible = True
    ElseIf TabMenu.SelectedItem.Caption = "Options..." Then
        BackBoard01.Visible = False
        BackBoard02.Visible = True
    End If
End Sub

Private Sub WBrowse_Click()
    SelectOption = 4
    FrmDir.Show 1, Me
End Sub
