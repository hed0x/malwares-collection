VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmMain 
   Caption         =   "CyberCrypt Professional 7.0"
   ClientHeight    =   5760
   ClientLeft      =   2145
   ClientTop       =   3000
   ClientWidth     =   6495
   Icon            =   "frmMain.frx":0000
   ScaleHeight     =   5760
   ScaleWidth      =   6495
   StartUpPosition =   2  'CenterScreen
   Begin MSComctlLib.ImageList Lights 
      Left            =   1800
      Top             =   4800
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   8
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":030A
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":08A6
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":0E42
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":13DE
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":197A
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":2656
            Key             =   ""
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":3332
            Key             =   ""
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":400E
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.Frame MenuBoarder 
      Height          =   855
      Left            =   0
      TabIndex        =   2
      Top             =   0
      Width           =   6495
      Begin VB.Image NewPic 
         Height          =   495
         Left            =   120
         Top             =   240
         Width           =   495
      End
      Begin VB.Label LabelExpand 
         Alignment       =   1  'Right Justify
         Caption         =   ">>>"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   6060
         TabIndex        =   3
         Top             =   120
         Visible         =   0   'False
         Width           =   390
      End
      Begin VB.Image OpenPic 
         Height          =   495
         Left            =   840
         ToolTipText     =   "Open Archive"
         Top             =   240
         Width           =   495
      End
      Begin VB.Image ExtractPic 
         Enabled         =   0   'False
         Height          =   495
         Left            =   2280
         ToolTipText     =   "Extract"
         Top             =   240
         Width           =   495
      End
      Begin VB.Image ExitPic 
         Height          =   480
         Left            =   5880
         ToolTipText     =   "Exit"
         Top             =   240
         Width           =   480
      End
      Begin VB.Image FileInfoPic 
         Enabled         =   0   'False
         Height          =   495
         Left            =   3000
         ToolTipText     =   "Selected file information"
         Top             =   240
         Width           =   495
      End
      Begin VB.Image AddPic 
         Enabled         =   0   'False
         Height          =   495
         Left            =   1560
         ToolTipText     =   "Add"
         Top             =   240
         Width           =   495
      End
      Begin VB.Image HelpTopics 
         Height          =   495
         Left            =   5160
         ToolTipText     =   "HelpTopics"
         Top             =   240
         Width           =   495
      End
      Begin VB.Image OptionsPic 
         Height          =   495
         Left            =   4440
         ToolTipText     =   "Main Options"
         Top             =   240
         Width           =   495
      End
      Begin VB.Image CompressPic 
         Enabled         =   0   'False
         Height          =   495
         Left            =   3720
         ToolTipText     =   "Compression Options"
         Top             =   240
         Width           =   495
      End
   End
   Begin MSComctlLib.StatusBar StatusBar 
      Align           =   2  'Align Bottom
      Height          =   300
      Left            =   0
      TabIndex        =   0
      Top             =   5460
      Width           =   6495
      _ExtentX        =   11456
      _ExtentY        =   529
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   3
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   9702
            MinWidth        =   9702
            Text            =   "Choose ""New"" to create or ""Open"" to open an archive"
            TextSave        =   "Choose ""New"" to create or ""Open"" to open an archive"
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Bevel           =   0
            Object.Width           =   529
            MinWidth        =   529
            Picture         =   "frmMain.frx":4CEA
         EndProperty
         BeginProperty Panel3 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Bevel           =   0
            Object.Width           =   529
            MinWidth        =   529
            Picture         =   "frmMain.frx":5286
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ImageList FilePics 
      Left            =   1200
      Top             =   4800
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   69
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":5822
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":64FE
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":6DDA
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":76B6
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":7F92
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":8C6E
            Key             =   ""
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":994A
            Key             =   ""
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":A626
            Key             =   ""
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":B302
            Key             =   ""
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":B62A
            Key             =   ""
         EndProperty
         BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":C47E
            Key             =   ""
         EndProperty
         BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":CD5A
            Key             =   ""
         EndProperty
         BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":DBAE
            Key             =   ""
         EndProperty
         BeginProperty ListImage14 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":E88A
            Key             =   ""
         EndProperty
         BeginProperty ListImage15 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":F566
            Key             =   ""
         EndProperty
         BeginProperty ListImage16 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":10242
            Key             =   ""
         EndProperty
         BeginProperty ListImage17 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":10F1E
            Key             =   ""
         EndProperty
         BeginProperty ListImage18 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":11BFA
            Key             =   ""
         EndProperty
         BeginProperty ListImage19 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":124D6
            Key             =   ""
         EndProperty
         BeginProperty ListImage20 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":131B2
            Key             =   ""
         EndProperty
         BeginProperty ListImage21 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":13E8E
            Key             =   ""
         EndProperty
         BeginProperty ListImage22 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":14B6A
            Key             =   ""
         EndProperty
         BeginProperty ListImage23 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":15846
            Key             =   ""
         EndProperty
         BeginProperty ListImage24 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":16522
            Key             =   ""
         EndProperty
         BeginProperty ListImage25 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":171FE
            Key             =   ""
         EndProperty
         BeginProperty ListImage26 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":1766A
            Key             =   ""
         EndProperty
         BeginProperty ListImage27 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":18346
            Key             =   ""
         EndProperty
         BeginProperty ListImage28 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":19022
            Key             =   ""
         EndProperty
         BeginProperty ListImage29 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":19CFE
            Key             =   ""
         EndProperty
         BeginProperty ListImage30 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":1AB52
            Key             =   ""
         EndProperty
         BeginProperty ListImage31 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":1B42E
            Key             =   ""
         EndProperty
         BeginProperty ListImage32 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":1C10A
            Key             =   ""
         EndProperty
         BeginProperty ListImage33 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":1CDE6
            Key             =   ""
         EndProperty
         BeginProperty ListImage34 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":1D10E
            Key             =   ""
         EndProperty
         BeginProperty ListImage35 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":1DDEA
            Key             =   ""
         EndProperty
         BeginProperty ListImage36 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":1EAC6
            Key             =   ""
         EndProperty
         BeginProperty ListImage37 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":1F7A2
            Key             =   ""
         EndProperty
         BeginProperty ListImage38 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":1FC76
            Key             =   ""
         EndProperty
         BeginProperty ListImage39 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":20552
            Key             =   ""
         EndProperty
         BeginProperty ListImage40 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":20A3E
            Key             =   ""
         EndProperty
         BeginProperty ListImage41 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":231F2
            Key             =   ""
         EndProperty
         BeginProperty ListImage42 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":236B6
            Key             =   ""
         EndProperty
         BeginProperty ListImage43 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":2428A
            Key             =   ""
         EndProperty
         BeginProperty ListImage44 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":26A3E
            Key             =   ""
         EndProperty
         BeginProperty ListImage45 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":27D4A
            Key             =   ""
         EndProperty
         BeginProperty ListImage46 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":281EE
            Key             =   ""
         EndProperty
         BeginProperty ListImage47 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":2886A
            Key             =   ""
         EndProperty
         BeginProperty ListImage48 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":28E9E
            Key             =   ""
         EndProperty
         BeginProperty ListImage49 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":29346
            Key             =   ""
         EndProperty
         BeginProperty ListImage50 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":299FA
            Key             =   ""
         EndProperty
         BeginProperty ListImage51 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":2A022
            Key             =   ""
         EndProperty
         BeginProperty ListImage52 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":2A662
            Key             =   ""
         EndProperty
         BeginProperty ListImage53 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":2AD1A
            Key             =   ""
         EndProperty
         BeginProperty ListImage54 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":2AEDE
            Key             =   ""
         EndProperty
         BeginProperty ListImage55 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":2B38E
            Key             =   ""
         EndProperty
         BeginProperty ListImage56 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":2B5D6
            Key             =   ""
         EndProperty
         BeginProperty ListImage57 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":2BA2A
            Key             =   ""
         EndProperty
         BeginProperty ListImage58 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":2BE7E
            Key             =   ""
         EndProperty
         BeginProperty ListImage59 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":2C2D2
            Key             =   ""
         EndProperty
         BeginProperty ListImage60 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":2EA86
            Key             =   ""
         EndProperty
         BeginProperty ListImage61 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":2EEDA
            Key             =   ""
         EndProperty
         BeginProperty ListImage62 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":2F32E
            Key             =   ""
         EndProperty
         BeginProperty ListImage63 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":2F782
            Key             =   ""
         EndProperty
         BeginProperty ListImage64 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":2FBD6
            Key             =   ""
         EndProperty
         BeginProperty ListImage65 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":308B2
            Key             =   ""
         EndProperty
         BeginProperty ListImage66 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":3158E
            Key             =   ""
         EndProperty
         BeginProperty ListImage67 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":3226A
            Key             =   ""
         EndProperty
         BeginProperty ListImage68 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":32F46
            Key             =   ""
         EndProperty
         BeginProperty ListImage69 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":33C22
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComDlg.CommonDialog Dlg 
      Left            =   2880
      Top             =   4920
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
      CancelError     =   -1  'True
   End
   Begin MSComDlg.CommonDialog CommonDialog 
      Left            =   2400
      Top             =   4920
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
      CancelError     =   -1  'True
      DefaultExt      =   "*.pak"
      DialogTitle     =   "Open PAK"
      Filter          =   "PAK File (*.pak)|*.pak"
      Flags           =   38930
   End
   Begin MSComctlLib.ImageList ImageListGray 
      Left            =   600
      Top             =   4800
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   32
      ImageHeight     =   32
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   12
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":348FE
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":355DA
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":35EB6
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":36B92
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":3786E
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":38AC2
            Key             =   ""
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":3939E
            Key             =   ""
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":3A07A
            Key             =   ""
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":3A396
            Key             =   ""
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":3B072
            Key             =   ""
         EndProperty
         BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":3BD4E
            Key             =   ""
         EndProperty
         BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":3E502
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ImageList ImageList 
      Left            =   0
      Top             =   4800
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   32
      ImageHeight     =   32
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   14
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":3F356
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":40032
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":4090E
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":415EA
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":422C6
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":4311A
            Key             =   ""
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":439F6
            Key             =   ""
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":446D2
            Key             =   ""
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":449EE
            Key             =   ""
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":44E9A
            Key             =   ""
         EndProperty
         BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":45B76
            Key             =   ""
         EndProperty
         BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":4832A
            Key             =   ""
         EndProperty
         BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":4917E
            Key             =   ""
         EndProperty
         BeginProperty ListImage14 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":49622
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ListView ListFiles 
      Height          =   4455
      Left            =   0
      TabIndex        =   1
      Top             =   960
      Width           =   6495
      _ExtentX        =   11456
      _ExtentY        =   7858
      View            =   3
      LabelEdit       =   1
      Sorted          =   -1  'True
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      OLEDropMode     =   1
      AllowReorder    =   -1  'True
      FullRowSelect   =   -1  'True
      GridLines       =   -1  'True
      PictureAlignment=   5
      _Version        =   393217
      Icons           =   "FilePics"
      SmallIcons      =   "FilePics"
      ColHdrIcons     =   "FilePics"
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      OLEDropMode     =   1
      NumItems        =   0
   End
   Begin VB.Menu Menu01 
      Caption         =   "Extract"
      Visible         =   0   'False
      Begin VB.Menu Click01 
         Caption         =   "Selected file..."
      End
      Begin VB.Menu Click02 
         Caption         =   "All to directory..."
      End
   End
   Begin VB.Menu Menu02 
      Caption         =   "Add"
      Visible         =   0   'False
      Begin VB.Menu Click03 
         Caption         =   "&Add file..."
      End
      Begin VB.Menu Click04 
         Caption         =   "Add &Directory..."
      End
   End
   Begin VB.Menu Menu04 
      Caption         =   "&File"
      Begin VB.Menu Click07 
         Caption         =   "&New Archive..."
         Shortcut        =   ^N
      End
      Begin VB.Menu Click08 
         Caption         =   "&Open Archive..."
         Shortcut        =   ^O
      End
      Begin VB.Menu Click09 
         Caption         =   "&Close Archive"
         Enabled         =   0   'False
         Shortcut        =   ^L
      End
      Begin VB.Menu Sub02 
         Caption         =   "-"
      End
      Begin VB.Menu Click10 
         Caption         =   "Op&tions..."
      End
      Begin VB.Menu Sub03 
         Caption         =   "-"
      End
      Begin VB.Menu Click11 
         Caption         =   "&Move Archive..."
         Enabled         =   0   'False
         Shortcut        =   {F7}
      End
      Begin VB.Menu Click12 
         Caption         =   "Cop&y Archive..."
         Enabled         =   0   'False
         Shortcut        =   {F8}
      End
      Begin VB.Menu Click13 
         Caption         =   "&Rename Archive..."
         Enabled         =   0   'False
         Shortcut        =   +{F7}
      End
      Begin VB.Menu Click14 
         Caption         =   "&Delete Archive"
         Enabled         =   0   'False
      End
      Begin VB.Menu Sub04 
         Caption         =   "-"
      End
      Begin VB.Menu Click15 
         Caption         =   "E&xit"
         Shortcut        =   ^X
      End
      Begin VB.Menu Sub04_01 
         Caption         =   "-"
      End
      Begin VB.Menu Click15_1 
         Caption         =   "&Archive Convertor"
      End
      Begin VB.Menu Click15_2 
         Caption         =   "Coding Utility..."
      End
   End
   Begin VB.Menu Menu05 
      Caption         =   "&Actions"
      Begin VB.Menu Click16 
         Caption         =   "&Add file..."
         Enabled         =   0   'False
         Shortcut        =   ^A
      End
      Begin VB.Menu Click17 
         Caption         =   "Add &Directory..."
         Enabled         =   0   'False
         Shortcut        =   ^D
      End
      Begin VB.Menu Click18 
         Caption         =   "&Extract selected file..."
         Enabled         =   0   'False
         Shortcut        =   ^E
      End
      Begin VB.Menu Click19 
         Caption         =   "Extract &All to Directory..."
         Enabled         =   0   'False
         Shortcut        =   ^I
      End
      Begin VB.Menu Sub06 
         Caption         =   "-"
      End
      Begin VB.Menu Click20 
         Caption         =   "&Open with program Association"
         Enabled         =   0   'False
         Shortcut        =   ^S
      End
      Begin VB.Menu Click21 
         Caption         =   "&QuickView..."
         Enabled         =   0   'False
         Shortcut        =   ^Q
      End
      Begin VB.Menu Click21Opt 
         Caption         =   "Q&uickView Options..."
      End
      Begin VB.Menu Sub07 
         Caption         =   "-"
      End
      Begin VB.Menu Click22 
         Caption         =   "Virus &Scan..."
         Enabled         =   0   'False
         Shortcut        =   ^V
      End
      Begin VB.Menu Click22Opt 
         Caption         =   "Virus Scan Options..."
      End
      Begin VB.Menu Sub08 
         Caption         =   "-"
      End
      Begin VB.Menu Click23 
         Caption         =   "Selected file &properties..."
         Enabled         =   0   'False
         Shortcut        =   ^P
      End
      Begin VB.Menu Sub8_2 
         Caption         =   "-"
      End
      Begin VB.Menu Click232 
         Caption         =   "C&ompression options..."
         Enabled         =   0   'False
         Shortcut        =   ^B
      End
      Begin VB.Menu Sub8_3 
         Caption         =   "-"
      End
      Begin VB.Menu Click233 
         Caption         =   "Refresh archive..."
         Enabled         =   0   'False
      End
   End
   Begin VB.Menu Menu06 
      Caption         =   "&Help"
      Begin VB.Menu Click24 
         Caption         =   "Tip of the &Day..."
      End
      Begin VB.Menu Sub09 
         Caption         =   "-"
      End
      Begin VB.Menu Click25 
         Caption         =   "&Look for help on..."
      End
      Begin VB.Menu Click26 
         Caption         =   "&Frequently asked questions"
         Shortcut        =   ^F
      End
      Begin VB.Menu Sub10 
         Caption         =   "-"
      End
      Begin VB.Menu Click27 
         Caption         =   "&License Agreement"
      End
      Begin VB.Menu Click28 
         Caption         =   "About CyberCrypt..."
      End
      Begin VB.Menu Sub11 
         Caption         =   "-"
      End
      Begin VB.Menu Click29 
         Caption         =   "&Contents..."
         Shortcut        =   {F1}
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Please read the following information for your satisfaction of this product!

    '/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\'
    '                                                            '
    '     ****                                                   '
    '   *   ||\*  |||  |||      ||| |\ | / ||| ||| |\ | /|| |||  '
    '  *    |  |* | |  ||| ---   |  | \| \  |   |  | \| |    |   '
    '  *    ||/ * |\   |   ---   |  | \|  \ |   |  | \| |    |   '
    '   *   |  *  | \  |||      ||| |  \ /  |  ||| |  \ \||  |   '
    '     ****                                                   '
    '           Software®                                        '
    '                                                            '
    '                                                            '
    '  Licensed Product                                          '
    '  Copyright © 1999-2001                                     '
    '  CyberCrypt Professional 7.0                               '
    '                                                            '
    '                                                            '
    '/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\'
    
'
'Please read the following information for your satisfaction of this product!
'
'As this product has producted, it follows with the following error:
'
'   * In program might crash VB work space if ran non-complied
'
'   * Please note for Most / All versions of CyberCrypt, needs a copy of mscomctl.ocx
'   ; in the same directory and not the system folder (But you can still have a copy
'   ; of mscomctl.ocx in the system folder). This is Due to Version problems with this
'   ; activeX component, and nothing to do with the program in any way.
'   ; This error may not always happen.
'
'NOTE:
'
'   Due to the major changes in this product from the last version their could
'   be bugs in it. Please contact the producer of this product released at the
'   bottem of this document and report any PROBLEMS or questions.
'
'
'   IF YOUR PROBLEM IS FIXED YOU WILL RECIVE AN EMAIL WITH CONFIRMATION
'   SO YOU CAN DOWNLOAD IT AGAIN FROM WERE YOU GOT IT FROM.
'
'   IF YOU WANT TO PLACE THIS PRODUCT ON A DIFFERENT SITE FROM WERE YOU GOT IT FROM
'   THEN PLEASE EMAIL ME THE SITE, SO I CAN UPDATE THE PROGRAM.
'
'
'                             Contact us at...
'
'                                    NeoBPI@ Yahoo.com
'
'                    ThankYou for using this software
'                    and we hope you enjoy it!
'
'                    Please contact us for news about
'                    updates in this product.
'
'                    Please feel free to add a comment
'                    and even come up with new ideas
'                    for another version (If any?)

'/////////////////////////////////////////////////////////////////////////

'(This is very important)
'Hi, over time since version 3.0 of CyberCrypt I have had many
'emails about zlib.dll People think that zlib.dll is constantly
'used in this program. Well you are wrong, it's only used to compress
'the files and nothing else.This means that it's only the compression
'archive you need the dll for. You can create an encryption archive
'and would not need to use this dll. Or even a normal non-compression
'archive which also you don't need this dll for.

'Whats a Swap archive?
'A Swap archive acts the same as a normal non-compression
'archive. But what happens is when adding a file, this type
'of archive splits the file up into smallier pieces and uses
'less memory.

'The Packed and Size properties:
'If making an non-compression archive the Size and packed propertie
'value should be the same. When having a compression archive
'the Size and Packed properties are usually different, this varies
'because files are compressed into the archive. The Size
'propertie shows what the original size of the file is outside of
'the archive. The Packed propertie shows the size of the file
'while in the archive.

'Converting archives?
'All the converting archive option does is change an archive which
'has been made in an older version of CyberCrypt and converts into
'the correct format for the newer versions of CyberCrypt.

'Coding Utility?
'The Coding Utility CODE is created by James Gohl, Copyright 1999-2001
'All other design by Mark Withers, Copyright 1999-2001

'Whats new about this version of CyberCrypt?

'*********Version 7.0**********

'**Advances!**
'New swap archive
'New coding utility
'New (In the archive properties dialog) how much space is requried to extract all files from the archive
'New (In the archive properties dialog) how much space archive data is taking up of the archive size
'Moved and better positioned file/archive/other properties
'New Saved Space propertie
'New Frequenly asked questions lay-out
'New Ratio propertie
'New lights to tell if you have lost or saved disk space
'New ProgressBars
'2.89% faster than before
'Better checking if archive is still active
'Tool tip text errors fixed
'Error logger problems fixed
'Lots of bug fixes
'Register bug fix (Now can load file type names longer than 88 characters (Now 4696 Characters))
'Archive types using less memory
'More Tip of the Day tips
'New Packed propertie in file information
'New File Created propertie in file information
'Lights in status bar
'Now easier to add more information data
'Big bug fix on checking file extension
'Countless bug fixes
'Neater displayed dialogs
'Faster opening archives
'More error debugging
'Now new Converting archive option & Three dialogs
'More frequently asked questions
'Checks if file has extension easier
'More source safe
'New featured status bar in the main window
'New splash screen
'Faster resizing main window

'**Disadvantages!**
'Can't delete file out of archive, need to create a new archive.

Private Declare Function FindFirstFile Lib "kernel32" Alias "FindFirstFileA" (ByVal lpFileName As String, lpFindFileData As WIN32_FIND_DATA) As Long
Private Declare Function FindClose Lib "kernel32" (ByVal hFindFile As Long) As Long
Private Declare Function FileTimeToSystemTime Lib "kernel32" (lpFileTime As FILETIME, lpSystemTime As SystemTime) As Long

Private FILETIME As SystemTime
Private FileData As WIN32_FIND_DATA

Private Type FILETIME
        dwLowDateTime As Long
        dwHighDateTime As Long
End Type

Private Type WIN32_FIND_DATA
        dwFilechkattrib As Long
        ftCreationTime As FILETIME
        ftLastAccessTime As FILETIME
        ftLastWriteTime As FILETIME
        nFileSizeHigh As Long
        nFileSizeLow As Long
        dwReserved0 As Long
        dwReserved1 As Long
        cFileName As String * MAX_PATH
        cAlternate As String * 14
End Type

Private Type SystemTime
        wYear As Integer
        wMonth As Integer
        wDayOfWeek As Integer
        wDay As Integer
        wHour As Integer
        wMinute As Integer
        wSecond As Integer
        wMilliseconds As Integer
End Type

Private Function FindFile(sFileName As String) As WIN32_FIND_DATA
    Dim Win32Data As WIN32_FIND_DATA
    Dim plngFirstFileHwnd As Long
    Dim plngRtn As Long
    
    ' Find file and get file data
    plngFirstFileHwnd = FindFirstFile(sFileName, Win32Data)
    If plngFirstFileHwnd = 0 Then
        FindFile.cFileName = "Error"
    Else
        FindFile = Win32Data
    End If
    plngRtn = FindClose(plngFirstFileHwnd)
End Function

Private Sub AddPic_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    AddPic.Picture = ImageListGray.ListImages.Item(4).Picture
    SetMenuIcons 2, True
End Sub

Private Sub AddPic_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    PopupMenu Menu02
End Sub

Private Sub Click01_Click()
    
    On Error GoTo FinaliseError
    If ListFiles.SelectedItem = "" Then
        Exit Sub
    Else
        
        If ExtractPath <> "" Then
            
            If ChkWarningMsg = True Then
                MessageBox "Are you sure you want to extract the file selected?", YesNo, Question
                If Result = 1 Then
                    ExtractSelFileNoDlg ExtractPath & "\" & ListFiles.SelectedItem.Text
                    Exit Sub
                ElseIf Result = 2 Then
                    Exit Sub
                End If
                    Else
                ExtractSelFileNoDlg ExtractPath & "\" & ListFiles.SelectedItem.Text
            End If
                
        Else
            
            If ChkWarningMsg = True Then
                MessageBox "Are you sure you want to extract the file selected?", YesNo, Question
                If Result = 1 Then
                    ExtractSelFile
                    Exit Sub
                ElseIf Result = 2 Then
                    Exit Sub
                End If
                    Else
                ExtractSelFile
            End If
        
        End If
    End If
                        
    Exit Sub
                    
FinaliseError:
    
    If Err = 32755 Then
        Exit Sub
            Else
        MessageBox "An unknown error occured!", OKOnly, Critical
    End If
                    
End Sub

Private Sub ExtractSelFileNoDlg(Path As String)
    
    On Error GoTo FinaliseError
    
    ArchiveName = RemoveBackSlash(CyTFile)
    CommonDialog.FileName = Path
    CommonDialog.FileTitle = ListFiles.SelectedItem.Text
    If CommonDialog.FileName = "" Then Exit Sub
    frmMain.StatusBar.Panels.Item(1).Text = "CyberCrypt Extracted (" & CommonDialog.FileTitle & ") from (" & ArchiveName & ")"
    If FileExist(CommonDialog.FileName) = True Then KillFile CommonDialog.FileName
    frmBusy.Show
    Me.Enabled = False
    Me.MousePointer = 11
    If CyTExtract(CyTFile, ListFiles.SelectedItem.Text, CommonDialog.FileName) = False Then MessageBox "An error occured when trying to extract the file!", OKOnly, Critical
    Me.Enabled = True
    Me.MousePointer = 0
    Unload frmBusy
    frmMain.SetFocus
    
        If LoadArchive = True Then
            CyTOpen CyTFile
            LoadArchive = False
            frmMain.StatusBar.Panels.Item(1).Text = "CyberCrypt Extracted (" & CommonDialog.FileTitle & ")"
            frmMain.SetFocus
        End If
    
    Exit Sub

FinaliseError:
   
    MessageBox "An unknown error occured while trying to extract the file(s). Please check the path specified in the options dialog.", OKOnly, Critical
 
End Sub

Private Sub ExtractSelFile()
    
    On Error GoTo FinaliseError
    
    ArchiveName = RemoveBackSlash(CyTFile)
    CommonDialog.flags = &H400 + &H4 + &H8 + &H2 + &H800
    CommonDialog.DialogTitle = "Save file"
    CommonDialog.Filter = "All files (*.*)|*.*"
    CommonDialog.DefaultExt = ""
    CommonDialog.FileName = ListFiles.SelectedItem.Text
    CommonDialog.ShowSave
    If CommonDialog.FileName = "" Then Exit Sub
    frmMain.StatusBar.Panels.Item(1).Text = "CyberCrypt Extracted (" & CommonDialog.FileTitle & ") from (" & ArchiveName & ")"
    If FileExist(CommonDialog.FileName) = True Then KillFile CommonDialog.FileName
    frmBusy.Show
    Me.Enabled = False
    Me.MousePointer = 11
    If CyTExtract(CyTFile, ListFiles.SelectedItem.Text, CommonDialog.FileName) = False Then MessageBox "An error occured when trying to extract the file!", OKOnly, Critical
    Me.Enabled = True
    Me.MousePointer = 0
    Unload frmBusy
    
        If LoadArchive = True Then
            CyTOpen CyTFile
            LoadArchive = False
            frmMain.StatusBar.Panels.Item(1).Text = "CyberCrypt Extracted (" & CommonDialog.FileTitle & ")"
        End If
    
    Exit Sub

FinaliseError:
    
    If Err = 32755 Then
        Exit Sub
            Else
        MessageBox "An unknown error occured!", OKOnly, Critical
    End If
    
End Sub

Private Sub ExtractAllTODir(Path As String)
    
    If ChkFile(CyTFile) = False Then Exit Sub
    
    On Error GoTo FinaliseError
    
        frmBusy.Show
        Me.Enabled = False
        Me.MousePointer = 11
        
        frmMain.StatusBar.Panels.Item(2).Picture = Lights.ListImages.Item(1).Picture
        frmMain.StatusBar.Panels.Item(3).Picture = Lights.ListImages.Item(4).Picture
    
    For M = 1 To frmMain.ListFiles.ListItems.Count
        frmMain.StatusBar.Panels.Item(1).Text = "CyberCrypt Extracted file to (" & Path & ") from (" & ArchiveName & ")"
        If FileExist(Path & "\" & frmMain.ListFiles.ListItems(M)) = True Then KillFile Path & "\" & frmMain.ListFiles.ListItems(M)
        If frmMain.CyTExtract(CyTFile, frmMain.ListFiles.ListItems(M), Path & "\" & frmMain.ListFiles.ListItems(M)) = False Then MessageBox "An error occured when trying to extract the file(s)!", OKOnly, Critical:  Me.Enabled = True: Me.MousePointer = 0: Unload frmBusy: Exit For
        DoEvents
    Next M
    
        frmMain.StatusBar.Panels.Item(2).Picture = Lights.ListImages.Item(2).Picture
        frmMain.StatusBar.Panels.Item(3).Picture = Lights.ListImages.Item(1).Picture
    
        Me.Enabled = True
        Me.MousePointer = 0
        Unload frmBusy
        frmMain.SetFocus
    
    Exit Sub
    
FinaliseError:
    MessageBox "An error occured when trying to extract the file(s)!, Please check the specified path in the options dialog.", OKOnly, Critical
    Unload frmBusy
    Me.Enabled = True
    Me.MousePointer = 0
    frmMain.SetFocus
    Exit Sub
    
End Sub

Private Sub Click02_Click()

    SelectOption = 1
    
    If ExtractPath <> "" Then
        
        If ChkWarningMsg = True Then
            MessageBox "Are you sure you want to extract all?", YesNo, Question
            If Result = 1 Then
                ExtractAllTODir ExtractPath
                Exit Sub
            ElseIf Result = 2 Then
                Exit Sub
            End If
                Else
            ExtractAllTODir ExtractPath
        End If
            
    Else
        
        If ChkWarningMsg = True Then
            MessageBox "Are you sure you want to extract all?", YesNo, Question
            If Result = 1 Then
                FrmDir.Show , Me
                Exit Sub
            ElseIf Result = 2 Then
                Exit Sub
            End If
                Else
            FrmDir.Show , Me
        End If
    
    End If
                        
    Exit Sub
        
End Sub

Private Sub Click03_Click()
    
    'Closes any unfree file buffers and clears it for new ones
    Close

    On Error GoTo FinaliseError
    
    CommonDialog.flags = &H1000 + &H4 + &H8 + &H800
    CommonDialog.DialogTitle = "ADD files to archive"
    CommonDialog.Filter = "All files (*.*)|*.*"
    CommonDialog.DefaultExt = ""
    CommonDialog.ShowOpen
    If CommonDialog.FileName = CyTFile Then MessageBox "You cannot add (" & CommonDialog.FileName & ") as it is the current archive opened.", OKOnly, Critical: GoTo ReGetFiles
    If FileLen(CommonDialog.FileName) = 0 Then MessageBox "File (" & CommonDialog.FileName & ") selected for adding to archive doesn't appear to contain any data. Files must contain at lease (" & MIN_BYTE_IN_FILE & ") byte. This file will not be included into the archive.", OKOnly, Critical: GoTo ReGetFiles
    
    'For D = 1 To Len(CommonDialog.FileName)
        'GetChr0 = Left(CommonDialog.FileName, D)
        'GetChr1 = Right(GetChr0, 1)
        'If GetChr1 = "." Then Exit For
        'If Len(GetChr0) = Len(CommonDialog.FileName) Then
            'MessageBox "You cannot and files into the archive without no file extensions.", OKOnly, Warning
            'Exit Sub
        'End If
    'Next D
    
    frmBusy.Show
    Me.Enabled = False
    Me.MousePointer = 11
    
    frmMain.StatusBar.Panels.Item(2).Picture = frmMain.Lights.ListImages.Item(1).Picture
    frmMain.StatusBar.Panels.Item(3).Picture = frmMain.Lights.ListImages.Item(4).Picture
    
    CyTAdd CyTFile, CommonDialog.FileName, CommonDialog.FileTitle
    
    Unload frmBusy
    Me.MousePointer = 0
    Me.Enabled = True
    SetAddMenu
    CyTOpen CyTFile
    
    frmMain.StatusBar.Panels.Item(2).Picture = frmMain.Lights.ListImages.Item(2).Picture
    frmMain.StatusBar.Panels.Item(3).Picture = frmMain.Lights.ListImages.Item(1).Picture
    
ReGetFiles:
    ChkIfLoad = False
    Me.SetFocus
    Exit Sub

FinaliseError:
    
    If Err = 32755 Then
        Exit Sub
            Else
        MessageBox "An unknown error occured!", OKOnly, Critical
    End If

End Sub

Private Sub Click04_Click()

    On Error GoTo FinaliseError
    SelectOption = 2
    FrmDir.Show 1, Me
    Exit Sub
                    
FinaliseError:
    
    If Err = 32755 Then
        Exit Sub
            Else
        MessageBox "An unknown error occured!", OKOnly, Critical
    End If

End Sub

Private Sub Click07_Click()
    
    'Closes any unfree file buffers and clears it for new ones
    Close
        
    On Error GoTo FinaliseError
    
    CommonDialog.flags = &H400 + &H4 + &H8 + &H2 + &H800
    CommonDialog.DialogTitle = "Save archive file"
    CommonDialog.Filter = "CyT File (*.CyT)|*.CyT|All files (*.*)|*.*"
    CommonDialog.DefaultExt = ".CyT"
    CommonDialog.ShowSave
    If CommonDialog.FileName = "" Then Exit Sub
    ArchiveName = CommonDialog.FileTitle
    GetListData
    SetNewMenu
    ChkLoad = True
    
    EncryptionAgent = False
    CompressionAgent = False
    
    If FileExist(CommonDialog.FileName) = True Then KillFile CommonDialog.FileName
    
    If CyTCreate(CommonDialog.FileName) = False Then
        MessageBox "Error, Unable to create new archive.", OKOnly, Critical
        CyTFile = ""
        CommonDialog.FileName = ""
        frmMain.StatusBar.Panels.Item(1).Text = "Choose " & Chr(34) & "New" & Chr(34) & " to create or " & Chr(34) & "Open" & Chr(34) & " to open an archive"
        AddPic.Enabled = False
        ExtractPic.Enabled = False
        FileInfoPic.Enabled = False
        CompressPic.Enabled = False
        AddPic.Picture = ImageListGray.ListImages.Item(4).Picture
        ExtractPic.Picture = ImageListGray.ListImages.Item(3).Picture
        FileInfoPic.Picture = ImageListGray.ListImages.Item(6).Picture
        CompressPic.Picture = ImageListGray.ListImages.Item(9).Picture
        ListFiles.ListItems.Clear
        SetCloseMenu
    End If
    
    ChkLoad = False
    ExtractPic.Enabled = False: ExtractPic.Picture = ImageListGray.ListImages(3).Picture
    FileInfoPic.Enabled = False: FileInfoPic.Picture = ImageListGray.ListImages(6).Picture
    AddPic.Enabled = True: AddPic.Picture = ImageList.ListImages(4).Picture
    ListFiles.ListItems.Clear
    ChkIfLoad = False
    Exit Sub
    
FinaliseError:
    If Err = 32755 Then
        Exit Sub
            Else
        MessageBox "An unknown error occured!", OKOnly, Critical
    End If
    
End Sub

Private Sub Click08_Click()
    
    On Error Resume Next
    
    'Closes any unfree file buffers and clears it for new ones
    Close
    
    'On Error GoTo FinaliseError
    
    CommonDialog.flags = &H1000 + &H4 + &H8 + &H800
    CommonDialog.Filter = "CyT File (*.CyT)|*.CyT|All files (*.*)|*.*"
    CommonDialog.DialogTitle = "Open archive file"
    CommonDialog.DefaultExt = ""
    CommonDialog.ShowOpen
    
    If CommonDialog.FileName = "" Then Exit Sub
    
    ArchiveName = CommonDialog.FileTitle
    GetListData
    ChkFastLoad = False
    SetOpenMenu
    
    If FileExist(CommonDialog.FileName) = True Then
        ChkLoad = True
        frmMain.StatusBar.Panels.Item(2).Picture = frmMain.Lights.ListImages.Item(1).Picture
        frmMain.StatusBar.Panels.Item(3).Picture = frmMain.Lights.ListImages.Item(4).Picture
        DoEvents
        
        If CyTOpen(CommonDialog.FileName) = False Then
            CyTFile = ""
            CommonDialog.FileName = ""
            frmMain.StatusBar.Panels.Item(1).Text = "Choose " & Chr(34) & "New" & Chr(34) & " to create or " & Chr(34) & "Open" & Chr(34) & " to open an archive"
            AddPic.Enabled = False
            ExtractPic.Enabled = False
            FileInfoPic.Enabled = False
            CompressPic.Enabled = False
            AddPic.Picture = ImageListGray.ListImages.Item(4).Picture
            ExtractPic.Picture = ImageListGray.ListImages.Item(3).Picture
            FileInfoPic.Picture = ImageListGray.ListImages.Item(6).Picture
            CompressPic.Picture = ImageListGray.ListImages.Item(9).Picture
            ListFiles.ListItems.Clear
            SetCloseMenu
        End If
        
        frmMain.StatusBar.Panels.Item(2).Picture = frmMain.Lights.ListImages.Item(2).Picture
        frmMain.StatusBar.Panels.Item(3).Picture = frmMain.Lights.ListImages.Item(1).Picture
        ChkLoad = False
        ChkIfLoad = False
    End If
    
    Exit Sub
    
FinaliseError:
    
        frmMain.StatusBar.Panels.Item(2).Picture = frmMain.Lights.ListImages.Item(2).Picture
        frmMain.StatusBar.Panels.Item(3).Picture = frmMain.Lights.ListImages.Item(1).Picture
            
        MessageBox "An unknown error occured!", OKOnly, Critical
    
End Sub

Private Sub Click09_Click()
    Close
    CyTFile = ""
    CommonDialog.FileName = ""
    frmMain.StatusBar.Panels.Item(1).Text = "Choose " & Chr(34) & "New" & Chr(34) & " to create or " & Chr(34) & "Open" & Chr(34) & " to open an archive"
    AddPic.Enabled = False
    ExtractPic.Enabled = False
    FileInfoPic.Enabled = False
    CompressPic.Enabled = False
    AddPic.Picture = ImageListGray.ListImages.Item(4).Picture
    ExtractPic.Picture = ImageListGray.ListImages.Item(3).Picture
    FileInfoPic.Picture = ImageListGray.ListImages.Item(6).Picture
    CompressPic.Picture = ImageListGray.ListImages.Item(9).Picture
    frmMain.StatusBar.Panels.Item(2).Picture = frmMain.Lights.ListImages.Item(2).Picture
    frmMain.StatusBar.Panels.Item(3).Picture = frmMain.Lights.ListImages.Item(1).Picture
    ListFiles.ListItems.Clear
    SetCloseMenu
End Sub

Private Sub Click10_Click()
    On Error Resume Next
    FrmOptions.Show 1, Me
End Sub

Private Sub Click11_Click()
    On Error Resume Next
    FrmMoveArch.Show 1, Me
End Sub

Private Sub Click12_Click()
    On Error Resume Next
    FrmCopyArch.Show 1, Me
End Sub

Private Sub Click13_Click()
    On Error Resume Next
    ReNameArch.Show 1, Me
End Sub

Private Sub Click14_Click()
    MessageBox "Are you sure you want to delete this archive?", YesNo, Question
    If Result = 1 Then
        If KillArchive(CyTFile) = True Then
            CyTFile = ""
            CommonDialog.FileName = ""
            frmMain.StatusBar.Panels.Item(1).Text = "Choose " & Chr(34) & "New" & Chr(34) & " to create or " & Chr(34) & "Open" & Chr(34) & " to open an archive"
            AddPic.Enabled = False
            ExtractPic.Enabled = False
            FileInfoPic.Enabled = False
            CompressPic.Enabled = False
            AddPic.Picture = ImageListGray.ListImages.Item(4).Picture
            ExtractPic.Picture = ImageListGray.ListImages.Item(3).Picture
            FileInfoPic.Picture = ImageListGray.ListImages.Item(6).Picture
            CompressPic.Picture = ImageListGray.ListImages.Item(9).Picture
            ListFiles.ListItems.Clear
            SetCloseMenu
                Else
            MessageBox "Error, Could not delete archive.", OKOnly, Critical
        End If
    ElseIf Result = 2 Then Exit Sub
    End If
End Sub

Private Sub Click15_1_Click()
    On Error Resume Next
    FrmConvert.Show 1, Me
End Sub

Private Sub Click15_2_Click()
    On Error Resume Next
    FrmUtility01.Show 1, Me
End Sub

Private Sub Click15_Click()
    End
End Sub

Private Sub Click16_Click()
    Click03_Click
End Sub

Private Sub Click17_Click()
    Click04_Click
End Sub

Private Sub Click18_Click()
    Click01_Click
End Sub

Private Sub Click19_Click()
    Click02_Click
End Sub

Private Sub Click20_Click()

    If CyTFile = "" Then Exit Sub
    If ExtractPic.Enabled = False Then Exit Sub
    If ListFiles.SelectedItem = "" Then Exit Sub
    
    If Right(ListFiles.SelectedItem.Text, 3) = "CyT" Then
        MessageBox "You cannot open this type of file form here. You have to extract it first. Would you like to extract now?", OKCancel, Question
        If Result = 3 Then
            LoadArchive = False
            Exit Sub
                Else
            LoadArchive = True
            Click01_Click
        End If
            Else
        LoadArchive = False
        KillFile TempRootS & "\" & ListFiles.SelectedItem.Text
        frmBusy.Show
        Me.Enabled = False
        Me.MousePointer = 11
        If CyTExtract(CyTFile, ListFiles.SelectedItem.Text, TempRootS & "\" & ListFiles.SelectedItem.Text) = True Then
            ExFile TempRootS & "\" & ListFiles.SelectedItem
            'KillFile TempRootS & "\" & ListFiles.SelectedItem
            Unload frmBusy
            Me.Enabled = True
            Me.MousePointer = 0
            frmMain.StatusBar.Panels.Item(2).Picture = frmMain.Lights.ListImages.Item(2).Picture
            frmMain.StatusBar.Panels.Item(3).Picture = frmMain.Lights.ListImages.Item(1).Picture
            frmMain.SetFocus
                Else
            Unload frmBusy
            Me.Enabled = True
            Me.MousePointer = 0
            Click01_Click
        End If
    End If
    
End Sub

Private Sub Click21_Click()

    On Error GoTo FinaliseError

    If QViewON = True Then
        If QuickViewPath = "" Then
            MessageBox "Before using this feature please configure the QuickView settings.", OKOnly, Information
            Exit Sub
        End If
        If QViewDirectory = "" Then
            MessageBox "Before using this feature please configure the QuickView settings.", OKOnly, Information
            Exit Sub
        End If
            Else
        If QuickViewPath = "" Then
            MessageBox "Before using this feature please configure the QuickView settings.", OKOnly, Information
            Exit Sub
        End If
        If TempRootS = "" Then
            MessageBox "Error, Could not find your main working folder. It is recomended that you restart the program.", OKOnly, Critical
            Exit Sub
        End If
    End If

    frmMain.StatusBar.Panels.Item(2).Picture = frmMain.Lights.ListImages.Item(1).Picture
    frmMain.StatusBar.Panels.Item(3).Picture = frmMain.Lights.ListImages.Item(4).Picture

    If QViewAlert = True Then
        MessageBox "You are about to extract and view this file, are you sure you want to view it now?", YesNo, Question
        If Result = 1 Then
            If QViewON = True Then
                Me.Enabled = False
                Me.MousePointer = 11
                frmBusy.Show
                If FileExist(QViewDirectory & "\" & ListFiles.SelectedItem.Text) = True Then KillFile QViewDirectory & "\" & ListFiles.SelectedItem.Text
                If CyTExtract(CyTFile, ListFiles.SelectedItem.Text, QViewDirectory & "\" & ListFiles.SelectedItem.Text) = False Then GoTo FinaliseError
                Unload frmBusy
                Me.Enabled = True
                Me.MousePointer = 0
                Me.SetFocus
                Shell QuickViewPath & " " & QViewDirectory & "\" & ListFiles.SelectedItem.Text, vbNormalFocus
                frmMain.StatusBar.Panels.Item(2).Picture = frmMain.Lights.ListImages.Item(2).Picture
                frmMain.StatusBar.Panels.Item(3).Picture = frmMain.Lights.ListImages.Item(1).Picture
                    Else
                Me.Enabled = False
                Me.MousePointer = 11
                frmBusy.Show
                If FileExist(TempRootS & "\" & ListFiles.SelectedItem.Text) = True Then KillFile TempRootS & "\" & ListFiles.SelectedItem.Text
                If CyTExtract(CyTFile, ListFiles.SelectedItem.Text, TempRootS & "\" & ListFiles.SelectedItem.Text) = False Then GoTo FinaliseError
                Unload frmBusy
                Me.Enabled = True
                Me.MousePointer = 0
                Me.SetFocus
                Shell QuickViewPath & " " & TempRootS & "\" & ListFiles.SelectedItem.Text, vbNormalFocus
                frmMain.StatusBar.Panels.Item(2).Picture = frmMain.Lights.ListImages.Item(2).Picture
                frmMain.StatusBar.Panels.Item(3).Picture = frmMain.Lights.ListImages.Item(1).Picture
            End If
        End If
        If Result = 2 Then
            frmMain.StatusBar.Panels.Item(2).Picture = frmMain.Lights.ListImages.Item(2).Picture
            frmMain.StatusBar.Panels.Item(3).Picture = frmMain.Lights.ListImages.Item(1).Picture
            Exit Sub
        End If
        Else
            If QViewON = True Then
                Me.Enabled = False
                Me.MousePointer = 11
                frmBusy.Show
                If FileExist(QViewDirectory & "\" & ListFiles.SelectedItem.Text) = True Then KillFile QViewDirectory & "\" & ListFiles.SelectedItem.Text
                If CyTExtract(CyTFile, ListFiles.SelectedItem.Text, QViewDirectory & "\" & ListFiles.SelectedItem.Text) = False Then GoTo FinaliseError
                Unload frmBusy
                Me.Enabled = True
                Me.MousePointer = 0
                Me.SetFocus
                Shell QuickViewPath & " " & QViewDirectory & "\" & ListFiles.SelectedItem.Text, vbNormalFocus
                frmMain.StatusBar.Panels.Item(2).Picture = frmMain.Lights.ListImages.Item(2).Picture
                frmMain.StatusBar.Panels.Item(3).Picture = frmMain.Lights.ListImages.Item(1).Picture
                    Else
                Me.Enabled = False
                Me.MousePointer = 11
                frmBusy.Show
                If FileExist(TempRootS & "\" & ListFiles.SelectedItem.Text) = True Then KillFile TempRootS & "\" & ListFiles.SelectedItem.Text
                If CyTExtract(CyTFile, ListFiles.SelectedItem.Text, TempRootS & "\" & ListFiles.SelectedItem.Text) = False Then GoTo FinaliseError
                Unload frmBusy
                Me.Enabled = True
                Me.MousePointer = 0
                Me.SetFocus
                Shell QuickViewPath & " " & TempRootS & "\" & ListFiles.SelectedItem.Text, vbNormalFocus
                frmMain.StatusBar.Panels.Item(2).Picture = frmMain.Lights.ListImages.Item(2).Picture
                frmMain.StatusBar.Panels.Item(3).Picture = frmMain.Lights.ListImages.Item(1).Picture
            End If
    End If
    
    Exit Sub
    
FinaliseError:

    MessageBox "Error, could not open file to view. If the error persists check the QuickView options, the working folder or the quickview aplication path maybe incorrect.", OKOnly, Critical
    Unload frmBusy
    Me.Enabled = True
    Me.MousePointer = 0
    Me.SetFocus
        
End Sub

Private Sub Click21Opt_Click()
    On Error Resume Next
    FrmQuickViewOpt.Show 1
End Sub

Private Sub Click22_Click()

    On Error GoTo FinaliseError

    If VScanON = True Then
        If VirusScanPath = "" Then
            MessageBox "Before using this feature please configure the VirusScan settings.", OKOnly, Information
            Exit Sub
        End If
        If VScanDirectory = "" Then
            MessageBox "Before using this feature please configure the VirusScan settings.", OKOnly, Information
            Exit Sub
        End If
            Else
        If VirusScanPath = "" Then
            MessageBox "Before using this feature please configure the VirusScan settings.", OKOnly, Information
            Exit Sub
        End If
        If TempRootS = "" Then
            MessageBox "Error, Could not find your main working folder. It is recomended that you restart the program.", OKOnly, Critical
            Exit Sub
        End If
    End If
    
        frmMain.StatusBar.Panels.Item(2).Picture = frmMain.Lights.ListImages.Item(1).Picture
        frmMain.StatusBar.Panels.Item(3).Picture = frmMain.Lights.ListImages.Item(4).Picture
        
        If VScanAlert = True Then
        MessageBox "You are about to extract and scan all file(s), are you sure you want to do so now?", YesNo, Question
        If Result = 1 Then
            If VScanON = True Then
                Me.Enabled = False
                Me.MousePointer = 11
                frmBusy.Show
                Randomize Timer
                Temp = CStr(Int(Rnd * 10000))
                If FolderExist(VScanDirectory & "\CyTVs" & Temp & "\") = True Then
                    ChDir VScanDirectory & "\CyTVs" & Temp & "\"
                    Kill "*.*"
                    RmDir VScanDirectory & "\CyTVs" & Temp & "\"
                End If
                MkDir VScanDirectory & "\CyTVs" & Temp & "\"
                For Z = 1 To frmMain.ListFiles.ListItems.Count
                    If FileExist(VScanDirectory & "\CyTVs" & Temp & "\" & frmMain.ListFiles.ListItems(Z)) = True Then KillFile VScanDirectory & "\CyTVs" & Temp & "\" & frmMain.ListFiles.ListItems(Z)
                    If CyTExtract(CyTFile, frmMain.ListFiles.ListItems(Z), VScanDirectory & "\CyTVs" & Temp & "\" & frmMain.ListFiles.ListItems(Z)) = False Then MessageBox "An error occured when trying to extract the file(s) for VirusScan!", OKOnly, Critical: Unload frmBusy: Exit For
                    DoEvents
                Next
                Unload frmBusy
                Me.Enabled = True
                Me.MousePointer = 0
                Me.SetFocus
                Shell VirusScanPath & " " & Chr(34) & VScanDirectory & "\CyTVs" & Temp & "\" & Chr(34) & " /AUTOSCAN", vbNormalFocus
                frmMain.StatusBar.Panels.Item(2).Picture = frmMain.Lights.ListImages.Item(2).Picture
                frmMain.StatusBar.Panels.Item(3).Picture = frmMain.Lights.ListImages.Item(1).Picture
                    Else
                Me.Enabled = False
                Me.MousePointer = 11
                frmBusy.Show
                Randomize Timer
                Temp = CStr(Int(Rnd * 10000))
                If FolderExist(TempRootS & "\CyTVs" & Temp & "\") = True Then
                    ChDir TempRootS & "\CyTVs" & Temp & "\"
                    Kill "*.*"
                    RmDir TempRootS & "\CyTVs" & Temp & "\"
                End If
                MkDir TempRootS & "\CyTVs" & Temp & "\"
                For Z = 1 To frmMain.ListFiles.ListItems.Count
                    If FileExist(TempRootS & "\CyTVs" & Temp & "\" & frmMain.ListFiles.ListItems(Z)) = True Then KillFile TempRootS & "\CyTVs" & Temp & "\" & frmMain.ListFiles.ListItems(Z)
                    If CyTExtract(CyTFile, frmMain.ListFiles.ListItems(Z), TempRootS & "\CyTVs" & Temp & "\" & frmMain.ListFiles.ListItems(Z)) = False Then MessageBox "An error occured when trying to extract the file(s) for VirusScan!", OKOnly, Critical: Unload frmBusy: Exit For
                    DoEvents
                Next
                Unload frmBusy
                Me.Enabled = True
                Me.MousePointer = 0
                Me.SetFocus
                Shell VirusScanPath & " " & Chr(34) & TempRootS & "\CyTVs" & Temp & "\" & Chr(34) & " /AUTOSCAN", vbNormalFocus
                frmMain.StatusBar.Panels.Item(2).Picture = frmMain.Lights.ListImages.Item(2).Picture
                frmMain.StatusBar.Panels.Item(3).Picture = frmMain.Lights.ListImages.Item(1).Picture
            End If
        End If
        If Result = 2 Then
            frmMain.StatusBar.Panels.Item(2).Picture = frmMain.Lights.ListImages.Item(2).Picture
            frmMain.StatusBar.Panels.Item(3).Picture = frmMain.Lights.ListImages.Item(1).Picture
            Exit Sub
        End If
        Else
            If VScanON = True Then
                Me.Enabled = False
                Me.MousePointer = 11
                frmBusy.Show
                Randomize Timer
                Temp = CStr(Int(Rnd * 10000))
                If FolderExist(VScanDirectory & "\CyTVs" & Temp & "\") = True Then
                    ChDir VScanDirectory & "\CyTVs" & Temp & "\"
                    Kill "*.*"
                    RmDir VScanDirectory & "\CyTVs" & Temp & "\"
                End If
                MkDir VScanDirectory & "\CyTVs" & Temp & "\"
                For Z = 1 To frmMain.ListFiles.ListItems.Count
                    If FileExist(VScanDirectory & "\CyTVs" & Temp & "\" & frmMain.ListFiles.ListItems(Z)) = True Then KillFile VScanDirectory & "\CyTVs" & Temp & "\" & frmMain.ListFiles.ListItems(Z)
                    If CyTExtract(CyTFile, frmMain.ListFiles.ListItems(Z), VScanDirectory & "\CyTVs" & Temp & "\" & frmMain.ListFiles.ListItems(Z)) = False Then MessageBox "An error occured when trying to extract the file(s) for VirusScan!", OKOnly, Critical: Unload frmBusy: Exit For
                    DoEvents
                Next
                Unload frmBusy
                Me.Enabled = True
                Me.MousePointer = 0
                Me.SetFocus
                Shell VirusScanPath & " " & Chr(34) & VScanDirectory & "\CyTVs" & Temp & "\" & Chr(34) & " /AUTOSCAN", vbNormalFocus
                frmMain.StatusBar.Panels.Item(2).Picture = frmMain.Lights.ListImages.Item(2).Picture
                frmMain.StatusBar.Panels.Item(3).Picture = frmMain.Lights.ListImages.Item(1).Picture
                    Else
                Me.Enabled = False
                Me.MousePointer = 11
                frmBusy.Show
                Randomize Timer
                Temp = CStr(Int(Rnd * 10000))
                If FolderExist(TempRootS & "\CyTVs" & Temp & "\") = True Then
                    ChDir TempRootS & "\CyTVs" & Temp & "\"
                    Kill "*.*"
                    RmDir TempRootS & "\CyTVs" & Temp & "\"
                End If
                MkDir TempRootS & "\CyTVs" & Temp & "\"
                For Z = 1 To frmMain.ListFiles.ListItems.Count
                    If FileExist(TempRootS & "\CyTVs" & Temp & "\" & frmMain.ListFiles.ListItems(Z)) = True Then KillFile TempRootS & "\CyTVs" & Temp & "\" & frmMain.ListFiles.ListItems(Z)
                    If CyTExtract(CyTFile, frmMain.ListFiles.ListItems(Z), TempRootS & "\CyTVs" & Temp & "\" & frmMain.ListFiles.ListItems(Z)) = False Then MessageBox "An error occured when trying to extract the file(s) for VirusScan!", OKOnly, Critical: Unload frmBusy: Exit For
                    DoEvents
                Next
                Unload frmBusy
                Me.Enabled = True
                Me.MousePointer = 0
                Me.SetFocus
                Shell VirusScanPath & " " & Chr(34) & TempRootS & "\CyTVs" & Temp & "\" & Chr(34) & " /AUTOSCAN", vbNormalFocus
                frmMain.StatusBar.Panels.Item(2).Picture = frmMain.Lights.ListImages.Item(2).Picture
                frmMain.StatusBar.Panels.Item(3).Picture = frmMain.Lights.ListImages.Item(1).Picture
            End If
    End If
    
    Exit Sub
    
FinaliseError:

    MessageBox "Error, could not open file(s) to VirusScan. If the error persists check the VirusScan options, the working folder or the VirusScan aplication path maybe incorrect.", OKOnly, Critical
    Unload frmBusy
    Me.Enabled = True
    Me.MousePointer = 0
    Me.SetFocus
        
End Sub

Private Sub Click22Opt_Click()
    On Error Resume Next
    FrmVirusScanOpt.Show 1
End Sub

Private Sub Click23_Click()
    On Error GoTo FinaliseError
    frmMain.StatusBar.Panels.Item(1).Text = "CyberCrypt Opened fileInfo (" & ListFiles.SelectedItem & ") in (" & ArchiveName & ")"
    Select_F_A_Type = 1
    GetFileData
    Exit Sub
FinaliseError:
    MessageBox "An internal error occured.", OKOnly, Critical
    End
End Sub

Private Sub Click232_Click()
    On Error Resume Next
    FrmCompression.Show 1
End Sub

Private Sub Click233_Click()
        
    frmMain.StatusBar.Panels.Item(2).Picture = frmMain.Lights.ListImages.Item(1).Picture
    frmMain.StatusBar.Panels.Item(3).Picture = frmMain.Lights.ListImages.Item(4).Picture
        
    If CyTOpen(CyTFile) = False Then
        MessageBox "Their seems to be a problem with refreshing and re-opening the current archive.", OKOnly, Critical
        Click09_Click
    End If
        
    frmMain.StatusBar.Panels.Item(2).Picture = frmMain.Lights.ListImages.Item(2).Picture
    frmMain.StatusBar.Panels.Item(3).Picture = frmMain.Lights.ListImages.Item(1).Picture
        
End Sub

Private Sub Click24_Click()
    On Error Resume Next
    FrmTips.Show 1
End Sub

Private Sub Click25_Click()

    On Error GoTo FinaliseError
    
    Shell App.Path & "\HelpTopics.exe -Srh", vbNormalFocus
    Exit Sub
FinaliseError:
    MessageBox "Error, Help topics could not be found.", OKOnly, Critical

End Sub

Private Sub Click26_Click()
    On Error Resume Next
    FrmFreqQuestions.Show 1, Me
End Sub

Private Sub Click27_Click()
    On Error Resume Next
    FrmLicense.Show 1, Me
End Sub

Private Sub Click28_Click()
    On Error Resume Next
    frmAbout.Show 1, Me
End Sub

Private Sub Click29_Click()

 On Error GoTo FinaliseError
    
    Shell App.Path & "\HelpTopics.exe -Cnt", vbNormalFocus
    Exit Sub
FinaliseError:
    MessageBox "Error, Help topics could not be found.", OKOnly, Critical
    
End Sub

Private Sub CompressPic_Click()
    Click232_Click
End Sub

Private Sub CompressPic_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    CompressPic.Picture = ImageListGray.ListImages.Item(9).Picture
    SetMenuIcons 5, True
End Sub

Private Sub ExitPic_Click()
    End
End Sub

Private Sub GetFileData()

    On Error GoTo FinaliseError
    
    If ListFiles.SelectedItem = "" Then
        Exit Sub
    Else
        If FileExist(TempRootS & "\" & ListFiles.SelectedItem) = True Then KillFile TempRootS & "\" & ListFiles.SelectedItem
        frmBusy.Show
        Me.Enabled = False
        Me.MousePointer = 11
        CyTExtract CyTFile, ListFiles.SelectedItem, TempRootS & "\" & ListFiles.SelectedItem
        Me.Enabled = True
        Me.MousePointer = 0
        Unload frmBusy
        Select Case Right(LCase$(ListFiles.SelectedItem), 3)
            'Text files
            'Case LCase$("txt"): <Text Viewer Form>: Exit Sub
            'Case LCase$("ini"): <Text Viewer Form>: Exit Sub
            'Case LCase$("inf"): <Text Viewer Form>: Exit Sub
            'Case LCase$("cfg"): <Text Viewer Form>: Exit Sub
            'Case LCase$("log"): <Text Viewer Form>: Exit Sub
            'Case LCase$("bat"): <Text Viewer Form>: Exit Sub
        End Select
        FrmFileInfo.Show 1, Me
    End If

    Exit Sub
    
FinaliseError:

End Sub

Private Sub ExitPic_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    ExitPic.Picture = ImageListGray.ListImages.Item(7).Picture
    SetMenuIcons 8, True
End Sub

Private Sub ExtractPic_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    ExtractPic.Picture = ImageListGray.ListImages.Item(3).Picture
    SetMenuIcons 3, True
End Sub

Private Sub ExtractPic_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Button = 1 Then
        PopupMenu Menu01
    End If
End Sub

Private Sub FileInfoPic_Click()
    Click23_Click
End Sub

Private Sub FileInfoPic_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    FileInfoPic.Picture = ImageListGray.ListImages.Item(6).Picture
    SetMenuIcons 4, True
End Sub

Private Sub GetInIData()
    
    Dim LoadResult As String
    Dim LoadResultB As String
    
    On Error Resume Next
    
    LoadResult = String(100, "*")
    lLength = Len(LoadResult)
    
    GetPrivateProfileString "Settings", "SmallIcons", vbNullString, LoadResult, lLength, App.Path & "\Settings.ini"
    If LCase$(LoadResult) = True Then frmMain.ListFiles.View = lvwSmallIcon
    
    GetPrivateProfileString "Settings", "Lists", vbNullString, LoadResult, lLength, App.Path & "\Settings.ini"
    If LCase$(LoadResult) = True Then frmMain.ListFiles.View = lvwList

    GetPrivateProfileString "Settings", "NormalIcons", vbNullString, LoadResult, lLength, App.Path & "\Settings.ini"
    If LCase$(LoadResult) = True Then frmMain.ListFiles.View = lvwIcon
    
    GetPrivateProfileString "Settings", "Report", vbNullString, LoadResult, lLength, App.Path & "\Settings.ini"
    If LCase$(LoadResult) = True Then frmMain.ListFiles.View = lvwReport
    
    LoadResult = String(100, "*")
    lLength = Len(LoadResult)
        
    GetPrivateProfileString "Settings", "SendTo", vbNullString, LoadResult, lLength, App.Path & "\Settings.ini"
    If LCase$(LoadResult) = True Then
              
        sString = String(100, "*")
        lLength = Len(sString)
        
        GetPrivateProfileString "Settings", "ExPath", vbNullString, sString, lLength, App.Path & "\Settings.ini"
        
        'This codes here because when the string loads in a veriable
        'it adds on one blank (chr(0)) and a return of lLength (*).
        'So this code takes the end and the chr(0) away. This
        'code is needed only because you are loading a string that
        'has been written into the ini without speech marks around the
        'it. This is easy to change but it is safer to use as
        'the code might think that theirs a speech mark in path
        'that loads into the veraible (ExtractPath).
        
        sString = Mid(sString, 1, InStr(1, sString, Chr$(0)) - 1)
        ExtractPath = sString
        
        'For M = 1 To Len(sString)
        '    getchr1 = Left(sString, M)
        '    getchr2 = Right(getchr1, 1)
        '    If Asc(getchr2) = 0 Then ExtractPath = Left(sString, M - 1): Exit For
        'Next M
        
        'If the user has not yet entered the settings or if the prompt
        'option is used and the extract path has not been specified then
        'the veriable (ExtractPath) may become "False" so this code checks
        'the case and sees if the veriable string is "False" and sets it
        'to "" as "False" is an invalid folder of drive name on it's own.
        
        If LCase$(ExtractPath) = LCase$("False") Then ExtractPath = ""
               
    End If
    
    LoadResult = String(100, "*")
    lLength = Len(LoadResult)
    
    GetPrivateProfileString "QuickView", "QViewOpt", vbNullString, LoadResult, lLength, App.Path & "\Settings.ini"
    If LCase$(LoadResult) = True Then QViewON = True Else QViewON = False
    
    GetPrivateProfileString "QuickView", "QViewAlert", vbNullString, LoadResult, lLength, App.Path & "\Settings.ini"
    If LoadResult = 1 Then QViewAlert = True Else QViewAlert = False
    sString = String(100, "*")
    lLength = Len(sString)
    
    GetPrivateProfileString "QuickView", "QuickView", vbNullString, sString, lLength, App.Path & "\Settings.ini"
    sString = Mid(sString, 1, InStr(1, sString, Chr$(0)) - 1)
    If sString = String(100, "*") Then sString = ""
    QuickViewPath = sString
    
    If QuickViewPath = "" Then QuickViewPath = GetFileTypeName("QuickView\shell\open\command")
    
    GetPrivateProfileString "QuickView", "QViewOther", vbNullString, sString, lLength, App.Path & "\Settings.ini"
    sString = Mid(sString, 1, InStr(1, sString, Chr$(0)) - 1)
    If sString = String(100, "*") Then sString = ""
    QViewDirectory = sString
    
    'If sString = "" Then QViewDirectory = TempRootS

    LoadResult = String(100, "*")
    lLength = Len(LoadResult)
    
    GetPrivateProfileString "VirusScan", "VScanOpt", vbNullString, LoadResult, lLength, App.Path & "\Settings.ini"
    If LCase$(LoadResult) = True Then VScanON = True Else VScanON = False
    
    GetPrivateProfileString "VirusScan", "VScanAlert", vbNullString, LoadResult, lLength, App.Path & "\Settings.ini"
    If LoadResult = 1 Then VScanAlert = True Else VScanAlert = False
    sString = String(100, "*")
    lLength = Len(sString)
    
    GetPrivateProfileString "VirusScan", "VirusScan", vbNullString, sString, lLength, App.Path & "\Settings.ini"
    sString = Mid(sString, 1, InStr(1, sString, Chr$(0)) - 1)
    If sString = String(100, "*") Then sString = ""
    VirusScanPath = sString
       
    GetPrivateProfileString "VirusScan", "VScanOther", vbNullString, sString, lLength, App.Path & "\Settings.ini"
    sString = Mid(sString, 1, InStr(1, sString, Chr$(0)) - 1)
    If sString = String(100, "*") Then sString = ""
    VScanDirectory = sString
    
    'If sString = "" Then VScanDirectory = TempRootS
                
    LoadResult = String(100, "*")
    lLength = Len(LoadResult)

    GetPrivateProfileString "Settings", "Prompt", vbNullString, LoadResult, lLength, App.Path & "\Settings.ini"
    If LCase$(LoadResult) = True Then ExtractPath = ""
        
    LoadResultB = String(100, "*")
    lLength = Len(LoadResultB)

    GetPrivateProfileString "Settings", "Sort", vbNullString, LoadResultB, lLength, App.Path & "\Settings.ini"
    If LoadResultB = 1 Then frmMain.ListFiles.Sorted = True Else frmMain.ListFiles.Sorted = False

    GetPrivateProfileString "Settings", "Grid", vbNullString, LoadResultB, lLength, App.Path & "\Settings.ini"
    If LoadResultB = 1 Then frmMain.ListFiles.GridLines = True Else frmMain.ListFiles.GridLines = False
    
    GetPrivateProfileString "Settings", "Warn", vbNullString, LoadResultB, lLength, App.Path & "\Settings.ini"
    If LoadResultB = 1 Then ChkWarningMsg = True Else ChkWarningMsg = False
    If LoadResultB = String(100, "*") Then ChkWarningMsg = False

    'Gets the compression level
    GetPrivateProfileString "Compression", "Level", vbNullString, LoadResultB, lLength, App.Path & "\Settings.ini"
    LoadResultB = Mid(LoadResultB, 1, InStr(1, LoadResultB, Chr$(0)) - 1)
    CompressionLevel = CInt(LoadResultB)
    If CompressionLevel <> -1 And CompressionLevel <> 3 And CompressionLevel <> 6 And CompressionLevel <> 9 And CompressionLevel <> 0 Then CompressionLevel = 6
    
End Sub

Private Sub Form_Load()

    FrmSplash.lblProgress.Caption = "Loading Temp settings..."
        
    FrmSplash.lblProgress.Refresh
        
    For M = 1 To Len(GetTemporaryFilename)
        GetChr1 = Left(GetTemporaryFilename, M)
        GetChr2 = Right(GetChr1, 1)
        If GetChr2 = "\" Or GetChr2 = "/" Then
            TempRootS = GetChr1
        End If
    Next M
    
    FrmSplash.lblProgress.Caption = "Registering archive types..."
        
    FrmSplash.lblProgress.Refresh
        
    RegisterArchiveType
        
    FolIndex = 0
    CompressionAgent = False
    EncryptionAgent = False
    SwapAgent = False
    ChkFastLoad = False
    LoadProg = True

    FrmSplash.lblProgress.Caption = "Loading menu settings..."
    
    FrmSplash.lblProgress.Refresh
    
    GetInIData
    
    ListFiles.ColumnHeaders.Add , , "Filename", 2400
    ListFiles.ColumnHeaders.Add , , "File type", 2100
    ListFiles.ColumnHeaders.Add , , "Size", 2100
    ListFiles.ColumnHeaders.Add , , "Ratio", 700
    ListFiles.ColumnHeaders.Add , , "Packed", 2100
    ListFiles.ColumnHeaders.Add , , "Saved Space", 2200
    ListFiles.ColumnHeaders.Add , , "% Of archive", 1200
    ListFiles.ColumnHeaders.Add , , "Created", 1800
    ListFiles.ColumnHeaders.Add , , "Added", 1800
    ListFiles.ColumnHeaders.Add , , "Offset", 1200
    ListFiles.ColumnHeaders.Add , , "File number", 1000
    
    NewPic.Picture = ImageList.ListImages(12).Picture
    OpenPic.Picture = ImageList.ListImages(2).Picture
    AddPic.Picture = ImageListGray.ListImages(4).Picture
    ExtractPic.Picture = ImageListGray.ListImages(3).Picture
    FileInfoPic.Picture = ImageListGray.ListImages(6).Picture
    HelpTopics.Picture = ImageList.ListImages(10).Picture
    OptionsPic.Picture = ImageList.ListImages.Item(11).Picture
    ExitPic.Picture = ImageList.ListImages(7).Picture
    CompressPic.Picture = ImageListGray.ListImages(9).Picture
        
    frmMain.StatusBar.Panels.Item(2).Picture = frmMain.Lights.ListImages.Item(2).Picture
    frmMain.StatusBar.Panels.Item(3).Picture = frmMain.Lights.ListImages.Item(1).Picture
        
    ChkIfLoad = False

    If Command <> "" Then
        FrmSplash.lblProgress.Caption = "Loading archive please wait..."
        FrmSplash.lblProgress.Refresh
        ChkIfLoad = True
        On Error GoTo FinaliseError
        CommonDialog.FileName = Command
        
        For M = 1 To Len(Command)
            GetChr0 = Right(Command, M)
            GetChr1 = Left(GetChr0, 1)
            If GetChr1 = "\" Or GetChr1 = "/" Then
                ArchiveName = Right(GetChr0, M - 1): Exit For
            End If
        Next M
        GetListData
        If FileExist(Command) = True Then
            CyTFile = Command
            If CyTOpen(Command) = True Then
                FrmSplash.lblProgress.Caption = "Archive loaded..."
                SetOpenMenu
            Else
                FrmSplash.lblProgress.Caption = "Loading archive please wait...Error": FrmSplash.lblProgress.Refresh
                CyTFile = ""
                CommonDialog.FileName = ""
                frmMain.StatusBar.Panels.Item(1).Text = "Choose " & Chr(34) & "New" & Chr(34) & " to create or " & Chr(34) & "Open" & Chr(34) & " to open an archive"
                AddPic.Enabled = False
                ExtractPic.Enabled = False
                FileInfoPic.Enabled = False
                CompressPic.Enabled = False
                AddPic.Picture = ImageListGray.ListImages.Item(4).Picture
                ExtractPic.Picture = ImageListGray.ListImages.Item(3).Picture
                FileInfoPic.Picture = ImageListGray.ListImages.Item(6).Picture
                CompressPic.Picture = ImageListGray.ListImages.Item(9).Picture
                ListFiles.ListItems.Clear
                SetCloseMenu
            End If
            frmMain.StatusBar.Panels.Item(2).Picture = frmMain.Lights.ListImages.Item(2).Picture
            frmMain.StatusBar.Panels.Item(3).Picture = frmMain.Lights.ListImages.Item(1).Picture
        End If
        Unload FrmSplash
        Me.Refresh
        Exit Sub
        
FinaliseError:
        
        If Err = 32755 Then
            Unload FrmSplash
            Me.Refresh
            Exit Sub
                Else
            Unload FrmSplash
            Me.Refresh
            MessageBox "An unknown error occured!", OKOnly, Critical
            Exit Sub
        End If
    End If
    
    Unload FrmSplash
    Me.Refresh
    
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    SetMenuIcons -1, True
End Sub

Private Sub Form_Resize()
    
    On Error Resume Next
    
    If frmMain.Width <= 2865 Then frmMain.Width = 2865
    If frmMain.Width <= ExitPic.Left + ExitPic.Width + 120 Then LabelExpand.Visible = True Else LabelExpand.Visible = False
    If frmMain.Height <= 3290 Then frmMain.Height = 3290
    
    MenuBoarder.Width = frmMain.Width - MenuBoarder.Left - 120
    LabelExpand.Left = MenuBoarder.Left + MenuBoarder.Width - LabelExpand.Width
    
    StatusBar.Panels.Item(1).Width = Me.Width - (StatusBar.Panels.Item(2).Width + StatusBar.Panels.Item(3).Width) - 450
        
    ListFiles.Width = frmMain.Width - 120
    ListFiles.Height = frmMain.Height - ListFiles.Top - StatusBar.Height - 700

    'NewPic.Left = (MenuBoarder.Width - ((MenuBoarder.Width / (9 / 0)) - ((MenuBoarder.Width / (9 / 0)) / (9 / 0))) * (9 / 0))
    'OpenPic.Left = (MenuBoarder.Width - ((MenuBoarder.Width / (9 / 1)) - ((MenuBoarder.Width / (9 / 1)) / (9 / 1))) * (9 / 1))
    'AddPic.Left = (MenuBoarder.Width - ((MenuBoarder.Width / (9 / 2)) - ((MenuBoarder.Width / (9 / 2)) / (9 / 2))) * (9 / 2))
    'ExtractPic.Left = (MenuBoarder.Width - ((MenuBoarder.Width / (9 / 3)) - ((MenuBoarder.Width / (9 / 3)) / (9 / 3))) * (9 / 3))
    'FileInfoPic.Left = (MenuBoarder.Width - ((MenuBoarder.Width / (9 / 4)) - ((MenuBoarder.Width / (9 / 4)) / (9 / 4))) * (9 / 4))
    'CompressPic.Left = (MenuBoarder.Width - ((MenuBoarder.Width / (9 / 5)) - ((MenuBoarder.Width / (9 / 5)) / (9 / 5))) * (9 / 5))
    'OptionsPic.Left = (MenuBoarder.Width - ((MenuBoarder.Width / (9 / 6)) - ((MenuBoarder.Width / (9 / 6)) / (9 / 6))) * (9 / 6))
    'HelpTopics.Left = (MenuBoarder.Width - ((MenuBoarder.Width / (9 / 7)) - ((MenuBoarder.Width / (9 / 7)) / (9 / 7))) * (9 / 7))
    'ExitPic.Left = (MenuBoarder.Width - ((MenuBoarder.Width / (9 / 8)) - ((MenuBoarder.Width / (9 / 8)) / (9 / 8))) * (9 / 8))
    
End Sub

Private Sub Form_Unload(Cancel As Integer)
    End
End Sub

Private Sub HelpTopics_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    HelpTopics.Picture = ImageListGray.ListImages.Item(10).Picture
    SetMenuIcons 7, True
End Sub

Private Sub HelpTopics_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    PopupMenu Menu06
End Sub

Private Sub LabelExpand_Click()
    Me.Width = 6615
End Sub

Private Sub ListFiles_Click()
    GetListData
End Sub

Private Sub ListFiles_DblClick()
    Click20_Click
End Sub

Private Sub ListFiles_KeyUp(KeyCode As Integer, Shift As Integer)
    GetListData
End Sub

Private Sub ListFiles_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    SetMenuIcons -1, True
End Sub

Private Sub ListFiles_OLEDragDrop(Data As MSComctlLib.DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
        
    On Error GoTo Erro

    For D = 1 To Len(Data.Files(1))
        GetChr0 = Left(Data.Files(1), D)
        GetChr1 = Right(GetChr0, 1)
        'If Len(GetChr0) = Len(Data.Files(1)) Then
        '    MessageBox "You cannot drag files, folders into the archive without no file extensions.", OKOnly, Warning
        '    Exit Sub
        'End If
        
        If GetChr1 = "." Then
            If Right(Data.Files(1), 3) = "CyT" Then
                For M = 1 To Len(Data.Files(1))
                    GetChr0 = Right(Data.Files(1), M)
                    GetChr1 = Left(GetChr0, 1)
                    If GetChr1 = "\" Or GetChr1 = "/" Then
                        TmpFile = Right(GetChr0, M - 1): Exit For
                    End If
                Next M
                frmMain.StatusBar.Panels.Item(1).Text = "CyberCrypt (" & TmpFile & ")"
                ArchiveName = TmpFile
                If FileExist(Data.Files(1)) = True Then
                    If CyTOpen(Data.Files(1)) = True Then
                        CommonDialog.FileName = Data.Files(1)
                        CyTFile = Data.Files(1)
                        SetOpenMenu
                    Else
                        CyTFile = ""
                        CommonDialog.FileName = ""
                        frmMain.StatusBar.Panels.Item(1).Text = "Choose " & Chr(34) & "New" & Chr(34) & " to create or " & Chr(34) & "Open" & Chr(34) & " to open an archive"
                        AddPic.Enabled = False
                        ExtractPic.Enabled = False
                        FileInfoPic.Enabled = False
                        CompressPic.Enabled = False
                        AddPic.Picture = ImageListGray.ListImages.Item(4).Picture
                        ExtractPic.Picture = ImageListGray.ListImages.Item(3).Picture
                        FileInfoPic.Picture = ImageListGray.ListImages.Item(6).Picture
                        CompressPic.Picture = ImageListGray.ListImages.Item(9).Picture
                        ListFiles.ListItems.Clear
                        SetCloseMenu
                    End If
                End If
                Exit Sub
            End If
            
            If CyTFile = "" Then
                MessageBox "You haven't opened any new or saved archive, do you want create a new archive?", YesNo, Question
                If Result = 1 Then
                    Click07_Click
                ElseIf Result = 2 Then
                    Exit Sub
                End If
            End If
            
            frmBusy.Visible = True
            Me.Enabled = False
            Me.MousePointer = 11
            
            frmMain.StatusBar.Panels.Item(2).Picture = Lights.ListImages.Item(1).Picture
            frmMain.StatusBar.Panels.Item(3).Picture = Lights.ListImages.Item(4).Picture
            
            'Adds the file to the archive
            For Files = 1 To Data.Files.Count
                If Data.Files(Files) = CyTFile Then MessageBox "You cannot add (" & Data.Files(Files) & ") as it is the current archive opened. This file will be skipped.", OKOnly, Critical: GoTo ReGetFiles
                For M = 1 To Len(Data.Files(Files))
                    GetChr0 = Right(Data.Files(Files), M)
                    GetChr1 = Left(GetChr0, 1)
                    If GetChr1 = "\" Or GetChr1 = "/" Then
                        TmpFile = Right(GetChr0, M - 1): Exit For
                    End If
                Next M
                If FileLen(Data.Files(Files)) = 0 Then MessageBox "File (" & Data.Files(Files) & ") selected for adding to archive doesn't appear to contain any data. Files must contain at lease (" & MIN_BYTE_IN_FILE & ") byte. This file will not be included into the archive.", OKOnly, Critical: GoTo ReGetFiles
                frmMain.StatusBar.Panels.Item(1).Text = "CyberCrypt Dragged (" & TmpFile & ") into archive."
                CyTAdd CyTFile, Data.Files(Files), RemoveBackSlash(Data.Files(Files))
ReGetFiles:
                DoEvents
            Next Files
            frmBusy.lblFile.Caption = "Updating archive..."
            Me.Refresh
            frmBusy.Refresh
            CyTOpen CyTFile
            
            frmMain.StatusBar.Panels.Item(2).Picture = Lights.ListImages.Item(2).Picture
            frmMain.StatusBar.Panels.Item(3).Picture = Lights.ListImages.Item(1).Picture
            
            ExtractPic.Enabled = True: ExtractPic.Picture = ImageList.ListImages(3).Picture
            FileInfoPic.Enabled = True: FileInfoPic.Picture = ImageList.ListImages(6).Picture
            AddPic.Enabled = True: AddPic.Picture = ImageList.ListImages(4).Picture
            Unload frmBusy
            Me.Enabled = True
            Me.MousePointer = 0
            ChkIfLoad = False
            ChkFastLoad = True
            SetOpenMenu
            Exit Sub
        End If
    Next D
    
Erro:
    If Err = 32755 Then
        CyTFile = ""
        CommonDialog.FileName = ""
        frmMain.StatusBar.Panels.Item(2).Picture = Lights.ListImages.Item(2).Picture
        frmMain.StatusBar.Panels.Item(3).Picture = Lights.ListImages.Item(1).Picture
        ExtractPic.Enabled = False: ExtractPic.Picture = ImageListGray.ListImages(3).Picture
        FileInfoPic.Enabled = False: FileInfoPic.Picture = ImageListGray.ListImages(6).Picture
        AddPic.Enabled = False: AddPic.Picture = ImageListGray.ListImages(4).Picture
        ListFiles.ListItems.Clear
        frmMain.StatusBar.Panels.Item(1).Text = "Choose " & Chr(34) & "New" & Chr(34) & " to create or " & Chr(34) & "Open" & Chr(34) & " to open an archive"
        SetCloseMenu
        Exit Sub
    Else
        MessageBox "An unknown error occured!", OKOnly, Critical
    End If
End Sub

'Private Sub ListFiles_OLESetData(Data As MSComctlLib.DataObject, DataFormat As Integer)
'MsgBox Data
'End Sub

Private Sub MenuBoarder_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    SetMenuIcons -1, True
End Sub

Private Sub NewPic_Click()
    Click07_Click
End Sub

Private Sub NewPic_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    NewPic.Picture = ImageListGray.ListImages.Item(12).Picture
    SetMenuIcons 0, True
End Sub

Private Sub OpenPic_Click()
    Click08_Click
End Sub

Function CyTOpen(FileName As String) As Boolean
    
    Dim FileList As String
    Dim Offset As Long
    Dim Size As Long
    Dim Name As String
    Dim LF As ListItem
    Dim LFS As ListSubItem
    ExtractSize = 0
    AllSize = 0
    
    On Error GoTo Erro
    
    ListFiles.ListItems.Clear
    
    'Check if is a valid CyT file
    If CyTValid(FileName) = True Then
        
        CyTOpen = True
        FileNumber = FreeFile
        Close FileNumber
        Open FileName For Binary As FileNumber
            'Is a valid CyT file
            'Get the FileList
            Get FileNumber, 7, FileListStart
            
            If FileListStart = 0 Then
                
                CyTFile = ""
                CyTOpen = False
                CommonDialog.FileName = ""
                frmMain.StatusBar.Panels.Item(1).Text = "Choose " & Chr(34) & "New" & Chr(34) & " to create or " & Chr(34) & "Open" & Chr(34) & " to open an archive"
                AddPic.Enabled = False
                ExtractPic.Enabled = False
                FileInfoPic.Enabled = False
                CompressPic.Enabled = False
                AddPic.Picture = ImageListGray.ListImages.Item(4).Picture
                ExtractPic.Picture = ImageListGray.ListImages.Item(3).Picture
                FileInfoPic.Picture = ImageListGray.ListImages.Item(6).Picture
                CompressPic.Picture = ImageListGray.ListImages.Item(9).Picture
                ListFiles.ListItems.Clear
                
                SetCloseMenu
                
                MessageBox "Empty archive!", OKOnly, Information
                Close FileNumber
                If Command <> "" And ChkIfLoad = True Then End
                Exit Function
            Else
                CyTFile = FileName
                ExtractPic.Enabled = True: ExtractPic.Picture = ImageList.ListImages(3).Picture
                FileInfoPic.Enabled = True: FileInfoPic.Picture = ImageList.ListImages(6).Picture
                AddPic.Enabled = True: AddPic.Picture = ImageList.ListImages(4).Picture
                
                ListFiles.ListItems.Clear
                
                Do
                    
                    Get FileNumber, FileListStart, Offset
                    FileListStart = FileListStart + 4
                    
                    Get FileNumber, FileListStart, Size
                    FileListStart = FileListStart + 4
                    
                    Name = String$(255, Chr$(0))
                    Get FileNumber, FileListStart, Name
                    Name = Mid(Name, 1, InStr(1, Name, Chr$(0)) - 1)
                    FileListStart = FileListStart + Len(Name) + 1
                    
                    Dim CreatedDate As String
                    
                    CreatedDate = String$(255, Chr$(0))
                    Get FileNumber, FileListStart, CreatedDate
                    CreatedDate = Mid(CreatedDate, 1, InStr(1, CreatedDate, Chr$(0)) - 1)
                    
                    For K = 1 To Len(CreatedDate)
                        GetChr1 = Left(CreatedDate, K)
                        GetChr2 = Right(GetChr1, 1)
                        If GetChr2 = Chr(0) Or K >= Len(CreatedDate) Then
                            CreatedDate = Left(CreatedDate, K)
                            Exit For
                        End If
                    Next K
                    
                    FileListStart = FileListStart + Len(CreatedDate) + 1
                    
                    Dim CompressedSize As String
                    
                    CompressedSize = String$(255, Chr$(0))
                    Get FileNumber, FileListStart, CompressedSize
                    CompressedSize = Mid(CompressedSize, 1, InStr(1, CompressedSize, Chr$(0)) - 1)

                    For K = 1 To Len(CompressedSize)
                        GetChr1 = Left(CompressedSize, K)
                        GetChr2 = Right(GetChr1, 1)
                        If GetChr2 = Chr(0) Or K >= Len(CompressedSize) Then
                            CompressedSize = Left(CompressedSize, K)
                            Exit For
                        End If
                    Next K
                    
                    FileListStart = FileListStart + Len(CompressedSize) + 1
                    
                    Dim DateAdded As String
                    
                    DateAdded = String$(255, Chr$(0))
                    Get FileNumber, FileListStart, DateAdded
                    DateAdded = Mid(DateAdded, 1, InStr(1, DateAdded, Chr$(0)) - 1)

                    For K = 1 To Len(DateAdded)
                        GetChr1 = Left(DateAdded, K)
                        GetChr2 = Right(GetChr1, 1)
                        If GetChr2 = Chr(0) Or K >= Len(DateAdded) Then
                            DateAdded = Left(DateAdded, K)
                            Exit For
                        End If
                    Next K
                    
                    FileListStart = FileListStart + Len(DateAdded) + 1
                    
                    Dim SizePacked As String
                    Dim RatioPercent As Long
                    
                    If CompressedSize = "" Then
                        'OK
                        Else
                    RatioPercent = 100 / CompressedSize * Size
                    End If
                    
                    If RatioPercent > 100 Then RatioPercent = 100
                    RatioPercent = 100 - RatioPercent
                    
                    AllSize = AllSize + CLng(Size)
                    ExtractSize = ExtractSize + CLng(CompressedSize)
                             
                    SizePacked = CStr(FormatKB(CompressedSize) & "  (" & CompressedSize) & ") bytes" & Chr(0)
                    
                    If Name = "" Or Offset = 0 Or Size = 0 Then
                        CyTFile = ""
                        CyTOpen = False
                        CommonDialog.FileName = ""
                        frmMain.StatusBar.Panels.Item(1).Text = "Choose " & Chr(34) & "New" & Chr(34) & " to create or " & Chr(34) & "Open" & Chr(34) & " to open an archive"
                        AddPic.Enabled = False
                        ExtractPic.Enabled = False
                        FileInfoPic.Enabled = False
                        CompressPic.Enabled = False
                        AddPic.Picture = ImageListGray.ListImages.Item(4).Picture
                        ExtractPic.Picture = ImageListGray.ListImages.Item(3).Picture
                        FileInfoPic.Picture = ImageListGray.ListImages.Item(6).Picture
                        CompressPic.Picture = ImageListGray.ListImages.Item(9).Picture
                        ListFiles.ListItems.Clear
                        
                        SetCloseMenu
                        
                        MessageBox "Empty archive!", OKOnly, Information
                        Close FileNumber
                        If Command <> "" And ChkIfLoad = True Then End
                        Exit Function
                    End If
                    'Add the FileName, OffSet and Size in the ListView control but first clears the ListView
                    FindTypeIcon Name, Offset, Size, SizePacked, CreatedDate, RatioPercent, DateAdded, CLng(CompressedSize)
                Loop Until FileListStart > LOF(FileNumber)
                
                Close FileNumber
            End If
            
        Else
            CyTOpen = False
            CommonDialog.FileName = ""
            CyTFile = ""
            frmMain.StatusBar.Panels.Item(1).Text = "Choose " & Chr(34) & "New" & Chr(34) & " to create or " & Chr(34) & "Open" & Chr(34) & " to open an archive"
            ExtractPic.Enabled = False: ExtractPic.Picture = ImageListGray.ListImages(3).Picture
            FileInfoPic.Enabled = False: FileInfoPic.Picture = ImageListGray.ListImages(6).Picture
            AddPic.Enabled = False: AddPic.Picture = ImageListGray.ListImages(4).Picture
            SetCloseMenu
            MessageBox "Error, could not access file.", OKOnly, Critical
            Close FileNumber
            If Command <> "" And ChkIfLoad = True Then End
            Exit Function
        End If
    Close FileNumber
    Exit Function
    
Erro:
    If Err = 5 Then
        CyTOpen = False
        CyTFile = ""
        CommonDialog.FileName = ""
        ListFiles.ListItems.Clear
        frmMain.StatusBar.Panels.Item(1).Text = "Choose " & Chr(34) & "New" & Chr(34) & " to create or " & Chr(34) & "Open" & Chr(34) & " to open an archive"
        ExtractPic.Enabled = False: ExtractPic.Picture = ImageListGray.ListImages(3).Picture
        FileInfoPic.Enabled = False: FileInfoPic.Picture = ImageListGray.ListImages(6).Picture
        AddPic.Enabled = False: AddPic.Picture = ImageListGray.ListImages(4).Picture
        SetCloseMenu
        MessageBox "Error, could not access file.", OKOnly, Critical
        Close FileNumber
        If Command <> "" And ChkIfLoad = True Then End
        Exit Function
    End If

    Exit Function

End Function

Private Sub FindTypeIcon(Name As String, Offset As Long, Size As Long, SizePacked As String, DateCreated As String, RatioS As Long, DateADD As String, PackSize As Long)

    'I've used this code because some programs have rubish icons
    'so i've added my own, so this means that any file anything
    'other than the file extensions below becomes an unknown file
    'icon. The file will still appear though.

    Dim LF As ListItem
    Dim LFS As ListSubItem
    Dim PicIndex As Long
    Dim NameTemp As String
    Dim NameTempSetup As String

    PicIndex = 36
    
    For s = 1 To Len(Name)
        GetChr1 = Right(Name, s)
        GetChr2 = Left(GetChr1, 1)
        If GetChr2 = "." Then
            NameTemp = LCase$(Right(GetChr1, Len(GetChr1) - 1))
            Exit For
        End If
    Next s
    
    Select Case NameTemp
        Case LCase$("abt"): PicIndex = 1: GoTo ChkFormat
        Case LCase$("avi"): PicIndex = 5: GoTo ChkFormat
        Case LCase$("bat"): PicIndex = 6: GoTo ChkFormat
        Case LCase$("bmp"): PicIndex = 7: GoTo ChkFormat
        Case LCase$("cyt"): PicIndex = 9: GoTo ChkFormat
        Case LCase$("dll"): PicIndex = 14: GoTo ChkFormat
        Case LCase$("sys"): PicIndex = 14: GoTo ChkFormat
        Case LCase$("top"): PicIndex = 15: GoTo ChkFormat
        Case LCase$("exe"): PicIndex = 16: GoTo ChkFormat
        Case LCase$("com"): PicIndex = 16: GoTo ChkFormat
        Case LCase$("ext"): PicIndex = 17: GoTo ChkFormat
        Case LCase$("zip"): PicIndex = 19: GoTo ChkFormat
        Case LCase$("gif"): PicIndex = 20: GoTo ChkFormat
        Case LCase$("wmf"): PicIndex = 21: GoTo ChkFormat
        Case LCase$("tga"): PicIndex = 21: GoTo ChkFormat
        Case LCase$("ini"): PicIndex = 23: GoTo ChkFormat
        Case LCase$("inf"): PicIndex = 23: GoTo ChkFormat
        Case LCase$("css"): PicIndex = 23: GoTo ChkFormat
        Case LCase$("dat"): PicIndex = 23: GoTo ChkFormat
        Case LCase$("jpg"): PicIndex = 24: GoTo ChkFormat
        Case LCase$("pwl"): PicIndex = 25: GoTo ChkFormat
        Case LCase$("mid"): PicIndex = 26: GoTo ChkFormat
        Case LCase$("mp3"): PicIndex = 27: GoTo ChkFormat
        Case LCase$("mpg"): PicIndex = 28: GoTo ChkFormat
        Case LCase$("mpe"): PicIndex = 28: GoTo ChkFormat
        Case LCase$("stp"): PicIndex = 33: GoTo ChkFormat
        Case LCase$("wav"): PicIndex = 34: GoTo ChkFormat
        Case LCase$("wma"): PicIndex = 34: GoTo ChkFormat
        Case LCase$("txt"): PicIndex = 35: GoTo ChkFormat
        Case LCase$("log"): PicIndex = 35: GoTo ChkFormat
        Case LCase$("cfg"): PicIndex = 35: GoTo ChkFormat
        Case LCase$("usr"): PicIndex = 37: GoTo ChkFormat
        Case LCase$("hlp"): PicIndex = 38: GoTo ChkFormat
        Case LCase$("ico"): PicIndex = 36: GoTo ChkFormat
        Case LCase$("htm"): PicIndex = 39: GoTo ChkFormat
        Case LCase$("jpeg"): PicIndex = 24: GoTo ChkFormat
        Case LCase$("user"): PicIndex = 37: GoTo ChkFormat
        Case LCase$("html"): PicIndex = 39: GoTo ChkFormat
    End Select
    
        PicIndex = 36
        
ChkFormat:

    'Checks if file is recognised as a setup file or an uninstall file, only by name
    NameTempSetup = LCase$(Left(Name, 5))
    If NameTempSetup = LCase$("setup") And LCase$(Right(Name, 3)) = "exe" Then PicIndex = 33
    NameTempSetup = LCase$(Left(Name, 6))
    If NameTempSetup = LCase$("install") And LCase$(Right(Name, 3)) = "exe" Then PicIndex = 33
    NameTempSetup = LCase$(Left(Name, 9))
    If NameTempSetup = LCase$("uninstall") And LCase$(Right(Name, 3)) = "exe" Then PicIndex = 33
    
    'Checks if file is recognised as a readme type of file, only by name
    NameTempSetup = LCase$(Left(Name, 6))
    If NameTempSetup = LCase$("readme") And LCase$(Right(Name, 3)) = "txt" Then PicIndex = 65
    NameTempSetup = LCase$(Left(Name, 9))
    If NameTempSetup = LCase$("whats new") And LCase$(Right(Name, 3)) = "txt" Then PicIndex = 65
    NameTempSetup = LCase$(Left(Name, 4))
    If NameTempSetup = LCase$("help") And LCase$(Right(Name, 3)) = "txt" Then PicIndex = 65
    NameTempSetup = LCase$(Left(Name, 7))
    If NameTempSetup = LCase$("license") And LCase$(Right(Name, 3)) = "txt" Then PicIndex = 65
    NameTempSetup = LCase$(Left(Name, 3))
    If NameTempSetup = LCase$("faq") And LCase$(Right(Name, 3)) = "txt" Then PicIndex = 65

    Set LF = ListFiles.ListItems.Add(, , Name, PicIndex, PicIndex)
    
    'Gets the file type and puts it into the listview
    
    If NameTemp <> "" Then
        If GetFileTypeName(NameTemp & "file") = LCase$("<Unknown file type>") Or Len(GetFileTypeName(NameTemp & "file")) >= 88 Then
            If GetFileTypeName("." & NameTemp) = LCase$("<Unknown file type>") Or Len(GetFileTypeName("." & NameTemp)) >= 88 Then
                Set LFS = LF.ListSubItems.Add(, , UCase$(NameTemp) & " file")
                    Else
                Set LFS = LF.ListSubItems.Add(, , GetFileTypeName("." & NameTemp))
            End If
                Else
            Set LFS = LF.ListSubItems.Add(, , GetFileTypeName(NameTemp & "file"))
        End If
    Else
        Set LFS = LF.ListSubItems.Add(, , "No extension")
    End If
    
    Set LFS = LF.ListSubItems.Add(, , SizePacked)
    
    Set LFS = LF.ListSubItems.Add(, , CStr(RatioS & "%"))
    
    Set LFS = LF.ListSubItems.Add(, , CStr(FormatKB(Size)) & "  (" & Size & ") bytes")
    
    Dim CompressedData As Long
    CompressedData = PackSize - Size
    
    If CompressedData < 0 Then
        Dim Temp As Long
        Temp = 0 - CompressedData
        Set LFS = LF.ListSubItems.Add(, , CStr("Lost " & FormatKB(Temp)) & "  (" & Temp & ") bytes", 67)
    ElseIf CompressedData > 0 Then
        Set LFS = LF.ListSubItems.Add(, , CStr(FormatKB(CompressedData)) & "  (" & CompressedData & ") bytes", 66)
    ElseIf CompressedData = 0 Then
        Set LFS = LF.ListSubItems.Add(, , CStr(FormatKB(CompressedData)) & "  (" & CompressedData & ") bytes", 68)
    End If
        
    'This piece of code checks the % Of archive for the file
    'and then gets the best value to show.
    For E = 1 To Len(CStr(Size / FileLen(CyTFile) * 100))
        GetChr1 = Left(CStr(Size / FileLen(CyTFile) * 100), E)
        GetChr2 = Right(GetChr1, 1)
        If GetChr2 = "." Then
            Set LFS = LF.ListSubItems.Add(, , Left(CStr(Size / FileLen(CyTFile) * 100), E + 2) & "%")
            Exit For
        ElseIf E >= Len(CStr(Size / FileLen(CyTFile) * 100)) Then
            Set LFS = LF.ListSubItems.Add(, , Left(CStr(Size / FileLen(CyTFile) * 100), 4) & "%")
            Exit For
        End If
    Next E
    
    Set LFS = LF.ListSubItems.Add(, , DateCreated)
    Set LFS = LF.ListSubItems.Add(, , DateADD)
    Set LFS = LF.ListSubItems.Add(, , Offset)
    Set LFS = LF.ListSubItems.Add(, , ListFiles.ListItems.Count)
    
    SetAddMenu
    GetListData
    
End Sub

Private Sub RefreshArchive()
    'This sub refreshes the archive by re-opening it.
    'CyTOpen CyTFile
    Exit Sub
End Sub

Function CyTCreate(FileName As String) As Boolean
    On Error GoTo Erro
    Dim FileList As String
    
    ChkNewResult = 0
    FrmNew.Show 1
    
    If ChkNewResult = 1 Then
        Header = ArchType02
        CompressPic.Enabled = True
        CompressionAgent = True
        EncryptionAgent = False
        SwapAgent = False
        frmBusy.ViewPic1.Picture = ImageList.ListImages.Item(9).Picture
        CompressPic.Picture = ImageList.ListImages(9).Picture
        'ListFiles.ColumnHeaders.Item(3).Text = "Packed Size"
        Click232.Enabled = True
    ElseIf ChkNewResult = 0 Then
        Header = ArchType01
        CompressPic.Enabled = False
        CompressionAgent = False
        EncryptionAgent = False
        SwapAgent = False
        frmBusy.ViewPic1.Picture = ImageList.ListImages.Item(8).Picture
        CompressPic.Picture = ImageListGray.ListImages(9).Picture
        'ListFiles.ColumnHeaders.Item(3).Text = "Size"
        Click232.Enabled = False
    ElseIf ChkNewResult = 2 Then
        Header = ArchType03
        CompressPic.Enabled = False
        CompressionAgent = False
        EncryptionAgent = True
        SwapAgent = False
        frmBusy.ViewPic1.Picture = ImageList.ListImages.Item(13).Picture
        CompressPic.Picture = ImageListGray.ListImages(9).Picture
        'ListFiles.ColumnHeaders.Item(3).Text = "Size"
        Click232.Enabled = False
    ElseIf ChkNewResult = 3 Then
        Header = ArchType04
        CompressPic.Enabled = False
        CompressionAgent = False
        EncryptionAgent = False
        SwapAgent = True
        frmBusy.ViewPic1.Picture = ImageList.ListImages.Item(14).Picture
        CompressPic.Picture = ImageListGray.ListImages(9).Picture
        'ListFiles.ColumnHeaders.Item(3).Text = "Size"
        Click232.Enabled = False
    End If
    
    FileListStart = 0
    
    If FileExist(FileName) = True Then
        CyTCreate = False
        Exit Function
    Else
        FileNumber = FreeFile
        Close #FileNumber
        Open FileName For Binary As #FileNumber
            Put #FileNumber, 1, Header
            Put #FileNumber, Len(Header) + 1, FileListStart
        Close #FileNumber
    End If
    
    CyTFile = FileName
    
    frmMain.StatusBar.Panels.Item(2).Picture = frmMain.Lights.ListImages.Item(2).Picture
    frmMain.StatusBar.Panels.Item(3).Picture = frmMain.Lights.ListImages.Item(1).Picture
    
    ExtractPic.Enabled = True: ExtractPic.Picture = ImageList.ListImages(3).Picture
    FileInfoPic.Enabled = True: FileInfoPic.Picture = ImageList.ListImages(6).Picture
    AddPic.Enabled = True: AddPic.Picture = ImageList.ListImages(4).Picture
    CyTCreate = True
   
    Exit Function
    
Erro:
    If Err <> 0 Then
        CyTCreate = False
        Close #FileNumber
        Exit Function
    End If
End Function

Function CyTAdd(FileCyT As String, FileAdd As String, NameADD As String) As Boolean
    
    Dim FileName As String
    Dim FileNum As Integer
    Dim TempFileName As String
    Dim FileBytes() As Byte
    
    TempFileName = FileAdd
    
    ChkPro = 1
    
    On Error GoTo Erro
    
    If ChkFile(FileCyT) = False Then CyTAdd = False: Exit Function
    
    If CompressionAgent = True Then
        lnglngResult = CompressFile(FileAdd, TempRootS & "\" & NameADD, Val(CompressionLevel))
        FileAdd = TempRootS & "\" & NameADD
    End If
    
    If EncryptionAgent = True Then
        FileName = FileAdd
        ReDim FileBytes(FileLen(FileName) - 1)
        FileNum = FreeFile
        Close FileNum
        Open FileName For Binary Access Read As FileNum
            Get FileNum, , FileBytes
        Close FileNum
        EncryptFile FileBytes, "PASSWORD", FileAdd
        
        If Right(TempRootS, 1) = "\" Or Right(TempRootS, 1) = "/" Then
            FileName = TempRootS & NameADD
        ElseIf Right(TempRootS, 1) <> "\" And Right(TempRootS, 1) <> "/" Then
            FileName = TempRootS & "\" & NameADD
        End If
        
        FileNum = FreeFile
        Close FileNum
        Open FileName For Binary Access Write As FileNum
            Put FileNum, , FileBytes
        Close FileNum
        
        If Right(TempRootS, 1) = "\" Or Right(TempRootS, 1) = "/" Then
            FileAdd = TempRootS & NameADD
        ElseIf Right(TempRootS, 1) <> "\" And Right(TempRootS, 1) <> "/" Then
            FileAdd = TempRootS & "\" & NameADD
        End If
        
    End If
    
    Dim BytesADD As String
    Dim OffSetADD As Long
    Dim SizeADD As Long
    Dim SizePacked As Long
    Dim LF As ListItem
    Dim LFS As ListSubItem
    
    NameADD = NameADD & Chr$(0)
    
    If FileExist(FileCyT) = False Or FileExist(FileAdd) = False Then
        CyTAdd = False
        Exit Function
    Else
        'Check if is a valid CyT file
        If CyTValid(FileCyT) = True Then
            'Is a valid CyT file
            
            Close #1
            FileNumberCyT = 1 'FreeFile
            Open FileCyT For Binary As #FileNumberCyT
            
            'Get the FileList
            Get FileNumberCyT, 7, FileListStart
    
            'Get the FileList and put in the memory
            If FileListStart = 0 Then
                FileListStart = LOF(FileNumberCyT) + 1
                FileList = ""
            Else
                FileList = String(LOF(FileNumberCyT) - FileListStart + 1, Chr$(0))
                Get FileNumberCyT, FileListStart, FileList
            End If
    
            OffSetADD = FileListStart
            SizeADD = FileLen(FileAdd)
                
            'Put the file inside of the CyT
            Close #2
            FileNumberADD = 2 'FreeFile
            frmBusy.lblFile = "Adding " & RemoveBackSlash(FileAdd)
            frmBusy.Refresh
            
            Open FileAdd For Binary As #FileNumberADD
                If LOF(FileNumberADD) > 1000000 Then
                
                If SwapAgent = True Then
                    'Divid the file in parts to use less memory and make less swap
                    BytesADD = String(LOF(FileNumberADD) / 100, Chr$(0))
                    For Position = 1 To LOF(FileNumberADD) Step Len(BytesADD)
                        Get FileNumberADD, Position, BytesADD
                        Put FileNumberCyT, FileListStart, BytesADD
                        FileListStart = FileListStart + Len(BytesADD)
                    Next Position
                End If
                    
                    Position = -999999
                    frmBusy.prgFile.Max = LOF(FileNumberADD)
                    Do
                        Position = Position + 1000000
                        If Position + 999999 > LOF(FileNumberADD) Then
                            frmBusy.prgFile.Value = frmBusy.prgFile.Max
                            frmBusy.Refresh
                            BytesADD = String(LOF(FileNumberADD) - Position + 1, Chr$(0))
                        Else
                            frmBusy.prgFile.Value = Position
                            frmBusy.Refresh
                            BytesADD = String(1000000, Chr$(0))
                        End If
                        Get FileNumberADD, Position, BytesADD
                        Put FileNumberCyT, FileListStart, BytesADD
                        FileListStart = FileListStart + Len(BytesADD)
                    Loop Until Position + 999999 > LOF(FileNumberADD)
                    
                Else
                    frmBusy.prgFile.Max = 1
                    frmBusy.prgFile.Value = 0
                    BytesADD = String(LOF(FileNumberADD), Chr$(0))
                    Get FileNumberADD, 1, BytesADD
                    Put FileNumberCyT, FileListStart, BytesADD
                    FileListStart = FileListStart + Len(BytesADD)
                    frmBusy.prgFile.Value = 1
                End If
            Close FileNumberADD
            
            If CompressionAgent = True Then
                FileData = FindFile(TempFileName)
            ElseIf CompressionAgent = False Then
                FileData = FindFile(FileAdd)
            End If
            
            Dim DateAccess As String
            
            FileTimeToSystemTime FileData.ftCreationTime, FILETIME
            DateAccess = CStr(FILETIME.wDay & "/" & FILETIME.wMonth & "/" & FILETIME.wYear & " " & FILETIME.wHour & ":" & FILETIME.wMinute & ":" & FILETIME.wSecond)
            
            Dim DateAdded As String
            
            DateAdded = Date & " " & Time
            
            'Add the new file in the FileList
            Put FileNumberCyT, 7, FileListStart
            Put FileNumberCyT, FileListStart, FileList
            Put FileNumberCyT, FileListStart + Len(FileList), OffSetADD
            Put FileNumberCyT, FileListStart + Len(FileList) + 4, SizeADD
            Put FileNumberCyT, FileListStart + Len(FileList) + 8, NameADD
            Put FileNumberCyT, FileListStart + Len(FileList) + 8 + Len(NameADD), CStr(DateAccess & Chr(0))
            Put FileNumberCyT, FileListStart + Len(FileList) + 8 + Len(NameADD) + Len(CStr(DateAccess & Chr(0))), CStr(FileLen(TempFileName) & Chr(0))
            Put FileNumberCyT, FileListStart + Len(FileList) + 8 + Len(NameADD) + Len(CStr(DateAccess & Chr(0))) + Len(CStr(FileLen(TempFileName) & Chr(0))), CStr(DateAdded & Chr(0))
            
            Close FileNumberCyT
            Close FileNumberADD
        Else
            CyTAdd = False
            Close FileNumberCyT
            Close FileNumberADD
            Exit Function
        End If
    End If
    CyTAdd = True
    
    If ChkFastLoad = True Then
        
        Dim RatioPercent As Long
        
        RatioPercent = 100 / FileLen(TempFileName) * SizeADD
        If RatioPercent > 100 Then RatioPercent = 100
        RatioPercent = 100 - RatioPercent
        
        If CompressionAgent = True Then
            FindTypeIcon NameADD, OffSetADD, SizeADD, CStr(FormatKB(FileLen(TempFileName)) & "  (" & FileLen(TempFileName) & ") bytes" & Chr(0)), DateAccess, RatioPercent, DateAdded, FileLen(TempFileName)
        ElseIf CompressionAgent = False Then
            FindTypeIcon NameADD, OffSetADD, SizeADD, CStr(FormatKB(FileLen(FileAdd)) & "  (" & FileLen(FileAdd) & ") bytes" & Chr(0)), DateAccess, RatioPercent, DateAdded, FileLen(FileAdd)
        End If
        KillFileActive TempRootS & "\" & Left(NameADD, Len(NameADD) - 1)
            Else
        RefreshArchive
        KillFileActive TempRootS & "\" & Left(NameADD, Len(NameADD) - 1)
    End If
    Exit Function
    
Erro:
    CyTAdd = False
    Exit Function
End Function

Function CyTValid(CyTFileName As String) As Boolean
    
    'Dim Header As String
    
    Header = String$(6, Chr$(0))
    
    If FileExist(CyTFileName) = False Then
        CyTValid = False
        Exit Function
    Else
        FileNumber = FreeFile
        Open CyTFileName For Binary As FileNumber
            Get FileNumber, 1, Header
            
            If Header = "CYT1.0" Or Header = "CYT2.0" Or Header = "CYT3.0" Then
                
                MessageBox "This archive has been created in an older version of CyberCrypt and needs updating. Please run the archive convertor in the menu.", OKOnly, Critical
                
                CyTValid = False
                
                'CommonDialog.FileName = ""
                'frmMain.StatusBar.Panels.Item(1).Text = "Choose " & Chr(34) & "New" & Chr(34) & " to create or " & Chr(34) & "Open" & Chr(34) & " to open an archive"
                'AddPic.Enabled = False
                'ExtractPic.Enabled = False
                'FileInfoPic.Enabled = False
                'CompressPic.Enabled = False
                'AddPic.Picture = ImageListGray.ListImages.Item(4).Picture
                'ExtractPic.Picture = ImageListGray.ListImages.Item(3).Picture
                'FileInfoPic.Picture = ImageListGray.ListImages.Item(6).Picture
                'CompressPic.Picture = ImageListGray.ListImages.Item(9).Picture
                'ListFiles.ListItems.Clear
    
                'SetCloseMenu
                'Close FileNumber
                Exit Function
                
            End If
            
            If Header = ArchType02 Then
                CyTValid = True
                CompressionAgent = True
                EncryptionAgent = False
                SwapAgent = False
                CompressPic.Enabled = True
                CompressPic.Picture = ImageList.ListImages(9).Picture
                'ListFiles.ColumnHeaders.Item(3).Text = "Packed Size"
                frmBusy.ViewPic1.Picture = ImageList.ListImages.Item(9).Picture
                Click232.Enabled = True
                'This If statement checks if the archive has been opened
                'manually or has been opened by refreashing the archive.
                If ChkLoad = True Then
                    'Do nothing - ON LOAD OF ARCHIVE
                        Else
                    'Do nothing - ON REFRESHING OF ARCHIVE
                End If
            ElseIf Header = ArchType01 Then
                CyTValid = True
                CompressionAgent = False
                EncryptionAgent = False
                SwapAgent = False
                CompressPic.Enabled = False
                CompressPic.Picture = ImageListGray.ListImages(9).Picture
                'ListFiles.ColumnHeaders.Item(3).Text = "Size"
                frmBusy.ViewPic1.Picture = ImageList.ListImages.Item(8).Picture
                Click232.Enabled = False
                'This If statement checks if the archive has been opened
                'manually or has been opened by refreashing the archive.
                If ChkLoad = True Then
                    'Do nothing - ON LOAD OF ARCHIVE
                        Else
                    'Do nothing - ON REFRESHING OF ARCHIVE
                End If
                Exit Function
            ElseIf Header = ArchType03 Then
                CyTValid = True
                CompressionAgent = False
                EncryptionAgent = True
                SwapAgent = False
                CompressPic.Enabled = False
                CompressPic.Picture = ImageListGray.ListImages(9).Picture
                'ListFiles.ColumnHeaders.Item(3).Text = "Size"
                frmBusy.ViewPic1.Picture = ImageList.ListImages.Item(13).Picture
                Click232.Enabled = False
                'This If statement checks if the archive has been opened
                'manually or has been opened by refreashing the archive.
                If ChkLoad = True Then
                    'Do nothing - ON LOAD OF ARCHIVE
                        Else
                    'Do nothing - ON REFRESHING OF ARCHIVE
                End If
            ElseIf Header = ArchType04 Then
                CyTValid = True
                CompressionAgent = False
                EncryptionAgent = False
                SwapAgent = True
                CompressPic.Enabled = False
                CompressPic.Picture = ImageListGray.ListImages(9).Picture
                'ListFiles.ColumnHeaders.Item(3).Text = "Size"
                frmBusy.ViewPic1.Picture = ImageList.ListImages.Item(14).Picture
                Click232.Enabled = False
                'This If statement checks if the archive has been opened
                'manually or has been opened by refreashing the archive.
                If ChkLoad = True Then
                    'Do nothing - ON LOAD OF ARCHIVE
                        Else
                    'Do nothing - ON REFRESHING OF ARCHIVE
                End If
            Else
                CyTValid = False
            End If
        Close FileNumber
    End If
    
End Function

Public Function ChkFile(Filen) As Boolean
    If FileExist(CStr(Filen)) = False Then
        MessageBox "Error, Could not find default CyT archive. Please create a new archive before adding files.", OKOnly, Critical
        CyTFile = ""
        CommonDialog.FileName = ""
        frmMain.StatusBar.Panels.Item(1).Text = "Choose " & Chr(34) & "New" & Chr(34) & " to create or " & Chr(34) & "Open" & Chr(34) & " to open an archive"
        AddPic.Enabled = False
        ExtractPic.Enabled = False
        FileInfoPic.Enabled = False
        CompressPic.Enabled = False
        AddPic.Picture = ImageListGray.ListImages.Item(4).Picture
        ExtractPic.Picture = ImageListGray.ListImages.Item(3).Picture
        FileInfoPic.Picture = ImageListGray.ListImages.Item(6).Picture
        CompressPic.Picture = ImageListGray.ListImages.Item(9).Picture
        ListFiles.ListItems.Clear
        SetCloseMenu
        ChkFile = False
        Exit Function
    End If
    
    ChkFile = True
    
End Function

Function CyTExtract(CyTFile As String, FileToExtract As String, DestinationFile As String) As Boolean
    
    ChkPro = -1
    
    On Error GoTo FinaliseError
    
    If ChkFile(CyTFile) = False Then CyTExtract = False: Exit Function
    
    Dim FileName As String
    Dim FileNum As Integer
    Dim FileBytes() As Byte
    
    Dim BytesExtract As String
    Dim Offset As Long
    Dim Size As Long
    Dim Name As String
    
    If FileExist(CyTFile) = False Or FileExist(DestinationFile) = True Then
        CyTExtract = False
        Exit Function
    Else
        If CyTValid(CyTFile) = True Then
        
            Close #4
            FileNumber = 4 'FreeFile
            Open CyTFile For Binary As #FileNumber
                'Get the FileList
                Get FileNumber, 7, FileListStart
            
                If FileListStart = 0 Then
                    CyTExtract = False
                    Close FileNumber
                    Exit Function
                Else
                    
    
                    Do
                        Get FileNumber, FileListStart, Offset
                        FileListStart = FileListStart + 4
                    
                        Get FileNumber, FileListStart, Size
                        FileListStart = FileListStart + 4
                                       
                        Name = String$(255, Chr$(0))
                        Get FileNumber, FileListStart, Name
                        Name = Mid(Name, 1, InStr(1, Name, Chr$(0)) - 1)
                        FileListStart = FileListStart + Len(Name) + 1
                        
                        Dim CreatedDate As String
                    
                        CreatedDate = String$(255, Chr$(0))
                        Get FileNumber, FileListStart, CreatedDate
                        CreatedDate = Mid(CreatedDate, 1, InStr(1, CreatedDate, Chr$(0)) - 1)
                        
                        For K = 1 To Len(CreatedDate)
                            GetChr1 = Left(CreatedDate, K)
                            GetChr2 = Right(GetChr1, 1)
                            If GetChr2 = Chr(0) Or K >= Len(CreatedDate) Then
                                CreatedDate = Left(CreatedDate, K)
                                Exit For
                            End If
                        Next K
                    
                        FileListStart = FileListStart + Len(CreatedDate) + 1
                        
                        Dim CompressedSize As String
                    
                        CompressedSize = String$(255, Chr$(0))
                        Get FileNumber, FileListStart, CompressedSize
                        CompressedSize = Mid(CompressedSize, 1, InStr(1, CompressedSize, Chr$(0)) - 1)
                        
                        For K = 1 To Len(CompressedSize)
                            GetChr1 = Left(CompressedSize, K)
                            GetChr2 = Right(GetChr1, 1)
                            If GetChr2 = Chr(0) Or K >= Len(CompressedSize) Then
                                CompressedSize = Left(CompressedSize, K)
                                Exit For
                            End If
                        Next K
                        
                        FileListStart = FileListStart + Len(CompressedSize) + 1
                        
                        Dim DateAdded As String
                    
                        DateAdded = String$(255, Chr$(0))
                        Get FileNumber, FileListStart, DateAdded
                        DateAdded = Mid(DateAdded, 1, InStr(1, DateAdded, Chr$(0)) - 1)
    
                        For K = 1 To Len(DateAdded)
                            GetChr1 = Left(DateAdded, K)
                            GetChr2 = Right(GetChr1, 1)
                            If GetChr2 = Chr(0) Or K >= Len(DateAdded) Then
                                DateAdded = Left(DateAdded, K)
                                Exit For
                            End If
                        Next K
                    
                        FileListStart = FileListStart + Len(DateAdded) + 1
                        
                        If Name = "" Or Offset = 0 Or Size = 0 Then
                            CyTExtract = False
                            Close FileNumber
                            Exit Function
                        ElseIf LCase(Name) = LCase(FileToExtract) Then
                            frmBusy.lblFile = "Extracting " & FileToExtract
                            Close #5
                            DestinationNumber = 5 'FreeFile
                            Open DestinationFile For Binary As #DestinationNumber
                                If Size > 100000 Then
                                    
                                    If SwapAgent = True Then
                                        'Divid the file in parts to use less memory and make less swap
                                        BytesExtract = String(Size / 100, Chr$(0))
                                        For Position = 1 To Size Step Len(BytesExtract)
                                            Get FileNumber, Position + Offset, BytesExtract
                                            Put DestinationNumber, Position, BytesExtract
                                        Next Position
                                    End If
                                    
                                    Position = -1000000
                                    frmBusy.prgFile.Max = Size
                                    Do
                                        
                                        Position = Position + 1000000
                                        If Position + 999999 > Size Then
                                            BytesExtract = String(Size - Position, Chr$(0))
                                            frmBusy.prgFile.Value = frmBusy.prgFile.Max
                                            frmBusy.Refresh
                                        Else
                                            BytesExtract = String(1000000, Chr$(0))
                                            frmBusy.prgFile.Value = Position
                                            frmBusy.Refresh
                                        End If
                                        Get FileNumber, Position + Offset, BytesExtract
                                        Put DestinationNumber, Position + 1, BytesExtract
                                    Loop Until Position + 999999 >= Size
                                Else
                                    BytesExtract = String(Size, Chr$(0))
                                    Get FileNumber, Offset, BytesExtract
                                    Put DestinationNumber, 1, BytesExtract
                                End If
                            Close DestinationNumber
                            Close FileNumber
                            CyTExtract = True
                            
                            If CompressionAgent = True Then
                                lnglngResult = DecompressFile(DestinationFile, DestinationFile)
                            End If
                            
                            If EncryptionAgent = True Then
                                
                                If Right(TempRootS, 1) = "\" Or Right(TempRootS, 1) = "/" Then
                                    If FileExist(TempRootS & "INF~CYT10.tmp") = True Then KillFile TempRootS & "INF~CYT10.tmp"
                                    FileCopy DestinationFile, TempRootS & "INF~CYT10.tmp"
                                    FileName = TempRootS & "INF~CYT10.tmp"
                                ElseIf Right(TempRootS, 1) <> "\" And Right(TempRootS, 1) <> "/" Then
                                    If FileExist(TempRootS & "\" & "INF~CYT10.tmp") = True Then KillFile TempRootS & "\" & "INF~CYT10.tmp"
                                    FileCopy DestinationFile, TempRootS & "\" & "INF~CYT10.tmp"
                                    FileName = TempRootS & "\" & "INF~CYT10.tmp"
                                End If
                                
                                ReDim FileBytes(FileLen(FileName) - 1)
                                FileNum = FreeFile
                                'Close FileName
                                Open FileName For Binary Access Read As FileNum
                                    Get FileNum, , FileBytes
                                Close FileNum
                                EncryptFile FileBytes, "PASSWORD", DestinationFile
                                FileName = DestinationFile
                                FileNum = FreeFile
                                'Close FileName
                                Open FileName For Binary Access Write As FileNum
                                    Put FileNum, , FileBytes
                                Close FileNum
                                
                                If Right(TempRootS, 1) = "\" Or Right(TempRootS, 1) = "/" Then
                                    KillFile TempRootS & "INF~CYT10.tmp"
                                ElseIf Right(TempRootS, 1) <> "\" And Right(TempRootS, 1) <> "/" Then
                                    KillFile TempRootS & "\" & "INF~CYT10.tmp"
                                End If
                                
                            End If
                            
                            Close FileNumber
                            Exit Function
                        End If
                    Loop Until FileListStart > LOF(FileNumber)
                End If
            Close FileNumber
            CyTExtract = False
        Else
            CyTExtract = False
            Close FileNumber
            Exit Function
        End If
    End If
    Exit Function
    
FinaliseError:
    CyTExtract = False
End Function

Private Sub OpenPic_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    OpenPic.Picture = ImageListGray.ListImages.Item(2).Picture
    SetMenuIcons 1, True
End Sub

Private Sub OptionsPic_Click()
    Click10_Click
End Sub

Private Sub OptionsPic_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    OptionsPic.Picture = ImageListGray.ListImages.Item(11).Picture
    SetMenuIcons 6, True
End Sub

Private Sub SetMenuIcons(LeaveOut As Integer, AllIcons As Boolean)

    If LeaveOut <> 0 Then
        If NewPic.Enabled = True Then
            If AllIcons = True Then
                NewPic.Picture = ImageList.ListImages.Item(12).Picture
            End If
        ElseIf NewPic.Enabled = False Then
            NewPic.Picture = ImageListGray.ListImages.Item(12).Picture
        End If
    End If
    
    If LeaveOut <> 1 Then
        If OpenPic.Enabled = True Then
            If AllIcons = True Then
                OpenPic.Picture = ImageList.ListImages.Item(2).Picture
            End If
        ElseIf NewPic.Enabled = False Then
            OpenPic.Picture = ImageListGray.ListImages.Item(2).Picture
        End If
    End If
    
    If LeaveOut <> 2 Then
        If AddPic.Enabled = True Then
            If AllIcons = True Then
                AddPic.Picture = ImageList.ListImages.Item(4).Picture
            End If
        ElseIf AddPic.Enabled = False Then
            AddPic.Picture = ImageListGray.ListImages.Item(4).Picture
        End If
    End If
        
    If LeaveOut <> 3 Then
        If ExtractPic.Enabled = True Then
            If AllIcons = True Then
                ExtractPic.Picture = ImageList.ListImages.Item(3).Picture
            End If
        ElseIf ExtractPic.Enabled = False Then
            ExtractPic.Picture = ImageListGray.ListImages.Item(3).Picture
        End If
    End If
    
    If LeaveOut <> 4 Then
        If FileInfoPic.Enabled = True Then
            If AllIcons = True Then
                FileInfoPic.Picture = ImageList.ListImages.Item(6).Picture
            End If
        ElseIf FileInfoPic.Enabled = False Then
            FileInfoPic.Picture = ImageListGray.ListImages.Item(6).Picture
        End If
    End If
    
    If LeaveOut <> 5 Then
        If CompressPic.Enabled = True Then
            If AllIcons = True Then
                CompressPic.Picture = ImageList.ListImages.Item(9).Picture
            End If
        ElseIf CompressPic.Enabled = False Then
            CompressPic.Picture = ImageListGray.ListImages.Item(9).Picture
        End If
    End If
    
    If LeaveOut <> 6 Then
        If OptionsPic.Enabled = True Then
            If AllIcons = True Then
                OptionsPic.Picture = ImageList.ListImages.Item(11).Picture
            End If
        ElseIf OptionsPic.Enabled = False Then
            OptionsPic.Picture = ImageListGray.ListImages.Item(11).Picture
        End If
    End If
    
    If LeaveOut <> 7 Then
        If HelpTopics.Enabled = True Then
            If AllIcons = True Then
                HelpTopics.Picture = ImageList.ListImages.Item(10).Picture
            End If
        ElseIf HelpTopics.Enabled = False Then
            HelpTopics.Picture = ImageListGray.ListImages.Item(10).Picture
        End If
    End If
    
    If LeaveOut <> 8 Then
        If ExitPic.Enabled = True Then
            If AllIcons = True Then
                ExitPic.Picture = ImageList.ListImages.Item(7).Picture
            End If
        ElseIf ExitPic.Enabled = False Then
            ExitPic.Picture = ImageListGray.ListImages.Item(7).Picture
        End If
    End If
    
    'GetListData
    
End Sub
