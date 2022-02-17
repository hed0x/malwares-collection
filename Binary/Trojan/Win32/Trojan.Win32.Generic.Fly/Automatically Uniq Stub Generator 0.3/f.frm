VERSION 5.00
Begin VB.Form f 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "f"
   ClientHeight    =   8400
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   7140
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   8400
   ScaleWidth      =   7140
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox aes3 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   3600
      TabIndex        =   121
      Top             =   4920
      Width           =   150
   End
   Begin VB.TextBox aes2 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   3360
      TabIndex        =   120
      Top             =   4920
      Width           =   150
   End
   Begin VB.TextBox aes1 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   3120
      TabIndex        =   119
      Top             =   4920
      Width           =   150
   End
   Begin VB.TextBox aes 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2880
      TabIndex        =   118
      Top             =   4920
      Width           =   150
   End
   Begin VB.TextBox Text5 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   3240
      TabIndex        =   117
      Top             =   6480
      Width           =   150
   End
   Begin VB.TextBox Text4 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   3000
      TabIndex        =   116
      Top             =   6480
      Width           =   150
   End
   Begin VB.TextBox Text3 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2760
      TabIndex        =   115
      Top             =   6480
      Width           =   150
   End
   Begin VB.TextBox Text2 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2520
      TabIndex        =   114
      Top             =   6480
      Width           =   150
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2280
      TabIndex        =   113
      Top             =   6480
      Width           =   150
   End
   Begin VB.TextBox r4 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1440
      TabIndex        =   112
      Top             =   4920
      Width           =   150
   End
   Begin VB.TextBox r3 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1080
      TabIndex        =   111
      Top             =   4920
      Width           =   150
   End
   Begin VB.TextBox r2 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   840
      TabIndex        =   110
      Top             =   4920
      Width           =   150
   End
   Begin VB.TextBox r1 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   600
      TabIndex        =   109
      Top             =   4920
      Width           =   150
   End
   Begin VB.TextBox r 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   360
      TabIndex        =   108
      Top             =   4920
      Width           =   150
   End
   Begin VB.TextBox junk12 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1920
      TabIndex        =   107
      Top             =   3960
      Width           =   150
   End
   Begin VB.TextBox junk16 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2880
      TabIndex        =   106
      Top             =   3960
      Width           =   150
   End
   Begin VB.TextBox junk15 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2640
      TabIndex        =   105
      Top             =   3960
      Width           =   150
   End
   Begin VB.TextBox junk14 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2400
      TabIndex        =   104
      Top             =   3960
      Width           =   150
   End
   Begin VB.TextBox junk13 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2160
      TabIndex        =   103
      Top             =   3960
      Width           =   150
   End
   Begin VB.TextBox junk18 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   3360
      TabIndex        =   102
      Top             =   3960
      Width           =   150
   End
   Begin VB.TextBox junk17 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   3120
      TabIndex        =   101
      Top             =   3960
      Width           =   150
   End
   Begin VB.TextBox junk11 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1560
      TabIndex        =   100
      Top             =   3960
      Width           =   150
   End
   Begin VB.TextBox junk9 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   120
      TabIndex        =   99
      Top             =   3720
      Width           =   150
   End
   Begin VB.TextBox junk10 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   360
      TabIndex        =   98
      Top             =   3720
      Width           =   150
   End
   Begin VB.TextBox junk8 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1080
      TabIndex        =   97
      Top             =   3600
      Width           =   150
   End
   Begin VB.TextBox junk7 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   840
      TabIndex        =   96
      Top             =   3600
      Width           =   150
   End
   Begin VB.TextBox junk6 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   4200
      TabIndex        =   95
      Top             =   1320
      Width           =   150
   End
   Begin VB.TextBox junk5 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   3960
      TabIndex        =   94
      Top             =   1320
      Width           =   150
   End
   Begin VB.TextBox j20 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   840
      TabIndex        =   93
      Top             =   3360
      Width           =   150
   End
   Begin VB.TextBox j21 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1080
      TabIndex        =   92
      Top             =   3360
      Width           =   150
   End
   Begin VB.TextBox a28 
      BackColor       =   &H80000000&
      Height          =   195
      Left            =   120
      TabIndex        =   91
      Top             =   2880
      Width           =   150
   End
   Begin VB.TextBox ifile1 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   3960
      TabIndex        =   90
      Top             =   3240
      Width           =   150
   End
   Begin VB.TextBox ifile 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   3720
      TabIndex        =   89
      Top             =   3240
      Width           =   150
   End
   Begin VB.TextBox lb 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2040
      TabIndex        =   88
      Top             =   3480
      Width           =   150
   End
   Begin VB.TextBox gp1 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2280
      TabIndex        =   87
      Top             =   3240
      Width           =   150
   End
   Begin VB.TextBox gp 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2040
      TabIndex        =   86
      Top             =   3240
      Width           =   150
   End
   Begin VB.TextBox rtl1 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2280
      TabIndex        =   85
      Top             =   3000
      Width           =   150
   End
   Begin VB.TextBox rtl2 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2520
      TabIndex        =   84
      Top             =   3000
      Width           =   150
   End
   Begin VB.TextBox rtl 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2040
      TabIndex        =   83
      Top             =   3000
      Width           =   150
   End
   Begin VB.TextBox j12 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   120
      TabIndex        =   82
      Top             =   3480
      Width           =   150
   End
   Begin VB.TextBox j13 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   360
      TabIndex        =   81
      Top             =   3480
      Width           =   150
   End
   Begin VB.TextBox j10 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   4080
      TabIndex        =   80
      Top             =   2280
      Width           =   150
   End
   Begin VB.TextBox j11 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   4320
      TabIndex        =   79
      Top             =   2280
      Width           =   150
   End
   Begin VB.TextBox j8 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   3600
      TabIndex        =   78
      Top             =   2280
      Width           =   150
   End
   Begin VB.TextBox j9 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   3840
      TabIndex        =   77
      Top             =   2280
      Width           =   150
   End
   Begin VB.TextBox j6 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   3120
      TabIndex        =   76
      Top             =   2280
      Width           =   150
   End
   Begin VB.TextBox j7 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   3360
      TabIndex        =   75
      Top             =   2280
      Width           =   150
   End
   Begin VB.TextBox j4 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2640
      TabIndex        =   74
      Top             =   2280
      Width           =   150
   End
   Begin VB.TextBox j5 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2880
      TabIndex        =   73
      Top             =   2280
      Width           =   150
   End
   Begin VB.TextBox j2 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   3120
      TabIndex        =   72
      Top             =   1920
      Width           =   150
   End
   Begin VB.TextBox j3 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   3360
      TabIndex        =   71
      Top             =   1920
      Width           =   150
   End
   Begin VB.TextBox j 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2640
      TabIndex        =   70
      Top             =   1920
      Width           =   150
   End
   Begin VB.TextBox j1 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2880
      TabIndex        =   69
      Top             =   1920
      Width           =   150
   End
   Begin VB.TextBox a29 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2400
      TabIndex        =   68
      Top             =   1320
      Width           =   150
   End
   Begin VB.TextBox a30 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2640
      TabIndex        =   67
      Top             =   1320
      Width           =   150
   End
   Begin VB.TextBox a31 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2880
      TabIndex        =   66
      Top             =   1320
      Width           =   150
   End
   Begin VB.TextBox f3 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   840
      TabIndex        =   65
      Top             =   2520
      Width           =   150
   End
   Begin VB.TextBox f2 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   600
      TabIndex        =   64
      Top             =   2520
      Width           =   150
   End
   Begin VB.TextBox f5 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1320
      TabIndex        =   63
      Top             =   2520
      Width           =   150
   End
   Begin VB.TextBox f4 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1080
      TabIndex        =   62
      Top             =   2520
      Width           =   150
   End
   Begin VB.TextBox f1 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   360
      TabIndex        =   61
      Top             =   2520
      Width           =   150
   End
   Begin VB.TextBox f 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   120
      TabIndex        =   60
      Top             =   2520
      Width           =   150
   End
   Begin VB.TextBox a89 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2640
      TabIndex        =   59
      Top             =   960
      Width           =   150
   End
   Begin VB.TextBox a88 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2400
      TabIndex        =   58
      Top             =   960
      Width           =   150
   End
   Begin VB.TextBox a91 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   3120
      TabIndex        =   57
      Top             =   960
      Width           =   150
   End
   Begin VB.TextBox a90 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2880
      TabIndex        =   56
      Top             =   960
      Width           =   150
   End
   Begin VB.TextBox a85 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2640
      TabIndex        =   55
      Top             =   720
      Width           =   150
   End
   Begin VB.TextBox a84 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2400
      TabIndex        =   54
      Top             =   720
      Width           =   150
   End
   Begin VB.TextBox a87 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   3120
      TabIndex        =   53
      Top             =   720
      Width           =   150
   End
   Begin VB.TextBox a86 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2880
      TabIndex        =   52
      Top             =   720
      Width           =   150
   End
   Begin VB.TextBox a81 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1560
      TabIndex        =   51
      Top             =   1800
      Width           =   150
   End
   Begin VB.TextBox a80 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1320
      TabIndex        =   50
      Top             =   1800
      Width           =   150
   End
   Begin VB.TextBox a83 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2040
      TabIndex        =   49
      Top             =   1800
      Width           =   150
   End
   Begin VB.TextBox a82 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1800
      TabIndex        =   48
      Top             =   1800
      Width           =   150
   End
   Begin VB.TextBox a77 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1560
      TabIndex        =   47
      Top             =   1440
      Width           =   150
   End
   Begin VB.TextBox a76 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1320
      TabIndex        =   46
      Top             =   1440
      Width           =   150
   End
   Begin VB.TextBox a79 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2040
      TabIndex        =   45
      Top             =   1440
      Width           =   150
   End
   Begin VB.TextBox a78 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1800
      TabIndex        =   44
      Top             =   1440
      Width           =   150
   End
   Begin VB.TextBox a74 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1800
      TabIndex        =   43
      Top             =   1080
      Width           =   150
   End
   Begin VB.TextBox a75 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2040
      TabIndex        =   42
      Top             =   1080
      Width           =   150
   End
   Begin VB.TextBox a72 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1320
      TabIndex        =   41
      Top             =   1080
      Width           =   150
   End
   Begin VB.TextBox a73 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1560
      TabIndex        =   40
      Top             =   1080
      Width           =   150
   End
   Begin VB.TextBox a70 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1800
      TabIndex        =   39
      Top             =   720
      Width           =   150
   End
   Begin VB.TextBox a71 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2040
      TabIndex        =   38
      Top             =   720
      Width           =   150
   End
   Begin VB.TextBox a68 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1320
      TabIndex        =   37
      Top             =   720
      Width           =   150
   End
   Begin VB.TextBox a69 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1560
      TabIndex        =   36
      Top             =   720
      Width           =   150
   End
   Begin VB.TextBox a66 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   600
      TabIndex        =   35
      Top             =   1680
      Width           =   150
   End
   Begin VB.TextBox a67 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   840
      TabIndex        =   34
      Top             =   1680
      Width           =   150
   End
   Begin VB.TextBox a64 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   120
      TabIndex        =   33
      Top             =   1680
      Width           =   150
   End
   Begin VB.TextBox a65 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   360
      TabIndex        =   32
      Top             =   1680
      Width           =   150
   End
   Begin VB.TextBox a62 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   600
      TabIndex        =   31
      Top             =   1200
      Width           =   150
   End
   Begin VB.TextBox a63 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   840
      TabIndex        =   30
      Top             =   1200
      Width           =   150
   End
   Begin VB.TextBox a60 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   120
      TabIndex        =   29
      Top             =   1200
      Width           =   150
   End
   Begin VB.TextBox a61 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   360
      TabIndex        =   28
      Top             =   1200
      Width           =   150
   End
   Begin VB.TextBox a56 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   360
      TabIndex        =   27
      Top             =   360
      Width           =   150
   End
   Begin VB.TextBox a57 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   600
      TabIndex        =   26
      Top             =   360
      Width           =   150
   End
   Begin VB.TextBox a58 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   840
      TabIndex        =   25
      Top             =   360
      Width           =   150
   End
   Begin VB.TextBox a59 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1080
      TabIndex        =   24
      Top             =   360
      Width           =   150
   End
   Begin VB.TextBox a55 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   120
      TabIndex        =   23
      Top             =   360
      Width           =   150
   End
   Begin VB.TextBox a54 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   4440
      TabIndex        =   22
      Top             =   120
      Width           =   150
   End
   Begin VB.TextBox a53 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   4200
      TabIndex        =   21
      Top             =   120
      Width           =   150
   End
   Begin VB.TextBox a52 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   3960
      TabIndex        =   20
      Top             =   120
      Width           =   150
   End
   Begin VB.TextBox a50 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   3480
      TabIndex        =   19
      Top             =   120
      Width           =   150
   End
   Begin VB.TextBox a51 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   3720
      TabIndex        =   18
      Top             =   120
      Width           =   150
   End
   Begin VB.TextBox a48 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   3000
      TabIndex        =   17
      Top             =   120
      Width           =   150
   End
   Begin VB.TextBox a49 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   3240
      TabIndex        =   16
      Top             =   120
      Width           =   150
   End
   Begin VB.TextBox a47 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2760
      TabIndex        =   15
      Top             =   120
      Width           =   150
   End
   Begin VB.TextBox a46 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2520
      TabIndex        =   14
      Top             =   120
      Width           =   150
   End
   Begin VB.TextBox a44 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2040
      TabIndex        =   13
      Top             =   120
      Width           =   150
   End
   Begin VB.TextBox a45 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2280
      TabIndex        =   12
      Top             =   120
      Width           =   150
   End
   Begin VB.TextBox a42 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1560
      TabIndex        =   11
      Top             =   120
      Width           =   150
   End
   Begin VB.TextBox a43 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1800
      TabIndex        =   10
      Top             =   120
      Width           =   150
   End
   Begin VB.TextBox a40 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1080
      TabIndex        =   9
      Top             =   120
      Width           =   150
   End
   Begin VB.TextBox a41 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1320
      TabIndex        =   8
      Top             =   120
      Width           =   150
   End
   Begin VB.TextBox a38 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   600
      TabIndex        =   7
      Top             =   720
      Width           =   150
   End
   Begin VB.TextBox a39 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   840
      TabIndex        =   6
      Top             =   720
      Width           =   150
   End
   Begin VB.TextBox a36 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   120
      TabIndex        =   5
      Top             =   720
      Width           =   150
   End
   Begin VB.TextBox a37 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   360
      TabIndex        =   4
      Top             =   720
      Width           =   150
   End
   Begin VB.TextBox a35 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   840
      TabIndex        =   3
      Top             =   120
      Width           =   150
   End
   Begin VB.TextBox a34 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   600
      TabIndex        =   2
      Top             =   120
      Width           =   150
   End
   Begin VB.TextBox a32 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Width           =   150
   End
   Begin VB.TextBox a33 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   360
      TabIndex        =   0
      Top             =   120
      Width           =   150
   End
End
Attribute VB_Name = "f"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
MsgBox rn2
End Sub
