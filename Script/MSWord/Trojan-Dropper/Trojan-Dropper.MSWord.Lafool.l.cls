olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Trojan-Dropper.MSWord.Lafool.l
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Trojan-Dropper.MSWord.Lafool.l - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_New()
MsgBox Now()

End Sub
-------------------------------------------------------------------------------
VBA MACRO 模块1.vba 
in file: ./Trojan-Dropper.MSWord.Lafool.l - OLE stream: 'Macros/VBA/模块1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_New()
MsgBox Now()

End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_New        |Runs when a new Word document is created     |
+----------+--------------------+---------------------------------------------+

