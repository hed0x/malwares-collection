olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: VirTool.MSWord.TBJG
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: VirTool.MSWord.TBJG - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Module1.bas 
in file: VirTool.MSWord.TBJG - OLE stream: 'Macros/VBA/Module1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Function Junkstr()
'THE BIG JUNK GENERATOR
'BY VLAM
A = Int(Rnd * 5) + 1
ll = Int((Rnd * 50) + 10)
l = Int(Rnd * 2)
Select Case A
Case 1
    Randomize Timer
    s = Int(Rnd * 8) + 1
    Select Case s
    Case 1: k = " XOR "
    Case 2: k = " AND "
    Case 3: k = " EQV "
    Case 4: k = " - "
    Case 5: k = " + "
    Case 6: k = " OR "
    Case 7: k = " & "
    Case 8: k = " IMP "
    End Select
    junk = k
    kk = Int(Rnd * 3) + 1
    Select Case kk
    Case 1: Junkstr = GETRNDWORD(ll, l) & " = " & GETRNDWORD(ll, l) & junk & GETRNDWORD(ll, l)
    Case 2: Junkstr = GETRNDWORD(ll, l) & " = " & GETRNDWORD(ll, l) & junk & GETRNDWORD(ll, l) & junk & GETRNDWORD(ll, l)
    Case 3: Junkstr = GETRNDWORD(ll, l) & " = " & GETRNDWORD(ll, l) & junk & GETRNDWORD(ll, l) & junk & GETRNDWORD(ll, l) & junk & GETRNDWORD(ll, l)
    End Select
Case 2:
    Randomize Timer
    s = Int(Rnd * 20) + 1
    Select Case s
    Case 1: k = "OPTIONS"
    Case 2: k = "TASKS"
    Case 3: k = "APPLICATION"
    Case 4: k = "ACTIVEDOCUMENT"
    Case 5: k = "NORMALTEMPLATE"
    Case 6: k = "THISDOCUMENT"
    Case 7: k = "ACTIVEWINDOW"
    Case 8: k = "SYSTEM"
    Case 9: k = "WINDOWS"
    Case 10: k = "ASSISTANT"
    Case 11: k = "COMMANDBARS"
    Case 12: k = "COMMENTS"
    Case 13: k = "FRAMES"
    Case 14: k = "INDEXES"
    Case 15: k = "KEYBINDINGS"
    Case 16: k = "OPTIONS.APPLICATION"
    Case 17: k = "LANGUAGES"
    Case 18: k = "SYSTEM"
    Case 19: k = "LISTS"
    Case 20: k = "LISTTEMPLATES"
    End Select
    Junkstr = "SET " & GETRNDWORD(ll, l) & " = " & k
Case 3:
    JJ = Int(Rnd * 2) + 1
    Select Case JJ
    Case 1: k = "'"
    Case 2: k = "rem "
    End Select
    Junkstr = k & getshit(Int(Rnd * 200) + 50)
Case 4:
    JJ = (Int(Rnd * 2) + 1)
    Select Case JJ
    Case 1
        Junkstr = GETRNDWORD(ll, l) & ":"
    Case 2
        JJ = (Int(Rnd * 11) + 1)
        Select Case JJ
        Case 1: ASWHAT = " AS STRING"
        Case 2: ASWHAT = " AS BYTE"
        Case 3: ASWHAT = " AS LONG"
        Case 4: ASWHAT = " AS INTEGER"
        Case 5: ASWHAT = " AS CURRENCY"
        Case 6: ASWHAT = " AS BOOLEAN"
        Case 7: ASWHAT = " AS SINGLE"
        Case 8: ASWHAT = " AS DOUBLE"
        Case 9: ASWHAT = " AS DATE"
        Case 10: ASWHAT = " AS MSORGBTYPE"
        Case 11: ASWHAT = " AS VARIANT"
        End Select
        Junkstr = "DIM " & GETRNDWORD(ll, l) & ASWHAT
    End Select
Case 5:
    JJ = Int(Rnd * 11) + 1
    Select Case JJ
    Case 1: Junkstr = GETRNDWORD(ll, l) & " = " & genchr(ll)
    Case 2: Junkstr = GETRNDWORD(ll, l) & " = " & Chr(34) & getshit(ll) & Chr(34)
    Case 3: Junkstr = GETRNDWORD(ll, l) & " = " & GETRNDWORD(ll, l)
    Case 4: Junkstr = GETRNDWORD(ll, l) & " = " & Rnd * 99999.99
    Case 5: Junkstr = GETRNDWORD(ll, l) & " = " & Rnd * 99999.99 & " XOR " & Rnd * 99999.99
    Case 6: Junkstr = GETRNDWORD(ll, l) & " = " & Rnd * 99999.99 & " - " & Rnd * 99999.99
    Case 7: Junkstr = GETRNDWORD(ll, l) & " = " & Rnd * 99999.99 & " AND  " & Rnd * 99999.99
    Case 8: Junkstr = GETRNDWORD(ll, l) & " = " & Rnd * 99999.99 & " OR " & Rnd * 99999.99
    Case 9: Junkstr = GETRNDWORD(ll, l) & " = " & Rnd * 99999.99 & " MOD " & Rnd * 99999.99
    Case 10: Junkstr = GETRNDWORD(ll, l) & " = " & Rnd * 99999.99 & " + " & Rnd * 99999.99
    Case 11: Junkstr = GETRNDWORD(ll, l) & " = " & Rnd * 99999.99 & " XOR " & Rnd * 99999.99
    End Select
End Select
End Function
Private Function GETRNDWORD(LENGTHOFWORD, MustIIncludeNumbers)
Select Case MustIIncludeNumbers
Case 0
    For i = 1 To LENGTHOFWORD
    JJ = (Int(Rnd * 2) + 1)
    Select Case JJ
    Case 1: P = P & Chr((Rnd * 22) + 65)
    Case 2: P = P & Chr((Rnd * 22) + 97)
    End Select
    Next
Case 1
    For i = 1 To (LENGTHOFWORD / 2)
    JJ = (Int(Rnd * 2) + 1)
    Select Case JJ
    Case 1: P = P & Chr((Rnd * 22) + 65) & Int(Rnd * 10) + 1
    Case 2: P = P & Chr((Rnd * 22) + 97) & Int(Rnd * 10) + 1
    End Select
    Next
End Select
GETRNDWORD = P
End Function
Private Function getshit(length)
For i = 1 To length
g = g & Chr(Int(Rnd * 210) + 35)
Next
getshit = g
End Function

Private Function genchr(length)
For i = 1 To length
g = "Chr(" & Int(Rnd * 255) & ")"
k = " & "
l = l & g & k
Next
genchr = Left(l, (Len(l) - 3))
End Function

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|WINDOWS             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|XOR                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|SYSTEM              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

