VERSION 5.00
Object = "{A8E5842E-102B-4289-9D57-3B3F5B5E15D3}#12.1#0"; "CODEJO~3.OCX"
Begin VB.Form Form2 
   BorderStyle     =   4  'Festes Werkzeugfenster
   ClientHeight    =   4320
   ClientLeft      =   45
   ClientTop       =   315
   ClientWidth     =   5985
   FillStyle       =   0  'Ausgefüllt
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4320
   ScaleWidth      =   5985
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows-Standard
   Begin XtremeSuiteControls.PushButton PushButton1 
      Height          =   495
      Left            =   120
      TabIndex        =   13
      Top             =   3240
      Width           =   5775
      _Version        =   786433
      _ExtentX        =   10186
      _ExtentY        =   873
      _StockProps     =   79
      Caption         =   "Set Settings"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      UseVisualStyle  =   -1  'True
      Picture         =   "Form2.frx":0000
   End
   Begin XtremeSuiteControls.GroupBox GroupBox2 
      Height          =   1815
      Left            =   120
      TabIndex        =   5
      Top             =   1320
      Width           =   5775
      _Version        =   786433
      _ExtentX        =   10186
      _ExtentY        =   3201
      _StockProps     =   79
      Caption         =   "       - Run"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Appearance      =   2
      Begin XtremeSuiteControls.GroupBox GroupBox3 
         Height          =   1455
         Left            =   2760
         TabIndex        =   10
         Top             =   240
         Width           =   2655
         _Version        =   786433
         _ExtentX        =   4683
         _ExtentY        =   2566
         _StockProps     =   79
         Caption         =   "       - Extra"
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Appearance      =   2
         BorderStyle     =   1
         Begin XtremeSuiteControls.CheckBox check_hide 
            Height          =   255
            Left            =   480
            TabIndex        =   12
            Top             =   600
            Width           =   1215
            _Version        =   786433
            _ExtentX        =   2143
            _ExtentY        =   450
            _StockProps     =   79
            Caption         =   "Hidden(.exe)"
            UseVisualStyle  =   -1  'True
         End
         Begin XtremeSuiteControls.CheckBox check_run 
            Height          =   255
            Left            =   240
            TabIndex        =   11
            Top             =   360
            Width           =   615
            _Version        =   786433
            _ExtentX        =   1085
            _ExtentY        =   450
            _StockProps     =   79
            Caption         =   "Run"
            UseVisualStyle  =   -1  'True
         End
         Begin VB.Image Image3 
            Height          =   240
            Left            =   0
            Picture         =   "Form2.frx":0461
            Top             =   0
            Width           =   240
         End
      End
      Begin XtremeSuiteControls.FlatEdit txt_after 
         Height          =   255
         Left            =   120
         TabIndex        =   9
         Top             =   1440
         Width           =   2175
         _Version        =   786433
         _ExtentX        =   3836
         _ExtentY        =   450
         _StockProps     =   77
         BackColor       =   -2147483643
      End
      Begin XtremeSuiteControls.ComboBox c_extract 
         Height          =   315
         Left            =   120
         TabIndex        =   7
         Top             =   720
         Width           =   2175
         _Version        =   786433
         _ExtentX        =   3836
         _ExtentY        =   556
         _StockProps     =   77
         BackColor       =   -2147483643
         Style           =   2
         Text            =   "ComboBox1"
      End
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
         Caption         =   "Filename after extract :"
         Height          =   195
         Left            =   120
         TabIndex        =   8
         Top             =   1200
         Width           =   1710
      End
      Begin VB.Label Label3 
         Caption         =   "Extract to :"
         Height          =   255
         Left            =   120
         TabIndex        =   6
         Top             =   480
         Width           =   1575
      End
      Begin VB.Image Image2 
         Height          =   240
         Left            =   120
         Picture         =   "Form2.frx":06F2
         Top             =   0
         Width           =   240
      End
   End
   Begin XtremeSuiteControls.GroupBox GroupBox1 
      Height          =   1095
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   5775
      _Version        =   786433
      _ExtentX        =   10186
      _ExtentY        =   1931
      _StockProps     =   79
      Caption         =   "       - Main"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Appearance      =   2
      Begin XtremeSuiteControls.FlatEdit txt_filesize 
         Height          =   255
         Left            =   3960
         TabIndex        =   4
         Top             =   720
         Width           =   1095
         _Version        =   786433
         _ExtentX        =   1931
         _ExtentY        =   450
         _StockProps     =   77
         BackColor       =   -2147483643
         Locked          =   -1  'True
      End
      Begin XtremeSuiteControls.FlatEdit txt_filename 
         Height          =   255
         Left            =   120
         TabIndex        =   2
         Top             =   720
         Width           =   3735
         _Version        =   786433
         _ExtentX        =   6588
         _ExtentY        =   450
         _StockProps     =   77
         BackColor       =   -2147483643
         Locked          =   -1  'True
      End
      Begin VB.Label Label2 
         Caption         =   "Filesize(mb) :"
         Height          =   255
         Left            =   3960
         TabIndex        =   3
         Top             =   480
         Width           =   975
      End
      Begin VB.Label Label1 
         Caption         =   "Filename :"
         Height          =   255
         Left            =   120
         TabIndex        =   1
         Top             =   480
         Width           =   975
      End
      Begin VB.Image Image1 
         Height          =   240
         Left            =   120
         Picture         =   "Form2.frx":097B
         Top             =   0
         Width           =   240
      End
   End
   Begin XtremeSuiteControls.ComboBox c_files 
      Height          =   315
      Left            =   120
      TabIndex        =   14
      Top             =   3840
      Width           =   5775
      _Version        =   786433
      _ExtentX        =   10186
      _ExtentY        =   556
      _StockProps     =   77
      BackColor       =   -2147483643
      Style           =   2
   End
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False



Private Sub c_files_Click()
txt_filename = Form1.lv_files.ListItems(c_files.ListIndex + 1).Text
txt_filesize = Form1.lv_files.ListItems(c_files.ListIndex + 1).SubItems(4)

If Form1.lv_files.ListItems(c_files.ListIndex + 1).SubItems(2) = "AppPath" Then
    c_extract.ListIndex = 0
ElseIf Form1.lv_files.ListItems(c_files.ListIndex + 1).SubItems(2) = "Windir" Then
    c_extract.ListIndex = 1
ElseIf Form1.lv_files.ListItems(c_files.ListIndex + 1).SubItems(2) = "Sysdir" Then
    c_extract.ListIndex = 2
ElseIf Form1.lv_files.ListItems(c_files.ListIndex + 1).SubItems(2) = "Temp Dir" Then
    c_extract.ListIndex = 3
ElseIf Form1.lv_files.ListItems(c_files.ListIndex + 1).SubItems(2) = "AppData" Then
    c_extract.ListIndex = 4
End If

txt_after = Form1.lv_files.ListItems(c_files.ListIndex + 1).SubItems(3)

If Split(Form1.lv_files.ListItems(c_files.ListIndex + 1).SubItems(1), "/")(0) = "no" Then
    check_run.Value = xtpUnchecked
Else
    check_run.Value = xtpChecked
End If

If Split(Form1.lv_files.ListItems(c_files.ListIndex + 1).SubItems(1), "/")(1) = "no" Then
    check_hide.Value = xtpUnchecked
Else
    check_hide.Value = xtpChecked
End If


'txt_add = Form1.lv_files.ListItems(c_files.ListIndex + 1).SubItems(5)
    
End Sub

Private Sub Form_Load()
c_extract.AddItem "AppPath"
c_extract.AddItem "Windir"
c_extract.AddItem "Sysdir"
c_extract.AddItem "Temp Dir"
c_extract.AddItem "AppData"
c_extract.ListIndex = 0


End Sub

Private Sub PushButton1_Click()
With Form1.lv_files.ListItems(c_files.ListIndex + 1)
    If check_run.Value = xtpChecked And check_hide.Value = xtpChecked Then
        .SubItems(1) = "yes/yes"
    ElseIf check_run.Value = xtpChecked And check_hide.Value = xtpUnchecked Then
        .SubItems(1) = "yes/no"
    Else
        .SubItems(1) = "no/no"
    End If
    
    .SubItems(2) = c_extract.Text
    .SubItems(3) = txt_after
End With




End Sub
