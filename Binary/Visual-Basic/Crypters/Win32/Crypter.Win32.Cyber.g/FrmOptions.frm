VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form FrmOptions 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Main Options"
   ClientHeight    =   4080
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4935
   Icon            =   "FrmOptions.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4080
   ScaleWidth      =   4935
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame Frame1 
      Caption         =   "Archive viewing options"
      Height          =   2535
      Left            =   360
      TabIndex        =   14
      Top             =   720
      Width           =   4215
      Begin VB.CheckBox ArchS02 
         Caption         =   "Archive Grid"
         Height          =   375
         Left            =   120
         TabIndex        =   6
         Top             =   2040
         Value           =   1  'Checked
         Width           =   3975
      End
      Begin VB.CheckBox ArchS01 
         Caption         =   "Archive sort alphabetical"
         Height          =   375
         Left            =   120
         TabIndex        =   5
         Top             =   1680
         Value           =   1  'Checked
         Width           =   3975
      End
      Begin VB.OptionButton Arch04 
         Caption         =   "View archive as normal icons"
         Height          =   375
         Left            =   120
         TabIndex        =   4
         Top             =   1320
         Width           =   3975
      End
      Begin VB.OptionButton Arch03 
         Caption         =   "View archive as lists"
         Height          =   375
         Left            =   120
         TabIndex        =   3
         Top             =   960
         Width           =   3975
      End
      Begin VB.OptionButton Arch02 
         Caption         =   "View archive as small icons"
         Height          =   375
         Left            =   120
         TabIndex        =   2
         Top             =   600
         Width           =   3975
      End
      Begin VB.OptionButton Arch01 
         Caption         =   "View archive as a report"
         Height          =   375
         Left            =   120
         TabIndex        =   1
         Top             =   240
         Value           =   -1  'True
         Width           =   3975
      End
   End
   Begin VB.CommandButton OK 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   375
      Left            =   3600
      TabIndex        =   13
      Top             =   3600
      Width           =   1215
   End
   Begin VB.Frame Frame2 
      Caption         =   "Extracting options"
      Height          =   1455
      Left            =   360
      TabIndex        =   15
      Top             =   720
      Visible         =   0   'False
      Width           =   4215
      Begin VB.CommandButton ExtrBrowse 
         Caption         =   "Browse"
         Enabled         =   0   'False
         Height          =   375
         Left            =   3240
         TabIndex        =   10
         Top             =   720
         Width           =   855
      End
      Begin VB.CheckBox ExtrS01 
         Caption         =   "Warn before extracting"
         Height          =   255
         Left            =   120
         TabIndex        =   11
         Top             =   1080
         Width           =   3975
      End
      Begin VB.TextBox ExPath 
         Appearance      =   0  'Flat
         Enabled         =   0   'False
         ForeColor       =   &H80000012&
         Height          =   285
         Left            =   1200
         Locked          =   -1  'True
         TabIndex        =   9
         Top             =   690
         Width           =   1935
      End
      Begin VB.OptionButton Extr02 
         Caption         =   "Extract to:"
         Height          =   375
         Left            =   120
         TabIndex        =   8
         Top             =   600
         Width           =   1095
      End
      Begin VB.OptionButton Extr01 
         Caption         =   "Prompt extraction location"
         Height          =   375
         Left            =   120
         TabIndex        =   7
         Top             =   240
         Value           =   -1  'True
         Width           =   3975
      End
   End
   Begin VB.PictureBox BackMenu01 
      BorderStyle     =   0  'None
      Height          =   2655
      Left            =   240
      ScaleHeight     =   2655
      ScaleWidth      =   4455
      TabIndex        =   16
      TabStop         =   0   'False
      Top             =   720
      Visible         =   0   'False
      Width           =   4455
      Begin VB.CheckBox ChkTips 
         Caption         =   "Show Tips on startup"
         Height          =   375
         Left            =   120
         TabIndex        =   12
         Top             =   120
         Width           =   1935
      End
   End
   Begin MSComctlLib.TabStrip TabMenu 
      Height          =   3255
      Left            =   120
      TabIndex        =   0
      Top             =   240
      Width           =   4695
      _ExtentX        =   8281
      _ExtentY        =   5741
      _Version        =   393216
      BeginProperty Tabs {1EFB6598-857C-11D1-B16A-00C0F0283628} 
         NumTabs         =   3
         BeginProperty Tab1 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Archive Viewing"
            Key             =   "Menu01"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab2 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Extracting"
            Key             =   "Menu02"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab3 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Other..."
            Key             =   "Menu03"
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
Attribute VB_Name = "FrmOptions"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Extr01_Click()
    ExPath.Enabled = False
    ExtrBrowse.Enabled = False
End Sub

Private Sub Extr02_Click()
    ExPath.Enabled = True
    ExtrBrowse.Enabled = True
End Sub

Private Sub ExtrBrowse_Click()
    SelectOption = 3
    FrmDir.Show 1, Me
End Sub

Private Sub Form_Load()
    On Error Resume Next
    sString = String(100, "*")
    lLength = Len(sString)
    GetPrivateProfileString "Settings", "Report", vbNullString, sString, lLength, App.Path & "\Settings.ini"
    Arch01.Value = sString
    GetPrivateProfileString "Settings", "SmallIcons", vbNullString, sString, lLength, App.Path & "\Settings.ini"
    Arch02.Value = sString
    GetPrivateProfileString "Settings", "Lists", vbNullString, sString, lLength, App.Path & "\Settings.ini"
    Arch03.Value = sString
    GetPrivateProfileString "Settings", "NormalIcons", vbNullString, sString, lLength, App.Path & "\Settings.ini"
    Arch04.Value = sString
    GetPrivateProfileString "Settings", "Sort", vbNullString, sString, lLength, App.Path & "\Settings.ini"
    ArchS01.Value = sString
    GetPrivateProfileString "Settings", "Grid", vbNullString, sString, lLength, App.Path & "\Settings.ini"
    ArchS02.Value = sString
    GetPrivateProfileString "Settings", "Prompt", vbNullString, sString, lLength, App.Path & "\Settings.ini"
    Extr01.Value = sString
    GetPrivateProfileString "Settings", "SendTo", vbNullString, sString, lLength, App.Path & "\Settings.ini"
    Extr02.Value = sString
    GetPrivateProfileString "Settings", "ExPath", vbNullString, sString, lLength, App.Path & "\Settings.ini"
    If sString = String(100, "*") Or Left(LCase$(sString), 5) = LCase$("False") Then ExPath.Text = "": Extr01.Value = True Else ExPath.Text = sString
    GetPrivateProfileString "Settings", "Warn", vbNullString, sString, lLength, App.Path & "\Settings.ini"
    ExtrS01.Value = sString
    
    GetPrivateProfileString "TipSettings", "Report", vbNullString, sString, lLength, App.Path & "\Settings.ini"
    sString = Mid(sString, 1, InStr(1, sString, Chr$(0)) - 1)
    If sString = CStr("0") Then ChkTips.Value = Unchecked Else ChkTips.Value = Checked

End Sub

Private Sub OK_Click()

    If Extr02.Value = True And ExPath.Text = "" Then MessageBox "Please click on the browse button to enter an extraction path.", OKOnly, Critical: Exit Sub
    WritePrivateProfileString "Settings", "Report", CStr(Arch01.Value), App.Path & "\Settings.ini"
    WritePrivateProfileString "Settings", "SmallIcons", CStr(Arch02.Value), App.Path & "\Settings.ini"
    WritePrivateProfileString "Settings", "Lists", CStr(Arch03.Value), App.Path & "\Settings.ini"
    WritePrivateProfileString "Settings", "NormalIcons", CStr(Arch04.Value), App.Path & "\Settings.ini"
    WritePrivateProfileString "Settings", "Sort", CStr(ArchS01.Value), App.Path & "\Settings.ini"
    WritePrivateProfileString "Settings", "Grid", CStr(ArchS02.Value), App.Path & "\Settings.ini"
    WritePrivateProfileString "Settings", "Prompt", CStr(Extr01.Value), App.Path & "\Settings.ini"
    WritePrivateProfileString "Settings", "SendTo", CStr(Extr02.Value), App.Path & "\Settings.ini"
    WritePrivateProfileString "Settings", "ExPath", ExPath.Text, App.Path & "\Settings.ini"
    WritePrivateProfileString "Settings", "Warn", CStr(ExtrS01.Value), App.Path & "\Settings.ini"
    WritePrivateProfileString "TipSettings", "Report", CStr(ChkTips.Value), App.Path & "\Settings.ini"
    
    If Arch01.Value = True Then
        frmMain.ListFiles.View = lvwReport
            ElseIf Arch02.Value = True Then
        frmMain.ListFiles.View = lvwSmallIcon
            ElseIf Arch03.Value = True Then
        frmMain.ListFiles.View = lvwList
            ElseIf Arch04.Value = True Then
        frmMain.ListFiles.View = lvwIcon
    End If
    
    If ArchS01.Value = Checked Then frmMain.ListFiles.Sorted = True Else frmMain.ListFiles.Sorted = False
    If ArchS02.Value = Checked Then frmMain.ListFiles.GridLines = True Else frmMain.ListFiles.GridLines = False
    
    If Extr01.Value = True Then ExtractPath = ""
    If Extr02.Value = True Then ExtractPath = ExPath.Text
    If ExtrS01.Value = Checked Then ChkWarningMsg = True Else ChkWarningMsg = False
    
    Unload Me
    
End Sub

Private Sub TabMenu_Click()
    If TabMenu.SelectedItem.Caption = "Archive Viewing" Then
        BackMenu01.Visible = False
        Frame2.Visible = False
        Frame1.Visible = True
    ElseIf TabMenu.SelectedItem.Caption = "Extracting" Then
        BackMenu01.Visible = False
        Frame1.Visible = False
        Frame2.Visible = True
    ElseIf TabMenu.SelectedItem.Caption = "Other..." Then
        Frame1.Visible = False
        Frame2.Visible = False
        BackMenu01.Visible = True
    End If
End Sub

Private Sub TabMenu_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If TabMenu.SelectedItem.Caption = "Archive Viewing" Then
        BackMenu01.Visible = False
        Frame2.Visible = False
        Frame1.Visible = True
    ElseIf TabMenu.SelectedItem.Caption = "Extracting" Then
        BackMenu01.Visible = False
        Frame1.Visible = False
        Frame2.Visible = True
    ElseIf TabMenu.SelectedItem.Caption = "Other..." Then
        Frame1.Visible = False
        Frame2.Visible = False
        BackMenu01.Visible = True
    End If
End Sub
